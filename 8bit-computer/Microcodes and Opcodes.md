### Control signals

| Signal | Bit mask | Meaning                                      |
| ------ | -------- | -------------------------------------------- |
| `HLT`  | `0x8000` | Halt clock                                   |
| `MI`   | `0x4000` | Memory address register in                   |
| `RI`   | `0x2000` | RAM data in                                  |
| `RO`   | `0x1000` | RAM data out                                 |
| `IO`   | `0x0800` | Instruction register out                     |
| `II`   | `0x0400` | Instruction register in                      |
| `AI`   | `0x0200` | A register in                                |
| `AO`   | `0x0100` | A register out                               |
| `EO`   | `0x0080` | ALU out                                      |
| `SU`   | `0x0040` | ALU subtract                                 |
| `BI`   | `0x0020` | B register in                                |
| `OI`   | `0x0010` | Output register in                           |
| `CE`   | `0x0008` | Program counter enable                       |
| `CO`   | `0x0004` | Program counter out                          |
| `J`    | `0x0002` | Jump / program counter in                    |
| `FI`   | `0x0001` | Flags register in; only in the flags version |
### Common fetch cycle

| T-state | Control word | Meaning |
| ------: | ------------ | ------- |
|    `T0` | `MI`         | `CO`    |
|    `T1` | `RO`         | `II`    |
### Opcodes

| Opcode | Mnemonic   | T0   | T1   | T2   | T3   | T4   | T5    | T6   | T7   |
| -----: | ---------- | ---- | ---- | ---- | ---- | ---- | ----- | ---- | ---- |
| `0000` | `NOP`      | `MI` | `CO` | `RO` | `II` | `CE` | —     | —    | —    |
| `0001` | `LDA addr` | `MI` | `CO` | `RO` | `II` | `CE` | `IO`  | `MI` | `RO` |
| `0010` | `ADD addr` | `MI` | `CO` | `RO` | `II` | `CE` | `IO`  | `MI` | `RO` |
| `0011` | `SUB addr` | `MI` | `CO` | `RO` | `II` | `CE` | `IO`  | `MI` | `RO` |
| `0100` | `STA addr` | `MI` | `CO` | `RO` | `II` | `CE` | `IO`  | `MI` | `AO` |
| `0101` | `LDI imm`  | `MI` | `CO` | `RO` | `II` | `CE` | `IO`  | `AI` | —    |
| `0110` | `JMP addr` | `MI` | `CO` | `RO` | `II` | `CE` | `IO`  | `J`  | —    |
| `1110` | `OUT`      | `MI` | `CO` | `RO` | `II` | `CE` | `AO`  | `OI` | —    |
| `1111` | `HLT`      | `MI` | `CO` | `RO` | `II` | `CE` | `HLT` | —    | —    |
### Flags

The flags version changes two things:

1. `ADD` and `SUB` write the flags register using `FI`.
2. Opcodes `0111` and `1000` become conditional jumps.

| Opcode | Mnemonic   | Difference from original |
| -----: | ---------- | ------------------------ |
| `0010` | `ADD addr` | `T4 = EO`                |
| `0011` | `SUB addr` | `T4 = EO`                |
| `0111` | `JC addr`  | `T2 = IO`                |
| `1000` | `JZ addr`  | `T2 = IO`                |

| Flags        | `JC` opcode `0111`, T2 | `JZ` opcode `1000`, T2 |
| ------------ | ---------------------- | ---------------------- |
| `ZF=0, CF=0` | —                      | —                      |
| `ZF=0, CF=1` | `IO`                   | `J`                    |
| `ZF=1, CF=0` | —                      | `IO`                   |
| `ZF=1, CF=1` | `IO`                   | `J`                    |
### EEPROM address layout

| Address bits | Meaning                                                   |
| ------------ | --------------------------------------------------------- |
| `A9..A8`     | Flags state: zero/carry combination                       |
| `A7`         | Byte select: high byte or low byte of 16-bit control word |
| `A6..A3`     | Instruction opcode                                        |
| `A2..A0`     | Microstep / T-state                                       |
### Sources

- [Ben Eater's 8-bit Computer](https://eater.net/8bit)
