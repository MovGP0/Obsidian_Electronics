---
title: KiCad Simulation_SPICE Symbols
---

# KiCad Simulation_SPICE Symbols

Source: `Simulation_SPICE.kicad_sym`

| Symbol | Preview | Reference | Value | Footprint | Datasheet | Description | Keywords |
| ------ | ------- | --------- | ----- | --------- | --------- | ----------- | -------- |
| `0` | ![[kicad-symbol-83643ab6c541099f.svg]] | #GND | 0 |  | https://ngspice.sourceforge.io/docs/ngspice-html-manual/manual.xhtml#subsec_Circuit_elements__device | 0V reference potential for simulation | simulation |
| `BSOURCE` | ![[kicad-symbol-f18350b8e4e64ffa.svg]] | B | BSOURCE |  | https://ngspice.sourceforge.io/docs/ngspice-html-manual/manual.xhtml#sec_Non_linear_Dependent_Sources | Arbitrary behavioral voltage or current source for simulation only | simulation dependent |
| `D` | ![[kicad-symbol-0eab68512be4116a.svg]] | D | D |  | https://ngspice.sourceforge.io/docs/ngspice-html-manual/manual.xhtml#cha_DIODEs | Diode for simulation or PCB | simulation |
| `ESOURCE` | ![[kicad-symbol-a47d5583dc448dfb.svg]] | E | ESOURCE |  | https://ngspice.sourceforge.io/docs/ngspice-html-manual/manual.xhtml#subsec_Exxxx__Linear_Voltage_Controlled | Voltage-controlled voltage source symbol for simulation only | simulation vcvs dependent |
| `GSOURCE` | ![[kicad-symbol-527f1c019ca63b59.svg]] | G | GSOURCE |  | https://ngspice.sourceforge.io/docs/ngspice-html-manual/manual.xhtml#subsec_Gxxxx__Linear_Voltage_Controlled | Voltage-controlled current source symbol for simulation only | simulation vccs dependent |
| `IAM` | ![[kicad-symbol-39592c1138e781ab.svg]] | I | IAM |  | https://ngspice.sourceforge.io/docs/ngspice-html-manual/manual.xhtml#sec_Independent_Sources_for | Current source, AM | simulation amplitude modulated |
| `IBIS_DEVICE` | ![[kicad-symbol-0dd20caf2d81ee6d.svg]] | U? | IBIS_DEVICE |  | https://ibis.org | Device model for IBIS files. Pin 3 can be used to monitor the die potential | Simulation IBIS |
| `IBIS_DEVICE_DIFF` | ![[kicad-symbol-0dd20caf2d81ee6d.svg]] | U? | IBIS_DEVICE_DIFF |  | https://ibis.org | Device model for IBIS files. Pin 3 can be used to monitor the die potential | Simulation IBIS |
| `IBIS_DRIVER` | ![[kicad-symbol-0dd20caf2d81ee6d.svg]] | U? | IBIS_DRIVER |  | https://ibis.org | Driver model for IBIS files. | Simulation IBIS |
| `IBIS_DRIVER_DIFF` | ![[kicad-symbol-710bf6224bde2fd3.svg]] | U? | IBIS_DRIVER_DIFF |  | https://ibis.org | Driver model for IBIS files. Pin 3 can be used to monitor the die potential. | Simulation IBIS |
| `IDC` | ![[kicad-symbol-1508d845cde60a48.svg]] | I | 1 |  | https://ngspice.sourceforge.io/docs/ngspice-html-manual/manual.xhtml#sec_Independent_Sources_for | Current source, DC | simulation |
| `IEXP` | ![[kicad-symbol-ec21e5ecc9ae3ad7.svg]] | I | IEXP |  | https://ngspice.sourceforge.io/docs/ngspice-html-manual/manual.xhtml#sec_Independent_Sources_for | Current source, exponential | simulation |
| `IPULSE` | ![[kicad-symbol-ef35a46ebcd5358c.svg]] | I | IPULSE |  | https://ngspice.sourceforge.io/docs/ngspice-html-manual/manual.xhtml#sec_Independent_Sources_for | Current source, pulse | simulation |
| `IPWL` | ![[kicad-symbol-98f29731c9018d3a.svg]] | I | IPWL |  | https://ngspice.sourceforge.io/docs/ngspice-html-manual/manual.xhtml#sec_Independent_Sources_for | Current source, piece-wise linear | simulation |
| `ISFFM` | ![[kicad-symbol-ef6f7c34fd470af0.svg]] | I | ISFFM |  | https://ngspice.sourceforge.io/docs/ngspice-html-manual/manual.xhtml#sec_Independent_Sources_for | Current source, single-frequency FM | simulation frequency modulated |
| `ISIN` | ![[kicad-symbol-f40cf655864d929b.svg]] | I | ISIN |  | https://ngspice.sourceforge.io/docs/ngspice-html-manual/manual.xhtml#sec_Independent_Sources_for | Current source, sinusoidal | simulation |
| `ITRNOISE` | ![[kicad-symbol-bcc7a63e3a09147a.svg]] | I | ITRNOISE |  | https://ngspice.sourceforge.io/docs/ngspice-html-manual/manual.xhtml#subsec_Transient_noise_source | Current source, transient noise | simulation |
| `ITRRANDOM` | ![[kicad-symbol-bcc7a63e3a09147a.svg]] | I | ITRRANDOM |  | https://ngspice.sourceforge.io/docs/ngspice-html-manual/manual.xhtml#subsec_Random_voltage_source | Current source, random noise | simulation |
| `NJFET` | ![[kicad-symbol-e68fd0f62e816eda.svg]] | Q | NJFET |  | https://ngspice.sourceforge.io/docs/ngspice-html-manual/manual.xhtml#cha_JFETs | N-JFET transistor, for simulation only | transistor NJFET N-JFET |
| `NMOS` | ![[kicad-symbol-05371a41bbf9b97c.svg]] | Q | NMOS |  | https://ngspice.sourceforge.io/docs/ngspice-html-manual/manual.xhtml#cha_MOSFETs | N-MOSFET transistor, drain/source/gate | transistor NMOS N-MOS N-MOSFET simulation |
| `NMOS_Substrate` | ![[kicad-symbol-2560c844068634fa.svg]] | Q | NMOS_Substrate |  | https://ngspice.sourceforge.io/docs/ngspice-html-manual/manual.xhtml#cha_MOSFETs | N-channel MOSFET symbol with substrate (bulk) pin | mosfet nmos simulation |
| `NPN` | ![[kicad-symbol-0e63ace62c90d2bd.svg]] | Q | NPN |  | https://ngspice.sourceforge.io/docs/ngspice-html-manual/manual.xhtml#cha_BJTs | Bipolar transistor symbol for simulation only, substrate tied to the emitter | simulation |
| `NPN_Substrate` | ![[kicad-symbol-0486a84d8e97a136.svg]] | Q | NPN_Substrate |  | https://ngspice.sourceforge.io/docs/ngspice-html-manual/manual.xhtml#cha_BJTs | Bipolar transistor symbol for simulation only, with substrate pin | simulation |
| `OPAMP` | ![[kicad-symbol-0dd20caf2d81ee6d.svg]] | U | ${SIM.PARAMS} |  | https://ngspice.sourceforge.io/docs/ngspice-html-manual/manual.xhtml#sec__SUBCKT_Subcircuits | Operational amplifier, single | simulation |
| `PJFET` | ![[kicad-symbol-fdcd966d5f114b6a.svg]] | Q | PJFET |  | https://ngspice.sourceforge.io/docs/ngspice-html-manual/manual.xhtml#cha_JFETs | P-JFET transistor, for simulation only | transistor PJFET P-JFET |
| `PMOS` | ![[kicad-symbol-99aa4443ec898bc8.svg]] | Q | PMOS |  | https://ngspice.sourceforge.io/docs/ngspice-html-manual/manual.xhtml#cha_MOSFETs | P-MOSFET transistor, drain/source/gate | transistor PMOS P-MOS P-MOSFET simulation |
| `PMOS_Substrate` | ![[kicad-symbol-45882af37fc5b90f.svg]] | Q | PMOS_Substrate |  | https://ngspice.sourceforge.io/docs/ngspice-html-manual/manual.xhtml#cha_MOSFETs | P-channel MOSFET symbol with substrate (bulk) pin | mosfet pmos simulation |
| `PNP` | ![[kicad-symbol-8170ce5ccd36e6df.svg]] | Q | PNP |  | https://ngspice.sourceforge.io/docs/ngspice-html-manual/manual.xhtml#cha_BJTs | Bipolar transistor symbol for simulation only, substrate tied to the emitter | simulation |
| `PNP_Substrate` | ![[kicad-symbol-46c4e0a10c4240fa.svg]] | Q | PNP_Substrate |  | https://ngspice.sourceforge.io/docs/ngspice-html-manual/manual.xhtml#cha_BJTs | Bipolar transistor symbol for simulation only, with substrate pin | simulation |
| `Potentiometer` | ![[kicad-symbol-b7a5383c3b8e9d6a.svg]] | R | Potentiometer |  |  | Potentiometer for Simulation | resistor variable spice sim |
| `SWITCH` | ![[kicad-symbol-4e501c87eaea2545.svg]] | S | SWITCH |  | https://ngspice.sourceforge.io/docs/ngspice-html-manual/manual.xhtml#subsec_Switches | Voltage controlled switch symbol for simulation only | simulation |
| `TLINE` | ![[kicad-symbol-13be778e02643d33.svg]] | T | TLINE |  | https://ngspice.sourceforge.io/docs/ngspice-html-manual/manual.xhtml#sec_Lossless_Transmission_Lines | Lossless transmission line, for simulation only | lossless transmission line characteristic impedance |
| `VAM` | ![[kicad-symbol-2e89d66b8351e1da.svg]] | V | VAM |  | https://ngspice.sourceforge.io/docs/ngspice-html-manual/manual.xhtml#sec_Independent_Sources_for | Voltage source, AM | simulation amplitude modulated |
| `VDC` | ![[kicad-symbol-1e8e2b4f8e9c5863.svg]] | V | 1 |  | https://ngspice.sourceforge.io/docs/ngspice-html-manual/manual.xhtml#sec_Independent_Sources_for | Voltage source, DC | simulation |
| `VEXP` | ![[kicad-symbol-0cb14f30d474e9e6.svg]] | V | VEXP |  | https://ngspice.sourceforge.io/docs/ngspice-html-manual/manual.xhtml#sec_Independent_Sources_for | Voltage source, exponential | simulation |
| `VOLTMETER_DIFF` | ![[kicad-symbol-4d9c3fec7ee8c903.svg]] | MES? | VOLTMETER_DIFF |  | https://ngspice.sourceforge.io/docs/ngspice-html-manual/manual.xhtml#sec__SUBCKT_Subcircuits | Differential voltmeter for simulation. The sensed differential voltage can be measured on the third terminal as a single-ended voltage | voltmeter differential vdiff |
| `VPULSE` | ![[kicad-symbol-d9208130b1ef1de8.svg]] | V | VPULSE |  | https://ngspice.sourceforge.io/docs/ngspice-html-manual/manual.xhtml#sec_Independent_Sources_for | Voltage source, pulse | simulation |
| `VPWL` | ![[kicad-symbol-ffb6fe38bf5f8546.svg]] | V | VPWL |  | https://ngspice.sourceforge.io/docs/ngspice-html-manual/manual.xhtml#sec_Independent_Sources_for | Voltage source, piece-wise linear | simulation |
| `VSFFM` | ![[kicad-symbol-caaf7a14f3e26f10.svg]] | V | VSFFM |  | https://ngspice.sourceforge.io/docs/ngspice-html-manual/manual.xhtml#sec_Independent_Sources_for | Voltage source, single-frequency FM | simulation frequency modulated |
| `VSIN` | ![[kicad-symbol-26efa0794a18b3db.svg]] | V | VSIN |  | https://ngspice.sourceforge.io/docs/ngspice-html-manual/manual.xhtml#sec_Independent_Sources_for | Voltage source, sinusoidal | simulation ac vac |
| `VTRNOISE` | ![[kicad-symbol-e768d68802d4f329.svg]] | V | VTRNOISE |  | https://ngspice.sourceforge.io/docs/ngspice-html-manual/manual.xhtml#subsec_Transient_noise_source | Voltage source, transient noise | simulation |
| `VTRRANDOM` | ![[kicad-symbol-e768d68802d4f329.svg]] | V | VTRRANDOM |  | https://ngspice.sourceforge.io/docs/ngspice-html-manual/manual.xhtml#subsec_Random_voltage_source | Voltage source, random noise | simulation |
