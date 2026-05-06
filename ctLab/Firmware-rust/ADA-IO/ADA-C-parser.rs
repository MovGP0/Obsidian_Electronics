//! Best-effort Rust port of `ADA-C-parser.pas`.
//!
//! This keeps the original parser structure intact:
//! - command lookup via a fixed command enum/table
//! - `parse_get_param` and `parse_set_param` large dispatches
//! - `parse_extract`, `cmd_to_index`, and `parse_sub_ch` flow
//!
//! Hardware-facing helpers are intentionally lightweight stubs so the parser
//! logic remains readable and can be integrated with a real backend later.

use std::mem;

#[derive(Debug, Clone, Copy, PartialEq, Eq, PartialOrd, Ord)]
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
    pub const LOOKUP: [CmdWhich; 25] = [
        CmdWhich::Trg,
        CmdWhich::Str,
        CmdWhich::Idn,
        CmdWhich::Val,
        CmdWhich::Ofs,
        CmdWhich::Scl,
        CmdWhich::Raw,
        CmdWhich::Pio,
        CmdWhich::Dir,
        CmdWhich::Dsp,
        CmdWhich::All,
        CmdWhich::Opt,
        CmdWhich::Trm,
        CmdWhich::Trt,
        CmdWhich::Trl,
        CmdWhich::Icb,
        CmdWhich::Icw,
        CmdWhich::Ics,
        CmdWhich::Ict,
        CmdWhich::Ica,
        CmdWhich::Ref,
        CmdWhich::Wen,
        CmdWhich::Erc,
        CmdWhich::Sbd,
        CmdWhich::Nop,
    ];

    pub fn keyword(self) -> Option<&'static str> {
        match self {
            CmdWhich::Trg => Some("TRG"),
            CmdWhich::Str => Some("STR"),
            CmdWhich::Idn => Some("IDN"),
            CmdWhich::Erc => Some("ERC"),
            CmdWhich::Val => Some("VAL"),
            CmdWhich::Ofs => Some("OFS"),
            CmdWhich::Scl => Some("SCL"),
            CmdWhich::Raw => Some("RAW"),
            CmdWhich::Pio => Some("PIO"),
            CmdWhich::Dir => Some("DIR"),
            CmdWhich::Dsp => Some("DSP"),
            CmdWhich::All => Some("ALL"),
            CmdWhich::Opt => Some("OPT"),
            CmdWhich::Trm => Some("TRM"),
            CmdWhich::Trt => Some("TRT"),
            CmdWhich::Trl => Some("TRL"),
            CmdWhich::Icb => Some("ICB"),
            CmdWhich::Icw => Some("ICW"),
            CmdWhich::Ics => Some("ICS"),
            CmdWhich::Ict => Some("ICT"),
            CmdWhich::Ica => Some("ICA"),
            CmdWhich::Ref => Some("REF"),
            CmdWhich::Wen => Some("WEN"),
            CmdWhich::Sbd => Some("SBD"),
            CmdWhich::Nop => Some("NOP"),
            CmdWhich::Err => None,
        }
    }

    pub fn sub_channel_offset(self) -> Option<u8> {
        match self {
            CmdWhich::Trg => Some(249),
            CmdWhich::Str => Some(255),
            CmdWhich::Idn => Some(254),
            CmdWhich::Val => Some(0),
            CmdWhich::Ofs => Some(100),
            CmdWhich::Scl => Some(200),
            CmdWhich::Raw => Some(50),
            CmdWhich::Pio => Some(30),
            CmdWhich::Dir => Some(40),
            CmdWhich::Dsp => Some(80),
            CmdWhich::All => Some(95),
            CmdWhich::Opt => Some(150),
            CmdWhich::Trm => Some(240),
            CmdWhich::Trt => Some(247),
            CmdWhich::Trl => Some(248),
            CmdWhich::Icb => Some(230),
            CmdWhich::Icw => Some(231),
            CmdWhich::Ics => Some(232),
            CmdWhich::Ict => Some(233),
            CmdWhich::Ica => Some(239),
            CmdWhich::Ref => Some(246),
            CmdWhich::Wen => Some(250),
            CmdWhich::Erc => Some(251),
            CmdWhich::Sbd => Some(252),
            CmdWhich::Nop => Some(0),
            CmdWhich::Err => None,
        }
    }

    pub fn from_keyword(keyword: &str) -> CmdWhich {
        let upper = keyword.trim().to_ascii_uppercase();
        Self::LOOKUP
            .iter()
            .copied()
            .find(|cmd| cmd.keyword() == Some(upper.as_str()))
            .unwrap_or(CmdWhich::Err)
    }

    pub fn requires_parameter_on_set(self) -> bool {
        self >= CmdWhich::Val && self != CmdWhich::Err
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum ParseError {
    NoErr,
    UserReq,
    BusyErr,
    OvlErr,
    SyntaxErr,
    ParamErr,
    LockedErr,
    ChecksumErr,
}

#[derive(Debug, Clone, PartialEq)]
pub enum Reply {
    Float { sub_ch: u8, value: f32 },
    Int { sub_ch: u8, value: i32 },
    Text(String),
    Echo(String),
    Status { error: ParseError, status: u8 },
}

#[derive(Debug, Clone)]
pub struct ParseContext {
    pub ser_inp_str: String,
    pub ser_inp_ptr: usize,
    pub param_str: String,
    pub param: f32,
    pub param_int: i32,
    pub param_byte: u8,
    pub sub_ch: u8,
    pub current_ch: u8,
    pub slave_ch: u8,
    pub cmd_which: CmdWhich,
    pub verbose: bool,
    pub changed_flag: bool,
    pub ee_unlocked: bool,
    pub modify: u8,
    pub inc_rast: i32,
    pub integrate_ad16: bool,
    pub ext_ref: u8,
    pub trig_timer_value: u16,
    pub trig_level: u8,
    pub ee_ser_baud_reg: u8,
    pub err_count: i32,
    pub status: u8,
    pub i2c_slave_adr: u8,
    pub trigger: bool,
    pub led_activity_low: bool,
    pub vers1_str: String,
    pub egg_str: String,
    pub param_text_array: Vec<String>,
    pub dac_raw_array: [u16; 8],
    pub dac_value_array: [f32; 8],
    pub offset_array: [i32; 28],
    pub scale_array: [f32; 30],
    pub port_init_array: [u8; 8],
    pub dir_init_array: [u8; 8],
    pub trig_mask_array: [u8; 4],
}

impl Default for ParseContext {
    fn default() -> Self {
        Self {
            ser_inp_str: String::new(),
            ser_inp_ptr: 0,
            param_str: String::new(),
            param: 0.0,
            param_int: 0,
            param_byte: 0,
            sub_ch: 0,
            current_ch: 0,
            slave_ch: 0,
            cmd_which: CmdWhich::Err,
            verbose: false,
            changed_flag: false,
            ee_unlocked: false,
            modify: 0,
            inc_rast: 0,
            integrate_ad16: false,
            ext_ref: 0,
            trig_timer_value: 0,
            trig_level: 0,
            ee_ser_baud_reg: 0,
            err_count: 0,
            status: 0,
            i2c_slave_adr: 0,
            trigger: false,
            led_activity_low: false,
            vers1_str: String::new(),
            egg_str: String::new(),
            param_text_array: vec![String::new(); 38],
            dac_raw_array: [0; 8],
            dac_value_array: [0.0; 8],
            offset_array: [0; 28],
            scale_array: [0.0; 30],
            port_init_array: [0; 8],
            dir_init_array: [0; 8],
            trig_mask_array: [0; 4],
        }
    }
}

pub struct AdaIoParser {
    pub ctx: ParseContext,
}

impl Default for AdaIoParser {
    fn default() -> Self {
        Self {
            ctx: ParseContext::default(),
        }
    }
}

impl AdaIoParser {
    pub fn cmd_to_index(&mut self) -> CmdWhich {
        self.ctx.param_str.make_ascii_uppercase();
        CmdWhich::from_keyword(&self.ctx.param_str)
    }

    pub fn parse_extract(&mut self) -> bool {
        self.ctx.param_str.clear();

        while matches!(self.peek_char(), Some(' ')) {
            self.ctx.ser_inp_ptr += 1;
        }

        let first = match self.peek_char() {
            Some(ch) => ch,
            None => return false,
        };

        let mut is_param = false;
        if matches!(first, '*' | '0'..='9') {
            is_param = true;
            while let Some(ch) = self.peek_char() {
                if ch <= '9' {
                    self.ctx.param_str.push(ch);
                    self.ctx.ser_inp_ptr += 1;
                } else {
                    break;
                }
            }
        } else {
            while let Some(ch) = self.peek_char() {
                if ch >= 'A' {
                    self.ctx.param_str.push(ch);
                    self.ctx.ser_inp_ptr += 1;
                } else {
                    break;
                }
            }
        }

        is_param
    }

    pub fn parse_get_param(&mut self) -> Result<Vec<Reply>, ParseError> {
        let mut replies = Vec::new();
        let mut is_integer = false;

        match self.ctx.sub_ch {
            0..=47 => {
                is_integer = self.get_new_value(self.ctx.sub_ch);
            }
            50..=67 => {
                self.get_new_value(self.ctx.sub_ch - 50);
                is_integer = true;
            }
            70..=77 => {
                self.ctx.param_int = i32::from(self.ctx.dac_raw_array[(self.ctx.sub_ch - 70) as usize]);
                is_integer = true;
            }
            80 => {
                self.ctx.param_int = i32::from(self.ctx.modify);
                is_integer = true;
            }
            85 => {
                replies.push(self.write_ch_prefix_text(&self.ctx.egg_str));
                return Ok(replies);
            }
            89 | 159 => {
                self.ctx.param_int = self.ctx.inc_rast;
                is_integer = true;
            }
            95 => {
                for sub_ch in 0..=7 {
                    self.ctx.sub_ch = sub_ch;
                    self.get_new_value(sub_ch);
                    replies.push(self.write_param());
                }
                return Ok(replies);
            }
            96 => {
                for sub_ch in 10..=17 {
                    self.ctx.sub_ch = sub_ch;
                    self.get_new_value(sub_ch);
                    replies.push(self.write_param());
                }
                return Ok(replies);
            }
            98 => {
                for sub_ch in 30..=37 {
                    self.ctx.sub_ch = sub_ch;
                    self.get_new_value(sub_ch);
                    replies.push(self.write_param_int());
                }
                return Ok(replies);
            }
            99 => {
                for sub_ch in 0..=7 {
                    self.ctx.sub_ch = sub_ch;
                    self.get_new_value(sub_ch);
                    replies.push(self.write_param());
                }
                for sub_ch in 10..=17 {
                    self.ctx.sub_ch = sub_ch;
                    self.get_new_value(sub_ch);
                    replies.push(self.write_param());
                }
                for sub_ch in 30..=37 {
                    self.ctx.sub_ch = sub_ch;
                    self.get_new_value(sub_ch);
                    replies.push(self.write_param_int());
                }
                return Ok(replies);
            }
            100..=127 => {
                self.ctx.param_int = self.ctx.offset_array[(self.ctx.sub_ch - 100) as usize];
                is_integer = true;
            }
            156 | 246 => {
                self.ctx.param_int = i32::from(self.ctx.ext_ref);
                is_integer = true;
            }
            157 => {
                self.ctx.param_int = i32::from(self.ctx.integrate_ad16);
                is_integer = true;
            }
            180..=187 => {
                self.ctx.param_int = i32::from(self.ctx.port_init_array[(self.ctx.sub_ch - 180) as usize]);
                is_integer = true;
            }
            190..=197 => {
                self.ctx.param_int = i32::from(self.ctx.dir_init_array[(self.ctx.sub_ch - 190) as usize]);
                is_integer = true;
            }
            200..=229 => {
                self.ctx.param = self.ctx.scale_array[(self.ctx.sub_ch - 200) as usize];
            }
            230 => {
                let byte = self.twi_inp_byte(self.ctx.i2c_slave_adr);
                self.ctx.param_int = i32::from(byte);
                is_integer = true;
            }
            231 => {
                self.ctx.param_int = i32::from(self.twi_inp_word(self.ctx.i2c_slave_adr));
                is_integer = true;
            }
            232 => {
                let value = self.twi_inp_word(self.ctx.i2c_slave_adr);
                self.ctx.param_int = i32::from(value.swap_bytes());
                is_integer = true;
            }
            233 => {
                let value = self.twi_inp_word(self.ctx.i2c_slave_adr).swap_bytes() >> 7;
                self.ctx.param_int = i32::from(value);
                self.ctx.param = value as f32 / 2.0;
            }
            234 => {
                let value = self.twi_inp_word(self.ctx.i2c_slave_adr).swap_bytes();
                self.ctx.param_int = i32::from(value);
                self.ctx.param = value as f32 / 256.0;
            }
            239 => {
                self.ctx.param_int = i32::from(self.ctx.i2c_slave_adr);
                is_integer = true;
            }
            240..=243 => {
                self.ctx.param_int = i32::from(self.ctx.trig_mask_array[(self.ctx.sub_ch - 240) as usize]);
                is_integer = true;
            }
            247 => {
                self.ctx.param_int = i32::from(self.ctx.trig_timer_value);
                is_integer = true;
            }
            248 => {
                self.ctx.param_int = i32::from(self.ctx.trig_level);
                is_integer = true;
            }
            249 => {
                self.ctx.trigger = true;
                replies.push(self.status_reply(ParseError::NoErr, self.ctx.status));
                return Ok(replies);
            }
            250 | 255 => {
                replies.push(self.status_reply(ParseError::NoErr, self.ctx.status));
                return Ok(replies);
            }
            251 => {
                self.ctx.param_int = self.ctx.err_count;
                is_integer = true;
            }
            252 => {
                self.ctx.param_int = i32::from(self.ctx.ee_ser_baud_reg);
                is_integer = true;
            }
            253 => {
                replies.push(Reply::Text(self.ctx.ser_inp_str.clone()));
                return Ok(replies);
            }
            254 => {
                let mut text = self.write_ch_prefix();
                text.push_str(&self.ctx.vers1_str);
                text.push_str(&self.write_features());
                replies.push(Reply::Text(text));
                return Ok(replies);
            }
            _ => return Err(ParseError::ParamErr),
        }

        replies.push(if is_integer {
            self.write_param_int()
        } else {
            self.write_param()
        });
        Ok(replies)
    }

    pub fn parse_set_param(&mut self) -> Result<Vec<Reply>, ParseError> {
        self.ctx.changed_flag = true;

        match self.ctx.sub_ch {
            20..=27 => {
                self.ctx.dac_value_array[(self.ctx.sub_ch - 20) as usize] = self.ctx.param;
                self.set_dac(self.ctx.sub_ch);
            }
            30..=37 => {
                self.set_port(self.ctx.sub_ch - 30, self.ctx.param_byte);
            }
            40..=47 => {
                self.set_dir(self.ctx.sub_ch - 40, self.ctx.param_byte);
            }
            80 => {
                if self.ctx.param_byte > 37 {
                    return Err(ParseError::ParamErr);
                }
                self.ctx.modify = self.ctx.param_byte;
            }
            81 => {
                if self.ctx.param_byte > 37 {
                    return Err(ParseError::ParamErr);
                }
                if !self.ctx.ee_unlocked {
                    return Err(ParseError::LockedErr);
                }

                let text = self.extract_bracket_text();
                self.ctx.param_text_array[self.ctx.param_byte as usize] = text;
            }
            89 | 159 => {
                if !self.ctx.ee_unlocked {
                    return Err(ParseError::LockedErr);
                }
                self.ctx.inc_rast = self.ctx.param_int;
            }
            100..=127 => {
                let index = (self.ctx.sub_ch - 100) as usize;
                if !self.ctx.ee_unlocked {
                    return Err(ParseError::LockedErr);
                }
                self.ctx.offset_array[index] = self.ctx.param_int;
                self.set_dac(index as u8);
            }
            156 | 246 => {
                if !self.ctx.ee_unlocked {
                    return Err(ParseError::LockedErr);
                }
                self.ctx.ext_ref = self.ctx.param_byte;
                self.set_reference_mode(self.ctx.param_byte != 0);
            }
            157 => {
                if !self.ctx.ee_unlocked {
                    return Err(ParseError::LockedErr);
                }
                self.ctx.integrate_ad16 = self.ctx.param_byte > 0;
            }
            180..=187 => {
                let index = (self.ctx.sub_ch - 180) as usize;
                if !self.ctx.ee_unlocked {
                    return Err(ParseError::LockedErr);
                }
                self.ctx.port_init_array[index] = self.ctx.param_byte;
                self.set_port(index as u8, self.ctx.param_byte);
            }
            190..=197 => {
                let index = (self.ctx.sub_ch - 190) as usize;
                if !self.ctx.ee_unlocked {
                    return Err(ParseError::LockedErr);
                }
                self.ctx.dir_init_array[index] = self.ctx.param_byte;
                self.set_dir(index as u8, self.ctx.param_byte);
            }
            200..=229 => {
                let index = (self.ctx.sub_ch - 200) as usize;
                if !self.ctx.ee_unlocked {
                    return Err(ParseError::LockedErr);
                }
                self.ctx.scale_array[index] = self.ctx.param;
                self.set_dac(index as u8);
                self.set_base_scales();
            }
            230 => self.twi_out_byte(self.ctx.i2c_slave_adr, self.ctx.param_byte),
            231 => self.twi_out_word(self.ctx.i2c_slave_adr, self.ctx.param_int as u16),
            232 => {
                let swapped = (self.ctx.param_int as u16).swap_bytes();
                self.twi_out_word(self.ctx.i2c_slave_adr, swapped);
            }
            239 => {
                self.ctx.i2c_slave_adr = self.ctx.param_byte;
            }
            240..=243 => {
                let index = (self.ctx.sub_ch - 240) as usize;
                if !self.ctx.ee_unlocked {
                    return Err(ParseError::LockedErr);
                }
                self.ctx.trig_mask_array[index] = self.ctx.param_byte;
            }
            247 => {
                if !self.ctx.ee_unlocked {
                    return Err(ParseError::LockedErr);
                }
                if (1..=9).contains(&self.ctx.param_int) {
                    return Err(ParseError::ParamErr);
                }
                self.ctx.trig_timer_value = self.ctx.param_int as u16;
            }
            248 => {
                if !self.ctx.ee_unlocked {
                    return Err(ParseError::LockedErr);
                }
                self.ctx.trig_level = self.ctx.param_byte;
                self.set_trigger_edge(self.ctx.param_byte != 0);
            }
            249 => {
                self.ctx.trigger = true;
                return Ok(vec![self.status_reply(ParseError::NoErr, self.ctx.status)]);
            }
            250 => {}
            251 => {
                self.ctx.err_count = self.ctx.param_int;
            }
            252 => {
                if !self.ctx.ee_unlocked {
                    return Err(ParseError::LockedErr);
                }
                self.ctx.ee_ser_baud_reg = self.ctx.param_byte;
            }
            _ => return Err(ParseError::ParamErr),
        }

        self.ctx.ee_unlocked = self.ctx.sub_ch == 250 && self.ctx.param_byte == 1;
        Ok(vec![self.status_reply(ParseError::NoErr, self.ctx.status)])
    }

    pub fn parse_sub_ch(&mut self) -> Result<Vec<Reply>, ParseError> {
        if self.ctx.ser_inp_str.is_empty() {
            return Ok(vec![self.status_reply(ParseError::NoErr, 0)]);
        }

        let has_main_ch = self.ctx.ser_inp_str.contains(':');
        let is_request = !self.ctx.ser_inp_str.contains('=');
        let first_char = self.ctx.ser_inp_str.chars().next().unwrap_or_default();
        let is_omni = first_char == '*';
        let is_result = first_char == '#';

        if is_result {
            return Ok(vec![Reply::Echo(self.ctx.ser_inp_str.clone())]);
        }

        self.ctx.ser_inp_ptr = 0;

        if has_main_ch {
            let is_param = self.parse_extract();
            if !is_param {
                return Err(ParseError::SyntaxErr);
            }
            self.skip_char(':');
            if is_omni {
                return Ok(vec![Reply::Echo(self.ctx.ser_inp_str.clone())]);
            }
            self.ctx.current_ch = self.parse_u8(&self.ctx.param_str)?;
        }

        if !is_omni && has_main_ch && self.ctx.current_ch != self.ctx.slave_ch {
            return Ok(vec![Reply::Echo(self.ctx.ser_inp_str.clone())]);
        }

        self.ctx.verbose = self.ctx.ser_inp_str.contains('!') || self.ctx.ser_inp_str.contains('?');

        if let Some(check_pos) = self.ctx.ser_inp_str.find('$') {
            let supplied = self
                .ctx
                .ser_inp_str
                .get(check_pos + 1..check_pos + 3)
                .ok_or(ParseError::ChecksumErr)?;
            let check_sum_in = u8::from_str_radix(supplied, 16).map_err(|_| ParseError::ChecksumErr)?;
            let mut check_sum = 0u8;
            for ch in self.ctx.ser_inp_str[..check_pos].bytes() {
                check_sum ^= ch;
            }
            if check_sum != check_sum_in {
                return Err(ParseError::ChecksumErr);
            }
        }

        self.set_sys_timer_activity();
        self.ctx.led_activity_low = true;

        let sub_ch_offset = if self.parse_extract() {
            self.ctx.cmd_which = CmdWhich::Val;
            0
        } else {
            self.ctx.cmd_which = self.cmd_to_index();
            if self.ctx.cmd_which == CmdWhich::Err {
                return Err(ParseError::SyntaxErr);
            }
            let offset = self
                .ctx
                .cmd_which
                .sub_channel_offset()
                .ok_or(ParseError::SyntaxErr)?;
            self.parse_extract();
            offset
        };

        let sub_ch_value = self.parse_u8_or_wildcard(&self.ctx.param_str)?;
        self.ctx.sub_ch = sub_ch_value.saturating_add(sub_ch_offset);

        if is_request {
            self.parse_get_param()
        } else {
            if let Some(equal_pos) = self.ctx.ser_inp_str.find('=') {
                self.ctx.ser_inp_ptr = equal_pos + 1;
            }

            if self.parse_extract() {
                self.ctx.param = self.parse_f32(&self.ctx.param_str)?;
                self.ctx.param_int = self.ctx.param as i32;
                self.ctx.param_byte = self.ctx.param_int as u8;
            } else if self.ctx.cmd_which.requires_parameter_on_set() {
                return Err(ParseError::ParamErr);
            }

            self.parse_set_param()
        }
    }

    fn peek_char(&self) -> Option<char> {
        self.ctx.ser_inp_str[self.ctx.ser_inp_ptr..].chars().next()
    }

    fn skip_char(&mut self, expected: char) {
        if self.peek_char() == Some(expected) {
            self.ctx.ser_inp_ptr += expected.len_utf8();
        }
    }

    fn parse_u8(&self, value: &str) -> Result<u8, ParseError> {
        value.trim().parse::<u8>().map_err(|_| ParseError::ParamErr)
    }

    fn parse_u8_or_wildcard(&self, value: &str) -> Result<u8, ParseError> {
        if value.trim() == "*" {
            Ok(self.ctx.current_ch)
        } else {
            self.parse_u8(value)
        }
    }

    fn parse_f32(&self, value: &str) -> Result<f32, ParseError> {
        value.trim().parse::<f32>().map_err(|_| ParseError::ParamErr)
    }

    fn extract_bracket_text(&self) -> String {
        let start = self.ctx.ser_inp_str.find('[').map(|idx| idx + 1);
        let end = self.ctx.ser_inp_str[self.ctx.ser_inp_ptr..]
            .find(']')
            .map(|idx| idx + self.ctx.ser_inp_ptr);

        match (start, end) {
            (Some(start), Some(end)) if end >= start => self.ctx.ser_inp_str[start..end].to_string(),
            _ => String::new(),
        }
    }

    fn write_param(&self) -> Reply {
        Reply::Float {
            sub_ch: self.ctx.sub_ch,
            value: self.ctx.param,
        }
    }

    fn write_param_int(&self) -> Reply {
        Reply::Int {
            sub_ch: self.ctx.sub_ch,
            value: self.ctx.param_int,
        }
    }

    fn write_ch_prefix(&self) -> String {
        format!("{}:", self.ctx.slave_ch)
    }

    fn write_ch_prefix_text(&self, text: &str) -> Reply {
        let mut out = self.write_ch_prefix();
        out.push_str(text);
        Reply::Text(out)
    }

    fn write_features(&self) -> String {
        String::new()
    }

    fn status_reply(&self, error: ParseError, status: u8) -> Reply {
        Reply::Status { error, status }
    }

    fn get_new_value(&mut self, sub_ch: u8) -> bool {
        match sub_ch {
            30..=37 | 50..=67 => {
                self.ctx.param_int = i32::from(sub_ch);
                true
            }
            _ => {
                self.ctx.param = sub_ch as f32;
                false
            }
        }
    }

    fn set_dac(&mut self, _sub_ch: u8) {}

    fn set_port(&mut self, _index: u8, _value: u8) {}

    fn set_dir(&mut self, _index: u8, _value: u8) {}

    fn set_base_scales(&mut self) {}

    fn set_reference_mode(&mut self, _internal_reference: bool) {}

    fn set_trigger_edge(&mut self, _positive_edge: bool) {}

    fn set_sys_timer_activity(&mut self) {}

    fn twi_inp_byte(&mut self, _slave: u8) -> u8 {
        0
    }

    fn twi_inp_word(&mut self, _slave: u8) -> u16 {
        0
    }

    fn twi_out_byte(&mut self, _slave: u8, _value: u8) {}

    fn twi_out_word(&mut self, _slave: u8, _value: u16) {}

    pub fn take_context(&mut self) -> ParseContext {
        mem::take(&mut self.ctx)
    }
}
