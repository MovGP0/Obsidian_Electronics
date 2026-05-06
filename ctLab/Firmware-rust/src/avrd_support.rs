use core::marker::PhantomData;
use core::ptr;
use core::sync::atomic::{compiler_fence, Ordering};

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum RegisterPort {
    A,
    B,
    C,
    D,
}

pub trait Mcu {
    const PINA: *mut u8;
    const PINB: *mut u8;
    const PINC: *mut u8;
    const PIND: *mut u8;

    const DDRA: *mut u8;
    const DDRB: *mut u8;
    const DDRC: *mut u8;
    const DDRD: *mut u8;

    const PORTA: *mut u8;
    const PORTB: *mut u8;
    const PORTC: *mut u8;
    const PORTD: *mut u8;

    const SPCR: *mut u8;
    const SPSR: *mut u8;
    const SPDR: *mut u8;
    const SPIF_MASK: u8;

    const ADMUX: *mut u8;
    const ADCSRA: *mut u8;
    const ADCL: *mut u8;
    const ADCH: *mut u8;
    const ADSC_MASK: u8;
    const ADIF_MASK: u8;
    const MUX_MASK: u8;
    const REFS_MASK: u8;
}

pub enum Atmega32 {}

impl Mcu for Atmega32 {
    const PINA: *mut u8 = avrd::atmega32::PINA;
    const PINB: *mut u8 = avrd::atmega32::PINB;
    const PINC: *mut u8 = avrd::atmega32::PINC;
    const PIND: *mut u8 = avrd::atmega32::PIND;

    const DDRA: *mut u8 = avrd::atmega32::DDRA;
    const DDRB: *mut u8 = avrd::atmega32::DDRB;
    const DDRC: *mut u8 = avrd::atmega32::DDRC;
    const DDRD: *mut u8 = avrd::atmega32::DDRD;

    const PORTA: *mut u8 = avrd::atmega32::PORTA;
    const PORTB: *mut u8 = avrd::atmega32::PORTB;
    const PORTC: *mut u8 = avrd::atmega32::PORTC;
    const PORTD: *mut u8 = avrd::atmega32::PORTD;

    const SPCR: *mut u8 = avrd::atmega32::SPCR;
    const SPSR: *mut u8 = avrd::atmega32::SPSR;
    const SPDR: *mut u8 = avrd::atmega32::SPDR;
    const SPIF_MASK: u8 = 0x80;

    const ADMUX: *mut u8 = avrd::atmega32::ADMUX;
    const ADCSRA: *mut u8 = avrd::atmega32::ADCSRA;
    const ADCL: *mut u8 = avrd::atmega32::ADCL;
    const ADCH: *mut u8 = avrd::atmega32::ADCH;
    const ADSC_MASK: u8 = 0x40;
    const ADIF_MASK: u8 = 0x10;
    const MUX_MASK: u8 = 0x1f;
    const REFS_MASK: u8 = 0xc0;
}

pub enum Atmega644 {}

impl Mcu for Atmega644 {
    const PINA: *mut u8 = avrd::atmega644::PINA;
    const PINB: *mut u8 = avrd::atmega644::PINB;
    const PINC: *mut u8 = avrd::atmega644::PINC;
    const PIND: *mut u8 = avrd::atmega644::PIND;

    const DDRA: *mut u8 = avrd::atmega644::DDRA;
    const DDRB: *mut u8 = avrd::atmega644::DDRB;
    const DDRC: *mut u8 = avrd::atmega644::DDRC;
    const DDRD: *mut u8 = avrd::atmega644::DDRD;

    const PORTA: *mut u8 = avrd::atmega644::PORTA;
    const PORTB: *mut u8 = avrd::atmega644::PORTB;
    const PORTC: *mut u8 = avrd::atmega644::PORTC;
    const PORTD: *mut u8 = avrd::atmega644::PORTD;

    const SPCR: *mut u8 = avrd::atmega644::SPCR;
    const SPSR: *mut u8 = avrd::atmega644::SPSR;
    const SPDR: *mut u8 = avrd::atmega644::SPDR;
    const SPIF_MASK: u8 = 0x80;

    const ADMUX: *mut u8 = avrd::atmega644::ADMUX;
    const ADCSRA: *mut u8 = avrd::atmega644::ADCSRA;
    const ADCL: *mut u8 = avrd::atmega644::ADCL;
    const ADCH: *mut u8 = avrd::atmega644::ADCH;
    const ADSC_MASK: u8 = 0x40;
    const ADIF_MASK: u8 = 0x10;
    const MUX_MASK: u8 = 0x1f;
    const REFS_MASK: u8 = 0xc0;
}

pub struct AvrdPortIo<M: Mcu> {
    _marker: PhantomData<M>,
}

impl<M: Mcu> Default for AvrdPortIo<M> {
    fn default() -> Self {
        Self {
            _marker: PhantomData,
        }
    }
}

impl<M: Mcu> AvrdPortIo<M> {
    pub const fn new() -> Self {
        Self {
            _marker: PhantomData,
        }
    }

    pub fn init_port(&mut self, port: RegisterPort, ddr: u8, value: u8) {
        unsafe {
            write_u8(self.ddr_ptr(port), ddr);
            write_u8(self.port_ptr(port), value);
        }
    }

    pub fn write_port(&mut self, port: RegisterPort, value: u8) {
        unsafe {
            write_u8(self.port_ptr(port), value);
        }
    }

    pub fn write_bit(&mut self, port: RegisterPort, bit: u8, high: bool) {
        unsafe {
            update_u8(self.port_ptr(port), |value| {
                set_or_clear_bit(value, bit, high)
            });
        }
    }

    pub fn read_bit(&self, port: RegisterPort, bit: u8) -> bool {
        unsafe { read_u8(self.pin_ptr(port)) & (1 << bit) != 0 }
    }

    pub fn spin_delay_cycles(&mut self, cycles: u16) {
        for _ in 0..cycles {
            compiler_fence(Ordering::SeqCst);
        }
    }

    pub fn spi_transfer(&mut self, tx: u8) -> u8 {
        unsafe {
            write_u8(M::SPDR, tx);
            while read_u8(M::SPSR) & M::SPIF_MASK == 0 {}
            read_u8(M::SPDR)
        }
    }

    pub fn wait_for_adc(&mut self) {
        unsafe { while read_u8(M::ADCSRA) & M::ADSC_MASK != 0 {} }
    }

    pub fn read_adc_blocking(&mut self, channel_1_based: u8, external_ref: bool) -> u16 {
        unsafe {
            let mux_value = channel_1_based.saturating_sub(1) & M::MUX_MASK;
            let refs_value = if external_ref { 0 } else { M::REFS_MASK };
            write_u8(M::ADMUX, refs_value | mux_value);
            update_u8(M::ADCSRA, |value| value | M::ADIF_MASK | M::ADSC_MASK);
        }
        self.wait_for_adc();
        unsafe { u16::from(read_u8(M::ADCL)) | (u16::from(read_u8(M::ADCH)) << 8) }
    }

    fn pin_ptr(&self, port: RegisterPort) -> *mut u8 {
        match port {
            RegisterPort::A => M::PINA,
            RegisterPort::B => M::PINB,
            RegisterPort::C => M::PINC,
            RegisterPort::D => M::PIND,
        }
    }

    fn ddr_ptr(&self, port: RegisterPort) -> *mut u8 {
        match port {
            RegisterPort::A => M::DDRA,
            RegisterPort::B => M::DDRB,
            RegisterPort::C => M::DDRC,
            RegisterPort::D => M::DDRD,
        }
    }

    fn port_ptr(&self, port: RegisterPort) -> *mut u8 {
        match port {
            RegisterPort::A => M::PORTA,
            RegisterPort::B => M::PORTB,
            RegisterPort::C => M::PORTC,
            RegisterPort::D => M::PORTD,
        }
    }
}

pub unsafe fn read_u8(register: *mut u8) -> u8 {
    ptr::read_volatile(register)
}

pub unsafe fn write_u8(register: *mut u8, value: u8) {
    ptr::write_volatile(register, value);
}

pub unsafe fn update_u8(register: *mut u8, f: impl FnOnce(u8) -> u8) {
    let value = read_u8(register);
    write_u8(register, f(value));
}

pub const fn set_or_clear_bit(value: u8, bit: u8, high: bool) -> u8 {
    if high {
        value | (1 << bit)
    } else {
        value & !(1 << bit)
    }
}
