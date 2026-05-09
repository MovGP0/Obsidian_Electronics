---
title: Properties
---
**Properties** are stored as `(property "Name" "Value" ...)` nodes. A property can appear inside a `lib_symbols` symbol definition or inside a placed schematic `symbol` instance.
```lisp
(property "Value" "GND"
	(at 50.8 55.88 0)
	(show_name no)
	(hide no)
	(do_not_autoplace no)
	(effects
		(font
			(size 1.27 1.27)
		)
	)
)
```

## Common Properties

| Property          | Type   | Description                                                                 |
| ----------------- | ------ | --------------------------------------------------------------------------- |
| `"Reference"`     | string | Symbol reference designator, for example `R1`, `U1`, `#PWR01`, or `#FLG01`  |
| `"Value"`         | string | Visible logical value or net name; for power symbols this is the global net |
| `"Footprint"`     | string | PCB footprint library identifier; often empty for schematic-only symbols    |
| `"Datasheet"`     | string | Datasheet URL or document reference                                         |
| `"Description"`   | string | Human-readable symbol description                                           |
| `"ki_keywords"`   | string | Space-separated search keywords used by KiCad symbol selection              |
| `"ki_fp_filters"` | string |                                                                             |
| `"Sim.Device"`    | string | SPICE device kind used by simulation symbols                                |
| `"Sim.Type"`      | string | SPICE model or primitive type used by simulation symbols                    |
| `"Sim.Pins"`      | string | Mapping between KiCad pins and SPICE pins, for example `1=D 2=G 3=S`        |

## Property fields

| Field              | Type    | Description                                                |
| ------------------ | ------- | ---------------------------------------------------------- |
| [[at]]             | point   | Property text position and rotation                        |
| `show_name`        | boolean | Controls whether the property name is displayed            |
| `do_not_autoplace` | boolean | Prevents KiCad from moving the property during autoplace   |
| `hide`             | boolean | Hides the property text                                    |
| `effects`          | node    | Text styling such as font size, thickness, italic, or bold |

## Related

- [[symbol|Symbols]]
- [[sheet|Sheets]]
- [[label|Labels]]
- [[at|At]]
