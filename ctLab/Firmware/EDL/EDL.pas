program EDL;
(*
Elektronische Last EDL, c't-Version
(c) 6/2008 by c't magazin und Carsten Meyer, cm@ctmagazin.de
diverse Ideen und Verbesserungen von Michael Bremicker 9/2008 (mcb)

21.05.2010 #1.784 IstStrom/IstLeistung wird auf 0 gesetzt, wenn Ausgang abgeschaltet
                  Uoff/Ioff wird auf On-Werte gesetzt, wenn Ioff%=100 oder Toff=0
15.05.2010 #1.783 IncRast-Bug behoben, konnte nicht mit SubCh 89 gesetzt werden
                  LowVolt-Meldung kann auch mit Drehgeber-Button im Kapazitäts-Menü
                  zurückgesetzt werden, setzt auch Abschaltspannung auf 0 Volt!
08.04.2009 #1.781  Zusätzlicher externer Temperaturfühler per I2C auslesbar wenn BBEXTERN
10.09.2008 #1.78  2 Temperaturfühler gleichzeitig, Auswahl über Bereich
                  (höchster = extern, sonst intern)
                  mA-Prefix-Bug behoben, LCD-Routinen aufgeräumt
10.09.2008 #1.77  Abgleich in Absprache mit CM, Übernahme der Korrekturen der   // mcb //
                  c't Versionen 1.741 + 1.742.
                  LM75 Temperaturfühler wird auch extern erkannt, wenn
                  InitOptions-Bit 3 gesetzt
                  Anzeigen wieder mit Hohl-Cursor bei Ist-Werten, Menues wie DCG
07.09.2008 #1.76 Kapazitäts-Berechnung und -Anzeige in Ah und Wh hinzu // mcb //
27.08.2008 #1.752 Schreiben in DCV setzt den [LOWVOLT] Error zurück --> für jlab.jar // mcb //
27.08.2008 #1.751 Beschleunigung Drehgeber P-Mode verbessert, Abschaltung bei Spannungs-Unterschreitung // mcb //
23.08.2008 #1.75 constPower hinzu, Bugfix R-Mode Abgleichparameter DACRScales // mcb //
25.06.2008 #1.74 Prozent-Faktor wird nur noch bei Panel-Bedienung zurückgesetzt,
                 ENAMPX aus SetLevelDAC entfernt, führt zu Transienten
                 ">"-Bug in CalcRangeI beseitigt
                 SerPrompt wie DCG neu
22.06.2008 #1.73 aus Platzgründen TrackCh und ADC10 entfernt, OFS und SCL jetzt wie DCG
16.06.2008 #1.72 Trigger-Eingang und Trigger-Masken implementiert
15.06.2008 #1.71 LED2-OverloadFlag-Anzeige, verbesserte I-Einstellung
01.06.2008 #1.70 Psoa-Protection, Parser vervollständigt
20.04.2008 #1.60 Public beta
28.01.2008 #0.10 Übernahme aus ADA-C DDS und DCG

*)

{$DEFINE LCDistSpannung} // IstSpannung auf LCD statt Sollwert
{ $DEFINE I_10Amp} // Imax=10A anstelle 2A
{ $DEFINE DEBUG}         // Debug-Modus mit zusätzlichen ser. Ausgaben


{ $NOSHADOW}
{$W- Warnings}            {Warnings off}
{$TYPEDCONST OFF}
{$DEBDELAY}

//{ mcb } Device = mega644, VCC = 5;
{ mcb } Device = mega32, VCC = 5;

Define_Fuses
Override_Fuses; // optional, always replaces fuses in ISPE
LockBits0 = [];

FuseBits0 = [BODEN,BODLEVEL];  //4,5V Brown-Out
{ mcb } FuseBits1 = [SPIEN,CKOPT,EESAVE];

{// mcb --> für ATMega 644
  FuseBits0      = [SUT1];
  FuseBits1      = [SPIEN, EESAVE];
  FuseBits2      = [BODLEVEL2];
}// <-- mcb
ProgMode = SPI;

Import SysTick, TWImaster, SerPort, { mcb } TickTimer , IncrPort4, LCDmultiPort;   // ADCport,

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
//  IncrScan4      = Timer1, 4; // timer used, scan rate 1kHz (1..100)

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
  tCmdWhich      = (str, idn, chn, val,
{ mcb }             ena, dca, dcp, dcv, dcr, mah, mwh, msv, msa, rng, pow, pca,
                    ron, rof, rip, raw, dsp, all,
                    ofs, scl, opt, tmp, trm, wen, erc, sbd, nop, err);
{ mcb }  tMode          = (OutputOff,IhiVolt,IloVolt,RhiVolt,RloVolt,PhiVolt,PloVolt);
  tModify        = (LowerMainMenu,UpperMainMenu,ModeMenu,T_on,T_off,I_off,TempMenu,RiMenu,CapMenu,PwrCurMenu);   //0..2
  tError = (NoErr, UserReq, BusyErr, OvlErr, SyntaxErr,
                   ParamErr, LockedErr,ChecksumErr);
  tMeas = (Ioff,Uoff,Ion,Uon);
  tDAC= (LTC8043, AD5452, DAC8501, DAC8811);

{--------------------------------------------------------------}
const


//                              ----SFDC             Strobe,FSync,Data,Clk
  DDRBinit                   = %10111011;            {PortB dir }
  PortBinit                  = %11111101;            {PortB, b_STROBE=0 }

  DDRCinit                   = %11111100;            {PortC dir, 2..3=MPX, 4=MPXENA, 5=USWITCH }
  PortCinit                  = %11000011;            {PortC }

{ Jumper und LEDs PortBits }
  DDRDinit                   = %00001100;            {PortD dir, 0..1=Serial }
  PortDinit                  = %11111111;            {PortD }

  BtnInPortReg               = @PinD;   {Taster-Eingangsport}
  LEDOutPort                 = @PortD;   {LED-Port}
  ControlBitPort             = @PortB;   {DDS-Port}
  ControlBitPin              = @PinB;   {DDS-Port}
  MPXPort                    = @PortC;   {OE/Multiplexer-Port}

  b_SCLK                     = 7; //Takt für alle
  b_SDATAOUT                 = 5; //Daten für alle
  b_SDATAIN1                 = 6; //Daten vom ADC LTC2400
  b_STRAD16                  = 4; //LTC2400 Strobe
  b_STRDAC                   = 3; //DAC8501 Load
  b_ADC16sw                  = 1; //ADC16 MPX U9


//Lineal     .----.----.----.----.----.----.----.----.----
{ mcb }  Vers1Str                   :string = '1.784 [EDL by CM/c''t 09/2008]';    //Vers1
{ mcb }  Vers3Str                   :string = 'EDL 1.78';    // Kurzform von Vers1

  FaultStrArr : array[0..4] of String[10] = (
    '[OVRPOWR]',
    '[FUSEBLW]',
    '[OVRVOLT]',
    '[OVRTEMP]',
{ mcb}    '[LOWVOLT]');

  ErrStrArr      : array[0..7] of String[8] = (
    '[OK]','[SRQUSR]','[BUSY]','[OVRLD]','[CMDERR]','[PARERR]',
    '[LOCKED]','[CHKSUM]');

{mcb}  MenuStrArr      : array[0..9] of String[8] = (
    '',
    '',
    'Mode    ',
    'T on  ms',
    'T off ms',
    'I off % ',
    'Temp C  ',
    'IntRes  ',
{ mcb }    '',
{ mcb }    'Pwr/Curr ');
{ mcb }  ModeStrArr      : array[0..6] of String[8] = (
{ mcb }    'off','I HiV  ','I LoV  ','R HiV  ','R LoV  ', 'P HiV  ', 'P LoV  ');

  AdrStr                     = 'Adr ';
  EEnotProgrammedStr         = 'EEPROM EMPTY! ';
  AdjustStr                  = 'Adj R44 ';

  ErrSubCh    = 255;

{ mcb }  CmdStrArr      : array[0..30] of String[3] = (
  'STR', 'IDN', 'CHN', 'VAL',
  'ENA',  // Output Enable, 0=Off
  'DCA',  // Ausgangsstrom
{ mcb }  'DCP',  // Soll-Leistung
{ mcb }  'DCV',  // SAbschaltspannung
  'DCR',  // Soll-Widerstand
{ mcb }  'MAH',  // Messwert Ah
{ mcb }  'MWH',  // Messwert Wh
  'MSV',  // Messwert Ausgangsspannung IST
  'MSA',  // Messwert Ausgangsstrom IST
  'RNG',  // Modus bzw. Range OutputOff..RloVolt
  'MSW',  // verbratene Leistung
  'PCA',  // Prozentwert Ausgangsstrom Soll
  'RON',  // Ripple Time On
  'ROF',  // Ripple Time Off
  'RIP',  // Ripple Off I Percent
  'RAW',  // 50=Rohdaten 2xADC16, 2xADC10  70=DAC
  'DSP',  // 80
  'ALL',  // 99
  'OFS',
  'SCL',
  'OPT',
  'TMP',
  'TRM',  // 240 = Trigger-Maske
  'WEN',  // 250 = Write Enable
  'ERC',  // 251 = ErrCount seit letztem Reset
  'SBD',  // 252 = SerBaud UBRR-Register mit U2X=1
  'NOP');

{ mcb }  Cmd2SubChArr   : array[0..30] of byte = (
  255,254,253,0,
{ mcb }  0,1,3,4,5,7,8,10,11,19,
  18,21,27,28,29,
  50,80,99,
  100,200,150,233,240,250,251,252,0);   // Offsets bei SubCh 100, Skalierungen bei 200

  ShuntA                   = 0;
  ShuntB                   = 1;
  ShuntC                   = 2;
  ShuntD                   = 3;   //0..3, >=4 = AutoRangeSelect

  high                     = true;
  low                      = false;

//Inkrementalgeber-Beschleunigungstabelle
  IncrAccArray: array[0..15] of integer = (0,1,2,5,10,25,50,100,250,
  500,1000,2500,5000,10000,10000,10000);
  TemperatureMax = 70;
//Default-EEPROM-Werte:
{$EEPROM}
structconst
  dummy:LongInt=0;        // diese Speicherstelle wird oft korrumpiert

// Werte für LTC1864, LTC8043

{$IFDEF I_10Amp}
  DACIoffsets:Array[0..3] of Integer = (0, 0, 0, 0);  // 2mA, 20mA, 200mA, 2A
  DACIscales:Array[0..3] of Float = (0.992, 0.995, 0.997, 0.995); // 4 Shunts low I bis high I

  DACRscales:Array[0..3] of Float = (1.00, 1.00, 1.00, 1.00); // 4 Shunts high R bis low R

  ADC16UscaleLow:  Float=1.011;
  ADC16UscaleHigh: Float=1.01;
{
  ADC10UscaleLow:  Float=1.0;
  ADC10UscaleHigh: Float=1.0;
}
  ADCUoffsets:Array[0..1] of Integer = (-260, -260);  // loVolt, hiVolt  wg. LiveZero <0
  ADCIoffsets:Array[0..3] of Integer = (-260, -260, -260, -260);  // 2mA, 20mA, 200mA, 2A
  ADCIscales: Array[0..3] of Float = (1.01, 1.01, 1.01, 1.01);  // 2mA, 20mA, 200mA, 2A

  OptionArray:Array[0..21] of Float =  (
  0.0,                    // 0 InitVolt nicht benutzt
  0.02,                   // 1 InitAmp = 20mA;
  2.5,                    // 2 InitLowDividerU, U-Gain wenn PreAmp ein (PC5/Q1=high)
  10,                     // 3 InitHiDividerU, Istspannungs-Vorteiler
  10,                     // 4 InitGainI, Gain Sense-OpAmp
  2.5,                    // 5 Uref LT1019 = 2.5 V;
  50,                     // 6 Pmax W
  22.00,                  // 7  R sense 1. Bereich nom. 10mA
  2.200,                  // 8  R sense 2. Bereich nom. 100mA
  0.22,                   // 9  R sense 3. Bereich nom. 1000mA
  0.022,                  // 10 R sense 4. Bereich nom. 10A

  0.010,                  // 11 Imax A 1. Bereich, Umschaltpunkt
  0.100,                  // 12 Imax A 2. Bereich, Umschaltpunkt
  1.000,                  // 13 Imax A 3. Bereich, Umschaltpunkt
  10.000,                 // 14 Imax A 4. Bereich, für CheckLimits

  25,                     // 15 UmaxHi maximale Klemmenspannung im HiVolt-Bereich
  6.1,                    // 16 UmaxLo maximale Klemmenspannung im LoVolt-Bereich
  %00001100,              // 17 InitOptions:
  // Bit 0, 1 = DACtype, 0=MAX543/LTC8043, 1=AD5452, 2=SR4094, 3=DAC8811
  // Bit 2: LM75 present auf Adr. $49 oder $48 (wenn externe Endstufe)
  // Bit 3: Externe Endstufe, 1=LM75 auf Adr. $48
  // Bit 4: zweiter externer LM75 auf Adr. $50
  0,                      // 18 InitIpercent
  10,                     // 19 PWonTime
  0,                      // 20 PWoffTime
  50);                    // 21 InitFanOnTemp
{$ELSE} // I_10Amp
  DACIoffsets:Array[0..3] of Integer = (0, 0, 0, 0);  // 2mA, 20mA, 200mA, 2A
  DACIscales:Array[0..3] of Float = (1.00, 1.00, 1.00, 1.00); // 4 Shunts low I bis high I
  DACRscales:Array[0..3] of Float = (1.00, 1.00, 1.00, 1.00); // 4 Shunts high R bis low R

  ADC16UscaleLow:  Float=1.01;
  ADC16UscaleHigh: Float=1.01;
{
  ADC10UscaleLow:  Float=1.0;
  ADC10UscaleHigh: Float=1.0;
}

  ADCUoffsets:Array[0..1] of Integer = (-260, -260);  // loVolt, hiVolt  wg. LiveZero <0
  ADCIoffsets:Array[0..3] of Integer = (-260, -260, -260, -260);  // 2mA, 20mA, 200mA, 2A
  ADCIscales: Array[0..3] of Float = (1.01, 1.01, 1.01, 1.01);  // 2mA, 20mA, 200mA, 2A

  OptionArray:Array[0..21] of Float =  (
  0.0,                    // 0 InitVolt nicht benutzt;
  0.02,                   // 1 InitAmp = 20mA;
  2.5,                    // 2 InitLowDividerU, U-Gain wenn Spannungsteiler low
  10,                     // 3 InitHiDividerU, Istspannungs-Vorteiler
  10,                     // 4 InitGainI, Gain Sense-OpAmp
  2.5,                    // 5 Uref LT1019 = 2.5 V;
  50,                     // 6 Pmax W
  100.00,                 // 7  R sense 1. Bereich nom. 2mA
  10.000,                 // 8  R sense 2. Bereich nom. 20mA
  1.0000,                 // 9  R sense 3. Bereich nom. 200mA
  0.1000,                 // 10 R sense 4. Bereich nom. 2A

  0.002,                  // 11 Imax A 1. Bereich, Umschaltpunkt
  0.020,                  // 12 Imax A 2. Bereich, Umschaltpunkt
  0.200,                  // 13 Imax A 3. Bereich, Umschaltpunkt
  2.000,                  // 14 Imax A 4. Bereich, für CheckLimits

  25,                     // 15 UmaxHi maximale Klemmenspannung im HiVolt-Bereich
  6.1,                    // 16 UmaxLo maximale Klemmenspannung im LoVolt-Bereich
  %00000100,              // 17 InitOptions:
  // Bit 0, 1 = DACtype, 0=MAX543/LTC8043, 1=AD5452, 2=SR4094, 3=DAC8811
  // Bit 2: LM75 present auf Adr. $49 oder $48 (wenn externe Endstufe)
  // Bit 3: Externe Endstufe, 1=LM75 auf Adr. $48
  0,                      // 18 InitIpercent
  10,                     // 19 PWonTime
  0,                      // 20 PWoffTime
  50);                    // 21 InitFanOnTemp
{$ENDIF} // I_10Amp

  InitIncRast:Float=4;
  EESerBaudReg:byte=51;
  TrackChSave:byte = 255;
  EETrigMask:byte = 0;
  EEinitialised:word=$AA55;
  EEfirstRun:boolean=false;   // Adjust-Routine beim 1. Start

{--------------------------------------------------------------}

var
{$EEPROM}
  InitVolt[@OptionArray]: Float;
  InitAmp[@OptionArray+4]: Float;

  InitLowDividerU[@OptionArray+8]: Float;
  InitHiDividerU[@OptionArray+12]: Float;
  InitGainI[@OptionArray+16]: Float;

  Uref[@OptionArray+20]: Float;
  Pmax[@OptionArray+24]: Float;
  RSenseArray[@OptionArray+28]: Array[0..3] of Float;
  ImaxArray[@OptionArray+44]: Array[0..3] of Float;
  Imax[@OptionArray+56]: Float;  // für CheckLimits

  UmaxHi[@OptionArray+60]: Float; // für FaultCheck
  UmaxLo[@OptionArray+64]: Float; // für FaultCheck

  InitOptions[@OptionArray+68]: Float;
  InitIpercent[@OptionArray+72]: Float;
  InitTonTime[@OptionArray+76]: Float;
  InitToffTime[@OptionArray+80]: Float;
  InitFanOnTemp[@OptionArray+84]: Float;


{$DATA} {Schnelle Register-Variablen}
  i, j   : byte;
  k              : byte;  // k in HW-Prozess benutzt
  m              : byte;

{$IDATA}  {Langsamere SRAM-Variablen}
  SlaveCh: byte;
  LEDactivity[LEDOutPort, 2]    : bit;
  LEDfault[LEDOutPort, 3]    : bit;

  SCLK[@PortB, b_SCLK]       : bit; //Takt für alle
  STRAD16[@PortB, b_STRAD16] : bit; //Strobe für LTC2400
  SDATAIN1[@PinB, b_SDATAIN1]: bit; //Dateneingang vom LTC2400
  AD16MPX[@PortB, b_ADC16sw]       : bit; //Auswahl U oder I an ADC16
  MODEMPX[@PortB, 0]       : bit; //Auswahl DAC-Mode R (low) oder I (high)
  ButtonTemp,RangeTemp: Byte; // invertiert - low=on!
  ButtonDown[@ButtonTemp, 5]  : bit;
  ButtonUp[@ButtonTemp, 4]  : bit;
  ButtonEnter[@ButtonTemp, 3]  : bit;  // Inkrementalgeber-Druck

  MPXA0[@PortC, 2]  : bit;
  MPXA1[@PortC, 3]  : bit;
  MPXENA[@PortC,4]  : bit; //Enable Output-MPX
  USWITCH[@PortC,5] : bit; //R-Switch BS170
  TRGOUT[@PortC, 7] : bit;
  TRGIN[@PinB, 2] : bit;

  ThisMeas, LastMeas, NextMeas: tMeas;
  DACchanged:Boolean;
  ModeSelect:tMode;
  ADCrawU,ADCrawI:Word;
//  AD16IntegrateMode:byte; //0=Off, 1=Fast, 2=Slow, (3=Auto)
  AD16, AD16temp, AD16tempIon,AD16tempIoff,AD16tempUon,AD16tempUoff : Word;
  AD16select,AD10ready: boolean;
  AD10           : Integer;
  AD16long:LongInt;
  Temperature,TemperatureExtern,Switchpoint:Float;   // Umschaltpunkt U Low/ High
  TemperatureTimer:byte; // Timer
  DACtemp,DACtempOn,DACtempOff,ADCtemp:word; // für Interrupt-IO
  I2CslaveAdr:byte; // I2C IO Slave Adresse

//Parameter
  DCAmp, DCohm, DCAmpMod, DCohmMin, DCohmMax : float;
{ mcb } DCWatt, DCVolt : Float;
  Pon, Poff, Ptot, Psoa: float;
  DividerU:Float;
  IntegrateCounter: Byte;
  Ipercent, PWonTime, PWoffTime, PWcounter: Integer;
  PWonOff:Boolean;
  ShuntRange:Byte;

  DACLSBIarray: Array [0..3] of Float;  // Strom eines LSBits, 4 Bereiche, Output
  DACLSBRarray: Array [0..3] of Float;  // n = DividerU*Rshunt*DACmax/Rgew.

  ADC16LSBU: Float;  // Spannung eines LSBits LTC1684
  ADC10LSBU: Float;  // Spannung eines LSBits interner ADC
  ADC16LSBIarray: Array [0..3] of Float;  // Strom eines LSBits, 4 Bereiche, Input
  ADC10LSBIarray: Array [0..3] of Float;  // Strom eines LSBits, 4 Bereiche, Input
  ADCUoffset:Integer;
  Options:byte;  //
  LM75intern[@Options, 2]  : bit;
  LM75extern[@Options, 3]  : bit;
  LM75aux[@Options, 4]  : bit;
  DACtype:tDAC;
  DACmax:LongInt;

  CmdWhich: tCmdWhich;
  SubCh, CurrentCh       : byte;
  NegativeFlag, OmniFlag, verbose: boolean;

  Param :float;
  ParamInt       : Integer;
  ParamByte:Byte;
  SerInpStr      : String[63];
  SerInpPtr:byte;
  Prefix:char;

  ShuntSelect, OldShuntSelect, IAutoRange: byte;

  DisplayTimer:Systimer;
  DisplayToggle:Byte;
  ActivityTimer:Systimer8;
  IncrTimer:Systimer8;
  IntegrateTimer:Systimer8;
  FaultTimer, ToggleTimer:byte;
  NoToggle: Boolean; // Alternierende Anzeige PWon/PWoff
  LCDpresent: boolean;
  Modify:tModify;
  TrackChannel:byte;
  IncrValue,OldIncrValue: LongInt;
  IncrFine,FirstTurn:Boolean;
  IncrAccFloat,IncFineDiv, IncCoarseDiv:Float;
  IncrDiff,IncrAccInt10, IncRast:Integer;
  IncrDiffByte, Autorepeat:Byte;
  digits, nachkomma:byte;
  ChangedFlag:Boolean;

  TempF:Float;
  TempRI:Integer;
//für Parser
  ParamStr:string[40]; // auch für Display

  Status:byte;  // 0..3 Fehler/Button-Nummer
  BusyFlag[@Status, 7]  : bit;
  UserSRQFlag[@Status, 6]  : bit;
  OverloadFlag[@Status, 5]  : bit;
  EEUnlocked[@Status, 4]  : bit; // EEPROM-unlocked-Flag

  FaultFlags, ButtonNumber:byte;
  LowVolt [@FaultFlags, 4]  : bit;
  OverTemp[@FaultFlags, 3]  : bit;
  OverVolt[@FaultFlags, 2]  : bit;
  FuseBlown[@FaultFlags, 1]  : bit;
  OverPower[@FaultFlags, 0]  : bit;

  FaultTimerByte:Byte;
  ErrCount:integer;
  ErrFlag:boolean;
  CheckLimitErr: tError;
  OutputEnable: Boolean;

  TrigMask:Byte;
  TrigInEnable[@TrigMask, 0]  : bit;
  TrigAutoEnable[@TrigMask, 1]  : bit;
  TrigOffSema,TrigOnSema: boolean;
  ADSC10[@ADCSRA, 6]: bit;

// mcb -->
   RModeON : Boolean;
   IModeON : Boolean;
   PModeOn : Boolean;
   Wh : Float;
   Ah : Float;
   CurrAmp  : Float;
   CurrVolt : Float;
// <-- mcb

{$NOSAVE}

{###########################################################################}

{$NOSAVE}
{$I EDL-HW.pas}

procedure SetLM75Temp;
// LM75 Lüfter-Schalt-Temperatur °C in Param
var abyte: byte; aInt: Integer;
begin
//   TESTLA:=high;
   aByte:=4;   // geht wg. Optimizer nicht mit Konstanten!
   TWIout(I2CslaveAdr, 1, aByte); // Optionsregister invertierter Ausgang
   aInt:=integer(Param*2);
   aInt:= swap(aInt shl 7);
   TWIout(I2CslaveAdr, 3, aInt);  // Tos-Register wählen
   aInt:=integer(Param*2)-6; // Hysteresis 3°C
   aInt:= swap(aInt shl 7);
   TWIout(I2CslaveAdr, 2, aInt);  // THyst-Register wählen
   TWIout(I2CslaveAdr, 0);
//   TESTLA:=low;
end;

procedure GetOneLM75Temp;
// liefert LM75 Ist-Temperatur °C in Param
var aInt: Integer;
begin
  TWIout(I2CslaveAdr, 0);
  TWIinp(I2CslaveAdr, aInt);
  aInt:= swap(aInt) shr 7;
  Temperature:=float(aInt)/2;
// Zusaetzlichen externen I2C-Temperatursensor auslesen
end;

procedure GetLM75Temp;
// liefert LM75 Ist-Temperatur °C in Param
var aInt: Integer;
begin
  Temperature:=0;
  if LM75intern then
    I2CslaveAdr:=$49;
    GetOneLM75Temp;
  endif;
// externer Temperaturfühler, wenn vorhanden und höchster Bereich
  if LM75extern and (ShuntSelect=ShuntD) then
    I2CslaveAdr:=$48;
    GetOneLM75Temp;
  endif;
  if LM75aux then
    I2CslaveAdr:=$48+2;
    TWIout(I2CslaveAdr, 0);
    TWIinp(I2CslaveAdr, aInt);
    aInt:= swap(aInt) shr 7;
    TemperatureExtern:=float(aInt)/2;
  endif;
end;

procedure InitScaleU;
begin
{ mcb }  if ModeSelect in [IloVolt,RloVolt,PloVolt] then
    USWITCH:=high;
    DividerU:=InitLowDividerU;
    ADC16LSBU:=ADC16UscaleLow*Uref*DividerU/65535.0;
//    ADC10LSBU:=ADC10UscaleLow*Uref*DividerU/1023.0;
    ADCUoffset:=ADCUoffsets[0];
  else
    USWITCH:=low;
    DividerU:=InitHiDividerU;
    ADC16LSBU:=ADC16UscaleHigh*Uref*DividerU/65535.0; // ADC neu berechnen
//    ADC10LSBU:=ADC10UscaleHigh*Uref*DividerU/1023.0;
    ADCUoffset:=ADCUoffsets[1];
  endif;
end;

procedure InitScales;
var aInt:Integer; Ufac, myDACmax, myADC10max, myADC16max:Float;
//Frequenz und Settings aus EEPROM holen
begin
  TrigMask:=EETrigMask;
  aInt:=integer(InitOptions); // Bit 0, 1=DACselect
  Options:=byte(aInt);
  DACtype:=tDAC(Options AND 3); //in Bit 0 und 1 ist DACtype
  Ufac:=Uref;       // DAC8501 intern 1fache Verstärkung
  InitScaleU;
  if DACtype=DAC8811 then
    DACmax:=65635; // für SetLevelDAC_I mit DAC881, 16 Bit
  else
    DACmax:=4095; // für SetLevelDAC_I mit MAX543, LTC8043, 12 Bit
  endif;
  myDACmax:=float(DACmax);
  myADC16max:=65535.0; // für LTC1864
  myADC10max:=1023.0;  // interner 10-Bit-ADC
  for i:=0 to 3 do
    // mA pro LSBit für 4 Bereiche, Output:
    DACLSBIarray[i]:=(Ufac/RSenseArray[i])/(myDACmax*DACIscales[i]*InitGainI);
// mcb -->
//    DACLSBRarray[i]:=(InitGainI*RSenseArray[i]*myDACmax*DACRscales[i]);
    DACLSBRarray[i]:=(InitGainI*RSenseArray[i]*myDACmax*DACIscales[i]);       // DACRscales ist im EEPROM nicht korrekt gesetzt!
// <-- mcb
    // mA pro LSBit für 4 Bereiche, Input:
    ADC16LSBIarray[i]:=(ADCIscales[i]*Uref/(RSenseArray[i]))/myADC16max/InitGainI; //
    ADC10LSBIarray[i]:=(ADCIscales[i]*Uref/(RSenseArray[i]))/myADC10max/InitGainI; //;  // Strom eines LSBits, 4 Bereiche, Input
  endfor;
  TrackChannel:=TrackChSave;
  Param:=InitFanOnTemp;
  if LM75intern then
    I2CslaveAdr:=$49;
    SetLM75Temp;
  endif;
  if LM75extern then
    I2CslaveAdr:=$48;
    SetLM75Temp;
  endif;
  PWonTime:=integer(InitTonTime);
  PWoffTime:=integer(InitToffTime);
  Ipercent:=integer(InitIpercent);
  DCohmMin:=(RSenseArray[3]*DividerU*InitGainI*1.1);  // min. Einstellbarer Widerstand inkl 10% Abw.
  DCohmMax:=(RSenseArray[0]*DividerU*InitGainI*100);  // max. sinnvoll einstellbarer Widerstand
end;


{###########################################################################}

// auch für DEBUG-mode gebraucht

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

//DCG-Funktionen
procedure SetShunt(myShunt:Byte);
begin
  case myShunt of
    ShuntA:
      MPXA0:= high;  //Shunt-Umschalter 20/100R
      MPXA1:= high;
      |
    ShuntB:
      MPXA0:= low;  //Shunt-Umschalter 2/10R
      MPXA1:= high;
      |
    ShuntC:
      MPXA0:= high;  //Shunt-Umschalter 0,2/1R
      MPXA1:= low;
      |
    ShuntD:
      MPXA0:= low;  //Shunt-Umschalter 0,02/0,1R
      MPXA1:= low;
      |
  endcase;
end;

procedure CalcRangeI;
begin
  ShuntSelect:=ShuntA;
  for i:=0 to 3 do
    if DCAmp > ImaxArray[i] then
      inctolim(ShuntSelect,ShuntD);
    endif;
  endfor;
end;

procedure CalcRangeR;
begin
  ShuntSelect:=ShuntA;
  for i:=0 to 3 do
    if DCohm < (RSenseArray[i]*InitGainI*DividerU*1.1) then
      inctolim(ShuntSelect,ShuntD);
    endif;
  endfor;
end;

procedure GetVoltage(offOn:boolean);
// Istwert Spannung vom ADC holen,
// wenn offOn=false, bei Off-Zeit des DAC-Timers (Low-Current-Wert)
// wenn offOn=true,  bei  On-Zeit des DAC-Timers (High-Current-Wert)
var
  myADC:longInt;
begin
  disableInts;
  if (PWoffTime=0) or (Ipercent=100) or offOn then
    myADC:=LongInt(AD16tempUon);
  else
    myADC:=LongInt(AD16tempUoff);
  endif;
  enableInts;
  myADC:=myADC+longInt(ADCUoffset);
  Param:=float(myADC)*ADC16LSBU;
end;

procedure GetCurrent(offOn:boolean);
var
  myADC:longInt;
begin //Istwert Ausgangsstrom
  if OutputEnable then     // neu: sonst fehlerhafte Werte wg. offenem Eingang
    disableInts;
    if (PWoffTime=0) or (Ipercent=100) or offOn then
      myADC:=LongInt(AD16tempIon);
    else
      myADC:=LongInt(AD16tempIoff);
    endif;
    enableInts;
    myADC:=myADC+longInt(ADCIoffsets[ShuntSelect]);
    Param:=float(myADC)*ADC16LSBIarray[ShuntSelect];
  else
    Param:=0;
  endif;
end;

{
procedure GetVoltage10;
//Istwert Spannung vom internen ADC holen
var
  myADC:word;
begin
  myADC:=GetADC10(3);
  Param:=float(myADC)*ADC10LSBU;
end;

procedure GetCurrent10;
//Istwert Strom vom internen ADC holen
var
  myADC:word;
begin
  myADC:=GetADC10(4);
  Param:=float(myADC)*ADC10LSBIarray[ShuntSelect];
end;
}

function GetRi:boolean;
// liefert Innenwiderstand in Param, true wenn gültig
var myUdiff, myIdiff:Float;
begin
  if (PWoffTime=0) or (Ipercent=100) then
    return (false); // kein Abschaltwert gemessen
  endif;
  if not (ModeSelect in [IloVolt, IhiVolt]) then
    return (false); // falscher Modus
  endif;
  GetVoltage(true);
  myUdiff:=Param;
  GetVoltage(false);
  myUdiff:=Param-myUdiff;
  GetCurrent(true        );
  myIdiff:=Param;
  GetCurrent(false);
  myIdiff:=myIdiff-Param;
  if myIdiff>0 then
    Param:=myUdiff/myIdiff;
    return (true);  // gültiges Ergebnis
  else
    return (false); // Division durch 0
  endif;
end;



procedure SetLevelDAC_I;
//Spannungs- und Stromeinstellung nach DCVolt und DCAmp
var
  myDAC:longInt; myOffset:Integer; myPercent: Float;
begin
//Berechnung des Range-Wertes für Strom
  InitScaleU;
  CalcRangeI;
// kein AutoSelect, Strom kleiner/gleich passender Shunt
  If (ShuntRange <= ShuntD) and (ShuntRange >= ShuntSelect) then
    ShuntSelect:=ShuntRange; // ggf. größer wählen, aber nicht kleiner
  endif;
  if ShuntSelect<>OldShuntSelect then
    DACtemp:=0;  // kurz abschalten
// DACrawI wird vom Interrupt übernommen, Wandlung abwarten
    mdelay(2);  // Wandlungszeit auf 0
  endif;
  SetShunt(ShuntSelect);
  OldShuntSelect:=ShuntSelect;
{$IFDEF DEBUG}
  write(Serout, 'Shunt=');
  write(Serout,ByteToStr(ShuntSelect));
{$ENDIF}
//Berechnung des DAC-Wertes für Strom, On-Zeit
  myDAC:=LongInt((DCAmp*DCAmpMod)/DACLSBIarray[ShuntSelect]+0.5)+longInt(DACIoffsets[ShuntSelect]);
  if myDAC>DACmax then
    myDAC:=DACmax;
  endif;
  if myDAC<0 then
    myDAC:=0;
  endif;
  disableInts;
  DACtempOn:=word(myDAC);
  enableInts;
  myPercent:=float(Ipercent)/100;
  //DACtemp für Off-Zeit berechnen
  myDAC:=LongInt((DCAmp*DCAmpMod*myPercent)/DACLSBIarray[ShuntSelect]+0.5)+longInt(DACIoffsets[ShuntSelect]);
  if myDAC>DACmax then
    myDAC:=DACmax;
  endif;
  if myDAC<0 then
    myDAC:=0;
  endif;
  disableInts;
  DACtempOff:=word(myDAC);
  enableInts;
  MODEMPX:=high; // I-Mode
  if ModeSelect<>OutputOff then
    MPXENA:=OutputEnable;
  else
    MPXENA:=low;
  endif;

{$IFDEF DEBUG}
  write(Serout, '  DACtempIon=$');
  write(Serout,IntToHex(DACtempOn));
  write(Serout, ' dez.');
  write(Serout,IntToStr(DACtempOn));
  write(Serout, '  DACtempIoff=$');
  write(Serout,IntToHex(DACtempOff));
  write(Serout, ' dez.');
  write(Serout,IntToStr(DACtempOff));
  SerCRLF;
{$ENDIF}
end;


procedure SetLevelDAC_R;
//Spannungs- und Stromeinstellung nach DCVolt und DCAmp
var
  myDAC:longInt; myOffset:Integer; myPercent: Float;
begin
//Berechnung des Range-Wertes für Strom
  InitScaleU;
  CalcRangeR;
  if ShuntSelect<>OldShuntSelect then
    DACtemp:=0;  // kurz abschalten
// DACrawI wird vom Interrupt übernommen, Wandlung abwarten
    mdelay(2);  // Wandlungszeit auf 0
  endif;
  SetShunt(ShuntSelect);
  OldShuntSelect:=ShuntSelect;
{$IFDEF DEBUG}
  write(Serout, 'Shunt=');
  write(Serout,ByteToStr(ShuntSelect));
{$ENDIF}
//Berechnung des DAC-Wertes für Strom, On-Zeit

  myDAC:=LongInt((DividerU*DACLSBRarray[ShuntSelect]+0.5)/DCohm)+longInt(DACIoffsets[ShuntSelect]);

  if myDAC>DACmax then
    myDAC:=DACmax;
  endif;
  if myDAC<0 then
    myDAC:=0;
  endif;
  disableInts;
  DACtempOn:=word(myDAC);
  DACtempOff:=word(myDAC);
  enableInts;
  MODEMPX:=low;  // R-Mode
  if ModeSelect<>OutputOff then
    MPXENA:=OutputEnable;
  else
    MPXENA:=low;
  endif;
{$IFDEF DEBUG}
  write(Serout, '  DACtempR=$');
  write(Serout,IntToHex(DACtempOn));
  write(Serout, ' dez.');
  write(Serout,IntToStr(DACtempOn));
  SerCRLF;
{$ENDIF}
end;

// mcb -->
procedure SetLevelDAC_P;
//Spannungs- und Stromeinstellung nach DCVolt und DCAmp
begin
  GetVoltage(true);
//  DCOhm := (Param*Param)/DCWatt;    // Ohm aus Watt
//  SetLevelDAC_R;
  DCAmp := DCWatt/Param;
  SetLevelDAC_I;
end;
// <-- mcb

{###########################################################################}

//allg. Menü-Prozeduren

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
  if (FaultFlags = 0) then
    Serout(#32);
    write(serout,ErrStrArr[ord(myErr)]);
  else
    myFault:=FaultFlags;
{ mcb }    for i := 0 to 4 do
      if (myFault and 1) = 1 then
        Serout(#32);
        write(serout,FaultStrArr[i]);
      endif;
      myFault:=myFault shr 1;
    endfor;
  endif;
  SerCRLF;
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

procedure IncFacR;
begin
  IncCoarseDiv:=10;
  If Param>=10 then
     IncCoarseDiv:=1;
  endif;
  If Param>=100 then
     IncCoarseDiv:=0.1;
  endif;
  If Param>=1000 then
     IncCoarseDiv:=0.01;
  endif;
  IncFineDiv:=IncCoarseDiv*100;
{$IFDEF DEBUG}
   write(Serout, 'IncFacR');
   SerCRLF;
{$ENDIF}
end;

// mcb -->
procedure IncFacP;
begin
  IncCoarseDiv:=10;
  IncFineDiv:=1000;
  if Param >= 10 then
    IncFineDiv:=100;
  endif;
{$IFDEF DEBUG}
   write(Serout, 'IncFacP');
   SerCRLF;
{$ENDIF}
end;

procedure IncFacV;
begin
  IncCoarseDiv:=10;
  IncFineDiv:=1000;
  if Param >= 10 then
    IncFineDiv:=100;
  endif;
{$IFDEF DEBUG}
   write(Serout, 'IncFacV');
   SerCRLF;
{$ENDIF}
end;

// <-- mcb


procedure RoundIncParam;
begin
  if not IncrFine then
    TempRI:=round(Param*IncCoarseDiv);  // einmalig runden
    Param:=float(TempRI)/IncCoarseDiv;
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

procedure ParamToStr;
begin
  if Param<=0 then
    ParamStr:='0.000';
  else
    ParamStr:=floatToStr(Param:digits:nachkomma:'0');
  endif;
end;

procedure Setcursor(fullCursor:boolean);
var myCursor: char; myx:byte;
begin
  if fullCursor then
    if IncrFine then
      myCursor:=#2; // schraffiert
    else
      myCursor:=#0; // voller Cursor, Sollwert
    endif;
  else
    myCursor:=#1; // hohler Cursor, Istwert
  endif;
  myx:=0;          // Cursor oben
  if Modify=LowerMainMenu then
    myx:=1;        // Cursor unten
  endif;
  LCDxy_M(LCD_m1, 7, myx);
  lcdout_m(myCursor);
end;


procedure SpannungOnLCD;
begin
  digits:=5;
  nachkomma:=3;
  if Param>=10.0 then
    nachkomma:=2;
  endif;
  ParamToStr;
  LCDxy_M(LCD_m1, 0, 0);
  write(lcdout_m,ParamStr);
  lcdout_m(#32);
  lcdout_m('V');
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

// --> mcb
procedure IstSpannungOnLCD;
begin
  if (ToggleTimer<8) or NoToggle then
    GetVoltage(true);
  else
    GetVoltage(false);
  endif;
  SpannungOnLCD;
  if ToggleTimer>=16 then
    ToggleTimer:=0;
  endif;
end;

procedure SollSpannungOnLCD;
begin
  Param:=DCVolt;
  SpannungOnLCD;
end;
// <-- mcb

procedure paramdiv1000;
begin
  Param:=Param/1000;
end;

procedure parammul1000;
begin
  Param:=Param*1000;
end;

procedure Prefix_R;
begin
  Prefix:=#32;
  if Param >= 1000 then
    paramdiv1000;
    Prefix:='k';
  endif;
end;

procedure Prefix_I(mAdisp:boolean);
begin
  Prefix:=#32;
  if (Param < 1.0) and mAdisp then // wenn außerhalb 2A-Bereich, mA anzeigen
    parammul1000;
    Prefix:='m';
  endif;
end;

procedure StromOnLCD;
begin
  digits:=5;
  nachkomma:=3;
  ParamToStr;
  setlength(ParamStr,5);
// --> mcb
  if Modify=PwrCurMenu Then
     LCDxy_M(LCD_m1, 0, 0);
  else
     LCDxy_M(LCD_m1, 0, 1);
  endif;
  write(lcdout_m,ParamStr);
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
// <-- mcb
end;

procedure WiderstandOnLCD;
begin
  digits:=5;
  nachkomma:=3;
  Param:=DCohm;
  Prefix_R;
  ParamToStr;
  setlength(ParamStr,5);
  LCDxy_M(LCD_m1, 0, 1);
  write(lcdout_m,ParamStr);
  lcdout_m(Prefix);
  lcdout_m(#3);
// --> mcb
  if NoToggle then
    lcdout_m(#32);
  else
    if ToggleTimer<8 then
      lcdout_m(#4);
    else
      lcdout_m(#5);
    endif;
  endif;
// <-- mcb
end;

procedure IstStromOnLCD;
begin
  if (ToggleTimer<8) or NoToggle then
    GetCurrent(true);
    Prefix_I(ShuntSelect<>ShuntD); // im höchsten Bereich nur A anzeigen, nicht mA
// mcb -->
  else
    GetCurrent(false);
    Prefix_I(ShuntSelect<>ShuntD); // im höchsten Bereich nur A anzeigen, nicht mA
  endif;
  StromOnLCD;
// <-- mcb
  if ToggleTimer>=16 then
    ToggleTimer:=0;
  endif;
end;

procedure SollStromOnLCD;
begin
  Param:=DCAmp;
  Prefix_I(true);
  StromOnLCD;
end;

procedure IstLeistungOnLCD;
begin
  digits:=5;
  nachkomma:=3;
  Param:=Ptot;
  if Param < 0.001 then
    Param:=0;
  endif;
  ParamToStr;
  setlength(ParamStr,5);
// mcb -->
  if Modify in [LowerMainMenu,UpperMainMenu] then
     LCDxy_M(LCD_m1, 0, 1);
  else
     LCDxy_M(LCD_m1, 0, 0);
  endif;

  write(lcdout_m,ParamStr+' W');

  if NoToggle then
    lcdout_m(#32);
  else
    if ToggleTimer<8 then
      lcdout_m(#4);
    else
      lcdout_m(#5);
    endif;
  endif;
// <-- mcb
end;

// mcb -->
procedure SollLeistungOnLCD;
begin
  Param:=DCWatt;
  digits:=5;
  nachkomma:=3;
  if Param < 0.001 then
    Param:=0;
  endif;
  ParamToStr;
  setlength(ParamStr,5);
  LCDxy_M(LCD_m1, 0, 1);
  write(lcdout_m,ParamStr);
  lcdout_m(#32);
  lcdout_m('W');
  IstSpannungOnLCD;
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
  write(lcdout_m,ParamStr+lUnit);

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


procedure RiOnLCD;
begin
  digits:=5;
  nachkomma:=3;
{ mcb }  LCDxy_M(LCD_m1, 0, 0);
  if GetRi then
    ParamToStr;
    setlength(ParamStr,5);
  else
    ParamStr:='inval';
  endif;
  write(lcdout_m,ParamStr);
  lcdout_m(#32);
  lcdout_m(#3);
end;

procedure WerteOnLCD;
begin
{ mcb }  LCDxy_M(LCD_m1, 0, 0);
  // (IRmenu,Ohm,T_on,T_off,TrackCh);   //0..2
  case Modify of
    TempMenu:
      digits:=1;
      Nachkomma:=1;
      Param:=Temperature;
      ParamToStr;
      write(lcdout_m,ParamStr);
      LCDclreol_M(LCD_m1);
      Setcursor(false);
      |
    RiMenu:
      RiOnLCD;
      Setcursor(false);
      |
// mcb -->
    CapMenu:
        CapOnLCD;
       |
    PwrCurMenu:
      case ModeSelect of
        PloVolt,PhiVolt:
        IstStromOnLCD;
        |
      else
        IstLeistungOnLCD;
      endcase;
      Setcursor(false);
      |
    LowerMainMenu:
      case ModeSelect of
        RhiVolt,RloVolt:
           WiderstandOnLCD;
           Setcursor(true);
           IstSpannungOnLCD;
           |
        IhiVolt,IloVolt:
           if issystimerzero(DisplayTimer) then
             IstStromOnLCD;
             IstSpannungOnLCD;
             Setcursor(false);
           else
             SollStromOnLCD;
             IstSpannungOnLCD;
             Setcursor(true);
           endif;
           |
        PhiVolt,PloVolt:
           if issystimerzero(DisplayTimer) then
              IstLeistungOnLCD;
              Setcursor(false);
           else
              SollLeistungOnLCD;
              Setcursor(true);
           endif;
           |
      endcase;
      |
    UpperMainMenu:
      case ModeSelect of
        RhiVolt,RloVolt:
           WiderstandOnLCD;
        |
        IhiVolt,IloVolt:
           IstStromOnLCD;
        |
        PhiVolt,PloVolt:
           IstLeistungOnLCD;
        |
      endcase;
      if issystimerzero(DisplayTimer) then
         IstSpannungOnLCD;
         Setcursor(false);
      else
         SollSpannungOnLCD;
         Setcursor(true);
      endif;

// <-- mcb
      |
    ModeMenu:
      LCDclreol_M(LCD_m1);
      write(lcdout_m,ModeStrArr[ord(ModeSelect)]);
      Setcursor(true);
      |
    T_on:
      LCDclreol_M(LCD_m1);
      write(lcdout_m,intToStr(PWonTime));
      Setcursor(true);
      |
    T_off:
      LCDclreol_M(LCD_m1);
      write(lcdout_m,intToStr(PWoffTime));
      Setcursor(true);
      |
    I_off:
      LCDclreol_M(LCD_m1);
      Param:=float(Ipercent);
      digits:=1;
      nachkomma:=0;
      ParamToStr;
      if Param=0 then
        ParamStr:='0';
      endif;
      write(lcdout_m,ParamStr);
      Setcursor(true);
      |
  endcase;
  // zweite Zeile
{ mcb }  LCDxy_M(LCD_m1, 0, 1);
  ParamStr:=MenuStrArr[ord(Modify)];
  case DisplayToggle of
  0,1:
    if OverTemp then
      ParamStr:='OVRTEMP ';
    endif;
    |
  2,3:
    if OverVolt then
      ParamStr:='OVRVOLT ';
    endif;
    |
  4,5:
    if OverPower then
      ParamStr:='OVRPOWER';
    endif;
    |
// --> mcb
  6,7:
    if LowVolt then
      ParamStr:='LOWVOLT ';
    endif;
    |
// <-- mcb
  endcase;
  inc(DisplayToggle);
{ mcb }  if DisplayToggle>9 then
    DisplayToggle:=0;
  endif;
  write(lcdout_m,ParamStr);
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
  NoToggle:=false;
  if DCohm < DCohmMin then
    DCohm:=DCohmMin;
    CheckLimitErr:=ParamErr;
  endif;
  if DCohm > DCohmMax then
    DCohm:=DCohmMax;
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
  if Ipercent < 0 then
    Ipercent:=0;
    CheckLimitErr:=ParamErr;
  endif;
  if Ipercent >= 100 then
    NoToggle:=true;
    Ipercent:=100;
    CheckLimitErr:=ParamErr;
  endif;
  if PWonTime < 1 then
    PWonTime:=1;
    CheckLimitErr:=ParamErr;
  endif;
  if PWoffTime < 0 then
    PWoffTime:=0;
    CheckLimitErr:=ParamErr;
  endif;
  if PWoffTime = 0 then
    NoToggle:=true;
  endif;
  if Trackchannel > 127 then
    TrackChannel:=255;
  else
    if Trackchannel > 7 then
      TrackChannel:=7;
    endif;
  endif;
  if ModeSelect>=tMode(128) then
    ModeSelect:=OutputOff;
    CheckLimitErr:=ParamErr;
  endif;
// mcb -->
  if ModeSelect>PloVolt then
    ModeSelect:=PloVolt;
    CheckLimitErr:=ParamErr;
  endif;
  if DCWatt > Pmax then
    DCWatt := Pmax;
  endif;
  if DCWatt < 0 then
    DCWatt := 0;
    CheckLimitErr:=ParamErr;
  endif;
  if ModeSelect In [IhiVolt,RHiVolt,PhiVolt] then
     if DCVolt > UmaxHi then
       DCVolt := UmaxHi;
     endif;
  else
     if DCVolt > UmaxLo then
       DCVolt := UmaxLo;
     endif;
  endif;
  if DCVolt < 0 then
    DCVolt := 0;
    CheckLimitErr:=ParamErr;
  endif;
// <-- mcb
  if ModeSelect >=RhiVolt then // R-Modi
    NoToggle:=true;
  endif;
end;


{###########################################################################}

{$I EDL-Parser.pas}

procedure FaultCheck;
var myUmax: Float;
begin
  if LM75intern or LM75extern then
    if TemperatureTimer=0 then
      TemperatureTimer:=20;
      GetLM75temp;
    endif;
    dec(TemperatureTimer);
  else
    Temperature:=0;
  endif;
  Overtemp:=(Temperature>TemperatureMax);
{ mcb }  if ModeSelect in [IhiVolt,RhiVolt,PhiVolt] then
    myUmax:= UmaxHi;
  else
    myUmax:= UmaxLo;
  endif;
  getVoltage(true);
  OverVolt:=(Param>myUmax); // Überspannung im Messbereich?
  OverPower:=(Psoa>Pmax); // Überlast eingestellt?
// --> mcb
  if (Param < DCVolt) And (DCVolt > 0)then
     LowVolt := True;
     OutputEnable := False;
  endif;
  if FaultFlags <> 0 then
    OverloadFlag:=true;

// mcb -->
    DDRD := DDRD OR $08;  // PortD,3 auf Ausgang
    LedFault := Low; // Pullup Aus, Fault LED an
// <-- mcb

    LEDfault:=low;
    MPXENA:=low;
  else
    OverloadFlag:=false;
    LEDfault:=high;

// mcb -->
    If RModeOn Then
       DDRD := DDRD AND (NOT $08);  // PortD,3 in TriState
       LedFault := Low;             // Pullup Aus, Beide LEDs Aus
    EndIf;

    If IModeOn Then
       DDRD := DDRD OR $08;  // PortD,3 Auf Ausgang
       LedFault := High;     // FaultLED aus, I-COnst LED Ein
    EndIf;

    If (RModeOn = False) AND (IModeOn = False) Then
       DDRD := DDRD AND (NOT $08);  // PortD,3 in TriState
       LedFault := Low;             // Pullup Aus, Beide LEDs Aus
    EndIf;
// <-- mcb
    MPXENA:=OutputEnable;
  endif;
end;

procedure Chores;
var myPWtimeTotal:float;
// Regelmäßig außerhalb des Interrupts aus CheckSer heraus aufgerufen:
begin
  if isSystimerZero(IntegrateTimer) then
    SetSystimer(IntegrateTimer, 40);
    GetVoltage(true);
    Pon:=Param;
    case ModeSelect of  // Leistung Soll für Safe Operating Area berechnen
      OutputOff:
        Psoa:=0;
        MPXENA:=low;
        |
      RloVolt,RhiVolt:
        Psoa:=Param*Param/DCohm;
        MPXENA:=OutputEnable;
        |
// mcb -->
      PloVolt,PhiVolt:
        Psoa:=Pmax;
        MPXENA:= OutputEnable;
        |
// <-- mcb
    else
      Psoa:=Param*DCamp; // I-Bereiche
      MPXENA:=OutputEnable;
    endcase;
    GetCurrent(true);
    Pon:=Pon*Param;
// mcb -->
    CurrAmp := Param;
    GetVoltage(true);
    CurrVolt := Param;
// <-- mcb
    GetVoltage(false);
    Poff:=Param;
    GetCurrent(false);
    Poff:=Poff*Param;
    myPWtimeTotal:=float(PWonTime)+float(PWoffTime); // Integral bilden
    Ptot:= Pon*float(PWonTime)+Poff*float(PWoffTime);
    Ptot:=Ptot/myPWtimeTotal;
    FaultCheck;
    if FaultTimerByte = 0 then  // regelmäßig ausgeben
      if TrigAutoEnable then
        subCh:=10;
        ParseGetParam;
        subCh:=11;
        ParseGetParam;
        if not NoToggle then  // von Checklimits gesetzt, Off-Werte berücksichtigen
          subCh:=15;
          ParseGetParam;
          subCh:=16;
          ParseGetParam;
        endif;
      endif;
      if FaultFlags<>0 then
        SerPrompt(OvlErr);
      endif;
      FaultTimerByte := 10;
    endif;
    dec(FaultTimerByte);
    if TrigInEnable then
      if TRGIN then
        if not TrigOnSema then
          subCh:=10;
          ParseGetParam;
          subCh:=11;
          ParseGetParam;
          TrigOnSema:=true;
          TrigOffSema:=false;
        endif;
      else
        if not TrigOffSema then
          subCh:=15;
          ParseGetParam;
          subCh:=16;
          ParseGetParam;
          TrigOffSema:=true;
          TrigOnSema:=false;
        endif;
      endif;
    endif;
  endif;
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
  if (PWoffTime=0) or (Ipercent=100) then
      Ah := Ah + CurrAmp/(3600*5);
      Wh := Wh + CurrAmp*CurrVolt/(3600*5);
   Else
      Ah := 0;
      Wh := 0;
   EndIf;
end;
// <-- mcb

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

  DACtemp:=0;
// mcb  ShiftOut8501;
  ShiftOut8043;

  i:=EESerBaudReg;
  if not i in [9..239] then
    EESerBaudReg:=51;
    i:=51;
  endif;
// mcb --> für ATmega644 ubrr1l :=1;
  ubrr1:=i;           // für ATMega32
// mcb --> für ATMega644   UCSR1A := UCSR1A or 2;
  UCSRA:=UCSRA or 2; // Set U2X bit  für ATMega32


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
    LCDCharSet_M(LCD_m1, #4, $00, $0E, $1F, $1F, $1F, $0E, $00, $00); // Up Arrow
    LCDCharSet_M(LCD_m1, #5, $00, $0E, $11, $15, $11, $0E, $00, $00); // Down Arrow

    LCDpresent:=true;
    write(lcdout_m,Vers3Str);
    LCDxy_M(LCD_m1, 0, 1);
    if EEinitialised <> $AA55 then
      write(lcdout_m, EEnotProgrammedStr);
    else
      write(lcdout_m,AdrStr);
      lcdout_m(char(SlaveCh+48));
    endif;
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
  ModeSelect:=IhiVolt;
  Status:=0;
  EnableInts;
  while serstat do
    i:=SerInp;
  endwhile;
  OutputEnable:=true;
  DCAmpMod:=1;
  DCAmp:=0;
  InitScales;
  ShuntRange:=4; // AutoSelect
  OldShuntSelect:=255;
  CalcRangeI;
  IncRast:=integer(InitIncRast);      // aus historischen Gründen
  Modify:=LowerMainMenu;
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
  mdelay(10);
  SetLevelDAC_I; // Anfangswerte
  ErrCount:=0;
  mdelay(200); // Interrupt-DAC stabilisieren
  FaultCheck; // in Param ist jetzt Eingangsspannung
  modify:=LowerMainMenu;
  if LCDpresent then
    ButtonTemp := (LCDportInp_M(LCD_m1) or %11000111);
  else
    ButtonTemp := $FF;
  endif;
  if (ButtonTemp <> $FF) or EEfirstRun then
    if LCDpresent then
      LCDxy_M(LCD_m1, 0, 1);
      write(lcdout_m, AdjustStr);
    endif;
    EEfirstRun:=false;
    DCAmp:=ImaxArray[2];
    SetLevelDAC_I; // Adjustwerte, Bereich einstellen
    DACtempOn:=0;  // DAC auf 0 für OffsetAbgleich
    DACtempOff:=0;
    loop   // Abgleich
      USWITCH:=low;
      LEDactivity:=false;
      mdelay(1500);
      USWITCH:=high;
      LEDactivity:=true;
      mdelay(1500);
    endloop;
  endif;
  InitScales;
  DCAmpMod:=1;
  DCAmp:=InitAmp;
  DCohm:=100.0;
  CheckLimits;
  SetLevelDAC_I; // Anfangswerte
  SetSystimer(IntegrateTimer, 40);
// mcb -->
  TickTimerTime (200000);      // Alle 200mSec Ah und Wh berechnen
  TickTimerStart;
  Ah := 0;
  Wh := 0;
// <-- mcb
end;

{###########################################################################}

begin
  Initall;
//Hauptschleife
  loop
    CheckSer;  // Serinp parsen, nicht busy

// mcb -->
    if modeselect in [PloVolt,PhiVolt] then
       SetLevelDAC_P;
    endif;
// <-- mcb

    if isSystimerZero(ActivityTimer) then
      LEDactivity:=high; // LED aus
    endif;
    if LCDpresent then
      verbose:=true; // für Bediener-Aktivitäten
      IncrValue:=GetIncrVal4(0);
// Inkrementalgeber löst in Zweierschritten auf, deshalb der Umstand
      if (IncrValue<>OldIncrValue) then
        FaultTimerByte := 0;
        SetSystimer(ActivityTimer, 250);
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
{$IFDEF DEBUG}
   write(Serout, 'IncDiff=');
   write(Serout, IntToStr(IncrDiff));
   SerCRLF;
{$ENDIF}
          IncrAccInt10:=IncrDiff*10; // 40x Differenz mit Beschleunigung
          IncrAccFloat:=float(IncrDiff);
          SetSystimer(DisplayTimer, 1500); // für Feineinstellung
          DCAmpMod:=1; // Prozent-Faktor bei Bedienung rücksetzen
          ShuntRange:=4; // AutoSelect
          case Modify of
// mcb -->
            LowerMainMenu:
              case ModeSelect of
                RloVolt,RhiVolt:           // R-Modi
                   Param:=DCohm;
                   if FirstTurn then
                     IncFacR;
                     RoundIncParam;
                     ButtonNumber:=4; // Button Inkrementalgeber
                     serprompt(UserReq);
                   endif;
                   SetAccParam;
                   DCohm:=Param;
                   CheckLimits;
                   SetLevelDAC_R;
                   SubCh:=5;
                   ParseGetParam;
                   DCamp:=0.02;
                   |
                IloVolt,IhiVolt:
                   Param:=DCamp;
                   if FirstTurn then
                     IncFacI;
                     RoundIncParam;
                     ButtonNumber:=4; // Button Inkrementalgeber
                     serprompt(UserReq);
                   endif;
                   SetAccParam;
                   DCamp:=Param;
                   CheckLimits;
                   SetLevelDAC_I;
                   SubCh:=1;
                   ParseGetParam;
                   DCohm:=100;
                   |
                PloVolt,PhiVolt:           // P-Modi
                   Param:=DCWatt;
                   if FirstTurn then
                     IncFacP;
                     RoundIncParam;
                     ButtonNumber:=4; // Button Inkrementalgeber
                     serprompt(UserReq);
                   endif;
                   SetAccParam;
                   DCWatt:=Param;
                   CheckLimits;
                   SetLevelDAC_P;
                   SubCh:=3;
                   ParseGetParam;
                   DCohm:=100;
                   |
              endcase;
              |
            UpperMainMenu:
               LowVolt := False;
               OutputEnable := True;
               Param:=DCVolt;
               if FirstTurn then
                  IncFacV;
                  RoundIncParam;
                  ButtonNumber:=4; // Button Inkrementalgeber
                  serprompt(UserReq);
                endif;
                SetAccParam;
                DCVolt:=Param;
                CheckLimits;
                SubCh:=4;
                ParseGetParam;
              |
// <-- mcb
            ModeMenu:
              ModeSelect:=tMode(byte(ModeSelect)+IncrDiffByte);
              CheckLimits;
              InitScales;
              if FirstTurn then
                ButtonNumber:=4; // Button Inkrementalgeber
                serprompt(UserReq);
              endif;
              case ModeSelect of
                OutputOff:
// mcb -->
                  RModeOn := False;
                  IModeOn := False;
                  PModeOn := False;
// <-- mcb
                  OutputEnable:=false;
                  SetLevelDAC_I;
                  |
                IhiVolt,IloVolt:
// mcb -->
                  RModeOn := False;
                  IModeOn := True;
                  PModeOn := False;
// <-- mcb
                  OutputEnable:=true;
                  SetLevelDAC_I;
                  |
                RhiVolt,RloVolt:
// mcb -->
                  RModeOn := True;
                  IModeOn := False;
                  PModeOn := False;
// <-- mcb
                  OutputEnable:=true;
                  SetLevelDAC_R;
                  |
// mcb -->
                PhiVolt,PloVolt:
                  PModeOn := True;
                  IModeOn := False;
                  RModeOn := False;
                  OutputEnable:=true;
                  SetLevelDAC_P;
                  |
// <-- mcb
              endcase;
              SubCh:=19;
              ParseGetParam;
              |
            T_on:
              if FirstTurn then
                ButtonNumber:=4; // Button Inkrementalgeber
                serprompt(UserReq);
                FirstTurn:=false;
              endif;
              if PWonTime>=100 then
                if FirstTurn then
                  PWonTime:=PWonTime div 10;   // einmalig runden
                  PWonTime:=PWonTime * 10;
                  FirstTurn:=false;
                endif;
                PWonTime:=PWonTime+IncrAccInt10;
              else
                PWonTime:=PWonTime+IncrDiff;
              endif;
              CheckLimits;
              SubCh:=27;
              ParseGetParam;
              |
            T_off:
              if FirstTurn then
                ButtonNumber:=4; // Button Inkrementalgeber
                serprompt(UserReq);
                FirstTurn:=false;
              endif;
              if PWoffTime>=100 then
                if FirstTurn then
                  PWoffTime:=PWoffTime div 10;   // einmalig runden
                  PWoffTime:=PWoffTime * 10;
                  FirstTurn:=false;
                endif;
                PWoffTime:=PWoffTime+IncrAccInt10;
              else
                PWoffTime:=PWoffTime+IncrDiff;
              endif;
              CheckLimits;
              SubCh:=28;
              ParseGetParam;
              |
            I_off:
              if FirstTurn then
                ButtonNumber:=4; // Button Inkrementalgeber
                serprompt(UserReq);
                FirstTurn:=false;
              endif;
              Ipercent:=Ipercent+IncrDiff;
              CheckLimits;
              if ModeSelect in [IhiVolt,IloVolt] then
                SetLevelDAC_I;
              endif;
              SubCh:=29;
              ParseGetParam;
              |
          endcase;
          ToggleTimer:=0;
          WerteOnLCD;
          IncrDiff:=0; // für nächsten Durchlauf
        endif;
      endif;
      Checkdelay(1); // wichtig für Beschleunigungsfunktion
      ButtonTemp := (LCDportInp_M(LCD_m1) or %11000111);
      if ButtonTemp <> $FF then
        Checkdelay(1);
        ButtonTemp := (LCDportInp_M(LCD_m1) or %11000111);
        if ButtonTemp <> $FF then
          SetSystimer(DisplayTimer, 1000); // Zeit für Sollwerte
          if not ButtonEnter then
            OutputEnable := True;
            IncrFine:=not IncrFine;
            SetSystimer(DisplayTimer, 1500); // etwas länger für Feineinstellung
            ButtonNumber:=3; // Button Enter/Fine
            serprompt(UserReq);
// mcb -->
            if modify=CapMenu then
              if LowVolt then
                LowVolt:=false;
                DCVolt:=0;
              endif;
              Ah := 0;
              Wh := 0;
            EndIf;
// <-- mcb
          endif;
          if not ButtonDown then
            ButtonNumber:=1; // Button Down
            serprompt(UserReq);
// mcb -->
            if modify=LowerMainMenu then
              modify := PwrCurMenu;
            else
              dec(modify);
// <-- mcb
            endif;
          endif;
          if not ButtonUp then
            ButtonNumber:=2; // Button Up
            serprompt(UserReq);
// mcb -->
            if modify=PwrCurMenu then
              modify := LowerMainMenu;
            else
              inc(modify);
// <-- mcb
            endif;
          endif;
          WerteOnLCD;
          SubCh:=80;
          ParseGetParam;
          DCAmpMod:=1;
          ShuntRange:=4; // AutoSelect
          repeat
            Checkdelay(1);
            ButtonTemp := (LCDportInp_M(LCD_m1) or %11000111);
            inc(Autorepeat);
          until (ButtonTemp=$ff) or (AutoRepeat>20);
          if ButtonTemp=$ff then
            AutoRepeat:=0;
          else
            AutoRepeat:=10;  // Wenn weiterhin gedrückt, schneller Repeat
          endif;
          ButtonNumber:=0; // kein Button, freigegeben
          serprompt(UserReq);
        endif;
        ToggleTimer:=0;
      endif;
    endif;
    if isSystimerZero(IncrTimer) and LCDpresent then
      SetSystimer(IncrTimer, 50);
      if not FirstTurn then
        BusyFlag:=false;
        ButtonNumber:=0; // kein Button, freigegeben
        serprompt(UserReq);
      endif;
      FirstTurn:=true;
    endif;
    if isSystimerZero(DisplayTimer) and LCDpresent then
      WerteOnLCD;
      inctolim(ToggleTimer,16);
      SetSystimer(DisplayTimer, 200);
      IncrFine:=false;
      ChangedFlag:=false;
      BusyFlag:=false;
    endif;
  endloop;
end EDL.


