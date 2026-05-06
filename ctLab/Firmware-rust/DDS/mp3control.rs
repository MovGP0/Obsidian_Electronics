//! Best-effort Rust port of `mp3control.pas`.

pub const YI3_STOP: u8 = 0xF0;
pub const YI3_RESET: u8 = 0xF7;
pub const YI3_PAUSE: u8 = 0xF8;
pub const YI3_LOOP: u8 = 0xF4;
pub const YI3_NO_LOOP: u8 = 0xF1;
pub const YI3_MID_VOLUME: u8 = 0xA8;
pub const YI3_MUTE: u8 = 0x80;

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
    let mut bits_remaining = 8u8;

    // Software-UART start bit for the MP3 player control input.
    hw.set_ser_aux(false);
    hw.micro_delay(5);

    while bits_remaining > 0 {
        // Shift out the command byte LSB first at the original 19200 Bd timing.
        hw.set_ser_aux((current & 0x01) != 0);
        hw.micro_delay(5);
        current >>= 1;
        bits_remaining -= 1;
    }

    // Return the line to idle high for the stop bit.
    hw.set_ser_aux(true);
    hw.micro_delay(10);
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
