The **JK flip-flop** is a clocked storage element with two control inputs, `J` and `K`. It extends the [[SR-Flip-Flop]] by replacing the forbidden set/reset condition with a toggle function.

```kicanvas
src: JK-Flip-Flop.kicad_sch
controls: basic
zoom: 1.3
theme: dark
```

The circuit uses feedback from $Q$ and $\bar{Q}$ into the input gates. This feedback makes the state selected by `J` and `K` depend on the present output state.

| `CK` | $J$ | $K$ | $Q_{next}$ | Function |
| :--: | :-: | :-: | :--------: | -------- |
|  0   |  X  |  X  |    $Q$     | Hold previous state |
|  1   |  0  |  0  |    $Q$     | Hold previous state |
|  1   |  0  |  1  |     0      | Reset |
|  1   |  1  |  0  |     1      | Set |
|  1   |  1  |  1  |  $\bar{Q}$ | Toggle |

When `J = 1` and `K = 0`, the flip-flop is set and $Q$ becomes 1. When `J = 0` and `K = 1`, the flip-flop is reset and $Q$ becomes 0. When both inputs are 0, the feedback keeps the previous state.

The important case is `J = 1` and `K = 1`: instead of being forbidden, this input combination changes the output to the opposite state. Therefore, the JK flip-flop can be used as a controllable toggle.

For a level-sensitive NAND implementation, the clock pulse must be controlled so the output cannot toggle repeatedly while the clock is active. Practical edge-triggered JK flip-flops avoid this by using master-slave or edge-triggered internal structures.

**Example use cases**

- Binary counters, because the toggle mode divides the clock frequency by two.
- Frequency dividers.
- State machines that need set, reset, hold, and toggle behavior.
- Building [[T-Flip-Flop]] circuits by connecting `J` and `K` to the same control signal.
