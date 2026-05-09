---
title: Text
---
**Texts** are for annotations. It is not a net label and does not create electrical connectivity.
```lisp
(text "LOGIC"
	(at 25.4 25.4 0)
	(effects
		(font
			(size 1.27 1.27)
		)
		(justify left)
	)
	(uuid "11111111-1111-1111-1111-111111111111")
)
```

## Text element

| Field     | Type   | Description                                |
| --------- | ------ | ------------------------------------------ |
| text      | string | Displayed text                             |
| [[at]] | point  | Text position and rotation                 |
| `effects` | node   | Text style, size, and justification        |
| `uuid`    | uuid   | Unique identifier for this text annotation |

## Text effects

| Field     | Type | Description                                      |
| --------- | ---- | ------------------------------------------------ |
| `font`    | node | Font size and optional styling                   |
| `size`    | size | Text size in millimeters                         |
| `justify` | enum | Text alignment, such as `left`, `right`, `top`, or `bottom` |

## Usage

Use `text` for human-readable notes, section labels, warnings, and explanations. Use [[label|Labels]] when the text must name an electrical net.

## Related

- [[label|Labels]]
- [[polyline|Polylines]]
- [[title_block|Title Blocks]]
- [[at|At]]
