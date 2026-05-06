// Best-effort Rust port of ctLab/Firmware/DCG/DCG-Parser.pas.
//
// This keeps the original parser structure, command tables, sub-channel
// mapping, and stateful serial parsing flow. Hardware-facing routines are
// modeled as placeholders so the parser remains readable without pulling in
// the rest of the firmware.

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
#[repr(usize)]
pub enum CmdWhich {
    Str = 0,
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

impl CmdWhich {
    pub const fn from_index(index: usize) -> Self {
        match index {
            0 => Self::Str,
            1 => Self::Idn,
            2 => Self::Chn,
            3 => Self::Val,
            4 => Self::Dcv,
            5 => Self::Dca,
            6 => Self::Mah,
            7 => Self::Mwh,
            8 => Self::Msv,
            9 => Self::Msa,
            10 => Self::Msw,
            11 => Self::Pcv,
            12 => Self::Pca,
            13 => Self::Pwon,
            14 => Self::Pwoff,
            15 => Self::Rip,
            16 => Self::Raw,
            17 => Self::Dsp,
            18 => Self::Ofs,
            19 => Self::Scl,
            20 => Self::Opt,
            21 => Self::All,
            22 => Self::Tmp,
            23 => Self::Wen,
            24 => Self::Erc,
            25 => Self::Sbd,
            26 => Self::Nop,
            _ => Self::Err,
        }
    }

    pub const fn as_index(self) -> usize {
        self as usize
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
#[repr(u8)]
pub enum Modify {
    Ampere = 0,
    Volt = 1,
    Ripple = 2,
    TOn = 3,
    TOff = 4,
    TrackCh = 5,
    CapMenu = 6,
    PwrMenu = 7,
}

impl Modify {
    pub fn from_byte(value: u8) -> Option<Self> {
        match value {
            0 => Some(Self::Ampere),
            1 => Some(Self::Volt),
            2 => Some(Self::Ripple),
            3 => Some(Self::TOn),
            4 => Some(Self::TOff),
            5 => Some(Self::TrackCh),
            6 => Some(Self::CapMenu),
            7 => Some(Self::PwrMenu),
            _ => None,
        }
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
#[repr(u8)]
pub enum Error {
    NoErr = 0,
    UserReq,
    BusyErr,
    OvlErr,
    SyntaxErr,
    ParamErr,
    LockedErr,
    ChecksumErr,
    FuseErr,
    FaultErr,
}

pub const VERS1_STR: &str = "2.92 [DCG by CM/c't 05/2010]";

pub const CMD_STR_ARR: [&str; 27] = [
    "STR", "IDN", "CHN", "VAL", "DCV", "DCA", "MAH", "MWH", "MSV", "MSA", "MSW", "PCV", "PCA",
    "RON", "ROF", "RIP", "RAW", "DSP", "OFS", "SCL", "OPT", "ALL", "TMP", "WEN", "ERC", "SBD",
    "NOP",
];

pub const CMD2_SUB_CH_ARR: [u8; 27] = [
    // Mnemonic commands address the first sub-channel in a block; the parsed
    // numeric argument is added later so `VAL 5?` and direct `5?` land on the
    // same final sub-channel.
    255, 254, 253, 0, 0, 1, 7, 8, 10, 11, 18, 20, 21, 27, 28, 29, 50, 80, 100, 200, 150, 99,
    233, 250, 251, 252, 0,
];

pub struct DcgParser {
    pub dc_volt: f32,
    pub dc_amp: f32,
    pub ah: f32,
    pub wh: f32,
    pub dc_volt_integrated: f32,
    pub dc_amp_integrated: f32,
    pub curr_amp: f32,
    pub curr_volt: f32,
    pub dc_volt_mod: f32,
    pub dc_amp_mod: f32,
    pub input_voltage: f32,
    pub measured_voltage: f32,
    pub measured_current: f32,
    pub temperature: f32,
    pub pw_on_time: i32,
    pub pw_off_time: i32,
    pub ripple_percent: i32,
    pub adc_raw_u: u16,
    pub adc_raw_i: u16,
    pub adc10: [u16; 6],
    pub dac_raw_uon: u16,
    pub dac_raw_i: u16,
    pub modify: Modify,
    pub inc_rast: i32,
    pub init_inc_rast: f32,
    pub dac_u_offsets: [i32; 2],
    pub dac_i_offsets: [i32; 4],
    pub adc_u_offsets: [i32; 2],
    pub adc_i_offsets: [i32; 4],
    pub option_array: [f32; 25],
    pub dac_u_scales: [f32; 2],
    pub dac_i_scales: [f32; 4],
    pub adc_u_scales: [f32; 2],
    pub adc_i_scales: [f32; 4],
    pub err_count: i32,
    pub ee_ser_baud_reg: u8,
    pub slave_ch: u8,
    pub current_ch: u8,
    pub sub_ch: u8,
    pub cmd_which: CmdWhich,
    pub busy_flag: bool,
    pub ee_unlocked: bool,
    pub changed_flag: bool,
    pub verbose: bool,
    pub i_range: u8,
    pub digits: u8,
    pub nachkomma: u8,
    pub param: f32,
    pub param_int: i32,
    pub param_byte: u8,
    pub param_str: String,
    pub ser_inp_str: String,
    pub ser_inp_ptr: usize,
    pub check_limit_err: Error,
    pub activity_timer: u8,
    pub serial_log: Vec<String>,
}

impl Default for DcgParser {
    fn default() -> Self {
        Self {
            dc_volt: 0.0,
            dc_amp: 0.0,
            ah: 0.0,
            wh: 0.0,
            dc_volt_integrated: 0.0,
            dc_amp_integrated: 0.0,
            curr_amp: 0.0,
            curr_volt: 0.0,
            dc_volt_mod: 0.0,
            dc_amp_mod: 0.0,
            input_voltage: 0.0,
            measured_voltage: 0.0,
            measured_current: 0.0,
            temperature: 0.0,
            pw_on_time: 0,
            pw_off_time: 0,
            ripple_percent: 0,
            adc_raw_u: 0,
            adc_raw_i: 0,
            adc10: [0; 6],
            dac_raw_uon: 0,
            dac_raw_i: 0,
            modify: Modify::Ampere,
            inc_rast: 0,
            init_inc_rast: 0.0,
            dac_u_offsets: [0; 2],
            dac_i_offsets: [0; 4],
            adc_u_offsets: [0; 2],
            adc_i_offsets: [0; 4],
            option_array: [0.0; 25],
            dac_u_scales: [0.0; 2],
            dac_i_scales: [0.0; 4],
            adc_u_scales: [0.0; 2],
            adc_i_scales: [0.0; 4],
            err_count: 0,
            ee_ser_baud_reg: 0,
            slave_ch: 0,
            current_ch: 0,
            sub_ch: 0,
            cmd_which: CmdWhich::Err,
            busy_flag: false,
            ee_unlocked: false,
            changed_flag: false,
            verbose: false,
            i_range: 0,
            digits: 0,
            nachkomma: 0,
            param: 0.0,
            param_int: 0,
            param_byte: 0,
            param_str: String::new(),
            ser_inp_str: String::new(),
            ser_inp_ptr: 0,
            check_limit_err: Error::NoErr,
            activity_timer: 0,
            serial_log: Vec::new(),
        }
    }
}

impl DcgParser {
    pub fn param_div_1000(&mut self) {
        self.param /= 1000.0;
    }

    pub fn param_mul_1000(&mut self) {
        self.param *= 1000.0;
    }

    // Device-specific parser branch.
    pub fn parse_get_param(&mut self) {
        self.digits = 1;
        self.nachkomma = 4;

        match self.sub_ch {
            0 => {
                self.param = self.dc_volt;
                self.write_param_ser();
            }
            1 => {
                self.param = self.dc_amp;
                self.nachkomma = 7u8.saturating_sub(self.i_range);
                self.write_param_ser();
            }
            2 => {
                self.param = self.dc_amp;
                self.param_mul_1000();
                self.nachkomma = 2;
                self.write_param_ser();
            }
            3 => {
                self.param = self.dc_amp;
                self.param_mul_1000();
                self.param_mul_1000();
                self.nachkomma = 0;
                self.write_param_ser();
            }
            7 => {
                self.param = self.ah;
                self.write_param_ser();
            }
            8 => {
                self.param = self.wh;
                self.write_param_ser();
            }
            10 => {
                self.get_voltage();
                self.write_param_ser();
            }
            11 => {
                self.get_current();
                self.nachkomma = 8u8.saturating_sub(self.i_range);
                self.write_param_ser();
            }
            12 => {
                self.get_current();
                self.param_mul_1000();
                self.nachkomma = 2;
                self.write_param_ser();
            }
            13 => {
                self.get_current();
                self.param_mul_1000();
                self.param_mul_1000();
                self.nachkomma = 0;
                self.write_param_ser();
            }
            15 => {
                self.get_input_voltage();
                self.write_param_ser();
            }
            16 => {
                self.param = self.dc_volt_integrated;
                self.write_param_ser();
            }
            17 => {
                self.param = self.dc_amp_integrated;
                self.nachkomma = 8u8.saturating_sub(self.i_range);
                self.write_param_ser();
            }
            18 => {
                self.param = self.curr_amp * self.curr_volt;
                self.write_param_ser();
            }
            20 => {
                self.param = self.dc_volt_mod * 100.0;
                self.write_param_ser();
            }
            21..=23 => {
                self.param = self.dc_amp_mod * 100.0;
                self.write_param_ser();
            }
            27 => {
                self.param_int = self.pw_on_time;
                self.write_param_int_ser();
            }
            28 => {
                self.param_int = self.pw_off_time;
                self.write_param_int_ser();
            }
            29 => {
                self.param_int = self.ripple_percent;
                self.write_param_int_ser();
            }
            50 => {
                self.param_int = i32::from(self.adc_raw_u);
                self.write_param_int_ser();
            }
            51 => {
                self.param_int = i32::from(self.adc_raw_i);
                self.write_param_int_ser();
            }
            52 => {
                self.param_int = i32::from(self.get_adc10(3));
                self.write_param_int_ser();
            }
            53 => {
                self.param_int = i32::from(self.get_adc10(4));
                self.write_param_int_ser();
            }
            54 => {
                self.param_int = i32::from(self.get_adc10(5));
                self.write_param_int_ser();
            }
            70 => {
                self.param_int = i32::from(self.dac_raw_uon);
                self.write_param_int_ser();
            }
            71 => {
                self.param_int = i32::from(self.dac_raw_i);
                self.write_param_int_ser();
            }
            80 => {
                self.param_int = self.modify as i32;
                self.write_param_int_ser();
            }
            89 => {
                self.param_int = self.inc_rast;
                self.write_param_int_ser();
            }
            99 => {
                self.get_voltage();
                self.sub_ch = 10;
                self.write_param_ser();
                self.get_current();
                self.sub_ch = 11;
                self.write_param_ser();
                self.get_input_voltage();
                self.sub_ch = 15;
                self.write_param_ser();
            }
            100 | 101 => {
                self.param_int = self.dac_u_offsets[(self.sub_ch - 100) as usize];
                self.write_param_int_ser();
            }
            102..=105 => {
                self.param_int = self.dac_i_offsets[(self.sub_ch - 102) as usize];
                self.write_param_int_ser();
            }
            110 | 111 => {
                self.param_int = self.adc_u_offsets[(self.sub_ch - 110) as usize];
                self.write_param_int_ser();
            }
            112..=115 => {
                self.param_int = self.adc_i_offsets[(self.sub_ch - 112) as usize];
                self.write_param_int_ser();
            }
            150..=174 => {
                self.param = self.option_array[(self.sub_ch - 150) as usize];
                self.write_param_ser();
            }
            200 | 201 => {
                self.param = self.dac_u_scales[(self.sub_ch - 200) as usize];
                self.nachkomma = 5;
                self.write_param_ser();
            }
            202..=205 => {
                self.param = self.dac_i_scales[(self.sub_ch - 202) as usize];
                self.nachkomma = 5;
                self.write_param_ser();
            }
            210 | 211 => {
                self.param = self.adc_u_scales[(self.sub_ch - 210) as usize];
                self.nachkomma = 5;
                self.write_param_ser();
            }
            212..=215 => {
                self.param = self.adc_i_scales[(self.sub_ch - 212) as usize];
                self.nachkomma = 5;
                self.write_param_ser();
            }
            233 => {
                self.param = self.temperature;
                self.nachkomma = 1;
                self.write_param_ser();
            }
            251 => {
                self.param_int = self.err_count;
                self.write_param_int_ser();
            }
            252 => {
                self.param_int = i32::from(self.ee_ser_baud_reg);
                self.write_param_int_ser();
            }
            253 => {
                self.serial_log.push(self.ser_inp_str.clone());
            }
            254 => {
                self.write_ch_prefix();
                self.serial_log.push(VERS1_STR.to_string());
            }
            250 | 255 => {
                self.serprompt(Error::NoErr);
            }
            _ => {
                self.serprompt(Error::ParamErr);
            }
        }
    }

    pub fn parse_set_param(&mut self) {
        if self.busy_flag {
            // The Pascal parser rejects writes while a measurement/update cycle
            // is active so callers get a deterministic `BusyErr` instead of a
            // half-applied setting.
            self.serprompt(Error::BusyErr);
            return;
        }

        self.changed_flag = true;

        match self.sub_ch {
            0 => {
                self.dc_volt = self.param;
            }
            1 => {
                self.dc_amp = self.param;
            }
            2 => {
                self.param_div_1000();
                self.dc_amp = self.param;
            }
            3 => {
                self.param_div_1000();
                self.param_div_1000();
                self.dc_amp = self.param;
            }
            7 | 8 => {
                self.ah = 0.0;
                self.wh = 0.0;
            }
            20 => {
                self.dc_volt_mod = self.param / 100.0;
            }
            21..=23 => {
                self.dc_amp_mod = self.param / 100.0;
            }
            27 => {
                self.pw_on_time = self.param_int;
            }
            28 => {
                self.pw_off_time = self.param_int;
            }
            29 => {
                self.ripple_percent = self.param_int;
            }
            80 => {
                self.modify = Modify::from_byte(self.param_byte).unwrap_or(self.modify);
                self.werte_on_lcd();
            }
            89 => {
                if self.ee_unlocked {
                    self.inc_rast = self.param_int;
                    self.init_inc_rast = self.param;
                } else {
                    self.serprompt(Error::LockedErr);
                    return;
                }
            }
            100..=115 | 200..=215 => {
                if self.ee_unlocked {
                    match self.sub_ch {
                        100 | 101 => {
                            self.dac_u_offsets[(self.sub_ch - 100) as usize] = self.param_int;
                        }
                        102..=105 => {
                            self.dac_i_offsets[(self.sub_ch - 102) as usize] = self.param_int;
                        }
                        110 | 111 => {
                            self.adc_u_offsets[(self.sub_ch - 110) as usize] = self.param_int;
                        }
                        112..=115 => {
                            self.adc_i_offsets[(self.sub_ch - 112) as usize] = self.param_int;
                        }
                        200 | 201 => {
                            self.dac_u_scales[(self.sub_ch - 200) as usize] = self.param;
                        }
                        202..=205 => {
                            self.dac_i_scales[(self.sub_ch - 202) as usize] = self.param;
                        }
                        210 | 211 => {
                            self.adc_u_scales[(self.sub_ch - 210) as usize] = self.param;
                        }
                        212..=215 => {
                            self.adc_i_scales[(self.sub_ch - 212) as usize] = self.param;
                        }
                        _ => {}
                    }
                    self.init_scales();
                    self.mdelay(3);
                } else {
                    self.serprompt(Error::LockedErr);
                    return;
                }
            }
            150..=174 => {
                if self.ee_unlocked {
                    self.option_array[(self.sub_ch - 150) as usize] = self.param;
                    self.init_scales();
                    self.mdelay(3);
                } else {
                    self.serprompt(Error::LockedErr);
                    return;
                }
            }
            250 => {}
            251 => {
                self.err_count = self.param_int;
            }
            252 => {
                if self.ee_unlocked {
                    self.ee_ser_baud_reg = self.param_byte;
                } else {
                    self.serprompt(Error::LockedErr);
                    return;
                }
            }
            _ => {
                self.serprompt(Error::ParamErr);
                return;
            }
        }

        self.ee_unlocked = false;
        if self.sub_ch == 250 {
            self.ee_unlocked = true;
        }

        self.check_limits();
        if self.verbose || (self.check_limit_err != Error::NoErr) {
            self.serprompt(self.check_limit_err);
        }
        self.set_level_dac();
    }

    // General parser branch.
    pub fn cmd_to_index(&mut self) -> CmdWhich {
        // Translate the clear-text command token into the command-table index
        // used by `CMD2_SUB_CH_ARR`.
        self.param_str = self.param_str.to_ascii_uppercase();
        for (index, cmd) in CMD_STR_ARR.iter().enumerate() {
            if self.param_str == *cmd {
                return CmdWhich::from_index(index);
            }
        }
        CmdWhich::Err
    }

    // Extract either a command token or a numeric parameter token from SerInpStr.
    // Returns true for parameter tokens, false for command tokens.
    pub fn parse_extract(&mut self) -> bool {
        self.param_str.clear();
        let bytes = self.ser_inp_str.as_bytes();

        // Ignore inter-token whitespace before deciding whether the next field
        // is a command mnemonic or a numeric / wildcard parameter.
        while self.ser_inp_ptr < bytes.len() && bytes[self.ser_inp_ptr] == b' ' {
            self.ser_inp_ptr += 1;
        }

        if self.ser_inp_ptr >= bytes.len() {
            return false;
        }

        // Parameter tokens may start with `*` for Omni addressing or with a
        // digit / sign / decimal marker for normal numeric sub-channels.
        let is_param = matches!(bytes[self.ser_inp_ptr], b'*'..=b'9');

        if is_param {
            while self.ser_inp_ptr < bytes.len() {
                let byte = bytes[self.ser_inp_ptr];
                if matches!(byte, b'*'..=b'9') {
                    self.param_str.push(byte as char);
                    self.ser_inp_ptr += 1;
                } else {
                    return true;
                }
            }
            true
        } else {
            while self.ser_inp_ptr < bytes.len() {
                let byte = bytes[self.ser_inp_ptr];
                if byte.is_ascii_uppercase() {
                    self.param_str.push(byte as char);
                    self.ser_inp_ptr += 1;
                } else {
                    return false;
                }
            }
            false
        }
    }

    pub fn parse_sub_ch(&mut self) {
        if self.ser_inp_str.is_empty() {
            self.serprompt(Error::NoErr);
            return;
        }

        // Accepted forms mirror the Pascal parser: `MainCh:CMD SubCh?`,
        // `MainCh:SubCh=Value`, and the short form without `VAL` and/or
        // without `MainCh:`, which then reuses the previously addressed channel.
        let has_main_ch = self.ser_inp_str.contains(':');
        let is_request = !self.ser_inp_str.contains('=');
        let first_char = self.ser_inp_str.as_bytes()[0] as char;
        let is_omni = first_char == '*';
        let is_result = first_char == '#';

        if is_result {
            self.write_ser_inp();
            return;
        }

        self.ser_inp_ptr = 0;
        if has_main_ch {
            let _is_param = self.parse_extract();
            self.ser_inp_ptr = self.ser_inp_ptr.saturating_add(1);
            if is_omni {
                // Omni commands are forwarded to the bus unchanged instead of
                // rebinding `current_ch` locally.
                self.write_ser_inp();
            } else if let Ok(channel) = self.param_str.parse::<u8>() {
                self.current_ch = channel;
            } else {
                self.serprompt(Error::ParamErr);
                return;
            }
        }

        if !is_omni && has_main_ch && self.current_ch != self.slave_ch {
            // Frames with an explicit foreign main channel are forwarded and
            // not interpreted locally.
            self.write_ser_inp();
            return;
        }

        // `?` or `!` requests a verbose reply in the original serial protocol.
        self.verbose = self.ser_inp_str.contains('!') || self.ser_inp_str.contains('?');

        if let Some(check_pos) = self.ser_inp_str.find('$') {
            // The protocol uses a trailing two-digit hex XOR checksum; the `$`
            // marker itself is not included in the XOR span.
            let checksum_slice = self.ser_inp_str.get(check_pos + 1..check_pos + 3);
            let Some(checksum_text) = checksum_slice else {
                self.serprompt(Error::ChecksumErr);
                return;
            };

            let Some(checksum_in) = Self::hex_to_int(checksum_text) else {
                self.serprompt(Error::ChecksumErr);
                return;
            };

            let mut checksum = 0u8;
            for byte in self.ser_inp_str.as_bytes().iter().take(check_pos) {
                checksum ^= *byte;
            }

            if checksum != checksum_in {
                self.serprompt(Error::ChecksumErr);
                return;
            }
        }

        self.activity_timer = 255;

        let sub_ch_offset = if self.parse_extract() {
            // Direct sub-channel form: the extracted token already is the
            // absolute sub-channel number.
            0
        } else {
            self.cmd_which = self.cmd_to_index();
            if self.cmd_which == CmdWhich::Err {
                self.serprompt(Error::SyntaxErr);
                return;
            }

            // Mnemonic commands contribute the block base; the next extracted
            // token adds the per-command sub-channel offset.
            let offset = CMD2_SUB_CH_ARR[self.cmd_which.as_index()];
            let _is_param = self.parse_extract();
            offset
        };

        let sub_ch_base = self.param_str.parse::<u16>().unwrap_or(0);
        self.sub_ch = sub_ch_base.saturating_add(u16::from(sub_ch_offset)) as u8;

        if is_request {
            self.parse_get_param();
        } else {
            // Set commands require an explicit `=` followed by a parseable
            // numeric payload.
            let Some(equal_pos) = self.ser_inp_str.find('=') else {
                self.serprompt(Error::ParamErr);
                return;
            };

            self.ser_inp_ptr = equal_pos + 1;
            if self.ser_inp_ptr < self.ser_inp_str.len() && self.parse_extract() {
                if let Ok(value) = self.param_str.parse::<f32>() {
                    self.param = value;
                    self.param_int = value as i32;
                    self.param_byte = self.param_int as u8;
                } else {
                    self.serprompt(Error::ParamErr);
                    return;
                }
            } else {
                self.serprompt(Error::ParamErr);
                return;
            }
            self.parse_set_param();
        }
    }

    fn write_param_ser(&mut self) {
        self.serial_log.push(format!(
            "{}:{}={:.*}",
            self.current_ch,
            self.sub_ch,
            self.nachkomma as usize,
            self.param
        ));
    }

    fn write_param_int_ser(&mut self) {
        self.serial_log
            .push(format!("{}:{}={}", self.current_ch, self.sub_ch, self.param_int));
    }

    fn write_ch_prefix(&mut self) {
        self.serial_log.push(format!("{}:", self.current_ch));
    }

    fn serprompt(&mut self, error: Error) {
        self.serial_log.push(format!("{error:?}"));
    }

    fn write_ser_inp(&mut self) {
        self.serial_log.push(self.ser_inp_str.clone());
    }

    fn get_voltage(&mut self) {
        self.param = self.measured_voltage;
    }

    fn get_current(&mut self) {
        self.param = self.measured_current;
    }

    fn get_input_voltage(&mut self) {
        self.param = self.input_voltage;
    }

    fn get_adc10(&self, channel: usize) -> u16 {
        self.adc10.get(channel).copied().unwrap_or(0)
    }

    fn werte_on_lcd(&mut self) {}

    fn init_scales(&mut self) {}

    fn mdelay(&mut self, _milliseconds: u16) {}

    fn check_limits(&mut self) {
        self.check_limit_err = Error::NoErr;
    }

    fn set_level_dac(&mut self) {}

    fn hex_to_int(text: &str) -> Option<u8> {
        u8::from_str_radix(text, 16).ok()
    }
}

#[cfg(test)]
mod tests {
    use super::{CmdWhich, DcgParser};

    #[test]
    fn command_lookup_preserves_original_table() {
        let mut parser = DcgParser {
            param_str: "tmp".to_string(),
            ..DcgParser::default()
        };
        assert_eq!(parser.cmd_to_index(), CmdWhich::Tmp);
    }

    #[test]
    fn direct_sub_channel_request_keeps_structure() {
        let mut parser = DcgParser {
            ser_inp_str: "0:10?".to_string(),
            measured_voltage: 12.5,
            ..DcgParser::default()
        };
        parser.parse_sub_ch();
        assert!(parser.serial_log.iter().any(|line| line.contains("0:10=12.5000")));
    }
}
