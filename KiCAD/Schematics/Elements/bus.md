---
title: Buses
---
**Buses** are schematic-level line segments used to route groups of related nets. They use the same structural fields as `wire`, but the token is `bus`.
```lisp
(bus
	(pts
		(xy 25.4 50.8) (xy 76.2 50.8)
	)
	(stroke
		(width 0)
		(type default)
	)
	(uuid "11111111-1111-1111-1111-111111111111")
)
```

## Bus element

| Field    | Type  | Description                                      |
| -------- | ----- | ------------------------------------------------ |
| [[pts]] | node  | Ordered list of bus points                       |
| `xy`     | point | Bus endpoint or corner coordinate in millimeters |
| `stroke` | node  | Drawing style for the bus                        |
| `uuid`   | uuid  | Unique identifier for this bus segment           |

Like wires, buses should be split into simple horizontal and vertical segments when generating schematics. Shared bus endpoints connect bus segments together.

## Bus points

| Pattern         | Example                                | Meaning                  |
| --------------- | -------------------------------------- | ------------------------ |
| Horizontal bus  | `(xy 25.4 50.8) (xy 76.2 50.8)`       | Same `Y`, different `X`  |
| Vertical bus    | `(xy 76.2 50.8) (xy 76.2 101.6)`      | Same `X`, different `Y`  |
| Shared endpoint | two buses both touch `(xy 76.2 50.8)` | The bus segments connect |

## Stroke

| Field          | Type   | Description                                  |
| -------------- | ------ | -------------------------------------------- |
| `stroke width` | number | Line width in millimeters; `0` means default |
| `stroke type`  | enum   | Usually `default` for generated schematics   |

## Connectivity

A bus is not a single scalar net. It groups named nets, and individual wires normally enter or leave it through `bus_entry` elements and labels. Keep bus coordinates exact; small coordinate differences create separate bus segments.

## Related

- [[bus_entry|Bus Entries]]
- [[wire|Wires]]
- [[label|Labels]]
- [[pts|Points]]
