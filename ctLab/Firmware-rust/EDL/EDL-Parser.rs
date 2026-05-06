// Best-effort Rust port of ctLab/Firmware/EDL/EDL-Parser.pas.
//
// This keeps the original parser split:
// - device-specific handlers: parse_get_param / parse_set_param
// - generic parser helpers: cmd_to_index / parse_extract / parse_sub_ch
//
// The original Pascal parser talks directly to firmware globals and serial I/O.
// This Rust version keeps the same control flow but represents hardware access
// through explicit state fields and placeholder hook methods.

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum PromptCode {
    NoErr,
    ParamErr,
    BusyErr,
    LockedErr,
    CheckLimitErr,
    CheckSumErr,
    SyntaxErr,
}

impl PromptCode {
    fn as_str(self) -> &'static str {
        match self {
            Self::NoErr => "NoErr",
            Self::ParamErr => "ParamErr",
            Self::BusyErr => "BusyErr",
            Self::LockedErr => "LockedErr",
            Self::CheckLimitErr => "CheckLimitErr",
            Self::CheckSumErr => "CheckSumErr",
            Self::SyntaxErr => "SyntaxErr",
        }
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Mode {
    OutputOff,
    RhiVolt,
    RloVolt,
    IhiVolt,
    IloVolt,
    PhiVolt,
    PloVolt,
    Unknown(u8),
}

impl From<u8> for Mode {
    fn from(value: u8) -> Self {
        match value {
            0 => Self::OutputOff,
            1 => Self::RhiVolt,
            2 => Self::RloVolt,
            3 => Self::IhiVolt,
            4 => Self::IloVolt,
            5 => Self::PhiVolt,
            6 => Self::PloVolt,
            other => Self::Unknown(other),
        }
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Modify {
    Normal,
    Unknown(u8),
}

impl From<u8> for Modify {
    fn from(value: u8) -> Self {
        match value {
            0 => Self::Normal,
            other => Self::Unknown(other),
        }
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum CmdWhich {
    Err,
    Index(usize),
}

const OPTION_ARRAY_LEN: usize = 22;
const DACI_COUNT: usize = 4;
const ADCU_COUNT: usize = 2;
const ADCI_COUNT: usize = 4;

#[derive(Debug, Clone)]
pub struct EdlParser {
    pub ser_inp_str: String,
    pub ser_inp_ptr: usize,
    pub param_str: String,
    pub output_lines: Vec<String>,
    pub digits: u8,
    pub nachkomma: u8,
    pub current_ch: i32,
    pub slave_ch: i32,
    pub sub_ch: i32,
    pub param: f64,
    pub param_int: i32,
    pub param_byte: u8,
    pub verbose: bool,
    pub busy_flag: bool,
    pub changed_flag: bool,
    pub output_enable: bool,
    pub mpxena: bool,
    pub low_volt: bool,
    pub shunt_select: u8,
    pub shunt_range: u8,
    pub mode_select: Mode,
    pub modify: Modify,
    pub dc_amp: f64,
    pub dc_watt: f64,
    pub dc_volt: f64,
    pub dc_ohm: f64,
    pub dc_amp_mod: f64,
    pub ah: f64,
    pub wh: f64,
    pub ptot: f64,
    pub voltage_on: f64,
    pub current_on: f64,
    pub voltage_off: f64,
    pub current_off: f64,
    pub pw_on_time: i32,
    pub pw_off_time: i32,
    pub i_percent: i32,
    pub ad16_temp_u_on: u16,
    pub ad16_temp_i_on: u16,
    pub dac_temp_on: u16,
    pub dac_temp_off: u16,
    pub dac_temp: u16,
    pub daci_offsets: [i32; DACI_COUNT],
    pub adcu_offsets: [i32; ADCU_COUNT],
    pub adci_offsets: [i32; ADCI_COUNT],
    pub option_array: [f64; OPTION_ARRAY_LEN],
    pub daci_scales: [f64; DACI_COUNT],
    pub adc16_u_scale_low: f64,
    pub adc16_u_scale_high: f64,
    pub adci_scales: [f64; ADCI_COUNT],
    pub temperature: f64,
    pub temperature_extern: f64,
    pub trig_mask: u8,
    pub ee_trig_mask: u8,
    pub err_count: i32,
    pub ee_ser_baud_reg: u8,
    pub ee_unlocked: bool,
    pub inc_rast: i32,
    pub init_inc_rast: f64,
    pub vers1_str: String,
    pub activity_timer: u8,
    pub led_activity: bool,
    pub cmd_str_arr: Vec<&'static str>,
    pub cmd2_sub_ch_arr: Vec<u8>,
}

impl Default for EdlParser {
    fn default() -> Self {
        Self {
            ser_inp_str: String::new(),
            ser_inp_ptr: 0,
            param_str: String::new(),
            output_lines: Vec::new(),
            digits: 1,
            nachkomma: 4,
            current_ch: 0,
            slave_ch: 0,
            sub_ch: 0,
            param: 0.0,
            param_int: 0,
            param_byte: 0,
            verbose: false,
            busy_flag: false,
            changed_flag: false,
            output_enable: false,
            mpxena: false,
            low_volt: false,
            shunt_select: 0,
            shunt_range: 0,
            mode_select: Mode::OutputOff,
            modify: Modify::Normal,
            dc_amp: 0.0,
            dc_watt: 0.0,
            dc_volt: 0.0,
            dc_ohm: 0.0,
            dc_amp_mod: 0.0,
            ah: 0.0,
            wh: 0.0,
            ptot: 0.0,
            voltage_on: 0.0,
            current_on: 0.0,
            voltage_off: 0.0,
            current_off: 0.0,
            pw_on_time: 0,
            pw_off_time: 0,
            i_percent: 0,
            ad16_temp_u_on: 0,
            ad16_temp_i_on: 0,
            dac_temp_on: 0,
            dac_temp_off: 0,
            dac_temp: 0,
            daci_offsets: [0; DACI_COUNT],
            adcu_offsets: [0; ADCU_COUNT],
            adci_offsets: [0; ADCI_COUNT],
            option_array: [0.0; OPTION_ARRAY_LEN],
            daci_scales: [0.0; DACI_COUNT],
            adc16_u_scale_low: 0.0,
            adc16_u_scale_high: 0.0,
            adci_scales: [0.0; ADCI_COUNT],
            temperature: 0.0,
            temperature_extern: 0.0,
            trig_mask: 0,
            ee_trig_mask: 0,
            err_count: 0,
            ee_ser_baud_reg: 0,
            ee_unlocked: false,
            inc_rast: 0,
            init_inc_rast: 0.0,
            vers1_str: String::new(),
            activity_timer: 0,
            led_activity: false,
            cmd_str_arr: Vec::new(),
            cmd2_sub_ch_arr: Vec::new(),
        }
    }
}

impl EdlParser {
    pub fn parse_get_param(&mut self) {
        self.digits = 1;
        self.nachkomma = 4;

        match self.sub_ch {
            0 => {
                self.param = if self.output_enable { 1.0 } else { 0.0 };
                self.write_param_ser();
            }
            1 => {
                self.param = self.dc_amp;
                self.nachkomma = 7_u8.saturating_sub(self.shunt_select);
                self.write_param_ser();
            }
            2 => {
                self.param = self.dc_amp;
                self.param_mul_1000();
                self.nachkomma = 2;
                self.write_param_ser();
            }
            3 => {
                self.param = self.dc_watt;
                self.nachkomma = 2;
                self.write_param_ser();
            }
            4 => {
                self.param = self.dc_volt;
                self.nachkomma = 2;
                self.write_param_ser();
            }
            5 => {
                self.param = self.dc_ohm;
                self.nachkomma = 1_u8.saturating_add(self.shunt_select);
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
            9 => {
                self.param_int = i32::from(self.shunt_select);
                self.write_param_int_ser();
            }
            10 => {
                self.get_voltage(true);
                self.write_param_ser();
            }
            11 => {
                self.get_current(true);
                self.nachkomma = 8_u8.saturating_sub(self.shunt_select);
                self.write_param_ser();
            }
            12 => {
                self.get_current(true);
                self.param_mul_1000();
                self.nachkomma = 2;
                self.write_param_ser();
            }
            15 => {
                self.get_voltage(false);
                self.write_param_ser();
            }
            16 => {
                self.get_current(false);
                self.nachkomma = 8_u8.saturating_sub(self.shunt_select);
                self.write_param_ser();
            }
            17 => {
                self.get_current(false);
                self.param_mul_1000();
                self.nachkomma = 2;
                self.write_param_ser();
            }
            18 => {
                self.param = self.ptot;
                self.write_param_ser();
            }
            19 => {
                self.param_int = self.mode_to_i32();
                self.write_param_int_ser();
            }
            21 | 22 => {
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
                self.param_int = self.i_percent;
                self.write_param_int_ser();
            }
            50 => {
                self.disable_ints();
                self.param_int = i32::from(self.ad16_temp_u_on);
                self.enable_ints();
                self.write_param_int_ser();
            }
            51 => {
                self.disable_ints();
                self.param_int = i32::from(self.ad16_temp_i_on);
                self.enable_ints();
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
            70 => {
                self.param_int = i32::from(self.dac_temp_on);
                self.write_param_int_ser();
            }
            71 => {
                self.param_int = i32::from(self.dac_temp_off);
                self.write_param_int_ser();
            }
            72 => {
                self.param_int = i32::from(self.dac_temp);
                self.write_param_int_ser();
            }
            80 => {
                self.param_int = self.modify_to_i32();
                self.write_param_int_ser();
            }
            89 => {
                self.param_int = self.inc_rast;
                self.write_param_int_ser();
            }
            99 => {
                self.get_voltage(true);
                self.sub_ch = 10;
                self.write_param_ser();
                self.get_current(true);
                self.sub_ch = 11;
                self.write_param_ser();
                self.get_voltage(false);
                self.sub_ch = 15;
                self.write_param_ser();
                self.get_current(false);
                self.sub_ch = 16;
                self.write_param_ser();
            }
            100 | 101 => {
                self.param_int = 0;
                self.write_param_int_ser();
            }
            102..=105 => {
                self.param_int = self.daci_offsets[(self.sub_ch - 102) as usize];
                self.write_param_int_ser();
            }
            110..=111 => {
                self.param_int = self.adcu_offsets[(self.sub_ch - 110) as usize];
                self.write_param_int_ser();
            }
            112..=115 => {
                self.param_int = self.adci_offsets[(self.sub_ch - 112) as usize];
                self.write_param_int_ser();
            }
            150..=171 => {
                self.param = self.option_array[(self.sub_ch - 150) as usize];
                self.write_param_ser();
            }
            200 | 201 => {
                self.param = 0.0;
                self.write_param_ser();
            }
            202..=205 => {
                self.param = self.daci_scales[(self.sub_ch - 202) as usize];
                self.nachkomma = 5;
                self.write_param_ser();
            }
            210 => {
                self.param = self.adc16_u_scale_low;
                self.nachkomma = 5;
                self.write_param_ser();
            }
            211 => {
                self.param = self.adc16_u_scale_high;
                self.nachkomma = 5;
                self.write_param_ser();
            }
            212..=215 => {
                self.param = self.adci_scales[(self.sub_ch - 212) as usize];
                self.nachkomma = 5;
                self.write_param_ser();
            }
            233 => {
                self.param = self.temperature;
                self.nachkomma = 1;
                self.write_param_ser();
            }
            234 => {
                self.param = self.temperature_extern;
                self.nachkomma = 1;
                self.write_param_ser();
            }
            240 => {
                self.param_int = i32::from(self.trig_mask);
                self.write_param_int_ser();
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
                self.output_lines.push(self.ser_inp_str.clone());
            }
            254 => {
                let prefix = self.write_ch_prefix();
                self.output_lines.push(format!("{prefix}{}", self.vers1_str));
            }
            250 | 255 => {
                self.serprompt(PromptCode::NoErr);
            }
            _ => {
                self.serprompt(PromptCode::ParamErr);
            }
        }
    }

    pub fn parse_set_param(&mut self) {
        if self.busy_flag {
            self.serprompt(PromptCode::BusyErr);
            return;
        }

        self.changed_flag = true;

        match self.sub_ch {
            0 => {
                self.output_enable = self.param != 0.0;
                if self.mode_select == Mode::OutputOff {
                    self.mpxena = false;
                } else {
                    self.mpxena = self.output_enable;
                }
            }
            1 => {
                self.dc_amp = self.param;
            }
            2 => {
                self.param_div_1000();
                self.dc_amp = self.param;
            }
            3 => {
                self.dc_watt = self.param;
            }
            4 => {
                self.low_volt = false;
                self.output_enable = true;
                self.dc_volt = self.param;
            }
            5 => {
                self.dc_ohm = self.param;
            }
            7 | 8 => {
                self.ah = 0.0;
                self.wh = 0.0;
            }
            9 => {
                self.shunt_range = self.param_int as u8;
            }
            19 => {
                self.mode_select = Mode::from(self.param_byte);
                if self.mode_select == Mode::OutputOff {
                    self.mpxena = false;
                    self.output_enable = false;
                    self.set_level_dac_i();
                } else {
                    self.output_enable = true;
                }
            }
            21 | 22 => {
                self.dc_amp_mod = self.param / 100.0;
            }
            27 => {
                self.pw_on_time = self.param_int;
            }
            28 => {
                self.pw_off_time = self.param_int;
            }
            29 => {
                self.i_percent = self.param_int;
            }
            70 => {
                self.disable_ints();
                self.dac_temp_on = self.param_int as u16;
                self.enable_ints();
                if self.verbose {
                    self.serprompt(PromptCode::NoErr);
                }
                return;
            }
            71 => {
                self.disable_ints();
                self.dac_temp_off = self.param_int as u16;
                self.enable_ints();
                if self.verbose {
                    self.serprompt(PromptCode::NoErr);
                }
                return;
            }
            80 => {
                self.modify = Modify::from(self.param_byte);
                self.werte_on_lcd();
            }
            89 | 100..=115 | 200..=223 => {
                if !self.ee_unlocked {
                    self.serprompt(PromptCode::LockedErr);
                    return;
                }

                match self.sub_ch {
                    89 => {
                        self.init_inc_rast = self.param;
                        self.inc_rast = self.param_int;
                    }
                    100 | 101 => {}
                    102..=105 => {
                        self.daci_offsets[(self.sub_ch - 102) as usize] = self.param_int;
                    }
                    110..=111 => {
                        self.adcu_offsets[(self.sub_ch - 110) as usize] = self.param_int;
                    }
                    112..=115 => {
                        self.adci_offsets[(self.sub_ch - 112) as usize] = self.param_int;
                    }
                    200 | 201 => {}
                    202..=205 => {
                        self.daci_scales[(self.sub_ch - 202) as usize] = self.param;
                    }
                    210 => {
                        self.adc16_u_scale_low = self.param;
                    }
                    211 => {
                        self.adc16_u_scale_high = self.param;
                    }
                    212..=215 => {
                        self.adci_scales[(self.sub_ch - 212) as usize] = self.param;
                    }
                    _ => {}
                }

                self.init_scales();
                self.mdelay(3);
            }
            150..=171 => {
                if !self.ee_unlocked {
                    self.serprompt(PromptCode::LockedErr);
                    return;
                }

                self.option_array[(self.sub_ch - 150) as usize] = self.param;
                self.init_scales();
                self.mdelay(3);
            }
            240 => {
                self.trig_mask = self.param_int as u8;
                self.ee_trig_mask = self.trig_mask;
            }
            250 => {}
            251 => {
                self.err_count = self.param_int;
            }
            252 => {
                if !self.ee_unlocked {
                    self.serprompt(PromptCode::LockedErr);
                    return;
                }
                self.ee_ser_baud_reg = self.param_byte;
            }
            _ => {
                self.serprompt(PromptCode::ParamErr);
                return;
            }
        }

        self.ee_unlocked = self.sub_ch == 250;
        self.check_limits();

        if self.verbose {
            self.serprompt(PromptCode::CheckLimitErr);
        }

        match self.mode_select {
            Mode::RhiVolt | Mode::RloVolt => self.set_level_dac_r(),
            Mode::IhiVolt | Mode::IloVolt => self.set_level_dac_i(),
            Mode::PhiVolt | Mode::PloVolt => self.set_level_dac_p(),
            Mode::OutputOff | Mode::Unknown(_) => {}
        }
    }

    pub fn cmd_to_index(&mut self) -> CmdWhich {
        self.param_str.make_ascii_uppercase();

        for (index, cmd) in self.cmd_str_arr.iter().enumerate() {
            if self.param_str == *cmd {
                return CmdWhich::Index(index);
            }
        }

        CmdWhich::Err
    }

    pub fn parse_extract(&mut self) -> bool {
        self.param_str.clear();

        let bytes = self.ser_inp_str.as_bytes().to_vec();
        let mut ptr = self.ser_inp_ptr.min(bytes.len());

        while ptr < bytes.len() && bytes[ptr] == b' ' {
            ptr += 1;
        }

        if ptr >= bytes.len() {
            self.ser_inp_ptr = ptr;
            return false;
        }

        let is_param = (b'*'..=b'9').contains(&bytes[ptr]);

        while ptr < bytes.len() {
            let byte = bytes[ptr];
            let keep = if is_param {
                (b'*'..=b'9').contains(&byte)
            } else {
                byte >= b'A'
            };

            if !keep {
                break;
            }

            self.param_str.push(byte as char);
            ptr += 1;
        }

        self.ser_inp_ptr = ptr;
        is_param
    }

    pub fn parse_sub_ch(&mut self) -> Vec<String> {
        self.output_lines.clear();

        if self.ser_inp_str.is_empty() {
            self.serprompt(PromptCode::NoErr);
            return self.output_lines.clone();
        }

        let has_main_ch = self.ser_inp_str.contains(':');
        let is_request = !self.ser_inp_str.contains('=');
        let first = self.ser_inp_str.as_bytes()[0];
        let is_omni = first == b'*';
        let is_result = first == b'#';

        if is_result {
            self.write_ser_inp();
            return self.output_lines.clone();
        }

        self.ser_inp_ptr = 0;

        if has_main_ch {
            let _is_param = self.parse_extract();
            self.ser_inp_ptr = self.ser_inp_ptr.saturating_add(1);

            if is_omni {
                self.write_ser_inp();
            } else if let Some(channel) = self.parse_i32(&self.param_str) {
                self.current_ch = channel;
            }
        }

        if !is_omni && self.current_ch != self.slave_ch && has_main_ch {
            self.write_ser_inp();
            return self.output_lines.clone();
        }

        self.verbose = self.ser_inp_str.contains('!') || self.ser_inp_str.contains('?');

        if let Some(check_pos) = self.ser_inp_str.find('$') {
            let checksum_text = self.ser_inp_str.get(check_pos + 1..check_pos + 3);
            let Some(checksum_text) = checksum_text else {
                self.serprompt(PromptCode::CheckSumErr);
                return self.output_lines.clone();
            };

            let Some(checksum_in) = self.hex_to_u8(checksum_text) else {
                self.serprompt(PromptCode::CheckSumErr);
                return self.output_lines.clone();
            };

            let mut checksum_calc = 0_u8;
            for byte in self.ser_inp_str.as_bytes().iter().take(check_pos) {
                checksum_calc ^= *byte;
            }

            if checksum_calc != checksum_in {
                self.serprompt(PromptCode::CheckSumErr);
                return self.output_lines.clone();
            }
        }

        self.set_systimer(255);
        self.led_activity = false;

        let sub_ch_offset = if self.parse_extract() {
            0_i32
        } else {
            let cmd_which = self.cmd_to_index();
            let CmdWhich::Index(index) = cmd_which else {
                self.serprompt(PromptCode::SyntaxErr);
                return self.output_lines.clone();
            };

            let Some(offset) = self.cmd2_sub_ch_arr.get(index).copied() else {
                self.serprompt(PromptCode::SyntaxErr);
                return self.output_lines.clone();
            };

            let _is_param = self.parse_extract();
            i32::from(offset)
        };

        let Some(sub_ch_base) = self.parse_i32(&self.param_str) else {
            self.serprompt(PromptCode::ParamErr);
            return self.output_lines.clone();
        };

        self.sub_ch = sub_ch_base + sub_ch_offset;

        if is_request {
            self.parse_get_param();
            return self.output_lines.clone();
        }

        let Some(eq_pos) = self.ser_inp_str.find('=') else {
            self.serprompt(PromptCode::ParamErr);
            return self.output_lines.clone();
        };

        self.ser_inp_ptr = eq_pos + 1;

        if !self.parse_extract() {
            self.serprompt(PromptCode::ParamErr);
            return self.output_lines.clone();
        }

        let Some(value) = self.parse_f64(&self.param_str) else {
            self.serprompt(PromptCode::ParamErr);
            return self.output_lines.clone();
        };

        self.param = value;
        self.param_int = value as i32;
        self.param_byte = self.param_int as u8;
        self.parse_set_param();

        self.output_lines.clone()
    }

    fn write_param_ser(&mut self) {
        self.output_lines.push(format!(
            "{}={:.*}",
            self.sub_ch,
            self.nachkomma as usize,
            self.param
        ));
    }

    fn write_param_int_ser(&mut self) {
        self.output_lines
            .push(format!("{}={}", self.sub_ch, self.param_int));
    }

    fn serprompt(&mut self, code: PromptCode) {
        self.output_lines.push(code.as_str().to_owned());
    }

    fn write_ser_inp(&mut self) {
        self.output_lines.push(self.ser_inp_str.clone());
    }

    fn write_ch_prefix(&self) -> String {
        format!("{}:", self.current_ch)
    }

    fn param_mul_1000(&mut self) {
        self.param *= 1000.0;
    }

    fn param_div_1000(&mut self) {
        self.param /= 1000.0;
    }

    fn get_voltage(&mut self, on_time: bool) {
        self.param = if on_time {
            self.voltage_on
        } else {
            self.voltage_off
        };
    }

    fn get_current(&mut self, on_time: bool) {
        self.param = if on_time {
            self.current_on
        } else {
            self.current_off
        };
    }

    fn get_adc10(&self, _channel: u8) -> u16 {
        0
    }

    fn disable_ints(&mut self) {}

    fn enable_ints(&mut self) {}

    fn werte_on_lcd(&mut self) {}

    fn init_scales(&mut self) {}

    fn mdelay(&mut self, _ms: u16) {}

    fn check_limits(&mut self) {}

    fn set_level_dac_r(&mut self) {}

    fn set_level_dac_i(&mut self) {}

    fn set_level_dac_p(&mut self) {}

    fn set_systimer(&mut self, value: u8) {
        self.activity_timer = value;
    }

    fn parse_i32(&self, text: &str) -> Option<i32> {
        text.trim().parse().ok()
    }

    fn parse_f64(&self, text: &str) -> Option<f64> {
        text.trim().parse().ok()
    }

    fn hex_to_u8(&self, text: &str) -> Option<u8> {
        u8::from_str_radix(text.trim(), 16).ok()
    }

    fn mode_to_i32(&self) -> i32 {
        match self.mode_select {
            Mode::OutputOff => 0,
            Mode::RhiVolt => 1,
            Mode::RloVolt => 2,
            Mode::IhiVolt => 3,
            Mode::IloVolt => 4,
            Mode::PhiVolt => 5,
            Mode::PloVolt => 6,
            Mode::Unknown(value) => i32::from(value),
        }
    }

    fn modify_to_i32(&self) -> i32 {
        match self.modify {
            Modify::Normal => 0,
            Modify::Unknown(value) => i32::from(value),
        }
    }
}
