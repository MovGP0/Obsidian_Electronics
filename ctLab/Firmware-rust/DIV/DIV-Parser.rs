// Best-effort Rust port of ctLab/Firmware/DIV/DIV-Parser.pas.
//
// This file keeps the original parser structure and lookup tables readable,
// while moving board-specific I/O and ADC behavior behind a hook trait.

#[derive(Debug, Clone, Copy, PartialEq, Eq, PartialOrd, Ord)]
#[repr(u8)]
pub enum CmdWhich {
    Str = 0,
    Idn = 1,
    Trg = 2,
    Val = 3,
    Rng = 4,
    Dsp = 5,
    Ofs = 6,
    Scl = 7,
    All = 8,
    Trm = 9,
    Trt = 10,
    Trl = 11,
    Erc = 12,
    Sbd = 13,
    Wen = 14,
    Nop = 15,
    Err = 16,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
#[repr(u8)]
pub enum ParserError {
    NoErr = 0,
    UserReq = 1,
    BusyErr = 2,
    OvlErr = 3,
    SyntaxErr = 4,
    ParamErr = 5,
    LockedErr = 6,
    ChecksumErr = 7,
}

pub const VERS1_STR: &str = "3.10 [DIV by CM/c't 03/2007] ";

pub const CMD_STR_ARR: [&str; 16] = [
    "STR", "IDN", "TRG", "VAL", "RNG", "DSP", "OFS", "SCL", "ALL", "TRM", "TRT", "TRL", "ERC",
    "SBD", "WEN", "NOP",
];

pub const CMD_TO_SUBCH_ARR: [u8; 16] = [
    255, 254, 249, 0, 19, 80, 100, 200, 99, 240, 247, 248, 251, 252, 250, 0,
];

const COMMANDS: [CmdWhich; 16] = [
    CmdWhich::Str,
    CmdWhich::Idn,
    CmdWhich::Trg,
    CmdWhich::Val,
    CmdWhich::Rng,
    CmdWhich::Dsp,
    CmdWhich::Ofs,
    CmdWhich::Scl,
    CmdWhich::All,
    CmdWhich::Trm,
    CmdWhich::Trt,
    CmdWhich::Trl,
    CmdWhich::Erc,
    CmdWhich::Sbd,
    CmdWhich::Wen,
    CmdWhich::Nop,
];

#[derive(Debug, Clone)]
pub struct ParserState {
    pub sub_ch: u8,
    pub current_ch: u8,
    pub cmd_which: CmdWhich,
    pub param: f32,
    pub param_long_int: i32,
    pub param_str: String,
    pub ser_inp_str: String,
    pub ser_inp_ptr: usize,
    pub slave_ch: u8,
    pub range: u8,
    pub ad24temp: i32,
    pub lcd_integrate: u8,
    pub init_lcd_integrate: u8,
    pub inc_rast: i32,
    pub init_inc_rast: i32,
    pub errcount: i32,
    pub ee_unlocked: bool,
    pub verbose: bool,
    pub overload_flag: bool,
    pub check_limit_err: ParserError,
    pub trig_mask: u8,
    pub trig_timer_value: u16,
    pub trigger: bool,
    pub offset_array24: [i32; 16],
    pub offset_array10: [i32; 16],
    pub scale_array24: [f32; 16],
    pub scale_array10: [f32; 16],
}

impl Default for ParserState {
    fn default() -> Self {
        Self {
            sub_ch: 0,
            current_ch: 255,
            cmd_which: CmdWhich::Val,
            param: 0.0,
            param_long_int: 0,
            param_str: String::new(),
            ser_inp_str: String::new(),
            ser_inp_ptr: 0,
            slave_ch: 0,
            range: 0,
            ad24temp: 0,
            lcd_integrate: 1,
            init_lcd_integrate: 1,
            inc_rast: 4,
            init_inc_rast: 4,
            errcount: 0,
            ee_unlocked: false,
            verbose: false,
            overload_flag: false,
            check_limit_err: ParserError::NoErr,
            trig_mask: 0,
            trig_timer_value: 0,
            trigger: false,
            offset_array24: [0; 16],
            offset_array10: [0; 16],
            scale_array24: [1.0; 16],
            scale_array10: [1.0; 16],
        }
    }
}

pub trait DivParserHooks {
    fn get_ad24(&mut self, sub_ch: u8, state: &mut ParserState);
    fn wait_ad24(&mut self, state: &mut ParserState);
    fn wait_ad10(&mut self, state: &mut ParserState);
    fn get_ad10(&mut self, channel: u8, state: &mut ParserState);
    fn get_adc(&mut self, channel: u8) -> i32;
    fn param_scale24(&mut self, state: &mut ParserState);
    fn param_scale10(&mut self, state: &mut ParserState);
    fn is_ac_range(&self, state: &ParserState) -> bool;
    fn check_limits(&mut self, state: &mut ParserState);
    fn switch_range(&mut self, state: &mut ParserState);
    fn show_range(&mut self, state: &mut ParserState);

    fn write_param_long_int_ser(&mut self, state: &ParserState);
    fn write_param_ser(&mut self, state: &ParserState, overload: bool);
    fn write_ch_prefix(&mut self, state: &ParserState);
    fn write_ser_inp(&mut self, input: &str);
    fn write_str(&mut self, text: &str);
    fn ser_crlf(&mut self);
    fn serprompt(&mut self, err: ParserError);

    fn set_activity_timer(&mut self, ticks: u8);
    fn set_activity_led_low(&mut self);
}

pub struct DivParser<H> {
    pub state: ParserState,
    pub hooks: H,
}

impl<H> DivParser<H>
where
    H: DivParserHooks,
{
    pub fn new(hooks: H) -> Self {
        Self {
            state: ParserState::default(),
            hooks,
        }
    }

    pub fn parse_get_param(&mut self) {
        let mut is_integer = false;

        match self.state.sub_ch {
            0..=2 => {
                // Direct AD24 voltage readback for the selected input channel.
                self.hooks.get_ad24(self.state.sub_ch, &mut self.state);
                self.hooks.param_scale24(&mut self.state);
            }
            3 => {
                // Blocking AD24 request: wait for a fresh conversion, then read
                // channel 0 without the slower integration path.
                self.hooks.wait_ad24(&mut self.state);
                self.hooks.get_ad24(0, &mut self.state);
                self.hooks.param_scale24(&mut self.state);
            }
            19 => {
                self.state.param_long_int = i32::from(self.state.range);
                is_integer = true;
            }
            10 => {
                self.hooks.wait_ad10(&mut self.state);
                if self.hooks.is_ac_range(&self.state) {
                    self.hooks.get_ad10(3, &mut self.state);
                } else {
                    self.hooks.get_ad10(5, &mut self.state);
                }
                self.hooks.param_scale10(&mut self.state);
            }
            11 => {
                self.hooks.wait_ad10(&mut self.state);
                if self.hooks.is_ac_range(&self.state) {
                    self.hooks.get_ad10(4, &mut self.state);
                } else {
                    self.hooks.get_ad10(5, &mut self.state);
                }
                self.hooks.param_scale10(&mut self.state);
            }
            50 => {
                // Raw AD24 result is centered around mid-scale in the firmware.
                self.state.param_long_int = self.state.ad24temp - 0x800000;
                is_integer = true;
            }
            60..=62 => {
                self.state.param_long_int = self.hooks.get_adc(self.state.sub_ch - 57);
                // Sub-channel 62 reports the DC midpoint, so subtract the ADC mid-scale.
                if self.state.sub_ch == 62 {
                    self.state.param_long_int -= 512;
                }
                is_integer = true;
            }
            80 => {
                self.state.param_long_int = 0;
                is_integer = true;
            }
            88 => {
                self.state.param_long_int = i32::from(self.state.lcd_integrate);
                is_integer = true;
            }
            89 => {
                self.state.param_long_int = self.state.inc_rast;
                is_integer = true;
            }
            99 => {
                // ALL collapses to the canonical voltage slot after reading channel 0.
                self.hooks.get_ad24(0, &mut self.state);
                self.hooks.param_scale24(&mut self.state);
                self.state.sub_ch = 0;
            }
            100..=115 => {
                self.state.param_long_int = self.state.offset_array24[(self.state.sub_ch - 100) as usize];
                is_integer = true;
            }
            120..=135 => {
                self.state.param_long_int = self.state.offset_array10[(self.state.sub_ch - 120) as usize];
                is_integer = true;
            }
            200..=215 => {
                self.state.param = self.state.scale_array24[(self.state.sub_ch - 200) as usize];
            }
            220..=235 => {
                self.state.param = self.state.scale_array10[(self.state.sub_ch - 220) as usize];
            }
            240 => {
                is_integer = true;
                self.state.param_long_int = i32::from(self.state.trig_mask);
            }
            247 => {
                is_integer = true;
                self.state.param_long_int = i32::from(self.state.trig_timer_value);
            }
            249 => {
                self.state.trigger = true;
                self.hooks.serprompt(ParserError::NoErr);
                return;
            }
            251 => {
                is_integer = true;
                self.state.param_long_int = self.state.errcount;
            }
            253 => {
                // Serial self-test echoes the full input frame unchanged.
                self.hooks.write_str(&self.state.ser_inp_str);
                self.hooks.ser_crlf();
                return;
            }
            254 => {
                self.hooks.write_ch_prefix(&self.state);
                self.hooks.write_str(VERS1_STR);
                self.hooks.ser_crlf();
                return;
            }
            255 => {
                self.hooks.serprompt(ParserError::NoErr);
                return;
            }
            _ => {
                self.hooks.serprompt(ParserError::ParamErr);
                return;
            }
        }

        if is_integer {
            self.hooks.write_param_long_int_ser(&self.state);
        } else {
            self.hooks
                .write_param_ser(&self.state, self.state.overload_flag);
        }
    }

    pub fn parse_set_param(&mut self) {
        // The Pascal firmware resets the range/limit status before every write command.
        self.state.check_limit_err = ParserError::NoErr;

        match self.state.sub_ch {
            19 => {
                self.state.range = self.state.param_long_int as u8;
                self.hooks.check_limits(&mut self.state);
                self.hooks.switch_range(&mut self.state);
                self.hooks.show_range(&mut self.state);
            }
            88 => {
                if self.state.ee_unlocked {
                    self.state.lcd_integrate = self.state.param_long_int as u8;
                    self.state.init_lcd_integrate = self.state.lcd_integrate;
                } else {
                    self.hooks.serprompt(ParserError::LockedErr);
                    return;
                }
            }
            89 => {
                if self.state.ee_unlocked {
                    self.state.inc_rast = self.state.param_long_int;
                    self.state.init_inc_rast = self.state.inc_rast;
                } else {
                    self.hooks.serprompt(ParserError::LockedErr);
                    return;
                }
            }
            100..=115 => {
                if self.state.ee_unlocked {
                    self.state.offset_array24[(self.state.sub_ch - 100) as usize] = self.state.param_long_int;
                } else {
                    self.hooks.serprompt(ParserError::LockedErr);
                    return;
                }
            }
            120..=135 => {
                if self.state.ee_unlocked {
                    self.state.offset_array10[(self.state.sub_ch - 120) as usize] = self.state.param_long_int;
                } else {
                    self.hooks.serprompt(ParserError::LockedErr);
                    return;
                }
            }
            200..=215 => {
                if self.state.ee_unlocked {
                    self.state.scale_array24[(self.state.sub_ch - 200) as usize] = self.state.param;
                } else {
                    self.hooks.serprompt(ParserError::LockedErr);
                    return;
                }
            }
            220..=235 => {
                if self.state.ee_unlocked {
                    self.state.scale_array10[(self.state.sub_ch - 220) as usize] = self.state.param;
                } else {
                    self.hooks.serprompt(ParserError::LockedErr);
                    return;
                }
            }
            240 => {
                if self.state.ee_unlocked {
                    self.state.trig_mask = self.state.param_long_int as u8;
                } else {
                    self.hooks.serprompt(ParserError::LockedErr);
                    return;
                }
            }
            247 => {
                if self.state.ee_unlocked {
                    if (1..=9).contains(&self.state.param_long_int) {
                        self.hooks.serprompt(ParserError::ParamErr);
                        return;
                    }
                    self.state.trig_timer_value = self.state.param_long_int as u16;
                } else {
                    self.hooks.serprompt(ParserError::LockedErr);
                    return;
                }
            }
            249 => {
                self.state.trigger = true;
                self.hooks.serprompt(ParserError::NoErr);
                return;
            }
            250 => {}
            251 => {
                self.state.errcount = self.state.param_long_int;
            }
            _ => {
                self.hooks.serprompt(ParserError::ParamErr);
                return;
            }
        }

        self.state.ee_unlocked = false;
        // WEN only arms the next EEPROM-affecting command; the latch clears afterwards.
        if self.state.sub_ch == 250 {
            self.state.ee_unlocked = true;
        }
        if self.state.verbose || self.state.check_limit_err != ParserError::NoErr {
            self.hooks.serprompt(self.state.check_limit_err);
        }
    }

    pub fn cmd2index(&mut self) -> CmdWhich {
        let upper = self.state.param_str.to_ascii_uppercase();
        self.state.param_str = upper;

        // Translate the human-readable command token into the compact command table index.
        for (index, cmd_str) in CMD_STR_ARR.iter().enumerate() {
            if self.state.param_str == *cmd_str {
                return COMMANDS[index];
            }
        }

        CmdWhich::Err
    }

    pub fn parse_extract(&mut self) -> bool {
        self.state.param_str.clear();
        let bytes = self.state.ser_inp_str.as_bytes();

        // Ignore leading blanks before deciding whether the next token is text or numeric.
        while matches!(bytes.get(self.state.ser_inp_ptr), Some(b' ')) {
            self.state.ser_inp_ptr += 1;
        }

        let Some(&first) = bytes.get(self.state.ser_inp_ptr) else {
            return false;
        };

        // Pascal uses ['*'..'9'] so that '*', sign, dot, and decimal digits
        // are all treated as parameter payload.
        let is_param = (b'*'..=b'9').contains(&first);

        for idx in self.state.ser_inp_ptr..bytes.len() {
            let byte = bytes[idx];
            let keep = if is_param { byte <= b'9' } else { byte >= b'A' };

            if keep {
                self.state.param_str.push(byte as char);
            } else {
                // Stop at the first delimiter and leave the cursor on it for the caller.
                self.state.ser_inp_ptr = idx;
                return is_param;
            }
        }

        self.state.ser_inp_ptr = bytes.len();
        is_param
    }

    pub fn parse_sub_ch(&mut self) {
        if self.state.ser_inp_str.is_empty() {
            // Empty input is treated as a no-op status poll.
            self.hooks.serprompt(ParserError::NoErr);
            return;
        }

        let has_main_ch = self.state.ser_inp_str.contains(':');
        let is_request = !self.state.ser_inp_str.contains('=');
        let first = self.state.ser_inp_str.as_bytes()[0];
        let is_omni = first == b'*';
        let is_result = first == b'#';

        if is_result {
            // Result frames are just forwarded; they are not parsed as local commands.
            self.hooks.write_ser_inp(&self.state.ser_inp_str);
            return;
        }

        // The original Pascal parser notes "if busy => BusyErr" at this stage.
        // This standalone Rust port leaves that arbitration to the caller/hooks
        // before `parse_sub_ch()` is entered.
        self.state.ser_inp_ptr = 0;

        if has_main_ch {
            let _is_param = self.parse_extract();
            self.state.ser_inp_ptr = self.state.ser_inp_ptr.saturating_add(1);

            if is_omni {
                // Omni commands are forwarded down the chain before local handling.
                self.hooks.write_ser_inp(&self.state.ser_inp_str);
            } else {
                self.state.current_ch = parse_u8_default(&self.state.param_str, 0);
            }
        }

        if !is_omni && self.state.current_ch != self.state.slave_ch && has_main_ch {
            // Addressed command for another slave: pass it through untouched.
            self.hooks.write_ser_inp(&self.state.ser_inp_str);
            return;
        }

        // `!` and `?` both request the verbose response form.
        self.state.verbose = self.state.ser_inp_str.contains('!') || self.state.ser_inp_str.contains('?');

        if let Some(check_pos) = self.state.ser_inp_str.find('$') {
            let checksum_in = parse_hex_u8_default(
                self.state
                    .ser_inp_str
                    .get(check_pos + 1..check_pos + 3)
                    .unwrap_or(""),
                0,
            );

            let mut checksum = 0u8;
            for byte in self.state.ser_inp_str.as_bytes()[..check_pos].iter().copied() {
                checksum ^= byte;
            }

            // The Pascal code excludes the `$xx` suffix itself from the XOR checksum.
            if checksum != checksum_in {
                self.hooks.serprompt(ParserError::ChecksumErr);
                return;
            }
        }

        // Accepted traffic refreshes the activity indicator and timeout window.
        self.hooks.set_activity_timer(125);
        self.hooks.set_activity_led_low();

        let sub_ch_offset = if self.parse_extract() {
            // Bare numeric input is the short form for `VAL <sub_ch>`.
            self.state.cmd_which = CmdWhich::Val;
            0
        } else {
            self.state.cmd_which = self.cmd2index();
            if self.state.cmd_which == CmdWhich::Err {
                self.hooks.serprompt(ParserError::SyntaxErr);
                return;
            }

            let offset = CMD_TO_SUBCH_ARR[self.state.cmd_which as usize];
            // Text commands map to a base sub-channel, then read an optional numeric suffix.
            let _is_param = self.parse_extract();
            offset
        };

        // After command extraction, the final sub-channel is the parsed suffix plus the command base.
        self.state.sub_ch = parse_u8_default(&self.state.param_str, 0).wrapping_add(sub_ch_offset);

        if is_request {
            self.parse_get_param();
            return;
        }

        let Some(eq_pos) = self.state.ser_inp_str.find('=') else {
            self.hooks.serprompt(ParserError::ParamErr);
            return;
        };

        self.state.ser_inp_ptr = eq_pos + 1;
        if self.parse_extract() {
            // Set commands accept both integer-like and floating-point payload text.
            self.state.param = parse_f32_default(&self.state.param_str, 0.0);
            self.state.param_long_int = self.state.param as i32;
        } else if self.state.cmd_which >= CmdWhich::Val {
            self.hooks.serprompt(ParserError::ParamErr);
            return;
        }

        self.parse_set_param();
    }
}

fn parse_u8_default(value: &str, default: u8) -> u8 {
    value
        .trim()
        .parse::<i32>()
        .ok()
        .and_then(|parsed| {
            if (0..=u8::MAX as i32).contains(&parsed) {
                Some(parsed as u8)
            } else {
                None
            }
        })
        .unwrap_or(default)
}

fn parse_f32_default(value: &str, default: f32) -> f32 {
    value.trim().parse::<f32>().unwrap_or(default)
}

fn parse_hex_u8_default(value: &str, default: u8) -> u8 {
    u8::from_str_radix(value.trim(), 16).unwrap_or(default)
}
