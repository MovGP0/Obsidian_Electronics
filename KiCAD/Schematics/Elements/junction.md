---
title: Junctions
---
**Junctions** are schematic-level connection dots. They mark an explicit electrical join where wires meet, especially at T-junctions and connected wire crossings.
```lisp
(junction
	(at 140.97 121.92)
	(diameter 0)
	(color 0 0 0 0)
	(uuid "04c5a5d6-c141-47e4-8a5d-f389bc976f55")
)
```

## Junction element

| Field      | Type   | Description                                               |
| ---------- | ------ | --------------------------------------------------------- |
| [[at]] | point  | Junction coordinate; must match the wire connection point |
| `diameter` | number | Dot diameter in millimeters; `0` means KiCad default      |
| `color`    | rgba   | Dot color; `0 0 0 0` means default theme color            |
| `uuid`     | uuid   | Unique identifier for this junction                       |

## Placement

The junction coordinate must be exactly coincident with the wire point it is documenting. Small coordinate differences create a visual dot that does not sit on the intended net.

| Pattern       | Use case                                                        |
| ------------- | --------------------------------------------------------------- |
| T-junction    | A branch wire touches the middle or endpoint of another wire    |
| Multi-way join | Several wire segments meet at the same coordinate              |
| Crossing join | Two crossing wires are intended to be electrically connected    |

## Diameter and color

`diameter 0` and `color 0 0 0 0` are KiCad defaults. Prefer the defaults for generated schematics unless the drawing intentionally needs a custom appearance.

## Connectivity

Junctions document an intended connection, but they still need matching geometry. The wires must share the junction coordinate. A junction placed near a wire does not connect it.

## Related

- [[wire|Wires]]
- [[at|At]]
- [[group]]
