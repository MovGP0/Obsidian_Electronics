---
title: Pins
---
**Pins** are electrical connection points inside a library [[symbol]]. A placed wire connects to a pin at the transformed [[at]] coordinate.
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

## Pin element

| Field    | Type   | Description                                                             |
| -------- | ------ | ----------------------------------------------------------------------- |
| pin type | enum   | Electrical behavior used by ERC, such as `input`, `output`, or `passive` |
| shape    | enum   | Visual pin shape, often `line`                                          |
| [[at]]   | point  | Electrical connection point and pin direction                           |
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

## Pin shapes

| Shape            | Description                         |
| ---------------- | ----------------------------------- |
| `line`           | Plain pin line                      |
| `inverted`       | Pin with inversion bubble           |
| `clock`          | Clock input marker                  |
| `inverted_clock` | Clock input with inversion bubble   |
| `input_low`      | Active-low input marker             |
| `clock_low`      | Active-low clock marker             |
| `output_low`     | Active-low output marker            |
| `edge_clock_high` | Edge clock marker                  |
| `non_logic`      | Non-logic pin marker                |

## Connection point placement

The `at` coordinate is the electrical connection point. The visible pin line extends from that coordinate in the pin angle direction by `length`.

| Example pin                      | Local connection point | Line direction |
| -------------------------------- | ---------------------- | -------------- |
| `(at -5.08 0 0)`                 | `(-5.08, 0)`           | right          |
| `(at 2.54 5.08 270)`             | `(2.54, 5.08)`         | down           |
| `(at 2.54 -5.08 90)`             | `(2.54, -5.08)`        | up             |

## Related

- [[symbol]]
- [[wire]]
- [[at]]
