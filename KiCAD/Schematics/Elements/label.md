---
title: Labels
---
**Labels** assign names to nets. The label anchor point must touch a wire or symbol pin coordinate.
```lisp
(label "-9V"
	(at 147.32 139.7 0)
	(effects
		(font
			(size 1.27 1.27)
		)
		(justify left bottom)
	)
	(uuid "2ae1f30b-b059-4e82-a86b-9f1dc799dcd6")
)
```

## Label elements

| Element              | Scope                       | Description                          |
| -------------------- | --------------------------- | ------------------------------------ |
| `label`              | Current sheet               | Local net name                       |
| `global_label`       | Whole project               | Global net name shared across sheets |
| `hierarchical_label` | Parent-child sheet boundary | Sheet interface net name             |

## Local label

Local labels connect matching net names only within the current schematic sheet.

| Field     | Type   | Description                                  |
| --------- | ------ | -------------------------------------------- |
| label text | string | Net name assigned by the label              |
| [[at]] | point  | Label anchor coordinate and orientation      |
| `effects` | node   | Text style and justification                 |
| `uuid`    | uuid   | Unique identifier for this label             |

## Global label

Global labels connect matching net names across the whole project. They include a `shape` because they are also ERC-visible ports.
```lisp
(global_label "GND | 2"
	(shape input)
	(at 266.7 66.04 180)
	(fields_autoplaced yes)
	(effects
		(font
			(size 1.27 1.27)
		)
		(justify right)
	)
	(uuid "0690dc9d-3420-4549-9a84-961b706dc590")
	(property "Intersheetrefs" "${INTERSHEET_REFS}"
		(at 255.4901 66.04 0)
		(hide yes)
		(show_name no)
		(do_not_autoplace no)
	)
)
```

| Field               | Type    | Description                                                  |
| ------------------- | ------- | ------------------------------------------------------------ |
| label text          | string  | Net name assigned by the label                               |
| `shape`             | enum    | ERC direction, such as `input`, `output`, or `bidirectional` |
| [[at]]        | point   | Label anchor coordinate and orientation                      |
| `fields_autoplaced` | boolean | KiCad-managed text placement flag                            |
| `effects`           | node    | Text style and justification                                 |
| `uuid`              | uuid    | Unique identifier for this label                             |
| `property`          | node    | Optional label property, commonly `"Intersheetrefs"`         |

## Hierarchical label

Hierarchical labels define sheet interface ports. They must match sheet pins in the parent schematic.
```lisp
(hierarchical_label "A"
	(shape input)
	(at 25.4 50.8 0)
	(effects
		(font
			(size 1.27 1.27)
		)
		(justify left)
	)
	(uuid "11111111-1111-1111-1111-111111111111")
)
```

| Shape           | Use case                                   |
| --------------- | ------------------------------------------ |
| `input`         | Consumed signal or sheet input             |
| `output`        | Driven signal or sheet output              |
| `bidirectional` | Signal that can drive and receive          |
| `tri_state`     | Output that can enter high impedance       |
| `passive`       | Supply or ambiguous/pass-through interface |

## Anchor placement

The label's `at` coordinate is the electrical anchor. It must be placed exactly on the wire endpoint, wire segment, or transformed symbol pin coordinate it should name. Text justification only affects drawing; it does not move the electrical anchor.

## Related

- [[wire|Wires]]
- [[bus|Buses]]
- [[bus_entry|Bus Entries]]
- [[sheet|Sheets]]
- [[property|Properties]]
- [[at|At]]
- [[group]]
