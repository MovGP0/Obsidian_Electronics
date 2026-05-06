//! Best-effort Rust port of `mp3control.pas`.

pub const YI3_STOP: u8 = 0xF0;
pub const YI3_RESET: u8 = 0xF7;
pub const YI3_PAUSE: u8 = 0xF8;
pub const YI3_LOOP: u8 = 0xF4;
pub const YI3_NO_LOOP: u8 = 0xF1;
pub const YI3_MID_VOLUME: u8 = 0xA8;
pub const YI3_MUTE: u8 = 0x80;

const SER_AUX_DATA_BITS: u8 = 8;
const SER_AUX_BIT_DELAY_TICKS: u8 = 5;
const SER_AUX_STOP_DELAY_TICKS: u8 = 10;

pub trait Mp3ControlHardware {
    fn set_ser_aux(&mut self, high: bool);
    fn micro_delay(&mut self, ticks: u8);
    fn milli_delay(&mut self, ticks: u16);
    fn send_shift_register(&mut self);
}

#[derive(Debug, Clone, Default)]
pub struct Mp3ControlState {
    pub track: u8,
    pub current_track: u8,
    pub db_correction: u8,
    pub is_on: bool,
}

pub fn ser_aux<H: Mp3ControlHardware>(hw: &mut H, value: u8) {
    let mut current = value;
    let mut bits_remaining = SER_AUX_DATA_BITS;

    // Pascal bit-bangs 19.2 kBd on SerAux: start bit, 8 data bits LSB first.
    hw.set_ser_aux(false);
    hw.micro_delay(SER_AUX_BIT_DELAY_TICKS);

    while bits_remaining > 0 {
        let data_high = current & 0x01 != 0;
        current >>= 1;

        hw.set_ser_aux(data_high);
        hw.micro_delay(SER_AUX_BIT_DELAY_TICKS);
        bits_remaining -= 1;
    }

    // Return the line to idle high and keep the Pascal routine's two-bit idle gap.
    hw.set_ser_aux(true);
    hw.micro_delay(SER_AUX_STOP_DELAY_TICKS);
}

pub fn mp3_set_volume<H: Mp3ControlHardware>(state: &Mp3ControlState, hw: &mut H) {
    hw.milli_delay(20);
    ser_aux(hw, YI3_MID_VOLUME.wrapping_add(state.db_correction));
}

pub fn mp3_goto_track<H: Mp3ControlHardware>(state: &mut Mp3ControlState, hw: &mut H) {
    // Track numbers are sent directly as single-byte player commands.
    ser_aux(hw, state.track);
    state.current_track = state.track;
    // Re-apply the calibrated level after changing tracks.
    mp3_set_volume(state, hw);
}

pub fn mp3_on<H: Mp3ControlHardware>(state: &mut Mp3ControlState, hw: &mut H) {
    // Disable the player's internal repeat mode; the firmware handles repeats itself.
    ser_aux(hw, YI3_NO_LOOP);
    ser_aux(hw, YI3_MID_VOLUME.wrapping_add(state.db_correction));
    // Stop first so playback always starts from a known state.
    ser_aux(hw, YI3_STOP);
    hw.milli_delay(100);
    state.current_track = 0;
    state.is_on = true;
    // Propagate the power-state change to the shared shift register outputs.
    hw.send_shift_register();
}

pub fn mp3_off<H: Mp3ControlHardware>(state: &mut Mp3ControlState, hw: &mut H) {
    ser_aux(hw, YI3_NO_LOOP);
    // Mute before stopping so power-down is silent.
    ser_aux(hw, YI3_MUTE);
    ser_aux(hw, YI3_STOP);
    state.is_on = false;
    state.current_track = 0;
    hw.send_shift_register();
}

#[cfg(test)]
mod tests {
    use super::*;

    #[derive(Debug, Clone, Copy, PartialEq, Eq)]
    enum Event {
        SerAux(bool),
        MicroDelay(u8),
        MilliDelay(u16),
        SendShiftRegister,
    }

    #[derive(Debug, Default)]
    struct MockHardware {
        events: Vec<Event>,
    }

    impl Mp3ControlHardware for MockHardware {
        fn set_ser_aux(&mut self, high: bool) {
            self.events.push(Event::SerAux(high));
        }

        fn micro_delay(&mut self, ticks: u8) {
            self.events.push(Event::MicroDelay(ticks));
        }

        fn milli_delay(&mut self, ticks: u16) {
            self.events.push(Event::MilliDelay(ticks));
        }

        fn send_shift_register(&mut self) {
            self.events.push(Event::SendShiftRegister);
        }
    }

    #[test]
    fn ser_aux_preserves_pascal_uart_edges_and_delays() {
        let mut hardware = MockHardware::default();

        ser_aux(&mut hardware, 0b1010_0101);

        assert_eq!(
            hardware.events,
            vec![
                Event::SerAux(false),
                Event::MicroDelay(5),
                Event::SerAux(true),
                Event::MicroDelay(5),
                Event::SerAux(false),
                Event::MicroDelay(5),
                Event::SerAux(true),
                Event::MicroDelay(5),
                Event::SerAux(false),
                Event::MicroDelay(5),
                Event::SerAux(false),
                Event::MicroDelay(5),
                Event::SerAux(true),
                Event::MicroDelay(5),
                Event::SerAux(false),
                Event::MicroDelay(5),
                Event::SerAux(true),
                Event::MicroDelay(5),
                Event::SerAux(true),
                Event::MicroDelay(10),
            ]
        );
    }

    #[test]
    fn mp3_goto_track_sends_track_then_pascal_volume_refresh() {
        let mut state = Mp3ControlState {
            track: 7,
            db_correction: 3,
            ..Mp3ControlState::default()
        };
        let mut hardware = MockHardware::default();

        mp3_goto_track(&mut state, &mut hardware);

        assert_eq!(state.current_track, 7);
        assert_eq!(
            hardware
                .events
                .iter()
                .filter(|event| matches!(event, Event::MilliDelay(20)))
                .count(),
            1
        );
        assert!(hardware.events.starts_with(&[
            Event::SerAux(false),
            Event::MicroDelay(5),
            Event::SerAux(true),
            Event::MicroDelay(5),
            Event::SerAux(true),
            Event::MicroDelay(5),
            Event::SerAux(true),
            Event::MicroDelay(5),
            Event::SerAux(false),
            Event::MicroDelay(5),
        ]));
    }
}
