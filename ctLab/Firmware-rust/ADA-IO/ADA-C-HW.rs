//! Best-effort Rust port of `ADA-C-HW.pas`.
//!
//! The original Pascal source is a hardware-near helper unit for the ADA-IO
//! firmware. This Rust version keeps the procedure structure, signal names, and
//! data layout readable while abstracting direct register access behind a small
//! trait.

use core::marker::PhantomData;

use crate::avrd_support::{Atmega32, AvrdPortIo, Mcu, RegisterPort};

pub type Byte = u8;
pub type Word = u16;
pub type Integer = i16;
pub type LongInt = i32;

pub const MUX_CHANNEL_COUNT: usize = 8;
pub const ADC16_SAMPLES_PER_TICK: usize = 4;
pub const PORTC_MUX_BASE: Byte = 0b1100_0011;

#[derive(Clone, Copy, Debug, Eq, PartialEq)]
pub enum Signal {
    SDataOut,
    SClk,
    StrDac,
    StrAd16,
    StrSr,
    StrDaMux,
    SDataIn1,
}

pub trait AdacHardware {
    fn set_signal(&mut self, signal: Signal, high: bool);
    fn read_signal(&self, signal: Signal) -> bool;
    fn set_port_c(&mut self, value: Byte);

    fn wait_cycles(&mut self, cycles: Byte) {
        for _ in 0..cycles {
            core::hint::spin_loop();
        }
    }

    fn wait_for_adc10_complete(&mut self);
}

pub struct AdacAvrd<M: Mcu> {
    io: AvrdPortIo<M>,
    _marker: PhantomData<M>,
}

pub type AdacAtmega32 = AdacAvrd<Atmega32>;

impl<M: Mcu> Default for AdacAvrd<M> {
    fn default() -> Self {
        Self {
            io: AvrdPortIo::default(),
            _marker: PhantomData,
        }
    }
}

impl<M: Mcu> AdacAvrd<M> {
    pub fn init_ports(&mut self) {
        self.io.init_port(RegisterPort::B, 0b0101_1011, 0b1011_1111);
        self.io.init_port(RegisterPort::C, 0b1111_1100, 0b0000_0011);
        self.io.init_port(RegisterPort::D, 0b0000_1100, 0b1111_1100);
    }

    fn map_signal(signal: Signal) -> (RegisterPort, u8) {
        match signal {
            Signal::SDataOut => (RegisterPort::B, 1),
            Signal::SClk => (RegisterPort::B, 0),
            Signal::StrDac => (RegisterPort::B, 3),
            Signal::StrAd16 => (RegisterPort::B, 4),
            Signal::StrSr => (RegisterPort::B, 6),
            Signal::StrDaMux => (RegisterPort::C, 5),
            Signal::SDataIn1 => (RegisterPort::B, 5),
        }
    }
}

impl<M: Mcu> AdacHardware for AdacAvrd<M> {
    fn set_signal(&mut self, signal: Signal, high: bool) {
        let (port, bit) = Self::map_signal(signal);
        self.io.write_bit(port, bit, high);
    }

    fn read_signal(&self, signal: Signal) -> bool {
        let (port, bit) = Self::map_signal(signal);
        self.io.read_bit(port, bit)
    }

    fn set_port_c(&mut self, value: Byte) {
        self.io.write_port(RegisterPort::C, value);
    }

    fn wait_cycles(&mut self, cycles: Byte) {
        self.io.spin_delay_cycles(cycles.into());
    }

    fn wait_for_adc10_complete(&mut self) {
        self.io.wait_for_adc();
    }
}

#[derive(Clone, Debug, Default)]
pub struct AdacState {
    pub dac_temp: Word,
    pub ad_raw: Word,
    pub port_sr0: Byte,
    pub port_sr1: Byte,
    pub port_sr2: Byte,
    pub port_sr3: Byte,
    pub mux_ch: usize,
    pub adc16_present: bool,
    pub dac16_present: bool,
    pub dac714_present: bool,
    pub dac12_present: bool,
    pub integrate_ad16: bool,
    pub ad16_long: LongInt,
    pub adc_raw_array: [Integer; MUX_CHANNEL_COUNT],
    pub dac_raw_array: [Word; MUX_CHANNEL_COUNT],
}

fn set_low(hw: &mut impl AdacHardware, signal: Signal) {
    hw.set_signal(signal, false);
}

fn set_high(hw: &mut impl AdacHardware, signal: Signal) {
    hw.set_signal(signal, true);
}

fn msb_is_set(value: Byte) -> bool {
    value & 0x80 != 0
}

fn shift_in_byte_1864(hw: &mut impl AdacHardware) -> Byte {
    let mut acca: Byte = 0;

    for _ in 0..8 {
        set_high(hw, Signal::SClk);
        let carry = hw.read_signal(Signal::SDataIn1);
        set_low(hw, Signal::SClk);
        acca = (acca << 1) | Byte::from(carry);
    }

    acca
}

fn shift_out_sr_byte(hw: &mut impl AdacHardware, mut acca: Byte) {
    for _ in 0..8 {
        if msb_is_set(acca) {
            set_high(hw, Signal::SDataOut);
        }

        set_high(hw, Signal::SClk);
        acca <<= 1;
        set_low(hw, Signal::SDataOut);
        set_low(hw, Signal::SClk);
    }
}

// Sendet DACtemp an LTC1257.
pub fn shift_out1257(hw: &mut impl AdacHardware, state: &AdacState) {
    set_low(hw, Signal::SDataOut);
    set_low(hw, Signal::SClk);
    set_high(hw, Signal::StrDac);

    let mut acca: Byte = ((state.dac_temp >> 8) as Byte) << 4; // MSB linksbuendig

    for _ in 0..4 {
        if msb_is_set(acca) {
            set_high(hw, Signal::SDataOut);
        }

        set_high(hw, Signal::SClk);
        acca <<= 1;
        hw.wait_cycles(1);
        set_low(hw, Signal::SDataOut);
        set_low(hw, Signal::SClk);
    }

    let mut acca: Byte = state.dac_temp as Byte; // LSB Level zuletzt

    for _ in 0..7 {
        if msb_is_set(acca) {
            set_high(hw, Signal::SDataOut);
        }

        set_high(hw, Signal::SClk);
        acca <<= 1;
        hw.wait_cycles(1);
        set_low(hw, Signal::SDataOut);
        set_low(hw, Signal::SClk);
    }

    // LSB mit Load-Impuls.
    acca <<= 1;
    if msb_is_set(acca) {
        set_high(hw, Signal::SDataOut);
    }

    set_high(hw, Signal::SClk);
    set_low(hw, Signal::StrDac);
    hw.wait_cycles(1);
    set_low(hw, Signal::SDataOut);
    set_low(hw, Signal::SClk);
    set_high(hw, Signal::StrDac);
}

// Sendet DACtemp an LTC1655, etwas andere Sequenz als 1257.
pub fn shift_out1655(hw: &mut impl AdacHardware, state: &AdacState) {
    set_low(hw, Signal::SClk);
    set_low(hw, Signal::SDataOut);
    set_low(hw, Signal::StrDac);

    let mut acca: Byte = (state.dac_temp >> 8) as Byte; // MSB linksbuendig

    for _ in 0..8 {
        if msb_is_set(acca) {
            set_high(hw, Signal::SDataOut);
        }

        set_high(hw, Signal::SClk);
        acca <<= 1;
        hw.wait_cycles(1);
        set_low(hw, Signal::SDataOut);
        set_low(hw, Signal::SClk);
    }

    let mut acca: Byte = state.dac_temp as Byte; // LSB Level zuletzt

    for _ in 0..8 {
        if msb_is_set(acca) {
            set_high(hw, Signal::SDataOut);
        }

        set_high(hw, Signal::SClk);
        acca <<= 1;
        set_low(hw, Signal::SDataOut);
        set_low(hw, Signal::SClk);
    }

    set_high(hw, Signal::StrDac);
}

// Sendet DACtemp an DAC714.
pub fn shift_out714(hw: &mut impl AdacHardware, state: &AdacState) {
    set_low(hw, Signal::SDataOut);
    set_high(hw, Signal::SClk);
    set_high(hw, Signal::StrDac);

    let mut acca: Byte = (state.dac_temp >> 8) as Byte; // MSB linksbuendig

    for _ in 0..8 {
        set_low(hw, Signal::SClk);
        if msb_is_set(acca) {
            set_high(hw, Signal::SDataOut);
        }

        acca <<= 1;
        hw.wait_cycles(1);
        set_high(hw, Signal::SClk);
        set_low(hw, Signal::SDataOut);
    }

    let mut acca: Byte = state.dac_temp as Byte; // LSB Level zuletzt

    for _ in 0..8 {
        set_low(hw, Signal::SClk);
        if msb_is_set(acca) {
            set_high(hw, Signal::SDataOut);
        }

        acca <<= 1;
        hw.wait_cycles(1);
        set_high(hw, Signal::SClk);
        set_low(hw, Signal::SDataOut);
    }

    set_low(hw, Signal::SClk);
    hw.wait_cycles(1);
    set_low(hw, Signal::StrDac);
    hw.wait_cycles(1);
    set_high(hw, Signal::SClk);
    hw.wait_cycles(1);
    set_high(hw, Signal::StrDac);
}

// Holt ADraw aus LTC1864, Interrupt waehrend dieser Zeit gesperrt.
pub fn shift_in1864(hw: &mut impl AdacHardware, state: &mut AdacState) {
    set_low(hw, Signal::StrAd16);
    set_low(hw, Signal::SClk);
    hw.wait_cycles(3);

    let hi = shift_in_byte_1864(hw);
    let lo = shift_in_byte_1864(hw);

    state.ad_raw = Word::from_be_bytes([hi, lo]);

    set_high(hw, Signal::SClk);
    hw.wait_cycles(1);
    set_high(hw, Signal::StrAd16);
}

// Sende PortArray-Bytes an 4094-SR.
pub fn shift_out_sr(hw: &mut impl AdacHardware, state: &AdacState) {
    set_low(hw, Signal::SClk);
    set_low(hw, Signal::SDataOut);

    shift_out_sr_byte(hw, state.port_sr3);
    shift_out_sr_byte(hw, state.port_sr2);
    shift_out_sr_byte(hw, state.port_sr1); // LSB Level zuletzt
    shift_out_sr_byte(hw, state.port_sr0); // LSB Level zuletzt

    set_high(hw, Signal::StrSr);
    hw.wait_cycles(2);
    set_low(hw, Signal::StrSr);
    set_high(hw, Signal::SClk);
}

/*
pub fn get_adc10(hw: &mut impl AdacHardware, my_channel: Byte, ext_ref: bool) -> Word {
    // Zu-Fuss-Implementation der getadc()-Funktion.
    //
    // The original Pascal implementation is commented out as well. Keeping it
    // here as a sketch avoids inventing register details that are not present
    // in this source file alone.
    let _ = (hw, my_channel, ext_ref);
    todo!("ADC10 helper was commented out in the original Pascal source");
}
*/

// Interrupt-Routine, alle 1 ms, dauert etwa 41 us bei DA16.
pub fn on_sys_tick(hw: &mut impl AdacHardware, state: &mut AdacState) {
    // A/D-Wandlung letzter Kanal, 1 ms Settling Time!
    set_high(hw, Signal::SClk);

    if state.adc16_present {
        set_low(hw, Signal::StrAd16);
        state.ad16_long = 0;
        set_high(hw, Signal::StrAd16);

        // Erste Wandlung verwerfen, nicht auslesen.
        hw.wait_cycles(15);

        for _ in 0..ADC16_SAMPLES_PER_TICK {
            shift_in1864(hw, state);
            state.ad16_long += LongInt::from(state.ad_raw) - 0x8000;
        }
    }

    let previous_mux_ch = state.mux_ch;

    // Multiplexer abschalten, Multiplexer-Kanal hochzaehlen.
    set_low(hw, Signal::StrDaMux);
    state.mux_ch = (state.mux_ch + 1) % MUX_CHANNEL_COUNT;

    // Multiplexer-Kanal einstellen.
    hw.set_port_c(((state.mux_ch as Byte) << 2) | PORTC_MUX_BASE);

    state.dac_temp = state.dac_raw_array[state.mux_ch];
    if state.dac16_present {
        // Level-Bytes an LTC1655.
        shift_out1655(hw, state);
    }
    if state.dac714_present {
        // Level-Bytes an DAC714.
        shift_out714(hw, state);
    }
    if state.dac12_present {
        // Level-Bytes an LTC1257.
        shift_out1257(hw, state);
    }

    // Settle Time.
    hw.wait_cycles(4);

    // wg. DAC-Settle-Time erst hier.
    state.ad16_long >>= 2;
    if state.integrate_ad16 {
        state.ad16_long += LongInt::from(state.adc_raw_array[previous_mux_ch]);
        state.adc_raw_array[previous_mux_ch] = (state.ad16_long >> 1) as Integer; // integrieren
    } else {
        state.adc_raw_array[previous_mux_ch] = state.ad16_long as Integer; // direkt
    }

    set_high(hw, Signal::StrDaMux);

    // Auf AD-Wandlung AD10 warten, falls Systick "ueberfahren" wurde.
    hw.wait_for_adc10_complete();
}
