The **SR flip-flop** stores one bit using separate set and reset inputs. `S` sets the output $Q$ to 1, and `R` resets $Q$ to 0.

```kicanvas
src: SR-Flip-Flop.kicad_sch
controls: basic
zoom: 1.6
theme: dark
```

The two cross-coupled NAND gates form the memory element. The additional NAND gates at the inputs gate the set and reset commands with the clock input `CK`.

When `CK` is low, the input gates disable both commands and the flip-flop holds its previous state. When `CK` is high, the inputs control the stored value:

| `CK` | $S$ | $R$ | $Q_{next}$ | Function |
| :--: | :-: | :-: | :--------: | -------- |
|  0   |  X  |  X  |    $Q$     | Hold previous state |
|  1   |  0  |  0  |    $Q$     | Hold previous state |
|  1   |  1  |  0  |     1      | Set |
|  1   |  0  |  1  |     0      | Reset |
|  1   |  1  |  1  |  invalid   | Forbidden state |

The outputs $Q$ and $\bar{Q}$ normally have opposite values. If `S` and `R` are both active while the clock is active, both latch inputs are forced into the active state at the same time. This violates the normal complementary relationship between $Q$ and $\bar{Q}$ and can leave the final state unpredictable when the inputs are released.

The SR flip-flop is the basic building block for other flip-flops. A [[D-Flip-Flop]] prevents the invalid state by deriving reset from the inverse of the data input. A [[JK-Flip-Flop]] uses feedback to turn the invalid state into a toggle operation.

**Example use cases**

- Debouncing a switch with separate set and reset contacts.
- Storing a simple event flag until it is cleared.
- Building more complex flip-flops and latches.
- Implementing simple control states such as start/stop or enable/disable.
