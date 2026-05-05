Trace width calculations use [IPC-2221](https://www.dinmedia.de/de/norm/ipc-2221c/377902590) curve-fit formulas for PCB conductor area and then derives trace width, resistance, voltage drop, and power loss for internal and external layers.

## Calculator

```dataviewjs
const thicknessUnits = [
    { label: "oz/ft²", value: 0.0035 },
    { label: "mil", value: 2.54e-3 },
    { label: "mm", value: 0.1 },
    { label: "µm", value: 1e-4 }
];

const widthUnits = [
    { label: "mil", value: 2.54e-3 },
    { label: "mm", value: 0.1 },
    { label: "µm", value: 1e-4 }
];

const lengthUnits = [
    { label: "inch", value: 0.393701 },
    { label: "feet", value: 0.032808 },
    { label: "mil", value: 393.7008 },
    { label: "mm", value: 10 },
    { label: "µm", value: 10000 },
    { label: "cm", value: 1 },
    { label: "m", value: 0.01 }
];

const temperatureRiseUnits = [
    { label: "K", value: "C" },
    { label: "°F", value: "F" }
];

const temperatureUnits = [
    { label: "°C", value: "C" },
    { label: "°F", value: "F" }
];

const root = dv.el("div", "", { cls: "pcb-trace-calculator" });
root.innerHTML = `
<style>
.pcb-trace-calculator {
    border: 1px solid var(--background-modifier-border);
    border-radius: 8px;
    padding: 1rem;
    background: var(--background-primary);
}
.pcb-trace-calculator__title {
    font-weight: 700;
    margin-bottom: 0.75rem;
}
.pcb-trace-calculator__grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
    gap: 0.75rem;
}
.pcb-trace-calculator__field label {
    display: block;
    font-size: var(--font-ui-smaller);
    color: var(--text-muted);
    margin-bottom: 0.25rem;
}
.pcb-trace-calculator__control {
    display: grid;
    grid-template-columns: minmax(0, 1fr) auto;
    gap: 0.5rem;
    align-items: center;
}
.pcb-trace-calculator input,
.pcb-trace-calculator select {
    width: 100%;
}
.pcb-trace-calculator__unit {
    min-width: 5.5rem;
}
.pcb-trace-calculator__results {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
    gap: 0.75rem;
    margin-top: 1rem;
}
.pcb-trace-calculator__panel {
    border: 1px solid var(--background-modifier-border);
    border-radius: 8px;
    padding: 0.75rem;
    background: var(--background-secondary);
}
.pcb-trace-calculator__panel-title {
    font-weight: 700;
    margin-bottom: 0.5rem;
}
.pcb-trace-calculator__result-row {
    display: grid;
    grid-template-columns: minmax(0, 1fr) minmax(5rem, auto) minmax(4.5rem, auto);
    gap: 0.5rem;
    align-items: center;
    padding: 0.25rem 0;
}
.pcb-trace-calculator__result-value {
    font-family: var(--font-monospace);
    text-align: right;
}
.pcb-trace-calculator__result-unit {
    color: var(--text-muted);
}
.pcb-trace-calculator__warning {
    display: none;
    margin-top: 0.75rem;
    color: var(--text-warning);
    font-size: var(--font-ui-smaller);
}
.pcb-trace-calculator__warning.is-visible {
    display: block;
}
</style>
<div class="pcb-trace-calculator__title">PCB Trace Width Calculator</div>
<div class="pcb-trace-calculator__grid"></div>
<div class="pcb-trace-calculator__results"></div>
<div class="pcb-trace-calculator__warning"></div>
`;

const inputGrid = root.querySelector(".pcb-trace-calculator__grid");
const resultsGrid = root.querySelector(".pcb-trace-calculator__results");
const warning = root.querySelector(".pcb-trace-calculator__warning");

const current = createNumberField(inputGrid, "Current", 10, "A");
const thickness = createNumberField(inputGrid, "Copper thickness", 2);
const thicknessUnit = createSelect(thickness.unit, thicknessUnits, "oz/ft²");
const temperatureRise = createNumberField(inputGrid, "Temperature rise", 10);
const temperatureRiseUnit = createSelect(temperatureRise.unit, temperatureRiseUnits, "C");
const ambientTemperature = createNumberField(inputGrid, "Ambient temperature", 25);
const ambientTemperatureUnit = createSelect(ambientTemperature.unit, temperatureUnits, "C");
const traceLength = createNumberField(inputGrid, "Trace length", 1);
const traceLengthUnit = createSelect(traceLength.unit, lengthUnits, "inch");

const internal = createResultPanel(resultsGrid, "Internal layer", "mil");
const external = createResultPanel(resultsGrid, "External layer in air", "mil");

for (const control of [
    current.input,
    thickness.input,
    thicknessUnit,
    temperatureRise.input,
    temperatureRiseUnit,
    ambientTemperature.input,
    ambientTemperatureUnit,
    traceLength.input,
    traceLengthUnit,
    internal.widthUnit,
    external.widthUnit
]) {
    control.addEventListener("input", update);
    control.addEventListener("change", update);
}

update();

function createNumberField(parent, label, value, unitLabel) {
    const field = parent.createDiv({ cls: "pcb-trace-calculator__field" });
    field.createEl("label", { text: label });
    const row = field.createDiv({ cls: "pcb-trace-calculator__control" });
    const input = row.createEl("input", { type: "number", attr: { step: "any" } });
    input.value = value;
    const unit = row.createSpan({ cls: "pcb-trace-calculator__unit" });

    if (unitLabel) {
        unit.setText(unitLabel);
    }

    return { input, unit };
}

function createSelect(parent, units, selectedValue) {
    const select = parent.createEl("select");

    for (const unit of units) {
        const option = select.createEl("option", { text: unit.label, value: String(unit.value) });

        if (unit.label === selectedValue || String(unit.value) === selectedValue) {
            option.selected = true;
        }
    }

    return select;
}

function createResultPanel(parent, title, widthUnit) {
    const panel = parent.createDiv({ cls: "pcb-trace-calculator__panel" });
    panel.createEl("div", { cls: "pcb-trace-calculator__panel-title", text: title });
    const width = createOutputRow(panel, "Required trace width");
    const widthUnitElement = createSelect(width.unit, widthUnits, widthUnit);
    const resistance = createOutputRow(panel, "Resistance", "Ohms");
    const voltageDrop = createOutputRow(panel, "Voltage drop", "Volts");
    const powerLoss = createOutputRow(panel, "Power loss", "Watts");

    return {
        width,
        widthUnit: widthUnitElement,
        resistance,
        voltageDrop,
        powerLoss
    };
}

function createOutputRow(parent, label, unitLabel) {
    const row = parent.createDiv({ cls: "pcb-trace-calculator__result-row" });
    row.createSpan({ text: label });
    const value = row.createSpan({ cls: "pcb-trace-calculator__result-value" });
    const unit = row.createSpan({ cls: "pcb-trace-calculator__result-unit" });

    if (unitLabel) {
        unit.setText(unitLabel);
    }

    return { value, unit };
}

function update() {
    const values = {
        current: Number(current.input.value),
        thicknessCm: Number(thickness.input.value) * Number(thicknessUnit.value),
        temperatureRiseC: convertRiseToC(Number(temperatureRise.input.value), temperatureRiseUnit.value),
        ambientTemperatureC: convertTemperatureToC(Number(ambientTemperature.input.value), ambientTemperatureUnit.value),
        traceLengthCm: Number(traceLength.input.value) / Number(traceLengthUnit.value)
    };

    if (!isValid(values)) {
        setEmpty(internal);
        setEmpty(external);
        warning.setText("Enter positive numeric values for current, thickness, temperature rise, and trace length.");
        warning.toggleClass("is-visible", true);
        return;
    }

    const internalResult = calculateLayer(values, 0.024, Number(internal.widthUnit.value));
    const externalResult = calculateLayer(values, 0.048, Number(external.widthUnit.value));

    setResults(internal, internalResult);
    setResults(external, externalResult);
    setWarning(warning, values, internalResult, externalResult);
}

function convertRiseToC(value, unit) {
    if (unit === "F") {
        return value * 5 / 9;
    }

    return value;
}

function convertTemperatureToC(value, unit) {
    if (unit === "F") {
        return (value - 32) * 5 / 9;
    }

    return value;
}

function isValid(values) {
    return Number.isFinite(values.current)
        && Number.isFinite(values.thicknessCm)
        && Number.isFinite(values.temperatureRiseC)
        && Number.isFinite(values.ambientTemperatureC)
        && Number.isFinite(values.traceLengthCm)
        && values.current > 0
        && values.thicknessCm > 0
        && values.temperatureRiseC > 0
        && values.traceLengthCm > 0;
}

function calculateLayer(values, k, widthUnit) {
    const areaMilsSquared = Math.pow(values.current / (k * Math.pow(values.temperatureRiseC, 0.44)), 1 / 0.725);
    const areaCmSquared = areaMilsSquared * 2.54 * 2.54 / 1000000;
    const widthCm = areaCmSquared / values.thicknessCm;
    const conductorTemperatureC = values.ambientTemperatureC + values.temperatureRiseC;
    const copperResistivityAt25C = 17e-7;
    const copperTemperatureCoefficient = 0.0039;
    const resistance = copperResistivityAt25C
        * values.traceLengthCm
        / areaCmSquared
        * (1 + copperTemperatureCoefficient * (conductorTemperatureC - 25));

    return {
        areaMilsSquared,
        width: widthCm / widthUnit,
        widthMil: widthCm / 2.54e-3,
        resistance,
        voltageDrop: values.current * resistance,
        powerLoss: values.current * values.current * resistance
    };
}

function setResults(panel, result) {
    panel.width.value.setText(formatNumber(result.width));
    panel.resistance.value.setText(formatNumber(result.resistance));
    panel.voltageDrop.value.setText(formatNumber(result.voltageDrop));
    panel.powerLoss.value.setText(formatNumber(result.powerLoss));
}

function setEmpty(panel) {
    panel.width.value.setText("");
    panel.resistance.value.setText("");
    panel.voltageDrop.value.setText("");
    panel.powerLoss.value.setText("");
}

function setWarning(warningElement, values, internalResult, externalResult) {
    const messages = [];

    if (values.current > 35) {
        messages.push("current is above 35 A");
    }

    if (values.temperatureRiseC < 10 || values.temperatureRiseC > 100) {
        messages.push("temperature rise is outside 10-100 K");
    }

    if (internalResult.widthMil > 400 || externalResult.widthMil > 400) {
        messages.push("calculated width is above 0.4 inch");
    }

    if (messages.length === 0) {
        warningElement.setText("");
        warningElement.toggleClass("is-visible", false);
        return;
    }

    warningElement.setText(`IPC-2221 graph range warning: ${messages.join(", ")}. Results are extrapolated.`);
    warningElement.toggleClass("is-visible", true);
}

function formatNumber(value) {
    if (!Number.isFinite(value)) {
        return "";
    }

    return Number(value).toPrecision(3);
}
```

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
