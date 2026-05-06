//! Best-effort Rust port of `DDS-HW.pas`.
//!
//! The original Pascal unit bit-bangs an AD9833 DDS, a LTC1257 offset DAC,
//! a 4094 shift register chain, and an auxiliary serial output. This port
//! keeps the hardware-facing constants and routines readable while replacing
//! direct AVR register access with a small I/O trait.

use core::marker::PhantomData;

use crate::avrd_support::{Atmega32, AvrdPortIo, Mcu, RegisterPort};

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum PortKind {
    DdsOut,
    ControlBit,
    Extension,
    LedOut,
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Waveform {
    Off,
    Sine,
    Triangle,
    Square,
    Logic,
    External(u8),
}

pub trait DdsHardwareIo {
    fn set_bit(&mut self, port: PortKind, bit: u8);
    fn clear_bit(&mut self, port: PortKind, bit: u8);
    fn delay_units(&mut self, units: u8);
    fn delay_ms(&mut self, milliseconds: u16);
    fn begin_critical_section(&mut self);
    fn end_critical_section(&mut self);
}

pub struct DdsAvrd<M: Mcu> {
    io: AvrdPortIo<M>,
    _marker: PhantomData<M>,
}

pub type DdsAtmega32 = DdsAvrd<Atmega32>;

impl<M: Mcu> Default for DdsAvrd<M> {
    fn default() -> Self {
        Self {
            io: AvrdPortIo::default(),
            _marker: PhantomData,
        }
    }
}

impl<M: Mcu> DdsAvrd<M> {
    pub fn init_ports(&mut self) {
        self.io.init_port(RegisterPort::B, 0b0001_1111, 0b0001_0111);
        self.io.init_port(RegisterPort::C, 0b1111_1100, 0b1111_1111);
        self.io.init_port(RegisterPort::D, 0b0000_1100, 0b1111_1100);
    }

    fn map_port(port: PortKind) -> RegisterPort {
        match port {
            PortKind::DdsOut | PortKind::ControlBit => RegisterPort::B,
            PortKind::Extension => RegisterPort::C,
            PortKind::LedOut => RegisterPort::D,
        }
    }
}

impl<M: Mcu> DdsHardwareIo for DdsAvrd<M> {
    fn set_bit(&mut self, port: PortKind, bit: u8) {
        self.io.write_bit(Self::map_port(port), bit, true);
    }

    fn clear_bit(&mut self, port: PortKind, bit: u8) {
        self.io.write_bit(Self::map_port(port), bit, false);
    }

    fn delay_units(&mut self, units: u8) {
        self.io.spin_delay_cycles(units.into());
    }

    fn delay_ms(&mut self, milliseconds: u16) {
        for _ in 0..milliseconds {
            self.io.spin_delay_cycles(16_000);
        }
    }

    fn begin_critical_section(&mut self) {}

    fn end_critical_section(&mut self) {}
}

pub const B_SCLK: u8 = 0;
pub const B_SDATAOUT: u8 = 1;
pub const B_FSYNC: u8 = 2;
pub const B_STROBE: u8 = 3;
pub const B_STRDAC: u8 = 4;
pub const B_SER_AUX: u8 = 5;

pub const DDS_RESET_CMD: u16 = 0b0010_0001_0000_0000;
pub const DDS_SINE_CMD: u16 = 0b0010_0000_0000_0000;
pub const DDS_TRIANGLE_CMD: u16 = 0b0010_0000_0000_0010;
pub const DDS_SQUARE_CMD: u16 = 0b0010_0000_0010_1000;
pub const DDS_FREQ_REGISTER_WRITE: u16 = 0b0100_0000_0000_0000;

pub const FHZ_INT: [i32; 8] = [64_000_000, 6_400_000, 640_000, 64_000, 6_400, 640, 64, 6];
pub const FHZ_SQG: [f32; 9] = [
    134_217_728.0,
    13_421_772.8,
    1_342_177.28,
    134_217.728,
    13_421.7728,
    1_342.17728,
    134.217_728,
    13.421_772_8,
    1.342_177_28,
];

const TWO_SR_SQUARE_SW_BIT: u8 = 4;
const TWO_SR_ATTN_SW_BIT: u8 = 5;
const TWO_SR_EXT_ON_BIT: u8 = 6;
const TWO_SR_OFFS_SW_BIT: u8 = 7;

const THREE_SR_SQUARE_SW_BIT: u8 = 0;
const THREE_SR_ATTN_SW_BIT: u8 = 1;
const THREE_SR_EXT_ON_BIT: u8 = 2;
const THREE_SR_OFFS_SW_BIT: u8 = 3;
const THREE_SR_LOGIC_SW_BIT: u8 = 4;

const LED_SWITCH_BIT: u8 = 3;

#[derive(Clone, Debug)]
pub struct DdsHardwareState {
    pub board_has_two_shift_registers: bool,
    pub dss_cmd: u16,
    pub wave_cmd: u16,
    pub switch_state: u8,
    pub dac_temp: i16,
    pub level_byte_hi: u8,
    pub level_byte_lo: u8,
    pub dds_frequency_word: i32,
    pub level_range: bool,
    pub frequency_tenths_hz: i32,
    pub offset_mv: i32,
    pub dac_level: f32,
    pub attn_switch_point: f32,
    pub level_scale_low: f32,
    pub level_scale_high: f32,
    pub pwr_gain: f32,
    pub attn_fac: f32,
}

impl Default for DdsHardwareState {
    fn default() -> Self {
        Self {
            board_has_two_shift_registers: true,
            dss_cmd: 0,
            wave_cmd: DDS_RESET_CMD,
            switch_state: 0,
            dac_temp: 0,
            level_byte_hi: 0,
            level_byte_lo: 0,
            dds_frequency_word: 0,
            level_range: false,
            frequency_tenths_hz: 10_000,
            offset_mv: 0,
            dac_level: 0.0,
            attn_switch_point: 100.0,
            level_scale_low: 1.0,
            level_scale_high: 1.0,
            pwr_gain: 2.0,
            attn_fac: 40.0,
        }
    }
}

impl DdsHardwareState {
    pub fn ser_aux<IO: DdsHardwareIo>(&self, io: &mut IO, mybyte: u8) {
        let mut value = mybyte;

        // Original source uses ExtensionPort bit 5 as an auxiliary 19.2 kBd UART.
        io.clear_bit(PortKind::Extension, B_SER_AUX);
        io.delay_units(5);

        for _ in 0..8 {
            if value & 0x01 != 0 {
                io.set_bit(PortKind::Extension, B_SER_AUX);
            } else {
                io.clear_bit(PortKind::Extension, B_SER_AUX);
            }
            io.delay_units(5);
            value >>= 1;
        }

        io.set_bit(PortKind::Extension, B_SER_AUX);
        io.delay_units(10);
    }

    pub fn shift_out_1257<IO: DdsHardwareIo>(&mut self, io: &mut IO, my_val: i16) {
        let clamped = my_val.clamp(-0x07ff, 0x07ff);
        let dac_word = (clamped + 0x0800) as u16;
        self.dac_temp = clamped + 0x0800;

        io.clear_bit(PortKind::ControlBit, B_SDATAOUT);
        io.clear_bit(PortKind::ControlBit, B_SCLK);
        io.set_bit(PortKind::ControlBit, B_STRDAC);

        for bit in (0..12).rev() {
            if (dac_word >> bit) & 1 != 0 {
                io.set_bit(PortKind::ControlBit, B_SDATAOUT);
            } else {
                io.clear_bit(PortKind::ControlBit, B_SDATAOUT);
            }

            io.set_bit(PortKind::ControlBit, B_SCLK);
            if bit == 0 {
                io.clear_bit(PortKind::ControlBit, B_STRDAC);
            }
            io.clear_bit(PortKind::ControlBit, B_SDATAOUT);
            io.clear_bit(PortKind::ControlBit, B_SCLK);
        }

        io.set_bit(PortKind::ControlBit, B_STRDAC);
    }

    pub fn shift_out_level_sr<IO: DdsHardwareIo>(&mut self, io: &mut IO, my_level_sr: i16) {
        self.level_byte_hi = ((my_level_sr as u16 >> 8) & 0x00ff) as u8;
        self.level_byte_lo = (my_level_sr as u16 & 0x00ff) as u8;

        if self.board_has_two_shift_registers {
            self.level_byte_hi |= self.switch_state;
        }

        io.clear_bit(PortKind::DdsOut, B_SCLK);
        io.clear_bit(PortKind::DdsOut, B_SDATAOUT);

        self.shift_byte_msb_first(io, PortKind::DdsOut, PortKind::DdsOut, self.switch_state);
        self.shift_byte_msb_first(io, PortKind::DdsOut, PortKind::DdsOut, self.level_byte_hi);
        self.shift_byte_msb_first(io, PortKind::DdsOut, PortKind::DdsOut, self.level_byte_lo);

        io.set_bit(PortKind::DdsOut, B_STROBE);
        io.clear_bit(PortKind::DdsOut, B_STROBE);
        io.set_bit(PortKind::DdsOut, B_SCLK);
    }

    pub fn send_dds<IO: DdsHardwareIo>(&self, io: &mut IO) {
        io.set_bit(PortKind::DdsOut, B_SCLK);
        io.clear_bit(PortKind::ControlBit, B_SDATAOUT);
        io.clear_bit(PortKind::DdsOut, B_FSYNC);

        for bit in (0..16).rev() {
            if (self.dss_cmd >> bit) & 1 != 0 {
                io.set_bit(PortKind::ControlBit, B_SDATAOUT);
            }
            io.clear_bit(PortKind::ControlBit, B_SCLK);
            io.clear_bit(PortKind::ControlBit, B_SDATAOUT);
            io.set_bit(PortKind::ControlBit, B_SCLK);
        }

        io.set_bit(PortKind::DdsOut, B_FSYNC);
    }

    pub fn set_level_dds_sqg<IO: DdsHardwareIo>(&mut self, io: &mut IO, wave: Waveform) {
        self.switch_state = 0;

        if self.dac_level < self.attn_switch_point {
            self.set_attn_sw(true);
        } else {
            self.set_attn_sw(false);
        }

        self.wave_cmd = match wave {
            Waveform::Sine => DDS_SINE_CMD,
            Waveform::Triangle => DDS_TRIANGLE_CMD,
            Waveform::Square | Waveform::Logic => DDS_SQUARE_CMD,
            Waveform::Off | Waveform::External(_) => DDS_RESET_CMD,
        };

        // The Pascal SQG variant passes an uninitialized myLevel variable here.
        // The hardware effect is relay switching, so the port uses a zero level word.
        self.shift_out_level_sr(io, 0);

        self.dds_frequency_word = Self::dds_tuning_word_sqg(self.frequency_tenths_hz);

        io.begin_critical_section();
        self.send_tuning_word(io, self.dds_frequency_word as u32);
        self.dss_cmd = self.wave_cmd;
        self.send_dds(io);
        io.end_critical_section();
    }

    pub fn set_level_dds<IO: DdsHardwareIo>(&mut self, io: &mut IO, wave: Waveform) {
        self.switch_state = 0;
        self.level_byte_hi = 0;
        self.level_byte_lo = 0;

        let mut my_offset = self.offset_mv;

        if my_offset == 0 {
            self.set_offs_sw(true);
            self.set_led_switch(io, true);
        } else {
            self.set_led_switch(io, false);
        }

        let my_level = if self.dac_level < self.attn_switch_point {
            let scaled = (self.dac_level * self.attn_fac * self.level_scale_low).round() as i16;
            self.set_attn_sw(true);

            if self.level_range {
                self.dss_cmd = DDS_RESET_CMD;
                io.begin_critical_section();
                self.send_dds(io);
                io.end_critical_section();
                self.shift_out_level_sr(io, 0);
                io.delay_ms(5);
                self.level_range = false;
            }

            scaled
        } else {
            self.set_attn_sw(false);
            self.level_range = true;
            (self.dac_level * self.level_scale_high).round() as i16
        };

        self.wave_cmd = match wave {
            Waveform::Sine => DDS_SINE_CMD,
            Waveform::Triangle => DDS_TRIANGLE_CMD,
            Waveform::Square => {
                self.set_square_sw(true);
                DDS_SQUARE_CMD
            }
            Waveform::Logic => {
                self.set_square_sw(true);
                if self.board_has_two_shift_registers {
                    my_offset = (self.dac_level * self.pwr_gain * 1.414_21).round() as i32;
                    self.set_offs_sw(false);
                } else {
                    self.set_logic_sw(true);
                }
                DDS_SQUARE_CMD
            }
            Waveform::External(_) => {
                self.set_ext_on(true);
                DDS_RESET_CMD
            }
            Waveform::Off => DDS_RESET_CMD,
        };

        self.shift_out_1257(io, (my_offset / 5) as i16);
        self.shift_out_level_sr(io, my_level);

        self.dds_frequency_word = Self::dds_tuning_word_integer(self.frequency_tenths_hz);

        io.begin_critical_section();
        self.send_tuning_word(io, self.dds_frequency_word as u32);
        self.dss_cmd = self.wave_cmd;
        self.send_dds(io);
        io.end_critical_section();
    }

    pub fn dds_tuning_word_integer(frequency_tenths_hz: i32) -> i32 {
        let mut acc = 0_i32;
        for (digit, factor) in Self::decimal_digits(frequency_tenths_hz, FHZ_INT.len())
            .into_iter()
            .zip(FHZ_INT)
        {
            acc += factor * i32::from(digit);
        }
        acc
    }

    pub fn dds_tuning_word_sqg(frequency_tenths_hz: i32) -> i32 {
        let mut acc = 0.0_f32;
        for (digit, factor) in Self::decimal_digits(frequency_tenths_hz, FHZ_SQG.len())
            .into_iter()
            .zip(FHZ_SQG)
        {
            acc += factor * f32::from(digit);
        }
        acc as i32
    }

    pub fn dds_frequency_frames(tuning_word: u32) -> [u16; 2] {
        [
            ((tuning_word & 0x3fff) as u16) | DDS_FREQ_REGISTER_WRITE,
            (((tuning_word >> 14) & 0x3fff) as u16) | DDS_FREQ_REGISTER_WRITE,
        ]
    }

    fn send_tuning_word<IO: DdsHardwareIo>(&mut self, io: &mut IO, tuning_word: u32) {
        let [low_frame, high_frame] = Self::dds_frequency_frames(tuning_word);
        self.dss_cmd = low_frame;
        self.send_dds(io);
        self.dss_cmd = high_frame;
        self.send_dds(io);
    }

    fn shift_byte_msb_first<IO: DdsHardwareIo>(
        &self,
        io: &mut IO,
        data_port: PortKind,
        clock_port: PortKind,
        value: u8,
    ) {
        let mut shift = value;
        for _ in 0..8 {
            if shift & 0x80 != 0 {
                io.set_bit(data_port, B_SDATAOUT);
            }
            io.set_bit(clock_port, B_SCLK);
            shift <<= 1;
            io.clear_bit(data_port, B_SDATAOUT);
            io.clear_bit(clock_port, B_SCLK);
        }
    }

    fn decimal_digits(value: i32, width: usize) -> Vec<u8> {
        let normalized = value.max(0);
        format!("{normalized:0width$}")
            .bytes()
            .map(|byte| byte.saturating_sub(b'0'))
            .collect()
    }

    fn set_led_switch<IO: DdsHardwareIo>(&self, io: &mut IO, high: bool) {
        if high {
            io.set_bit(PortKind::LedOut, LED_SWITCH_BIT);
        } else {
            io.clear_bit(PortKind::LedOut, LED_SWITCH_BIT);
        }
    }

    fn set_square_sw(&mut self, high: bool) {
        let bit = if self.board_has_two_shift_registers {
            TWO_SR_SQUARE_SW_BIT
        } else {
            THREE_SR_SQUARE_SW_BIT
        };
        self.set_switch_bit(bit, high);
    }

    fn set_attn_sw(&mut self, high: bool) {
        let bit = if self.board_has_two_shift_registers {
            TWO_SR_ATTN_SW_BIT
        } else {
            THREE_SR_ATTN_SW_BIT
        };
        self.set_switch_bit(bit, high);
    }

    fn set_ext_on(&mut self, high: bool) {
        let bit = if self.board_has_two_shift_registers {
            TWO_SR_EXT_ON_BIT
        } else {
            THREE_SR_EXT_ON_BIT
        };
        self.set_switch_bit(bit, high);
    }

    fn set_offs_sw(&mut self, high: bool) {
        let bit = if self.board_has_two_shift_registers {
            TWO_SR_OFFS_SW_BIT
        } else {
            THREE_SR_OFFS_SW_BIT
        };
        self.set_switch_bit(bit, high);
    }

    fn set_logic_sw(&mut self, high: bool) {
        if !self.board_has_two_shift_registers {
            self.set_switch_bit(THREE_SR_LOGIC_SW_BIT, high);
        }
    }

    fn set_switch_bit(&mut self, bit: u8, high: bool) {
        if high {
            self.switch_state |= 1 << bit;
        } else {
            self.switch_state &= !(1 << bit);
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    struct MockIo;

    impl DdsHardwareIo for MockIo {
        fn set_bit(&mut self, _port: PortKind, _bit: u8) {}
        fn clear_bit(&mut self, _port: PortKind, _bit: u8) {}
        fn delay_units(&mut self, _units: u8) {}
        fn delay_ms(&mut self, _milliseconds: u16) {}
        fn begin_critical_section(&mut self) {}
        fn end_critical_section(&mut self) {}
    }

    #[test]
    fn integer_tuning_word_matches_pascal_digit_sum() {
        assert_eq!(DdsHardwareState::dds_tuning_word_integer(10_000), 64_000);
        assert_eq!(DdsHardwareState::dds_tuning_word_integer(12_345_670), 79_012_288);
    }

    #[test]
    fn tuning_word_is_split_into_ad9833_frequency_frames() {
        let frames = DdsHardwareState::dds_frequency_frames(0x0123_4567);
        assert_eq!(frames, [0x4567, 0x448d]);
    }

    #[test]
    fn set_level_dds_runs_without_touching_other_state_files() {
        let mut state = DdsHardwareState {
            dac_level: 80.0,
            frequency_tenths_hz: 10_000,
            ..Default::default()
        };
        let mut io = MockIo;
        state.set_level_dds(&mut io, Waveform::Sine);
        assert_eq!(state.dds_frequency_word, 64_000);
    }
}
