
{
normale Syntax: (alle auch mit <*> statt <MainCh> als Omni-Befehl)
<MainCh> <:> CMD <SPACE> <SubCh> <=> <Wert> <CRLF>
CMD <SPACE> <SubCh> <?> <CRLF>
Ein-Paramater-Befehle:
CMD <SPACE> <SubCh> <CRLF>
Null-Paramater-Befehle:
CMD <?> <CRLF>

Kurzform: VAL <SPACE> und <MainCh> <:> können weggelassen werden,
es wird dann der zuletzt angesprochene Kanal verwendet
Beispiel:
0:VAL 5?
0:5?
5?
0:VAL 2=1.00
0:2=1.00
2=1.00
}

// gerätespezifischer Parser-Teil

procedure ParseGetParam;
begin
  digits:=1;
  nachkomma:=4;
  case SubCh of
    0:
      if OutputEnable then
        Param:=1;
      else
        Param:=0;
      endif;
      WriteParamSer;
      |
    1:
      Param:=DCAmp;    // eingestellter Strom, Sollwert
      nachkomma:=7-byte(ShuntSelect);
      WriteParamSer;
      |
    2:
      Param:=DCAmp;      // in mA
      Parammul1000;
      nachkomma:=2;
      WriteParamSer;
      |
// mcb-->
    3:
      Param:=DCWatt;      // in Watt
      nachkomma:=2;
      WriteParamSer;
      |
    4:
      Param:=DCVolt;      // in Volt
      nachkomma:=2;
      WriteParamSer;
      |
// <-- mcb
    5:
      Param:=DCohm;    // eingestellter Widerstand, Sollwert
      nachkomma:=1+byte(ShuntSelect);
      WriteParamSer;
      |

// mcb -->
    7: //Istwert Kapazität in Ah
      Param := Ah;
      WriteParamSer;
      |
    8: //Istwert Kapazität in Wh
      Param := Wh;
      WriteParamSer;
      |
// <-- mcb
    9:
      ParamInt:=Integer(ShuntSelect);
      WriteParamIntSer;
      |
    10: //Istwert Klemmenspannung  On-Zeit
      GetVoltage(true);
      WriteParamSer;
      |
    11: //Istwert Klemmenstrom in A  On-Zeit
      GetCurrent(true);
      nachkomma:=8-byte(ShuntSelect);
      WriteParamSer;
      |
    12: //Istwert Klemmenstrom in mA  On-Zeit
      GetCurrent(true);
      Parammul1000;
      nachkomma:=2;
      WriteParamSer;
      |
{
    13:
      GetVoltage10;
      WriteParamSer;
      |
    14:
      GetCurrent10;
      WriteParamSer;
      |
}
    15: //Istwert Klemmenspannung  Off-Zeit
      GetVoltage(false);
      WriteParamSer;
      |
    16: //Istwert Klemmenstrom in A  Off-Zeit
      GetCurrent(false);
      nachkomma:=8-byte(ShuntSelect);
      WriteParamSer;
      |
    17: //Istwert Klemmenstrom in mA  Off-Zeit
      GetCurrent(false);
      Parammul1000;
      nachkomma:=2;
      WriteParamSer;
      |
    18:
      Param:=Ptot;
      WriteParamSer;
      |
    19:
      ParamInt:=Integer(ord(ModeSelect));
      WriteParamIntSer;
      |
    21,22:
      Param:=DCAmpMod*100;    // Modulation Strom in Prozent
      WriteParamSer;
      |
    27:
      ParamInt:=PWonTime;
      WriteParamIntSer;
      |
    28:
      ParamInt:=PWoffTime;
      WriteParamIntSer;
      |
    29:
      ParamInt:=Ipercent;
      WriteParamIntSer;
      |
    50:
      disableInts;
      ParamInt:=integer(AD16tempUon);
      enableInts;
      WriteParamIntSer;
      |
    51:
      disableInts;
      ParamInt:=integer(AD16tempIon);
      enableInts;
      WriteParamIntSer;
      |
    52:
      ParamInt:=integer(GetADC10(3));
      WriteParamIntSer;
      |
    53:
      ParamInt:=integer(GetADC10(4));
      WriteParamIntSer;
      |
    70:
      ParamInt:=integer(DACtempOn);
      WriteParamIntSer;
      |
    71:
      ParamInt:=integer(DACtempOff);
      WriteParamIntSer;
      |
    72:
      ParamInt:=integer(DACtemp);
      WriteParamIntSer;
      |
    80:
      ParamInt:=integer(Modify);
      WriteParamIntSer;
      |
    89:
      ParamInt:=IncRast;
      WriteParamIntSer;
      |
    99:  //ALL alle Eingangsspannungen
      GetVoltage(true);
      SubCh:=10;
      WriteParamSer;
      GetCurrent(true);
      SubCh:=11;
      WriteParamSer;
      GetVoltage(false);
      SubCh:=15;
      WriteParamSer;
      GetCurrent(false);
      SubCh:=16;
      WriteParamSer;
      |
    100,101: // nicht benutzt, bei DCG: DACU-Offsets
      ParamInt:=0;
      WriteParamIntSer;
      |
    102..105: // 2mA, 20mA, 200mA, 2A
      ParamInt:=DACIoffsets[subCh-102];
      WriteParamIntSer;
      |
    110,111: // 2V, 20V
      ParamInt:=ADCUoffsets[subCh-110];
      WriteParamIntSer;
      |
    112..115: // 2mA, 20mA, 200mA, 2A
      ParamInt:=ADCIoffsets[subCh-112];
      WriteParamIntSer;
      |
    150..171:
      Param:=OptionArray[subCh-150];
      WriteParamSer;
      |
    200,201: // nicht benutzt, bei DCG: DACU-Scales
      Param:=0;
      WriteParamSer;
      |
    202..205: // 2mA, 20mA, 200mA, 2A
      Param:=DACIscales[subCh-202];
      nachkomma:=5;
      WriteParamSer;
      |
    210: // ADC 16 Scales Low (210) und High(211)
      Param:=ADC16UscaleLow;
      nachkomma:=5;
      WriteParamSer;
      |
    211: // ADC 16 Scales Low (210) und High(211)
      Param:=ADC16UscaleHigh;
      nachkomma:=5;
      WriteParamSer;
      |
    212..215: // 2mA, 20mA, 200mA, 2A
      Param:=ADCIscales[subCh-212];
      nachkomma:=5;
      WriteParamSer;
      |
{
    220: // ADC 10 Scales Low (220) und High(221)
      Param:=ADC10UscaleLow;
      nachkomma:=5;
      WriteParamSer;
      |
    221: // ADC 10 Scales Low (220) und High(221)
      Param:=ADC10UscaleHigh;
      nachkomma:=5;
      WriteParamSer;
      |
}
    233: //I2C LM75 scaled
      Param:=Temperature;
      nachkomma:=1;
      WriteParamSer;
      |
    234: //I2C LM75 scaled
      Param:=TemperatureExtern;
      nachkomma:=1;
      WriteParamSer;
      |
    240: //Trigger-Maske
      ParamInt:=integer(TrigMask);
      WriteParamIntSer;
      |
    251: // Fehlerzähler auslesen
      ParamInt:=integer(Errcount);
      WriteParamIntSer;
      |
    252: // Serielle Baudrate
      ParamInt:=integer(EESerBaudReg);
      WriteParamIntSer;
      |
    253: // SerTest, gibt Input-String komplett und unverändert wieder aus
      write(Serout, SerInpStr);
      SerCRLF;
      return;
      |
    254: //Wert
      WriteChPrefix;
      write(serout,Vers1Str);
      SerCRLF;
      |
    250,255: //Status
      serprompt(NoErr);
      |
  else
    serprompt(ParamErr);
  endcase;
end;


procedure ParseSetParam;
begin
  if Busyflag then
    serprompt(BusyErr);
    return;
  endif;
  ChangedFlag:=true;
  case SubCh of
    0:
      OutputEnable:= (Param <> 0);
      if ModeSelect = OutputOff then
        MPXENA:=low;
      else
        MPXENA:=OutputEnable;
      endif;
      |
    1:
      DCAmp:=Param;    // Strom in A
      |
    2:
      Paramdiv1000;
      DCAmp:=Param;    // Strom in mA
      |
// mcb -->
    3:
      DCWatt:=Param;    // Leistung in Watt
      |
    4:
      LowVolt := False;
      OutputEnable := True;
      DCVolt:=Param;    // Abschaltspannung in Volt
      |
// <-- mcb
    5:
      DCohm:=Param;    // Widerstand
      |
// mcb -->
     7:
       Ah := 0;
       Wh := 0;
       |
     8:
       Wh := 0;
       Ah := 0;
       |
// <-- mcb
    9:
      ShuntRange:=lo(ParamInt);    // 4..255= AutoSelect
      |
    19: // RNG Bereich/Modus
      ModeSelect:=tMode(ParamByte);
      if ModeSelect = OutputOff then
        MPXENA:=low; // sofort abschalten
        OutputEnable:=false;
        SetLevelDAC_I;
      else
        OutputEnable:=true;  // EInschalten später bei SetDAC
      endif;
      |
    21,22:
      DCAmpMod:=Param/100;         // Prozent Ausgangsstrom
      |
    27:
      PWonTime:=integer(ParamInt);
      |
    28:
      PWoffTime:=integer(ParamInt);
      |
    29:
      IPercent:=ParamInt;
      |
    70:
      DisableInts;
      DACtempOn:=word(ParamInt);
      EnableInts;
      if verbose then
        serprompt(NoErr);
      endif;
      return; // keine weiteren Umschaltungen!
      |
    71:
      DisableInts;
      DACtempOff:=word(ParamInt);
      EnableInts;
      if verbose then
        serprompt(NoErr);
      endif;
      return; // keine weiteren Umschaltungen!
      |
    80:
      Modify:=tModify(ParamByte);
      WerteOnLCD;
      |
    89,100..115, 200..223:
      if EEunLocked then
        case SubCh of
        89:
          InitIncRast:=Param;
          IncRast:=integer(ParamInt);
          |
        100,101:  // nur bei DCG benutzt
          |
        102..105: // 2mA, 20mA, 200mA, 2A
          DACIoffsets[SubCh-102]:=integer(ParamInt);
          |
        110,111: // 2V, 20V
          ADCUoffsets[SubCh-110]:=integer(ParamInt);
          |
        112..115: // 2mA, 20mA, 200mA, 2A
          ADCIoffsets[SubCh-112]:=integer(ParamInt);
          |
        200,201:  // nur bei DCG benutzt
          |
        202..205: // 2mA, 20mA, 200mA, 2A
          DACIscales[SubCh-202]:=Param;
          |
        210:
          ADC16UscaleLow:=Param;
          |
        211:
          ADC16UscaleHigh:=Param;
          |
        212..215: // 2mA, 20mA, 200mA, 2A
          ADCIscales[SubCh-212]:=Param;
          |
{
        220:
          ADC10UscaleLow:=Param;
          |
        221:
          ADC10UscaleHigh:=Param;
          |
}
        endcase;
        InitScales;
        mdelay(3);
      else
        serprompt(LockedErr);
        return;
      endif;
      |
    150..171:
      if EEunLocked then
        OptionArray[subCh-150]:=Param;
        InitScales;
        mdelay(3);
      else
        serprompt(LockedErr);
        return;
      endif;
      |
    240: //Trigger-Maske
      TrigMask:=byte(ParamInt);
      EETrigMask:=TrigMask;
      |
    250: // EEPROM Write Enable
      |
    251: //Error-Count
      ErrCount:=integer(ParamInt);
      |
    252: // Serielle Baudrate, erst beim nächsten Reset aktiv
      if EEunLocked then
        EESerBaudReg:=ParamByte;
      else
        serprompt(LockedErr);
        return;
      endif;
      |
   else
    serprompt(ParamErr);
    return;
  endcase;
  EEunLocked:=false;
  if SubCh=250 then  // EEPROM Write Enable
    EEunLocked:=true;
  endif;
  CheckLimits;
  if verbose then
    serprompt(CheckLimitErr);  // = ParamErr wenn Limits erreicht
  endif;
// mcb -->
  case ModeSelect of
    RhiVolt,RloVolt:
       SetLevelDAC_R;
       |
    IhiVolt,IloVolt:
       SetLevelDAC_I;
       |
    PhiVolt,PloVolt:
       SetLevelDAC_P;
       |
  endcase;
// <-- mcb
end;


{###########################################################################}

// allgemeiner Parser-Teil

function Cmd2Index : tCmdWhich;
// Umsetzen eines Text-Befehls in Index-Eintrag der Befehlstabelle
var myCmdIndex: tCmdWhich;
begin
  ParamStr:= uppercase(ParamStr);
  for myCmdIndex := tError(0) to nop do
    if ParamStr = CmdStrArr[ord(myCmdIndex)] then
      return(myCmdIndex);
    endif;
  endfor;
  return(err);
end;

function ParseExtract:boolean;
//extrahiert ParamStr oder CmdStr aus SerInpStr,
//liefert true, wenn Parameter, sonst false, wenn Command
var myChar: char; myBool:boolean;
begin
  ParamStr:='';
  myBool:=false;
  while SerInpStr[SerInpPtr] =' ' do // Leerzeichen überspringen
    inc(serInpPtr);
  endwhile;
  if SerInpStr[SerInpPtr] in ['*'..'9'] then // Zahlen oder Wildcard, es wird ein Parameter
    myBool:=true;
    for i:=SerInpPtr to length(SerInpStr) do
      mychar:=SerInpStr[i];
      if myChar in ['*'..'9'] then
        append(mychar,ParamStr);
      else // Buchstabe oder sonstirgendwas, abbrechen
        SerInpPtr:=i;
        return(mybool);
      endif;
    endfor;
  else
    for i:=SerInpPtr to length(SerInpStr) do
      mychar:=SerInpStr[i];
      if myChar >= 'A' then
        append(mychar,ParamStr);
      else // Ziffer oder sonstirgendwas, abbrechen
        SerInpPtr:=i;
        return(mybool);
      endif;
    endfor;
  endif;
  return(mybool);
end;

procedure ParseSubCh;
//Überprüfen, ob Befehl oder Daten eingegangen und für uns, Parser-Vorbehandlung,
//wenn Busy => BusyErr
var
  GleichPos,
  CheckSpos, myCheckSum,CheckSumIn:byte;
  SubChOffset:byte;

  myChar:char;
  hasMainCh, hasCRC, isResult, isOmni, isRequest, isParam: Boolean;

begin
  if SerInpStr='' then
    serprompt(NoErr);
    return;
  endif;
  hasMainCh:=(pos(':',SerInpStr)>0); // Kanaltrenner-':'
  isRequest:=not (pos('=',SerInpStr)>0); // Abfrage
  myChar:=SerInpStr[1];
  isOmni:=(myChar='*');    // Omni-Flag
  isResult:=(myChar='#');  // Ergebnis-'#'
  if isResult then
    WriteSerInp;
    return;
  endif;
  SerInpPtr:=1;
  if hasMainCh then
    isParam:=ParseExtract;
    inc(SerInpPtr);
    if isOmni then // Omni-Befehl
      WriteSerInp; // weiterleiten
    else
      CurrentCh:=StrToInt(ParamStr);
    endif;
  endif;
  if (not isOmni) and (CurrentCh<>SlaveCh) and hasMainCh then // nicht für uns
    WriteSerInp;
    return;
  endif;

// Befehl/Parameter ist für uns, ab hier eigentliche Behandlung
// Wenn vorhanden, XOR-Prüfsumme checken, Präfix-"$" zählt nicht mit!
  verbose:=(pos('!',SerInpStr)>0) OR (pos('?',SerInpStr)>0); // Ausführliche Antwort erwünscht
  CheckSpos:=pos('$',SerInpStr);
  hasCRC:=CheckSpos>0; // CheckSumIn-'$'
  if hasCRC then
    ParamStr:=copy(SerInpStr,CheckSpos+1, 2);
    CheckSumIn:=HexToInt(ParamStr); // erhaltene XOR-Checksumme
    myCheckSum:=0;
    for i:= 1 to CheckSpos-1 do
      myChar:=SerInpStr[i];
      myCheckSum:=myCheckSum xor ord(myChar);
    endfor;
    if myCheckSum <> CheckSumIn then
      serprompt(CheckSumErr);
      return;
    endif;
  endif;
//  SerInpStr:=trim(SerInpStr);
  SetSystimer(ActivityTimer, 255);
  LEDactivity:=low;

//Parse einzelnen Befehl

  if ParseExtract then
    SubChOffset:=0; // direkter SubCh-Aufruf
  else
    CmdWhich:=Cmd2Index; // Klartext übersetzen
    if CmdWhich = err then
      serprompt(SyntaxErr);
      return;
    endif;
    SubChOffset:=Cmd2SubChArr[ord(CmdWhich)];
    isParam:=ParseExtract; // SubCh-Parameter holen
  endif;
  SubCh:=StrToInt(ParamStr)+SubChOffset; //auf neuen SubCh umrechnen

  if isRequest then
    ParseGetParam;
  else
    SerInpPtr:=pos('=',SerInpStr)+1; // Set-'='
    if (SerInpPtr>1) and ParseExtract then
      Param:=StrToFloat(ParamStr);
      ParamInt:=integer(Param);
      ParamByte:=byte(ParamInt);
    else
      serprompt(ParamErr);
      return;
    endif;
    ParseSetParam;
  endif;
end;

