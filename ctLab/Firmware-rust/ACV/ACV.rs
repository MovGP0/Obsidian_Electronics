#![allow(dead_code)]

// Programmierbarer Präzisions-Vorverstärker mit AD-Wandler 192 kHz/24 Bit
// 05.05.2010 #1.07 Getrennte Skalierungen L/R auf 200..207 (L) und 210..217 (R)
//                  Option-Parameter 152 für LRswap eingeführt
// 21.02.2008 #1.06 ParseExtract geändert für Integer, wichtig!
//                  Skalierte Anzeige/Ausgabe mV je nach Gain eingeführt
// 21.02.2008 #1.05 SPDIF-Format einstellbar, Bug in Level-Befehl korrigiert
// 16.12.2007 #1.04 kein EEPROM-File mehr notwendig, initialisiert auf Defaults, autom. Bargraph
// 19.11.2007 #1.03 aus Platzgründen umgestellt auf Integer statt Float für Pegel und Param
// 14.10.2007 Parser-Übernahme aus DIV und DDS
//
// Best-effort Rust port of `ACV.pas`. This keeps the original program structure,
// constants, state, and algorithm flow readable, but replaces AVR-specific
// hardware access with mockable helpers. It is not yet a verified embedded build.

use std::fmt::Write as _;

const PROC_CLOCK: u32 = 16_000_000;
const TWI_PRESC: u8 = 0;

const DDRB_INIT: u8 = 0b0001_1111;
const PORTB_INIT: u8 = 0b0001_0000;
const DDRC_INIT: u8 = 0b1111_0000;
const PORTC_INIT: u8 = 0b1111_0011;
const DDRD_INIT: u8 = 0b0000_0100;
const PORTD_INIT: u8 = 0b1111_1100;

const B_SER_AUX: u8 = 4;

const VERS1_STR: &str = "1.07 [ACV by CM/c't 03/2007]";
const VERS3_STR: &str = "ACV 1.07";
const EE_NOT_PROGRAMMED_STR: &str = "EEPROM EMPTY! ";
const ADR_STR: &str = "Adr ";
const DB_STR: &str = " dB ";
const MV_STR: &str = " mV ";
const GAIN_SEL_STR: &str = "InpGain ";
const AUX_CMD_SEL_STR: &str = "Cmd";
const AUX_CMD_STR: &str = "AuxFunct";
const MEMORIZED_STR: &str = "Memorizd";
const OVERLOAD_STR: &str = " OVERLD ";
const RATE_SEL_STR: &str = "SmplRate";
const ERR_SUB_CH: u8 = 255;
const EE_INITIALIZED_MAGIC: u16 = 0xAA55;

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

const RATE_STR_ARR: [&str; 6] = [
    "C 48kHz",
    "C 96kHz",
    "C192kHz",
    "P 48kHz",
    "P 96kHz",
    "P192kHz",
];

const CMD_STR_ARR: [&str; 13] = [
    "STR", "IDN", "VAL", "SMP", "INL", "RNG", "DSP", "ALL", "SCL", "WEN", "ERC", "SBD", "NOP",
];

const CMD2_SUB_CH_ARR: [u8; 13] = [255, 254, 0, 8, 10, 19, 80, 99, 200, 250, 251, 252, 0];

const SWITCH_ARR: [u8; 8] = [
    0b0000_1000,
    0b0000_1001,
    0b0000_0000,
    0b0000_0001,
    0b0000_0100,
    0b0000_0101,
    0b0000_0110,
    0b0000_0111,
];

const ADC_RANGE_SCALES_DIV: [u16; 8] = [100, 100, 1000, 1000, 10000, 1000, 10000, 10000];

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
enum CmdWhich {
    Str,
    Idn,
    Trg,
    Val,
    Wav,
    Bst,
    Aux,
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
    AuxCmdSel,
    RateSel,
    GainSel,
    LevelBarDispl,
    MvDispl,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
enum Spdif {
    C48Khz,
    C96Khz,
    C192Khz,
    P48Khz,
    P96Khz,
    P192Khz,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
enum Error {
    NoErr,
    UserReq,
    BusyErr,
    OvlErr,
    SyntaxErr,
    ParamErr,
    LockedErr,
    ChecksumErr,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
struct Timer8 {
    ticks: u8,
}

impl Timer8 {
    fn set(&mut self, ticks: u8) {
        self.ticks = ticks;
    }

    fn is_zero(&self) -> bool {
        self.ticks == 0
    }

    fn tick(&mut self) {
        self.ticks = self.ticks.saturating_sub(1);
    }
}

#[derive(Debug, Clone)]
struct EepromImage {
    ee_initialized: u16,
    init_inc_rast: i32,
    init_gain: u8,
    init_rate: Spdif,
    init_aux_cmd: u8,
    ee_ser_baud_reg: u8,
    adc_scales_l: [u16; 8],
    adc_scales_r: [u16; 8],
    init_lr_swap: bool,
}

impl Default for EepromImage {
    fn default() -> Self {
        Self {
            ee_initialized: EE_INITIALIZED_MAGIC,
            init_inc_rast: 4,
            init_gain: 2,
            init_rate: Spdif::C48Khz,
            init_aux_cmd: 7,
            ee_ser_baud_reg: 51,
            adc_scales_l: [2100, 664, 2100, 664, 2100, 664, 2100, 664],
            adc_scales_r: [2100, 664, 2100, 664, 2100, 664, 2100, 664],
            init_lr_swap: false,
        }
    }
}

#[derive(Debug, Clone)]
struct MockHardware {
    port_b: u8,
    port_c: u8,
    port_d: u8,
    pin_d: u8,
    adc_values: [u16; 8],
    i2c_registers: [u8; 256],
    lcd_lines: [String; 2],
    lcd_present: bool,
    serial_output: String,
    aux_serial_log: Vec<u8>,
    led_activity: bool,
    rotary_value: i32,
    button_temp: u8,
}

impl MockHardware {
    fn get_adc(&self, channel: usize) -> u16 {
        self.adc_values.get(channel).copied().unwrap_or_default()
    }

    fn twi_out_10(&mut self, register: u8, data: u8) {
        self.i2c_registers[register as usize] = data;
    }

    fn twi_in_10(&self, register: u8) -> u8 {
        self.i2c_registers[register as usize]
    }

    fn lcd_write_line(&mut self, row: usize, text: String) {
        if row < self.lcd_lines.len() {
            self.lcd_lines[row] = text;
        }
    }

    fn lcd_bar_out(&mut self, row: usize, value: u8) {
        let mut line = String::new();
        let segments = usize::from(value / 32).min(7);
        for _ in 0..segments {
            line.push('#');
        }
        self.lcd_write_line(row, line);
    }
}

impl Default for MockHardware {
    fn default() -> Self {
        Self {
            port_b: 0,
            port_c: 0,
            port_d: 0,
            pin_d: 0,
            adc_values: [0; 8],
            i2c_registers: [0; 256],
            lcd_lines: [String::new(), String::new()],
            lcd_present: false,
            serial_output: String::new(),
            aux_serial_log: Vec::new(),
            led_activity: false,
            rotary_value: 0,
            button_temp: 0xff,
        }
    }
}

#[derive(Debug, Clone)]
pub struct AcvState {
    hw: MockHardware,
    eeprom: EepromImage,
    slave_ch: u8,
    switch_state: u8,
    aux_cmd: u8,
    spdif_rate: Spdif,
    activity_timer: Timer8,
    display_timer: Timer8,
    bar_graph_delay_timer: Timer8,
    incr_timer: Timer8,
    gain: u8,
    old_gain: u8,
    left_level: u16,
    right_level: u16,
    left_level_scaled: i32,
    right_level_scaled: i32,
    left_level_byte: u8,
    right_level_byte: u8,
    gain_str: String,
    scale_mult: u16,
    scale_div: u16,
    cmd_which: CmdWhich,
    cmd_str: String,
    sub_ch: u8,
    current_ch: u8,
    verbose: bool,
    param_int: i32,
    param_byte: u8,
    ser_inp_str: String,
    ser_inp_ptr: usize,
    modify: Modify,
    incr_value: i32,
    old_incr_value: i32,
    incr_enter: bool,
    first_turn: bool,
    incr_diff: i32,
    incr_acc_int10: i32,
    inc_rast: i32,
    incr_diff_byte: u8,
    digits: u8,
    nachkomma: u8,
    changed_flag: bool,
    param_str: String,
    status: u8,
    err_count: i32,
    err_flag: bool,
    upper_channel: char,
    lower_channel: char,
    left_overload: bool,
    right_overload: bool,
}

impl Default for AcvState {
    fn default() -> Self {
        Self {
            hw: MockHardware::default(),
            eeprom: EepromImage::default(),
            slave_ch: 0,
            switch_state: 0,
            aux_cmd: 0,
            spdif_rate: Spdif::C48Khz,
            activity_timer: Timer8 { ticks: 0 },
            display_timer: Timer8 { ticks: 0 },
            bar_graph_delay_timer: Timer8 { ticks: 0 },
            incr_timer: Timer8 { ticks: 0 },
            gain: 0,
            old_gain: u8::MAX,
            left_level: 0,
            right_level: 0,
            left_level_scaled: 0,
            right_level_scaled: 0,
            left_level_byte: 0,
            right_level_byte: 0,
            gain_str: String::new(),
            scale_mult: 0,
            scale_div: 0,
            cmd_which: CmdWhich::Err,
            cmd_str: String::new(),
            sub_ch: 0,
            current_ch: 255,
            verbose: false,
            param_int: 0,
            param_byte: 0,
            ser_inp_str: String::new(),
            ser_inp_ptr: 0,
            modify: Modify::GainSel,
            incr_value: 0,
            old_incr_value: 0,
            incr_enter: false,
            first_turn: true,
            incr_diff: 0,
            incr_acc_int10: 0,
            inc_rast: 4,
            incr_diff_byte: 0,
            digits: 2,
            nachkomma: 1,
            changed_flag: false,
            param_str: String::new(),
            status: 0,
            err_count: 0,
            err_flag: false,
            upper_channel: 'L',
            lower_channel: 'R',
            left_overload: false,
            right_overload: false,
        }
    }
}

impl AcvState {
    pub fn new() -> Self {
        let mut state = Self::default();
        state.init_all();
        state
    }

    fn busy_flag(&self) -> bool {
        self.status & 0x80 != 0
    }

    fn set_busy_flag(&mut self, value: bool) {
        if value {
            self.status |= 0x80;
        } else {
            self.status &= !0x80;
        }
    }

    fn set_user_srq_flag(&mut self, value: bool) {
        if value {
            self.status |= 0x40;
        } else {
            self.status &= !0x40;
        }
    }

    fn ee_unlocked(&self) -> bool {
        self.status & 0x10 != 0
    }

    fn set_ee_unlocked(&mut self, value: bool) {
        if value {
            self.status |= 0x10;
        } else {
            self.status &= !0x10;
        }
    }

    fn ser_out(&mut self, text: &str) {
        self.hw.serial_output.push_str(text);
    }

    fn ser_aux(&mut self, my_byte: u8) {
        // Original code bit-bangs 19200 baud on PB4. This port records the byte.
        self.hw.aux_serial_log.push(my_byte);
    }

    fn mul_div_int(value: u16, mult: u16, div: u16) -> u16 {
        if div == 0 {
            return 0;
        }
        ((u32::from(value) * u32::from(mult)) / u32::from(div)) as u16
    }

    fn get_levels(&mut self) {
        // Read both TRMS channels and derive the raw bargraph bytes plus the
        // gain-dependent millivolt values used by the LCD and remote commands.
        self.right_overload = false;
        self.left_overload = false;
        self.right_level = self.hw.get_adc(4);
        self.left_level = self.hw.get_adc(3);
        self.left_level_byte = (self.left_level >> 2) as u8;
        self.scale_div = ADC_RANGE_SCALES_DIV[self.gain as usize];

        if self.right_level > 1019 {
            self.right_overload = true;
            self.right_level_byte = 255;
            self.right_level_scaled = 0;
        } else {
            self.right_level_byte = (self.right_level >> 2) as u8;
            self.scale_mult = self.eeprom.adc_scales_r[self.gain as usize];
            self.right_level_scaled =
                i32::from(Self::mul_div_int(self.right_level, self.scale_mult, self.scale_div));
        }

        if self.left_level > 1019 {
            self.left_overload = true;
            self.left_level_byte = 255;
            self.left_level_scaled = 0;
        } else {
            self.left_level_byte = (self.left_level >> 2) as u8;
            self.scale_mult = self.eeprom.adc_scales_l[self.gain as usize];
            self.left_level_scaled =
                i32::from(Self::mul_div_int(self.left_level, self.scale_mult, self.scale_div));
        }
    }

    fn patch_copy_from_ee(&mut self) {
        // Load the persisted startup settings into the live state.
        self.inc_rast = self.eeprom.init_inc_rast;
        self.gain = self.eeprom.init_gain;
        self.spdif_rate = self.eeprom.init_rate;
    }

    fn ser_crlf(&mut self) {
        self.ser_out("\r\n");
    }

    fn write_ch_prefix(&mut self) {
        let mut prefix = String::new();
        let _ = write!(
            prefix,
            "#{}:{}=",
            char::from(b'0' + self.slave_ch),
            self.sub_ch
        );
        self.ser_out(&prefix);
    }

    fn write_ser_inp(&mut self) {
        let line = self.ser_inp_str.clone();
        self.ser_out(&line);
        self.ser_crlf();
    }

    fn ser_prompt(&mut self, my_err: Error, my_status: u8) {
        // Serial replies carry live status bits in the upper part and the current
        // error code in the low bits, matching the original ACV wire protocol.
        if self.verbose || my_err != Error::NoErr {
            self.sub_ch = ERR_SUB_CH;
            self.write_ch_prefix();
            let value = (my_err as u8).wrapping_add(my_status);
            self.ser_out(&value.to_string());
            self.ser_out(" ");
            self.ser_out(ERR_STR_ARR[my_err as usize]);
            self.ser_crlf();
        }
        if my_err != Error::NoErr {
            self.err_count += 1;
            self.err_flag = true;
        }
    }

    fn i2c_out_adr10(&mut self, register: u8, data: u8) {
        // The Pascal code uses TWI address 0x10 to reach the CS8406 control path.
        self.hw.twi_out_10(register, data);
    }

    fn i2c_in_adr10(&self, register: u8) -> u8 {
        self.hw.twi_in_10(register)
    }

    fn init_spdif(&mut self) {
        // Program the SPDIF transmitter for the selected 48/96/192 kHz clock mode.
        self.i2c_out_adr10(0x04, 0b0000_0000);
        self.i2c_out_adr10(0x01, 0b0000_0001);
        self.i2c_out_adr10(0x12, 0b0000_0000);

        match self.spdif_rate {
            Spdif::C96Khz | Spdif::P96Khz => {
                self.i2c_out_adr10(0x04, 0b0100_0000);
            }
            Spdif::C192Khz | Spdif::P192Khz => {
                self.i2c_out_adr10(0x04, 0b0111_0000);
            }
            _ => {
                self.i2c_out_adr10(0x04, 0b0110_0000);
            }
        }

        self.i2c_out_adr10(0x05, 0b0000_0101);
        // Channel-status bytes follow the consumer-mode layout from the CS8406 notes.
        self.i2c_out_adr10(0x20, 0b0010_0000);
        self.i2c_out_adr10(0x21, 0b0100_0001);
        self.i2c_out_adr10(0x22, 0b0000_0000);
        self.i2c_out_adr10(0x23, 0b0100_1000);
        self.i2c_out_adr10(0x24, 0b1100_0110);
        self.i2c_out_adr10(0x25, 0b1011_0110);
        self.i2c_out_adr10(0x26, 0b1111_0100);
        self.i2c_out_adr10(0x27, 0b1100_0110);
        self.i2c_out_adr10(0x28, 0b1110_0100);
        self.i2c_out_adr10(0x29, 0b0010_1110);
    }

    fn switch_gain(&mut self) {
        // Map the logical gain to the relay/multiplexer pattern on Port B.
        if self.gain == self.old_gain {
            return;
        }
        self.old_gain = self.gain;
        self.switch_state = SWITCH_ARR[self.gain as usize] | PORTB_INIT;
        self.hw.port_b = self.switch_state;
    }

    fn write_param_str_ser(&mut self) {
        self.write_ch_prefix();
        let param = self.param_str.clone();
        self.ser_out(&param);
        self.ser_crlf();
    }

    fn param_to_str(&mut self) {
        self.param_str = self.param_int.to_string();
    }

    fn param_to_str_scaled(&mut self) {
        if self.gain > 4 {
            let value = format!("{:>3}", self.param_int);
            let mut chars: Vec<char> = value.chars().collect();
            if chars.len() >= 3 {
                chars.insert(2, '.');
            }
            self.param_str = chars.into_iter().collect();
        } else {
            self.param_str = format!("{:>4}", self.param_int);
        }
    }

    fn write_param_ser(&mut self) {
        self.param_to_str();
        self.write_param_str_ser();
    }

    fn write_param_byte_ser(&mut self) {
        self.param_str = self.param_byte.to_string();
        self.write_param_str_ser();
    }

    fn soll_werte_on_lcd(&mut self) {
        self.digits = 2;
        self.nachkomma = 1;
        let mut my_modify = self.modify;

        if !self.bar_graph_delay_timer.is_zero()
            && matches!(self.modify, Modify::LevelBarDispl | Modify::MvDispl)
        {
            my_modify = Modify::GainSel;
        }

        match my_modify {
            Modify::MvDispl => {
                if self.incr_enter {
                    self.eeprom.init_gain = self.gain;
                }
                // Display the scaled TRMS reading in mV, or the overload marker.
                self.get_levels();
                let left = if self.left_level_byte > 253 {
                    format!("{}{}", self.upper_channel, OVERLOAD_STR)
                } else {
                    self.param_int = self.left_level_scaled;
                    self.param_to_str_scaled();
                    format!("{}{}{}", self.upper_channel, self.param_str, MV_STR)
                };
                let right = if self.right_level_byte > 253 {
                    format!("{}{}", self.lower_channel, OVERLOAD_STR)
                } else {
                    self.param_int = self.right_level_scaled;
                    self.param_to_str_scaled();
                    format!("{}{}{}", self.lower_channel, self.param_str, MV_STR)
                };
                self.hw.lcd_write_line(0, left);
                self.hw.lcd_write_line(1, right);
            }
            Modify::LevelBarDispl => {
                if self.incr_enter {
                    self.eeprom.init_gain = self.gain;
                }
                // Same measurement path as the mV view, but rendered as a bargraph.
                self.get_levels();
                self.hw.lcd_write_line(0, self.upper_channel.to_string());
                self.hw.lcd_write_line(1, self.lower_channel.to_string());
                self.hw.lcd_bar_out(0, self.left_level_byte);
                self.hw.lcd_bar_out(1, self.right_level_byte);
            }
            Modify::GainSel => {
                if self.incr_enter {
                    self.eeprom.init_gain = self.gain;
                }
                let my_gain = i32::from(self.gain) * 10 - 20;
                self.gain_str = format!("{:+3}", my_gain);
                self.hw
                    .lcd_write_line(0, format!("{}{}", self.gain_str, DB_STR));
                self.hw.lcd_write_line(1, GAIN_SEL_STR.to_string());
            }
            Modify::AuxCmdSel => {
                if self.incr_enter {
                    self.eeprom.init_aux_cmd = self.aux_cmd;
                }
                self.hw
                    .lcd_write_line(0, format!("{AUX_CMD_SEL_STR} {:02X}", self.aux_cmd));
                self.hw.lcd_write_line(1, AUX_CMD_STR.to_string());
            }
            Modify::RateSel => {
                if self.incr_enter {
                    self.eeprom.init_rate = self.spdif_rate;
                }
                self.hw
                    .lcd_write_line(0, RATE_STR_ARR[self.spdif_rate as usize].to_string());
                self.hw.lcd_write_line(1, RATE_SEL_STR.to_string());
            }
        }

        if self.incr_enter {
            self.hw.lcd_write_line(1, MEMORIZED_STR.to_string());
            self.display_timer.set(100);
        }
        self.incr_enter = false;
    }

    fn check_limits(&mut self) -> bool {
        // Report whether a caller tried to step beyond the legal gain/rate range.
        let mut out_of_range = false;

        if self.gain > 127 {
            self.gain = 0;
            out_of_range = true;
        }
        if self.gain > 7 {
            self.gain = 7;
            out_of_range = true;
        }
        if self.spdif_rate as u8 > 5 {
            self.spdif_rate = Spdif::P192Khz;
            out_of_range = true;
        }

        out_of_range
    }

    fn parse_get_param(&mut self) {
        // Subchannels expose sample-rate, gain, live levels, calibration tables,
        // status, and identity values from the original command set.
        let my_index = self.sub_ch % 10;
        self.digits = 2;
        self.nachkomma = 1;

        match self.sub_ch {
            8 => {
                self.param_byte = self.spdif_rate as u8;
                self.write_param_byte_ser();
            }
            10 => {
                self.get_levels();
                self.param_int = self.left_level_scaled;
                if self.left_overload {
                    self.param_str = "-9999 [OVERLD]".to_string();
                } else {
                    self.param_to_str_scaled();
                }
                self.write_param_str_ser();
            }
            11 => {
                self.get_levels();
                self.param_int = self.right_level_scaled;
                if self.right_overload {
                    self.param_str = "-9999 [OVERLD]".to_string();
                } else {
                    self.param_to_str_scaled();
                }
                self.write_param_str_ser();
            }
            19 => {
                self.param_byte = self.gain;
                self.write_param_byte_ser();
            }
            50 => {
                self.get_levels();
                self.param_int = i32::from(self.left_level);
                self.write_param_ser();
            }
            51 => {
                self.get_levels();
                self.param_int = i32::from(self.right_level);
                self.write_param_ser();
            }
            80 => {
                self.param_byte = self.modify as u8;
                self.write_param_byte_ser();
            }
            89 => {
                self.param_byte = self.inc_rast as u8;
                self.write_param_byte_ser();
            }
            99 => {
                // "ALL" returns both RMS channels as two consecutive replies.
                self.get_levels();
                self.param_int = self.left_level_scaled;
                if self.left_level_byte > 253 {
                    self.param_str = "-9999 [OVERLD]".to_string();
                } else {
                    self.param_to_str_scaled();
                }
                self.sub_ch = 10;
                self.write_param_str_ser();

                self.param_int = self.right_level_scaled;
                if self.right_level_byte > 253 {
                    self.param_str = "-9999 [OVERLD]".to_string();
                } else {
                    self.param_to_str_scaled();
                }
                self.sub_ch = 11;
                self.write_param_str_ser();
            }
            150 => {
                self.param_byte = self.eeprom.init_gain;
                self.write_param_byte_ser();
            }
            151 => {
                self.param_byte = self.eeprom.init_rate as u8;
                self.write_param_byte_ser();
            }
            152 => {
                self.param_byte = u8::from(self.eeprom.init_lr_swap);
                self.write_param_byte_ser();
            }
            200..=207 => {
                self.param_int = i32::from(self.eeprom.adc_scales_l[my_index as usize]);
                self.write_param_ser();
            }
            210..=217 => {
                self.param_int = i32::from(self.eeprom.adc_scales_r[my_index as usize]);
                self.write_param_ser();
            }
            230 => {
                self.param_byte = self.i2c_in_adr10(0x7f);
                self.write_param_byte_ser();
            }
            251 => {
                // Error count since reset.
                self.param_int = self.err_count;
                self.write_param_ser();
            }
            252 => {
                // Stored UART divisor; it only takes effect after the next reset.
                self.param_byte = self.eeprom.ee_ser_baud_reg;
                self.write_param_byte_ser();
            }
            253 => {
                // Serial test: echo the input line unchanged.
                let line = self.ser_inp_str.clone();
                self.ser_out(&line);
                self.ser_crlf();
            }
            254 => {
                self.write_ch_prefix();
                self.ser_out(VERS1_STR);
                self.ser_crlf();
            }
            250 | 255 => {
                self.ser_prompt(Error::NoErr, self.status);
            }
            _ => self.ser_prompt(Error::ParamErr, 0),
        }
    }

    fn parse_set_param(&mut self) {
        let my_index = self.sub_ch % 10;

        if self.busy_flag() {
            self.ser_prompt(Error::BusyErr, 0);
            return;
        }

        self.changed_flag = true;

        match self.sub_ch {
            8 => {
                self.spdif_rate = Self::spdif_from_byte(self.param_byte);
                self.check_limits();
                self.init_spdif();
            }
            9 => self.ser_aux(self.param_byte),
            19 => {
                self.gain = self.param_byte;
                self.check_limits();
            }
            20 => {}
            80 => {
                // Select which front-panel display mode the LCD should show.
                if self.param_byte > Modify::LevelBarDispl as u8 {
                    self.ser_prompt(Error::ParamErr, 0);
                    return;
                }
                self.modify = Self::modify_from_byte(self.param_byte);
            }
            89 => {
                // Number of encoder pulses that make one detent step.
                if self.ee_unlocked() {
                    self.inc_rast = self.param_int;
                    self.eeprom.init_inc_rast = self.inc_rast;
                } else {
                    self.ser_prompt(Error::LockedErr, 0);
                    return;
                }
            }
            150..=152 | 200..=217 => {
                if self.ee_unlocked() {
                    match self.sub_ch {
                        150 => self.eeprom.init_gain = self.param_byte,
                        151 => self.eeprom.init_rate = Self::spdif_from_byte(self.param_byte),
                        152 => self.eeprom.init_lr_swap = self.param_byte != 0,
                        200..=207 => {
                            self.eeprom.adc_scales_l[my_index as usize] = self.param_int as u16
                        }
                        210..=217 => {
                            // Original Pascal writes ADCscalesL here as well. Kept intentionally.
                            self.eeprom.adc_scales_l[my_index as usize] = self.param_int as u16
                        }
                        _ => {}
                    }
                } else {
                    self.ser_prompt(Error::LockedErr, 0);
                    return;
                }
            }
            251 => self.err_count = self.param_int,
            252 => {
                // Baud-rate changes are stored now but only applied after reboot.
                if self.ee_unlocked() {
                    self.eeprom.ee_ser_baud_reg = self.param_byte;
                } else {
                    self.ser_prompt(Error::LockedErr, 0);
                    return;
                }
            }
            250 => {}
            _ => {
                self.ser_prompt(Error::ParamErr, 0);
                return;
            }
        }

        self.set_ee_unlocked(false);
        // Subchannel 250 temporarily unlocks EEPROM-backed settings.
        if self.sub_ch == 250 {
            self.set_ee_unlocked(true);
        }

        if self.check_limits() {
            self.ser_prompt(Error::ParamErr, self.status);
        } else {
            self.ser_prompt(Error::NoErr, self.status);
        }
        self.switch_gain();
    }

    fn cmd_to_index(&mut self) -> CmdWhich {
        // Translate the textual command token into a command-table entry.
        self.param_str = self.param_str.to_uppercase();
        for (idx, cmd) in CMD_STR_ARR.iter().enumerate() {
            if self.param_str == *cmd {
                return match idx {
                    0 => CmdWhich::Str,
                    1 => CmdWhich::Idn,
                    2 => CmdWhich::Val,
                    3 => CmdWhich::Wav,
                    4 => CmdWhich::Bst,
                    5 => CmdWhich::Aux,
                    6 => CmdWhich::Inl,
                    7 => CmdWhich::Rng,
                    8 => CmdWhich::Dsp,
                    9 => CmdWhich::All,
                    10 => CmdWhich::Scl,
                    11 => CmdWhich::Wen,
                    12 => CmdWhich::Erc,
                    _ => CmdWhich::Err,
                };
            }
        }
        CmdWhich::Err
    }

    fn parse_extract(&mut self) -> bool {
        // Integer-only token extraction: digits form parameters, letters form commands.
        self.param_str.clear();
        let bytes = self.ser_inp_str.as_bytes();
        let mut is_param = false;

        // Skip leading spaces before the next token.
        while self.ser_inp_ptr < bytes.len() && bytes[self.ser_inp_ptr] == b' ' {
            self.ser_inp_ptr += 1;
        }

        if self.ser_inp_ptr >= bytes.len() {
            return false;
        }

        let first = bytes[self.ser_inp_ptr];
        if (b'*'..=b'9').contains(&first) {
            is_param = true;
            while self.ser_inp_ptr < bytes.len() {
                let my_char = bytes[self.ser_inp_ptr] as char;
                if my_char.is_ascii_digit() {
                    self.param_str.push(my_char);
                    self.ser_inp_ptr += 1;
                } else {
                    return is_param;
                }
            }
        } else {
            while self.ser_inp_ptr < bytes.len() {
                let my_char = bytes[self.ser_inp_ptr] as char;
                if my_char >= 'A' {
                    self.param_str.push(my_char);
                    self.ser_inp_ptr += 1;
                } else {
                    return is_param;
                }
            }
        }

        is_param
    }

    fn parse_sub_ch(&mut self) {
        // Pre-parse the incoming line, reject traffic for other channels, and then
        // dispatch either a direct subchannel access or a named command.
        if self.ser_inp_str.is_empty() {
            self.ser_prompt(Error::NoErr, 0);
            return;
        }

        let has_main_ch = self.ser_inp_str.contains(':');
        let is_request = !self.ser_inp_str.contains('=');
        let first_char = self.ser_inp_str.chars().next().unwrap_or_default();
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
                self.write_ser_inp();
            } else if let Ok(ch) = self.param_str.parse::<u8>() {
                self.current_ch = ch;
            }
        }

        if !is_omni && self.current_ch != self.slave_ch && has_main_ch {
            self.write_ser_inp();
            return;
        }

        self.verbose = self.ser_inp_str.contains('!') || self.ser_inp_str.contains('?');
        if let Some(checksum_pos) = self.ser_inp_str.find('$') {
            // XOR checksum covers everything before '$'; the '$xx' suffix is excluded.
            let checksum_hex = self
                .ser_inp_str
                .get(checksum_pos + 1..checksum_pos + 3)
                .unwrap_or_default();
            let checksum_in = u8::from_str_radix(checksum_hex, 16).unwrap_or_default();
            let checksum = self.ser_inp_str[..checksum_pos]
                .bytes()
                .fold(0u8, |acc, byte| acc ^ byte);
            if checksum != checksum_in {
                self.ser_prompt(Error::ChecksumErr, 0);
                return;
            }
        }

        self.activity_timer.set(25);
        self.hw.led_activity = false;

        let sub_ch_offset = if self.parse_extract() {
            0
        } else {
            self.cmd_which = self.cmd_to_index();
            if self.cmd_which == CmdWhich::Err {
                self.ser_prompt(Error::SyntaxErr, 0);
                return;
            }
            let offset = CMD2_SUB_CH_ARR[self.cmd_which as usize];
            let _ = self.parse_extract();
            offset
        };

        let base_sub_ch = match self.param_str.parse::<u8>() {
            Ok(value) => value,
            Err(_) => {
                self.ser_prompt(Error::ParamErr, 0);
                return;
            }
        };
        self.sub_ch = base_sub_ch.wrapping_add(sub_ch_offset);

        if is_request {
            self.parse_get_param();
        } else if let Some(eq_pos) = self.ser_inp_str.find('=') {
            self.ser_inp_ptr = eq_pos + 1;
            if self.parse_extract() {
                match self.param_str.parse::<i32>() {
                    Ok(value) => {
                        self.param_int = value;
                        self.param_byte = value as u8;
                    }
                    Err(_) => {
                        self.ser_prompt(Error::ParamErr, 0);
                        return;
                    }
                }
            } else {
                self.ser_prompt(Error::ParamErr, 0);
                return;
            }
            self.parse_set_param();
        } else {
            self.ser_prompt(Error::ParamErr, 0);
        }
    }

    fn chores(&mut self) {}

    pub fn push_serial_char(&mut self, my_char: char) {
        // Keep only printable 7-bit ASCII and treat carriage return as end-of-command.
        if (' '..='\u{7f}').contains(&my_char) {
            self.ser_inp_str.push(my_char);
        }
        if my_char == '\u{8}' {
            self.ser_inp_str.pop();
        }
        if my_char == '\r' {
            self.parse_sub_ch();
            self.ser_inp_str.clear();
        }
    }

    fn check_delay(&mut self, my_delay: u8) {
        // The Pascal firmware used this delay to keep polling work alive between UI samples.
        for _ in 0..my_delay {
            self.chores();
        }
    }

    fn init_all(&mut self) {
        self.hw.port_b = PORTB_INIT;
        self.hw.port_c = PORTC_INIT;
        self.hw.port_d = PORTD_INIT;

        if !(9..=239).contains(&self.eeprom.ee_ser_baud_reg) {
            self.eeprom.ee_ser_baud_reg = 51;
        }

        self.patch_copy_from_ee();
        self.slave_ch = (!self.hw.pin_d) >> 5;
        self.hw.led_activity = false;
        self.hw.lcd_present = true;
        // The original boot code uploads custom LCD glyphs before showing version/address.
        self.hw.lcd_write_line(0, VERS3_STR.to_string());
        self.hw
            .lcd_write_line(1, format!("{ADR_STR}{}", char::from(b'0' + self.slave_ch)));

        if self.eeprom.ee_initialized != EE_INITIALIZED_MAGIC {
            // Empty EEPROM falls back to the built-in defaults from the Pascal image.
            self.eeprom = EepromImage::default();
            self.patch_copy_from_ee();
        }

        self.switch_gain();
        self.hw.led_activity = true;
        self.status = 0;
        self.incr_value = 0;
        self.old_incr_value = 0;
        self.incr_diff = 0;
        self.incr_enter = false;
        self.modify = Modify::GainSel;
        self.soll_werte_on_lcd();
        self.modify = Modify::LevelBarDispl;
        self.first_turn = true;
        self.sub_ch = 254;
        self.write_ch_prefix();
        self.ser_out(VERS1_STR);
        if self.eeprom.ee_initialized != EE_INITIALIZED_MAGIC {
            self.ser_out(EE_NOT_PROGRAMMED_STR);
        }
        self.ser_crlf();
        self.current_ch = 255;
        self.err_count = 0;
        self.changed_flag = true;
        self.bar_graph_delay_timer.set(150);
        self.aux_cmd = self.eeprom.init_aux_cmd;
        self.ser_aux(self.aux_cmd);
        self.init_spdif();

        if self.eeprom.init_lr_swap {
            self.upper_channel = 'R';
            self.lower_channel = 'L';
        } else {
            self.upper_channel = 'L';
            self.lower_channel = 'R';
        }
    }

    pub fn main_loop_step(&mut self, new_rotary_value: i32, button_temp: Option<u8>) {
        self.hw.rotary_value = new_rotary_value;

        if self.activity_timer.is_zero() {
            self.hw.led_activity = true;
        }

        if self.hw.lcd_present {
            self.incr_value = self.hw.rotary_value;

            if self.incr_value != self.old_incr_value {
                self.activity_timer.set(25);
                self.hw.led_activity = false;
                self.incr_diff += self.incr_value - self.old_incr_value;
                self.old_incr_value = self.incr_value;
                self.incr_timer.set(20);

                // The hardware encoder resolves in two-count steps, so changes are
                // only applied once enough pulses have accumulated for one detent.
                if self.incr_diff.abs() >= self.inc_rast {
                    self.changed_flag = true;
                    self.set_busy_flag(true);
                    self.incr_diff /= self.inc_rast;
                    self.incr_diff_byte = self.incr_diff as u8;

                    // Fast turns accelerate by doubling the effective step size.
                    if self.incr_diff.abs() > 1 {
                        self.incr_diff *= 2;
                    }
                    if self.incr_diff.abs() > 2 {
                        self.incr_diff *= 2;
                    }

                    self.incr_acc_int10 = self.incr_diff * 10;
                    self.display_timer.set(10);

                    if self.first_turn {
                        self.ser_prompt(Error::NoErr, self.status.wrapping_add(67));
                    }

                    match self.modify {
                        Modify::AuxCmdSel => {
                            self.aux_cmd = self.aux_cmd.wrapping_add(self.incr_diff as u8);
                            self.sub_ch = 9;
                            self.parse_get_param();
                            // Forward the helper command to the attached ULD/aux device.
                            self.ser_aux(self.aux_cmd);
                        }
                        Modify::RateSel => {
                            let next = (self.spdif_rate as i32 + i32::from(self.incr_diff_byte))
                                .clamp(0, 5) as u8;
                            self.spdif_rate = Self::spdif_from_byte(next);
                            self.check_limits();
                            self.init_spdif();
                        }
                        Modify::GainSel | Modify::MvDispl | Modify::LevelBarDispl => {
                            self.display_timer.set(10);
                            self.bar_graph_delay_timer.set(75);
                            self.gain = self.gain.wrapping_add(self.incr_diff_byte);
                            self.check_limits();
                            self.switch_gain();
                            self.sub_ch = 19;
                            self.parse_get_param();
                        }
                    }

                    self.incr_diff = 0;
                    self.check_limits();
                    self.soll_werte_on_lcd();
                    self.first_turn = false;
                }
            }

            self.check_delay(1);

            if let Some(button_temp) = button_temp {
                self.hw.button_temp = button_temp;
                if button_temp != 0xff {
                    // Front-panel buttons are wired active-low.
                    self.changed_flag = true;
                    self.set_busy_flag(true);

                    let button_enter = button_temp & (1 << 3) == 0;
                    let button_left = button_temp & (1 << 5) == 0;
                    let button_right = button_temp & (1 << 4) == 0;

                    if button_enter {
                        self.ser_prompt(Error::NoErr, self.status.wrapping_add(67));
                        self.incr_enter = true;
                    }
                    if button_left {
                        self.ser_prompt(Error::NoErr, self.status.wrapping_add(65));
                        self.modify = Self::next_modify(self.modify);
                    }
                    if button_right {
                        self.ser_prompt(Error::NoErr, self.status.wrapping_add(66));
                        self.modify = Self::prev_modify(self.modify);
                    }

                    self.display_timer.set(10);
                    self.soll_werte_on_lcd();
                    self.first_turn = false;
                }
            }
        }

        if self.incr_timer.is_zero() {
            self.incr_timer.set(20);
            if !self.first_turn {
                self.ser_prompt(Error::NoErr, self.status.wrapping_add(64));
            }
            self.first_turn = true;
        }

        if self.display_timer.is_zero() && self.hw.lcd_present {
            self.display_timer.set(10);
            self.set_busy_flag(false);
            self.soll_werte_on_lcd();
            self.changed_flag = false;
        }

        self.activity_timer.tick();
        self.display_timer.tick();
        self.bar_graph_delay_timer.tick();
        self.incr_timer.tick();
    }

    fn spdif_from_byte(value: u8) -> Spdif {
        match value {
            1 => Spdif::C96Khz,
            2 => Spdif::C192Khz,
            3 => Spdif::P48Khz,
            4 => Spdif::P96Khz,
            5 => Spdif::P192Khz,
            _ => Spdif::C48Khz,
        }
    }

    fn modify_from_byte(value: u8) -> Modify {
        match value {
            0 => Modify::AuxCmdSel,
            1 => Modify::RateSel,
            2 => Modify::GainSel,
            3 => Modify::LevelBarDispl,
            4 => Modify::MvDispl,
            _ => Modify::GainSel,
        }
    }

    fn next_modify(value: Modify) -> Modify {
        match value {
            Modify::AuxCmdSel => Modify::RateSel,
            Modify::RateSel => Modify::GainSel,
            Modify::GainSel => Modify::LevelBarDispl,
            Modify::LevelBarDispl => Modify::MvDispl,
            Modify::MvDispl => Modify::AuxCmdSel,
        }
    }

    fn prev_modify(value: Modify) -> Modify {
        match value {
            Modify::AuxCmdSel => Modify::MvDispl,
            Modify::RateSel => Modify::AuxCmdSel,
            Modify::GainSel => Modify::RateSel,
            Modify::LevelBarDispl => Modify::GainSel,
            Modify::MvDispl => Modify::LevelBarDispl,
        }
    }
}
