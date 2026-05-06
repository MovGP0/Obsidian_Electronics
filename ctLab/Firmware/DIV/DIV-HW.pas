{###########################################################################}
procedure ShiftIn2400;
//holt AD24temp aus LTC2400, Gesamt-Dauer 46µs, falls Ergebnis negativ ca. 48µs
begin
  STRAD24:=low;
  AD24_3:=0;
  for j:=0 to 3 do
    SCLK:=high;
    if (j=2) then
      NegativeFlag:=(not SDATAIN1);
    endif;
    if (j=3) then
      OverVoltFlag:=SDATAIN1;
    endif;
    SCLK:=low;
  endfor;
  asm;
    ldi _ACCA, 01010001b ; SPI Einschaltwert in _ACCA vorladen
    out SPCR, _ACCA      ; SPI einschalten

    out SPDR, _ACCA      ; SPI Start mit Schreibvorgang, gleichzeitig MSB lesen
    SPIWait24_2:
    in _ACCA, SPSR
    sbrs _ACCA,7         ; Ende SPIF?
    rjmp SPIWait24_2     ; auf Ende des SPI-Transfer warten
    in  _ACCA, SPDR
    sts DIV.AD24_2, _ACCA

    out SPDR, _ACCA      ; SPI Start mit Schreibvorgang
    SPIWait24_1:
    in _ACCA, SPSR
    sbrs _ACCA,7         ; SPIF?
    rjmp SPIWait24_1     ; auf Ende des SPI-Transfer warten
    in  _ACCA, SPDR
    sts DIV.AD24_1, _ACCA

    out SPDR, _ACCA      ; SPI Start mit Schreibvorgang
    SPIWait24_0:
    in  _ACCA, SPSR
    sbrs _ACCA,7         ; SPIF?
    rjmp SPIWait24_0     ; auf Ende des SPI-Transfer warten
    in  _ACCA, SPDR
    sts DIV.AD24_0, _ACCA

    ldi _ACCA, 0
    out SPCR, _ACCA      ; SPI ausschalten

    ldi _ACCB, 4         ; vier restliche Dither-Bits (Dummys)
    Trailing_AD24:
    nop
    sbi DIV.ControlBitPort, DIV.b_SCLK
    nop
    dec _ACCB
    cbi DIV.ControlBitPort, DIV.b_SCLK
    brne  Trailing_AD24;

  endasm;

  if NegativeFlag then // Clipping
//    OverloadFlag:=true;
    OverVoltFlag:=false;
    AD24_3:=$FF;      // MSB auffüllen für 2er Komplement
  else
    AD24_3:=0;
  endif;
  if OverVoltFlag then // Clipping
    AD24temp:= 16777215; // 2^24-1
  endif;
  STRAD24:=high;
end;


interrupt Int2; // externer Trigger-Eingang, neg. Flanke
begin
  Trigger:=true;
end;

procedure OnSysTick(saveallregs);
// AD24 lesen und integrieren, wenn fertig. Gesamtdauer bei Wandlung ca. 108µs
begin
  SCLK:= low;
  STRAD24:= low;
  if AbortFlag then
    STRAD24:=low;
    nop;
    nop;
    SCLK:=high;
    nop;
    nop;
    SCLK:=low;
    AbortFlag:=false;
  else
    if (SDATAIN1 = low) then // EOC LTC2400, Wandlung fertig?
      STRAD24:= high;
      ShiftIn2400;
      //Ergebnis der Wandlung steht in AD24temp, zusätzlich integrierte Werte:
      AD24tempFI:=(AD24temp+AD24Integrate0) div 2;
      AD24Integrate0:=AD24tempFI;

      AD24tempSI:=(AD24temp+AD24Integrate1+AD24Integrate2+AD24Integrate3) div 4;
      AD24Integrate3:=AD24Integrate2;
      AD24Integrate2:=AD24Integrate1;
      AD24Integrate1:=AD24tempSI;

      AD24ready:= true; // AD24 aktualisiert
    endif;
  endif;
  STRAD24:= high;
  AD10ready:= true;
end;


