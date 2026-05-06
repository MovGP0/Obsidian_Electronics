program ACV;
(*
Programmierbarer Präzisions-Vorverstärker mit AD-Wandler 192 kHz/24 Bit
05.05.2010 #1.07 Getrennte Skalierungen L/R auf 200..207 (L) und 210..217 (R)
                 Option-Parameter 152 für LRswap eingeführt
21.02.2008 #1.06 ParseExtract geändert für Integer, wichtig!
                 Skalierte Anzeige/Ausgabe mV je nach Gain eingeführt
21.02.2008 #1.05 SPDIF-Format einstellbar, Bug in Level-Befehl korrigiert
16.12.2007 #1.04 kein EEPROM-File mehr notwendig, initialisiert auf Defaults, autom. Bargraph
19.11.2007 #1.03 aus Platzgründen umgestellt auf Integer statt Float für Pegel und Param
14.10.2007 Parser-Übernahme aus DIV und DDS

*)

//Defines aktivieren durch Entfernen des 1. Leerzeichens!

{$NOSHADOW}
{$W- Warnings}            {Warnings off}
{$TYPEDCONST OFF}
{$DEBDELAY}

Device = mega168, VCC = 5;

Define_Fuses
Override_Fuses; // optional, always replaces fuses in ISPE
LockBits0 = [];
ProgMode = SPI;

Import SysTick, TWImaster, ADCport, SerPort;
Import IncrPort4, LCDmultiPort, I2CExpand;
//From System import LongInt;

Define
  ProcClock      = 16000000;        {Hertz}
  TWIpresc       = TWI_BR400;

  LCDmultiPort   = I2C_TWI;
  LCDTYPE_M      = 44780; // 44780 oder 66712;
  LCDrows_M      = 2;              //rows
  LCDcolumns_M   = 8;             //chars per line
  IncrPort4      = PinC, 1, 16; // pin-reg used, channels, 16 or 32bit integer
  IncrScan4      = Timer1, 4; // timer used, scan rate 1kHz (1..100)


  SysTick        = 10;              //msec
  SerPort        = 38400, Stop1, timeout;    {Baud, StopBits|Parity}
  RxBuffer       = 64, iData;
  TxBuffer       = 64, iData;

  StackSize      = $0080, iData;
  FrameSize      = $0080, iData;

  ADCchans = [3,4], iData, int2;
  ADCpresc       = 64;

  LCDBargraph1 = LCDmultiPort;
  LCDBargraph2 = LCDmultiPort;

  I2Cexpand      = I2C_TWI, $38; {use TWIport, 9554A}
  I2CexpPorts    = Port0; {Port0 auf AD-Wandler-Platine}
Implementation

type
  tCmdWhich = (str,idn,trg,
               val,wav,bst,aux,inl,rng,ofs,
               dsp,all,scl,wen,erc, sbd, nop, err);
  tModify   = (AuxCmdsel, RateSel, GainSel, LevelBarDispl, mVDispl);   //0..1
  tSPDIF   = (c48khz, c96khz, c192khz, p48khz, p96khz, p192khz);   //0..2
  tError = (NoErr, UserReq, BusyErr, OvlErr, SyntaxErr, ParamErr, LockedErr,ChecksumErr);

{--------------------------------------------------------------}
const
//                              ----SFDC             Strobe,FSync,Data,Clk
  DDRBinit                   = %00011111;            {PortB dir }
  PortBinit                  = %00010000;            {PortB }

  DDRCinit                   = %11110000;            {PortC dir, 0..1=Incr4 }
  PortCinit                  = %11110011;            {PortC }

{ Jumper und LEDs PortBits }
  DDRDinit                   = %00000100;            {PortD dir, 0..1=Serial }
  PortDinit                  = %11111100;            {PortD }

  BtnInPortReg               = @PinD;   {Taster-Eingangsport}
  LEDOutPort                 = @PortD;   {LED-Port}
  ControlBitPort             = @PortB;   {DDS-Port}
  ExtensionPort              = @PortB;   {Erweiterungsplatine}
  b_SerAux                   = 4; //PB4_MISO ist SerAux zweiter serieller Ausgang


//Lineal     .----.----.----.----.----.----.----.----.----
  Vers1Str                   = '1.07 [ACV by CM/c''t 03/2007]';    //Vers1
  Vers3Str                   = 'ACV 1.07';    // Kurzform von Vers1


  ErrStrArr      : array[0..7] of String[9] = (
    '[OK]','[SRQUSR]','[BUSY]','[OVERLD]','[CMDERR]','[PARERR]','[LOCKED]','[CHKSUM]');

  EEnotProgrammedStr        = 'EEPROM EMPTY! ';
  AdrStr                    = 'Adr ';
  dBStr                     = ' dB ';
  mVStr                     = ' mV ';
  GainSelStr                = 'InpGain ';
  AuxCmdSelStr              = 'Cmd';
  AuxCmdStr                 = 'AuxFunct';
  MemorizedStr              = 'Memorizd';
  OverloadStr              = ' OVERLD ';
  RateSelStr                = 'SmplRate';
  RateStrArr      : array[0..5] of String[7] =
  ('C 48kHz','C 96kHz','C192kHz','P 48kHz','P 96kHz','P192kHz');


  ErrSubCh                   = 255;

  CmdStrArr: array[0..12] of String[3] = (
  'STR', // 255
  'IDN', // 254
  'VAL', // 0..255
  'SMP', // 8
  'INL', // 10..11
  'RNG', // 19
  'DSP', // 80
  'ALL', // 99
  'SCL', // 200..213
  'WEN', // 250
  'ERC', // 251 = ErrCount seit letztem Reset
  'SBD', // 252 = SerBaud UBRR-Register mit U2X=1
  'NOP');   //2 Parameter
  Cmd2SubChArr: array[0..12] of byte = (
  255, 254,
  0, 8, 10, 19, 80, 99, 200, 250, 251, 252, 0);

  high                       = true;
  low                        = false;

  SwitchArr: array[0..7] of byte = (    // Schaltstellungen für 7 Gains -20 .. +50dB
    %00001000,  // -20
    %00001001,  // -10
    %00000000,  // 0
    %00000001,  // +10
    %00000100,  // +20
    %00000101,  // +30
    %00000110,  // +40
    %00000111   // +50
    );
  ADCrangeScalesDiv:Array[0..7] of word =
     (100, 100, 1000, 1000, 10000, 1000, 10000, 10000); // -20db, -10dB, 0db, +10dB, +20dB, +30dB, +40dB

structconst


//Default-EEPROM-Werte:
{$EEPROM}
  dummy:Word = 0;
  EEinitialised:word = $AA55;
  InitIncRast:Integer = 4;
  InitGain:Byte = 2;
  InitRate:tSPDIF = c48khz;
  InitAuxCmd:byte = 7; // DDS-ULD: 1000 Hz Mono, 48 kHz
  EESerBaudReg:byte = 51;
  ADCscalesL:Array[0..7] of word =
  // -20db -10dB 0db +10dB +20dB +30dB +40dB +50dB
     (2100, 664, 2100, 664, 2100, 664, 2100, 664);
  ADCscalesR:Array[0..7] of word =
  // -20db -10dB 0db +10dB +20dB +30dB +40dB +50dB
     (2100, 664, 2100, 664, 2100, 664, 2100, 664);
  InitLRswap:boolean = false;
{--------------------------------------------------------------}

var
{$DATA} {Schnelle Register-Variablen}
  i,
  k           : Byte;  // k in HW-Prozess benutzt
  m: Byte;

{$IDATA}  {Langsamere SRAM-Variablen}

  SlaveCh: byte;
  SwitchState: Byte; //Zwischenspeicher für 4094 SR

  LEDactivity[LEDOutPort, 2]    : bit; {Bit 2 LED Remote-Activity}
  LEDswitch[LEDOutPort, 3]      : bit; {Bit 3 LED über dem Display}
  ADCconfig[@Port0]  : TI2Cport;    // Port 9554A auf ADC-Platine
  ADCDDR[@DDR0]    : TI2Cport;

  ButtonTemp: Byte; // invertiert - low=on!
  ButtonLeft[@ButtonTemp, 5]  : bit;
  ButtonRight[@ButtonTemp, 4]  : bit;
  ButtonEnter[@ButtonTemp, 3]  : bit;

  AuxCmd: byte;
  SPDIFrate: tSPDIF;
  MuteLeft[@AuxCmd, 4]      : bit; // JP1
  MuteRight[@AuxCmd, 5]     : bit; // JP2
  Stereo[@AuxCmd, 6]        : bit; // JP3
  Rate96[@AuxCmd, 7]        : bit; // JP4, Defaults, Konfigurationsregister


  ActivityTimer:Systimer8;
  DisplayTimer:Systimer8;
  BarGraphDelayTimer:Systimer8;
  IncrTimer:Systimer8;

//Parameter
  Gain, OldGain: Byte;
  LeftLevel, RightLevel: Word; // mV-Wert skaliert
  LeftLevelScaled,RightLevelScaled:Integer;
  LeftLevelByte, RightLevelByte: Byte; // für Pegelanzeige
  GainStr        : String[8];

  ScaleMult, ScaleDiv:word;

  CmdWhich: tCmdWhich;
  CmdStr: string[3];
  SubCh, CurrentCh       : byte;
  OmniFlag,verbose: boolean;
  ParamInt:Integer;
  ParamByte:Byte;
  SerInpStr : String[63];
  SerInpPtr:byte;
  
  LCDpresent: boolean;
  Modify: tModify;
  IncrValue,OldIncrValue: Integer;
  IncrEnter,FirstTurn:Boolean;
  IncrDiff,IncrAccInt10, IncRast:Integer;
  IncrDiffByte:Byte;
  digits, nachkomma:byte;
  ChangedFlag:Boolean;

//für Parser
  ParamStr:string[40]; // auch für Display
  isInteger,Request:boolean;

  I2Ccmd:Word;

  Status:byte;
  BusyFlag[@Status, 7]  : bit;
  UserSRQFlag[@Status, 6]  : bit;
  OverloadFlag[@Status, 5]  : bit;
  EEUnlocked[@Status, 4]  : bit; // EEPROM-unlocked-Flag
  ErrCount:integer;
  ErrFlag:boolean;
  UpperChannel:char;
  LowerChannel:char;
  LeftOverload, RightOverload: boolean;
{$NOSAVE}



{###########################################################################}

procedure SerAux(mybyte:byte);
//Sende Byte in "mychar" mit 19200 Bd an PB5 für MP3-Player
begin
  _ACCDHI:=mybyte;
  asm;
    ldi  _ACCDLO, 8
    cbi  ACV.ExtensionPort, ACV.b_SerAux ; Startbit
    ldi       _ACCA, 5
    call      SYSTEM.UDELAY
  ACV.SerAuxloop1:    ; Byte rausschieben
    lsr  _ACCDHI          ; Bit 0 zuerst
    brcs ACV.SerAuxdatahigh
    cbi  ACV.ExtensionPort, ACV.b_SerAux
    rjmp ACV.SerAuxdataset
  ACV.SerAuxdatahigh:
    sbi  ACV.ExtensionPort, ACV.b_SerAux
  ACV.SerAuxdataset:
    ldi       _ACCA, 5
    call      SYSTEM.UDELAY
    dec _ACCDLO
    brne ACV.SerAuxloop1
    sbi  ACV.ExtensionPort, ACV.b_SerAux
    ldi       _ACCA, 10
    call      SYSTEM.UDELAY
  endasm;
end;

procedure GetLevels;
//Pegel vom TRMS-Wandler links und rechts
begin
  RightOverload:=false;
  LeftOverload:=false;
  RightLevel:=getadc(4);
  LeftLevel:=getadc(3);
  LeftLevelByte:=byte(LeftLevel shr 2);
  ScaleDiv:=ADCrangeScalesDiv[Gain];
  if RightLevel > 1019 then
    RightOverload:=true;
    RightLevelByte:=255;
    RightLevelScaled:=0;
  else
    RightLevelByte:=byte(RightLevel shr 2);
    ScaleMult:=ADCscalesR[Gain];
    RightLevelScaled:= integer(MulDivInt(RightLevel,ScaleMult,ScaleDiv));
  endif;
  if LeftLevel > 1019 then
    LeftOverload:=true;
    LeftLevelByte:=255;
    LeftLevelScaled:=0;
  else
    LeftLevelByte:=byte(LeftLevel shr 2);
    ScaleMult:=ADCscalesL[Gain];
    LeftLevelScaled:= integer(MulDivInt(LeftLevel,ScaleMult,ScaleDiv));
  endif;
end;

{###########################################################################}
{$NOSAVE}


//EEPROM-Routinen

procedure PatchCopyFromEE;
//Frequenz und Settings aus EEPROM holen
begin
  IncRast:=InitIncRast;
  Gain:=InitGain;
  SPDIFrate:=InitRate;
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
procedure I2CoutAdr10(Register,Data: byte);
// für CS8406
begin
  I2Ccmd := word(Register);
  I2Ccmd := (I2Ccmd shl 8) + word(Data);
  TWIout($10, I2Ccmd);
end;

function I2CinAdr10(Register: byte):byte;
// für CS8406
begin
  TWIout($10, Register);
  TWIinp($10, m);
  return(m);
end;

procedure initSPDIF;
begin
  I2CoutAdr10($04, %00000000); // Clock Source Control STOP
  I2CoutAdr10($01, %00000001);  // TCBLD ist Ausgang
  I2CoutAdr10($12, %00000000);  // Channel Status Buffer Control, One Byte Mode
  case SPDIFrate of  // für 24,576 MHz, bei 12,288 MHz kein 192 kHz möglich
  // ADCconfig: /HPF /RST --- --- --- MDIV M1 M0
    c96khz, p96khz:
    ADCconfig:=%01000101; // Reset High, MDIV on, Double Speed (M0)
    I2CoutAdr10($04, %01000000);  // Clock Source Control RUN
    |
    c192khz, p192khz:
    ADCconfig:=%01000110; // Reset High, MDIV on, Quad Speed (M0)
    I2CoutAdr10($04, %01110000);  // Clock Source Control RUN
    |
  else
    ADCconfig:=%01000100; // Reset High, MDIV on, Single Speed (M0)
    I2CoutAdr10($04, %01100000);  // Clock Source Control RUN
  endcase;
  I2CoutAdr10($05, %00000101);  // Audio Input format

  // Channel-Status-Übersicht siehe Cirrus/Crystal AN22 unter "Consumer Mode"
  //   C-Bits   01234567, Buffer-Start bei $20
  I2CoutAdr10($20, %00100000); // Consumer, Copy Permit
  I2CoutAdr10($21, %01000001); // Category A/D, Original
  I2CoutAdr10($22, %00000000); // Source/Channel: Don't Care
  I2CoutAdr10($23, %01001000); // 48kHz Sampling Rate, Clock Acc.
  I2CoutAdr10($24, %11000110); // Auxiliary Bits
  I2CoutAdr10($25, %10110110);
  I2CoutAdr10($26, %11110100);
  I2CoutAdr10($27, %11000110);
  I2CoutAdr10($28, %11100100);
  I2CoutAdr10($29, %00101110);
end;

procedure SwitchGain;
// Gain-Relais/Multiplexer anhand Gain einschalten
begin
  if (Gain=OldGain) then
    return;
  endif;
  OldGain:=Gain;
  PortB:=SwitchArr[Gain] OR PortBinit;
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
  ParamStr:= IntToStr(ParamInt);
end;

procedure ParamToStrScaled;
begin
  if Gain>4 then
    ParamStr:= intToStr(ParamInt:3);
    insert('.', ParamStr,3);
  else
    ParamStr:= intToStr(ParamInt:4);
  endif;
end;

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

procedure SollWerteOnLCD;
var myGain:Integer; myModify:tModify;
begin
  digits:=2;
  nachkomma:=1;
  myModify:=Modify;
  if not issystimerzero(BarGraphDelayTimer) then
    if Modify in [LevelBarDispl, mVDispl] then
      myModify:=GainSel;
    endif;
  endif;
  case myModify of
    mVDispl:  // Pegelanzeige -50..+10 dB
      if IncrEnter then
        InitGain:=Gain;
      endif;
      getLevels;
      LCDxy_M(LCD_m1, 0, 0);
      lcdout_m(UpperChannel);
      if LeftLevelByte>253 then
        write(lcdout_m,OverloadStr);
      else
        ParamInt:=integer(LeftLevelScaled);
        ParamToStrScaled;
        write(lcdout_m,ParamStr);
        write(lcdout_m,mVStr);
      endif;

      LCDxy_M(LCD_m1, 0, 1);
      lcdout_m(LowerChannel);
      if RightLevelByte>253 then
        write(lcdout_m,OverloadStr);
      else
        ParamInt:=integer(RightLevelScaled);
        ParamToStrScaled;
        write(lcdout_m,ParamStr);
        write(lcdout_m,mVStr);
      endif;
      |
    LevelBarDispl:  // Pegelanzeige -50..+10 dB
      if IncrEnter then
        InitGain:=Gain;
      endif;
      LCDxy_M(LCD_m1, 0, 0);
      lcdout_m(UpperChannel);
      LCDxy_M(LCD_m1, 0, 1);
      lcdout_m(LowerChannel);
      getLevels;
      LCDbarOut1(LeftLevelByte);
      if LeftLevelByte<96 then
        LCDxy_M(LCD_m1, 6, 0);
        lcdout_m(#7);
      endif;
      if LeftLevelByte>180 then
        LCDxy_M(LCD_m1, 7, 0);
        lcdout_m(#6);
      endif;
      LCDbarOut2(RightLevelByte);
      if RightLevelByte<96 then
        LCDxy_M(LCD_m1, 6, 1);
        lcdout_m(#7);
      endif;
      if RightLevelByte>180 then
        LCDxy_M(LCD_m1, 7, 1);
        lcdout_m(#6);
      endif;
      |
    GainSel:
      if IncrEnter then
        InitGain:=Gain;
      endif;
      LCDxy_M(LCD_m1, 0, 0);
      myGain:=integer(Gain*10)-20;
      GainStr:=IntToStr(myGain:3);
      if myGain>=0 then
        GainStr[1]:='+';
      endif;
      write(lcdout_m,GainStr);
      write(lcdout_m,dBStr);
      lcdout_m(#5);
      LCDxy_M(LCD_m1, 0, 1);
      write(lcdout_m,GainSelStr);
      |
    AuxCmdsel:
      if IncrEnter then
        InitAuxCmd:=AuxCmd;
      endif;
      LCDxy_M(LCD_m1, 0, 0);
      write(lcdout_m,AuxCmdSelStr);
      lcdout_m(#32);
      write(lcdout_m,bytetoHex(AuxCmd));
      lcdout_m(#32);
      lcdout_m(#5);
      LCDxy_M(LCD_m1, 0, 1);
      write(lcdout_m,AuxCmdStr);
      |
    RateSel:
      if IncrEnter then
        InitRate:=SPDIFrate;
      endif;
      LCDxy_M(LCD_m1, 0, 0);
      write(lcdout_m,RateStrArr[ord(SPDIFrate)]);
      lcdout_m(#5);
      LCDxy_M(LCD_m1, 0, 1);
      write(lcdout_m,RateSelStr);
      |
  endcase;
  if IncrEnter then
    LCDxy_M(LCD_m1, 0, 1);
    write(lcdout_m,MemorizedStr);
    SetSystimer(DisplayTimer, 100);
  endif;
  IncrEnter:=false;
end;

function Checklimits:boolean;
// liefert TRUE wenn "Out of Gain"
var myBool: Boolean;
begin
  myBool:=false;
  if Gain>127 then  // Byte!
    Gain:=0;
    myBool:=true;
  endif;
  if Gain>7 then  // Byte!
    Gain:=7;
    myBool:=true;
  endif;
  if ord(SPDIFrate)>127 then  // Byte!
    SPDIFrate:=c48kHz;
    myBool:=true;
  endif;
  if ord(SPDIFrate)>5 then  // Byte!
    SPDIFrate:=p192khz;
    myBool:=true;
  endif;
  return(myBool);
end;

{###########################################################################}

// gerätespezifischer Parser-Teil

procedure ParseGetParam;
var myIndex: Byte;
begin
  myIndex:=SubCh mod 10;  // angespr. Register 0..9 errechnen aus SubCh-Rest
  digits:=2;
  nachkomma:=1;
  case SubCh of
    8:  // Sample Rate
      ParamByte:=ord(SPDIFrate);
      WriteParamByteSer;
      return;
      |
    10: // True-RMS-Wert in mV
      GetLevels;
      ParamInt:=integer(LeftLevelScaled);
      if LeftOverload then
        ParamStr:='-9999 [OVERLD]';
      else
        ParamToStrScaled;
      endif;
      WriteParamStrSer;
      return;
      |
    11: // True-RMS-Wert in mV
      GetLevels;
      ParamInt:=integer(RightLevelScaled);
      if RightOverload then
        ParamStr:='-9999 [OVERLD]';
      else
        ParamToStrScaled;
      endif;
      WriteParamStrSer;
      return;
      |
    19:
      ParamByte:=Gain;
      WriteParamByteSer;
      return;
      |
    50:
      GetLevels;
      ParamInt:=integer(LeftLevel);
      |
    51:
      GetLevels;
      ParamInt:=integer(RightLevel);
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
    99: // beide True-RMS-Werte in mV
      GetLevels;
      ParamInt:=integer(LeftLevelScaled);
      if LeftLevelByte>253 then
        ParamStr:='-9999 [OVERLD]';
      else
        ParamToStrScaled;
      endif;
      SubCh:=10;
      WriteParamStrSer;

      ParamInt:=integer(RightLevelScaled);
      if RightLevelByte>253 then
        ParamStr:='-9999 [OVERLD]';
      else
        ParamToStrScaled;
      endif;
      SubCh:=11;
      WriteParamStrSer;
      return;
      |
    150:
      ParamByte:=InitGain;
      WriteParamByteSer;
      return;
      |
    151:
      ParamByte:=byte(InitRate);
      WriteParamByteSer;
      return;
      |
    152:
      ParamByte:=byte(InitLRswap);
      WriteParamByteSer;
      return;
      |
    200..207:
      ParamInt:=integer(ADCscalesL[myIndex]);
      |
    210..217:
      ParamInt:=integer(ADCscalesR[myIndex]);
      |
    230:
      ParamByte:=I2CinAdr10($7F);
      WriteParamByteSer;
      return;
      |
    251: // Fehlerzähler auslesen
      ParamInt:=Integer(Errcount);
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
var myIndex: Byte;
begin
  myIndex:=SubCh mod 10;  // angespr. Register 0..9 errechnen aus SubCh-Rest
  if Busyflag then
    serprompt(BusyErr,0);
    return;
  endif;
  ChangedFlag:=true;
  case SubCh of
    8:
      SPDIFrate:=tSPDIF(ParamByte);
      CheckLimits;
      initSPDIF;
      |
    9:
      SerAux(ParamByte);
      |
    19:
      Gain:=ParamByte;
      CheckLimits;
      |
    20:
      |
    80: // LCD Anzeige-Wert
      if ParamByte > ord(LevelBarDispl) then
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
    150..152,200..217:
      if EEunLocked then
        case SubCh of
        150:
          InitGain:=ParamByte;
          |
        151:
          InitRate:=tSPDIF(ParamByte);
          |
        152:
          InitLRswap:=(ParamByte<>0);
          |
        200..207:
          ADCscalesL[myIndex]:=word(ParamInt);
          |
        210..217:
          ADCscalesL[myIndex]:=word(ParamInt);
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
  SwitchGain;
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
//Integer-Version, für Parameter nur Ziffern akzeptiert
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
      if myChar in ['0'..'9'] then // nur Ziffern, geändert für Integer-Kompatibilität!
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
      ParamInt:=StrToInt(ParamStr);
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
  ADCDDR:=%11111111;
  i:=EESerBaudReg;
  if not i in [9..239] then
    EESerBaudReg:=51;
    i:=51;
  endif;
  ubrr1:=i;
  UCSRA:=UCSRA or 2; // Set U2X bit
//  serBaud(EESerbaud);        // nur mit 644

  ADMUX:= ADMUX OR %11000000;  {Internal ADC Reference}

  PatchCopyFromEE;       // Optionen-Defaults
  
  ADCconfig:=0;
  udelay(1);
  SlaveCh:=(not PinD) shr 5;
  LEDactivity:= low;

  if LCDsetup_M(LCD_m1) then
    LCDcursor_M(LCD_m1, false, false);
    LCDbarInit_M;             // stores charset to first display
    LCDbarSet1(0, 1, 7, 127);  // 7 Zeichen Anzeigeumfang, 1 Zeichen für Overload
    LCDbarSet2(1, 1, 7, 127);
    LCDCharSet_M(LCD_m1, #5, $01, $03, $07, $0F, $07, $03, $01, $00); // "<" Cursor
    LCDCharSet_M(LCD_m1, #6, $15, $0A, $15, $0A, $15, $0A, $15, $0A); // Overld-Block
    LCDCharSet_M(LCD_m1, #7, $10, $00, $10, $00, $10, $00, $10, $00); // 0dB-Strich

    LCDpresent:=true;
    write(lcdout_m,Vers3Str);
    LCDxy_M(LCD_m1, 0, 1);
    write(lcdout_m,AdrStr);
    lcdout_m(char(SlaveCh+48));
  endif;

  if EEinitialised <> $AA55 then
    InitIncRast: = 4;
    InitGain:=2;
    InitRate:=c48khz;
    InitAuxCmd:= 7; // DDS-ULD: 1000 Hz Mono, 48 kHz
    EESerBaudReg:=51;
    EEinitialised:=$AA55;
    PatchCopyFromEE;       // Optionen-Defaults in Variable kopieren
  endif;
  SwitchGain;

  mdelay(1000);
  if SlaveCh>0 then
    for i := 0 to SlaveCh-1 do
      toggle(LEDactivity);
      mdelay(150);
      toggle(LEDactivity);
      mdelay(150);
    endfor;
  endif;
  LEDactivity:= high;

  Status:=0;
  EnableInts;
  while serstat do
    i:=SerInp;
  endwhile;
  IncrCount4start;
  SetIncrVal4(0,0);
  IncrValue:=GetIncrVal4(0);
  OldIncrValue:= IncrValue;
  IncrDiff:=0;
  IncrEnter:=false;
  Modify:=GainSel;
  SollwerteOnLCD;
  mdelay(1000);
  Modify:=LevelBarDispl;
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
  SetSystimer(BarGraphDelayTimer, 150);
  AuxCmd:=InitAuxCmd; //
  serAux(AuxCmd);
  ADCconfig:=%01000000; // Reset High
  InitSPDIF;
  if InitLRswap then
    UpperChannel:='R';
    LowerChannel:='L';
  else
    UpperChannel:='L';
    LowerChannel:='R';
  endif;
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
          if abs(IncrDiff)> 1 then //Beschleunigung
            IncrDiff:=IncrDiff * 2;  // 2x Differenz mit Beschleunigung
          endif;
          if abs(IncrDiff)> 2 then //Beschleunigung
            IncrDiff:=IncrDiff * 2;  // 4x Differenz mit Beschleunigung
          endif;
          IncrAccInt10:=IncrDiff*10; // 40x Differenz mit Beschleunigung
          SetSystimer(DisplayTimer, 10);
          if FirstTurn then
            serprompt(noErr,Status+67); // UserSRQ-Flag=64, +3
          endif;
          case Modify of
            AuxCmdsel:
              AuxCmd:=AuxCmd+byte(IncrDiff);
              // CheckLimits;
              SubCh:=9;
              ParseGetParam;
              SerAux(AuxCmd);  // SPDIFconfig an ULD übermitteln
              |
            RateSel:
              i:=ord(SPDIFrate);
              i:=i + IncrDiffByte;
              SPDIFrate :=tSPDIF(i);
              CheckLimits;
              initSPDIF;
              //SubCh:=8;
              //ParseGetParam;
              |
            GainSel,mVDispl,LevelBarDispl:  // mit Drehgeber AC-Gain wählen
              SetSystimer(DisplayTimer, 10);
              SetSystimer(BarGraphDelayTimer, 75);
              Gain:=Gain+IncrDiffByte;
              CheckLimits;
              SwitchGain;
              SubCh:=19;
              ParseGetParam;
              |
          endcase;
          IncrDiff:=0; // für nächsten Durchlauf
          CheckLimits;
          SollwerteOnLCD;
          FirstTurn:=false;
        endif;
      endif;
      Checkdelay(1); // wichtig für Beschleunigungsfunktion
      ButtonTemp := (LCDportInp_M(LCD_m1) or %11000111);
      if ButtonTemp <> $FF then
        Checkdelay(1);
        ButtonTemp := (LCDportInp_M(LCD_m1) or %11000111);
        if ButtonTemp <> $FF then
          ChangedFlag:=true;
          BusyFlag:=true;
          if not ButtonEnter then
            serprompt(noErr,Status+67); // UserSRQ-Flag=64, +3
            IncrEnter:=true;
          endif;
          if not ButtonLeft then
            serprompt(noErr,Status+65); // UserSRQ-Flag=64, +1
            inc(Modify);
          endif;
          if not ButtonRight then
            serprompt(noErr,Status+66); // UserSRQ-Flag=64, +2
            dec(Modify);
          endif;
          SetSystimer(DisplayTimer, 10);
          SollwerteOnLCD;
          repeat
            Checkdelay(1);
            ButtonTemp := (LCDportInp_M(LCD_m1) or %11000111);
          until ButtonTemp=$ff;
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

    if isSystimerZero(DisplayTimer) and LCDpresent then
      SetSystimer(DisplayTimer, 10);
      BusyFlag:=false;
      SollwerteOnLCD;
      ChangedFlag:=false;
    endif;
  endloop;
end ACV.

