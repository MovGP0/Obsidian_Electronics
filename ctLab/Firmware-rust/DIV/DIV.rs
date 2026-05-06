//! Best-effort Rust port of `DIV.pas`.
//!
//! This preserves the original digital voltmeter structure: range tables,
//! calibration storage, ADC conversion helpers, display/serial formatting, and
//! a polling-style service loop.

#![allow(dead_code)]

pub type Float = f32;

pub const PROC_CLOCK: u32 = 16_000_000;
pub const VERS1_STR: &str = "3.10 [DIV by CM/c't 03/2007]";
pub const VERS3_STR: &str = "DIV 3.10";

pub const RANGE_STR_ARR: [&str; 16] = [
    "DC 250mV", "DC  2.5V", "DC   25V", "DC  250V", "AC 250mV", "AC  2.5V", "AC   25V",
    "AC  250V", "DC 250uA", "DC  25mA", "DC  2.5A", "DC   10A", "AC 250uA", "AC  25mA",
    "AC  2.5A", "AC   10A",
];

pub const CMD_STR_ARR: [&str; 16] = [
    "STR", "IDN", "TRG", "VAL", "RNG", "DSP", "OFS", "SCL", "ALL", "TRM", "TRT", "TRL", "ERC",
    "SBD", "WEN", "NOP",
];

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum CmdWhich {
    Str,
    Idn,
    Trg,
    Val,
    Rng,
    Dsp,
    Ofs,
    Scl,
    All,
    Trm,
    Trt,
    Trl,
    Erc,
    Sbd,
    Wen,
    Nop,
    Err,
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
#[repr(u8)]
pub enum DivRange {
    Dc250mV = 0,
    Dc2V5 = 1,
    Dc25V = 2,
    Dc250V = 3,
    Ac250mV = 4,
    Ac2V5 = 5,
    Ac25V = 6,
    Ac250V = 7,
    Dc250uA = 8,
    Dc25mA = 9,
    Dc2A5 = 10,
    Dc10A = 11,
    Ac250uA = 12,
    Ac25mA = 13,
    Ac2A5 = 14,
    Ac10A = 15,
}

#[derive(Debug, Clone)]
pub struct EepromData {
    pub ad24_offsets: [i32; 16],
    pub ad24_scales: [Float; 16],
    pub ad10_offsets: [i16; 16],
    pub ad10_scales: [Float; 16],
    pub trigger_mode: u8,
    pub trigger_timer_ms: u16,
    pub trigger_edge_level: bool,
    pub ee_ser_baud_reg: u8,
}

impl Default for EepromData {
    fn default() -> Self {
        Self {
            ad24_offsets: [0; 16],
            ad24_scales: [1.0; 16],
            ad10_offsets: [0; 16],
            ad10_scales: [1.0; 16],
            trigger_mode: 0,
            trigger_timer_ms: 0,
            trigger_edge_level: false,
            ee_ser_baud_reg: 51,
        }
    }
}

pub trait DivHardware {
    fn read_adc10(&mut self, channel_1_based: u8) -> i16;
    fn read_adc24(&mut self) -> i32;
    fn set_range(&mut self, range: DivRange);
    fn serial_write(&mut self, text: &str);
    fn lcd_write_line(&mut self, row: u8, text: &str);
}

#[derive(Debug, Clone)]
pub struct DeviceState<H> {
    pub hw: H,
    pub eeprom: EepromData,
    pub range: DivRange,
    pub measured_value: Float,
    pub measured_aux: Float,
    pub trigger_pending: bool,
    pub integrate_24_fast: i64,
    pub integrate_24_slow: i64,
    pub overload_negative: bool,
    pub overload_positive: bool,
    pub ser_input: String,
    pub param_str: String,
}

impl<H: DivHardware> DeviceState<H> {
    pub fn new(hw: H) -> Self {
        Self {
            hw,
            eeprom: EepromData::default(),
            range: DivRange::Dc2V5,
            measured_value: 0.0,
            measured_aux: 0.0,
            trigger_pending: false,
            integrate_24_fast: 0,
            integrate_24_slow: 0,
            overload_negative: false,
            overload_positive: false,
            ser_input: String::new(),
            param_str: String::new(),
        }
    }

    pub fn patch_copy_from_ee(&mut self) {}

    pub fn is_ac_range(&self) -> bool {
        (self.range as u8) >= 4
    }

    pub fn param_scale_10(&self, raw: i16) -> Float {
        raw as Float * self.eeprom.ad10_scales[self.range as usize] / 1000.0
    }

    pub fn param_scale_24(&self, raw: i32) -> Float {
        raw as Float * self.eeprom.ad24_scales[self.range as usize] / 1_000_000.0
    }

    pub fn get_ad10(&mut self, channel: u8) {
        let raw = self.hw.read_adc10(channel) + self.eeprom.ad10_offsets[self.range as usize];
        self.measured_aux = self.param_scale_10(raw);
    }

    pub fn get_ad24(&mut self, _int_mode: u8) {
        let raw = self.hw.read_adc24() + self.eeprom.ad24_offsets[self.range as usize];
        self.measured_value = self.param_scale_24(raw);
    }

    pub fn wait_ad10(&mut self) {}

    pub fn wait_ad24(&mut self) {}

    pub fn integrate_reset(&mut self) {
        self.integrate_24_fast = 0;
        self.integrate_24_slow = 0;
    }

    pub fn switch_range(&mut self, range: DivRange) {
        self.range = range;
        self.hw.set_range(range);
    }

    pub fn ser_crlf(&mut self) {
        self.hw.serial_write("\r\n");
    }

    pub fn write_ch_prefix(&mut self) {
        self.hw.serial_write("DIV:");
    }

    pub fn write_ser_inp(&mut self) {
        self.hw.serial_write(&self.ser_input);
    }

    pub fn ser_prompt(&mut self, err: ErrorCode) {
        let labels = [
            "[OK]",
            "[SRQUSR]",
            "[BUSY]",
            "[OVRLD]",
            "[CMDERR]",
            "[PARERR]",
            "[LOCKED]",
            "[CHKSUM]",
        ];
        self.hw.serial_write(labels[(err as usize).min(labels.len() - 1)]);
        self.ser_crlf();
    }

    pub fn param_to_str(&self, to_lcd: bool) -> String {
        if to_lcd {
            format!("{:>8.4}", self.measured_value)
        } else {
            format!("{:.6}", self.measured_value)
        }
    }

    pub fn show_range(&mut self) {
        self.hw.lcd_write_line(1, RANGE_STR_ARR[self.range as usize]);
    }

    pub fn write_param_lcd(&mut self) {
        self.hw.lcd_write_line(0, &self.param_to_str(true));
    }

    pub fn write_param_ser(&mut self, ovl: bool) {
        if ovl {
            self.hw.serial_write("[OVRLD]");
        } else {
            self.hw.serial_write(&self.param_to_str(false));
        }
    }

    pub fn write_param_long_int_ser(&mut self, value: i64) {
        self.hw.serial_write(&value.to_string());
    }

    pub fn check_limits(&mut self) -> bool {
        self.overload_negative = self.measured_value < -250.0;
        self.overload_positive = self.measured_value > 250.0;
        !(self.overload_negative || self.overload_positive)
    }

    pub fn check_ser(&mut self) {}

    pub fn check_delay(&mut self, _delay_ms: u8) {
        self.get_ad24(0);
        self.get_ad10(3);
        self.write_param_lcd();
        self.show_range();
    }

    pub fn blink_delay(&mut self, delay_ms: u8) {
        self.check_delay(delay_ms);
    }

    pub fn init_all(&mut self) {
        self.patch_copy_from_ee();
        self.switch_range(self.range);
        self.hw.serial_write(VERS1_STR);
        self.ser_crlf();
    }
}
