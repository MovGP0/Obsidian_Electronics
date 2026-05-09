---
title: Images
---
**Images** place bitmap artwork in a schematic. They are graphical only and do not create electrical connectivity.
```lisp
(image
	(at 25.4 25.4)
	(scale 1)
	(uuid "11111111-1111-1111-1111-111111111111")
	(data
		"...base64 image data..."
	)
)
```

## Image element

| Field   | Type   | Description                                   |
| ------- | ------ | --------------------------------------------- |
| [[at]] | point  | Image position in schematic coordinates       |
| `scale` | number | Image scale factor                            |
| `data`  | string | Encoded image data stored in the schematic    |
| `uuid`  | uuid   | Unique identifier for this image object       |

## Usage

Images are useful for logos, reference diagrams, screenshots, or mechanical notes. They should not be used for schematic symbols, pin graphics, or anything that must participate in ERC.

## Related

- [[text|Text]]
- [[title_block|Title Blocks]]
- [[at|At]]
