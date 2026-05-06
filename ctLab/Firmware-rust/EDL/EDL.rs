//! Best-effort Rust port of `EDL.pas`.
//!
//! The Pascal source is a fairly large control loop for the electronic load.
//! This file keeps the same high-level structure in Rust: command tables,
//! calibration state, mode and range selection, serial/LCD helpers, and the
//! periodic service logic.

#![allow(dead_code)]

pub type Float = f32;

pub const PROC_CLOCK: u32 = 16_000_000;
pub const VERS1_STR: &str = "1.784 [EDL by CM/c't 09/2008]";
pub const VERS3_STR: &str = "EDL 1.78";

pub const CMD_STR_ARR: [&str; 31] = [
    "STR", "IDN", "CHN", "VAL", "ENA", "DCA", "DCP", "DCV", "DCR", "MAH", "MWH", "MSV", "MSA",
    "RNG", "MSW", "PCA", "RON", "ROF", "RIP", "RAW", "DSP", "ALL", "OFS", "SCL", "OPT", "TMP",
    "TRM", "WEN", "ERC", "SBD", "NOP",
];

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum CmdWhich {
    Str,
    Idn,
    Chn,
    Val,
    Ena,
    Dca,
    Dcp,
    Dcv,
    Dcr,
    Mah,
    Mwh,
    Msv,
    Msa,
    Rng,
    Msw,
    Pca,
    Ron,
    Rof,
    Rip,
    Raw,
    Dsp,
    All,
    Ofs,
    Scl,
    Opt,
    Tmp,
    Trm,
    Wen,
    Erc,
    Sbd,
    Nop,
    Err,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Mode {
    OutputOff,
    IHiVolt,
    ILoVolt,
    RHiVolt,
    RLoVolt,
    PHiVolt,
    PLoVolt,
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

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum MeasureKind {
    Ioff,
    Uoff,
    Ion,
    Uon,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum DacKind {
    Ltc8043,
    Ad5452,
    Dac8501,
    Dac8811,
}

#[derive(Debug, Clone)]
pub struct EepromData {
    pub adc_u_offsets: [i16; 2],
    pub adc_u_scales: [Float; 2],
    pub adc_i_offsets: [i16; 4],
    pub adc_i_scales: [Float; 4],
    pub dac_i_offsets: [i16; 4],
    pub dac_i_scales: [Float; 4],
    pub dac_r_scales: [Float; 4],
    pub option_array: [Float; 24],
    pub ee_ser_baud_reg: u8,
    pub inc_rast_def: i16,
}

impl Default for EepromData {
    fn default() -> Self {
        Self {
            adc_u_offsets: [0, 0],
            adc_u_scales: [1.0, 1.0],
            adc_i_offsets: [0, 0, 0, 0],
            adc_i_scales: [1.0, 1.0, 1.0, 1.0],
            dac_i_offsets: [0, 0, 0, 0],
            dac_i_scales: [1.0, 1.0, 1.0, 1.0],
            dac_r_scales: [1.0, 1.0, 1.0, 1.0],
            option_array: [
                0.5, 1.0, 5.0, 10.0, 40.0, 70.0, 0.0, 0.0, 1.0, 1.0, 10.0, 0.0, 100.0, 1.0,
                0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
            ],
            ee_ser_baud_reg: 51,
            inc_rast_def: 4,
        }
    }
}

#[derive(Debug, Default, Clone, Copy)]
pub struct RuntimeStatus {
    pub error_low_nibble: u8,
    pub ee_unlocked: bool,
    pub overload_flag: bool,
    pub user_srq_flag: bool,
    pub busy_flag: bool,
}

pub trait EdlHardware {
    fn read_voltage_adc16(&mut self, off_on: bool) -> u16;
    fn read_current_adc16(&mut self, off_on: bool) -> u16;
    fn read_voltage_adc10(&mut self) -> i16;
    fn read_current_adc10(&mut self) -> i16;
    fn set_shunt(&mut self, shunt_index: u8);
    fn set_output_enabled(&mut self, enabled: bool);
    fn set_dac_raw(&mut self, raw: u16);
    fn read_temp_c(&mut self) -> Option<Float>;
    fn serial_write(&mut self, text: &str);
    fn lcd_write_line(&mut self, row: u8, text: &str);
}

#[derive(Debug, Clone)]
pub struct DeviceState<H> {
    pub hw: H,
    pub eeprom: EepromData,
    pub status: RuntimeStatus,
    pub mode: Mode,
    pub modify: Modify,
    pub output_enabled: bool,
    pub current_set: Float,
    pub power_set: Float,
    pub voltage_cutoff: Float,
    pub resistance_set: Float,
    pub current_off_percent: Float,
    pub ripple_percent: Float,
    pub t_on_ms: u16,
    pub t_off_ms: u16,
    pub measured_voltage: Float,
    pub measured_current: Float,
    pub measured_power: Float,
    pub capacity_mah: Float,
    pub capacity_mwh: Float,
    pub internal_resistance: Float,
    pub temperature_c: Option<Float>,
    pub ser_input: String,
    pub param_str: String,
}

impl RuntimeStatus {
    pub fn as_byte(self) -> u8 {
        (self.error_low_nibble & 0x0f)
            | ((self.ee_unlocked as u8) << 4)
            | ((self.overload_flag as u8) << 5)
            | ((self.user_srq_flag as u8) << 6)
            | ((self.busy_flag as u8) << 7)
    }
}

impl<H: EdlHardware> DeviceState<H> {
    pub fn new(hw: H) -> Self {
        Self {
            hw,
            eeprom: EepromData::default(),
            status: RuntimeStatus::default(),
            mode: Mode::OutputOff,
            modify: Modify::ModeMenu,
            output_enabled: false,
            current_set: 1.0,
            power_set: 1.0,
            voltage_cutoff: 0.0,
            resistance_set: 10.0,
            current_off_percent: 100.0,
            ripple_percent: 0.0,
            t_on_ms: 0,
            t_off_ms: 0,
            measured_voltage: 0.0,
            measured_current: 0.0,
            measured_power: 0.0,
            capacity_mah: 0.0,
            capacity_mwh: 0.0,
            internal_resistance: 0.0,
            temperature_c: None,
            ser_input: String::new(),
            param_str: String::new(),
        }
    }

    pub fn set_lm75_temp(&mut self) {}

    pub fn get_one_lm75_temp(&mut self) -> Option<Float> {
        self.hw.read_temp_c()
    }

    pub fn get_lm75_temp(&mut self) {
        self.temperature_c = self.get_one_lm75_temp();
    }

    pub fn init_scale_u(&mut self) {}

    pub fn init_scales(&mut self) {}

    pub fn ser_crlf(&mut self) {
        self.hw.serial_write("\r\n");
    }

    pub fn write_ch_prefix(&mut self) {
        self.hw.serial_write("EDL:");
    }

    pub fn write_ser_inp(&mut self) {
        self.hw.serial_write(&self.ser_input);
    }

    pub fn set_shunt(&mut self, shunt: u8) {
        self.hw.set_shunt(shunt);
    }

    pub fn calc_range_i(&mut self) {
        let shunt = if self.current_set < 0.02 {
            0
        } else if self.current_set < 0.2 {
            1
        } else if self.current_set < 2.0 {
            2
        } else {
            3
        };
        self.set_shunt(shunt);
    }

    pub fn calc_range_r(&mut self) {}

    pub fn get_voltage(&mut self, off_on: bool) {
        let raw = self.hw.read_voltage_adc16(off_on) as i32 + self.eeprom.adc_u_offsets[off_on as usize] as i32;
        self.measured_voltage = raw as Float * 0.001 * self.eeprom.adc_u_scales[off_on as usize];
    }

    pub fn get_current(&mut self, off_on: bool) {
        let raw = self.hw.read_current_adc16(off_on) as i32 + self.eeprom.adc_i_offsets[0] as i32;
        self.measured_current = raw as Float * 0.001 * self.eeprom.adc_i_scales[0];
        self.measured_power = self.measured_voltage * self.measured_current;
    }

    pub fn get_voltage10(&mut self) {
        self.measured_voltage = self.hw.read_voltage_adc10() as Float * 0.01;
    }

    pub fn get_current10(&mut self) {
        self.measured_current = self.hw.read_current_adc10() as Float * 0.01;
    }

    pub fn get_ri(&mut self) -> bool {
        if self.measured_current.abs() < 0.0001 {
            return false;
        }
        self.internal_resistance = self.measured_voltage / self.measured_current;
        true
    }

    pub fn set_level_dac_i(&mut self) {
        let raw = (self.current_set * 1000.0 * self.eeprom.dac_i_scales[0]).clamp(0.0, 65535.0) as u16;
        self.hw.set_dac_raw(raw);
    }

    pub fn set_level_dac_r(&mut self) {
        let current = if self.resistance_set <= 0.001 {
            self.current_set
        } else {
            (self.measured_voltage / self.resistance_set).max(0.0)
        };
        let raw = (current * 1000.0 * self.eeprom.dac_r_scales[0]).clamp(0.0, 65535.0) as u16;
        self.hw.set_dac_raw(raw);
    }

    pub fn set_level_dac_p(&mut self) {
        let current = if self.measured_voltage <= 0.001 {
            self.current_set
        } else {
            (self.power_set / self.measured_voltage).max(0.0)
        };
        let raw = (current * 1000.0 * self.eeprom.dac_i_scales[0]).clamp(0.0, 65535.0) as u16;
        self.hw.set_dac_raw(raw);
    }

    pub fn ser_prompt(&mut self, err: ErrorCode) {
        let labels = [
            "[OK]",
            "[SRQUSR]",
            "[BUSY]",
            "[OVRLD]",
            "[CMDERR]",
            "[PARERR]",
            "[LOCKED]",
            "[CHKSUM]",
        ];
        self.hw.serial_write(labels[(err as usize).min(labels.len() - 1)]);
        self.ser_crlf();
    }

    pub fn inc_fac_i(&mut self, delta: Float) {
        self.current_set = (self.current_set + delta).max(0.0);
    }

    pub fn inc_fac_r(&mut self, delta: Float) {
        self.resistance_set = (self.resistance_set + delta).max(0.001);
    }

    pub fn inc_fac_p(&mut self, delta: Float) {
        self.power_set = (self.power_set + delta).max(0.0);
    }

    pub fn inc_fac_v(&mut self, delta: Float) {
        self.voltage_cutoff = (self.voltage_cutoff + delta).max(0.0);
    }

    pub fn round_inc_param(&mut self) {}

    pub fn set_acc_param(&mut self) {}

    pub fn param_to_str(&self, value: Float) -> String {
        format!("{value:.3}")
    }

    pub fn set_cursor(&mut self, _full_cursor: bool) {}

    pub fn spannung_on_lcd(&mut self) {
        self.hw.lcd_write_line(0, &format!("U {:>6.3}", self.voltage_cutoff));
    }

    pub fn ist_spannung_on_lcd(&mut self) {
        self.hw.lcd_write_line(0, &format!("U {:>6.3}", self.measured_voltage));
    }

    pub fn soll_spannung_on_lcd(&mut self) {
        self.hw.lcd_write_line(0, &format!("Us{:>6.3}", self.voltage_cutoff));
    }

    pub fn param_div_1000(&self, value: Float) -> Float {
        value / 1000.0
    }

    pub fn param_mul_1000(&self, value: Float) -> Float {
        value * 1000.0
    }

    pub fn prefix_r(&self) -> &'static str {
        "Ohm"
    }

    pub fn prefix_i(&self, ma_display: bool) -> &'static str {
        if ma_display { "mA" } else { "A" }
    }

    pub fn strom_on_lcd(&mut self) {
        self.hw.lcd_write_line(1, &format!("I {:>6.3}", self.current_set));
    }

    pub fn widerstand_on_lcd(&mut self) {
        self.hw.lcd_write_line(1, &format!("R {:>6.2}", self.resistance_set));
    }

    pub fn ist_strom_on_lcd(&mut self) {
        self.hw.lcd_write_line(1, &format!("I {:>6.3}", self.measured_current));
    }

    pub fn soll_strom_on_lcd(&mut self) {
        self.hw.lcd_write_line(1, &format!("Is{:>6.3}", self.current_set));
    }

    pub fn ist_leistung_on_lcd(&mut self) {
        self.hw.lcd_write_line(1, &format!("P {:>6.2}", self.measured_power));
    }

    pub fn soll_leistung_on_lcd(&mut self) {
        self.hw.lcd_write_line(1, &format!("Ps{:>6.2}", self.power_set));
    }

    pub fn cap_on_lcd(&mut self) {
        self.hw.lcd_write_line(1, &format!("Ah {:>5.2}", self.capacity_mah));
    }

    pub fn ri_on_lcd(&mut self) {
        self.hw
            .lcd_write_line(1, &format!("Ri {:>5.2}", self.internal_resistance));
    }

    pub fn werte_on_lcd(&mut self) {
        match self.mode {
            Mode::OutputOff | Mode::IHiVolt | Mode::ILoVolt => {
                self.ist_spannung_on_lcd();
                self.ist_strom_on_lcd();
            }
            Mode::RHiVolt | Mode::RLoVolt => {
                self.ist_spannung_on_lcd();
                self.widerstand_on_lcd();
            }
            Mode::PHiVolt | Mode::PLoVolt => {
                self.ist_spannung_on_lcd();
                self.ist_leistung_on_lcd();
            }
        }
    }

    pub fn write_param_ser(&mut self, value: Float) {
        self.hw.serial_write(&self.param_to_str(value));
    }

    pub fn write_param_int_ser(&mut self, value: i32) {
        self.hw.serial_write(&value.to_string());
    }

    pub fn check_limits(&mut self) -> ErrorCode {
        if self.temperature_c.unwrap_or(0.0) > 70.0 {
            self.status.overload_flag = true;
            return ErrorCode::OvlErr;
        }
        ErrorCode::NoErr
    }

    pub fn fault_check(&mut self) {
        self.status.overload_flag =
            self.measured_power > self.eeprom.option_array[4] || self.measured_voltage < self.voltage_cutoff;
    }

    pub fn chores(&mut self) {
        self.get_lm75_temp();
        self.get_voltage(true);
        self.get_current(true);
        self.get_ri();
        self.fault_check();
        self.werte_on_lcd();
    }

    pub fn check_ser(&mut self) {}

    pub fn check_delay(&mut self, _delay_ms: u8) {
        self.chores();
    }

    pub fn init_all(&mut self) {
        self.calc_range_i();
        self.hw.set_output_enabled(self.output_enabled);
        self.hw.serial_write(VERS1_STR);
        self.ser_crlf();
    }
}
