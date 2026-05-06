//! Best-effort Rust port of `DDS-HW.pas`.
//!
//! The original Pascal unit bit-bangs an AD9833 DDS, a LTC1257 offset DAC,
//! a 4094 shift register chain, and an auxiliary serial output. This port
//! keeps the hardware-facing constants and routines readable while replacing
//! direct AVR register access with a small I/O trait.

use core::marker::PhantomData;

use crate::avrd_support::{Atmega32, AvrdPortIo, Mcu, RegisterPort};

#[cfg(target_arch = "avr")]
const AVR_SREG_ADDRESS: *mut u8 = 0x5f as *mut u8;
#[cfg(target_arch = "avr")]
const AVR_SREG_INTERRUPT_ENABLE_MASK: u8 = 0x80;

pub const SER_AUX_DELAY_CYCLES_PER_UNIT: u16 = 160;

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
    fn nop(&mut self);
    fn delay_units(&mut self, units: u8);
    fn delay_ms(&mut self, milliseconds: u16);
    fn begin_critical_section(&mut self);
    fn end_critical_section(&mut self);
}

pub struct DdsAvrd<M: Mcu> {
    io: AvrdPortIo<M>,
    saved_status: u8,
    _marker: PhantomData<M>,
}

pub type DdsAtmega32 = DdsAvrd<Atmega32>;

impl<M: Mcu> Default for DdsAvrd<M> {
    fn default() -> Self {
        Self {
            io: AvrdPortIo::default(),
            saved_status: 0,
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

    fn nop(&mut self) {
        self.io.spin_delay_cycles(1);
    }

    fn delay_units(&mut self, units: u8) {
        self.io
            .spin_delay_cycles(u16::from(units) * SER_AUX_DELAY_CYCLES_PER_UNIT);
    }

    fn delay_ms(&mut self, milliseconds: u16) {
        for _ in 0..milliseconds {
            self.io.spin_delay_cycles(16_000);
        }
    }

    fn begin_critical_section(&mut self) {
        #[cfg(target_arch = "avr")]
        {
            self.saved_status = unsafe { core::ptr::read_volatile(AVR_SREG_ADDRESS) };
            unsafe {
                core::ptr::write_volatile(
                    AVR_SREG_ADDRESS,
                    self.saved_status & !AVR_SREG_INTERRUPT_ENABLE_MASK,
                );
            }
        }
    }

    fn end_critical_section(&mut self) {
        #[cfg(target_arch = "avr")]
        unsafe {
            core::ptr::write_volatile(AVR_SREG_ADDRESS, self.saved_status);
        }

        #[cfg(not(target_arch = "avr"))]
        {
            let _ = self.saved_status;
        }
    }
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

        // Auxiliary 19.2 kBd serial output for the MP3 player.
        // The Pascal code sends a start bit, then shifts bit 0 first.
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
        // The offset DAC is wired around midscale, so 0 V lives at FS/2.
        // Negative offsets are therefore corrected by adding 0x800 first.
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
            io.nop();
            io.clear_bit(PortKind::ControlBit, B_SDATAOUT);
            io.clear_bit(PortKind::ControlBit, B_SCLK);
        }

        io.set_bit(PortKind::ControlBit, B_STRDAC);
    }

    pub fn shift_out_level_sr<IO: DdsHardwareIo>(&mut self, io: &mut IO, my_level_sr: i16) {
        // The 4094 chain carries relay state first and the attenuator level bytes after it.
        self.level_byte_hi = ((my_level_sr as u16 >> 8) & 0x00ff) as u8;
        self.level_byte_lo = (my_level_sr as u16 & 0x00ff) as u8;

        if self.board_has_two_shift_registers {
            // On the 2-SR board the relay bits are merged into the upper level byte.
            self.level_byte_hi |= self.switch_state;
        }

        io.clear_bit(PortKind::DdsOut, B_SCLK);
        io.clear_bit(PortKind::DdsOut, B_SDATAOUT);

        self.shift_byte_msb_first(io, PortKind::DdsOut, PortKind::DdsOut, self.switch_state);
        self.shift_byte_msb_first(io, PortKind::DdsOut, PortKind::DdsOut, self.level_byte_hi);
        self.shift_byte_msb_first(io, PortKind::DdsOut, PortKind::DdsOut, self.level_byte_lo);

        io.set_bit(PortKind::DdsOut, B_STROBE);
        io.nop();
        io.nop();
        io.clear_bit(PortKind::DdsOut, B_STROBE);
        io.set_bit(PortKind::DdsOut, B_SCLK);
    }

    pub fn send_dds<IO: DdsHardwareIo>(&self, io: &mut IO) {
        io.set_bit(PortKind::DdsOut, B_SCLK);
        io.clear_bit(PortKind::ControlBit, B_SDATAOUT);
        io.clear_bit(PortKind::DdsOut, B_FSYNC);

        // AD9833 writes are 16-bit frames with the high byte shifted first.
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

        // The Pascal SQG variant does not recompute or clear the level payload before
        // committing the relay selection. Preserve the existing shift-register payload
        // bytes and only merge the current relay bits in ShiftOutLevelSR.
        let retained_level_payload =
            ((u16::from(self.level_byte_hi) << 8) | u16::from(self.level_byte_lo)) as i16;
        self.shift_out_level_sr(io, retained_level_payload);

        // The SQG variant builds the tuning word from decimal digits using floating-point factors.
        self.dds_frequency_word = Self::dds_tuning_word_sqg(self.frequency_tenths_hz);

        io.begin_critical_section();
        self.send_tuning_word(io, self.dds_frequency_word as u32);
        self.dss_cmd = self.wave_cmd;
        self.send_dds(io);
        io.end_critical_section();
    }

    pub fn set_level_dds<IO: DdsHardwareIo>(&mut self, io: &mut IO, wave: Waveform) {
        self.switch_state = 0;
        // Zero the level bytes first to suppress switching clicks while the relays move.
        self.level_byte_hi = 0;
        self.level_byte_lo = 0;

        let mut my_offset = self.offset_mv;

        if my_offset == 0 {
            // Zero offset opens the DC offset relay path and turns the indicator LED off.
            self.set_offs_sw(true);
            self.set_led_switch(io, true);
        } else {
            self.set_led_switch(io, false);
        }

        let my_level = if self.dac_level < self.attn_switch_point {
            // Below the threshold the AC path goes back to full-scale and uses the 1/40 attenuator relay.
            let scaled = (self.dac_level * self.attn_fac * self.level_scale_low).round() as i16;
            self.set_attn_sw(true);

            if self.level_range {
                self.dss_cmd = DDS_RESET_CMD;
                io.begin_critical_section();
                self.send_dds(io); // Briefly mute the DDS before the range relay flips.
                io.end_critical_section();
                self.shift_out_level_sr(io, 0); // Commit relay state, then wait for contacts to settle.
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
                    // The 2-SR logic variant reuses the offset DAC as a power/output level helper.
                    my_offset = (self.dac_level * self.pwr_gain * 1.414_21).round() as i32;
                    self.set_offs_sw(false);
                } else {
                    self.set_logic_sw(true);
                }
                DDS_SQUARE_CMD
            }
            Waveform::External(_) => {
                // External/audio modes disable DDS generation and only gate the external path.
                self.set_ext_on(true);
                DDS_RESET_CMD
            }
            Waveform::Off => DDS_RESET_CMD,
        };

        self.shift_out_1257(io, (my_offset / 5) as i16); // FS = 10 V, so one DAC count is 5 mV.
        self.shift_out_level_sr(io, my_level);

        // The original firmware derives the AD9833 tuning word by summing decimal-digit factors.
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

    #[derive(Clone, Copy, Debug, PartialEq, Eq)]
    enum Event {
        SetBit(PortKind, u8),
        ClearBit(PortKind, u8),
        Nop,
        DelayUnits(u8),
        DelayMs(u16),
        BeginCriticalSection,
        EndCriticalSection,
    }

    #[derive(Default)]
    struct MockIo {
        events: Vec<Event>,
    }

    impl MockIo {
        fn count_events(&self, expected: Event) -> usize {
            self.events
                .iter()
                .filter(|event| **event == expected)
                .count()
        }

        fn event_index(&self, expected: Event) -> usize {
            self.events
                .iter()
                .position(|event| *event == expected)
                .expect("event was not recorded")
        }

        fn shift_register_bytes(&self) -> Vec<u8> {
            let mut data_high = false;
            let mut bits = Vec::new();

            for event in &self.events {
                match event {
                    Event::SetBit(PortKind::DdsOut, B_SDATAOUT) => {
                        data_high = true;
                    }
                    Event::ClearBit(PortKind::DdsOut, B_SDATAOUT) => {
                        data_high = false;
                    }
                    Event::SetBit(PortKind::DdsOut, B_SCLK) => {
                        bits.push(u8::from(data_high));
                    }
                    Event::SetBit(PortKind::DdsOut, B_STROBE) => {
                        break;
                    }
                    _ => {}
                }
            }

            bits.chunks_exact(8)
                .map(|chunk| {
                    chunk
                        .iter()
                        .fold(0_u8, |byte, bit| (byte << 1) | bit)
                })
                .collect()
        }
    }

    impl DdsHardwareIo for MockIo {
        fn set_bit(&mut self, port: PortKind, bit: u8) {
            self.events.push(Event::SetBit(port, bit));
        }

        fn clear_bit(&mut self, port: PortKind, bit: u8) {
            self.events.push(Event::ClearBit(port, bit));
        }

        fn nop(&mut self) {
            self.events.push(Event::Nop);
        }

        fn delay_units(&mut self, units: u8) {
            self.events.push(Event::DelayUnits(units));
        }

        fn delay_ms(&mut self, milliseconds: u16) {
            self.events.push(Event::DelayMs(milliseconds));
        }

        fn begin_critical_section(&mut self) {
            self.events.push(Event::BeginCriticalSection);
        }

        fn end_critical_section(&mut self) {
            self.events.push(Event::EndCriticalSection);
        }
    }

    #[test]
    fn integer_tuning_word_matches_pascal_digit_sum() {
        assert_eq!(DdsHardwareState::dds_tuning_word_integer(10_000), 64_000);
        assert_eq!(
            DdsHardwareState::dds_tuning_word_integer(12_345_670),
            79_012_288
        );
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
        let mut io = MockIo::default();
        state.set_level_dds(&mut io, Waveform::Sine);
        assert_eq!(state.dds_frequency_word, 64_000);
    }

    #[test]
    fn set_level_dds_sqg_preserves_existing_shift_register_payload() {
        let mut state = DdsHardwareState {
            dac_level: 80.0,
            level_byte_hi: 0x12,
            level_byte_lo: 0x34,
            frequency_tenths_hz: 10_000,
            ..Default::default()
        };
        let mut io = MockIo::default();

        state.set_level_dds_sqg(&mut io, Waveform::Sine);

        assert_eq!(state.switch_state, 1 << TWO_SR_ATTN_SW_BIT);
        assert_eq!(state.level_byte_hi, 0x12 | (1 << TWO_SR_ATTN_SW_BIT));
        assert_eq!(state.level_byte_lo, 0x34);
        assert_eq!(
            io.shift_register_bytes(),
            vec![state.switch_state, state.level_byte_hi, state.level_byte_lo]
        );
    }

    #[test]
    fn set_level_dds_masks_interrupts_around_pascal_dds_writes() {
        let mut state = DdsHardwareState {
            dac_level: 120.0,
            frequency_tenths_hz: 10_000,
            ..Default::default()
        };
        let mut io = MockIo::default();

        state.set_level_dds(&mut io, Waveform::Sine);

        let begin = io.event_index(Event::BeginCriticalSection);
        let end = io.event_index(Event::EndCriticalSection);
        assert!(begin < end);
        assert_eq!(io.count_events(Event::BeginCriticalSection), 1);
        assert_eq!(io.count_events(Event::EndCriticalSection), 1);
        assert_eq!(
            io.count_events(Event::ClearBit(PortKind::DdsOut, B_FSYNC)),
            3
        );
        assert_eq!(io.count_events(Event::SetBit(PortKind::DdsOut, B_FSYNC)), 3);

        for (index, event) in io.events.iter().enumerate() {
            if matches!(
                event,
                Event::ClearBit(PortKind::DdsOut, B_FSYNC)
                    | Event::SetBit(PortKind::DdsOut, B_FSYNC)
            ) {
                assert!(index > begin && index < end);
            }
        }
    }

    #[test]
    fn shift_out_1257_preserves_pascal_clock_hold_nops() {
        let mut state = DdsHardwareState::default();
        let mut io = MockIo::default();

        state.shift_out_1257(&mut io, 0);

        assert_eq!(io.count_events(Event::Nop), 12);

        let load_index = io.event_index(Event::ClearBit(PortKind::ControlBit, B_STRDAC));
        assert_eq!(io.events[load_index + 1], Event::Nop);
        assert_eq!(
            io.events[load_index + 2],
            Event::ClearBit(PortKind::ControlBit, B_SDATAOUT)
        );
        assert_eq!(
            io.events[load_index + 3],
            Event::ClearBit(PortKind::ControlBit, B_SCLK)
        );
        assert_eq!(
            io.events[load_index + 4],
            Event::SetBit(PortKind::ControlBit, B_STRDAC)
        );
    }

    #[test]
    fn shift_out_level_sr_preserves_pascal_strobe_hold_nops() {
        let mut state = DdsHardwareState::default();
        let mut io = MockIo::default();

        state.shift_out_level_sr(&mut io, 0x1234);

        let strobe_index = io.event_index(Event::SetBit(PortKind::DdsOut, B_STROBE));
        assert_eq!(io.events[strobe_index + 1], Event::Nop);
        assert_eq!(io.events[strobe_index + 2], Event::Nop);
        assert_eq!(
            io.events[strobe_index + 3],
            Event::ClearBit(PortKind::DdsOut, B_STROBE)
        );
        assert_eq!(
            io.events[strobe_index + 4],
            Event::SetBit(PortKind::DdsOut, B_SCLK)
        );
    }

    #[test]
    fn ser_aux_preserves_pascal_mp3_serial_bit_timing() {
        let state = DdsHardwareState::default();
        let mut io = MockIo::default();

        state.ser_aux(&mut io, 0b1010_0101);

        let delays: Vec<u8> = io
            .events
            .iter()
            .filter_map(|event| match event {
                Event::DelayUnits(units) => Some(*units),
                _ => None,
            })
            .collect();
        let serial_edges: Vec<Event> = io
            .events
            .iter()
            .copied()
            .filter(|event| {
                matches!(
                    event,
                    Event::SetBit(PortKind::Extension, B_SER_AUX)
                        | Event::ClearBit(PortKind::Extension, B_SER_AUX)
                )
            })
            .collect();

        assert_eq!(delays, [5, 5, 5, 5, 5, 5, 5, 5, 5, 10]);
        assert_eq!(
            serial_edges,
            [
                Event::ClearBit(PortKind::Extension, B_SER_AUX),
                Event::SetBit(PortKind::Extension, B_SER_AUX),
                Event::ClearBit(PortKind::Extension, B_SER_AUX),
                Event::SetBit(PortKind::Extension, B_SER_AUX),
                Event::ClearBit(PortKind::Extension, B_SER_AUX),
                Event::ClearBit(PortKind::Extension, B_SER_AUX),
                Event::SetBit(PortKind::Extension, B_SER_AUX),
                Event::ClearBit(PortKind::Extension, B_SER_AUX),
                Event::SetBit(PortKind::Extension, B_SER_AUX),
                Event::SetBit(PortKind::Extension, B_SER_AUX),
            ]
        );
    }
}
