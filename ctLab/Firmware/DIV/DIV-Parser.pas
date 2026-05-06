{###########################################################################}
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
var isInteger: Boolean;
begin
  isInteger:= false;
  case SubCh of
    0..2     : //VAL Eingangsspannung AD24
               GetAD24(SubCh);
               ParamScale24;
             |
    3        : //VAL Eingangsspannung AD24 mit Wait auf Messwert
               waitAD24;
               GetAD24(0); // ohne Integreation
               ParamScale24;
             |
    19       : // RNG, bei AutoRange gewählten Range liefern
               ParamLongInt:= ord(Range);
               isInteger:= true;
             |
    10       :  //VAL Eingangsspannung AD10, TrueRMS oder DC
               waitAD10;
               if isACrange then
                 GetAD10(3);
               else
                 GetAD10(5);
               endif;
               ParamScale10;
             |
    11       :  //VAL Eingangsspannung AD10, PeakAC oder DC
               waitAD10;
               if isACrange then
                 GetAD10(4);
               else
                 GetAD10(5);
               endif;
               ParamScale10;
             |
    50       :  //VAL Eingangsspannung AD24 roh
               ParamLongInt:= AD24temp - $800000;
               isInteger:= true;
             |
    60..62   :  //VAL Eingangsspannung AD10 roh, 60=TRMS, 61=Peak, 62=DCmid
               ParamLongInt:= LongInt(GetADC(SubCh - 57));
               if SubCh=62 then // Midscale abziehen
                 ParamLongInt := ParamLongInt-512;
               endif;
               isInteger:= true;
             |
    80       : // immer 0, weil nur ein "Menü"
               ParamLongInt:= 0;
               isInteger:= true;
             |
    88       : // LCD-Integrationsmodus
               ParamLongInt:= LongInt(LCDintegrate);
               isInteger:= true;
             |
    89       : // Rastung Dreh-Encoder
               ParamLongInt:= LongInt(IncRast);
               isInteger:= true;
             |
    99       :  //ALL alle Eingangsspannungen
               GetAD24(0);
               ParamScale24;
               SubCh:= 0;
             |
    100..115 : // OFS AD24 Offset je nach eingestellter Range
               ParamLongInt:= OffsetArray24[SubCh - 100];
               isInteger:= true;
             |
    120..135 : // OFS AD24 Offset je nach eingestellter Range
               ParamLongInt:= OffsetArray10[SubCh - 120];
               isInteger:= true;
             |
    200..215 : //SCL AD24 Skalierung DC (5 Ranges) und AC (5 Ranges)
               Param:= ScaleArray24[SubCh - 200];
             |
    220..235 : //SCL AD10 Skalierung DC (5 Ranges) und AC (5 Ranges)
               Param:= ScaleArray10[SubCh - 220];
             |
    240      : //TRM, Trigger Mask/Mode
               isInteger:= true;
               ParamLongInt:= LongInt(TrigMask);
             |
    247      : //TRT, Auto-Trigger-Timer
               isInteger:= true;
               ParamLongInt:= LongInt(TrigTimerValue);
             |
    249      : //man. Trigger
               Trigger:= true;
               serprompt(NoErr);
               return;
             |
    251      : // Fehlerzähler auslesen
               isInteger:= true;
               ParamLongInt:= LongInt(Errcount);
             |
    253      : // SerTest, gibt Input-String komplett und unverändert wieder aus
               write(Serout, SerInpStr);
               SerCRLF;
               return;
             |
    254      : //IDN
               WriteChPrefix;
               write(Serout, Vers1Str);
               SerCRLF;
               return;
             |
    255      : //Status
               serprompt(NoErr);
               return;
             |
  else
    serprompt(ParamErr);
    return;
  endcase;
  if isInteger then
    WriteParamLongIntSer;
  else
    WriteParamSer(OverloadFlag);
  endif;
end;


procedure ParseSetParam;
begin // kein Request, also Parameter setzen
  CheckLimitErr:=noErr;
  case SubCh of
    19       :  //RNG
               Range:= ParamByte;
               CheckLimits;
               SwitchRange;
               ShowRange;
             |
    88       : // LCD-Integrationsmodus
               if EEunLocked then
                 LCDintegrate:= ParamByte;
                 InitLCDintegrate:= LCDintegrate;
               else
                 serprompt(LockedErr);
                 return;
               endif;
             |
    89       : // Inkrementalgeber Impulse pro Rastung
               if EEunLocked then
                 IncRast:= integer(ParamLongInt);
                 InitIncRast:= IncRast;
               else
                 serprompt(LockedErr);
                 return;
               endif;
             |
    100..115 :  //OFS
               if EEunLocked then
                 OffsetArray24[SubCh - 100]:= ParamLongInt;
               else
                 serprompt(LockedErr);
                 return;
               endif;
             |
    120..135 :  //OFS
               if EEunLocked then
                 OffsetArray10[SubCh - 120]:= ParamLongInt;
               else
                 serprompt(LockedErr);
                 return;
               endif;
             |
    200..215 :  //SCL
               if EEunLocked then
                 ScaleArray24[SubCh - 200]:= Param;
               else
                 serprompt(LockedErr);
                 return;
               endif;
             |
    220..235 :  //SCL
               if EEunLocked then
                 ScaleArray10[SubCh - 220]:= Param;
               else
                 serprompt(LockedErr);
                 return;
               endif;
             |
    240      : // Trigger Mask/Mode
               if EEunLocked then
                 TrigMask:= ParamByte;
               else
                 serprompt(LockedErr);
                 return;
               endif;
             |
    247      : // Auto-Trigger-Timer in ms
               if EEunLocked then
                 if ParamLongInt in [1..9] then
                   serprompt(ParamErr);
                   return;
                 else
                   TrigTimerValue:= word(ParamLongInt);
                 endif;
               else
                 serprompt(LockedErr);
                 return;
               endif;
             |
    249      : //man. Trigger
               Trigger:= true;
               serprompt(NoErr);
               return;
             |
    251      : //Error-Count
               Errcount:= integer(ParamLongInt);
             |
    250      : // EEPROM Write Enable
             |
  else
    serprompt(ParamErr);
    return;
  endcase;
  EEunLocked:= false;
  if SubCh = 250 then  // EEPROM Write Enable
    EEunLocked:= true;
  endif;
  if verbose or (CheckLimitErr <> noErr) then
    serprompt(CheckLimitErr);  // = ParamErr wenn Limits erreicht
  endif;
end;

{###########################################################################}

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

function ParseExtract : boolean;
//extrahiert ParamStr oder CmdStr aus SerInpStr,
//liefert true, wenn Parameter, sonst false, wenn Command
var myChar: char; myBool: Boolean;
begin
  ParamStr:= '';
  myBool:= false;
  while SerInpStr[SerInpPtr] = ' ' do // Leerzeichen überspringen
    inc(SerInpPtr);
  endwhile;
  if SerInpStr[SerInpPtr] in ['*'..'9'] then // Zahlen oder Wildcard, es wird ein Parameter
    myBool:= true;
    for i:= SerInpPtr to length(SerInpStr) do
      myChar:= SerInpStr[i];
      if myChar <= '9' then
        append(myChar, ParamStr);
      else // Buchstabe oder sonstirgendwas, abbrechen
        SerInpPtr:= i;
        return(myBool);
      endif;
    endfor;
  else
    for i:= SerInpPtr to length(SerInpStr) do
      myChar:= SerInpStr[i];
      if myChar >= 'A' then
        append(myChar, ParamStr);
      else // Ziffer oder sonstirgendwas, abbrechen
        SerInpPtr:= i;
        return(myBool);
      endif;
    endfor;
  endif;
  return(myBool);
end;

procedure ParseSubCh;
//Überprüfen, ob Befehl oder Daten eingegangen und für uns, Parser-Vorbehandlung,
//wenn Busy => BusyErr
var
  GleichPos,
  CheckSpos, myCheckSum, CheckSumIn: byte;
  SubChOffset    : byte;

  myChar         : char;
  hasMainCh, hasCRC, isResult, isOmni, isRequest, isParam: Boolean;

begin
  if SerInpStr = '' then
    serprompt(NoErr);
    return;
  endif;
  hasMainCh:= (pos(':', SerInpStr) > 0); // Kanaltrenner-':'
  isRequest:= not (pos('=', SerInpStr) > 0); // Abfrage
  myChar:= SerInpStr[1];
  isOmni:= (myChar = '*');    // Omni-Flag
  isResult:= (myChar = '#');  // Ergebnis-'#'
  if isResult then
    WriteSerInp;
    return;
  endif;
  SerInpPtr:= 1;
  if hasMainCh then
    isParam:= ParseExtract;
    inc(SerInpPtr);
    if isOmni then // Omni-Befehl
      WriteSerInp; // weiterleiten
    else
      CurrentCh:= StrToInt(ParamStr);
    endif;
  endif;
  if (not isOmni) and (CurrentCh <> SlaveCh) and hasMainCh then // nicht für uns
    WriteSerInp;
    return;
  endif;

// Befehl/Parameter ist für uns, ab hier eigentliche Behandlung
// Wenn vorhanden, XOR-Prüfsumme checken, Präfix-"$" zählt nicht mit!
  verbose:= (pos('!', SerInpStr) > 0) OR (pos('?', SerInpStr) > 0); // Ausführliche Antwort erwünscht
  CheckSpos:= pos('$', SerInpStr);
  hasCRC:= CheckSpos > 0; // CheckSumIn-'$'
  if hasCRC then
    ParamStr:= copy(SerInpStr, CheckSpos + 1, 2);
    CheckSumIn:= HexToInt(ParamStr); // erhaltene XOR-Checksumme
    myCheckSum:= 0;
    for i:= 1 to CheckSpos - 1 do
      myChar:= SerInpStr[i];
      myCheckSum:= myCheckSum xor ord(myChar);
    endfor;
    if myCheckSum <> CheckSumIn then
      serprompt(CheckSumErr);
      return;
    endif;
  endif;
//  SerInpStr:=trim(SerInpStr);
  SetSystimer(ActivityTimer, 125);
  LEDactivity:= low;
//Parse einzelnen Befehl

  if ParseExtract then
    SubChOffset:= 0; // direkter SubCh-Aufruf
    CmdWhich:= val;
  else
    CmdWhich:= Cmd2Index; // Klartext übersetzen
    if CmdWhich = err then
      serprompt(SyntaxErr);
      return;
    endif;
    SubChOffset:= Cmd2SubChArr[ord(CmdWhich)];
    isParam:= ParseExtract; // SubCh-Parameter holen
  endif;
  SubCh:= StrToInt(ParamStr) + SubChOffset; //auf neuen SubCh umrechnen

  if isRequest then
    ParseGetParam;
  else
    SerInpPtr:= pos('=', SerInpStr) + 1; // Set-'='
    if ParseExtract then
      Param:= StrToFloat(ParamStr);
      ParamLongInt:= LongInt(Param);
    else
      if CmdWhich >= val then // Befehl benötigt Parameter
        serprompt(ParamErr);
        return;
      endif;
    endif;
    ParseSetParam;
  endif;
end;


