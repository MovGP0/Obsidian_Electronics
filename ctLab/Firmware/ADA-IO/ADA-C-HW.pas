{###########################################################################}

procedure ShiftOut1257;
//Sendet DACtemp an LTC1257
begin
   asm;
    cbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
    cbi  ADAC.ControlBitPort, ADAC.b_SCLK
    sbi  ADAC.ControlBitPort, ADAC.b_STRDAC

    LDS _ACCA, ADAC.DACtemp+1 ; MSB linksbündig
    LSL  _ACCA
    LSL  _ACCA
    LSL  _ACCA
    LSL  _ACCA ; Bit 3 sitzt jetzt oben
    ldi  _ACCB, 4

    ADAC.1257loop1:
    sbrc _ACCA,7 // Bit high?
    sbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
    sbi  ADAC.ControlBitPort, ADAC.b_SCLK
    LSL  _ACCA
    nop
    cbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
    cbi  ADAC.ControlBitPort, ADAC.b_SCLK
    dec _ACCB
    BRNE  ADAC.1257loop1

    LDS _ACCA, ADAC.DACtemp         ; LSB Level zuletzt
    ldi  _ACCB, 7 ; 7 Bits ohne Load

    ADAC.1257loop2:
    sbrc _ACCA,7 // Bit high?
    sbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
    sbi  ADAC.ControlBitPort, ADAC.b_SCLK
    LSL  _ACCA
    nop
    cbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
    cbi  ADAC.ControlBitPort, ADAC.b_SCLK
    dec _ACCB
    BRNE  ADAC.1257loop2

    LSL  _ACCA ; LSB mit Load-impuls
    sbrc _ACCA,7 // Bit high?
    sbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
    sbi  ADAC.ControlBitPort, ADAC.b_SCLK
    cbi  ADAC.ControlBitPort, ADAC.b_STRDAC
    nop
    cbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
    cbi  ADAC.ControlBitPort, ADAC.b_SCLK
    sbi  ADAC.ControlBitPort, ADAC.b_STRDAC
  endasm;
end;

procedure ShiftOut1655;
//Sendet DACtemp an LTC1655, etwas andere Sequenz als 1257
begin
   asm;
    cbi  ADAC.ControlBitPort, ADAC.b_SCLK
    cbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
    cbi  ADAC.ControlBitPort, ADAC.b_STRDAC

    LDS _ACCA, ADAC.DACtemp+1 ; MSB linksbündig
    ldi  _ACCB, 8 ; 8 Bits ohne Load

    ADAC.1655loop1:
    sbrc _ACCA,7 // Bit high?
    sbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
    sbi  ADAC.ControlBitPort, ADAC.b_SCLK
    LSL  _ACCA
    nop
    cbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
    cbi  ADAC.ControlBitPort, ADAC.b_SCLK
    dec _ACCB
    BRNE  ADAC.1655loop1

    LDS _ACCA, ADAC.DACtemp         ; LSB Level zuletzt
    ldi  _ACCB, 8 ; 8 Bits ohne Load

    ADAC.1655loop2:
    sbrc _ACCA,7 // Bit high?
    sbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
    sbi  ADAC.ControlBitPort, ADAC.b_SCLK
    LSL  _ACCA
    cbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
    cbi  ADAC.ControlBitPort, ADAC.b_SCLK
    dec _ACCB
    BRNE  ADAC.1655loop2
    sbi  ADAC.ControlBitPort, ADAC.b_STRDAC
  endasm;
end;

procedure ShiftOut714;
//Sendet DACtemp an DAC714
begin
   asm;
    cbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
    sbi  ADAC.ControlBitPort, ADAC.b_SCLK
    sbi  ADAC.ControlBitPort, ADAC.b_STRDAC

    LDS _ACCA, ADAC.DACtemp+1 ; MSB linksbündig
    ldi  _ACCB, 8

    ADAC.714loop1:
    cbi  ADAC.ControlBitPort, ADAC.b_SCLK
    sbrc _ACCA,7 // Bit high?
    sbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
    LSL  _ACCA
    nop
    sbi  ADAC.ControlBitPort, ADAC.b_SCLK
    cbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
    dec _ACCB
    BRNE  ADAC.714loop1

    LDS _ACCA, ADAC.DACtemp         ; LSB Level zuletzt
    ldi  _ACCB, 8 ; 7 Bits ohne Load

    ADAC.714loop2:
    cbi  ADAC.ControlBitPort, ADAC.b_SCLK
    sbrc _ACCA,7 // Bit high?
    sbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
    LSL  _ACCA
    nop
    sbi  ADAC.ControlBitPort, ADAC.b_SCLK
    cbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
    dec _ACCB
    BRNE  ADAC.714loop2

    cbi  ADAC.ControlBitPort, ADAC.b_SCLK
    nop;
    cbi  ADAC.ControlBitPort, ADAC.b_STRDAC
    nop;
    sbi  ADAC.ControlBitPort, ADAC.b_SCLK
    nop;
    sbi  ADAC.ControlBitPort, ADAC.b_STRDAC
  endasm;
end;

procedure ShiftIn1864;
//holt ADraw aus LTC1864, Interrupt während dieser Zeit gesperrt
begin
   asm;
    cbi  ADAC.ControlBitPort, ADAC.b_STRAD16
    cbi  ADAC.ControlBitPort, ADAC.b_SCLK
    ldi  _ACCB, 8 ; 8 Bits
    nop
    nop
    nop
ADAC.1864loop1:
    clc
    sbi  ADAC.ControlBitPort, ADAC.b_SCLK
    sbic ADAC.ControlBitPin, ADAC.b_SDATAIN1 // Bit gesetzt?
    sec
    cbi  ADAC.ControlBitPort, ADAC.b_SCLK
    rol _ACCA  // Carry-Bit einschieben
    dec _ACCB
    BRNE  ADAC.1864loop1
    sts ADAC.ADraw+1,_ACCA; Hi Byte vom Integer
    ldi  _ACCB, 8 ; 8 Bits
ADAC.1864loop2:
    clc
    sbi  ADAC.ControlBitPort, ADAC.b_SCLK
    sbic ADAC.ControlBitPin, ADAC.b_SDATAIN1 // Bit gesetzt?
    sec
    cbi  ADAC.ControlBitPort, ADAC.b_SCLK
    rol _ACCA
    dec _ACCB
    BRNE  ADAC.1864loop2
    sts ADAC.ADraw,_ACCA; Low Byte vom Integer
    sbi  ADAC.ControlBitPort, ADAC.b_SCLK
    nop
    sbi  ADAC.ControlBitPort, ADAC.b_STRAD16
  endasm;
end;

procedure ShiftOutSR;
//Sende PortArray-Bytes an 4094-SR

begin
  asm;
    cbi  ADAC.ControlBitPort, ADAC.b_SCLK
    cbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
    LDS _ACCA, ADAC.PortSR3;
    ldi  _ACCB, 8

    ADAC.srloop1:
    sbrc _ACCA,7 // Bit high?
    sbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
    sbi  ADAC.ControlBitPort, ADAC.b_SCLK
    LSL  _ACCA
    cbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
    cbi  ADAC.ControlBitPort, ADAC.b_SCLK
    dec _ACCB
    BRNE  ADAC.srloop1

    LDS _ACCA, ADAC.PortSR2;
    ldi  _ACCB, 8

    ADAC.srloop2:
    sbrc _ACCA,7 // Bit high?
    sbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
    sbi  ADAC.ControlBitPort, ADAC.b_SCLK
    LSL  _ACCA
    cbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
    cbi  ADAC.ControlBitPort, ADAC.b_SCLK
    dec _ACCB
    BRNE  ADAC.srloop2

    LDS _ACCA, ADAC.PortSR1         ; LSB Level zuletzt
    ldi  _ACCB, 8

    ADAC.srloop3:
    sbrc _ACCA,7 // Bit high?
    sbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
    sbi  ADAC.ControlBitPort, ADAC.b_SCLK
    LSL  _ACCA
    cbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
    cbi  ADAC.ControlBitPort, ADAC.b_SCLK
    dec _ACCB
    BRNE  ADAC.srloop3

    LDS _ACCA, ADAC.PortSR0         ; LSB Level zuletzt
    ldi  _ACCB, 8

    ADAC.srloop4:
    sbrc _ACCA,7 // Bit high?
    sbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
    sbi  ADAC.ControlBitPort, ADAC.b_SCLK
    LSL  _ACCA
    cbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
    cbi  ADAC.ControlBitPort, ADAC.b_SCLK
    dec _ACCB
    BRNE  ADAC.srloop4

    sbi  ADAC.ControlBitPort, ADAC.b_STR_SR
    nop
    nop
    cbi  ADAC.ControlBitPort, ADAC.b_STR_SR
    sbi  ADAC.ControlBitPort, ADAC.b_SCLK
  endasm;
end;

{
function GetADC10(myChannel:byte):word;
//Zu-Fuss-Implementation der getadc()-Funktion
var
  CurrentADC10:word;
  CurrentADC10lo[@CurrentADC10]:byte;
  CurrentADC10hi[@CurrentADC10+1]:byte;
begin
  if ExtRef=1 then
    ADMUX:= ((myChannel-1) and $07) OR %11000000;  //Internal ADC Reference
  else
    ADMUX:=((myChannel-1) and $07);
  endif;
  asm;
    ldi  _ACCB, 10
    ADC10settleLoop1:  // 3 µs warten
    dec _ACCB
    BRNE ADC10settleLoop1
    ldi  _ACCB, $C7    // Teiler 128
    out ADCSRA, _ACCB
    ADC10endLoop1:
    in _ACCB, ADCSRA
    sbrc _ACCB,6 // auf Bit 6 low warten
    rjmp ADC10endLoop1
  endasm;
  CurrentADC10lo:=ADCL;
  CurrentADC10Hi:=ADCH;
  return(CurrentADC10);
end;
}

procedure OnSysTick(saveallregs);
// Interrupt-Routine, alle 1 ms, dauert etwa 41 µs bei DA16
begin
//A/D-Wandlung letzter Kanal, 1 ms Settling Time!
  SCLK:=high;
  if ADC16present then
    STRAD16:=low;
    AD16long:= 0;
    STRAD16:=high;
    asm; // erste Wandlung verwerfen, nicht auslesen
      ldi  _ACCB, 15
      ADAC.ADCsampleLoop1:
      dec _ACCB
      BRNE  ADAC.ADCsampleLoop1
    endasm;
    for k:=0 to 3 do
      ShiftIn1864;
      AD16long:=AD16long+longint(ADraw-$8000);
    endfor;
  endif;
  k:=MuxCh;
  
//Multiplexer abschalten, Multiplexer-Kanal hochzählen
  STRDAMUX:=low;
  inc(MuxCh);
  if MuxCh>=8 then
    MuxCh:=0;
  endif;
//Multiplexer-Kanal einstellen
  PortC:=(MuxCh shl 2) or %11000011;

  DACtemp:= DACrawArray[MuxCh];
  if DAC16present then
//Level-Bytes an LTC1655
    ShiftOut1655;
  endif;
  if DAC714present then
//Level-Bytes an DAC714
    ShiftOut714;
  endif;
  if DAC12present then
//Level-Bytes an LTC1257
    ShiftOut1257;
  endif;

  asm; // Settle Time
    ldi  _ACCB, 4
    ADAC.DACsettleLoop1:
    dec _ACCB
    BRNE  ADAC.DACsettleLoop1
  endasm;
// wg. DAC-Settle-Time erst hier
  AD16long:=AD16long shr 2;
  if integrateAD16 then
    AD16long:=longint(ADCrawArray[k]) + AD16long;
    ADCrawArray[k]:=integer(AD16long shr 1); // integrieren
  else
    ADCrawArray[k]:=integer(AD16long); // direkt
  endif;
  STRDAMUX:=high;

  asm;  //  auf AD-Wandlung AD10 warten, falls Systick "überfahren" wurde
    ADC10endLoop1:
    in _ACCB, ADCSRA
    sbrc _ACCB,6 // auf Bit 6 low warten
    rjmp ADC10endLoop1
  endasm;

end;




