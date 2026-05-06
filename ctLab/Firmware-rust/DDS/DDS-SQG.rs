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

// Wave = Sinus, Dreieck/Saegezahn, Rechteck, Audio 1..99
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

// AD9833-DDS constants for frequencies, dependent on the reference clock.
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
    "[OK]",
    "[SRQUSR]",
    "[BUSY]",
    "[OVERLD]",
    "[CMDERR]",
    "[PARERR]",
    "[LOCKED]",
    "[CHKSUM]",
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
    init_frequenz: i32,
    init_level: f64,
    init_burst: u8,
    init_wave: u8,
    init_inc_rast: i32,
    ee_ser_baud_reg: u8,
}

impl Default for EepromDefaults {
    fn default() -> Self {
        Self {
            init_frequenz: 10_000,
            init_level: 5_000.0,
            init_burst: 0,
            init_wave: C_SQUW,
            init_inc_rast: 4,
            ee_ser_baud_reg: 51,
        }
    }
}

#[derive(Debug, Default, Clone, Copy)]
struct StatusFlags {
    busy: bool,
    user_srq: bool,
    overload: bool,
    ee_unlocked: bool,
}

impl StatusFlags {
    fn to_status_byte(self) -> u8 {
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

    // Control state.
    dss_cmd: u16,
    wave_cmd: u16,
    dds_frequ: i32,
    switch_state: u8,
    level_range: bool,
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
            dss_cmd: 0,
            wave_cmd: C_DDS_SQUARE_CMD,
            dds_frequ: 0,
            switch_state: 0,
            level_range: false,
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
    fn shift_out_level_sr(&mut self, level: i16, switch_state: u8);

    fn serial_timeout_char(&mut self, _timeout_ticks: u8) -> Option<char> {
        None
    }

    fn serial_pending(&self) -> bool {
        false
    }

    fn set_activity_led(&mut self, _active_low: bool) {}
    fn delay_ms(&mut self, _ms: u16) {}
}

impl FirmwareState {
    // Frequenz und Settings aus EEPROM holen
    fn patch_copy_from_ee(&mut self) {
        self.wave = self.defaults.init_wave;
        self.frequenz = self.defaults.init_frequenz;
        self.dac_level = self.defaults.init_level;
        self.terz_num = 9;
        self.burst_mode = self.defaults.init_burst;
        self.inc_rast = self.defaults.init_inc_rast;
        self.attn_switch_point = 1001.0;
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

    // Error-Meldung und Status-Request-Antwort,
    // Status Bit 7=Busy, 6=UserSRQ, 5=OverLoad, 4=EEUnlocked, 3..0=Fehler-Nummer
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
        self.param_str.push_str(rendered.trim_end_matches('0').trim_end_matches('.'));
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

    // liefert TRUE wenn "Out of Range"
    fn check_limits(&mut self) -> bool {
        let mut out_of_range = false;

        self.dac_level = if self.dac_level > 1000.0 { 5000.0 } else { 1000.0 };

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

    // extrahiert ParamStr oder CmdStr aus SerInpStr,
    // liefert true, wenn Parameter, sonst false, wenn Command
    fn parse_extract(&self, input: &str, start: usize) -> (String, usize, bool) {
        let bytes = input.as_bytes();
        let mut idx = start;
        while idx < bytes.len() && bytes[idx] == b' ' {
            idx += 1;
        }

        if idx >= bytes.len() {
            return (String::new(), idx, false);
        }

        let is_param = matches!(bytes[idx], b'*' | b'+' | b'-' | b'.' | b'0'..=b'9');
        let begin = idx;

        if is_param {
            while idx < bytes.len() {
                let ch = bytes[idx] as char;
                if ch.is_ascii_digit() || matches!(ch, '*' | '+' | '-' | '.') {
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

        let has_main_ch = self.ser_inp_str.contains(':');
        let is_request = !self.ser_inp_str.contains('=');
        let first_char = self.ser_inp_str.chars().next().unwrap_or_default();
        let is_omni = first_char == '*';
        let is_result = first_char == '#';

        if is_result {
            self.write_ser_inp(hw);
            return;
        }

        if has_main_ch {
            let (main_ch_str, mut next_idx, _) = self.parse_extract(&self.ser_inp_str, 0);
            next_idx = next_idx.saturating_add(1);
            if is_omni {
                self.write_ser_inp(hw);
            } else {
                self.current_ch = main_ch_str.parse::<u8>().unwrap_or(self.current_ch);
            }

            if !is_omni && self.current_ch != self.slave_ch {
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
        }

        self.verbose = self.ser_inp_str.contains('?') || self.ser_inp_str.contains('!');

        if let Some(check_pos) = self.ser_inp_str.find('$') {
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

    // Burst-Generierung per Interrupt
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

    // Pegelsteller und Relais setzen, Frequenz einstellen; Float-Berechnung fuer SQG
    fn set_level_dds<H: HardwareInterface>(&mut self, hw: &mut H) {
        self.switch_state = 0;

        // Abschwaecher fuer AC setzen
        if self.dac_level < self.attn_switch_point {
            self.switch_state |= 1 << 5;
        }

        // Relais setzen
        self.wave_cmd = match self.wave {
            C_SINW => C_DDS_SINE_CMD,
            C_TRIW => C_DDS_TRIANGLE_CMD,
            C_SQUW | C_LOGIC => C_DDS_SQUARE_CMD,
            _ => C_DDS_RESET_CMD,
        };

        hw.shift_out_level_sr(0, self.switch_state);

        // DDS-Frequenz einstellen
        let freq_str = format!("{:09}", self.frequenz);
        let mut add_f = 0.0f64;
        for (idx, ch) in freq_str.chars().enumerate().take(FHZ.len()) {
            let digit = ch.to_digit(10).unwrap_or(0) as f64;
            add_f += FHZ[idx] * digit;
        }
        self.dds_frequ = add_f as i32;

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

    // nach Reset aufgerufen
    fn init_all<H: HardwareInterface>(&mut self, hw: &mut H) {
        self.patch_copy_from_ee();
        self.burst_count = 1;
        self.modify = Modify::FreqSel;
        self.first_turn = true;
        self.current_ch = 255;
        self.err_count = 0;
        self.changed_flag = true;

        hw.delay_ms(1000);
        hw.set_activity_led(false);
        hw.delay_ms(500);

        self.sub_ch = 254;
        self.write_ch_prefix(hw);
        hw.write_serial(VERS1_STR);
        self.ser_crlf(hw);

        self.set_level_dds(hw);
    }

    // One best-effort outer loop step from the original `loop ... endloop`.
    fn run_main_loop_iteration<H: HardwareInterface>(&mut self, hw: &mut H) {
        self.check_ser(hw);
        if !hw.serial_pending() && self.lcd_present {
            // The original panel logic depends on LCDmultiPort and IncrPort4.
            // That UI path is intentionally left as a hardware-specific follow-up.
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[derive(Default)]
    struct DummyHardware {
        serial: String,
        dds_words: Vec<u16>,
        shift_ops: Vec<(i16, u8)>,
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

        fn shift_out_level_sr(&mut self, level: i16, switch_state: u8) {
            self.shift_ops.push((level, switch_state));
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
    fn parse_get_param_returns_version() {
        let mut state = FirmwareState::default();
        let mut hw = DummyHardware::default();

        state.sub_ch = 254;
        state.parse_get_param(&mut hw);

        assert!(hw.serial.contains(VERS1_STR));
    }
}
