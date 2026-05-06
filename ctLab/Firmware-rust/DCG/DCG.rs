//! Best-effort Rust port of `DCG.pas`.
//!
//! This keeps the original firmware split visible in Rust:
//! command tables, EEPROM-backed calibration, runtime state, serial/LCD
//! formatting, range switching, and the top-level service loop.

#![allow(dead_code)]

pub type Float = f32;

pub const PROC_CLOCK: u32 = 16_000_000;
pub const VERS1_STR: &str = "2.92 [DCG by CM/c't 05/2010]";
pub const VERS3_STR: &str = "DCG 2.92";
pub const ADR_STR: &str = "Adr ";
pub const ERR_SUB_CH: u8 = 255;

const OPTION_ARRAY_LEN: usize = 25;
const OPT_INIT_VOLT: usize = 0;
const OPT_INIT_AMP: usize = 1;
const OPT_INIT_GAIN_PRE: usize = 2;
const OPT_INIT_GAIN_OUT: usize = 3;
const OPT_INIT_GAIN_I: usize = 4;
const OPT_UREF: usize = 5;
const OPT_UMAX: usize = 6;
const OPT_RSENSE_BASE: usize = 7;
const OPT_IMAX_BASE: usize = 11;
const OPT_ADCUFAC_BASE: usize = 15;
const OPT_INIT_OPTIONS: usize = 17;
const OPT_INIT_SWITCH_U: usize = 18;
const OPT_INIT_HYST_LOW: usize = 19;
const OPT_INIT_HYST_HIGH: usize = 20;
const OPT_INIT_FAN_ON_TEMP: usize = 21;
const OPT_INIT_RIPPLE_PERCENT: usize = 22;
const OPT_INIT_TON_TIME: usize = 23;
const OPT_INIT_TOFF_TIME: usize = 24;

const DAC16_PRESENT_BIT: u8 = 1 << 0;
const ADC16_PRESENT_BIT: u8 = 1 << 1;
const DCP_PRESENT_BIT: u8 = 1 << 2;
const INCR_ACC_ARRAY: [i32; 16] = [
    0, 1, 2, 5, 10, 25, 50, 100, 250, 500, 1_000, 2_500, 5_000, 10_000, 25_000, 25_000,
];

pub const CMD_STR_ARR: [&str; 27] = [
    "STR", "IDN", "CHN", "VAL", "DCV", "DCA", "MAH", "MWH", "MSV", "MSA", "MSW", "PCV", "PCA",
    "RON", "ROF", "RIP", "RAW", "DSP", "OFS", "SCL", "OPT", "ALL", "TMP", "WEN", "ERC", "SBD",
    "NOP",
];

pub const CMD2_SUB_CH_ARR: [u8; 27] = [
    255, 254, 253, 0, 0, 1, 7, 8, 10, 11, 18, 20, 21, 27, 28, 29, 50, 80, 100, 200, 150, 99, 233,
    250, 251, 252, 0,
];

pub const ERR_STR_ARR: [&str; 8] = [
    "[OK]", "[SRQUSR]", "[BUSY]", "[OVRLD]", "[CMDERR]", "[PARERR]", "[LOCKED]", "[CHKSUM]",
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
#[repr(u8)]
pub enum CurrentRange {
    Dc2mA,
    Dc20mA,
    Dc200mA,
    Dc2A,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
#[repr(u8)]
pub enum VoltageRange {
    ULow,
    UHigh,
}

impl CurrentRange {
    fn from_index(index: usize) -> Self {
        match index {
            0 => Self::Dc2mA,
            1 => Self::Dc20mA,
            2 => Self::Dc200mA,
            _ => Self::Dc2A,
        }
    }
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
    pub option_array: [Float; OPTION_ARRAY_LEN],
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
                5.0, 0.02, 3.0, 3.0, 0.25, 2.5, 30.0, 470.0, 47.0, 4.7, 0.47, 0.002, 0.020, 0.200,
                2.000, 2.0, 6.0, 7.0, 12.1, 8.6, 8.9, 50.0, 0.0, 4.0, 6.0,
            ],
            ee_ser_baud_reg: 51,
            inc_rast_def: 4,
        }
    }
}

impl EepromData {
    pub fn init_volt(&self) -> Float {
        self.option_array[OPT_INIT_VOLT]
    }

    pub fn init_amp(&self) -> Float {
        self.option_array[OPT_INIT_AMP]
    }

    pub fn init_gain_pre(&self) -> Float {
        self.option_array[OPT_INIT_GAIN_PRE]
    }

    pub fn init_gain_out(&self) -> Float {
        self.option_array[OPT_INIT_GAIN_OUT]
    }

    pub fn init_gain_i(&self) -> Float {
        self.option_array[OPT_INIT_GAIN_I]
    }

    pub fn uref(&self) -> Float {
        self.option_array[OPT_UREF]
    }

    pub fn umax(&self) -> Float {
        self.option_array[OPT_UMAX]
    }

    pub fn rsense(&self, index: usize) -> Float {
        self.option_array[OPT_RSENSE_BASE + index.min(3)]
    }

    pub fn imax(&self, index: usize) -> Float {
        self.option_array[OPT_IMAX_BASE + index.min(3)]
    }

    pub fn adc_u_fac(&self, index: usize) -> Float {
        self.option_array[OPT_ADCUFAC_BASE + index.min(1)]
    }

    pub fn init_options(&self) -> u8 {
        self.option_array[OPT_INIT_OPTIONS] as u8
    }

    pub fn init_switch_u(&self) -> Float {
        self.option_array[OPT_INIT_SWITCH_U]
    }

    pub fn init_hyst_low(&self) -> Float {
        self.option_array[OPT_INIT_HYST_LOW]
    }

    pub fn init_hyst_high(&self) -> Float {
        self.option_array[OPT_INIT_HYST_HIGH]
    }

    pub fn init_fan_on_temp(&self) -> Float {
        self.option_array[OPT_INIT_FAN_ON_TEMP]
    }

    pub fn init_ripple_percent(&self) -> i32 {
        self.option_array[OPT_INIT_RIPPLE_PERCENT] as i32
    }

    pub fn init_ton_time(&self) -> u16 {
        self.option_array[OPT_INIT_TON_TIME] as u16
    }

    pub fn init_toff_time(&self) -> u16 {
        self.option_array[OPT_INIT_TOFF_TIME] as u16
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

#[derive(Debug, Default, Clone, Copy, PartialEq, Eq)]
pub struct FaultFlags {
    pub over_power: bool,
    pub fuse_blown: bool,
    pub over_voltage: bool,
    pub over_temp: bool,
}

impl FaultFlags {
    pub fn any(self) -> bool {
        self.bits() != 0
    }

    pub fn bits(self) -> u8 {
        (self.over_power as u8)
            | ((self.fuse_blown as u8) << 1)
            | ((self.over_voltage as u8) << 2)
            | ((self.over_temp as u8) << 3)
    }
}

#[derive(Debug, Clone)]
pub struct CalibrationScale {
    pub options: u8,
    pub dac_lsb_u: [Float; 2],
    pub dac_lsb_i: [Float; 4],
    pub adc_lsb_u: [Float; 2],
    pub adc_lsb_i: [Float; 4],
    pub dac_max: u16,
    pub switchpoint: Float,
    pub relay_low: Float,
    pub relay_high: Float,
    pub dac16_present: bool,
    pub adc16_present: bool,
    pub dcp_present: bool,
}

impl Default for CalibrationScale {
    fn default() -> Self {
        Self {
            options: 0,
            dac_lsb_u: [0.0; 2],
            dac_lsb_i: [0.0; 4],
            adc_lsb_u: [0.0; 2],
            adc_lsb_i: [0.0; 4],
            dac_max: 65_535,
            switchpoint: 0.0,
            relay_low: 0.0,
            relay_high: 0.0,
            dac16_present: false,
            adc16_present: false,
            dcp_present: false,
        }
    }
}

pub trait DcgHardware {
    fn read_adc10(&mut self, channel_1_based: u8) -> i16;
    fn read_adc16_voltage(&mut self) -> u16;
    fn read_adc16_current(&mut self) -> u16;
    fn serial_read_timeout(&mut self, _timeout_ms: u16) -> Option<char> {
        None
    }
    fn set_voltage_dac_raw(&mut self, raw: u16);
    fn set_current_dac_raw(&mut self, raw: u16);
    fn set_voltage_dac_off_raw(&mut self, raw: u16) {
        self.set_voltage_dac_raw(raw);
    }
    fn delay_ms(&mut self, _milliseconds: u16) {}
    fn set_current_range(&mut self, range: CurrentRange);
    fn set_voltage_range(&mut self, range: VoltageRange);
    fn set_input_relay_high(&mut self, _high: bool) {}
    fn current_limit_sense(&mut self) -> bool {
        true
    }
    fn set_output_enabled(&mut self, enabled: bool);
    fn read_temp_c(&mut self) -> Option<Float>;
    fn serial_write(&mut self, text: &str);
    fn lcd_write_line(&mut self, row: u8, text: &str);
}

#[derive(Debug, Clone)]
pub struct DeviceState<H> {
    pub hw: H,
    pub eeprom: EepromData,
    pub scale: CalibrationScale,
    pub status: RuntimeStatus,
    pub faults: FaultFlags,
    pub err_count: u16,
    pub button_number: u8,
    pub main_channel: u8,
    pub sub_channel: u8,
    pub display_sub_channel: u8,
    pub voltage_set: Float,
    pub current_set: Float,
    pub voltage_mod: Float,
    pub current_mod: Float,
    pub measured_voltage: Float,
    pub measured_current: Float,
    pub measured_power: Float,
    pub input_voltage: Float,
    pub capacity_mah: Float,
    pub capacity_mwh: Float,
    pub ripple_percent: Float,
    pub ripple_voltage: Float,
    pub no_toggle: bool,
    pub pw_on_time_ms: u16,
    pub pw_off_time_ms: u16,
    pub pw_counter_ms: u16,
    // 255 disabled tracking in Pascal; 0..7 addressed another PSU module.
    pub track_channel: u8,
    pub current_range: CurrentRange,
    pub voltage_range: VoltageRange,
    pub old_current_range: Option<CurrentRange>,
    pub old_voltage_range: Option<VoltageRange>,
    pub auto_current_range: CurrentRange,
    pub dac_raw_u_on: u16,
    pub dac_raw_u_off: u16,
    pub dac_raw_i: u16,
    pub relay_voltage_low: Float,
    pub relay_voltage_high: Float,
    pub relay_state_high: bool,
    pub old_relay_state_high: bool,
    pub fault_timer: u8,
    pub temperature_timer: u8,
    // Active front-panel edit page for the encoder/button UI.
    pub panel_modify: Modify,
    pub inc_rast: i32,
    pub incr_fine: bool,
    pub first_turn: bool,
    pub incr_diff: i32,
    pub incr_acc_float: Float,
    pub inc_fine_div: Float,
    pub inc_coarse_div: Float,
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
            scale: CalibrationScale::default(),
            status: RuntimeStatus::default(),
            faults: FaultFlags::default(),
            err_count: 0,
            button_number: 0,
            main_channel: 0,
            sub_channel: 0,
            display_sub_channel: 0,
            voltage_set: 5.0,
            current_set: 0.02,
            voltage_mod: 1.0,
            current_mod: 1.0,
            measured_voltage: 0.0,
            measured_current: 0.0,
            measured_power: 0.0,
            input_voltage: 0.0,
            capacity_mah: 0.0,
            capacity_mwh: 0.0,
            ripple_percent: 0.0,
            ripple_voltage: 0.0,
            no_toggle: true,
            pw_on_time_ms: 0,
            pw_off_time_ms: 0,
            pw_counter_ms: 0,
            track_channel: 255,
            current_range: CurrentRange::Dc20mA,
            voltage_range: VoltageRange::ULow,
            old_current_range: None,
            old_voltage_range: None,
            auto_current_range: CurrentRange::Dc20mA,
            dac_raw_u_on: 0,
            dac_raw_u_off: 0,
            dac_raw_i: 0,
            relay_voltage_low: 0.0,
            relay_voltage_high: 0.0,
            relay_state_high: false,
            old_relay_state_high: true,
            fault_timer: 0,
            temperature_timer: 0,
            panel_modify: Modify::Volt,
            inc_rast: 4,
            incr_fine: false,
            first_turn: true,
            incr_diff: 0,
            incr_acc_float: 0.0,
            inc_fine_div: 1_000.0,
            inc_coarse_div: 10.0,
            temperature_c: None,
            locked: false,
            output_enabled: false,
            ser_input: String::new(),
            param_str: String::new(),
        }
    }

    pub fn with_eeprom(hw: H, eeprom: EepromData) -> Self {
        let mut state = Self::new(hw);
        state.eeprom = eeprom;
        state
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

    pub fn init_scales(&mut self) {
        let options = self.eeprom.init_options();
        let dac16_present = (options & DAC16_PRESENT_BIT) != 0;
        let adc16_present = (options & ADC16_PRESENT_BIT) != 0;
        let dcp_present = (options & DCP_PRESENT_BIT) != 0;

        let uref = self.eeprom.uref();
        let gain_out = self.eeprom.init_gain_out();
        let mut u_fac = if dac16_present { 2.0 * uref } else { uref };
        let dac_steps = if dac16_present { 65_536.0 } else { 4_096.0 };
        let adc_steps = if adc16_present { 65_536.0 } else { 1_024.0 };

        self.scale.options = options;
        self.scale.dac16_present = dac16_present;
        self.scale.adc16_present = adc16_present;
        self.scale.dcp_present = dcp_present;
        self.scale.dac_max = (dac_steps as u32 - 1) as u16;
        self.scale.dac_lsb_u[0] = u_fac * gain_out / (dac_steps * self.eeprom.dac_u_scales[0]);
        self.scale.dac_lsb_u[1] = u_fac * self.eeprom.init_gain_pre() * gain_out
            / (dac_steps * self.eeprom.dac_u_scales[1]);
        for index in 0..2 {
            self.scale.adc_lsb_u[index] =
                self.eeprom.adc_u_fac(index) * self.eeprom.adc_u_scales[index] * uref * gain_out
                    / adc_steps;
        }

        u_fac *= self.eeprom.init_gain_i();
        for index in 0..4 {
            self.scale.dac_lsb_i[index] =
                (u_fac / self.eeprom.rsense(index)) / (dac_steps * self.eeprom.dac_i_scales[index]);
            self.scale.adc_lsb_i[index] = (self.eeprom.adc_i_scales[index] * uref
                / (2.0 * self.eeprom.rsense(index)))
                / adc_steps;
        }

        self.scale.switchpoint = self.eeprom.init_switch_u();
        self.scale.relay_low = self.eeprom.init_hyst_low();
        self.scale.relay_high = self.eeprom.init_hyst_high();
        self.relay_voltage_low = self.scale.relay_low;
        self.relay_voltage_high = self.scale.relay_high;
        self.voltage_mod = 1.0;
        self.ripple_percent = self.eeprom.init_ripple_percent() as Float;
        self.pw_on_time_ms = self.eeprom.init_ton_time();
        self.pw_off_time_ms = self.eeprom.init_toff_time();
        self.pw_counter_ms = self.pw_on_time_ms;
        self.inc_rast = i32::from(self.eeprom.inc_rast_def).max(1);
    }

    pub fn set_shunt(&mut self, range: CurrentRange) {
        self.current_range = range;
        self.hw.set_current_range(range);
    }

    pub fn calc_range_i(&mut self) {
        let mut range = 0usize;
        for index in 0..4 {
            if self.current_set > self.eeprom.imax(index) {
                range = (range + 1).min(3);
            }
        }
        self.current_range = CurrentRange::from_index(range);
    }

    pub fn set_level_dac(&mut self) {
        if self.scale.dac_lsb_u[0] == 0.0 || self.scale.dac_lsb_i[0] == 0.0 {
            self.init_scales();
        }
        self.calc_range_i();
        if Some(self.current_range) != self.old_current_range {
            self.dac_raw_i = 0;
            self.hw.set_current_dac_raw(0);
            self.hw.delay_ms(4);
            self.set_shunt(self.current_range);
        }
        self.old_current_range = Some(self.current_range);
        self.auto_current_range = self.current_range;

        let current_index = self.current_range as usize;
        self.dac_raw_i = self.quantize_dac(
            (self.current_set * self.current_mod) / self.scale.dac_lsb_i[current_index],
            self.eeprom.dac_i_offsets[current_index],
        );
        self.hw.set_current_dac_raw(self.dac_raw_i);

        let voltage_range = if self.voltage_set > self.scale.switchpoint {
            VoltageRange::UHigh
        } else {
            VoltageRange::ULow
        };
        self.voltage_range = voltage_range;
        if Some(voltage_range) != self.old_voltage_range {
            self.voltage_mod = 1.0;
            self.dac_raw_u_on = 0;
            self.dac_raw_u_off = 0;
            self.hw.set_voltage_dac_raw(0);
            self.hw.set_voltage_dac_off_raw(0);
            self.hw.delay_ms(4);
            self.hw.set_voltage_range(voltage_range);
        }
        self.old_voltage_range = Some(voltage_range);

        let voltage_index = voltage_range as usize;
        self.dac_raw_u_on = self.quantize_dac(
            (self.voltage_set * self.voltage_mod) / self.scale.dac_lsb_u[voltage_index],
            self.eeprom.dac_u_offsets[voltage_index],
        );
        self.hw.set_voltage_dac_raw(self.dac_raw_u_on);

        let off_raw = if self.pw_off_time_ms > 0 && self.ripple_percent > 0.0 {
            (u32::from(self.dac_raw_u_on) * (100 - self.ripple_percent as i32).max(0) as u32 / 100)
                as u16
        } else {
            self.dac_raw_u_on
        };
        self.dac_raw_u_off = off_raw;
        self.hw.set_voltage_dac_off_raw(off_raw);
    }

    fn quantize_dac(&self, raw_without_offset: Float, offset: i16) -> u16 {
        (raw_without_offset + 0.5 + Float::from(offset)).clamp(0.0, self.scale.dac_max as Float)
            as u16
    }

    pub fn get_voltage(&mut self) -> Float {
        let adc = if self.scale.adc16_present {
            self.hw.read_adc16_voltage()
        } else {
            self.hw.read_adc10(3) as u16
        };
        let raw = adc as i32 + self.eeprom.adc_u_offsets[self.voltage_range as usize] as i32;
        let value = raw as Float * self.scale.adc_lsb_u[self.voltage_range as usize];
        self.measured_voltage = value;
        value
    }

    pub fn get_input_voltage(&mut self) {
        self.input_voltage = self.hw.read_adc10(5) as Float * self.eeprom.uref() * 0.01855;
    }

    pub fn get_current(&mut self) -> Float {
        let adc = if self.scale.adc16_present {
            self.hw.read_adc16_current()
        } else {
            self.hw.read_adc10(4) as u16
        };
        let raw = adc as i32 + self.eeprom.adc_i_offsets[self.current_range as usize] as i32;
        let value = raw as Float * self.scale.adc_lsb_i[self.current_range as usize];
        self.measured_current = value;
        self.measured_power = self.measured_voltage * self.measured_current;
        value
    }

    pub fn inc_fac_i(&mut self) {
        self.inc_coarse_div = 100.0;
        self.inc_fine_div = if self.current_set >= 1.0 { 1_000.0 } else { 10_000.0 };
    }

    pub fn inc_fac_u(&mut self) {
        self.inc_coarse_div = 10.0;
        self.inc_fine_div = if self.voltage_set >= 1.0 { 100.0 } else { 1_000.0 };
    }

    pub fn round_inc_param(&mut self) {
        if self.incr_fine {
            return;
        }

        match self.panel_modify {
            Modify::Volt => {
                self.voltage_set = Self::round_to_increment_divisor(self.voltage_set, self.inc_coarse_div);
            }
            Modify::Ampere => {
                self.current_set = Self::round_to_increment_divisor(self.current_set, self.inc_coarse_div);
            }
            _ => {}
        }
        self.first_turn = false;
    }

    pub fn set_acc_param(&mut self) {
        let divisor = if self.incr_fine {
            self.inc_fine_div
        } else {
            self.inc_coarse_div
        };
        let delta = self.incr_acc_float / divisor;

        match self.panel_modify {
            Modify::Volt => {
                self.voltage_set += delta;
                self.voltage_mod = 1.0;
            }
            Modify::Ampere => {
                self.current_set += delta;
                self.current_mod = 1.0;
            }
            _ => {}
        }
    }

    pub fn apply_encoder_delta(&mut self, raw_delta: i32) -> bool {
        self.incr_diff = self.incr_diff.saturating_add(raw_delta);
        let inc_rast = self.inc_rast.max(1);
        if self.incr_diff.abs() < inc_rast {
            return false;
        }

        let scaled_delta = self.incr_diff / inc_rast;
        self.incr_diff = 0;
        let accelerated_delta = Self::accelerated_encoder_delta(scaled_delta);
        self.incr_acc_float = accelerated_delta as Float;
        self.button_number = 4;

        match self.panel_modify {
            Modify::Volt => {
                if self.first_turn {
                    self.inc_fac_u();
                    self.round_inc_param();
                    self.ser_prompt(ErrorCode::UserReq);
                }
                self.set_acc_param();
                self.check_limits();
                self.sub_channel = 0;
                self.write_param_ser(self.voltage_set);
            }
            Modify::Ampere => {
                self.calc_range_i();
                if self.first_turn {
                    self.inc_fac_i();
                    self.round_inc_param();
                    self.ser_prompt(ErrorCode::UserReq);
                }
                self.set_acc_param();
                self.check_limits();
                self.sub_channel = 1;
                self.write_param_ser(self.current_set);
            }
            Modify::TOn => {
                self.mark_first_encoder_turn();
                self.pw_on_time_ms = Self::add_signed_u16(self.pw_on_time_ms, accelerated_delta * 2);
                self.check_limits();
                self.sub_channel = 27;
                self.write_param_int_ser(i32::from(self.pw_on_time_ms));
            }
            Modify::TOff => {
                self.mark_first_encoder_turn();
                self.pw_off_time_ms = Self::add_signed_u16(self.pw_off_time_ms, accelerated_delta * 2);
                self.check_limits();
                self.sub_channel = 28;
                self.write_param_int_ser(i32::from(self.pw_off_time_ms));
            }
            Modify::Ripple => {
                self.mark_first_encoder_turn();
                self.ripple_percent += accelerated_delta as Float;
                self.check_limits();
                self.sub_channel = 29;
                self.write_param_int_ser(self.ripple_percent as i32);
            }
            Modify::TrackCh => {
                self.track_channel = Self::pascal_add_byte(self.track_channel, accelerated_delta);
                self.check_limits();
            }
            Modify::CapMenu | Modify::PwrMenu => {}
        }

        self.set_level_dac();
        true
    }

    fn mark_first_encoder_turn(&mut self) {
        if self.first_turn {
            self.button_number = 4;
            self.ser_prompt(ErrorCode::UserReq);
            self.first_turn = false;
        }
    }

    fn accelerated_encoder_delta(scaled_delta: i32) -> i32 {
        let sign = scaled_delta.signum();
        let index = (scaled_delta.unsigned_abs() as usize).min(INCR_ACC_ARRAY.len() - 1);
        sign * INCR_ACC_ARRAY[index]
    }

    fn round_to_increment_divisor(value: Float, divisor: Float) -> Float {
        (value * divisor).round() / divisor
    }

    fn add_signed_u16(value: u16, delta: i32) -> u16 {
        let adjusted = i32::from(value).saturating_add(delta);
        adjusted.clamp(0, i32::from(u16::MAX)) as u16
    }

    fn pascal_add_byte(value: u8, delta: i32) -> u8 {
        value.wrapping_add(delta as u8)
    }

    pub fn ser_crlf(&mut self) {
        self.hw.serial_write("\r\n");
    }

    pub fn write_ch_prefix(&mut self) {
        self.hw
            .serial_write(&format!("{}:{}=", self.main_channel, self.sub_channel));
    }

    pub fn write_ser_inp(&mut self) {
        self.hw.serial_write(&self.ser_input);
        self.ser_crlf();
    }

    pub fn ser_prompt(&mut self, err: ErrorCode) {
        let frame = self.status_frame(err);
        self.hw.serial_write(&frame);
    }

    pub fn status_frame(&mut self, err: ErrorCode) -> String {
        self.sub_channel = ERR_SUB_CH;
        let mut status = self.status.as_byte() & 0xf0;
        if err == ErrorCode::UserReq {
            status |= (self.button_number & 0x0f) | 0x40;
        } else if self.faults.any() || err == ErrorCode::NoErr {
            status |= self.faults.bits();
        } else {
            status |= err as u8;
            self.err_count = self.err_count.saturating_add(1);
        }

        let mut frame = format!("{}:{}={}", self.main_channel, ERR_SUB_CH, status);
        if self.faults.any() {
            for (flag, label) in [
                (self.faults.over_power, FAULT_STR_ARR[0]),
                (self.faults.fuse_blown, FAULT_STR_ARR[1]),
                (self.faults.over_voltage, FAULT_STR_ARR[2]),
                (self.faults.over_temp, FAULT_STR_ARR[3]),
            ] {
                if flag {
                    frame.push(' ');
                    frame.push_str(label);
                }
            }
        } else {
            let index = (err as usize).min(ERR_STR_ARR.len().saturating_sub(1));
            frame.push(' ');
            frame.push_str(ERR_STR_ARR[index]);
            if self.status.overload_flag {
                frame.push_str(" [ICONST]");
            }
        }
        frame.push_str("\r\n");
        frame
    }

    pub fn param_to_str(&self, value: Float) -> String {
        format!("{value:.3}")
    }

    pub fn send_track_cmd(&mut self) {
        if self.track_channel == 255 {
            return;
        }

        self.hw.serial_write(&format!(
            "{}:0={}!\r\n",
            self.track_channel,
            self.param_to_str(self.voltage_set)
        ));
        self.hw.serial_write(&format!(
            "{}:1={}!\r\n",
            self.track_channel,
            self.param_to_str(self.current_set)
        ));
    }

    pub fn set_cursor(&mut self, _full_cursor: bool) {}

    pub fn ist_leistung_on_lcd(&mut self) {
        self.hw
            .lcd_write_line(0, &format!("P {:>6.2}", self.measured_power));
    }

    pub fn cap_on_lcd(&mut self) {
        self.hw
            .lcd_write_line(1, &format!("Ah {:>5.2}", self.capacity_mah));
    }

    pub fn spannung_on_lcd(&mut self) {
        self.hw
            .lcd_write_line(0, &format!("U {:>6.3}", self.voltage_set));
    }

    pub fn ist_spannung_on_lcd(&mut self) {
        self.hw
            .lcd_write_line(0, &format!("U {:>6.3}", self.measured_voltage));
    }

    pub fn soll_spannung_on_lcd(&mut self) {
        self.hw
            .lcd_write_line(0, &format!("Us{:>6.3}", self.voltage_set));
    }

    pub fn prefix_i(&self, ma_display: bool) -> &'static str {
        if ma_display {
            "mA"
        } else {
            "A"
        }
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
        self.hw
            .lcd_write_line(1, &format!("I {:>6.3}", self.current_set));
    }

    pub fn ist_strom_on_lcd(&mut self) {
        self.hw
            .lcd_write_line(1, &format!("I {:>6.3}", self.measured_current));
    }

    pub fn soll_strom_on_lcd(&mut self) {
        self.hw
            .lcd_write_line(1, &format!("Is{:>6.3}", self.current_set));
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
        self.write_ch_prefix();
        self.hw.serial_write(&self.param_to_str(value));
        self.ser_crlf();
    }

    pub fn write_param_int_ser(&mut self, value: i32) {
        self.write_ch_prefix();
        self.hw.serial_write(&value.to_string());
        self.ser_crlf();
    }

    pub fn check_limits(&mut self) -> ErrorCode {
        if self.locked {
            return ErrorCode::LockedErr;
        }
        let mut err = ErrorCode::NoErr;
        if self.voltage_set < 0.0 {
            self.voltage_set = 0.0;
            err = ErrorCode::ParamErr;
        }
        if self.voltage_set > self.eeprom.umax() {
            self.voltage_set = self.eeprom.umax();
            err = ErrorCode::ParamErr;
        }
        if self.current_set < 0.0 {
            self.current_set = 0.0;
            err = ErrorCode::ParamErr;
        }
        if self.current_set > self.eeprom.imax(3) {
            self.current_set = self.eeprom.imax(3);
            err = ErrorCode::ParamErr;
        }
        if self.pw_on_time_ms < 2 {
            self.pw_on_time_ms = 2;
            err = ErrorCode::ParamErr;
        }
        if self.ripple_percent < 0.0 {
            self.ripple_percent = 0.0;
            err = ErrorCode::ParamErr;
        }
        if self.ripple_percent > 100.0 {
            self.ripple_percent = 100.0;
            err = ErrorCode::ParamErr;
        }
        if self.track_channel >= 128 {
            self.track_channel = 255;
        } else if self.track_channel > 7 {
            self.track_channel = 7;
        }
        self.no_toggle = self.ripple_percent == 0.0;
        self.ripple_voltage = if self.no_toggle {
            0.0
        } else {
            self.ripple_percent * self.voltage_set / 100.0
        };
        err
    }

    pub fn switch_relais(&mut self) {
        if self.faults.over_temp || self.faults.over_voltage {
            return;
        }

        if self.relay_state_high != self.old_relay_state_high {
            self.hw.set_input_relay_high(self.relay_state_high);
            self.hw.delay_ms(10);
        }
        self.old_relay_state_high = self.relay_state_high;
    }

    pub fn fault_check(&mut self) {
        if self.scale.dcp_present {
            if self.temperature_timer == 0 {
                self.temperature_timer = 20;
                self.get_lm75_temp();
            }
            self.temperature_timer = self.temperature_timer.saturating_sub(1);
        } else {
            self.temperature_c = Some(0.0);
        }

        if self.temperature_c.unwrap_or(0.0) > 70.0 {
            self.faults.over_temp = true;
            self.hw.set_input_relay_high(false);
        } else {
            if self.faults.over_temp {
                self.relay_state_high = false;
                self.old_relay_state_high = true;
            }
            self.faults.over_temp = false;
        }

        self.get_input_voltage();
        let allowed_output_voltage = self.input_voltage - 2.0;
        if self.measured_voltage > allowed_output_voltage {
            self.faults.over_voltage = true;
            self.hw.set_input_relay_high(false);
        } else {
            if self.faults.over_voltage {
                self.relay_state_high = false;
                self.old_relay_state_high = true;
            }
            self.faults.over_voltage = false;
        }

        self.faults.fuse_blown = allowed_output_voltage < 5.0;
        if self.faults.fuse_blown {
            self.faults.over_voltage = false;
        }

        if self.faults.any() {
            self.status.overload_flag = true;
        }
    }

    pub fn chores(&mut self) {
        let previous_current = self.measured_current;
        let current = self.get_current();
        self.measured_current = (previous_current * 7.0 + current) / 8.0;
        let previous_voltage = self.measured_voltage;
        let voltage = self.get_voltage();
        self.measured_voltage = (previous_voltage * 7.0 + voltage) / 8.0;
        self.measured_power = self.measured_voltage * self.measured_current;

        let current_limit_sense = self.hw.current_limit_sense();
        let relay_voltage = if current_limit_sense {
            self.voltage_set
        } else {
            self.measured_voltage
        };

        if relay_voltage > self.relay_voltage_high && !self.status.overload_flag {
            self.relay_state_high = true;
        }
        if relay_voltage < self.relay_voltage_low {
            self.relay_state_high = false;
        }

        self.fault_check();
        if !self.faults.any() {
            self.status.overload_flag = !current_limit_sense;
        }
        if self.fault_timer == 0 {
            if self.faults.any() {
                self.ser_prompt(ErrorCode::OvlErr);
            }
            self.fault_timer = 10;
        }
        self.fault_timer = self.fault_timer.saturating_sub(1);

        self.switch_relais();
        self.no_toggle = self.ripple_percent == 0.0;
        self.werte_on_lcd();
    }

    pub fn check_ser(&mut self) {
        while let Some(input) = self.hw.serial_read_timeout(20) {
            if (' '..='~').contains(&input) {
                self.ser_input.push(input);
            }
            if input == '\u{8}' {
                self.ser_input.pop();
            }
            if input == '\r' {
                self.chores();
                self.parse_serial_command();
                self.ser_input.clear();
            }
        }
        self.chores();
    }

    fn parse_serial_command(&mut self) {
        let mut command = self.ser_input.trim().to_string();
        if command.is_empty() {
            return;
        }

        let verbose = command.ends_with('?') || command.ends_with('!');
        if verbose {
            command.pop();
        }

        let (address, body) = match command.split_once(':') {
            Some((address, body)) => (address, body),
            None => {
                self.ser_prompt(ErrorCode::SyntaxErr);
                return;
            }
        };
        let Ok(address) = address.parse::<u8>() else {
            self.ser_prompt(ErrorCode::SyntaxErr);
            return;
        };
        if address != self.main_channel && address != 255 {
            return;
        }

        let (selector, value) = match body.split_once('=') {
            Some((selector, value)) => (selector, Some(value.trim())),
            None => (body, None),
        };
        let Some(sub_channel) = Self::parse_sub_channel_selector(selector.trim()) else {
            self.ser_prompt(ErrorCode::SyntaxErr);
            return;
        };
        self.sub_channel = sub_channel;

        let result = if let Some(value) = value {
            self.apply_serial_value(sub_channel, value)
        } else {
            Ok(())
        };
        let parsed_value = result.is_ok() && value.is_some();

        let err = match result {
            Ok(()) => self.check_limits(),
            Err(err) => err,
        };
        if parsed_value && err != ErrorCode::LockedErr {
            self.set_level_dac();
            self.send_track_cmd();
        }

        if value.is_none() || verbose || err != ErrorCode::NoErr {
            if err == ErrorCode::NoErr {
                self.write_serial_value(sub_channel);
            } else {
                self.ser_prompt(err);
            }
        }
    }

    fn parse_sub_channel_selector(selector: &str) -> Option<u8> {
        if let Ok(sub_channel) = selector.parse::<u8>() {
            return Some(sub_channel);
        }
        let selector = selector.to_ascii_uppercase();
        CMD_STR_ARR
            .iter()
            .position(|command| *command == selector)
            .map(|index| CMD2_SUB_CH_ARR[index])
    }

    fn apply_serial_value(&mut self, sub_channel: u8, value: &str) -> Result<(), ErrorCode> {
        match sub_channel {
            0 => self.voltage_set = value.parse().map_err(|_| ErrorCode::ParamErr)?,
            1 => self.current_set = value.parse().map_err(|_| ErrorCode::ParamErr)?,
            20 => {
                self.voltage_mod = value.parse::<Float>().map_err(|_| ErrorCode::ParamErr)? / 100.0
            }
            21 => {
                self.current_mod = value.parse::<Float>().map_err(|_| ErrorCode::ParamErr)? / 100.0
            }
            27 => self.pw_on_time_ms = value.parse().map_err(|_| ErrorCode::ParamErr)?,
            28 => self.pw_off_time_ms = value.parse().map_err(|_| ErrorCode::ParamErr)?,
            29 => self.ripple_percent = value.parse().map_err(|_| ErrorCode::ParamErr)?,
            80 => {
                self.panel_modify = match value.parse::<u8>().map_err(|_| ErrorCode::ParamErr)? {
                    0 => Modify::Ampere,
                    1 => Modify::Volt,
                    2 => Modify::Ripple,
                    3 => Modify::TOn,
                    4 => Modify::TOff,
                    5 => Modify::TrackCh,
                    6 => Modify::CapMenu,
                    7 => Modify::PwrMenu,
                    _ => return Err(ErrorCode::ParamErr),
                };
            }
            253 => self.main_channel = value.parse().map_err(|_| ErrorCode::ParamErr)?,
            _ => return Err(ErrorCode::ParamErr),
        }
        Ok(())
    }

    fn write_serial_value(&mut self, sub_channel: u8) {
        match sub_channel {
            0 => self.write_param_ser(self.voltage_set),
            1 => self.write_param_ser(self.current_set),
            7 => self.write_param_ser(self.capacity_mah),
            8 => self.write_param_ser(self.capacity_mwh),
            10 => self.write_param_ser(self.measured_voltage),
            11 => self.write_param_ser(self.measured_current),
            18 => self.write_param_ser(self.measured_power),
            27 => self.write_param_int_ser(i32::from(self.pw_on_time_ms)),
            28 => self.write_param_int_ser(i32::from(self.pw_off_time_ms)),
            29 => self.write_param_int_ser(self.ripple_percent as i32),
            80 => self.write_param_int_ser(self.panel_modify as i32),
            233 => {
                self.get_lm75_temp();
                self.write_param_ser(self.temperature_c.unwrap_or(0.0));
            }
            253 => self.write_param_int_ser(i32::from(self.main_channel)),
            254 => {
                self.write_ch_prefix();
                self.hw.serial_write(VERS1_STR);
                self.ser_crlf();
            }
            255 => self.ser_prompt(ErrorCode::NoErr),
            _ => self.ser_prompt(ErrorCode::ParamErr),
        }
    }

    pub fn check_delay(&mut self, _delay_ms: u8) {
        // Delay loops called CheckSer repeatedly so long waits did not starve
        // the command parser, LCD refresh, or periodic measurement updates.
        for _ in 0.._delay_ms {
            self.check_ser();
        }
    }

    pub fn on_tick_timer(&mut self) {
        if self.ripple_percent > 0.0 {
            self.capacity_mah = 0.0;
            self.capacity_mwh = 0.0;
            return;
        }

        if self.measured_current < 0.00001 {
            self.measured_current = 0.0;
        }
        self.capacity_mah += self.measured_current / (3600.0 * 5.0);
        self.capacity_mwh += self.measured_current * self.measured_voltage / (3600.0 * 5.0);
    }

    pub fn init_all(&mut self) {
        self.init_scales();
        self.status = RuntimeStatus::default();
        self.faults = FaultFlags::default();
        self.err_count = 0;
        self.button_number = 0;
        self.current_mod = 1.0;
        self.voltage_mod = 1.0;
        self.voltage_set = 0.0;
        self.current_set = self.eeprom.init_amp();
        self.old_voltage_range = None;
        self.old_current_range = None;
        self.calc_range_i();
        self.set_level_dac();
        self.panel_modify = Modify::Volt;
        self.sub_channel = 254;
        self.write_ch_prefix();
        self.hw.serial_write(VERS1_STR);
        self.ser_crlf();
        self.output_enabled = true;
        self.hw.set_output_enabled(self.output_enabled);
        self.hw.delay_ms(10);
        self.voltage_set = self.eeprom.init_volt();
        self.set_level_dac();
        self.old_relay_state_high = true;
        self.relay_state_high = false;
        self.switch_relais();
        self.err_count = 0;
        self.hw.delay_ms(200);
        self.fault_check();
        if self.faults.fuse_blown {
            self.ser_prompt(ErrorCode::FuseErr);
        }
        self.capacity_mah = 0.0;
        self.capacity_mwh = 0.0;
        self.no_toggle = self.ripple_percent == 0.0;
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[derive(Debug, Default, Clone)]
    struct MockHardware {
        adc10: i16,
        adc_u: u16,
        adc_i: u16,
        serial_in: Vec<char>,
        voltage_on: Vec<u16>,
        voltage_off: Vec<u16>,
        current: Vec<u16>,
        current_ranges: Vec<CurrentRange>,
        voltage_ranges: Vec<VoltageRange>,
        input_relays: Vec<bool>,
        current_limit_sense: bool,
        temp_c: Option<Float>,
        outputs: Vec<bool>,
        delays: Vec<u16>,
        serial: String,
        lcd: Vec<(u8, String)>,
    }

    impl DcgHardware for MockHardware {
        fn read_adc10(&mut self, _channel_1_based: u8) -> i16 {
            self.adc10
        }

        fn read_adc16_voltage(&mut self) -> u16 {
            self.adc_u
        }

        fn read_adc16_current(&mut self) -> u16 {
            self.adc_i
        }

        fn serial_read_timeout(&mut self, _timeout_ms: u16) -> Option<char> {
            if self.serial_in.is_empty() {
                None
            } else {
                Some(self.serial_in.remove(0))
            }
        }

        fn set_voltage_dac_raw(&mut self, raw: u16) {
            self.voltage_on.push(raw);
        }

        fn set_current_dac_raw(&mut self, raw: u16) {
            self.current.push(raw);
        }

        fn set_voltage_dac_off_raw(&mut self, raw: u16) {
            self.voltage_off.push(raw);
        }

        fn delay_ms(&mut self, milliseconds: u16) {
            self.delays.push(milliseconds);
        }

        fn set_current_range(&mut self, range: CurrentRange) {
            self.current_ranges.push(range);
        }

        fn set_voltage_range(&mut self, range: VoltageRange) {
            self.voltage_ranges.push(range);
        }

        fn set_input_relay_high(&mut self, high: bool) {
            self.input_relays.push(high);
        }

        fn current_limit_sense(&mut self) -> bool {
            self.current_limit_sense
        }

        fn set_output_enabled(&mut self, enabled: bool) {
            self.outputs.push(enabled);
        }

        fn read_temp_c(&mut self) -> Option<Float> {
            self.temp_c
        }

        fn serial_write(&mut self, text: &str) {
            self.serial.push_str(text);
        }

        fn lcd_write_line(&mut self, row: u8, text: &str) {
            self.lcd.push((row, text.to_string()));
        }
    }

    fn test_eeprom() -> EepromData {
        let mut eeprom = EepromData::default();
        eeprom.dac_u_offsets = [10, 20];
        eeprom.dac_i_offsets = [1, 2, 3, 4];
        eeprom.option_array[OPT_INIT_GAIN_PRE] = 1.0;
        eeprom.option_array[OPT_INIT_GAIN_OUT] = 1.0;
        eeprom.option_array[OPT_INIT_GAIN_I] = 1.0;
        eeprom.option_array[OPT_UREF] = 1.0;
        eeprom.option_array[OPT_INIT_SWITCH_U] = 2.0;
        eeprom.option_array[OPT_INIT_RIPPLE_PERCENT] = 25.0;
        eeprom.option_array[OPT_INIT_TON_TIME] = 4.0;
        eeprom.option_array[OPT_INIT_TOFF_TIME] = 6.0;
        eeprom.option_array[OPT_RSENSE_BASE..OPT_RSENSE_BASE + 4]
            .copy_from_slice(&[1000.0, 100.0, 10.0, 1.0]);
        eeprom.option_array[OPT_IMAX_BASE..OPT_IMAX_BASE + 4]
            .copy_from_slice(&[0.002, 0.020, 0.200, 2.000]);
        eeprom
    }

    fn mock_hardware() -> MockHardware {
        MockHardware {
            current_limit_sense: true,
            ..MockHardware::default()
        }
    }

    #[test]
    fn default_eeprom_matches_pascal_ada16_option_layout() {
        let eeprom = EepromData::default();
        assert_eq!(eeprom.option_array[OPT_INIT_VOLT], 5.0);
        assert_eq!(eeprom.option_array[OPT_INIT_AMP], 0.02);
        assert_eq!(eeprom.option_array[OPT_INIT_GAIN_I], 0.25);
        assert_eq!(eeprom.option_array[OPT_UREF], 2.5);
        assert_eq!(eeprom.option_array[OPT_UMAX], 30.0);
        assert_eq!(eeprom.option_array[OPT_RSENSE_BASE], 470.0);
        assert_eq!(eeprom.option_array[OPT_RSENSE_BASE + 3], 0.47);
        assert_eq!(eeprom.option_array[OPT_IMAX_BASE], 0.002);
        assert_eq!(eeprom.option_array[OPT_IMAX_BASE + 3], 2.0);
        assert_eq!(eeprom.option_array[OPT_ADCUFAC_BASE], 2.0);
        assert_eq!(eeprom.option_array[OPT_ADCUFAC_BASE + 1], 6.0);
        assert_eq!(eeprom.option_array[OPT_INIT_OPTIONS], 7.0);
        assert_eq!(eeprom.option_array[OPT_INIT_SWITCH_U], 12.1);
        assert_eq!(eeprom.option_array[OPT_INIT_HYST_LOW], 8.6);
        assert_eq!(eeprom.option_array[OPT_INIT_HYST_HIGH], 8.9);
        assert_eq!(eeprom.option_array[OPT_INIT_FAN_ON_TEMP], 50.0);
        assert_eq!(eeprom.option_array[OPT_INIT_TON_TIME], 4.0);
        assert_eq!(eeprom.option_array[OPT_INIT_TOFF_TIME], 6.0);
    }

    #[test]
    fn init_scales_derives_calibration_and_startup_state() {
        let hw = mock_hardware();
        let mut state = DeviceState::with_eeprom(hw, test_eeprom());
        state.init_scales();

        assert!(state.scale.dac16_present);
        assert!(state.scale.adc16_present);
        assert!(state.scale.dcp_present);
        assert_eq!(state.scale.dac_max, 65_535);
        assert_eq!(state.scale.switchpoint, 2.0);
        assert_eq!(state.relay_voltage_low, 8.6);
        assert_eq!(state.relay_voltage_high, 8.9);
        assert_eq!(state.ripple_percent, 25.0);
        assert_eq!(state.pw_on_time_ms, 4);
        assert_eq!(state.pw_off_time_ms, 6);
        assert_eq!(state.pw_counter_ms, 4);
    }

    #[test]
    fn status_frame_uses_pascal_error_channel_payload() {
        let hw = mock_hardware();
        let mut state = DeviceState::new(hw);
        state.main_channel = 3;
        state.status.ee_unlocked = true;
        state.status.overload_flag = true;

        let frame = state.status_frame(ErrorCode::ParamErr);

        assert_eq!(frame, "3:255=53 [PARERR] [ICONST]\r\n");
        assert_eq!(state.err_count, 1);
    }

    #[test]
    fn status_frame_reports_fault_labels_in_low_nibble() {
        let hw = mock_hardware();
        let mut state = DeviceState::new(hw);
        state.faults = FaultFlags {
            over_power: true,
            fuse_blown: false,
            over_voltage: true,
            over_temp: false,
        };

        let frame = state.status_frame(ErrorCode::NoErr);

        assert_eq!(frame, "0:255=5 [OVRPOWR] [OVRVOLT]\r\n");
    }

    #[test]
    fn set_level_dac_blanks_changed_ranges_then_applies_offsets_and_ripple_off_level() {
        let hw = mock_hardware();
        let mut state = DeviceState::with_eeprom(hw, test_eeprom());
        state.init_scales();
        state.voltage_set = 3.0;
        state.current_set = 0.25;
        state.set_level_dac();

        assert_eq!(state.current_range, CurrentRange::Dc2A);
        assert_eq!(state.voltage_range, VoltageRange::UHigh);
        assert_eq!(state.hw.current.first(), Some(&0));
        assert_eq!(state.hw.voltage_on.first(), Some(&0));
        assert_eq!(state.hw.voltage_off.first(), Some(&0));
        assert_eq!(state.hw.current_ranges, vec![CurrentRange::Dc2A]);
        assert_eq!(state.hw.voltage_ranges, vec![VoltageRange::UHigh]);
        assert_eq!(state.hw.delays, vec![4, 4]);
        assert_eq!(state.dac_raw_i, 8_221);
        assert_eq!(state.dac_raw_u_on, 65_535);
        assert_eq!(state.dac_raw_u_off, 49_151);
        assert_eq!(state.hw.current.last(), Some(&8_221));
        assert_eq!(state.hw.voltage_on.last(), Some(&65_535));
        assert_eq!(state.hw.voltage_off.last(), Some(&49_151));
    }

    #[test]
    fn encoder_delta_waits_for_rast_then_rounds_and_applies_voltage_acceleration() {
        let mut state = DeviceState::with_eeprom(mock_hardware(), test_eeprom());
        state.init_scales();
        state.panel_modify = Modify::Volt;
        state.voltage_set = 1.26;

        assert!(!state.apply_encoder_delta(3));
        assert_eq!(state.voltage_set, 1.26);
        assert!(state.apply_encoder_delta(1));

        assert!((state.voltage_set - 1.4).abs() < 0.000001);
        assert!(!state.first_turn);
        assert_eq!(state.button_number, 4);
        assert!(state.hw.serial.contains("0:255=68 [SRQUSR]\r\n"));
        assert!(state.hw.serial.contains("0:0=1.400\r\n"));
    }

    #[test]
    fn encoder_delta_uses_pascal_acceleration_table_for_fast_voltage_turns() {
        let mut state = DeviceState::with_eeprom(mock_hardware(), test_eeprom());
        state.init_scales();
        state.panel_modify = Modify::Volt;
        state.voltage_set = 1.23;

        assert!(state.apply_encoder_delta(12));

        assert!((state.voltage_set - 1.7).abs() < 0.000001);
        assert_eq!(state.incr_acc_float, 5.0);
    }

    #[test]
    fn fine_current_encoder_step_uses_current_divisor_without_coarse_rounding() {
        let mut state = DeviceState::with_eeprom(mock_hardware(), test_eeprom());
        state.init_scales();
        state.panel_modify = Modify::Ampere;
        state.incr_fine = true;
        state.current_set = 0.126;

        assert!(state.apply_encoder_delta(4));

        assert!((state.current_set - 0.1261).abs() < 0.000001);
        assert_eq!(state.inc_fine_div, 10_000.0);
        assert!(state.first_turn);
    }

    #[test]
    fn new_state_disables_tracking_like_pascal_eeprom_default() {
        let state = DeviceState::new(mock_hardware());

        assert_eq!(state.track_channel, 255);
    }

    #[test]
    fn measurement_conversion_uses_pascal_adc_paths_and_input_scaling() {
        let mut eeprom = test_eeprom();
        eeprom.option_array[OPT_INIT_OPTIONS] = 0.0;
        eeprom.adc_u_offsets = [3, 30];
        eeprom.adc_i_offsets = [4, 40, 400, 4000];
        eeprom.adc_u_scales = [1.0, 1.0];
        eeprom.adc_i_scales = [1.0, 1.0, 1.0, 1.0];
        let hw = MockHardware {
            adc10: 100,
            current_limit_sense: true,
            ..MockHardware::default()
        };
        let mut state = DeviceState::with_eeprom(hw, eeprom);
        state.init_scales();
        state.voltage_range = VoltageRange::ULow;
        state.current_range = CurrentRange::Dc2mA;

        let voltage = state.get_voltage();
        let current = state.get_current();
        state.get_input_voltage();

        assert!((voltage - 0.20117188).abs() < 0.000001);
        assert!((current - 0.00005078).abs() < 0.000001);
        assert!((state.input_voltage - 1.855).abs() < 0.0001);
    }

    #[test]
    fn check_limits_clamps_and_normalizes_ripple_and_tracking() {
        let mut state = DeviceState::with_eeprom(mock_hardware(), test_eeprom());
        state.voltage_set = 40.0;
        state.current_set = 3.0;
        state.pw_on_time_ms = 1;
        state.ripple_percent = 125.0;
        state.track_channel = 9;

        let err = state.check_limits();

        assert_eq!(err, ErrorCode::ParamErr);
        assert_eq!(state.voltage_set, 30.0);
        assert_eq!(state.current_set, 2.0);
        assert_eq!(state.pw_on_time_ms, 2);
        assert_eq!(state.ripple_percent, 100.0);
        assert_eq!(state.track_channel, 7);
        assert_eq!(state.ripple_voltage, 30.0);
        assert!(!state.no_toggle);

        state.track_channel = 128;
        assert_eq!(state.check_limits(), ErrorCode::NoErr);
        assert_eq!(state.track_channel, 255);
    }

    #[test]
    fn tracking_transmit_path_sends_voltage_and_current_commands() {
        let mut state = DeviceState::new(mock_hardware());
        state.track_channel = 4;
        state.voltage_set = 1.25;
        state.current_set = 0.5;

        state.send_track_cmd();

        assert_eq!(state.hw.serial, "4:0=1.250!\r\n4:1=0.500!\r\n");
    }

    #[test]
    fn fault_check_drops_relays_for_overtemp_overvoltage_and_fuse_loss() {
        let hw = MockHardware {
            adc10: 100,
            temp_c: Some(71.0),
            current_limit_sense: true,
            ..MockHardware::default()
        };
        let mut state = DeviceState::with_eeprom(hw, test_eeprom());
        state.init_scales();
        state.measured_voltage = 10.0;

        state.fault_check();

        assert!(state.faults.over_temp);
        assert!(!state.faults.over_voltage);
        assert!(state.faults.fuse_blown);
        assert!(state.status.overload_flag);
        assert_eq!(state.hw.input_relays, vec![false, false]);
    }

    #[test]
    fn chores_updates_measurements_overload_and_relay_hysteresis() {
        let hw = MockHardware {
            adc_u: 10_000,
            adc_i: 10_000,
            adc10: 1023,
            current_limit_sense: false,
            ..mock_hardware()
        };
        let mut state = DeviceState::with_eeprom(hw, test_eeprom());
        state.init_scales();
        state.voltage_set = 10.0;
        state.old_relay_state_high = false;
        state.relay_voltage_low = 0.0;
        state.relay_voltage_high = 0.01;

        state.chores();

        assert!(state.status.overload_flag);
        assert!(state.measured_voltage > 0.0);
        assert!(state.measured_current > 0.0);
        assert_eq!(state.hw.input_relays, vec![true]);
    }

    #[test]
    fn check_ser_drains_ascii_backspace_and_cr_commands() {
        let mut hw = mock_hardware();
        hw.serial_in = "0:0=12.x\u{8}3!\r".chars().collect();
        let mut state = DeviceState::with_eeprom(hw, test_eeprom());
        state.init_scales();

        state.check_ser();

        assert_eq!(state.voltage_set, 12.3);
        assert!(state.hw.serial.contains("0:0=12.300\r\n"));
        assert!(state.ser_input.is_empty());
    }

    #[test]
    fn init_all_follows_pascal_startup_order() {
        let hw = MockHardware {
            adc10: 1023,
            current_limit_sense: true,
            ..mock_hardware()
        };
        let mut state = DeviceState::with_eeprom(hw, test_eeprom());

        state.init_all();

        assert_eq!(state.voltage_set, 5.0);
        assert_eq!(state.current_set, 0.02);
        assert_eq!(state.panel_modify, Modify::Volt);
        assert!(state.output_enabled);
        assert_eq!(state.hw.outputs, vec![true]);
        assert!(state
            .hw
            .serial
            .starts_with("0:254=2.92 [DCG by CM/c't 05/2010]\r\n"));
        assert_eq!(state.hw.input_relays, vec![false]);
        assert_eq!(state.capacity_mah, 0.0);
        assert_eq!(state.capacity_mwh, 0.0);
    }
}
