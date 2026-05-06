//! Best-effort Rust port of `DCG-HW.pas`.
//!
//! The original Pascal source mixes inline AVR assembly with module globals.
//! This port keeps the algorithmic structure and the hardware responsibilities
//! but expresses them through explicit state and a hardware access trait.

use core::marker::PhantomData;

use crate::avrd_support::{Atmega32, AvrdPortIo, Mcu, RegisterPort};

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum DacKind {
    Ltc1257,
    Ltc1655,
}

pub trait DcgHardware {
    fn set_sdata_out(&mut self, high: bool);
    fn set_sclk(&mut self, high: bool);
    fn set_str_dac(&mut self, high: bool);
    fn set_str_ad16(&mut self, high: bool);
    fn set_mpx_i(&mut self, high: bool);
    fn set_mpx_u(&mut self, high: bool);
    fn set_mpx_1864(&mut self, high: bool);
    fn read_sdata_in1(&self) -> bool;
    fn spin_delay_cycles(&mut self, cycles: u16);
}

pub struct DcgAvrd<M: Mcu> {
    io: AvrdPortIo<M>,
    _marker: PhantomData<M>,
}

pub type DcgAtmega32 = DcgAvrd<Atmega32>;

impl<M: Mcu> Default for DcgAvrd<M> {
    fn default() -> Self {
        Self {
            io: AvrdPortIo::default(),
            _marker: PhantomData,
        }
    }
}

impl<M: Mcu> DcgAvrd<M> {
    pub fn init_ports(&mut self) {
        self.io.init_port(RegisterPort::B, 0b1011_1111, 0b1101_0011);
        self.io.init_port(RegisterPort::C, 0b1111_1100, 0b0000_1111);
        self.io.init_port(RegisterPort::D, 0b0000_1100, 0b1111_1100);
    }
}

impl<M: Mcu> DcgHardware for DcgAvrd<M> {
    fn set_sdata_out(&mut self, high: bool) {
        self.io.write_bit(RegisterPort::B, 1, high);
    }

    fn set_sclk(&mut self, high: bool) {
        self.io.write_bit(RegisterPort::B, 0, high);
    }

    fn set_str_dac(&mut self, high: bool) {
        self.io.write_bit(RegisterPort::B, 4, high);
    }

    fn set_str_ad16(&mut self, high: bool) {
        self.io.write_bit(RegisterPort::B, 7, high);
    }

    fn set_mpx_i(&mut self, high: bool) {
        self.io.write_bit(RegisterPort::C, 5, high);
    }

    fn set_mpx_u(&mut self, high: bool) {
        self.io.write_bit(RegisterPort::C, 4, high);
    }

    fn set_mpx_1864(&mut self, high: bool) {
        self.io.write_bit(RegisterPort::C, 6, high);
    }

    fn read_sdata_in1(&self) -> bool {
        self.io.read_bit(RegisterPort::B, 6)
    }

    fn spin_delay_cycles(&mut self, cycles: u16) {
        self.io.spin_delay_cycles(cycles);
    }
}

#[derive(Debug, Clone)]
pub struct DcgHardwareState {
    pub dac_temp: u16,
    pub adc_temp: u16,
    pub adc_raw_u: u16,
    pub adc_raw_i: u16,
    pub dac_raw_u_on: u16,
    pub dac_raw_u_off: u16,
    pub dac_raw_i: u16,
    pub pw_counter: u16,
    pub pw_on_time: u16,
    pub pw_off_time: u16,
    pub pw_on_off: bool,
    pub ui_toggle: bool,
    pub adc16_present: bool,
    pub dac16_present: bool,
}

impl Default for DcgHardwareState {
    fn default() -> Self {
        Self {
            dac_temp: 0,
            adc_temp: 0,
            adc_raw_u: 0,
            adc_raw_i: 0,
            dac_raw_u_on: 0,
            dac_raw_u_off: 0,
            dac_raw_i: 0,
            pw_counter: 0,
            pw_on_time: 0,
            pw_off_time: 0,
            pw_on_off: false,
            ui_toggle: false,
            adc16_present: false,
            dac16_present: false,
        }
    }
}

pub fn shift_out_1257<H: DcgHardware>(hw: &mut H, dac_temp: u16) {
    hw.set_sdata_out(false);
    hw.set_sclk(false);
    hw.set_str_dac(true);

    let mut high = ((dac_temp >> 8) as u8) << 4;
    for _ in 0..4 {
        hw.set_sdata_out((high & 0x80) != 0);
        hw.set_sclk(true);
        high <<= 1;
        hw.spin_delay_cycles(1);
        hw.set_sdata_out(false);
        hw.set_sclk(false);
    }

    let mut low = dac_temp as u8;
    for _ in 0..7 {
        hw.set_sdata_out((low & 0x80) != 0);
        hw.set_sclk(true);
        low <<= 1;
        hw.spin_delay_cycles(1);
        hw.set_sdata_out(false);
        hw.set_sclk(false);
    }

    hw.set_sdata_out((low & 0x80) != 0);
    hw.set_sclk(true);
    hw.set_str_dac(false);
    hw.spin_delay_cycles(1);
    hw.set_sdata_out(false);
    hw.set_sclk(false);
    hw.set_str_dac(true);
}

pub fn shift_out_1655<H: DcgHardware>(hw: &mut H, dac_temp: u16) {
    hw.set_sclk(false);
    hw.set_sdata_out(false);
    hw.set_str_dac(false);

    for byte in dac_temp.to_be_bytes() {
        let mut current = byte;
        for _ in 0..8 {
            hw.set_sdata_out((current & 0x80) != 0);
            hw.set_sclk(true);
            current <<= 1;
            hw.set_sdata_out(false);
            hw.set_sclk(false);
        }
    }

    hw.set_str_dac(true);
}

pub fn shift_in_1864<H: DcgHardware>(hw: &mut H) -> u16 {
    hw.set_str_ad16(false);
    hw.set_sclk(false);

    let mut result = 0u16;
    for _ in 0..16 {
        hw.set_sclk(true);
        let bit = hw.read_sdata_in1();
        hw.set_sclk(false);
        result = (result << 1) | u16::from(bit);
    }

    hw.set_sclk(true);
    hw.spin_delay_cycles(1);
    hw.set_str_ad16(true);
    result
}

pub fn on_sys_tick<H: DcgHardware>(state: &mut DcgHardwareState, hw: &mut H, dac_kind: DacKind) {
    hw.set_mpx_i(true);
    hw.set_mpx_u(false);

    if state.adc16_present {
        state.adc_temp = shift_in_1864(hw);
    }

    if state.ui_toggle {
        if state.pw_on_off {
            if state.pw_counter == 0 {
                state.pw_counter = state.pw_off_time;
                state.pw_on_off = false;
                state.dac_temp = state.dac_raw_u_off;
            } else {
                state.dac_temp = state.dac_raw_u_on;
            }
        } else if state.pw_counter == 0 {
            state.pw_counter = state.pw_on_time;
            state.pw_on_off = true;
            state.dac_temp = state.dac_raw_u_on;
        } else {
            state.dac_temp = state.dac_raw_u_off;
        }
    } else {
        state.dac_temp = state.dac_raw_i;
    }

    if state.pw_counter > 0 {
        state.pw_counter -= 1;
    }

    match dac_kind {
        DacKind::Ltc1257 => shift_out_1257(hw, state.dac_temp),
        DacKind::Ltc1655 => shift_out_1655(hw, state.dac_temp),
    }

    hw.spin_delay_cycles(40);

    if state.ui_toggle {
        state.adc_raw_u = ((state.adc_raw_u as u32 + state.adc_temp as u32) / 2) as u16;
        hw.set_mpx_1864(true);
        hw.set_mpx_u(true);
    } else {
        state.adc_raw_i = ((state.adc_raw_i as u32 + state.adc_temp as u32) / 2) as u16;
        hw.set_mpx_1864(false);
        hw.set_mpx_i(false);
    }

    state.ui_toggle = !state.ui_toggle;
}

pub fn get_adc10<H: DcgHardware>(_hw: &mut H, _channel: u8) -> u16 {
    // The Pascal version drives the AVR ADC registers directly and waits for
    // conversion completion in a tight loop. That must be implemented against
    // a concrete ATmega32 register model in a later pass.
    0
}
