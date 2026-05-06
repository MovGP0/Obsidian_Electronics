//! Best-effort Rust port of `DCG.pas`.
//!
//! This keeps the original firmware split visible in Rust:
//! command tables, EEPROM-backed calibration, runtime state, serial/LCD
//! formatting, range switching, and the top-level service loop.

#![allow(dead_code)]

use std::fmt::Write as _;

pub type Float = f32;

pub const PROC_CLOCK: u32 = 16_000_000;
pub const VERS1_STR: &str = "2.92 [DCG by CM/c't 05/2010]";
pub const VERS3_STR: &str = "DCG 2.92";
pub const ADR_STR: &str = "Adr ";
pub const ERR_SUB_CH: u8 = 255;

pub const CMD_STR_ARR: [&str; 27] = [
    "STR", "IDN", "CHN", "VAL", "DCV", "DCA", "MAH", "MWH", "MSV", "MSA", "MSW", "PCV", "PCA",
    "RON", "ROF", "RIP", "RAW", "DSP", "OFS", "SCL", "OPT", "ALL", "TMP", "WEN", "ERC", "SBD",
    "NOP",
];

pub const CMD2_SUB_CH_ARR: [u8; 27] = [
    255, 254, 253, 0, 0, 1, 7, 8, 10, 11, 18, 20, 21, 27, 28, 29, 50, 80, 100, 200, 150, 99,
    233, 250, 251, 252, 0,
];

pub const ERR_STR_ARR: [&str; 8] = [
    "[OK]",
    "[SRQUSR]",
    "[BUSY]",
    "[OVRLD]",
    "[CMDERR]",
    "[PARERR]",
    "[LOCKED]",
    "[CHKSUM]",
];

pub const FAULT_STR_ARR: [&str; 4] = ["[OVRPOWR]", "[FUSEBLW]", "[OVRVOLT]", "[OVRTEMP]"];

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum CmdWhich {
    Str,
    Idn,
    Chn,
    Val,
    Dcv,
    Dca,
    Mah,
    Mwh,
    Msv,
    Msa,
    Msw,
    Pcv,
    Pca,
    Pwon,
    Pwoff,
    Rip,
    Raw,
    Dsp,
    Ofs,
    Scl,
    Opt,
    All,
    Tmp,
    Wen,
    Erc,
    Sbd,
    Nop,
    Err,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Modify {
    Ampere,
    Volt,
    Ripple,
    TOn,
    TOff,
    TrackCh,
    CapMenu,
    PwrMenu,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
#[repr(u8)]
pub enum ErrorCode {
    NoErr = 0,
    UserReq = 1,
    BusyErr = 2,
    OvlErr = 3,
    SyntaxErr = 4,
    ParamErr = 5,
    LockedErr = 6,
    ChecksumErr = 7,
    FuseErr = 8,
    FaultErr = 9,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum CurrentRange {
    Dc2mA,
    Dc20mA,
    Dc200mA,
    Dc2A,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum VoltageRange {
    ULow,
    UHigh,
}

#[derive(Debug, Clone)]
pub struct EepromData {
    pub dac_u_offsets: [i16; 2],
    pub dac_u_scales: [Float; 2],
    pub dac_i_offsets: [i16; 4],
    pub dac_i_scales: [Float; 4],
    pub adc_u_offsets: [i16; 2],
    pub adc_u_scales: [Float; 2],
    pub adc_i_offsets: [i16; 4],
    pub adc_i_scales: [Float; 4],
    pub option_array: [Float; 25],
    pub ee_ser_baud_reg: u8,
    pub inc_rast_def: i16,
}

impl Default for EepromData {
    fn default() -> Self {
        Self {
            dac_u_offsets: [10, 10],
            dac_u_scales: [1.001, 1.0032],
            dac_i_offsets: [10, 10, 10, 10],
            dac_i_scales: [1.003, 1.003, 1.003, 1.003],
            adc_u_offsets: [-180, -180],
            adc_u_scales: [1.005, 1.005],
            adc_i_offsets: [-180, -180, -180, -180],
            adc_i_scales: [1.0, 1.0, 1.0, 1.0],
            option_array: [
                5.0, 0.02, 3.0, 3.0, 20.0, 2.0, 250.0, 0.05, 1.0, 0.5, 0.05, 2.0, 0.0, 0.0,
                1.0, 1.0, 5.0, 70.0, 0.0, 0.0, 1.0, 1.0, 1.0, 1.0, 0.0,
            ],
            ee_ser_baud_reg: 51,
            inc_rast_def: 4,
        }
    }
}

#[derive(Debug, Default, Clone, Copy)]
pub struct RuntimeStatus {
    pub error_low_nibble: u8,
    pub ee_unlocked: bool,
    pub overload_flag: bool,
    pub user_srq_flag: bool,
    pub busy_flag: bool,
}

impl RuntimeStatus {
    pub fn as_byte(self) -> u8 {
        // STR responses in the Pascal firmware packed the status byte as
        // Busy/UserSRQ/Overload-or-CurrentLimit/WriteEnable plus the low
        // nibble carrying the current fault or parser error code.
        (self.error_low_nibble & 0x0f)
            | ((self.ee_unlocked as u8) << 4)
            | ((self.overload_flag as u8) << 5)
            | ((self.user_srq_flag as u8) << 6)
            | ((self.busy_flag as u8) << 7)
    }
}

pub trait DcgHardware {
    fn read_adc10(&mut self, channel_1_based: u8) -> i16;
    fn read_adc16_voltage(&mut self) -> u16;
    fn read_adc16_current(&mut self) -> u16;
    fn set_voltage_dac_raw(&mut self, raw: u16);
    fn set_current_dac_raw(&mut self, raw: u16);
    fn set_current_range(&mut self, range: CurrentRange);
    fn set_voltage_range(&mut self, range: VoltageRange);
    fn set_output_enabled(&mut self, enabled: bool);
    fn read_temp_c(&mut self) -> Option<Float>;
    fn serial_write(&mut self, text: &str);
    fn lcd_write_line(&mut self, row: u8, text: &str);
}

#[derive(Debug, Clone)]
pub struct DeviceState<H> {
    pub hw: H,
    pub eeprom: EepromData,
    pub status: RuntimeStatus,
    pub main_channel: u8,
    pub display_sub_channel: u8,
    pub voltage_set: Float,
    pub current_set: Float,
    pub measured_voltage: Float,
    pub measured_current: Float,
    pub measured_power: Float,
    pub input_voltage: Float,
    pub capacity_mah: Float,
    pub capacity_mwh: Float,
    pub ripple_percent: Float,
    pub pw_on_time_ms: u16,
    pub pw_off_time_ms: u16,
    // 255 disabled tracking in Pascal; 0..7 addressed another PSU module.
    pub track_channel: u8,
    pub current_range: CurrentRange,
    pub voltage_range: VoltageRange,
    // Active front-panel edit page for the encoder/button UI.
    pub panel_modify: Modify,
    pub temperature_c: Option<Float>,
    pub locked: bool,
    pub output_enabled: bool,
    pub ser_input: String,
    pub param_str: String,
}

impl<H: DcgHardware> DeviceState<H> {
    pub fn new(hw: H) -> Self {
        Self {
            hw,
            eeprom: EepromData::default(),
            status: RuntimeStatus::default(),
            main_channel: 0,
            display_sub_channel: 0,
            voltage_set: 5.0,
            current_set: 0.02,
            measured_voltage: 0.0,
            measured_current: 0.0,
            measured_power: 0.0,
            input_voltage: 0.0,
            capacity_mah: 0.0,
            capacity_mwh: 0.0,
            ripple_percent: 0.0,
            pw_on_time_ms: 0,
            pw_off_time_ms: 0,
            track_channel: 0,
            current_range: CurrentRange::Dc20mA,
            voltage_range: VoltageRange::ULow,
            panel_modify: Modify::Volt,
            temperature_c: None,
            locked: false,
            output_enabled: false,
            ser_input: String::new(),
            param_str: String::new(),
        }
    }

    pub fn set_lm75_temp(&mut self) {
        // Pascal programmed the LM75 fan threshold and a 3 C hysteresis band
        // through Tos/Thyst when the DCP/LM75 option bit was present.
    }

    pub fn get_lm75_temp(&mut self) {
        // The original code polled the LM75 on a slow cadence because the
        // device has about 100 ms conversion latency.
        self.temperature_c = self.hw.read_temp_c();
    }

    pub fn init_scales(&mut self) {}

    pub fn set_shunt(&mut self, range: CurrentRange) {
        self.current_range = range;
        self.hw.set_current_range(range);
    }

    pub fn calc_range_i(&mut self) {
        // Pick the smallest shunt range that still covers the requested
        // current so the matching EEPROM offset/scale table stays valid.
        self.current_range = if self.current_set < 0.002 {
            CurrentRange::Dc2mA
        } else if self.current_set < 0.02 {
            CurrentRange::Dc20mA
        } else if self.current_set < 0.2 {
            CurrentRange::Dc200mA
        } else {
            CurrentRange::Dc2A
        };
        self.hw.set_current_range(self.current_range);
    }

    pub fn set_level_dac(&mut self) {
        // Pascal handled shunt changes before loading the current DAC,
        // including a short blanking interval so the relay switch settled.
        let v_scale = match self.voltage_range {
            VoltageRange::ULow => self.eeprom.dac_u_scales[0],
            VoltageRange::UHigh => self.eeprom.dac_u_scales[1],
        };
        let i_scale = self.eeprom.dac_i_scales[self.current_range as usize];
        // Convert engineering units back into DAC codes with the per-range
        // calibration constants stored in EEPROM.
        let v_raw = (self.voltage_set * 1000.0 * v_scale).clamp(0.0, 65535.0) as u16;
        let i_raw = (self.current_set * 1000.0 * i_scale).clamp(0.0, 65535.0) as u16;
        self.hw.set_voltage_dac_raw(v_raw);
        self.hw.set_current_dac_raw(i_raw);
    }

    pub fn get_voltage(&mut self) {
        // The ADC voltage path is interpreted with a range-specific offset and
        // scale; Pascal also exposed an integrated voltage on a separate subchannel.
        let raw = self.hw.read_adc16_voltage() as i32 + self.eeprom.adc_u_offsets[self.voltage_range as usize] as i32;
        self.measured_voltage = raw as Float * 0.001 * self.eeprom.adc_u_scales[self.voltage_range as usize];
    }

    pub fn get_input_voltage(&mut self) {
        // ADC channel 5 was the supply/fuse-health sense input in Pascal, not
        // the regulated output voltage.
        self.input_voltage = self.hw.read_adc10(5) as Float * 0.01;
    }

    pub fn get_current(&mut self) {
        // Current uses the selected shunt range and then derives power from
        // the measured U/I pair for panel display and overload checks.
        let raw = self.hw.read_adc16_current() as i32 + self.eeprom.adc_i_offsets[self.current_range as usize] as i32;
        self.measured_current = raw as Float * 0.001 * self.eeprom.adc_i_scales[self.current_range as usize];
        self.measured_power = self.measured_voltage * self.measured_current;
    }

    pub fn inc_fac_i(&mut self, delta: Float) {
        self.current_set = (self.current_set + delta).max(0.0);
    }

    pub fn inc_fac_u(&mut self, delta: Float) {
        self.voltage_set = (self.voltage_set + delta).max(0.0);
    }

    pub fn round_inc_param(&mut self) {}

    pub fn set_acc_param(&mut self) {}

    pub fn ser_crlf(&mut self) {
        self.hw.serial_write("\r\n");
    }

    pub fn write_ch_prefix(&mut self) {
        let mut line = String::new();
        let _ = write!(&mut line, "{}{}:", ADR_STR, self.main_channel);
        self.hw.serial_write(&line);
    }

    pub fn write_ser_inp(&mut self) {
        self.hw.serial_write(&self.ser_input);
    }

    pub fn ser_prompt(&mut self, err: ErrorCode) {
        let index = (err as usize).min(ERR_STR_ARR.len().saturating_sub(1));
        self.hw.serial_write(ERR_STR_ARR[index]);
        self.ser_crlf();
    }

    pub fn param_to_str(&self, value: Float) -> String {
        format!("{value:.3}")
    }

    pub fn send_track_cmd(&mut self) {}

    pub fn set_cursor(&mut self, _full_cursor: bool) {}

    pub fn ist_leistung_on_lcd(&mut self) {
        self.hw.lcd_write_line(0, &format!("P {:>6.2}", self.measured_power));
    }

    pub fn cap_on_lcd(&mut self) {
        self.hw.lcd_write_line(1, &format!("Ah {:>5.2}", self.capacity_mah));
    }

    pub fn spannung_on_lcd(&mut self) {
        self.hw.lcd_write_line(0, &format!("U {:>6.3}", self.voltage_set));
    }

    pub fn ist_spannung_on_lcd(&mut self) {
        self.hw.lcd_write_line(0, &format!("U {:>6.3}", self.measured_voltage));
    }

    pub fn soll_spannung_on_lcd(&mut self) {
        self.hw.lcd_write_line(0, &format!("Us{:>6.3}", self.voltage_set));
    }

    pub fn prefix_i(&self, ma_display: bool) -> &'static str {
        if ma_display { "mA" } else { "A" }
    }

    pub fn param_str_on_lcd_lower(&mut self) {
        self.hw.lcd_write_line(1, &self.param_str);
    }

    pub fn faults_on_lcd(&mut self) {
        // The lower LCD row showed compact fault mnemonics; in the original
        // firmware the overload bit also doubled as a current-limit indicator.
        if self.status.overload_flag {
            self.hw.lcd_write_line(1, FAULT_STR_ARR[0]);
        }
    }

    pub fn strom_on_lcd(&mut self) {
        self.hw.lcd_write_line(1, &format!("I {:>6.3}", self.current_set));
    }

    pub fn ist_strom_on_lcd(&mut self) {
        self.hw.lcd_write_line(1, &format!("I {:>6.3}", self.measured_current));
    }

    pub fn soll_strom_on_lcd(&mut self) {
        self.hw.lcd_write_line(1, &format!("Is{:>6.3}", self.current_set));
    }

    pub fn integer_on_lcd(&mut self, value: i32) {
        self.hw.lcd_write_line(1, &format!("{value:>8}"));
    }

    pub fn options_on_lcd(&mut self) {
        self.hw.lcd_write_line(1, "OPT");
    }

    pub fn werte_on_lcd(&mut self) {
        // The default panel page showed measured U/I. In ripple mode Pascal
        // alternated the voltage readout between the main setpoint and the
        // reduced off-time value while not in current limiting.
        self.ist_spannung_on_lcd();
        self.ist_strom_on_lcd();
    }

    pub fn write_param_ser(&mut self, value: Float) {
        self.hw.serial_write(&self.param_to_str(value));
    }

    pub fn write_param_int_ser(&mut self, value: i32) {
        self.hw.serial_write(&value.to_string());
    }

    pub fn check_limits(&mut self) -> ErrorCode {
        if self.locked {
            return ErrorCode::LockedErr;
        }
        // These are the coarse parser/panel limits from the original module:
        // final EEPROM-based range hysteresis and ripple handling lived elsewhere.
        if self.voltage_set > 20.0 || self.current_set > 2.0 {
            self.status.overload_flag = true;
            return ErrorCode::OvlErr;
        }
        ErrorCode::NoErr
    }

    pub fn switch_relais(&mut self) {
        // Pascal switched the voltage relay with explicit thresholds and
        // hysteresis to avoid chatter near the boundary. This port keeps the
        // same low/high intent but collapses it to a simple threshold.
        self.voltage_range = if self.voltage_set < 2.0 {
            VoltageRange::ULow
        } else {
            VoltageRange::UHigh
        };
        self.hw.set_voltage_range(self.voltage_range);
    }

    pub fn fault_check(&mut self) {
        // The original routine also handled LM75 overtemperature shutdown and
        // relay drop-out; only the power-based overload remains here.
        self.status.overload_flag = self.measured_power > 40.0;
    }

    pub fn chores(&mut self) {
        self.get_lm75_temp();
        self.get_voltage();
        self.get_current();
        self.get_input_voltage();
        self.fault_check();
        self.werte_on_lcd();
    }

    pub fn check_ser(&mut self) {
        // Pascal drained serial input with a 20 ms character timeout and
        // treated carriage return as the command boundary.
    }

    pub fn check_delay(&mut self, _delay_ms: u8) {
        // Delay loops called CheckSer repeatedly so long waits did not starve
        // the command parser, LCD refresh, or periodic measurement updates.
        self.chores();
    }

    pub fn init_all(&mut self) {
        self.switch_relais();
        self.calc_range_i();
        self.set_level_dac();
        self.hw.set_output_enabled(self.output_enabled);
        self.hw.serial_write(VERS1_STR);
        self.ser_crlf();
    }
}
