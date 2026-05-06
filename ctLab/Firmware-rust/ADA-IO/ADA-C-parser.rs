//! Best-effort Rust port of `ADA-C-parser.pas`.
//!
//! This keeps the original parser structure intact:
//! - command lookup via a fixed command enum/table
//! - `parse_get_param` and `parse_set_param` large dispatches
//! - `parse_extract`, `cmd_to_index`, and `parse_sub_ch` flow
//!
//! Hardware-facing helpers are intentionally lightweight stubs so the parser
//! logic remains readable and can be integrated with a real backend later.

use std::{collections::VecDeque, mem};

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
        !matches!(
            self,
            CmdWhich::Trg | CmdWhich::Str | CmdWhich::Idn | CmdWhich::Err
        )
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
    pub inc_rast_def: i32,
    pub integrate_ad16: bool,
    pub init_integrate_ad16: bool,
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
    pub adc10_raw_array: [i32; 8],
    pub adc_raw_array: [i32; 8],
    pub port_array: [u8; 8],
    pub io_pin_array: [u8; 8],
    pub dir_output_array: [u8; 8],
    pub io_present: bool,
    pub dac12_present: bool,
    pub dac16_present: bool,
    pub dac714_present: bool,
    pub adc16_present: bool,
    pub lcd_present: bool,
    pub base_scale_ad10: f32,
    pub base_scale_ad16: f32,
    pub base_scale_da12: f32,
    pub base_scale_da16: f32,
    pub internal_reference: bool,
    pub trigger_positive_edge: bool,
    pub i2c_byte_reads: VecDeque<u8>,
    pub i2c_word_reads: VecDeque<u16>,
    pub i2c_writes: Vec<(u8, u16)>,
    pub shift_register_writes: Vec<[u8; 8]>,
}

impl Default for ParseContext {
    fn default() -> Self {
        let mut offset_array = [0; 28];
        offset_array[10..=17].fill(-40);

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
            inc_rast: 4,
            inc_rast_def: 4,
            integrate_ad16: false,
            init_integrate_ad16: false,
            ext_ref: 1,
            trig_timer_value: 0,
            trig_level: 0,
            ee_ser_baud_reg: 51,
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
            offset_array,
            scale_array: [
                1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 0.0, 100.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
                1.0, 1.0, 0.0, 3185.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 200.0, 3200.0,
            ],
            port_init_array: [0; 8],
            dir_init_array: [0; 8],
            trig_mask_array: [0; 4],
            adc10_raw_array: [0; 8],
            adc_raw_array: [0; 8],
            port_array: [0; 8],
            io_pin_array: [0; 8],
            dir_output_array: [0; 8],
            io_present: false,
            dac12_present: false,
            dac16_present: false,
            dac714_present: false,
            adc16_present: false,
            lcd_present: false,
            base_scale_ad10: 100.0,
            base_scale_ad16: 3185.0,
            base_scale_da12: 200.0,
            base_scale_da16: 3200.0,
            internal_reference: false,
            trigger_positive_edge: false,
            i2c_byte_reads: VecDeque::new(),
            i2c_word_reads: VecDeque::new(),
            i2c_writes: Vec::new(),
            shift_register_writes: Vec::new(),
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

        // Skip leading spaces before classifying the next token.
        while matches!(self.peek_char(), Some(' ')) {
            self.ctx.ser_inp_ptr += 1;
        }

        let first = match self.peek_char() {
            Some(ch) => ch,
            None => return false,
        };

        let mut is_param = false;
        if matches!(first, '*' | '0'..='9') {
            // Digits and `*` start a parameter token rather than a mnemonic.
            is_param = true;
            while let Some(ch) = self.peek_char() {
                if ch <= '9' {
                    self.ctx.param_str.push(ch);
                    self.ctx.ser_inp_ptr += 1;
                } else {
                    // Stop at the first separator or non-numeric suffix.
                    break;
                }
            }
        } else {
            while let Some(ch) = self.peek_char() {
                if ch >= 'A' {
                    self.ctx.param_str.push(ch);
                    self.ctx.ser_inp_ptr += 1;
                } else {
                    // Command names end once the stream falls back to digits or punctuation.
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
                // Direct request for live AD10/AD16 input values.
                is_integer = self.get_new_value(self.ctx.sub_ch);
            }
            50..=67 => {
                // RAW aliases expose the same channels as integer ADC readings.
                self.get_new_value(self.ctx.sub_ch - 50);
                is_integer = true;
            }
            70..=77 => {
                self.ctx.param_int =
                    i32::from(self.ctx.dac_raw_array[(self.ctx.sub_ch - 70) as usize]);
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
                // Dump all AD10 input channels.
                for sub_ch in 0..=7 {
                    self.ctx.sub_ch = sub_ch;
                    self.get_new_value(sub_ch);
                    replies.push(self.write_param());
                }
                return Ok(replies);
            }
            96 => {
                // Dump all AD16 input channels.
                for sub_ch in 10..=17 {
                    self.ctx.sub_ch = sub_ch;
                    self.get_new_value(sub_ch);
                    replies.push(self.write_param());
                }
                return Ok(replies);
            }
            98 => {
                // Dump all digital input levels.
                for sub_ch in 30..=37 {
                    self.ctx.sub_ch = sub_ch;
                    self.get_new_value(sub_ch);
                    replies.push(self.write_param_int());
                }
                return Ok(replies);
            }
            99 => {
                // Combined dump of AD10, AD16, and port levels in Pascal order.
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
                // REF exposes whether the external reference is selected.
                self.ctx.param_int = i32::from(self.ctx.ext_ref);
                is_integer = true;
            }
            157 => {
                // Optional AD16 integration mode is reported as 0/1.
                self.ctx.param_int = i32::from(self.ctx.integrate_ad16);
                is_integer = true;
            }
            180..=187 => {
                self.ctx.param_int =
                    i32::from(self.ctx.port_init_array[(self.ctx.sub_ch - 180) as usize]);
                is_integer = true;
            }
            190..=197 => {
                self.ctx.param_int =
                    i32::from(self.ctx.dir_init_array[(self.ctx.sub_ch - 190) as usize]);
                is_integer = true;
            }
            200..=229 => {
                self.ctx.param = self.ctx.scale_array[(self.ctx.sub_ch - 200) as usize];
            }
            230 => {
                // Generic I2C byte read.
                let byte = self.twi_inp_byte(self.ctx.i2c_slave_adr);
                self.ctx.param_int = i32::from(byte);
                is_integer = true;
            }
            231 => {
                // Generic I2C word read.
                self.ctx.param_int = i32::from(self.twi_inp_word(self.ctx.i2c_slave_adr));
                is_integer = true;
            }
            232 => {
                // Generic I2C word read with byte order swapped afterward.
                let value = self.twi_inp_word(self.ctx.i2c_slave_adr);
                self.ctx.param_int = i32::from(value.swap_bytes());
                is_integer = true;
            }
            233 => {
                // LM75-compatible scaling: swap, keep 9 bits, then divide by 2.
                let value = self.twi_inp_word(self.ctx.i2c_slave_adr).swap_bytes() >> 7;
                self.ctx.param_int = i32::from(value);
                self.ctx.param = value as f32 / 2.0;
            }
            234 => {
                // DS1631-compatible scaling: swapped 16-bit fixed-point / 256.
                let value = self.twi_inp_word(self.ctx.i2c_slave_adr).swap_bytes();
                self.ctx.param_int = i32::from(value);
                self.ctx.param = value as f32 / 256.0;
            }
            239 => {
                self.ctx.param_int = i32::from(self.ctx.i2c_slave_adr);
                is_integer = true;
            }
            240..=243 => {
                self.ctx.param_int =
                    i32::from(self.ctx.trig_mask_array[(self.ctx.sub_ch - 240) as usize]);
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
                // Manual trigger executes immediately and replies with status.
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
                // Set DAC engineering value and refresh the corresponding output.
                self.ctx.dac_value_array[(self.ctx.sub_ch - 20) as usize] = self.ctx.param;
                self.set_dac(self.ctx.sub_ch);
            }
            30..=37 => {
                // Drive the selected PIO output pin now.
                self.set_port(self.ctx.sub_ch - 30, self.ctx.param_byte);
            }
            40..=47 => {
                // Update direction only; this path deliberately does not touch
                // the EEPROM-backed init array.
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

                // LCD text is carried inside the first bracketed segment.
                let text = self.extract_bracket_text();
                self.ctx.param_text_array[self.ctx.param_byte as usize] = text;
            }
            89 | 159 => {
                if !self.ctx.ee_unlocked {
                    return Err(ParseError::LockedErr);
                }
                self.ctx.inc_rast = self.ctx.param_int;
                self.ctx.inc_rast_def = self.ctx.inc_rast;
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
                // `0` selects the external ADC reference; any non-zero value
                // switches to the internal reference path.
                self.ctx.ext_ref = self.ctx.param_byte;
                self.set_reference_mode(self.ctx.param_byte != 0);
            }
            157 => {
                if !self.ctx.ee_unlocked {
                    return Err(ParseError::LockedErr);
                }
                self.ctx.integrate_ad16 = self.ctx.param_byte > 0;
                self.ctx.init_integrate_ad16 = self.ctx.integrate_ad16;
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
                // Store the generic I2C target address for later I/O commands.
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
                // The original firmware rejected auto-trigger values from 1 to 9 ms.
                if (1..=9).contains(&self.ctx.param_int) {
                    return Err(ParseError::ParamErr);
                }
                self.ctx.trig_timer_value = self.ctx.param_int as u16;
            }
            248 => {
                if !self.ctx.ee_unlocked {
                    return Err(ParseError::LockedErr);
                }
                // `0` means negative edge, non-zero means positive edge.
                self.ctx.trig_level = self.ctx.param_byte;
                self.set_trigger_edge(self.ctx.param_byte != 0);
            }
            249 => {
                // Immediate manual trigger path.
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

        // WEN is a one-shot EEPROM write enable; all other commands clear it again.
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
            // Incoming result frames are relayed instead of parsed locally.
            return Ok(vec![Reply::Echo(self.ctx.ser_inp_str.clone())]);
        }

        self.ctx.ser_inp_ptr = 0;
        let mut replies = Vec::new();

        if has_main_ch {
            let is_param = self.parse_extract();
            if !is_param {
                return Err(ParseError::SyntaxErr);
            }
            self.skip_char(':');
            if is_omni {
                // Omni commands are forwarded so every slave can act on them.
                replies.push(Reply::Echo(self.ctx.ser_inp_str.clone()));
            } else {
                self.ctx.current_ch = self.parse_u8(&self.ctx.param_str)?;
            }
        }

        if !is_omni && has_main_ch && self.ctx.current_ch != self.ctx.slave_ch {
            // A command for another slave is only passed through.
            return Ok(vec![Reply::Echo(self.ctx.ser_inp_str.clone())]);
        }

        // `!` or `?` request the verbose reply form from the original parser.
        self.ctx.verbose = self.ctx.ser_inp_str.contains('!') || self.ctx.ser_inp_str.contains('?');

        if let Some(check_pos) = self.ctx.ser_inp_str.find('$') {
            // Optional XOR checksum covers the line up to, but not including, `$xx`.
            let supplied = self
                .ctx
                .ser_inp_str
                .get(check_pos + 1..check_pos + 3)
                .ok_or(ParseError::ChecksumErr)?;
            let check_sum_in =
                u8::from_str_radix(supplied, 16).map_err(|_| ParseError::ChecksumErr)?;
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
            // Short numeric form omits `VAL` and reuses the current channel.
            self.ctx.cmd_which = CmdWhich::Val;
            0
        } else {
            // Text commands are translated to their base sub-channel ranges.
            self.ctx.cmd_which = self.cmd_to_index();
            if self.ctx.cmd_which == CmdWhich::Err {
                return Err(ParseError::SyntaxErr);
            }
            let offset = self
                .ctx
                .cmd_which
                .sub_channel_offset()
                .ok_or(ParseError::SyntaxErr)?;
            // Command form expects a following sub-channel token.
            self.parse_extract();
            offset
        };

        // The parser stores sub-channels as absolute offsets into the dispatch tables.
        let sub_ch_value = if self.ctx.param_str.trim().is_empty() {
            0
        } else {
            self.parse_u8_or_wildcard(&self.ctx.param_str)?
        };
        self.ctx.sub_ch = sub_ch_value.saturating_add(sub_ch_offset);

        if is_request {
            replies.extend(self.parse_get_param()?);
            Ok(replies)
        } else {
            if let Some(equal_pos) = self.ctx.ser_inp_str.find('=') {
                self.ctx.ser_inp_ptr = equal_pos + 1;
            }

            if self.parse_extract() {
                // Cache the same payload as float, integer, and byte, matching
                // the Pascal parser's shared parameter variables.
                self.ctx.param = self.parse_f32(&self.ctx.param_str)?;
                self.ctx.param_int = self.ctx.param as i32;
                self.ctx.param_byte = self.ctx.param_int as u8;
            } else if self.ctx.cmd_which.requires_parameter_on_set() {
                return Err(ParseError::ParamErr);
            }

            replies.extend(self.parse_set_param()?);
            Ok(replies)
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
        value
            .trim()
            .parse::<f32>()
            .map_err(|_| ParseError::ParamErr)
    }

    fn extract_bracket_text(&self) -> String {
        let start = self.ctx.ser_inp_str.find('[').map(|idx| idx + 1);
        let end = self.ctx.ser_inp_str[self.ctx.ser_inp_ptr..]
            .find(']')
            .map(|idx| idx + self.ctx.ser_inp_ptr);

        match (start, end) {
            (Some(start), Some(end)) if end >= start => {
                self.ctx.ser_inp_str[start..end].to_string()
            }
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
        let mut features = String::new();

        if self.ctx.dac12_present {
            features.push_str("DA12 ");
        }
        if self.ctx.dac714_present || self.ctx.dac16_present {
            features.push_str("DA16 ");
        }
        if self.ctx.adc16_present {
            features.push_str("AD16 ");
        }
        if self.ctx.io_present {
            features.push_str("IO32 ");
        }
        if self.ctx.lcd_present {
            features.push_str("LCD ");
        }

        features.push(']');
        features
    }

    fn status_reply(&self, error: ParseError, status: u8) -> Reply {
        Reply::Status { error, status }
    }

    fn get_new_value(&mut self, sub_ch: u8) -> bool {
        self.ctx.param_int = 0;
        self.ctx.param = 0.0;

        match sub_ch {
            0..=7 => {
                let index = sub_ch as usize;
                self.ctx.param_int = self.ctx.adc10_raw_array[index];
                self.ctx.param = ((self.ctx.param_int + self.ctx.offset_array[index]) as f32
                    * self.ctx.scale_array[index])
                    / self.ctx.base_scale_ad10;
                false
            }
            10..=17 => {
                let index = (sub_ch - 10) as usize;
                let scale_index = sub_ch as usize;
                self.ctx.param_int = self.ctx.adc_raw_array[index];
                self.ctx.param = ((self.ctx.param_int + self.ctx.offset_array[scale_index]) as f32
                    * self.ctx.scale_array[scale_index])
                    / self.ctx.base_scale_ad16;
                false
            }
            20..=27 => {
                self.ctx.param = self.ctx.dac_value_array[(sub_ch - 20) as usize];
                false
            }
            30..=37 => {
                self.ctx.param_int = i32::from(self.get_port(sub_ch - 30));
                true
            }
            40..=47 => {
                self.ctx.param_int = i32::from(self.ctx.dir_init_array[(sub_ch - 40) as usize]);
                true
            }
            _ => false,
        }
    }

    fn set_dac(&mut self, sub_ch: u8) {
        if !(20..=27).contains(&sub_ch) {
            return;
        }

        let index = (sub_ch - 20) as usize;
        let offset = self.ctx.offset_array[sub_ch as usize];
        let scale = self.ctx.scale_array[sub_ch as usize];
        let value = self.ctx.dac_value_array[index];

        if self.ctx.dac714_present {
            let raw = (self.ctx.base_scale_da16 * (value * scale)) as i32 + offset;
            self.ctx.dac_raw_array[index] = raw.clamp(-32767, 32767) as i16 as u16;
        }

        if self.ctx.dac16_present {
            let raw = (self.ctx.base_scale_da16 * (value * scale)) as i32 + offset;
            self.ctx.dac_raw_array[index] = (0x8000_i32 - raw.clamp(-32767, 32767)) as u16;
        }

        if self.ctx.dac12_present {
            let raw = (self.ctx.base_scale_da12 * (value * scale)) as i32 + offset;
            self.ctx.dac_raw_array[index] = (0x0800_i32 - raw.clamp(-2047, 2047)) as u16;
        }
    }

    fn get_port(&mut self, index: u8) -> u8 {
        if self.ctx.io_present {
            self.ctx.io_pin_array[index as usize]
        } else {
            self.ctx.port_array[index as usize]
        }
    }

    fn set_port(&mut self, index: u8, value: u8) {
        self.ctx.port_array[index as usize] = value;

        if self.ctx.io_present {
            self.ctx.i2c_slave_adr = index + 0x38;
            self.ctx.param_int = 0x0100 + i32::from(value);
            self.twi_out_word(self.ctx.i2c_slave_adr, self.ctx.param_int as u16);
        } else {
            self.ctx.shift_register_writes.push(self.ctx.port_array);
        }
    }

    fn set_dir(&mut self, index: u8, value: u8) {
        if self.ctx.io_present {
            self.ctx.dir_output_array[index as usize] = value;
        }
    }

    fn set_base_scales(&mut self) {
        self.ctx.base_scale_ad10 = self.ctx.scale_array[9];
        self.ctx.base_scale_ad16 = self.ctx.scale_array[19];
        self.ctx.base_scale_da12 = self.ctx.scale_array[28];
        self.ctx.base_scale_da16 = self.ctx.scale_array[29];
    }

    fn set_reference_mode(&mut self, internal_reference: bool) {
        self.ctx.internal_reference = internal_reference;
    }

    fn set_trigger_edge(&mut self, positive_edge: bool) {
        self.ctx.trigger_positive_edge = positive_edge;
    }

    fn set_sys_timer_activity(&mut self) {}

    fn twi_inp_byte(&mut self, _slave: u8) -> u8 {
        self.ctx.i2c_byte_reads.pop_front().unwrap_or_default()
    }

    fn twi_inp_word(&mut self, _slave: u8) -> u16 {
        self.ctx.i2c_word_reads.pop_front().unwrap_or_default()
    }

    fn twi_out_byte(&mut self, slave: u8, value: u8) {
        self.ctx.i2c_writes.push((slave, u16::from(value)));
    }

    fn twi_out_word(&mut self, slave: u8, value: u16) {
        self.ctx.i2c_writes.push((slave, value));
    }

    pub fn take_context(&mut self) -> ParseContext {
        mem::take(&mut self.ctx)
    }
}

#[cfg(test)]
mod tests {
    use super::{AdaIoParser, ParseError, Reply};

    fn checksum(frame: &str) -> String {
        let checksum = frame.bytes().fold(0u8, |acc, ch| acc ^ ch);
        format!("{frame}${checksum:02X}")
    }

    fn assert_float_reply(reply: &Reply, expected_sub_ch: u8, expected_value: f32) {
        match reply {
            Reply::Float { sub_ch, value } => {
                assert_eq!(*sub_ch, expected_sub_ch);
                assert!((*value - expected_value).abs() < f32::EPSILON);
            }
            other => panic!("expected float reply, got {:?}", other),
        }
    }

    #[test]
    fn omni_frames_are_forwarded_and_executed_locally() {
        let mut parser = AdaIoParser::default();
        parser.ctx.ser_inp_str = "*:TRG".to_string();

        let replies = parser.parse_sub_ch().unwrap();

        assert_eq!(replies[0], Reply::Echo("*:TRG".to_string()));
        assert_eq!(
            replies[1],
            Reply::Status {
                error: ParseError::NoErr,
                status: 0,
            }
        );
        assert!(parser.ctx.trigger);
        assert!(parser.ctx.led_activity_low);
    }

    #[test]
    fn mnemonic_commands_accept_missing_subchannel() {
        let mut parser = AdaIoParser::default();
        parser.ctx.ser_inp_str = "0:TRT?".to_string();

        let replies = parser.parse_sub_ch().unwrap();

        assert_eq!(
            replies,
            vec![Reply::Int {
                sub_ch: 247,
                value: 0,
            }]
        );
    }

    #[test]
    fn omni_frames_validate_checksum_before_local_execution() {
        let mut parser = AdaIoParser::default();
        parser.ctx.ser_inp_str = "*:TRG$00".to_string();

        let result = parser.parse_sub_ch();

        assert_eq!(result, Err(ParseError::ChecksumErr));
        assert!(!parser.ctx.trigger);
        assert!(!parser.ctx.led_activity_low);
    }

    #[test]
    fn omni_frames_with_valid_checksum_refresh_activity_and_execute() {
        let mut parser = AdaIoParser::default();
        parser.ctx.ser_inp_str = checksum("*:TRG");

        let replies = parser.parse_sub_ch().unwrap();

        assert!(matches!(replies.first(), Some(Reply::Echo(_))));
        assert!(parser.ctx.trigger);
        assert!(parser.ctx.led_activity_low);
    }

    #[test]
    fn live_adc_reads_use_pascal_scaling_tables() {
        let mut parser = AdaIoParser::default();
        parser.ctx.adc10_raw_array[0] = 123;
        parser.ctx.offset_array[0] = 2;
        parser.ctx.scale_array[0] = 2.0;
        parser.ctx.ser_inp_str = "0:VAL 0?".to_string();

        let replies = parser.parse_sub_ch().unwrap();

        assert_float_reply(&replies[0], 0, 2.5);

        parser.ctx.adc_raw_array[0] = 3225;
        parser.ctx.ser_inp_str = "0:VAL 10?".to_string();

        let replies = parser.parse_sub_ch().unwrap();

        assert_float_reply(&replies[0], 10, 1.0);
    }

    #[test]
    fn raw_adc_aliases_return_integer_samples() {
        let mut parser = AdaIoParser::default();
        parser.ctx.adc_raw_array[0] = 3225;
        parser.ctx.ser_inp_str = "0:RAW 10?".to_string();

        let replies = parser.parse_sub_ch().unwrap();

        assert_eq!(
            replies,
            vec![Reply::Int {
                sub_ch: 60,
                value: 3225,
            }]
        );
    }

    #[test]
    fn dac_set_updates_raw_output_value() {
        let mut parser = AdaIoParser::default();
        parser.ctx.dac12_present = true;
        parser.ctx.ser_inp_str = "0:VAL 20=1.0".to_string();

        let replies = parser.parse_sub_ch().unwrap();

        assert_eq!(
            replies,
            vec![Reply::Status {
                error: ParseError::NoErr,
                status: 0,
            }]
        );
        assert_eq!(parser.ctx.dac_value_array[0], 1.0);
        assert_eq!(parser.ctx.dac_raw_array[0], 0x0800 - 200);
    }

    #[test]
    fn port_outputs_update_shift_register_state_without_i2c_expander() {
        let mut parser = AdaIoParser::default();
        parser.ctx.ser_inp_str = "0:PIO 3=85".to_string();

        parser.parse_sub_ch().unwrap();

        assert_eq!(parser.ctx.port_array[3], 85);
        assert_eq!(parser.ctx.shift_register_writes.last().unwrap()[3], 85);
        assert!(parser.ctx.i2c_writes.is_empty());
    }

    #[test]
    fn port_outputs_use_pascal_i2c_expander_command_when_present() {
        let mut parser = AdaIoParser::default();
        parser.ctx.io_present = true;
        parser.ctx.ser_inp_str = "0:PIO 3=85".to_string();

        parser.parse_sub_ch().unwrap();

        assert_eq!(parser.ctx.port_array[3], 85);
        assert_eq!(parser.ctx.i2c_slave_adr, 0x3b);
        assert_eq!(parser.ctx.param_int, 0x0155);
        assert_eq!(parser.ctx.i2c_writes, vec![(0x3b, 0x0155)]);
        assert!(parser.ctx.shift_register_writes.is_empty());
    }

    #[test]
    fn i2c_commands_read_and_write_pascal_payloads() {
        let mut parser = AdaIoParser::default();
        parser.ctx.i2c_slave_adr = 0x48;
        parser.ctx.i2c_byte_reads.push_back(0x5a);
        parser.ctx.ser_inp_str = "0:ICB?".to_string();

        let replies = parser.parse_sub_ch().unwrap();

        assert_eq!(
            replies,
            vec![Reply::Int {
                sub_ch: 230,
                value: 0x5a,
            }]
        );

        parser.ctx.i2c_word_reads.push_back(0x1234);
        parser.ctx.ser_inp_str = "0:ICS?".to_string();

        let replies = parser.parse_sub_ch().unwrap();

        assert_eq!(
            replies,
            vec![Reply::Int {
                sub_ch: 232,
                value: 0x3412,
            }]
        );

        parser.ctx.ser_inp_str = "0:ICW=4660".to_string();
        parser.parse_sub_ch().unwrap();
        parser.ctx.ser_inp_str = "0:ICS=4660".to_string();
        parser.parse_sub_ch().unwrap();

        assert_eq!(parser.ctx.i2c_writes, vec![(0x48, 0x1234), (0x48, 0x3412)]);
    }

    #[test]
    fn eeprom_backed_options_update_runtime_and_default_mirrors() {
        let mut parser = AdaIoParser::default();
        parser.ctx.ser_inp_str = "0:WEN=1".to_string();
        parser.parse_sub_ch().unwrap();
        parser.ctx.ser_inp_str = "0:OPT 9=6".to_string();

        parser.parse_sub_ch().unwrap();

        assert_eq!(parser.ctx.inc_rast, 6);
        assert_eq!(parser.ctx.inc_rast_def, 6);
        assert!(!parser.ctx.ee_unlocked);

        parser.ctx.ser_inp_str = "0:WEN=1".to_string();
        parser.parse_sub_ch().unwrap();
        parser.ctx.ser_inp_str = "0:OPT 7=1".to_string();

        parser.parse_sub_ch().unwrap();

        assert!(parser.ctx.integrate_ad16);
        assert!(parser.ctx.init_integrate_ad16);
    }

    #[test]
    fn idn_reply_includes_pascal_feature_suffix() {
        let mut parser = AdaIoParser::default();
        parser.ctx.vers1_str = "1.742 [ADA by CM/c't 04/2007; ".to_string();
        parser.ctx.dac12_present = true;
        parser.ctx.dac16_present = true;
        parser.ctx.adc16_present = true;
        parser.ctx.io_present = true;
        parser.ctx.lcd_present = true;
        parser.ctx.ser_inp_str = "0:IDN?".to_string();

        let replies = parser.parse_sub_ch().unwrap();

        assert_eq!(
            replies,
            vec![Reply::Text(
                "0:1.742 [ADA by CM/c't 04/2007; DA12 DA16 AD16 IO32 LCD ]".to_string()
            )]
        );
    }

    #[test]
    fn erc_set_requires_value_like_pascal_command_table() {
        let mut parser = AdaIoParser::default();
        parser.ctx.ser_inp_str = "0:ERC=".to_string();

        let result = parser.parse_sub_ch();

        assert_eq!(result, Err(ParseError::ParamErr));
        assert_eq!(parser.ctx.err_count, 0);
    }
}
