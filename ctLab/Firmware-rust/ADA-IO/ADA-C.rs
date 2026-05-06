//! Best-effort Rust port of `ADA-C.pas`.
//!
//! This keeps the original firmware structure readable:
//! - command/error enums
//! - EEPROM defaults and runtime state
//! - DAC, port, and parameter conversion logic
//! - serial response formatting
//! - high-level initialization and trigger scan flow
//!
//! Hardware-specific units imported by the Pascal source
//! (`SysTick`, `ADCport`, `TWImaster`, `LCDmultiPort`, `SerPort`,
//! `I2CExpand`, `IncrPort4`, `ADA-C-HW.pas`, `ADA-C-Parser.pas`)
//! are represented here behind a trait and TODO-style placeholders.

#![allow(dead_code)]

use std::fmt::Write as _;

pub type Float = f32;

pub const PROC_CLOCK: u32 = 16_000_000;

pub const DDR_B_INIT: u8 = 0b0101_1011;
pub const PORT_B_INIT: u8 = 0b1011_1111;
pub const DDR_C_INIT: u8 = 0b1111_1100;
pub const PORT_C_INIT: u8 = 0b0000_0011;
pub const DDR_D_INIT: u8 = 0b0000_1100;
pub const PORT_D_INIT: u8 = 0b1111_1100;

pub const B_SCLK: u8 = 0;
pub const B_SDATAOUT: u8 = 1;
pub const B_TRIG: u8 = 2;
pub const B_STR_DAC: u8 = 3;
pub const B_STR_AD16: u8 = 4;
pub const B_SDATAIN1: u8 = 5;
pub const B_STR_SR: u8 = 6;
pub const B_SENSE: u8 = 7;
pub const B_STR_DA_MUX: u8 = 5;

pub const VERS1_STR: &str = "1.742 [ADA by CM/c't 04/2007; ";
pub const VERS3_STR: &str = "ADA 1.74";
pub const ADR_STR: &str = "Adr ";
pub const CARDS_STR: &str = "IO-Cards";
pub const VALUE_STR: &str = "Value ";
pub const EE_NOT_PROGRAMMED_STR: &str = "EEPROM EMPTY! ";
pub const DAC12_STR: &str = "DA12 ";
pub const DAC16_STR: &str = "DA16 ";
pub const ADC16_STR: &str = "AD16 ";
pub const LCD_STR: &str = "LCD ";
pub const IO816_STR: &str = "IO32 ";
pub const EGG_STR: &str = "28.5 [Michaela, ich liebe dich!]";
pub const ERR_SUB_CH: u8 = 255;

pub const ERR_STR_ARR: [&str; 8] = [
    "[OK]",
    "[SRQUSR]",
    "[BUSY]",
    "[OVERLD]",
    "[CMDERR]",
    "[PARERR]",
    "[LOCKED]",
    "[CHKSUM]",
];

pub const CMD_STR_ARR: [&str; 25] = [
    "TRG", "STR", "IDN", "VAL", "OFS", "SCL", "RAW", "PIO", "DIR", "DSP", "ALL", "OPT",
    "TRM", "TRT", "TRL", "ICB", "ICW", "ICS", "ICT", "ICA", "REF", "WEN", "ERC", "SBD",
    "NOP",
];

pub const CMD2_SUB_CH_ARR: [u8; 25] = [
    249, 255, 254, 0, 100, 200, 50, 30, 40, 80, 95, 150, 240, 247, 248, 230, 231, 232, 233,
    239, 246, 250, 251, 252, 0,
];

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
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

#[derive(Debug, Clone)]
pub struct EepromData {
    pub offset_array: [i16; 28],
    pub scale_array: [Float; 30],
    pub dir_init_array: [u8; 8],
    pub trig_mask_array: [u8; 4],
    pub trig_level: u8,
    pub trig_timer_value: u16,
    pub init_integrate_ad16: bool,
    pub ext_ref: u8,
    pub inc_rast_def: i16,
    pub ee_ser_baud_reg: u8,
    pub param_text_array: [&'static str; 38],
    pub ee_initialised: u16,
    pub port_init_array: [u8; 8],
}

impl Default for EepromData {
    fn default() -> Self {
        Self {
            // Sub-channel layout from the original firmware:
            // 0..7 = internal ATmega ADC10, 8..9 = legacy ADC24, 10..17 = AD16-8, 20..27 = DACs.
            // The AD16 defaults keep a small negative trim; the DAC offsets are in raw-code units.
            offset_array: [
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -40, -40, -40, -40, -40, -40, -40, -40, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0,
            ],
            // Entries 9, 19, 28, and 29 are the firmware's base scales:
            // internal ADC10, external ADC16, DAC12, and DAC16 respectively.
            scale_array: [
                1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 0.0, 100.0, 1.0, 1.0, 1.0, 1.0, 1.0,
                1.0, 1.0, 1.0, 0.0, 3185.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 200.0,
                3200.0,
            ],
            // Startup direction defaults for the eight digital I/O ports.
            dir_init_array: [0; 8],
            // Trigger masks cover internal AD10, external AD16, a currently unused DAC group,
            // and the eight digital ports.
            trig_mask_array: [0; 4],
            trig_level: 0,
            trig_timer_value: 0,
            init_integrate_ad16: false,
            ext_ref: 1,
            inc_rast_def: 4,
            // Stored as the raw UBRR value with U2X enabled, matching the Pascal firmware.
            ee_ser_baud_reg: 51,
            param_text_array: [""; 38],
            // EEPROM marker used to decide whether defaults were ever programmed.
            ee_initialised: 0xAA55,
            // Startup output values for the eight digital ports.
            port_init_array: [0; 8],
        }
    }
}

#[derive(Debug, Default, Clone, Copy)]
pub struct RuntimeStatus {
    // Bits 0..3 are the code reported to the host; bits 4..7 carry device state flags.
    pub error_low_nibble: u8,
    pub ee_unlocked: bool,
    pub overload_flag: bool,
    pub user_srq_flag: bool,
    pub busy_flag: bool,
}

impl RuntimeStatus {
    pub fn as_byte(self) -> u8 {
        // Preserve the original serial status-byte layout.
        (self.error_low_nibble & 0x0f)
            | ((self.ee_unlocked as u8) << 4)
            | ((self.overload_flag as u8) << 5)
            | ((self.user_srq_flag as u8) << 6)
            | ((self.busy_flag as u8) << 7)
    }
}

pub trait AdaHardware {
    fn get_adc(&mut self, channel_1_based: u8) -> i16;
    fn twi_out(&mut self, slave_addr: u8, command: u16) -> bool;
    fn shift_out_sr(&mut self, port_array: &[u8; 8]);
    fn read_io_pin(&mut self, port: u8) -> u8;
    fn write_io_dir(&mut self, port: u8, value: u8);
    fn detect_i2c_expander(&mut self) -> bool;
    fn detect_sense(&mut self) -> bool;
    fn read_slave_channel(&mut self) -> u8;
    fn set_external_trigger_edge(&mut self, positive: bool);
    fn enable_interrupts(&mut self);
}

#[derive(Debug, Clone)]
pub struct DeviceState<H> {
    pub hw: H,
    pub eeprom: EepromData,
    pub port_array: [u8; 8],
    pub io_pin_cache: [u8; 8],
    pub dac_value_array: [Float; 8],
    pub dac_raw_array: [u16; 8],
    pub adc_raw_array: [i16; 8],
    pub omni_flag: bool,
    pub verbose: bool,
    pub ad10_flag: bool,
    pub ad16_flag: bool,
    pub dac12_present: bool,
    pub dac16_present: bool,
    pub dac714_present: bool,
    pub adc16_present: bool,
    pub adc24_1_present: bool,
    pub adc24_2_present: bool,
    pub lcd_present: bool,
    pub io_present: bool,
    pub integrate_ad16: bool,
    pub trigger: bool,
    pub trig_mask: u8,
    pub ser_inp_str: String,
    pub param_str: String,
    pub param_text_str: String,
    pub param: Float,
    pub param_int: i16,
    pub param_byte: u8,
    pub cmd_which: CmdWhich,
    pub cmd_str: String,
    pub slave_ch: u8,
    pub sub_ch: u8,
    pub current_ch: u8,
    pub modify: u8,
    pub digits: u8,
    pub nachkomma: u8,
    pub changed_flag: bool,
    pub status: RuntimeStatus,
    pub err_count: i16,
    pub err_flag: bool,
    pub base_scale_ad10: Float,
    pub base_scale_ad16: Float,
    pub base_scale_da12: Float,
    pub base_scale_da16: Float,
    pub i2c_slave_adr: u8,
}

impl<H: AdaHardware> DeviceState<H> {
    pub fn new(hw: H) -> Self {
        Self {
            hw,
            eeprom: EepromData::default(),
            port_array: [0; 8],
            io_pin_cache: [0; 8],
            dac_value_array: [0.0; 8],
            dac_raw_array: [0; 8],
            adc_raw_array: [0; 8],
            omni_flag: false,
            verbose: false,
            ad10_flag: false,
            ad16_flag: false,
            dac12_present: false,
            dac16_present: false,
            dac714_present: false,
            adc16_present: false,
            adc24_1_present: false,
            adc24_2_present: false,
            lcd_present: false,
            io_present: false,
            integrate_ad16: false,
            trigger: false,
            trig_mask: 0,
            ser_inp_str: String::new(),
            param_str: String::new(),
            param_text_str: String::new(),
            param: 0.0,
            param_int: 0,
            param_byte: 0,
            cmd_which: CmdWhich::Nop,
            cmd_str: String::new(),
            slave_ch: 0,
            sub_ch: 0,
            current_ch: 0,
            modify: 20,
            digits: 1,
            nachkomma: 4,
            changed_flag: true,
            status: RuntimeStatus::default(),
            err_count: 0,
            err_flag: false,
            base_scale_ad10: 100.0,
            base_scale_ad16: 3185.0,
            base_scale_da12: 200.0,
            base_scale_da16: 3200.0,
            i2c_slave_adr: 0x48,
        }
    }

    pub fn ext_int2_trigger(&mut self) {
        self.trigger = true;
    }

    pub fn set_base_scales(&mut self) {
        // These lookup slots were treated as the firmware-wide conversion bases.
        self.base_scale_ad10 = self.eeprom.scale_array[9];
        self.base_scale_ad16 = self.eeprom.scale_array[19];
        self.base_scale_da12 = self.eeprom.scale_array[28];
        self.base_scale_da16 = self.eeprom.scale_array[29];
    }

    pub fn set_dac(&mut self, my_sub_ch: u8) {
        if !(20..=27).contains(&my_sub_ch) {
            return;
        }

        let index = (my_sub_ch - 20) as usize;
        let my_offset = self.eeprom.offset_array[my_sub_ch as usize] as i32;
        let my_scale = self.eeprom.scale_array[my_sub_ch as usize];
        let my_val = self.dac_value_array[index];

        if self.dac714_present {
            // DAC714/PCM56 keeps a signed bipolar raw range centered around 0 V.
            let mut raw = (self.base_scale_da16 * (my_val * my_scale)) as i32 + my_offset;
            raw = raw.clamp(-32767, 32767);
            self.dac_raw_array[index] = raw as i16 as u16;
        }

        if self.dac16_present {
            // LTC1655 uses an inverted unsigned code: 0xffff..0 maps to -FS..+FS.
            let mut raw = (self.base_scale_da16 * (my_val * my_scale)) as i32 + my_offset;
            raw = raw.clamp(-32767, 32767);
            self.dac_raw_array[index] = (0x8000_i32 - raw) as u16;
        }

        if self.dac12_present {
            // LTC1257 follows the older 12-bit variant of the same bipolar coding.
            let mut raw = (self.base_scale_da12 * (my_val * my_scale)) as i32 + my_offset;
            raw = raw.clamp(-2047, 2047);
            self.dac_raw_array[index] = (0x0800_i32 - raw) as u16;
        }
    }

    pub fn get_port(&mut self, my_port: u8) -> u8 {
        let index = my_port as usize;
        if self.io_present {
            let value = self.hw.read_io_pin(my_port);
            self.io_pin_cache[index] = value;
            value
        } else {
            self.port_array[index]
        }
    }

    pub fn set_port(&mut self, my_port: u8, my_val: u8) {
        let index = my_port as usize;
        // Keep a shadow copy because the original firmware drove either a PCA9554A port expander
        // or a 4094 shift register from the same logical port state.
        self.port_array[index] = my_val;
        if self.io_present {
            self.i2c_slave_adr = my_port + 0x38;
            self.param_int = 0x0100_i16 + my_val as i16;
            let _ = self.hw.twi_out(self.i2c_slave_adr, self.param_int as u16);
        } else {
            self.hw.shift_out_sr(&self.port_array);
        }
    }

    pub fn set_dir(&mut self, my_port: u8, my_val: u8) {
        // Direction lives in EEPROM so the port layout survives reset.
        self.eeprom.dir_init_array[my_port as usize] = my_val;
        if self.io_present {
            self.hw.write_io_dir(my_port, my_val);
        }
    }

    pub fn get_new_value(&mut self, my_sub_ch: u8) -> bool {
        self.param_int = 0;
        self.param = 0.0;

        match my_sub_ch {
            0..=7 => {
                // Internal ATmega ADC channels are converted through offset and user scale.
                self.param_int = self.hw.get_adc(my_sub_ch + 1);
                self.param = ((self.param_int as i32 + self.eeprom.offset_array[my_sub_ch as usize] as i32)
                    as Float
                    * self.eeprom.scale_array[my_sub_ch as usize])
                    / self.base_scale_ad10;
                false
            }
            10..=17 => {
                // AD16-8 values arrive as raw SAR codes and use the external ADC base scale.
                self.param_int = self.adc_raw_array[(my_sub_ch - 10) as usize];
                self.param = ((self.param_int as i32 + self.eeprom.offset_array[my_sub_ch as usize] as i32)
                    as Float
                    * self.eeprom.scale_array[my_sub_ch as usize])
                    / self.base_scale_ad16;
                false
            }
            20..=27 => {
                // DAC channels report the stored engineering-unit setpoint rather than raw code.
                self.param = self.dac_value_array[(my_sub_ch - 20) as usize];
                false
            }
            30..=37 => {
                // Digital ports are presented as integer reads.
                self.param_int = self.get_port(my_sub_ch - 30) as i16;
                true
            }
            40..=47 => {
                // Direction registers are also exposed as integer parameters.
                self.param_int = self.eeprom.dir_init_array[(my_sub_ch - 40) as usize] as i16;
                true
            }
            _ => false,
        }
    }

    pub fn ser_crlf() -> &'static str {
        "\r\n"
    }

    pub fn write_ch_prefix(&self) -> String {
        format!("#{}:{}=", char::from(self.slave_ch + b'0'), self.sub_ch)
    }

    pub fn write_ser_input(&self) -> String {
        let mut out = self.ser_inp_str.clone();
        out.push_str(Self::ser_crlf());
        out
    }

    pub fn ser_prompt(&mut self, err: ErrorCode, my_status: u8) -> Option<String> {
        let should_write = self.verbose || err != ErrorCode::NoErr;
        let line = if should_write {
            // The original protocol reports errors on sub-channel 255.
            self.sub_ch = ERR_SUB_CH;
            Some(format!(
                "{}{} {}{}",
                self.write_ch_prefix(),
                err as u8 + my_status,
                ERR_STR_ARR[err as usize],
                Self::ser_crlf()
            ))
        } else {
            None
        };

        if err != ErrorCode::NoErr {
            self.err_count += 1;
            self.err_flag = true;
        }

        line
    }

    pub fn param_round1000(&mut self) {
        self.param = (self.param * 1000.0).round() / 1000.0;
    }

    pub fn param_to_str(&mut self) {
        if self.param == 0.0 {
            self.param_str = "0.0".to_string();
        } else {
            self.param_str = format!("{:.*}", self.nachkomma as usize, self.param as f64);
        }
    }

    pub fn param_to_pm_str(&mut self) {
        self.param_to_str();
        if !self.param_str.starts_with('-') {
            self.param_str.insert(0, '+');
        }
    }

    pub fn write_param(&mut self) -> String {
        self.digits = 1;
        // The Pascal code used more fractional digits for module values and scale parameters.
        self.nachkomma = if (8..=27).contains(&self.sub_ch) || (200..=227).contains(&self.sub_ch) {
            6
        } else {
            4
        };
        self.param_to_str();
        format!("{}{}{}", self.write_ch_prefix(), self.param_str, Self::ser_crlf())
    }

    pub fn write_param_int(&mut self) -> String {
        self.param_str = self.param_int.to_string();
        format!("{}{}{}", self.write_ch_prefix(), self.param_str, Self::ser_crlf())
    }

    pub fn write_features(&self) -> String {
        let mut out = String::from("[");
        if self.dac12_present {
            out.push_str(DAC12_STR);
        }
        if self.dac714_present || self.dac16_present {
            out.push_str(DAC16_STR);
        }
        if self.adc16_present {
            out.push_str(ADC16_STR);
        }
        if self.io_present {
            out.push_str(IO816_STR);
        }
        if self.lcd_present {
            out.push_str(LCD_STR);
        }
        out.push(']');
        out
    }

    pub fn init_all(&mut self) -> Vec<String> {
        self.io_present = self.hw.detect_i2c_expander();

        for i in 0..8_u8 {
            let dir = self.eeprom.dir_init_array[i as usize];
            self.set_dir(i, dir);

            let port = self.eeprom.port_init_array[i as usize];
            self.port_array[i as usize] = port;
            self.set_port(i, port);

            if self.io_present {
                self.i2c_slave_adr = 0x38 + i;
                // The PCA9554A inversion register is forced to 0 on startup.
                let _ = self.hw.twi_out(self.i2c_slave_adr, 0x0200);
            }
        }

        if !(9..=239).contains(&self.eeprom.ee_ser_baud_reg) {
            // Invalid EEPROM baud settings fall back to the original 38400/U2X default.
            self.eeprom.ee_ser_baud_reg = 51;
        }

        self.slave_ch = self.hw.read_slave_channel();
        self.set_base_scales();
        self.integrate_ad16 = self.eeprom.init_integrate_ad16;
        self.current_ch = self.slave_ch;
        self.sub_ch = 0;
        self.status = RuntimeStatus::default();

        // Card detection reuses the shared SENSE pin with different strobe combinations.
        self.dac12_present = !self.hw.detect_sense();
        self.dac714_present = false;
        self.dac16_present = false;
        self.adc16_present = false;

        // TrigLevel selects the INT2 edge: 0 = negative, non-zero = positive.
        self.hw
            .set_external_trigger_edge(self.eeprom.trig_level != 0);
        self.hw.enable_interrupts();

        for sub_ch in 20..=27_u8 {
            // Power-up starts every DAC channel at 0.0 V before normal command handling begins.
            self.dac_value_array[(sub_ch - 20) as usize] = 0.0;
            self.set_dac(sub_ch);
        }

        self.modify = 20;
        self.current_ch = 255;
        self.err_count = 0;
        self.changed_flag = true;
        self.param_text_str.clear();
        self.i2c_slave_adr = 0x48;

        let mut banner = String::new();
        self.sub_ch = 254;
        let _ = write!(
            banner,
            "{}{}",
            self.write_ch_prefix(),
            VERS1_STR
        );
        if self.eeprom.ee_initialised != 0xAA55 {
            // Missing marker means the host should treat calibration defaults as uninitialized.
            banner.push_str(EE_NOT_PROGRAMMED_STR);
        }
        banner.push_str(&self.write_features());
        banner.push_str(Self::ser_crlf());

        vec![banner]
    }

    pub fn trigger_scan_outputs(&mut self) -> Vec<String> {
        let mut lines = Vec::new();

        let mut mask = self.eeprom.trig_mask_array[0];
        if mask != 0 {
            // Preserve the original high-bit-first scan order for the eight internal ADC channels.
            for i in (0..=7_u8).rev() {
                if mask > 127 {
                    self.sub_ch = i;
                    self.get_new_value(self.sub_ch);
                    lines.push(self.write_param());
                }
                mask <<= 1;
            }
        }

        let mut mask = self.eeprom.trig_mask_array[1];
        if mask != 0 {
            // External AD16 channels use the same shifting scheme, offset by sub-channel 10.
            for i in (0..=7_u8).rev() {
                if mask > 127 {
                    self.sub_ch = i + 10;
                    self.get_new_value(self.sub_ch);
                    lines.push(self.write_param());
                }
                mask <<= 1;
            }
        }

        let mut mask = self.eeprom.trig_mask_array[3];
        if mask != 0 {
            // Mask slot 3 is reserved for the eight digital ports; slot 2 stayed unused here.
            for i in (0..=7_u8).rev() {
                if mask > 127 {
                    self.sub_ch = i + 30;
                    self.get_new_value(self.sub_ch);
                    lines.push(self.write_param_int());
                }
                mask <<= 1;
            }
        }

        self.trigger = false;
        lines
    }

    pub fn parse_sub_ch(&mut self) {
        todo!("Port parser logic from ADA-C-Parser.pas");
    }

    pub fn parse_get_param(&mut self) {
        todo!("Port parser response helpers from ADA-C-Parser.pas");
    }

    pub fn check_ser(&mut self) {
        // The Pascal loop polled serial input in 20 ms slices, accepted printable 7-bit ASCII,
        // handled backspace locally, and dispatched on carriage return.
        todo!("Port serial input loop and backspace handling");
    }

    pub fn run_forever(&mut self) -> ! {
        self.init_all();
        loop {
            // Keep the same high-level ordering: service serial traffic first, then emit trigger scans.
            self.check_ser();
            if self.trigger {
                let _ = self.trigger_scan_outputs();
            }
            // Panel, timers, and activity LED handling remain to be ported
            // from the Pascal event loop and included units.
        }
    }
}
