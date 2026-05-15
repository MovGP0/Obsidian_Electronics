The **D flip-flop** stores one data bit. The input $D$ is sampled while the clock input is active, and the stored value appears at the output $Q$. The complementary output $\bar{Q}$ has the opposite state.

```kicanvas
src: D-Flip-Flop.kicad_sch
controls: basic
zoom: 1.6
theme: dark
```

The circuit is built from a gated [[SR-Flip-Flop]] input stage. The inverter produces $\bar{D}$ so that the set and reset paths can never be active at the same time during normal operation.

When `CLK` is low, both gated inputs are disabled and the previous output state is held. When `CLK` is high, the latch follows the data input:

| `CLK` | $D$ | $Q_{next}$ | Function |
| :---: | :-: | :--------: | -------- |
|   0   |  X  |    $Q$     | Hold previous state |
|   1   |  0  |     0      | Reset / store 0 |
|   1   |  1  |     1      | Set / store 1 |

Here, $Q_{next}$ is the state after the active clock condition, and `X` means that the value does not matter.

Because the reset input is generated from $\bar{D}$ and the set input from $D$, the forbidden SR condition is avoided. The result is a storage element with a single data input instead of separate set and reset inputs.

In this NAND-gate implementation the output is level-sensitive while `CLK` is high. In edge-triggered flip-flops, two latches are usually combined so that the value changes only at a clock edge.

**Example use cases**

- Storing one bit in a register.
- Building shift registers, where each stage passes its stored bit to the next stage on the clock.
- Synchronizing a digital signal to a system clock.
- Holding state in counters, finite state machines, and small memory elements.
