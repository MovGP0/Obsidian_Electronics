# KiCad `.kicad_sch` Notes

## Format

- KiCad schematic files use a UTF-8, human-readable S-expression format and the `.kicad_sch` extension. Use UTF-8 without BOM for `.kicad_sch` files.
- The root token is `(kicad_sch ...)`. It contains a required `(version YYYYMMDD)` token and a `(generator ...)` token that names the writer.
- KiCad's developer documentation asks third-party writers not to use `eeschema` as the generator identifier, so generated files should use a distinct generator name.
- Coordinates and dimensions are stored in millimeters. Schematic and symbol library data has four decimal places of useful precision.
- `(at X Y [ANGLE])` gives object position and optional rotation. For most objects the angle is in degrees; symbol text angles are stored in tenths of a degree.
- `(pts (xy X Y) ...)` stores ordered point lists for wires, buses, and graphical objects.
- KiCad's public file format docs currently describe the S-expression schematic format for KiCad 6.0 and newer; this repository contains KiCad 10 files with `(version 20260306)` and `(generator_version "10.0")` in files saved by Eeschema.

## Elements

Detailed element notes are split into dedicated articles:

| Area | Articles |
| ---- | -------- |
| Schematic root | [[kicad_sch]], [[title_block]], [[sheet_instances]] |
| Shared syntax | [[at]], [[pts]] |
| Symbols and properties | [[symbol]], [[pin]], [[property]], [[Power Symbols]] |
| Electrical routing | [[wire]], [[junction]], [[bus]], [[bus_entry]] |
| Net naming and open pins | [[label]], [[no_connect]] |
| Graphics and annotations | [[polyline]], [[text]], [[image]] |
| Hierarchy | [[sheet]], [[label]], [[sheet_instances]] |
| Organization | [[group]] |

## Grid Alignment

- KiCad schematic coordinates are stored in millimeters, not in screen pixels or arbitrary integer grid units.
- The ALU CMOS schematics use the same grid spacing as `cmos_inv.kicad_sch`: 1.27 mm, which is KiCad's 50 mil schematic grid. Values such as `128.27`, `133.35`, and `140.97` are valid grid coordinates because they are exact multiples of 1.27 mm.
- Do not judge grid alignment by whether the decimal representation looks like a round number. A coordinate such as `160.02` is on the 1.27 mm grid (`126 * 1.27`).
- Wires, junctions, connector symbols, power symbols, labels, and transistor symbol origins should be placed on the same grid.
- Aligning only wire endpoints is not sufficient. Component origins must also be positioned so their transformed pin endpoints land on the wire grid.
- For unrotated `Simulation_SPICE:PMOS` and `Simulation_SPICE:NMOS` symbols, the pin endpoints are relative to the symbol origin: drain at `(origin_x + 2.54, origin_y + 5.08)`, gate at `(origin_x - 5.08, origin_y)`, and source at `(origin_x + 2.54, origin_y - 5.08)`.
- Connector pin endpoints must also be computed from the placed symbol transform. For example, the repository's mirrored left-side one-pin connector places its external net endpoint to the right of the connector origin.
- Before saving a generated or manually edited schematic, verify that every placed symbol origin and every schematic-body `(xy ...)` or `(at ...)` coordinate used for wires, junctions, labels, connectors, power symbols, and transistor instances is on the intended grid. Embedded `lib_symbols` geometry can use smaller drawing coordinates and should not be treated as schematic placement.

## Save-Crash Troubleshooting

- If KiCad reports `Expecting "(" in line 1 offset 1`, first check whether the file was truncated to 0 bytes. A save crash can leave an empty `.kicad_sch`, which produces the same first-token parse error as an encoding problem.
- `.kicad_sch` files should be UTF-8 without BOM. The first bytes of a valid schematic should start directly with `28 6B 69...`, which is `(ki...`; a BOM would appear before the opening parenthesis.
- A schematic can be readable/exportable but still crash KiCad's writer if generated symbol instances contain malformed `instances` blocks. In one ctLab case, generated blocks used a placeholder project name/path such as `(project "project" (path "/" ...))`; KiCad CLI could export SVG, but `sch upgrade --force` and the GUI save path truncated the schematic.
- Let KiCad regenerate valid placed-symbol `instances` blocks instead of hand-generating placeholder ones. Valid regenerated blocks use the actual project name and sheet UUID path, for example `(project "ctLab" (path "/<root-sheet-uuid>" ...))`.
- A useful isolation test is to copy the schematic, run `kicad-cli sch upgrade --force <copy>`, and then check that the file is still non-empty. If the command fails and the copy becomes 0 bytes, the problem is in syntax accepted by the reader but rejected by the writer.
- Generated `lib_symbols` should not include schematic-level fields such as `(embedded_fonts no)` inside individual symbol definitions. Keep `embedded_fonts` as a schematic-level setting.
- When recovering from a truncation, restore the schematic from version control before opening it again in KiCad, then remove malformed generated `instances` data and verify with both `kicad-cli sch export svg` and `kicad-cli sch upgrade --force` on a copy.

## Local Observations

- `Electronics/Appendix/4700/ALU/cmos_inv.kicad_sch` embeds `Connector:Conn_01x01_Socket`, `Simulation_SPICE:PMOS`, `Simulation_SPICE:NMOS`, `power:VDD`, and `power:GND` in `lib_symbols`.
- The inverter schematic uses connector symbols for external pins, power symbols for `VDD` and `GND`, and transistor symbols with `Sim.Device`, `Sim.Type`, and `Sim.Pins` properties for SPICE export.
- The CMOS transistor symbols expose three simulation pins through `Sim.Pins = "1=D 2=G 3=S"`.
- The inverter drawing style places input connectors on the left, output connectors on the right, PMOS above NMOS, `VDD` at the top, and `GND` at the bottom.

## Sources

- KiCad developer documentation, Schematic File Format: https://dev-docs.kicad.org/en/file-formats/sexpr-schematic/
- KiCad developer documentation, S-Expression Format: https://dev-docs.kicad.org/en/file-formats/sexpr-intro/
