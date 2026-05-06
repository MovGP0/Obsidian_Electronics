//! Best-effort Rust port of `ADA-C.pas`.
//!
//! This keeps the original firmware structure readable:
//! - command/error enums
//! - EEPROM defaults and runtime state
//! - DAC, port, and parameter conversion logic
//! - serial response formatting
//! - high-level initialization, parser, and trigger scan flow
//!
//! Hardware-specific units imported by the Pascal source
//! (`SysTick`, `ADCport`, `TWImaster`, `LCDmultiPort`, `SerPort`,
//! `I2CExpand`, `IncrPort4`, `ADA-C-HW.pas`, `ADA-C-Parser.pas`)
//! are represented here behind a trait and local test doubles.

#![allow(dead_code)]

use std::array;
use std::fmt::Write as _;

pub type Float = f32;

pub const PROC_CLOCK: u32 = 16_000_000;
pub const SYS_TICK_MS: u16 = 2;
pub const SERIAL_POLL_TIMEOUT_MS: u16 = 20;
pub const TRIGGER_LED_TICKS: u16 = 30;

pub const DDR_B_INIT: u8 = 0b0101_1011;
pub const PORT_B_INIT: u8 = 0b1011_1111;
pub const DDR_C_INIT: u8 = 0b1111_1100;
pub const PORT_C_INIT: u8 = 0b0000_0011;
pub const DDR_D_INIT: u8 = 0b0000_1100;
pub const PORT_D_INIT: u8 = 0b1111_1100;

pub const B_SCLK: u8 = 0;
pub const B_SDATAOUT: u8 = 1;
pub const B_TRIG: u8 = 2;
pub const B_STR_DAC: u8 = 3;
pub const B_STR_AD16: u8 = 4;
pub const B_SDATAIN1: u8 = 5;
pub const B_STR_SR: u8 = 6;
pub const B_SENSE: u8 = 7;
pub const B_STR_DA_MUX: u8 = 5;

pub const VERS1_STR: &str = "1.742 [ADA by CM/c't 04/2007; ";
pub const VERS3_STR: &str = "ADA 1.74";
pub const ADR_STR: &str = "Adr ";
pub const CARDS_STR: &str = "IO-Cards";
pub const VALUE_STR: &str = "Value ";
pub const EE_NOT_PROGRAMMED_STR: &str = "EEPROM EMPTY! ";
pub const DAC12_STR: &str = "DA12 ";
pub const DAC16_STR: &str = "DA16 ";
pub const ADC16_STR: &str = "AD16 ";
pub const LCD_STR: &str = "LCD ";
pub const IO816_STR: &str = "IO32 ";
pub const EGG_STR: &str = "28.5 [Michaela, ich liebe dich!]";
pub const ERR_SUB_CH: u8 = 255;

pub const ERR_STR_ARR: [&str; 8] = [
    "[OK]", "[SRQUSR]", "[BUSY]", "[OVERLD]", "[CMDERR]", "[PARERR]", "[LOCKED]", "[CHKSUM]",
];

pub const CMD_STR_ARR: [&str; 25] = [
    "TRG", "STR", "IDN", "VAL", "OFS", "SCL", "RAW", "PIO", "DIR", "DSP", "ALL", "OPT", "TRM",
    "TRT", "TRL", "ICB", "ICW", "ICS", "ICT", "ICA", "REF", "WEN", "ERC", "SBD", "NOP",
];

pub const CMD2_SUB_CH_ARR: [u8; 25] = [
    249, 255, 254, 0, 100, 200, 50, 30, 40, 80, 95, 150, 240, 247, 248, 230, 231, 232, 233, 239,
    246, 250, 251, 252, 0,
];

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum CmdWhich {
    Trg,
    Str,
    Idn,
    Erc,
    Val,
    Ofs,
    Scl,
    Raw,
    Pio,
    Dir,
    Dsp,
    All,
    Opt,
    Trm,
    Trt,
    Trl,
    Icb,
    Icw,
    Ics,
    Ict,
    Ica,
    Ref,
    Wen,
    Sbd,
    Nop,
    Err,
}

impl CmdWhich {
    pub fn from_keyword(keyword: &str) -> Self {
        match keyword.trim().to_ascii_uppercase().as_str() {
            "TRG" => Self::Trg,
            "STR" => Self::Str,
            "IDN" => Self::Idn,
            "ERC" => Self::Erc,
            "VAL" => Self::Val,
            "OFS" => Self::Ofs,
            "SCL" => Self::Scl,
            "RAW" => Self::Raw,
            "PIO" => Self::Pio,
            "DIR" => Self::Dir,
            "DSP" => Self::Dsp,
            "ALL" => Self::All,
            "OPT" => Self::Opt,
            "TRM" => Self::Trm,
            "TRT" => Self::Trt,
            "TRL" => Self::Trl,
            "ICB" => Self::Icb,
            "ICW" => Self::Icw,
            "ICS" => Self::Ics,
            "ICT" => Self::Ict,
            "ICA" => Self::Ica,
            "REF" => Self::Ref,
            "WEN" => Self::Wen,
            "SBD" => Self::Sbd,
            "NOP" => Self::Nop,
            _ => Self::Err,
        }
    }

    pub fn sub_channel_offset(self) -> Option<u8> {
        match self {
            Self::Trg => Some(249),
            Self::Str => Some(255),
            Self::Idn => Some(254),
            Self::Erc => Some(251),
            Self::Val => Some(0),
            Self::Ofs => Some(100),
            Self::Scl => Some(200),
            Self::Raw => Some(50),
            Self::Pio => Some(30),
            Self::Dir => Some(40),
            Self::Dsp => Some(80),
            Self::All => Some(95),
            Self::Opt => Some(150),
            Self::Trm => Some(240),
            Self::Trt => Some(247),
            Self::Trl => Some(248),
            Self::Icb => Some(230),
            Self::Icw => Some(231),
            Self::Ics => Some(232),
            Self::Ict => Some(233),
            Self::Ica => Some(239),
            Self::Ref => Some(246),
            Self::Wen => Some(250),
            Self::Sbd => Some(252),
            Self::Nop => Some(0),
            Self::Err => None,
        }
    }

    pub fn requires_parameter_on_set(self) -> bool {
        !matches!(
            self,
            Self::Trg | Self::Str | Self::Idn | Self::Erc | Self::Err
        )
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

#[derive(Debug, Clone)]
pub struct EepromData {
    pub offset_array: [i16; 28],
    pub scale_array: [Float; 30],
    pub dir_init_array: [u8; 8],
    pub trig_mask_array: [u8; 4],
    pub trig_level: u8,
    pub trig_timer_value: u16,
    pub init_integrate_ad16: bool,
    pub ext_ref: u8,
    pub inc_rast_def: i16,
    pub ee_ser_baud_reg: u8,
    pub param_text_array: [String; 38],
    pub ee_initialised: u16,
    pub port_init_array: [u8; 8],
}

impl Default for EepromData {
    fn default() -> Self {
        Self {
            offset_array: [
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -40, -40, -40, -40, -40, -40, -40, -40, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0,
            ],
            scale_array: [
                1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 0.0, 100.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
                1.0, 1.0, 0.0, 3185.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 200.0, 3200.0,
            ],
            dir_init_array: [0; 8],
            trig_mask_array: [0; 4],
            trig_level: 0,
            trig_timer_value: 0,
            init_integrate_ad16: false,
            ext_ref: 1,
            inc_rast_def: 4,
            ee_ser_baud_reg: 51,
            param_text_array: array::from_fn(|_| String::new()),
            ee_initialised: 0xAA55,
            port_init_array: [0; 8],
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
        (self.error_low_nibble & 0x0f)
            | ((self.ee_unlocked as u8) << 4)
            | ((self.overload_flag as u8) << 5)
            | ((self.user_srq_flag as u8) << 6)
            | ((self.busy_flag as u8) << 7)
    }
}

pub trait AdaHardware {
    fn get_adc(&mut self, channel_1_based: u8) -> i16;
    fn twi_out(&mut self, slave_addr: u8, command: u16) -> bool;
    fn shift_out_sr(&mut self, port_array: &[u8; 8]);
    fn read_io_pin(&mut self, port: u8) -> u8;
    fn write_io_dir(&mut self, port: u8, value: u8);
    fn detect_i2c_expander(&mut self) -> bool;
    fn detect_sense(&mut self) -> bool;
    fn read_slave_channel(&mut self) -> u8;
    fn set_external_trigger_edge(&mut self, positive: bool);
    fn enable_interrupts(&mut self);

    fn twi_inp_byte(&mut self, _slave_addr: u8) -> u8 {
        0
    }

    fn twi_inp_word(&mut self, _slave_addr: u8) -> u16 {
        0
    }

    fn serial_read_byte_timeout(&mut self, _timeout_ms: u16) -> Option<u8> {
        None
    }

    fn serial_write(&mut self, _text: &str) {}

    fn set_serial_baud(&mut self, _ubrr: u8, _double_speed: bool) {}

    fn set_internal_reference(&mut self, _internal: bool) {}

    fn set_sdataout(&mut self, _high: bool) {}

    fn set_str_dac(&mut self, _high: bool) {}

    fn set_str_ad16(&mut self, _high: bool) {}

    fn set_trigger_led(&mut self, _active: bool) {}
}

#[derive(Debug, Clone)]
pub struct DeviceState<H> {
    pub hw: H,
    pub eeprom: EepromData,
    pub port_array: [u8; 8],
    pub io_pin_cache: [u8; 8],
    pub dac_value_array: [Float; 8],
    pub dac_raw_array: [u16; 8],
    pub adc_raw_array: [i16; 8],
    pub omni_flag: bool,
    pub verbose: bool,
    pub ad10_flag: bool,
    pub ad16_flag: bool,
    pub dac12_present: bool,
    pub dac16_present: bool,
    pub dac714_present: bool,
    pub adc16_present: bool,
    pub adc24_1_present: bool,
    pub adc24_2_present: bool,
    pub lcd_present: bool,
    pub io_present: bool,
    pub integrate_ad16: bool,
    pub trigger: bool,
    pub trig_mask: u8,
    pub ser_inp_str: String,
    pub ser_inp_ptr: usize,
    pub param_str: String,
    pub param_text_str: String,
    pub param: Float,
    pub param_int: i16,
    pub param_byte: u8,
    pub cmd_which: CmdWhich,
    pub cmd_str: String,
    pub slave_ch: u8,
    pub sub_ch: u8,
    pub current_ch: u8,
    pub modify: u8,
    pub inc_rast: i16,
    pub digits: u8,
    pub nachkomma: u8,
    pub changed_flag: bool,
    pub status: RuntimeStatus,
    pub err_count: i16,
    pub err_flag: bool,
    pub base_scale_ad10: Float,
    pub base_scale_ad16: Float,
    pub base_scale_da12: Float,
    pub base_scale_da16: Float,
    pub i2c_slave_adr: u8,
    pub systick_remainder_ms: u16,
    pub auto_trigger_ticks_remaining: Option<u16>,
    pub trigger_led_ticks_remaining: u16,
}

impl<H: AdaHardware> DeviceState<H> {
    pub fn new(hw: H) -> Self {
        Self {
            hw,
            eeprom: EepromData::default(),
            port_array: [0; 8],
            io_pin_cache: [0; 8],
            dac_value_array: [0.0; 8],
            dac_raw_array: [0; 8],
            adc_raw_array: [0; 8],
            omni_flag: false,
            verbose: false,
            ad10_flag: false,
            ad16_flag: false,
            dac12_present: false,
            dac16_present: false,
            dac714_present: false,
            adc16_present: false,
            adc24_1_present: false,
            adc24_2_present: false,
            lcd_present: false,
            io_present: false,
            integrate_ad16: false,
            trigger: false,
            trig_mask: 0,
            ser_inp_str: String::new(),
            ser_inp_ptr: 0,
            param_str: String::new(),
            param_text_str: String::new(),
            param: 0.0,
            param_int: 0,
            param_byte: 0,
            cmd_which: CmdWhich::Nop,
            cmd_str: String::new(),
            slave_ch: 0,
            sub_ch: 0,
            current_ch: 0,
            modify: 20,
            inc_rast: 4,
            digits: 1,
            nachkomma: 4,
            changed_flag: true,
            status: RuntimeStatus::default(),
            err_count: 0,
            err_flag: false,
            base_scale_ad10: 100.0,
            base_scale_ad16: 3185.0,
            base_scale_da12: 200.0,
            base_scale_da16: 3200.0,
            i2c_slave_adr: 0x48,
            systick_remainder_ms: 0,
            auto_trigger_ticks_remaining: None,
            trigger_led_ticks_remaining: 0,
        }
    }

    pub fn ext_int2_trigger(&mut self) {
        self.trigger = true;
    }

    pub fn set_base_scales(&mut self) {
        self.base_scale_ad10 = self.eeprom.scale_array[9];
        self.base_scale_ad16 = self.eeprom.scale_array[19];
        self.base_scale_da12 = self.eeprom.scale_array[28];
        self.base_scale_da16 = self.eeprom.scale_array[29];
    }

    pub fn set_dac(&mut self, my_sub_ch: u8) {
        if !(20..=27).contains(&my_sub_ch) {
            return;
        }

        let index = (my_sub_ch - 20) as usize;
        let my_offset = self.eeprom.offset_array[my_sub_ch as usize] as i32;
        let my_scale = self.eeprom.scale_array[my_sub_ch as usize];
        let my_val = self.dac_value_array[index];

        if self.dac714_present {
            let mut raw = (self.base_scale_da16 * (my_val * my_scale)) as i32 + my_offset;
            raw = raw.clamp(-32767, 32767);
            self.dac_raw_array[index] = raw as i16 as u16;
        }

        if self.dac16_present {
            let mut raw = (self.base_scale_da16 * (my_val * my_scale)) as i32 + my_offset;
            raw = raw.clamp(-32767, 32767);
            self.dac_raw_array[index] = (0x8000_i32 - raw) as u16;
        }

        if self.dac12_present {
            let mut raw = (self.base_scale_da12 * (my_val * my_scale)) as i32 + my_offset;
            raw = raw.clamp(-2047, 2047);
            self.dac_raw_array[index] = (0x0800_i32 - raw) as u16;
        }
    }

    pub fn get_port(&mut self, my_port: u8) -> u8 {
        let index = my_port as usize;
        if self.io_present {
            let value = self.hw.read_io_pin(my_port);
            self.io_pin_cache[index] = value;
            value
        } else {
            self.port_array[index]
        }
    }

    pub fn set_port(&mut self, my_port: u8, my_val: u8) {
        let index = my_port as usize;
        self.port_array[index] = my_val;
        if self.io_present {
            self.i2c_slave_adr = my_port + 0x38;
            self.param_int = 0x0100_i16 + my_val as i16;
            let _ = self.hw.twi_out(self.i2c_slave_adr, self.param_int as u16);
        } else {
            self.hw.shift_out_sr(&self.port_array);
        }
    }

    pub fn set_dir(&mut self, my_port: u8, my_val: u8) {
        if self.io_present {
            self.hw.write_io_dir(my_port, my_val);
        }
    }

    pub fn set_dir_init(&mut self, my_port: u8, my_val: u8) {
        self.eeprom.dir_init_array[my_port as usize] = my_val;
        self.set_dir(my_port, my_val);
    }

    pub fn get_new_value(&mut self, my_sub_ch: u8) -> bool {
        self.param_int = 0;
        self.param = 0.0;

        match my_sub_ch {
            0..=7 => {
                self.param_int = self.hw.get_adc(my_sub_ch + 1);
                self.param = ((self.param_int as i32
                    + self.eeprom.offset_array[my_sub_ch as usize] as i32)
                    as Float
                    * self.eeprom.scale_array[my_sub_ch as usize])
                    / self.base_scale_ad10;
                false
            }
            10..=17 => {
                self.param_int = self.adc_raw_array[(my_sub_ch - 10) as usize];
                self.param = ((self.param_int as i32
                    + self.eeprom.offset_array[my_sub_ch as usize] as i32)
                    as Float
                    * self.eeprom.scale_array[my_sub_ch as usize])
                    / self.base_scale_ad16;
                false
            }
            20..=27 => {
                self.param = self.dac_value_array[(my_sub_ch - 20) as usize];
                false
            }
            30..=37 => {
                self.param_int = self.get_port(my_sub_ch - 30) as i16;
                true
            }
            40..=47 => {
                self.param_int = self.eeprom.dir_init_array[(my_sub_ch - 40) as usize] as i16;
                true
            }
            _ => false,
        }
    }

    pub fn ser_crlf() -> &'static str {
        "\r\n"
    }

    pub fn write_ch_prefix(&self) -> String {
        format!("#{}:{}=", char::from(self.slave_ch + b'0'), self.sub_ch)
    }

    pub fn write_ser_input(&self) -> String {
        let mut out = self.ser_inp_str.clone();
        out.push_str(Self::ser_crlf());
        out
    }

    pub fn ser_prompt(&mut self, err: ErrorCode, my_status: u8) -> Option<String> {
        let should_write = self.verbose || err != ErrorCode::NoErr;
        let line = if should_write {
            self.sub_ch = ERR_SUB_CH;
            Some(format!(
                "{}{} {}{}",
                self.write_ch_prefix(),
                err as u8 + my_status,
                ERR_STR_ARR[err as usize],
                Self::ser_crlf()
            ))
        } else {
            None
        };

        if err != ErrorCode::NoErr {
            self.err_count += 1;
            self.err_flag = true;
        }

        line
    }

    pub fn param_round1000(&mut self) {
        self.param = (self.param * 1000.0).round() / 1000.0;
    }

    pub fn param_to_str(&mut self) {
        if self.param == 0.0 {
            self.param_str = "0.0".to_string();
        } else {
            self.param_str = format!("{:.*}", self.nachkomma as usize, self.param as f64);
        }
    }

    pub fn param_to_pm_str(&mut self) {
        self.param_to_str();
        if !self.param_str.starts_with('-') {
            self.param_str.insert(0, '+');
        }
    }

    pub fn write_param(&mut self) -> String {
        self.digits = 1;
        self.nachkomma = if (8..=27).contains(&self.sub_ch) || (200..=227).contains(&self.sub_ch) {
            6
        } else {
            4
        };
        self.param_to_str();
        format!(
            "{}{}{}",
            self.write_ch_prefix(),
            self.param_str,
            Self::ser_crlf()
        )
    }

    pub fn write_param_int(&mut self) -> String {
        self.param_str = self.param_int.to_string();
        format!(
            "{}{}{}",
            self.write_ch_prefix(),
            self.param_str,
            Self::ser_crlf()
        )
    }

    pub fn write_features(&self) -> String {
        let mut out = String::from("[");
        if self.dac12_present {
            out.push_str(DAC12_STR);
        }
        if self.dac714_present || self.dac16_present {
            out.push_str(DAC16_STR);
        }
        if self.adc16_present {
            out.push_str(ADC16_STR);
        }
        if self.io_present {
            out.push_str(IO816_STR);
        }
        if self.lcd_present {
            out.push_str(LCD_STR);
        }
        out.push(']');
        out
    }

    pub fn init_all(&mut self) -> Vec<String> {
        self.io_present = self.hw.detect_i2c_expander();

        for i in 0..8_u8 {
            let dir = self.eeprom.dir_init_array[i as usize];
            self.set_dir(i, dir);

            let port = self.eeprom.port_init_array[i as usize];
            self.port_array[i as usize] = port;
            self.set_port(i, port);

            if self.io_present {
                self.i2c_slave_adr = 0x38 + i;
                let _ = self.hw.twi_out(self.i2c_slave_adr, 0x0200);
            }
        }

        if !(9..=239).contains(&self.eeprom.ee_ser_baud_reg) {
            self.eeprom.ee_ser_baud_reg = 51;
        }
        self.hw.set_serial_baud(self.eeprom.ee_ser_baud_reg, true);
        self.hw.set_internal_reference(self.eeprom.ext_ref != 0);

        self.lcd_present = false;
        self.slave_ch = self.hw.read_slave_channel();
        self.set_base_scales();
        self.integrate_ad16 = self.eeprom.init_integrate_ad16;
        self.inc_rast = self.eeprom.inc_rast_def;
        self.current_ch = self.slave_ch;
        self.sub_ch = 0;
        self.status = RuntimeStatus::default();
        self.set_ee_unlocked(false);
        self.ser_inp_ptr = 0;
        self.ser_inp_str.clear();
        self.auto_trigger_ticks_remaining = None;
        self.systick_remainder_ms = 0;
        self.trigger_led_ticks_remaining = 0;
        self.hw.set_trigger_led(false);

        self.hw.set_sdataout(false);
        self.dac12_present = !self.hw.detect_sense();

        self.hw.set_sdataout(true);
        self.hw.set_str_dac(false);
        self.dac714_present = !self.hw.detect_sense();
        self.hw.set_str_dac(true);

        if self.dac12_present && self.dac714_present {
            self.dac16_present = true;
            self.dac12_present = false;
            self.dac714_present = false;
        } else {
            self.dac16_present = false;
        }

        self.hw.set_str_ad16(false);
        self.adc16_present = !self.hw.detect_sense();
        self.hw.set_str_ad16(true);

        self.hw
            .set_external_trigger_edge(self.eeprom.trig_level != 0);
        self.hw.enable_interrupts();

        for sub_ch in 20..=27_u8 {
            self.dac_value_array[(sub_ch - 20) as usize] = 0.0;
            self.set_dac(sub_ch);
        }

        self.modify = 20;
        self.current_ch = 255;
        self.err_count = 0;
        self.err_flag = false;
        self.changed_flag = true;
        self.param_text_str.clear();
        self.i2c_slave_adr = 0x48;

        let mut banner = String::new();
        self.sub_ch = 254;
        let _ = write!(banner, "{}{}", self.write_ch_prefix(), VERS1_STR);
        if self.eeprom.ee_initialised != 0xAA55 {
            banner.push_str(EE_NOT_PROGRAMMED_STR);
        }
        banner.push_str(&self.write_features());
        banner.push_str(Self::ser_crlf());

        vec![banner]
    }

    pub fn trigger_scan_outputs(&mut self) -> Vec<String> {
        let mut lines = Vec::new();

        let mut mask = self.eeprom.trig_mask_array[0];
        if mask != 0 {
            for i in (0..=7_u8).rev() {
                if mask > 127 {
                    self.sub_ch = i;
                    self.get_new_value(self.sub_ch);
                    lines.push(self.write_param());
                }
                mask <<= 1;
            }
        }

        let mut mask = self.eeprom.trig_mask_array[1];
        if mask != 0 {
            for i in (0..=7_u8).rev() {
                if mask > 127 {
                    self.sub_ch = i + 10;
                    self.get_new_value(self.sub_ch);
                    lines.push(self.write_param());
                }
                mask <<= 1;
            }
        }

        let mut mask = self.eeprom.trig_mask_array[3];
        if mask != 0 {
            for i in (0..=7_u8).rev() {
                if mask > 127 {
                    self.sub_ch = i + 30;
                    self.get_new_value(self.sub_ch);
                    lines.push(self.write_param_int());
                }
                mask <<= 1;
            }
        }

        self.trigger = false;
        lines
    }

    pub fn parse_get_param(&mut self) -> Result<Vec<String>, ErrorCode> {
        let mut lines = Vec::new();
        let mut is_integer = false;

        match self.sub_ch {
            0..=47 => {
                is_integer = self.get_new_value(self.sub_ch);
            }
            50..=67 => {
                self.get_new_value(self.sub_ch - 50);
                is_integer = true;
            }
            70..=77 => {
                self.param_int = self.dac_raw_array[(self.sub_ch - 70) as usize] as i16;
                is_integer = true;
            }
            80 => {
                self.param_int = self.modify as i16;
                is_integer = true;
            }
            85 => {
                self.param = 28.5;
                self.param_text_str = EGG_STR.to_string();
                lines.push(format!(
                    "{}{}{}",
                    self.write_ch_prefix(),
                    EGG_STR,
                    Self::ser_crlf()
                ));
                return Ok(lines);
            }
            89 | 159 => {
                self.param_int = self.inc_rast;
                is_integer = true;
            }
            95 => {
                for sub_ch in 0..=7 {
                    self.sub_ch = sub_ch;
                    self.get_new_value(sub_ch);
                    lines.push(self.write_param());
                }
                return Ok(lines);
            }
            96 => {
                for sub_ch in 10..=17 {
                    self.sub_ch = sub_ch;
                    self.get_new_value(sub_ch);
                    lines.push(self.write_param());
                }
                return Ok(lines);
            }
            98 => {
                for sub_ch in 30..=37 {
                    self.sub_ch = sub_ch;
                    self.get_new_value(sub_ch);
                    lines.push(self.write_param_int());
                }
                return Ok(lines);
            }
            99 => {
                for sub_ch in 0..=7 {
                    self.sub_ch = sub_ch;
                    self.get_new_value(sub_ch);
                    lines.push(self.write_param());
                }
                for sub_ch in 10..=17 {
                    self.sub_ch = sub_ch;
                    self.get_new_value(sub_ch);
                    lines.push(self.write_param());
                }
                for sub_ch in 30..=37 {
                    self.sub_ch = sub_ch;
                    self.get_new_value(sub_ch);
                    lines.push(self.write_param_int());
                }
                return Ok(lines);
            }
            100..=127 => {
                self.param_int = self.eeprom.offset_array[(self.sub_ch - 100) as usize];
                is_integer = true;
            }
            156 | 246 => {
                self.param_int = self.eeprom.ext_ref as i16;
                is_integer = true;
            }
            157 => {
                self.param_int = self.integrate_ad16 as i16;
                is_integer = true;
            }
            180..=187 => {
                self.param_int = self.eeprom.port_init_array[(self.sub_ch - 180) as usize] as i16;
                is_integer = true;
            }
            190..=197 => {
                self.param_int = self.eeprom.dir_init_array[(self.sub_ch - 190) as usize] as i16;
                is_integer = true;
            }
            200..=229 => {
                self.param = self.eeprom.scale_array[(self.sub_ch - 200) as usize];
            }
            230 => {
                self.param_int = self.hw.twi_inp_byte(self.i2c_slave_adr) as i16;
                is_integer = true;
            }
            231 => {
                self.param_int = self.hw.twi_inp_word(self.i2c_slave_adr) as i16;
                is_integer = true;
            }
            232 => {
                self.param_int = self.hw.twi_inp_word(self.i2c_slave_adr).swap_bytes() as i16;
                is_integer = true;
            }
            233 => {
                self.param_int =
                    (self.hw.twi_inp_word(self.i2c_slave_adr).swap_bytes() >> 7) as i16;
                self.param = self.param_int as Float / 2.0;
            }
            234 => {
                self.param_int = self.hw.twi_inp_word(self.i2c_slave_adr).swap_bytes() as i16;
                self.param = self.param_int as Float / 256.0;
            }
            239 => {
                self.param_int = self.i2c_slave_adr as i16;
                is_integer = true;
            }
            240..=243 => {
                self.param_int = self.eeprom.trig_mask_array[(self.sub_ch - 240) as usize] as i16;
                is_integer = true;
            }
            247 => {
                self.param_int = self.eeprom.trig_timer_value as i16;
                is_integer = true;
            }
            248 => {
                self.param_int = self.eeprom.trig_level as i16;
                is_integer = true;
            }
            249 => {
                self.trigger = true;
                if let Some(line) = self.ser_prompt(ErrorCode::NoErr, self.status.as_byte()) {
                    lines.push(line);
                }
                return Ok(lines);
            }
            250 | 255 => {
                if let Some(line) = self.ser_prompt(ErrorCode::NoErr, self.status.as_byte()) {
                    lines.push(line);
                }
                return Ok(lines);
            }
            251 => {
                self.param_int = self.err_count;
                is_integer = true;
            }
            252 => {
                self.param_int = self.eeprom.ee_ser_baud_reg as i16;
                is_integer = true;
            }
            253 => {
                lines.push(self.write_ser_input());
                return Ok(lines);
            }
            254 => {
                let mut line = String::new();
                let _ = write!(line, "{}{}", self.write_ch_prefix(), VERS1_STR);
                line.push_str(&self.write_features());
                line.push_str(Self::ser_crlf());
                lines.push(line);
                return Ok(lines);
            }
            _ => return Err(ErrorCode::ParamErr),
        }

        lines.push(if is_integer {
            self.write_param_int()
        } else {
            self.write_param()
        });
        Ok(lines)
    }

    pub fn parse_set_param(&mut self) -> Result<Vec<String>, ErrorCode> {
        self.changed_flag = true;

        match self.sub_ch {
            20..=27 => {
                self.dac_value_array[(self.sub_ch - 20) as usize] = self.param;
                self.set_dac(self.sub_ch);
            }
            30..=37 => {
                self.set_port(self.sub_ch - 30, self.param_byte);
            }
            40..=47 => {
                self.set_dir(self.sub_ch - 40, self.param_byte);
            }
            80 => {
                if self.param_byte > 37 {
                    return Err(ErrorCode::ParamErr);
                }
                self.modify = self.param_byte;
            }
            81 => {
                if self.param_byte > 37 {
                    return Err(ErrorCode::ParamErr);
                }
                self.require_unlocked()?;
                self.param_text_str = self.extract_bracket_text();
                self.eeprom.param_text_array[self.param_byte as usize] =
                    self.param_text_str.clone();
            }
            89 | 159 => {
                self.require_unlocked()?;
                self.inc_rast = self.param_int;
                self.eeprom.inc_rast_def = self.inc_rast;
            }
            100..=127 => {
                let index = (self.sub_ch - 100) as usize;
                self.require_unlocked()?;
                self.eeprom.offset_array[index] = self.param_int;
                self.set_dac(index as u8);
            }
            156 | 246 => {
                self.require_unlocked()?;
                self.eeprom.ext_ref = self.param_byte;
                self.hw.set_internal_reference(self.param_byte != 0);
            }
            157 => {
                self.require_unlocked()?;
                self.integrate_ad16 = self.param_byte > 0;
                self.eeprom.init_integrate_ad16 = self.integrate_ad16;
            }
            180..=187 => {
                let index = (self.sub_ch - 180) as usize;
                self.require_unlocked()?;
                self.eeprom.port_init_array[index] = self.param_byte;
                self.set_port(index as u8, self.param_byte);
            }
            190..=197 => {
                let index = (self.sub_ch - 190) as usize;
                self.require_unlocked()?;
                self.eeprom.dir_init_array[index] = self.param_byte;
                self.set_dir(index as u8, self.param_byte);
            }
            200..=229 => {
                let index = (self.sub_ch - 200) as usize;
                self.require_unlocked()?;
                self.eeprom.scale_array[index] = self.param;
                self.set_dac(index as u8);
                self.set_base_scales();
            }
            230 => {
                let _ = self.hw.twi_out(self.i2c_slave_adr, self.param_byte as u16);
            }
            231 => {
                let _ = self.hw.twi_out(self.i2c_slave_adr, self.param_int as u16);
            }
            232 => {
                let _ = self
                    .hw
                    .twi_out(self.i2c_slave_adr, (self.param_int as u16).swap_bytes());
            }
            239 => {
                self.i2c_slave_adr = self.param_byte;
            }
            240..=243 => {
                let index = (self.sub_ch - 240) as usize;
                self.require_unlocked()?;
                self.eeprom.trig_mask_array[index] = self.param_byte;
            }
            247 => {
                self.require_unlocked()?;
                if (1..=9).contains(&self.param_int) {
                    return Err(ErrorCode::ParamErr);
                }
                self.eeprom.trig_timer_value = self.param_int as u16;
                self.auto_trigger_ticks_remaining = None;
                self.systick_remainder_ms = 0;
            }
            248 => {
                self.require_unlocked()?;
                self.eeprom.trig_level = self.param_byte;
                self.hw.set_external_trigger_edge(self.param_byte != 0);
            }
            249 => {
                self.trigger = true;
                let mut lines = Vec::new();
                if let Some(line) = self.ser_prompt(ErrorCode::NoErr, self.status.as_byte()) {
                    lines.push(line);
                }
                return Ok(lines);
            }
            250 => {}
            251 => {
                self.err_count = self.param_int;
            }
            252 => {
                self.require_unlocked()?;
                self.eeprom.ee_ser_baud_reg = self.param_byte;
            }
            _ => return Err(ErrorCode::ParamErr),
        }

        let should_unlock = self.sub_ch == 250 && self.param_byte == 1;
        self.set_ee_unlocked(should_unlock);

        let mut lines = Vec::new();
        if let Some(line) = self.ser_prompt(ErrorCode::NoErr, self.status.as_byte()) {
            lines.push(line);
        }
        Ok(lines)
    }

    pub fn parse_sub_ch(&mut self) -> Result<Vec<String>, ErrorCode> {
        if self.ser_inp_str.is_empty() {
            return Ok(self
                .ser_prompt(ErrorCode::NoErr, 0)
                .into_iter()
                .collect::<Vec<_>>());
        }

        let has_main_ch = self.ser_inp_str.contains(':');
        let is_request = !self.ser_inp_str.contains('=');
        let first_char = self.ser_inp_str.chars().next().unwrap_or_default();
        let is_omni = first_char == '*';
        let is_result = first_char == '#';

        if is_result {
            return Ok(vec![self.write_ser_input()]);
        }

        self.ser_inp_ptr = 0;
        let mut lines = Vec::new();

        if has_main_ch {
            let is_param = self.parse_extract();
            if !is_param {
                return Err(ErrorCode::SyntaxErr);
            }
            self.skip_char(':');
            if is_omni {
                lines.push(self.write_ser_input());
            } else {
                self.current_ch = self.parse_u8_or_wildcard(&self.param_str)?;
            }
        }

        if !is_omni && has_main_ch && self.current_ch != self.slave_ch {
            lines.push(self.write_ser_input());
            return Ok(lines);
        }

        self.verbose = self.ser_inp_str.contains('!') || self.ser_inp_str.contains('?');

        if let Some(check_pos) = self.ser_inp_str.find('$') {
            let supplied = self
                .ser_inp_str
                .get(check_pos + 1..check_pos + 3)
                .ok_or(ErrorCode::ChecksumErr)?;
            let check_sum_in =
                u8::from_str_radix(supplied, 16).map_err(|_| ErrorCode::ChecksumErr)?;
            let mut check_sum = 0u8;
            for ch in self.ser_inp_str[..check_pos].bytes() {
                check_sum ^= ch;
            }
            if check_sum != check_sum_in {
                return Err(ErrorCode::ChecksumErr);
            }
        }

        let sub_ch_offset = if self.parse_extract() {
            self.cmd_which = CmdWhich::Val;
            0
        } else {
            self.cmd_which = CmdWhich::from_keyword(&self.param_str);
            if self.cmd_which == CmdWhich::Err {
                return Err(ErrorCode::SyntaxErr);
            }
            let offset = self
                .cmd_which
                .sub_channel_offset()
                .ok_or(ErrorCode::SyntaxErr)?;
            let _ = self.parse_extract();
            offset
        };

        let raw_sub_ch = if self.param_str.trim().is_empty() {
            0
        } else {
            self.parse_u8_or_wildcard(&self.param_str)?
        };
        self.sub_ch = raw_sub_ch.saturating_add(sub_ch_offset);

        if is_request {
            lines.extend(self.parse_get_param()?);
            return Ok(lines);
        }

        if let Some(equal_pos) = self.ser_inp_str.find('=') {
            self.ser_inp_ptr = equal_pos + 1;
        }

        if self.parse_extract() {
            self.param = self.parse_f32(&self.param_str)?;
            self.param_int = self.param as i16;
            self.param_byte = self.param_int as u8;
        } else if self.cmd_which.requires_parameter_on_set() {
            return Err(ErrorCode::ParamErr);
        }

        lines.extend(self.parse_set_param()?);
        Ok(lines)
    }

    pub fn process_serial_line(&mut self, line: &str) -> Vec<String> {
        self.ser_inp_str.clear();
        self.ser_inp_str.push_str(line);

        let mut lines = match self.parse_sub_ch() {
            Ok(lines) => lines,
            Err(err) => self.ser_prompt(err, 0).into_iter().collect(),
        };
        lines.extend(self.drain_trigger_outputs());
        lines
    }

    pub fn check_ser(&mut self) {
        while let Some(byte) = self.hw.serial_read_byte_timeout(SERIAL_POLL_TIMEOUT_MS) {
            match byte {
                8 => {
                    self.ser_inp_str.pop();
                }
                13 => {
                    let input = self.ser_inp_str.clone();
                    let lines = self.process_serial_line(&input);
                    self.emit_outputs(lines);
                    self.ser_inp_str.clear();
                }
                32..=127 => self.ser_inp_str.push(char::from(byte)),
                _ => {}
            }
        }

        let trigger_lines = self.drain_trigger_outputs();
        self.emit_outputs(trigger_lines);
    }

    pub fn service_auto_trigger(&mut self, elapsed_ms: u16) -> Vec<String> {
        self.advance_trigger_led(elapsed_ms);

        if self.eeprom.trig_timer_value == 0 {
            self.auto_trigger_ticks_remaining = None;
            self.systick_remainder_ms = 0;
        } else if self.auto_trigger_ticks_remaining.is_none() {
            self.trigger = true;
            self.auto_trigger_ticks_remaining = Some(self.auto_trigger_ticks());
        } else {
            self.systick_remainder_ms = self.systick_remainder_ms.saturating_add(elapsed_ms);
            while self.systick_remainder_ms >= SYS_TICK_MS {
                self.systick_remainder_ms -= SYS_TICK_MS;
                if let Some(remaining) = self.auto_trigger_ticks_remaining {
                    if remaining <= 1 {
                        self.trigger = true;
                        self.auto_trigger_ticks_remaining = Some(self.auto_trigger_ticks());
                    } else {
                        self.auto_trigger_ticks_remaining = Some(remaining - 1);
                    }
                }
            }
        }

        self.drain_trigger_outputs()
    }

    pub fn run_forever(&mut self) -> ! {
        let init_lines = self.init_all();
        self.emit_outputs(init_lines);
        loop {
            self.check_ser();
            let trigger_lines = self.service_auto_trigger(SYS_TICK_MS);
            self.emit_outputs(trigger_lines);
        }
    }

    fn emit_outputs(&mut self, lines: Vec<String>) {
        for line in lines {
            self.hw.serial_write(&line);
        }
    }

    fn drain_trigger_outputs(&mut self) -> Vec<String> {
        if !self.trigger {
            return Vec::new();
        }

        self.hw.set_trigger_led(true);
        self.trigger_led_ticks_remaining = TRIGGER_LED_TICKS;
        self.trigger_scan_outputs()
    }

    fn advance_trigger_led(&mut self, elapsed_ms: u16) {
        let mut remaining_ms = elapsed_ms;
        while remaining_ms >= SYS_TICK_MS && self.trigger_led_ticks_remaining > 0 {
            remaining_ms -= SYS_TICK_MS;
            self.trigger_led_ticks_remaining -= 1;
            if self.trigger_led_ticks_remaining == 0 {
                self.hw.set_trigger_led(false);
            }
        }
    }

    fn auto_trigger_ticks(&self) -> u16 {
        (self.eeprom.trig_timer_value >> 1).max(1)
    }

    fn set_ee_unlocked(&mut self, unlocked: bool) {
        self.status.ee_unlocked = unlocked;
    }

    fn require_unlocked(&self) -> Result<(), ErrorCode> {
        if self.status.ee_unlocked {
            Ok(())
        } else {
            Err(ErrorCode::LockedErr)
        }
    }

    fn parse_extract(&mut self) -> bool {
        self.param_str.clear();

        while self.peek_char() == Some(' ') {
            self.ser_inp_ptr += 1;
        }

        let first = match self.peek_char() {
            Some(ch) => ch,
            None => return false,
        };

        let is_param = matches!(first, '*' | '+' | '-' | '.' | '0'..='9');
        while let Some(ch) = self.peek_char() {
            if is_param {
                if ch <= '9' {
                    self.param_str.push(ch);
                    self.ser_inp_ptr += ch.len_utf8();
                } else {
                    break;
                }
            } else if ch.is_ascii_alphabetic() {
                self.param_str.push(ch);
                self.ser_inp_ptr += ch.len_utf8();
            } else {
                break;
            }
        }

        is_param
    }

    fn peek_char(&self) -> Option<char> {
        self.ser_inp_str[self.ser_inp_ptr..].chars().next()
    }

    fn skip_char(&mut self, expected: char) {
        if self.peek_char() == Some(expected) {
            self.ser_inp_ptr += expected.len_utf8();
        }
    }

    fn parse_u8_or_wildcard(&self, value: &str) -> Result<u8, ErrorCode> {
        if value.trim() == "*" {
            Ok(self.current_ch)
        } else {
            value.trim().parse::<u8>().map_err(|_| ErrorCode::ParamErr)
        }
    }

    fn parse_f32(&self, value: &str) -> Result<f32, ErrorCode> {
        value.trim().parse::<f32>().map_err(|_| ErrorCode::ParamErr)
    }

    fn extract_bracket_text(&self) -> String {
        match (
            self.ser_inp_str.find('['),
            self.ser_inp_str[self.ser_inp_ptr..].find(']'),
        ) {
            (Some(start), Some(end)) => {
                let start = start + 1;
                let end = self.ser_inp_ptr + end;
                if end >= start {
                    self.ser_inp_str[start..end].to_string()
                } else {
                    String::new()
                }
            }
            _ => String::new(),
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::collections::VecDeque;

    #[derive(Debug, Clone)]
    struct MockHardware {
        adc_values: [i16; 8],
        io_values: [u8; 8],
        detect_io_expander: bool,
        has_dac12: bool,
        has_dac714: bool,
        has_adc16: bool,
        slave_channel: u8,
        serial_in: VecDeque<u8>,
        serial_out: Vec<String>,
        twi_writes: Vec<(u8, u16)>,
        shift_register_writes: Vec<[u8; 8]>,
        dir_writes: Vec<(u8, u8)>,
        twi_byte_reads: VecDeque<u8>,
        twi_word_reads: VecDeque<u16>,
        baud: Option<(u8, bool)>,
        internal_reference: Option<bool>,
        trigger_edge_positive: Option<bool>,
        interrupts_enabled: bool,
        trigger_led_events: Vec<bool>,
        sdataout_high: bool,
        str_dac_high: bool,
        str_ad16_high: bool,
    }

    impl Default for MockHardware {
        fn default() -> Self {
            Self {
                adc_values: [0; 8],
                io_values: [0; 8],
                detect_io_expander: false,
                has_dac12: false,
                has_dac714: false,
                has_adc16: false,
                slave_channel: 0,
                serial_in: VecDeque::new(),
                serial_out: Vec::new(),
                twi_writes: Vec::new(),
                shift_register_writes: Vec::new(),
                dir_writes: Vec::new(),
                twi_byte_reads: VecDeque::new(),
                twi_word_reads: VecDeque::new(),
                baud: None,
                internal_reference: None,
                trigger_edge_positive: None,
                interrupts_enabled: false,
                trigger_led_events: Vec::new(),
                sdataout_high: true,
                str_dac_high: true,
                str_ad16_high: true,
            }
        }
    }

    impl MockHardware {
        fn push_serial(&mut self, text: &str) {
            self.serial_in.extend(text.bytes());
        }
    }

    impl AdaHardware for MockHardware {
        fn get_adc(&mut self, channel_1_based: u8) -> i16 {
            self.adc_values[(channel_1_based - 1) as usize]
        }

        fn twi_out(&mut self, slave_addr: u8, command: u16) -> bool {
            self.twi_writes.push((slave_addr, command));
            true
        }

        fn shift_out_sr(&mut self, port_array: &[u8; 8]) {
            self.shift_register_writes.push(*port_array);
        }

        fn read_io_pin(&mut self, port: u8) -> u8 {
            self.io_values[port as usize]
        }

        fn write_io_dir(&mut self, port: u8, value: u8) {
            self.dir_writes.push((port, value));
        }

        fn detect_i2c_expander(&mut self) -> bool {
            self.detect_io_expander
        }

        fn detect_sense(&mut self) -> bool {
            if !self.str_ad16_high {
                !self.has_adc16
            } else if !self.str_dac_high {
                !self.has_dac714
            } else if !self.sdataout_high {
                !self.has_dac12
            } else {
                true
            }
        }

        fn read_slave_channel(&mut self) -> u8 {
            self.slave_channel
        }

        fn set_external_trigger_edge(&mut self, positive: bool) {
            self.trigger_edge_positive = Some(positive);
        }

        fn enable_interrupts(&mut self) {
            self.interrupts_enabled = true;
        }

        fn twi_inp_byte(&mut self, _slave_addr: u8) -> u8 {
            self.twi_byte_reads.pop_front().unwrap_or_default()
        }

        fn twi_inp_word(&mut self, _slave_addr: u8) -> u16 {
            self.twi_word_reads.pop_front().unwrap_or_default()
        }

        fn serial_read_byte_timeout(&mut self, _timeout_ms: u16) -> Option<u8> {
            self.serial_in.pop_front()
        }

        fn serial_write(&mut self, text: &str) {
            self.serial_out.push(text.to_string());
        }

        fn set_serial_baud(&mut self, ubrr: u8, double_speed: bool) {
            self.baud = Some((ubrr, double_speed));
        }

        fn set_internal_reference(&mut self, internal: bool) {
            self.internal_reference = Some(internal);
        }

        fn set_sdataout(&mut self, high: bool) {
            self.sdataout_high = high;
        }

        fn set_str_dac(&mut self, high: bool) {
            self.str_dac_high = high;
        }

        fn set_str_ad16(&mut self, high: bool) {
            self.str_ad16_high = high;
        }

        fn set_trigger_led(&mut self, active: bool) {
            self.trigger_led_events.push(active);
        }
    }

    #[test]
    fn init_all_restores_detection_and_startup_settings() {
        let hw = MockHardware {
            detect_io_expander: true,
            has_dac12: true,
            has_dac714: true,
            has_adc16: true,
            slave_channel: 2,
            ..MockHardware::default()
        };
        let mut state = DeviceState::new(hw);
        state.eeprom.ee_ser_baud_reg = 115;
        state.eeprom.ext_ref = 1;
        state.eeprom.trig_level = 1;
        state.eeprom.dir_init_array[3] = 0xAA;
        state.eeprom.port_init_array[3] = 0x55;

        let banner = state.init_all();

        assert!(state.io_present);
        assert!(state.dac16_present);
        assert!(!state.dac12_present);
        assert!(!state.dac714_present);
        assert!(state.adc16_present);
        assert_eq!(state.hw.baud, Some((115, true)));
        assert_eq!(state.hw.internal_reference, Some(true));
        assert_eq!(state.hw.trigger_edge_positive, Some(true));
        assert!(state.hw.interrupts_enabled);
        assert!(banner[0].contains("#2:254=1.742 [ADA by CM/c't 04/2007; [DA16 AD16 IO32 ]"));
        assert!(state.hw.twi_writes.contains(&(0x3b, 0x0155)));
        assert!(state.hw.twi_writes.contains(&(0x3b, 0x0200)));
    }

    #[test]
    fn serial_loop_restores_control_subchannels_and_backspace_handling() {
        let mut hw = MockHardware {
            slave_channel: 0,
            ..MockHardware::default()
        };
        hw.push_serial("0:WEZ\u{8}N=1\r");
        hw.push_serial("0:OPT9=7?\r");
        hw.push_serial("0:WEN=1\r");
        hw.push_serial("0:TRM0=129?\r");
        hw.push_serial("0:WEN=1\r");
        hw.push_serial("0:TRT=10?\r");
        hw.push_serial("0:WEN=1\r");
        hw.push_serial("0:TRL=1?\r");
        hw.push_serial("0:WEN=1\r");
        hw.push_serial("0:REF=1?\r");
        hw.push_serial("0:WEN=1\r");
        hw.push_serial("0:SBD=115?\r");
        hw.push_serial("0:OPT9?\r");
        hw.push_serial("0:TRM0?\r");
        hw.push_serial("0:TRT?\r");
        hw.push_serial("0:TRL?\r");
        hw.push_serial("0:REF?\r");
        hw.push_serial("0:SBD?\r");
        hw.push_serial("#7:1=foreign\r");
        hw.push_serial("1:VAL0?\r");

        let mut state = DeviceState::new(hw);
        state.init_all();
        state.check_ser();

        assert_eq!(state.inc_rast, 7);
        assert_eq!(state.eeprom.inc_rast_def, 7);
        assert_eq!(state.eeprom.trig_mask_array[0], 129);
        assert_eq!(state.eeprom.trig_timer_value, 10);
        assert_eq!(state.eeprom.trig_level, 1);
        assert_eq!(state.eeprom.ext_ref, 1);
        assert_eq!(state.eeprom.ee_ser_baud_reg, 115);
        assert_eq!(state.hw.trigger_edge_positive, Some(true));
        assert_eq!(state.hw.internal_reference, Some(true));
        assert_eq!(state.hw.baud, Some((51, true)));
        assert!(state
            .hw
            .serial_out
            .iter()
            .any(|line| line.contains("#0:159=7\r\n")));
        assert!(state
            .hw
            .serial_out
            .iter()
            .any(|line| line.contains("#0:240=129\r\n")));
        assert!(state
            .hw
            .serial_out
            .iter()
            .any(|line| line.contains("#0:247=10\r\n")));
        assert!(state
            .hw
            .serial_out
            .iter()
            .any(|line| line.contains("#0:248=1\r\n")));
        assert!(state
            .hw
            .serial_out
            .iter()
            .any(|line| line.contains("#0:246=1\r\n")));
        assert!(state
            .hw
            .serial_out
            .iter()
            .any(|line| line.contains("#0:252=115\r\n")));
        assert!(state
            .hw
            .serial_out
            .iter()
            .any(|line| line == "#7:1=foreign\r\n"));
        assert!(state.hw.serial_out.iter().any(|line| line == "1:VAL0?\r\n"));
    }

    #[test]
    fn auto_trigger_scheduler_and_side_effects_are_restored() {
        let hw = MockHardware {
            adc_values: [10, 20, 30, 40, 50, 60, 70, 80],
            io_values: [0, 1, 2, 3, 4, 5, 6, 0xAA],
            detect_io_expander: true,
            slave_channel: 0,
            ..MockHardware::default()
        };
        let mut state = DeviceState::new(hw);
        state.init_all();
        state.adc_raw_array[7] = 160;
        state.eeprom.trig_mask_array[0] = 0x80;
        state.eeprom.trig_mask_array[1] = 0x80;
        state.eeprom.trig_mask_array[3] = 0x80;
        state.eeprom.trig_timer_value = 10;

        let first = state.service_auto_trigger(0);
        assert_eq!(first.len(), 3);
        assert!(first[0].contains("#0:7="));
        assert!(first[1].contains("#0:17="));
        assert_eq!(first[2], "#0:37=170\r\n");
        assert_eq!(state.hw.trigger_led_events.last(), Some(&true));

        let second = state.service_auto_trigger(10);
        assert_eq!(second.len(), 3);
        assert!(second[0].contains("#0:7="));

        state.eeprom.trig_timer_value = 0;
        let none = state.service_auto_trigger(60);
        assert!(none.is_empty());
        assert_eq!(state.hw.trigger_led_events.last(), Some(&false));
    }
}
