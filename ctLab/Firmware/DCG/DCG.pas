program DCG;
(*
DC-Generator, c't-Version mit LTC1257 oder LTC1655
(c) by c't magazin und Carsten Meyer, cm@ctmagazin.de

15.05.2010 #2.92 Relais-Umschaltung abhängig von CurrentMode,
                 SubCh 14 liefert integrierte Ausgangsspannung,
                 SubCh 16 liefert integrierten Ausgangsstrom

16.09.2008 #2.91 Relais-Umschaltung berücksichtigt Ripple,
                 kein Flattern mehr im Grenzbereich
                 Im Ripple-Betrieb alternierende Sollwert-Anzeige der Spannung,
                 Umschaltung auf Istwert im ConstCurrent-Mode
14.09.2008 #2.9  Energiemessung und Leistungsanzeige eingefügt, wie bei EDL // mcb //
25.06.2008 #2.842 Prozent-Faktor wird nur noch bei Panel-Bedienung zurückgesetzt
                  Serprompt neu
23.06.2008 #2.841 Display-parameter DSP 0 (SubCh 80) eingeführt, ErrCount berücksichtigt
17.06.2008 #2.84 Temperatur-Abfrage mit TMP-Befehl, Bug in Temperatur-Timer beseitigt,
                 Error-Handling für Buttons und Overloads verbessert
17.04.2008 #2.83 Bug in Temperatur-Überwachung (LM75: 100 ms Ausleselatenz) beseitigt
26.02.2008 #2.822 Panel Bereichssprung verbessert
20.02.2008 #2.82 IncRast-Bug beseitigt, Ripple (Brumm) Arbiträr-Werte eingeführt,
                 IRQ-Timing für ADC geändert, OPT-Bit DCPpresent eingeführt
07.12.2007 #2.753 RAW implementiert
28.11.2007 #2.75 Bugs in Parser für OPT-Parameter behoben, Eingangsspannungs-Berechnung getADC(5) korrigiert,
                 ALL erweitert auf Eingangsspannung, Parser "hasMainCh" erweitert
11.09.2007 #2.74 Neue getADC10-Routine wg. Fehlverhalten von getadc()
08.09.2007 #2.73 Relais-Abschaltung bei Übertemperatur/Überspannung
22.08.2007 #2.71 Modulations-Parameter in Prozent für U und I, EEPROM-Optionen für LTC1257
19.08.2007 #2.70 LCD-Routinen aufgeräumt, Echtzeit-Istwert-Anzeige
20.07.2007 #2.68 DSP-Parameter für Panel,
                 Parser geändert: Request wenn kein "=", ausf. Response nur mit "?" oder "!"
21.06.2007 #2.08 Syntax erweitert, Skalierung und Offset für alles
16.06.2007 #1.98 Locked-Status eingeführt
04.05.2007 #1.88 Tracking eingeführt, zweimal "Volt" drücken
29.04.2007 #1.78 neue Inkrementalgeber-Routine
27.03.2007 #1.68 Status-Codes eingeführt, Overload, Übermittlung der Bedienelemente
19.03.2007 #1.67 Parser-Syntax verbessert, Error-Codes, ALL-Request
23.02.2007 #1.60 Parser zweigeteilt, mit Zeitschleifen-Check für SerInp
23.01.2007 #1.50 LCD-Anschlus 2x8 Zeichen für Messwertanzeige
05.12.2006 #0.90 Offset OFU und OFI eingefügt, für neg. Offset des LTC1257
05.12.2006 #0.10 Übernahme aus ADA-C DDS

*)

{$DEFINE LCDistSpannung} // IstSpannung auf LCD statt Sollwert
{$DEFINE ADA16}          // 16-Bit-AD- und DA-Wandler


{ $NOSHADOW}
{$W- Warnings}            {Warnings off}
{$TYPEDCONST OFF}
{$DEBDELAY}

Device = mega32, VCC = 5;

Define_Fuses
//Override_Fuses; // optional, always replaces fuses in ISPE
LockBits0 = [];
FuseBits0 = [BODEN,BODLEVEL];  //4,5V Brown-Out
FuseBits1 = [SPIEN,CKOPT];
ProgMode = SPI;

Import SysTick, TWImaster, SerPort, {mcb} TickTimer, IncrPort4, LCDmultiPort;   // ADCport,

from System import float;

Define
  ProcClock      = 16000000;        {Hertz}

  TWIpresc       = TWI_BR400;

  LCDmultiPort   = I2C_TWI;
  LCDTYPE_M      = 44780; // 44780 oder 66712;
  LCDrows_M      = 2;              //rows
  LCDcolumns_M   = 8;             //chars per line
  IncrPort4      = PinA, 1, 32; // pin-reg used, channels, 16 or 32bit integer
{ mcb }  IncrScan4      = Timer2, 4; // timer used, scan rate 1kHz (1..100)

  SysTick        = 1;              //msec
  SerPort        = 38400, Stop1, timeout;    {Baud, StopBits|Parity}
  RxBuffer       = 255, iData;
  TxBuffer       = 255, iData;

  StackSize      = $0080, iData;
  FrameSize      = $0100, iData;
{ mcb } TickTimer = Timer1; // use Timer1.COMPA and no PortPin

//  ADCchans = [3..5], iData;   // Fehlverhalten wg. "überfahrenem" SysTick
//  ADCpresc       = 128;

Implementation

type
{ mcb } tCmdWhich      = (str, idn, chn, val, dcv, dca, mah, mwh, msv, msa, msw, pcv, pca, pwon, pwoff, rip,
                    raw, dsp, ofs, scl, opt, all, tmp, wen, erc, sbd,nop, err);
  tModify        = (Ampere, Volt, Ripple, T_on, T_Off, TrackCh, CapMenu, PwrMenu);   //0..5
  tError = (NoErr, UserReq, BusyErr, OvlErr, SyntaxErr, ParamErr, LockedErr,ChecksumErr,FuseErr,FaultErr);

{--------------------------------------------------------------}
const


//                              ----SFDC             Strobe,FSync,Data,Clk
  DDRBinit                   = %10111111;            {PortB dir }
  PortBinit                  = %11010011;            {PortB, b_STROBE=0 }

  DDRCinit                   = %11111100;            {PortC dir, 2..3=MPX }
  PortCinit                  = %00001111;            {PortC }

{ Jumper und LEDs PortBits }
  DDRDinit                   = %00001100;            {PortD dir, 0..1=Serial }
  PortDinit                  = %11111100;            {PortD }

  BtnInPortReg               = @PinD;   {Taster-Eingangsport}
  LEDOutPort                 = @PortD;   {LED-Port}
  ControlBitPort             = @PortB;   {DDS-Port}
  ControlBitPin              = @PinB;   {DDS-Port}
  MPXPort                    = @PortC;   {OE/Multiplexer-Port}
  
  b_SCLK                     = 0; //Takt für alle
  b_SDATAOUT                 = 1; //Daten für alle
  b_STRDAC                   = 4; //LTC1257 Load
  b_SDATAIN1                 = 6; //Daten vom ADC LTC1864
  b_STRAD16                  = 7; //LTC1257 Load



//Lineal     .----.----.----.----.----.----.----.----.----
{ mcb }  Vers1Str                   = '2.92 [DCG by CM/c''t 05/2010]';    //Vers1
{ mcb }  Vers3Str                   = 'DCG 2.92';    // Kurzform von Vers1

  ErrStrArr      : array[0..7] of String[8] = (
    '[OK]','[SRQUSR]','[BUSY]','[OVRLD]','[CMDERR]','[PARERR]',
    '[LOCKED]','[CHKSUM]');

  FaultStrArr : array[0..3] of String[10] = (
    '[OVRPOWR]',
    '[FUSEBLW]',
    '[OVRVOLT]',
    '[OVRTEMP]');

  MenuStrArr      : array[0..7] of String[8] = (
    '','','Ripple % ','T on  ms','T off ms','TrackChn','','Power   ');

    
  AdrStr                     = 'Adr ';

  ErrSubCh                   = 255;

  CmdStrArr      : array[0..26] of String[3] = (
  'STR', 'IDN', 'CHN',
  'VAL',
  'DCV',  // Ausgangsspannung SOLL
  'DCA',  // Ausgangsstrom
{ mcb }  'MAH',  // Messwert Ah
{ mcb }  'MWH',  // Messwert Wh
  'MSV',  // Messwert Ausgangsspannung IST
  'MSA',  // Messwert Ausgangsstrom IST
{ mcb }  'MSW',  // verbratene Leistung
  'PCV',  // Prozentwert Ausgangsspannung Soll
  'PCA',  // Prozentwert Ausgangsstrom Soll
  'RON',  // Ripple-Time On
  'ROF',  // Ripple-Time On
  'RIP',  // Ripple (Brumm) in Prozent
  'RAW',  // 50=Rohdaten 2xADC16, 3xADC10
  'DSP',
  'OFS',
  'SCL',
  'OPT',
  'ALL',
  'TMP',
  'WEN', // 250 = Write Enable
  'ERC', // 251 = ErrCount seit letztem Reset
  'SBD', // 252 = SerBaud UBRR-Register mit U2X=1
  'NOP');
  Cmd2SubChArr   : array[0..26] of byte = (
  255, 254, 253,
  0,0,1,7,8,10,11,18,20,21,27,28,29,50,80,100,200,150,99,233,250,251,252,0);   // Offsets bei SubCh 100, Skalierungen bei 200

  DC2mA                      = 0;
  DC20mA                     = 1;
  DC200mA                    = 2;
  DC2A                       = 3;   //0..3
  Ulow                       = 0;
  Uhigh                      = 1;

  high                       = true;
  low                        = false;

//Inkrementalgeber-Beschleunigungstabelle
  IncrAccArray: array[0..15] of integer = (0,1,2,5,10,25,50,100,250,
  500,1000,2500,5000,10000,25000,25000);

//Default-EEPROM-Werte:
{$EEPROM}
structconst
  dummy:LongInt=0;        // diese Speicherstelle wird oft korrumpiert

// Werte für LTC1655, LTC1874

{$IFDEF ADA16}
  DACUoffsets:Array[0..1] of Integer = (10, 10);  // 2V, 20V
  DACUscales:Array[0..1] of Float = (1.001, 1.0032);  // 2V, 20V

  DACIoffsets:Array[0..3] of Integer = (10, 10, 10, 10);  // 2mA, 20mA, 200mA, 2A
  DACIscales:Array[0..3] of Float = (1.003, 1.003, 1.003, 1.003); // 2mA, 20mA, 200mA, 2A

  ADCUoffsets:Array[0..1] of Integer = (-180, -180);  // 2V, 20V
  ADCUscales:Array[0..1] of Float = (1.005, 1.005);  // 2V, 20V

  ADCIoffsets:Array[0..3] of Integer = (-180, -180, -180, -180);  // 2mA, 20mA, 200mA, 2A
  ADCIscales: Array[0..3] of Float = (1, 1, 1, 1);  // 2mA, 20mA, 200mA, 2A

  OptionArray:Array[0..24] of Float =  (
  5.0,                    // InitVolt = 5.0;
  0.02,                   // InitAmp = 20mA;
  3.0,                    // InitGainPre, Gain OpAmp nach ADC, (R17/R18)+1
  3.0,                    // InitGainOut, Gain Sense-Differenzverstärker,
                          // (R21/R20) mit R23=R20 und R22=R21
  0.25,                   // InitGainI, Spannungsteiler R33/(R33+R34)
  2.5,                    // Uref LT1019 = 2.5 V;
  30,                     // Umax maximale Ausgangsspannung für CheckLimits
  470,                    // R sense 1. Bereich nom. 2mA, 470 Ohm
  47,                     // R sense 2. Bereich nom. 20mA, 47 Ohm
  4.7,                    // R sense 3. Bereich nom. 200mA, 4.7 Ohm
  0.47,                   // R sense 4. Bereich nom. 2A, 0.47 Ohm

  0.002,                  // Imax A 1. Bereich, Umschaltpunkte
  0.020,                  // Imax A 2. Bereich
  0.200,                  // Imax A 3. Bereich
  2.000,                  // Imax A 4. Bereich für CheckLimits

  2,                      // ADCUlofac, Skalierung Uist durch Spannungsteiler an Q1, R12/(R12+R24)
  6,                      // ADCUhifac, Skalierung Uist durch Spannungsteiler an Q1  R12/(R24+R12||R16)
  7,                      // InitOptions, Bit 0=1: LTC1655 statt 1257,
                          // Bit 1=1: LTC1864 statt interner DAC
                          // Bit 2= LM75/DCP vorhanden
  12.1,                   // SwitchU, DAC-Umschaltpunkt Lo/Hi in Volt (Uoutmax ADC = 4,5V, *GainOut)
  8.6,                    // untere Relais-Umschaltspannung (wieder auf 12V AC)
  8.9,                    // obere Relais-Umschaltspannung (wieder auf 24V AC)
  50,                     // InitFanOnTemp
  0,                      // InitRipplePercent, "Brummspannung" in Prozent
  4,                      // PWonTime, beide Time-Werte sollten geradzahlig sein
  6                       // PWoffTime
);

{$ELSE}     // LTC 1257, interner AD

  DACUoffsets:Array[0..1] of Integer = (5, 5);  // 2V, 20V
  DACUscales:Array[0..1] of Float = (1.003, 1.005);  // 2V, 20V

  DACIoffsets:Array[0..3] of Integer = (5, 5, 5, 5);  // 2mA, 20mA, 200mA, 2A
  DACIscales:Array[0..3] of Float = (1, 1, 1, 1); // 2mA, 20mA, 200mA, 2A

  ADCUoffsets:Array[0..1] of Integer = (3, 3);  // 2V, 20V
  ADCUscales:Array[0..1] of Float = (1.000, 1.000);  // 2V, 20V

  ADCIoffsets:Array[0..3] of Integer = (3, 3, 3, 3);  // 2mA, 20mA, 200mA, 2A
  ADCIscales: Array[0..3] of Float = (1.003,1.008,1.014,1.07);  // 2mA, 20mA, 200mA, 2A

  OptionArray:Array[0..24] of Float =  (
  5.0,                    // InitVolt = 5.0;
  0.02,                   // InitAmp = 20mA;
  5.0,                    // InitGainPre, Gain OpAmp nach ADC
  3.0,                    // InitGainOut, Gain Sense-Differenzverstärker,
                          // (R21/R20) mit R23=R20 und R22=R21
  0.5,                    // InitGainI, Spannungsteiler R33/(R33+R34)
  2.048,                  // Uref LTC1257 = 2.048 V;
  20,                     // Umax maximale Ausgangsspannung für CheckLimits
  470,                    // R sense 1. Bereich nom. 2mA, 470 Ohm
  47,                     // R sense 2. Bereich nom. 20mA, 47 Ohm
  4.7,                    // R sense 3. Bereich nom. 200mA, 4.7 Ohm
  0.47,                   // R sense 4. Bereich nom. 2A, 0.47 Ohm

  0.002,                  // Imax A 1. Bereich, Umschaltpunkte
  0.020,                  // Imax A 2. Bereich
  0.200,                  // Imax A 3. Bereich
  1.000,                  // Imax A 4. Bereich für CheckLimits

  1,                      // ADCUlofac, Skalierung Uist durch Spannungsteiler an Q1, R12/(R12+R24)
  5,                      // ADCUhifac, Skalierung Uist durch Spannungsteiler an Q1  R12/(R24+R12||R16)
  0,                      // InitOptions, Bit 0=1: LTC1655 statt 1257,
                          // Bit 1=1: LTC1864 statt interner DAC
                          // Bit 2= LM75/DCP vorhanden
  6,                      // SwitchU, DAC-Umschaltpunkt Lo/Hi in Volt (Uoutmax ADC = 2.048V*InitGainOut)
  21,                     // untere Relais-Umschaltspannung (wieder auf 12V AC)
  22,                     // obere Relais-Umschaltspannung (wieder auf 24V AC)
  50,                     // InitFanOnTemp
  0,                      // InitRipplePercent, "Brummspannung" in Prozent
  4,                      // PWonTime, beide Time-Werte sollten geradzahlig sein
  6                       // PWoffTime
);


{$ENDIF}
  InitIncRast:Float =4;
  EESerBaudReg:byte=51;
  TrackChSave:byte = 255;
  EEinitialised:word=$AA55;

{--------------------------------------------------------------}

var
{$EEPROM}
  InitVolt[@OptionArray]: Float;
  InitAmp[@OptionArray+4]: Float;
  InitGainPre[@OptionArray+8]: Float;
  InitGainOut[@OptionArray+12]: Float;
  InitGainI[@OptionArray+16]: Float;
  Uref[@OptionArray+20]: Float;
  Umax[@OptionArray+24]: Float; // für CheckLimits
  RSenseArray[@OptionArray+28]: Array[0..3] of Float;
  ImaxArray[@OptionArray+44]: Array[0..3] of Float;
  Imax[@OptionArray+56]: Float;  // für CheckLimits
  ADCUfacs[@OptionArray+60]: Array[0..1] of Float;
  InitOptions[@OptionArray+68]: Float;
  InitSwitchU[@OptionArray+72]: Float;
  InitHystLow[@OptionArray+76]: Float;
  InitHystHigh[@OptionArray+80]: Float;
  InitFanOnTemp[@OptionArray+84]: Float;
  InitRipplePercent[@OptionArray+88]: Float; // "Brummspannung" in Prozent
  InitTonTime[@OptionArray+92]: Float;
  InitToffTime[@OptionArray+96]: Float;
{$DATA} {Schnelle Register-Variablen}
  i,
  k           : Byte;  // k in HW-Prozess benutzt
  m: Byte;

{$IDATA}  {Langsamere SRAM-Variablen}
  SlaveCh: byte;
  LEDactivity[LEDOutPort, 2]    : bit;
  LED_CurrentLimit[LEDOutPort, 3]    : bit;
  STRAD16[@PortB, b_STRAD16]    : bit; //Strobe für LTC1864

  ButtonTemp,RangeTemp: Byte; // invertiert - low=on!
  ButtonDown[@ButtonTemp, 5]  : bit;
  ButtonUp[@ButtonTemp, 4]  : bit;
  ButtonEnter[@ButtonTemp, 3]  : bit;  // Inkrementalgeber-Druck

  MPXA0[@PortC, 2]  : bit;
  MPXA1[@PortC, 3]  : bit;
  MPXU[@PortC, 4]  : bit;
  MPXI[@PortC, 5]  : bit;
  MPX1864[@PortC, 6]  : bit;
  OutputEnable[@PortC, 7]  : bit;

  RangeSw[@PortB, 5]  : bit;
  Relais1[@PortB, 2]  : bit;  // HiInput-Relais (24V)
  Relais2[@PortB, 3]  : bit;  // LowInput-Relais (12V)
  CurrentLimSense[@PinD, 4]  : bit;

  PWonTime, PWoffTime, PWcounter: Integer;
  PWonOff:Boolean;

  ADCUoffset, ADCIoffset:Integer;
  DACrawUon, DACrawUoff,DACrawI:Word;
  ADCrawU,ADCrawI:Word;
  AD16long:LongInt;
  Temperature,Switchpoint:Float;   // Umschaltpunkt U Low/ High
  TemperatureTimer:byte;
  DACtemp, ADCtemp:word; // für Interrupt-IO
  LevelByteHi, LevelByteLo: byte;

  I2CslaveAdr:byte; // I2C IO Slave Adresse

//Parameter
  RipplePercent: Integer;
  DCVolt, DCVoltMod, RippleVoltage,
{ mcb } DCWatt : Float;
  DCVoltIntegrated, DCAmpIntegrated,
  RelaisVoltLow, RelaisVoltHigh : float;  //Spannung in V, 0..20
  DCAmp, DCAmpMod: float; // Strom in A, 0..2,000

  DACLSBUarray: Array [0..1] of Float;  // Spannung eines LSBits, 2 Bereiche, Output
  DACLSBIarray: Array [0..3] of Float;  // Strom eines LSBits, 4 Bereiche, Output

  ADCLSBUarray: Array [0..1] of Float;  // Spannung eines LSBits, 2 Bereiche, Output
  ADCLSBIarray: Array [0..3] of Float;  // Strom eines LSBits, 4 Bereiche, Input

  Options:byte;  // Bit 0=1: LTC1655 statt 1257, Bit 1=1: LTC1864 statt interner DAC
  DAC16present[@Options, 0]  : bit;
  ADC16present[@Options, 1]  : bit;
  DCPpresent[@Options, 2]  : bit;
  DACmax:LongInt;
  
  CmdWhich: tCmdWhich;
  SubCh, CurrentCh       : byte;
  OmniFlag, verbose: boolean;
  
  Param :float;
  ParamInt       : Integer;
  ParamByte:Byte;
  SerInpStr      : String[63];
  SerInpPtr:byte;
  Prefix:char;
  UIToggle:Boolean;  //für Interrupt I- oder U-DAC/ADC
  IRange, oldIRange, IAutoRange: byte;
  URange, oldUrange: byte;
  RelaisState, oldRelaisState: boolean; // Relais auf Low- oder High-Bereich
  URangeHigh: Boolean;
  DisplayTimer,RelaisTimer:Systimer;
  DisplayToggle:Byte;
  ActivityTimer:Systimer8;
  IncrTimer:Systimer8;
  IntegrateTimer:Systimer8;
  LCDpresent: boolean;
  Modify:tModify;
  TrackChannel:byte;
  IncrValue,OldIncrValue: LongInt;
  IncrFine,FirstTurn:Boolean;
  IncrAccFloat,IncFineDiv, IncCoarseDiv:Float;
  IncrDiff,IncrAccInt10, IncRast:Integer;
  IncrDiffByte:Byte;
  digits, nachkomma:byte;
  ChangedFlag:Boolean;

  TempF:Float;
//für Parser
  ParamStr:string[40]; // auch für Display

  CheckLimitErr: tError;
  Status:byte;  // 0..3 Fehlernummer
  BusyFlag[@Status, 7]  : bit;
  UserSRQFlag[@Status, 6]  : bit;
  OverloadFlag[@Status, 5]  : bit;  // gleichzeitig CurrentMode-Flag, wenn Fault-Bits nicht gesetzt
  EEUnlocked[@Status, 4]  : bit; // EEPROM-unlocked-Flag

  FaultFlags, ButtonNumber:byte;
  OverTemp[@FaultFlags, 3]  : bit;
  OverVolt[@FaultFlags, 2]  : bit;
  FuseBlown[@FaultFlags, 1]  : bit;
  OverPower[@FaultFlags, 0]  : bit;
  ErrCount:integer;
  ErrFlag:boolean;

  FaultTimer, ToggleTimer:byte;
  NoToggle: Boolean; // Alternierende Anzeige RippleVoltage Soll

  ADSC10[@ADCSRA, 6]:bit;

// mcb -->
   Wh : Float;
   Ah : Float;
   CurrAmp  : Float;
   CurrVolt : Float;
// <-- mcb


{$NOSAVE}

{###########################################################################}

{$NOSAVE}
{$I DCG-HW.pas}

procedure SetLM75Temp;
// LM75 Lüfter-Schalt-Temperatur °C in Param
var aInt: Integer;
begin
   TWIout(I2CslaveAdr, 1, 4); // Optionsregister invertierter Ausgang

   aInt:=integer(Param*2);
   aInt:= swap(aInt shl 7);
   TWIout(I2CslaveAdr, 3, aInt);  // Tos-Register wählen

   aInt:=integer(Param*2)-6; // Hysteresis 3°C
   aInt:= swap(aInt shl 7);
   TWIout(I2CslaveAdr, 2, aInt);  // Thyst-Register wählen
   TWIout(I2CslaveAdr, 0);
end;

procedure GetLM75Temp;
// liefert LM75 Ist-Temperatur °C in Param
var aInt: Integer;
begin
  TWIout(I2CslaveAdr, 0);
  TWIinp(I2CslaveAdr, aInt);
  aInt:= swap(aInt) shr 7;
  Temperature:=float(aInt)/2;
end;

procedure InitScales;
var aInt:Integer; Ufac, myADCmax,myDACmax:Float;
//Frequenz und Settings aus EEPROM holen
begin
  aInt:=integer(InitOptions); // Bit 0=1: LTC1655 statt 1257, Bit 1=1: LTC1864 statt interner DAC
  Options:=byte(aInt);
  if DAC16present then
    Ufac:=2*Uref;       // LTC1655 intern 2fache Verstärkung
    myDACmax:=65536;
  else
    Ufac:=Uref;
    myDACmax:=4096;
  endif;
  if ADC16present then
    myADCmax:=65536;
  else
    myADCmax:=1024;
  endif;
  DACLSBUarray[0]:=Ufac*InitGainOut/(myDACmax*DACUscales[0]);
  DACLSBUarray[1]:=Ufac*InitGainPre*InitGainOut/(myDACmax*DACUscales[1]);
  for i:=0 to 1 do
    ADCLSBUarray[i]:=  ADCUfacs[i]*ADCUscales[i]*Uref*InitGainOut/myADCmax;
  endfor;

  Ufac:=Ufac*InitGainI;  // Spannungsteiler nach DAC-I auf 1/4 (0.25), R34, R33
  for i:=0 to 3 do
    // mA pro LSBit für 4 Bereiche, Output:
    DACLSBIarray[i]:=(Ufac/RSenseArray[i])/(myDACmax*DACIscales[i]);
    // mA pro LSBit für 4 Bereiche, Input:
    ADCLSBIarray[i]:=(ADCIscales[i]*Uref/(2*RSenseArray[i]))/myADCmax; // X2 durch U11
  endfor;
  DACmax:=LongInt(myDACmax-1); // für SetLevelDAC
  Switchpoint:=InitSwitchU;
  TrackChannel:=TrackChSave;
  Param:=InitFanOnTemp;
  I2CslaveAdr:=$48;
  SetLM75Temp;
  RelaisVoltLow:=InitHystLow;
  RelaisVoltHigh:=InitHystHigh;
  DCVoltMod:=1;
  RipplePercent:=integer(InitRipplePercent);
  PWonTime:=Integer(InitTonTime);
  PWoffTime:=Integer(InitToffTime);
  PWcounter:=Integer(InitTonTime);
end;


{###########################################################################}

//DCG-Funktionen

procedure SetShunt(myIRange:Byte);
begin
  case myIRange of
    DC2mA:
      MPXA0:= high;  //Shunt-Umschalter 470R
      MPXA1:= high;
      |
    DC20mA:
      MPXA0:= low;  //Shunt-Umschalter 47R
      MPXA1:= high;
      |
    DC200mA:
      MPXA0:= high;  //Shunt-Umschalter 4R7
      MPXA1:= low;
      |
  else
      MPXA0:= low;  //Shunt-Umschalter R0.47
      MPXA1:= low;
  endcase;
end;

procedure CalcRangeI;
begin
  IRange:=DC2mA;
  for i:=0 to 3 do
    if DCAmp > ImaxArray[i] then
      inctolim(IRange,DC2A);
    endif;
  endfor;

end;

procedure SetLevelDAC;
//Spannungs- und Stromeinstellung nach DCVolt und DCAmp
var
  myDAC:longInt; myOffset:Integer;
begin
//Berechnung des Range-Wertes für Strom
  CalcRangeI;
  if IRange<>oldIrange then
    disableInts;
    DACrawI:=0;  // kurz abschalten
    enableInts;
// DACrawI wird vom Interrupt übernommen, Wandlung abwarten
    mdelay(4);  // Wandlungszeit auf 0
    SetShunt(IRange);
  endif;
  oldIrange:=IRange;
  IAutoRange:=IRange;
//Berechnung des DAC-Wertes für Strom
  myDAC:=LongInt((DCAmp*DCAmpMod)/DACLSBIarray[IRange]+0.5)+longInt(DACIoffsets[IRange]);
  if myDAC>DACmax then
    myDAC:=DACmax;
  endif;
  if myDAC<0 then
    myDAC:=0;
  endif;
  disableInts;
  DACrawI:=word(myDAC);
  enableInts;

//Berechnung des DAC-Wertes für Spannung
// DACrawU wird vom Interrupt übernommen
  URange:=Ulow;
  if DCVolt>Switchpoint then
    URange:=Uhigh;
  endif;
  if URange<>oldUrange then
    DCVoltMod:=1; // Prozent-Faktor rücksetzen
    disableInts;
    DACrawUon:=0;  // kurz abschalten
    DACrawUoff:=0;  // kurz abschalten
    enableInts;
    mdelay(4);  // IRQ-MPX etwas Zeit lassen
    RangeSw:=boolean(URange);
  endif;
  oldUrange:=URange;
  myDAC:=LongInt((DCVolt*DCVoltMod)/DACLSBUarray[Urange]+0.5)+longInt(DACUoffsets[Urange]);
  if myDAC>DACmax then
    myDAC:=DACmax;
  endif;
  if myDAC<0 then
    myDAC:=0;
  endif;
  disableInts;
  DACrawUon:=word(myDAC);
  enableInts;
  if (PWoffTime>0) and (RipplePercent>0) then
    myDAC:=myDAC*longInt(Integer(100)-RipplePercent) div 100;
  endif;
  disableInts;
  DACrawUoff:=word(myDAC);
  enableInts;
end;

procedure GetVoltage;
//Istwert Spannung vom ADC holen
var
  myADC:longInt;
begin
  if ADC16present then
    disableInts;
    myADC:=longInt(ADCrawU);
    enableInts;
  else
    myADC:=longInt(getadc10(3));
  endif;
  myADC:=myADC+longInt(ADCUoffsets[Urange]);
  Param:=float(myADC)*ADCLSBUarray[Urange];
end;

procedure getInputVoltage;
//Istwert Spannung vom ADC holen
begin
  Param:=float(getadc10(5))*Uref*0.01855;
end;

procedure GetCurrent;
var
  myADC:longInt;
begin //Istwert Ausgangsstrom
  if ADC16present then
    disableInts;
    myADC:=longInt(ADCrawI);
    enableInts;
  else
    myADC:=longInt(getadc10(4));
  endif;
  myADC:=myADC+longInt(ADCIoffsets[Irange]);
  Param:=float(myADC)*ADCLSBIarray[Irange];
end;

{###########################################################################}

procedure IncFacI;
begin
  IncCoarseDiv:=100;
  IncFineDiv:=10000;
  if Param >= 1 then
    IncFineDiv:=1000;
  endif;
{$IFDEF DEBUG}
   write(Serout, 'IncFacI');
   SerCRLF;
{$ENDIF}
end;

procedure IncFacU;
begin
  IncCoarseDiv:=10;
  IncFineDiv:=1000;
  if Param >= 1 then
    IncFineDiv:=100;
  endif;
{$IFDEF DEBUG}
   write(Serout, 'IncFacU');
   SerCRLF;
{$ENDIF}
end;

procedure RoundIncParam;
var TempParam:Integer;
begin
  if not IncrFine then
    TempParam:=round(Param*IncCoarseDiv);  // einmalig runden
    Param:=float(TempParam)/IncCoarseDiv;
    FirstTurn:=false;
{$IFDEF DEBUG}
    write(Serout, 'RoundInc');
    SerCRLF;
{$ENDIF}
  endif;
end;

procedure SetAccParam;
begin
   if IncrFine then
     IncrAccFloat:=IncrAccFloat/IncFineDiv;
   else
     IncrAccFloat:=IncrAccFloat/IncCoarseDiv;
   endif;
   Param:=Param + IncrAccFloat;
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
    if (FaultFlags<>0) or (myErr=NoErr) then
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
    if OverloadFlag then  // DCG-spezifisch!
      Serout(#32);
      write(serout,'[ICONST]');
    endif;
  endif;
  SerCRLF;
end;

{###########################################################################}

procedure ParamToStr;
begin
  if Param<=0 then
    ParamStr:='0.000';
  else
    ParamStr:=floatToStr(Param:digits:nachkomma:'0');
  endif;
end;

procedure SendTrackCmd;
// anderes Netzteil trackem
begin
  if TrackChannel<>255 then
    Serout(char(TrackChannel+48)); // Moduladresse Target
    Serout(':');
    write(Serout, '0'); // Target-Kanal Volt
    Serout('=');
    Param:=DCVolt;
    ParamToStr;
    write(Serout, ParamStr);
    Serout('!');
    SerCRLF;
    Serout(char(TrackChannel+48)); // Moduladresse Target
    Serout(':');
    write(Serout, '1'); // Target-Kanal mA
    Serout('=');
    Param:=DCAmp;
    ParamToStr;
    write(Serout, ParamStr);
    Serout('!');
    SerCRLF;
  endif;
end;

procedure Setcursor(fullCursor:boolean);
var myCursor: char;
begin
  myCursor:=#1; // Default hohler Cursor, Istwert
  if fullCursor then
    if IncrFine then
      myCursor:=#2; // schraffiert
    else
      myCursor:=#0; // voller Cursor, Sollwert
    endif;
  else
    if (not NoToggle) and (Modify = Volt) then
      myCursor:=#0; // voller Cursor, Sollwert
    endif;
  endif;
  If Modify = Ampere then
    LCDxy_M(LCD_m1, 7, 1); // Cursor unten
    lcdout_m(myCursor);
    LCDxy_M(LCD_m1, 7, 0); // Punkt/Leerzeichen oben
  else
    LCDxy_M(LCD_m1, 7, 0); // Cursor sonst oben
    lcdout_m(myCursor);
    LCDxy_M(LCD_m1, 7, 1); // Punkt/Leerzeichen unten
  endif;
  if NoToggle then
    lcdout_m(#32);
  else
    if ToggleTimer<8 then
      lcdout_m(#4);
    else
      lcdout_m(#5);
    endif;
  endif;
end;

// mcb -->
procedure IstLeistungOnLCD;
begin
  digits:=5;
  nachkomma:=3;
  Param:=CurrVolt*CurrAmp;
  if Param < 0.001 then
    Param:=0;
  endif;
  ParamToStr;
  setlength(ParamStr,5);
  LCDxy_M(LCD_m1, 0, 0);
  write(lcdout_m,ParamStr+' W'+#1);
end;

procedure CapOnLCD;
Var
   lUnit : String[4];
begin
  Param:=Ah;
  digits:=5;
  lUnit := 'Ah';
  If Ah < 100 Then
     nachkomma:=2;
  EndIf;
  If Ah < 10 Then
     nachkomma:=3;
  EndIf;
  If Ah < 0.1 Then
     Param := Param*1000;
     lUnit := 'mAh';
     digits:=4;
     nachkomma:=1;
  EndIf;
  If Ah < 0.01 Then
     nachkomma:=2;
  EndIf;
{  If Ah < 0.01 Then
     nachkomma:=3;
  EndIf;
  }
  ParamToStr;
  setlength(ParamStr,digits);
  LCDxy_M(LCD_m1, 0, 0);
  write(lcdout_m,ParamStr+lUnit+#1);

  Param:=Wh;
  digits:=5;
  lUnit := 'Wh ';
  If Wh < 100 Then
     nachkomma:=2;
  EndIf;
  If Wh < 10 Then
     nachkomma:=3;
  EndIf;
  If Wh < 0.1 Then
     Param := Param*1000;
     lUnit := 'mWh ';
     digits := 4;
     nachkomma:=1;
  EndIf;
  If Wh < 0.01 Then
     nachkomma:=2;
  EndIf;
{
  If Wh < 0.01 Then
     nachkomma:=3;
  EndIf;
  }
  ParamToStr;
  setlength(ParamStr,digits);
  LCDxy_M(LCD_m1, 0, 1);
  write(lcdout_m,ParamStr+lUnit);
end;

// <-- mcb

procedure SpannungOnLCD;
begin
  digits:=5;
  nachkomma:=3;
  if Param>9.999 then
    nachkomma:=2;
  endif;
  ParamToStr;
  LCDxy_M(LCD_m1, 0, 0);
  write(lcdout_m,ParamStr);
  lcdout_m(#32);
  lcdout_m('V');
end;

procedure IstSpannungOnLCD;
begin
  if NoToggle or (not CurrentLimSense) then
    Param:=DCVoltIntegrated;        // Istwertanzeige U
  else
    if ToggleTimer<8 then
      Param:=DCVolt;     // Sollwertanzeige U wenn kein Current Mode
    else
      Param:=DCVolt-RippleVoltage; // alternierend abzüglich Ripple-Spannung
    endif;
  endif;
  SpannungOnLCD;
end;

procedure SollSpannungOnLCD;
begin
  Param:=DCVolt;
  SpannungOnLCD;
end;

procedure Prefix_I(mAdisp:boolean);
begin
  Prefix:=#32;
  if (Param < 1.0) and mAdisp then // wenn außerhalb 2A-Bereich, mA anzeigen
    Param:=Param*1000;
    Prefix:='m';
  endif;
end;

procedure ParamStrOnLCDlower;
begin
  LCDxy_M(LCD_m1, 0, 1);
  write(lcdout_m,ParamStr);
end;

procedure FaultsOnLCD;
begin
  case DisplayToggle of
  0,1:
    if OverTemp then
      ParamStr:='OVRTEMP ';
      ParamStrOnLCDlower;
    endif;
    |
  2,3:
    if OverVolt then
      ParamStr:='OVRVOLT ';
      ParamStrOnLCDlower;
    endif;
    |
  4,5:
    if FuseBlown then
      ParamStr:='FUSEBLW ';
      ParamStrOnLCDlower;
    endif;
    |
  endcase;
  inc(DisplayToggle);
  if DisplayToggle>7 then
    DisplayToggle:=0;
  endif;
end;

procedure StromOnLCD;
begin
  digits:=5;
  nachkomma:=3;
  ParamToStr;
  setlength(ParamStr,5);
  ParamStrOnLCDlower;
  lcdout_m(Prefix);
  lcdout_m('A');
  if NoToggle then
    lcdout_m(#32);
  else
    if ToggleTimer<8 then
      lcdout_m(#4);
    else
      lcdout_m(#5);
    endif;
  endif;
  FaultsOnLCD;
end;

procedure IstStromOnLCD;
begin
  GetCurrent;
  Prefix_I(IRange<>DC2A);
  StromOnLCD;
end;

procedure SollStromOnLCD;
begin
  Param:=DCAmp;
  CalcRangeI;
  Prefix_I(true);
  StromOnLCD;
end;

procedure IntegerOnLCD;
begin
  write(lcdout_m,IntToStr(ParamInt));
end;

procedure OptionsOnLCD;
begin
  ParamStr:=MenuStrArr[ord(Modify)];
  ParamStrOnLCDlower;
  LCDxy_M(LCD_m1, 0, 0);
  LCDclreol_M(LCD_m1);
  case Modify of
  // mcb -->
    CapMenu:
      CapOnLCD;
       |
    PwrMenu:
      IstLeistungOnLCD;
      |
    T_on:
      ParamInt:=PWonTime;
      IntegerOnLCD;
      |
    T_off:
      ParamInt:=PWoffTime;
      IntegerOnLCD;
      |
    Ripple:
      ParamInt:=RipplePercent;
      IntegerOnLCD;
      |
    TrackCh:
      if TrackChannel=255 then
        write(lcdout_m,'OFF');
      else
        ParamInt:=Integer(TrackChannel);
        IntegerOnLCD;
      endif;
      |
  endcase;
  if modify < CapMenu then
     LCDxy_M(LCD_m1, 7, 0);
     lcdout_m(#0);
  endif;
// <-- mcb
  FaultsOnLCD;
end;

procedure WerteOnLCD;
begin
  if (Modify>Volt) then
    OptionsOnLCD;
  else
    SollSpannungOnLCD;
    SollStromOnLCD;
    SetCursor(true);
  endif;
  FaultsOnLCD;
end;

procedure WriteParamSer;
begin
  ParamToStr;
  WriteChPrefix;
  write(serout,ParamStr);
  SerCRLF;
end;

procedure WriteParamIntSer;
begin
  ParamStr:= IntToStr(ParamInt);
  ParamStr:= trim(ParamStr);
  WriteChPrefix;
  write(Serout, ParamStr);
  SerCRLF;
end;

procedure CheckLimits;
begin
  CheckLimitErr:=NoErr;
  if DCVolt < 0 then
    DCVolt:=0;
    CheckLimitErr:=ParamErr;
  endif;
  if DCVolt > Umax then
    DCVolt:=Umax;
    CheckLimitErr:=ParamErr;
  endif;
  if DCAmp < 0 then
    DCAmp:=0;
    CheckLimitErr:=ParamErr;
  endif;
  if DCAmp > Imax then
    DCAmp:=Imax;
    CheckLimitErr:=ParamErr;
  endif;
  if PWonTime < 2 then
    PWonTime:=2;
    CheckLimitErr:=ParamErr;
  endif;
  if PWoffTime < 0 then
    PWoffTime:=0;
    CheckLimitErr:=ParamErr;
  endif;
  if RipplePercent < 0 then
    RipplePercent:=0;
    CheckLimitErr:=ParamErr;
  endif;
  if RipplePercent > 100 then
    RipplePercent:=100;
    CheckLimitErr:=ParamErr;
  endif;
  if Modify >= tModify(128) then
    Modify:= Ampere;
    CheckLimitErr:=ParamErr;
  endif;
// mcb -->
  if Modify>PwrMenu then
    Modify:= Ampere;
// <-- mcb
    CheckLimitErr:=ParamErr;
  endif;
  if Trackchannel >= 128 then
    TrackChannel:=255;
  else
    if Trackchannel > 7 then
      TrackChannel:=7;
    endif;
  endif;
  NoToggle:=(RipplePercent=0);
  if noToggle then
    RippleVoltage:=0;
  else
    RippleVoltage:=float(RipplePercent)*DCVolt/100.0;
  endif;
end;


{###########################################################################}

{$I DCG-Parser.pas}

procedure SwitchRelais;
begin
  If not (OverTemp or OverVolt) then
    if (RelaisState<>oldRelaisState) then
      if RelaisState = high then
        Relais2:=low;
        mdelay(10);
        Relais1:=high;
      else
        Relais1:=low;
        mdelay(10);
        Relais2:=high;
      endif;
    endif;
    oldRelaisState:=RelaisState;
  endif;
end;

procedure FaultCheck;
begin
  if DCPpresent then
    if TemperatureTimer=0 then
      TemperatureTimer:=20;
      I2CslaveAdr:=$48;
      GetLM75temp;
    endif;
    dec(TemperatureTimer);
  else
    Temperature:=0;
  endif;
  if Temperature>70 then
    Overtemp:=true;
    Relais1:=low;
    Relais2:=low;
  else
    if OverTemp then // mit unterem Bereich neu starten
      RelaisState:=low;
      oldRelaisState:=high;
    endif;
    OverTemp:=false;
  endif;
  getInputVoltage;
  Param:=Param-2;  // zulässige Eingangsspannung berechnen
  if DCVoltIntegrated>Param then // Q12 defekt?
    OverVolt:=true;
    Relais1:=low;
    Relais2:=low;
  else
    if OverVolt then // mit unterem Bereich neu starten
      RelaisState:=low;
      oldRelaisState:=high;
    endif;
    OverVolt:=false;
  endif;
  FuseBlown:=(Param < 5.0); // Eingangsspannung fehlt
  if FuseBlown then
    OverVolt:=false;
  endif;
  if FaultFlags <> 0 then
    OverloadFlag:=true;
  endif;
end;

procedure Chores;
var myVolt: Float;
// Regelmäßig außerhalb des Interrupts aus CheckSer heraus aufgerufen
begin
  LED_CurrentLimit:= not CurrentLimSense;
  if isSystimerZero(IntegrateTimer) then
    SetSystimer(IntegrateTimer, 40);
// mcb -->
    GetCurrent;
    CurrAmp := Param;
    DCAmpIntegrated:=(DCAmpIntegrated*7+Param)/8;
// <-- mcb
    GetVoltage;
    // mcb -->
    CurrVolt := Param;
// <-- mcb
    DCVoltIntegrated:=(DCVoltIntegrated*7+Param)/8;

    if CurrentLimSense then
      myVolt:=DCVolt;
    else
      myVolt:=DCVoltIntegrated;
    endif;
    
    if (myVolt > RelaisVoltHigh) and (not OverloadFlag) then
      RelaisState:=high;
    endif;
    if isSystimerZero(RelaisTimer) then
      setsysTimer(RelaisTimer,2000);
      if myVolt < RelaisVoltLow then
        RelaisState:=low;
      endif;
    endif;

    FaultCheck;
    if FaultFlags = 0 then
      OverloadFlag:=not CurrentLimSense;
    endif;
    if FaultTimer = 0 then  // regelmäßig ausgeben
      if FaultFlags<>0 then
        SerPrompt(OvlErr);
      endif;
      FaultTimer := 10;
    endif;
    dec(FaultTimer);
  endif;
  SwitchRelais;
  NoToggle:=(RipplePercent=0);
end;

procedure CheckSer;
var
myChar: char;
begin
  while SerInp_TO(myChar,20) do // 20 ms Timeout
//    serout(mychar); // Echo Character
    if myChar in [#32..#127] then // nur 7-Bit-ASCII ohne Controls
      append(myChar,SerInpStr);
    endif;
    if mychar=#8 then // Backspace
      setlength(SerInpStr, length(SerInpStr)-1);
    endif;
    if myChar=#13 then
      Chores;
      ParseSubCh;           //Befehl interpretieren, wenn für uns
      SerInpStr:='';
    endif;
  endwhile;
  Chores;
end;

procedure CheckDelay(myDelay:byte);
// Delay mit serieller Abfrage in 20-ms-Schritten
var mycount:byte;
begin
  for mycount:=1 to mydelay do
    CheckSer;
  endfor;
end;

// mcb -->
Procedure onTickTimer(SaveAllRegs); // onTickTimer(SaveAllRegs);
begin
   If RipplePercent > 0 Then
      Ah := 0;
      Wh := 0;
   Else
      If CurrAmp < 0.00001 then
         CurrAmp := 0;
      EndIf;
      Ah := Ah + CurrAmp/(3600*5);
      Wh := Wh + CurrAmp*CurrVolt/(3600*5);
   EndIf;
end;
// <-- mcb


{###########################################################################}

procedure initall;
//nach Reset aufgerufen
begin
// TEST
{  nop;
  SerInpStr:='0:str?';
  ParseSubCh(false);    }
//TEST ENDE

  DDRB:=  DDRBinit;            {PortB dir}
  PortB:= PortBinit;           {PortB}
  DDRC:=  DDRCinit;            {PortC dir}
  PortC:= PortCinit;           {PortC}
  DDRD:=  DDRDinit;            {PortD dir}
  PortD:= PortDinit;           {PortD}
  
  i:=EESerBaudReg;
  if not i in [9..239] then
    EESerBaudReg:=51;
    i:=51;
  endif;
  ubrr1:=i;
  UCSRA:=UCSRA or 2; // Set U2X bit
//  ADMUX:= ADMUX OR %11000000;  {Internal ADC Reference}

//  serBaud(EESerbaud);        // nur mit 644

  udelay(1);
  SlaveCh:= (not PinD) shr 5;
  
  LEDactivity:= low;

  if LCDsetup_M(LCD_m1) then
    LCDcursor_M(LCD_m1, false, false);
    LCDCharSet_M(LCD_m1, #0, $01, $03, $07, $0F, $07, $03, $01, $00); {"<" Cursor voll}
    LCDCharSet_M(LCD_m1, #1, $01, $03, $05, $09, $05, $03, $01, $00); {"<" Cursor hohl}
    LCDCharSet_M(LCD_m1, #2, $01, $02, $05, $0A, $05, $02, $01, $00); {"<" Cursor schraffiert}
    LCDCharSet_M(LCD_m1, #3, $0E, $11, $11, $11, $0A, $0A, $1B, $00); // Ohm, Omega
    LCDCharSet_M(LCD_m1, #4, $00, $0E, $1F, $1F, $1F, $0E, $00, $00); // Punkt gefüllt
    LCDCharSet_M(LCD_m1, #5, $00, $0E, $11, $15, $11, $0E, $00, $00); // Punkt hohl

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
  
  Status:=0;
  EnableInts;
  while serstat do
    i:=SerInp;
  endwhile;
  InitScales;
  DCAmpMod:=1;
  DCVolt:=0;
  DCAmp:=InitAmp;
  oldUrange:=255; // Umschalten erzwingen
  oldIrange:=255;
  CalcRangeI;
  SetLevelDAC; // Anfangswerte
  
  IncRast:=integer(InitIncRast);
  Modify:=Volt;
  IncrCount4start;
  SetIncrVal4(0,0);
  IncrValue:=GetIncrVal4(0);
  OldIncrValue:= IncrValue;
  IncrFine:=false;
  IncrDiff:=0;
  FirstTurn:=true;
  SubCh:=254;
  WriteChPrefix;
  write(serout,Vers1Str);
  SerCRLF;
  CurrentCh:=255; // erstmal keine Reaktion
  OutputEnable:=high;
  mdelay(10);
  DCVolt:=InitVolt;
  SetLevelDAC; // Anfangswerte
  oldRelaisState:=high;
  RelaisState:=low;
  SwitchRelais;
  ErrCount:=0;
  mdelay(200); // Interrupt-DAC stabilisieren
  FaultCheck; // in Param ist jetzt Eingangsspannung
  if FuseBlown then  // Eingangsspannung fehlt
    Serprompt(FuseErr);
  endif;
// mcb -->
  TickTimerTime (200000);      // Alle 200mSec Ah und Wh berechnen
  TickTimerStart;
  Ah := 0;
  Wh := 0;
// <-- mcb
  NoToggle:=(RipplePercent=0);
end;

{###########################################################################}

begin
  Initall;
//Hauptschleife
  loop
    CheckSer;  // Serinp parsen, nicht busy
    if isSystimerZero(ActivityTimer) then
      LEDactivity:=high; // LED aus
    endif;
    if LCDpresent then
      verbose:=true; // für Bediener-Aktivitäten
      IncrValue:=GetIncrVal4(0);
// Inkrementalgeber löst in Zweierschritten auf, deshalb der Umstand
      if (IncrValue<>OldIncrValue) then
        SetSystimer(ActivityTimer, 250);
        FaultTimer := 0;
        LEDactivity:=low;
        IncrDiff:=IncrDiff + integer(IncrValue-OldIncrValue);
        OldIncrValue:= IncrValue;
        SetSystimer(IncrTimer, 200);
        if abs(IncrDiff)>= IncRast then // erst wenn n Impulse gezählt
          ChangedFlag:=true;
          BusyFlag:=true;
          IncrDiff:=IncrDiff div IncRast;
// verbesserte Beschleunigungsfunktion, hier für 20 ms Schleifenzeit
          IncrAccInt10:=sgn(IncrDiff);     // hier als Sign benutzt
          IncrDiffByte:=byte(IncrDiff);    // Byte ohne Beschleunigung
          IncrDiff:=IncrAccInt10 * IncrAccArray[byte(abs(IncrDiff))];
{
//Incrdiff-Kontrolle
          write(Serout, IntToStr(IncrDiff));
          Serout(#13);
          Serout(#10);
}
          IncrAccInt10:=IncrDiff*10; // 40x Differenz mit Beschleunigung
          IncrAccFloat:=float(IncrDiff);
          SetSystimer(DisplayTimer, 1500); // für Feineinstellung
          DCAmpMod:=1; // Prozent-Faktor bei Bedienung rücksetzen
          case Modify of
          Volt:
            Param:=DCVolt;
            if FirstTurn then
              IncFacU;
              RoundIncParam;
              ButtonNumber:=4; // Button Inkrementalgeber
              serprompt(UserReq);
            endif;
            SetAccParam;
            DCVolt:=Param;
            DCVoltMod:=1;
            CheckLimits;
            SollSpannungOnLCD;
            IstStromOnLCD;
            SetCursor(true);
            SubCh:=0;
            ParseGetParam;
            |
          Ampere:
            CalcRangeI;
            Param:=DCamp;
            if FirstTurn then
              IncFacI;
              RoundIncParam;
              ButtonNumber:=4; // Button Inkrementalgeber
              serprompt(UserReq);
            endif;
            SetAccParam;
            DCamp:=Param;
            DCAmpMod:=1;
            CheckLimits;
            SollStromOnLCD;
            IstSpannungOnLCD;
            SetCursor(true);
            SubCh:=1;
            ParseGetParam;
            |
          T_on:
            if FirstTurn then
              ButtonNumber:=4; // Button Inkrementalgeber
              serprompt(UserReq);
              FirstTurn:=false;
            endif;
            PWonTime:=PWonTime+(IncrDiff*2);
            CheckLimits;
            SubCh:=27;
            ParseGetParam;
            OptionsOnLCD;
            |
          T_off:
            if FirstTurn then
              ButtonNumber:=4; // Button Inkrementalgeber
              serprompt(UserReq);
              FirstTurn:=false;
            endif;
            PWoffTime:=PWoffTime+(IncrDiff*2);
            CheckLimits;
            SubCh:=28;
            ParseGetParam;
            OptionsOnLCD;
            |
          Ripple:
            if FirstTurn then
              ButtonNumber:=4; // Button Inkrementalgeber
              serprompt(UserReq);
              FirstTurn:=false;
            endif;
            RipplePercent:=RipplePercent+IncrDiff;
            CheckLimits;
            SubCh:=29;
            ParseGetParam;
            OptionsOnLCD;
            |
          TrackCh:
            TrackChannel:=Trackchannel+byte(IncrDiff);
            CheckLimits;
            OptionsOnLCD;
            |
          endcase;
          SetLevelDAC;
          IncrDiff:=0; // für nächsten Durchlauf
        endif;
      endif;
      Checkdelay(1); // wichtig für Beschleunigungsfunktion
      ButtonTemp := (LCDportInp_M(LCD_m1) or %11000111);
      if ButtonTemp <> $FF then
        Checkdelay(1);
        verbose:=true;
        ButtonTemp := (LCDportInp_M(LCD_m1) or %11000111);
        if ButtonTemp <> $FF then
          SetSystimer(DisplayTimer, 1000); // Zeit für Sollwerte
{ mcb }          if (not ButtonEnter) and (Modify in [Ampere,Volt,CapMenu]) then
            IncrFine:=not IncrFine;
            SetSystimer(DisplayTimer, 1500); // etwas länger für Feineinstellung
            ButtonNumber:=3; // Button Enter/Fine
            serprompt(UserReq);
            SollSpannungOnLCD;
            SollStromOnLCD;
            SetCursor(true);
// mcb -->
            if modify=CapMenu then
               Ah := 0;
               Wh := 0;
            EndIf;
// <-- mcb

          endif;
          if not ButtonDown then
            ButtonNumber:=1; // Button Down
            serprompt(UserReq);
            if modify=TrackCh then
              TrackChSave:=TrackChannel;  // beim Verlassen in EEPROM merken
            endif;
// mcb -->
            if modify=Ampere then
              modify := PwrMenu;
            else
              dec(modify);
// <-- mcb
            endif;
          endif;
          if not ButtonUp then
            ButtonNumber:=2; // Button Up
            serprompt(UserReq);
// mcb -->
            if modify=PwrMenu then
              modify := Ampere;
            else
              inc(modify);
// <-- mcb
            endif;

          endif;
          WerteOnLCD;
          SubCh:=80;
          ParseGetParam;
          DCAmpMod:=1; // Prozent-Faktor rücksetzen
          repeat
            Checkdelay(1);
            ButtonTemp := (LCDportInp_M(LCD_m1) or %11000111);
          until ButtonTemp=$ff;
          ButtonNumber:=0; // kein Button, freigegeben
          serprompt(UserReq);
        endif;
        ToggleTimer:=0;
      endif;
    endif;
    if isSystimerZero(IncrTimer) and LCDpresent then
      SetSystimer(IncrTimer, 200);
      if not FirstTurn then
        SendTrackCmd;
        BusyFlag:=false;
        ButtonNumber:=0; // kein Button, freigegeben
        serprompt(UserReq);
      endif;
      FirstTurn:=true;
    endif;
    if isSystimerZero(DisplayTimer) and LCDpresent then
      SetSystimer(DisplayTimer, 200);
      IncrFine:=false;
      ChangedFlag:=false;
      BusyFlag:=false;
      inc(ToggleTimer);
      if ToggleTimer>=16 then
        ToggleTimer:=0;
      endif;
      if modify <= Volt then
        IstSpannungOnLCD;
        IstStromOnLCD;
        SetCursor(false);
      endif;
// mcb -->
      if modify >= CapMenu then
         WerteOnLCD;
      endif;
// <-- mcb
    endif;
  endloop;
end DCG.

