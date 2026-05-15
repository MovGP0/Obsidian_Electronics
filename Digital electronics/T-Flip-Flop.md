The **T flip-flop** is a toggle flip-flop. It either holds its current state or changes to the opposite state on the active clock condition.

```kicanvas
src: T-Flip-Flop.kicad_sch
controls: basic
zoom: 1.3
theme: dark
```

The input `T` controls whether toggling is enabled. When `T = 0`, the feedback keeps the previous state. When `T = 1`, the next active clock condition changes $Q$ to $\bar{Q}$.

| `CLK` | $T$ | $Q_{next}$ | Function |
| :---: | :-: | :--------: | -------- |
|   0   |  X  |    $Q$     | Hold previous state |
|   1   |  0  |    $Q$     | Hold previous state |
|   1   |  1  |  $\bar{Q}$ | Toggle |

The T flip-flop can be understood as a [[JK-Flip-Flop]] where both inputs are driven by the same signal:

$$
J = K = T
$$

If `T` is 0, this corresponds to `J = 0` and `K = 0`, so the state is held. If `T` is 1, this corresponds to `J = 1` and `K = 1`, so the JK flip-flop toggles.

Each toggle changes the output once. Therefore, if `T` is held high and the circuit is triggered by a regular clock, the output frequency is half of the clock frequency.

As with the JK flip-flop, a level-sensitive gate implementation must avoid repeated toggling during a long active clock pulse. Edge-triggered implementations change state only once per clock edge.

**Example use cases**

- Divide-by-two frequency dividers.
- Binary counters, where each stage toggles when the previous stage changes state.
- Simple clocked state toggles such as on/off controls.
- Generating alternating phases from a clock signal.
