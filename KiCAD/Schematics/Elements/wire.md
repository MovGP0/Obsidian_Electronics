---
title: Wires
---
**Wires** are schematic-level line segments that create electrical nets by touching symbol pins, power symbols, and other wires at identical coordinates.
```lisp
(wire
	(pts
		(xy 189.23 55.88) (xy 189.23 60.96)
	)
	(stroke
		(width 0)
		(type default)
	)
	(uuid "01b22d16-ddf2-40a5-b1bd-1f8b9c0a78fd")
)
```

## Wire element

| Field    | Type  | Description                                                      |
| -------- | ----- | ---------------------------------------------------------------- |
| [[pts]] | node  | Ordered list of wire points                                      |
| `xy`     | point | Wire endpoint or corner coordinate in millimeters                |
| `stroke` | node  | Drawing style for the wire                                       |
| `uuid`   | uuid  | Unique identifier for this wire segment                          |

KiCad commonly stores schematic wires as simple two-point segments. A routed path with bends is stored as multiple `wire` elements that share endpoints, instead of one long polyline with several corners.

## Wire points

| Pattern            | Example                                             | Meaning                       |
| ------------------ | --------------------------------------------------- | ----------------------------- |
| Horizontal wire    | `(xy 138.43 87.63) (xy 157.48 87.63)`              | Same `Y`, different `X`       |
| Vertical wire      | `(xy 189.23 55.88) (xy 189.23 60.96)`              | Same `X`, different `Y`       |
| Shared endpoint    | two wires both touch `(xy 189.23 60.96)`            | The two wire segments connect |
| Symbol pin contact | wire endpoint equals transformed pin `at` coordinate | Wire connects to the pin      |

Use grid-aligned coordinates. In this repository many generated schematics use the 1.27 mm grid, but some imported schematics can contain coordinates on other KiCad grid intervals.

## Stroke

| Field          | Type   | Description                                  |
| -------------- | ------ | -------------------------------------------- |
| `stroke width` | number | Line width in millimeters; `0` means default |
| `stroke type`  | enum   | Usually `default` for generated schematics   |

```lisp
(stroke
	(width 0)
	(type default)
)
```

## Connectivity rules

| Rule                    | Description                                                                 |
| ----------------------- | --------------------------------------------------------------------------- |
| Coincident endpoints    | Wires connect when their endpoints or segment points share the same coordinate |
| Pin contact             | A wire connects to a symbol pin only at the transformed pin connection point |
| UUID uniqueness         | Every schematic element should have its own UUID                            |

When generating schematics, split routed connections into horizontal and vertical wire segments and make every intended connection coordinate exact. Small coordinate differences create separate nets. Explicit junction dots are documented separately.

## Related

- [[junction|Junctions]]
- [[bus|Buses]]
- [[bus_entry|Bus Entries]]
- [[label|Labels]]
- [[symbol|Symbols]]
- [[pts|Points]]
- [[group]]
