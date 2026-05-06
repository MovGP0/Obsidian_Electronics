# c't-Lab Firmware Sources

Downloaded from the surviving sn7400 c't-Lab firmware mirror:
- Root listing: https://www.sn7400.de/ctlab/Firmware/

Downloaded modules:
- `ACV`: ACV.asm, ACV.pas, ACV.zip
- `ADA-IO`: ADA-C-HW.pas, ADA-C-parser.pas, ADA-C.asm, ADA-C.pas, ADA-C.zip
- `DCG`: DCG-HW.pas, DCG-Parser.pas, DCG.asm, DCG.pas, DCG.zip
- `DDS`: dB775mV.txt, DDS-HW.pas, DDS-SQG.pas, DDS.asm, DDS.pas, DDS.zip, mp3control.pas
- `DIV`: DIV-HW.pas, DIV-Parser.pas, DIV.asm, DIV.pas, DIV.zip
- `EDL`: EDL-HW.pas, EDL-Parser.pas, EDL.asm, EDL.pas, EDL.zip
- `FPGA`: FPGA_2.6_sdcard_demo.zip, FPGA_2.40.zip, FPGA_2.51.zip, FPGA_2.61.zip, FPGA_2.62.zip

Not downloaded:
- `IFP`: no separate c't-Lab AVR firmware was found. The IFP board uses interface parts like `FT232RL`, `MAX232`, and `XPort-01` rather than an `ATmega32` module controller.
- `DCP`: no separate firmware mirror directory; the DCP article states the control logic lives on the `DCG` board.
- `Panel` / `PM8`: no separate microcontroller firmware mirror directory was found.
- `ADC192`, `TRMSC`, `AD16-8`, `DA12-8`, `IO8-32`: these are add-on or daughter boards controlled by another module.

Mirror directories present but not downloaded here because they do not map to the local c't-Lab module article set:
- `ULD`
- `UNIC`
