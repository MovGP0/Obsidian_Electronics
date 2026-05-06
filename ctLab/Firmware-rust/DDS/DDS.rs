//! Best-effort Rust port of `DDS.pas`.
//!
//! The original Pascal source combines parser logic, panel handling, ADC
//! measurements, and DDS output control. This Rust version keeps that split
//! visible while leaving direct MCU binding behind explicit traits.

#![allow(dead_code)]

use std::fmt::Write as _;

pub type Float = f32;

pub const PROC_CLOCK: u32 = 16_000_000;
pub const VERS1_STR: &str = "3.71 [DDS by CM/c't 03/2007]";
pub const VERS3_STR: &str = "DDS 3.71";
pub const ADR_STR: &str = "Adr ";

pub const CMD_STR_ARR: [&str; 22] = [
    "STR", "IDN", "TRG", "VAL", "FRQ", "LVL", "LVP", "DBU", "WAV", "BST", "AUX", "INL", "RNG",
    "DCO", "DSP", "ALL", "OPT", "SCL", "WEN", "ERC", "SBD", "NOP",
];

pub const CMD2_SUB_CH_ARR: [u8; 22] = [
    255, 254, 249, 0, 0, 1, 2, 3, 4, 5, 9, 10, 19, 20, 80, 99, 150, 200, 250, 251, 252, 0,
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
pub enum Modify {
    WaveSel,
    FreqSel,
    AmplSel,
    PeakSel,
    InpSel,
    BurstSel,
    DcSel,
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
    External,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum OutputRange {
    Ac100mV,
    Ac1V,
    Ac10V,
    Ac100V,
    NoRange,
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
    pub option_array: [Float; 16],
    pub scale_array: [Float; 16],
    pub ee_ser_baud_reg: u8,
}

impl Default for EepromData {
    fn default() -> Self {
        Self {
            option_array: [
                1000.0, 2000.0, 1.0, 0.0, 1.0, 0.0, 0.1, 1.0, 10.0, 100.0, 0.0, 0.0, 1.0, 1.0,
                1.0, 1.0,
            ],
            scale_array: [
                1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
                1.0,
            ],
            ee_ser_baud_reg: 51,
        }
    }
}

pub trait DdsHardware {
    fn send_dds_frequency_word(&mut self, word: u32);
    fn send_amplitude_word(&mut self, word: u16);
    fn set_waveform(&mut self, waveform: Waveform);
    fn set_output_range(&mut self, range: OutputRange);
    fn set_aux_output(&mut self, enabled: bool);
    fn read_input_level(&mut self) -> Float;
    fn serial_write(&mut self, text: &str);
    fn lcd_write_line(&mut self, row: u8, text: &str);
}

#[derive(Debug, Clone)]
pub struct DeviceState<H> {
    pub hw: H,
    pub eeprom: EepromData,
    pub status: RuntimeStatus,
    pub frequency_hz: u32,
    pub level_rms: Float,
    pub peak_mv: i32,
    pub offset_v: Float,
    pub waveform: Waveform,
    pub burst_ms: u16,
    pub aux_enabled: bool,
    pub input_level: Float,
    pub output_range: OutputRange,
    pub panel_modify: Modify,
    pub ser_input: String,
    pub param_str: String,
}

impl<H: DdsHardware> DeviceState<H> {
    pub fn new(hw: H) -> Self {
        Self {
            hw,
            eeprom: EepromData::default(),
            status: RuntimeStatus::default(),
            frequency_hz: 1000,
            level_rms: 1.0,
            peak_mv: 1000,
            offset_v: 0.0,
            waveform: Waveform::Sine,
            burst_ms: 0,
            aux_enabled: false,
            input_level: 0.0,
            output_range: OutputRange::Ac1V,
            panel_modify: Modify::FreqSel,
            ser_input: String::new(),
            param_str: String::new(),
        }
    }

    pub fn on_sys_tick(&mut self) {
        self.input_level = self.hw.read_input_level();
    }

    pub fn dac_level_to_rms(&self, level: Float) -> Float {
        level.max(0.0) * self.eeprom.scale_array[0]
    }

    pub fn rms_to_dac_level(&self, level: Float) -> Float {
        (level / self.eeprom.scale_array[0].max(0.001)).max(0.0)
    }

    pub fn level_to_db(&self, level: Float) -> Float {
        if level <= 0.0 {
            -120.0
        } else {
            20.0 * level.log10()
        }
    }

    pub fn db_to_level(&self, db: Float) -> Float {
        10.0_f32.powf(db / 20.0)
    }

    pub fn db_to_dac_level(&self, db: Float) -> Float {
        self.rms_to_dac_level(self.db_to_level(db))
    }

    pub fn dac_level_to_db(&self, level: Float) -> Float {
        self.level_to_db(self.dac_level_to_rms(level))
    }

    pub fn set_limits(&mut self) {
        self.output_range = if self.level_rms < 0.1 {
            OutputRange::Ac100mV
        } else if self.level_rms < 1.0 {
            OutputRange::Ac1V
        } else if self.level_rms < 10.0 {
            OutputRange::Ac10V
        } else {
            OutputRange::Ac100V
        };
        self.hw.set_output_range(self.output_range);
    }

    pub fn patch_copy_from_ee(&mut self) {}

    pub fn ser_crlf(&mut self) {
        self.hw.serial_write("\r\n");
    }

    pub fn write_ch_prefix(&mut self) {
        self.hw.serial_write(ADR_STR);
    }

    pub fn write_ser_inp(&mut self) {
        self.hw.serial_write(&self.ser_input);
    }

    pub fn ser_prompt(&mut self, err: ErrorCode) {
        let labels = [
            "[OK]",
            "[SRQUSR]",
            "[BUSY]",
            "[OVERLD]",
            "[CMDERR]",
            "[PARERR]",
            "[LOCKED]",
            "[CHKSUM]",
        ];
        self.hw.serial_write(labels[(err as usize).min(labels.len() - 1)]);
        self.ser_crlf();
    }

    pub fn switch_range(&mut self) {
        self.set_limits();
    }

    pub fn write_param_str_ser(&mut self, value: &str) {
        self.hw.serial_write(value);
    }

    pub fn param_to_str(&self, value: Float) -> String {
        format!("{value:.3}")
    }

    pub fn param_to_pm_str(&self, value: Float) -> String {
        format!("{value:+.3}")
    }

    pub fn param_long_to_str(&self, value: i64) -> String {
        value.to_string()
    }

    pub fn offset_to_param(&self) -> String {
        self.param_to_pm_str(self.offset_v)
    }

    pub fn write_param_ser(&mut self, value: Float) {
        self.hw.serial_write(&self.param_to_str(value));
    }

    pub fn write_param_byte_ser(&mut self, value: u8) {
        self.hw.serial_write(&value.to_string());
    }

    pub fn param_str_on_lcd(&mut self) {
        self.hw.lcd_write_line(1, &self.param_str);
    }

    pub fn soll_werte_on_lcd(&mut self) {
        self.hw
            .lcd_write_line(0, &format!("F{:>7}", self.frequency_hz));
        self.hw
            .lcd_write_line(1, &format!("L{:>7.3}", self.level_rms));
    }

    pub fn check_limits(&self) -> bool {
        self.frequency_hz <= 12_500_000 && self.level_rms >= 0.0 && self.level_rms <= 10.0
    }

    pub fn parse_get_param(&mut self, which: CmdWhich) -> Option<String> {
        Some(match which {
            CmdWhich::Frq => self.frequency_hz.to_string(),
            CmdWhich::Lvl => self.param_to_str(self.level_rms),
            CmdWhich::Lvp => self.peak_mv.to_string(),
            CmdWhich::Dbv => self.param_to_str(self.level_to_db(self.level_rms)),
            CmdWhich::Wav => format!("{:?}", self.waveform),
            CmdWhich::Bst => self.burst_ms.to_string(),
            CmdWhich::Aux => u8::from(self.aux_enabled).to_string(),
            CmdWhich::Inl => self.param_to_str(self.input_level),
            CmdWhich::Rng => format!("{:?}", self.output_range),
            CmdWhich::Ofs => self.offset_to_param(),
            CmdWhich::Idn => VERS1_STR.to_string(),
            CmdWhich::Str => self.status.as_byte().to_string(),
            CmdWhich::All => {
                let mut line = String::new();
                let _ = write!(
                    &mut line,
                    "FRQ={} LVL={} WAV={:?}",
                    self.frequency_hz, self.level_rms, self.waveform
                );
                line
            }
            _ => return None,
        })
    }

    pub fn parse_set_param(&mut self, which: CmdWhich, value: &str) -> Result<(), ErrorCode> {
        match which {
            CmdWhich::Frq => self.frequency_hz = value.parse().map_err(|_| ErrorCode::ParamErr)?,
            CmdWhich::Lvl => self.level_rms = value.parse().map_err(|_| ErrorCode::ParamErr)?,
            CmdWhich::Lvp => self.peak_mv = value.parse().map_err(|_| ErrorCode::ParamErr)?,
            CmdWhich::Dbv => self.level_rms = self.db_to_level(value.parse().map_err(|_| ErrorCode::ParamErr)?),
            CmdWhich::Bst => self.burst_ms = value.parse().map_err(|_| ErrorCode::ParamErr)?,
            CmdWhich::Aux => self.aux_enabled = value.parse::<u8>().map_err(|_| ErrorCode::ParamErr)? != 0,
            CmdWhich::Ofs => self.offset_v = value.parse().map_err(|_| ErrorCode::ParamErr)?,
            _ => return Err(ErrorCode::ParamErr),
        }
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

    pub fn parse_extract(&self, input: &str) -> Option<(CmdWhich, Option<String>)> {
        let mut parts = input.trim().splitn(2, '=');
        let cmd = self.cmd2_index(parts.next()?);
        let param = parts.next().map(ToOwned::to_owned);
        Some((cmd, param))
    }

    pub fn parse_sub_ch(&mut self, input: &str) -> Result<Option<String>, ErrorCode> {
        let (cmd, value) = self.parse_extract(input).ok_or(ErrorCode::SyntaxErr)?;
        match value {
            Some(param) => {
                self.parse_set_param(cmd, &param)?;
                Ok(None)
            }
            None => Ok(self.parse_get_param(cmd)),
        }
    }

    pub fn chores(&mut self) {
        self.on_sys_tick();
        self.switch_range();
        self.hw.set_aux_output(self.aux_enabled);
        self.hw.set_waveform(self.waveform);
        let tuning_word = ((self.frequency_hz as u64) << 28) / 4_194_304u64;
        self.hw.send_dds_frequency_word(tuning_word as u32);
        let amp_word = self.rms_to_dac_level(self.level_rms).clamp(0.0, 65535.0) as u16;
        self.hw.send_amplitude_word(amp_word);
        self.soll_werte_on_lcd();
    }

    pub fn check_ser(&mut self) {}

    pub fn check_delay(&mut self, _delay_ms: u8) {
        self.chores();
    }

    pub fn init_all(&mut self) {
        self.switch_range();
        self.patch_copy_from_ee();
        self.hw.serial_write(VERS1_STR);
        self.ser_crlf();
    }
}
