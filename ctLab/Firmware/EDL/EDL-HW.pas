{###########################################################################}

procedure ShiftOut8501;
//Sendet DACtemp an LTC1655, etwas andere Sequenz als 5452
begin
   asm;
    sbi  EDL.ControlBitPort, EDL.b_SCLK
    cbi  EDL.ControlBitPort, EDL.b_SDATAOUT
    cbi  EDL.ControlBitPort, EDL.b_STRDAC

    ldi  _ACCB, 8
    EDL.8501loop0:  ; acht Nullen rausschieben, für PowerDown OFF
    cbi  EDL.ControlBitPort, EDL.b_SCLK
    nop
    sbi  EDL.ControlBitPort, EDL.b_SCLK
    dec  _ACCB
    BRNE EDL.8501loop0

    LDS  _ACCA, EDL.DACtemp+1 ; MSB linksbündig
    ldi  _ACCB, 8 ; 8 Bits ohne Load

    EDL.8501loop1:
    sbrc _ACCA,7 // Bit high?
    sbi  EDL.ControlBitPort, EDL.b_SDATAOUT
    cbi  EDL.ControlBitPort, EDL.b_SCLK
    LSL  _ACCA
    cbi  EDL.ControlBitPort, EDL.b_SDATAOUT
    sbi  EDL.ControlBitPort, EDL.b_SCLK
    dec _ACCB
    BRNE EDL.8501loop1

    LDS _ACCA, EDL.DACtemp         ; LSB Level zuletzt
    ldi  _ACCB, 8 ; 8 Bits ohne Load

    EDL.8501loop2:
    sbrc _ACCA,7 // Bit high?
    sbi  EDL.ControlBitPort, EDL.b_SDATAOUT
    cbi  EDL.ControlBitPort, EDL.b_SCLK
    LSL  _ACCA
    cbi  EDL.ControlBitPort, EDL.b_SDATAOUT
    sbi  EDL.ControlBitPort, EDL.b_SCLK
    dec  _ACCB
    BRNE EDL.8501loop2
    cbi  EDL.ControlBitPort, EDL.b_SCLK
    sbi  EDL.ControlBitPort, EDL.b_STRDAC
  endasm;
end;

procedure ShiftOut5452;
//Sendet DACtemp an AD5452, Data auf beiden Flanken
begin
   asm;
    cbi  EDL.ControlBitPort, EDL.b_SDATAOUT
    cbi  EDL.ControlBitPort, EDL.b_SCLK
    cbi  EDL.ControlBitPort, EDL.b_STRDAC

    LDS _ACCA, EDL.DACtemp+1 ; MSB linksbündig
    sbi  EDL.ControlBitPort, EDL.b_SCLK ; 2 Control-Bits auf 0, Default falling edge
    cbi  EDL.ControlBitPort, EDL.b_SCLK
    sbi  EDL.ControlBitPort, EDL.b_SCLK ; 2 Control-Bits auf 0, Default falling edge
    cbi  EDL.ControlBitPort, EDL.b_SCLK
    ldi  _ACCB, 4

    EDL.5452loop1:
    sbrc _ACCA,3 // Bit high?
    sbi  EDL.ControlBitPort, EDL.b_SDATAOUT
    sbrs _ACCA,3 // Bit low?
    cbi  EDL.ControlBitPort, EDL.b_SDATAOUT
    sbi  EDL.ControlBitPort, EDL.b_SCLK
    LSL  _ACCA
    cbi  EDL.ControlBitPort, EDL.b_SCLK
    dec _ACCB
    BRNE  EDL.5452loop1

    LDS _ACCA, EDL.DACtemp         ; LSB Level zuletzt
    ldi  _ACCB, 8 ; 8 Bits

    EDL.5452loop2:
    sbrc _ACCA,7 // Bit high?
    sbi  EDL.ControlBitPort, EDL.b_SDATAOUT
    sbrs _ACCA,7 // Bit low?
    cbi  EDL.ControlBitPort, EDL.b_SDATAOUT
    sbi  EDL.ControlBitPort, EDL.b_SCLK
    LSL  _ACCA
    cbi  EDL.ControlBitPort, EDL.b_SCLK
    dec _ACCB
    BRNE  EDL.5452loop2
    sbi  EDL.ControlBitPort, EDL.b_SCLK ; noch zwei Füll-Bits (ignored)
    cbi  EDL.ControlBitPort, EDL.b_SCLK
    sbi  EDL.ControlBitPort, EDL.b_SCLK
    cbi  EDL.ControlBitPort, EDL.b_SCLK
    sbi  EDL.ControlBitPort, EDL.b_STRDAC
  endasm;
end;

procedure ShiftOut8043;
//Sendet DACtemp an LTC8043 oder MAX543, Data auf beiden Flanken
//mit Load auf letztem Impuls wie LTC1257

begin
   asm;
    cbi  EDL.ControlBitPort, EDL.b_SDATAOUT
    cbi  EDL.ControlBitPort, EDL.b_SCLK

    LDS _ACCA, EDL.DACtemp+1 ; MSB linksbündig
    ldi  _ACCB, 4

    EDL.8043loop1:
    sbrc _ACCA,3 // Bit high?
    sbi  EDL.ControlBitPort, EDL.b_SDATAOUT
    sbrs _ACCA,3 // Bit low?
    cbi  EDL.ControlBitPort, EDL.b_SDATAOUT
    sbi  EDL.ControlBitPort, EDL.b_SCLK
    LSL  _ACCA
    cbi  EDL.ControlBitPort, EDL.b_SCLK
    dec _ACCB
    BRNE  EDL.8043loop1

    LDS _ACCA, EDL.DACtemp         ; LSB Level zuletzt
    ldi  _ACCB, 7 ; 7 Bits

    EDL.8043loop2:
    sbrc _ACCA,7 // Bit high?
    sbi  EDL.ControlBitPort, EDL.b_SDATAOUT
    sbrs _ACCA,7 // Bit low?
    cbi  EDL.ControlBitPort, EDL.b_SDATAOUT
    sbi  EDL.ControlBitPort, EDL.b_SCLK
    LSL  _ACCA
    cbi  EDL.ControlBitPort, EDL.b_SCLK
    dec _ACCB
    BRNE  EDL.8043loop2
    sbrc _ACCA,7 // Bit high?
    sbi  EDL.ControlBitPort, EDL.b_SDATAOUT
    sbrs _ACCA,7 // Bit low?
    cbi  EDL.ControlBitPort, EDL.b_SDATAOUT
    sbi  EDL.ControlBitPort, EDL.b_SCLK
    cbi  EDL.ControlBitPort, EDL.b_STRDAC ; Load-Impuls
    cbi  EDL.ControlBitPort, EDL.b_SCLK
    sbi  EDL.ControlBitPort, EDL.b_STRDAC
  endasm;
end;


procedure ShiftOut8811;
//Sendet DACtemp an DAC8811, Data auf beiden Flanken

begin
   asm;
    cbi  EDL.ControlBitPort, EDL.b_SDATAOUT
    cbi  EDL.ControlBitPort, EDL.b_SCLK
    cbi  EDL.ControlBitPort, EDL.b_STRDAC ; Load-Impuls

    LDS _ACCA, EDL.DACtemp+1 ; MSB linksbündig
    ldi  _ACCB, 8

    EDL.8811loop1:
    sbrc _ACCA,7 // Bit high?
    sbi  EDL.ControlBitPort, EDL.b_SDATAOUT
    sbrs _ACCA,7 // Bit low?
    cbi  EDL.ControlBitPort, EDL.b_SDATAOUT
    sbi  EDL.ControlBitPort, EDL.b_SCLK
    LSL  _ACCA
    cbi  EDL.ControlBitPort, EDL.b_SCLK
    dec _ACCB
    BRNE  EDL.8811loop1

    LDS _ACCA, EDL.DACtemp         ; LSB Level zuletzt
    ldi  _ACCB, 8 ; 8 Bits

    EDL.8811loop2:
    sbrc _ACCA,7 // Bit high?
    sbi  EDL.ControlBitPort, EDL.b_SDATAOUT
    sbrs _ACCA,7 // Bit low?
    cbi  EDL.ControlBitPort, EDL.b_SDATAOUT
    sbi  EDL.ControlBitPort, EDL.b_SCLK
    LSL  _ACCA
    cbi  EDL.ControlBitPort, EDL.b_SCLK
    dec _ACCB
    BRNE  EDL.8811loop2
    cbi  EDL.ControlBitPort, EDL.b_SCLK
    sbi  EDL.ControlBitPort, EDL.b_STRDAC
  endasm;
end;


procedure ShiftOutSR;
//Sende SwitchState und Level-Bytes an 4094-SR 12 Bit, MSB oben

begin
  asm;
    cbi  EDL.ControlBitPort, EDL.b_SCLK
    cbi  EDL.ControlBitPort, EDL.b_SDATAOUT
    LDS  _ACCA, EDL.DACtemp+1 ; MSB linksbündig
    ldi  _ACCB, 8

    EDL.srloop1:
    sbrc _ACCA,7 // Bit high?
    sbi  EDL.ControlBitPort, EDL.b_SDATAOUT
    sbi  EDL.ControlBitPort, EDL.b_SCLK
    LSL  _ACCA
    cbi  EDL.ControlBitPort, EDL.b_SDATAOUT
    cbi  EDL.ControlBitPort, EDL.b_SCLK
    dec _ACCB
    BRNE  EDL.srloop1

    LDS _ACCA, EDL.DACtemp         ; LSB Level zuletzt
    ldi  _ACCB, 8

    EDL.srloop2:
    sbrc _ACCA,7 // Bit high?
    sbi  EDL.ControlBitPort, EDL.b_SDATAOUT
    sbi  EDL.ControlBitPort, EDL.b_SCLK
    LSL  _ACCA
    cbi  EDL.ControlBitPort, EDL.b_SDATAOUT
    cbi  EDL.ControlBitPort, EDL.b_SCLK
    dec _ACCB
    BRNE  EDL.srloop2

    sbi  EDL.ControlBitPort, EDL.b_STRDAC
    nop
    nop
    cbi  EDL.ControlBitPort, EDL.b_STRDAC
    sbi  EDL.ControlBitPort, EDL.b_SCLK
  endasm;
end;

{###########################################################################}

procedure ShiftIn1864;
//holt ADCtemp aus LTC1864, Interrupt während dieser Zeit gesperrt
begin
   asm;
    cbi  EDL.ControlBitPort, EDL.b_SCLK
    cbi  EDL.ControlBitPort, EDL.b_STRAD16
    ldi  _ACCB, 8 ; 8 Bits
    nop
    nop
    nop
EDL.1864loop1:
    clc
    sbi  EDL.ControlBitPort, EDL.b_SCLK
    sbic EDL.ControlBitPin, EDL.b_SDATAIN1 // Bit gesetzt?
    sec
    cbi  EDL.ControlBitPort, EDL.b_SCLK
    rol _ACCA  // Carry-Bit einschieben
    dec _ACCB
    BRNE  EDL.1864loop1
    sts EDL.AD16temp+1,_ACCA; Hi Byte vom Integer
    ldi  _ACCB, 8 ; 8 Bits
EDL.1864loop2:
    clc
    sbi  EDL.ControlBitPort, EDL.b_SCLK
    sbic EDL.ControlBitPin, EDL.b_SDATAIN1 // Bit gesetzt?
    sec
    cbi  EDL.ControlBitPort, EDL.b_SCLK
    rol _ACCA
    dec _ACCB
    BRNE  EDL.1864loop2
    sts EDL.AD16temp,_ACCA; Low Byte vom Integer
    sbi  EDL.ControlBitPort, EDL.b_STRAD16  // nächste ADC-Wandlung freigeben
    cbi  EDL.ControlBitPort, EDL.b_SCLK
  endasm;
end;


procedure OnSysTick(saveallregs);
// AD16 lesen und verteilen. Ergebnis in AD16temp
begin
  ShiftIn1864;    // Ergebnis der Wandlung n-2 steht in AD16temp, n-1 sampeln
  dec(PWcounter);
  if PWoffTime=0 then
    PWonOff:=true;
  endif;
  if (not TRGIN) and TrigInEnable then  // ext. Triggerung
    PWonOff:=false;
  endif;
  If PWonOff then // On-Werte
    TRGOUT:=high;
    if OverloadFlag then
      DACtemp:=0;
    else
      DACtemp:=DACtempOn;
    endif;
    case DACtype of
      LTC8043:
        ShiftOut8043;   // DAC-Wert in DACtemp
        |

      AD5452:
        ShiftOut5452;   // DAC-Wert in DACtemp
        |
      DAC8501:
        ShiftOut8501;   // DAC-Wert in DACtemp
        |
      DAC8811:
        ShiftOut8811;   // DAC-Wert in DACtemp
        |
    endcase;
    if PWcounter<=0 then
      AD16select:=not AD16select; // Toggle ADC Select
      AD16MPX:= AD16select; // MPX für nächste Wandlung vorbereiten
      PWonOff:=false;
      PWcounter:=PWoffTime;
    endif;
    if AD16select then
      NextMeas :=Ion;
    else
      NextMeas :=Uon;
    endif;
  else
    TRGOUT:=low;
    if OverloadFlag then
      DACtemp:=0;
    else
      DACtemp:=DACtempOff;
    endif;
    case DACtype of
      LTC8043:
        ShiftOut8043;   // DAC-Wert in DACtemp
        |

      AD5452:
        ShiftOut5452;   // DAC-Wert in DACtemp
        |
      DAC8501:
        ShiftOut8501;   // DAC-Wert in DACtemp
        |
      DAC8811:
        ShiftOut8811;   // DAC-Wert in DACtemp
        |
    endcase;
    if PWcounter<=0 then
      AD16select:=not AD16select; // Toggle ADC Select
      AD16MPX:= AD16select; // MPX für nächste Wandlung vorbereiten
      PWonOff:=true;
      PWcounter:=PWonTime;
    endif;
    if AD16select then
      NextMeas :=Ioff;
    else
      NextMeas :=Uoff;
    endif;
  endif;
  // Wandlung NextMeas
  case LastMeas of
  Ioff:
    AD16tempIoff:=(AD16tempIoff shr 1) + (AD16temp shr 1);
    |
  Uoff:
    AD16tempUoff:=(AD16tempUoff shr 1) + (AD16temp shr 1);
    |
  Ion:
    AD16tempIon:=(AD16tempIon shr 1) + (AD16temp shr 1);
    |
  Uon:
    AD16tempUon:=(AD16tempUon shr 1) + (AD16temp shr 1);
    |
  endcase;
  LastMeas:=ThisMeas;
  ThisMeas:=NextMeas;
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
    out ADCSRA, _ACCB    // fürATMega32
// mcb für ATMega644    sts ADCSRA, _ACCB
    ADC10endLoop1:
    in _ACCB, ADCSRA    // für ATMega32
// mcb für ATMega644    lds _ACCB, ADCSRA
    sbrc _ACCB,6 // auf Bit 6 low warten
    rjmp ADC10endLoop1
  endasm;
  CurrentADC10lo:=ADCL;
  CurrentADC10Hi:=ADCH;
  return(CurrentADC10);
end;


