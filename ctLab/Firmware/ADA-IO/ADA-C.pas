program ADAC;
(*
AD/DA-Messystem mit ATmega32
(c) by c't magazin und Carsten Meyer, cm@ctmagazin.de
18.05.2010 #1.742 Initialisierung Port Inversion auf 0 hinzugefügt,
                  dämlichen Bug aus 1.741 entfernt (war UNIC-Test)
17.02.2010 #1.741 kleinen Bug in Panel-Ausgabe Ports behoben
10.02.2010 #1.74 IO8-32 Init geändert: VAL 40 bis 47 (DIRs) ohne WEN änderbar,
                 PortInits und PortDirInits jetzt als OPT 3X, OPT 4X
22.01.2010 #1.735 SR4094-Routine 4 Bytes statt I2C wenn kein IO8-32 erkannt
07.11.2009 #1.734 I2C-InitPort auf OPT 10..17 (160..167),
                  DDR-Init bei IO8/32 PortWrite entfernt
20.02.2008 #1.733 IDN-String gekürzt
09.09.2007 #1.73 ADC10-Wandlung verbessert, OnSysTick angepasst, Systick auf 2 ms
10.08.2007 #1.70 PM8: nichtbenutzte SubCh werden übersprungen, PIO einstellbar über Drehgeber
09.08.2007 #1.65 DA- und AD-Wandlung im Interrupt umgestellt wg. Crosstalk
28.07.2007 #1.64 Dicken Bug bei der AD16-8-Leseroutine beseitigt (Sprünge im Null-Bereich)
23.07.2007 #1.63 DSP-Parameter für Panel, Test-Parameter 253 eingeführt
                 Parser geändert: Request wenn kein "=", ausf. Response nur mit "?" oder "!"
20.07.2007 #1.53 Impulse pro Rastpunkt einstellbar über SubCh 89
18.07.2007 #1.52 PM8-Panel-Unterstützung mit Modify-Möglichkeit DA-Werte, Textanzeige
16.07.2007 #1.50 Skalierungen für Wandler in EEPROM-Bereich
20.06.2007 #1.491 Zuverlässigkeit I/O-Ports erhöht durch DDR-Beschreiben vor den Portzugriff
13.06.2007 #1.49 Backspace-Edit, LTC1655- und LM75-Support, I2C-Generic
25.05.2007 #1.38 Trigger-Input PB2, Trigger-Masken, Trigger-Level, Ext. Ref
21.05.2007 #1.28 HW-Routinen gestrafft, AD24 entfernt, LCD 4x16
30.04.2007 #1.18 EEPROM-UnLocked Status eingeführt
25.03.2007 #1.08 Neuer Parser
25.02.2007 #1.03 Überarbeitung für Panel-Anschluss
12.01.2007 #1.02 neuer Parser
18.09.2006 #0.10 erste Implementierung aus Labor-DDS

*)

{$DEFINE Parser} // für Testkompilierung auskommentieren
{$DEFINE Panel}  // Bedien-Panel vorhanden, mit IncrPort
// WICHTIG: Dann sind AD10-0 und AD10-1 durch IncrPort belegt und nicht benutzbar


{ $NOSHADOW}
{$W- Warnings}            {Warnings off}
{$TYPEDCONST OFF}
{$DEBDELAY}

//Defines aktivieren durch Entfernen des 1. Leerzeichens!



Device = mega32, VCC = 5;

Import SysTick, ADCport, TWImaster, LCDmultiPort, SerPort, I2CExpand;  //
{$IFDEF Panel}
Import IncrPort4;
{$ENDIF}

from System import float;

Define
  ProcClock      = 16000000;        {Hertz}


  TWIpresc       = TWI_BR400;
  LCDmultiPort   = I2C_TWI;
  LCDTYPE_M      = 44780; // 44780 oder 66712;
  LCDrows_M      = 2;              //rows
  LCDcolumns_M   = 8;             //chars per line
{$IFDEF Panel}
  IncrPort4      = PinA, 1, 32; // pin-reg used, channels, 16 or 32bit integer
  IncrScan4      = Timer1, 4; // timer used, scan rate 1kHz (1..100)
{$ENDIF}


  SysTick        = 2;              //msec
  SerPort        = 38400, Stop1, timeout;    {Baud, StopBits|Parity}
  RxBuffer       = 255, iData;
  TxBuffer       = 255, iData;
  StackSize      = $0080, iData;
  FrameSize      = $0100, iData;

 // jetzt von getacd10() erledigt
  ADCchans = 8, iData;
  ADCpresc = 64;

  I2Cexpand = I2C_TWI, $38; {use TWIport, 9554A}
  I2CexpPorts = Port0,Port1,Port2,Port3,Port4,Port5,Port6,Port7;

Implementation

type
  tCmdWhich = (trg, str, idn, erc,    // auch ohne Argument
               val,ofs,scl,raw,pio,dir,dsp,all,opt,
               trm,trt,trl,icb,icw,ics,ict,ica,ref,wen,sbd,nop,err);
  tError = (NoErr, UserReq, BusyErr, OvlErr, SyntaxErr, ParamErr, LockedErr,ChecksumErr);

{--------------------------------------------------------------}
const

{ PortBits }

  DDRBinit                   = %01011011;            {PortB dir, PB2=TRIG }
  PortBinit                  = %10111111;            {PortB}

//JTAG-Fuses disablen, sonst PortC nur teilweise Funktion!
  DDRCinit                   = %11111100;            {PortC dir }
  PortCinit                  = %00000011;            {PortC Multiplexer PC2..PC5}

  DDRDinit                   = %00001100;            {PortD dir }
  PortDinit                  = %11111100;            {PortD }

  LEDOutPort                 = @PortD;   {LED-Port}

  b_SCLK                     = 0; //Port B, Takt für alle
  b_SDATAOUT                 = 1; //Daten für alle
  b_TRIG                     = 2; //Trigger-Eingang neg. Puls
  b_STRDAC                   = 3; //Strobe-Load für alle DA-Wandler
  b_STRAD16                  = 4; //Strobe-CS für LTC1864 AD 16 Bit
  b_SDATAIN1                 = 5; //AD Data
  b_STR_SR                   = 6; //Strobe für 4094-SR
  b_SENSE                    = 7; //Sense-Pin für Karten-Merkmal
  ControlBitPort             = @PortB;   {DDS-Port}
  ControlBitPin              = @PinB;   {DDS-Port}
  b_STRDAMUX                 = 5; //PC5 Strobe für Multiplexer/SH, PC2..PC4=Kanal


//Lineal     .----.----.----.----.----.----.----.----.----
  Vers1Str                   = '1.742 [ADA by CM/c''t 04/2007; ';    //Vers1
  Vers3Str                   = 'ADA 1.74';
  AdrStr                     = 'Adr ';
  CardsStr                   = 'IO-Cards';
  ValueStr                   = 'Value ';
  EEnotProgrammedStr         = 'EEPROM EMPTY! ';
  ErrStrArr      : array[0..7] of String[9] = (
    '[OK]','[SRQUSR]','[BUSY]','[OVERLD]','[CMDERR]','[PARERR]','[LOCKED]','[CHKSUM]');

  DAC12str                   = 'DA12 ';
  DAC16str                   = 'DA16 ';
  ADC16str                   = 'AD16 ';
  LCDstr                     = 'LCD ';
  IO816str                   = 'IO32 ';
  EggStr                   = '28.5 [Michaela, ich liebe dich!]';    //EGG

  ErrSubCh                   = 255;
  CmdStrArr: array[0..24] of String[3] = (
  'TRG', // 249 = manuelle Trigger-Auslösung
  'STR', // 255 = Status,
  'IDN', // 254 = Identifikation ohne Parameter
  'VAL', // 0 = Value
  'OFS', // 100 = Offsets
  'SCL', // 200 = Skalierungen
  'RAW', // 50 = Roh-AD-Werte
  'PIO', // 30 = Ports I/O
  'DIR', // 40 = Ports Datenrichtung
  'DSP', // 80 = Display-Parameter
  'ALL', // 95..99 = Alle Werte, Liste
  'OPT', // 150...197
  'TRM', // 240..243 = Trigger-Masken 0..7, 10..17, (20..27), 30..37
  'TRT', // 247 = Auto-Trigger-Timing in ms, 0=aus
  'TRL', // 248 = Trigger-Edge-Level 0=neg, 1=pos. auf PB2 (INT2)
  'ICB', // 230 = Generic I2C I/O Byte
  'ICW', // 231 = Generic I2C I/O Word/Integer
  'ICS', // 232 = Generic I2C I/O Word Swapped
  'ICT', // 233 = Generic I2C I/O Temperatur
  'ICA', // 239 = Generic I2C I/O Hardware-Adresse setzen
  'REF', // 246 = Ext. Referenz wenn 1, interne wenn 0
  'WEN', // 250 = Write Enable
  'ERC', // 251 = ErrCount seit letztem Reset
  'SBD', // 252 = SerBaud UBRR-Register mit U2X=1
  'NOP');

  Cmd2SubChArr   : array[0..24] of byte = (
  249, 255, 254,
  0, 100, 200, 50, 30, 40, 80, 95, 150,  // Offsets bei SubCh 100, Skalierungen bei 200
  240,247,248,230,231,232,233,239,246,250,251,252,0);

  high                       = true;
  low                        = false;

//Default-EEPROM-Werte:
{$EEPROM}
structconst
//Arrays mit Parametern für 32 SubChannels
//SubCh 0..7:   ADC 8 interne Kanäle ATmega 10 Bit
//SubCh 8,9:    ADC 2-Kanal-Modul mit LTC2400 ADC 24 Bit Delta-Sigma (obsolet)
//SubCh 10..17: ADC 8-Kanal-Modul mit LTC1864 ADC 16 Bit SAR
//SubCh 20..27: DAC 8-Kanal-Modul DA12-8 oder DA16-8
//  Dummy: LongInt=0; // oft wird diese Speicherstelle korrumpiert
  OffsetArray      : array[0..27] of Integer =
 (0,0,0,0,0,0,0,0,0,0,   // 0..9   intern,
  -40,-40,-40,-40,-40,-40,-40,-40, 0,0,          // 10..17 AD16-8
  0,0,0,0,0,0,0,0);         // 20..27 DAC, 1 = 5 mV b. 12 Bit, Offset TL084 ca. 25 mV

  ScaleArray      : array[0..29] of Float =
 (1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,0,100, // 0..7, BaseScaleAD10 ATmega-ADC intern
  1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,0,3185, // 10..17 AD16-8, BaseScaleAD16
  1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,200,3200);        // 20..27 DAC, BaseScaleDA 12/16 Bit
  
{
  BaseScaleAD10:=ScaleArray[9];
  BaseScaleAD16:=ScaleArray[19];
  BaseScaleDA12:=ScaleArray[28];
  BaseScaleDA16:=ScaleArray[29];
}
  DirInitArray: array [0..7] of byte = (0,0,0,0,0,0,0,0);  //IO-Port DDR Datenrichtungsregister

  //Trigger-Masken für 2 A/D-Ports, DA-Port (nicht benutzt) und acht Digital-Ports
  TrigMaskArray: array [0..3] of byte = (0,0,0,0);
  
  TrigLevel:byte =0;
  TrigTimerValue:Word=0;
  InitIntegrateAD16:boolean=false;
  ExtRef:byte =1;
  IncRastDef:Integer = 4;
  EESerBaudReg:byte=51;

  ParamTextArray: Array[0..37] of String[8] =
 ('','','','','','','','','','',
  '','','','','','','','','','',
  '','','','','','','','','','',
  '','','','','','','','');
  EEinitialised:word=$AA55;

  PortInitArray: array [0..7] of byte = (0,0,0,0,0,0,0,0);
{--------------------------------------------------------------}

var
{$EEPROM}

{$DATA} {Schnelle Register-Variablen}
  i,j,                                   // univ. Zählervariable
  MuxCh,k: Byte;                         // in HW-Interrupt benutzt
  aWord: Word;
{$IDATA}  {Langsamere SRAM-Variablen}

  LEDactivity[@PortD, 2]    : bit; {Bit 2 ist Memory-LED, separat}
  LEDtrigger[@PortD, 3]    : bit;  // Trigger-Anzeige
  ButtonTemp: Byte; // invertiert - low=on!
  ButtonLeft[@ButtonTemp, 5]  : bit;
  ButtonRight[@ButtonTemp, 4]  : bit;
  ButtonEnter[@ButtonTemp, 3]  : bit;

  SCLK[@PortB, b_SCLK]          : bit; //Takt für alle
  SDATAOUT[@PortB, b_SDATAOUT]  : bit; //Daten für alle
  TRIGIN[@PortB, b_TRIG]        : bit; //Trigger-Eingang
  STRDAC[@PortB, b_STRDAC]      : bit; //Strobe für LTC1257 DA 12 Bit
  STRAD16[@PortB, b_STRAD16]    : bit; //Strobe für LTC1864
  STR_SR[@PinB, b_STR_SR]   : bit; //Dateneingang vom LTC2400
  SENSE[@PinB, b_SENSE]         : bit; //Sense-Pin Karten-Merkmal vorhanden
  
  STRDAMUX[@PortC, b_STRDAMUX]  : bit; //Multiplexer Enable

  IOPin[@PIn0] : TI2Cport;     // In-Port 9554A auf I/O-Platine
  IOPort[@Port0] : TI2Cport;   // Out-Port 9554A auf I/O-Platine
  IODDR[@DDR0] : TI2Cport;     // Datenrichtung 9554A auf I/O-Platine

  IO0Pin[@PIn0] : TI2Cport;     // Port 9554A auf I/O-Platine
  IO1Pin[@PIn1] : TI2Cport;     // Port 9554A auf I/O-Platine
  IO2Pin[@PIn2] : TI2Cport;     // Port 9554A auf I/O-Platine
  IO3Pin[@PIn3] : TI2Cport;     // Port 9554A auf I/O-Platine
  IO4Pin[@PIn4] : TI2Cport;     // Port 9554A auf I/O-Platine
  IO5Pin[@PIn5] : TI2Cport;     // Port 9554A auf I/O-Platine
  IO6Pin[@PIn6] : TI2Cport;     // Port 9554A auf I/O-Platine
  IO7Pin[@PIn7] : TI2Cport;     // Port 9554A auf I/O-Platine
  IO0Port[@Port0] : TI2Cport;   // Port 9554A auf I/O-Platine
  IO1Port[@Port1] : TI2Cport;   // Port 9554A auf I/O-Platine
  IO2Port[@Port2] : TI2Cport;   // Port 9554A auf I/O-Platine
  IO3Port[@Port3] : TI2Cport;   // Port 9554A auf I/O-Platine
  IO4Port[@Port4] : TI2Cport;   // Port 9554A auf I/O-Platine
  IO6Port[@Port6] : TI2Cport;   // Port 9554A auf I/O-Platine
  IO5Port[@Port5] : TI2Cport;   // Port 9554A auf I/O-Platine
  IO7Port[@Port7] : TI2Cport;   // Port 9554A auf I/O-Platine
  IO0DDR[@DDR0] : TI2Cport;
  IO1DDR[@DDR1] : TI2Cport;
  IO2DDR[@DDR2] : TI2Cport;
  IO3DDR[@DDR3] : TI2Cport;
  IO4DDR[@DDR4] : TI2Cport;
  IO5DDR[@DDR5] : TI2Cport;
  IO6DDR[@DDR6] : TI2Cport;
  IO7DDR[@DDR7] : TI2Cport;

  PortArray: array [0..7] of byte;
  PortSR0[@PortArray+0]: byte;
  PortSR1[@PortArray+1]: byte;
  PortSR2[@PortArray+2]: byte;
  PortSR3[@PortArray+3]: byte;

  OmniFlag, verbose,
  AD10flag,AD16flag,
  DAC12present, DAC16present, DAC714present, ADC16present, ADC24_1present, ADC24_2present,
  LCDpresent, IOpresent, aBool: boolean;
  x,y, CurrentCh       : byte;

//Arrays mit Parametern für 32 SubChannels
  DACValueArray     : Array[0..7] of Float;
  DACrawArray      : Table[0..7] of Word;
  ADCrawArray      : Table[0..7] of Integer;
  DACtemp:word;

  ADraw: Integer;
  AD16long: LongInt;
  integrateAD16: Boolean;
  
  BaseScaleAD10, BaseScaleAD16, BaseScaleDA12, BaseScaleDA16:float;
  
  I2CslaveAdr:byte; // I2C IO Slave Adresse
 
  TrigTimer: SysTimer;
  DisplayTimer:Systimer;
  IncrTimer, ActivityTimer, TrigLEDtimer:Systimer8;

  Trigger:Boolean;
  TrigMask:byte;
  
//für Parser
  SerInpStr      : String[63];
  SerInpPtr:byte;
  ParamStr:string[40]; // auch für Display
  ParamTextStr:string[8]; // für Display
  Param:float;
  ParamInt       : Integer;
  ParamByte:Byte;

  CmdWhich: tCmdWhich;
  CmdStr: string[3];

  SlaveCh        : byte;
  SubCh:byte;

  Modify: Byte;
  IncrValue,OldIncrValue: LongInt;
  IncrFine,FirstTurn:Boolean;
  IncrAccFloat:Float;
  IncrDiff,IncrAccInt10:Integer;
  IncrDiffByte, AutoRepeat:Byte;
  IncRast:Integer;
  digits, nachkomma:byte;
  ChangedFlag:Boolean;

// ausgegebene Status-Meldung, Bits 0..3 = Fehler oder Overload-Kanal
  Status        : byte; // für Status-Meldung
  EEUnlocked[@Status, 4]  : bit; // EEPROM-unlocked-Flag
  OverloadFlag[@Status, 5]  : bit; // Overload/Overrange-Flag
  UserSRQFlag[@Status, 6]  : bit;  // User Service Request
  BusyFlag[@Status, 7]  : bit;     // Device busy
  ErrCount:integer;
  ErrFlag:boolean;


{$I ADA-C-HW.pas}

interrupt Int2; // externer Trigger-Eingang, neg. Flanke
begin
  Trigger:=true;
end;

procedure SetBaseScales;
begin
  BaseScaleAD10:=ScaleArray[9];
  BaseScaleAD16:=ScaleArray[19];
  BaseScaleDA12:=ScaleArray[28];
  BaseScaleDA16:=ScaleArray[29];
end;

procedure SetDAC(mySubCh:Byte);
var
myOffset,myIntVal:Integer;
myLongIntVal:LongInt;
myScale,myVal:float;
begin
  if mySubCh in [20..27] then
    myOffset:=OffsetArray[mySubCh];
    myScale:=ScaleArray[mySubCh];
    myVal:=DACValueArray[mySubCh-20];
    if DAC714present then
// Grundskalierung Eingangswert -10,0V .. + 10,0 V für DAC714/PCM56
// umsetzen in -7FFF ..+$7FFF = -10,1V .. + 10,1 V, 0=0V
      myLongIntVal:= LongInt(BaseScaleDA16*(myVal*myScale))+longInt(myOffset);

      if myLongIntVal<-32767 then
        myLongIntVal:=-32767;
      endif;
      if myLongIntVal>32767 then
        myLongIntVal:=32767;
      endif;

      DACrawArray[mySubCh-20]:=word(myLongIntVal);
    endif;
    if DAC16present then
// Grundskalierung Eingangswert -10,23V .. + 10,23 V für LTC1655
// umsetzen in +$ffff ... 0 = -10,23V .. + 10,23 V
      myLongIntVal:= LongInt(BaseScaleDA16*(myVal*myScale))+longInt(myOffset);
      if myLongIntVal<-32767 then
        myLongIntVal:=-32767;
      endif;
      if myLongIntVal>32767 then
        myLongIntVal:=32767;
      endif;
      DACrawArray[mySubCh-20]:=word(LongInt($8000)-myLongIntVal);
    endif;
    if DAC12present then
// Grundskalierung Eingangswert -10,23V .. + 10,23 V für LTC1257
// umsetzen in +$fff ... 0 = -10,23V .. + 10,23 V
      myIntVal:= integer(BaseScaleDA12*(myVal*myScale))+myOffset;
      if myIntVal>2047 then
        myIntVal:=2047;
      endif;
      if myIntVal<-2047 then
        myIntVal:=-2047;
      endif;
      DACrawArray[mySubCh-20]:=word($800-myIntVal);
    endif;
  endif;
end;

function GetPort(myPort:byte): byte; //IO-Pin-Register setzen
begin
  if IOpresent then
    case myPort of
    0:
    return(IO0Pin);
    |
    1:
    return(IO1Pin);
    |
    2:
    return(IO2Pin);
    |
    3:
    return(IO3Pin);
    |
    4:
    return(IO4Pin);
    |
    5:
    return(IO5Pin);
    |
    6:
    return(IO6Pin);
    |
    7:
    return(IO7Pin);
    |
    endcase;
  else // Geschriebene OUT-Werte
    return(PortArray[myPort]);
  endif;
end;

procedure SetPort(myPort,myVal:byte); //IO-Port-Register lt. SubCh setzen
begin
  PortArray[myPort]:= myVal;  // für SR
  if IOpresent then
    I2CslaveAdr:=myPort+$38;   // Port0 auf I2C-Adresse $38
    ParamInt:=$100 + integer(myval);
    TWIout(I2CslaveAdr, ParamInt);
  else
    ShiftOutSR;
  endif;
end;

procedure SetDir(myPort,myVal:byte); //IO-Pin-Directions
begin
  if IOpresent then
    case myPort of
    0:
      IO0DDR:=myVal;
      |
    1:
      IO1DDR:=myVal;
      |
    2:
      IO2DDR:=myVal;
      |
    3:
      IO3DDR:=myVal;
      |
    4:
      IO4DDR:=myVal;
      |
    5:
      IO5DDR:=myVal;
      |
    6:
      IO6DDR:=myVal;
      |
    7:
      IO7DDR:=myVal;
      |
    endcase;
  endif;
end;


function GetNewValue(mySubCh:Byte):boolean;
//Werte in Param holen, wenn in SubCh; Raw-Werte in ParamInt
//return-Wert True, wenn Integer
var isInteger:boolean;
begin
  ParamInt:=0;
  Param:=0;
  isInteger:=false;
  case mySubCh of
    0..7:  // aktuellen Wert holen
      ParamInt:= integer(getadc(mySubCh+1));
      Param:=(float(ParamInt+integer(OffsetArray[mySubCh]))*ScaleArray[mySubCh]/BaseScaleAD10);
      |
    10..17: // aktuellen Wert holen
      ParamInt:=ADCrawArray[mySubCh-10];
      Param:=float(ParamInt+OffsetArray[mySubCh])*ScaleArray[mySubCh];
      Param:=Param/BaseScaleAD16; //FS/2 Grundskalierung 16 Bit
      |
    20..27: // aktuellen Wert holen
      Param:=DACValueArray[mySubCh-20];
      |
    30..37:
      ParamInt:=Integer(GetPort(mySubCh-30));
      isInteger:=true;
      |
    40..47: //DIR Port direction
      ParamInt:=integer(DirInitArray[mySubCh-40]);
      isInteger:=true;
      |
  endcase;
  return (isInteger);
end;
{###########################################################################}
//EEPROM-Routinen


{###########################################################################}
//Menü-Prozeduren
procedure LCD1xy;
begin
  LCDxy_M(LCD_m1, x, y);
end;

procedure LCD1x0y0;
begin
  x:= 0;
  y:= 0;
  LCD1xy;
end;

procedure LCD1x0y1;
begin
  x:= 0;
  y:= 1;
  LCD1xy;
end;

{###########################################################################}

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
  write(serout, SerInpStr);   // Befehl weiterreichen
  SerCRLF;
end;

procedure SerPrompt(myErr:tError;myStatus:byte);
//Error-Meldung und Status-Request-Antwort,
//Status Bit 7=Busy, 6=UserSRQ, 5=OverLoad, 4=!!!, 3..0=Fehler-Nummer
begin
  if verbose OR (myERR<>noErr) then
    SubCh:=ErrSubCh; // Fehler-Kanal
    WriteChPrefix;
    write(Serout, ByteToStr(ord(myErr)+myStatus));
    Serout(#32);
    write(serout,ErrStrArr[ord(myErr)]);
    SerCRLF;
  endif;
  if myERR<>noErr then
    inc(ErrCount);
    ErrFlag:=true;
  endif;
end;

{###########################################################################}

procedure ParamRound1000;
var  ParamLong: LongInt;
begin
  ParamLong:=round(Param*1000); // auf 1/1000 runden
  Param:= float(ParamLong)/1000;
end;

procedure ParamToStr;
begin
  if Param=0 then
    ParamStr:='0.0';
  else
    ParamStr:=floatToStr(Param:digits:nachkomma);
  endif;
end;

procedure ParamToPMStr; // String-Wandlung mit Vorzeichen
begin
  ParamToStr;
  if ParamStr[1] <> '-' then
    insert('+',ParamStr,1);
  endif;
end;

procedure WriteParam;
begin
  digits:=1;
  nachkomma:=4;
  if SubCh in [8..27, 200..227] then
      nachkomma:=6;  // für AD16
  endif;
  ParamToStr;
  WriteChPrefix;
  write(serout,ParamStr);
  SerCRLF;
end;

procedure WriteParamInt;
begin
  ParamStr:=IntToStr(ParamInt);
  ParamStr:=trim(ParamStr);
  WriteChPrefix;
  write(serout,ParamStr);
  SerCRLF;
end;

procedure WriteFeatures;
begin
  if DAC12present then
     write(serout,DAC12str);
  endif;
  if DAC714present or DAC16present then
     write(serout,DAC16str);
  endif;
  if ADC16present then
     write(serout,ADC16str);
  endif;
  if IOpresent then
     write(serout,IO816str);
  endif;
  if LCDpresent then
     write(serout,LCDstr);
  endif;
  serout(']');
end;

procedure WriteFeaturesLCD;
begin
  x:=0;
  LCD1xy;
  if DAC12present then
     write(lcdout_m,DAC12str);
     mdelay(750);
  endif;
  x:=0;
  LCD1xy;
  if DAC714present or DAC16present then
     write(lcdout_m,DAC16str);
     mdelay(750);
  endif;
  x:=0;
  LCD1xy;
  if ADC16present then
     write(lcdout_m,ADC16str);
     mdelay(750);
  endif;
  x:=0;
  LCD1xy;
  if IOpresent then
     write(lcdout_m,IO816str);
     mdelay(750);
  endif;
end;

{$IFDEF Panel}


procedure SollWerteOnLCD;
begin
  if (not ChangedFlag) and (Modify>=20) then
    return; // unverändert, nichts zu tun
  endif;
  digits:=2;
  nachkomma:=4;
  x:=0;
  y:=0;
  LCD1xy;
  if GetNewValue(Modify) then  // aktuellen Wert holen; Integer?
    ParamByte:=byte(ParamInt);
    if IncrFine then
      ParamStr:=ByteToHex(ParamByte);
      lcdout_m(#36);
    else
      ParamStr:=ByteToBin(ParamByte);
    endif;
  else
    ParamRound1000;
    ParamToPMStr;
    ParamStr:=copy(ParamStr,1,7);
  endif;
  write(lcdout_m,ParamStr);
  LCDclrEOL_m(LCD_m1);
  x:=7;
  LCD1xy;
  if Modify < 20 then
    lcdout_m(#1);
  else
    if IncrFine then
      lcdout_m(#2);
    else    // Binärzahlen brauchen 8 Stellen
      if Modify<30 then
        lcdout_m(#0);
      endif;
    endif;
  endif;
  x:=0;
  y:=1;
  LCD1xy;
  ParamTextStr:=ParamTextArray[Modify];
  if length(ParamTextStr)=0 then // String leer, Default-Anzeige Value
    write(lcdout_m,ValueStr);
    write(lcdout_m,byteToStr(Modify:2));
    lcdout_m(#32);
  else
    ParamTextStr:=padRight(ParamTextStr,8); // mit Leerzeichen auffüllen
    write(lcdout_m,ParamTextStr);
  endif;
end;
{$ENDIF} //Panel


{$IFDEF Parser}
{$I ADA-C-Parser.pas}
{$ENDIF}

procedure Chores;
// Regelmäßig außerhalb des Interrupts aus CheckSer heraus aufgerufen:
begin
end;

procedure CheckSer;
var
myChar: char;
begin
  while SerInp_TO(myChar,10) do // 20 ms Timeout
//    serout(mychar); // Echo Character
    if myChar in [#32..#127] then // nur 7-Bit-ASCII ohne Controls
      append(myChar,SerInpStr);
    endif;
    if mychar=#8 then // Backspace
      setlength(SerInpStr, length(SerInpStr)-1);
    endif;
    if myChar=#13 then
      ParseSubCh;           //Befehl interpretieren, wenn für uns
{$IFDEF debug}
      if ErrFlag then
        ErrFlag:=false;
        LCDxy_M(LCD_m1, 0, 1);
        write(lcdout_m,inttostr(errcount));
      else
        WriteSerInp;
      endif;
{$ENDIF}
      SerInpStr:='';
    endif;
  endwhile;
//  Chores;
end;

procedure CheckDelay(myDelay:byte);
// Delay mit serieller Abfrage in 20-ms-Schritten
var mycount:byte;
begin
  for mycount:=1 to mydelay do
    CheckSer;
  endfor;
end;

{###########################################################################}

procedure initall;
//nach Reset aufgerufen
begin
  DDRB:=  DDRBinit;            {PortB dir}
  PortB:= PortBinit;           {PortB}
  DDRC:=  DDRCinit;            {PortC dir}
  PortC:= PortCinit;           {PortC}
  DDRD:=  DDRDinit;            {PortD dir}
  PortD:= PortDinit;           {PortD}

  IOpresent:=I2CexpStat(IO0DDR);

// Ports initialisieren
  for i:=0 to 7 do
    j:=DirInitArray[i];
    SetDir(i,j);
    j:=PortInitArray[i];
    PortArray[i]:=j;
    SetPort(i,j);
    j:=0;
// Function TWIout (SlaveAdr : byte; Command : byte|word [; Data]) : boolean;
// Für Texas-PCA9554A: Inversion Register 2 auf 0 setzen
    I2CslaveAdr:=$38+i;   // Port0 auf I2C-Adresse $38
    if IOpresent then
      ParamInt:=$200;
      TWIout(I2CslaveAdr,ParamInt);
    endif;
  endfor;

  i:=EESerBaudReg;
  if not i in [9..239] then
    EESerBaudReg:=51;
    i:=51;
  endif;
  ubrr1:=i;
  UCSRA:=UCSRA or 2; // Set U2X bit
//  serBaud(EESerbaud);        // nur mit 644

  if ExtRef=1 then
    ADMUX:= ADMUX OR %11000000;  {Internal ADC Reference ON}
  endif;
  LCDpresent:=false;
  SlaveCh:= (not PinD) shr 5;
  LEDactivity:= low;
  if LCDsetup_M(LCD_m1) then
    LCDcursor_M(LCD_m1, false, false);
    LCDCharSet_M(LCD_m1, #0, $01, $03, $07, $0F, $07, $03, $01, $00); {"<" Cursor}
    LCDCharSet_M(LCD_m1, #1, $01, $03, $05, $09, $05, $03, $01, $00); {"<" Cursor hohl}
    LCDCharSet_M(LCD_m1, #2, $01, $02, $05, $0A, $05, $02, $01, $00); {"<" Cursor IncrValeinstellung}
    LCDcursor_M(LCD_m1, false, false);

    LCDpresent:=true;
    write(lcdout_m,Vers3Str);
    x:=0;
    y:=1;
    LCD1xy;
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


// Feststellen, welche I/O-Karten vorhanden sind
  SDATAOUT:=low;
  udelay(1);
  DAC12present:= not SENSE;
  SDATAOUT:=high;
  STRDAC:=low;
  udelay(1);
  DAC714present:= not SENSE;
  STRDAC:=high;
  if DAC12present and DAC714present then
    DAC16present:=true;
    DAC12present:=false;
    DAC714present:=false;
  endif;
  STRAD16:=low;
  udelay(1);
  ADC16present:= not SENSE;
  STRAD16:=high;

  if LCDpresent then
    x:=0;
    y:=0;
    LCD1xy;
    write(lcdout_m,CardsStr);
    y:=1;
    LCD1xy;
    if EEinitialised <> $AA55 then
      write(lcdout_m, EEnotProgrammedStr);
    else
      WriteFeaturesLCD;
    endif;
  endif;
  ParamTextStr:='';

  for SubCh:= 20 to 27 do
    DACValueArray[SubCh]:= 0.0;
    SetDAC(SubCh);
  endfor;
  
  SetBaseScales;
  IntegrateAD16:=InitIntegrateAD16;
  CurrentCh:=SlaveCh;
  SubCh:=0;
  Status:=0;
  
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
  endif;
  writeFeatures;
  SerCRLF;
  SerInpStr:='';
  I2CslaveAdr:=$48;  // für LM75 Temp.-Sensor, $90 div 2

{$IFDEF Panel}
  IncrCount4start;
  SetIncrVal4(0,0);
  IncrValue:=GetIncrVal4(0);
  OldIncrValue:= IncrValue;
  IncrDiff:=0;
  IncrFine:=false;
  FirstTurn:=true;
  IncRast:=IncRastDef;
{$ENDIF}  //Panel
  Modify:=20;
  AutoRepeat:=0;
  CurrentCh:=255; // erstmal keine Reaktion
  errcount:=0;
  ChangedFlag:=true;
end;

{###########################################################################}

begin
  Initall;
  loop
    CheckSer;  // Serinp parsen, nicht busy
    if issysTimerzero(TrigTimer) then  // Auto-Trigger
      aWord:=TrigTimerValue;
      if aWord<>0 then
        Trigger:=True;
        aWord:=aWord shr 1;
        setsystimer(TrigTimer,aWord);
      endif;
    endif;
    if Trigger then  // externer oder Auto-Trigger
      setsystimer(TrigLEDTimer,30);
      LEDTrigger:=low;
      TrigMask:= TrigMaskArray[0]; // 8 Bits = 8 Werte interner AD10
      if TrigMask<>0 then
        for i:= 7 downto 0 do
          if TrigMask>127 then
            SubCh:=i;
            GetNewValue(SubCh);
            WriteParam;
          endif;
          TrigMask:=TrigMask shl 1;
        endfor;
      endif;
      TrigMask:= TrigMaskArray[1]; // 8 Bits = 8 Werte externer AD16
      if TrigMask<>0 then
        for i:= 7 downto 0 do
          if TrigMask>127 then
            SubCh:=i+10;
            GetNewValue(SubCh);
            WriteParam;
          endif;
          TrigMask:=TrigMask shl 1;
        endfor;
      endif;
      TrigMask:= TrigMaskArray[3]; // 8 Bits = 8 I/O-Ports PCA9554A
      if TrigMask<>0 then
        for i:= 7 downto 0 do
          if TrigMask>127 then
            SubCh:=i+30;
            GetNewValue(SubCh);
            WriteParamInt;
          endif;
          TrigMask:=TrigMask shl 1;
        endfor;
      endif;
      Trigger:=false;
    endif;
    
    if isSystimerZero(ActivityTimer) then
      LEDactivity:=high; // Activity-LED aus
    endif;
{$IFDEF Panel}
    if LCDpresent and (not Serstat) then
      IncrValue:=GetIncrVal4(0);
// Inkrementalgeber löst in Zweierschritten auf, deshalb der Umstand
      if (IncrValue<>OldIncrValue) then
        SetSystimer(ActivityTimer, 125);
        LEDactivity:=low;
        IncrDiff:=IncrDiff + integer(IncrValue-OldIncrValue);
        OldIncrValue:= IncrValue;
        SetSystimer(IncrTimer, 100);
        if abs(IncrDiff)>= IncRast then // erst wenn n Impulse gezählt
          ChangedFlag:=true;
          IncrDiff:=IncrDiff div IncRast;
          IncrDiffByte:=byte(IncrDiff);    // Byte ohne Beschleunigung
          if abs(IncrDiff)> 1 then //Beschleunigung
            IncrDiff:=IncrDiff * 2;  // 2x Differenz mit Beschleunigung
          endif;
          if abs(IncrDiff)> 2 then //Beschleunigung
            IncrDiff:=IncrDiff * 2;  // 4x Differenz mit Beschleunigung
          endif;
          IncrAccInt10:=IncrDiff*10; // 40x Differenz mit Beschleunigung

          if IncrFine then
             IncrAccFloat:=Float(IncrDiff)/1000;  // Differenz mit Beschleunigung
          else
             IncrAccFloat:=Float(IncrDiff)/10;  // Differenz mit Beschleunigung
          endif;
          SetSystimer(DisplayTimer, 750);
          if Modify in [20..27] then
             Param:=DACValueArray[Modify-20]+IncrAccFloat;
             ParamRound1000;
             DACValueArray[Modify-20]:=Param;
             if FirstTurn then
               serprompt(noErr,Status+67); // UserSRQ-Flag=64, +3
               FirstTurn:=false;
             endif;
             SubCh:=Modify;
             SetDAC(SubCh); // Geänderten Wert ausgeben
             ParseGetParam;
          endif;
          if Modify in [30..37] then
             SubCh:=Modify;
             ParamByte:=PortArray[SubCh-30]+byte(IncrDiff);
             SetPort(SubCh-30,Parambyte); // Geänderten Wert ausgeben
             ParseGetParam;
          endif;
          IncrDiff:=0; // für nächsten Durchlauf
          SollwerteOnLCD;
          FirstTurn:=false;
        endif;
      endif;
      Checkdelay(1); // wichtig für Beschleunigungsfunktion
      ButtonTemp := (LCDportInp_M(LCD_m1) or %11000111);
      if ButtonTemp <> $FF then
        Checkdelay(1);
        ButtonTemp := (LCDportInp_M(LCD_m1) or %11000111);
        ChangedFlag:=true;
        if ButtonTemp <> $FF then
          if (not ButtonEnter) then
            serprompt(noErr,Status+67); // UserSRQ-Flag=64, +3
            IncrFine:=not IncrFine;
          endif;
          if not ButtonLeft then
            serprompt(noErr,Status+65); // UserSRQ-Flag=64, +1
            if Modify in [10,20,30] then
              Modify:=Modify-2;
            endif;
            dectolim(Modify,0);
            SubCh:=80;
            ParseGetParam;
          endif;
          if not ButtonRight then
            serprompt(noErr,Status+66); // UserSRQ-Flag=64, +2
            if Modify in [7,17,27] then
              Modify:=Modify+2;
            endif;
            inctolim(Modify,37);
            SubCh:=80;
            ParseGetParam;
          endif;
          SetSystimer(DisplayTimer, 750);
          SollwerteOnLCD;
          repeat
            Checkdelay(1);
            ButtonTemp := (LCDportInp_M(LCD_m1) or %11000111);
            inc(Autorepeat);
          until (ButtonTemp=$ff) or (AutoRepeat>20);
          if ButtonTemp=$ff then
            AutoRepeat:=0;
          else
            AutoRepeat:=17;  // Wenn weiterhin gedrückt, schneller Repeat
          endif;
          FirstTurn:=false;
        endif;
      endif;
    endif;
    if isSystimerZero(IncrTimer) then
      SetSystimer(IncrTimer, 100);
      if not FirstTurn then
        serprompt(noErr,Status+64); // UserSRQ-Flag=64, freigegeben
      endif;
      FirstTurn:=true;
    endif;
{$ENDIF}  //Panel
    if isSystimerZero(TrigLEDtimer) then
      LEDtrigger:=high;
    endif;
    if isSystimerZero(DisplayTimer) and LCDpresent then
      SetSystimer(DisplayTimer, 125);
{$IFDEF Panel}
      IncrFine:=false;
      BusyFlag:=false;
      SollwerteOnLCD;
      ChangedFlag:=false;
{$ENDIF}  //Panel
    endif;
  endloop;
end ADAC.

