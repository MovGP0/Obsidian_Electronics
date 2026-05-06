program DIV;
(*
Digitalvoltmeter-Modul mit ATmega32 und LTC2400
(c) by c't magazin und Carsten Meyer, cm@ctmagazin.de

22.06.2008 #3.10 Error-Handling an DCG und EDL angepasst, LTC2400-Treiber über SPI
01.02.2008 #3.04 Overload-Ausgabe nur bei SubCh<20
27.11.2007 #3.00 Neue Platine mit ATmega32
27.03.2007 #2.08 Status-Codes eingeführt, Overload, Übermittlung der Bedienelemente
19.03.2007 #2.07 Parser-Syntax #!?, Error-Codes, ALL-Request
06.03.2007 #2.06 Status-Byte-Ausgabe Error, Overload
26.02.2007 #2.05 neue Platine, bis 10V ohne Vorteiler
26.02.2007 #2.03 Busy-Meldung eingeführt, Parser zweigeteilt
23.02.2007 #2.02 Neue SubCh-Belegung, TRG, RNG, VAL ohne Warten
05.02.2007 #1.42 Define für ein- oder zweizeiliges Display
23.01.2007 #1.40 LCD-Anschlus 1x8 Zeichen für Messwertanzeige
12.01.2007 #1.00 neuer Parser
08.10.2006 #0.90 Parser Q&D
18.09.2006 #0.10 erste Implementierung aus Labor-DDS

*)

{$DEFINE Zweizeilig}    //wenn zweizeiliges Display eingesetzt ist

{$DEFINE Parser}         // für Testkompilierung auskommentieren

{ $NOSHADOW}
{$W- Warnings}            {Warnings off}
{$TYPEDCONST OFF}
{$DEBDELAY}

Device = mega32, VCC = 5;

Import SysTick, TWImaster, LCDmultiPort, ADCport, IncrPort4, SerPort;

from System import float;

Define
  ProcClock      = 16000000;        {Hertz}

  TWIpresc       = TWI_BR400;
  LCDmultiPort   = I2C_TWI;
  LCDTYPE_M      = 44780; // 44780 oder 66712;
{$IFDEF Zweizeilig}
  LCDrows_M      = 2;              //rows
{$ELSE}
  LCDrows_M      = 1;              //rows
{$ENDIF}
  LCDcolumns_M   = 8;             //chars per line
  SysTick        = 10;              //msec

  SerPort        = 38400, Stop1, timeout;    {Baud, StopBits|Parity}
  RxBuffer       = 128, iData;
  TxBuffer       = 32, iData;


  StackSize      = $0080, iData;
  FrameSize      = $0120, iData;

  ADCchans       = [3..5], iData;
  ADCpresc       = 64;
  IncrPort4      = PinA, 1, 16; // pin-reg used, channels, 16 or 32bit integer
  IncrScan4      = Timer1, 4; // timer used, scan rate 1kHz (1..100)


Implementation

type

  tCmdWhich = (str, idn, trg, val, rng, dsp, ofs, scl, all,
               trm, trt, trl, erc, sbd, wen, nop, err);

  tError = (NoErr, UserReq, BusyErr, OvlErr, SyntaxErr, ParamErr, LockedErr,ChecksumErr);

{--------------------------------------------------------------}
const


//                              ----SFDC             Strobe,FSync,Data,Clk

  DDRAinit                   = %11100000;  {PortA dir, 0+1=Incr, 2+3+4=ADC }
  PortAinit                  = %00000011;  {PortA }

  DDRBinit                   = %10010000;            {PortB dir }
  PortBinit                  = %10010001;            {PortB, b_STROBE=0 }

  DDRCinit                   = %11111100;  {PortC dir}
  PortCinit                  = %00000011;  {PortC }

{ Jumper und LEDs PortBits }
  DDRDinit                   = %00011100;            {PortD dir, 0..1=Serial }
  PortDinit                  = %11111100;            {PortD }

  BtnInPortReg               = @PinD;   {Taster-Eingangsport}
  LEDOutPort                 = @PortD;   {LED-Port}
  ControlBitPort             = @PortB;   {DDS-Port}

  b_SCLK                     = 7; //Port B, Takt für alle
  b_SDATAIN1                 = 6; //Daten vom LTC2400-1
  b_STRAD24                  = 4; //Strobe-CS für LTC2400 AD 24 Bit


//Lineal     .----.----.----.----.----.----.----.----.----
  Vers1Str                   = '3.10 [DIV by CM/c''t 03/2007] ';     //Vers1
  Vers3Str                   = 'DIV 3.10';    // Kurzform von Vers1

  EEnotProgrammedStr         = 'EEPROM EMPTY! ';
  NoOffsetStr                = 'OFS init ';
  MemorizedStr               = 'Memorizd';
  ErrStrArr      : array[0..7] of String[8] = (
    '[OK]','[SRQUSR]','[BUSY]','[OVRLD]','[CMDERR]','[PARERR]',
    '[LOCKED]','[CHKSUM]');

  FaultStrArr : array[0..3] of String[10] = (
    '[OVRNEG]',
    '[OVRPOS]',
    '[]',
    '[]');

  AdrStr                     = 'Adr ';
  ErrSubCh                   = 255;  // Error- und Status-Ausgabekanal

  DC250mV=0;  DC2V5=1;   DC25V=2;    DC250V=3;
  AC250mV=4;  AC2V5=5;   AC25V=6;    AC250V=7;
  DC250uA=8;  DC25mA=9;  DC2A5=10;   DC10A=11;
  AC250uA=12; AC25mA=13; AC2A5=14;   AC10A=15;

  RangeStrArr: array[0..15] of String[8] = (
    'DC 250mV',    'DC  2.5V',    'DC   25V',    'DC  250V',
    'AC 250mV',    'AC  2.5V',    'AC   25V',    'AC  250V',
    'DC 250uA',    'DC  25mA',    'DC  2.5A',    'DC   10A',
    'AC 250uA',    'AC  25mA',    'AC  2.5A',    'AC   10A');
    
  DigitsArr: array[0..15] of byte = (
    3, 1, 2, 3,   3, 1, 2, 3,  3, 2, 1, 1,   3, 2, 1, 1);
  NachkommaArr: array[0..15] of byte = (
    3, 5, 4, 3,   3, 5, 4, 3,  3, 4, 5, 5,   3, 4, 5, 5);
    
{
  PreAttnDC[@PortA, 5]    : bit;  // DC-Vorteiler HV, 1=on
  Shunt25mA[@PortA, 6]    : bit;  // 1=on
  Shunt2A5[@PortA, 7]    : bit;   // DC-I-Shunt 1=on
}
  RangeArrPortA: array[0..15] of Byte = (
    (%00000000 OR PortAInit),    // DC250mV AD24   Range 0
    (%00000000 OR PortAInit),    // DC2V5
    (%00100000 OR PortAInit),    // DC25V
    (%00100000 OR PortAInit),    // DC250V

    (%00000000 OR PortAInit),    // AC250mV AD24   Range 4
    (%00000000 OR PortAInit),    // AC2V5
    (%00000000 OR PortAInit),    // AC25V
    (%00000000 OR PortAInit),    // AC250V

    (%00000000 OR PortAInit),    // DC250uA        Range 8
    (%01000000 OR PortAInit),    // DC25mA
    (%10000000 OR PortAInit),    // DC2,5A
    (%10000000 OR PortAInit),    // DC10A

    (%00000000 OR PortAInit),    // AC250uA        Range 12
    (%01000000 OR PortAInit),    // AC25mA
    (%10000000 OR PortAInit),    // AC2,5A
    (%10000000 OR PortAInit));   // AC10A
{
  ACon[@PortC, 6]    : bit;       // AC/DC-Umschalter, 1=AC
  Gain10[@PortC, 2]   : bit;      // TRMSC
  Attn200[@PortC, 3]: bit;        // TRMSC
  DCrange25[@PortC, 4]: bit;
  DCrange250[@PortC, 5]: bit;
  ShuntI[@PortC, 7]    : bit;    // 1=on
}
  RangeArrPortC: array[0..15] of Byte = (
   (%00000000 OR PortCInit),    // DC250mV AD24   Range 0
   (%00000000 OR PortCInit),    // DC2V5
   (%00010000 OR PortCInit),    // DC25V
   (%00100000 OR PortCInit),    // DC250V

   (%01000100 OR PortCInit),    // AC250mV AD24   Range 4
   (%01000000 OR PortCInit),    // AC2V5
   (%01001100 OR PortCInit),    // AC25V
   (%01001000 OR PortCInit),    // AC250V

   (%10000000 OR PortCInit),    // DC250uA        Range 8
   (%10000000 OR PortCInit),    // DC25mA
   (%10000000 OR PortCInit),    // DC2,5A
   (%10000000 OR PortCInit),    // DC10A

   (%11000100 OR PortCInit),    // AC250uA        Range 12
   (%11000100 OR PortCInit),    // AC25mA
   (%11000100 OR PortCInit),    // AC2,5A
   (%11000100 OR PortCInit));   // AC10A

  CmdStrArr      : array[0..15] of String[3] = (
    'STR', // 255 = Status,
    'IDN', // 254 = Identifikation, ohne Parameter
    'TRG', // 249 = man. Trigger
    'VAL', //   0 = letzter AD24-Wert, 1/2 = AD24 integriert, 3 = AD24 mit Warten auf neuen Wert
    'RNG', //  19 = 16 Bereiche 0..15
    'DSP', //  80 = Display-Parameter
    'OFS', // 100 = Offsets      0..15 AD24, 20..35 AD10 je 16 Bereiche
    'SCL', // 200 = Skalierungen 0..15 AD24, 20..35 AD10 je 16 Bereiche
    'ALL',
    'TRM', // 240 = Trigger-Mode 0..7
    'TRT', // 247 = Auto-Trigger-Timing in ms, 0=aus
    'TRL', // 248 = Trigger-Edge-Level 0=neg, 1=pos. auf PB2 (INT2)
    'ERC', // 251 = ErrCount seit letztem Reset
    'SBD', // 252 = SerBaud UBRR-Register mit U2X=1
    'WEN', // 250 = Write Enable EEPROM-Parameter
    'NOP');   //2 Parameter

  Cmd2SubChArr   : array[0..15] of byte = (
  255, 254, 249, 0, 19, 80,
  100, 200, 99, 240, 247, 248, 251, 252, 250, 0);   // Offsets bei SubCh 100, Skalierungen bei 200

  high                       = true;
  low                        = false;

//Default-EEPROM-Werte:
{$EEPROM}
structconst
  dummy: Integer=0;
  
// 1/2^24, korrigiert bei DC Fehler durch ADC-Spannungsteiler   16777216, 8388608
  RangeArray24: array[0..15] of float =
  (
  250.0/8388608,    // DC250mV AD24   Range 0
  2.5/8388608,      // DC2V5
  25.0/8388608,     // DC25V
  250.0/8388608,    // DC250V

  250.0/8388608,    // AC250mV AD24   Range 4
  2.5/8388608,      // AC2V5
  25.0/8388608,     // AC25V
  250.0/8388608,    // AC250V

  250.0/8388608,    // DC250uA        Range 8
  25.0/8388608,     // DC25mA
  2.5/8388608,      // DC2,5A
  2.5/8388608,      // DC10A

  250.0/8388608,    // AC250uA        Range 12
  25.0/8388608,     // AC25mA
  2.5/8388608,      // AC2,5A
  2.5/8388608       // AC10A
  );

  RangeArray10: array[0..15] of float =
  (
  250.0/512,        // DC250mV AD10    Range 0
  2.5/512,          // DC2V5   2,5/512
  25.0/512,         // DC25V
  250.0/512,        // DC250V

  250.0/1024,       // AC250mV AD10   Range 4
  25.0/1024,        // AC2V5
  2.5/1024,         // AC25V
  2.5/1024,         // AC250V

  250.0/512,        // DC250uA        Range 8
  25.0/512,         // DC25mA
  2.5/512,          // DC2,5A
  2.5/512,          // DC10A

  250.0/1024,       // AC250uA        Range 12
  25.0/1024,        // AC25mA
  2.5/1024,         // AC2,5A
  2.5/1024          // AC10A
  );

  OffsetArray24    : array[0..15] of LongInt =
 (0, 0, 0, 0,    // 0..3   Offset AD24 DC U
  0, 0, 0, 0,    // 4..7   Offset AD24 AC U
  0, 0, 0, 0,    // 8..11  Offset AD24 DC I
  0, 0, 0, 0);   // 12..15 Offset AD24 AC I

  OffsetArray10    : array[0..15] of LongInt =
 (0, 0, 0, 0,    // 0..3   Offset AD10 DC U
  0, 0, 0, 0,    // 4..7   Offset AD10 AC U
  0, 0, 0, 0,    // 8..11  Offset AD10 DC I
  0, 0, 0, 0);   // 12..15 Offset AD10 AC I

  ScaleArray24     : array[0..15] of Float =
 (1, 1, 1, 1,    // Skalierung AD24 DC U
  1, 1, 1, 1,    // Skalierung AD24 AC U
  1, 1, 1, 1,    // Skalierung AD24 DC I
  1, 1, 1, 1);   // Skalierung AD24 AC I

  ScaleArray10     : array[0..15] of Float =
 (1, 1, 1, 1,    // Skalierung AD10 DC U
  1, 1, 1, 1,    // Skalierung AD10 AC U
  1, 1, 1, 1,    // Skalierung AD10 DC I
  1, 1, 1, 1);   // Skalierung AD10 AC I

  InitIncRast:Integer = 4;    // 4 für Segor-Encoder, 2 für Panasonic
  InitLCDintegrate:byte=1;
  InitRange:byte=2;
  TrigTimerValue:Word=0;
  TrigMask:byte=0;       //Bit0=TrigMaskAD24, 1=TrigMaskAD10RMS, 2=TrigMaskAD10peak
  TrigLevel:byte =0;
  EEinitialised:word=$AA55;
  OffsetInitialised:word=$0000;

{--------------------------------------------------------------}

var
{$EEPROM}

{$DATA} {Schnelle Register-Variablen}
  i, j   : byte;
  k              : byte;  // k in HW-Prozess benutzt
  m              : byte;

{$IDATA}  {Langsamere SRAM-Variablen}
  aWord: Word;
  
  SlaveCh        : byte;
  LEDactivity[LEDOutPort, 2]      : bit;
  LEDtrigger[LEDOutPort, 3]    : bit;  // Trigger-Anzeige
  LEDaux[LEDOutPort, 3]      : bit;

  SCLK[@PortB, b_SCLK]       : bit; //Takt für alle
  STRAD24[@PortB, b_STRAD24] : bit; //Strobe für LTC2400
  SDATAIN1[@PinB, b_SDATAIN1]: bit; //Dateneingang vom LTC2400


  PreAttnDC[@PortA, 5]    : bit;  // DC-Vorteiler HV, 1=on
  ACon[@PortC, 6]    : bit;       // AC/DC-Umschalter, 1=AC
  DCrange25[@PortC, 4]: bit;
  DCrange250[@PortC, 5]: bit;
  ACGain10[@PortC, 2]   : bit;      // auch TRMSC
  Shunt2A5[@PortA, 7]    : bit;   // DC-I-Shunt 1=on
  Shunt25mA[@PortA, 6]    : bit;  // 1=on
  ShuntI[@PortC, 7]    : bit;    // 1=on
  DCGain10[@PortD, 4]   : bit;      // auch TRMSC

  ButtonTemp: Byte; // invertiert - low=on!
  ButtonLeft[@ButtonTemp, 5]  : bit;
  ButtonRight[@ButtonTemp, 4]  : bit;
  ButtonEnter[@ButtonTemp, 3]  : bit;
//Parametern für externen und internen ADC
//  ValueAD24,ValueAD10: Float;

  CmdWhich       : tCmdWhich;
  SubCh, CurrentCh     : byte;
  ChangedFlag,
  OmniFlag, verbose: boolean;
  Digits, Nachkomma: byte;
  Param          : Float;
  ParamLongInt       : LongInt;
  Parambyte[@ParamLongInt] : Byte;
  SerInpStr      : String[63];
  SerInpPtr:byte;
  
//  AD24IntegrateMode:byte; //0=Off, 1=Fast, 2=Slow, (3=Auto)
  AD24, AD24temp, AD24tempSI, AD24tempFI,
  AD24Integrate0, AD24Integrate1,AD24Integrate2,AD24Integrate3 : LongInt;
  AD24_0[@AD24temp]:byte;   // für vereinfachtes Einlesen 4 Bytes vom LongInt
  AD24_1[@AD24temp+1]:byte;
  AD24_2[@AD24temp+2]:byte;
  AD24_3[@AD24temp+3]:byte;
  AD24ready, AD10ready, AbortFlag: boolean;
  AD10           : Integer;
  Range, OldRange: byte;
  RangeTemp:byte;
  AutoRangeMode, OldRangeMode: Boolean;
//  RangeCommand, RangeReturn :byte;
  TrigTimer: Systimer;
  ActivityTimer,
  IncrTimer,DisplayTimer, TrigLEDtimer:Systimer8;
  LCDpresent: boolean;
  LCDintegrate: byte;
  Trigger:Boolean;

  IncrValue,OldIncrValue: Integer;
  IncrEnter,FirstTurn:Boolean;
  IncrDiff,IncRast:Integer;
  IncrDiffByte:Byte;

//für Parser
  ParamStr:string[40]; // auch für Display

//Bit0=TrigMaskAD24, 1=TrigMaskAD10RMS, 2=TrigMaskAD10peak
  TrigMaskTemp: Byte;
  TrigMaskAD24[@TrigMaskTemp, 0]  : bit;
  TrigMaskAD10RMS[@TrigMaskTemp, 1]  : bit;
  TrigMaskAD10peak[@TrigMaskTemp, 2]  : bit;

// ausgegebene Status-Meldung, Bits 0..3 = Fehler oder Overload-Kanal
  Status:byte;  // 0..3 Fehler/Button-Nummer
  BusyFlag[@Status, 7]  : bit;
  UserSRQFlag[@Status, 6]  : bit;
  OverloadFlag[@Status, 5]  : bit;
  EEUnlocked[@Status, 4]  : bit; // EEPROM-unlocked-Flag

  FaultFlags, ButtonNumber:byte;
  OverNeg[@FaultFlags, 0]  : bit;
  OverPos[@FaultFlags, 1]  : bit;

  FaultTimerByte:Byte;
  ErrCount:integer;
  ErrFlag, NegativeFlag, OverVoltFlag:boolean;
  CheckLimitErr: tError;

{$NOSAVE}

{###########################################################################}
//EEPROM-Routinen und sonstige

procedure PatchCopyFromEE;
//AktuelleFrequenz und Settings aus EEPROM holen
var myPatchAdr: Word;
begin
  IncRast:=InitIncRast;
  LCDintegrate:=InitLCDintegrate;
  Range:=InitRange;
end;


{###########################################################################}

{$I DIV-HW.pas}

function isACrange:boolean;

begin
  if Range in [AC250mV..AC250V, AC250uA..AC10A] then
    return(true);
  else
    return(false);
  endif;
end;


procedure ParamScale10;
//Param mit Offset und Skalierung berechnen, AD10
begin
  m:=ord(Range);
  Param:= Float(LongInt(AD10) + OffsetArray10[m]);
//Param mit Skalenfaktoren 0.1 .. 100 versehen
  Param:= Param*RangeArray10[m]*ScaleArray10[m];   // Achtung, m ist hier noch ord(Range)
  if isACrange then
    Param:= abs(Param);
  endif;
end;

procedure ParamScale24;
//Param mit Offset und Skalierung berechnen, AD24
begin
  m:=ord(Range);
  Param:= Float(AD24 + OffsetArray24[m]);
//Param mit Skalenfaktoren 0.1 .. 100 versehen
  Param:= Param*RangeArray24[m]*ScaleArray24[m];   // Achtung, m ist hier noch ord(Range)
  if isACrange then
    Param:= abs(Param);
  endif;
end;

procedure GetAD10(myChannel:Byte);  // <Param> vom internen ADC holen, Offset je nach Kanal
var ADtemp: Integer;
begin
  OverPos:= false;
  OverNeg:= false;
  if myChannel=5 then  // DCmid direkt vom OpAmp
    AD10:= Integer(getADC(myChannel));  //DC-Kanal mit bipolar-Bias
    if AD10 >= 1022 then
      OverPos:= true;
    endif;
    if AD10 = 0 then
      OverNeg:= true;
    endif;
    AD10:= AD10 - 512; // FS/2 bipolar-Bias abziehen
  else
    AD10:= Integer(getADC(myChannel)); // AC-Kanäle
    if AD10 >= 1022 then
      OverPos:= true;
    endif;
  endif;
  OverLoadFlag:=OverPos or OverNeg;
end;

procedure GetAD24(myIntMode:Byte);  // AD24 vom externen ADC LTC2400 holen
//Negative- und OverloadFlag ggf. vom IRQ gesetzt
var myAD24:LongInt;
begin
  disableInts;
  OverPos:= OverVoltFlag;
  OverNeg:= NegativeFlag;
  OverLoadFlag:=OverPos or OverNeg;
  case myIntMode of
    1:
      myAD24:=AD24tempFI;
      |
    2:
      myAD24:=AD24tempSI;
      |
  else
    myAD24:=AD24temp;
  endcase;
  enableInts;
  AD24:= myAD24 - $800000; // FS/2 abziehen bei DC
  if isACrange and (AD24<0) then // DC-Bereiche
    AD24:= 0;
  endif;
end;

procedure WaitAD10;  // Warte auf Ergebnis von ADC3
begin
  AD10ready := false;
  repeat
  until AD10ready; // vom IRQ gesetzt
end;

procedure WaitAD24;  // Warte auf Ergebnis von ADC24
begin
  AD24ready:=false;
  repeat
  until AD24ready; // vom IRQ gesetzt
end;

procedure IntegrateReset;  //Integrationswerte zurücksetzen
begin
  disableInts;
  AD24temp:=$800000;
  AD24Integrate0:=AD24temp;
  AD24Integrate1:=AD24temp;
  AD24Integrate2:=AD24temp;
  AD24Integrate3:=AD24temp;
  enableInts;
end;


procedure SwitchRange;
// Range-Relais und LEDs anhand RANGE einschalten, Bit-Werte in Tabellen
begin
  digits:=DigitsArr[Range];
  nachkomma:=NachkommaArr[Range];
  if (Range=OldRange) then
    return;
  endif;
  OldRange:=Range;
  PortA:=RangeArrPortA[Range];
  PortC:=RangeArrPortC[Range];
  DCGain10:=(Range in [DC250mV, DC250uA..DC10A]);
  IntegrateReset;
end;

{###########################################################################}

//allg. Menü-Prozeduren

procedure SerCRLF;
begin
  Serout(#$0D);
  Serout(#$0A);
end;

procedure WriteChPrefix;
begin
  Serout('#');
  Serout(char(SlaveCh+48));
  Serout(':');
  write(Serout, ByteToStr(SubCh));
  Serout('=');
end;

procedure WriteSerInp;
begin
  write(Serout, SerInpStr);   // Befehl weiterreichen
  SerCRLF;
end;

procedure SerPrompt(myErr:tError);
var myFault, myStatus:Byte;
//Error-Meldung und Status-Request-Antwort,
//Status Bit 7=Busy, 6=UserSRQ, 5=OverLoad, 4=WriteEnable, 3..0=Fault/Error
begin
  SubCh:=ErrSubCh; // Fehler-Kanal
  WriteChPrefix;
  if myErr = UserReq then
    myStatus:=Status or ButtonNumber or 64;
  else
    if myErr = OvlErr then
      myStatus:=Status or FaultFlags;
    else
      myStatus:=Status or ord(myErr);
      if myErr <> noErr then
        inc(ErrCount);
      endif;
    endif;
  endif;
  write(Serout, ByteToStr(myStatus));
  if FaultFlags <> 0 then
    myFault:=FaultFlags;
    for i := 0 to 3 do
      if (myFault and 1) = 1 then
        Serout(#32);
        write(serout,FaultStrArr[i]);
      endif;
      myFault:=myFault shr 1;
    endfor;
  else
    Serout(#32);
    write(serout,ErrStrArr[ord(myErr)]);
  endif;
  SerCRLF;
end;


{###########################################################################}

procedure ParamToStr(toLCD:boolean);
// Param in ParamStr ASCII-String wandeln
var myFloat:float;
begin
  digits:=7;
  nachkomma:=nachkommaArr[Range];
  myfloat:=abs(Param);
  if not toLCD then
    digits:=digits+2;
    nachkomma:=nachkomma+2;
  endif;
  ParamStr:=FloatToStr(myfloat:digits:nachkomma:'0');
  if toLCD then
    if Param<0 then
      insert('-',ParamStr,1);
    else
      if isACrange then
        insert(#3,ParamStr,1);
      else
        insert('+',ParamStr,1);
      endif;
    endif;
  else
    if Param<0 then
      insert('-',ParamStr,1);
    endif;
  endif;
end;

procedure ShowRange;
begin
{$IFDEF Zweizeilig}
  LCDxy_M(LCD_m1, 0, 1);
  if IncrEnter then
    write(lcdout_m,MemorizedStr);
    SetSystimer(DisplayTimer, 100);
  else
    write(lcdout_m,RangeStrArr[ord(Range)]);
  endif;
  IncrEnter:=false;
{$ENDIF}
end;

procedure WriteParamLCD;
begin
  ParamToStr(true);
  append('00000',ParamStr);
  setlength(ParamStr,8);
  LCDxy_M(LCD_m1, 0, 0);
  if OverloadFlag then
    write(lcdout_m,'OVERLOAD');
  else
    write(lcdout_m,ParamStr);
  endif;
end;

{###########################################################################}

procedure WriteParamSer(Ovl : boolean);
begin
  WriteChPrefix;
  ParamToStr(false);
  if Ovl and (SubCh<20) then
    ParamStr:='-9999 [OVERLD]';
  else
    ParamToStr(false);
  endif;
  write(serout,ParamStr);
  if (not ovl) and (SubCh<20) then
  // für Ausgabe "skalieren" durch Anhängen des Exponenten
    case Range of
      DC250mV, AC250mV, DC25mA, AC25mA:
        write(serout,'E-3');
        |
      DC250uA, AC250uA:
        write(serout,'E-6');
        |
    endcase;
  endif;
  SerCRLF;
end;

procedure WriteParamLongIntSer;
var ParamStr: String[15];
begin
  WriteChPrefix;
  ParamStr:= LongToStr(ParamLongInt);
  ParamStr:= trim(ParamStr);
  write(Serout, ParamStr);
  SerCRLF;
end;

function Checklimits:boolean;
// liefert TRUE wenn "Out of Range"
var myBool: Boolean;
begin
  myBool:=false;
  CheckLimitErr:=noErr;
  if Range>127 then  // Byte!
    Range:=0;
    myBool:=true;
    CheckLimitErr:=ParamErr;
  endif;
  if Range>15 then  // Byte!
    Range:=15;
    myBool:=true;
    CheckLimitErr:=ParamErr;
  endif;
  return(myBool);
end;

{###########################################################################}
{$I DIV-Parser.pas}

procedure CheckSer;
var
myChar: char;
begin
  while SerInp_TO(myChar,2) do // 20 ms Timeout
//    serout(mychar); // Echo Character
    if myChar in [#32..#127] then // nur 7-Bit-ASCII ohne Controls
      append(myChar,SerInpStr);
    endif;
    if mychar=#8 then // Backspace
      setlength(SerInpStr, length(SerInpStr)-1);
    endif;
    if myChar=#13 then
      ParseSubCh;           //Befehl interpretieren, wenn für uns
      SerInpStr:='';
    endif;
  endwhile;
//  Chores;
  OverPos:= OverVoltFlag;
  OverNeg:= NegativeFlag;
  OverLoadFlag:=OverPos or OverNeg;
  if FaultTimerByte = 0 then  // regelmäßig ausgeben, wenn Fehler
    if FaultFlags<>0 then
      SerPrompt(OvlErr);
    endif;
    FaultTimerByte := 20;
  endif;
  dec(FaultTimerByte);
end;

procedure CheckDelay(myDelay:byte);
// Delay mit serieller Abfrage in 20-ms-Schritten
var mycount:byte;
begin
  for mycount:=1 to mydelay do
    CheckSer;
  endfor;
end;

procedure BlinkDelay(myDelay:byte);
// Delay mit serieller Abfrage in 20-ms-Schritten
var mycount:byte;
begin
  for mycount:=0 to mydelay do
    mdelay(100);
    LEDactivity:= not LEDactivity;
  endfor;
end;

{###########################################################################}

procedure initall;
//nach Reset aufgerufen
begin
  DDRA:=  DDRAinit;            {PortA dir}
  PortA:= PortAinit;           {PortA}
  DDRB:=  DDRBinit;            {PortB dir}
  PortB:= PortBinit;           {PortB}
  DDRC:=  DDRCinit;            {PortC dir}
  PortC:= PortCinit;           {PortC}
  DDRD:=  DDRDinit;            {PortD dir}
  PortD:= PortDinit;           {PortD}

//  ADMUX:= ADMUX OR %11000000;  {Internal ADC Reference ON}

  PatchCopyFromEE;       // Optionen-Defaults

  SlaveCh:= (not PinD) shr 5;
  LEDactivity:= low;
  if LCDsetup_M(LCD_m1) then
    LCDcursor_M(LCD_m1, false, false);
    LCDCharSet_M(LCD_m1, #0, $01, $03, $07, $0F, $07, $03, $01, $00); {"<" Cursor}
    LCDCharSet_M(LCD_m1, #1, $01, $03, $05, $09, $05, $03, $01, $00); {"<" Cursor hohl}
    LCDCharSet_M(LCD_m1, #2, $01, $02, $05, $0A, $05, $02, $01, $00); {"<" Cursor IncrValeinstellung}
    LCDCharSet_M(LCD_m1, #3, $00, $00, $08, $15, $02, $00, $00, $00); {"~" AC-Symbol}

    LCDpresent:=true;
    write(lcdout_m,Vers3Str);
    LCDxy_M(LCD_m1, 0, 1);
    write(lcdout_m,AdrStr);
    lcdout_m(char(SlaveCh+48));
  endif;
  mdelay(1000);
  if SlaveCh>0 then
    for i := 0 to SlaveCh-1 do
      LEDactivity:= not LEDactivity;
      mdelay(150);
      LEDactivity:= not LEDactivity;
      mdelay(150);
    endfor;
  endif;
  LEDactivity:= high;
  
  GICR:=GICR or %00100000; // INT2-Pin Int Enable
  if TrigLevel=0 then
    MCUCSR:=MCUCSR and %10111111; //ISC2:=false; Negative Edge
  else
    MCUCSR:=MCUCSR or %01000000; //ISC2:=true; Positive Edge
  endif;

  EnableInts;
// Begrüßungsmeldung
  SubCh:=254;
  WriteChPrefix;
  write(Serout, Vers1Str);
  if EEinitialised <> $AA55 then
    write(Serout, EEnotProgrammedStr);
    if LCDpresent then
      LCDxy_M(LCD_m1, 0, 1);
      write(lcdout_m, EEnotProgrammedStr);
    endif;
  endif;
  if OffsetInitialised <> $AA55 then
    write(Serout, '[OFS INIT]');
    SerCRLF;
    BusyFlag:=true;
    SerPrompt(BusyErr);
  endif;
  OldRange:= 16;
  AutoRangeMode:=false;
  OldRangeMode:= true;
  SwitchRange;
  while serstat do
    i:= SerInp;
  endwhile;
  IncrCount4start;
  SetIncrVal4(0,0);
  IncrValue:=GetIncrVal4(0);
  OldIncrValue:= IncrValue;
  IncrDiff:=0;
  IncrEnter:=false;
  IntegrateReset;
  if LCDpresent then
    ButtonTemp := (LCDportInp_M(LCD_m1) or %11000111);
  else
    ButtonTemp :=$ff;
  endif;
  if (not ButtonEnter) or (OffsetInitialised <> $AA55) then
    Range:=DC250V;
    SwitchRange;
    ShuntI:=true;  // Eingang kurzgeschlossen
    BlinkDelay(10);
    LCDxy_M(LCD_m1, 0, 0);
    write(lcdout_m, NoOffsetStr);
    BlinkDelay(10);
    LCDxy_M(LCD_m1, 0, 1);
    LCDclrEOL_m(LCD_m1);
    lcdout_m(#$A5); // mittiger Punkt
    for Range:= DC250V downto DC250mV do
      SwitchRange;
      ShuntI:=true;  // Eingang kurzgeschlossen
      BlinkDelay(30);
      if Range= DC250mV then
        BlinkDelay(20);
      endif;
      lcdout_m(#$A5); // mittiger Punkt
      SerPrompt(BusyErr);
      disableInts;
      OffsetArray24[Range]:=$800000-AD24tempFI;
      enableInts;
    endfor;
    Range:=DC10A;
    SwitchRange;
    BlinkDelay(50);
    lcdout_m(#$A5); // mittiger Punkt
    disableInts;
    for Range:= DC10A downto DC250uA do
      OffsetArray24[Range]:=$800000-AD24tempFI;
    endfor;
    enableInts;
    SerPrompt(BusyErr);
    Range:=DC250V;
    SwitchRange;
    ShuntI:=true;  // Eingang kurzgeschlossen
    BlinkDelay(30);
    lcdout_m(#$A5); // mittiger Punkt
    SerPrompt(BusyErr);
    BlinkDelay(30);
    lcdout_m(#$A5); // mittiger Punkt
    disableInts;
    for Range:= AC10A downto AC250uA do
      OffsetArray24[Range]:=$800000-AD24tempFI;
    endfor;
    for Range:= AC250V downto AC250mV do
      OffsetArray24[Range]:=$800000-AD24tempFI;
    endfor;
    enableInts;
    OffsetInitialised := $AA55;
    BusyFlag:=false;
    SerPrompt(NoErr);
  endif;
  LEDactivity:=high;
  Range:=InitRange;
  SwitchRange;
  CurrentCh:=255; // erstmal keine Reaktion
  FirstTurn:=true;
end;

{###########################################################################}


begin
  Initall;
//Hauptschleife
  loop
    CheckSer;  // Serinp parsen
//    LEDOVL:=not OverloadFlag;
    if isSystimerZero(ActivityTimer) then
      LEDactivity:=high; // LED aus
    endif;
    if issysTimerzero(TrigTimer) then  // Auto-Trigger
      aWord:=TrigTimerValue;
      if aWord<>0 then
        Trigger:=True;
        aWord:=aWord div 10;
        setsystimer(TrigTimer,aWord);
      endif;
    endif;
    if Trigger then  // externer oder Auto-Trigger
      TrigMaskTemp:=TrigMask;
      if TrigMaskTemp<>0 then
        setsystimer(TrigLEDTimer,15);
        LEDTrigger:=low;
        if TrigMaskAD24 then
          SubCh:=0;
          ParseGetParam;
        endif;
        if TrigMaskAD10RMS then
          SubCh:=10;
          ParseGetParam;
        endif;
        if TrigMaskAD10peak then
          SubCh:=11;
          ParseGetParam;
        endif;
      endif;
      Trigger:=false;
    endif;
    if LCDpresent and (not Serstat) then
      IncrValue:=GetIncrVal4(0);
// Inkrementalgeber löst in Zweierschritten auf, deshalb der Umstand
      if (IncrValue<>OldIncrValue) then
        SetSystimer(ActivityTimer, 25);
        LEDactivity:=low;
        IncrDiff:=IncrDiff + integer(IncrValue-OldIncrValue);
        OldIncrValue:= IncrValue;
        SetSystimer(IncrTimer, 20);
        if abs(IncrDiff)>= IncRast then // erst wenn n Impulse gezählt
          ChangedFlag:=true;
          BusyFlag:=true;
          IncrDiff:=IncrDiff div IncRast;
          IncrDiffByte:=byte(IncrDiff);    // Byte ohne Beschleunigung
{$IFNDEF Zweizeilig}
          SetSystimer(DisplayTimer, 75); // für kurze Messbereichs-Anzeige
{$ENDIF}
          if FirstTurn then
             ButtonNumber:=4; // Button Inkrementalgeber
             serprompt(UserReq);
          endif;
          Range:=Range+IncrDiffByte;
          IncrDiff:=0; // für nächsten Durchlauf
          CheckLimits;
          SubCh:=9;
          ParseGetParam; // Parameter am Panel geändert, ausgeben
          SwitchRange;
          ShowRange;
          FirstTurn:=false;
        endif;
      endif;
      // Checkdelay(1); // nur wichtig für Beschleunigungsfunktion
      ButtonTemp := (LCDportInp_M(LCD_m1) or %11000111);
      if ButtonTemp <> $FF then
        if not ButtonEnter then
            IncrEnter:=true;
            InitRange:=Range;
            ButtonNumber:=3; // Button Enter
            serprompt(UserReq);
        else
          if not ButtonLeft then
            dec(Range);
            AutoRangeMode:=false;
            ButtonNumber:=1; // Button Down
            serprompt(UserReq);
          endif;
          if not ButtonRight then
            ButtonNumber:=2; // Button Up
            serprompt(UserReq);
            inc(Range);
            AutoRangeMode:=false;
          endif;
          CheckLimits;
        endif;
        SubCh:=19;
        ParseGetParam; // Parameter am Panel geändert, ausgeben
        SwitchRange;
        ShowRange;
        repeat
          ButtonTemp := (LCDportInp_M(LCD_m1) or %11000111);
          Checkdelay(1);
        until ButtonTemp = $FF;
        ButtonNumber:=0; // kein Button, freigegeben
        serprompt(UserReq);
      endif;
    endif;
    if isSystimerZero(TrigLEDtimer) then
      LEDtrigger:=high;
    endif;
    if isSystimerZero(DisplayTimer) then
      if not FirstTurn then
        ButtonNumber:=0; // kein Button, freigegeben
        serprompt(UserReq);
      endif;
      FirstTurn:=true;
      BusyFlag:=false;
      SetSystimer(DisplayTimer, 25);
      if LCDpresent then
        GetAD24(LCDintegrate); // LCD ggf. integrieren
        ParamScale24;
        WriteParamLCD;
        ShowRange;
      endif;
    endif;
  endloop;
end DIV.

