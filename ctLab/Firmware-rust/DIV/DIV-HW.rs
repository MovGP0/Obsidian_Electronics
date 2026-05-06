//! Best-effort Rust port of `DIV-HW.pas`.

use core::marker::PhantomData;

use crate::avrd_support::{Atmega32, AvrdPortIo, Mcu, RegisterPort};

pub trait DivHardware {
    fn set_str_ad24(&mut self, high: bool);
    fn set_sclk(&mut self, high: bool);
    fn read_sdata_in1(&self) -> bool;
    fn spi_transfer(&mut self, tx: u8) -> u8;
    fn spin_delay_cycles(&mut self, cycles: u16);
}

pub struct DivAvrd<M: Mcu> {
    io: AvrdPortIo<M>,
    _marker: PhantomData<M>,
}

pub type DivAtmega32 = DivAvrd<Atmega32>;

impl<M: Mcu> Default for DivAvrd<M> {
    fn default() -> Self {
        Self {
            io: AvrdPortIo::default(),
            _marker: PhantomData,
        }
    }
}

impl<M: Mcu> DivAvrd<M> {
    pub fn init_ports(&mut self) {
        self.io.init_port(RegisterPort::A, 0b1110_0000, 0b0000_0011);
        self.io.init_port(RegisterPort::B, 0b1001_0000, 0b1001_0001);
        self.io.init_port(RegisterPort::C, 0b1111_1100, 0b0000_0011);
        self.io.init_port(RegisterPort::D, 0b0001_1100, 0b1111_1100);
    }
}

impl<M: Mcu> DivHardware for DivAvrd<M> {
    fn set_str_ad24(&mut self, high: bool) {
        self.io.write_bit(RegisterPort::B, 4, high);
    }

    fn set_sclk(&mut self, high: bool) {
        self.io.write_bit(RegisterPort::B, 7, high);
    }

    fn read_sdata_in1(&self) -> bool {
        self.io.read_bit(RegisterPort::B, 6)
    }

    fn spi_transfer(&mut self, tx: u8) -> u8 {
        self.io.spi_transfer(tx)
    }

    fn spin_delay_cycles(&mut self, cycles: u16) {
        self.io.spin_delay_cycles(cycles);
    }
}

#[derive(Debug, Clone, Default)]
pub struct DivHardwareState {
    pub ad24_temp: u32,
    pub ad24_temp_fast_integrated: u32,
    pub ad24_temp_slow_integrated: u32,
    pub ad24_integrate0: u32,
    pub ad24_integrate1: u32,
    pub ad24_integrate2: u32,
    pub ad24_integrate3: u32,
    pub negative_flag: bool,
    pub over_voltage_flag: bool,
    pub abort_flag: bool,
    pub trigger: bool,
    pub ad24_ready: bool,
    pub ad10_ready: bool,
}

pub fn shift_in_2400<H: DivHardware>(state: &mut DivHardwareState, hw: &mut H) {
    hw.set_str_ad24(false);

    let mut top = 0u8;
    for bit_index in 0..4 {
        hw.set_sclk(true);
        // The LTC2400 presents its status bits before the 24 data bits:
        // bit 2 indicates the signed/clipping state and bit 3 the overrange flag.
        if bit_index == 2 {
            state.negative_flag = !hw.read_sdata_in1();
        }
        if bit_index == 3 {
            state.over_voltage_flag = hw.read_sdata_in1();
        }
        hw.set_sclk(false);
        top <<= 1;
    }

    let b2 = hw.spi_transfer(0);
    let b1 = hw.spi_transfer(0);
    let b0 = hw.spi_transfer(0);

    // Clock out the remaining four trailing dither bits after the 24-bit payload.
    for _ in 0..4 {
        hw.spin_delay_cycles(1);
        hw.set_sclk(true);
        hw.spin_delay_cycles(1);
        hw.set_sclk(false);
    }

    // Negative readings are sign-extended to preserve the LTC2400 two's-complement format.
    let msb = if state.negative_flag { 0xFF } else { top };
    state.ad24_temp = ((msb as u32) << 24) | ((b2 as u32) << 16) | ((b1 as u32) << 8) | (b0 as u32);

    // Overrange is treated as hard clipping and forced to the full-scale positive code.
    if state.over_voltage_flag {
        state.ad24_temp = 16_777_215;
    }

    hw.set_str_ad24(true);
}

pub fn int2_trigger(state: &mut DivHardwareState) {
    // External trigger input IRQ on the falling edge.
    state.trigger = true;
}

pub fn on_sys_tick<H: DivHardware>(state: &mut DivHardwareState, hw: &mut H) {
    hw.set_sclk(false);
    hw.set_str_ad24(false);

    if state.abort_flag {
        // Abort clears a pending conversion by issuing a short manual SCLK pulse.
        hw.set_str_ad24(false);
        hw.spin_delay_cycles(1);
        hw.set_sclk(true);
        hw.spin_delay_cycles(1);
        hw.set_sclk(false);
        state.abort_flag = false;
    } else if !hw.read_sdata_in1() {
        // SDATA low is the LTC2400 end-of-conversion signal; only then is a read valid.
        hw.set_str_ad24(true);
        shift_in_2400(state, hw);

        // Fast integration is a simple 2-sample moving average for light smoothing.
        state.ad24_temp_fast_integrated = (state.ad24_temp + state.ad24_integrate0) / 2;
        state.ad24_integrate0 = state.ad24_temp_fast_integrated;

        // Slow integration averages the current sample with the previous three filter states.
        state.ad24_temp_slow_integrated = (state.ad24_temp
            + state.ad24_integrate1
            + state.ad24_integrate2
            + state.ad24_integrate3)
            / 4;
        state.ad24_integrate3 = state.ad24_integrate2;
        state.ad24_integrate2 = state.ad24_integrate1;
        state.ad24_integrate1 = state.ad24_temp_slow_integrated;

        // Marks that the 24-bit conversion path has fresh data for the foreground loop.
        state.ad24_ready = true;
    }

    hw.set_str_ad24(true);
    // The original firmware also used the systick as the update point for the 10-bit path.
    state.ad10_ready = true;
}
