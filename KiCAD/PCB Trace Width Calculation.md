Trace width calculations use [IPC-2221](https://www.dinmedia.de/de/norm/ipc-2221c/377902590) curve-fit formulas for PCB conductor area and then derives trace width, resistance, voltage drop, and power loss for internal and external layers.

## Symbols

| Symbol | Meaning | Unit |
|---|---|---|
| $I$ | Current | A |
| $\Delta T$ | Temperature rise | $^\circ\mathrm{C}$ |
| $T_a$ | Ambient temperature | $^\circ\mathrm{C}$ |
| $T_c$ | Conductor temperature | $^\circ\mathrm{C}$ |
| $A$ | Required conductor cross-sectional area | $\mathrm{mil}^2$ |
| $A_\mathrm{cm^2}$ | Required conductor cross-sectional area | $\mathrm{cm}^2$ |
| $t$ | Copper thickness | $\mathrm{cm}$ |
| $W$ | Required trace width | $\mathrm{cm}$ |
| $L$ | Trace length | $\mathrm{cm}$ |
| $R$ | Trace resistance | $\Omega$ |
| $V$ | Voltage drop | V |
| $P$ | Power loss | W |
| $\rho_{25}$ | Copper resistivity at $25^\circ\mathrm{C}$ | $\Omega\cdot\mathrm{cm}$ |
| $\alpha$ | Copper temperature coefficient | $1/^\circ\mathrm{C}$ |

## IPC-2221 Constants

The standard uses:

$$
b = 0.44
$$

$$
c = 0.725
$$

For internal layers:

$$
k_\mathrm{internal} = 0.024
$$

For external layers in air:

$$
k_\mathrm{external} = 0.048
$$

## Temperature Conversion

If temperature rise is entered in Fahrenheit:

$$
\Delta T_{^\circ\mathrm{C}} = \Delta T_{^\circ\mathrm{F}} \cdot \frac{5}{9}
$$

If ambient temperature is entered in Fahrenheit:

$$
T_{a,^\circ\mathrm{C}} = \left(T_{a,^\circ\mathrm{F}} - 32\right) \cdot \frac{5}{9}
$$

The conductor temperature used for resistance is:

$$
T_c = T_a + \Delta T
$$

## Required Area

For either layer type, using the matching IPC-2221 constant $k$:

$$
A = \left(\frac{I}{k \cdot \Delta T^b}\right)^{\frac{1}{c}}
$$

Expanded internal-layer formula:

$$
A_\mathrm{internal} =
\left(\frac{I}{0.024 \cdot \Delta T^{0.44}}\right)^{\frac{1}{0.725}}
$$

Expanded external-layer formula:

$$
A_\mathrm{external} =
\left(\frac{I}{0.048 \cdot \Delta T^{0.44}}\right)^{\frac{1}{0.725}}
$$

The inverse current formula is:

$$
I = k \cdot \Delta T^b \cdot A^c
$$

## Area Conversion

Convert $\mathrm{mil}^2$ to $\mathrm{cm}^2$:

$$
A_\mathrm{cm^2} = A \cdot \frac{2.54^2}{10^6}
$$

Equivalent:

$$
A_\mathrm{cm^2} = A \cdot 6.4516 \cdot 10^{-6}
$$

## Copper Thickness Conversion

Converts copper thickness to centimeters before calculating trace width:

$$
t_\mathrm{cm} = x \cdot u_t
$$

where $x$ is the entered value and $u_t$ is:

| Input unit | $u_t$ |
|---|---:|
| $\mathrm{oz}/\mathrm{ft}^2$ | $0.0035$ |
| mil | $2.54 \cdot 10^{-3}$ |
| mm | $0.1$ |
| $\mu\mathrm{m}$ | $10^{-4}$ |

For copper weight in $\mathrm{oz}/\mathrm{ft}^2$, we therefore use:

$$
t_\mathrm{cm} = x_\mathrm{oz} \cdot 0.0035
$$

## Required Trace Width

In centimeters:

$$
W_\mathrm{cm} = \frac{A_\mathrm{cm^2}}{t_\mathrm{cm}}
$$

For output in another width unit:

$$
W_\mathrm{out} = \frac{W_\mathrm{cm}}{u_w}
$$

where $u_w$ is:

| Output unit | $u_w$ |
|---|---:|
| mil | $2.54 \cdot 10^{-3}$ |
| mm | $0.1$ |
| $\mu\mathrm{m}$ | $10^{-4}$ |

The page note gives the same result directly in mils for copper weight in ounces:

$$
W_\mathrm{mil} = \frac{A_{\mathrm{mil}^2}}{t_\mathrm{oz} \cdot 1.378}
$$

## Trace Length Conversion

Converts the entered length to centimeters:

$$
L_\mathrm{cm} = \frac{x}{u_L}
$$

where $x$ is the entered value and $u_L$ is:

| Input unit | $u_L$ |
|---|---:|
| inch | $0.393701$ |
| feet | $0.032808$ |
| mil | $393.7008$ |
| mm | $10$ |
| $\mu\mathrm{m}$ | $10000$ |
| cm | $1$ |
| m | $0.01$ |

## Resistance

For copper we use:

$$
\rho_{25} = 17 \cdot 10^{-7}\ \Omega\cdot\mathrm{cm}
$$

$$
\alpha = 0.0039\ \frac{1}{^\circ\mathrm{C}}
$$

The temperature-adjusted resistance is:

$$
R =
\frac{\rho_{25} \cdot L_\mathrm{cm}}{A_\mathrm{cm^2}}
\cdot
\left(1 + \alpha \cdot (T_c - 25)\right)
$$

## Voltage Drop

$$
V = I \cdot R
$$

## Power Loss

$$
P = I^2 \cdot R
$$

## Calculations

For internal layers, use:

$$
k = 0.024
$$

Then calculate:

$$
A_\mathrm{internal},\quad
W_\mathrm{internal},\quad
R_\mathrm{internal},\quad
V_\mathrm{internal},\quad
P_\mathrm{internal}
$$

For external layers in air, use:

$$
k = 0.048
$$

Then calculate:

$$
A_\mathrm{external},\quad
W_\mathrm{external},\quad
R_\mathrm{external},\quad
V_\mathrm{external},\quad
P_\mathrm{external}
$$

## Validity Notes

The page states that the original IPC-2221 graphs cover approximately:

- Current up to $35\ \mathrm{A}$
- Width up to $0.4\ \mathrm{in}$
- Temperature rise from $10^\circ\mathrm{C}$ to $100^\circ\mathrm{C}$
- Copper from $0.5$ to $3\ \mathrm{oz}/\mathrm{ft}^2$

Outside these ranges, we can extrapolate.

## Sources

- [AdvancedPCB Trace Width Calculator](https://www.advancedpcb.com/en-us/tools/trace-width-calculator/)
