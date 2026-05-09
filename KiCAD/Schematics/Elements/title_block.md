---
title: Title Blocks
---
**Title blocks** store drawing metadata for the schematic page.
```lisp
(title_block
	(title "CMOS_INV")
	(date "2026-05-09")
	(rev "A")
	(company "Example")
	(comment 1 "Generated schematic")
)
```

## Title block element

| Field     | Type   | Description                         |
| --------- | ------ | ----------------------------------- |
| `title`   | string | Drawing title                       |
| `date`    | string | Drawing date                        |
| `rev`     | string | Revision text                       |
| `company` | string | Company or authoring organization   |
| `comment` | node   | Numbered title-block comment field  |

## Comments

Comment fields use an index and a string value.
```lisp
(comment 1 "Generated schematic")
```

KiCad displays these fields through the selected drawing sheet template.

## Related

- [[kicad_sch|KiCad Schematic Files]]
- [[text|Text]]
