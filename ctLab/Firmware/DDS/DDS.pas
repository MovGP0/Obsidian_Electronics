program DDS;
(*
DDS-Funktionsgenerator mit AD98833
AD9833-DDS an PortB, Pegeleinstellung
in 2-mV-Schritten per AD7541 über 4094 SR, Ausgangspegel mit Offset
(c) by c't magazin und Carsten Meyer, cm@ctmagazin.de

22.02.2008 #3.70 Bug in Peak-Anzeige beseitigt, 1000-Hz-Anfangseinstellung,
                 Inkrementageber-Beschleunigungsfunktion stark verbessert,
                 Logik-Gleichspannungpegel-Bug behoben,
                 Init-Parameter OPT 0 für Logikpegel eingeführt
21.10.2007 #3.64 Übermittlung der Terz-Nummer und ExtConfigByte an SerAux PC5
09.09.2007 #3.63 ADC-Wandlung verbessert, OnSysTick angepasst
09.08.2007 #3.62 ERC und SBD eingeführt
23.07.2007 #3.60 RxD-Abfrage geändert in Timeout-Befehl -- mega32 hat kein FIFO
                 Busy-Flag wird bei Bedienung gesetzt, Befehle dann mit Busy-Meldung,
                 Abfragen weiterhin möglich. Systick=10ms, Timer aufgeräumt wg. kürzerem IRQ.
                 Optionale XOR-Prüfsumme eingeführt, mit "$XX" dem Befehl hintangestellt,
                 wird berechnet über gesamten Befehl, Präfix-"$" zählt nicht mehr mit
20.07.2007 #3.53 DSP-Parameter für Panel,
                 Parser geändert: Request wenn kein "=", ausf. Response nur mit "?" oder "!"
                 Einstellung der Aussgangsstufen-Verstärkung und Abschwäch-Faktor
                 passiver Abschwächer einstellbar über SCL-Parameter, automatische Anpassung
                 der Umschaltpunkte und der Anzeige
26.06.2007 #3.483 Parameter umgestellt für Peak-DACLevel, Overload-Flag für Input
06.06.2007 #3.48 Inkrementalgeber-Routinen aufgeräumt
06.06.2007 #3.38 angepasst an ATmega32, andere Ports
27.03.2007 #3.28 Status-Codes eingeführt, Übermittlung der Bedienelemente
19.03.2007 #3.27 Parser-Syntax #!?, Error-Codes, ALL-Request
25.02.2007 #3.20 Parser zweigeteilt, mit Zeitschleifen-Check für SerInp
23.01.2007 #3.10 per Define auf neue Platine (zwei 4094 SR) angepasst
11.02.2007 wg. Platzbedarf LongInt für Frequenz und DACLevel eingeführt
15.01.2007 neuer Standard-Parser wie bei DCG und DIV
14.10.2006 Übernahme aus MP3source Labor, steuert MP3-Spieler
           Yampp Industrial III von Jesper Hansen, www.jelu.se

*)

//Defines aktivieren durch Entfernen des 1. Leerzeichens!

{$DEFINE Platine2SR}     //WICHTIG: Neuere Platinen-Version mit 2x 4094 SR statt 3x
{$DEFINE Proz32}        // WICHTIG: Platine Version 3.2 mit ATmega32, mit erweiterten Features, sonst ATmega168
{ $DEFINE debug}         // Fehler-Anzeige auf LCD
{$DEFINE Panel}         // WICHTIG: Bedien-Panel vorhanden, bindet LCD mit ein

{$DEFINE Parser}         // für Testkompilierung auskommentieren

{ $DEFINE yi3}         //MP3-Player Yampp Industrial an serieller Schnittstelle


{$NOSHADOW}
{$W- Warnings}            {Warnings off}
{$TYPEDCONST OFF}
{$DEBDELAY}

{$IFDEF Proz32}
Device = mega32, VCC = 5;
{$ELSE}
Device = mega168, VCC = 5;
{$ENDIF}

Define_Fuses
Override_Fuses; // optional, always replaces fuses in ISPE
LockBits0 = [];
{$IFDEF Proz32}
FuseBits0 = [BODEN,BODLEVEL];  //4,5V Brown-Out
FuseBits1 = [SPIEN,CKOPT];
{$ELSE}
FuseBits1 = [SPIEN,BODLEVEL1,BODLEVEL0]; //4,5V Brown-Out
{$ENDIF}
ProgMode = SPI;

Import SysTick, TWImaster, ADCport, SerPort;
{$IFDEF Panel}
Import IncrPort4, LCDmultiPort;
{$ENDIF}

From System Import LongInt, Float;

Define
  ProcClock      = 16000000;        {Hertz}
  TWIpresc       = TWI_BR400;

{$IFDEF Panel}
  LCDmultiPort   = I2C_TWI;
  LCDTYPE_M      = 44780; // 44780 oder 66712;
  LCDrows_M      = 2;              //rows
  LCDcolumns_M   = 8;             //chars per line
  {$IFDEF Proz32}
    IncrPort4      = PinA, 1, 32; // pin-reg used, channels, 16 or 32bit integer
  {$ELSE}
    IncrPort4      = PinC, 1, 32; // pin-reg used, channels, 16 or 32bit integer
  {$ENDIF}
  IncrScan4      = Timer1, 4; // timer used, scan rate 1kHz (1..100)
{$ENDIF}


  SysTick        = 10;              //msec
  SerPort        = 38400, Stop1, timeout;    {Baud, StopBits|Parity}
  RxBuffer       = 255, iData;
  TxBuffer       = 255, iData;

  StackSize      = $0080, iData;
  FrameSize      = $0100, iData;

{$IFDEF Proz32}
  ADCchans = [3,4], iData, int2;
{$ELSE}
  ADCchans = [1,2], iData, int2;
{$ENDIF}
  ADCpresc       = 64;

Implementation

type
    tCmdWhich = (str,idn,trg,
                 val,frq,lvl,lvp,dbv,wav,bst,aux,inl,rng,ofs,
                 dsp,all,opt, scl,wen,erc, sbd,nop, err);
  tModify   = (wavesel, freqsel, amplsel, peaksel, inpsel, burstsel, DCsel);   //0..3
  tError = (NoErr, UserReq, BusyErr, OvlErr, SyntaxErr, ParamErr, LockedErr,ChecksumErr);

{--------------------------------------------------------------}
const

//Wave = Sinus, Dreieck/Sägezahn, Rechteck, Audio 1..99
  c_off                      = 0;
  c_sinw                     = 1;
  c_triw                     = 2;
  c_squw                     = 3;
  c_logic                    = 4;
  c_ext0                     = 5;

  c_AC100mV                  = 0;
  c_AC1V                     = 1;
  c_AC10V                    = 2;
  c_AC100V                   = 3;
  c_NoRange                  = 4;

//                              ----SFDC             Strobe,FSync,Data,Clk
  DDRBinit                   = %00011111;            {PortB dir }
  PortBinit                  = %00010111;            {PortB, b_STROBE=0 }

  DDRCinit                   = %11111100;            {PortC dir, 0..1=Incr4 }
  PortCinit                  = %11111111;            {PortC }

{ Jumper und LEDs PortBits }
  DDRDinit                   = %00001100;            {PortD dir, 0..1=Serial }
  PortDinit                  = %11111100;            {PortD }

  BtnInPortReg               = @PinD;   {Taster-Eingangsport}
  LEDOutPort                 = @PortD;   {LED-Port}
  DDSOutPort                 = @PortB;   {DDS-Port}
  ControlBitPort             = @PortB;   {DDS-Port}
  ExtensionPort              = @PortC;   {Erweiterungsplatine}

  b_SCLK                     = 0; //Takt für alle
  b_SDATAOUT                 = 1; //Daten für alle
  b_FSYNC                    = 2; //DSS-Frame
  b_STROBE                   = 3; //4094 SR Strobe
  b_STRDAC                   = 4; //LTC1257 Load
  b_SerAux                   = 5; //PB5 ist SerAux zweiter serieller Ausgang
  
//für AD9833-DDS
//                       Bit    5432109876543210
  c_ddsresetcmd              = %0010000100000000;
//                       Bit              O D M
  c_ddssinecmd               = %0010000000000000;
  c_ddstrianglecmd           = %0010000000000010;
  c_ddssquarecmd             = %0010000000101000;

{AD9833-DDS-Konstanten für Frequenzen, addiert für DDS, abhängig von CLK, hier 4.194304 Mhz}
  fhz            : Table[0..7] of LongInt = (64000000, 6400000, 640000, 64000, 6400, 640, 64, 6);

//Lineal     .----.----.----.----.----.----.----.----.----
  Vers1Str                   = '3.71 [DDS by CM/c''t 03/2007]';    //Vers1
  Vers3Str                   = 'DDS 3.71';    // Kurzform von Vers1

  ErrStrArr      : array[0..7] of String[9] = (
    '[OK]','[SRQUSR]','[BUSY]','[OVERLD]','[CMDERR]','[PARERR]','[LOCKED]','[CHKSUM]');


  EEnotProgrammedStr         = 'EEPROM EMPTY! ';
  AdrStr                     = 'Adr ';
  FrequStr                   = 'Frequ Hz';
  LevelStr                   = 'Level ';
  PeakStr                    = 'PeakL mV';
  OffsetStr                  = 'Offset V';
  RMSinpStr                   = 'Input ';
  WaveSelStrArr: array[0..5] of String[9] = (
    'Off','Sin','Tri','Squ','Lgc','Ext');
  WaveStr                    = 'Function';
  BurstStr                   = 'Burst ms';

  ErrSubCh                   = 255;

  CmdStrArr: array[0..21] of String[3] = (
  'STR', // 255
  'IDN', // 254
  'TRG', // 249
  'VAL', // 0..255
  'FRQ', // 0
  'LVL', // 1
  'LVP', // 2
  'DBU', // 3
  'WAV', // 4
  'BST', // 5
  'AUX', // 9
  'INL', // 10..13
  'RNG', // 19
  'DCO', // 20
  'DSP', // 80
  'ALL', // 99
  'OPT', // 150
  'SCL', // 200..213
  'WEN', // 250
  'ERC', // 251 = ErrCount seit letztem Reset
  'SBD', // 252 = SerBaud UBRR-Register mit U2X=1
  'NOP');   //2 Parameter
  Cmd2SubChArr: array[0..21] of byte = (
  255, 254, 249,
  0, 0, 1, 2, 3, 4, 5, 9, 10, 19, 20, 80, 99, 150, 200, 250, 251, 252, 0);

  high                       = true;
  low                        = false;

  InpGains: Array[0..3] of Float = (0.1, 1.0, 10.0, 100.0);  // 100 mV, 1V, 10V, 100V

//Inkrementalgeber-Beschleunigungstabelle
  IncrAccArray: array[0..15] of integer = (0,1,5,10,25,50,100,250,
  500,1000,2500,5000,10000,25000,25000,25000);

structconst

//Default-EEPROM-Werte:
{$EEPROM}
  dummy:LongInt=0;
  EEinitialised:word=$AA55;
  InitFrequenz:LongInt=10000;
  InitLogicLevel:Float=5000;
  InitLevel:Float=774.6;
  InitdB:float=0.0;          // obsolet
  InitWave:byte=c_sinw;      // Wave Sinus
  InitBurst:byte=0;          // Burst
  InitOffset:Float=0.0;      // Offset in V
{$IFDEF Platine2SR}
  InitPwrGain: Float = 2; // 2fache Nachverstärkung
  InitAttnFac: Float = 40; // Abschwächung auf 1/40
  InitIncRast:Integer = 4; // Segor-Drehgeber
{$ELSE}
  InitPwrGain: Float = 1; // 1fache Nachverstärkung
  InitAttnFac: Float = 40; // Abschwächung auf 1/40
  InitIncRast:Integer = 2;
{$ENDIF}
  InitTerzNum:Byte=17;
  LevelScaleLow:Float=1;     // Pegel-Korrekturwert  <200 mV
  LevelScaleHi:Float=1;      // Pegel-Korrekturwert >=200 mV
  ADCscales:Array[0..3] of Float = (1.0, 1.0, 1.0, 1.0);  // 100 mV, 1V, 10V, 100V
  EESerBaudReg:byte=51;

  TerzArray      : table[0..31] of LongInt =
 (
  200, //0
  250,
  315,
  400,
  500,
  630,
  800,
  1000,
  1250,
  1600, //9
  2000, //0
  2500,
  3150,
  4000,
  5000,
  6300,
  8000,
  10000,
  12500,
  16000, //9
  20000, //0
  25000,
  31500,
  40000,
  50000,
  63000,
  80000,
  100000,
  125000,
  160000, //9
  200000, //0
  0);

{--------------------------------------------------------------}

var
{$DATA} {Schnelle Register-Variablen}
  i,
  k           : Byte;  // k in HW-Prozess benutzt
  m: Byte;

{$IDATA}  {Langsamere SRAM-Variablen}

  dss_cmd        : word;
  wave_cmd       : word;
  SlaveCh: byte;
  SwitchState: Byte; //Zwischenspeicher für 4094 SR

  LEDactivity[LEDOutPort, 2]    : bit; {Bit 2 LED Remote-Activity}
  LEDswitch[LEDOutPort, 3]      : bit; {Bit 3 LED über dem Display}

  ButtonTemp,RangeTemp: Byte; // invertiert - low=on!
  ButtonLeft[@ButtonTemp, 5]  : bit;
  ButtonRight[@ButtonTemp, 4]  : bit;
  ButtonEnter[@ButtonTemp, 3]  : bit;

{$IFDEF Proz32}
  b_Gain10[ExtensionPort, 2]: bit;  // True-RMS-Konverter Preamp 10X statt 1X
  b_Attn200[ExtensionPort, 3]: bit; // True-RMS-Konverter Abschwächer 200 statt 2
{$ENDIF}

{$IFDEF Platine2SR}
  b_SquareSw[@SwitchState, 4]: bit;
  b_AttnSw[@SwitchState, 5]  : bit;
  b_ExtOn[@SwitchState, 6]: bit;
  b_OffsSw[@SwitchState, 7]   : bit;
{$ELSE}
  b_SquareSw[@SwitchState, 0]: bit;
  b_AttnSw[@SwitchState, 1]  : bit;
  b_ExtOn[@SwitchState, 2]: bit;
  b_OffsSw[@SwitchState, 3]   : bit;
  b_LogicSw[@SwitchState, 4]   : bit;
{$ENDIF}

  DACtemp:Integer; // DC-Offset-DAC
  LevelByteHi, LevelByteLo: byte; // Pegel-DAC
  DDSfrequ : LongInt;                      //Frequenzwert für DSS
  OffsetRange, LevelRange: Boolean;
//  SweepCount,
  BurstCount     : Byte;
  BurstPrime,
  MP3isOn: boolean;
  MP3currenttrack: Byte;

  MP3SecondChanged : Boolean;      // Repeat-Punkt B gesetzt?
  MP3Track       : byte;

//Reihenfolge wichtig nur für Kompatibilität mit DDS-Labor
// Korrekturwert für MP3-Player 0..16, 8=Normal, in 2-dB-Schritten bei Yampp I3
  MP3dBKorr    : Byte;


  BurstTimer : SysTimer8;
  ActivityTimer:Systimer8;
  DisplayTimer:Systimer8;
  IncrTimer:Systimer8;

//Parameter
  Frequenz     : LongInt;                    // in 1/10 Hz, 10000 = 1000.0 Hz
  TerzNum :Byte;
  Offset: Integer;                      // Offset in mV, -10000..10000
  DACLevel,DACLevelMax: Float;                       // Pegel DAC = mVeff bei Sinus
  dB, dBMax :float;
  AttnFac, AttnSwitchPoint:Float; // Abschwächungsfaktor passiver Abschwächer, Umschaltpunkt
  PwrGain:Float; // Verstärkung Ausgangsstufe
  BurstMode   : byte;
  Wave : byte;
  Range, OldRange: Byte;
  RangeStr        : String[8];
  freqStr        : String[8];

  CmdWhich: tCmdWhich;
  CmdStr: string[3];
  SubCh, CurrentCh       : byte;
  OmniFlag,verbose: boolean;
  InpGainFac:Float;
  Param:float;
  ParamInt:Integer;
  ParamLong:LongInt;
  ParamByte:Byte;
  SerInpStr : String[63];
  SerInpPtr:byte;
  
  LCDpresent: boolean;
  Modify: tModify;
  IncrValue,OldIncrValue: LongInt;
  IncrFine,FirstTurn:Boolean;
  IncrAccFloat:Float;
  IncrDiff,IncrAccInt10, IncRast:Integer;
  IncrDiffByte:Byte;
  digits, nachkomma:byte;
  ChangedFlag:Boolean;

//für Parser
  ParamStr:string[40]; // auch für Display
  isInteger,Request:boolean;


  Status:byte;
  BusyFlag[@Status, 7]  : bit;
  UserSRQFlag[@Status, 6]  : bit;
  OverloadFlag[@Status, 5]  : bit;
  EEUnlocked[@Status, 4]  : bit; // EEPROM-unlocked-Flag
  ErrCount:integer;
  ErrFlag:boolean;

{$NOSAVE}



{###########################################################################}
{$I DDS-HW.pas}

procedure onsystick;
//Burst-Generierung per Interrupt
begin
  asm;  //  auf AD-Wandlung warten, falls Systick "überfahren" wurde
    ADC10endLoop1:
    in _ACCB, ADCSRA
    sbrc _ACCB,6 // auf Bit 6 low warten
    rjmp ADC10endLoop1
  endasm;
  if BurstMode <> 0 then
      if BurstCount = 1 then
        dss_cmd:= wave_cmd;
        SendDDS;
      endif;
      if BurstCount = 0 then
        dss_cmd:= c_ddsresetcmd;
        SendDDS;
        BurstCount:= BurstMode+1;
      endif;
      dec(BurstCount);
  endif;
end;

{###########################################################################}
{$NOSAVE}

{
Pegel-DAC löst 4000 Stufen auf und liefert max 4000 mV Sinus eff.
DACLevel repräsentiert diese 4000 Stufen, allerdings werden die ersten 100
von SetLevel-Routine um Faktor 40 hochskaliert und passiv abgeschwächt, so dass
auch unter 100mV eff. wieder 4000 Stufen und somit Nachkommastellen zur Verfügung stehen.
Je nach Wellenform muss der gewünschte RMS- oder dB-Pegel in DACLevel umgerechnet werden,
unter Berücksichtigung der Nachverstärkung PwrGain (2 bei neuer Platine)}

function DACLevel2RMS(myLevel:Float):float; // Umrechnung DAC auf RMS
begin
  myLevel:=myLevel*PwrGain;
  case wave of
    c_triw:
      return(myLevel*0.816496); // im Vergleich zu Sinus
      |
    c_squw,c_logic:
      return(myLevel*1.41421);
      |
  endcase;
  return(myLevel);
end;

function RMS2DACLevel(myLevel:Float):float; // Umrechnung RMS to DAC
begin
  myLevel:=myLevel/PwrGain;
  case wave of
    c_triw:
      return(myLevel*1.224745); // im Vergleich zu Sinus
      |
    c_squw,c_logic:
      return(myLevel*0.70711);
      |
  endcase;
  return(myLevel);
end;

function Level2dB(myLevel:Float):float;
begin
  return (20 * log10(myLevel/774.597));     // 774.59667 mV
end;

function dB2Level(mydb:float):Float;
begin
// Pegelwert Fließkomma-Berechnung, mit Nachkommastellen für Parser
  return (774.597 * pow(10,(mydb/20)));
end;

function dB2DACLevel(mydb:float):float;
begin
  return (RMS2DACLevel(dB2Level(mydB)));     // dB RMS in DACLevel
end;

function DACLevel2dB(myLevel:float):float;
begin
  return (Level2dB(DACLevel2RMS(myLevel)));     // dB RMS in DACLevel
end;

{###########################################################################}

procedure SetLimits;
//Frequenz und Settings aus EEPROM holen
begin
  dBMax:=DACLevel2dB(DACLevelMax); // oberster dB-Schritt
end;

//EEPROM-Routinen

procedure PatchCopyFromEE;
//Frequenz und Settings aus EEPROM holen
begin
  Wave :=Initwave;
  PwrGain:=InitPwrGain;
  Frequenz:=InitFrequenz;
  DACLevel:=RMS2DACLevel(InitLevel);
  dB:=InitdB;
  TerzNum:= InitTerzNum; // 1000Hz-Eintrag
  Offset :=Integer(InitOffset*1000);
  BurstMode:=InitBurst;
  IncRast:=InitIncRast;
  DACLevelMax:=4000;  // 4000 D/A-Counts
  AttnFac:=InitAttnFac;
  AttnSwitchPoint:=DACLevelMax/AttnFac;
  SetLimits;
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

procedure SwitchRange;
// Range-Relais und LEDs anhand RANGE und AutoRangeMode einschalten
begin
  InpGainFac:=InpGains[Range]*ADCscales[Range];
  if (Range=OldRange) then
    return;
  endif;
  OldRange:=Range;
// Default 1V-Bereich
  b_Gain10:=low;  // AC Preamp x10
  b_Attn200:=low; // AC Attenuator :200
  RangeStr:='In    1V';
  case Range of
    c_AC100mV :
      b_Gain10:=high;  // AC Preamp x10
      RangeStr:='In 100mV';
      |
    c_AC10V   :
      b_Gain10:=high;  // AC Preamp x10
      b_Attn200:= high; // AC Attenuator :200
      RangeStr:='In   10V';
      |
    c_AC100V  :  //Abschwächer 200, Verstärkung 10 = /20
      b_Attn200:= high; // AC Attenuator :200
      RangeStr:='In  100V';
      |
  endcase;
end;

{###########################################################################}
//Menü-Prozeduren


procedure WriteParamStrSer;
begin
  WriteChPrefix;
  write(Serout, ParamStr);
  SerCRLF;
end;


procedure ParamToStr;
begin
  if Param=0 then
    ParamStr:='0';
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

procedure ParamLongToStr;
begin
  Param:= float(ParamLong)/10;
  ParamToStr;
end;

procedure OffsetToParam;
begin
  Param:=float(Offset)/1000;
end;

{
procedure ParamLongToStr;
//mit einer Nachkommastelle in Strin wandeln
begin
  ParamStr:=FoatToStr(Param:6);
  if abs(ParamLong) < 10 then //führende '0' einfügen, wenn <1
     insert('0',ParamStr,length(ParamStr)-1);
     delete(ParamStr,1,1);
  endif;
end;
}

procedure WriteParamSer;
begin
  ParamToStr;
  WriteParamStrSer;
end;

procedure WriteParamByteSer;
begin
  ParamStr:= ByteToStr(ParamByte);
  WriteParamStrSer;
end;

{$IFDEF Panel}
procedure ParamStrOnLCD;
begin
  LCDxy_M(LCD_m1, 0, 0);
  write(lcdout_m,ParamStr);
  LCDclrEOL_m(LCD_m1);
  LCDxy_M(LCD_m1, 7, 0);
  if IncrFine then
    lcdout_m(#2);
  else
    lcdout_m(#0);
  endif;
  LCDxy_M(LCD_m1, 0, 1);
end;

procedure SollWerteOnLCD;
var myWaveStr: String[3];
begin
  if (not ChangedFlag) and (Modify<>inpsel) then
    return; // unverändert, nichts zu tun
  endif;
  digits:=2;
  nachkomma:=1;
  case Modify of
    freqsel:
      ParamLong:=Frequenz;
      ParamLongToStr;
      ParamStrOnLCD;
      write(lcdout_m,FrequStr);
      |
    DCsel:
      digits:=5;
      nachkomma:=3;
      OffsetToParam;
      ParamToPMStr;
      ParamStrOnLCD;
      write(lcdout_m,OffsetStr);
      |
    amplsel:
      if IncrFine then
        Param:=DACLevel2RMS(DACLevel);
        ParamToStr;
        ParamStrOnLCD;
        write(lcdout_m,LevelStr);
        lcdout_m('m');
        lcdout_m('V');
      else
        digits:=3;
        nachkomma:=2;
        Param:=db;
        ParamToPMStr;
        ParamStrOnLCD;
        write(lcdout_m,LevelStr);
        lcdout_m('d');
        lcdout_m('B');
      endif;
      |
    peaksel:
      Param:=DACLevel*PwrGain*2.8284271; // nur über Faktor verknüpft
      ParamToStr;
      ParamStrOnLCD;
      write(lcdout_m,PeakStr);
      |
{$IFDEF Proz32}
    inpsel:
      ParamInt:= integer(getadc(3));
      Param:=float(ParamInt)*InpGainFac;
      if Range >= c_AC1V then
        Param:=Param/1000;
        nachkomma:=3;
      endif;
      ParamToStr;
      If ParamInt> 1020 then
        ParamStr:='OVRLOAD';
      endif;
      ParamStrOnLCD;
      write(lcdout_m,RangeStr);

{
      LCDxy_M(LCD_m1, 5, 0);
      if Range < C_AC10V then
        lcdout_m('m');
      else
        lcdout_m(#32);
      endif;
}
      lcdout_m('V');
      |
{$ENDIF}
    wavesel:
      LCDxy_M(LCD_m1, 0, 0);
      i:=wave;
      if i>c_ext0 then
       i:=c_ext0;
      endif;
      write(lcdout_m,WaveSelStrArr[i]);
      if wave>=c_ext0 then
        lcdout_m(#32);
        write(lcdout_m,bytetoHex(wave-c_ext0));
        lcdout_m(#32);
      else
        write(lcdout_m,'    ');
      endif;
      lcdout_m(#0);
      LCDxy_M(LCD_m1, 0, 1);
      write(lcdout_m,WaveStr);
    |
    Burstsel:
      ParamStr:=intToStr(integer(BurstMode)*10);
      ParamStrOnLCD;
      write(lcdout_m,BurstStr);
    |
  endcase;
end;
{$ENDIF} //Panel

function Checklimits:boolean;
// liefert TRUE wenn "Out of Range"
var myBool: Boolean;
begin
  myBool:=false;
  if Frequenz<0 then
    Frequenz:=0;
    myBool:=true;
  endif;
  if Frequenz>9999999 then
    Frequenz:=9999999;
    myBool:=true;
  endif;
  if DACLevel<=0 then
    DACLevel:=1;
    myBool:=true;
  endif;
  if DACLevel>DACLevelMax then
    DACLevel:=DACLevelMax;
    myBool:=true;
  endif;
  if Offset<-10000 then
    Offset:=-10000;
    myBool:=true;
  endif;
  if Offset>10000 then
    Offset:=10000;
    myBool:=true;
  endif;
  if dB>dBMax then
    db:=dBMax;
    DACLevel:=dB2DACLevel(db);
    myBool:=true;
  endif;
  if dB<-70 then
    db:=-70;
    DACLevel:=dB2DACLevel(db);
    myBool:=true;
  endif;
  if Wave>249 then  // Byte!
    Wave:=0;
    myBool:=true;
  endif;
  if TerzNum>127 then  // Byte!
    TerzNum:=0;
    myBool:=true;
  endif;
  if TerzNum>30 then
    TerzNum:=30;
    myBool:=true;
  endif;
  if BurstMode>127 then  // Byte!
    BurstMode:=0;
    myBool:=true;
  endif;
  if BurstMode>100 then
    BurstMode:=100;
    myBool:=true;
  endif;
  if Range > 127 then
    Range:=c_AC100mV;
    myBool:=true;
  endif;
  if Range > c_AC100V then
    Range:=c_AC100V;
    myBool:=true;
  endif;

  return(myBool);
end;

{###########################################################################}

// gerätespezifischer Parser-Teil

procedure ParseGetParam;
begin
  digits:=2;
  nachkomma:=1;
  case SubCh of
    0:
      ParamLong:=Frequenz;
      ParamLongToStr;
      WriteParamStrSer;
      return;
      |
    1:
      Param:=DACLevel2RMS(DACLevel);
      ParamToStr;
      WriteParamStrSer;
      return;
      |
    2:
      Param:=DACLevel*PwrGain*2.8284271;
      ParamToStr;
      WriteParamStrSer;
      return;
      |

    3:
      nachkomma:=2;
      db:=DACLevel2dB(DACLevel);
      Param:=db;
      |
    4:
      ParamByte:=wave;
      WriteParamByteSer;
      return;
      |
    5:
      ParamByte:=BurstMode;
      WriteParamByteSer;
      return;
      |
    10,99: // True-RMS-Wert in mV
{$IFDEF Proz32}
      ParamInt:= integer(getadc(3));
      Param:=float(ParamInt)*InpGainFac;
      OverloadFlag:=False;
      if ParamInt>1020 then
        OverloadFlag:=true;
        Param:=-9999;
      endif;
{$ELSE}
      Param:=0;
{$ENDIF}
      |
    11: // Peak-Wert in mV
{$IFDEF Proz32}
      ParamInt:= integer(getadc(4));
      Param:=float(ParamInt)*InpGainFac*2.8284;
      OverloadFlag:=False;
      if ParamInt>1020 then
        OverloadFlag:=true;
        Param:=-9999;
      endif;
{$ELSE}
      Param:=float(getadc);
{$ENDIF}
      |
    12:   // True-RMS-Wert in dB
      nachkomma:=2;
{$IFDEF Proz32}
      ParamInt:= integer(getadc(3));
      Param:=float(ParamInt)*InpGainFac;
      Param:= Level2dB(Param);     // 774.59667 mV
      OverloadFlag:=False;
      if ParamInt>1020 then
        OverloadFlag:=true;
        Param:=-9999;
      endif;
{$ELSE}
      Param:= 0;     // 774.59667 mV
{$ENDIF}
      |
    19:
      ParamByte:=Range;
      WriteParamByteSer;
      return;
      |
    20:
      nachkomma:=4;
      OffsetToParam;
      |
    80:
      ParamByte:=ord(Modify);
      WriteParamByteSer;
      return;
      |
    89:
      ParamByte:=byte(IncRast);
      WriteParamByteSer;
      return;
      |
    150:
      nachkomma:=1;
      Param:=float(InitFrequenz)/10;
      |
    151:
      nachkomma:=1;
      Param:=InitLevel;
      |
    152:
      nachkomma:=1;
      Param:=InitLogicLevel;
      |
    153:
      nachkomma:=2;
      Param:=InitdB;
      |
    154:
      ParamByte:=InitWave;
      WriteParamByteSer;
      return;
      |
    155:
      ParamByte:=InitBurst;
      WriteParamByteSer;
      return;
      |
    170:
      nachkomma:=4;
      Param:=InitOffset;
      |
    200: // Bereich <200mV
      nachkomma:=4;
      Param:=LevelScaleLow;
      |
    201: // Bereich >=200mV
      nachkomma:=4;
      Param:=LevelScaleHi;
      |
    202: // Verstärkung Ausgangsstufe
      nachkomma:=4;
      Param:=PwrGain;
      |
    203: // Faktor passiver Abschwächer
      nachkomma:=4;
      Param:=AttnFac;
      |
    210..213: // ADC-Bereich 100mV
      nachkomma:=4;
      Param:=ADCscales[SubCh-210];
      |
    251: // Fehlerzähler auslesen
      Param:=float(Errcount);
      |
    252: // Serielle Baudrate
      ParamByte:=EESerBaudReg;
      WriteParamByteSer;
      return;
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
      return;
      |
    250,255: //Status
      serprompt(NoErr,Status);
      return;
      |
  else
    serprompt(ParamErr,0);
    return;
  endcase;
  WriteParamSer;
end;

procedure ParseSetParam;
begin
  if Busyflag then
    serprompt(BusyErr,0);
    return;
  endif;
  ChangedFlag:=true;
  case SubCh of
    0:
      Frequenz:=LongInt(Param*10);
      |
    1:
      DACLevel:=RMS2DACLevel(Param);
      db:=Level2db(Param);
      |
    2:
      DACLevel:=Param/PwrGain/2.8284271;
      db:=DACLevel2dB(DACLevel);
      |
    3:
      db:=param;
      DACLevel:=dB2DACLevel(db);
      |
    4:
      wave:=ParamByte;
      SetLimits;
      db:=DACLevel2dB(DACLevel); // RMS neu berechnen
      if wave=c_logic then
        DACLevel:=InitLogicLevel/PwrGain/2.8284271;
        db:=DACLevel2dB(DACLevel);
      endif;
      |
    5:
      BurstMode:=ParamByte;
      |
    9:
      SerAux(ParamByte);
      |
    19:
      Range:=ParamByte;
      |
    20:
      Offset:=integer(Param*1000);
      |
    80: // LCD Anzeige-Wert
      if ParamByte > ord(DCsel) then
        serprompt(ParamErr,0);
        return;
      endif;
      Modify:=tModify(ParamByte);
      |
    89: // Inkrementalgeber Impulse pro Rastung
      if EEunLocked then
        IncRast:=ParamInt;
        InitIncRast:=IncRast;
      else
        serprompt(LockedErr,0);
        return;
      endif;
      |
    150..170:
      if EEunLocked then
        case SubCh of
        150:
          InitFrequenz:=LongInt(Param*10);
          |
        151:
          InitLevel:=Param;
          |
        152:
          InitLogicLevel:=Param;
          |
        154:
          InitWave:=ParamByte;
          |
        155:
          InitBurst:=ParamByte;
          |
        170:
          Initoffset:=Param;
          |
        else
          serprompt(ParamErr,0);
          return;
        endcase;
      else
        serprompt(LockedErr,0);
        return;
      endif;
      |
    200..213:
      if EEunLocked then
        case SubCh of
        200: // Bereich <200mV
          LevelScaleLow:=Param;
          |
        201: // Bereich >=200mV
          LevelScaleHi:=Param;
          |
        202: // Verstärkung Ausgangsstufe
          InitPwrGain:=Param;
          PatchCopyFromEE; // Reset und Grenzwerte neu setzen
          |
        203: // Faktor passiver Abschwächer
          InitAttnFac:=Param;
          PatchCopyFromEE; // Reset und Grenzwerte neu setzen
          |
        204: // Verstärkung Ausgangsstufe
          InitLogicLevel:=Param;
          PatchCopyFromEE; // Reset und Grenzwerte neu setzen
          |
        210..213: // ADC-Bereich 100mV
          ADCscales[SubCh-210]:=Param;
          |
        endcase;
      else
        serprompt(LockedErr,0);
        return;
      endif;
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
    EEunLocked:=true;
  endif;

  if CheckLimits then
    serprompt(ParamErr,Status);
  else
    serprompt(NoErr,Status);
  endif;
  SwitchRange;
  SetLevelDDS;
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
  SetSystimer(ActivityTimer, 25);
  LEDactivity:=low;
  
//Parse einzelnen Befehl

  if ParseExtract then
    SubChOffset:=0; // direkter SubCh-Aufruf
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
    if (SerInpPtr>1) and ParseExtract then
      Param:=StrToFloat(ParamStr);
      ParamInt:=integer(Param);
      ParamByte:=byte(ParamInt);
    else
      serprompt(ParamErr,0);
      return;
    endif;
    ParseSetParam;
  endif;
end;

{###########################################################################}
// Regelmäßig aufgerufen, aber nicht im Interrupt

procedure Chores;
// Regelmäßig außerhalb des Interrupts aus CheckSer heraus aufgerufen:
begin
{$IFDEF Proz32}
{$ENDIF}
end;

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

  i:=EESerBaudReg;
  if not i in [9..239] then
    EESerBaudReg:=51;
    i:=51;
  endif;
  ubrr1:=i;
  UCSRA:=UCSRA or 2; // Set U2X bit
//  serBaud(EESerbaud);        // nur mit 644

//  ADMUX:= ADMUX OR %11000000;  {Internal ADC Reference}

  PatchCopyFromEE;       // Optionen-Defaults
  
  udelay(1);
  SlaveCh:=(not PinD) shr 5;
  LEDactivity:= low;

{$IFDEF Panel}
  if LCDsetup_M(LCD_m1) then
    LCDcursor_M(LCD_m1, false, false);
    LCDCharSet_M(LCD_m1, #0, $01, $03, $07, $0F, $07, $03, $01, $00); {"<" Cursor}
    LCDCharSet_M(LCD_m1, #1, $01, $03, $05, $09, $05, $03, $01, $00); {"<" Cursor hohl}
    LCDCharSet_M(LCD_m1, #2, $01, $02, $05, $0A, $05, $02, $01, $00); {"<" Cursor IncrValeinstellung}

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
{$ENDIF}  //Panel

  OldRange:=c_NoRange;
  Range:=c_AC1V;
  SwitchRange;

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
//  MP3off;
  BurstCount:= 1;
  setSystimer(BurstTimer,1);
  while serstat do
    i:=SerInp;
  endwhile;
{$IFDEF Panel}
  IncrCount4start;
  SetIncrVal4(0,0);
  IncrValue:=GetIncrVal4(0);
  OldIncrValue:= IncrValue;
  IncrDiff:=0;
  IncrFine:=false;
{$ENDIF}  //Panel
  Modify:=freqsel;
  if DACLevel > 1000 then  // 100 mV
    LevelRange:= high;
  endif;
  mdelay(500);
  SetLevelDDS;
  mdelay(250);
  SetLevelDDS;
  db:=DACLevel2dB(DACLevel);

  FirstTurn:=true;
  SubCh:=254;
  WriteChPrefix;
  write(serout,Vers1Str);
  if EEinitialised <> $AA55 then
    write(Serout, EEnotProgrammedStr);
  endif;
  SerCRLF;
  CurrentCh:=255; // erstmal keine Reaktion
  errcount:=0;
  ChangedFlag:=true;
end;

{###########################################################################}

begin
  Initall;
//Hauptschleife
  loop
    CheckSer;  // Serinp parsen
    if isSystimerZero(ActivityTimer) then
      LEDactivity:=high; // LED aus
    endif;
{$IFDEF Panel}
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
//          BusyFlag:=true;
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
          IncrAccInt10:=IncrDiff*10; // 10x Differenz mit Beschleunigung
          IncrAccFloat:=float(IncrDiff);
          SetSystimer(DisplayTimer, 150);
          if FirstTurn then
            serprompt(noErr,Status+67); // UserSRQ-Flag=64, +3
          endif;
          case Modify of
            freqsel:
              if IncrFine then
                if FirstTurn then
                  Frequenz:=Frequenz div 10; // einmalig wieder auf Ganze runden
                  Frequenz:=Frequenz*10;
                endif;
                Frequenz:=Frequenz + longInt(IncrAccInt10);
              else
                TerzNum:=TerzNum + IncrDiffByte;
                CheckLimits; // wg. Tabellenzugriff
                Frequenz:=gettable(TerzArray,TerzNum);
              endif;
              SubCh:=0;
              ParseGetParam;
              |
            amplsel, peaksel:
              if IncrFine then
                if FirstTurn then
                  DACLevel:=int(DACLevel); // einmalig wieder auf Ganze runden
                  FirstTurn:=false;
                endif;
                DACLevel:= DACLevel + IncrAccFloat;
                CheckLimits;
                db:=DACLevel2dB(DACLevel);
              else
                if FirstTurn then
                  dB:=int(db); // Integeranteil, einmalig wieder auf Ganze runden
                endif;
                db:=dB+IncrAccFloat;
                DACLevel:=dB2DACLevel(db);
              endif;
              SubCh:=1;
              ParseGetParam;
              |
            wavesel:
              Wave:=Wave+byte(IncrDiff);
              SetLimits; // andere RMS-Konvertierungen
              CheckLimits;
              SubCh:=4;
              ParseGetParam;
              if wave>=c_ext0 then
                SerAux(wave-c_ext0);  // Config an ULD übermitteln
              endif;
              if wave=c_logic then
                DACLevel:=InitLogicLevel/PwrGain/2.8284271;
                db:=DACLevel2dB(DACLevel);
              endif;
              |
            burstsel:
              BurstMode:=BurstMode+byte(IncrDiff);
              CheckLimits;
              SubCh:=5;
              ParseGetParam;
              |
            DCsel:
              if IncrFine then
                Offset:=Offset+ IncrDiff*5;
              else
                if FirstTurn then
                  Offset:=Offset div 100; // einmalig wieder auf Ganze runden
                  Offset:=Offset*100;
                endif;
                Offset:=Offset+(IncrAccInt10*10);
              endif;
              SubCh:=20;
              ParseGetParam;
              |
            inpsel:  // mit Drehgeber AC-Range wählen
              SetSystimer(DisplayTimer, 10);
              Range:=Range+IncrDiffByte;
              CheckLimits;
              SwitchRange;
              SubCh:=19;
              ParseGetParam;
              |
          endcase;
          IncrDiff:=0; // für nächsten Durchlauf
          CheckLimits;
          SollwerteOnLCD;
          SetLevelDDS;
          FirstTurn:=false;
        endif;
      endif;
      Checkdelay(1); // wichtig für Beschleunigungsfunktion
      ButtonTemp := (LCDportInp_M(LCD_m1) or %11000111);
      if ButtonTemp <> $FF then
        Checkdelay(1);
        verbose:=true;
        ButtonTemp := (LCDportInp_M(LCD_m1) or %11000111);
        if ButtonTemp <> $FF then
          ChangedFlag:=true;
          if (not ButtonEnter) then
            serprompt(noErr,Status+67); // UserSRQ-Flag=64, +3
            IncrFine:=not IncrFine;
          endif;
          if not ButtonLeft then
            serprompt(noErr,Status+65); // UserSRQ-Flag=64, +1
            inc(Modify);
          endif;
          if not ButtonRight then
            serprompt(noErr,Status+66); // UserSRQ-Flag=64, +2
            dec(Modify);
          endif;
          SetSystimer(DisplayTimer, 150);
          SollwerteOnLCD;
          repeat
            Checkdelay(1);
            ButtonTemp := (LCDportInp_M(LCD_m1) or %11000111);
          until ButtonTemp=$ff;
          SetLevelDDS;
          FirstTurn:=false;
        endif;
      endif;
    endif;
    if isSystimerZero(IncrTimer) then
      SetSystimer(IncrTimer, 20);
      if not FirstTurn then
        serprompt(noErr,Status+64); // UserSRQ-Flag=64, freigegeben
      endif;
      FirstTurn:=true;
    endif;
{$ENDIF}  //Panel

    if isSystimerZero(DisplayTimer) and LCDpresent then
      SetSystimer(DisplayTimer, 25);
{$IFDEF Panel}
      IncrFine:=false;
      BusyFlag:=false;
      SollwerteOnLCD;
      ChangedFlag:=false;
{$ENDIF}  //Panel
    endif;
  endloop;
end DDS.

