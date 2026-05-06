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

pub const PORT_A_INIT: u8 = 0b0000_0011;
pub const PORT_C_INIT: u8 = 0b0000_0011;
pub const ADC24_MID_SCALE: i32 = 0x800000;
pub const EE_INITIALISED_MAGIC: u16 = 0xAA55;
pub const OFFSET_INITIALISED_MAGIC: u16 = 0xAA55;
pub const ERR_SUB_CH: u8 = 255;

pub const RANGE_STR_ARR: [&str; 16] = [
    "DC 250mV", "DC  2.5V", "DC   25V", "DC  250V", "AC 250mV", "AC  2.5V", "AC   25V", "AC  250V",
    "DC 250uA", "DC  25mA", "DC  2.5A", "DC   10A", "AC 250uA", "AC  25mA", "AC  2.5A", "AC   10A",
];

pub const DIGITS_ARR: [u8; 16] = [3, 1, 2, 3, 3, 1, 2, 3, 3, 2, 1, 1, 3, 2, 1, 1];
pub const NACHKOMMA_ARR: [u8; 16] = [3, 5, 4, 3, 3, 5, 4, 3, 3, 4, 5, 5, 3, 4, 5, 5];

pub const RANGE_ARR_PORT_A: [u8; 16] = [
    0b0000_0000 | PORT_A_INIT,
    0b0000_0000 | PORT_A_INIT,
    0b0010_0000 | PORT_A_INIT,
    0b0010_0000 | PORT_A_INIT,
    0b0000_0000 | PORT_A_INIT,
    0b0000_0000 | PORT_A_INIT,
    0b0000_0000 | PORT_A_INIT,
    0b0000_0000 | PORT_A_INIT,
    0b0000_0000 | PORT_A_INIT,
    0b0100_0000 | PORT_A_INIT,
    0b1000_0000 | PORT_A_INIT,
    0b1000_0000 | PORT_A_INIT,
    0b0000_0000 | PORT_A_INIT,
    0b0100_0000 | PORT_A_INIT,
    0b1000_0000 | PORT_A_INIT,
    0b1000_0000 | PORT_A_INIT,
];

pub const RANGE_ARR_PORT_C: [u8; 16] = [
    0b0000_0000 | PORT_C_INIT,
    0b0000_0000 | PORT_C_INIT,
    0b0001_0000 | PORT_C_INIT,
    0b0010_0000 | PORT_C_INIT,
    0b0100_0100 | PORT_C_INIT,
    0b0100_0000 | PORT_C_INIT,
    0b0100_1100 | PORT_C_INIT,
    0b0100_1000 | PORT_C_INIT,
    0b1000_0000 | PORT_C_INIT,
    0b1000_0000 | PORT_C_INIT,
    0b1000_0000 | PORT_C_INIT,
    0b1000_0000 | PORT_C_INIT,
    0b1100_0100 | PORT_C_INIT,
    0b1100_0100 | PORT_C_INIT,
    0b1100_0100 | PORT_C_INIT,
    0b1100_0100 | PORT_C_INIT,
];

pub const RANGE_ARRAY_24: [Float; 16] = [
    250.0 / 8_388_608.0,
    2.5 / 8_388_608.0,
    25.0 / 8_388_608.0,
    250.0 / 8_388_608.0,
    250.0 / 8_388_608.0,
    2.5 / 8_388_608.0,
    25.0 / 8_388_608.0,
    250.0 / 8_388_608.0,
    250.0 / 8_388_608.0,
    25.0 / 8_388_608.0,
    2.5 / 8_388_608.0,
    2.5 / 8_388_608.0,
    250.0 / 8_388_608.0,
    25.0 / 8_388_608.0,
    2.5 / 8_388_608.0,
    2.5 / 8_388_608.0,
];

pub const RANGE_ARRAY_10: [Float; 16] = [
    250.0 / 512.0,
    2.5 / 512.0,
    25.0 / 512.0,
    250.0 / 512.0,
    250.0 / 1024.0,
    25.0 / 1024.0,
    2.5 / 1024.0,
    2.5 / 1024.0,
    250.0 / 512.0,
    25.0 / 512.0,
    2.5 / 512.0,
    2.5 / 512.0,
    250.0 / 1024.0,
    25.0 / 1024.0,
    2.5 / 1024.0,
    2.5 / 1024.0,
];

pub const CMD_STR_ARR: [&str; 16] = [
    "STR", "IDN", "TRG", "VAL", "RNG", "DSP", "OFS", "SCL", "ALL", "TRM", "TRT", "TRL", "ERC",
    "SBD", "WEN", "NOP",
];

pub const ERR_STR_ARR: [&str; 8] = [
    "[OK]", "[SRQUSR]", "[BUSY]", "[OVRLD]", "[CMDERR]", "[PARERR]", "[LOCKED]", "[CHKSUM]",
];

pub const FAULT_STR_ARR: [&str; 4] = ["[OVRNEG]", "[OVRPOS]", "[]", "[]"];

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

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct RangeRelayConfig {
    pub range: DivRange,
    pub port_a: u8,
    pub port_c: u8,
    pub dc_gain_10: bool,
    pub digits: u8,
    pub decimals: u8,
}

impl RangeRelayConfig {
    pub fn for_range(range: DivRange) -> Self {
        let index = range as usize;
        Self {
            range,
            port_a: RANGE_ARR_PORT_A[index],
            port_c: RANGE_ARR_PORT_C[index],
            dc_gain_10: matches!(
                range,
                DivRange::Dc250mV
                    | DivRange::Dc250uA
                    | DivRange::Dc25mA
                    | DivRange::Dc2A5
                    | DivRange::Dc10A
            ),
            digits: DIGITS_ARR[index],
            decimals: NACHKOMMA_ARR[index],
        }
    }
}

#[derive(Debug, Clone)]
pub struct EepromData {
    pub ad24_offsets: [i32; 16],
    pub ad24_scales: [Float; 16],
    pub ad10_offsets: [i16; 16],
    pub ad10_scales: [Float; 16],
    pub init_inc_rast: i16,
    pub init_lcd_integrate: u8,
    pub init_range: DivRange,
    // Original TRM mask: bit0=AD24, bit1=AD10 RMS, bit2=AD10 peak.
    pub trigger_mode: u8,
    // Auto-trigger interval in milliseconds; 0 disables timed retriggering.
    pub trigger_timer_ms: u16,
    // INT2 trigger edge: false=negative edge, true=positive edge.
    pub trigger_edge_level: bool,
    pub ee_ser_baud_reg: u8,
    pub ee_initialised: u16,
    pub offset_initialised: u16,
}

impl Default for EepromData {
    fn default() -> Self {
        Self {
            ad24_offsets: [0; 16],
            ad24_scales: [1.0; 16],
            ad10_offsets: [0; 16],
            ad10_scales: [1.0; 16],
            init_inc_rast: 4,
            init_lcd_integrate: 1,
            init_range: DivRange::Dc25V,
            trigger_mode: 0,
            trigger_timer_ms: 0,
            trigger_edge_level: false,
            ee_ser_baud_reg: 51,
            ee_initialised: EE_INITIALISED_MAGIC,
            offset_initialised: 0,
        }
    }
}

pub trait DivHardware {
    fn read_adc10(&mut self, channel_1_based: u8) -> i16;
    fn read_adc24(&mut self) -> i32;
    fn read_adc24_fast_integrated(&mut self) -> i32 {
        self.read_adc24()
    }
    fn read_adc24_slow_integrated(&mut self) -> i32 {
        self.read_adc24()
    }
    fn adc24_overload_negative(&self) -> bool {
        false
    }
    fn adc24_overload_positive(&self) -> bool {
        false
    }
    fn set_range(&mut self, range: DivRange);
    fn set_range_config(&mut self, config: RangeRelayConfig) {
        self.set_range(config.range);
    }
    fn set_trigger_edge(&mut self, _positive_edge: bool) {}
    fn poll_serial_byte(&mut self) -> Option<u8> {
        None
    }
    fn serial_write(&mut self, text: &str);
    fn lcd_write_line(&mut self, row: u8, text: &str);
}

#[derive(Debug, Clone)]
pub struct DeviceState<H> {
    pub hw: H,
    pub eeprom: EepromData,
    pub slave_ch: u8,
    pub sub_ch: u8,
    pub current_ch: u8,
    pub range: DivRange,
    pub lcd_integrate: u8,
    pub inc_rast: i16,
    pub measured_value: Float,
    pub measured_aux: Float,
    // Raised by either the external INT2 edge or the periodic auto-trigger timer.
    pub trigger_pending: bool,
    pub auto_trigger_elapsed_ms: u16,
    pub trigger_outputs: Vec<u8>,
    pub current_range_config: RangeRelayConfig,
    // Pascal kept separate fast/slow integrated AD24 accumulators for quieter display reads.
    pub integrate_24_fast: i64,
    pub integrate_24_slow: i64,
    pub overload_negative: bool,
    pub overload_positive: bool,
    pub busy_flag: bool,
    pub user_srq_flag: bool,
    pub ee_unlocked: bool,
    pub check_limit_err: ErrorCode,
    pub button_number: u8,
    pub err_count: i16,
    pub fault_timer_ticks: u8,
    pub ser_input: String,
    pub param_str: String,
}

impl<H: DivHardware> DeviceState<H> {
    pub fn new(hw: H) -> Self {
        Self {
            hw,
            eeprom: EepromData::default(),
            slave_ch: 0,
            sub_ch: 0,
            current_ch: 255,
            range: DivRange::Dc2V5,
            lcd_integrate: 1,
            inc_rast: 4,
            measured_value: 0.0,
            measured_aux: 0.0,
            trigger_pending: false,
            auto_trigger_elapsed_ms: 0,
            trigger_outputs: Vec::new(),
            current_range_config: RangeRelayConfig::for_range(DivRange::Dc2V5),
            integrate_24_fast: 0,
            integrate_24_slow: 0,
            overload_negative: false,
            overload_positive: false,
            busy_flag: false,
            user_srq_flag: false,
            ee_unlocked: false,
            check_limit_err: ErrorCode::NoErr,
            button_number: 0,
            err_count: 0,
            fault_timer_ticks: 20,
            ser_input: String::new(),
            param_str: String::new(),
        }
    }

    pub fn patch_copy_from_ee(&mut self) {
        self.inc_rast = self.eeprom.init_inc_rast;
        self.lcd_integrate = self.eeprom.init_lcd_integrate;
        self.range = self.eeprom.init_range;
        self.hw.set_trigger_edge(self.eeprom.trigger_edge_level);
    }

    pub fn is_ac_range(&self) -> bool {
        matches!(
            self.range,
            DivRange::Ac250mV
                | DivRange::Ac2V5
                | DivRange::Ac25V
                | DivRange::Ac250V
                | DivRange::Ac250uA
                | DivRange::Ac25mA
                | DivRange::Ac2A5
                | DivRange::Ac10A
        )
    }

    pub fn param_scale_10(&self, raw: i16) -> Float {
        // The original path applied offset first, then the per-range full-scale factor,
        // then the stored calibration scale factor for the 10-bit ADC path.
        let offset_raw = raw + self.eeprom.ad10_offsets[self.range as usize];
        let value = offset_raw as Float
            * RANGE_ARRAY_10[self.range as usize]
            * self.eeprom.ad10_scales[self.range as usize];
        if self.is_ac_range() {
            value.abs()
        } else {
            value
        }
    }

    pub fn param_scale_24(&self, raw: i32) -> Float {
        // Same scaling order as Pascal, but for the LTC2400 measurement path.
        let offset_raw = raw + self.eeprom.ad24_offsets[self.range as usize];
        let value = offset_raw as Float
            * RANGE_ARRAY_24[self.range as usize]
            * self.eeprom.ad24_scales[self.range as usize];
        if self.is_ac_range() {
            value.abs()
        } else {
            value
        }
    }

    pub fn get_ad10(&mut self, channel: u8) {
        let mut raw = self.hw.read_adc10(channel);
        self.overload_positive = raw >= 1022;
        self.overload_negative = false;
        if channel == 5 {
            self.overload_negative = raw == 0;
            raw -= 512;
        }
        self.measured_aux = self.param_scale_10(raw);
    }

    pub fn get_ad24(&mut self, int_mode: u8) {
        self.overload_negative = self.hw.adc24_overload_negative();
        self.overload_positive = self.hw.adc24_overload_positive();
        let source = match int_mode {
            1 => self.hw.read_adc24_fast_integrated(),
            2 => self.hw.read_adc24_slow_integrated(),
            _ => self.hw.read_adc24(),
        };
        let mut raw = source - ADC24_MID_SCALE;
        if self.is_ac_range() && raw < 0 {
            raw = 0;
        }
        self.measured_value = self.param_scale_24(raw);
    }

    pub fn overload_flag(&self) -> bool {
        self.overload_negative || self.overload_positive
    }

    pub fn fault_flags(&self) -> u8 {
        u8::from(self.overload_negative) | (u8::from(self.overload_positive) << 1)
    }

    pub fn wait_ad10(&mut self) {}

    pub fn wait_ad24(&mut self) {}

    pub fn integrate_reset(&mut self) {
        // Clear the integration history whenever the range relays move so the next
        // reading is not blended with samples from the previous attenuation path.
        self.integrate_24_fast = i64::from(ADC24_MID_SCALE);
        self.integrate_24_slow = i64::from(ADC24_MID_SCALE);
    }

    pub fn switch_range(&mut self, range: DivRange) {
        // In Pascal this selected relay and gain bit patterns from lookup tables on
        // PortA/PortC, updated display formatting, and reset the running integrators.
        self.range = range;
        self.current_range_config = RangeRelayConfig::for_range(range);
        self.hw.set_range_config(self.current_range_config);
        self.integrate_reset();
    }

    pub fn set_trigger_edge_level(&mut self, positive_edge: bool) {
        self.eeprom.trigger_edge_level = positive_edge;
        self.hw.set_trigger_edge(positive_edge);
    }

    pub fn int2_trigger_edge(&mut self, positive_edge: bool) {
        if positive_edge == self.eeprom.trigger_edge_level {
            self.trigger_pending = true;
        }
    }

    pub fn tick_auto_trigger(&mut self, elapsed_ms: u16) {
        let timer = self.eeprom.trigger_timer_ms;
        if timer == 0 {
            self.auto_trigger_elapsed_ms = 0;
            return;
        }

        self.auto_trigger_elapsed_ms = self.auto_trigger_elapsed_ms.saturating_add(elapsed_ms);
        if self.auto_trigger_elapsed_ms >= timer {
            self.auto_trigger_elapsed_ms %= timer;
            self.trigger_pending = true;
        }
    }

    pub fn service_trigger(&mut self) -> &[u8] {
        self.trigger_outputs.clear();
        if !self.trigger_pending {
            return &self.trigger_outputs;
        }

        let mask = self.eeprom.trigger_mode;
        if (mask & 0x01) != 0 {
            self.trigger_outputs.push(0);
        }
        if (mask & 0x02) != 0 {
            self.trigger_outputs.push(10);
        }
        if (mask & 0x04) != 0 {
            self.trigger_outputs.push(11);
        }
        self.trigger_pending = false;
        &self.trigger_outputs
    }

    pub fn ser_crlf(&mut self) {
        self.hw.serial_write("\r\n");
    }

    pub fn write_ch_prefix(&mut self) {
        self.hw.serial_write("#");
        self.hw.serial_write(&self.slave_ch.to_string());
        self.hw.serial_write(":");
        self.hw.serial_write(&self.sub_ch.to_string());
        self.hw.serial_write("=");
    }

    pub fn write_ser_inp(&mut self) {
        self.hw.serial_write(&self.ser_input);
        self.ser_crlf();
    }

    pub fn ser_prompt(&mut self, err: ErrorCode) {
        self.sub_ch = ERR_SUB_CH;
        self.write_ch_prefix();

        let mut status = 0u8;
        if self.busy_flag {
            status |= 0x80;
        }
        if self.user_srq_flag {
            status |= 0x40;
        }
        if self.overload_flag() {
            status |= 0x20;
        }
        if self.ee_unlocked {
            status |= 0x10;
        }

        let fault_flags = self.fault_flags();
        match err {
            ErrorCode::UserReq => {
                status |= 0x40 | (self.button_number & 0x0F);
            }
            ErrorCode::OvlErr => {
                status |= fault_flags;
            }
            _ => {
                status |= err as u8;
                if err != ErrorCode::NoErr {
                    self.err_count = self.err_count.saturating_add(1);
                }
            }
        }

        self.hw.serial_write(&status.to_string());
        if fault_flags != 0 {
            for (index, label) in FAULT_STR_ARR.iter().enumerate() {
                if (fault_flags & (1 << index)) != 0 {
                    self.hw.serial_write(" ");
                    self.hw.serial_write(label);
                }
            }
        } else {
            self.hw.serial_write(" ");
            self.hw
                .serial_write(ERR_STR_ARR[(err as usize).min(ERR_STR_ARR.len() - 1)]);
        }
        self.ser_crlf();
    }

    pub fn param_to_str(&self, to_lcd: bool) -> String {
        let decimals = NACHKOMMA_ARR[self.range as usize] as usize;
        if to_lcd {
            let mut text = format!("{:0>7.*}", decimals, self.measured_value.abs());
            let prefix = if self.measured_value < 0.0 {
                '-'
            } else if self.is_ac_range() {
                '\x03'
            } else {
                '+'
            };
            text.insert(0, prefix);
            text.push_str("00000");
            text.truncate(8);
            text
        } else {
            let decimals = decimals + 2;
            if self.measured_value < 0.0 {
                format!("{:.*}", decimals, self.measured_value)
            } else {
                format!("{:.*}", decimals, self.measured_value.abs())
            }
        }
    }

    pub fn show_range(&mut self) {
        self.hw
            .lcd_write_line(1, RANGE_STR_ARR[self.range as usize]);
    }

    pub fn write_param_lcd(&mut self) {
        self.hw.lcd_write_line(0, &self.param_to_str(true));
    }

    pub fn write_param_ser(&mut self, ovl: bool) {
        self.write_ch_prefix();
        if ovl && self.sub_ch < 20 {
            self.hw.serial_write("-9999 [OVERLD]");
        } else {
            self.hw.serial_write(&self.param_to_str(false));
            if self.sub_ch < 20 {
                if let Some(suffix) = range_exponent_suffix(self.range) {
                    self.hw.serial_write(suffix);
                }
            }
        }
        self.ser_crlf();
    }

    pub fn write_param_aux_ser(&mut self, ovl: bool) {
        self.write_ch_prefix();
        if ovl && self.sub_ch < 20 {
            self.hw.serial_write("-9999 [OVERLD]");
        } else {
            self.hw
                .serial_write(&self.param_to_str_value(self.measured_aux, false));
            if self.sub_ch < 20 {
                if let Some(suffix) = range_exponent_suffix(self.range) {
                    self.hw.serial_write(suffix);
                }
            }
        }
        self.ser_crlf();
    }

    fn param_to_str_value(&self, value: Float, to_lcd: bool) -> String {
        let decimals = NACHKOMMA_ARR[self.range as usize] as usize;
        if to_lcd {
            let mut text = format!("{:0>7.*}", decimals, value.abs());
            let prefix = if value < 0.0 {
                '-'
            } else if self.is_ac_range() {
                '\x03'
            } else {
                '+'
            };
            text.insert(0, prefix);
            text.push_str("00000");
            text.truncate(8);
            text
        } else {
            let decimals = decimals + 2;
            if value < 0.0 {
                format!("{:.*}", decimals, value)
            } else {
                format!("{:.*}", decimals, value.abs())
            }
        }
    }

    pub fn write_param_long_int_ser(&mut self, value: i64) {
        self.write_ch_prefix();
        self.hw.serial_write(&value.to_string());
        self.ser_crlf();
    }

    pub fn check_limits(&mut self) -> bool {
        self.check_limit_err = ErrorCode::NoErr;
        false
    }

    pub fn check_limits_raw_range(&mut self, raw_range: u8) -> bool {
        let (range, limited) = limit_raw_range(raw_range);
        self.range = range;
        self.check_limit_err = if limited {
            ErrorCode::ParamErr
        } else {
            ErrorCode::NoErr
        };
        limited
    }

    pub fn check_ser(&mut self) {
        while let Some(byte) = self.hw.poll_serial_byte() {
            match byte {
                8 => {
                    self.ser_input.pop();
                }
                13 => {
                    self.parse_serial_frame();
                    self.ser_input.clear();
                }
                32..=127 => {
                    self.ser_input.push(byte as char);
                }
                _ => {}
            }
        }

        self.overload_negative = self.hw.adc24_overload_negative();
        self.overload_positive = self.hw.adc24_overload_positive();
        if self.fault_timer_ticks == 0 {
            if self.fault_flags() != 0 {
                self.ser_prompt(ErrorCode::OvlErr);
            }
            self.fault_timer_ticks = 20;
        } else {
            self.fault_timer_ticks -= 1;
        }
    }

    fn parse_serial_frame(&mut self) {
        if self.ser_input.is_empty() {
            self.ser_prompt(ErrorCode::NoErr);
            return;
        }

        if self.ser_input.starts_with('#') {
            self.write_ser_inp();
            return;
        }

        let frame = self.ser_input.clone();
        let (addressed, payload) = match frame.split_once(':') {
            Some((main_ch, rest)) => {
                if main_ch == "*" {
                    self.write_ser_inp();
                    (true, rest)
                } else if main_ch.parse::<u8>().ok() == Some(self.slave_ch) {
                    self.current_ch = self.slave_ch;
                    (true, rest)
                } else {
                    self.write_ser_inp();
                    (false, rest)
                }
            }
            None => (true, frame.as_str()),
        };

        if !addressed {
            return;
        }

        if self.busy_flag {
            self.ser_prompt(ErrorCode::BusyErr);
            return;
        }

        let request = !payload.contains('=');
        let command = payload.trim_end_matches('?').trim_end_matches('!');
        if request {
            self.parse_get_command(command);
        } else if let Some((left, right)) = payload.split_once('=') {
            self.parse_set_command(left.trim(), right.trim());
        } else {
            self.ser_prompt(ErrorCode::ParamErr);
        }
    }

    fn parse_get_command(&mut self, command: &str) {
        let upper = command.trim().to_ascii_uppercase();
        match upper.as_str() {
            "STR" => self.ser_prompt(ErrorCode::NoErr),
            "IDN" => {
                self.sub_ch = 254;
                self.write_ch_prefix();
                self.hw.serial_write(VERS1_STR);
                self.ser_crlf();
            }
            "TRG" => {
                self.trigger_pending = true;
                self.ser_prompt(ErrorCode::NoErr);
            }
            "RNG" => {
                self.sub_ch = 19;
                self.write_param_long_int_ser(self.range as i64);
            }
            "ERC" => {
                self.sub_ch = 251;
                self.write_param_long_int_ser(i64::from(self.err_count));
            }
            raw => {
                let sub_ch = raw
                    .strip_prefix("VAL")
                    .unwrap_or(raw)
                    .trim()
                    .parse::<u8>()
                    .unwrap_or(0);
                self.sub_ch = sub_ch;
                self.parse_get_sub_ch(sub_ch);
            }
        }
    }

    fn parse_get_sub_ch(&mut self, sub_ch: u8) {
        match sub_ch {
            0..=2 => {
                self.get_ad24(sub_ch);
                self.write_param_ser(self.overload_flag());
            }
            3 => {
                self.wait_ad24();
                self.get_ad24(0);
                self.write_param_ser(self.overload_flag());
            }
            10 => {
                self.wait_ad10();
                let channel = if self.is_ac_range() { 3 } else { 5 };
                self.get_ad10(channel);
                self.write_param_aux_ser(self.overload_flag());
            }
            11 => {
                self.wait_ad10();
                let channel = if self.is_ac_range() { 4 } else { 5 };
                self.get_ad10(channel);
                self.write_param_aux_ser(self.overload_flag());
            }
            19 => {
                self.write_param_long_int_ser(self.range as i64);
            }
            255 => {
                self.ser_prompt(ErrorCode::NoErr);
            }
            _ => self.ser_prompt(ErrorCode::ParamErr),
        }
    }

    fn parse_set_command(&mut self, left: &str, right: &str) {
        let value = right.parse::<i32>().unwrap_or(0);
        match left.to_ascii_uppercase().as_str() {
            "RNG" => {
                let limited = self.check_limits_raw_range(value as u8);
                self.sub_ch = 19;
                self.switch_range(self.range);
                if limited {
                    self.ser_prompt(self.check_limit_err);
                }
            }
            "WEN" => {
                self.sub_ch = 250;
                self.ee_unlocked = true;
            }
            _ => self.ser_prompt(ErrorCode::ParamErr),
        }
    }

    pub fn initialise_zero_offsets(&mut self, sample: i32) {
        let offset = ADC24_MID_SCALE - sample;
        for offset_slot in self.eeprom.ad24_offsets.iter_mut() {
            *offset_slot = offset;
        }
        self.eeprom.offset_initialised = OFFSET_INITIALISED_MAGIC;
    }

    pub fn needs_zero_offset_initialisation(&self) -> bool {
        self.eeprom.offset_initialised != OFFSET_INITIALISED_MAGIC
    }

    pub fn check_delay(&mut self, delay_ticks: u8) {
        for _ in 0..delay_ticks {
            self.check_ser();
        }
    }

    pub fn blink_delay(&mut self, delay_ticks: u8) {
        self.check_delay(delay_ticks);
    }

    pub fn init_all(&mut self) {
        self.patch_copy_from_ee();
        self.switch_range(self.range);
        self.sub_ch = 254;
        self.write_ch_prefix();
        self.hw.serial_write(VERS1_STR);
        if self.eeprom.ee_initialised != EE_INITIALISED_MAGIC {
            self.hw.serial_write("EEPROM EMPTY! ");
        }
        if self.needs_zero_offset_initialisation() {
            self.hw.serial_write("[OFS INIT]");
            self.ser_crlf();
            self.busy_flag = true;
            self.ser_prompt(ErrorCode::BusyErr);
            let zero_sample = self.hw.read_adc24_fast_integrated();
            self.initialise_zero_offsets(zero_sample);
            self.busy_flag = false;
            self.ser_prompt(ErrorCode::NoErr);
        } else {
            self.ser_crlf();
        }
        self.current_ch = 255;
    }

    pub fn service_once(&mut self, elapsed_ms: u16) {
        self.check_ser();
        self.tick_auto_trigger(elapsed_ms);
        if self.trigger_pending {
            let outputs = self.service_trigger().to_vec();
            for sub_ch in outputs {
                self.sub_ch = sub_ch;
                self.parse_get_sub_ch(sub_ch);
            }
        }
    }
}

fn div_range_from_u8(value: u8) -> DivRange {
    limit_raw_range(value).0
}

fn limit_raw_range(value: u8) -> (DivRange, bool) {
    let limited = value > 15;
    let value = if value > 127 {
        0
    } else if value > 15 {
        15
    } else {
        value
    };

    match value {
        0 => (DivRange::Dc250mV, limited),
        1 => (DivRange::Dc2V5, limited),
        2 => (DivRange::Dc25V, limited),
        3 => (DivRange::Dc250V, limited),
        4 => (DivRange::Ac250mV, limited),
        5 => (DivRange::Ac2V5, limited),
        6 => (DivRange::Ac25V, limited),
        7 => (DivRange::Ac250V, limited),
        8 => (DivRange::Dc250uA, limited),
        9 => (DivRange::Dc25mA, limited),
        10 => (DivRange::Dc2A5, limited),
        11 => (DivRange::Dc10A, limited),
        12 => (DivRange::Ac250uA, limited),
        13 => (DivRange::Ac25mA, limited),
        14 => (DivRange::Ac2A5, limited),
        _ => (DivRange::Ac10A, limited),
    }
}

pub fn range_exponent_suffix(range: DivRange) -> Option<&'static str> {
    match range {
        DivRange::Dc250mV | DivRange::Ac250mV | DivRange::Dc25mA | DivRange::Ac25mA => Some("E-3"),
        DivRange::Dc250uA | DivRange::Ac250uA => Some("E-6"),
        _ => None,
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::collections::VecDeque;

    #[derive(Debug, Clone, Default)]
    struct MockHardware {
        ad10: i16,
        ad24: i32,
        ad24_fast: i32,
        ad24_slow: i32,
        adc24_overload_negative: bool,
        adc24_overload_positive: bool,
        rx: VecDeque<u8>,
        range_configs: Vec<RangeRelayConfig>,
        trigger_edges: Vec<bool>,
        serial: String,
        lcd_lines: Vec<(u8, String)>,
    }

    impl DivHardware for MockHardware {
        fn read_adc10(&mut self, _channel_1_based: u8) -> i16 {
            self.ad10
        }

        fn read_adc24(&mut self) -> i32 {
            self.ad24
        }

        fn read_adc24_fast_integrated(&mut self) -> i32 {
            self.ad24_fast
        }

        fn read_adc24_slow_integrated(&mut self) -> i32 {
            self.ad24_slow
        }

        fn adc24_overload_negative(&self) -> bool {
            self.adc24_overload_negative
        }

        fn adc24_overload_positive(&self) -> bool {
            self.adc24_overload_positive
        }

        fn set_range(&mut self, range: DivRange) {
            self.range_configs.push(RangeRelayConfig::for_range(range));
        }

        fn set_range_config(&mut self, config: RangeRelayConfig) {
            self.range_configs.push(config);
        }

        fn set_trigger_edge(&mut self, positive_edge: bool) {
            self.trigger_edges.push(positive_edge);
        }

        fn poll_serial_byte(&mut self) -> Option<u8> {
            self.rx.pop_front()
        }

        fn serial_write(&mut self, text: &str) {
            self.serial.push_str(text);
        }

        fn lcd_write_line(&mut self, row: u8, text: &str) {
            self.lcd_lines.push((row, text.to_string()));
        }
    }

    fn assert_close(actual: Float, expected: Float) {
        assert!(
            (actual - expected).abs() < 0.00001,
            "expected {expected}, got {actual}"
        );
    }

    fn serial_rx(text: &str) -> VecDeque<u8> {
        text.as_bytes().iter().copied().collect()
    }

    #[test]
    fn switch_range_applies_pascal_relay_gain_and_display_tables() {
        let mut state = DeviceState::new(MockHardware::default());

        state.switch_range(DivRange::Ac25V);

        let config = state.hw.range_configs.last().copied().unwrap();
        assert_eq!(config.port_a, 0b0000_0011);
        assert_eq!(config.port_c, 0b0100_1111);
        assert!(!config.dc_gain_10);
        assert_eq!(config.digits, 2);
        assert_eq!(config.decimals, 4);
        assert_eq!(state.integrate_24_fast, i64::from(ADC24_MID_SCALE));
        assert_eq!(state.integrate_24_slow, i64::from(ADC24_MID_SCALE));

        state.switch_range(DivRange::Dc10A);
        let config = state.hw.range_configs.last().copied().unwrap();
        assert_eq!(config.port_a, 0b1000_0011);
        assert_eq!(config.port_c, 0b1000_0011);
        assert!(config.dc_gain_10);
    }

    #[test]
    fn scaling_uses_pascal_per_range_factors_and_calibration_scales() {
        let mut state = DeviceState::new(MockHardware {
            ad10: 612,
            ad24: ADC24_MID_SCALE + 1000,
            ad24_fast: ADC24_MID_SCALE,
            ad24_slow: ADC24_MID_SCALE,
            ..MockHardware::default()
        });
        state.eeprom.ad24_scales[DivRange::Dc25V as usize] = 2.0;
        state.eeprom.ad10_scales[DivRange::Dc25V as usize] = 0.5;
        state.eeprom.ad24_offsets[DivRange::Dc25V as usize] = 10;
        state.eeprom.ad10_offsets[DivRange::Dc25V as usize] = 2;

        state.switch_range(DivRange::Dc25V);
        state.get_ad24(0);
        state.get_ad10(5);

        assert_close(state.measured_value, 1010.0 * (25.0 / 8_388_608.0) * 2.0);
        assert_close(state.measured_aux, 102.0 * (25.0 / 512.0) * 0.5);

        state.switch_range(DivRange::Ac2V5);
        assert_close(state.param_scale_24(-1000), 1000.0 * (2.5 / 8_388_608.0));
    }

    #[test]
    fn display_and_serial_format_follow_range_tables() {
        let mut state = DeviceState::new(MockHardware::default());
        state.switch_range(DivRange::Dc250mV);
        state.measured_value = 0.01234;

        assert_eq!(state.param_to_str(true), "+000.012");
        assert_eq!(state.param_to_str(false), "0.01234");

        state.switch_range(DivRange::Ac25V);
        state.measured_value = 1.234567;

        assert_eq!(state.param_to_str(true), "\x0301.2346");
        assert_eq!(state.param_to_str(false), "1.234567");
    }

    #[test]
    fn trigger_edges_timer_and_mask_select_pascal_subchannels() {
        let mut state = DeviceState::new(MockHardware::default());
        state.eeprom.trigger_mode = 0b0000_0111;
        state.set_trigger_edge_level(true);

        state.int2_trigger_edge(false);
        assert!(!state.trigger_pending);

        state.int2_trigger_edge(true);
        assert_eq!(state.service_trigger(), &[0, 10, 11]);
        assert!(!state.trigger_pending);

        state.eeprom.trigger_mode = 0b0000_0010;
        state.eeprom.trigger_timer_ms = 25;
        state.tick_auto_trigger(24);
        assert!(!state.trigger_pending);
        state.tick_auto_trigger(1);
        assert_eq!(state.service_trigger(), &[10]);
        assert_eq!(state.hw.trigger_edges, vec![true]);
    }

    #[test]
    fn ad24_integration_mode_selects_pascal_sources_and_fault_flags() {
        let mut state = DeviceState::new(MockHardware {
            ad24: ADC24_MID_SCALE + 100,
            ad24_fast: ADC24_MID_SCALE + 200,
            ad24_slow: ADC24_MID_SCALE + 300,
            adc24_overload_negative: true,
            ..MockHardware::default()
        });

        state.switch_range(DivRange::Dc2V5);
        state.get_ad24(0);
        assert_close(state.measured_value, 100.0 * (2.5 / 8_388_608.0));

        state.get_ad24(1);
        assert_close(state.measured_value, 200.0 * (2.5 / 8_388_608.0));

        state.get_ad24(2);
        assert_close(state.measured_value, 300.0 * (2.5 / 8_388_608.0));
        assert_eq!(state.fault_flags(), 0b0000_0001);
        assert!(state.overload_flag());
    }

    #[test]
    fn status_prompt_uses_pascal_prefix_status_byte_and_fault_labels() {
        let mut state = DeviceState::new(MockHardware::default());
        state.slave_ch = 2;
        state.busy_flag = true;
        state.ee_unlocked = true;

        state.ser_prompt(ErrorCode::BusyErr);
        assert_eq!(state.hw.serial, "#2:255=146 [BUSY]\r\n");
        assert_eq!(state.err_count, 1);

        state.hw.serial.clear();
        state.busy_flag = false;
        state.ee_unlocked = false;
        state.overload_negative = true;
        state.overload_positive = true;

        state.ser_prompt(ErrorCode::OvlErr);
        assert_eq!(state.hw.serial, "#2:255=35 [OVRNEG] [OVRPOS]\r\n");
    }

    #[test]
    fn check_limits_clamps_pascal_byte_range_and_reports_param_error() {
        let mut state = DeviceState::new(MockHardware::default());

        assert!(!state.check_limits_raw_range(15));
        assert_eq!(state.range, DivRange::Ac10A);
        assert_eq!(state.check_limit_err, ErrorCode::NoErr);

        assert!(state.check_limits_raw_range(16));
        assert_eq!(state.range, DivRange::Ac10A);
        assert_eq!(state.check_limit_err, ErrorCode::ParamErr);

        assert!(state.check_limits_raw_range(255));
        assert_eq!(state.range, DivRange::Dc250mV);
        assert_eq!(state.check_limit_err, ErrorCode::ParamErr);
    }

    #[test]
    fn rng_set_uses_pascal_check_limits_before_switching_range() {
        let mut state = DeviceState::new(MockHardware {
            rx: serial_rx("0:RNG=16\r0:RNG=255\r"),
            ..MockHardware::default()
        });
        state.slave_ch = 0;

        state.check_ser();

        assert_eq!(state.range, DivRange::Dc250mV);
        assert_eq!(state.hw.range_configs[0].range, DivRange::Ac10A);
        assert_eq!(state.hw.range_configs[1].range, DivRange::Dc250mV);
        assert_eq!(
            state.hw.serial,
            "#0:255=5 [PARERR]\r\n#0:255=5 [PARERR]\r\n"
        );
    }

    #[test]
    fn init_all_restores_eeprom_defaults_and_initialises_zero_offsets() {
        let mut state = DeviceState::new(MockHardware {
            ad24_fast: ADC24_MID_SCALE + 123,
            ..MockHardware::default()
        });
        state.eeprom.init_range = DivRange::Ac10A;
        state.eeprom.init_lcd_integrate = 2;
        state.eeprom.init_inc_rast = 7;
        state.eeprom.trigger_edge_level = true;
        state.eeprom.offset_initialised = 0;

        state.init_all();

        assert_eq!(state.range, DivRange::Ac10A);
        assert_eq!(state.lcd_integrate, 2);
        assert_eq!(state.inc_rast, 7);
        assert_eq!(state.eeprom.ad24_offsets, [-123; 16]);
        assert_eq!(state.eeprom.offset_initialised, OFFSET_INITIALISED_MAGIC);
        assert_eq!(state.hw.trigger_edges, vec![true]);
        assert!(state
            .hw
            .serial
            .contains("#0:254=3.10 [DIV by CM/c't 03/2007]"));
        assert!(state.hw.serial.contains("#0:255=130 [BUSY]\r\n"));
        assert!(state.hw.serial.ends_with("#0:255=0 [OK]\r\n"));
    }

    #[test]
    fn check_ser_buffers_ascii_handles_backspace_and_parses_cr_frames() {
        let mut state = DeviceState::new(MockHardware {
            rx: serial_rx("0:RNG=5x\x08\r0:RNG?\r#9:19=3\r"),
            ..MockHardware::default()
        });
        state.slave_ch = 0;

        state.check_ser();

        assert_eq!(state.range, DivRange::Ac2V5);
        assert_eq!(state.hw.serial, "#0:19=5\r\n#9:19=3\r\n");
        assert!(state.ser_input.is_empty());
    }
}
