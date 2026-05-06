//! Best-effort Rust port of `EDL-HW.pas`.
//!
//! The original Pascal file is a low-level AVR hardware unit made up mostly of
//! inline assembly. This port keeps the same DAC/ADC state machine and the same
//! bit-banged wire protocol sequencing, but expresses the pin/register access
//! through a small trait so the routines stay readable and portable.

use core::marker::PhantomData;

use crate::avrd_support::{Atmega32, Atmega644, AvrdPortIo, Mcu, RegisterPort};

pub const ADC10_CHANNEL_MASK: u8 = 0x07;
pub const ADCSRA_START_DIV128: u8 = 0xC7;
pub const ADCSRA_BUSY_BIT: u8 = 1 << 6;
pub const ADC10_SETTLE_CYCLES: usize = 15;

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum ControlBit {
    Sclk,
    SDataOut,
    StrDac,
    StrAd16,
    SDataIn1,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum DacType {
    Ltc8043,
    Ad5452,
    Dac8501,
    Dac8811,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum MeasurementPhase {
    Ioff,
    Uoff,
    Ion,
    Uon,
}

/// Hardware hooks needed by the original EDL firmware routines.
pub trait EdlHardware {
    fn set_control_bit(&mut self, bit: ControlBit, high: bool);
    fn read_control_bit(&self, bit: ControlBit) -> bool;

    fn set_trigger_out(&mut self, high: bool);
    fn read_trigger_in(&self) -> bool;
    fn set_ad16_mpx(&mut self, high: bool);

    fn set_admux(&mut self, value: u8);
    fn write_adcsra(&mut self, value: u8);
    fn read_adcsra(&self) -> u8;
    fn read_adcl(&self) -> u8;
    fn read_adch(&self) -> u8;

    fn nop(&mut self) {}
}

pub struct EdlAvrd<M: Mcu> {
    io: AvrdPortIo<M>,
    _marker: PhantomData<M>,
}

pub type EdlAtmega32 = EdlAvrd<Atmega32>;
pub type EdlAtmega644 = EdlAvrd<Atmega644>;

impl<M: Mcu> Default for EdlAvrd<M> {
    fn default() -> Self {
        Self {
            io: AvrdPortIo::default(),
            _marker: PhantomData,
        }
    }
}

impl<M: Mcu> EdlAvrd<M> {
    pub fn init_ports(&mut self) {
        self.io.init_port(RegisterPort::B, 0b1011_1011, 0b1111_1101);
        self.io.init_port(RegisterPort::C, 0b1111_1100, 0b1100_0011);
        self.io.init_port(RegisterPort::D, 0b0000_1100, 0b1111_1111);
    }
}

impl<M: Mcu> EdlHardware for EdlAvrd<M> {
    fn set_control_bit(&mut self, bit: ControlBit, high: bool) {
        let bit_number = match bit {
            ControlBit::Sclk => 7,
            ControlBit::SDataOut => 5,
            ControlBit::StrDac => 3,
            ControlBit::StrAd16 => 4,
            ControlBit::SDataIn1 => 6,
        };
        self.io.write_bit(RegisterPort::B, bit_number, high);
    }

    fn read_control_bit(&self, bit: ControlBit) -> bool {
        let bit_number = match bit {
            ControlBit::Sclk => 7,
            ControlBit::SDataOut => 5,
            ControlBit::StrDac => 3,
            ControlBit::StrAd16 => 4,
            ControlBit::SDataIn1 => 6,
        };
        self.io.read_bit(RegisterPort::B, bit_number)
    }

    fn set_trigger_out(&mut self, _high: bool) {}

    fn read_trigger_in(&self) -> bool {
        self.io.read_bit(RegisterPort::B, 2)
    }

    fn set_ad16_mpx(&mut self, high: bool) {
        self.io.write_bit(RegisterPort::B, 1, high);
    }

    fn set_admux(&mut self, value: u8) {
        unsafe {
            crate::avrd_support::write_u8(M::ADMUX, value);
        }
    }

    fn write_adcsra(&mut self, value: u8) {
        unsafe {
            crate::avrd_support::write_u8(M::ADCSRA, value);
        }
    }

    fn read_adcsra(&self) -> u8 {
        unsafe { crate::avrd_support::read_u8(M::ADCSRA) }
    }

    fn read_adcl(&self) -> u8 {
        unsafe { crate::avrd_support::read_u8(M::ADCL) }
    }

    fn read_adch(&self) -> u8 {
        unsafe { crate::avrd_support::read_u8(M::ADCH) }
    }

    fn nop(&mut self) {
        self.io.spin_delay_cycles(1);
    }
}

#[derive(Debug, Clone)]
pub struct EdlState {
    pub dac_temp: u16,
    pub ad16_temp: u16,
    pub ad16_temp_ioff: u16,
    pub ad16_temp_uoff: u16,
    pub ad16_temp_ion: u16,
    pub ad16_temp_uon: u16,
    pub dac_temp_on: u16,
    pub dac_temp_off: u16,
    pub dac_type: DacType,
    pub pw_counter: i32,
    pub pw_off_time: i32,
    pub pw_on_time: i32,
    pub pw_on_off: bool,
    pub trig_in_enable: bool,
    pub overload_flag: bool,
    pub ad16_select: bool,
    pub next_meas: MeasurementPhase,
    pub last_meas: MeasurementPhase,
    pub this_meas: MeasurementPhase,
}

impl Default for EdlState {
    fn default() -> Self {
        Self {
            dac_temp: 0,
            ad16_temp: 0,
            ad16_temp_ioff: 0,
            ad16_temp_uoff: 0,
            ad16_temp_ion: 0,
            ad16_temp_uon: 0,
            dac_temp_on: 0,
            dac_temp_off: 0,
            dac_type: DacType::Ltc8043,
            pw_counter: 0,
            pw_off_time: 0,
            pw_on_time: 0,
            pw_on_off: false,
            trig_in_enable: false,
            overload_flag: false,
            ad16_select: false,
            next_meas: MeasurementPhase::Uoff,
            last_meas: MeasurementPhase::Uoff,
            this_meas: MeasurementPhase::Uoff,
        }
    }
}

pub struct EdlHw<H> {
    pub io: H,
    pub state: EdlState,
}

impl<H: EdlHardware> EdlHw<H> {
    pub fn new(io: H) -> Self {
        Self {
            io,
            state: EdlState::default(),
        }
    }

    pub fn shift_out_8501(&mut self) {
        self.set(ControlBit::Sclk, true);
        self.set(ControlBit::SDataOut, false);
        self.set(ControlBit::StrDac, false);

        // The 8501/1655 family wants eight leading zero bits so its power-down
        // control field stays disabled before the 16-bit payload is clocked out.
        for _ in 0..8 {
            self.set(ControlBit::Sclk, false);
            self.io.nop();
            self.set(ControlBit::Sclk, true);
        }

        self.shift_out_8501_byte((self.state.dac_temp >> 8) as u8);
        self.shift_out_8501_byte(self.state.dac_temp as u8);

        self.set(ControlBit::Sclk, false);
        self.set(ControlBit::StrDac, true);
    }

    pub fn shift_out_5452(&mut self) {
        self.set(ControlBit::SDataOut, false);
        self.set(ControlBit::Sclk, false);
        self.set(ControlBit::StrDac, false);

        let msb = (self.state.dac_temp >> 8) as u8;
        // AD5452 starts with two control bits that stay low; the Pascal code
        // expresses that as two extra falling-edge clock pairs before the data.
        self.set(ControlBit::Sclk, true);
        self.set(ControlBit::Sclk, false);
        self.set(ControlBit::Sclk, true);
        self.set(ControlBit::Sclk, false);
        self.shift_bits_msb(msb & 0x0f, 4);
        self.shift_bits_msb(self.state.dac_temp as u8, 8);

        // Trailing filler clocks are ignored by the DAC but preserve the exact
        // wire sequence from the original firmware.
        self.set(ControlBit::Sclk, true);
        self.set(ControlBit::Sclk, false);
        self.set(ControlBit::Sclk, true);
        self.set(ControlBit::Sclk, false);
        self.set(ControlBit::StrDac, true);
    }

    pub fn shift_out_8043(&mut self) {
        self.set(ControlBit::SDataOut, false);
        self.set(ControlBit::Sclk, false);

        let msb = (self.state.dac_temp >> 8) as u8;
        self.shift_bits_msb(msb & 0x0f, 4);
        self.shift_bits_msb(self.state.dac_temp as u8, 7);

        let last_bit = (self.state.dac_temp & 0x0001) != 0;
        // Unlike the 5452, the 8043-style parts use the final data bit together
        // with the latch pulse, mirroring the LTC1257-style "load on last clock".
        self.set(ControlBit::SDataOut, last_bit);
        self.set(ControlBit::Sclk, true);
        self.set(ControlBit::StrDac, false);
        self.set(ControlBit::Sclk, false);
        self.set(ControlBit::StrDac, true);
    }

    pub fn shift_out_8811(&mut self) {
        self.set(ControlBit::SDataOut, false);
        self.set(ControlBit::Sclk, false);
        self.set(ControlBit::StrDac, false); // Keep load active across the full 16-bit frame.

        self.shift_bits_msb((self.state.dac_temp >> 8) as u8, 8);
        self.shift_bits_msb(self.state.dac_temp as u8, 8);

        self.set(ControlBit::Sclk, false);
        self.set(ControlBit::StrDac, true);
    }

    pub fn shift_out_sr(&mut self) {
        self.set(ControlBit::Sclk, false);
        self.set(ControlBit::SDataOut, false);

        // The original board can route DACtemp through a 4094 shift-register
        // chain instead of a dedicated DAC; shift the full 16-bit word MSB first.
        self.shift_sr_byte((self.state.dac_temp >> 8) as u8);
        self.shift_sr_byte(self.state.dac_temp as u8);

        // STRDAC copies the shift-register contents to the output latches.
        self.set(ControlBit::StrDac, true);
        self.io.nop();
        self.io.nop();
        self.set(ControlBit::StrDac, false);
        // Restore the idle level expected by the original bit-banged interface.
        self.set(ControlBit::Sclk, true);
    }

    pub fn shift_in_1864(&mut self) {
        self.set(ControlBit::Sclk, false);
        self.set(ControlBit::StrAd16, false);

        // The LTC1864 needs a short quiet period after /CONV goes low before the
        // 16-bit sample can be shifted out.
        self.io.nop();
        self.io.nop();
        self.io.nop();

        let hi = self.shift_in_byte();
        let lo = self.shift_in_byte();
        self.state.ad16_temp = u16::from_be_bytes([hi, lo]);

        // Raising STRAD16 releases the converter so the next conversion can run
        // while the firmware processes the sample it just collected.
        self.set(ControlBit::StrAd16, true);
        self.set(ControlBit::Sclk, false);
    }

    pub fn on_sys_tick(&mut self) {
        // Read the finished ADC16 conversion first; the Pascal code treats the
        // converter as pipelined, so this belongs to an earlier PWM phase.
        self.shift_in_1864();
        self.state.pw_counter -= 1;

        if self.state.pw_off_time == 0 {
            self.state.pw_on_off = true;
        }

        if !self.io.read_trigger_in() && self.state.trig_in_enable {
            self.state.pw_on_off = false;
        }

        if self.state.pw_on_off {
            self.io.set_trigger_out(true);
            self.state.dac_temp = if self.state.overload_flag {
                0
            } else {
                self.state.dac_temp_on
            };
            self.shift_out_active_dac();

            if self.state.pw_counter <= 0 {
                // Toggle the ADC16 input mux now so the next conversion sees the
                // opposite current/voltage path.
                self.state.ad16_select = !self.state.ad16_select;
                self.io.set_ad16_mpx(self.state.ad16_select);
                self.state.pw_on_off = false;
                self.state.pw_counter = self.state.pw_off_time;
            }

            self.state.next_meas = if self.state.ad16_select {
                MeasurementPhase::Ion
            } else {
                MeasurementPhase::Uon
            };
        } else {
            self.io.set_trigger_out(false);
            self.state.dac_temp = if self.state.overload_flag {
                0
            } else {
                self.state.dac_temp_off
            };
            self.shift_out_active_dac();

            if self.state.pw_counter <= 0 {
                // The off-phase uses the same mux preselection so the hardware
                // is already pointed at the next requested measurement.
                self.state.ad16_select = !self.state.ad16_select;
                self.io.set_ad16_mpx(self.state.ad16_select);
                self.state.pw_on_off = true;
                self.state.pw_counter = self.state.pw_on_time;
            }

            self.state.next_meas = if self.state.ad16_select {
                MeasurementPhase::Ioff
            } else {
                MeasurementPhase::Uoff
            };
        }

        // Each accumulator keeps the original "halve old + halve new" smoothing.
        let filtered_sample = self.state.ad16_temp >> 1;
        match self.state.last_meas {
            MeasurementPhase::Ioff => {
                self.state.ad16_temp_ioff = (self.state.ad16_temp_ioff >> 1) + filtered_sample;
            }
            MeasurementPhase::Uoff => {
                self.state.ad16_temp_uoff = (self.state.ad16_temp_uoff >> 1) + filtered_sample;
            }
            MeasurementPhase::Ion => {
                self.state.ad16_temp_ion = (self.state.ad16_temp_ion >> 1) + filtered_sample;
            }
            MeasurementPhase::Uon => {
                self.state.ad16_temp_uon = (self.state.ad16_temp_uon >> 1) + filtered_sample;
            }
        }

        self.state.last_meas = self.state.this_meas;
        self.state.this_meas = self.state.next_meas;
    }

    pub fn get_adc10(&mut self, my_channel: u8) -> u16 {
        // Hand-coded equivalent of the old getadc() helper: select the mux input
        // explicitly instead of depending on compiler-provided runtime support.
        self.io
            .set_admux(my_channel.wrapping_sub(1) & ADC10_CHANNEL_MASK);

        // The Pascal loop burns roughly 3 us so the mux input can settle.
        for _ in 0..ADC10_SETTLE_CYCLES {
            self.io.nop();
        }

        // 0xC7 starts a conversion with the AVR ADC prescaler at 128.
        self.io.write_adcsra(ADCSRA_START_DIV128);
        // Poll ADSC until it drops; avrd hides the ATMega32 vs ATMega644 access
        // difference that the original assembly handled with IN vs LDS.
        while (self.io.read_adcsra() & ADCSRA_BUSY_BIT) != 0 {}

        u16::from(self.io.read_adcl()) | (u16::from(self.io.read_adch()) << 8)
    }

    fn shift_out_active_dac(&mut self) {
        match self.state.dac_type {
            DacType::Ltc8043 => self.shift_out_8043(),
            DacType::Ad5452 => self.shift_out_5452(),
            DacType::Dac8501 => self.shift_out_8501(),
            DacType::Dac8811 => self.shift_out_8811(),
        }
    }

    fn shift_out_8501_byte(&mut self, mut value: u8) {
        for _ in 0..8 {
            let high = (value & 0x80) != 0;
            self.set(ControlBit::SDataOut, high);
            self.set(ControlBit::Sclk, false);
            value <<= 1;
            self.set(ControlBit::SDataOut, false);
            self.set(ControlBit::Sclk, true);
        }
    }

    fn shift_bits_msb(&mut self, value: u8, bit_count: usize) {
        for bit_index in (0..bit_count).rev() {
            let mask = 1u8 << bit_index;
            self.set(ControlBit::SDataOut, (value & mask) != 0);
            self.set(ControlBit::Sclk, true);
            self.set(ControlBit::Sclk, false);
        }
    }

    fn shift_sr_byte(&mut self, mut value: u8) {
        for _ in 0..8 {
            self.set(ControlBit::SDataOut, (value & 0x80) != 0);
            self.set(ControlBit::Sclk, true);
            value <<= 1;
            self.set(ControlBit::SDataOut, false);
            self.set(ControlBit::Sclk, false);
        }
    }

    fn shift_in_byte(&mut self) -> u8 {
        let mut value = 0u8;
        for _ in 0..8 {
            self.set(ControlBit::Sclk, true);
            let incoming = self.io.read_control_bit(ControlBit::SDataIn1);
            self.set(ControlBit::Sclk, false);
            value = (value << 1) | u8::from(incoming);
        }
        value
    }

    fn set(&mut self, bit: ControlBit, high: bool) {
        self.io.set_control_bit(bit, high);
    }
}
