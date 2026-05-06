# c't-Lab Firmware Rust Port

This directory contains a best-effort Rust port of the original Pascal firmware sources from `../Firmware/`.

Rules for this port:

- Preserve the original module and file structure where practical.
- Keep one Rust file per Pascal source file, using the same basename and a `.rs` extension.
- Prefer explicit Rust types, enums, structs, and constants over macro-heavy transliteration.
- Preserve hardware-specific assumptions in comments when no direct Rust equivalent is implemented.
- Use `todo!()` sparingly; prefer placeholder functions and data structures that keep the code readable.
- Do not modify the original Pascal sources in `../Firmware/`.

Project status:

- `Cargo.toml` now defines a real Rust project rooted in this directory.
- `src/lib.rs` exposes the low-level hardware modules and the shared `avrd` support layer.
- `src/avrd_support.rs` provides thin register/MMIO helpers on top of the `avrd` crate for `ATmega32` and `ATmega644`.
- The `*-HW.rs` files now include concrete `avrd` backends alongside the structural source ports.

Current limitation:

- The higher-level firmware program ports (`ACV.rs`, `ADA-C.rs`, `DCG.rs`, `DDS.rs`, `DIV.rs`, `EDL.rs`) are still source-oriented translations. They are not yet fully wired into a no-std AVR application crate.
