---
title: Bus Entries
---
**Bus entries** are short diagonal connector marks between a bus and an individual wire.
```lisp
(bus_entry
	(at 76.2 50.8)
	(size 2.54 2.54)
	(stroke
		(width 0)
		(type default)
	)
	(uuid "11111111-1111-1111-1111-111111111111")
)
```

## Bus entry element

| Field    | Type  | Description                                               |
| -------- | ----- | --------------------------------------------------------- |
| [[at]] | point | Start coordinate of the bus entry                         |
| `size`   | size  | X and Y distance from `at` to the other end of the entry  |
| `stroke` | node  | Drawing style for the bus entry                           |
| `uuid`   | uuid  | Unique identifier for this bus entry                      |

## Geometry

The entry runs from `(at X Y)` to `(X + size_x, Y + size_y)`. The sign of `size` controls the diagonal direction.

| Size          | Direction from `at`                 |
| ------------- | ----------------------------------- |
| `2.54 2.54`   | Down/right in schematic coordinates |
| `2.54 -2.54`  | Up/right in schematic coordinates   |
| `-2.54 2.54`  | Down/left in schematic coordinates  |
| `-2.54 -2.54` | Up/left in schematic coordinates    |

## Connectivity

Both ends of the bus entry must touch the intended objects exactly. One end normally touches a `bus`, and the other end touches a scalar `wire` with a label.

## Related

- [[bus|Buses]]
- [[wire|Wires]]
- [[label|Labels]]
- [[at|At]]
