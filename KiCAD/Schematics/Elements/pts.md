---
title: Points
---
**`pts`** stores an ordered list of `(xy X Y)` coordinates.
```lisp
(pts
	(xy 189.23 55.88) (xy 189.23 60.96)
)
```

## Points element

| Field | Type   | Description                          |
| ----- | ------ | ------------------------------------ |
| `xy`  | point  | One coordinate pair in millimeters   |
| `X`   | number | Horizontal coordinate in millimeters |
| `Y`   | number | Vertical coordinate in millimeters   |

## Usage

`pts` is used by line-like elements such as [[wire|Wires]], [[bus|Buses]], and [[polyline|Polylines]].

## Connectivity

For electrical elements, point coordinates must be exact. A wire endpoint at `(xy 10.16 20.32)` only connects to another endpoint, pin, or label anchor at the same coordinate.

For graphical elements, `pts` only controls drawing. A [[polyline|Polyline]] does not create electrical connectivity even when its points touch symbol pins.
