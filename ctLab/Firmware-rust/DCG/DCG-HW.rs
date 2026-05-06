//! Best-effort Rust port of `DCG-HW.pas`.
//!
//! The original Pascal source mixes inline AVR assembly with module globals.
//! This port keeps the algorithmic structure and the hardware responsibilities
//! but expresses them through explicit state and a hardware access trait.

use core::marker::PhantomData;

use crate::avrd_support::{Atmega32, AvrdPortIo, Mcu, RegisterPort};

pub const ADC10_CHANNEL_MASK: u8 = 0x07;
pub const ADCSRA_START_DIV128: u8 = 0xC7;
pub const ADCSRA_BUSY_BIT: u8 = 1 << 6;
pub const ADC10_SETTLE_CYCLES: u16 = 15;
pub const LTC1864_ACQUISITION_DELAY_CYCLES: u16 = 3;
pub const DAC_POST_WRITE_SETTLE_LOOP_ITERATIONS: u8 = 40;

#[cfg(target_arch = "avr")]
const AVR_SREG_ADDRESS: *mut u8 = 0x5f as *mut u8;
#[cfg(target_arch = "avr")]
const AVR_SREG_INTERRUPT_ENABLE_MASK: u8 = 0x80;

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum DacKind {
    Ltc1257,
    Ltc1655,
}

pub trait DcgHardware {
    fn set_sdata_out(&mut self, high: bool);
    fn set_sclk(&mut self, high: bool);
    fn set_str_dac(&mut self, high: bool);
    fn set_str_ad16(&mut self, high: bool);
    fn set_mpx_i(&mut self, high: bool);
    fn set_mpx_u(&mut self, high: bool);
    fn set_mpx_1864(&mut self, high: bool);
    fn read_sdata_in1(&self) -> bool;
    fn spin_delay_cycles(&mut self, cycles: u16);
    fn set_admux(&mut self, value: u8);
    fn write_adcsra(&mut self, value: u8);
    fn read_adcsra(&self) -> u8;
    fn read_adcl(&self) -> u8;
    fn read_adch(&self) -> u8;
    fn begin_interrupt_exclusion(&mut self) -> u8 {
        0
    }

    fn end_interrupt_exclusion(&mut self, _saved_status: u8) {}

    fn nop(&mut self) {
        self.spin_delay_cycles(1);
    }

    fn wait_post_dac_settle(&mut self) {
        for _ in 0..DAC_POST_WRITE_SETTLE_LOOP_ITERATIONS {
            self.nop();
        }
    }
}

pub struct DcgAvrd<M: Mcu> {
    io: AvrdPortIo<M>,
    _marker: PhantomData<M>,
}

pub type DcgAtmega32 = DcgAvrd<Atmega32>;

impl<M: Mcu> Default for DcgAvrd<M> {
    fn default() -> Self {
        Self {
            io: AvrdPortIo::default(),
            _marker: PhantomData,
        }
    }
}

impl<M: Mcu> DcgAvrd<M> {
    pub fn init_ports(&mut self) {
        self.io.init_port(RegisterPort::B, 0b1011_1111, 0b1101_0011);
        self.io.init_port(RegisterPort::C, 0b1111_1100, 0b0000_1111);
        self.io.init_port(RegisterPort::D, 0b0000_1100, 0b1111_1100);
    }
}

impl<M: Mcu> DcgHardware for DcgAvrd<M> {
    fn set_sdata_out(&mut self, high: bool) {
        self.io.write_bit(RegisterPort::B, 1, high);
    }

    fn set_sclk(&mut self, high: bool) {
        self.io.write_bit(RegisterPort::B, 0, high);
    }

    fn set_str_dac(&mut self, high: bool) {
        self.io.write_bit(RegisterPort::B, 4, high);
    }

    fn set_str_ad16(&mut self, high: bool) {
        self.io.write_bit(RegisterPort::B, 7, high);
    }

    fn set_mpx_i(&mut self, high: bool) {
        self.io.write_bit(RegisterPort::C, 5, high);
    }

    fn set_mpx_u(&mut self, high: bool) {
        self.io.write_bit(RegisterPort::C, 4, high);
    }

    fn set_mpx_1864(&mut self, high: bool) {
        self.io.write_bit(RegisterPort::C, 6, high);
    }

    fn read_sdata_in1(&self) -> bool {
        self.io.read_bit(RegisterPort::B, 6)
    }

    fn spin_delay_cycles(&mut self, cycles: u16) {
        self.io.spin_delay_cycles(cycles);
    }

    fn set_admux(&mut self, value: u8) {
        unsafe {
            crate::avrd_support::write_u8(M::ADMUX, value);
        }
    }

    fn write_adcsra(&mut self, value: u8) {
        unsafe {
            crate::avrd_support::write_u8(M::ADCSRA, value);
        }
    }

    fn read_adcsra(&self) -> u8 {
        unsafe { crate::avrd_support::read_u8(M::ADCSRA) }
    }

    fn read_adcl(&self) -> u8 {
        unsafe { crate::avrd_support::read_u8(M::ADCL) }
    }

    fn read_adch(&self) -> u8 {
        unsafe { crate::avrd_support::read_u8(M::ADCH) }
    }

    fn begin_interrupt_exclusion(&mut self) -> u8 {
        #[cfg(target_arch = "avr")]
        {
            let saved_status = unsafe { core::ptr::read_volatile(AVR_SREG_ADDRESS) };
            unsafe {
                core::ptr::write_volatile(
                    AVR_SREG_ADDRESS,
                    saved_status & !AVR_SREG_INTERRUPT_ENABLE_MASK,
                );
            }
            saved_status
        }

        #[cfg(not(target_arch = "avr"))]
        {
            0
        }
    }

    fn end_interrupt_exclusion(&mut self, saved_status: u8) {
        #[cfg(target_arch = "avr")]
        unsafe {
            core::ptr::write_volatile(AVR_SREG_ADDRESS, saved_status);
        }

        #[cfg(not(target_arch = "avr"))]
        {
            let _ = saved_status;
        }
    }

    fn wait_post_dac_settle(&mut self) {
        #[cfg(target_arch = "avr")]
        unsafe {
            core::arch::asm!(
                "ldi r24, 40",
                "2:",
                "dec r24",
                "brne 2b",
                lateout("r24") _,
                options(nomem, nostack)
            );
        }

        #[cfg(not(target_arch = "avr"))]
        {
            for _ in 0..DAC_POST_WRITE_SETTLE_LOOP_ITERATIONS {
                self.nop();
            }
        }
    }
}

#[derive(Debug, Clone)]
pub struct DcgHardwareState {
    pub dac_temp: u16,
    pub adc_temp: u16,
    pub adc_raw_u: u16,
    pub adc_raw_i: u16,
    pub dac_raw_u_on: u16,
    pub dac_raw_u_off: u16,
    pub dac_raw_i: u16,
    pub pw_counter: u16,
    pub pw_on_time: u16,
    pub pw_off_time: u16,
    pub pw_on_off: bool,
    pub ui_toggle: bool,
    pub adc16_present: bool,
    pub dac16_present: bool,
}

impl Default for DcgHardwareState {
    fn default() -> Self {
        Self {
            dac_temp: 0,
            adc_temp: 0,
            adc_raw_u: 0,
            adc_raw_i: 0,
            dac_raw_u_on: 0,
            dac_raw_u_off: 0,
            dac_raw_i: 0,
            pw_counter: 0,
            pw_on_time: 0,
            pw_off_time: 0,
            pw_on_off: false,
            ui_toggle: false,
            adc16_present: false,
            dac16_present: false,
        }
    }
}

pub fn shift_out_1257<H: DcgHardware>(hw: &mut H, dac_temp: u16) {
    hw.set_sdata_out(false);
    hw.set_sclk(false);
    hw.set_str_dac(true);

    // The LTC1257 consumes a 12-bit value: four high bits first, then the low
    // byte. The Pascal code left-aligns the high nibble so bit 11 is shifted
    // out on the first clock edge.
    let mut high = ((dac_temp >> 8) as u8) << 4;
    for _ in 0..4 {
        hw.set_sdata_out((high & 0x80) != 0);
        hw.set_sclk(true);
        high <<= 1;
        hw.spin_delay_cycles(1);
        hw.set_sdata_out(false);
        hw.set_sclk(false);
    }

    let mut low = dac_temp as u8;
    for _ in 0..7 {
        hw.set_sdata_out((low & 0x80) != 0);
        hw.set_sclk(true);
        low <<= 1;
        hw.spin_delay_cycles(1);
        hw.set_sdata_out(false);
        hw.set_sclk(false);
    }

    // The last bit is transferred together with the DAC load strobe, matching
    // the original "LSB mit Load-Impuls" sequence in the AVR assembly.
    hw.set_sdata_out((low & 0x80) != 0);
    hw.set_sclk(true);
    hw.set_str_dac(false);
    hw.spin_delay_cycles(1);
    hw.set_sdata_out(false);
    hw.set_sclk(false);
    hw.set_str_dac(true);
}

pub fn shift_out_1655<H: DcgHardware>(hw: &mut H, dac_temp: u16) {
    hw.set_sclk(false);
    hw.set_sdata_out(false);
    hw.set_str_dac(false);

    // The LTC1655 uses a full 16-bit transfer and latches only after all bits
    // have been clocked out, so its framing differs from the 1257 path above.
    for byte in dac_temp.to_be_bytes() {
        let mut current = byte;
        for _ in 0..8 {
            hw.set_sdata_out((current & 0x80) != 0);
            hw.set_sclk(true);
            current <<= 1;
            hw.set_sdata_out(false);
            hw.set_sclk(false);
        }
    }

    hw.set_str_dac(true);
}

pub fn shift_in_1864<H: DcgHardware>(hw: &mut H) -> u16 {
    // Pulling STRAD16 low starts the LTC1864 read cycle. The original code
    // masks interrupts around this routine so all 16 bits are sampled with
    // deterministic timing.
    let saved_status = hw.begin_interrupt_exclusion();

    hw.set_str_ad16(false);
    hw.set_sclk(false);

    for _ in 0..LTC1864_ACQUISITION_DELAY_CYCLES {
        hw.nop();
    }

    let mut result = 0u16;
    for _ in 0..16 {
        hw.set_sclk(true);
        let bit = hw.read_sdata_in1();
        hw.set_sclk(false);
        result = (result << 1) | u16::from(bit);
    }

    hw.set_sclk(true);
    hw.spin_delay_cycles(1);
    hw.set_str_ad16(true);
    hw.end_interrupt_exclusion(saved_status);
    result
}

pub fn on_sys_tick<H: DcgHardware>(state: &mut DcgHardwareState, hw: &mut H) {
    // The 1 ms SysTick ISR begins by disabling both analog output paths before
    // reading/updating shared converter state.
    hw.set_mpx_i(true);
    hw.set_mpx_u(false);

    if state.adc16_present {
        state.adc_temp = shift_in_1864(hw);
    }

    if state.ui_toggle {
        if state.pw_on_off {
            if state.pw_counter == 0 {
                state.pw_counter = state.pw_off_time;
                state.pw_on_off = false;
                state.dac_temp = state.dac_raw_u_off;
            } else {
                state.dac_temp = state.dac_raw_u_on;
            }
        } else if state.pw_counter == 0 {
            state.pw_counter = state.pw_on_time;
            state.pw_on_off = true;
            state.dac_temp = state.dac_raw_u_on;
        } else {
            state.dac_temp = state.dac_raw_u_off;
        }
    } else {
        state.dac_temp = state.dac_raw_i;
    }

    if state.pw_counter > 0 {
        state.pw_counter -= 1;
    }

    if state.dac16_present {
        shift_out_1655(hw, state.dac_temp);
    } else {
        shift_out_1257(hw, state.dac_temp);
    }

    // The Pascal ISR burns roughly 10 us here so the external DAC and analog
    // switches can settle before the multiplexers are flipped again.
    hw.wait_post_dac_settle();

    if state.ui_toggle {
        // On alternating ticks the firmware services the voltage path, folds
        // in the freshly sampled ADC value, then points both muxes at U.
        state.adc_raw_u = ((state.adc_raw_u as u32 + state.adc_temp as u32) / 2) as u16;
        hw.set_mpx_1864(true);
        hw.set_mpx_u(true);
    } else {
        // The other half-cycle does the same for current, so U and I share one
        // converter by time-multiplexing the front end every millisecond.
        state.adc_raw_i = ((state.adc_raw_i as u32 + state.adc_temp as u32) / 2) as u16;
        hw.set_mpx_1864(false);
        hw.set_mpx_i(false);
    }

    state.ui_toggle = !state.ui_toggle;
}

pub fn get_adc10<H: DcgHardware>(hw: &mut H, channel: u8) -> u16 {
    // Hand-coded equivalent of the Pascal getadc() helper: select the mux input,
    // wait for it to settle, start an ADC conversion with prescaler 128, then
    // poll ADSC until the conversion is done before reading ADCL/ADCH.
    hw.set_admux(channel.wrapping_sub(1) & ADC10_CHANNEL_MASK);
    hw.spin_delay_cycles(ADC10_SETTLE_CYCLES);
    hw.write_adcsra(ADCSRA_START_DIV128);

    while (hw.read_adcsra() & ADCSRA_BUSY_BIT) != 0 {}

    u16::from(hw.read_adcl()) | (u16::from(hw.read_adch()) << 8)
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::cell::{Cell, RefCell};

    #[derive(Debug, Clone, Copy, PartialEq, Eq)]
    enum Event {
        SDataOut(bool),
        Sclk(bool),
        StrDac(bool),
        StrAd16(bool),
        MpxI(bool),
        MpxU(bool),
        Mpx1864(bool),
        SDataIn1Read(bool),
        Admux(u8),
        Delay(u16),
        Nop,
        AdcsraWrite(u8),
        AdcsraRead(u8),
        AdclRead(u8),
        AdchRead(u8),
        BeginInterruptExclusion,
        EndInterruptExclusion(u8),
        PostDacSettle,
    }

    #[derive(Debug)]
    struct MockHardware {
        events: RefCell<Vec<Event>>,
        input_bits: Vec<bool>,
        input_index: Cell<usize>,
        adcsra_reads: Vec<u8>,
        adcsra_read_index: Cell<usize>,
        adcl: u8,
        adch: u8,
        saved_status: u8,
    }

    impl MockHardware {
        fn new(adcsra_reads: Vec<u8>, adcl: u8, adch: u8) -> Self {
            Self {
                events: RefCell::new(Vec::new()),
                input_bits: Vec::new(),
                input_index: Cell::new(0),
                adcsra_reads,
                adcsra_read_index: Cell::new(0),
                adcl,
                adch,
                saved_status: 0xa5,
            }
        }

        fn with_input_word(word: u16) -> Self {
            let input_bits = (0..16).rev().map(|bit| word & (1 << bit) != 0).collect();

            Self {
                input_bits,
                ..Self::new(Vec::new(), 0, 0)
            }
        }

        fn events_snapshot(&self) -> Vec<Event> {
            self.events.borrow().clone()
        }

        fn count_events(&self, event: Event) -> usize {
            self.events
                .borrow()
                .iter()
                .filter(|candidate| **candidate == event)
                .count()
        }
    }

    impl DcgHardware for MockHardware {
        fn set_sdata_out(&mut self, high: bool) {
            self.events.borrow_mut().push(Event::SDataOut(high));
        }

        fn set_sclk(&mut self, high: bool) {
            self.events.borrow_mut().push(Event::Sclk(high));
        }

        fn set_str_dac(&mut self, high: bool) {
            self.events.borrow_mut().push(Event::StrDac(high));
        }

        fn set_str_ad16(&mut self, high: bool) {
            self.events.borrow_mut().push(Event::StrAd16(high));
        }

        fn set_mpx_i(&mut self, high: bool) {
            self.events.borrow_mut().push(Event::MpxI(high));
        }

        fn set_mpx_u(&mut self, high: bool) {
            self.events.borrow_mut().push(Event::MpxU(high));
        }

        fn set_mpx_1864(&mut self, high: bool) {
            self.events.borrow_mut().push(Event::Mpx1864(high));
        }

        fn read_sdata_in1(&self) -> bool {
            let index = self.input_index.get();
            let value = self.input_bits.get(index).copied().unwrap_or(false);
            self.input_index.set(index + 1);
            self.events.borrow_mut().push(Event::SDataIn1Read(value));
            value
        }

        fn spin_delay_cycles(&mut self, cycles: u16) {
            self.events.borrow_mut().push(Event::Delay(cycles));
        }

        fn set_admux(&mut self, value: u8) {
            self.events.borrow_mut().push(Event::Admux(value));
        }

        fn write_adcsra(&mut self, value: u8) {
            self.events.borrow_mut().push(Event::AdcsraWrite(value));
        }

        fn read_adcsra(&self) -> u8 {
            let index = self.adcsra_read_index.get();
            let value = self.adcsra_reads.get(index).copied().unwrap_or(0);
            self.adcsra_read_index.set(index + 1);
            self.events.borrow_mut().push(Event::AdcsraRead(value));
            value
        }

        fn read_adcl(&self) -> u8 {
            self.events.borrow_mut().push(Event::AdclRead(self.adcl));
            self.adcl
        }

        fn read_adch(&self) -> u8 {
            self.events.borrow_mut().push(Event::AdchRead(self.adch));
            self.adch
        }

        fn begin_interrupt_exclusion(&mut self) -> u8 {
            self.events
                .borrow_mut()
                .push(Event::BeginInterruptExclusion);
            self.saved_status
        }

        fn end_interrupt_exclusion(&mut self, saved_status: u8) {
            self.events
                .borrow_mut()
                .push(Event::EndInterruptExclusion(saved_status));
        }

        fn nop(&mut self) {
            self.events.borrow_mut().push(Event::Nop);
        }

        fn wait_post_dac_settle(&mut self) {
            self.events.borrow_mut().push(Event::PostDacSettle);
        }
    }

    #[test]
    fn get_adc10_matches_pascal_register_sequence() {
        let mut hw = MockHardware::new(vec![ADCSRA_BUSY_BIT, ADCSRA_BUSY_BIT, 0], 0x34, 0x12);

        let result = get_adc10(&mut hw, 5);

        assert_eq!(result, 0x1234);
        assert_eq!(
            *hw.events.borrow(),
            vec![
                Event::Admux(4),
                Event::Delay(ADC10_SETTLE_CYCLES),
                Event::AdcsraWrite(ADCSRA_START_DIV128),
                Event::AdcsraRead(ADCSRA_BUSY_BIT),
                Event::AdcsraRead(ADCSRA_BUSY_BIT),
                Event::AdcsraRead(0),
                Event::AdclRead(0x34),
                Event::AdchRead(0x12),
            ]
        );
    }

    #[test]
    fn get_adc10_wraps_and_masks_pascal_byte_channel() {
        let mut hw = MockHardware::new(vec![0], 0, 0);

        let result = get_adc10(&mut hw, 0);

        assert_eq!(result, 0);
        assert_eq!(
            hw.events.borrow().first(),
            Some(&Event::Admux(ADC10_CHANNEL_MASK))
        );
    }

    #[test]
    fn shift_in_1864_masks_interrupts_and_waits_before_clocking_sample() {
        let mut hw = MockHardware::with_input_word(0xb65a);

        let result = shift_in_1864(&mut hw);

        assert_eq!(result, 0xb65a);
        assert_eq!(
            &hw.events_snapshot()[..6],
            &[
                Event::BeginInterruptExclusion,
                Event::StrAd16(false),
                Event::Sclk(false),
                Event::Nop,
                Event::Nop,
                Event::Nop,
            ]
        );
        assert_eq!(
            hw.count_events(Event::Nop),
            LTC1864_ACQUISITION_DELAY_CYCLES as usize
        );
        assert_eq!(hw.count_events(Event::SDataIn1Read(true)), 9);
        assert_eq!(hw.count_events(Event::SDataIn1Read(false)), 7);
        assert_eq!(
            hw.events_snapshot().last(),
            Some(&Event::EndInterruptExclusion(0xa5))
        );
    }

    #[test]
    fn on_sys_tick_selects_dac_from_dac16_present_flag() {
        let mut state = DcgHardwareState {
            dac16_present: false,
            dac_raw_i: 0x0abc,
            ..DcgHardwareState::default()
        };
        let mut hw = MockHardware::new(Vec::new(), 0, 0);

        on_sys_tick(&mut state, &mut hw);

        let events = hw.events_snapshot();
        let str_dac_events: Vec<Event> = events
            .iter()
            .copied()
            .filter(|event| matches!(event, Event::StrDac(_)))
            .collect();
        assert_eq!(
            str_dac_events,
            vec![
                Event::StrDac(true),
                Event::StrDac(false),
                Event::StrDac(true)
            ]
        );

        state.dac16_present = true;
        let mut hw = MockHardware::new(Vec::new(), 0, 0);

        on_sys_tick(&mut state, &mut hw);

        let events = hw.events_snapshot();
        let str_dac_events: Vec<Event> = events
            .iter()
            .copied()
            .filter(|event| matches!(event, Event::StrDac(_)))
            .collect();
        assert_eq!(
            str_dac_events,
            vec![Event::StrDac(false), Event::StrDac(true)]
        );
    }

    #[test]
    fn on_sys_tick_waits_for_post_dac_settle_before_mux_update() {
        let mut state = DcgHardwareState {
            dac16_present: true,
            dac_raw_i: 0x1234,
            ..DcgHardwareState::default()
        };
        let mut hw = MockHardware::new(Vec::new(), 0, 0);

        on_sys_tick(&mut state, &mut hw);

        let events = hw.events_snapshot();
        let settle_index = events
            .iter()
            .position(|event| *event == Event::PostDacSettle)
            .unwrap();
        let latch_index = events
            .iter()
            .rposition(|event| *event == Event::StrDac(true))
            .unwrap();
        let adc_store_index = events
            .iter()
            .position(|event| *event == Event::Mpx1864(false))
            .unwrap();
        let output_enable_index = events
            .iter()
            .position(|event| *event == Event::MpxI(false))
            .unwrap();

        assert!(latch_index < settle_index);
        assert!(settle_index < adc_store_index);
        assert!(settle_index < output_enable_index);
        assert_eq!(hw.count_events(Event::PostDacSettle), 1);
    }
}
