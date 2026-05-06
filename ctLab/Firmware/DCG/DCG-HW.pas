{###########################################################################}

procedure ShiftOut1257;
//Sendet DACtemp an LTC1257
begin
   asm;
    cbi  DCG.ControlBitPort, DCG.b_SDATAOUT
    cbi  DCG.ControlBitPort, DCG.b_SCLK
    sbi  DCG.ControlBitPort, DCG.b_STRDAC

    LDS _ACCA, DCG.DACtemp+1 ; MSB linksbündig
    LSL  _ACCA
    LSL  _ACCA
    LSL  _ACCA
    LSL  _ACCA ; Bit 3 sitzt jetzt oben
    ldi  _ACCB, 4

    DCG.1257loop1:
    sbrc _ACCA,7 // Bit high?
    sbi  DCG.ControlBitPort, DCG.b_SDATAOUT
    sbi  DCG.ControlBitPort, DCG.b_SCLK
    LSL  _ACCA
    nop
    cbi  DCG.ControlBitPort, DCG.b_SDATAOUT
    cbi  DCG.ControlBitPort, DCG.b_SCLK
    dec _ACCB
    BRNE  DCG.1257loop1

    LDS _ACCA, DCG.DACtemp         ; LSB Level zuletzt
    ldi  _ACCB, 7 ; 7 Bits ohne Load

    DCG.1257loop2:
    sbrc _ACCA,7 // Bit high?
    sbi  DCG.ControlBitPort, DCG.b_SDATAOUT
    sbi  DCG.ControlBitPort, DCG.b_SCLK
    LSL  _ACCA
    nop
    cbi  DCG.ControlBitPort, DCG.b_SDATAOUT
    cbi  DCG.ControlBitPort, DCG.b_SCLK
    dec _ACCB
    BRNE  DCG.1257loop2

    LSL  _ACCA ; LSB mit Load-impuls
    sbrc _ACCA,7 // Bit high?
    sbi  DCG.ControlBitPort, DCG.b_SDATAOUT
    sbi  DCG.ControlBitPort, DCG.b_SCLK
    cbi  DCG.ControlBitPort, DCG.b_STRDAC
    nop
    cbi  DCG.ControlBitPort, DCG.b_SDATAOUT
    cbi  DCG.ControlBitPort, DCG.b_SCLK
    sbi  DCG.ControlBitPort, DCG.b_STRDAC
  endasm;
end;

procedure ShiftOut1655;
//Sendet DACtemp an LTC1655, etwas andere Sequenz als 1257
begin
   asm;
    cbi  DCG.ControlBitPort, DCG.b_SCLK
    cbi  DCG.ControlBitPort, DCG.b_SDATAOUT
    cbi  DCG.ControlBitPort, DCG.b_STRDAC

    LDS _ACCA, DCG.DACtemp+1 ; MSB linksbündig
    ldi  _ACCB, 8 ; 8 Bits ohne Load

    DCG.1655loop1:
    sbrc _ACCA,7 // Bit high?
    sbi  DCG.ControlBitPort, DCG.b_SDATAOUT
    sbi  DCG.ControlBitPort, DCG.b_SCLK
    LSL  _ACCA
    cbi  DCG.ControlBitPort, DCG.b_SDATAOUT
    cbi  DCG.ControlBitPort, DCG.b_SCLK
    dec _ACCB
    BRNE  DCG.1655loop1

    LDS _ACCA, DCG.DACtemp         ; LSB Level zuletzt
    ldi  _ACCB, 8 ; 8 Bits ohne Load

    DCG.1655loop2:
    sbrc _ACCA,7 // Bit high?
    sbi  DCG.ControlBitPort, DCG.b_SDATAOUT
    sbi  DCG.ControlBitPort, DCG.b_SCLK
    LSL  _ACCA
    cbi  DCG.ControlBitPort, DCG.b_SDATAOUT
    cbi  DCG.ControlBitPort, DCG.b_SCLK
    dec _ACCB
    BRNE  DCG.1655loop2
    sbi  DCG.ControlBitPort, DCG.b_STRDAC
  endasm;
end;


procedure ShiftIn1864;
//holt ADCtemp aus LTC1864, Interrupt während dieser Zeit gesperrt
begin
   asm;
    cbi  DCG.ControlBitPort, DCG.b_STRAD16
    cbi  DCG.ControlBitPort, DCG.b_SCLK
    ldi  _ACCB, 8 ; 8 Bits
    nop
    nop
    nop
DCG.1864loop1:
    clc
    sbi  DCG.ControlBitPort, DCG.b_SCLK
    sbic DCG.ControlBitPin, DCG.b_SDATAIN1 // Bit gesetzt?
    sec
    cbi  DCG.ControlBitPort, DCG.b_SCLK
    rol _ACCA  // Carry-Bit einschieben
    dec _ACCB
    BRNE  DCG.1864loop1
    sts DCG.ADCtemp+1,_ACCA; Hi Byte vom Integer
    ldi  _ACCB, 8 ; 8 Bits
DCG.1864loop2:
    clc
    sbi  DCG.ControlBitPort, DCG.b_SCLK
    sbic DCG.ControlBitPin, DCG.b_SDATAIN1 // Bit gesetzt?
    sec
    cbi  DCG.ControlBitPort, DCG.b_SCLK
    rol _ACCA
    dec _ACCB
    BRNE  DCG.1864loop2
    sts DCG.ADCtemp,_ACCA; Low Byte vom Integer
    sbi  DCG.ControlBitPort, DCG.b_SCLK
    nop
    sbi  DCG.ControlBitPort, DCG.b_STRAD16
  endasm;
end;

procedure OnSysTick(saveallregs);
// Interrupt-Routine, alle 1 ms, dauert etwa 45 µs bei AD16+DA16
begin
  MPXI:=high; // abschalten (1= off)
  MPXU:=low;  // abschalten (0= off)
  if ADC16present then
    ShiftIn1864;
  endif;
  if UIToggle then
    if PWonOff then
      if PWcounter=0 then
        PWcounter:=PWoffTime;
        PWonOff:=false;
        DACtemp:=DACrawUoff;   //TEST
      else
        DACtemp:=DACrawUon;
      endif;
    else
      if PWcounter=0 then
        PWcounter:=PWonTime;
        PWonOff:=true;
        DACtemp:=DACrawUon;
      else
        DACtemp:=DACrawUoff;   //TEST
      endif;
    endif;
  else
    DACtemp:=DACrawI;
  endif;
  dectolim(PWcounter,0);
  if DAC16present then
    Shiftout1655;
  else
    Shiftout1257;
  endif;
  asm;
    ldi  _ACCB, 40
    DAC16settleLoop1:  // 10 µs warten
    dec _ACCB
    BRNE DAC16settleLoop1
  endasm;
  if UIToggle then  // Settle-Time ausnutzen
    ADCrawU:=(ADCrawU shr 1) + (word(ADCtemp) shr 1); // Dither-Integration
    MPX1864:=high;  // Multiplexer auf U Spannung
    MPXU:=high; // DAC-Mux U einschalten (1= ein)
  else
    ADCrawI:=(ADCrawI shr 1) + (word(ADCtemp) shr 1); // Dither-Integration
    MPX1864:=low;   // Multiplexer auf I Strom
    MPXI:=low; // DAC-Mux I einschalten (0= ein)
  endif;
  UIToggle:=not UIToggle;
end;



function GetADC10(myChannel:byte):word;
//Zu-Fuss-Implementation der getadc()-Funktion
var
  CurrentADC10:word;
  CurrentADC10lo[@CurrentADC10]:byte;
  CurrentADC10hi[@CurrentADC10+1]:byte;
begin
  ADMUX:=((myChannel-1) and $07);
  asm;
    ldi  _ACCB, 15
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


