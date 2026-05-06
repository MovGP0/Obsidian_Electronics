//! Best-effort Rust port of `EDL.pas`.
//!
//! The Pascal source is a large foreground loop wrapped around timer-driven ADC
//! and DAC state. This module restores the audited main-file semantics with an
//! explicit state machine: per-fault latching, calibration derived from the
//! documented EEPROM layout, ripple/off-phase sampling, averaged power, range
//! selection, periodic telemetry, and Ah/Wh integration.

#![allow(dead_code)]

pub type Float = f32;

pub const PROC_CLOCK: u32 = 16_000_000;
pub const VERS1_STR: &str = "1.784 [EDL by CM/c't 09/2008]";
pub const VERS3_STR: &str = "EDL 1.78";
pub const ERR_SUBCH: u8 = 255;
pub const AUTO_SHUNT_RANGE: u8 = 4;
pub const SHUNT_D: u8 = 3;
pub const SERVICE_INTERVAL_MS: u32 = 40;
pub const INTEGRATION_INTERVAL_MS: u32 = 200;
pub const PERIODIC_TELEMETRY_CYCLES: u8 = 10;
pub const TEMPERATURE_POLL_CYCLES: u8 = 20;
pub const TEMPERATURE_MAX_C: Float = 70.0;

const DAC_TYPE_MASK: u8 = 0x03;
const LM75_INTERNAL_BIT: u8 = 1 << 2;
const LM75_EXTERNAL_BIT: u8 = 1 << 3;

const OPT_INIT_VOLT: usize = 0;
const OPT_INIT_AMP: usize = 1;
const OPT_INIT_LOW_DIVIDER_U: usize = 2;
const OPT_INIT_HI_DIVIDER_U: usize = 3;
const OPT_INIT_GAIN_I: usize = 4;
const OPT_UREF: usize = 5;
const OPT_PMAX: usize = 6;
const OPT_RSENSE_BASE: usize = 7;
const OPT_IMAX_BASE: usize = 11;
const OPT_UMAX_HI: usize = 15;
const OPT_UMAX_LO: usize = 16;
const OPT_INIT_OPTIONS: usize = 17;
const OPT_INIT_IPERCENT: usize = 18;
const OPT_INIT_TON: usize = 19;
const OPT_INIT_TOFF: usize = 20;
const OPT_INIT_FAN_TEMP: usize = 21;

pub const CMD_STR_ARR: [&str; 31] = [
    "STR", "IDN", "CHN", "VAL", "ENA", "DCA", "DCP", "DCV", "DCR", "MAH", "MWH", "MSV", "MSA",
    "RNG", "MSW", "PCA", "RON", "ROF", "RIP", "RAW", "DSP", "ALL", "OFS", "SCL", "OPT", "TMP",
    "TRM", "WEN", "ERC", "SBD", "NOP",
];

pub const FAULT_STR_ARR: [&str; 5] = [
    "[OVRPOWR]",
    "[FUSEBLW]",
    "[OVRVOLT]",
    "[OVRTEMP]",
    "[LOWVOLT]",
];

pub const ERR_STR_ARR: [&str; 8] = [
    "[OK]", "[SRQUSR]", "[BUSY]", "[OVRLD]", "[CMDERR]", "[PARERR]", "[LOCKED]", "[CHKSUM]",
];

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum CmdWhich {
    Str,
    Idn,
    Chn,
    Val,
    Ena,
    Dca,
    Dcp,
    Dcv,
    Dcr,
    Mah,
    Mwh,
    Msv,
    Msa,
    Rng,
    Msw,
    Pca,
    Ron,
    Rof,
    Rip,
    Raw,
    Dsp,
    All,
    Ofs,
    Scl,
    Opt,
    Tmp,
    Trm,
    Wen,
    Erc,
    Sbd,
    Nop,
    Err,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
#[repr(u8)]
pub enum Mode {
    OutputOff = 0,
    IHiVolt = 1,
    ILoVolt = 2,
    RHiVolt = 3,
    RLoVolt = 4,
    PHiVolt = 5,
    PLoVolt = 6,
}

impl Mode {
    pub fn from_raw(raw: u8) -> Option<Self> {
        match raw {
            0 => Some(Self::OutputOff),
            1 => Some(Self::IHiVolt),
            2 => Some(Self::ILoVolt),
            3 => Some(Self::RHiVolt),
            4 => Some(Self::RLoVolt),
            5 => Some(Self::PHiVolt),
            6 => Some(Self::PLoVolt),
            _ => None,
        }
    }

    pub fn is_low_voltage(self) -> bool {
        matches!(self, Self::ILoVolt | Self::RLoVolt | Self::PLoVolt)
    }

    pub fn is_current(self) -> bool {
        matches!(self, Self::IHiVolt | Self::ILoVolt)
    }

    pub fn is_resistance(self) -> bool {
        matches!(self, Self::RHiVolt | Self::RLoVolt)
    }

    pub fn is_power(self) -> bool {
        matches!(self, Self::PHiVolt | Self::PLoVolt)
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Modify {
    LowerMainMenu,
    UpperMainMenu,
    ModeMenu,
    TOn,
    TOff,
    IOff,
    TempMenu,
    RiMenu,
    CapMenu,
    PwrCurMenu,
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
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum MeasureKind {
    Ioff,
    Uoff,
    Ion,
    Uon,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum DacKind {
    Ltc8043,
    Ad5452,
    Dac8501,
    Dac8811,
}

#[derive(Debug, Default, Clone, Copy, PartialEq, Eq)]
pub struct ProtectionFlags {
    pub over_power: bool,
    pub fuse_blown: bool,
    pub over_voltage: bool,
    pub over_temp: bool,
    pub low_volt: bool,
}

impl ProtectionFlags {
    pub fn any(self) -> bool {
        self.bits() != 0
    }

    pub fn bits(self) -> u8 {
        (self.over_power as u8)
            | ((self.fuse_blown as u8) << 1)
            | ((self.over_voltage as u8) << 2)
            | ((self.over_temp as u8) << 3)
            | ((self.low_volt as u8) << 4)
    }
}

#[derive(Debug, Clone)]
pub struct EepromData {
    pub adc_u_offsets: [i16; 2],
    pub adc_u_scales: [Float; 2],
    pub adc_i_offsets: [i16; 4],
    pub adc_i_scales: [Float; 4],
    pub dac_i_offsets: [i16; 4],
    pub dac_i_scales: [Float; 4],
    pub dac_r_scales: [Float; 4],
    pub option_array: [Float; 22],
    pub ee_ser_baud_reg: u8,
    pub inc_rast_def: i16,
    pub trig_mask: u8,
    pub ee_initialised: u16,
    pub first_run: bool,
}

impl Default for EepromData {
    fn default() -> Self {
        Self {
            adc_u_offsets: [-260, -260],
            adc_u_scales: [1.01, 1.01],
            adc_i_offsets: [-260, -260, -260, -260],
            adc_i_scales: [1.01, 1.01, 1.01, 1.01],
            dac_i_offsets: [0, 0, 0, 0],
            dac_i_scales: [1.0, 1.0, 1.0, 1.0],
            dac_r_scales: [1.0, 1.0, 1.0, 1.0],
            option_array: [
                0.0, 0.02, 2.5, 10.0, 10.0, 2.5, 50.0, 100.0, 10.0, 1.0, 0.1, 0.002, 0.020, 0.200,
                2.0, 25.0, 6.1, 4.0, 0.0, 10.0, 0.0, 50.0,
            ],
            ee_ser_baud_reg: 51,
            inc_rast_def: 4,
            trig_mask: 0,
            ee_initialised: 0xAA55,
            first_run: false,
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

    pub fn init_low_divider_u(&self) -> Float {
        self.option_array[OPT_INIT_LOW_DIVIDER_U]
    }

    pub fn init_hi_divider_u(&self) -> Float {
        self.option_array[OPT_INIT_HI_DIVIDER_U]
    }

    pub fn init_gain_i(&self) -> Float {
        self.option_array[OPT_INIT_GAIN_I]
    }

    pub fn uref(&self) -> Float {
        self.option_array[OPT_UREF]
    }

    pub fn pmax(&self) -> Float {
        self.option_array[OPT_PMAX]
    }

    pub fn rsense(&self, index: usize) -> Float {
        self.option_array[OPT_RSENSE_BASE + index]
    }

    pub fn imax(&self, index: usize) -> Float {
        self.option_array[OPT_IMAX_BASE + index]
    }

    pub fn voltage_limit_hi(&self) -> Float {
        self.option_array[OPT_UMAX_HI]
    }

    pub fn voltage_limit_lo(&self) -> Float {
        self.option_array[OPT_UMAX_LO]
    }

    pub fn init_options(&self) -> u8 {
        self.option_array[OPT_INIT_OPTIONS] as u8
    }

    pub fn init_i_percent(&self) -> i32 {
        self.option_array[OPT_INIT_IPERCENT] as i32
    }

    pub fn init_ton(&self) -> i32 {
        self.option_array[OPT_INIT_TON] as i32
    }

    pub fn init_toff(&self) -> i32 {
        self.option_array[OPT_INIT_TOFF] as i32
    }

    pub fn init_fan_on_temp(&self) -> Float {
        self.option_array[OPT_INIT_FAN_TEMP]
    }
}

#[derive(Debug, Clone, Copy)]
pub struct ScaleState {
    pub options: u8,
    pub dac_kind: DacKind,
    pub dac_max: u16,
    pub divider_u: Float,
    pub adc_u_offset: i16,
    pub adc16_lsb_u: Float,
    pub dac_lsb_i: [Float; 4],
    pub dac_lsb_r: [Float; 4],
    pub adc16_lsb_i: [Float; 4],
    pub dc_ohm_min: Float,
    pub dc_ohm_max: Float,
}

impl Default for ScaleState {
    fn default() -> Self {
        Self {
            options: 0,
            dac_kind: DacKind::Ltc8043,
            dac_max: 4095,
            divider_u: 1.0,
            adc_u_offset: 0,
            adc16_lsb_u: 0.0,
            dac_lsb_i: [0.0; 4],
            dac_lsb_r: [0.0; 4],
            adc16_lsb_i: [0.0; 4],
            dc_ohm_min: 0.0,
            dc_ohm_max: 0.0,
        }
    }
}

#[derive(Debug, Default, Clone, Copy)]
pub struct RuntimeStatus {
    pub ee_unlocked: bool,
    pub overload_flag: bool,
    pub user_srq_flag: bool,
    pub busy_flag: bool,
}

impl RuntimeStatus {
    pub fn flag_bits(self) -> u8 {
        ((self.ee_unlocked as u8) << 4)
            | ((self.overload_flag as u8) << 5)
            | ((self.user_srq_flag as u8) << 6)
            | ((self.busy_flag as u8) << 7)
    }
}

pub trait EdlHardware {
    fn read_voltage_adc16(&mut self, on_phase: bool) -> u16;
    fn read_current_adc16(&mut self, on_phase: bool) -> u16;
    fn read_voltage_adc10(&mut self) -> i16;
    fn read_current_adc10(&mut self) -> i16;
    fn set_shunt(&mut self, shunt_index: u8);
    fn set_output_enabled(&mut self, enabled: bool);
    fn set_dac_raw(&mut self, raw: u16);
    fn read_temp_c(&mut self) -> Option<Float>;
    fn serial_write(&mut self, text: &str);
    fn lcd_write_line(&mut self, row: u8, text: &str);

    fn read_trigger_in(&mut self) -> bool {
        false
    }
}

#[derive(Debug, Default, Clone, Copy, PartialEq)]
pub struct MeasurementSnapshot {
    pub voltage_on: Float,
    pub current_on: Float,
    pub voltage_off: Float,
    pub current_off: Float,
    pub power_on: Float,
    pub power_off: Float,
    pub power_avg: Float,
}

#[derive(Debug, Clone)]
pub struct DeviceState<H> {
    pub hw: H,
    pub eeprom: EepromData,
    pub scale: ScaleState,
    pub status: RuntimeStatus,
    pub faults: ProtectionFlags,
    pub mode: Mode,
    pub modify: Modify,
    pub output_enabled: bool,
    pub current_set: Float,
    pub current_scale_factor: Float,
    pub power_set: Float,
    pub voltage_cutoff: Float,
    pub resistance_set: Float,
    pub i_percent: i32,
    pub pw_on_time_ms: i32,
    pub pw_off_time_ms: i32,
    pub no_toggle: bool,
    pub shunt_range: u8,
    pub shunt_select: u8,
    pub old_shunt_select: u8,
    pub track_channel: u8,
    pub measured_voltage: Float,
    pub measured_current: Float,
    pub measured_power: Float,
    pub power_on: Float,
    pub power_off: Float,
    pub psoa: Float,
    pub capacity_ah: Float,
    pub capacity_wh: Float,
    pub internal_resistance: Float,
    pub temperature_c: Option<Float>,
    pub current_voltage: Float,
    pub current_amp: Float,
    pub trigger_mask: u8,
    pub trig_on_sema: bool,
    pub trig_off_sema: bool,
    pub fault_timer_byte: u8,
    pub temperature_timer: u8,
    pub service_elapsed_ms: u32,
    pub integration_elapsed_ms: u32,
    pub err_count: i32,
    pub button_number: u8,
    pub slave_channel: u8,
    pub sub_channel: u8,
    pub dac_raw_on: u16,
    pub dac_raw_off: u16,
    pub dac_raw_active: u16,
    pub serial_input: String,
    pub completed_command: Option<String>,
    pub last_measurement: MeasurementSnapshot,
}

impl<H: EdlHardware> DeviceState<H> {
    pub fn new(hw: H) -> Self {
        Self::with_eeprom(hw, EepromData::default())
    }

    pub fn with_eeprom(hw: H, eeprom: EepromData) -> Self {
        let mut state = Self {
            hw,
            eeprom,
            scale: ScaleState::default(),
            status: RuntimeStatus::default(),
            faults: ProtectionFlags::default(),
            mode: Mode::OutputOff,
            modify: Modify::LowerMainMenu,
            output_enabled: false,
            current_set: 0.0,
            current_scale_factor: 1.0,
            power_set: 0.0,
            voltage_cutoff: 0.0,
            resistance_set: 100.0,
            i_percent: 100,
            pw_on_time_ms: 1,
            pw_off_time_ms: 0,
            no_toggle: true,
            shunt_range: AUTO_SHUNT_RANGE,
            shunt_select: 0,
            old_shunt_select: u8::MAX,
            track_channel: 255,
            measured_voltage: 0.0,
            measured_current: 0.0,
            measured_power: 0.0,
            power_on: 0.0,
            power_off: 0.0,
            psoa: 0.0,
            capacity_ah: 0.0,
            capacity_wh: 0.0,
            internal_resistance: 0.0,
            temperature_c: None,
            current_voltage: 0.0,
            current_amp: 0.0,
            trigger_mask: 0,
            trig_on_sema: false,
            trig_off_sema: false,
            fault_timer_byte: 0,
            temperature_timer: 0,
            service_elapsed_ms: 0,
            integration_elapsed_ms: 0,
            err_count: 0,
            button_number: 0,
            slave_channel: 0,
            sub_channel: 0,
            dac_raw_on: 0,
            dac_raw_off: 0,
            dac_raw_active: 0,
            serial_input: String::new(),
            completed_command: None,
            last_measurement: MeasurementSnapshot::default(),
        };
        state.init_scales();
        state
    }

    pub fn set_lm75_temp(&mut self) {}

    pub fn get_one_lm75_temp(&mut self) -> Option<Float> {
        self.hw.read_temp_c()
    }

    pub fn get_lm75_temp(&mut self) {
        self.temperature_c = self.get_one_lm75_temp();
    }

    pub fn init_scale_u(&mut self) {
        if self.mode.is_low_voltage() {
            self.scale.divider_u = self.eeprom.init_low_divider_u();
            self.scale.adc_u_offset = self.eeprom.adc_u_offsets[0];
            self.scale.adc16_lsb_u =
                self.eeprom.adc_u_scales[0] * self.eeprom.uref() * self.scale.divider_u / 65_535.0;
        } else {
            self.scale.divider_u = self.eeprom.init_hi_divider_u();
            self.scale.adc_u_offset = self.eeprom.adc_u_offsets[1];
            self.scale.adc16_lsb_u =
                self.eeprom.adc_u_scales[1] * self.eeprom.uref() * self.scale.divider_u / 65_535.0;
        }
    }

    pub fn init_scales(&mut self) {
        self.trigger_mask = self.eeprom.trig_mask;
        self.scale.options = self.eeprom.init_options();
        self.scale.dac_kind = match self.scale.options & DAC_TYPE_MASK {
            1 => DacKind::Ad5452,
            2 => DacKind::Dac8501,
            3 => DacKind::Dac8811,
            _ => DacKind::Ltc8043,
        };
        self.scale.dac_max = if matches!(self.scale.dac_kind, DacKind::Dac8811) {
            65_535
        } else {
            4_095
        };
        self.init_scale_u();

        let uref = self.eeprom.uref();
        let gain_i = self.eeprom.init_gain_i();
        let dac_max = self.scale.dac_max as Float;
        for index in 0..4 {
            let rsense = self.eeprom.rsense(index);
            self.scale.dac_lsb_i[index] =
                (uref / rsense) / (dac_max * self.eeprom.dac_i_scales[index] * gain_i);
            // The Pascal firmware intentionally reused DACIscales here because
            // the EEPROM DACRscales were known bad.
            self.scale.dac_lsb_r[index] =
                gain_i * rsense * dac_max * self.eeprom.dac_i_scales[index];
            self.scale.adc16_lsb_i[index] =
                (self.eeprom.adc_i_scales[index] * uref / rsense) / 65_535.0 / gain_i;
        }

        self.pw_on_time_ms = self.eeprom.init_ton();
        self.pw_off_time_ms = self.eeprom.init_toff();
        self.i_percent = self.eeprom.init_i_percent();
        self.scale.dc_ohm_min = self.eeprom.rsense(3) * self.scale.divider_u * gain_i * 1.1;
        self.scale.dc_ohm_max = self.eeprom.rsense(0) * self.scale.divider_u * gain_i * 100.0;
    }

    pub fn ser_crlf(&mut self) {
        self.hw.serial_write("\r\n");
    }

    pub fn write_ch_prefix(&mut self) {
        self.hw
            .serial_write(&format!("#{}:{}=", self.slave_channel, self.sub_channel));
    }

    pub fn write_ser_inp(&mut self) {
        self.hw.serial_write(&self.serial_input);
        self.ser_crlf();
    }

    pub fn set_shunt(&mut self, shunt: u8) {
        self.shunt_select = shunt.min(SHUNT_D);
        self.hw.set_shunt(self.shunt_select);
    }

    pub fn calc_range_i(&mut self) -> u8 {
        let mut shunt = 0u8;
        for index in 0..4 {
            if self.current_set > self.eeprom.imax(index) {
                shunt = (shunt + 1).min(SHUNT_D);
            }
        }
        shunt
    }

    pub fn calc_range_r(&mut self) -> u8 {
        let mut shunt = 0u8;
        for index in 0..4 {
            if self.resistance_set
                < (self.eeprom.rsense(index)
                    * self.eeprom.init_gain_i()
                    * self.scale.divider_u
                    * 1.1)
            {
                shunt = (shunt + 1).min(SHUNT_D);
            }
        }
        shunt
    }

    pub fn get_voltage(&mut self, on_phase: bool) {
        self.measured_voltage = self.read_voltage_phase(on_phase);
    }

    pub fn get_current(&mut self, on_phase: bool) {
        self.measured_current = self.read_current_phase(on_phase);
    }

    pub fn read_voltage_phase(&mut self, on_phase: bool) -> Float {
        let phase = self.use_on_phase(on_phase);
        let raw = self.hw.read_voltage_adc16(phase) as i32 + i32::from(self.scale.adc_u_offset);
        raw as Float * self.scale.adc16_lsb_u
    }

    pub fn read_current_phase(&mut self, on_phase: bool) -> Float {
        if !self.output_enabled {
            return 0.0;
        }
        let phase = self.use_on_phase(on_phase);
        let index = self.shunt_select as usize;
        let raw =
            self.hw.read_current_adc16(phase) as i32 + i32::from(self.eeprom.adc_i_offsets[index]);
        raw as Float * self.scale.adc16_lsb_i[index]
    }

    pub fn get_voltage10(&mut self) {
        self.measured_voltage = self.hw.read_voltage_adc10() as Float * 0.01;
    }

    pub fn get_current10(&mut self) {
        self.measured_current = self.hw.read_current_adc10() as Float * 0.01;
    }

    pub fn get_ri(&mut self) -> bool {
        if self.no_toggle || !self.mode.is_current() {
            return false;
        }
        let on_voltage = self.read_voltage_phase(true);
        let off_voltage = self.read_voltage_phase(false);
        let on_current = self.read_current_phase(true);
        let off_current = self.read_current_phase(false);
        let current_delta = on_current - off_current;
        if current_delta <= 0.0 {
            return false;
        }
        self.internal_resistance = (off_voltage - on_voltage) / current_delta;
        true
    }

    pub fn set_level_dac_i(&mut self) {
        self.init_scale_u();
        let mut shunt = self.calc_range_i();
        if self.shunt_range <= SHUNT_D && self.shunt_range >= shunt {
            shunt = self.shunt_range;
        }
        self.apply_shunt_change(shunt);

        let index = self.shunt_select as usize;
        self.dac_raw_on = self.quantize_dac(
            (self.current_set * self.current_scale_factor) / self.scale.dac_lsb_i[index],
            self.eeprom.dac_i_offsets[index],
        );
        let off_scale = self.i_percent as Float / 100.0;
        self.dac_raw_off = self.quantize_dac(
            (self.current_set * self.current_scale_factor * off_scale)
                / self.scale.dac_lsb_i[index],
            self.eeprom.dac_i_offsets[index],
        );
        self.update_output_drive();
    }

    pub fn set_level_dac_r(&mut self) {
        self.init_scale_u();
        let shunt = self.calc_range_r();
        self.apply_shunt_change(shunt);

        let index = self.shunt_select as usize;
        self.dac_raw_on = self.quantize_dac(
            (self.scale.divider_u * self.scale.dac_lsb_r[index]) / self.resistance_set,
            self.eeprom.dac_i_offsets[index],
        );
        self.dac_raw_off = self.dac_raw_on;
        self.update_output_drive();
    }

    pub fn set_level_dac_p(&mut self) {
        let on_voltage = self.read_voltage_phase(true);
        if on_voltage > 0.0 {
            self.current_set = self.power_set / on_voltage;
        }
        self.check_limits();
        self.set_level_dac_i();
    }

    pub fn ser_prompt(&mut self, err: ErrorCode) {
        let frame = self.status_frame(err);
        self.hw.serial_write(&frame);
    }

    pub fn status_frame(&mut self, err: ErrorCode) -> String {
        self.sub_channel = ERR_SUBCH;
        let mut status = self.status.flag_bits();
        if err == ErrorCode::UserReq {
            status |= (self.button_number & 0x0f) | 0x40;
        } else if self.faults.any() || err == ErrorCode::NoErr {
            status |= self.faults.bits();
        } else {
            status |= err as u8;
            if err != ErrorCode::NoErr {
                self.err_count += 1;
            }
        }

        let mut frame = format!("#{}:{}={}", self.slave_channel, ERR_SUBCH, status);
        if self.faults.any() {
            for (flag, label) in [
                (self.faults.over_power, FAULT_STR_ARR[0]),
                (self.faults.fuse_blown, FAULT_STR_ARR[1]),
                (self.faults.over_voltage, FAULT_STR_ARR[2]),
                (self.faults.over_temp, FAULT_STR_ARR[3]),
                (self.faults.low_volt, FAULT_STR_ARR[4]),
            ] {
                if flag {
                    frame.push(' ');
                    frame.push_str(label);
                }
            }
        } else {
            frame.push(' ');
            frame.push_str(ERR_STR_ARR[(err as usize).min(ERR_STR_ARR.len() - 1)]);
        }
        frame.push_str("\r\n");
        frame
    }

    pub fn inc_fac_i(&mut self, delta: Float) {
        self.current_set = (self.current_set + delta).max(0.0);
    }

    pub fn inc_fac_r(&mut self, delta: Float) {
        self.resistance_set = (self.resistance_set + delta).max(0.001);
    }

    pub fn inc_fac_p(&mut self, delta: Float) {
        self.power_set = (self.power_set + delta).max(0.0);
    }

    pub fn inc_fac_v(&mut self, delta: Float) {
        self.voltage_cutoff = (self.voltage_cutoff + delta).max(0.0);
    }

    pub fn round_inc_param(&mut self) {}

    pub fn set_acc_param(&mut self) {}

    pub fn param_to_str(&self, value: Float) -> String {
        format!("{value:.6}")
    }

    pub fn set_cursor(&mut self, _full_cursor: bool) {}

    pub fn spannung_on_lcd(&mut self) {
        self.hw
            .lcd_write_line(0, &format!("U {:>6.3}", self.voltage_cutoff));
    }

    pub fn ist_spannung_on_lcd(&mut self) {
        self.hw
            .lcd_write_line(0, &format!("U {:>6.3}", self.measured_voltage));
    }

    pub fn soll_spannung_on_lcd(&mut self) {
        self.hw
            .lcd_write_line(0, &format!("Us{:>6.3}", self.voltage_cutoff));
    }

    pub fn param_div_1000(&self, value: Float) -> Float {
        value / 1000.0
    }

    pub fn param_mul_1000(&self, value: Float) -> Float {
        value * 1000.0
    }

    pub fn prefix_r(&self) -> &'static str {
        "Ohm"
    }

    pub fn prefix_i(&self, ma_display: bool) -> &'static str {
        if ma_display {
            "mA"
        } else {
            "A"
        }
    }

    pub fn strom_on_lcd(&mut self) {
        self.hw
            .lcd_write_line(1, &format!("I {:>6.3}", self.current_set));
    }

    pub fn widerstand_on_lcd(&mut self) {
        self.hw
            .lcd_write_line(1, &format!("R {:>6.2}", self.resistance_set));
    }

    pub fn ist_strom_on_lcd(&mut self) {
        self.hw
            .lcd_write_line(1, &format!("I {:>6.3}", self.measured_current));
    }

    pub fn soll_strom_on_lcd(&mut self) {
        self.hw
            .lcd_write_line(1, &format!("Is{:>6.3}", self.current_set));
    }

    pub fn ist_leistung_on_lcd(&mut self) {
        self.hw
            .lcd_write_line(1, &format!("P {:>6.2}", self.measured_power));
    }

    pub fn soll_leistung_on_lcd(&mut self) {
        self.hw
            .lcd_write_line(1, &format!("Ps{:>6.2}", self.power_set));
    }

    pub fn cap_on_lcd(&mut self) {
        self.hw
            .lcd_write_line(1, &format!("Ah {:>5.2}", self.capacity_ah));
    }

    pub fn ri_on_lcd(&mut self) {
        self.hw
            .lcd_write_line(1, &format!("Ri {:>5.2}", self.internal_resistance));
    }

    pub fn werte_on_lcd(&mut self) {
        match self.mode {
            Mode::OutputOff | Mode::IHiVolt | Mode::ILoVolt => {
                self.ist_spannung_on_lcd();
                self.ist_strom_on_lcd();
            }
            Mode::RHiVolt | Mode::RLoVolt => {
                self.ist_spannung_on_lcd();
                self.widerstand_on_lcd();
            }
            Mode::PHiVolt | Mode::PLoVolt => {
                self.ist_spannung_on_lcd();
                self.ist_leistung_on_lcd();
            }
        }
    }

    pub fn write_param_ser(&mut self, value: Float) {
        self.hw.serial_write(&self.param_to_str(value));
    }

    pub fn write_param_int_ser(&mut self, value: i32) {
        self.hw.serial_write(&value.to_string());
    }

    pub fn check_limits(&mut self) -> ErrorCode {
        let mut err = ErrorCode::NoErr;
        self.no_toggle = false;

        if self.resistance_set < self.scale.dc_ohm_min {
            self.resistance_set = self.scale.dc_ohm_min;
            err = ErrorCode::ParamErr;
        }
        if self.resistance_set > self.scale.dc_ohm_max {
            self.resistance_set = self.scale.dc_ohm_max;
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
        if self.i_percent < 0 {
            self.i_percent = 0;
            err = ErrorCode::ParamErr;
        }
        if self.i_percent >= 100 {
            self.i_percent = 100;
            self.no_toggle = true;
            err = ErrorCode::ParamErr;
        }
        if self.pw_on_time_ms < 1 {
            self.pw_on_time_ms = 1;
            err = ErrorCode::ParamErr;
        }
        if self.pw_off_time_ms < 0 {
            self.pw_off_time_ms = 0;
            err = ErrorCode::ParamErr;
        }
        if self.pw_off_time_ms == 0 {
            self.no_toggle = true;
        }
        if self.track_channel > 127 {
            self.track_channel = 255;
        } else if self.track_channel > 7 {
            self.track_channel = 7;
        }
        if self.power_set > self.eeprom.pmax() {
            self.power_set = self.eeprom.pmax();
        }
        if self.power_set < 0.0 {
            self.power_set = 0.0;
            err = ErrorCode::ParamErr;
        }
        let max_voltage = self.active_voltage_limit();
        if self.voltage_cutoff > max_voltage {
            self.voltage_cutoff = max_voltage;
        }
        if self.voltage_cutoff < 0.0 {
            self.voltage_cutoff = 0.0;
            err = ErrorCode::ParamErr;
        }
        if self.mode.is_resistance() {
            self.no_toggle = true;
        }
        err
    }

    pub fn fault_check(&mut self) {
        self.poll_temperature();
        let on_voltage = self.read_voltage_phase(true);
        self.faults.over_temp = self.temperature_c.unwrap_or(0.0) > TEMPERATURE_MAX_C;
        self.faults.over_voltage = on_voltage > self.active_voltage_limit();
        self.faults.over_power = self.psoa > self.eeprom.pmax();
        if on_voltage < self.voltage_cutoff && self.voltage_cutoff > 0.0 {
            self.faults.low_volt = true;
            self.output_enabled = false;
        }
        self.status.overload_flag = self.faults.any();
        self.update_output_drive();
    }

    pub fn chores(&mut self) {
        self.service_cycle();
    }

    pub fn service_cycle(&mut self) {
        if self.mode.is_power() {
            self.set_level_dac_p();
        }

        let measurements = self.refresh_measurements();
        self.last_measurement = measurements;
        self.measured_voltage = measurements.voltage_on;
        self.measured_current = measurements.current_on;
        self.power_on = measurements.power_on;
        self.power_off = measurements.power_off;
        self.measured_power = measurements.power_avg;
        self.current_amp = measurements.current_on;
        self.current_voltage = measurements.voltage_on;

        self.psoa = match self.mode {
            Mode::OutputOff => 0.0,
            Mode::RHiVolt | Mode::RLoVolt => {
                if self.resistance_set > 0.0 {
                    measurements.voltage_on * measurements.voltage_on / self.resistance_set
                } else {
                    0.0
                }
            }
            Mode::PHiVolt | Mode::PLoVolt => self.eeprom.pmax(),
            Mode::IHiVolt | Mode::ILoVolt => measurements.voltage_on * self.current_set,
        };

        let _ = self.get_ri();
        self.fault_check();
        self.werte_on_lcd();
        self.emit_periodic_telemetry();
        self.emit_trigger_telemetry();
    }

    pub fn check_ser(&mut self) {
        self.service_step(20);
    }

    pub fn check_delay(&mut self, delay_ms: u8) {
        for _ in 0..delay_ms {
            self.service_step(20);
        }
    }

    pub fn service_step(&mut self, elapsed_ms: u32) {
        self.service_elapsed_ms += elapsed_ms;
        self.integration_elapsed_ms += elapsed_ms;

        while self.service_elapsed_ms >= SERVICE_INTERVAL_MS {
            self.service_elapsed_ms -= SERVICE_INTERVAL_MS;
            self.service_cycle();
        }

        while self.integration_elapsed_ms >= INTEGRATION_INTERVAL_MS {
            self.integration_elapsed_ms -= INTEGRATION_INTERVAL_MS;
            self.integrate_energy();
        }
    }

    pub fn init_all(&mut self) {
        self.mode = Mode::IHiVolt;
        self.status = RuntimeStatus::default();
        self.faults = ProtectionFlags::default();
        self.output_enabled = true;
        self.current_scale_factor = 1.0;
        self.current_set = 0.0;
        self.power_set = 0.0;
        self.voltage_cutoff = self.eeprom.init_volt();
        self.resistance_set = 100.0;
        self.shunt_range = AUTO_SHUNT_RANGE;
        self.old_shunt_select = u8::MAX;
        self.modify = Modify::LowerMainMenu;
        self.service_elapsed_ms = 0;
        self.integration_elapsed_ms = 0;
        self.fault_timer_byte = 0;
        self.temperature_timer = 0;
        self.trig_on_sema = false;
        self.trig_off_sema = false;
        self.serial_input.clear();
        self.completed_command = None;

        self.init_scales();
        self.set_level_dac_i();
        self.fault_check();

        self.current_scale_factor = 1.0;
        self.current_set = self.eeprom.init_amp();
        self.resistance_set = 100.0;
        self.i_percent = self.eeprom.init_i_percent();
        self.pw_on_time_ms = self.eeprom.init_ton();
        self.pw_off_time_ms = self.eeprom.init_toff();
        self.check_limits();
        self.set_level_dac_i();
        self.reset_energy_counters();

        self.hw.lcd_write_line(0, VERS3_STR);
        if self.eeprom.ee_initialised == 0xAA55 {
            self.hw
                .lcd_write_line(1, &format!("Adr {}", self.slave_channel));
        } else {
            self.hw.lcd_write_line(1, "EEPROM EMPTY!");
        }

        self.hw.serial_write(VERS1_STR);
        self.ser_crlf();
    }

    pub fn set_mode(&mut self, mode: Mode) {
        self.mode = mode;
        self.init_scales();
        match self.mode {
            Mode::OutputOff => {
                self.output_enabled = false;
                self.set_level_dac_i();
            }
            Mode::IHiVolt | Mode::ILoVolt => {
                self.output_enabled = true;
                self.set_level_dac_i();
            }
            Mode::RHiVolt | Mode::RLoVolt => {
                self.output_enabled = true;
                self.set_level_dac_r();
            }
            Mode::PHiVolt | Mode::PLoVolt => {
                self.output_enabled = true;
                self.set_level_dac_p();
            }
        }
    }

    pub fn set_mode_from_raw(&mut self, raw: u8) -> ErrorCode {
        if let Some(mode) = Mode::from_raw(raw) {
            self.mode = mode;
            self.check_limits()
        } else {
            self.mode = Mode::OutputOff;
            ErrorCode::ParamErr
        }
    }

    pub fn set_trigger_mask(&mut self, mask: u8) {
        self.trigger_mask = mask;
        self.eeprom.trig_mask = mask;
    }

    pub fn clear_low_voltage_fault(&mut self, reset_cutoff: bool) {
        self.faults.low_volt = false;
        if reset_cutoff {
            self.voltage_cutoff = 0.0;
        }
        self.output_enabled = true;
        self.fault_check();
    }

    pub fn set_voltage_cutoff(&mut self, voltage: Float) {
        self.clear_low_voltage_fault(false);
        self.voltage_cutoff = voltage;
        self.check_limits();
    }

    pub fn set_fuse_blown(&mut self, blown: bool) {
        self.faults.fuse_blown = blown;
        self.status.overload_flag = self.faults.any();
        self.update_output_drive();
    }

    pub fn reset_energy_counters(&mut self) {
        self.capacity_ah = 0.0;
        self.capacity_wh = 0.0;
    }

    pub fn push_serial_char(&mut self, ch: char) -> Option<String> {
        self.service_step(20);
        match ch {
            '\u{08}' => {
                self.serial_input.pop();
                None
            }
            '\r' => {
                let command = core::mem::take(&mut self.serial_input);
                self.completed_command = Some(command.clone());
                Some(command)
            }
            '\u{20}'..='\u{7f}' => {
                self.serial_input.push(ch);
                None
            }
            _ => None,
        }
    }

    pub fn take_completed_command(&mut self) -> Option<String> {
        self.completed_command.take()
    }

    fn use_on_phase(&self, requested_on_phase: bool) -> bool {
        self.no_toggle || requested_on_phase
    }

    fn trigin_enabled(&self) -> bool {
        (self.trigger_mask & 0x01) != 0
    }

    fn trigauto_enabled(&self) -> bool {
        (self.trigger_mask & 0x02) != 0
    }

    fn lm75_intern_enabled(&self) -> bool {
        (self.scale.options & LM75_INTERNAL_BIT) != 0
    }

    fn lm75_extern_enabled(&self) -> bool {
        (self.scale.options & LM75_EXTERNAL_BIT) != 0
    }

    fn active_voltage_limit(&self) -> Float {
        if self.mode.is_low_voltage() {
            self.eeprom.voltage_limit_lo()
        } else {
            self.eeprom.voltage_limit_hi()
        }
    }

    fn apply_shunt_change(&mut self, shunt: u8) {
        if shunt != self.old_shunt_select {
            self.dac_raw_active = 0;
            self.hw.set_dac_raw(0);
        }
        self.set_shunt(shunt);
        self.old_shunt_select = self.shunt_select;
    }

    fn quantize_dac(&self, value: Float, offset: i16) -> u16 {
        let raw = value.round() as i32 + i32::from(offset);
        raw.clamp(0, i32::from(self.scale.dac_max)) as u16
    }

    fn update_output_drive(&mut self) {
        let enabled = self.mode != Mode::OutputOff && self.output_enabled && !self.faults.any();
        self.hw.set_output_enabled(enabled);
        if enabled {
            self.dac_raw_active = self.dac_raw_on;
            self.hw.set_dac_raw(self.dac_raw_active);
        } else {
            self.dac_raw_active = 0;
            self.hw.set_dac_raw(0);
        }
    }

    fn refresh_measurements(&mut self) -> MeasurementSnapshot {
        let voltage_on = self.read_voltage_phase(true);
        let current_on = self.read_current_phase(true);
        let voltage_off = self.read_voltage_phase(false);
        let current_off = self.read_current_phase(false);
        let power_on = if self.output_enabled {
            voltage_on * current_on
        } else {
            0.0
        };
        let power_off = if self.output_enabled {
            voltage_off * current_off
        } else {
            0.0
        };
        let total_time = (self.pw_on_time_ms + self.pw_off_time_ms).max(1) as Float;
        let power_avg = if self.output_enabled {
            (power_on * self.pw_on_time_ms.max(0) as Float
                + power_off * self.pw_off_time_ms.max(0) as Float)
                / total_time
        } else {
            0.0
        };

        MeasurementSnapshot {
            voltage_on,
            current_on,
            voltage_off,
            current_off,
            power_on,
            power_off,
            power_avg,
        }
    }

    fn emit_periodic_telemetry(&mut self) {
        if self.fault_timer_byte == 0 {
            if self.trigauto_enabled() {
                self.emit_measurement_channel(10, self.last_measurement.voltage_on);
                self.emit_measurement_channel(11, self.last_measurement.current_on);
                if !self.no_toggle {
                    self.emit_measurement_channel(15, self.last_measurement.voltage_off);
                    self.emit_measurement_channel(16, self.last_measurement.current_off);
                }
            }
            if self.faults.any() {
                self.ser_prompt(ErrorCode::OvlErr);
            }
            self.fault_timer_byte = PERIODIC_TELEMETRY_CYCLES;
        }
        self.fault_timer_byte = self.fault_timer_byte.saturating_sub(1);
    }

    fn emit_trigger_telemetry(&mut self) {
        if !self.trigin_enabled() {
            return;
        }

        if self.hw.read_trigger_in() {
            if !self.trig_on_sema {
                self.emit_measurement_channel(10, self.last_measurement.voltage_on);
                self.emit_measurement_channel(11, self.last_measurement.current_on);
                self.trig_on_sema = true;
                self.trig_off_sema = false;
            }
        } else if !self.trig_off_sema {
            self.emit_measurement_channel(15, self.last_measurement.voltage_off);
            self.emit_measurement_channel(16, self.last_measurement.current_off);
            self.trig_off_sema = true;
            self.trig_on_sema = false;
        }
    }

    fn emit_measurement_channel(&mut self, sub_channel: u8, value: Float) {
        self.sub_channel = sub_channel;
        self.write_ch_prefix();
        self.hw.serial_write(&self.param_to_str(value));
        self.ser_crlf();
    }

    fn integrate_energy(&mut self) {
        if self.pw_off_time_ms == 0 || self.i_percent == 100 {
            self.capacity_ah += self.current_amp / (3600.0 * 5.0);
            self.capacity_wh += self.current_amp * self.current_voltage / (3600.0 * 5.0);
        } else {
            self.reset_energy_counters();
        }
    }

    fn poll_temperature(&mut self) {
        if !(self.lm75_intern_enabled() || self.lm75_extern_enabled()) {
            self.temperature_c = Some(0.0);
            return;
        }
        if self.temperature_timer == 0 {
            self.temperature_timer = TEMPERATURE_POLL_CYCLES;
            self.get_lm75_temp();
        }
        self.temperature_timer = self.temperature_timer.saturating_sub(1);
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[derive(Debug, Default, Clone)]
    struct MockHardware {
        voltage_on: u16,
        voltage_off: u16,
        current_on: u16,
        current_off: u16,
        voltage10: i16,
        current10: i16,
        temp_c: Option<Float>,
        trigger_in: bool,
        shunts: Vec<u8>,
        outputs: Vec<bool>,
        dacs: Vec<u16>,
        serial: Vec<String>,
        lcd: Vec<(u8, String)>,
    }

    impl MockHardware {
        fn serial_joined(&self) -> String {
            self.serial.join("")
        }
    }

    impl EdlHardware for MockHardware {
        fn read_voltage_adc16(&mut self, on_phase: bool) -> u16 {
            if on_phase {
                self.voltage_on
            } else {
                self.voltage_off
            }
        }

        fn read_current_adc16(&mut self, on_phase: bool) -> u16 {
            if on_phase {
                self.current_on
            } else {
                self.current_off
            }
        }

        fn read_voltage_adc10(&mut self) -> i16 {
            self.voltage10
        }

        fn read_current_adc10(&mut self) -> i16 {
            self.current10
        }

        fn set_shunt(&mut self, shunt_index: u8) {
            self.shunts.push(shunt_index);
        }

        fn set_output_enabled(&mut self, enabled: bool) {
            self.outputs.push(enabled);
        }

        fn set_dac_raw(&mut self, raw: u16) {
            self.dacs.push(raw);
        }

        fn read_temp_c(&mut self) -> Option<Float> {
            self.temp_c
        }

        fn serial_write(&mut self, text: &str) {
            self.serial.push(text.to_string());
        }

        fn lcd_write_line(&mut self, row: u8, text: &str) {
            self.lcd.push((row, text.to_string()));
        }

        fn read_trigger_in(&mut self) -> bool {
            self.trigger_in
        }
    }

    fn test_eeprom() -> EepromData {
        let mut eeprom = EepromData::default();
        eeprom.adc_u_offsets = [0, 0];
        eeprom.adc_u_scales = [1.0, 1.0];
        eeprom.adc_i_offsets = [0, 0, 0, 0];
        eeprom.adc_i_scales = [1.0, 1.0, 1.0, 1.0];
        eeprom.dac_i_offsets = [0, 0, 0, 0];
        eeprom.dac_i_scales = [1.0, 1.0, 1.0, 1.0];
        eeprom.option_array[OPT_INIT_LOW_DIVIDER_U] = 1.0;
        eeprom.option_array[OPT_INIT_HI_DIVIDER_U] = 1.0;
        eeprom.option_array[OPT_INIT_GAIN_I] = 1.0;
        eeprom.option_array[OPT_UREF] = 1.0;
        eeprom.option_array[OPT_PMAX] = 2.0;
        eeprom.option_array[OPT_RSENSE_BASE..OPT_RSENSE_BASE + 4]
            .copy_from_slice(&[10.0, 1.0, 0.5, 0.1]);
        eeprom.option_array[OPT_IMAX_BASE..OPT_IMAX_BASE + 4]
            .copy_from_slice(&[0.01, 0.1, 0.5, 2.0]);
        eeprom.option_array[OPT_UMAX_HI] = 2.0;
        eeprom.option_array[OPT_UMAX_LO] = 1.0;
        eeprom.option_array[OPT_INIT_IPERCENT] = 100.0;
        eeprom.option_array[OPT_INIT_TON] = 10.0;
        eeprom.option_array[OPT_INIT_TOFF] = 0.0;
        eeprom.option_array[OPT_INIT_OPTIONS] = 4.0;
        eeprom
    }

    #[test]
    fn default_eeprom_matches_pascal_layout() {
        let eeprom = EepromData::default();
        assert_eq!(eeprom.dac_i_offsets, [0, 0, 0, 0]);
        assert_eq!(eeprom.adc_u_offsets, [-260, -260]);
        assert_eq!(eeprom.option_array[OPT_INIT_AMP], 0.02);
        assert_eq!(eeprom.option_array[OPT_RSENSE_BASE], 100.0);
        assert_eq!(eeprom.option_array[OPT_RSENSE_BASE + 3], 0.1);
        assert_eq!(eeprom.option_array[OPT_IMAX_BASE], 0.002);
        assert_eq!(eeprom.option_array[OPT_IMAX_BASE + 3], 2.0);
        assert_eq!(eeprom.option_array[OPT_UMAX_HI], 25.0);
        assert_eq!(eeprom.option_array[OPT_UMAX_LO], 6.1);
        assert_eq!(eeprom.option_array[OPT_INIT_OPTIONS], 4.0);
        assert_eq!(eeprom.option_array[OPT_INIT_TON], 10.0);
        assert_eq!(eeprom.option_array[OPT_INIT_TOFF], 0.0);
        assert_eq!(eeprom.option_array[OPT_INIT_FAN_TEMP], 50.0);
    }

    #[test]
    fn check_limits_restores_clamps_and_ripple_normalization() {
        let hw = MockHardware::default();
        let mut state = DeviceState::with_eeprom(hw, test_eeprom());
        state.mode = Mode::RLoVolt;
        state.init_scales();
        state.resistance_set = 0.01;
        state.current_set = 5.0;
        state.i_percent = 150;
        state.pw_on_time_ms = 0;
        state.pw_off_time_ms = -5;
        state.power_set = 5.0;
        state.voltage_cutoff = 5.0;
        state.track_channel = 9;

        let err = state.check_limits();

        assert_eq!(err, ErrorCode::ParamErr);
        assert_eq!(state.resistance_set, state.scale.dc_ohm_min);
        assert_eq!(state.current_set, 2.0);
        assert_eq!(state.i_percent, 100);
        assert_eq!(state.pw_on_time_ms, 1);
        assert_eq!(state.pw_off_time_ms, 0);
        assert_eq!(state.power_set, 2.0);
        assert_eq!(state.voltage_cutoff, 1.0);
        assert_eq!(state.track_channel, 7);
        assert!(state.no_toggle);
    }

    #[test]
    fn status_prompt_reports_each_fault_instead_of_single_overload_bit() {
        let hw = MockHardware::default();
        let mut state = DeviceState::with_eeprom(hw, test_eeprom());
        state.faults = ProtectionFlags {
            over_power: true,
            fuse_blown: false,
            over_voltage: true,
            over_temp: true,
            low_volt: true,
        };
        state.status.overload_flag = true;
        let frame = state.status_frame(ErrorCode::NoErr);

        assert!(frame.contains("[OVRPOWR]"));
        assert!(frame.contains("[OVRVOLT]"));
        assert!(frame.contains("[OVRTEMP]"));
        assert!(frame.contains("[LOWVOLT]"));
        assert!(frame.starts_with("#0:255=61 "));
    }

    #[test]
    fn current_and_resistance_modes_restore_auto_range_behavior() {
        let hw = MockHardware::default();
        let mut state = DeviceState::with_eeprom(hw, test_eeprom());

        state.mode = Mode::IHiVolt;
        state.current_set = 0.2;
        state.i_percent = 50;
        state.pw_off_time_ms = 10;
        state.check_limits();
        state.set_level_dac_i();
        assert_eq!(state.shunt_select, 2);
        assert!(state.dac_raw_on > state.dac_raw_off);

        state.mode = Mode::RLoVolt;
        state.init_scales();
        state.resistance_set = 0.05;
        state.check_limits();
        state.set_level_dac_r();
        assert_eq!(state.shunt_select, 3);
        assert_eq!(state.dac_raw_on, state.dac_raw_off);
        assert_eq!(state.hw.shunts.last().copied(), Some(3));
    }

    #[test]
    fn init_all_restores_startup_constants_and_banner() {
        let hw = MockHardware::default();
        let mut state = DeviceState::with_eeprom(hw, test_eeprom());

        state.init_all();

        assert_eq!(state.mode, Mode::IHiVolt);
        assert!(state.output_enabled);
        assert_eq!(state.current_set, state.eeprom.init_amp());
        assert_eq!(state.shunt_range, AUTO_SHUNT_RANGE);
        assert_eq!(state.capacity_ah, 0.0);
        assert_eq!(state.capacity_wh, 0.0);
        assert!(state.hw.serial_joined().contains(VERS1_STR));
        assert!(state
            .hw
            .lcd
            .iter()
            .any(|(row, text)| *row == 0 && text == VERS3_STR));
    }

    #[test]
    fn service_cycle_restores_off_phase_sampling_average_power_and_telemetry() {
        let hw = MockHardware {
            voltage_on: 32_768,
            voltage_off: 65_535,
            current_on: 65_535,
            current_off: 32_768,
            ..MockHardware::default()
        };
        let mut state = DeviceState::with_eeprom(hw, test_eeprom());
        state.init_all();
        state.mode = Mode::IHiVolt;
        state.output_enabled = true;
        state.i_percent = 50;
        state.pw_on_time_ms = 3;
        state.pw_off_time_ms = 1;
        state.set_trigger_mask(0x02);
        state.check_limits();
        state.service_cycle();

        assert!((state.last_measurement.voltage_on - 32_768.0 / 65_535.0).abs() < 0.0001);
        assert!((state.last_measurement.voltage_off - 1.0).abs() < 0.0001);
        assert!((state.measured_power - 0.5).abs() < 0.0001);
        assert!((state.internal_resistance - 1.0).abs() < 0.0002);
        let serial = state.hw.serial_joined();
        assert!(serial.contains("#0:10="));
        assert!(serial.contains("#0:11="));
        assert!(serial.contains("#0:15="));
        assert!(serial.contains("#0:16="));
    }

    #[test]
    fn output_off_zeroes_current_and_normalizes_off_phase_when_ripple_is_disabled() {
        let hw = MockHardware {
            voltage_on: 40_000,
            voltage_off: 50_000,
            current_on: 30_000,
            current_off: 10_000,
            ..MockHardware::default()
        };
        let mut state = DeviceState::with_eeprom(hw, test_eeprom());
        state.init_all();
        state.output_enabled = false;
        state.i_percent = 100;
        state.pw_off_time_ms = 0;
        state.check_limits();

        let on_voltage = state.read_voltage_phase(true);
        let off_voltage = state.read_voltage_phase(false);
        let off_current = state.read_current_phase(false);
        state.service_cycle();

        assert!((on_voltage - off_voltage).abs() < 0.0001);
        assert_eq!(off_current, 0.0);
        assert_eq!(state.measured_current, 0.0);
        assert_eq!(state.measured_power, 0.0);
    }

    #[test]
    fn energy_integration_accumulates_and_resets_like_pascal() {
        let hw = MockHardware {
            voltage_on: 65_535,
            voltage_off: 65_535,
            current_on: 65_535,
            current_off: 65_535,
            ..MockHardware::default()
        };
        let mut state = DeviceState::with_eeprom(hw, test_eeprom());
        state.init_all();
        state.output_enabled = true;
        state.i_percent = 100;
        state.pw_off_time_ms = 0;
        state.check_limits();
        state.service_step(200);

        assert!(state.capacity_ah > 0.0);
        assert!(state.capacity_wh > 0.0);

        state.i_percent = 50;
        state.pw_off_time_ms = 10;
        state.check_limits();
        state.service_step(200);
        assert_eq!(state.capacity_ah, 0.0);
        assert_eq!(state.capacity_wh, 0.0);

        state.capacity_ah = 1.0;
        state.capacity_wh = 2.0;
        state.reset_energy_counters();
        assert_eq!(state.capacity_ah, 0.0);
        assert_eq!(state.capacity_wh, 0.0);
    }
}
