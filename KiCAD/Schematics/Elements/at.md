---
title: At
---
**`at`** stores an element position and, for most positioned elements, an optional rotation.
```lisp
(at 50.8 55.88 0)
```

## At element

| Field   | Type   | Description                          |
| ------- | ------ | ------------------------------------ |
| `X`     | number | Horizontal coordinate in millimeters |
| `Y`     | number | Vertical coordinate in millimeters   |
| `ANGLE` | number | Optional rotation angle              |

## Rotation

Most schematic element rotations are stored in degrees. Symbol text angles are stored in tenths of a degree.

| Example              | Meaning                         |
| -------------------- | ------------------------------- |
| `(at 50.8 55.88)`    | Position without explicit angle |
| `(at 50.8 55.88 0)`  | Position with 0 degree rotation |
| `(at 50.8 55.88 90)` | Position with 90 degree rotation |

## Usage

`at` is used by positioned schematic elements such as [[symbol|Symbols]], [[property|Properties]], [[label|Labels]], [[junction|Junctions]], [[no_connect|No Connect]], [[sheet|Sheets]], [[bus_entry|Bus Entries]], [[text|Text]], and [[image|Images]].

For pins and labels, the `at` coordinate is also the electrical anchor. It must match the intended wire, bus entry, sheet pin, or transformed symbol pin coordinate exactly.
