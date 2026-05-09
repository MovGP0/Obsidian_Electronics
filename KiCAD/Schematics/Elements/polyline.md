---
title: Polylines
---
**Polylines** are schematic drawing primitives. They are stored as `polyline` elements and do not create electrical connectivity.
```lisp
(polyline
	(pts
		(xy 25.4 25.4) (xy 50.8 25.4) (xy 50.8 38.1)
	)
	(stroke
		(width 0.1524)
		(type default)
	)
	(uuid "11111111-1111-1111-1111-111111111111")
)
```

## Polyline element

| Field           | Type  | Description                                      |
| --------------- | ----- | ------------------------------------------------ |
| [[pts]] | node  | Ordered list of graphical points                 |
| `xy`            | point | Point coordinate in millimeters                  |
| `stroke`        | node  | Drawing style for the graphical line             |
| `uuid`          | uuid  | Unique identifier for this graphical line object |
## Difference from wires

| Element           | Electrical meaning              | Use case                     |
| ----------------- | ------------------------------- | ---------------------------- |
| [[wire]] | Creates electrical connectivity | Nets between pins and labels |
| [[bus]]   | Routes grouped nets             | Bus trunks                   |
| `polyline`        | No electrical meaning           | Notes, outlines, separators  |

Use `polyline` only for visual graphics. Do not use it to connect pins.

## Related

- [[wire|Wires]]
- [[bus|Buses]]
- [[text|Text]]
- [[symbol|Symbols]]
- [[pts|Points]]
