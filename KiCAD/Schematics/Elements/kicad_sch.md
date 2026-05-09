- Files are encoded as UTF-8 without BOM
- Empty lines are not allowed

***Minimal File example**
```lisp
(kicad_sch
	(version 20260306)
	(generator "eeschema")
	(generator_version "10.0")
	(uuid "0f7b503f-9b27-49ee-9077-99029cb3d24c")
	(paper "A4")
	(lib_symbols)
)
```

| Field             | Type   | Description                                      |
| ----------------- | ------ | ------------------------------------------------ |
| version           | date   | Date when the file was created                   |
| generator         | string | Name of the application that created the file    |
| generator_version | string | Version of the application that created the file |
| uuid              | uuid   | unique identifier that identifies the schematic  |
| paper             | string | Name of the "Drawing Sheet" template to be used  |
| lib_symbols       | node   | group that contains [[symbol]]          |

## Related

- [[title_block|Title Blocks]]
- [[at|At]]
- [[pts|Points]]
- [[symbol|Symbols]]
- [[wire|Wires]]
- [[bus|Buses]]
- [[junction|Junctions]]
- [[no_connect|No Connect]]
- [[label|Labels]]
- [[sheet|Sheets]]
- [[sheet_instances|Sheet Instances]]
- [[group]]
