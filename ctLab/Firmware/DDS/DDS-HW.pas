{###########################################################################}

procedure SerAux(mybyte:byte);
//Sende Byte in "mychar" mit 19200 Bd an PB5 für MP3-Player
begin
  _ACCDHI:=mybyte;
  asm;
    ldi  _ACCDLO, 8
    cbi  DDS.ExtensionPort, DDS.b_SerAux ; Startbit
    ldi       _ACCA, 5
    call      SYSTEM.UDELAY
  DDS.SerAuxloop1:    ; Byte rausschieben
    lsr  _ACCDHI          ; Bit 0 zuerst
    brcs DDS.SerAuxdatahigh
    cbi  DDS.ExtensionPort, DDS.b_SerAux
    rjmp DDS.SerAuxdataset
  DDS.SerAuxdatahigh:
    sbi  DDS.ExtensionPort, DDS.b_SerAux
  DDS.SerAuxdataset:
    ldi       _ACCA, 5
    call      SYSTEM.UDELAY
    dec _ACCDLO
    brne DDS.SerAuxloop1
    sbi  DDS.ExtensionPort, DDS.b_SerAux
    ldi       _ACCA, 10
    call      SYSTEM.UDELAY
  endasm;
end;

procedure ShiftOut1257(myVal:Integer);
//Sendet LevelByteHi und LevelByteLo an LTC1257
begin
  if myVal>$7FF then
    myVal:=$7FF;
  endif;
  if myVal<-$7FF then
    myVal:=-$7FF;
  endif;
// negativer Offset, weil auf "Minuspol". Positiv wäre: myVal:=$800-myVal; // 0V = FS/2
  DACtemp:=myVal+$800; // Korrektur Midscale
   asm;
    cbi  DDS.ControlBitPort, DDS.b_SDATAOUT
    cbi  DDS.ControlBitPort, DDS.b_SCLK
    sbi  DDS.ControlBitPort, DDS.b_STRDAC

    LDS _ACCA, DDS.DACtemp+1 ; MSB linksbündig
    LSL  _ACCA
    LSL  _ACCA
    LSL  _ACCA
    LSL  _ACCA ; Bit 3 sitzt jetzt oben
    ldi  _ACCB, 4

    DDS.1257loop1:
    sbrc _ACCA,7 // Bit high?
    sbi  DDS.ControlBitPort, DDS.b_SDATAOUT
    sbi  DDS.ControlBitPort, DDS.b_SCLK
    LSL  _ACCA
    nop
    cbi  DDS.ControlBitPort, DDS.b_SDATAOUT
    cbi  DDS.ControlBitPort, DDS.b_SCLK
    dec _ACCB
    BRNE  DDS.1257loop1

    LDS _ACCA, DDS.DACtemp         ; LSB Level zuletzt
    ldi  _ACCB, 7 ; 7 Bits ohne Load

    DDS.1257loop2:
    sbrc _ACCA,7 // Bit high?
    sbi  DDS.ControlBitPort, DDS.b_SDATAOUT
    sbi  DDS.ControlBitPort, DDS.b_SCLK
    LSL  _ACCA
    nop
    cbi  DDS.ControlBitPort, DDS.b_SDATAOUT
    cbi  DDS.ControlBitPort, DDS.b_SCLK
    dec _ACCB
    BRNE  DDS.1257loop2

    LSL  _ACCA ; LSB mit Load-impuls
    sbrc _ACCA,7 // Bit high?
    sbi  DDS.ControlBitPort, DDS.b_SDATAOUT
    sbi  DDS.ControlBitPort, DDS.b_SCLK
    cbi  DDS.ControlBitPort, DDS.b_STRDAC
    nop
    cbi  DDS.ControlBitPort, DDS.b_SDATAOUT
    cbi  DDS.ControlBitPort, DDS.b_SCLK
    sbi  DDS.ControlBitPort, DDS.b_STRDAC
  endasm;
end;

procedure ShiftOutLevelSR(myLevelSR:Integer);
//Sende SwitchState und Level-Bytes an 4094-SR

begin
  LevelByteHi:=hi(myLevelSR);
  LevelByteLo:=lo(myLevelSR);
{$IFDEF Platine2SR}
  LevelByteHi := LevelByteHi OR SwitchState;
{$ENDIF}
  asm;
    cbi  DDS.DDSOutPort, DDS.b_SCLK
    cbi  DDS.DDSOutPort, DDS.b_SDATAOUT
    LDS _ACCA, DDS.SwitchState;
    ldi  _ACCB, 8

    DDS.srloop1:
    sbrc _ACCA,7 // Bit high?
    sbi  DDS.DDSOutPort, DDS.b_SDATAOUT
    sbi  DDS.DDSOutPort, DDS.b_SCLK
    LSL  _ACCA
    cbi  DDS.DDSOutPort, DDS.b_SDATAOUT
    cbi  DDS.DDSOutPort, DDS.b_SCLK
    dec _ACCB
    BRNE  DDS.srloop1

    LDS _ACCA, DDS.LevelByteHi;
    ldi  _ACCB, 8

    DDS.srloop2:
    sbrc _ACCA,7 // Bit high?
    sbi  DDS.DDSOutPort, DDS.b_SDATAOUT
    sbi  DDS.DDSOutPort, DDS.b_SCLK
    LSL  _ACCA
    cbi  DDS.DDSOutPort, DDS.b_SDATAOUT
    cbi  DDS.DDSOutPort, DDS.b_SCLK
    dec _ACCB
    BRNE  DDS.srloop2

    LDS _ACCA, DDS.LevelByteLo         ; LSB Level zuletzt
    ldi  _ACCB, 8

    DDS.srloop3:
    sbrc _ACCA,7 // Bit high?
    sbi  DDS.DDSOutPort, DDS.b_SDATAOUT
    sbi  DDS.DDSOutPort, DDS.b_SCLK
    LSL  _ACCA
    cbi  DDS.DDSOutPort, DDS.b_SDATAOUT
    cbi  DDS.DDSOutPort, DDS.b_SCLK
    dec _ACCB
    BRNE  DDS.srloop3

    sbi  DDS.DDSOutPort, DDS.b_STROBE
    nop
    nop
    cbi  DDS.DDSOutPort, DDS.b_STROBE
    sbi  DDS.DDSOutPort, DDS.b_SCLK
  endasm;
end;

{AD9833 DDS functions }
procedure SendDDS;  //Sende ein Wort an den DDS-Chip

begin
  asm;
    sbi  DDS.DDSOutPort, DDS.b_SCLK
    cbi  DDS.ControlBitPort, DDS.b_SDATAOUT
    lds  _ACCA, DDS.dss_cmd+1
    cbi  DDS.DDSOutPort, DDS.b_FSYNC

    ldi  _ACCB, 8

    DDS.ddsloop1:    ; höherwertiges Byte rausschieben
    sbrc _ACCA,7 // Bit high?
    sbi  DDS.ControlBitPort, DDS.b_SDATAOUT
    cbi  DDS.ControlBitPort, DDS.b_SCLK
    lsl  _ACCA
    cbi  DDS.ControlBitPort, DDS.b_SDATAOUT
    sbi  DDS.ControlBitPort, DDS.b_SCLK
    dec _ACCB
    brne  DDS.ddsloop1

    lds  _ACCA, DDS.dss_cmd
    ldi  _ACCB, 8

    DDS.dssloop2:    ; niederwertiges Byte rausschieben
    sbrc _ACCA,7 // Bit high?
    sbi  DDS.ControlBitPort, DDS.b_SDATAOUT
    cbi  DDS.ControlBitPort, DDS.b_SCLK
    lsl  _ACCA
    cbi  DDS.ControlBitPort, DDS.b_SDATAOUT
    sbi  DDS.ControlBitPort, DDS.b_SCLK
    dec _ACCB
    brne  DDS.dssloop2

    sbi  DDS.DDSOutPort, DDS.b_FSYNC
  endasm;
end;

{###########################################################################}

//DDS-Funktionen

{$IFDEF SQG}

procedure SetLevelDDS;
//Pegelsteller und Relais setzen, Frequenz einstellen; Float-Berechnung für SQG
var
  acc : LongInt;
  accF,addF:Float;
  freqHi, freqLo : word;
  myLevel: Integer;
  AttnSwLevel:Integer;
  myOffset:Integer;

begin
  SwitchState:=0;

//Abschwächer für AC setzen
  if DACLevel < AttnSwitchPoint then  // unter 100 DA-Counts wieder full Scale, 4095 Digits
    b_AttnSw:= high;  //Relais für Abschwächer auf 1/40
  else
    b_AttnSw:= low;
  endif;

//Relais setzen
  case Wave of
    c_sinw :
      wave_cmd:= c_ddssinecmd;
      |
    c_triw :
      wave_cmd:= c_ddstrianglecmd;
      |
    c_squw,c_logic :
      wave_cmd:= c_ddssquarecmd;
      |
  else
    wave_cmd:= c_ddsresetcmd; // Aus für  c_off und Audio
  endcase;

  ShiftOutLevelSR(myLevel); //Pegel und Relais endgültig setzen

//DSS-Frequenz einstellen
  addF:=0;
  FreqStr:= longtostr(Frequenz : 9:'0'); // mit führenden Nullen, bis 10 MHz
  for i := 0 to 8 do                //Einzelne Stellen aufaddieren
    k:= byte(FreqStr[i+1])-48;
    accF:= fhz[i];
    addF:= addF + (accF*float(k));
  endfor;
  DDSfrequ:=LongInt(addF);
  disableints;
  dss_cmd:= loword(DDSfrequ) AND %0011111111111111;
  dss_cmd:= dss_cmd OR %0100000000000000;
  SendDDS;
  DDSfrequ:= DDSfrequ shl 2;
  dss_cmd:= hiword(DDSfrequ) AND %0011111111111111;
  dss_cmd:= dss_cmd OR %0100000000000000;
  SendDDS;
  dss_cmd:= wave_cmd;
  SendDDS;
  enableints;
end;

{$ELSE}

procedure SetLevelDDS;
//Pegelsteller und Relais setzen, Frequenz einstellen; Integer-Berechnung
var
  acc : LongInt;
  freqHi, freqLo : word;
  myLevel: Integer;
  AttnSwLevel:Integer;
  myOffset:Integer;

begin
  SwitchState:=0;
  LevelByteHi:=0; //Null-Pegel wg. Schaltknacks
  LevelByteLo:=0;
  myOffset:=Offset;

//Abschalt-Relais für DC setzen, Offset einstellen
  if myOffset = 0 then  //
    b_OffsSw:= high;    //Relais für Abschwächer auf 1/10
    LEDswitch:=high; // LED aus
  else
    LEDswitch:=low; // LED an
  endif;

//Abschwächer für AC setzen
  if DACLevel < AttnSwitchPoint then  // unter 100 DA-Counts wieder full Scale, 4095 Digits
    myLevel:=round(DACLevel*AttnFac*LevelScaleLow);
    b_AttnSw:= high;  //Relais für Abschwächer auf 1/40
    if LevelRange then
      dss_cmd:= c_ddsresetcmd;
      disableints;
      SendDDS;   // kurz abschalten
      enableints;
      ShiftOutLevelSR(0);    // Relais schalten und kurz warten
      mdelay(5);
      LevelRange:=low;
    endif;
  else
    b_AttnSw:= low;
    myLevel:=round(DACLevel*LevelScaleHi);  // Runden auf Ganzzahl
    LevelRange:=high;
  endif;

//Relais setzen
  case Wave of
    c_sinw :
      wave_cmd:= c_ddssinecmd;
      |
    c_triw :
      wave_cmd:= c_ddstrianglecmd;
      |
    c_squw,c_logic :
      wave_cmd:= c_ddssquarecmd;
      b_SquareSw:= high;
      if wave= c_logic then
{$IFDEF Platine2SR}
        myOffset:=round(DACLevel*PwrGain*1.41421);
        b_OffsSw:= low;
{$ELSE}
        b_LogicSw:= high;
{$ENDIF}
      endif;
      |
    c_ext0..255 :
      wave_cmd:= c_ddsresetcmd; // Aus für  c_off und Audio
      b_ExtOn:=high;
      |
  else
    wave_cmd:= c_ddsresetcmd; // Aus für  c_off und Audio
  endcase;

  ShiftOut1257(myOffset div 5); // FS =10V = 2000 counts

  ShiftOutLevelSR(myLevel); //Pegel und Relais endgültig setzen

//DSS-Frequenz einstellen
  DDSfrequ:= 0;
  FreqStr:= longtostr(Frequenz : 8:'0'); // mit führenden Nullen
  for i := 0 to 7 do                //Einzelne Stellen aufaddieren
    k:= byte(FreqStr[i+1])-48;
    acc:= gettable(fhz, i);
    DDSfrequ:= DDSfrequ + (acc*longint(k));
  endfor;
  disableints;
  dss_cmd:= loword(DDSfrequ) AND %0011111111111111;
  dss_cmd:= dss_cmd OR %0100000000000000;
  SendDDS;
  DDSfrequ:= DDSfrequ shl 2;
  dss_cmd:= hiword(DDSfrequ) AND %0011111111111111;
  dss_cmd:= dss_cmd OR %0100000000000000;
  SendDDS;
  dss_cmd:= wave_cmd;
  SendDDS;
  enableints;
end;
{$ENDIF}



