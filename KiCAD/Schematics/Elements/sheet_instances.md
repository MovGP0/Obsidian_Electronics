---
title: Sheet Instances
---
**Sheet instances** store page and hierarchy path information for a schematic sheet. The root schematic has a `sheet_instances` section with the root path `/`.
```lisp
(sheet_instances
	(path "/"
		(page "1")
	)
)
```

## Root sheet instance

| Field  | Type   | Description                                 |
| ------ | ------ | ------------------------------------------- |
| `path` | string | Hierarchical instance path; root is `"/"`   |
| `page` | string | Page number shown for this schematic sheet  |

## Hierarchical paths

Child sheet paths are built from schematic and sheet UUIDs separated by `/`. KiCad uses these paths to distinguish multiple instances of the same child schematic file.

## Usage

Let KiCad regenerate sheet instance data when possible. Hand-written placeholders can make a schematic readable but still fail when KiCad later saves or upgrades it.

## Related

- [[sheet|Sheets]]
- [[kicad_sch|KiCad Schematic Files]]
