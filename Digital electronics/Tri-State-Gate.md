The **tri-state gate** extends an ordinary digital output with a third output condition: high impedance, usually written as `Z`. In this state the output driver is electrically disconnected from the line. It neither drives a logical `0` nor a logical `1`, so another enabled output may drive the same bus line.

```kicanvas
src: Tri-State-Gate.kicad_sch
controls: basic
zoom: 1.7
theme: dark
```

The schematic shows a discrete demonstration of an active-high tri-state buffer. It follows the experiment shown as Bild 2 in Thomas Schaerer's tri-state logic article: a 74HC00-style NAND network generates the control signals for a complementary MOSFET output stage. The P-channel MOSFET pulls the output up to `VCC`, and the N-channel MOSFET pulls it down to `GND`.

The control input is `C`, the data input is `A`, and the output is `Q`.

| `C` | `A` | `Q` | Output stage |
| :-: | :-: | :-: | ------------ |
|  0  |  X  | `Z` | Both MOSFETs off |
|  1  |  0  |  0  | Pull-down MOSFET on |
|  1  |  1  |  1  | Pull-up MOSFET on |

When `C = 0`, the NAND network forces the P-channel gate high and the N-channel gate low. Both transistors are cut off, so `Q` is left floating except for whatever the external circuit connected to the output provides. This is the `Z` state.

When `C = 1`, the NAND network drives the MOSFET gates from the data input. For `A = 0`, the N-channel MOSFET conducts and pulls `Q` low. For `A = 1`, the P-channel MOSFET conducts and pulls `Q` high. The circuit therefore behaves like a non-inverting buffer while enabled.

This is the same functional behavior as a 74HC126 buffer: output enable low gives `Z`, output enable high transfers the input to the output. A 74HC125 is similar, but uses an active-low enable input.

The high-impedance state is what makes tri-state outputs useful for buses. Several outputs may be connected to the same conductor, but only one of them may be enabled at a time. If two push-pull outputs are enabled simultaneously and try to drive opposite levels, the result is bus contention: a large current path is created between the supply rails through the two output stages.

If no driver is enabled, the bus line is floating. In a real circuit it should either be sampled only when a valid driver is active or be given a defined idle state with a pull-up or pull-down resistor.

**Notes**

- The discrete MOSFET version is useful for understanding the mechanism. Integrated tri-state buffers implement the same idea with fewer internal transistors.
- If bipolar NPN/PNP transistors are used instead of MOSFETs, base resistors are required to limit base current.
- Unused CMOS inputs should not be left floating. Tie them to a defined logic level directly or through a suitable resistor.

**Sources**

- Thomas Schaerer, [Tristate-Logik, Grundlage, Praxis](https://www.elektronik-kompendium.de/public/schaerer/tristate.htm)
- Texas Instruments, [SN74HC126 quadruple buffers with 3-state outputs](https://www.ti.com/lit/ds/symlink/sn74hc126.pdf)
- Texas Instruments, [SN74HC00 quadruple 2-input NAND gates](https://www.ti.com/product/SN74HC00)
