
{###########################################################################}
{
ADA-IO Parser

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
var isInteger:Boolean;
begin
  isInteger:= false;
// SubCh-Start in ParamInt1, SubCh-Ende in ParamInt2
  case SubCh of
    0..47: // VAL Eingangsspannung AD10, AD16
      isInteger:=GetNewValue(SubCh);  // aktuellen Wert holen
      |
    50..67:
      GetNewValue(SubCh-50);
      isInteger:=true;
      |
    70..77:
      ParamInt:=Integer(DACrawArray[SubCh-70]);
      isInteger:=true;
      |
    80:
      ParamInt:=Integer(Modify);
      isInteger:=true;
      |
    89,159:
      ParamInt:=IncRast;
      isInteger:=true;
      |
    95: // Eingangsspannungen AD10
      for SubCh:= 0 to 7 do
        GetNewValue(SubCh);  // auf aktuellen Wert warten
        WriteParam;
      endfor;
      return;
      |
    96: // Eingangsspannungen AD16
      for SubCh:= 10 to 17 do
        GetNewValue(SubCh);  // auf aktuellen Wert warten
        WriteParam;
      endfor;
      return;
      |
    98: // Eingangspegel Ports
      for SubCh:= 30 to 37 do
        GetNewValue(SubCh);
        WriteParamInt;
      endfor;
      return;
      |
    99: // alle Eingangspegel AD10, AD16, Ports
      for SubCh:= 0 to 7 do
        GetNewValue(SubCh);  // auf aktuellen Wert warten
        WriteParam;
      endfor;
      for SubCh:= 10 to 17 do
        GetNewValue(SubCh);  // auf aktuellen Wert warten
        WriteParam;
      endfor;
      for SubCh:= 30 to 37 do
        GetNewValue(SubCh);
        WriteParamInt;
      endfor;
      return;
      |
    157:
      isInteger:=true;
      if IntegrateAD16 then
        ParamInt:=1;
      else
        ParamInt:=0;
      endif;
      |
    100..127: //OFS Offset
      isInteger:=true;
      ParamInt:=OffsetArray[SubCh-100];
      |
    180..187: //Port Init-Werte
      isInteger:=true;
      ParamInt:=integer(PortInitArray[SubCh-180]);
      |
    190..197: //Port DIR Init-Werte
      isInteger:=true;
      ParamInt:=integer(DirInitArray[SubCh-190]);
      |
    200..229: //SCL Skalierung
      Param:=ScaleArray[SubCh-200];
      |
    230: //I2C generic byte
      TWIinp(I2CslaveAdr, ParamByte);
      ParamInt:=integer(ParamByte);
      isInteger:=true;
      |
    231: //I2C generic word
      TWIinp(I2CslaveAdr, ParamInt);
      isInteger:=true;
      |
    232: //I2C generic word swapped
      TWIinp(I2CslaveAdr, ParamInt);
      ParamInt:=swap(ParamInt);
      isInteger:=true;
      |
    233: //I2C LM75 scaled
      TWIinp(I2CslaveAdr, ParamInt);
      ParamInt:= swap(ParamInt) shr 7;
      Param:=float(ParamInt)/2;
      |
    234: //I2C DS1631 scaled
      TWIinp(I2CslaveAdr, ParamInt);
      ParamInt:= swap(ParamInt);
      Param:=float(ParamInt)/256;
      |
    239: //I2C generic Adr
      ParamInt:=Integer(I2CslaveAdr);
      isInteger:=true;
      |
    240..243: //Trigger-Masken
      isInteger:=true;
      ParamInt:=integer(TrigMaskArray[SubCh-240]);
      |
    156,246: //REF, Externe Referenzspannung
      isInteger:=true;
      ParamInt:=integer(ExtRef);
      |
    247: //TRT, Auto-Trigger-Timer
      isInteger:=true;
      ParamInt:=integer(TrigTimerValue);
      |
    248: //Trigger-Level
      isInteger:=true;
      ParamInt:=integer(TrigLevel);
      |
    249: //man. Trigger
      Trigger:=true;
      serprompt(NoErr,Status);
      return;
      |
    252: // Serielle Baudrate
      isInteger:=true;
      ParamInt:=integer(EESerBaudReg);
      |
    253: // SerTest, gibt Input-String komplett und unverändert wieder aus
      write(Serout, SerInpStr);
      SerCRLF;
      return;
      |
    254: //IDN?
      WriteChPrefix;
      write(Serout, Vers1Str);
      writeFeatures;
      SerCRLF;
      return;
      |
    85: //EGG?
      WriteChPrefix;
      write(Serout, EggStr);
      SerCRLF;
      return;
      |
    251: // Fehlerzähler auslesen
      isInteger:=true;
      ParamInt:=Errcount;
      |
    250,255: //Status
      serprompt(NoErr,Status);
      return;
      |
  else
    serprompt(ParamErr,0);
    return;
  endcase;
  if isInteger then
    WriteParamInt;
  else
    WriteParam;
  endif;
end;

procedure ParseSetParam;
var StartPos,EndPos:Byte;
begin // kein Request, also Parameter setzen
  ChangedFlag:=true;
  case SubCh of
    20..27: //Wert
      DACValueArray[SubCh-20]:=Param;
      SetDAC(SubCh);
      |
    30..37: //PIO IO-Pins
      SetPort(SubCh-30,Parambyte);
      |
    40..47: //DDR IO-Pins, ohne INIT-Array zu ändern!
      SetDir(SubCh-40,Parambyte);
      |
    80: // LCD Anzeige-Wert
      if ParamByte > 37 then
        serprompt(ParamErr,0);
        return;
      endif;
      Modify:=ParamByte;
      |
    81: // LCD Anzeige-Text
      if ParamByte > 37 then
        serprompt(ParamErr,0);
        return;
      endif;
      if EEunLocked then
        StartPos:=pos('[',SerInpStr)+1;
        EndPos:= posN(']',SerInpStr,SerInpPtr);
        ParamTextStr:=copy(SerInpStr, StartPos, EndPos-StartPos);
        ParamTextArray[ParamByte]:=ParamTextStr;
      else
        serprompt(LockedErr,0);
        return;
      endif;
      |
    89,159: // Inkrementalgeber Impulse pro Rastung
      if EEunLocked then
        IncRast:=ParamInt;
        IncRastDef:=IncRast;
      else
        serprompt(LockedErr,0);
        return;
      endif;
      |
    180..187: // PortInit-Werte im EEPROM, OPT 30
      i:=SubCh-180;
      if EEunLocked then
        PortInitArray[i]:=Parambyte;
        SetPort(i,ParamByte);
      else
        serprompt(LockedErr,0);
        return;
      endif;
      |
    190..197: //  DDR IO-Pins auch im EEPROM, OPT 40
      i:=SubCh-190;
      if EEunLocked then
        DirInitArray[i]:=Parambyte;
        SetDir(i,Parambyte);
      else
        serprompt(LockedErr,0);
        return;
      endif;
      |
    157: //  AD16-Modus
      if EEunLocked then
        IntegrateAD16:=(Parambyte>0);
        InitIntegrateAD16:=IntegrateAD16;
      else
        serprompt(LockedErr,0);
        return;
      endif;
      |
    156,246: //Interne Referenzspannung wenn 1, externe wenn 0
      if EEunLocked then
        ExtRef:=ParamByte;
        if Parambyte=0 then
          ADMUX:= ADMUX AND %00111111;  {External ADC Reference}
        else
          ADMUX:= ADMUX OR %11000000;  {Internal ADC Reference}
        endif;
      else
        serprompt(LockedErr,0);
        return;
      endif;
      |
    200..229: //Skalierung
      i:=SubCh-200;
      if EEunLocked then
        ScaleArray[i]:=Param;
        SetDAC(i);
        SetBaseScales;
      else
        serprompt(LockedErr,0);
        return;
      endif;
      |
    100..127: //OFS Offset
      i:=SubCh-100;
      if EEunLocked then
        OffsetArray[i]:=ParamInt;
        SetDAC(i);
      else
        serprompt(LockedErr,0);
        return;
      endif;
      |
    230: //I2C generic byte output
      TWIout(I2CslaveAdr, ParamByte);
      |
    231: //I2C generic 16 bit word output
      TWIout(I2CslaveAdr, ParamInt);
      |
    232: //I2C generic 16 bit word output swapped
      ParamInt:=swap(ParamInt);
      TWIout(I2CslaveAdr, ParamInt);
      |
    239: //I2C generic Adr
      I2CslaveAdr:=ParamByte;
      |
    240..243: //Trigger-Masken
      i:=SubCh-240;
      if EEunLocked then
        TrigMaskArray[i]:=Parambyte;
      else
        serprompt(LockedErr,0);
        return;
      endif;
      |
    247: // Auto-Trigger-Timer in ms
      if EEunLocked then
        if ParamInt in [1..9] then
          serprompt(ParamErr,0);
          return;
        else
          TrigTimerValue:=word(ParamInt);
        endif;
      else
        serprompt(LockedErr,0);
        return;
      endif;
      |
    248: // Trigger-Level 0=neg.
      if EEunLocked then
        TrigLevel:=Parambyte;
        if Parambyte=0 then
          MCUCSR:=MCUCSR and %10111111; //ISC2:=false; Negative Edge
        else
          MCUCSR:=MCUCSR or %01000000; //ISC2:=tru; Positive Edge
        endif;
      else
        serprompt(LockedErr,0);
        return;
      endif;
      |
    249: //man. Trigger
      Trigger:=true;
      serprompt(NoErr,Status);
      return;
      |
    251: //Error-Count
      ErrCount:=ParamInt;
      |
    252: // Serielle Baudrate, erst beim nächsten Reset aktiv
      if EEunLocked then
        EESerBaudReg:=ParamByte;
      else
        serprompt(LockedErr,0);
        return;
      endif;
      |
    250: // EEPROM Write Enable
      |
  else
    serprompt(ParamErr,0);
    return;
  endcase;
  EEunLocked:=false;
  if SubCh=250 then  // EEPROM Write Enable
    EEunLocked:=(ParamByte=1);
  endif;
  serprompt(NoErr,Status);
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
      if myChar <='9' then
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
    serprompt(NoErr,0);
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
      serprompt(CheckSumErr,0);
      return;
    endif;
  endif;
//  SerInpStr:=trim(SerInpStr);
  SetSystimer(ActivityTimer, 125);
  LEDactivity:=low;
//Parse einzelnen Befehl

  if ParseExtract then
    SubChOffset:=0; // direkter SubCh-Aufruf
    CmdWhich:=val;
  else
    CmdWhich:=Cmd2Index; // Klartext übersetzen
    if CmdWhich = err then
      serprompt(SyntaxErr,0);
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
    if ParseExtract then
      Param:=StrToFloat(ParamStr);
      ParamInt:=integer(Param);
      ParamByte:=byte(ParamInt);
    else
      if CmdWhich >= val then // Befehl benötigt Parameter
        serprompt(ParamErr,0);
        return;
      endif;
    endif;
    ParseSetParam;
  endif;
end;

