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
    IhiVolt,
    IloVolt,
    RhiVolt,
    RloVolt,
    PhiVolt,
    PloVolt,
    Unknown(u8),
}

impl From<u8> for Mode {
    fn from(value: u8) -> Self {
        match value {
            0 => Self::OutputOff,
            1 => Self::IhiVolt,
            2 => Self::IloVolt,
            3 => Self::RhiVolt,
            4 => Self::RloVolt,
            5 => Self::PhiVolt,
            6 => Self::PloVolt,
            other => Self::Unknown(other),
        }
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Modify {
    LowerMainMenu,
    UpperMainMenu,
    ModeMenu,
    TOn,
    TOff,
    IOff,
    TempMenu,
    RiMenu,
    CapMenu,
    PwrCurMenu,
    Unknown(u8),
}

impl From<u8> for Modify {
    fn from(value: u8) -> Self {
        match value {
            0 => Self::LowerMainMenu,
            1 => Self::UpperMainMenu,
            2 => Self::ModeMenu,
            3 => Self::TOn,
            4 => Self::TOff,
            5 => Self::IOff,
            6 => Self::TempMenu,
            7 => Self::RiMenu,
            8 => Self::CapMenu,
            9 => Self::PwrCurMenu,
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
const SHUNT_D: u8 = 3;
const DEFAULT_DAC_MAX: u16 = 4095;
const DEFAULT_CMD_STR_ARR: [&str; 31] = [
    "STR", "IDN", "CHN", "VAL", "ENA", "DCA", "DCP", "DCV", "DCR", "MAH", "MWH", "MSV", "MSA",
    "RNG", "MSW", "PCA", "RON", "ROF", "RIP", "RAW", "DSP", "ALL", "OFS", "SCL", "OPT", "TMP",
    "TRM", "WEN", "ERC", "SBD", "NOP",
];
const DEFAULT_CMD2_SUB_CH_ARR: [u8; 31] = [
    255, 254, 253, 0, 0, 1, 3, 4, 5, 7, 8, 10, 11, 19, 18, 21, 27, 28, 29, 50, 80, 99, 100, 200,
    150, 233, 240, 250, 251, 252, 0,
];
const DEFAULT_OPTION_ARRAY: [f64; OPTION_ARRAY_LEN] = [
    0.0, 0.02, 2.5, 10.0, 10.0, 2.5, 50.0, 100.0, 10.0, 1.0, 0.1, 0.002, 0.020, 0.200, 2.0, 25.0,
    6.1, 4.0, 0.0, 10.0, 0.0, 50.0,
];
const OPT_GAIN_I: usize = 4;
const OPT_U_REF: usize = 5;
const OPT_PMAX: usize = 6;
const OPT_RSENSE_BASE: usize = 7;
const OPT_IMAX_BASE: usize = 11;
const OPT_UMAX_HI: usize = 15;
const OPT_UMAX_LO: usize = 16;
const OPT_INIT_OPTIONS: usize = 17;
const ADC10_COUNT: usize = 6;
const ADC_MAX_10: f64 = 1023.0;
const ADC_MAX_16: f64 = 65535.0;

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
    pub check_limit_err: PromptCode,
    pub output_enable: bool,
    pub mpxena: bool,
    pub mode_mpx: bool,
    pub low_volt: bool,
    pub no_toggle: bool,
    pub shunt_select: u8,
    pub old_shunt_select: u8,
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
    pub adc10: [u16; ADC10_COUNT],
    pub daci_offsets: [i32; DACI_COUNT],
    pub adcu_offsets: [i32; ADCU_COUNT],
    pub adci_offsets: [i32; ADCI_COUNT],
    pub option_array: [f64; OPTION_ARRAY_LEN],
    pub daci_scales: [f64; DACI_COUNT],
    pub dac_lsb_i: [f64; DACI_COUNT],
    pub dac_lsb_r: [f64; DACI_COUNT],
    pub dac_max: u16,
    pub dc_ohm_min: f64,
    pub dc_ohm_max: f64,
    pub divider_u: f64,
    pub adc16_u_scale_low: f64,
    pub adc16_u_scale_high: f64,
    pub adc16_lsb_i: [f64; ADCI_COUNT],
    pub adc10_lsb_i: [f64; ADCI_COUNT],
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
    pub display_refresh_count: u32,
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
            check_limit_err: PromptCode::NoErr,
            output_enable: false,
            mpxena: false,
            mode_mpx: false,
            low_volt: false,
            no_toggle: false,
            shunt_select: 0,
            old_shunt_select: 0,
            shunt_range: 0,
            mode_select: Mode::OutputOff,
            modify: Modify::LowerMainMenu,
            dc_amp: 0.0,
            dc_watt: 0.0,
            dc_volt: 0.0,
            dc_ohm: 0.0,
            dc_amp_mod: 1.0,
            ah: 0.0,
            wh: 0.0,
            ptot: 0.0,
            voltage_on: 0.0,
            current_on: 0.0,
            voltage_off: 0.0,
            current_off: 0.0,
            pw_on_time: 10,
            pw_off_time: 0,
            i_percent: 0,
            ad16_temp_u_on: 0,
            ad16_temp_i_on: 0,
            dac_temp_on: 0,
            dac_temp_off: 0,
            dac_temp: 0,
            adc10: [0; ADC10_COUNT],
            daci_offsets: [0; DACI_COUNT],
            adcu_offsets: [0; ADCU_COUNT],
            adci_offsets: [0; ADCI_COUNT],
            option_array: DEFAULT_OPTION_ARRAY,
            daci_scales: [1.0; DACI_COUNT],
            dac_lsb_i: [1.0; DACI_COUNT],
            dac_lsb_r: [1.0; DACI_COUNT],
            dac_max: DEFAULT_DAC_MAX,
            dc_ohm_min: DEFAULT_OPTION_ARRAY[OPT_RSENSE_BASE + 3]
                * DEFAULT_OPTION_ARRAY[OPT_GAIN_I]
                * 1.1,
            dc_ohm_max: DEFAULT_OPTION_ARRAY[OPT_RSENSE_BASE]
                * DEFAULT_OPTION_ARRAY[OPT_GAIN_I]
                * 100.0,
            divider_u: 1.0,
            adc16_u_scale_low: 1.0,
            adc16_u_scale_high: 1.0,
            adc16_lsb_i: [0.0; ADCI_COUNT],
            adc10_lsb_i: [0.0; ADCI_COUNT],
            adci_scales: [1.0; ADCI_COUNT],
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
            display_refresh_count: 0,
            cmd_str_arr: DEFAULT_CMD_STR_ARR.to_vec(),
            cmd2_sub_ch_arr: DEFAULT_CMD2_SUB_CH_ARR.to_vec(),
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
                // mcb extension: expose the computed power value directly in watts.
                self.param = self.dc_watt;
                self.nachkomma = 2;
                self.write_param_ser();
            }
            4 => {
                // mcb extension: report the configured low-voltage cutoff threshold.
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
                // mcb extension: accumulated discharge capacity in Ah.
                self.param = self.ah;
                self.write_param_ser();
            }
            8 => {
                // mcb extension: accumulated discharge energy in Wh.
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
                // ALL request: return the four live measurement channels as a burst.
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
                // Serial test hook: echo the raw input line back unchanged.
                self.output_lines.push(self.ser_inp_str.clone());
            }
            254 => {
                // Version/value request uses the normal channel prefix before the banner string.
                let prefix = self.write_ch_prefix();
                self.output_lines
                    .push(format!("{prefix}{}", self.vers1_str));
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
            // Writes are rejected while the load is in a protected busy phase.
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
                // mcb extension: set the constant-power target in watts.
                self.dc_watt = self.param;
            }
            4 => {
                // mcb extension: arming a low-voltage threshold also forces the output on.
                self.low_volt = false;
                self.output_enable = true;
                self.dc_volt = self.param;
            }
            5 => {
                self.dc_ohm = self.param;
            }
            7 | 8 => {
                // mcb extension: writing either counter clears both accumulated totals.
                self.ah = 0.0;
                self.wh = 0.0;
            }
            9 => {
                // 4..255 selects autoranging in the original firmware.
                self.shunt_range = self.param_int as u8;
            }
            19 => {
                // Changing mode can force an immediate shutdown; enabling happens later in SetDAC.
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
                // Raw DAC debug writes must not trigger any additional output switching.
                return;
            }
            71 => {
                self.disable_ints();
                self.dac_temp_off = self.param_int as u16;
                self.enable_ints();
                if self.verbose {
                    self.serprompt(PromptCode::NoErr);
                }
                // Raw DAC debug writes must not trigger any additional output switching.
                return;
            }
            80 => {
                self.modify = Modify::from(self.param_byte);
                self.werte_on_lcd();
            }
            89 | 100..=115 | 200..=223 => {
                if !self.ee_unlocked {
                    // Calibration and EEPROM-backed parameters stay locked until sub-channel 250.
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

                // Mirror the firmware's short settle time after recalculating scales.
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
                // Baud-rate EEPROM changes only take effect after the next reset.
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
            // CheckLimitErr is a Pascal variable holding NoErr or ParamErr after clamping.
            self.serprompt(self.check_limit_err);
        }

        // mcb modes select which control loop has to refresh the DAC target after a write.
        match self.mode_select {
            Mode::RhiVolt | Mode::RloVolt => self.set_level_dac_r(),
            Mode::IhiVolt | Mode::IloVolt => self.set_level_dac_i(),
            Mode::PhiVolt | Mode::PloVolt => self.set_level_dac_p(),
            Mode::OutputOff | Mode::Unknown(_) => {}
        }
    }

    pub fn cmd_to_index(&mut self) -> CmdWhich {
        // Command keywords are matched case-insensitively against the static command table.
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
            // The Pascal parser explicitly skips leading blanks before every token.
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
                // Parameters accept digits plus the wildcard/ASCII punctuation span used by the firmware.
                (b'*'..=b'9').contains(&byte)
            } else {
                // Commands consume letters until a digit or separator terminates the token.
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
        // '=' means a setter, otherwise the frame is treated as a read/query.
        let first = self.ser_inp_str.as_bytes()[0];
        let is_omni = first == b'*';
        let is_result = first == b'#';

        if is_result {
            // Result frames are forwarded unchanged instead of being parsed again.
            self.write_ser_inp();
            return self.output_lines.clone();
        }

        self.ser_inp_ptr = 0;

        if has_main_ch {
            let _is_param = self.parse_extract();
            self.ser_inp_ptr = self.ser_inp_ptr.saturating_add(1);

            if is_omni {
                // Omni commands are echoed onward before local handling.
                self.write_ser_inp();
            } else if let Some(channel) = self.parse_i32(&self.param_str) {
                self.current_ch = channel;
            }
        }

        if !is_omni && self.current_ch != self.slave_ch && has_main_ch {
            // Addressed traffic for another slave is passed through untouched.
            self.write_ser_inp();
            return self.output_lines.clone();
        }

        // '!' or '?' requests the verbose response style used by the original protocol.
        self.verbose = self.ser_inp_str.contains('!') || self.ser_inp_str.contains('?');

        if let Some(check_pos) = self.ser_inp_str.find('$') {
            // XOR checksum covers everything before '$'; the '$xx' trailer is not included.
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
                // Reject the frame immediately on checksum mismatch.
                self.serprompt(PromptCode::CheckSumErr);
                return self.output_lines.clone();
            }
        }

        self.set_systimer(255);
        self.led_activity = false;
        // Any valid local frame refreshes the activity timer and clears the LED.

        let mut used_command = false;
        let sub_ch_offset = if self.parse_extract() {
            // Numeric first token means direct sub-channel addressing.
            0_i32
        } else {
            // Otherwise parse a textual command and translate it through the command table.
            used_command = true;
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
            // Commands carry a second token that selects the concrete sub-channel.
            i32::from(offset)
        };

        let sub_ch_base = if used_command && self.param_str.is_empty() {
            0
        } else {
            let Some(value) = self.parse_i32(&self.param_str) else {
                self.serprompt(PromptCode::ParamErr);
                return self.output_lines.clone();
            };
            value
        };

        self.sub_ch = sub_ch_base + sub_ch_offset;
        // Command aliases are normalized into the same absolute sub-channel space.

        if is_request {
            // Request path only resolves the current value; no payload parsing follows.
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

        // Setter path keeps the Pascal convention of exposing float, int, and byte views together.
        self.param = value;
        self.param_int = value as i32;
        self.param_byte = self.param_int as u8;
        self.parse_set_param();

        self.output_lines.clone()
    }

    fn write_param_ser(&mut self) {
        self.output_lines.push(format!(
            "{}={:.*}",
            self.sub_ch, self.nachkomma as usize, self.param
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

    fn get_adc10(&self, channel: u8) -> u16 {
        self.adc10.get(usize::from(channel)).copied().unwrap_or(0)
    }

    fn disable_ints(&mut self) {}

    fn enable_ints(&mut self) {}

    fn werte_on_lcd(&mut self) {
        self.display_refresh_count = self.display_refresh_count.saturating_add(1);
    }

    fn init_scales(&mut self) {
        let gain_i = self.option_array[OPT_GAIN_I];
        let u_ref = self.option_array[OPT_U_REF];
        let dac_type = (self.option_array[OPT_INIT_OPTIONS] as u8) & 0b0000_0011;
        let dac_max = if dac_type == 3 {
            65_535
        } else {
            DEFAULT_DAC_MAX
        };
        let dac_max_float = f64::from(dac_max);

        self.dac_max = dac_max;

        for index in 0..DACI_COUNT {
            let r_sense = self.option_array[OPT_RSENSE_BASE + index];

            self.dac_lsb_i[index] =
                (u_ref / r_sense) / (dac_max_float * self.daci_scales[index] * gain_i);

            // The EDL firmware intentionally uses the current DAC scale here; the DACR EEPROM
            // values were not reliable in the Pascal implementation.
            self.dac_lsb_r[index] = gain_i * r_sense * dac_max_float * self.daci_scales[index];
            self.adc16_lsb_i[index] =
                (self.adci_scales[index] * u_ref / r_sense) / ADC_MAX_16 / gain_i;
            self.adc10_lsb_i[index] =
                (self.adci_scales[index] * u_ref / r_sense) / ADC_MAX_10 / gain_i;
        }

        self.dc_ohm_min = self.option_array[OPT_RSENSE_BASE + 3] * self.divider_u * gain_i * 1.1;
        self.dc_ohm_max = self.option_array[OPT_RSENSE_BASE] * self.divider_u * gain_i * 100.0;
    }

    fn mdelay(&mut self, _ms: u16) {}

    fn check_limits(&mut self) {
        self.check_limit_err = PromptCode::NoErr;
        self.no_toggle = false;

        if self.dc_ohm < self.dc_ohm_min {
            self.dc_ohm = self.dc_ohm_min;
            self.check_limit_err = PromptCode::ParamErr;
        }

        if self.dc_ohm > self.dc_ohm_max {
            self.dc_ohm = self.dc_ohm_max;
            self.check_limit_err = PromptCode::ParamErr;
        }

        if self.dc_amp < 0.0 {
            self.dc_amp = 0.0;
            self.check_limit_err = PromptCode::ParamErr;
        }

        if self.dc_amp > self.imax() {
            self.dc_amp = self.imax();
            self.check_limit_err = PromptCode::ParamErr;
        }

        if self.i_percent < 0 {
            self.i_percent = 0;
            self.check_limit_err = PromptCode::ParamErr;
        }

        if self.i_percent >= 100 {
            self.no_toggle = true;
            self.i_percent = 100;
            self.check_limit_err = PromptCode::ParamErr;
        }

        if self.pw_on_time < 1 {
            self.pw_on_time = 1;
            self.check_limit_err = PromptCode::ParamErr;
        }

        if self.pw_off_time < 0 {
            self.pw_off_time = 0;
            self.check_limit_err = PromptCode::ParamErr;
        }

        if self.pw_off_time == 0 {
            self.no_toggle = true;
        }

        if matches!(self.mode_select, Mode::Unknown(value) if value >= 128) {
            self.mode_select = Mode::OutputOff;
            self.check_limit_err = PromptCode::ParamErr;
        }

        if matches!(self.mode_select, Mode::Unknown(_)) {
            self.mode_select = Mode::PloVolt;
            self.check_limit_err = PromptCode::ParamErr;
        }

        if self.dc_watt > self.pmax() {
            self.dc_watt = self.pmax();
        }

        if self.dc_watt < 0.0 {
            self.dc_watt = 0.0;
            self.check_limit_err = PromptCode::ParamErr;
        }

        let voltage_limit = self.active_voltage_limit();
        if self.dc_volt > voltage_limit {
            self.dc_volt = voltage_limit;
        }

        if self.dc_volt < 0.0 {
            self.dc_volt = 0.0;
            self.check_limit_err = PromptCode::ParamErr;
        }

        if matches!(self.mode_select, Mode::RhiVolt | Mode::RloVolt) {
            self.no_toggle = true;
        }
    }

    fn set_level_dac_r(&mut self) {
        self.init_scales();
        self.shunt_select = self.calc_range_r();
        self.old_shunt_select = self.shunt_select;

        let index = self.shunt_select as usize;
        self.dac_temp_on = self.quantize_dac(
            (self.divider_u * self.dac_lsb_r[index]) / self.dc_ohm,
            self.daci_offsets[index],
        );
        self.dac_temp_off = self.dac_temp_on;
        self.mode_mpx = false;
        self.update_mpxena();
    }

    fn set_level_dac_i(&mut self) {
        self.init_scales();
        let mut shunt = self.calc_range_i();
        if self.shunt_range <= SHUNT_D && self.shunt_range >= shunt {
            shunt = self.shunt_range;
        }
        self.shunt_select = shunt;
        self.old_shunt_select = self.shunt_select;

        let index = self.shunt_select as usize;
        self.dac_temp_on = self.quantize_dac(
            (self.dc_amp * self.dc_amp_mod) / self.dac_lsb_i[index],
            self.daci_offsets[index],
        );

        let percent = f64::from(self.i_percent) / 100.0;
        self.dac_temp_off = self.quantize_dac(
            (self.dc_amp * self.dc_amp_mod * percent) / self.dac_lsb_i[index],
            self.daci_offsets[index],
        );
        self.mode_mpx = true;
        self.update_mpxena();
    }

    fn set_level_dac_p(&mut self) {
        self.get_voltage(true);
        if self.param > 0.0 {
            self.dc_amp = self.dc_watt / self.param;
        }
        self.set_level_dac_i();
    }

    fn calc_range_i(&self) -> u8 {
        let mut shunt = 0_u8;
        for index in 0..DACI_COUNT {
            if self.dc_amp > self.option_array[OPT_IMAX_BASE + index] {
                shunt = shunt.saturating_add(1).min(SHUNT_D);
            }
        }
        shunt
    }

    fn calc_range_r(&self) -> u8 {
        for index in 0..DACI_COUNT {
            let threshold = self.option_array[OPT_RSENSE_BASE + index] * self.divider_u;
            if self.dc_ohm >= threshold {
                return index as u8;
            }
        }
        SHUNT_D
    }

    fn quantize_dac(&self, raw: f64, offset: i32) -> u16 {
        let value = (raw + 0.5) as i32 + offset;
        value.clamp(0, i32::from(self.dac_max)) as u16
    }

    fn update_mpxena(&mut self) {
        self.mpxena = if self.mode_select == Mode::OutputOff {
            false
        } else {
            self.output_enable
        };
    }

    fn imax(&self) -> f64 {
        self.option_array[OPT_IMAX_BASE + 3]
    }

    fn pmax(&self) -> f64 {
        self.option_array[OPT_PMAX]
    }

    fn active_voltage_limit(&self) -> f64 {
        match self.mode_select {
            Mode::IhiVolt | Mode::RhiVolt | Mode::PhiVolt => self.option_array[OPT_UMAX_HI],
            Mode::OutputOff | Mode::IloVolt | Mode::RloVolt | Mode::PloVolt | Mode::Unknown(_) => {
                self.option_array[OPT_UMAX_LO]
            }
        }
    }

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
            Mode::IhiVolt => 1,
            Mode::IloVolt => 2,
            Mode::RhiVolt => 3,
            Mode::RloVolt => 4,
            Mode::PhiVolt => 5,
            Mode::PloVolt => 6,
            Mode::Unknown(value) => i32::from(value),
        }
    }

    fn modify_to_i32(&self) -> i32 {
        match self.modify {
            Modify::LowerMainMenu => 0,
            Modify::UpperMainMenu => 1,
            Modify::ModeMenu => 2,
            Modify::TOn => 3,
            Modify::TOff => 4,
            Modify::IOff => 5,
            Modify::TempMenu => 6,
            Modify::RiMenu => 7,
            Modify::CapMenu => 8,
            Modify::PwrCurMenu => 9,
            Modify::Unknown(value) => i32::from(value),
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn default_command_table_accepts_pascal_text_setter_syntax() {
        let mut parser = EdlParser {
            ser_inp_str: "DCA 0=1.25".to_owned(),
            slave_ch: 0,
            ..EdlParser::default()
        };

        let output = parser.parse_sub_ch();

        assert!(output.is_empty());
        assert_eq!(parser.sub_ch, 1);
        assert_eq!(parser.dc_amp, 1.25);
    }

    #[test]
    fn val_command_uses_pascal_offset_and_gets_same_channel_as_short_form() {
        let mut parser = EdlParser {
            ser_inp_str: "VAL 5?".to_owned(),
            dc_ohm: 123.4,
            slave_ch: 0,
            ..EdlParser::default()
        };

        let output = parser.parse_sub_ch();

        assert_eq!(parser.sub_ch, 5);
        assert_eq!(output, vec!["5=123.4"]);
    }

    #[test]
    fn zero_parameter_text_command_uses_command_offset_as_sub_channel() {
        let mut parser = EdlParser {
            ser_inp_str: "IDN?".to_owned(),
            vers1_str: "EDL test".to_owned(),
            slave_ch: 0,
            ..EdlParser::default()
        };

        let output = parser.parse_sub_ch();

        assert_eq!(parser.sub_ch, 254);
        assert_eq!(output, vec!["0:EDL test"]);
    }

    #[test]
    fn setters_enforce_pascal_limits_and_report_actual_limit_error_when_verbose() {
        let mut parser = EdlParser {
            ser_inp_str: "DCA 0=5!".to_owned(),
            slave_ch: 0,
            ..EdlParser::default()
        };

        let output = parser.parse_sub_ch();

        assert_eq!(parser.dc_amp, 2.0);
        assert_eq!(parser.check_limit_err, PromptCode::ParamErr);
        assert_eq!(output, vec!["ParamErr"]);
    }

    #[test]
    fn mode_numbers_match_pascal_and_drive_the_selected_dac_path() {
        let mut parser = EdlParser {
            ser_inp_str: "RNG 0=1".to_owned(),
            dc_amp: 1.0,
            dac_lsb_i: [0.5; DACI_COUNT],
            slave_ch: 0,
            ..EdlParser::default()
        };

        parser.parse_sub_ch();

        assert_eq!(parser.mode_select, Mode::IhiVolt);
        assert!(parser.mode_mpx);
        assert!(parser.output_enable);
        assert!(parser.mpxena);
        assert_eq!(parser.dac_temp_on, 1638);
    }

    #[test]
    fn power_mode_setpoint_recomputes_current_and_current_dac() {
        let mut parser = EdlParser {
            ser_inp_str: "DCP 0=4".to_owned(),
            mode_select: Mode::PhiVolt,
            voltage_on: 2.0,
            dac_lsb_i: [0.5; DACI_COUNT],
            slave_ch: 0,
            ..EdlParser::default()
        };

        parser.parse_sub_ch();

        assert_eq!(parser.dc_watt, 4.0);
        assert_eq!(parser.dc_amp, 2.0);
        assert!(parser.mode_mpx);
        assert_eq!(parser.dac_temp_on, 3276);
    }

    #[test]
    fn raw_adc10_reads_return_backing_samples() {
        let mut parser = EdlParser {
            ser_inp_str: "52?".to_owned(),
            adc10: [0, 0, 0, 777, 888, 0],
            slave_ch: 0,
            ..EdlParser::default()
        };

        let output = parser.parse_sub_ch();

        assert_eq!(output, vec!["52=777"]);

        parser.ser_inp_str = "53?".to_owned();
        let output = parser.parse_sub_ch();

        assert_eq!(output, vec!["53=888"]);
    }

    #[test]
    fn modify_writes_refresh_display_state_and_preserve_menu_value() {
        let mut parser = EdlParser {
            ser_inp_str: "DSP 0=8".to_owned(),
            slave_ch: 0,
            ..EdlParser::default()
        };

        parser.parse_sub_ch();

        assert_eq!(parser.modify, Modify::CapMenu);
        assert_eq!(parser.display_refresh_count, 1);

        parser.ser_inp_str = "DSP 0?".to_owned();
        let output = parser.parse_sub_ch();

        assert_eq!(output, vec!["80=8"]);
    }

    #[test]
    fn unlocked_calibration_and_option_writes_recalculate_scales() {
        let mut parser = EdlParser {
            ser_inp_str: "OPT 4=20".to_owned(),
            ee_unlocked: true,
            slave_ch: 0,
            ..EdlParser::default()
        };

        parser.init_scales();
        let initial_lsb = parser.dac_lsb_i[0];
        let initial_ohm_max = parser.dc_ohm_max;

        parser.parse_sub_ch();

        assert_eq!(parser.option_array[OPT_GAIN_I], 20.0);
        assert_eq!(parser.dac_lsb_i[0], initial_lsb / 2.0);
        assert_eq!(parser.dc_ohm_max, initial_ohm_max * 2.0);
        assert!(!parser.ee_unlocked);

        parser.ser_inp_str = "SCL 2=2".to_owned();
        parser.ee_unlocked = true;
        parser.parse_sub_ch();

        assert_eq!(parser.daci_scales[0], 2.0);
        assert_eq!(parser.dac_lsb_i[0], initial_lsb / 4.0);
    }
}
