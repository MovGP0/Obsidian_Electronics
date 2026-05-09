---
title: Symbols
---
**Symbols** are stored in two related forms. A library symbol definition appears inside `(lib_symbols ...)` and describes reusable graphics, pins, and default properties. A placed schematic symbol appears at schematic level and references a library symbol with `lib_id`.
```lisp
(lib_symbols
	(symbol "Connector:Conn_01x01_Socket"
		(pin_names
			(offset 1.016)
			(hide yes)
		)
		(property "Reference" "J"
			(at 0 2.54 0)
		)
		(property "Value" "Conn_01x01_Socket"
			(at 0 -2.54 0)
		)
		(symbol "Conn_01x01_Socket_1_1"
			(polyline
				(pts
					(xy -1.27 0) (xy -0.508 0)
				)
				(stroke
					(width 0.1524)
					(type default)
				)
				(fill
					(type none)
				)
			)
			(pin passive line
				(at -5.08 0 0)
				(length 3.81)
				(name "Pin_1")
				(number "1")
			)
		)
	)
)
```

## Symbol definition

| Field                               | Type    | Description                                                                                     |
| ----------------------------------- | ------- | ----------------------------------------------------------------------------------------------- |
| `symbol "Library:Name"`             | node    | Reusable symbol definition. The name is referenced by placed `lib_id` fields                    |
| `pin_numbers`                       | node    | Global pin-number display settings for the symbol definition                                    |
| `pin_names`                         | node    | Global pin-name display settings for the symbol definition                                      |
| `exclude_from_sim`                  | boolean | Default simulation exclusion flag                                                               |
| `in_bom`                            | boolean | Default bill-of-materials inclusion flag                                                        |
| `on_board`                          | boolean | Default PCB inclusion flag                                                                      |
| `in_pos_files`                      | boolean | Default position-file inclusion flag                                                            |
| `duplicate_pin_numbers_are_jumpers` | boolean | Treat same-number pins as jumper-connected pins                                                 |
| [[property]]            | node    | Default symbol property, such as `"Reference"`, `"Value"`, or `"Footprint"`                    |
| nested `symbol`                     | node    | Drawing and pin content for a unit and body style                                               |
## Naming

| Name                        | Meaning                                                                           |
| --------------------------- | --------------------------------------------------------------------------------- |
| `"Library:Name"`            | Top-level library identifier, for example `"power:GND"` or `"Simulation_SPICE:NMOS"` |
| `"Name_0_1"`                | Common graphics for all units, body style 1                                      |
| `"Name_1_1"`                | Unit 1 graphics and pins, body style 1                                           |
| `"Name_2_1"`                | Unit 2 graphics and pins, body style 1                                           |

The top-level name must match the schematic instance `(lib_id "...")`. The nested names are KiCad's generated convention for assigning graphics and pins to units and body styles. Use unit `0` only for graphics that are shared by all units. Put electrical pins in the concrete unit section such as `Name_1_1`.

## Drawing primitives

Symbol drawings use local coordinates in millimeters. They are relative to the symbol origin and move, rotate, or mirror with the placed schematic symbol.

| Primitive   | Purpose                         | Main fields                         |
| ----------- | ------------------------------- | ----------------------------------- |
| `polyline`  | Lines, outlines, arrows, shapes | [[pts]], `stroke`, `fill`    |
| `rectangle` | Rectangular bodies              | `start`, `end`, `stroke`, `fill`    |
| `circle`    | Bubbles, terminals, outlines    | `center`, `radius`, `stroke`, `fill` |
| `arc`       | Curved outlines                 | `start`, `mid`, `end`, `stroke`, `fill` |
| `text`      | Fixed symbol text               | text value, [[at]], `effects` |

```lisp
(polyline
	(pts
		(xy 0 0) (xy 0 2.54)
	)
	(stroke
		(width 0)
		(type default)
	)
	(fill
		(type none)
	)
)
```

## Fill and stroke

| Field          | Type   | Description                                      |
| -------------- | ------ | ------------------------------------------------ |
| `stroke width` | number | Line width in millimeters; `0` means default     |
| `stroke type`  | enum   | Usually `default` for generated schematic files  |
| `fill type`    | enum   | `none`, `outline`, `background`, or color-backed |

Use `fill (type none)` for ordinary lines. Use `fill (type outline)` when a closed primitive should be filled with the outline color, such as a transistor arrow or filled marker.

## Pins

Pins are the electrical connection points of the symbol. A wire connects to the pin's `(at X Y ANGLE)` coordinate after the symbol placement transform is applied. The visible pin line extends from that connection point toward the symbol body by `length`. See [[pin]] for the dedicated pin element reference.
```lisp
(pin input line
	(at -5.08 0 0)
	(length 2.54)
	(name "G"
		(effects
			(font
				(size 1.27 1.27)
			)
		)
	)
	(number "2"
		(effects
			(font
				(size 1.27 1.27)
			)
		)
	)
)
```

| Field    | Type   | Description                                                             |
| -------- | ------ | ----------------------------------------------------------------------- |
| pin type | enum   | Electrical behavior used by ERC, such as `input`, `output`, or `passive` |
| shape    | enum   | Visual pin shape, often `line`                                          |
| [[at]] | point  | Electrical connection point and pin direction                           |
| `length` | number | Visible line length from the connection point toward the symbol body    |
| `name`   | string | Human-readable pin name, such as `G`, `D`, `S`, or `Pin_1`              |
| `number` | string | Electrical pin number used for netlists, footprints, and simulation     |

## Pin types

| Type            | Use case                                               |
| --------------- | ------------------------------------------------------ |
| `input`         | Consumed signal, such as a CMOS gate input             |
| `output`        | Driven signal output                                   |
| `bidirectional` | Signal that can drive and receive                      |
| `tri_state`     | Output that can enter high impedance                   |
| `passive`       | Passive connection, supply pin, connector, source, or drain |
| `power_in`      | Power input pin used by many power and IC symbols      |
| `power_out`     | Power source output pin, for example `PWR_FLAG`        |

## Connection point placement

Place pin connection points on the schematic grid used by the design. In this repository the CMOS schematics use a 1.27 mm grid. Drawing geometry can use smaller offsets, but pin `(at ...)` coordinates should land on grid positions after placement.

For an unrotated placed symbol at `(at X Y 0)`, local pin coordinates are added to the placed origin:

| Example pin                         | Local connection point | Placed connection point |
| ----------------------------------- | ---------------------- | ----------------------- |
| NMOS drain `(at 2.54 5.08 270)`     | `(2.54, 5.08)`         | `(X + 2.54, Y + 5.08)`  |
| NMOS gate `(at -5.08 0 0)`          | `(-5.08, 0)`           | `(X - 5.08, Y)`         |
| NMOS source `(at 2.54 -5.08 90)`    | `(2.54, -5.08)`        | `(X + 2.54, Y - 5.08)`  |
| Connector pin `(at -5.08 0 0)`      | `(-5.08, 0)`           | `(X - 5.08, Y)`         |

Rotation and mirroring change these transformed connection points. Check the final placed symbol transform before routing wires.

## Placed symbol

Placed symbols reference the library definition with `lib_id` and provide the actual schematic location, unique UUIDs, instance properties, and pin UUIDs.
```lisp
(symbol
	(lib_id "Simulation_SPICE:NMOS")
	(at 140.97 88.9 0)
	(unit 1)
	(body_style 1)
	(exclude_from_sim no)
	(in_bom yes)
	(on_board yes)
	(in_pos_files yes)
	(dnp no)
	(uuid "11111111-1111-1111-1111-111111111111")
	(property "Reference" "Q1"
		(at 146.05 87.63 0)
	)
	(property "Value" "NMOS"
		(at 146.05 90.17 0)
	)
	(pin "1"
		(uuid "22222222-2222-2222-2222-222222222222")
	)
	(pin "2"
		(uuid "33333333-3333-3333-3333-333333333333")
	)
	(pin "3"
		(uuid "44444444-4444-4444-4444-444444444444")
	)
)
```

| Field             | Type    | Description                                                         |
| ----------------- | ------- | ------------------------------------------------------------------- |
| `lib_id`          | string  | Library symbol name from `lib_symbols`                              |
| [[at]]      | point   | Schematic placement origin and rotation                             |
| `unit`            | number  | Selected unit from the symbol definition                            |
| `body_style`      | number  | Selected body style                                                 |
| placement flags   | boolean | Instance flags such as `exclude_from_sim`, `in_bom`, and `dnp`      |
| `uuid`            | uuid    | Unique identifier for this placed symbol instance                   |
| `property`        | node    | Instance-specific property values and text positions                |
| `pin`             | node    | Per-pin UUID record; the pin number must exist in the library symbol |
| [[sheet_instances]] | node    | Project and sheet-path reference data generated by KiCad            |

## Related

- [[property|Properties]]
- [[wire|Wires]]
- [[no_connect|No Connect]]
- [[polyline|Polylines]]
- [[pin]]
- [[sheet|Sheets]]
- [[at|At]]
- [[pts|Points]]
- [[group]]
