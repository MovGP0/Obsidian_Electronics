#![allow(dead_code)]

use std::fmt::Write as _;

/*
DDS-Funktionsgenerator mit AD98833
AD9833-DDS an PortB, Pegeleinstellung
in 2-mV-Schritten per AD7541 ueber 4094 SR, Ausgangspegel mit Offset
(c) by c't magazin und Carsten Meyer, cm@ctmagazin.de

29.08.2007 #0.10 SQG-Version, nur Rechteck bis 10 MHz
09.08.2007 #3.62 ERC und SBD eingefuehrt
23.07.2007 #3.60 RxD-Abfrage geaendert in Timeout-Befehl -- mega32 hat kein FIFO
                 Busy-Flag wird bei Bedienung gesetzt, Befehle dann mit Busy-Meldung,
                 Abfragen weiterhin moeglich. Systick=10ms, Timer aufgeraeumt wg. kuerzerem IRQ.
                 Optionale XOR-Pruefsumme eingefuehrt, mit "$XX" dem Befehl hintangestellt,
                 wird berechnet ueber gesamten Befehl, Praefix-"$" zaehlt nicht mehr mit
20.07.2007 #3.53 DSP-Parameter fuer Panel,
                 Parser geaendert: Request wenn kein "=", ausf. Response nur mit "?" oder "!"
                 Einstellung der Aussgangsstufen-Verstaerkung und Abschwaech-Faktor
                 passiver Abschwaecher einstellbar ueber SCL-Parameter, automatische Anpassung
                 der Umschaltpunkte und der Anzeige
26.06.2007 #3.483 Parameter umgestellt fuer Peak-DACLevel, Overload-Flag fuer Input
06.06.2007 #3.48 Inkrementalgeber-Routinen aufgeraeumt
06.06.2007 #3.38 angepasst an ATmega32, andere Ports
27.03.2007 #3.28 Status-Codes eingefuehrt, Uebermittlung der Bedienelemente
19.03.2007 #3.27 Parser-Syntax #!?, Error-Codes, ALL-Request
25.02.2007 #3.20 Parser zweigeteilt, mit Zeitschleifen-Check fuer SerInp
23.01.2007 #3.10 per Define auf neue Platine (zwei 4094 SR) angepasst
11.02.2007 wg. Platzbedarf LongInt fuer Frequenz und DACLevel eingefuehrt
15.01.2007 neuer Standard-Parser wie bei DCG und DIV
14.10.2006 Uebernahme aus MP3source Labor, steuert MP3-Spieler
           Yampp Industrial III von Jesper Hansen, www.jelu.se

This is a best-effort structural Rust port of DDS-SQG.pas. The original
firmware uses AVR/Pascal-specific libraries and inline assembly; those parts are
represented here via a hardware abstraction trait and explicit stubs.
*/

const SYS_TICK_MS: u8 = 10;

// Wave selector values from the original firmware: off, sine, triangle/saw,
// square, logic-level square, or external source routing.
const C_OFF: u8 = 0;
const C_SINW: u8 = 1;
const C_TRIW: u8 = 2;
const C_SQUW: u8 = 3;
const C_LOGIC: u8 = 4;
const C_EXT: u8 = 5;

// AD9833-DDS command words.
const C_DDS_RESET_CMD: u16 = 0b0010_0001_0000_0000;
const C_DDS_SINE_CMD: u16 = 0b0010_0000_0000_0000;
const C_DDS_TRIANGLE_CMD: u16 = 0b0010_0000_0000_0010;
const C_DDS_SQUARE_CMD: u16 = 0b0010_0000_0010_1000;
const DDS_FREQ_REG_CMD: u16 = 0b0100_0000_0000_0000;

// Relay bits for the Platine2SR SQG board.
const SQUARE_SW_BIT: u8 = 4;
const ATTN_SW_BIT: u8 = 5;
const EXT_ON_BIT: u8 = 6;
const OFFS_SW_BIT: u8 = 7;

const USER_SRQ_RELEASED: u8 = 64;
const USER_SRQ_LEFT: u8 = 65;
const USER_SRQ_RIGHT: u8 = 66;
const USER_SRQ_PANEL_ACTIVE: u8 = 67;

const ERR_SUB_CH: u8 = 255;
const VERS1_STR: &str = "0.10 [SQG by CM/c't 03/2007]";
const VERS3_STR: &str = "SQG 0.10";
const EEPROM_EMPTY_STR: &str = "EEPROM EMPTY! ";
const ADR_STR: &str = "Adr ";
const FREQU_STR: &str = "Frequ Hz";
const LEVEL_STR: &str = "Level ";
const RMS_INPUT_STR: &str = "Input ";
const WAVE_STR: &str = "Function";
const BURST_STR: &str = "Burst ms";
const EEPROM_INITIALIZED: u16 = 0xAA55;

// Frequency decade weights for the AD9833 tuning-word calculation at a 20 MHz
// reference clock. The Pascal code builds the DDS word digit by digit.
const FHZ: [f64; 9] = [
    134_217_728.0,
    13_421_772.8,
    1_342_177.28,
    134_217.728,
    13_421.7728,
    1_342.17728,
    134.217728,
    13.4217728,
    1.34217728,
];

const ERR_STR_ARR: [&str; 8] = [
    "[OK]", "[SRQUSR]", "[BUSY]", "[OVERLD]", "[CMDERR]", "[PARERR]", "[LOCKED]", "[CHKSUM]",
];

const WAVE_SEL_STR_ARR: [&str; 6] = ["Off", "Sin", "Tri", "Squ", "Lgc", "Ext"];

const CMD_TABLE: [(&str, u8, CmdWhich); 19] = [
    ("STR", 255, CmdWhich::Str),
    ("IDN", 254, CmdWhich::Idn),
    ("TRG", 249, CmdWhich::Trg),
    ("VAL", 0, CmdWhich::Val),
    ("FRQ", 0, CmdWhich::Frq),
    ("LVL", 1, CmdWhich::Lvl),
    ("LVP", 2, CmdWhich::Lvp),
    ("DBU", 3, CmdWhich::Dbv),
    ("WAV", 4, CmdWhich::Wav),
    ("BST", 5, CmdWhich::Bst),
    ("INL", 10, CmdWhich::Inl),
    ("RNG", 19, CmdWhich::Rng),
    ("DCO", 20, CmdWhich::Ofs),
    ("DSP", 80, CmdWhich::Dsp),
    ("ALL", 99, CmdWhich::All),
    ("SCL", 200, CmdWhich::Scl),
    ("WEN", 250, CmdWhich::Wen),
    ("ERC", 251, CmdWhich::Erc),
    ("SBD", 252, CmdWhich::Sbd),
];

const TERZ_ARRAY: [i32; 32] = [
    10,
    20,
    50,
    100,
    200,
    500,
    1_000,
    2_000,
    5_000,
    10_000,
    20_000,
    50_000,
    100_000,
    200_000,
    500_000,
    1_000_000,
    2_000_000,
    5_000_000,
    10_000_000,
    20_000_000,
    50_000_000,
    80_000_000,
    100_000_000,
    18_432_000,
    24_576_000,
    35_795_450,
    41_943_040,
    44_336_817,
    49_152_000,
    65_536_000,
    73_728_000,
    0,
];

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
enum CmdWhich {
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
    Inl,
    Rng,
    Ofs,
    Dsp,
    All,
    Scl,
    Wen,
    Erc,
    Sbd,
    Nop,
    Err,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
enum Modify {
    WaveSel,
    FreqSel,
    AmplSel,
    BurstSel,
    DcSel,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
enum PanelButton {
    Enter,
    Left,
    Right,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
enum PanelEvent {
    None,
    Encoder(i32),
    Button(PanelButton),
    IncrTimerExpired,
    DisplayTimerExpired,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
enum ErrorCode {
    NoErr,
    UserReq,
    BusyErr,
    OvlErr,
    SyntaxErr,
    ParamErr,
    LockedErr,
    ChecksumErr,
}

impl ErrorCode {
    fn code(self) -> u8 {
        self as u8
    }
}

#[derive(Debug, Clone)]
struct EepromDefaults {
    ee_initialized: u16,
    init_frequenz: i32,
    init_level: f64,
    init_burst: u8,
    init_wave: u8,
    init_pwr_gain: f64,
    init_attn_fac: f64,
    init_inc_rast: i32,
    init_terz_num: u8,
    level_scale_low: f64,
    level_scale_hi: f64,
    ee_ser_baud_reg: u8,
}

impl Default for EepromDefaults {
    fn default() -> Self {
        Self {
            ee_initialized: EEPROM_INITIALIZED,
            init_frequenz: 10_000,
            init_level: 5_000.0,
            init_burst: 0,
            // SQG powers up in square-wave mode unless EEPROM overrides it.
            init_wave: C_SQUW,
            init_pwr_gain: 2.0,
            init_attn_fac: 40.0,
            init_inc_rast: 4,
            init_terz_num: 9,
            level_scale_low: 1.0,
            level_scale_hi: 1.0,
            ee_ser_baud_reg: 51,
        }
    }
}

#[derive(Debug, Default, Clone, Copy, PartialEq, Eq)]
struct StatusFlags {
    busy: bool,
    user_srq: bool,
    overload: bool,
    ee_unlocked: bool,
}

impl StatusFlags {
    fn to_status_byte(self) -> u8 {
        // Original wire format: bit 7 = Busy, 6 = User SRQ, 5 = Overload,
        // 4 = EEPROM unlocked. The low nibble is the current error code.
        ((self.busy as u8) << 7)
            | ((self.user_srq as u8) << 6)
            | ((self.overload as u8) << 5)
            | ((self.ee_unlocked as u8) << 4)
    }
}
#[derive(Debug, Clone)]
struct FirmwareState {
    // EEPROM-backed defaults / runtime parameters.
    defaults: EepromDefaults,
    slave_ch: u8,
    current_ch: u8,
    sub_ch: u8,
    frequenz: i32, // 1/10 Hz, 10000 = 1000.0 Hz
    terz_num: u8,
    dac_level: f64,
    offset_mv: i32,
    wave: u8,
    burst_mode: u8,
    inc_rast: i32,
    attn_switch_point: f64,
    attn_fac: f64,
    pwr_gain: f64,
    level_scale_low: f64,
    level_scale_hi: f64,

    // Control state.
    dss_cmd: u16,
    wave_cmd: u16,
    dds_frequ: i32,
    switch_state: u8,
    level_range: bool,
    incr_fine: bool,
    incr_diff: i32,
    burst_count: u8,
    verbose: bool,
    changed_flag: bool,
    lcd_present: bool,
    modify: Modify,
    first_turn: bool,
    status: StatusFlags,
    err_count: i32,
    err_flag: bool,

    // Parser scratch values.
    param: f64,
    param_int: i32,
    param_byte: u8,
    param_long: i32,
    digits: usize,
    nachkomma: usize,
    param_str: String,
    ser_inp_str: String,
}

impl Default for FirmwareState {
    fn default() -> Self {
        let defaults = EepromDefaults::default();
        Self {
            defaults: defaults.clone(),
            slave_ch: 0,
            current_ch: 255,
            sub_ch: 254,
            frequenz: defaults.init_frequenz,
            terz_num: 9,
            dac_level: defaults.init_level,
            offset_mv: 0,
            wave: defaults.init_wave,
            burst_mode: defaults.init_burst,
            inc_rast: defaults.init_inc_rast,
            attn_switch_point: 1001.0,
            attn_fac: 40.0,
            pwr_gain: 2.0,
            level_scale_low: 1.0,
            level_scale_hi: 1.0,
            dss_cmd: 0,
            wave_cmd: C_DDS_SQUARE_CMD,
            dds_frequ: 0,
            switch_state: 0,
            level_range: false,
            incr_fine: false,
            incr_diff: 0,
            burst_count: 1,
            verbose: false,
            changed_flag: true,
            lcd_present: false,
            modify: Modify::FreqSel,
            first_turn: true,
            status: StatusFlags::default(),
            err_count: 0,
            err_flag: false,
            param: 0.0,
            param_int: 0,
            param_byte: 0,
            param_long: 0,
            digits: 2,
            nachkomma: 1,
            param_str: String::new(),
            ser_inp_str: String::new(),
        }
    }
}

trait HardwareInterface {
    fn serout_byte(&mut self, byte: u8);
    fn write_serial(&mut self, text: &str);
    fn send_dds_word(&mut self, word: u16);
    fn shift_out_level_sr(&mut self, level: i32, switch_state: u8);

    fn shift_out_offset_dac(&mut self, _dac_counts: i16) {}

    fn serial_timeout_char(&mut self, _timeout_ticks: u8) -> Option<char> {
        None
    }

    fn serial_pending(&self) -> bool {
        false
    }

    fn take_systick(&mut self) -> bool {
        false
    }

    fn next_panel_event(&mut self) -> PanelEvent {
        PanelEvent::None
    }

    fn set_serial_baud_register(&mut self, _register: u8, _double_speed: bool) {}

    fn read_slave_channel(&mut self) -> u8 {
        0
    }

    fn serial_read_immediate(&mut self) -> Option<char> {
        None
    }

    fn lcd_setup(&mut self) -> bool {
        false
    }

    fn lcd_define_custom_char(&mut self, _slot: u8, _bitmap: [u8; 8]) {}
    fn lcd_write_line(&mut self, _row: u8, _text: &str) {}

    fn set_activity_led(&mut self, _active_low: bool) {}
    fn delay_ms(&mut self, _ms: u16) {}
}

impl FirmwareState {
    // Restore the editable setpoints that the Pascal firmware copied from
    // EEPROM during reset and after EEPROM writes.
    fn patch_copy_from_ee(&mut self) {
        self.wave = self.defaults.init_wave;
        self.frequenz = self.defaults.init_frequenz;
        self.dac_level = self.defaults.init_level;
        self.terz_num = self.defaults.init_terz_num;
        self.burst_mode = self.defaults.init_burst;
        self.inc_rast = self.defaults.init_inc_rast;
        self.attn_switch_point = 1001.0;
        self.attn_fac = self.defaults.init_attn_fac;
        self.pwr_gain = self.defaults.init_pwr_gain;
        self.level_scale_low = self.defaults.level_scale_low;
        self.level_scale_hi = self.defaults.level_scale_hi;
    }

    fn ser_crlf<H: HardwareInterface>(&self, hw: &mut H) {
        hw.serout_byte(b'\r');
        hw.serout_byte(b'\n');
    }

    fn write_ch_prefix<H: HardwareInterface>(&self, hw: &mut H) {
        let mut prefix = String::new();
        let _ = write!(&mut prefix, "#{}:{}=", self.slave_ch, self.sub_ch);
        hw.write_serial(&prefix);
    }

    fn write_ser_inp<H: HardwareInterface>(&self, hw: &mut H) {
        hw.write_serial(&self.ser_inp_str);
        self.ser_crlf(hw);
    }

    // Error/status response. The original parser used sub-channel 255 for
    // these prompts and encoded status bits plus the error number together.
    fn ser_prompt<H: HardwareInterface>(&mut self, hw: &mut H, err: ErrorCode, status: u8) {
        if self.verbose || err != ErrorCode::NoErr {
            self.sub_ch = ERR_SUB_CH;
            self.write_ch_prefix(hw);
            let code = err.code().saturating_add(status);
            let _ = write!(
                &mut self.param_str,
                "{} {}",
                code,
                ERR_STR_ARR[err.code() as usize]
            );
            hw.write_serial(&self.param_str);
            self.ser_crlf(hw);
            self.param_str.clear();
        }
        if err != ErrorCode::NoErr {
            self.err_count += 1;
            self.err_flag = true;
        }
    }

    fn write_param_str_ser<H: HardwareInterface>(&self, hw: &mut H) {
        self.write_ch_prefix(hw);
        hw.write_serial(&self.param_str);
        self.ser_crlf(hw);
    }

    fn param_to_str(&mut self) {
        self.param_str.clear();
        if self.param == 0.0 {
            self.param_str.push('0');
            return;
        }

        let rendered = format!("{:.*}", self.nachkomma, self.param);
        self.param_str
            .push_str(rendered.trim_end_matches('0').trim_end_matches('.'));
        if self.param_str.is_empty() {
            self.param_str.push('0');
        }
    }

    fn param_to_pm_str(&mut self) {
        self.param_to_str();
        if !self.param_str.starts_with('-') {
            self.param_str.insert(0, '+');
        }
    }

    fn param_long_to_str(&mut self) {
        self.param = self.param_long as f64 / 10.0;
        self.param_to_str();
    }

    fn offset_to_param(&mut self) {
        self.param = self.offset_mv as f64 / 1000.0;
    }

    fn write_param_ser<H: HardwareInterface>(&mut self, hw: &mut H) {
        self.param_to_str();
        self.write_param_str_ser(hw);
    }

    fn write_param_byte_ser<H: HardwareInterface>(&mut self, hw: &mut H) {
        self.param_str.clear();
        let _ = write!(&mut self.param_str, "{}", self.param_byte);
        self.write_param_str_ser(hw);
    }

    // Clamp user-facing values to the same legal ranges as the Pascal code.
    // A true return means the input had to be corrected.
    fn check_limits(&mut self) -> bool {
        let mut out_of_range = false;

        // The panel toggles between the 1 V and 5 V amplitude ranges rather
        // than allowing arbitrary DAC full-scale values here.
        self.dac_level = if self.dac_level > 1000.0 {
            5000.0
        } else {
            1000.0
        };

        if self.frequenz < 0 {
            self.frequenz = 0;
            out_of_range = true;
        }
        if self.frequenz > 100_000_001 {
            self.frequenz = 100_000_000;
            out_of_range = true;
        }
        if self.wave > C_SQUW {
            self.wave = C_SQUW;
            out_of_range = true;
        }
        if self.terz_num > 30 {
            self.terz_num = 30;
            out_of_range = true;
        }
        if self.burst_mode > 100 {
            self.burst_mode = 100;
            out_of_range = true;
        }

        out_of_range
    }

    fn parse_get_param<H: HardwareInterface>(&mut self, hw: &mut H) {
        self.digits = 2;
        self.nachkomma = 1;

        match self.sub_ch {
            0 => {
                self.param_long = self.frequenz;
                self.param_long_to_str();
                self.write_param_str_ser(hw);
            }
            1 => {
                self.param = self.dac_level;
                self.param_to_str();
                self.write_param_str_ser(hw);
            }
            4 => {
                self.param_byte = self.wave;
                self.write_param_byte_ser(hw);
            }
            5 => {
                self.param_byte = self.burst_mode;
                self.write_param_byte_ser(hw);
            }
            20 => {
                self.nachkomma = 4;
                self.offset_to_param();
                self.write_param_ser(hw);
            }
            80 => {
                self.param_byte = match self.modify {
                    Modify::WaveSel => 0,
                    Modify::FreqSel => 1,
                    Modify::AmplSel => 2,
                    Modify::BurstSel => 3,
                    Modify::DcSel => 4,
                };
                self.write_param_byte_ser(hw);
            }
            89 => {
                self.param_byte = self.inc_rast as u8;
                self.write_param_byte_ser(hw);
            }
            251 => {
                self.param = self.err_count as f64;
                self.write_param_ser(hw);
            }
            252 => {
                self.param_byte = self.defaults.ee_ser_baud_reg;
                self.write_param_byte_ser(hw);
            }
            253 => {
                hw.write_serial(&self.ser_inp_str);
                self.ser_crlf(hw);
            }
            254 => {
                self.write_ch_prefix(hw);
                hw.write_serial(VERS1_STR);
                self.ser_crlf(hw);
            }
            250 | 255 => {
                // Both status aliases end up in the same status prompt path.
                self.ser_prompt(hw, ErrorCode::NoErr, self.status.to_status_byte());
            }
            _ => self.ser_prompt(hw, ErrorCode::ParamErr, 0),
        }
    }

    fn parse_set_param<H: HardwareInterface>(&mut self, hw: &mut H) {
        if self.status.busy {
            self.ser_prompt(hw, ErrorCode::BusyErr, 0);
            return;
        }

        self.changed_flag = true;

        match self.sub_ch {
            0 => self.frequenz = (self.param * 10.0) as i32,
            1 => self.dac_level = self.param,
            4 => self.wave = self.param_byte,
            5 => self.burst_mode = self.param_byte,
            80 => {
                // DSP selects which value the front-panel encoder edits.
                self.modify = match self.param_byte {
                    0 => Modify::WaveSel,
                    1 => Modify::FreqSel,
                    2 => Modify::AmplSel,
                    3 => Modify::BurstSel,
                    4 => Modify::DcSel,
                    _ => {
                        self.ser_prompt(hw, ErrorCode::ParamErr, 0);
                        return;
                    }
                };
            }
            89 => {
                if self.status.ee_unlocked {
                    self.inc_rast = self.param_int;
                    self.defaults.init_inc_rast = self.inc_rast;
                } else {
                    self.ser_prompt(hw, ErrorCode::LockedErr, 0);
                    return;
                }
            }
            251 => self.err_count = self.param_int,
            252 => {
                if self.status.ee_unlocked {
                    self.defaults.ee_ser_baud_reg = self.param_byte;
                } else {
                    self.ser_prompt(hw, ErrorCode::LockedErr, 0);
                    return;
                }
            }
            250 => {}
            _ => {
                self.ser_prompt(hw, ErrorCode::ParamErr, 0);
                return;
            }
        }

        // WEN acts as the write-enable latch for EEPROM-backed parameters.
        self.status.ee_unlocked = self.sub_ch == 250;

        if self.check_limits() {
            self.ser_prompt(hw, ErrorCode::ParamErr, self.status.to_status_byte());
        } else {
            self.ser_prompt(hw, ErrorCode::NoErr, self.status.to_status_byte());
        }
        self.set_level_dds(hw);
    }

    fn cmd_to_index(cmd: &str) -> CmdWhich {
        for (text, _, which) in CMD_TABLE {
            if cmd.eq_ignore_ascii_case(text) {
                return which;
            }
        }
        if cmd.eq_ignore_ascii_case("NOP") {
            CmdWhich::Nop
        } else {
            CmdWhich::Err
        }
    }

    // Extract either a command token or a numeric parameter token from the
    // serial line. This mirrors the split parser in the Pascal firmware.
    fn parse_extract(&self, input: &str, start: usize) -> (String, usize, bool) {
        let bytes = input.as_bytes();
        let mut idx = start;
        while idx < bytes.len() && bytes[idx] == b' ' {
            idx += 1;
        }

        if idx >= bytes.len() {
            return (String::new(), idx, false);
        }

        let is_param = matches!(bytes[idx], b'*'..=b'9');
        let begin = idx;

        if is_param {
            while idx < bytes.len() {
                if matches!(bytes[idx], b'*'..=b'9') {
                    idx += 1;
                } else {
                    break;
                }
            }
        } else {
            while idx < bytes.len() {
                let ch = bytes[idx] as char;
                if ch.is_ascii_alphabetic() {
                    idx += 1;
                } else {
                    break;
                }
            }
        }

        (input[begin..idx].to_string(), idx, is_param)
    }

    fn parse_sub_ch<H: HardwareInterface>(&mut self, hw: &mut H) {
        if self.ser_inp_str.is_empty() {
            self.ser_prompt(hw, ErrorCode::NoErr, 0);
            return;
        }

        // Requests have no '='. '#'-prefixed lines are already results and are
        // forwarded unchanged so chained devices preserve upstream replies.
        let has_main_ch = self.ser_inp_str.contains(':');
        let is_request = !self.ser_inp_str.contains('=');
        let first_char = self.ser_inp_str.chars().next().unwrap_or_default();
        let is_omni = first_char == '*';
        let is_result = first_char == '#';

        if is_result {
            self.write_ser_inp(hw);
            return;
        }

        let mut next_idx = 0;
        if has_main_ch {
            let (main_ch_str, main_ch_end, _) = self.parse_extract(&self.ser_inp_str, 0);
            next_idx = main_ch_end.saturating_add(1);
            if is_omni {
                self.write_ser_inp(hw);
            } else {
                self.current_ch = main_ch_str.parse::<u8>().unwrap_or(self.current_ch);
            }

            if !is_omni && self.current_ch != self.slave_ch {
                self.write_ser_inp(hw);
                return;
            }
        } else if !is_omni && self.current_ch != self.slave_ch {
            self.write_ser_inp(hw);
            return;
        }

        let (token, token_end, token_is_param) = self.parse_extract(&self.ser_inp_str, next_idx);
        if token_is_param {
            self.sub_ch = token.parse::<u8>().unwrap_or(self.sub_ch);
        } else {
            let which = Self::cmd_to_index(&token);
            if which == CmdWhich::Err {
                self.ser_prompt(hw, ErrorCode::SyntaxErr, 0);
                return;
            }
            let offset = CMD_TABLE
                .iter()
                .find(|(_, _, candidate)| *candidate == which)
                .map(|(_, sub_ch, _)| *sub_ch)
                .unwrap_or(0);
            let (sub_param, _, _) = self.parse_extract(&self.ser_inp_str, token_end);
            let direct = sub_param.parse::<u8>().unwrap_or(0);
            self.sub_ch = direct.saturating_add(offset);
        }

        // '!' or '?' request the verbose response form.
        self.verbose = self.ser_inp_str.contains('?') || self.ser_inp_str.contains('!');

        if let Some(check_pos) = self.ser_inp_str.find('$') {
            // Optional XOR checksum over the command, excluding the '$' prefix
            // and the checksum bytes themselves.
            let checksum_in = u8::from_str_radix(
                self.ser_inp_str
                    .get(check_pos + 1..check_pos + 3)
                    .unwrap_or("00"),
                16,
            )
            .unwrap_or(0);
            let checksum = self.ser_inp_str[..check_pos]
                .bytes()
                .fold(0u8, |acc, byte| acc ^ byte);
            if checksum != checksum_in {
                self.ser_prompt(hw, ErrorCode::ChecksumErr, 0);
                return;
            }
        }

        hw.set_activity_led(true);

        if is_request {
            self.parse_get_param(hw);
            return;
        }

        if let Some(eq_pos) = self.ser_inp_str.find('=') {
            let (param_str, _, is_param) = self.parse_extract(&self.ser_inp_str, eq_pos + 1);
            if !is_param {
                self.ser_prompt(hw, ErrorCode::ParamErr, 0);
                return;
            }

            self.param = param_str.parse::<f64>().unwrap_or(0.0);
            self.param_int = self.param as i32;
            self.param_byte = self.param_int as u8;
            self.parse_set_param(hw);
        } else {
            self.ser_prompt(hw, ErrorCode::ParamErr, 0);
        }
    }

    // Burst generation runs from the 10 ms system tick. Count 1 starts the
    // programmed waveform, count 0 forces DDS reset, then the period reloads.
    fn on_systick<H: HardwareInterface>(&mut self, hw: &mut H) {
        if self.burst_mode == 0 {
            return;
        }

        if self.burst_count == 1 {
            self.dss_cmd = self.wave_cmd;
            hw.send_dds_word(self.dss_cmd);
        }
        if self.burst_count == 0 {
            self.dss_cmd = C_DDS_RESET_CMD;
            hw.send_dds_word(self.dss_cmd);
            self.burst_count = self.burst_mode.saturating_add(1);
        }
        self.burst_count = self.burst_count.saturating_sub(1);
    }

    // Apply the relay state, then emit the AD9833 frequency words followed by
    // the waveform command. SQG kept the original float-based digit-summing
    // path instead of replacing it with new integer math.
    fn set_level_dds<H: HardwareInterface>(&mut self, hw: &mut H) {
        self.switch_state = 0;
        let mut offset_mv = self.offset_mv;

        // Zero offset disconnects the DC offset path; non-zero values keep the
        // DAC path enabled and are shifted after relay selection below.
        self.set_switch_bit(OFFS_SW_BIT, offset_mv == 0);

        let level = if self.dac_level < self.attn_switch_point {
            let scaled = (self.dac_level * self.attn_fac * self.level_scale_low).round() as i32;
            self.set_switch_bit(ATTN_SW_BIT, true);
            if self.level_range {
                self.dss_cmd = C_DDS_RESET_CMD;
                hw.send_dds_word(self.dss_cmd);
                hw.shift_out_level_sr(0, self.switch_state);
                hw.delay_ms(5);
                self.level_range = false;
            }
            scaled
        } else {
            self.set_switch_bit(ATTN_SW_BIT, false);
            self.level_range = true;
            (self.dac_level * self.level_scale_hi).round() as i32
        };

        // Logic mode reuses the DDS square-wave output stage.
        self.wave_cmd = match self.wave {
            C_SINW => C_DDS_SINE_CMD,
            C_TRIW => C_DDS_TRIANGLE_CMD,
            C_SQUW => {
                self.set_switch_bit(SQUARE_SW_BIT, true);
                C_DDS_SQUARE_CMD
            }
            C_LOGIC => {
                self.set_switch_bit(SQUARE_SW_BIT, true);
                offset_mv = (self.dac_level * self.pwr_gain * 1.41421).round() as i32;
                self.set_switch_bit(OFFS_SW_BIT, false);
                C_DDS_SQUARE_CMD
            }
            C_EXT => {
                self.set_switch_bit(EXT_ON_BIT, true);
                C_DDS_RESET_CMD
            }
            _ => C_DDS_RESET_CMD,
        };

        hw.shift_out_offset_dac((offset_mv / 5) as i16);
        hw.shift_out_level_sr(level, self.switch_state);

        // Frequency is stored in 0.1 Hz and rendered as a fixed 9-digit
        // decimal string before weighting each decade.
        let freq_str = format!("{:09}", self.frequenz);
        let mut add_f = 0.0f64;
        for (idx, ch) in freq_str.chars().enumerate().take(FHZ.len()) {
            let digit = ch.to_digit(10).unwrap_or(0) as f64;
            add_f += FHZ[idx] * digit;
        }
        self.dds_frequ = add_f as i32;

        // AD9833 frequency programming is split into two 14-bit register words.
        self.dss_cmd = ((self.dds_frequ as u16) & 0x3fff) | DDS_FREQ_REG_CMD;
        hw.send_dds_word(self.dss_cmd);

        let shifted = (self.dds_frequ as u32) << 2;
        self.dss_cmd = (((shifted >> 16) as u16) & 0x3fff) | DDS_FREQ_REG_CMD;
        hw.send_dds_word(self.dss_cmd);

        self.dss_cmd = self.wave_cmd;
        hw.send_dds_word(self.dss_cmd);
    }

    // Regelmaessig ausserhalb des Interrupts aus CheckSer heraus aufgerufen.
    fn chores(&mut self) {}

    fn check_ser<H: HardwareInterface>(&mut self, hw: &mut H) {
        while let Some(ch) = hw.serial_timeout_char(2) {
            // The original loop accepted printable 7-bit ASCII only, handled
            // backspace locally, and parsed on carriage return.
            if (' '..='~').contains(&ch) {
                self.ser_inp_str.push(ch);
            }
            if ch == '\u{0008}' {
                self.ser_inp_str.pop();
            }
            if ch == '\r' {
                self.parse_sub_ch(hw);
                self.ser_inp_str.clear();
            }
        }
    }

    fn check_delay<H: HardwareInterface>(&mut self, hw: &mut H, delay_ticks: u8) {
        for _ in 0..delay_ticks {
            self.check_ser(hw);
        }
    }

    fn set_switch_bit(&mut self, bit: u8, high: bool) {
        if high {
            self.switch_state |= 1 << bit;
        } else {
            self.switch_state &= !(1 << bit);
        }
    }

    fn modify_to_sub_ch(&self) -> u8 {
        match self.modify {
            Modify::FreqSel => 0,
            Modify::AmplSel => 1,
            Modify::WaveSel => 4,
            Modify::BurstSel => 5,
            Modify::DcSel => 20,
        }
    }

    fn cycle_modify(&mut self, forward: bool) {
        self.modify = match (self.modify, forward) {
            (Modify::WaveSel, true) => Modify::FreqSel,
            (Modify::FreqSel, true) => Modify::AmplSel,
            (Modify::AmplSel, true) => Modify::BurstSel,
            (Modify::BurstSel, true) => Modify::DcSel,
            (Modify::DcSel, true) => Modify::WaveSel,
            (Modify::WaveSel, false) => Modify::DcSel,
            (Modify::FreqSel, false) => Modify::WaveSel,
            (Modify::AmplSel, false) => Modify::FreqSel,
            (Modify::BurstSel, false) => Modify::AmplSel,
            (Modify::DcSel, false) => Modify::BurstSel,
        };
    }

    fn report_panel_activity<H: HardwareInterface>(&mut self, hw: &mut H, status: u8) {
        self.ser_prompt(
            hw,
            ErrorCode::NoErr,
            self.status.to_status_byte().saturating_add(status),
        );
    }

    fn service_panel_event<H: HardwareInterface>(&mut self, hw: &mut H, event: PanelEvent) {
        match event {
            PanelEvent::None => {}
            PanelEvent::Encoder(delta) => {
                if delta == 0 {
                    return;
                }

                self.changed_flag = true;
                self.status.busy = true;
                self.incr_diff += delta;

                if self.incr_diff.abs() < self.inc_rast {
                    return;
                }

                let mut incr_diff = self.incr_diff / self.inc_rast;
                let incr_diff_byte = incr_diff as u8;
                if incr_diff.abs() > 1 {
                    incr_diff *= 2;
                }
                if incr_diff.abs() > 2 {
                    incr_diff *= 2;
                }
                let incr_acc_int10 = incr_diff * 10;

                if self.first_turn {
                    self.report_panel_activity(hw, USER_SRQ_PANEL_ACTIVE);
                }

                match self.modify {
                    Modify::FreqSel => {
                        if self.incr_fine {
                            if self.first_turn {
                                self.frequenz = (self.frequenz / 10) * 10;
                            }
                            self.frequenz += incr_acc_int10;
                        } else {
                            self.terz_num = self.terz_num.wrapping_add(incr_diff_byte);
                            self.check_limits();
                            self.frequenz = TERZ_ARRAY[self.terz_num as usize];
                        }
                    }
                    Modify::AmplSel => {
                        self.level_range = !self.level_range;
                        self.dac_level = if self.level_range { 5000.0 } else { 1000.0 };
                    }
                    Modify::WaveSel => {
                        self.wave = self.wave.wrapping_add(incr_diff_byte);
                        self.check_limits();
                    }
                    Modify::BurstSel => {
                        self.burst_mode = self.burst_mode.wrapping_add(incr_diff as u8);
                        self.check_limits();
                    }
                    Modify::DcSel => {
                        self.offset_mv += incr_acc_int10;
                    }
                }

                self.incr_diff = 0;
                self.check_limits();
                self.sub_ch = self.modify_to_sub_ch();
                self.parse_get_param(hw);
                self.set_level_dds(hw);
                self.first_turn = false;
            }
            PanelEvent::Button(button) => {
                self.changed_flag = true;
                self.status.busy = true;
                match button {
                    PanelButton::Enter => {
                        self.report_panel_activity(hw, USER_SRQ_PANEL_ACTIVE);
                        self.incr_fine = !self.incr_fine;
                    }
                    PanelButton::Left => {
                        self.report_panel_activity(hw, USER_SRQ_LEFT);
                        self.cycle_modify(true);
                    }
                    PanelButton::Right => {
                        self.report_panel_activity(hw, USER_SRQ_RIGHT);
                        self.cycle_modify(false);
                    }
                }
                self.sub_ch = self.modify_to_sub_ch();
                self.parse_get_param(hw);
                self.set_level_dds(hw);
                self.first_turn = false;
            }
            PanelEvent::IncrTimerExpired => {
                if !self.first_turn {
                    self.report_panel_activity(hw, USER_SRQ_RELEASED);
                }
                self.first_turn = true;
            }
            PanelEvent::DisplayTimerExpired => {
                self.incr_fine = false;
                self.status.busy = false;
                self.changed_flag = false;
            }
        }
    }

    // Startup sequence after reset, before the main serial/panel loop begins.
    fn init_all<H: HardwareInterface>(&mut self, hw: &mut H) {
        if !(9..=239).contains(&self.defaults.ee_ser_baud_reg) {
            self.defaults.ee_ser_baud_reg = 51;
        }
        hw.set_serial_baud_register(self.defaults.ee_ser_baud_reg, true);

        self.patch_copy_from_ee();
        self.slave_ch = hw.read_slave_channel();
        hw.set_activity_led(true);

        self.lcd_present = hw.lcd_setup();
        if self.lcd_present {
            hw.lcd_define_custom_char(0, [0x01, 0x03, 0x07, 0x0F, 0x07, 0x03, 0x01, 0x00]);
            hw.lcd_define_custom_char(1, [0x01, 0x03, 0x05, 0x09, 0x05, 0x03, 0x01, 0x00]);
            hw.lcd_define_custom_char(2, [0x01, 0x02, 0x05, 0x0A, 0x05, 0x02, 0x01, 0x00]);
            hw.lcd_write_line(0, VERS3_STR);
            if self.defaults.ee_initialized != EEPROM_INITIALIZED {
                hw.lcd_write_line(1, EEPROM_EMPTY_STR);
            } else {
                hw.lcd_write_line(1, &format!("{ADR_STR}{}", self.slave_ch));
            }
        }

        hw.delay_ms(1000);
        if self.slave_ch > 0 {
            for _ in 0..self.slave_ch {
                hw.set_activity_led(false);
                hw.delay_ms(150);
                hw.set_activity_led(true);
                hw.delay_ms(150);
            }
        }
        hw.set_activity_led(false);

        // This matches the Pascal power-up state before the first user action.
        self.status = StatusFlags::default();
        self.burst_count = 1;
        self.modify = Modify::FreqSel;
        self.incr_fine = false;
        self.incr_diff = 0;
        self.first_turn = true;
        self.current_ch = 255;
        self.err_count = 0;
        self.err_flag = false;
        self.changed_flag = true;
        self.ser_inp_str.clear();
        while hw.serial_read_immediate().is_some() {}
        self.level_range = self.dac_level > 1000.0;

        hw.delay_ms(500);

        self.sub_ch = 254;
        self.write_ch_prefix(hw);
        hw.write_serial(VERS1_STR);
        if self.defaults.ee_initialized != EEPROM_INITIALIZED {
            hw.write_serial(EEPROM_EMPTY_STR);
        }
        self.ser_crlf(hw);

        self.set_level_dds(hw);
    }

    // One best-effort outer loop step from the original `loop ... endloop`.
    // The Pascal loop serviced serial traffic first, then let the optional
    // LCD/encoder panel own the device while the UART was idle.
    fn run_main_loop_iteration<H: HardwareInterface>(&mut self, hw: &mut H) {
        while hw.take_systick() {
            self.on_systick(hw);
        }

        self.check_ser(hw);

        if !hw.serial_pending() && self.lcd_present {
            let event = hw.next_panel_event();
            self.service_panel_event(hw, event);
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::collections::VecDeque;

    #[derive(Default)]
    struct DummyHardware {
        serial: String,
        serial_in: VecDeque<char>,
        dds_words: Vec<u16>,
        shift_ops: Vec<(i32, u8)>,
        offset_ops: Vec<i16>,
        delays: Vec<u16>,
        baud_calls: Vec<(u8, bool)>,
        slave_channel: u8,
        activity_leds: Vec<bool>,
        lcd_setup_result: bool,
        lcd_chars: Vec<(u8, [u8; 8])>,
        lcd_lines: Vec<(u8, String)>,
        serial_pending: bool,
        systicks: u8,
        panel_events: Vec<PanelEvent>,
    }

    impl HardwareInterface for DummyHardware {
        fn serout_byte(&mut self, byte: u8) {
            self.serial.push(byte as char);
        }

        fn write_serial(&mut self, text: &str) {
            self.serial.push_str(text);
        }

        fn send_dds_word(&mut self, word: u16) {
            self.dds_words.push(word);
        }

        fn shift_out_level_sr(&mut self, level: i32, switch_state: u8) {
            self.shift_ops.push((level, switch_state));
        }

        fn shift_out_offset_dac(&mut self, dac_counts: i16) {
            self.offset_ops.push(dac_counts);
        }

        fn set_serial_baud_register(&mut self, register: u8, double_speed: bool) {
            self.baud_calls.push((register, double_speed));
        }

        fn read_slave_channel(&mut self) -> u8 {
            self.slave_channel
        }

        fn serial_read_immediate(&mut self) -> Option<char> {
            self.serial_in.pop_front()
        }

        fn lcd_setup(&mut self) -> bool {
            self.lcd_setup_result
        }

        fn lcd_define_custom_char(&mut self, slot: u8, bitmap: [u8; 8]) {
            self.lcd_chars.push((slot, bitmap));
        }

        fn lcd_write_line(&mut self, row: u8, text: &str) {
            self.lcd_lines.push((row, text.to_string()));
        }

        fn serial_pending(&self) -> bool {
            self.serial_pending
        }

        fn take_systick(&mut self) -> bool {
            if self.systicks == 0 {
                false
            } else {
                self.systicks -= 1;
                true
            }
        }

        fn next_panel_event(&mut self) -> PanelEvent {
            if self.panel_events.is_empty() {
                PanelEvent::None
            } else {
                self.panel_events.remove(0)
            }
        }

        fn delay_ms(&mut self, ms: u16) {
            self.delays.push(ms);
        }

        fn set_activity_led(&mut self, active_low: bool) {
            self.activity_leds.push(active_low);
        }
    }

    #[test]
    fn set_level_dds_emits_three_dds_words() {
        let mut state = FirmwareState::default();
        let mut hw = DummyHardware::default();

        state.frequenz = 10_000;
        state.wave = C_SQUW;
        state.set_level_dds(&mut hw);

        assert_eq!(hw.dds_words.len(), 3);
        assert_eq!(hw.dds_words[2], C_DDS_SQUARE_CMD);
    }

    #[test]
    fn set_level_dds_restores_level_offset_and_relay_setup() {
        let mut state = FirmwareState::default();
        let mut hw = DummyHardware::default();

        state.dac_level = 1000.0;
        state.offset_mv = 250;
        state.wave = C_SQUW;
        state.set_level_dds(&mut hw);

        assert_eq!(hw.offset_ops, vec![50]);
        assert_eq!(
            hw.shift_ops,
            vec![(40_000, (1 << ATTN_SW_BIT) | (1 << SQUARE_SW_BIT))]
        );
        assert_eq!(state.level_range, false);
    }

    #[test]
    fn set_level_dds_mutes_before_switching_from_high_to_low_range() {
        let mut state = FirmwareState {
            dac_level: 1000.0,
            level_range: true,
            wave: C_SQUW,
            ..Default::default()
        };
        let mut hw = DummyHardware::default();

        state.set_level_dds(&mut hw);

        assert_eq!(hw.dds_words[0], C_DDS_RESET_CMD);
        assert_eq!(
            hw.shift_ops[0],
            (0, (1 << OFFS_SW_BIT) | (1 << ATTN_SW_BIT))
        );
        assert_eq!(hw.delays, vec![5]);
        assert!(!state.level_range);
    }

    #[test]
    fn run_main_loop_iteration_drives_burst_from_systick() {
        let mut state = FirmwareState {
            burst_mode: 2,
            burst_count: 1,
            wave_cmd: C_DDS_SQUARE_CMD,
            ..Default::default()
        };
        let mut hw = DummyHardware {
            systicks: 2,
            ..Default::default()
        };

        state.run_main_loop_iteration(&mut hw);

        assert_eq!(hw.dds_words, vec![C_DDS_SQUARE_CMD, C_DDS_RESET_CMD]);
        assert_eq!(state.burst_count, 2);
    }

    #[test]
    fn run_main_loop_iteration_skips_panel_while_serial_is_pending() {
        let mut state = FirmwareState {
            lcd_present: true,
            current_ch: 0,
            ..Default::default()
        };
        let mut hw = DummyHardware {
            serial_pending: true,
            panel_events: vec![PanelEvent::Button(PanelButton::Left)],
            ..Default::default()
        };

        state.run_main_loop_iteration(&mut hw);

        assert_eq!(state.modify, Modify::FreqSel);
        assert!(hw
            .panel_events
            .contains(&PanelEvent::Button(PanelButton::Left)));
    }

    #[test]
    fn panel_button_uses_busy_status_and_updates_display_selection_when_uart_idle() {
        let mut state = FirmwareState {
            lcd_present: true,
            current_ch: 0,
            ..Default::default()
        };
        let mut hw = DummyHardware {
            panel_events: vec![PanelEvent::Button(PanelButton::Left)],
            ..Default::default()
        };

        state.run_main_loop_iteration(&mut hw);

        assert_eq!(state.modify, Modify::AmplSel);
        assert!(state.status.busy);
        assert!(hw.serial.contains("#0:1=5000"));
    }

    #[test]
    fn parse_get_param_returns_version() {
        let mut state = FirmwareState::default();
        let mut hw = DummyHardware::default();

        state.sub_ch = 254;
        state.parse_get_param(&mut hw);

        assert!(hw.serial.contains(VERS1_STR));
    }

    #[test]
    fn patch_copy_from_ee_restores_sqg_eeprom_backed_reset_values() {
        let mut state = FirmwareState {
            wave: C_OFF,
            frequenz: 42,
            dac_level: 1000.0,
            terz_num: 1,
            burst_mode: 9,
            inc_rast: 1,
            attn_fac: 1.0,
            pwr_gain: 1.0,
            level_scale_low: 2.0,
            level_scale_hi: 3.0,
            ..Default::default()
        };
        state.defaults.init_wave = C_SQUW;
        state.defaults.init_frequenz = 20_000;
        state.defaults.init_level = 5000.0;
        state.defaults.init_terz_num = 12;
        state.defaults.init_burst = 7;
        state.defaults.init_inc_rast = 6;
        state.defaults.init_attn_fac = 33.0;
        state.defaults.init_pwr_gain = 1.5;
        state.defaults.level_scale_low = 0.95;
        state.defaults.level_scale_hi = 1.05;

        state.patch_copy_from_ee();

        assert_eq!(state.wave, C_SQUW);
        assert_eq!(state.frequenz, 20_000);
        assert_eq!(state.dac_level, 5000.0);
        assert_eq!(state.terz_num, 12);
        assert_eq!(state.burst_mode, 7);
        assert_eq!(state.inc_rast, 6);
        assert_eq!(state.attn_fac, 33.0);
        assert_eq!(state.pwr_gain, 1.5);
        assert_eq!(state.level_scale_low, 0.95);
        assert_eq!(state.level_scale_hi, 1.05);
    }

    #[test]
    fn init_all_restores_pascal_startup_state_and_banner() {
        let mut state = FirmwareState::default();
        let mut hw = DummyHardware {
            serial_in: "stale".chars().collect(),
            slave_channel: 2,
            lcd_setup_result: true,
            ..Default::default()
        };

        state.defaults.ee_initialized = 0;
        state.defaults.ee_ser_baud_reg = 5;
        state.frequenz = 42;
        state.status.busy = true;
        state.err_count = 9;
        state.err_flag = true;
        state.incr_fine = true;
        state.incr_diff = 3;
        state.ser_inp_str = "partial".to_string();

        state.init_all(&mut hw);

        assert_eq!(state.defaults.ee_ser_baud_reg, 51);
        assert_eq!(hw.baud_calls, vec![(51, true)]);
        assert_eq!(state.slave_ch, 2);
        assert!(state.lcd_present);
        assert_eq!(state.status, StatusFlags::default());
        assert_eq!(state.burst_count, 1);
        assert_eq!(state.modify, Modify::FreqSel);
        assert_eq!(state.current_ch, 255);
        assert_eq!(state.err_count, 0);
        assert!(!state.err_flag);
        assert!(state.changed_flag);
        assert!(state.first_turn);
        assert!(!state.incr_fine);
        assert_eq!(state.incr_diff, 0);
        assert!(state.ser_inp_str.is_empty());
        assert!(hw.serial_in.is_empty());
        assert_eq!(
            hw.lcd_lines,
            vec![
                (0, VERS3_STR.to_string()),
                (1, EEPROM_EMPTY_STR.to_string()),
            ]
        );
        assert_eq!(hw.delays, vec![1000, 150, 150, 150, 150, 500]);
        assert_eq!(
            hw.activity_leds,
            vec![true, false, true, false, true, false]
        );
        assert_eq!(
            hw.serial,
            format!("#2:254={VERS1_STR}{EEPROM_EMPTY_STR}\r\n")
        );
        assert_eq!(hw.dds_words.len(), 3);
    }

    #[test]
    fn parse_extract_accepts_pascal_numeric_token_range() {
        let state = FirmwareState::default();

        let (token, end, is_param) = state.parse_extract("  -1,5/2?", 0);

        assert!(is_param);
        assert_eq!(token, "-1,5/2");
        assert_eq!(end, 8);
    }

    #[test]
    fn parse_sub_ch_accepts_unprefixed_command_after_current_channel_matches() {
        let mut state = FirmwareState::default();
        let mut hw = DummyHardware::default();

        state.current_ch = state.slave_ch;
        state.ser_inp_str = "FRQ?".to_string();
        state.parse_sub_ch(&mut hw);

        assert_eq!(state.sub_ch, 0);
        assert!(hw.serial.contains("#0:0=1000"));
    }

    #[test]
    fn parse_sub_ch_accepts_unprefixed_direct_subchannel_after_current_channel_matches() {
        let mut state = FirmwareState::default();
        let mut hw = DummyHardware::default();

        state.current_ch = state.slave_ch;
        state.ser_inp_str = "4?".to_string();
        state.parse_sub_ch(&mut hw);

        assert_eq!(state.sub_ch, 4);
        assert!(hw.serial.contains("#0:4=3"));
    }

    #[test]
    fn parse_set_param_persists_encoder_detent_default() {
        let mut state = FirmwareState::default();
        let mut hw = DummyHardware::default();

        state.ser_inp_str = "0:250=1".to_string();
        state.parse_sub_ch(&mut hw);
        state.ser_inp_str = "0:89=7".to_string();
        state.parse_sub_ch(&mut hw);
        state.inc_rast = 1;

        state.patch_copy_from_ee();

        assert_eq!(state.inc_rast, 7);
        assert_eq!(state.defaults.init_inc_rast, 7);
        assert!(!state.status.ee_unlocked);
    }
}
