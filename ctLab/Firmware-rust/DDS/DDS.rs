//! Best-effort Rust port of `DDS.pas`.
//!
//! The Pascal firmware mixes parser handling, panel state, serial framing,
//! measurement range control, and DDS output control in one unit. This Rust
//! version keeps that single-state-machine shape, but expresses the AVR-facing
//! parts through an explicit hardware trait.

#![allow(dead_code)]

pub type Float = f32;

pub const PROC_CLOCK: u32 = 16_000_000;
pub const VERS1_STR: &str = "3.71 [DDS by CM/c't 03/2007]";
pub const VERS3_STR: &str = "DDS 3.71";
pub const ADR_STR: &str = "Adr ";
pub const EE_NOT_PROGRAMMED_STR: &str = "EEPROM EMPTY! ";

pub const CMD_STR_ARR: [&str; 22] = [
    "STR", "IDN", "TRG", "VAL", "FRQ", "LVL", "LVP", "DBU", "WAV", "BST", "AUX", "INL", "RNG",
    "DCO", "DSP", "ALL", "OPT", "SCL", "WEN", "ERC", "SBD", "NOP",
];

pub const CMD2_SUB_CH_ARR: [u8; 22] = [
    255, 254, 249, 0, 0, 1, 2, 3, 4, 5, 9, 10, 19, 20, 80, 99, 150, 200, 250, 251, 252, 0,
];

const ERR_SUB_CH: u8 = 255;
const EEPROM_INITIALIZED: u16 = 0xAA55;
const MAX_FREQUENCY_TENTHS_HZ: i32 = 9_999_999;
const MAX_OFFSET_MV: i32 = 10_000;
const DAC_LEVEL_MAX: Float = 4_000.0;
const MIN_DB: Float = -70.0;
const DB_REFERENCE_MV: Float = 774.597;
const TRIANGLE_RMS_FACTOR: Float = 0.816_496;
const TRIANGLE_DAC_FACTOR: Float = 1.224_745;
const SQUARE_RMS_FACTOR: Float = 1.414_21;
const SQUARE_DAC_FACTOR: Float = 0.707_11;
const PEAK_FACTOR: Float = 2.828_427_1;
const DDS_FACTORS: [u32; 8] = [64_000_000, 6_400_000, 640_000, 64_000, 6_400, 640, 64, 6];
const INP_GAINS: [Float; 4] = [0.1, 1.0, 10.0, 100.0];
const TERZ_ARRAY: [i32; 32] = [
    200, 250, 315, 400, 500, 630, 800, 1000, 1250, 1600, 2000, 2500, 3150, 4000, 5000, 6300,
    8000, 10000, 12500, 16000, 20000, 25000, 31500, 40000, 50000, 63000, 80000, 100000, 125000,
    160000, 200000, 0,
];

const ERR_LABELS: [&str; 8] = [
    "[OK]",
    "[SRQUSR]",
    "[BUSY]",
    "[OVERLD]",
    "[CMDERR]",
    "[PARERR]",
    "[LOCKED]",
    "[CHKSUM]",
];

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum CmdWhich {
    Str,
    Idn,
    Trg,
    Val,
    Frq,
    Lvl,
    Lvp,
    Dbv,
    Wav,
    Bst,
    Aux,
    Inl,
    Rng,
    Ofs,
    Dsp,
    All,
    Opt,
    Scl,
    Wen,
    Erc,
    Sbd,
    Nop,
    Err,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
#[repr(u8)]
pub enum Modify {
    WaveSel = 0,
    FreqSel = 1,
    AmplSel = 2,
    PeakSel = 3,
    InpSel = 4,
    BurstSel = 5,
    DcSel = 6,
}

impl Modify {
    fn from_byte(value: u8) -> Option<Self> {
        Some(match value {
            0 => Self::WaveSel,
            1 => Self::FreqSel,
            2 => Self::AmplSel,
            3 => Self::PeakSel,
            4 => Self::InpSel,
            5 => Self::BurstSel,
            6 => Self::DcSel,
            _ => return None,
        })
    }

    fn next(self) -> Self {
        Self::from_byte((self as u8 + 1) % 7).unwrap_or(Self::WaveSel)
    }

    fn prev(self) -> Self {
        Self::from_byte((self as u8 + 6) % 7).unwrap_or(Self::WaveSel)
    }
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
pub enum Waveform {
    Off,
    Sine,
    Triangle,
    Square,
    Logic,
    External(u8),
}

impl Waveform {
    pub fn from_byte(value: u8) -> Self {
        match value {
            0 => Self::Off,
            1 => Self::Sine,
            2 => Self::Triangle,
            3 => Self::Square,
            4 => Self::Logic,
            5..=249 => Self::External(value - 5),
            _ => Self::Off,
        }
    }

    pub fn as_byte(self) -> u8 {
        match self {
            Self::Off => 0,
            Self::Sine => 1,
            Self::Triangle => 2,
            Self::Square => 3,
            Self::Logic => 4,
            Self::External(index) => 5u8.saturating_add(index),
        }
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
#[repr(u8)]
pub enum InputRange {
    Ac100mV = 0,
    Ac1V = 1,
    Ac10V = 2,
    Ac100V = 3,
    NoRange = 4,
}

impl InputRange {
    pub fn from_byte(value: u8) -> Self {
        match value {
            0 => Self::Ac100mV,
            1 => Self::Ac1V,
            2 => Self::Ac10V,
            3 => Self::Ac100V,
            _ => Self::NoRange,
        }
    }

    pub fn as_byte(self) -> u8 {
        self as u8
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
        (self.error_low_nibble & 0x0f)
            | ((self.ee_unlocked as u8) << 4)
            | ((self.overload_flag as u8) << 5)
            | ((self.user_srq_flag as u8) << 6)
            | ((self.busy_flag as u8) << 7)
    }
}

#[derive(Debug, Clone)]
pub struct EepromData {
    pub ee_initialized: u16,
    pub init_frequency_tenths_hz: i32,
    pub init_logic_level_mv: Float,
    pub init_level_mv: Float,
    pub init_db: Float,
    pub init_wave: u8,
    pub init_burst: u8,
    pub init_offset_v: Float,
    pub init_pwr_gain: Float,
    pub init_attn_fac: Float,
    pub init_inc_rast: i32,
    pub init_terz_num: u8,
    pub level_scale_low: Float,
    pub level_scale_high: Float,
    pub adc_scales: [Float; 4],
    pub ee_ser_baud_reg: u8,
}

impl Default for EepromData {
    fn default() -> Self {
        Self {
            ee_initialized: EEPROM_INITIALIZED,
            init_frequency_tenths_hz: 10_000,
            init_logic_level_mv: 5_000.0,
            init_level_mv: 774.6,
            init_db: 0.0,
            init_wave: 1,
            init_burst: 0,
            init_offset_v: 0.0,
            init_pwr_gain: 2.0,
            init_attn_fac: 40.0,
            init_inc_rast: 4,
            init_terz_num: 17,
            level_scale_low: 1.0,
            level_scale_high: 1.0,
            adc_scales: [1.0, 1.0, 1.0, 1.0],
            ee_ser_baud_reg: 51,
        }
    }
}

pub trait DdsHardware {
    fn send_dds_frequency_word(&mut self, word: u32);
    fn send_amplitude_word(&mut self, word: u16);
    fn set_waveform(&mut self, waveform: Waveform);
    fn set_input_range(&mut self, range: InputRange);
    fn send_aux_config(&mut self, value: u8);
    fn read_input_level(&mut self) -> Float;
    fn read_input_overload(&mut self) -> bool {
        false
    }
    fn serial_write(&mut self, text: &str);
    fn serial_read(&mut self) -> Option<char>;
    fn lcd_write_line(&mut self, row: u8, text: &str);
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum PanelEvent {
    EncoderDelta(i16),
    ToggleFine,
    NextModify,
    PrevModify,
    ReleaseBusy,
}

#[derive(Debug, Clone)]
pub struct DeviceState<H> {
    pub hw: H,
    pub eeprom: EepromData,
    pub status: RuntimeStatus,
    pub slave_channel: u8,
    pub current_channel: u8,
    pub frequency_tenths_hz: i32,
    pub terz_num: u8,
    pub offset_mv: i32,
    pub dac_level: Float,
    pub dac_level_max: Float,
    pub db: Float,
    pub db_max: Float,
    pub pwr_gain: Float,
    pub attn_fac: Float,
    pub attn_switch_point: Float,
    pub waveform: Waveform,
    pub burst_mode: u8,
    pub burst_count: u8,
    pub burst_gate_open: bool,
    pub input_level_mv: Float,
    pub range: InputRange,
    pub old_range: InputRange,
    pub range_str: String,
    pub input_gain_fac: Float,
    pub panel_modify: Modify,
    pub inc_rast: i32,
    pub changed_flag: bool,
    pub first_turn: bool,
    pub err_count: i32,
    pub err_flag: bool,
    pub ser_input: String,
    pub param_str: String,
}

impl<H: DdsHardware> DeviceState<H> {
    pub fn new(hw: H) -> Self {
        let mut state = Self {
            hw,
            eeprom: EepromData::default(),
            status: RuntimeStatus::default(),
            slave_channel: 0,
            current_channel: 255,
            frequency_tenths_hz: 10_000,
            terz_num: 17,
            offset_mv: 0,
            dac_level: 1.0,
            dac_level_max: DAC_LEVEL_MAX,
            db: 0.0,
            db_max: 0.0,
            pwr_gain: 2.0,
            attn_fac: 40.0,
            attn_switch_point: DAC_LEVEL_MAX / 40.0,
            waveform: Waveform::Sine,
            burst_mode: 0,
            burst_count: 1,
            burst_gate_open: true,
            input_level_mv: 0.0,
            range: InputRange::Ac1V,
            old_range: InputRange::NoRange,
            range_str: String::from("In    1V"),
            input_gain_fac: 1.0,
            panel_modify: Modify::FreqSel,
            inc_rast: 4,
            changed_flag: false,
            first_turn: true,
            err_count: 0,
            err_flag: false,
            ser_input: String::new(),
            param_str: String::new(),
        };
        state.patch_copy_from_ee();
        state.switch_range();
        state.db = state.dac_level_to_db(state.dac_level);
        state
    }

    fn pascal_byte(value: Float) -> u8 {
        (value as i32) as u8
    }

    fn format_param(value: Float, decimals: usize) -> String {
        if value.abs() < 0.000_05 {
            "0".to_string()
        } else {
            format!("{value:.decimals$}")
        }
    }

    fn format_param_pm(value: Float, decimals: usize) -> String {
        let mut text = Self::format_param(value, decimals);
        if !text.starts_with('-') {
            text.insert(0, '+');
        }
        text
    }

    fn format_tenths_hz(value: i32) -> String {
        Self::format_param(value as Float / 10.0, 1)
    }

    fn write_ch_prefix(&mut self, sub_ch: u8) {
        self.hw
            .serial_write(&format!("#{}:{}=", self.slave_channel, sub_ch));
    }

    pub fn ser_crlf(&mut self) {
        self.hw.serial_write("\r\n");
    }

    pub fn write_ser_inp(&mut self, text: &str) {
        self.hw.serial_write(text);
        self.ser_crlf();
    }

    fn write_param_str_ser(&mut self, sub_ch: u8, value: &str) {
        self.write_ch_prefix(sub_ch);
        self.hw.serial_write(value);
        self.ser_crlf();
    }

    fn write_param_byte_ser(&mut self, sub_ch: u8, value: u8) {
        self.write_param_str_ser(sub_ch, &value.to_string());
    }

    fn ser_prompt(&mut self, err: ErrorCode, status: u8, verbose: bool) {
        if verbose || err != ErrorCode::NoErr {
            self.write_ch_prefix(ERR_SUB_CH);
            self.hw
                .serial_write(&(status.wrapping_add(err as u8)).to_string());
            self.hw.serial_write(" ");
            self.hw.serial_write(ERR_LABELS[err as usize]);
            self.ser_crlf();
        }

        if err != ErrorCode::NoErr {
            self.err_count += 1;
            self.err_flag = true;
        }
    }

    pub fn patch_copy_from_ee(&mut self) {
        self.waveform = Waveform::from_byte(self.eeprom.init_wave);
        self.pwr_gain = self.eeprom.init_pwr_gain;
        self.frequency_tenths_hz = self.eeprom.init_frequency_tenths_hz;
        self.dac_level = self.rms_to_dac_level(self.eeprom.init_level_mv);
        self.db = self.eeprom.init_db;
        self.terz_num = self.eeprom.init_terz_num;
        self.offset_mv = (self.eeprom.init_offset_v * 1000.0) as i32;
        self.burst_mode = self.eeprom.init_burst;
        self.inc_rast = self.eeprom.init_inc_rast;
        self.dac_level_max = DAC_LEVEL_MAX;
        self.attn_fac = self.eeprom.init_attn_fac;
        self.attn_switch_point = self.dac_level_max / self.attn_fac.max(0.001);
        self.burst_gate_open = true;
        self.set_limits();
    }

    pub fn on_sys_tick(&mut self) {
        self.input_level_mv = self.hw.read_input_level();
        self.status.overload_flag = self.hw.read_input_overload();

        if self.burst_mode != 0 {
            if self.burst_count == 1 {
                self.burst_gate_open = true;
                self.hw.set_waveform(self.effective_waveform());
            }

            if self.burst_count == 0 {
                self.burst_gate_open = false;
                self.hw.set_waveform(Waveform::Off);
                self.burst_count = self.burst_mode.saturating_add(1);
            }

            self.burst_count = self.burst_count.wrapping_sub(1);
        }
    }

    pub fn dac_level_to_rms(&self, mut level: Float) -> Float {
        level *= self.pwr_gain;
        match self.waveform {
            Waveform::Triangle => level * TRIANGLE_RMS_FACTOR,
            Waveform::Square | Waveform::Logic => level * SQUARE_RMS_FACTOR,
            _ => level,
        }
    }

    pub fn rms_to_dac_level(&self, mut level: Float) -> Float {
        level /= self.pwr_gain.max(0.001);
        match self.waveform {
            Waveform::Triangle => level * TRIANGLE_DAC_FACTOR,
            Waveform::Square | Waveform::Logic => level * SQUARE_DAC_FACTOR,
            _ => level,
        }
    }

    pub fn level_to_db(&self, level: Float) -> Float {
        20.0 * (level / DB_REFERENCE_MV).log10()
    }

    pub fn db_to_level(&self, db: Float) -> Float {
        DB_REFERENCE_MV * 10.0_f32.powf(db / 20.0)
    }

    pub fn db_to_dac_level(&self, db: Float) -> Float {
        self.rms_to_dac_level(self.db_to_level(db))
    }

    pub fn dac_level_to_db(&self, level: Float) -> Float {
        self.level_to_db(self.dac_level_to_rms(level))
    }

    pub fn dac_level_to_peak_mv(&self) -> Float {
        self.dac_level * self.pwr_gain * PEAK_FACTOR
    }

    pub fn set_limits(&mut self) {
        self.db_max = self.dac_level_to_db(self.dac_level_max);
    }

    pub fn switch_range(&mut self) {
        let adc_scale = self
            .eeprom
            .adc_scales
            .get((self.range.as_byte()).min(3) as usize)
            .copied()
            .unwrap_or(1.0);
        let inp_gain = INP_GAINS
            .get((self.range.as_byte()).min(3) as usize)
            .copied()
            .unwrap_or(1.0);
        self.input_gain_fac = inp_gain * adc_scale;

        if self.range == self.old_range {
            return;
        }

        self.old_range = self.range;
        self.range_str = match self.range {
            InputRange::Ac100mV => "In 100mV",
            InputRange::Ac1V => "In    1V",
            InputRange::Ac10V => "In   10V",
            InputRange::Ac100V => "In  100V",
            InputRange::NoRange => "In    1V",
        }
        .to_string();
        self.hw.set_input_range(self.range);
    }

    fn effective_waveform(&self) -> Waveform {
        if self.burst_mode != 0 && !self.burst_gate_open {
            Waveform::Off
        } else {
            self.waveform
        }
    }

    fn dds_tuning_word(&self) -> u32 {
        let normalized = self.frequency_tenths_hz.max(0);
        let digits = format!("{normalized:08}");
        digits
            .bytes()
            .zip(DDS_FACTORS)
            .fold(0_u32, |acc, (digit, factor)| {
                acc.saturating_add(u32::from(digit.saturating_sub(b'0')) * factor)
            })
    }

    fn effective_input_level_mv(&self) -> Float {
        if self.status.overload_flag {
            -9_999.0
        } else {
            self.input_level_mv
        }
    }

    pub fn apply_output_state(&mut self) {
        self.switch_range();
        self.hw.send_dds_frequency_word(self.dds_tuning_word());
        self.hw
            .send_amplitude_word(self.dac_level.clamp(0.0, u16::MAX as Float) as u16);
        if let Waveform::External(index) = self.waveform {
            self.hw.send_aux_config(index);
        }
        self.hw.set_waveform(self.effective_waveform());
    }

    pub fn param_str_on_lcd(&mut self) {
        self.hw.lcd_write_line(1, &self.param_str);
    }

    pub fn soll_werte_on_lcd(&mut self) {
        self.hw
            .lcd_write_line(0, &Self::format_tenths_hz(self.frequency_tenths_hz));
        self.hw
            .lcd_write_line(1, &Self::format_param(self.dac_level_to_rms(self.dac_level), 1));
    }

    pub fn check_limits(&mut self) -> bool {
        let mut out_of_range = false;

        if self.frequency_tenths_hz < 0 {
            self.frequency_tenths_hz = 0;
            out_of_range = true;
        }
        if self.frequency_tenths_hz > MAX_FREQUENCY_TENTHS_HZ {
            self.frequency_tenths_hz = MAX_FREQUENCY_TENTHS_HZ;
            out_of_range = true;
        }
        if self.dac_level <= 0.0 {
            self.dac_level = 1.0;
            out_of_range = true;
        }
        if self.dac_level > self.dac_level_max {
            self.dac_level = self.dac_level_max;
            out_of_range = true;
        }
        if self.offset_mv < -MAX_OFFSET_MV {
            self.offset_mv = -MAX_OFFSET_MV;
            out_of_range = true;
        }
        if self.offset_mv > MAX_OFFSET_MV {
            self.offset_mv = MAX_OFFSET_MV;
            out_of_range = true;
        }
        if self.db > self.db_max {
            self.db = self.db_max;
            self.dac_level = self.db_to_dac_level(self.db);
            out_of_range = true;
        }
        if self.db < MIN_DB {
            self.db = MIN_DB;
            self.dac_level = self.db_to_dac_level(self.db);
            out_of_range = true;
        }

        let wave_byte = self.waveform.as_byte();
        if wave_byte > 249 {
            self.waveform = Waveform::Off;
            out_of_range = true;
        }
        if self.terz_num > 30 {
            self.terz_num = 30;
            out_of_range = true;
        }
        if self.burst_mode > 100 {
            self.burst_mode = 100;
            out_of_range = true;
        }
        if self.range.as_byte() > InputRange::Ac100V.as_byte() {
            self.range = InputRange::Ac100mV;
            out_of_range = true;
        }

        out_of_range
    }

    fn parse_get_param(&mut self, sub_ch: u8, verbose: bool, raw_line: &str) -> Result<(), ErrorCode> {
        match sub_ch {
            0 => self.write_param_str_ser(sub_ch, &Self::format_tenths_hz(self.frequency_tenths_hz)),
            1 => self.write_param_str_ser(sub_ch, &Self::format_param(self.dac_level_to_rms(self.dac_level), 1)),
            2 => self.write_param_str_ser(sub_ch, &Self::format_param(self.dac_level_to_peak_mv(), 1)),
            3 => self.write_param_str_ser(sub_ch, &Self::format_param(self.dac_level_to_db(self.dac_level), 2)),
            4 => self.write_param_byte_ser(sub_ch, self.waveform.as_byte()),
            5 => self.write_param_byte_ser(sub_ch, self.burst_mode),
            10 | 99 => self.write_param_str_ser(sub_ch, &Self::format_param(self.effective_input_level_mv(), 1)),
            11 => self.write_param_str_ser(
                sub_ch,
                &Self::format_param(self.effective_input_level_mv() * PEAK_FACTOR, 1),
            ),
            12 => {
                let input_level = self.effective_input_level_mv();
                let value = if input_level < 0.0 {
                    input_level
                } else {
                    self.level_to_db(input_level)
                };
                self.write_param_str_ser(sub_ch, &Self::format_param(value, 2));
            }
            19 => self.write_param_byte_ser(sub_ch, self.range.as_byte()),
            20 => self.write_param_str_ser(sub_ch, &Self::format_param(self.offset_mv as Float / 1000.0, 4)),
            80 => self.write_param_byte_ser(sub_ch, self.panel_modify as u8),
            89 => self.write_param_byte_ser(sub_ch, self.inc_rast as u8),
            150 => self.write_param_str_ser(
                sub_ch,
                &Self::format_param(self.eeprom.init_frequency_tenths_hz as Float / 10.0, 1),
            ),
            151 => self.write_param_str_ser(sub_ch, &Self::format_param(self.eeprom.init_level_mv, 1)),
            152 => self.write_param_str_ser(sub_ch, &Self::format_param(self.eeprom.init_logic_level_mv, 1)),
            153 => self.write_param_str_ser(sub_ch, &Self::format_param(self.eeprom.init_db, 2)),
            154 => self.write_param_byte_ser(sub_ch, self.eeprom.init_wave),
            155 => self.write_param_byte_ser(sub_ch, self.eeprom.init_burst),
            170 => self.write_param_str_ser(sub_ch, &Self::format_param(self.eeprom.init_offset_v, 4)),
            200 => self.write_param_str_ser(sub_ch, &Self::format_param(self.eeprom.level_scale_low, 4)),
            201 => self.write_param_str_ser(sub_ch, &Self::format_param(self.eeprom.level_scale_high, 4)),
            202 => self.write_param_str_ser(sub_ch, &Self::format_param(self.pwr_gain, 4)),
            203 => self.write_param_str_ser(sub_ch, &Self::format_param(self.attn_fac, 4)),
            204 => self.write_param_str_ser(sub_ch, &Self::format_param(self.eeprom.init_logic_level_mv, 4)),
            210..=213 => self.write_param_str_ser(
                sub_ch,
                &Self::format_param(self.eeprom.adc_scales[(sub_ch - 210) as usize], 4),
            ),
            251 => self.write_param_str_ser(sub_ch, &self.err_count.to_string()),
            252 => self.write_param_byte_ser(sub_ch, self.eeprom.ee_ser_baud_reg),
            253 => self.write_ser_inp(raw_line),
            254 => self.write_param_str_ser(sub_ch, VERS1_STR),
            250 | 255 => self.ser_prompt(ErrorCode::NoErr, self.status.as_byte(), verbose),
            _ => return Err(ErrorCode::ParamErr),
        }
        Ok(())
    }

    fn parse_set_param(&mut self, sub_ch: u8, param: Float, verbose: bool) -> Result<(), ErrorCode> {
        if self.status.busy_flag {
            return Err(ErrorCode::BusyErr);
        }

        self.changed_flag = true;
        let param_int = param as i32;
        let param_byte = Self::pascal_byte(param);

        match sub_ch {
            0 => self.frequency_tenths_hz = (param * 10.0) as i32,
            1 => {
                self.dac_level = self.rms_to_dac_level(param);
                self.db = self.level_to_db(param);
            }
            2 => {
                self.dac_level = param / self.pwr_gain.max(0.001) / PEAK_FACTOR;
                self.db = self.dac_level_to_db(self.dac_level);
            }
            3 => {
                self.db = param;
                self.dac_level = self.db_to_dac_level(self.db);
            }
            4 => {
                self.waveform = Waveform::from_byte(param_byte);
                self.set_limits();
                self.db = self.dac_level_to_db(self.dac_level);
                if self.waveform == Waveform::Logic {
                    self.dac_level =
                        self.eeprom.init_logic_level_mv / self.pwr_gain.max(0.001) / PEAK_FACTOR;
                    self.db = self.dac_level_to_db(self.dac_level);
                }
            }
            5 => self.burst_mode = param_byte,
            9 => self.hw.send_aux_config(param_byte),
            19 => self.range = InputRange::from_byte(param_byte),
            20 => self.offset_mv = (param * 1000.0) as i32,
            80 => {
                self.panel_modify = Modify::from_byte(param_byte).ok_or(ErrorCode::ParamErr)?;
            }
            89 => {
                if !self.status.ee_unlocked {
                    return Err(ErrorCode::LockedErr);
                }
                self.inc_rast = param_int;
                self.eeprom.init_inc_rast = param_int;
            }
            150..=170 => {
                if !self.status.ee_unlocked {
                    return Err(ErrorCode::LockedErr);
                }
                match sub_ch {
                    150 => self.eeprom.init_frequency_tenths_hz = (param * 10.0) as i32,
                    151 => self.eeprom.init_level_mv = param,
                    152 => self.eeprom.init_logic_level_mv = param,
                    154 => self.eeprom.init_wave = param_byte,
                    155 => self.eeprom.init_burst = param_byte,
                    170 => self.eeprom.init_offset_v = param,
                    _ => return Err(ErrorCode::ParamErr),
                }
            }
            200..=213 => {
                if !self.status.ee_unlocked {
                    return Err(ErrorCode::LockedErr);
                }
                match sub_ch {
                    200 => self.eeprom.level_scale_low = param,
                    201 => self.eeprom.level_scale_high = param,
                    202 => {
                        self.eeprom.init_pwr_gain = param;
                        self.patch_copy_from_ee();
                    }
                    203 => {
                        self.eeprom.init_attn_fac = param;
                        self.patch_copy_from_ee();
                    }
                    204 => {
                        self.eeprom.init_logic_level_mv = param;
                        self.patch_copy_from_ee();
                    }
                    210..=213 => self.eeprom.adc_scales[(sub_ch - 210) as usize] = param,
                    _ => return Err(ErrorCode::ParamErr),
                }
            }
            251 => self.err_count = param_int,
            252 => {
                if !self.status.ee_unlocked {
                    return Err(ErrorCode::LockedErr);
                }
                self.eeprom.ee_ser_baud_reg = param_byte;
            }
            250 => {}
            _ => return Err(ErrorCode::ParamErr),
        }

        self.status.ee_unlocked = sub_ch == 250;
        let out_of_range = self.check_limits();
        self.switch_range();
        self.apply_output_state();
        self.ser_prompt(
            if out_of_range {
                ErrorCode::ParamErr
            } else {
                ErrorCode::NoErr
            },
            self.status.as_byte(),
            verbose,
        );
        Ok(())
    }

    pub fn cmd2_index(&self, text: &str) -> CmdWhich {
        CMD_STR_ARR
            .iter()
            .position(|candidate| *candidate == text)
            .and_then(|index| {
                use CmdWhich::*;
                Some(match index {
                    0 => Str,
                    1 => Idn,
                    2 => Trg,
                    3 => Val,
                    4 => Frq,
                    5 => Lvl,
                    6 => Lvp,
                    7 => Dbv,
                    8 => Wav,
                    9 => Bst,
                    10 => Aux,
                    11 => Inl,
                    12 => Rng,
                    13 => Ofs,
                    14 => Dsp,
                    15 => All,
                    16 => Opt,
                    17 => Scl,
                    18 => Wen,
                    19 => Erc,
                    20 => Sbd,
                    21 => Nop,
                    _ => return None,
                })
            })
            .unwrap_or(CmdWhich::Err)
    }

    fn parse_alpha_prefix<'a>(&self, text: &'a str) -> (&'a str, &'a str) {
        let split = text
            .char_indices()
            .find_map(|(index, ch)| (!ch.is_ascii_alphabetic()).then_some(index))
            .unwrap_or(text.len());
        (&text[..split], &text[split..])
    }

    fn parse_numeric_prefix<'a>(&self, text: &'a str) -> (&'a str, &'a str) {
        let split = text
            .char_indices()
            .find_map(|(index, ch)| (!(('*'..='9').contains(&ch))).then_some(index))
            .unwrap_or(text.len());
        (&text[..split], &text[split..])
    }

    fn parse_subchannel_token(&self, token: &str) -> Result<u8, ErrorCode> {
        let token = token.trim();
        if token.is_empty() {
            return Err(ErrorCode::SyntaxErr);
        }

        let first = token.chars().next().ok_or(ErrorCode::SyntaxErr)?;
        if ('*'..='9').contains(&first) {
            return token.parse::<u8>().map_err(|_| ErrorCode::ParamErr);
        }

        let upper = token.to_ascii_uppercase();
        let (cmd_text, suffix_text) = self.parse_alpha_prefix(&upper);
        let which = self.cmd2_index(cmd_text);
        if which == CmdWhich::Err {
            return Err(ErrorCode::SyntaxErr);
        }

        let cmd_index = CMD_STR_ARR
            .iter()
            .position(|candidate| *candidate == cmd_text)
            .ok_or(ErrorCode::SyntaxErr)?;
        let base = CMD2_SUB_CH_ARR[cmd_index];
        let suffix = if suffix_text.is_empty() {
            0
        } else {
            suffix_text.parse::<u8>().map_err(|_| ErrorCode::ParamErr)?
        };
        Ok(base.wrapping_add(suffix))
    }

    fn verify_checksum<'a>(&self, line: &'a str) -> Result<&'a str, ErrorCode> {
        if let Some(pos) = line.find('$') {
            let body = &line[..pos];
            let checksum_text = line.get(pos + 1..pos + 3).ok_or(ErrorCode::ChecksumErr)?;
            let expected = u8::from_str_radix(checksum_text, 16).map_err(|_| ErrorCode::ChecksumErr)?;
            let actual = body
                .bytes()
                .fold(0_u8, |acc, byte| acc ^ byte);
            if actual != expected {
                return Err(ErrorCode::ChecksumErr);
            }
            Ok(body)
        } else {
            Ok(line)
        }
    }

    pub fn process_serial_command(&mut self, line: &str) {
        if line.is_empty() {
            self.ser_prompt(ErrorCode::NoErr, 0, false);
            return;
        }

        if line.starts_with('#') {
            self.write_ser_inp(line);
            return;
        }

        let verbose = line.contains('!') || line.contains('?');
        let checksum_free = match self.verify_checksum(line) {
            Ok(body) => body,
            Err(err) => {
                self.ser_prompt(err, 0, verbose);
                return;
            }
        };

        let parser_input = checksum_free.replace(['!', '?'], "");
        let mut working = parser_input.as_str();

        if let Some((head, rest)) = working.split_once(':') {
            if head == "*" {
                self.write_ser_inp(line);
                working = rest;
            } else {
                let current_channel = match head.parse::<u8>() {
                    Ok(channel) => channel,
                    Err(_) => {
                        self.ser_prompt(ErrorCode::SyntaxErr, 0, verbose);
                        return;
                    }
                };
                self.current_channel = current_channel;
                if current_channel != self.slave_channel {
                    self.write_ser_inp(line);
                    return;
                }
                working = rest;
            }
        }

        let is_request = !working.contains('=');
        let (token, value) = if let Some((lhs, rhs)) = working.split_once('=') {
            (lhs.trim(), Some(rhs.trim()))
        } else {
            (working.trim(), None)
        };

        let sub_ch = match self.parse_subchannel_token(token) {
            Ok(sub_ch) => sub_ch,
            Err(err) => {
                self.ser_prompt(err, 0, verbose);
                return;
            }
        };

        if is_request {
            if let Err(err) = self.parse_get_param(sub_ch, verbose, line) {
                self.ser_prompt(err, 0, verbose);
            }
            return;
        }

        let Some(value_text) = value else {
            self.ser_prompt(ErrorCode::ParamErr, 0, verbose);
            return;
        };

        let param = match value_text.parse::<Float>() {
            Ok(param) => param,
            Err(_) => {
                self.ser_prompt(ErrorCode::ParamErr, 0, verbose);
                return;
            }
        };

        if let Err(err) = self.parse_set_param(sub_ch, param, verbose) {
            self.ser_prompt(err, 0, verbose);
        }
    }

    pub fn handle_panel_event(&mut self, event: PanelEvent) {
        self.status.busy_flag = true;
        self.changed_flag = true;

        match event {
            PanelEvent::ToggleFine => {
                self.ser_prompt(ErrorCode::NoErr, self.status.as_byte().wrapping_add(67), true);
                self.first_turn = false;
            }
            PanelEvent::NextModify => {
                self.panel_modify = self.panel_modify.next();
                self.ser_prompt(ErrorCode::NoErr, self.status.as_byte().wrapping_add(65), true);
                self.first_turn = false;
            }
            PanelEvent::PrevModify => {
                self.panel_modify = self.panel_modify.prev();
                self.ser_prompt(ErrorCode::NoErr, self.status.as_byte().wrapping_add(66), true);
                self.first_turn = false;
            }
            PanelEvent::ReleaseBusy => {
                if !self.first_turn {
                    self.ser_prompt(ErrorCode::NoErr, self.status.as_byte().wrapping_add(64), true);
                }
                self.first_turn = true;
                self.status.busy_flag = false;
                self.changed_flag = false;
                self.soll_werte_on_lcd();
            }
            PanelEvent::EncoderDelta(delta) => {
                if self.first_turn {
                    self.ser_prompt(ErrorCode::NoErr, self.status.as_byte().wrapping_add(67), true);
                }

                match self.panel_modify {
                    Modify::FreqSel => {
                        self.frequency_tenths_hz = self
                            .frequency_tenths_hz
                            .saturating_add(i32::from(delta) * 10);
                    }
                    Modify::AmplSel | Modify::PeakSel => {
                        self.dac_level += delta as Float;
                        self.db = self.dac_level_to_db(self.dac_level);
                    }
                    Modify::WaveSel => {
                        let next = (i16::from(self.waveform.as_byte()) + delta).clamp(0, 249) as u8;
                        self.waveform = Waveform::from_byte(next);
                        self.set_limits();
                        if self.waveform == Waveform::Logic {
                            self.dac_level =
                                self.eeprom.init_logic_level_mv / self.pwr_gain.max(0.001) / PEAK_FACTOR;
                            self.db = self.dac_level_to_db(self.dac_level);
                        }
                    }
                    Modify::BurstSel => {
                        let next = (i16::from(self.burst_mode) + delta).clamp(0, 100) as u8;
                        self.burst_mode = next;
                    }
                    Modify::DcSel => {
                        self.offset_mv = self.offset_mv.saturating_add(i32::from(delta) * 5);
                    }
                    Modify::InpSel => {
                        let next = (i16::from(self.range.as_byte()) + delta).clamp(0, 3) as u8;
                        self.range = InputRange::from_byte(next);
                        self.switch_range();
                    }
                }

                self.check_limits();
                self.apply_output_state();
                self.soll_werte_on_lcd();
                self.first_turn = false;
            }
        }
    }

    pub fn chores(&mut self) {
        self.apply_output_state();
        self.soll_werte_on_lcd();
    }

    pub fn check_ser(&mut self) {
        while let Some(ch) = self.hw.serial_read() {
            match ch {
                '\u{08}' => {
                    self.ser_input.pop();
                }
                '\r' => {
                    let line = self.ser_input.clone();
                    self.ser_input.clear();
                    self.process_serial_command(&line);
                }
                '\n' => {}
                ch if (' '..='\u{7f}').contains(&ch) => self.ser_input.push(ch),
                _ => {}
            }
        }
    }

    pub fn check_delay(&mut self, delay_steps: u8) {
        for _ in 0..delay_steps {
            self.check_ser();
            self.chores();
        }
    }

    pub fn init_all(&mut self) {
        self.patch_copy_from_ee();
        self.old_range = InputRange::NoRange;
        self.range = InputRange::Ac1V;
        self.switch_range();
        self.status = RuntimeStatus::default();
        self.burst_count = 1;
        self.burst_gate_open = true;
        self.current_channel = 255;
        self.panel_modify = Modify::FreqSel;
        self.first_turn = true;
        self.err_count = 0;
        self.err_flag = false;
        self.changed_flag = true;
        self.ser_input.clear();
        while self.hw.serial_read().is_some() {}
        self.apply_output_state();
        self.db = self.dac_level_to_db(self.dac_level);
        self.write_ch_prefix(254);
        self.hw.serial_write(VERS1_STR);
        if self.eeprom.ee_initialized != EEPROM_INITIALIZED {
            self.hw.serial_write(EE_NOT_PROGRAMMED_STR);
        }
        self.ser_crlf();
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::collections::VecDeque;

    #[derive(Debug, Default, Clone)]
    struct MockHardware {
        serial_out: String,
        serial_in: VecDeque<char>,
        waveforms: Vec<Waveform>,
        ranges: Vec<InputRange>,
        aux_configs: Vec<u8>,
        frequency_words: Vec<u32>,
        amplitude_words: Vec<u16>,
        lcd_lines: Vec<(u8, String)>,
        input_level_mv: Float,
        input_overload: bool,
    }

    impl MockHardware {
        fn take_serial_output(&mut self) -> String {
            std::mem::take(&mut self.serial_out)
        }

        fn push_serial(&mut self, text: &str) {
            self.serial_in.extend(text.chars());
        }
    }

    impl DdsHardware for MockHardware {
        fn send_dds_frequency_word(&mut self, word: u32) {
            self.frequency_words.push(word);
        }

        fn send_amplitude_word(&mut self, word: u16) {
            self.amplitude_words.push(word);
        }

        fn set_waveform(&mut self, waveform: Waveform) {
            self.waveforms.push(waveform);
        }

        fn set_input_range(&mut self, range: InputRange) {
            self.ranges.push(range);
        }

        fn send_aux_config(&mut self, value: u8) {
            self.aux_configs.push(value);
        }

        fn read_input_level(&mut self) -> Float {
            self.input_level_mv
        }

        fn read_input_overload(&mut self) -> bool {
            self.input_overload
        }

        fn serial_write(&mut self, text: &str) {
            self.serial_out.push_str(text);
        }

        fn serial_read(&mut self) -> Option<char> {
            self.serial_in.pop_front()
        }

        fn lcd_write_line(&mut self, row: u8, text: &str) {
            self.lcd_lines.push((row, text.to_string()));
        }
    }

    fn xor_checksum(text: &str) -> String {
        format!("{:02X}", text.bytes().fold(0_u8, |acc, byte| acc ^ byte))
    }

    #[test]
    fn frequency_protocol_uses_tenths_hz_on_the_wire() {
        let mut state = DeviceState::new(MockHardware::default());

        state.process_serial_command("FRQ=1234.5!");
        assert_eq!(state.frequency_tenths_hz, 12_345);
        assert_eq!(state.hw.take_serial_output(), "#0:255=0 [OK]\r\n");

        state.process_serial_command("FRQ");
        assert_eq!(state.hw.take_serial_output(), "#0:0=1234.5\r\n");
    }

    #[test]
    fn burst_mode_gates_waveform_on_systick() {
        let mut state = DeviceState::new(MockHardware::default());
        state.waveform = Waveform::Square;
        state.burst_mode = 3;
        state.burst_count = 1;
        state.burst_gate_open = true;

        state.on_sys_tick();
        assert_eq!(state.hw.waveforms.last(), Some(&Waveform::Square));

        state.on_sys_tick();
        assert_eq!(state.hw.waveforms.last(), Some(&Waveform::Off));

        state.on_sys_tick();
        state.on_sys_tick();
        state.on_sys_tick();
        assert_eq!(state.hw.waveforms.last(), Some(&Waveform::Square));
    }

    #[test]
    fn waveform_external_selection_preserves_external_index() {
        let mut state = DeviceState::new(MockHardware::default());

        state.process_serial_command("WAV=7!");
        assert_eq!(state.waveform, Waveform::External(2));
        assert_eq!(state.hw.aux_configs.last(), Some(&2));
        assert_eq!(state.hw.waveforms.last(), Some(&Waveform::External(2)));
        assert_eq!(state.hw.take_serial_output(), "#0:255=0 [OK]\r\n");

        state.process_serial_command("WAV");
        assert_eq!(state.hw.take_serial_output(), "#0:4=7\r\n");
    }

    #[test]
    fn calibration_semantics_follow_pascal_defaults() {
        let mut state = DeviceState::new(MockHardware::default());

        assert!((state.dac_level_to_rms(state.dac_level) - 774.6).abs() < 0.2);
        assert!(state.level_to_db(774.597).abs() < 0.01);

        state.waveform = Waveform::Triangle;
        let triangle_dac = state.rms_to_dac_level(774.597);
        assert!((state.dac_level_to_rms(triangle_dac) - 774.597).abs() < 0.5);

        state.process_serial_command("WAV=4!");
        assert!((state.dac_level_to_peak_mv() - state.eeprom.init_logic_level_mv).abs() < 0.5);
    }

    #[test]
    fn range_control_is_explicit_input_range_not_output_bucket() {
        let mut state = DeviceState::new(MockHardware::default());

        state.process_serial_command("RNG=2!");
        assert_eq!(state.range, InputRange::Ac10V);
        assert_eq!(state.hw.ranges.last(), Some(&InputRange::Ac10V));
        state.hw.take_serial_output();

        state.process_serial_command("LVL=10.0!");
        assert_eq!(state.range, InputRange::Ac10V);
        assert_eq!(state.hw.ranges.last(), Some(&InputRange::Ac10V));
    }

    #[test]
    fn parser_supports_numeric_subchannels_omni_and_checksum() {
        let mut state = DeviceState::new(MockHardware::default());
        let raw = "*:0=4321.1!";
        let checksum = xor_checksum(raw);
        let framed = format!("{raw}${checksum}");

        state.process_serial_command(&framed);
        assert_eq!(state.frequency_tenths_hz, 43_211);
        assert_eq!(
            state.hw.take_serial_output(),
            format!("{raw}${checksum}\r\n#0:255=0 [OK]\r\n")
        );
    }

    #[test]
    fn serial_framing_matches_pascal_verbose_rules() {
        let mut state = DeviceState::new(MockHardware::default());

        state.process_serial_command("FRQ=1000.0");
        assert_eq!(state.hw.take_serial_output(), "");

        state.process_serial_command("STR?");
        assert_eq!(state.hw.take_serial_output(), "#0:255=0 [OK]\r\n");

        state.process_serial_command("#1:0=1234.5");
        assert_eq!(state.hw.take_serial_output(), "#1:0=1234.5\r\n");
    }

    #[test]
    fn serial_receive_loop_parses_backspaced_lines() {
        let mut state = DeviceState::new(MockHardware::default());
        state.hw.push_serial("FRQ=1000.6\u{08}5!\r");

        state.check_ser();

        assert_eq!(state.frequency_tenths_hz, 10_005);
        assert_eq!(state.hw.take_serial_output(), "#0:255=0 [OK]\r\n");
    }

    #[test]
    fn init_all_restores_defaults_and_emits_prefixed_banner() {
        let mut state = DeviceState::new(MockHardware::default());
        state.eeprom.ee_initialized = 0;
        state.frequency_tenths_hz = 55_555;
        state.process_serial_command("RNG=3!");
        state.hw.take_serial_output();

        state.init_all();

        assert_eq!(state.frequency_tenths_hz, state.eeprom.init_frequency_tenths_hz);
        assert_eq!(state.range, InputRange::Ac1V);
        assert_eq!(state.panel_modify, Modify::FreqSel);
        assert_eq!(
            state.hw.take_serial_output(),
            format!("#0:254={VERS1_STR}{EE_NOT_PROGRAMMED_STR}\r\n")
        );
    }
}
