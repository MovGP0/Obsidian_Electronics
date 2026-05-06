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
pub const ADC16_DISCARD_CONVERSION_DELAY_CYCLES: u16 = avr_dec_brne_delay_cycles(15);
pub const DAC_SETTLE_DELAY_CYCLES: u16 = avr_dec_brne_delay_cycles(4);
pub const ADC10_CHANNEL_MASK: Byte = 0x07;
pub const ADC10_INTERNAL_REFERENCE_MASK: Byte = 0xC0;
pub const ADC10_SETTLE_DELAY_CYCLES: u16 = avr_dec_brne_delay_cycles(10);
pub const ADCSRA_START_DIV128: Byte = 0xC7;
pub const ADCSRA_BUSY_BIT: Byte = 1 << 6;

#[cfg(target_arch = "avr")]
const AVR_SREG_ADDRESS: *mut Byte = 0x5f as *mut Byte;
#[cfg(target_arch = "avr")]
const AVR_SREG_INTERRUPT_ENABLE_MASK: Byte = 0x80;

const fn avr_dec_brne_delay_cycles(iterations: u16) -> u16 {
    // ldi + repeated dec/brne costs exactly 3 * n cycles for n > 0.
    iterations * 3
}

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
    fn set_admux(&mut self, value: Byte);
    fn write_adcsra(&mut self, value: Byte);
    fn read_adcsra(&self) -> Byte;
    fn read_adcl(&self) -> Byte;
    fn read_adch(&self) -> Byte;
    fn begin_interrupt_exclusion(&mut self) -> Byte {
        0
    }

    fn end_interrupt_exclusion(&mut self, _saved_status: Byte) {}

    fn nop(&mut self) {
        self.wait_cycles(1);
    }

    fn wait_cycles(&mut self, cycles: u16) {
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

    fn set_admux(&mut self, value: Byte) {
        unsafe {
            crate::avrd_support::write_u8(M::ADMUX, value);
        }
    }

    fn write_adcsra(&mut self, value: Byte) {
        unsafe {
            crate::avrd_support::write_u8(M::ADCSRA, value);
        }
    }

    fn read_adcsra(&self) -> Byte {
        unsafe { crate::avrd_support::read_u8(M::ADCSRA) }
    }

    fn read_adcl(&self) -> Byte {
        unsafe { crate::avrd_support::read_u8(M::ADCL) }
    }

    fn read_adch(&self) -> Byte {
        unsafe { crate::avrd_support::read_u8(M::ADCH) }
    }

    fn begin_interrupt_exclusion(&mut self) -> Byte {
        #[cfg(target_arch = "avr")]
        {
            let saved_status = unsafe { core::ptr::read_volatile(AVR_SREG_ADDRESS) };
            unsafe {
                core::ptr::write_volatile(
                    AVR_SREG_ADDRESS,
                    saved_status & !AVR_SREG_INTERRUPT_ENABLE_MASK,
                );
            }
            saved_status
        }

        #[cfg(not(target_arch = "avr"))]
        {
            0
        }
    }

    fn end_interrupt_exclusion(&mut self, saved_status: Byte) {
        #[cfg(target_arch = "avr")]
        unsafe {
            core::ptr::write_volatile(AVR_SREG_ADDRESS, saved_status);
        }

        #[cfg(not(target_arch = "avr"))]
        {
            let _ = saved_status;
        }
    }

    fn nop(&mut self) {
        self.io.spin_delay_cycles(1);
    }

    fn wait_cycles(&mut self, cycles: u16) {
        self.io.spin_delay_cycles(cycles);
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

fn nop(hw: &mut impl AdacHardware) {
    hw.nop();
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

    // The LTC1257 expects the high nibble of the 12-bit value first, left-aligned
    // onto the serial data line exactly like the Pascal bit-banging routine.
    let mut acca: Byte = ((state.dac_temp >> 8) as Byte) << 4; // MSB linksbuendig

    for _ in 0..4 {
        if msb_is_set(acca) {
            set_high(hw, Signal::SDataOut);
        }

        set_high(hw, Signal::SClk);
        acca <<= 1;
        nop(hw);
        set_low(hw, Signal::SDataOut);
        set_low(hw, Signal::SClk);
    }

    // The low byte follows afterwards; the final data bit is clocked together
    // with the DAC load strobe instead of as a plain shift cycle.
    let mut acca: Byte = state.dac_temp as Byte; // LSB Level zuletzt

    for _ in 0..7 {
        if msb_is_set(acca) {
            set_high(hw, Signal::SDataOut);
        }

        set_high(hw, Signal::SClk);
        acca <<= 1;
        nop(hw);
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
    nop(hw);
    set_low(hw, Signal::SDataOut);
    set_low(hw, Signal::SClk);
    set_high(hw, Signal::StrDac);
}

// Sendet DACtemp an LTC1655, etwas andere Sequenz als 1257.
pub fn shift_out1655(hw: &mut impl AdacHardware, state: &AdacState) {
    set_low(hw, Signal::SClk);
    set_low(hw, Signal::SDataOut);
    set_low(hw, Signal::StrDac);

    // Unlike the LTC1257 path, the LTC1655 shifts a full high byte before the
    // low byte and only latches once all 16 bits have been transferred.
    let mut acca: Byte = (state.dac_temp >> 8) as Byte; // MSB linksbuendig

    for _ in 0..8 {
        if msb_is_set(acca) {
            set_high(hw, Signal::SDataOut);
        }

        set_high(hw, Signal::SClk);
        acca <<= 1;
        nop(hw);
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

    // The DAC714 uses the opposite clock phase: drive data while SCLK is low,
    // then let the rising edge shift the current bit into the converter.
    let mut acca: Byte = (state.dac_temp >> 8) as Byte; // MSB linksbuendig

    for _ in 0..8 {
        set_low(hw, Signal::SClk);
        if msb_is_set(acca) {
            set_high(hw, Signal::SDataOut);
        }

        acca <<= 1;
        nop(hw);
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
        nop(hw);
        set_high(hw, Signal::SClk);
        set_low(hw, Signal::SDataOut);
    }

    set_low(hw, Signal::SClk);
    nop(hw);
    set_low(hw, Signal::StrDac);
    nop(hw);
    set_high(hw, Signal::SClk);
    nop(hw);
    set_high(hw, Signal::StrDac);
}

// Holt ADraw aus LTC1864, Interrupt waehrend dieser Zeit gesperrt.
pub fn shift_in1864(hw: &mut impl AdacHardware, state: &mut AdacState) {
    let saved_status = hw.begin_interrupt_exclusion();

    // Assert chip-select and keep the conversion transaction contiguous.
    set_low(hw, Signal::StrAd16);
    set_low(hw, Signal::SClk);
    nop(hw);
    nop(hw);
    nop(hw);

    let hi = shift_in_byte_1864(hw);
    let lo = shift_in_byte_1864(hw);

    state.ad_raw = Word::from_be_bytes([hi, lo]);

    set_high(hw, Signal::SClk);
    nop(hw);
    set_high(hw, Signal::StrAd16);
    hw.end_interrupt_exclusion(saved_status);
}

// Sende PortArray-Bytes an 4094-SR.
pub fn shift_out_sr(hw: &mut impl AdacHardware, state: &AdacState) {
    set_low(hw, Signal::SClk);
    set_low(hw, Signal::SDataOut);

    // The four cascaded 4094 registers are filled from SR3 down to SR0 so the
    // logical port image emerges at the right physical outputs after strobing.
    shift_out_sr_byte(hw, state.port_sr3);
    shift_out_sr_byte(hw, state.port_sr2);
    shift_out_sr_byte(hw, state.port_sr1); // LSB Level zuletzt
    shift_out_sr_byte(hw, state.port_sr0); // LSB Level zuletzt

    set_high(hw, Signal::StrSr);
    nop(hw);
    nop(hw);
    set_low(hw, Signal::StrSr);
    set_high(hw, Signal::SClk);
}

pub fn get_adc10(hw: &mut impl AdacHardware, my_channel: Byte, ext_ref: bool) -> Word {
    // Zu-Fuss-Implementation der getadc()-Funktion.
    let mux = my_channel.wrapping_sub(1) & ADC10_CHANNEL_MASK;
    let reference = if ext_ref {
        ADC10_INTERNAL_REFERENCE_MASK
    } else {
        0
    };

    hw.set_admux(reference | mux);
    hw.wait_cycles(ADC10_SETTLE_DELAY_CYCLES);
    hw.write_adcsra(ADCSRA_START_DIV128);

    while (hw.read_adcsra() & ADCSRA_BUSY_BIT) != 0 {}

    Word::from(hw.read_adcl()) | (Word::from(hw.read_adch()) << 8)
}

// Interrupt-Routine, alle 1 ms, dauert etwa 41 us bei DA16.
pub fn on_sys_tick(hw: &mut impl AdacHardware, state: &mut AdacState) {
    // A/D-Wandlung letzter Kanal, 1 ms Settling Time!
    set_high(hw, Signal::SClk);

    if state.adc16_present {
        set_low(hw, Signal::StrAd16);
        state.ad16_long = 0;
        set_high(hw, Signal::StrAd16);

        // The first post-switch conversion is intentionally discarded so the
        // external ADC sees the full settling interval before we accumulate data.
        hw.wait_cycles(ADC16_DISCARD_CONVERSION_DELAY_CYCLES);

        for _ in 0..ADC16_SAMPLES_PER_TICK {
            shift_in1864(hw, state);
            state.ad16_long += LongInt::from(state.ad_raw) - 0x8000;
        }
    }

    let previous_mux_ch = state.mux_ch;

    // Finish sampling the previous mux input, then blank the analog path before
    // advancing the channel selection lines to the next source.
    set_low(hw, Signal::StrDaMux);
    state.mux_ch = (state.mux_ch + 1) % MUX_CHANNEL_COUNT;

    // Port C carries the mux address in bits 4..2 while preserving the fixed
    // control bits from the original firmware mask.
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

    // Give the new DAC code time to settle before storing the measurement that
    // belongs to the previously active channel.
    hw.wait_cycles(DAC_SETTLE_DELAY_CYCLES);

    // Only average and store after the DAC settle delay; the Pascal code makes
    // the same point because this sample still belongs to `previous_mux_ch`.
    state.ad16_long >>= 2;
    if state.integrate_ad16 {
        // Integrating mode forms a simple 1:1 running average with the previous
        // stored sample, which suppresses noise without extra buffer state.
        state.ad16_long += LongInt::from(state.adc_raw_array[previous_mux_ch]);
        state.adc_raw_array[previous_mux_ch] = (state.ad16_long >> 1) as Integer;
    // integrieren
    } else {
        // Direct mode keeps the freshly averaged four-sample ADC result.
        state.adc_raw_array[previous_mux_ch] = state.ad16_long as Integer; // direkt
    }

    set_high(hw, Signal::StrDaMux);

    // Auf AD-Wandlung AD10 warten, falls Systick "ueberfahren" wurde.
    hw.wait_for_adc10_complete();
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::cell::{Cell, RefCell};

    #[derive(Clone, Copy, Debug, Eq, PartialEq)]
    enum Event {
        Signal(Signal, bool),
        PortC(Byte),
        Read(Signal),
        Admux(Byte),
        AdcsraWrite(Byte),
        AdcsraRead(Byte),
        AdclRead(Byte),
        AdchRead(Byte),
        BeginInterruptExclusion,
        EndInterruptExclusion(Byte),
        Nop,
        WaitCycles(u16),
        WaitForAdc10Complete,
    }

    #[derive(Debug, Default)]
    struct TestHardware {
        events: RefCell<Vec<Event>>,
        input_bits: Vec<bool>,
        input_index: Cell<usize>,
        next_status: Byte,
        adcsra_reads: Vec<Byte>,
        adcsra_read_index: Cell<usize>,
        adcl: Byte,
        adch: Byte,
    }

    impl TestHardware {
        fn with_input_word(word: Word) -> Self {
            let input_bits = (0..16).rev().map(|bit| word & (1 << bit) != 0).collect();

            Self {
                events: RefCell::new(Vec::new()),
                input_bits,
                input_index: Cell::new(0),
                next_status: 0xa5,
                adcsra_reads: Vec::new(),
                adcsra_read_index: Cell::new(0),
                adcl: 0,
                adch: 0,
            }
        }

        fn with_adc10(adcsra_reads: Vec<Byte>, adcl: Byte, adch: Byte) -> Self {
            Self {
                adcsra_reads,
                adcl,
                adch,
                ..Self::default()
            }
        }

        fn count_events(&self, event: Event) -> usize {
            self.events
                .borrow()
                .iter()
                .filter(|candidate| **candidate == event)
                .count()
        }

        fn contains_event(&self, event: Event) -> bool {
            self.events.borrow().contains(&event)
        }

        fn first_event(&self) -> Option<Event> {
            self.events.borrow().first().copied()
        }

        fn last_event(&self) -> Option<Event> {
            self.events.borrow().last().copied()
        }

        fn has_event_window(&self, window: &[Event]) -> bool {
            self.events
                .borrow()
                .windows(window.len())
                .any(|candidate| candidate == window)
        }
    }

    impl AdacHardware for TestHardware {
        fn set_signal(&mut self, signal: Signal, high: bool) {
            self.events.borrow_mut().push(Event::Signal(signal, high));
        }

        fn read_signal(&self, signal: Signal) -> bool {
            self.events.borrow_mut().push(Event::Read(signal));
            let index = self.input_index.get();
            self.input_index.set(index + 1);
            self.input_bits[index]
        }

        fn set_port_c(&mut self, value: Byte) {
            self.events.borrow_mut().push(Event::PortC(value));
        }

        fn set_admux(&mut self, value: Byte) {
            self.events.borrow_mut().push(Event::Admux(value));
        }

        fn write_adcsra(&mut self, value: Byte) {
            self.events.borrow_mut().push(Event::AdcsraWrite(value));
        }

        fn read_adcsra(&self) -> Byte {
            let index = self.adcsra_read_index.get();
            let value = self.adcsra_reads.get(index).copied().unwrap_or(0);
            self.adcsra_read_index.set(index + 1);
            self.events.borrow_mut().push(Event::AdcsraRead(value));
            value
        }

        fn read_adcl(&self) -> Byte {
            self.events.borrow_mut().push(Event::AdclRead(self.adcl));
            self.adcl
        }

        fn read_adch(&self) -> Byte {
            self.events.borrow_mut().push(Event::AdchRead(self.adch));
            self.adch
        }

        fn begin_interrupt_exclusion(&mut self) -> Byte {
            self.events
                .borrow_mut()
                .push(Event::BeginInterruptExclusion);
            self.next_status
        }

        fn end_interrupt_exclusion(&mut self, saved_status: Byte) {
            self.events
                .borrow_mut()
                .push(Event::EndInterruptExclusion(saved_status));
        }

        fn nop(&mut self) {
            self.events.borrow_mut().push(Event::Nop);
        }

        fn wait_cycles(&mut self, cycles: u16) {
            self.events.borrow_mut().push(Event::WaitCycles(cycles));
        }

        fn wait_for_adc10_complete(&mut self) {
            self.events.borrow_mut().push(Event::WaitForAdc10Complete);
        }
    }

    #[test]
    fn shift_in1864_blocks_interrupts_for_the_whole_ltc1864_transaction() {
        let mut hw = TestHardware::with_input_word(0xb65a);
        let mut state = AdacState::default();

        shift_in1864(&mut hw, &mut state);

        assert_eq!(state.ad_raw, 0xb65a);
        assert_eq!(hw.first_event(), Some(Event::BeginInterruptExclusion));
        assert_eq!(hw.last_event(), Some(Event::EndInterruptExclusion(0xa5)));
        assert_eq!(hw.count_events(Event::Read(Signal::SDataIn1)), 16);
        assert_eq!(hw.count_events(Event::Nop), 4);
    }

    #[test]
    fn dac_shift_routines_keep_pascal_nop_timing() {
        let state = AdacState {
            dac_temp: 0xa55a,
            ..AdacState::default()
        };

        let mut hw = TestHardware::default();
        shift_out1257(&mut hw, &state);
        assert_eq!(hw.count_events(Event::Nop), 12);

        let mut hw = TestHardware::default();
        shift_out1655(&mut hw, &state);
        assert_eq!(hw.count_events(Event::Nop), 8);

        let mut hw = TestHardware::default();
        shift_out714(&mut hw, &state);
        assert_eq!(hw.count_events(Event::Nop), 19);
    }

    #[test]
    fn shift_register_strobe_keeps_pascal_nop_timing() {
        let state = AdacState {
            port_sr0: 0x11,
            port_sr1: 0x22,
            port_sr2: 0x44,
            port_sr3: 0x88,
            ..AdacState::default()
        };
        let mut hw = TestHardware::default();

        shift_out_sr(&mut hw, &state);

        assert_eq!(hw.count_events(Event::Nop), 2);
        assert!(hw.has_event_window(&[
            Event::Signal(Signal::StrSr, true),
            Event::Nop,
            Event::Nop,
            Event::Signal(Signal::StrSr, false),
        ]));
    }

    #[test]
    fn on_sys_tick_uses_pascal_delay_loop_cycle_counts() {
        let mut hw = TestHardware::with_input_word(0x8004);
        hw.input_bits
            .extend((0..16).rev().map(|bit| 0x8008 & (1 << bit) != 0));
        hw.input_bits
            .extend((0..16).rev().map(|bit| 0x800c & (1 << bit) != 0));
        hw.input_bits
            .extend((0..16).rev().map(|bit| 0x8010 & (1 << bit) != 0));

        let mut state = AdacState {
            adc16_present: true,
            mux_ch: 7,
            ..AdacState::default()
        };

        on_sys_tick(&mut hw, &mut state);

        assert!(hw.contains_event(Event::WaitCycles(ADC16_DISCARD_CONVERSION_DELAY_CYCLES)));
        assert!(hw.contains_event(Event::WaitCycles(DAC_SETTLE_DELAY_CYCLES)));
        assert!(!hw.contains_event(Event::WaitCycles(15)));
        assert!(!hw.contains_event(Event::WaitCycles(4)));
    }

    #[test]
    fn get_adc10_matches_pascal_register_sequence() {
        let mut hw =
            TestHardware::with_adc10(vec![ADCSRA_BUSY_BIT, ADCSRA_BUSY_BIT, 0], 0x34, 0x12);

        let result = get_adc10(&mut hw, 5, true);

        assert_eq!(result, 0x1234);
        assert_eq!(
            *hw.events.borrow(),
            vec![
                Event::Admux(ADC10_INTERNAL_REFERENCE_MASK | 4),
                Event::WaitCycles(ADC10_SETTLE_DELAY_CYCLES),
                Event::AdcsraWrite(ADCSRA_START_DIV128),
                Event::AdcsraRead(ADCSRA_BUSY_BIT),
                Event::AdcsraRead(ADCSRA_BUSY_BIT),
                Event::AdcsraRead(0),
                Event::AdclRead(0x34),
                Event::AdchRead(0x12),
            ]
        );
    }

    #[test]
    fn get_adc10_wraps_and_masks_pascal_byte_channel() {
        let mut hw = TestHardware::with_adc10(vec![0], 0, 0);

        let result = get_adc10(&mut hw, 0, false);

        assert_eq!(result, 0);
        assert_eq!(
            hw.events.borrow().first(),
            Some(&Event::Admux(ADC10_CHANNEL_MASK))
        );
    }
}
