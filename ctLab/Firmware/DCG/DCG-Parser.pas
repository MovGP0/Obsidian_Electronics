procedure paramdiv1000;

begin
  Param:=Param/1000;
end;

procedure parammul1000;

begin
  Param:=Param*1000;
end;

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
      Param:=DCVolt;   // eingestellte Spannung, Sollwert
      WriteParamSer;
      |
    1:
      Param:=DCAmp;    // eingestellter Strom, Sollwert
      nachkomma:=7-byte(IRange);
      WriteParamSer;
      |
    2:
      Param:=DCAmp;      // in mA
      Parammul1000;
      nachkomma:=2;
      WriteParamSer;
      |
    3:
      Param:=DCAmp;   // in µA
      Parammul1000;
      Parammul1000;
      nachkomma:=0;
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
    10: //Istwert Ausgangsspannung
      GetVoltage;
      WriteParamSer;
      |
    11: //Istwert Ausgangsstrom  in A
      GetCurrent;
      nachkomma:=8-byte(IRange);
      WriteParamSer;
      |
    12: //Istwert Ausgangsstrom  in mA
      GetCurrent;
      Parammul1000;
      nachkomma:=2;
      WriteParamSer;
      |
    13: //Istwert Ausgangsstrom  in µA
      GetCurrent;
      Parammul1000;
      Parammul1000;
      nachkomma:=0;
      WriteParamSer;
      |
    15: //Istwert Eingangsspannung
      getInputVoltage;
      WriteParamSer;
      |
    16: //Integrierte Ausgangsspannung
      Param:=DCVoltIntegrated;
      WriteParamSer;
      |
    17: //Integrierter Ausgangsstrom
      Param:=DCAmpIntegrated;
      nachkomma:=8-byte(IRange);
      WriteParamSer;
      |
    18:
      Param:=CurrAmp*CurrVolt;
      WriteParamSer;
      |
    20:
      Param:=DCVoltMod*100;   // Modulation Spannung in Prozent
      WriteParamSer;
      |
    21..23:
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
      ParamInt:=RipplePercent;
      WriteParamIntSer;
      |
    50:
      ParamInt:=integer(ADCrawU);
      WriteParamIntSer;
      |
    51:
      ParamInt:=integer(ADCrawi);
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
    54:
      ParamInt:=integer(GetADC10(5));
      WriteParamIntSer;
      |
    70:
      ParamInt:=integer(DACrawUon);
      WriteParamIntSer;
      |
    71:
      ParamInt:=integer(DACrawI);
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
      GetVoltage;
      SubCh:=10;
      WriteParamSer;
      GetCurrent;
      SubCh:=11;
      WriteParamSer;
      getInputVoltage;
      SubCh:=15;
      WriteParamSer;
      |
    100,101: // 2V, 20V
      ParamInt:=DACUoffsets[subCh-100];
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
    150..174:
      Param:=OptionArray[subCh-150];
      WriteParamSer;
      |
    200,201: // 2V, 20V
      Param:=DACUscales[subCh-200];
      nachkomma:=5;
      WriteParamSer;
      |
    202..205: // 2mA, 20mA, 200mA, 2A
      Param:=DACIscales[subCh-202];
      nachkomma:=5;
      WriteParamSer;
      |
    210,211: // 2V, 20V
      Param:=ADCUscales[subCh-210];
      nachkomma:=5;
      WriteParamSer;
      |
    212..215: // 2mA, 20mA, 200mA, 2A
      Param:=ADCIscales[subCh-212];
      nachkomma:=5;
      WriteParamSer;
      |
    233: //I2C LM75 scaled
      Param:=Temperature;
      nachkomma:=1;
      WriteParamSer;
      |
    251: // Fehlerzähler auslesen
      ParamInt:=Errcount;
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
      DCVolt:=Param;
      |
    1:
      DCAmp:=Param;         // Strom in A
      |
    2:
      Paramdiv1000;
      DCAmp:=Param;    // Strom in mA
      |
    3:
      Paramdiv1000;
      Paramdiv1000;
      DCAmp:=Param;    // Strom in µA
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
    20:
      DCVoltMod:=Param/100;        // Prozent Ausgangsspannung
      |
    21..23:
      DCAmpMod:=Param/100;         // Prozent Ausgangsstrom
      |
    27:
      PWonTime:=ParamInt;
      |
    28:
      PWoffTime:=ParamInt;
      |
    29:
      RipplePercent:=ParamInt;
      |
    80:
      Modify:=tModify(ParamByte);
      WerteOnLCD;
      |
    89:
      if EEunLocked then
        IncRast:=ParamInt;
        InitIncRast:=Param;
      else
        serprompt(LockedErr);
        return;
      endif;
      |
    100..115, 200..215:
      if EEunLocked then
        case SubCh of
        100,101: // 2V, 20V
          DACUoffsets[SubCh-100]:=ParamInt;
          |
        102..105: // 2mA, 20mA, 200mA, 2A
          DACIoffsets[SubCh-102]:=ParamInt;
          |
        110,111: // 2V, 20V
          ADCUoffsets[SubCh-110]:=ParamInt;
          |
        112..115: // 2mA, 20mA, 200mA, 2A
          ADCIoffsets[SubCh-112]:=ParamInt;
          |
        200,201: // 2V, 20V
          DACUscales[SubCh-200]:=Param;
          |
        202..205: // 2mA, 20mA, 200mA, 2A
          DACIscales[SubCh-202]:=Param;
          |
        210,211: // 2V, 20V
          ADCUscales[SubCh-210]:=Param;
          |
        212..215: // 2mA, 20mA, 200mA, 2A
          ADCIscales[SubCh-212]:=Param;
          |
        endcase;
        InitScales;
        mdelay(3);
      else
        serprompt(LockedErr);
        return;
      endif;
      |
    150..174:
      if EEunLocked then
        OptionArray[subCh-150]:=Param;
        InitScales;
        mdelay(3);
      else
        serprompt(LockedErr);
        return;
      endif;
      |
    250: // EEPROM Write Enable
      |
    251: //Error-Count
      ErrCount:=ParamInt;
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
  if verbose or (CheckLimitErr <> noErr) then
    serprompt(CheckLimitErr);  // = ParamErr wenn Limits erreicht
  endif;
  SetLevelDAC;
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

