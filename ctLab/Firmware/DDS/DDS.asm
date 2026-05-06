
                        .FILE     H:\PROJAVR\ADA-C-DDS\DDS.pas

                        ; Compiled by E-LAB AVRco PASCAL Compiler Rev 4.67
                        ; Version     : Profi
                        ;
                        ; Licenced to : Demo Version
                        ;
                        ; (c)E-LAB Computers, Grombacherstr. 27  e-mail info@e-lab.de
                        ; D-74906 Bad Rappenau  Tel. 07268/9124-0 Fax. 07268/9124-24
                        ; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                        ; Source File : DDS.pas
                        ; Compiled    : 22. Februar 2008  12:00:19
                        ; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

                        .MEDIUM
                        .ROMEND         07FFFh;

                        ; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                        ; Constants and Variables definition
                        ; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


                        ; === Internal used memory and constants ===

FALSE                   .EQU    000h            ; const 
TRUE                    .EQU    0FFh            ; const 
NIL                     .EQU    000h            ; const 
PI                      .EQU    000h            ; const 
COMPILERREV             .EQU    1D3h            ; const 
COMPILERBUILD_Y         .EQU    007h            ; const 
COMPILERBUILD_M         .EQU    004h            ; const 
COMPILERBUILD_D         .EQU    016h            ; const 
COMPILEYEAR             .EQU    008h            ; const 
COMPILEMONTH            .EQU    002h            ; const 
COMPILEDAY              .EQU    016h            ; const 
COMPILEHOUR             .EQU    00Ch            ; const 
COMPILEMINUTE           .EQU    000h            ; const 
PROJECTBUILD            .EQU    0B2h            ; const 
OPTIMISERREV            .EQU    000h            ; const 
OPTIMISERBUILD          .EQU    000h            ; const 
INTFLAG                 .EQU    007h            ; const 
_EEPROM                 .EQU    006h            ; const 
_SIGN                   .EQU    005h            ; const 
_WAITLCD                .EQU    004h            ; const 
_STRCONST               .EQU    004h            ; const 
_DEVICE                 .EQU    003h            ; const 
_NEGATIVE               .EQU    002h            ; const 
_ERRFLAG                .EQU    001h            ; const 
_I2C2BYTE               .EQU    000h            ; const 
_TOGGLE300              .EQU    000h            ; const 
_LCDLOWER               .EQU    001h            ; const 
_DSP7RFR                .EQU    002h            ; const 
_PWRSAVFLG              .EQU    003h            ; const 
_STEPCW                 .EQU    004h            ; const 
_STEPDEST               .EQU    005h            ; const 
_FREQCNTFLAG            .EQU    006h            ; const 
_AUTOACK                .EQU    007h            ; const 
_ACCGLO                 .EQU    000h            ; var Data   byte
_ACCGHI                 .EQU    001h            ; var Data   byte
_ACCHLO                 .EQU    002h            ; var Data   byte
_ACCHHI                 .EQU    003h            ; var Data   byte
_ACCB                   .EQU    010h            ; var Data   byte
_ACCA                   .EQU    011h            ; var Data   byte
_ACCALO                 .EQU    012h            ; var Data   byte
_ACCAHI                 .EQU    013h            ; var Data   byte
_ACCDLO                 .EQU    014h            ; var Data   byte
_ACCDHI                 .EQU    015h            ; var Data   byte
_ACCELO                 .EQU    016h            ; var Data   byte
_ACCEHI                 .EQU    017h            ; var Data   byte
_ACCFLO                 .EQU    018h            ; var Data   byte
_ACCFHI                 .EQU    019h            ; var Data   byte
_ACCBLO                 .EQU    01Ah            ; var Data   byte
_ACCBHI                 .EQU    01Bh            ; var Data   byte
_FRAMEPTR               .EQU    01Ch            ; var Data   byte
_FPTRHI                 .EQU    01Dh            ; var Data   byte
_ACCCLO                 .EQU    01Eh            ; var Data   byte
_ACCCHI                 .EQU    01Fh            ; var Data   byte
FLAGS                   .EQU    004h            ; var Data   byte
FLAGS2                  .EQU    005h            ; var Data   byte
_SYSTFLAGS              .EQU    006h            ; var Data   byte
SYSTICK                 .EQU    00Ah            ; const 
PROCCLOCK               .EQU    0F42400h        ; const 
DECIMALSEP              .EQU    02Eh            ; const 
CPU_ID                  .EQU    1E9502h         ; const 
ROMconstPage            .EQU    0FFFFFFFFFFFFFFFFh          ; const 
STACKSIZE               .EQU    080h            ; const 
FRAMESIZE               .EQU    100h            ; const 
SERPORT                 .EQU    9600h           ; const 
_ADCBUFF                .EQU    267h            ; var iData  word
SREG                    .EQU    05Fh            ; var pData  byte
SPH                     .EQU    05Eh            ; var pData  byte
SPL                     .EQU    05Dh            ; var pData  byte
OCR0                    .EQU    05Ch            ; var pData  byte
OCR0A                   .EQU    05Ch            ; var pData  byte
GIMSK                   .EQU    05Bh            ; var pData  byte
GICR                    .EQU    05Bh            ; var pData  byte
GIFR                    .EQU    05Ah            ; var pData  byte
TIMSK                   .EQU    059h            ; var pData  byte
TIFR                    .EQU    058h            ; var pData  byte
SPMCR                   .EQU    057h            ; var pData  byte
SPMCSR                  .EQU    057h            ; var pData  byte
TWCR                    .EQU    056h            ; var pData  byte
MCUCR                   .EQU    055h            ; var pData  byte
MCUSR                   .EQU    054h            ; var pData  byte
MCUCSR                  .EQU    054h            ; var pData  byte
TCCR0                   .EQU    053h            ; var pData  byte
TCCR0A                  .EQU    053h            ; var pData  byte
TCNT0                   .EQU    052h            ; var pData  byte
OSCCAL                  .EQU    051h            ; var pData  byte
OCDR                    .EQU    051h            ; var pData  byte
SFIOR                   .EQU    050h            ; var pData  byte
TCCR1A                  .EQU    04Fh            ; var pData  byte
TCCR1B                  .EQU    04Eh            ; var pData  byte
TCNT1H                  .EQU    04Dh            ; var pData  byte
TCNT1L                  .EQU    04Ch            ; var pData  byte
OCR1AH                  .EQU    04Bh            ; var pData  byte
OCR1AL                  .EQU    04Ah            ; var pData  byte
OCR1BH                  .EQU    049h            ; var pData  byte
OCR1BL                  .EQU    048h            ; var pData  byte
ICR1H                   .EQU    047h            ; var pData  byte
ICR1L                   .EQU    046h            ; var pData  byte
TCCR2                   .EQU    045h            ; var pData  byte
TCCR2A                  .EQU    045h            ; var pData  byte
TCNT2                   .EQU    044h            ; var pData  byte
OCR2                    .EQU    043h            ; var pData  byte
OCR2A                   .EQU    043h            ; var pData  byte
ASSR                    .EQU    042h            ; var pData  byte
WDTCR                   .EQU    041h            ; var pData  byte
UBRR1H                  .EQU    040h            ; var pData  byte
UBRRH                   .EQU    040h            ; var pData  byte
UCSRC                   .EQU    040h            ; var pData  byte
UCSR0C                  .EQU    040h            ; var pData  byte
EEARH                   .EQU    03Fh            ; var pData  byte
EEARL                   .EQU    03Eh            ; var pData  byte
EEDR                    .EQU    03Dh            ; var pData  byte
EECR                    .EQU    03Ch            ; var pData  byte
PORTA                   .EQU    03Bh            ; var pData  byte
DDRA                    .EQU    03Ah            ; var pData  byte
PINA                    .EQU    039h            ; var pData  byte
PORTB                   .EQU    038h            ; var pData  byte
DDRB                    .EQU    037h            ; var pData  byte
PINB                    .EQU    036h            ; var pData  byte
PORTC                   .EQU    035h            ; var pData  byte
DDRC                    .EQU    034h            ; var pData  byte
PINC                    .EQU    033h            ; var pData  byte
PORTD                   .EQU    032h            ; var pData  byte
DDRD                    .EQU    031h            ; var pData  byte
PIND                    .EQU    030h            ; var pData  byte
SPDR                    .EQU    02Fh            ; var pData  byte
SPSR                    .EQU    02Eh            ; var pData  byte
SPCR                    .EQU    02Dh            ; var pData  byte
UDR1                    .EQU    02Ch            ; var pData  byte
USR1                    .EQU    02Bh            ; var pData  byte
UCSRA                   .EQU    02Bh            ; var pData  byte
UCR1                    .EQU    02Ah            ; var pData  byte
UCSRB                   .EQU    02Ah            ; var pData  byte
UBRR1                   .EQU    029h            ; var pData  byte
UBRRL                   .EQU    029h            ; var pData  byte
ACSR                    .EQU    028h            ; var pData  byte
ADMUX                   .EQU    027h            ; var pData  byte
ADCSR                   .EQU    026h            ; var pData  byte
ADCSRA                  .EQU    026h            ; var pData  byte
ADCH                    .EQU    025h            ; var pData  byte
ADCL                    .EQU    024h            ; var pData  byte
TWDR                    .EQU    023h            ; var pData  byte
TWAR                    .EQU    022h            ; var pData  byte
TWSR                    .EQU    021h            ; var pData  byte
TWBR                    .EQU    020h            ; var pData  byte
TCNT1                   .EQU    04Ch            ; var pData  word
OCR1A                   .EQU    04Ah            ; var pData  word
OCR1B                   .EQU    048h            ; var pData  word
ICR1                    .EQU    046h            ; var pData  word
EEAR                    .EQU    03Eh            ; var pData  word
ADC                     .EQU    024h            ; var pData  word
_iDataStart             .EQU    060h            ; const 
_iDataEnd               .EQU    85Fh            ; const 
_EEpromStart            .EQU    000h            ; const 
_EEpromEnd              .EQU    3FFh            ; const 
_FlashStart             .EQU    000h            ; const 
_FlashEnd               .EQU    7FFFh           ; const 
parNone                 .EQU    000h            ; const 
parEven                 .EQU    001h            ; const 
parOdd                  .EQU    002h            ; const 
DataBit5                .EQU    000h            ; const 
DataBit6                .EQU    001h            ; const 
DataBit7                .EQU    002h            ; const 
DataBit8                .EQU    003h            ; const 
StopBit1                .EQU    000h            ; const 
StopBit2                .EQU    001h            ; const 
_RXTIMEOUT              .EQU    062h            ; var iData  byte
_RXINP                  .EQU    063h            ; var iData  byte
_RXOUTP                 .EQU    064h            ; var iData  byte
_RXCOUNT                .EQU    065h            ; var iData  byte
_RXBUFF                 .EQU    066h            ; var iData  byte
_TXINP                  .EQU    165h            ; var iData  byte
_TXOUTP                 .EQU    166h            ; var iData  byte
_TXCOUNT                .EQU    167h            ; var iData  byte
_TXBUFF                 .EQU    168h            ; var iData  byte
LCD_m1                  .EQU    000h            ; const 
LCD_m2                  .EQU    001h            ; const 
LCD_m3                  .EQU    002h            ; const 
LCD_m4                  .EQU    003h            ; const 
LCD_m5                  .EQU    004h            ; const 
LCD_m6                  .EQU    005h            ; const 
LCD_m7                  .EQU    006h            ; const 
LCD_m8                  .EQU    007h            ; const 
_LCDM_PORT              .EQU    060h            ; var iData  byte
TWI_BR100               .EQU    048h            ; const 
TWI_BR400               .EQU    00Ch            ; const 
SysTickTime             .EQU    061h            ; var iData  byte
_INCRSTATE4             .EQU    26Ch            ; var iData  byte
_INCRCOUNT4_0           .EQU    26Dh            ; var iData  longint
_INCRCOUNT4_D0          .EQU    271h            ; var iData  longint
_TWI_TO                 .EQU    275h            ; var iData  byte
TWI_DevLock             .EQU    276h            ; var iData  DeviceLock
EEPROM                  .EQU    000h            ; var EEprom array



                        .RESET     000000h
                        .ORG       0, CODE_START
                        .STARTCODE 000054h

                        .UNIT     DDS

                        .XDATASTART -1


                        ; ============ user definitions module: DDS ============

DDS.c_off               .EQU    000h            ; const byte     0
DDS.c_sinw              .EQU    001h            ; const byte     1
DDS.c_triw              .EQU    002h            ; const byte     2
DDS.c_squw              .EQU    003h            ; const byte     3
DDS.c_logic             .EQU    004h            ; const byte     4
DDS.c_ext0              .EQU    005h            ; const byte     5
DDS.c_AC100mV           .EQU    000h            ; const byte     0
DDS.c_AC1V              .EQU    001h            ; const byte     1
DDS.c_AC10V             .EQU    002h            ; const byte     2
DDS.c_AC100V            .EQU    003h            ; const byte     3
DDS.c_NoRange           .EQU    004h            ; const byte     4
DDS.DDRBinit            .EQU    01Fh            ; const byte     31
DDS.PortBinit           .EQU    017h            ; const byte     23
DDS.DDRCinit            .EQU    0FCh            ; const byte     252
DDS.PortCinit           .EQU    0FFh            ; const byte     255
DDS.DDRDinit            .EQU    00Ch            ; const byte     12
DDS.PortDinit           .EQU    0FCh            ; const byte     252
DDS.BtnInPortReg        .EQU    030h            ; const byte     48
DDS.LEDOutPort          .EQU    032h            ; const byte     50
DDS.DDSOutPort          .EQU    038h            ; const byte     56
DDS.ControlBitPort      .EQU    038h            ; const byte     56
DDS.ExtensionPort       .EQU    035h            ; const byte     53
DDS.b_SCLK              .EQU    000h            ; const byte     0
DDS.b_SDATAOUT          .EQU    001h            ; const byte     1
DDS.b_FSYNC             .EQU    002h            ; const byte     2
DDS.b_STROBE            .EQU    003h            ; const byte     3
DDS.b_STRDAC            .EQU    004h            ; const byte     4
DDS.b_SerAux            .EQU    005h            ; const byte     5
DDS.c_ddsresetcmd       .EQU    02100h          ; const integer  8448
DDS.c_ddssinecmd        .EQU    02000h          ; const integer  8192
DDS.c_ddstrianglecmd    .EQU    02002h          ; const integer  8194
DDS.c_ddssquarecmd      .EQU    02028h          ; const integer  8232
;fhz                     .EQU    '$006'; const String
;Vers1Str                .EQU    '3.71 [DDS by CM/'; const String
;Vers3Str                .EQU    'DDS 3.71'; const String
;ErrStrArr               .EQU    ; const Array
;EEnotProgrammedStr      .EQU    'EEPROM EMPTY! '; const String
;AdrStr                  .EQU    'Adr '; const String
;FrequStr                .EQU    'Frequ Hz'; const String
;LevelStr                .EQU    'Level '; const String
;PeakStr                 .EQU    'PeakL mV'; const String
;OffsetStr               .EQU    'Offset V'; const String
;RMSinpStr               .EQU    'Input '; const String
;WaveSelStrArr           .EQU    ; const Array
;WaveStr                 .EQU    'Function'; const String
;BurstStr                .EQU    'Burst ms'; const String
DDS.ErrSubCh            .EQU    0FFh            ; const byte     255
;CmdStrArr               .EQU    ; const Array
;Cmd2SubChArr            .EQU    ; const Array
DDS.high                .EQU    0FFh            ; const boolean  true
DDS.low                 .EQU    000h            ; const boolean  false
;InpGains                .EQU    ; const Array
;IncrAccArray            .EQU    ; const Array
DDS.dummy               .EQU    00000h          ; var EEprom longint
                        .SYM      dummy, 00000h, 04005h, 3
DDS.EEinitialised       .EQU    00004h          ; var EEprom word
                        .SYM      EEinitialised, 00004h, 0400Eh, 3
DDS.InitFrequenz        .EQU    00006h          ; var EEprom longint
                        .SYM      InitFrequenz, 00006h, 04005h, 3
DDS.InitLogicLevel      .EQU    00000000Ah      ; var EEprom Float
                        .SYM      InitLogicLevel, 0000Ah, 04006h, 3
DDS.InitLevel           .EQU    00000000Eh      ; var EEprom Float
                        .SYM      InitLevel, 0000Eh, 04006h, 3
DDS.InitdB              .EQU    000000012h      ; var EEprom Float
                        .SYM      InitdB, 00012h, 04006h, 3
DDS.InitWave            .EQU    00016h          ; var EEprom byte
                        .SYM      InitWave, 00016h, 0400Dh, 3
DDS.InitBurst           .EQU    00017h          ; var EEprom byte
                        .SYM      InitBurst, 00017h, 0400Dh, 3
DDS.InitOffset          .EQU    000000018h      ; var EEprom Float
                        .SYM      InitOffset, 00018h, 04006h, 3
DDS.InitPwrGain         .EQU    00000001Ch      ; var EEprom Float
                        .SYM      InitPwrGain, 0001Ch, 04006h, 3
DDS.InitAttnFac         .EQU    000000020h      ; var EEprom Float
                        .SYM      InitAttnFac, 00020h, 04006h, 3
DDS.InitIncRast         .EQU    00024h          ; var EEprom integer
                        .SYM      InitIncRast, 00024h, 04004h, 3
DDS.InitTerzNum         .EQU    00026h          ; var EEprom byte
                        .SYM      InitTerzNum, 00026h, 0400Dh, 3
DDS.LevelScaleLow       .EQU    000000027h      ; var EEprom Float
                        .SYM      LevelScaleLow, 00027h, 04006h, 3
DDS.LevelScaleHi        .EQU    00000002Bh      ; var EEprom Float
                        .SYM      LevelScaleHi, 0002Bh, 04006h, 3
DDS.ADCscales           .EQU    0002Fh          ; var EEprom array
                        .SYM      ADCscales, 0002Fh, 04036h, 3
DDS.EESerBaudReg        .EQU    0003Fh          ; var EEprom byte
                        .SYM      EESerBaudReg, 0003Fh, 0400Dh, 3
DDS.TerzArray           .EQU    00040h          ; var EEprom array
                        .SYM      TerzArray, 00040h, 04035h, 3
                        .SYM      i, 00007h, 0000Dh, 3
DDS.i                   .EQU    007h            ; var Data   byte
                        .SYM      k, 00008h, 0000Dh, 3
DDS.k                   .EQU    008h            ; var Data   byte
                        .SYM      m, 00009h, 0000Dh, 3
DDS.m                   .EQU    009h            ; var Data   byte
                        .SYM      dss_cmd, 00277h, 0000Eh, 3
DDS.dss_cmd             .EQU    277h            ; var iData  word
                        .SYM      wave_cmd, 00279h, 0000Eh, 3
DDS.wave_cmd            .EQU    279h            ; var iData  word
                        .SYM      SlaveCh, 0027Bh, 0000Dh, 3
DDS.SlaveCh             .EQU    27Bh            ; var iData  byte
                        .SYM      SwitchState, 0027Ch, 0000Dh, 3
DDS.SwitchState         .EQU    27Ch            ; var iData  byte
                        .SYM      ButtonTemp, 0027Dh, 0000Dh, 3
DDS.ButtonTemp          .EQU    27Dh            ; var iData  byte
                        .SYM      RangeTemp, 0027Eh, 0000Dh, 3
DDS.RangeTemp           .EQU    27Eh            ; var iData  byte
                        .SYM      DACtemp, 0027Fh, 00004h, 3
DDS.DACtemp             .EQU    27Fh            ; var iData  integer
                        .SYM      LevelByteHi, 00281h, 0000Dh, 3
DDS.LevelByteHi         .EQU    281h            ; var iData  byte
                        .SYM      LevelByteLo, 00282h, 0000Dh, 3
DDS.LevelByteLo         .EQU    282h            ; var iData  byte
                        .SYM      DDSfrequ, 00283h, 00005h, 3
DDS.DDSfrequ            .EQU    283h            ; var iData  longint
                        .SYM      OffsetRange, 00287h, 00003h, 3
DDS.OffsetRange         .EQU    287h            ; var iData  boolean
                        .SYM      LevelRange, 00288h, 00003h, 3
DDS.LevelRange          .EQU    288h            ; var iData  boolean
                        .SYM      BurstCount, 00289h, 0000Dh, 3
DDS.BurstCount          .EQU    289h            ; var iData  byte
                        .SYM      BurstPrime, 0028Ah, 00003h, 3
DDS.BurstPrime          .EQU    28Ah            ; var iData  boolean
                        .SYM      MP3isOn, 0028Bh, 00003h, 3
DDS.MP3isOn             .EQU    28Bh            ; var iData  boolean
                        .SYM      MP3currenttrack, 0028Ch, 0000Dh, 3
DDS.MP3currenttrack     .EQU    28Ch            ; var iData  byte
                        .SYM      MP3SecondChanged, 0028Dh, 00003h, 3
DDS.MP3SecondChanged    .EQU    28Dh            ; var iData  boolean
                        .SYM      MP3Track, 0028Eh, 0000Dh, 3
DDS.MP3Track            .EQU    28Eh            ; var iData  byte
                        .SYM      MP3dBKorr, 0028Fh, 0000Dh, 3
DDS.MP3dBKorr           .EQU    28Fh            ; var iData  byte
DDS.BurstTimer          .EQU    290h            ; var iData  byte
                        .SYM      BurstTimer, 00290h, 0000Dh, 3
DDS.ActivityTimer       .EQU    291h            ; var iData  byte
                        .SYM      ActivityTimer, 00291h, 0000Dh, 3
DDS.DisplayTimer        .EQU    292h            ; var iData  byte
                        .SYM      DisplayTimer, 00292h, 0000Dh, 3
DDS.IncrTimer           .EQU    293h            ; var iData  byte
                        .SYM      IncrTimer, 00293h, 0000Dh, 3
                        .SYM      Frequenz, 00294h, 00005h, 3
DDS.Frequenz            .EQU    294h            ; var iData  longint
                        .SYM      TerzNum, 00298h, 0000Dh, 3
DDS.TerzNum             .EQU    298h            ; var iData  byte
                        .SYM      Offset, 00299h, 00004h, 3
DDS.Offset              .EQU    299h            ; var iData  integer
                        .SYM      DACLevel, 0029Bh, 00006h, 3
DDS.DACLevel            .EQU    29Bh            ; var iData  Float
                        .SYM      DACLevelMax, 0029Fh, 00006h, 3
DDS.DACLevelMax         .EQU    29Fh            ; var iData  Float
                        .SYM      dB, 002A3h, 00006h, 3
DDS.dB                  .EQU    2A3h            ; var iData  Float
                        .SYM      dBMax, 002A7h, 00006h, 3
DDS.dBMax               .EQU    2A7h            ; var iData  Float
                        .SYM      AttnFac, 002ABh, 00006h, 3
DDS.AttnFac             .EQU    2ABh            ; var iData  Float
                        .SYM      AttnSwitchPoint, 002AFh, 00006h, 3
DDS.AttnSwitchPoint     .EQU    2AFh            ; var iData  Float
                        .SYM      PwrGain, 002B3h, 00006h, 3
DDS.PwrGain             .EQU    2B3h            ; var iData  Float
                        .SYM      BurstMode, 002B7h, 0000Dh, 3
DDS.BurstMode           .EQU    2B7h            ; var iData  byte
                        .SYM      Wave, 002B8h, 0000Dh, 3
DDS.Wave                .EQU    2B8h            ; var iData  byte
                        .SYM      Range, 002B9h, 0000Dh, 3
DDS.Range               .EQU    2B9h            ; var iData  byte
                        .SYM      OldRange, 002BAh, 0000Dh, 3
DDS.OldRange            .EQU    2BAh            ; var iData  byte
DDS.RangeStr            .EQU    2BBh            ; var iData  string
                        .SYM      RangeStr, 002BBh, 0303Ch, 3
DDS.freqStr             .EQU    2C4h            ; var iData  string
                        .SYM      freqStr, 002C4h, 0303Ch, 3
                        .SYM      CmdWhich, 002CDh, 0000Ah, 3
DDS.CmdWhich            .EQU    2CDh            ; var iData  enum
DDS.CmdStr              .EQU    2CEh            ; var iData  string
                        .SYM      CmdStr, 002CEh, 0303Ch, 3
                        .SYM      SubCh, 002D2h, 0000Dh, 3
DDS.SubCh               .EQU    2D2h            ; var iData  byte
                        .SYM      CurrentCh, 002D3h, 0000Dh, 3
DDS.CurrentCh           .EQU    2D3h            ; var iData  byte
                        .SYM      OmniFlag, 002D4h, 00003h, 3
DDS.OmniFlag            .EQU    2D4h            ; var iData  boolean
                        .SYM      verbose, 002D5h, 00003h, 3
DDS.verbose             .EQU    2D5h            ; var iData  boolean
                        .SYM      InpGainFac, 002D6h, 00006h, 3
DDS.InpGainFac          .EQU    2D6h            ; var iData  Float
                        .SYM      Param, 002DAh, 00006h, 3
DDS.Param               .EQU    2DAh            ; var iData  Float
                        .SYM      ParamInt, 002DEh, 00004h, 3
DDS.ParamInt            .EQU    2DEh            ; var iData  integer
                        .SYM      ParamLong, 002E0h, 00005h, 3
DDS.ParamLong           .EQU    2E0h            ; var iData  longint
                        .SYM      ParamByte, 002E4h, 0000Dh, 3
DDS.ParamByte           .EQU    2E4h            ; var iData  byte
DDS.SerInpStr           .EQU    2E5h            ; var iData  string
                        .SYM      SerInpStr, 002E5h, 0303Ch, 3
                        .SYM      SerInpPtr, 00325h, 0000Dh, 3
DDS.SerInpPtr           .EQU    325h            ; var iData  byte
                        .SYM      LCDpresent, 00326h, 00003h, 3
DDS.LCDpresent          .EQU    326h            ; var iData  boolean
                        .SYM      Modify, 00327h, 0000Ah, 3
DDS.Modify              .EQU    327h            ; var iData  enum
                        .SYM      IncrValue, 00328h, 00005h, 3
DDS.IncrValue           .EQU    328h            ; var iData  longint
                        .SYM      OldIncrValue, 0032Ch, 00005h, 3
DDS.OldIncrValue        .EQU    32Ch            ; var iData  longint
                        .SYM      IncrFine, 00330h, 00003h, 3
DDS.IncrFine            .EQU    330h            ; var iData  boolean
                        .SYM      FirstTurn, 00331h, 00003h, 3
DDS.FirstTurn           .EQU    331h            ; var iData  boolean
                        .SYM      IncrAccFloat, 00332h, 00006h, 3
DDS.IncrAccFloat        .EQU    332h            ; var iData  Float
                        .SYM      IncrDiff, 00336h, 00004h, 3
DDS.IncrDiff            .EQU    336h            ; var iData  integer
                        .SYM      IncrAccInt10, 00338h, 00004h, 3
DDS.IncrAccInt10        .EQU    338h            ; var iData  integer
                        .SYM      IncRast, 0033Ah, 00004h, 3
DDS.IncRast             .EQU    33Ah            ; var iData  integer
                        .SYM      IncrDiffByte, 0033Ch, 0000Dh, 3
DDS.IncrDiffByte        .EQU    33Ch            ; var iData  byte
                        .SYM      digits, 0033Dh, 0000Dh, 3
DDS.digits              .EQU    33Dh            ; var iData  byte
                        .SYM      nachkomma, 0033Eh, 0000Dh, 3
DDS.nachkomma           .EQU    33Eh            ; var iData  byte
                        .SYM      ChangedFlag, 0033Fh, 00003h, 3
DDS.ChangedFlag         .EQU    33Fh            ; var iData  boolean
DDS.ParamStr            .EQU    340h            ; var iData  string
                        .SYM      ParamStr, 00340h, 0303Ch, 3
                        .SYM      isInteger, 00369h, 00003h, 3
DDS.isInteger           .EQU    369h            ; var iData  boolean
                        .SYM      Request, 0036Ah, 00003h, 3
DDS.Request             .EQU    36Ah            ; var iData  boolean
                        .SYM      Status, 0036Bh, 0000Dh, 3
DDS.Status              .EQU    36Bh            ; var iData  byte
                        .SYM      ErrCount, 0036Ch, 00004h, 3
DDS.ErrCount            .EQU    36Ch            ; var iData  integer
                        .SYM      ErrFlag, 0036Eh, 00003h, 3
DDS.ErrFlag             .EQU    36Eh            ; var iData  boolean

                        .FILE     DDS-HW.pas
                        .FUNC     SerAux, 00003h, 00020h
DDS.SerAux:
                        .BLOCK    5
                        .LINE     6
                        LDD       _ACCA, Y+000h
                        MOV       _ACCDHI, _ACCA
                        .ASM
                        .LINE     8
                        ldi  _ACCDLO, 8
                        .LINE     9
                        cbi  DDS.ExtensionPort, DDS.b_SerAux ; Startbit
                        .LINE     10
                        ldi       _ACCA, 5
                        .LINE     11
                        call      SYSTEM.UDELAY
                        DDS.SerAuxloop1:    ; Byte rausschieben
                        .LINE     13
                        lsr  _ACCDHI          ; Bit 0 zuerst
                        .LINE     14
                        brcs DDS.SerAuxdatahigh
                        .LINE     15
                        cbi  DDS.ExtensionPort, DDS.b_SerAux
                        .LINE     16
                        rjmp DDS.SerAuxdataset
                        DDS.SerAuxdatahigh:
                        .LINE     18
                        sbi  DDS.ExtensionPort, DDS.b_SerAux
                        DDS.SerAuxdataset:
                        .LINE     20
                        ldi       _ACCA, 5
                        .LINE     21
                        call      SYSTEM.UDELAY
                        .LINE     22
                        dec _ACCDLO
                        .LINE     23
                        brne DDS.SerAuxloop1
                        .LINE     24
                        sbi  DDS.ExtensionPort, DDS.b_SerAux
                        .LINE     25
                        ldi       _ACCA, 10
                        .LINE     26
                        call      SYSTEM.UDELAY
                        .endasm
                        .ENDBLOCK 28
DDS.SerAux_X:
                        .LINE     28
                        .BRANCH   19
                        RET
                        .ENDFUNC  28

                        .FUNC     ShiftOut1257, 0001Eh, 00020h
DDS.ShiftOut1257:
                        .BLOCK    32
                        .LINE     33
                        LDD       _ACCB, Y+000h
                        LDD       _ACCA, Y+001h
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        CPI       _ACCA, 087h
                        BRNE      DDS._L0000
                        CPI       _ACCB, 0FFh
DDS._L0000:
                        LDI       _ACCA, 0h
                        BREQ      DDS._L0001
                        BRLO      DDS._L0001
                        SER       _ACCA
DDS._L0001:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0004
                        BRNE      DDS._L0004
                        .BRANCH   20,DDS._L0002
                        JMP       DDS._L0002
DDS._L0004:
                        .BLOCK    33
                        .LINE     34
                        LDI       _ACCA, 007FFh SHRB 8
                        LDI       _ACCB, 007FFh AND 0FFh
                        STD       Y+001h, _ACCA
                        STD       Y+000h, _ACCB
                        .ENDBLOCK 35
DDS._L0002:
DDS._L0003:
                        .LINE     36
                        LDD       _ACCB, Y+000h
                        LDD       _ACCA, Y+001h
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        CPI       _ACCA, 078h
                        BRNE      DDS._L0005
                        CPI       _ACCB, 001h
DDS._L0005:
                        LDI       _ACCA, 0FFh
                        BRLO      DDS._L0006
                        CLR       _ACCA
DDS._L0006:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0009
                        BRNE      DDS._L0009
                        .BRANCH   20,DDS._L0007
                        JMP       DDS._L0007
DDS._L0009:
                        .BLOCK    36
                        .LINE     37
                        LDI       _ACCA, 0F801h SHRB 8
                        LDI       _ACCB, 0F801h AND 0FFh
                        STD       Y+001h, _ACCA
                        STD       Y+000h, _ACCB
                        .ENDBLOCK 38
DDS._L0007:
DDS._L0008:
                        .LINE     40
                        LDD       _ACCB, Y+000h
                        LDD       _ACCA, Y+001h
                        SUBI      _ACCB, -00800h AND 0FFh
                        SBCI      _ACCA, -00800h SHRB 8
                        STS       DDS.DACTEMP, _ACCB
                        STS       DDS.DACTEMP+1, _ACCA
                        .ASM
                        .LINE     42
                        cbi  DDS.ControlBitPort, DDS.b_SDATAOUT
                        .LINE     43
                        cbi  DDS.ControlBitPort, DDS.b_SCLK
                        .LINE     44
                        sbi  DDS.ControlBitPort, DDS.b_STRDAC
                        .LINE     46
                        LDS _ACCA, DDS.DACtemp+1 ; MSB linksbündig
                        .LINE     47
                        LSL  _ACCA
                        .LINE     48
                        LSL  _ACCA
                        .LINE     49
                        LSL  _ACCA
                        .LINE     50
                        LSL  _ACCA ; Bit 3 sitzt jetzt oben
                        .LINE     51
                        ldi  _ACCB, 4
                        DDS.1257loop1:
                        .LINE     54
                        sbrc _ACCA,7 // Bit high?
                        .LINE     55
                        sbi  DDS.ControlBitPort, DDS.b_SDATAOUT
                        .LINE     56
                        sbi  DDS.ControlBitPort, DDS.b_SCLK
                        .LINE     57
                        LSL  _ACCA
                        .LINE     58
                        nop
                        .LINE     59
                        cbi  DDS.ControlBitPort, DDS.b_SDATAOUT
                        .LINE     60
                        cbi  DDS.ControlBitPort, DDS.b_SCLK
                        .LINE     61
                        dec _ACCB
                        .LINE     62
                        BRNE  DDS.1257loop1
                        .LINE     64
                        LDS _ACCA, DDS.DACtemp         ; LSB Level zuletzt
                        .LINE     65
                        ldi  _ACCB, 7 ; 7 Bits ohne Load
                        DDS.1257loop2:
                        .LINE     68
                        sbrc _ACCA,7 // Bit high?
                        .LINE     69
                        sbi  DDS.ControlBitPort, DDS.b_SDATAOUT
                        .LINE     70
                        sbi  DDS.ControlBitPort, DDS.b_SCLK
                        .LINE     71
                        LSL  _ACCA
                        .LINE     72
                        nop
                        .LINE     73
                        cbi  DDS.ControlBitPort, DDS.b_SDATAOUT
                        .LINE     74
                        cbi  DDS.ControlBitPort, DDS.b_SCLK
                        .LINE     75
                        dec _ACCB
                        .LINE     76
                        BRNE  DDS.1257loop2
                        .LINE     78
                        LSL  _ACCA ; LSB mit Load-impuls
                        .LINE     79
                        sbrc _ACCA,7 // Bit high?
                        .LINE     80
                        sbi  DDS.ControlBitPort, DDS.b_SDATAOUT
                        .LINE     81
                        sbi  DDS.ControlBitPort, DDS.b_SCLK
                        .LINE     82
                        cbi  DDS.ControlBitPort, DDS.b_STRDAC
                        .LINE     83
                        nop
                        .LINE     84
                        cbi  DDS.ControlBitPort, DDS.b_SDATAOUT
                        .LINE     85
                        cbi  DDS.ControlBitPort, DDS.b_SCLK
                        .LINE     86
                        sbi  DDS.ControlBitPort, DDS.b_STRDAC
                        .endasm
                        .ENDBLOCK 88
DDS.ShiftOut1257_X:
                        .LINE     88
                        .BRANCH   19
                        RET
                        .ENDFUNC  88

                        .FUNC     ShiftOutLevelSR, 0005Ah, 00020h
DDS.ShiftOutLevelSR:
                        .BLOCK    93
                        .LINE     94
                        LDD       _ACCB, Y+000h
                        LDD       _ACCA, Y+001h
                        STS       DDS.LEVELBYTEHI, _ACCA
                        .LINE     95
                        LDD       _ACCB, Y+000h
                        LDD       _ACCA, Y+001h
                        MOV       _ACCA, _ACCB
                        STS       DDS.LEVELBYTELO, _ACCA
                        .LINE     97
                        LDS       _ACCA, DDS.LevelByteHi
                        PUSH      _ACCA
                        LDS       _ACCA, DDS.SwitchState
                        POP       _ACCB
                        OR        _ACCA, _ACCB
                        STS       DDS.LEVELBYTEHI, _ACCA
                        .ASM
                        .LINE     100
                        cbi  DDS.DDSOutPort, DDS.b_SCLK
                        .LINE     101
                        cbi  DDS.DDSOutPort, DDS.b_SDATAOUT
                        .LINE     102
                        LDS _ACCA, DDS.SwitchState;
                        .LINE     103
                        ldi  _ACCB, 8
                        DDS.srloop1:
                        .LINE     106
                        sbrc _ACCA,7 // Bit high?
                        .LINE     107
                        sbi  DDS.DDSOutPort, DDS.b_SDATAOUT
                        .LINE     108
                        sbi  DDS.DDSOutPort, DDS.b_SCLK
                        .LINE     109
                        LSL  _ACCA
                        .LINE     110
                        cbi  DDS.DDSOutPort, DDS.b_SDATAOUT
                        .LINE     111
                        cbi  DDS.DDSOutPort, DDS.b_SCLK
                        .LINE     112
                        dec _ACCB
                        .LINE     113
                        BRNE  DDS.srloop1
                        .LINE     115
                        LDS _ACCA, DDS.LevelByteHi;
                        .LINE     116
                        ldi  _ACCB, 8
                        DDS.srloop2:
                        .LINE     119
                        sbrc _ACCA,7 // Bit high?
                        .LINE     120
                        sbi  DDS.DDSOutPort, DDS.b_SDATAOUT
                        .LINE     121
                        sbi  DDS.DDSOutPort, DDS.b_SCLK
                        .LINE     122
                        LSL  _ACCA
                        .LINE     123
                        cbi  DDS.DDSOutPort, DDS.b_SDATAOUT
                        .LINE     124
                        cbi  DDS.DDSOutPort, DDS.b_SCLK
                        .LINE     125
                        dec _ACCB
                        .LINE     126
                        BRNE  DDS.srloop2
                        .LINE     128
                        LDS _ACCA, DDS.LevelByteLo         ; LSB Level zuletzt
                        .LINE     129
                        ldi  _ACCB, 8
                        DDS.srloop3:
                        .LINE     132
                        sbrc _ACCA,7 // Bit high?
                        .LINE     133
                        sbi  DDS.DDSOutPort, DDS.b_SDATAOUT
                        .LINE     134
                        sbi  DDS.DDSOutPort, DDS.b_SCLK
                        .LINE     135
                        LSL  _ACCA
                        .LINE     136
                        cbi  DDS.DDSOutPort, DDS.b_SDATAOUT
                        .LINE     137
                        cbi  DDS.DDSOutPort, DDS.b_SCLK
                        .LINE     138
                        dec _ACCB
                        .LINE     139
                        BRNE  DDS.srloop3
                        .LINE     141
                        sbi  DDS.DDSOutPort, DDS.b_STROBE
                        .LINE     142
                        nop
                        .LINE     143
                        nop
                        .LINE     144
                        cbi  DDS.DDSOutPort, DDS.b_STROBE
                        .LINE     145
                        sbi  DDS.DDSOutPort, DDS.b_SCLK
                        .endasm
                        .ENDBLOCK 147
DDS.ShiftOutLevelSR_X:
                        .LINE     147
                        .BRANCH   19
                        RET
                        .ENDFUNC  147

                        .FUNC     SendDDS, 00096h, 00020h
DDS.SendDDS:
                        .BLOCK    152
                        .ASM
                        .LINE     154
                        sbi  DDS.DDSOutPort, DDS.b_SCLK
                        .LINE     155
                        cbi  DDS.ControlBitPort, DDS.b_SDATAOUT
                        .LINE     156
                        lds  _ACCA, DDS.dss_cmd+1
                        .LINE     157
                        cbi  DDS.DDSOutPort, DDS.b_FSYNC
                        .LINE     159
                        ldi  _ACCB, 8
                        DDS.ddsloop1:    ; höherwertiges Byte rausschieben
                        .LINE     162
                        sbrc _ACCA,7 // Bit high?
                        .LINE     163
                        sbi  DDS.ControlBitPort, DDS.b_SDATAOUT
                        .LINE     164
                        cbi  DDS.ControlBitPort, DDS.b_SCLK
                        .LINE     165
                        lsl  _ACCA
                        .LINE     166
                        cbi  DDS.ControlBitPort, DDS.b_SDATAOUT
                        .LINE     167
                        sbi  DDS.ControlBitPort, DDS.b_SCLK
                        .LINE     168
                        dec _ACCB
                        .LINE     169
                        brne  DDS.ddsloop1
                        .LINE     171
                        lds  _ACCA, DDS.dss_cmd
                        .LINE     172
                        ldi  _ACCB, 8
                        DDS.dssloop2:    ; niederwertiges Byte rausschieben
                        .LINE     175
                        sbrc _ACCA,7 // Bit high?
                        .LINE     176
                        sbi  DDS.ControlBitPort, DDS.b_SDATAOUT
                        .LINE     177
                        cbi  DDS.ControlBitPort, DDS.b_SCLK
                        .LINE     178
                        lsl  _ACCA
                        .LINE     179
                        cbi  DDS.ControlBitPort, DDS.b_SDATAOUT
                        .LINE     180
                        sbi  DDS.ControlBitPort, DDS.b_SCLK
                        .LINE     181
                        dec _ACCB
                        .LINE     182
                        brne  DDS.dssloop2
                        .LINE     184
                        sbi  DDS.DDSOutPort, DDS.b_FSYNC
                        .endasm
                        .ENDBLOCK 186
DDS.SendDDS_X:
                        .LINE     186
                        .BRANCH   19
                        RET
                        .ENDFUNC  186

                        .FUNC     SetLevelDDS, 000FFh, 00020h
DDS.SetLevelDDS:
                        SBIW      _FRAMEPTR, 14
                        .BLOCK    264
                        .LINE     265
                        LDI       _ACCA, 000h
                        STS       DDS.SWITCHSTATE, _ACCA
                        .LINE     266
                        LDI       _ACCA, 000h
                        STS       DDS.LEVELBYTEHI, _ACCA
                        .LINE     267
                        LDI       _ACCA, 000h
                        STS       DDS.LEVELBYTELO, _ACCA
                        .LINE     268
                        LDS       _ACCB, DDS.Offset
                        LDS       _ACCA, DDS.Offset+1
                        STD       Y+001h, _ACCA
                        STD       Y+000h, _ACCB
                        .LINE     271
                        LDD       _ACCB, Y+000h
                        LDD       _ACCA, Y+001h
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        CPI       _ACCA, 080h
                        BRNE      DDS._L0010
                        CPI       _ACCB, 000h
DDS._L0010:
                        LDI       _ACCA, 0h
                        BRNE      DDS._L0011
                        SER       _ACCA
DDS._L0011:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0014
                        BRNE      DDS._L0014
                        .BRANCH   20,DDS._L0012
                        JMP       DDS._L0012
DDS._L0014:
                        .BLOCK    272
                        .LINE     272
                        LDS       _ACCA, 0027Ch
                        SBR       _ACCA, 080h
                        STS       0027Ch, _ACCA
                        .LINE     273
                        SBI       00032h, 003h
                        .ENDBLOCK 274
                        .BRANCH   20,DDS._L0013
                        JMP       DDS._L0013
DDS._L0012:
                        .BLOCK    274
                        .LINE     275
                        CBI       00032h, 003h
                        .ENDBLOCK 276
DDS._L0013:
                        .LINE     279
                        LDS       _ACCB, DDS.DACLevel
                        LDS       _ACCA, DDS.DACLevel+1
                        LDS       _ACCALO, DDS.DACLevel+2
                        LDS       _ACCAHI, DDS.DACLevel+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DDS.AttnSwitchPoint
                        LDS       _ACCA, DDS.AttnSwitchPoint+1
                        LDS       _ACCALO, DDS.AttnSwitchPoint+2
                        LDS       _ACCAHI, DDS.AttnSwitchPoint+3
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      DDS._L0016
                        BRPL      DDS._L0017
                        BRMI      DDS._L0015
DDS._L0017:
                        CLZ
                        CLC
                        RJMP      DDS._L0016
DDS._L0015:
                        CLZ
                        SEC
DDS._L0016:
                        LDI       _ACCA, 0FFh
                        BRLO      DDS._L0018
                        CLR       _ACCA
DDS._L0018:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0021
                        BRNE      DDS._L0021
                        .BRANCH   20,DDS._L0019
                        JMP       DDS._L0019
DDS._L0021:
                        .BLOCK    280
                        .LINE     280
                        LDS       _ACCB, DDS.DACLevel
                        LDS       _ACCA, DDS.DACLevel+1
                        LDS       _ACCALO, DDS.DACLevel+2
                        LDS       _ACCAHI, DDS.DACLevel+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DDS.AttnFac
                        LDS       _ACCA, DDS.AttnFac+1
                        LDS       _ACCALO, DDS.AttnFac+2
                        LDS       _ACCAHI, DDS.AttnFac+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, DDS.LevelScaleLow AND 0FFh
                        LDI       _ACCCHI, DDS.LevelScaleLow SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.RoundFloat
                        STD       Y+005h, _ACCA
                        STD       Y+004h, _ACCB
                        .LINE     281
                        LDS       _ACCA, 0027Ch
                        SBR       _ACCA, 020h
                        STS       0027Ch, _ACCA
                        .LINE     282
                        LDS       _ACCA, DDS.LevelRange
                        TST       _ACCA
                        .BRANCH   4,DDS._L0024
                        BRNE      DDS._L0024
                        .BRANCH   20,DDS._L0022
                        JMP       DDS._L0022
DDS._L0024:
                        .BLOCK    282
                        .LINE     283
                        LDI       _ACCA, 02100h SHRB 8
                        LDI       _ACCB, 02100h AND 0FFh
                        STS       DDS.DSS_CMD, _ACCB
                        STS       DDS.DSS_CMD+1, _ACCA
                        .LINE     284
                        CLI
                        LDI       _ACCA, 0FEH ROLB IntFlag
                        AND       Flags, _ACCA
                        .LINE     285
                        .BRANCH   17,DDS.SENDDDS
                        CALL      DDS.SENDDDS
                        .LINE     286
                        LDI       _ACCA, 1 SHLB IntFlag
                        OR        Flags, _ACCA
                        SEI
                        .LINE     287
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 00000h SHRB 8
                        LDI       _ACCB, 00000h AND 0FFh
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,DDS.SHIFTOUTLEVELSR
                        CALL      DDS.SHIFTOUTLEVELSR
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     288
                        LDI       _ACCA, 00005h SHRB 8
                        LDI       _ACCB, 00005h AND 0FFh
                        .FRAME  0
                        CALL      SYSTEM.MDELAY
                        .LINE     289
                        LDI       _ACCA, 000h
                        STS       DDS.LEVELRANGE, _ACCA
                        .ENDBLOCK 290
DDS._L0022:
DDS._L0023:
                        .ENDBLOCK 291
                        .BRANCH   20,DDS._L0020
                        JMP       DDS._L0020
DDS._L0019:
                        .BLOCK    291
                        .LINE     292
                        LDS       _ACCA, 0027Ch
                        CBR       _ACCA, 020h
                        STS       0027Ch, _ACCA
                        .LINE     293
                        LDS       _ACCB, DDS.DACLevel
                        LDS       _ACCA, DDS.DACLevel+1
                        LDS       _ACCALO, DDS.DACLevel+2
                        LDS       _ACCAHI, DDS.DACLevel+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, DDS.LevelScaleHi AND 0FFh
                        LDI       _ACCCHI, DDS.LevelScaleHi SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.RoundFloat
                        STD       Y+005h, _ACCA
                        STD       Y+004h, _ACCB
                        .LINE     294
                        LDI       _ACCA, 0FFh
                        STS       DDS.LEVELRANGE, _ACCA
                        .ENDBLOCK 295
DDS._L0020:
                        .LINE     298
                        LDS       _ACCA, DDS.Wave
                        .LINE     299
                        CPI       _ACCA, 1
                        .BRANCH   3,DDS._L0028
                        BREQ      DDS._L0028
                        .BRANCH   20,DDS._L0027
                        JMP       DDS._L0027
DDS._L0028:
DDS._L0026:
                        .BLOCK    300
                        .LINE     300
                        LDI       _ACCA, 02000h SHRB 8
                        LDI       _ACCB, 02000h AND 0FFh
                        STS       DDS.WAVE_CMD, _ACCB
                        STS       DDS.WAVE_CMD+1, _ACCA
                        .ENDBLOCK 301
                        .BRANCH   20,DDS._L0025
                        JMP       DDS._L0025
DDS._L0027:
                        .LINE     302
                        CPI       _ACCA, 2
                        .BRANCH   3,DDS._L0031
                        BREQ      DDS._L0031
                        .BRANCH   20,DDS._L0030
                        JMP       DDS._L0030
DDS._L0031:
DDS._L0029:
                        .BLOCK    303
                        .LINE     303
                        LDI       _ACCA, 02002h SHRB 8
                        LDI       _ACCB, 02002h AND 0FFh
                        STS       DDS.WAVE_CMD, _ACCB
                        STS       DDS.WAVE_CMD+1, _ACCA
                        .ENDBLOCK 304
                        .BRANCH   20,DDS._L0025
                        JMP       DDS._L0025
DDS._L0030:
                        .LINE     305
                        CPI       _ACCA, 3
                        .BRANCH   3,DDS._L0034
                        BREQ      DDS._L0034
                        .BRANCH   20,DDS._L0033
                        JMP       DDS._L0033
DDS._L0034:
                        .BRANCH   20,DDS._L0032
                        JMP       DDS._L0032
DDS._L0033:
                        CPI       _ACCA, 4
                        .BRANCH   3,DDS._L0036
                        BREQ      DDS._L0036
                        .BRANCH   20,DDS._L0035
                        JMP       DDS._L0035
DDS._L0036:
DDS._L0032:
                        .BLOCK    306
                        .LINE     306
                        LDI       _ACCA, 02028h SHRB 8
                        LDI       _ACCB, 02028h AND 0FFh
                        STS       DDS.WAVE_CMD, _ACCB
                        STS       DDS.WAVE_CMD+1, _ACCA
                        .LINE     307
                        LDS       _ACCA, 0027Ch
                        SBR       _ACCA, 010h
                        STS       0027Ch, _ACCA
                        .LINE     308
                        LDS       _ACCA, DDS.wave
                        CPI       _ACCA, 004h
                        LDI       _ACCA, 0h
                        BRNE      DDS._L0037
                        SER       _ACCA
DDS._L0037:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0040
                        BRNE      DDS._L0040
                        .BRANCH   20,DDS._L0038
                        JMP       DDS._L0038
DDS._L0040:
                        .BLOCK    308
                        .LINE     310
                        LDS       _ACCB, DDS.DACLevel
                        LDS       _ACCA, DDS.DACLevel+1
                        LDS       _ACCALO, DDS.DACLevel+2
                        LDS       _ACCAHI, DDS.DACLevel+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DDS.PwrGain
                        LDS       _ACCA, DDS.PwrGain+1
                        LDS       _ACCALO, DDS.PwrGain+2
                        LDS       _ACCAHI, DDS.PwrGain+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        POP       _ACCEHI
                        POP       _ACCELO
                        POP       _ACCDHI
                        POP       _ACCDLO
                        LDI       _ACCBLO, 0D5h
                        LDI       _ACCBHI, 004h
                        LDI       _ACCCLO, 0B5h
                        LDI       _ACCCHI, 03Fh
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat_R
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.RoundFloat
                        STD       Y+001h, _ACCA
                        STD       Y+000h, _ACCB
                        .LINE     311
                        LDS       _ACCA, 0027Ch
                        CBR       _ACCA, 080h
                        STS       0027Ch, _ACCA
                        .ENDBLOCK 315
DDS._L0038:
DDS._L0039:
                        .ENDBLOCK 316
                        .BRANCH   20,DDS._L0025
                        JMP       DDS._L0025
DDS._L0035:
                        .LINE     317
                        CPI       _ACCA, 5
                        .BRANCH   2,DDS._L0043
                        BRCC      DDS._L0043
                        .BRANCH   20,DDS._L0042
                        JMP       DDS._L0042
DDS._L0043:
                        CPI       _ACCA, 255
                        .BRANCH   3,DDS._L0044
                        BREQ      DDS._L0044
                        .BRANCH   1,DDS._L0042
                        BRCS      DDS._L0044
                        .BRANCH   20,DDS._L0042
                        JMP       DDS._L0042
DDS._L0044:
DDS._L0041:
                        .BLOCK    318
                        .LINE     318
                        LDI       _ACCA, 02100h SHRB 8
                        LDI       _ACCB, 02100h AND 0FFh
                        STS       DDS.WAVE_CMD, _ACCB
                        STS       DDS.WAVE_CMD+1, _ACCA
                        .LINE     319
                        LDS       _ACCA, 0027Ch
                        SBR       _ACCA, 040h
                        STS       0027Ch, _ACCA
                        .ENDBLOCK 320
                        .BRANCH   20,DDS._L0025
                        JMP       DDS._L0025
DDS._L0042:
                        .BLOCK    321
                        .LINE     322
                        LDI       _ACCA, 02100h SHRB 8
                        LDI       _ACCB, 02100h AND 0FFh
                        STS       DDS.WAVE_CMD, _ACCB
                        STS       DDS.WAVE_CMD+1, _ACCA
                        .ENDBLOCK 323
DDS._L0025:
                        .LINE     325
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDD       _ACCB, Y+000h
                        LDD       _ACCA, Y+001h
                        MOVW      _ACCBLO, _ACCB
                        LDI       _ACCALO, 00005h AND 0FFh
                        LDI       _ACCAHI, 00005h SHRB 8
                        SET
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.DIV16_R
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,DDS.SHIFTOUT1257
                        CALL      DDS.SHIFTOUT1257
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     327
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDD       _ACCB, Y+004h
                        LDD       _ACCA, Y+005h
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,DDS.SHIFTOUTLEVELSR
                        CALL      DDS.SHIFTOUTLEVELSR
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     330
                        LDI       _ACCB, 000000000h AND 0FFh
                        LDI       _ACCA, 000000000h SHRB 8
                        LDI       _ACCALO, 000000000h SHRB 16
                        LDI       _ACCAHI, 000000000h SHRB 24
                        STS       DDS.DDSFREQU, _ACCB
                        STS       DDS.DDSFREQU+1, _ACCA
                        STS       DDS.DDSFREQU+2, _ACCALO
                        STS       DDS.DDSFREQU+3, _ACCAHI
                        .LINE     331
                        LDI       _ACCCLO, DDS.FreqStr AND 0FFh
                        LDI       _ACCCHI, DDS.FreqStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        ADIW      _ACCCLO, 1
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        LDI       _ACCA, 008h
                        ST        -Y, _ACCA
                        LDI       _ACCA, 0FEH ROLB _DEVICE
                        AND       Flags, _ACCA
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        .FRAME  3
                        LDS       _ACCB, DDS.Frequenz
                        LDS       _ACCA, DDS.Frequenz+1
                        LDS       _ACCALO, DDS.Frequenz+2
                        LDS       _ACCAHI, DDS.Frequenz+3
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        ST        -Y, _ACCAHI
                        ST        -Y, _ACCALO
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  7
                        LDI       _ACCA, 008h
                        ST        -Y, _ACCA
                        .FRAME  8
                        LDI       _ACCA, 030h
                        LDI       _ACCB, 000h
                        ST        -Y, _ACCB
                        ST        -Y, _ACCA
                        .FRAME  10
                        SET
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.Long2Str
                        .FRAME  3
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        LDI       _ACCA, 008h
                        PUSH      _ACCA
                        LDD       _ACCA, Y+000h
                        POP       _ACCB
                        SUB       _ACCB, _ACCA
                        MOV       _ACCA, _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z, _ACCA
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .LINE     332
                        .LOOP
                        LDI       _ACCCLO, DDS.i AND 0FFh
                        LDI       _ACCCHI, DDS.i SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 000h
                        ST        Z, _ACCA
                        LDI       _ACCA, 007h
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
DDS._L0047:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      DDS._L0048
                        CLR       _ACCA
DDS._L0048:
                        TST       _ACCA
                        .BRANCH   3,DDS._L0049
                        BREQ      DDS._L0049
                        .BRANCH   20,DDS._L0046
                        JMP       DDS._L0046
DDS._L0049:
                        .BLOCK    333
                        .LINE     333
                        LDI       _ACCCLO, DDS.FreqStr AND 0FFh
                        LDI       _ACCCHI, DDS.FreqStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        MOV       _ACCA, DDS.i
                        SUBI      _ACCA, -001h AND 0FFh
                        POP       _ACCCHI
                        POP       _ACCCLO
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCA, Z+
                        SUBI      _ACCA, 030h AND 0FFh
                        MOV       DDS.K, _ACCA
                        .LINE     334
                        MOV       _ACCA, DDS.i
                        LDI       _ACCCLO, DDS.fhz AND 0FFh
                        LDI       _ACCCHI, DDS.fhz SHRB 8
                        ANDI      _ACCA, 7
                        CLR       _ACCB
                        LSL       _ACCA
                        ROL       _ACCB
                        LSL       _ACCA
                        ROL       _ACCB
                        ADD       _ACCCLO, _ACCA
                        ADC       _ACCCHI, _ACCB
                        LPM       _ACCB, Z+
                        LPM       _ACCA, Z+
                        LPM       _ACCALO, Z+
                        LPM       _ACCAHI, Z
                        STD       Y+010h, _ACCAHI
                        STD       Y+00Fh, _ACCALO
                        STD       Y+00Eh, _ACCA
                        STD       Y+00Dh, _ACCB
                        .LINE     335
                        LDS       _ACCB, DDS.DDSfrequ
                        LDS       _ACCA, DDS.DDSfrequ+1
                        LDS       _ACCALO, DDS.DDSfrequ+2
                        LDS       _ACCAHI, DDS.DDSfrequ+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDD       _ACCAHI, Y+010h
                        LDD       _ACCALO, Y+00Fh
                        LDD       _ACCA, Y+00Eh
                        LDD       _ACCB, Y+00Dh
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        MOV       _ACCA, DDS.k
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        CLR       _ACCAHI
                        CLR       _ACCALO
                        SET
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.MUL32
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        ADD       _ACCB, _ACCBLO
                        ADC       _ACCA, _ACCBHI
                        ADC       _ACCALO, _ACCCLO
                        ADC       _ACCAHI, _ACCCHI
                        STS       DDS.DDSFREQU, _ACCB
                        STS       DDS.DDSFREQU+1, _ACCA
                        STS       DDS.DDSFREQU+2, _ACCALO
                        STS       DDS.DDSFREQU+3, _ACCAHI
                        .ENDBLOCK 336
DDS._L0045:
                        .LINE     336
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,DDS._L0046
                        BREQ      DDS._L0046
                        .BRANCH   20,DDS._L0047
                        JMP       DDS._L0047
DDS._L0046:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .LINE     337
                        CLI
                        LDI       _ACCA, 0FEH ROLB IntFlag
                        AND       Flags, _ACCA
                        .LINE     338
                        LDS       _ACCB, DDS.DDSfrequ
                        LDS       _ACCA, DDS.DDSfrequ+1
                        LDS       _ACCALO, DDS.DDSfrequ+2
                        LDS       _ACCAHI, DDS.DDSfrequ+3
                        ANDI      _ACCB, 0FFh
                        ANDI      _ACCA, 03Fh
                        STS       DDS.DSS_CMD, _ACCB
                        STS       DDS.DSS_CMD+1, _ACCA
                        .LINE     339
                        LDS       _ACCB, DDS.dss_cmd
                        LDS       _ACCA, DDS.dss_cmd+1
                        ORI       _ACCB, 000h
                        ORI       _ACCA, 040h
                        STS       DDS.DSS_CMD, _ACCB
                        STS       DDS.DSS_CMD+1, _ACCA
                        .LINE     340
                        .BRANCH   17,DDS.SENDDDS
                        CALL      DDS.SENDDDS
                        .LINE     341
                        LDS       _ACCB, DDS.DDSfrequ
                        LDS       _ACCA, DDS.DDSfrequ+1
                        LDS       _ACCALO, DDS.DDSfrequ+2
                        LDS       _ACCAHI, DDS.DDSfrequ+3
                        LDI       _ACCCLO, 002h
                        CALL      SYSTEM.SHL32
                        STS       DDS.DDSFREQU, _ACCB
                        STS       DDS.DDSFREQU+1, _ACCA
                        STS       DDS.DDSFREQU+2, _ACCALO
                        STS       DDS.DDSFREQU+3, _ACCAHI
                        .LINE     342
                        LDS       _ACCB, DDS.DDSfrequ
                        LDS       _ACCA, DDS.DDSfrequ+1
                        LDS       _ACCALO, DDS.DDSfrequ+2
                        LDS       _ACCAHI, DDS.DDSfrequ+3
                        MOVW      _ACCB, _ACCALO
                        ANDI      _ACCB, 0FFh
                        ANDI      _ACCA, 03Fh
                        STS       DDS.DSS_CMD, _ACCB
                        STS       DDS.DSS_CMD+1, _ACCA
                        .LINE     343
                        LDS       _ACCB, DDS.dss_cmd
                        LDS       _ACCA, DDS.dss_cmd+1
                        ORI       _ACCB, 000h
                        ORI       _ACCA, 040h
                        STS       DDS.DSS_CMD, _ACCB
                        STS       DDS.DSS_CMD+1, _ACCA
                        .LINE     344
                        .BRANCH   17,DDS.SENDDDS
                        CALL      DDS.SENDDDS
                        .LINE     345
                        LDS       _ACCB, DDS.wave_cmd
                        LDS       _ACCA, DDS.wave_cmd+1
                        STS       DDS.DSS_CMD, _ACCB
                        STS       DDS.DSS_CMD+1, _ACCA
                        .LINE     346
                        .BRANCH   17,DDS.SENDDDS
                        CALL      DDS.SENDDDS
                        .LINE     347
                        LDI       _ACCA, 1 SHLB IntFlag
                        OR        Flags, _ACCA
                        SEI
                        .ENDBLOCK 348
DDS.SetLevelDDS_X:
                        .LINE     348
                        .BRANCH   19
                        RET
                        .ENDFUNC  348


                        .FILE     H:\PROJAVR\ADA-C-DDS\DDS.pas
                        .FUNC     onsystick, 0019Fh, 00020h
DDS.onsystick:
                        .BLOCK    417
                        .ASM
                        ADC10endLoop1:
                        .LINE     420
                        in _ACCB, ADCSRA
                        .LINE     421
                        sbrc _ACCB,6 // auf Bit 6 low warten
                        .LINE     422
                        rjmp ADC10endLoop1
                        .endasm
                        .LINE     424
                        LDS       _ACCA, DDS.BurstMode
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      DDS._L0050
                        SER       _ACCA
DDS._L0050:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0053
                        BRNE      DDS._L0053
                        .BRANCH   20,DDS._L0051
                        JMP       DDS._L0051
DDS._L0053:
                        .BLOCK    424
                        .LINE     425
                        LDS       _ACCA, DDS.BurstCount
                        CPI       _ACCA, 001h
                        LDI       _ACCA, 0h
                        BRNE      DDS._L0054
                        SER       _ACCA
DDS._L0054:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0057
                        BRNE      DDS._L0057
                        .BRANCH   20,DDS._L0055
                        JMP       DDS._L0055
DDS._L0057:
                        .BLOCK    425
                        .LINE     426
                        LDS       _ACCB, DDS.wave_cmd
                        LDS       _ACCA, DDS.wave_cmd+1
                        STS       DDS.DSS_CMD, _ACCB
                        STS       DDS.DSS_CMD+1, _ACCA
                        .LINE     427
                        .BRANCH   17,DDS.SENDDDS
                        CALL      DDS.SENDDDS
                        .ENDBLOCK 428
DDS._L0055:
DDS._L0056:
                        .LINE     429
                        LDS       _ACCA, DDS.BurstCount
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BRNE      DDS._L0058
                        SER       _ACCA
DDS._L0058:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0061
                        BRNE      DDS._L0061
                        .BRANCH   20,DDS._L0059
                        JMP       DDS._L0059
DDS._L0061:
                        .BLOCK    429
                        .LINE     430
                        LDI       _ACCA, 02100h SHRB 8
                        LDI       _ACCB, 02100h AND 0FFh
                        STS       DDS.DSS_CMD, _ACCB
                        STS       DDS.DSS_CMD+1, _ACCA
                        .LINE     431
                        .BRANCH   17,DDS.SENDDDS
                        CALL      DDS.SENDDDS
                        .LINE     432
                        LDS       _ACCA, DDS.BurstMode
                        SUBI      _ACCA, -001h AND 0FFh
                        STS       DDS.BURSTCOUNT, _ACCA
                        .ENDBLOCK 433
DDS._L0059:
DDS._L0060:
                        .LINE     434
                        LDS       _ACCA, DDS.BurstCount
                        DEC       _ACCA
                        STS       DDS.BurstCount, _ACCA
                        .ENDBLOCK 435
DDS._L0051:
DDS._L0052:
                        .ENDBLOCK 436
DDS.onsystick_X:
                        .LINE     436
                        .BRANCH   19
                        RET
                        .ENDFUNC  436

                        .FUNC     DACLevel2RMS, 001C1h, 00020h
DDS.DACLevel2RMS:
                        .BLOCK    450
                        .LINE     451
                        LDD       _ACCAHI, Y+003h
                        LDD       _ACCALO, Y+002h
                        LDD       _ACCA, Y+001h
                        LDD       _ACCB, Y+000h
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DDS.PwrGain
                        LDS       _ACCA, DDS.PwrGain+1
                        LDS       _ACCALO, DDS.PwrGain+2
                        LDS       _ACCAHI, DDS.PwrGain+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        STD       Y+003h, _ACCAHI
                        STD       Y+002h, _ACCALO
                        STD       Y+001h, _ACCA
                        STD       Y+000h, _ACCB
                        .LINE     452
                        LDS       _ACCA, DDS.wave
                        .LINE     453
                        CPI       _ACCA, 2
                        .BRANCH   3,DDS._L0065
                        BREQ      DDS._L0065
                        .BRANCH   20,DDS._L0064
                        JMP       DDS._L0064
DDS._L0065:
DDS._L0063:
                        .BLOCK    454
                        .LINE     454
                        LDD       _ACCAHI, Y+003h
                        LDD       _ACCALO, Y+002h
                        LDD       _ACCA, Y+001h
                        LDD       _ACCB, Y+000h
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        POP       _ACCEHI
                        POP       _ACCELO
                        POP       _ACCDHI
                        POP       _ACCDLO
                        LDI       _ACCBLO, 0E2h
                        LDI       _ACCBHI, 005h
                        LDI       _ACCCLO, 051h
                        LDI       _ACCCHI, 03Fh
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat_R
                        .BRANCH   20,DDS.DACLevel2RMS_X
                        JMP       DDS.DACLevel2RMS_X
                        .ENDBLOCK 455
                        .BRANCH   20,DDS._L0062
                        JMP       DDS._L0062
DDS._L0064:
                        .LINE     456
                        CPI       _ACCA, 3
                        .BRANCH   3,DDS._L0068
                        BREQ      DDS._L0068
                        .BRANCH   20,DDS._L0067
                        JMP       DDS._L0067
DDS._L0068:
                        .BRANCH   20,DDS._L0066
                        JMP       DDS._L0066
DDS._L0067:
                        CPI       _ACCA, 4
                        .BRANCH   3,DDS._L0070
                        BREQ      DDS._L0070
                        .BRANCH   20,DDS._L0069
                        JMP       DDS._L0069
DDS._L0070:
DDS._L0066:
                        .BLOCK    457
                        .LINE     457
                        LDD       _ACCAHI, Y+003h
                        LDD       _ACCALO, Y+002h
                        LDD       _ACCA, Y+001h
                        LDD       _ACCB, Y+000h
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        POP       _ACCEHI
                        POP       _ACCELO
                        POP       _ACCDHI
                        POP       _ACCDLO
                        LDI       _ACCBLO, 0D5h
                        LDI       _ACCBHI, 004h
                        LDI       _ACCCLO, 0B5h
                        LDI       _ACCCHI, 03Fh
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat_R
                        .BRANCH   20,DDS.DACLevel2RMS_X
                        JMP       DDS.DACLevel2RMS_X
                        .ENDBLOCK 458
                        .BRANCH   20,DDS._L0062
                        JMP       DDS._L0062
DDS._L0069:
DDS._L0062:
                        .LINE     460
                        LDD       _ACCAHI, Y+003h
                        LDD       _ACCALO, Y+002h
                        LDD       _ACCA, Y+001h
                        LDD       _ACCB, Y+000h
                        .ENDBLOCK 461
DDS.DACLevel2RMS_X:
                        .LINE     461
                        .BRANCH   19
                        RET
                        .ENDFUNC  461

                        .FUNC     RMS2DACLevel, 001CFh, 00020h
DDS.RMS2DACLevel:
                        .BLOCK    464
                        .LINE     465
                        LDD       _ACCAHI, Y+003h
                        LDD       _ACCALO, Y+002h
                        LDD       _ACCA, Y+001h
                        LDD       _ACCB, Y+000h
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DDS.PwrGain
                        LDS       _ACCA, DDS.PwrGain+1
                        LDS       _ACCALO, DDS.PwrGain+2
                        LDS       _ACCAHI, DDS.PwrGain+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat
                        STD       Y+003h, _ACCAHI
                        STD       Y+002h, _ACCALO
                        STD       Y+001h, _ACCA
                        STD       Y+000h, _ACCB
                        .LINE     466
                        LDS       _ACCA, DDS.wave
                        .LINE     467
                        CPI       _ACCA, 2
                        .BRANCH   3,DDS._L0074
                        BREQ      DDS._L0074
                        .BRANCH   20,DDS._L0073
                        JMP       DDS._L0073
DDS._L0074:
DDS._L0072:
                        .BLOCK    468
                        .LINE     468
                        LDD       _ACCAHI, Y+003h
                        LDD       _ACCALO, Y+002h
                        LDD       _ACCA, Y+001h
                        LDD       _ACCB, Y+000h
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        POP       _ACCEHI
                        POP       _ACCELO
                        POP       _ACCDHI
                        POP       _ACCDLO
                        LDI       _ACCBLO, 072h
                        LDI       _ACCBHI, 0C4h
                        LDI       _ACCCLO, 09Ch
                        LDI       _ACCCHI, 03Fh
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat_R
                        .BRANCH   20,DDS.RMS2DACLevel_X
                        JMP       DDS.RMS2DACLevel_X
                        .ENDBLOCK 469
                        .BRANCH   20,DDS._L0071
                        JMP       DDS._L0071
DDS._L0073:
                        .LINE     470
                        CPI       _ACCA, 3
                        .BRANCH   3,DDS._L0077
                        BREQ      DDS._L0077
                        .BRANCH   20,DDS._L0076
                        JMP       DDS._L0076
DDS._L0077:
                        .BRANCH   20,DDS._L0075
                        JMP       DDS._L0075
DDS._L0076:
                        CPI       _ACCA, 4
                        .BRANCH   3,DDS._L0079
                        BREQ      DDS._L0079
                        .BRANCH   20,DDS._L0078
                        JMP       DDS._L0078
DDS._L0079:
DDS._L0075:
                        .BLOCK    471
                        .LINE     471
                        LDD       _ACCAHI, Y+003h
                        LDD       _ACCALO, Y+002h
                        LDD       _ACCA, Y+001h
                        LDD       _ACCB, Y+000h
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        POP       _ACCEHI
                        POP       _ACCELO
                        POP       _ACCDHI
                        POP       _ACCDLO
                        LDI       _ACCBLO, 029h
                        LDI       _ACCBHI, 005h
                        LDI       _ACCCLO, 035h
                        LDI       _ACCCHI, 03Fh
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat_R
                        .BRANCH   20,DDS.RMS2DACLevel_X
                        JMP       DDS.RMS2DACLevel_X
                        .ENDBLOCK 472
                        .BRANCH   20,DDS._L0071
                        JMP       DDS._L0071
DDS._L0078:
DDS._L0071:
                        .LINE     474
                        LDD       _ACCAHI, Y+003h
                        LDD       _ACCALO, Y+002h
                        LDD       _ACCA, Y+001h
                        LDD       _ACCB, Y+000h
                        .ENDBLOCK 475
DDS.RMS2DACLevel_X:
                        .LINE     475
                        .BRANCH   19
                        RET
                        .ENDFUNC  475

                        .FUNC     Level2dB, 001DDh, 00020h
DDS.Level2dB:
                        .BLOCK    478
                        .LINE     479
                        LDD       _ACCAHI, Y+003h
                        LDD       _ACCALO, Y+002h
                        LDD       _ACCA, Y+001h
                        LDD       _ACCB, Y+000h
                        MOVW      _ACCDLO, _ACCB
                        MOVW      _ACCELO, _ACCALO
                        LDI       _ACCBLO, 035h
                        LDI       _ACCBHI, 0A6h
                        LDI       _ACCCLO, 041h
                        LDI       _ACCCHI, 044h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat_R
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.Log10Float
                        MOVW      _ACCBLO, _ACCB
                        MOVW      _ACCCLO, _ACCALO
                        LDI       _ACCDLO, 000h
                        LDI       _ACCDHI, 000h
                        LDI       _ACCELO, 0A0h
                        LDI       _ACCEHI, 041h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat_R
                        .ENDBLOCK 480
DDS.Level2dB_X:
                        .LINE     480
                        .BRANCH   19
                        RET
                        .ENDFUNC  480

                        .FUNC     dB2Level, 001E2h, 00020h
DDS.dB2Level:
                        .BLOCK    483
                        .LINE     485
                        LDD       _ACCAHI, Y+003h
                        LDD       _ACCALO, Y+002h
                        LDD       _ACCA, Y+001h
                        LDD       _ACCB, Y+000h
                        MOVW      _ACCDLO, _ACCB
                        MOVW      _ACCELO, _ACCALO
                        LDI       _ACCBLO, 000h
                        LDI       _ACCBHI, 000h
                        LDI       _ACCCLO, 0A0h
                        LDI       _ACCCHI, 041h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat_R
                        LDI       _ACCBLO, 000h
                        LDI       _ACCBHI, 000h
                        LDI       _ACCCLO, 020h
                        LDI       _ACCCHI, 041h
                        PUSH      _ACCBLO
                        PUSH      _ACCBHI
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.PowFloat
                        MOVW      _ACCBLO, _ACCB
                        MOVW      _ACCCLO, _ACCALO
                        LDI       _ACCDLO, 035h
                        LDI       _ACCDHI, 0A6h
                        LDI       _ACCELO, 041h
                        LDI       _ACCEHI, 044h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat_R
                        .ENDBLOCK 486
DDS.dB2Level_X:
                        .LINE     486
                        .BRANCH   19
                        RET
                        .ENDFUNC  486

                        .FUNC     dB2DACLevel, 001E8h, 00020h
DDS.dB2DACLevel:
                        .BLOCK    489
                        .LINE     490
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDD       _ACCAHI, Y+003h
                        LDD       _ACCALO, Y+002h
                        LDD       _ACCA, Y+001h
                        LDD       _ACCB, Y+000h
                        ST        -Y, _ACCAHI
                        ST        -Y, _ACCALO
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  4
                        .FRAME  0
                        .BRANCH   17,DDS.DB2LEVEL
                        CALL       DDS.DB2LEVEL
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        ST        -Y, _ACCAHI
                        ST        -Y, _ACCALO
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  4
                        .FRAME  0
                        .BRANCH   17,DDS.RMS2DACLEVEL
                        CALL       DDS.RMS2DACLEVEL
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 491
DDS.dB2DACLevel_X:
                        .LINE     491
                        .BRANCH   19
                        RET
                        .ENDFUNC  491

                        .FUNC     DACLevel2dB, 001EDh, 00020h
DDS.DACLevel2dB:
                        .BLOCK    494
                        .LINE     495
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDD       _ACCAHI, Y+003h
                        LDD       _ACCALO, Y+002h
                        LDD       _ACCA, Y+001h
                        LDD       _ACCB, Y+000h
                        ST        -Y, _ACCAHI
                        ST        -Y, _ACCALO
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  4
                        .FRAME  0
                        .BRANCH   17,DDS.DACLEVEL2RMS
                        CALL       DDS.DACLEVEL2RMS
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        ST        -Y, _ACCAHI
                        ST        -Y, _ACCALO
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  4
                        .FRAME  0
                        .BRANCH   17,DDS.LEVEL2DB
                        CALL       DDS.LEVEL2DB
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 496
DDS.DACLevel2dB_X:
                        .LINE     496
                        .BRANCH   19
                        RET
                        .ENDFUNC  496

                        .FUNC     SetLimits, 001F4h, 00020h
DDS.SetLimits:
                        .BLOCK    502
                        .LINE     503
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCB, DDS.DACLevelMax
                        LDS       _ACCA, DDS.DACLevelMax+1
                        LDS       _ACCALO, DDS.DACLevelMax+2
                        LDS       _ACCAHI, DDS.DACLevelMax+3
                        ST        -Y, _ACCAHI
                        ST        -Y, _ACCALO
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  4
                        .FRAME  0
                        .BRANCH   17,DDS.DACLEVEL2DB
                        CALL       DDS.DACLEVEL2DB
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        STS       DDS.DBMAX, _ACCB
                        STS       DDS.DBMAX+1, _ACCA
                        STS       DDS.DBMAX+2, _ACCALO
                        STS       DDS.DBMAX+3, _ACCAHI
                        .ENDBLOCK 504
DDS.SetLimits_X:
                        .LINE     504
                        .BRANCH   19
                        RET
                        .ENDFUNC  504

                        .FUNC     PatchCopyFromEE, 001FCh, 00020h
DDS.PatchCopyFromEE:
                        .BLOCK    510
                        .LINE     511
                        LDI       _ACCCLO, DDS.Initwave AND 0FFh
                        LDI       _ACCCHI, DDS.Initwave SHRB 8
                        CALL      SYSTEM.ReadEEp8
                        STS       DDS.WAVE, _ACCA
                        .LINE     512
                        LDI       _ACCCLO, DDS.InitPwrGain AND 0FFh
                        LDI       _ACCCHI, DDS.InitPwrGain SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        STS       DDS.PWRGAIN, _ACCB
                        STS       DDS.PWRGAIN+1, _ACCA
                        STS       DDS.PWRGAIN+2, _ACCALO
                        STS       DDS.PWRGAIN+3, _ACCAHI
                        .LINE     513
                        LDI       _ACCCLO, DDS.InitFrequenz AND 0FFh
                        LDI       _ACCCHI, DDS.InitFrequenz SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        STS       DDS.FREQUENZ, _ACCB
                        STS       DDS.FREQUENZ+1, _ACCA
                        STS       DDS.FREQUENZ+2, _ACCALO
                        STS       DDS.FREQUENZ+3, _ACCAHI
                        .LINE     514
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCCLO, DDS.InitLevel AND 0FFh
                        LDI       _ACCCHI, DDS.InitLevel SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        ST        -Y, _ACCAHI
                        ST        -Y, _ACCALO
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  4
                        .FRAME  0
                        .BRANCH   17,DDS.RMS2DACLEVEL
                        CALL       DDS.RMS2DACLEVEL
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        STS       DDS.DACLEVEL, _ACCB
                        STS       DDS.DACLEVEL+1, _ACCA
                        STS       DDS.DACLEVEL+2, _ACCALO
                        STS       DDS.DACLEVEL+3, _ACCAHI
                        .LINE     515
                        LDI       _ACCCLO, DDS.InitdB AND 0FFh
                        LDI       _ACCCHI, DDS.InitdB SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        STS       DDS.DB, _ACCB
                        STS       DDS.DB+1, _ACCA
                        STS       DDS.DB+2, _ACCALO
                        STS       DDS.DB+3, _ACCAHI
                        .LINE     516
                        LDI       _ACCCLO, DDS.InitTerzNum AND 0FFh
                        LDI       _ACCCHI, DDS.InitTerzNum SHRB 8
                        CALL      SYSTEM.ReadEEp8
                        STS       DDS.TERZNUM, _ACCA
                        .LINE     517
                        LDI       _ACCCLO, DDS.InitOffset AND 0FFh
                        LDI       _ACCCHI, DDS.InitOffset SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        POP       _ACCEHI
                        POP       _ACCELO
                        POP       _ACCDHI
                        POP       _ACCDLO
                        LDI       _ACCBLO, 000h
                        LDI       _ACCBHI, 000h
                        LDI       _ACCCLO, 07Ah
                        LDI       _ACCCHI, 044h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat_R
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.FloatToLInt
                        SBRC      _ACCAHI, 7
                        RJMP      DDS._L0080
                        OR        _ACCAHI, _ACCALO
                        BRNE      DDS._L0081
                        RJMP      DDS._L0082
DDS._L0080:
                        CPI       _ACCAHI, 0FFh
                        BRNE      DDS._L0081
                        CPI       _ACCALO, 0FFh
                        BREQ      DDS._L0082
DDS._L0081:
                        SET
                        BLD       Flags, _ERRFLAG
DDS._L0082:
                        STS       DDS.OFFSET, _ACCB
                        STS       DDS.OFFSET+1, _ACCA
                        .LINE     518
                        LDI       _ACCCLO, DDS.InitBurst AND 0FFh
                        LDI       _ACCCHI, DDS.InitBurst SHRB 8
                        CALL      SYSTEM.ReadEEp8
                        STS       DDS.BURSTMODE, _ACCA
                        .LINE     519
                        LDI       _ACCCLO, DDS.InitIncRast AND 0FFh
                        LDI       _ACCCHI, DDS.InitIncRast SHRB 8
                        CALL      SYSTEM._ReadEEp16
                        STS       DDS.INCRAST, _ACCB
                        STS       DDS.INCRAST+1, _ACCA
                        .LINE     520
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 07Ah
                        LDI       _ACCAHI, 045h
                        STS       DDS.DACLEVELMAX, _ACCB
                        STS       DDS.DACLEVELMAX+1, _ACCA
                        STS       DDS.DACLEVELMAX+2, _ACCALO
                        STS       DDS.DACLEVELMAX+3, _ACCAHI
                        .LINE     521
                        LDI       _ACCCLO, DDS.InitAttnFac AND 0FFh
                        LDI       _ACCCHI, DDS.InitAttnFac SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        STS       DDS.ATTNFAC, _ACCB
                        STS       DDS.ATTNFAC+1, _ACCA
                        STS       DDS.ATTNFAC+2, _ACCALO
                        STS       DDS.ATTNFAC+3, _ACCAHI
                        .LINE     522
                        LDS       _ACCB, DDS.DACLevelMax
                        LDS       _ACCA, DDS.DACLevelMax+1
                        LDS       _ACCALO, DDS.DACLevelMax+2
                        LDS       _ACCAHI, DDS.DACLevelMax+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DDS.AttnFac
                        LDS       _ACCA, DDS.AttnFac+1
                        LDS       _ACCALO, DDS.AttnFac+2
                        LDS       _ACCAHI, DDS.AttnFac+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat
                        STS       DDS.ATTNSWITCHPOINT, _ACCB
                        STS       DDS.ATTNSWITCHPOINT+1, _ACCA
                        STS       DDS.ATTNSWITCHPOINT+2, _ACCALO
                        STS       DDS.ATTNSWITCHPOINT+3, _ACCAHI
                        .LINE     523
                        .BRANCH   17,DDS.SETLIMITS
                        CALL      DDS.SETLIMITS
                        .ENDBLOCK 524
DDS.PatchCopyFromEE_X:
                        .LINE     524
                        .BRANCH   19
                        RET
                        .ENDFUNC  524

                        .FUNC     SerCRLF, 00212h, 00020h
DDS.SerCRLF:
                        .BLOCK    531
                        .LINE     532
                        LDI       _ACCA, 00Dh
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .LINE     533
                        LDI       _ACCA, 00Ah
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .ENDBLOCK 534
DDS.SerCRLF_X:
                        .LINE     534
                        .BRANCH   19
                        RET
                        .ENDFUNC  534

                        .FUNC     WriteChPrefix, 00218h, 00020h
DDS.WriteChPrefix:
                        .BLOCK    537
                        .LINE     538
                        LDI       _ACCA, 023h
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .LINE     539
                        LDS       _ACCA, DDS.SlaveCh
                        SUBI      _ACCA, -030h AND 0FFh
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .LINE     540
                        LDI       _ACCA, 03Ah
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .LINE     541
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.Serout SHRB 1
                        LDI       _ACCA, SYSTEM.Serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDS       _ACCA, DDS.SubCh
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        ST        -Y, _ACCA
                        .FRAME  3
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        LDI       _ACCA, 020h
                        ST        -Y, _ACCA
                        .FRAME  6
                        CALL      SYSTEM.Byte2Str
                        .FRAME  2
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     542
                        LDI       _ACCA, 03Dh
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .ENDBLOCK 543
DDS.WriteChPrefix_X:
                        .LINE     543
                        .BRANCH   19
                        RET
                        .ENDFUNC  543

                        .FUNC     WriteSerInp, 00221h, 00020h
DDS.WriteSerInp:
                        .BLOCK    546
                        .LINE     547
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.Serout SHRB 1
                        LDI       _ACCA, SYSTEM.Serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, DDS.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DDS.SerInpStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     548
                        .BRANCH   17,DDS.SERCRLF
                        CALL      DDS.SERCRLF
                        .ENDBLOCK 549
DDS.WriteSerInp_X:
                        .LINE     549
                        .BRANCH   19
                        RET
                        .ENDFUNC  549

                        .FUNC     SerPrompt, 00227h, 00020h
DDS.SerPrompt:
                        .BLOCK    554
                        .LINE     555
                        LDS       _ACCA, DDS.verbose
                        PUSH      _ACCA
                        LDD       _ACCA, Y+001h
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      DDS._L0083
                        SER       _ACCA
DDS._L0083:
                        POP       _ACCB
                        OR        _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   4,DDS._L0086
                        BRNE      DDS._L0086
                        .BRANCH   20,DDS._L0084
                        JMP       DDS._L0084
DDS._L0086:
                        .BLOCK    555
                        .LINE     556
                        LDI       _ACCA, 0FFh
                        STS       DDS.SUBCH, _ACCA
                        .LINE     557
                        .BRANCH   17,DDS.WRITECHPREFIX
                        CALL      DDS.WRITECHPREFIX
                        .LINE     558
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.Serout SHRB 1
                        LDI       _ACCA, SYSTEM.Serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDD       _ACCA, Y+003h
                        PUSH      _ACCA
                        LDD       _ACCA, Y+002h
                        POP       _ACCB
                        ADD       _ACCA, _ACCB
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        ST        -Y, _ACCA
                        .FRAME  3
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        LDI       _ACCA, 020h
                        ST        -Y, _ACCA
                        .FRAME  6
                        CALL      SYSTEM.Byte2Str
                        .FRAME  2
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     559
                        LDI       _ACCA, 020h
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .LINE     560
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.serout SHRB 1
                        LDI       _ACCA, SYSTEM.serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, DDS.ErrStrArr AND 0FFh
                        LDI       _ACCCHI, DDS.ErrStrArr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCA, Y+003h
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LDI       _ACCBLO, 0000Ah AND 0FFh
                        LDI       _ACCBHI, 0000Ah SHRB 8
                        CLT
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.MUL16
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LPM       _ACCBHI, Z+
                        TST       _ACCBHI
                        BREQ      DDS._L0087
                        CALL      SYSTEM.StrConst2Str
DDS._L0087:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     561
                        .BRANCH   17,DDS.SERCRLF
                        CALL      DDS.SERCRLF
                        .ENDBLOCK 562
DDS._L0084:
DDS._L0085:
                        .LINE     563
                        LDD       _ACCA, Y+001h
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      DDS._L0088
                        SER       _ACCA
DDS._L0088:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0091
                        BRNE      DDS._L0091
                        .BRANCH   20,DDS._L0089
                        JMP       DDS._L0089
DDS._L0091:
                        .BLOCK    563
                        .LINE     564
                        LDS       _ACCBLO, DDS.ErrCount
                        LDS       _ACCBHI, DDS.ErrCount+1
                        ADIW      _ACCBLO, 1
                        STS       DDS.ErrCount, _ACCBLO
                        STS       DDS.ErrCount+1, _ACCBHI
                        .LINE     565
                        LDI       _ACCA, 0FFh
                        STS       DDS.ERRFLAG, _ACCA
                        .ENDBLOCK 566
DDS._L0089:
DDS._L0090:
                        .ENDBLOCK 567
DDS.SerPrompt_X:
                        .LINE     567
                        .BRANCH   19
                        RET
                        .ENDFUNC  567

                        .FUNC     SwitchRange, 0023Bh, 00020h
DDS.SwitchRange:
                        .BLOCK    573
                        .LINE     574
                        LDI       _ACCCLO, DDS.InpGains AND 0FFh
                        LDI       _ACCCHI, DDS.InpGains SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DDS.Range
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LPM       _ACCB, Z+
                        LPM       _ACCA, Z+
                        LPM       _ACCALO, Z+
                        LPM       _ACCAHI, Z
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, DDS.ADCscales AND 0FFh
                        LDI       _ACCCHI, DDS.ADCscales SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DDS.Range
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        CALL      SYSTEM._ReadEEp32
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        STS       DDS.INPGAINFAC, _ACCB
                        STS       DDS.INPGAINFAC+1, _ACCA
                        STS       DDS.INPGAINFAC+2, _ACCALO
                        STS       DDS.INPGAINFAC+3, _ACCAHI
                        .LINE     575
                        LDS       _ACCA, DDS.Range
                        PUSH      _ACCA
                        LDS       _ACCA, DDS.OldRange
                        POP       _ACCB
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0h
                        BRNE      DDS._L0092
                        SER       _ACCA
DDS._L0092:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0095
                        BRNE      DDS._L0095
                        .BRANCH   20,DDS._L0093
                        JMP       DDS._L0093
DDS._L0095:
                        .BLOCK    575
                        .LINE     576
                        .BRANCH   20,DDS.SwitchRange_X
                        JMP       DDS.SwitchRange_X
                        .ENDBLOCK 577
DDS._L0093:
DDS._L0094:
                        .LINE     578
                        LDS       _ACCA, DDS.Range
                        STS       DDS.OLDRANGE, _ACCA
                        .LINE     580
                        CBI       00035h, 002h
                        .LINE     581
                        CBI       00035h, 003h
                        .LINE     582
                        LDI       _ACCCLO, DDS.RangeStr AND 0FFh
                        LDI       _ACCCHI, DDS.RangeStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        ADIW      _ACCCLO, 1
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        LDI       _ACCA, 008h
                        ST        -Y, _ACCA
                        LDI       _ACCA, 0FEH ROLB _DEVICE
                        AND       Flags, _ACCA
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        .FRAME  3
                        LDI       _ACCCLO, $St_String13 AND 0FFh
                        LDI       _ACCCHI, $St_String13 SHRB 8
                        LPM       _ACCBHI, Z+
                        TST       _ACCBHI
                        BREQ      DDS._L0096
                        CALL      SYSTEM.StrConst2Str
DDS._L0096:
                        LDI       _ACCA, 008h
                        PUSH      _ACCA
                        LDD       _ACCA, Y+000h
                        POP       _ACCB
                        SUB       _ACCB, _ACCA
                        MOV       _ACCA, _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z, _ACCA
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .LINE     583
                        LDS       _ACCA, DDS.Range
                        .LINE     584
                        CPI       _ACCA, 0
                        .BRANCH   3,DDS._L0100
                        BREQ      DDS._L0100
                        .BRANCH   20,DDS._L0099
                        JMP       DDS._L0099
DDS._L0100:
DDS._L0098:
                        .BLOCK    585
                        .LINE     585
                        SBI       00035h, 002h
                        .LINE     586
                        LDI       _ACCCLO, DDS.RangeStr AND 0FFh
                        LDI       _ACCCHI, DDS.RangeStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        ADIW      _ACCCLO, 1
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        LDI       _ACCA, 008h
                        ST        -Y, _ACCA
                        LDI       _ACCA, 0FEH ROLB _DEVICE
                        AND       Flags, _ACCA
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        .FRAME  3
                        LDI       _ACCCLO, $St_String14 AND 0FFh
                        LDI       _ACCCHI, $St_String14 SHRB 8
                        LPM       _ACCBHI, Z+
                        TST       _ACCBHI
                        BREQ      DDS._L0101
                        CALL      SYSTEM.StrConst2Str
DDS._L0101:
                        LDI       _ACCA, 008h
                        PUSH      _ACCA
                        LDD       _ACCA, Y+000h
                        POP       _ACCB
                        SUB       _ACCB, _ACCA
                        MOV       _ACCA, _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z, _ACCA
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDBLOCK 587
                        .BRANCH   20,DDS._L0097
                        JMP       DDS._L0097
DDS._L0099:
                        .LINE     588
                        CPI       _ACCA, 2
                        .BRANCH   3,DDS._L0104
                        BREQ      DDS._L0104
                        .BRANCH   20,DDS._L0103
                        JMP       DDS._L0103
DDS._L0104:
DDS._L0102:
                        .BLOCK    589
                        .LINE     589
                        SBI       00035h, 002h
                        .LINE     590
                        SBI       00035h, 003h
                        .LINE     591
                        LDI       _ACCCLO, DDS.RangeStr AND 0FFh
                        LDI       _ACCCHI, DDS.RangeStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        ADIW      _ACCCLO, 1
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        LDI       _ACCA, 008h
                        ST        -Y, _ACCA
                        LDI       _ACCA, 0FEH ROLB _DEVICE
                        AND       Flags, _ACCA
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        .FRAME  3
                        LDI       _ACCCLO, $St_String15 AND 0FFh
                        LDI       _ACCCHI, $St_String15 SHRB 8
                        LPM       _ACCBHI, Z+
                        TST       _ACCBHI
                        BREQ      DDS._L0105
                        CALL      SYSTEM.StrConst2Str
DDS._L0105:
                        LDI       _ACCA, 008h
                        PUSH      _ACCA
                        LDD       _ACCA, Y+000h
                        POP       _ACCB
                        SUB       _ACCB, _ACCA
                        MOV       _ACCA, _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z, _ACCA
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDBLOCK 592
                        .BRANCH   20,DDS._L0097
                        JMP       DDS._L0097
DDS._L0103:
                        .LINE     593
                        CPI       _ACCA, 3
                        .BRANCH   3,DDS._L0108
                        BREQ      DDS._L0108
                        .BRANCH   20,DDS._L0107
                        JMP       DDS._L0107
DDS._L0108:
DDS._L0106:
                        .BLOCK    594
                        .LINE     594
                        SBI       00035h, 003h
                        .LINE     595
                        LDI       _ACCCLO, DDS.RangeStr AND 0FFh
                        LDI       _ACCCHI, DDS.RangeStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        ADIW      _ACCCLO, 1
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        LDI       _ACCA, 008h
                        ST        -Y, _ACCA
                        LDI       _ACCA, 0FEH ROLB _DEVICE
                        AND       Flags, _ACCA
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        .FRAME  3
                        LDI       _ACCCLO, $St_String16 AND 0FFh
                        LDI       _ACCCHI, $St_String16 SHRB 8
                        LPM       _ACCBHI, Z+
                        TST       _ACCBHI
                        BREQ      DDS._L0109
                        CALL      SYSTEM.StrConst2Str
DDS._L0109:
                        LDI       _ACCA, 008h
                        PUSH      _ACCA
                        LDD       _ACCA, Y+000h
                        POP       _ACCB
                        SUB       _ACCB, _ACCA
                        MOV       _ACCA, _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z, _ACCA
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDBLOCK 596
                        .BRANCH   20,DDS._L0097
                        JMP       DDS._L0097
DDS._L0107:
DDS._L0097:
                        .ENDBLOCK 598
DDS.SwitchRange_X:
                        .LINE     598
                        .BRANCH   19
                        RET
                        .ENDFUNC  598

                        .FUNC     WriteParamStrSer, 0025Ch, 00020h
DDS.WriteParamStrSer:
                        .BLOCK    605
                        .LINE     606
                        .BRANCH   17,DDS.WRITECHPREFIX
                        CALL      DDS.WRITECHPREFIX
                        .LINE     607
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.Serout SHRB 1
                        LDI       _ACCA, SYSTEM.Serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, DDS.ParamStr AND 0FFh
                        LDI       _ACCCHI, DDS.ParamStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     608
                        .BRANCH   17,DDS.SERCRLF
                        CALL      DDS.SERCRLF
                        .ENDBLOCK 609
DDS.WriteParamStrSer_X:
                        .LINE     609
                        .BRANCH   19
                        RET
                        .ENDFUNC  609

                        .FUNC     ParamToStr, 00264h, 00020h
DDS.ParamToStr:
                        .BLOCK    613
                        .LINE     614
                        LDS       _ACCB, DDS.Param
                        LDS       _ACCA, DDS.Param+1
                        LDS       _ACCALO, DDS.Param+2
                        LDS       _ACCAHI, DDS.Param+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 000h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      DDS._L0111
                        BRPL      DDS._L0112
                        BRMI      DDS._L0110
DDS._L0112:
                        CLZ
                        CLC
                        RJMP      DDS._L0111
DDS._L0110:
                        CLZ
                        SEC
DDS._L0111:
                        LDI       _ACCA, 0h
                        BRNE      DDS._L0113
                        SER       _ACCA
DDS._L0113:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0116
                        BRNE      DDS._L0116
                        .BRANCH   20,DDS._L0114
                        JMP       DDS._L0114
DDS._L0116:
                        .BLOCK    614
                        .LINE     615
                        LDI       _ACCCLO, DDS.ParamStr AND 0FFh
                        LDI       _ACCCHI, DDS.ParamStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        ADIW      _ACCCLO, 1
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        LDI       _ACCA, 028h
                        ST        -Y, _ACCA
                        LDI       _ACCA, 0FEH ROLB _DEVICE
                        AND       Flags, _ACCA
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        .FRAME  3
                        LDI       _ACCA, 030h
                        CALL      SYSTEM.Char2Str
                        LDI       _ACCA, 028h
                        PUSH      _ACCA
                        LDD       _ACCA, Y+000h
                        POP       _ACCB
                        SUB       _ACCB, _ACCA
                        MOV       _ACCA, _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z, _ACCA
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDBLOCK 616
                        .BRANCH   20,DDS._L0115
                        JMP       DDS._L0115
DDS._L0114:
                        .BLOCK    616
                        .LINE     617
                        LDI       _ACCCLO, DDS.ParamStr AND 0FFh
                        LDI       _ACCCHI, DDS.ParamStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        ADIW      _ACCCLO, 1
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        LDI       _ACCA, 028h
                        ST        -Y, _ACCA
                        LDI       _ACCA, 0FEH ROLB _DEVICE
                        AND       Flags, _ACCA
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        .FRAME  3
                        LDS       _ACCB, DDS.Param
                        LDS       _ACCA, DDS.Param+1
                        LDS       _ACCALO, DDS.Param+2
                        LDS       _ACCAHI, DDS.Param+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCA, DDS.digits
                        PUSH      _ACCA
                        LDS       _ACCA, DDS.nachkomma
                        PUSH      _ACCA
                        LDI       _ACCA, 020h
                        PUSH      _ACCA
                        CALL      SYSTEM.Float2Str
                        LDI       _ACCA, 028h
                        PUSH      _ACCA
                        LDD       _ACCA, Y+000h
                        POP       _ACCB
                        SUB       _ACCB, _ACCA
                        MOV       _ACCA, _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z, _ACCA
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDBLOCK 618
DDS._L0115:
                        .ENDBLOCK 619
DDS.ParamToStr_X:
                        .LINE     619
                        .BRANCH   19
                        RET
                        .ENDFUNC  619

                        .FUNC     ParamToPMStr, 0026Dh, 00020h
DDS.ParamToPMStr:
                        .BLOCK    622
                        .LINE     623
                        .BRANCH   17,DDS.PARAMTOSTR
                        CALL      DDS.PARAMTOSTR
                        .LINE     624
                        LDI       _ACCCLO, DDS.ParamStr AND 0FFh
                        LDI       _ACCCHI, DDS.ParamStr SHRB 8
                        ADIW      _ACCCLO, 00001h
                        LD        _ACCA, Z+
                        CPI       _ACCA, 02Dh
                        LDI       _ACCA, 0h
                        BREQ      DDS._L0117
                        SER       _ACCA
DDS._L0117:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0120
                        BRNE      DDS._L0120
                        .BRANCH   20,DDS._L0118
                        JMP       DDS._L0118
DDS._L0120:
                        .BLOCK    624
                        .LINE     625
                        LDI       _ACCCLO, $St_String17 AND 0FFh
                        LDI       _ACCCHI, $St_String17 SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCCLO, DDS.ParamStr AND 0FFh
                        LDI       _ACCCHI, DDS.ParamStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCA, 028h
                        PUSH      _ACCA
                        LDI       _ACCA, 001h
                        LDI       _ACCFHI, 002h
                        CALL      SYSTEM.StringInsert
                        .ENDBLOCK 626
DDS._L0118:
DDS._L0119:
                        .ENDBLOCK 627
DDS.ParamToPMStr_X:
                        .LINE     627
                        .BRANCH   19
                        RET
                        .ENDFUNC  627

                        .FUNC     ParamLongToStr, 00275h, 00020h
DDS.ParamLongToStr:
                        .BLOCK    630
                        .LINE     631
                        LDS       _ACCB, DDS.ParamLong
                        LDS       _ACCA, DDS.ParamLong+1
                        LDS       _ACCALO, DDS.ParamLong+2
                        LDS       _ACCAHI, DDS.ParamLong+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        SET
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.LIntToFloat
                        MOVW      _ACCDLO, _ACCB
                        MOVW      _ACCELO, _ACCALO
                        LDI       _ACCBLO, 000h
                        LDI       _ACCBHI, 000h
                        LDI       _ACCCLO, 020h
                        LDI       _ACCCHI, 041h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat_R
                        STS       DDS.PARAM, _ACCB
                        STS       DDS.PARAM+1, _ACCA
                        STS       DDS.PARAM+2, _ACCALO
                        STS       DDS.PARAM+3, _ACCAHI
                        .LINE     632
                        .BRANCH   17,DDS.PARAMTOSTR
                        CALL      DDS.PARAMTOSTR
                        .ENDBLOCK 633
DDS.ParamLongToStr_X:
                        .LINE     633
                        .BRANCH   19
                        RET
                        .ENDFUNC  633

                        .FUNC     OffsetToParam, 0027Bh, 00020h
DDS.OffsetToParam:
                        .BLOCK    636
                        .LINE     637
                        LDS       _ACCB, DDS.Offset
                        LDS       _ACCA, DDS.Offset+1
                        SBRS      _ACCA, 7
                        RJMP      DDS._L0121
                        LDI       _ACCAHI, 0FFh
                        LDI       _ACCALO, 0FFh
                        RJMP      DDS._L0122
DDS._L0121:
                        CLR       _ACCAHI
                        CLR       _ACCALO
DDS._L0122:
                        SET
                        BLD       Flags, _SIGN
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.LIntToFloat
                        MOVW      _ACCDLO, _ACCB
                        MOVW      _ACCELO, _ACCALO
                        LDI       _ACCBLO, 000h
                        LDI       _ACCBHI, 000h
                        LDI       _ACCCLO, 07Ah
                        LDI       _ACCCHI, 044h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat_R
                        STS       DDS.PARAM, _ACCB
                        STS       DDS.PARAM+1, _ACCA
                        STS       DDS.PARAM+2, _ACCALO
                        STS       DDS.PARAM+3, _ACCAHI
                        .ENDBLOCK 638
DDS.OffsetToParam_X:
                        .LINE     638
                        .BRANCH   19
                        RET
                        .ENDFUNC  638

                        .FUNC     WriteParamSer, 0028Ch, 00020h
DDS.WriteParamSer:
                        .BLOCK    653
                        .LINE     654
                        .BRANCH   17,DDS.PARAMTOSTR
                        CALL      DDS.PARAMTOSTR
                        .LINE     655
                        .BRANCH   17,DDS.WRITEPARAMSTRSER
                        CALL      DDS.WRITEPARAMSTRSER
                        .ENDBLOCK 656
DDS.WriteParamSer_X:
                        .LINE     656
                        .BRANCH   19
                        RET
                        .ENDFUNC  656

                        .FUNC     WriteParamByteSer, 00292h, 00020h
DDS.WriteParamByteSer:
                        .BLOCK    659
                        .LINE     660
                        LDI       _ACCCLO, DDS.ParamStr AND 0FFh
                        LDI       _ACCCHI, DDS.ParamStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        ADIW      _ACCCLO, 1
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        LDI       _ACCA, 028h
                        ST        -Y, _ACCA
                        LDI       _ACCA, 0FEH ROLB _DEVICE
                        AND       Flags, _ACCA
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        .FRAME  3
                        LDS       _ACCA, DDS.ParamByte
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        ST        -Y, _ACCA
                        .FRAME  4
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        LDI       _ACCA, 020h
                        ST        -Y, _ACCA
                        .FRAME  7
                        CALL      SYSTEM.Byte2Str
                        .FRAME  3
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        LDI       _ACCA, 028h
                        PUSH      _ACCA
                        LDD       _ACCA, Y+000h
                        POP       _ACCB
                        SUB       _ACCB, _ACCA
                        MOV       _ACCA, _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z, _ACCA
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .LINE     661
                        .BRANCH   17,DDS.WRITEPARAMSTRSER
                        CALL      DDS.WRITEPARAMSTRSER
                        .ENDBLOCK 662
DDS.WriteParamByteSer_X:
                        .LINE     662
                        .BRANCH   19
                        RET
                        .ENDFUNC  662

                        .FUNC     ParamStrOnLCD, 00299h, 00020h
DDS.ParamStrOnLCD:
                        .BLOCK    666
                        .LINE     667
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  3
                        .FRAME  0
                        CALL      SYSTEM.LCDXY_M
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     668
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, DDS.ParamStr AND 0FFh
                        LDI       _ACCCHI, DDS.ParamStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     669
                        LDI       _ACCA, 000h
                        .FRAME  0
                        CALL      SYSTEM.LCDCLREOL_M
                        .LINE     670
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 007h
                        ST        -Y, _ACCA
                        .FRAME  2
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  3
                        .FRAME  0
                        CALL      SYSTEM.LCDXY_M
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     671
                        LDS       _ACCA, DDS.IncrFine
                        TST       _ACCA
                        .BRANCH   4,DDS._L0125
                        BRNE      DDS._L0125
                        .BRANCH   20,DDS._L0123
                        JMP       DDS._L0123
DDS._L0125:
                        .BLOCK    671
                        .LINE     672
                        LDI       _ACCA, 002h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .ENDBLOCK 673
                        .BRANCH   20,DDS._L0124
                        JMP       DDS._L0124
DDS._L0123:
                        .BLOCK    673
                        .LINE     674
                        LDI       _ACCA, 000h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .ENDBLOCK 675
DDS._L0124:
                        .LINE     676
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  3
                        .FRAME  0
                        CALL      SYSTEM.LCDXY_M
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 677
DDS.ParamStrOnLCD_X:
                        .LINE     677
                        .BRANCH   19
                        RET
                        .ENDFUNC  677

                        .FUNC     SollWerteOnLCD, 002A7h, 00020h
DDS.SollWerteOnLCD:
                        SBIW      _FRAMEPTR, 4
                        .BLOCK    681
                        .LINE     682
                        LDS       _ACCA, DDS.ChangedFlag
                        COM       _ACCA
                        PUSH      _ACCA
                        LDS       _ACCA, DDS.Modify
                        CPI       _ACCA, 004h
                        LDI       _ACCA, 0h
                        BREQ      DDS._L0126
                        SER       _ACCA
DDS._L0126:
                        POP       _ACCB
                        AND       _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   4,DDS._L0129
                        BRNE      DDS._L0129
                        .BRANCH   20,DDS._L0127
                        JMP       DDS._L0127
DDS._L0129:
                        .BLOCK    682
                        .LINE     683
                        .BRANCH   20,DDS.SollWerteOnLCD_X
                        JMP       DDS.SollWerteOnLCD_X
                        .ENDBLOCK 684
DDS._L0127:
DDS._L0128:
                        .LINE     685
                        LDI       _ACCA, 002h
                        STS       DDS.DIGITS, _ACCA
                        .LINE     686
                        LDI       _ACCA, 001h
                        STS       DDS.NACHKOMMA, _ACCA
                        .LINE     687
                        LDS       _ACCA, DDS.Modify
                        .LINE     688
                        CPI       _ACCA, 1
                        .BRANCH   3,DDS._L0133
                        BREQ      DDS._L0133
                        .BRANCH   20,DDS._L0132
                        JMP       DDS._L0132
DDS._L0133:
DDS._L0131:
                        .BLOCK    689
                        .LINE     689
                        LDS       _ACCB, DDS.Frequenz
                        LDS       _ACCA, DDS.Frequenz+1
                        LDS       _ACCALO, DDS.Frequenz+2
                        LDS       _ACCAHI, DDS.Frequenz+3
                        STS       DDS.PARAMLONG, _ACCB
                        STS       DDS.PARAMLONG+1, _ACCA
                        STS       DDS.PARAMLONG+2, _ACCALO
                        STS       DDS.PARAMLONG+3, _ACCAHI
                        .LINE     690
                        .BRANCH   17,DDS.PARAMLONGTOSTR
                        CALL      DDS.PARAMLONGTOSTR
                        .LINE     691
                        .BRANCH   17,DDS.PARAMSTRONLCD
                        CALL      DDS.PARAMSTRONLCD
                        .LINE     692
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, DDS.FrequStr AND 0FFh
                        LDI       _ACCCHI, DDS.FrequStr SHRB 8
                        LPM       _ACCBHI, Z+
                        TST       _ACCBHI
                        BREQ      DDS._L0134
                        CALL      SYSTEM.StrConst2Str
DDS._L0134:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .ENDBLOCK 693
                        .BRANCH   20,DDS._L0130
                        JMP       DDS._L0130
DDS._L0132:
                        .LINE     694
                        CPI       _ACCA, 6
                        .BRANCH   3,DDS._L0137
                        BREQ      DDS._L0137
                        .BRANCH   20,DDS._L0136
                        JMP       DDS._L0136
DDS._L0137:
DDS._L0135:
                        .BLOCK    695
                        .LINE     695
                        LDI       _ACCA, 005h
                        STS       DDS.DIGITS, _ACCA
                        .LINE     696
                        LDI       _ACCA, 003h
                        STS       DDS.NACHKOMMA, _ACCA
                        .LINE     697
                        .BRANCH   17,DDS.OFFSETTOPARAM
                        CALL      DDS.OFFSETTOPARAM
                        .LINE     698
                        .BRANCH   17,DDS.PARAMTOPMSTR
                        CALL      DDS.PARAMTOPMSTR
                        .LINE     699
                        .BRANCH   17,DDS.PARAMSTRONLCD
                        CALL      DDS.PARAMSTRONLCD
                        .LINE     700
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, DDS.OffsetStr AND 0FFh
                        LDI       _ACCCHI, DDS.OffsetStr SHRB 8
                        LPM       _ACCBHI, Z+
                        TST       _ACCBHI
                        BREQ      DDS._L0138
                        CALL      SYSTEM.StrConst2Str
DDS._L0138:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .ENDBLOCK 701
                        .BRANCH   20,DDS._L0130
                        JMP       DDS._L0130
DDS._L0136:
                        .LINE     702
                        CPI       _ACCA, 2
                        .BRANCH   3,DDS._L0141
                        BREQ      DDS._L0141
                        .BRANCH   20,DDS._L0140
                        JMP       DDS._L0140
DDS._L0141:
DDS._L0139:
                        .BLOCK    703
                        .LINE     703
                        LDS       _ACCA, DDS.IncrFine
                        TST       _ACCA
                        .BRANCH   4,DDS._L0144
                        BRNE      DDS._L0144
                        .BRANCH   20,DDS._L0142
                        JMP       DDS._L0142
DDS._L0144:
                        .BLOCK    703
                        .LINE     704
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCB, DDS.DACLevel
                        LDS       _ACCA, DDS.DACLevel+1
                        LDS       _ACCALO, DDS.DACLevel+2
                        LDS       _ACCAHI, DDS.DACLevel+3
                        ST        -Y, _ACCAHI
                        ST        -Y, _ACCALO
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  4
                        .FRAME  0
                        .BRANCH   17,DDS.DACLEVEL2RMS
                        CALL       DDS.DACLEVEL2RMS
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        STS       DDS.PARAM, _ACCB
                        STS       DDS.PARAM+1, _ACCA
                        STS       DDS.PARAM+2, _ACCALO
                        STS       DDS.PARAM+3, _ACCAHI
                        .LINE     705
                        .BRANCH   17,DDS.PARAMTOSTR
                        CALL      DDS.PARAMTOSTR
                        .LINE     706
                        .BRANCH   17,DDS.PARAMSTRONLCD
                        CALL      DDS.PARAMSTRONLCD
                        .LINE     707
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, DDS.LevelStr AND 0FFh
                        LDI       _ACCCHI, DDS.LevelStr SHRB 8
                        LPM       _ACCBHI, Z+
                        TST       _ACCBHI
                        BREQ      DDS._L0145
                        CALL      SYSTEM.StrConst2Str
DDS._L0145:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     708
                        LDI       _ACCA, 06Dh
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .LINE     709
                        LDI       _ACCA, 056h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .ENDBLOCK 710
                        .BRANCH   20,DDS._L0143
                        JMP       DDS._L0143
DDS._L0142:
                        .BLOCK    710
                        .LINE     711
                        LDI       _ACCA, 003h
                        STS       DDS.DIGITS, _ACCA
                        .LINE     712
                        LDI       _ACCA, 002h
                        STS       DDS.NACHKOMMA, _ACCA
                        .LINE     713
                        LDS       _ACCB, DDS.db
                        LDS       _ACCA, DDS.db+1
                        LDS       _ACCALO, DDS.db+2
                        LDS       _ACCAHI, DDS.db+3
                        STS       DDS.PARAM, _ACCB
                        STS       DDS.PARAM+1, _ACCA
                        STS       DDS.PARAM+2, _ACCALO
                        STS       DDS.PARAM+3, _ACCAHI
                        .LINE     714
                        .BRANCH   17,DDS.PARAMTOPMSTR
                        CALL      DDS.PARAMTOPMSTR
                        .LINE     715
                        .BRANCH   17,DDS.PARAMSTRONLCD
                        CALL      DDS.PARAMSTRONLCD
                        .LINE     716
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, DDS.LevelStr AND 0FFh
                        LDI       _ACCCHI, DDS.LevelStr SHRB 8
                        LPM       _ACCBHI, Z+
                        TST       _ACCBHI
                        BREQ      DDS._L0146
                        CALL      SYSTEM.StrConst2Str
DDS._L0146:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     717
                        LDI       _ACCA, 064h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .LINE     718
                        LDI       _ACCA, 042h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .ENDBLOCK 719
DDS._L0143:
                        .ENDBLOCK 720
                        .BRANCH   20,DDS._L0130
                        JMP       DDS._L0130
DDS._L0140:
                        .LINE     721
                        CPI       _ACCA, 3
                        .BRANCH   3,DDS._L0149
                        BREQ      DDS._L0149
                        .BRANCH   20,DDS._L0148
                        JMP       DDS._L0148
DDS._L0149:
DDS._L0147:
                        .BLOCK    722
                        .LINE     722
                        LDS       _ACCB, DDS.DACLevel
                        LDS       _ACCA, DDS.DACLevel+1
                        LDS       _ACCALO, DDS.DACLevel+2
                        LDS       _ACCAHI, DDS.DACLevel+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DDS.PwrGain
                        LDS       _ACCA, DDS.PwrGain+1
                        LDS       _ACCALO, DDS.PwrGain+2
                        LDS       _ACCAHI, DDS.PwrGain+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        POP       _ACCEHI
                        POP       _ACCELO
                        POP       _ACCDHI
                        POP       _ACCDLO
                        LDI       _ACCBLO, 0F3h
                        LDI       _ACCBHI, 004h
                        LDI       _ACCCLO, 035h
                        LDI       _ACCCHI, 040h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat_R
                        STS       DDS.PARAM, _ACCB
                        STS       DDS.PARAM+1, _ACCA
                        STS       DDS.PARAM+2, _ACCALO
                        STS       DDS.PARAM+3, _ACCAHI
                        .LINE     723
                        .BRANCH   17,DDS.PARAMTOSTR
                        CALL      DDS.PARAMTOSTR
                        .LINE     724
                        .BRANCH   17,DDS.PARAMSTRONLCD
                        CALL      DDS.PARAMSTRONLCD
                        .LINE     725
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, DDS.PeakStr AND 0FFh
                        LDI       _ACCCHI, DDS.PeakStr SHRB 8
                        LPM       _ACCBHI, Z+
                        TST       _ACCBHI
                        BREQ      DDS._L0150
                        CALL      SYSTEM.StrConst2Str
DDS._L0150:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .ENDBLOCK 726
                        .BRANCH   20,DDS._L0130
                        JMP       DDS._L0130
DDS._L0148:
                        .LINE     728
                        CPI       _ACCA, 4
                        .BRANCH   3,DDS._L0153
                        BREQ      DDS._L0153
                        .BRANCH   20,DDS._L0152
                        JMP       DDS._L0152
DDS._L0153:
DDS._L0151:
                        .BLOCK    729
                        .LINE     729
                        LDI       _ACCA, 003h
                        .FRAME  0
                        CALL       SYSTEM.GETADC
                        STS       DDS.PARAMINT, _ACCB
                        STS       DDS.PARAMINT+1, _ACCA
                        .LINE     730
                        LDS       _ACCB, DDS.ParamInt
                        LDS       _ACCA, DDS.ParamInt+1
                        SBRS      _ACCA, 7
                        RJMP      DDS._L0154
                        LDI       _ACCAHI, 0FFh
                        LDI       _ACCALO, 0FFh
                        RJMP      DDS._L0155
DDS._L0154:
                        CLR       _ACCAHI
                        CLR       _ACCALO
DDS._L0155:
                        SET
                        BLD       Flags, _SIGN
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.LIntToFloat
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DDS.InpGainFac
                        LDS       _ACCA, DDS.InpGainFac+1
                        LDS       _ACCALO, DDS.InpGainFac+2
                        LDS       _ACCAHI, DDS.InpGainFac+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        STS       DDS.PARAM, _ACCB
                        STS       DDS.PARAM+1, _ACCA
                        STS       DDS.PARAM+2, _ACCALO
                        STS       DDS.PARAM+3, _ACCAHI
                        .LINE     731
                        LDS       _ACCA, DDS.Range
                        CPI       _ACCA, 001h
                        LDI       _ACCA, 0
                        BRLO      DDS._L0156
                        LDI       _ACCA, 0FFh
DDS._L0156:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0159
                        BRNE      DDS._L0159
                        .BRANCH   20,DDS._L0157
                        JMP       DDS._L0157
DDS._L0159:
                        .BLOCK    731
                        .LINE     732
                        LDS       _ACCB, DDS.Param
                        LDS       _ACCA, DDS.Param+1
                        LDS       _ACCALO, DDS.Param+2
                        LDS       _ACCAHI, DDS.Param+3
                        MOVW      _ACCDLO, _ACCB
                        MOVW      _ACCELO, _ACCALO
                        LDI       _ACCBLO, 000h
                        LDI       _ACCBHI, 000h
                        LDI       _ACCCLO, 07Ah
                        LDI       _ACCCHI, 044h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat_R
                        STS       DDS.PARAM, _ACCB
                        STS       DDS.PARAM+1, _ACCA
                        STS       DDS.PARAM+2, _ACCALO
                        STS       DDS.PARAM+3, _ACCAHI
                        .LINE     733
                        LDI       _ACCA, 003h
                        STS       DDS.NACHKOMMA, _ACCA
                        .ENDBLOCK 734
DDS._L0157:
DDS._L0158:
                        .LINE     735
                        .BRANCH   17,DDS.PARAMTOSTR
                        CALL      DDS.PARAMTOSTR
                        .LINE     736
                        LDS       _ACCB, DDS.ParamInt
                        LDS       _ACCA, DDS.ParamInt+1
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        CPI       _ACCA, 083h
                        BRNE      DDS._L0160
                        CPI       _ACCB, 0FCh
DDS._L0160:
                        LDI       _ACCA, 0h
                        BREQ      DDS._L0161
                        BRLO      DDS._L0161
                        SER       _ACCA
DDS._L0161:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0164
                        BRNE      DDS._L0164
                        .BRANCH   20,DDS._L0162
                        JMP       DDS._L0162
DDS._L0164:
                        .BLOCK    736
                        .LINE     737
                        LDI       _ACCCLO, DDS.ParamStr AND 0FFh
                        LDI       _ACCCHI, DDS.ParamStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        ADIW      _ACCCLO, 1
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        LDI       _ACCA, 028h
                        ST        -Y, _ACCA
                        LDI       _ACCA, 0FEH ROLB _DEVICE
                        AND       Flags, _ACCA
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        .FRAME  3
                        LDI       _ACCCLO, $St_String18 AND 0FFh
                        LDI       _ACCCHI, $St_String18 SHRB 8
                        LPM       _ACCBHI, Z+
                        TST       _ACCBHI
                        BREQ      DDS._L0165
                        CALL      SYSTEM.StrConst2Str
DDS._L0165:
                        LDI       _ACCA, 028h
                        PUSH      _ACCA
                        LDD       _ACCA, Y+000h
                        POP       _ACCB
                        SUB       _ACCB, _ACCA
                        MOV       _ACCA, _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z, _ACCA
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDBLOCK 738
DDS._L0162:
DDS._L0163:
                        .LINE     739
                        .BRANCH   17,DDS.PARAMSTRONLCD
                        CALL      DDS.PARAMSTRONLCD
                        .LINE     740
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, DDS.RangeStr AND 0FFh
                        LDI       _ACCCHI, DDS.RangeStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     750
                        LDI       _ACCA, 056h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .ENDBLOCK 751
                        .BRANCH   20,DDS._L0130
                        JMP       DDS._L0130
DDS._L0152:
                        .LINE     753
                        CPI       _ACCA, 0
                        .BRANCH   3,DDS._L0168
                        BREQ      DDS._L0168
                        .BRANCH   20,DDS._L0167
                        JMP       DDS._L0167
DDS._L0168:
DDS._L0166:
                        .BLOCK    754
                        .LINE     754
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  3
                        .FRAME  0
                        CALL      SYSTEM.LCDXY_M
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     755
                        LDS       _ACCA, DDS.wave
                        MOV       DDS.I, _ACCA
                        .LINE     756
                        MOV       _ACCA, DDS.i
                        CPI       _ACCA, 005h
                        LDI       _ACCA, 0h
                        BREQ      DDS._L0169
                        BRLO      DDS._L0169
                        SER       _ACCA
DDS._L0169:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0172
                        BRNE      DDS._L0172
                        .BRANCH   20,DDS._L0170
                        JMP       DDS._L0170
DDS._L0172:
                        .BLOCK    756
                        .LINE     757
                        LDI       _ACCA, 005h
                        MOV       DDS.I, _ACCA
                        .ENDBLOCK 758
DDS._L0170:
DDS._L0171:
                        .LINE     759
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, DDS.WaveSelStrArr AND 0FFh
                        LDI       _ACCCHI, DDS.WaveSelStrArr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        MOV       _ACCA, DDS.i
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LDI       _ACCBLO, 0000Ah AND 0FFh
                        LDI       _ACCBHI, 0000Ah SHRB 8
                        CLT
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.MUL16
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LPM       _ACCBHI, Z+
                        TST       _ACCBHI
                        BREQ      DDS._L0173
                        CALL      SYSTEM.StrConst2Str
DDS._L0173:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     760
                        LDS       _ACCA, DDS.wave
                        CPI       _ACCA, 005h
                        LDI       _ACCA, 0
                        BRLO      DDS._L0174
                        LDI       _ACCA, 0FFh
DDS._L0174:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0177
                        BRNE      DDS._L0177
                        .BRANCH   20,DDS._L0175
                        JMP       DDS._L0175
DDS._L0177:
                        .BLOCK    760
                        .LINE     761
                        LDI       _ACCA, 020h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .LINE     762
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDS       _ACCA, DDS.wave
                        SUBI      _ACCA, 005h AND 0FFh
                        MOV       _ACCDLO, _ACCA
                        CALL      SYSTEM.Hex2Str8
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     763
                        LDI       _ACCA, 020h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .ENDBLOCK 764
                        .BRANCH   20,DDS._L0176
                        JMP       DDS._L0176
DDS._L0175:
                        .BLOCK    764
                        .LINE     765
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, $St_String19 AND 0FFh
                        LDI       _ACCCHI, $St_String19 SHRB 8
                        LPM       _ACCBHI, Z+
                        TST       _ACCBHI
                        BREQ      DDS._L0178
                        CALL      SYSTEM.StrConst2Str
DDS._L0178:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .ENDBLOCK 766
DDS._L0176:
                        .LINE     767
                        LDI       _ACCA, 000h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .LINE     768
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  3
                        .FRAME  0
                        CALL      SYSTEM.LCDXY_M
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     769
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, DDS.WaveStr AND 0FFh
                        LDI       _ACCCHI, DDS.WaveStr SHRB 8
                        LPM       _ACCBHI, Z+
                        TST       _ACCBHI
                        BREQ      DDS._L0179
                        CALL      SYSTEM.StrConst2Str
DDS._L0179:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .ENDBLOCK 770
                        .BRANCH   20,DDS._L0130
                        JMP       DDS._L0130
DDS._L0167:
                        .LINE     771
                        CPI       _ACCA, 5
                        .BRANCH   3,DDS._L0182
                        BREQ      DDS._L0182
                        .BRANCH   20,DDS._L0181
                        JMP       DDS._L0181
DDS._L0182:
DDS._L0180:
                        .BLOCK    772
                        .LINE     772
                        LDI       _ACCCLO, DDS.ParamStr AND 0FFh
                        LDI       _ACCCHI, DDS.ParamStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        ADIW      _ACCCLO, 1
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        LDI       _ACCA, 028h
                        ST        -Y, _ACCA
                        LDI       _ACCA, 0FEH ROLB _DEVICE
                        AND       Flags, _ACCA
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        .FRAME  3
                        LDS       _ACCA, DDS.BurstMode
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LDI       _ACCBLO, 0000Ah AND 0FFh
                        LDI       _ACCBHI, 0000Ah SHRB 8
                        SET
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.MUL16
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  5
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        LDI       _ACCA, 020h
                        ST        -Y, _ACCA
                        .FRAME  8
                        SET
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.Int2Str
                        .FRAME  3
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        LDI       _ACCA, 028h
                        PUSH      _ACCA
                        LDD       _ACCA, Y+000h
                        POP       _ACCB
                        SUB       _ACCB, _ACCA
                        MOV       _ACCA, _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z, _ACCA
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .LINE     773
                        .BRANCH   17,DDS.PARAMSTRONLCD
                        CALL      DDS.PARAMSTRONLCD
                        .LINE     774
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, DDS.BurstStr AND 0FFh
                        LDI       _ACCCHI, DDS.BurstStr SHRB 8
                        LPM       _ACCBHI, Z+
                        TST       _ACCBHI
                        BREQ      DDS._L0183
                        CALL      SYSTEM.StrConst2Str
DDS._L0183:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .ENDBLOCK 775
                        .BRANCH   20,DDS._L0130
                        JMP       DDS._L0130
DDS._L0181:
DDS._L0130:
                        .ENDBLOCK 777
DDS.SollWerteOnLCD_X:
                        .LINE     777
                        .BRANCH   19
                        RET
                        .ENDFUNC  777

                        .FUNC     Checklimits, 0030Ch, 00020h
DDS.Checklimits:
                        SBIW      _FRAMEPTR, 1
                        .BLOCK    783
                        .LINE     784
                        LDI       _ACCA, 000h
                        STD       Y+000h, _ACCA
                        .LINE     785
                        LDS       _ACCB, DDS.Frequenz
                        LDS       _ACCA, DDS.Frequenz+1
                        LDS       _ACCALO, DDS.Frequenz+2
                        LDS       _ACCAHI, DDS.Frequenz+3
                        LDI       _ACCDLO, 080h
                        EOR       _ACCAHI, _ACCDLO
                        CPI       _ACCAHI, 080h
                        BRNE      DDS._L0184
                        CPI       _ACCALO, 000h
                        BRNE      DDS._L0184
                        CPI       _ACCA, 000h
                        BRNE      DDS._L0184
                        CPI       _ACCB, 000h
DDS._L0184:
                        LDI       _ACCA, 0FFh
                        BRLO      DDS._L0185
                        CLR       _ACCA
DDS._L0185:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0188
                        BRNE      DDS._L0188
                        .BRANCH   20,DDS._L0186
                        JMP       DDS._L0186
DDS._L0188:
                        .BLOCK    785
                        .LINE     786
                        LDI       _ACCB, 000000000h AND 0FFh
                        LDI       _ACCA, 000000000h SHRB 8
                        LDI       _ACCALO, 000000000h SHRB 16
                        LDI       _ACCAHI, 000000000h SHRB 24
                        STS       DDS.FREQUENZ, _ACCB
                        STS       DDS.FREQUENZ+1, _ACCA
                        STS       DDS.FREQUENZ+2, _ACCALO
                        STS       DDS.FREQUENZ+3, _ACCAHI
                        .LINE     787
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 788
DDS._L0186:
DDS._L0187:
                        .LINE     789
                        LDS       _ACCB, DDS.Frequenz
                        LDS       _ACCA, DDS.Frequenz+1
                        LDS       _ACCALO, DDS.Frequenz+2
                        LDS       _ACCAHI, DDS.Frequenz+3
                        LDI       _ACCDLO, 080h
                        EOR       _ACCAHI, _ACCDLO
                        CPI       _ACCAHI, 080h
                        BRNE      DDS._L0189
                        CPI       _ACCALO, 098h
                        BRNE      DDS._L0189
                        CPI       _ACCA, 096h
                        BRNE      DDS._L0189
                        CPI       _ACCB, 07Fh
DDS._L0189:
                        LDI       _ACCA, 0h
                        BREQ      DDS._L0190
                        BRLO      DDS._L0190
                        SER       _ACCA
DDS._L0190:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0193
                        BRNE      DDS._L0193
                        .BRANCH   20,DDS._L0191
                        JMP       DDS._L0191
DDS._L0193:
                        .BLOCK    789
                        .LINE     790
                        LDI       _ACCB, 00098967Fh AND 0FFh
                        LDI       _ACCA, 00098967Fh SHRB 8
                        LDI       _ACCALO, 00098967Fh SHRB 16
                        LDI       _ACCAHI, 00098967Fh SHRB 24
                        STS       DDS.FREQUENZ, _ACCB
                        STS       DDS.FREQUENZ+1, _ACCA
                        STS       DDS.FREQUENZ+2, _ACCALO
                        STS       DDS.FREQUENZ+3, _ACCAHI
                        .LINE     791
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 792
DDS._L0191:
DDS._L0192:
                        .LINE     793
                        LDS       _ACCB, DDS.DACLevel
                        LDS       _ACCA, DDS.DACLevel+1
                        LDS       _ACCALO, DDS.DACLevel+2
                        LDS       _ACCAHI, DDS.DACLevel+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 000h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      DDS._L0195
                        BRPL      DDS._L0196
                        BRMI      DDS._L0194
DDS._L0196:
                        CLZ
                        CLC
                        RJMP      DDS._L0195
DDS._L0194:
                        CLZ
                        SEC
DDS._L0195:
                        LDI       _ACCA, 0FFh
                        BRLO      DDS._L0197
                        BREQ      DDS._L0197
                        CLR       _ACCA
DDS._L0197:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0200
                        BRNE      DDS._L0200
                        .BRANCH   20,DDS._L0198
                        JMP       DDS._L0198
DDS._L0200:
                        .BLOCK    793
                        .LINE     794
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 080h
                        LDI       _ACCAHI, 03Fh
                        STS       DDS.DACLEVEL, _ACCB
                        STS       DDS.DACLEVEL+1, _ACCA
                        STS       DDS.DACLEVEL+2, _ACCALO
                        STS       DDS.DACLEVEL+3, _ACCAHI
                        .LINE     795
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 796
DDS._L0198:
DDS._L0199:
                        .LINE     797
                        LDS       _ACCB, DDS.DACLevel
                        LDS       _ACCA, DDS.DACLevel+1
                        LDS       _ACCALO, DDS.DACLevel+2
                        LDS       _ACCAHI, DDS.DACLevel+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DDS.DACLevelMax
                        LDS       _ACCA, DDS.DACLevelMax+1
                        LDS       _ACCALO, DDS.DACLevelMax+2
                        LDS       _ACCAHI, DDS.DACLevelMax+3
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      DDS._L0202
                        BRPL      DDS._L0203
                        BRMI      DDS._L0201
DDS._L0203:
                        CLZ
                        CLC
                        RJMP      DDS._L0202
DDS._L0201:
                        CLZ
                        SEC
DDS._L0202:
                        LDI       _ACCA, 0h
                        BREQ      DDS._L0204
                        BRLO      DDS._L0204
                        SER       _ACCA
DDS._L0204:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0207
                        BRNE      DDS._L0207
                        .BRANCH   20,DDS._L0205
                        JMP       DDS._L0205
DDS._L0207:
                        .BLOCK    797
                        .LINE     798
                        LDS       _ACCB, DDS.DACLevelMax
                        LDS       _ACCA, DDS.DACLevelMax+1
                        LDS       _ACCALO, DDS.DACLevelMax+2
                        LDS       _ACCAHI, DDS.DACLevelMax+3
                        STS       DDS.DACLEVEL, _ACCB
                        STS       DDS.DACLEVEL+1, _ACCA
                        STS       DDS.DACLEVEL+2, _ACCALO
                        STS       DDS.DACLEVEL+3, _ACCAHI
                        .LINE     799
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 800
DDS._L0205:
DDS._L0206:
                        .LINE     801
                        LDS       _ACCB, DDS.Offset
                        LDS       _ACCA, DDS.Offset+1
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        CPI       _ACCA, 058h
                        BRNE      DDS._L0208
                        CPI       _ACCB, 0F0h
DDS._L0208:
                        LDI       _ACCA, 0FFh
                        BRLO      DDS._L0209
                        CLR       _ACCA
DDS._L0209:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0212
                        BRNE      DDS._L0212
                        .BRANCH   20,DDS._L0210
                        JMP       DDS._L0210
DDS._L0212:
                        .BLOCK    801
                        .LINE     802
                        LDI       _ACCA, 0D8F0h SHRB 8
                        LDI       _ACCB, 0D8F0h AND 0FFh
                        STS       DDS.OFFSET, _ACCB
                        STS       DDS.OFFSET+1, _ACCA
                        .LINE     803
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 804
DDS._L0210:
DDS._L0211:
                        .LINE     805
                        LDS       _ACCB, DDS.Offset
                        LDS       _ACCA, DDS.Offset+1
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        CPI       _ACCA, 0A7h
                        BRNE      DDS._L0213
                        CPI       _ACCB, 010h
DDS._L0213:
                        LDI       _ACCA, 0h
                        BREQ      DDS._L0214
                        BRLO      DDS._L0214
                        SER       _ACCA
DDS._L0214:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0217
                        BRNE      DDS._L0217
                        .BRANCH   20,DDS._L0215
                        JMP       DDS._L0215
DDS._L0217:
                        .BLOCK    805
                        .LINE     806
                        LDI       _ACCA, 02710h SHRB 8
                        LDI       _ACCB, 02710h AND 0FFh
                        STS       DDS.OFFSET, _ACCB
                        STS       DDS.OFFSET+1, _ACCA
                        .LINE     807
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 808
DDS._L0215:
DDS._L0216:
                        .LINE     809
                        LDS       _ACCB, DDS.dB
                        LDS       _ACCA, DDS.dB+1
                        LDS       _ACCALO, DDS.dB+2
                        LDS       _ACCAHI, DDS.dB+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DDS.dBMax
                        LDS       _ACCA, DDS.dBMax+1
                        LDS       _ACCALO, DDS.dBMax+2
                        LDS       _ACCAHI, DDS.dBMax+3
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      DDS._L0219
                        BRPL      DDS._L0220
                        BRMI      DDS._L0218
DDS._L0220:
                        CLZ
                        CLC
                        RJMP      DDS._L0219
DDS._L0218:
                        CLZ
                        SEC
DDS._L0219:
                        LDI       _ACCA, 0h
                        BREQ      DDS._L0221
                        BRLO      DDS._L0221
                        SER       _ACCA
DDS._L0221:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0224
                        BRNE      DDS._L0224
                        .BRANCH   20,DDS._L0222
                        JMP       DDS._L0222
DDS._L0224:
                        .BLOCK    809
                        .LINE     810
                        LDS       _ACCB, DDS.dBMax
                        LDS       _ACCA, DDS.dBMax+1
                        LDS       _ACCALO, DDS.dBMax+2
                        LDS       _ACCAHI, DDS.dBMax+3
                        STS       DDS.DB, _ACCB
                        STS       DDS.DB+1, _ACCA
                        STS       DDS.DB+2, _ACCALO
                        STS       DDS.DB+3, _ACCAHI
                        .LINE     811
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCB, DDS.db
                        LDS       _ACCA, DDS.db+1
                        LDS       _ACCALO, DDS.db+2
                        LDS       _ACCAHI, DDS.db+3
                        ST        -Y, _ACCAHI
                        ST        -Y, _ACCALO
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  4
                        .FRAME  0
                        .BRANCH   17,DDS.DB2DACLEVEL
                        CALL       DDS.DB2DACLEVEL
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        STS       DDS.DACLEVEL, _ACCB
                        STS       DDS.DACLEVEL+1, _ACCA
                        STS       DDS.DACLEVEL+2, _ACCALO
                        STS       DDS.DACLEVEL+3, _ACCAHI
                        .LINE     812
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 813
DDS._L0222:
DDS._L0223:
                        .LINE     814
                        LDS       _ACCB, DDS.dB
                        LDS       _ACCA, DDS.dB+1
                        LDS       _ACCALO, DDS.dB+2
                        LDS       _ACCAHI, DDS.dB+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 08Ch
                        LDI       _ACCAHI, 0C2h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      DDS._L0226
                        BRPL      DDS._L0227
                        BRMI      DDS._L0225
DDS._L0227:
                        CLZ
                        CLC
                        RJMP      DDS._L0226
DDS._L0225:
                        CLZ
                        SEC
DDS._L0226:
                        LDI       _ACCA, 0FFh
                        BRLO      DDS._L0228
                        CLR       _ACCA
DDS._L0228:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0231
                        BRNE      DDS._L0231
                        .BRANCH   20,DDS._L0229
                        JMP       DDS._L0229
DDS._L0231:
                        .BLOCK    814
                        .LINE     815
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 08Ch
                        LDI       _ACCAHI, 0C2h
                        STS       DDS.DB, _ACCB
                        STS       DDS.DB+1, _ACCA
                        STS       DDS.DB+2, _ACCALO
                        STS       DDS.DB+3, _ACCAHI
                        .LINE     816
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCB, DDS.db
                        LDS       _ACCA, DDS.db+1
                        LDS       _ACCALO, DDS.db+2
                        LDS       _ACCAHI, DDS.db+3
                        ST        -Y, _ACCAHI
                        ST        -Y, _ACCALO
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  4
                        .FRAME  0
                        .BRANCH   17,DDS.DB2DACLEVEL
                        CALL       DDS.DB2DACLEVEL
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        STS       DDS.DACLEVEL, _ACCB
                        STS       DDS.DACLEVEL+1, _ACCA
                        STS       DDS.DACLEVEL+2, _ACCALO
                        STS       DDS.DACLEVEL+3, _ACCAHI
                        .LINE     817
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 818
DDS._L0229:
DDS._L0230:
                        .LINE     819
                        LDS       _ACCA, DDS.Wave
                        CPI       _ACCA, 0F9h
                        LDI       _ACCA, 0h
                        BREQ      DDS._L0232
                        BRLO      DDS._L0232
                        SER       _ACCA
DDS._L0232:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0235
                        BRNE      DDS._L0235
                        .BRANCH   20,DDS._L0233
                        JMP       DDS._L0233
DDS._L0235:
                        .BLOCK    820
                        .LINE     820
                        LDI       _ACCA, 000h
                        STS       DDS.WAVE, _ACCA
                        .LINE     821
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 822
DDS._L0233:
DDS._L0234:
                        .LINE     823
                        LDS       _ACCA, DDS.TerzNum
                        CPI       _ACCA, 07Fh
                        LDI       _ACCA, 0h
                        BREQ      DDS._L0236
                        BRLO      DDS._L0236
                        SER       _ACCA
DDS._L0236:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0239
                        BRNE      DDS._L0239
                        .BRANCH   20,DDS._L0237
                        JMP       DDS._L0237
DDS._L0239:
                        .BLOCK    824
                        .LINE     824
                        LDI       _ACCA, 000h
                        STS       DDS.TERZNUM, _ACCA
                        .LINE     825
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 826
DDS._L0237:
DDS._L0238:
                        .LINE     827
                        LDS       _ACCA, DDS.TerzNum
                        CPI       _ACCA, 01Eh
                        LDI       _ACCA, 0h
                        BREQ      DDS._L0240
                        BRLO      DDS._L0240
                        SER       _ACCA
DDS._L0240:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0243
                        BRNE      DDS._L0243
                        .BRANCH   20,DDS._L0241
                        JMP       DDS._L0241
DDS._L0243:
                        .BLOCK    827
                        .LINE     828
                        LDI       _ACCA, 01Eh
                        STS       DDS.TERZNUM, _ACCA
                        .LINE     829
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 830
DDS._L0241:
DDS._L0242:
                        .LINE     831
                        LDS       _ACCA, DDS.BurstMode
                        CPI       _ACCA, 07Fh
                        LDI       _ACCA, 0h
                        BREQ      DDS._L0244
                        BRLO      DDS._L0244
                        SER       _ACCA
DDS._L0244:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0247
                        BRNE      DDS._L0247
                        .BRANCH   20,DDS._L0245
                        JMP       DDS._L0245
DDS._L0247:
                        .BLOCK    832
                        .LINE     832
                        LDI       _ACCA, 000h
                        STS       DDS.BURSTMODE, _ACCA
                        .LINE     833
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 834
DDS._L0245:
DDS._L0246:
                        .LINE     835
                        LDS       _ACCA, DDS.BurstMode
                        CPI       _ACCA, 064h
                        LDI       _ACCA, 0h
                        BREQ      DDS._L0248
                        BRLO      DDS._L0248
                        SER       _ACCA
DDS._L0248:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0251
                        BRNE      DDS._L0251
                        .BRANCH   20,DDS._L0249
                        JMP       DDS._L0249
DDS._L0251:
                        .BLOCK    835
                        .LINE     836
                        LDI       _ACCA, 064h
                        STS       DDS.BURSTMODE, _ACCA
                        .LINE     837
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 838
DDS._L0249:
DDS._L0250:
                        .LINE     839
                        LDS       _ACCA, DDS.Range
                        CPI       _ACCA, 07Fh
                        LDI       _ACCA, 0h
                        BREQ      DDS._L0252
                        BRLO      DDS._L0252
                        SER       _ACCA
DDS._L0252:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0255
                        BRNE      DDS._L0255
                        .BRANCH   20,DDS._L0253
                        JMP       DDS._L0253
DDS._L0255:
                        .BLOCK    839
                        .LINE     840
                        LDI       _ACCA, 000h
                        STS       DDS.RANGE, _ACCA
                        .LINE     841
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 842
DDS._L0253:
DDS._L0254:
                        .LINE     843
                        LDS       _ACCA, DDS.Range
                        CPI       _ACCA, 003h
                        LDI       _ACCA, 0h
                        BREQ      DDS._L0256
                        BRLO      DDS._L0256
                        SER       _ACCA
DDS._L0256:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0259
                        BRNE      DDS._L0259
                        .BRANCH   20,DDS._L0257
                        JMP       DDS._L0257
DDS._L0259:
                        .BLOCK    843
                        .LINE     844
                        LDI       _ACCA, 003h
                        STS       DDS.RANGE, _ACCA
                        .LINE     845
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 846
DDS._L0257:
DDS._L0258:
                        .LINE     848
                        LDD       _ACCA, Y+000h
                        .ENDBLOCK 849
DDS.Checklimits_X:
                        .LINE     849
                        .BRANCH   19
                        RET
                        .ENDFUNC  849

                        .FUNC     ParseGetParam, 00357h, 00020h
DDS.ParseGetParam:
                        .BLOCK    856
                        .LINE     857
                        LDI       _ACCA, 002h
                        STS       DDS.DIGITS, _ACCA
                        .LINE     858
                        LDI       _ACCA, 001h
                        STS       DDS.NACHKOMMA, _ACCA
                        .LINE     859
                        LDS       _ACCA, DDS.SubCh
                        .LINE     860
                        CPI       _ACCA, 0
                        .BRANCH   3,DDS._L0263
                        BREQ      DDS._L0263
                        .BRANCH   20,DDS._L0262
                        JMP       DDS._L0262
DDS._L0263:
DDS._L0261:
                        .BLOCK    861
                        .LINE     861
                        LDS       _ACCB, DDS.Frequenz
                        LDS       _ACCA, DDS.Frequenz+1
                        LDS       _ACCALO, DDS.Frequenz+2
                        LDS       _ACCAHI, DDS.Frequenz+3
                        STS       DDS.PARAMLONG, _ACCB
                        STS       DDS.PARAMLONG+1, _ACCA
                        STS       DDS.PARAMLONG+2, _ACCALO
                        STS       DDS.PARAMLONG+3, _ACCAHI
                        .LINE     862
                        .BRANCH   17,DDS.PARAMLONGTOSTR
                        CALL      DDS.PARAMLONGTOSTR
                        .LINE     863
                        .BRANCH   17,DDS.WRITEPARAMSTRSER
                        CALL      DDS.WRITEPARAMSTRSER
                        .LINE     864
                        .BRANCH   20,DDS.ParseGetParam_X
                        JMP       DDS.ParseGetParam_X
                        .ENDBLOCK 865
                        .BRANCH   20,DDS._L0260
                        JMP       DDS._L0260
DDS._L0262:
                        .LINE     866
                        CPI       _ACCA, 1
                        .BRANCH   3,DDS._L0266
                        BREQ      DDS._L0266
                        .BRANCH   20,DDS._L0265
                        JMP       DDS._L0265
DDS._L0266:
DDS._L0264:
                        .BLOCK    867
                        .LINE     867
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCB, DDS.DACLevel
                        LDS       _ACCA, DDS.DACLevel+1
                        LDS       _ACCALO, DDS.DACLevel+2
                        LDS       _ACCAHI, DDS.DACLevel+3
                        ST        -Y, _ACCAHI
                        ST        -Y, _ACCALO
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  4
                        .FRAME  0
                        .BRANCH   17,DDS.DACLEVEL2RMS
                        CALL       DDS.DACLEVEL2RMS
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        STS       DDS.PARAM, _ACCB
                        STS       DDS.PARAM+1, _ACCA
                        STS       DDS.PARAM+2, _ACCALO
                        STS       DDS.PARAM+3, _ACCAHI
                        .LINE     868
                        .BRANCH   17,DDS.PARAMTOSTR
                        CALL      DDS.PARAMTOSTR
                        .LINE     869
                        .BRANCH   17,DDS.WRITEPARAMSTRSER
                        CALL      DDS.WRITEPARAMSTRSER
                        .LINE     870
                        .BRANCH   20,DDS.ParseGetParam_X
                        JMP       DDS.ParseGetParam_X
                        .ENDBLOCK 871
                        .BRANCH   20,DDS._L0260
                        JMP       DDS._L0260
DDS._L0265:
                        .LINE     872
                        CPI       _ACCA, 2
                        .BRANCH   3,DDS._L0269
                        BREQ      DDS._L0269
                        .BRANCH   20,DDS._L0268
                        JMP       DDS._L0268
DDS._L0269:
DDS._L0267:
                        .BLOCK    873
                        .LINE     873
                        LDS       _ACCB, DDS.DACLevel
                        LDS       _ACCA, DDS.DACLevel+1
                        LDS       _ACCALO, DDS.DACLevel+2
                        LDS       _ACCAHI, DDS.DACLevel+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DDS.PwrGain
                        LDS       _ACCA, DDS.PwrGain+1
                        LDS       _ACCALO, DDS.PwrGain+2
                        LDS       _ACCAHI, DDS.PwrGain+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        POP       _ACCEHI
                        POP       _ACCELO
                        POP       _ACCDHI
                        POP       _ACCDLO
                        LDI       _ACCBLO, 0F3h
                        LDI       _ACCBHI, 004h
                        LDI       _ACCCLO, 035h
                        LDI       _ACCCHI, 040h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat_R
                        STS       DDS.PARAM, _ACCB
                        STS       DDS.PARAM+1, _ACCA
                        STS       DDS.PARAM+2, _ACCALO
                        STS       DDS.PARAM+3, _ACCAHI
                        .LINE     874
                        .BRANCH   17,DDS.PARAMTOSTR
                        CALL      DDS.PARAMTOSTR
                        .LINE     875
                        .BRANCH   17,DDS.WRITEPARAMSTRSER
                        CALL      DDS.WRITEPARAMSTRSER
                        .LINE     876
                        .BRANCH   20,DDS.ParseGetParam_X
                        JMP       DDS.ParseGetParam_X
                        .ENDBLOCK 877
                        .BRANCH   20,DDS._L0260
                        JMP       DDS._L0260
DDS._L0268:
                        .LINE     879
                        CPI       _ACCA, 3
                        .BRANCH   3,DDS._L0272
                        BREQ      DDS._L0272
                        .BRANCH   20,DDS._L0271
                        JMP       DDS._L0271
DDS._L0272:
DDS._L0270:
                        .BLOCK    880
                        .LINE     880
                        LDI       _ACCA, 002h
                        STS       DDS.NACHKOMMA, _ACCA
                        .LINE     881
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCB, DDS.DACLevel
                        LDS       _ACCA, DDS.DACLevel+1
                        LDS       _ACCALO, DDS.DACLevel+2
                        LDS       _ACCAHI, DDS.DACLevel+3
                        ST        -Y, _ACCAHI
                        ST        -Y, _ACCALO
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  4
                        .FRAME  0
                        .BRANCH   17,DDS.DACLEVEL2DB
                        CALL       DDS.DACLEVEL2DB
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        STS       DDS.DB, _ACCB
                        STS       DDS.DB+1, _ACCA
                        STS       DDS.DB+2, _ACCALO
                        STS       DDS.DB+3, _ACCAHI
                        .LINE     882
                        LDS       _ACCB, DDS.db
                        LDS       _ACCA, DDS.db+1
                        LDS       _ACCALO, DDS.db+2
                        LDS       _ACCAHI, DDS.db+3
                        STS       DDS.PARAM, _ACCB
                        STS       DDS.PARAM+1, _ACCA
                        STS       DDS.PARAM+2, _ACCALO
                        STS       DDS.PARAM+3, _ACCAHI
                        .ENDBLOCK 883
                        .BRANCH   20,DDS._L0260
                        JMP       DDS._L0260
DDS._L0271:
                        .LINE     884
                        CPI       _ACCA, 4
                        .BRANCH   3,DDS._L0275
                        BREQ      DDS._L0275
                        .BRANCH   20,DDS._L0274
                        JMP       DDS._L0274
DDS._L0275:
DDS._L0273:
                        .BLOCK    885
                        .LINE     885
                        LDS       _ACCA, DDS.wave
                        STS       DDS.PARAMBYTE, _ACCA
                        .LINE     886
                        .BRANCH   17,DDS.WRITEPARAMBYTESER
                        CALL      DDS.WRITEPARAMBYTESER
                        .LINE     887
                        .BRANCH   20,DDS.ParseGetParam_X
                        JMP       DDS.ParseGetParam_X
                        .ENDBLOCK 888
                        .BRANCH   20,DDS._L0260
                        JMP       DDS._L0260
DDS._L0274:
                        .LINE     889
                        CPI       _ACCA, 5
                        .BRANCH   3,DDS._L0278
                        BREQ      DDS._L0278
                        .BRANCH   20,DDS._L0277
                        JMP       DDS._L0277
DDS._L0278:
DDS._L0276:
                        .BLOCK    890
                        .LINE     890
                        LDS       _ACCA, DDS.BurstMode
                        STS       DDS.PARAMBYTE, _ACCA
                        .LINE     891
                        .BRANCH   17,DDS.WRITEPARAMBYTESER
                        CALL      DDS.WRITEPARAMBYTESER
                        .LINE     892
                        .BRANCH   20,DDS.ParseGetParam_X
                        JMP       DDS.ParseGetParam_X
                        .ENDBLOCK 893
                        .BRANCH   20,DDS._L0260
                        JMP       DDS._L0260
DDS._L0277:
                        .LINE     894
                        CPI       _ACCA, 10
                        .BRANCH   3,DDS._L0281
                        BREQ      DDS._L0281
                        .BRANCH   20,DDS._L0280
                        JMP       DDS._L0280
DDS._L0281:
                        .BRANCH   20,DDS._L0279
                        JMP       DDS._L0279
DDS._L0280:
                        CPI       _ACCA, 99
                        .BRANCH   3,DDS._L0283
                        BREQ      DDS._L0283
                        .BRANCH   20,DDS._L0282
                        JMP       DDS._L0282
DDS._L0283:
DDS._L0279:
                        .BLOCK    896
                        .LINE     896
                        LDI       _ACCA, 003h
                        .FRAME  0
                        CALL       SYSTEM.GETADC
                        STS       DDS.PARAMINT, _ACCB
                        STS       DDS.PARAMINT+1, _ACCA
                        .LINE     897
                        LDS       _ACCB, DDS.ParamInt
                        LDS       _ACCA, DDS.ParamInt+1
                        SBRS      _ACCA, 7
                        RJMP      DDS._L0284
                        LDI       _ACCAHI, 0FFh
                        LDI       _ACCALO, 0FFh
                        RJMP      DDS._L0285
DDS._L0284:
                        CLR       _ACCAHI
                        CLR       _ACCALO
DDS._L0285:
                        SET
                        BLD       Flags, _SIGN
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.LIntToFloat
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DDS.InpGainFac
                        LDS       _ACCA, DDS.InpGainFac+1
                        LDS       _ACCALO, DDS.InpGainFac+2
                        LDS       _ACCAHI, DDS.InpGainFac+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        STS       DDS.PARAM, _ACCB
                        STS       DDS.PARAM+1, _ACCA
                        STS       DDS.PARAM+2, _ACCALO
                        STS       DDS.PARAM+3, _ACCAHI
                        .LINE     898
                        LDS       _ACCA, 0036Bh
                        CBR       _ACCA, 020h
                        STS       0036Bh, _ACCA
                        .LINE     899
                        LDS       _ACCB, DDS.ParamInt
                        LDS       _ACCA, DDS.ParamInt+1
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        CPI       _ACCA, 083h
                        BRNE      DDS._L0286
                        CPI       _ACCB, 0FCh
DDS._L0286:
                        LDI       _ACCA, 0h
                        BREQ      DDS._L0287
                        BRLO      DDS._L0287
                        SER       _ACCA
DDS._L0287:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0290
                        BRNE      DDS._L0290
                        .BRANCH   20,DDS._L0288
                        JMP       DDS._L0288
DDS._L0290:
                        .BLOCK    899
                        .LINE     900
                        LDS       _ACCA, 0036Bh
                        SBR       _ACCA, 020h
                        STS       0036Bh, _ACCA
                        .LINE     901
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 03Ch
                        LDI       _ACCALO, 01Ch
                        LDI       _ACCAHI, 0C6h
                        STS       DDS.PARAM, _ACCB
                        STS       DDS.PARAM+1, _ACCA
                        STS       DDS.PARAM+2, _ACCALO
                        STS       DDS.PARAM+3, _ACCAHI
                        .ENDBLOCK 902
DDS._L0288:
DDS._L0289:
                        .ENDBLOCK 906
                        .BRANCH   20,DDS._L0260
                        JMP       DDS._L0260
DDS._L0282:
                        .LINE     907
                        CPI       _ACCA, 11
                        .BRANCH   3,DDS._L0293
                        BREQ      DDS._L0293
                        .BRANCH   20,DDS._L0292
                        JMP       DDS._L0292
DDS._L0293:
DDS._L0291:
                        .BLOCK    909
                        .LINE     909
                        LDI       _ACCA, 004h
                        .FRAME  0
                        CALL       SYSTEM.GETADC
                        STS       DDS.PARAMINT, _ACCB
                        STS       DDS.PARAMINT+1, _ACCA
                        .LINE     910
                        LDS       _ACCB, DDS.ParamInt
                        LDS       _ACCA, DDS.ParamInt+1
                        SBRS      _ACCA, 7
                        RJMP      DDS._L0294
                        LDI       _ACCAHI, 0FFh
                        LDI       _ACCALO, 0FFh
                        RJMP      DDS._L0295
DDS._L0294:
                        CLR       _ACCAHI
                        CLR       _ACCALO
DDS._L0295:
                        SET
                        BLD       Flags, _SIGN
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.LIntToFloat
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DDS.InpGainFac
                        LDS       _ACCA, DDS.InpGainFac+1
                        LDS       _ACCALO, DDS.InpGainFac+2
                        LDS       _ACCAHI, DDS.InpGainFac+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        POP       _ACCEHI
                        POP       _ACCELO
                        POP       _ACCDHI
                        POP       _ACCDLO
                        LDI       _ACCBLO, 081h
                        LDI       _ACCBHI, 004h
                        LDI       _ACCCLO, 035h
                        LDI       _ACCCHI, 040h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat_R
                        STS       DDS.PARAM, _ACCB
                        STS       DDS.PARAM+1, _ACCA
                        STS       DDS.PARAM+2, _ACCALO
                        STS       DDS.PARAM+3, _ACCAHI
                        .LINE     911
                        LDS       _ACCA, 0036Bh
                        CBR       _ACCA, 020h
                        STS       0036Bh, _ACCA
                        .LINE     912
                        LDS       _ACCB, DDS.ParamInt
                        LDS       _ACCA, DDS.ParamInt+1
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        CPI       _ACCA, 083h
                        BRNE      DDS._L0296
                        CPI       _ACCB, 0FCh
DDS._L0296:
                        LDI       _ACCA, 0h
                        BREQ      DDS._L0297
                        BRLO      DDS._L0297
                        SER       _ACCA
DDS._L0297:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0300
                        BRNE      DDS._L0300
                        .BRANCH   20,DDS._L0298
                        JMP       DDS._L0298
DDS._L0300:
                        .BLOCK    912
                        .LINE     913
                        LDS       _ACCA, 0036Bh
                        SBR       _ACCA, 020h
                        STS       0036Bh, _ACCA
                        .LINE     914
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 03Ch
                        LDI       _ACCALO, 01Ch
                        LDI       _ACCAHI, 0C6h
                        STS       DDS.PARAM, _ACCB
                        STS       DDS.PARAM+1, _ACCA
                        STS       DDS.PARAM+2, _ACCALO
                        STS       DDS.PARAM+3, _ACCAHI
                        .ENDBLOCK 915
DDS._L0298:
DDS._L0299:
                        .ENDBLOCK 919
                        .BRANCH   20,DDS._L0260
                        JMP       DDS._L0260
DDS._L0292:
                        .LINE     920
                        CPI       _ACCA, 12
                        .BRANCH   3,DDS._L0303
                        BREQ      DDS._L0303
                        .BRANCH   20,DDS._L0302
                        JMP       DDS._L0302
DDS._L0303:
DDS._L0301:
                        .BLOCK    921
                        .LINE     921
                        LDI       _ACCA, 002h
                        STS       DDS.NACHKOMMA, _ACCA
                        .LINE     923
                        LDI       _ACCA, 003h
                        .FRAME  0
                        CALL       SYSTEM.GETADC
                        STS       DDS.PARAMINT, _ACCB
                        STS       DDS.PARAMINT+1, _ACCA
                        .LINE     924
                        LDS       _ACCB, DDS.ParamInt
                        LDS       _ACCA, DDS.ParamInt+1
                        SBRS      _ACCA, 7
                        RJMP      DDS._L0304
                        LDI       _ACCAHI, 0FFh
                        LDI       _ACCALO, 0FFh
                        RJMP      DDS._L0305
DDS._L0304:
                        CLR       _ACCAHI
                        CLR       _ACCALO
DDS._L0305:
                        SET
                        BLD       Flags, _SIGN
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.LIntToFloat
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DDS.InpGainFac
                        LDS       _ACCA, DDS.InpGainFac+1
                        LDS       _ACCALO, DDS.InpGainFac+2
                        LDS       _ACCAHI, DDS.InpGainFac+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        STS       DDS.PARAM, _ACCB
                        STS       DDS.PARAM+1, _ACCA
                        STS       DDS.PARAM+2, _ACCALO
                        STS       DDS.PARAM+3, _ACCAHI
                        .LINE     925
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCB, DDS.Param
                        LDS       _ACCA, DDS.Param+1
                        LDS       _ACCALO, DDS.Param+2
                        LDS       _ACCAHI, DDS.Param+3
                        ST        -Y, _ACCAHI
                        ST        -Y, _ACCALO
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  4
                        .FRAME  0
                        .BRANCH   17,DDS.LEVEL2DB
                        CALL       DDS.LEVEL2DB
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        STS       DDS.PARAM, _ACCB
                        STS       DDS.PARAM+1, _ACCA
                        STS       DDS.PARAM+2, _ACCALO
                        STS       DDS.PARAM+3, _ACCAHI
                        .LINE     926
                        LDS       _ACCA, 0036Bh
                        CBR       _ACCA, 020h
                        STS       0036Bh, _ACCA
                        .LINE     927
                        LDS       _ACCB, DDS.ParamInt
                        LDS       _ACCA, DDS.ParamInt+1
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        CPI       _ACCA, 083h
                        BRNE      DDS._L0306
                        CPI       _ACCB, 0FCh
DDS._L0306:
                        LDI       _ACCA, 0h
                        BREQ      DDS._L0307
                        BRLO      DDS._L0307
                        SER       _ACCA
DDS._L0307:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0310
                        BRNE      DDS._L0310
                        .BRANCH   20,DDS._L0308
                        JMP       DDS._L0308
DDS._L0310:
                        .BLOCK    927
                        .LINE     928
                        LDS       _ACCA, 0036Bh
                        SBR       _ACCA, 020h
                        STS       0036Bh, _ACCA
                        .LINE     929
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 03Ch
                        LDI       _ACCALO, 01Ch
                        LDI       _ACCAHI, 0C6h
                        STS       DDS.PARAM, _ACCB
                        STS       DDS.PARAM+1, _ACCA
                        STS       DDS.PARAM+2, _ACCALO
                        STS       DDS.PARAM+3, _ACCAHI
                        .ENDBLOCK 930
DDS._L0308:
DDS._L0309:
                        .ENDBLOCK 934
                        .BRANCH   20,DDS._L0260
                        JMP       DDS._L0260
DDS._L0302:
                        .LINE     935
                        CPI       _ACCA, 19
                        .BRANCH   3,DDS._L0313
                        BREQ      DDS._L0313
                        .BRANCH   20,DDS._L0312
                        JMP       DDS._L0312
DDS._L0313:
DDS._L0311:
                        .BLOCK    936
                        .LINE     936
                        LDS       _ACCA, DDS.Range
                        STS       DDS.PARAMBYTE, _ACCA
                        .LINE     937
                        .BRANCH   17,DDS.WRITEPARAMBYTESER
                        CALL      DDS.WRITEPARAMBYTESER
                        .LINE     938
                        .BRANCH   20,DDS.ParseGetParam_X
                        JMP       DDS.ParseGetParam_X
                        .ENDBLOCK 939
                        .BRANCH   20,DDS._L0260
                        JMP       DDS._L0260
DDS._L0312:
                        .LINE     940
                        CPI       _ACCA, 20
                        .BRANCH   3,DDS._L0316
                        BREQ      DDS._L0316
                        .BRANCH   20,DDS._L0315
                        JMP       DDS._L0315
DDS._L0316:
DDS._L0314:
                        .BLOCK    941
                        .LINE     941
                        LDI       _ACCA, 004h
                        STS       DDS.NACHKOMMA, _ACCA
                        .LINE     942
                        .BRANCH   17,DDS.OFFSETTOPARAM
                        CALL      DDS.OFFSETTOPARAM
                        .ENDBLOCK 943
                        .BRANCH   20,DDS._L0260
                        JMP       DDS._L0260
DDS._L0315:
                        .LINE     944
                        CPI       _ACCA, 80
                        .BRANCH   3,DDS._L0319
                        BREQ      DDS._L0319
                        .BRANCH   20,DDS._L0318
                        JMP       DDS._L0318
DDS._L0319:
DDS._L0317:
                        .BLOCK    945
                        .LINE     945
                        LDS       _ACCA, DDS.Modify
                        STS       DDS.PARAMBYTE, _ACCA
                        .LINE     946
                        .BRANCH   17,DDS.WRITEPARAMBYTESER
                        CALL      DDS.WRITEPARAMBYTESER
                        .LINE     947
                        .BRANCH   20,DDS.ParseGetParam_X
                        JMP       DDS.ParseGetParam_X
                        .ENDBLOCK 948
                        .BRANCH   20,DDS._L0260
                        JMP       DDS._L0260
DDS._L0318:
                        .LINE     949
                        CPI       _ACCA, 89
                        .BRANCH   3,DDS._L0322
                        BREQ      DDS._L0322
                        .BRANCH   20,DDS._L0321
                        JMP       DDS._L0321
DDS._L0322:
DDS._L0320:
                        .BLOCK    950
                        .LINE     950
                        LDS       _ACCB, DDS.IncRast
                        LDS       _ACCA, DDS.IncRast+1
                        MOV       _ACCA, _ACCB
                        STS       DDS.PARAMBYTE, _ACCA
                        .LINE     951
                        .BRANCH   17,DDS.WRITEPARAMBYTESER
                        CALL      DDS.WRITEPARAMBYTESER
                        .LINE     952
                        .BRANCH   20,DDS.ParseGetParam_X
                        JMP       DDS.ParseGetParam_X
                        .ENDBLOCK 953
                        .BRANCH   20,DDS._L0260
                        JMP       DDS._L0260
DDS._L0321:
                        .LINE     954
                        CPI       _ACCA, 150
                        .BRANCH   3,DDS._L0325
                        BREQ      DDS._L0325
                        .BRANCH   20,DDS._L0324
                        JMP       DDS._L0324
DDS._L0325:
DDS._L0323:
                        .BLOCK    955
                        .LINE     955
                        LDI       _ACCA, 001h
                        STS       DDS.NACHKOMMA, _ACCA
                        .LINE     956
                        LDI       _ACCCLO, DDS.InitFrequenz AND 0FFh
                        LDI       _ACCCHI, DDS.InitFrequenz SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        CLT
                        BLD       Flags, _ERRFLAG
                        SET
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.LIntToFloat
                        MOVW      _ACCDLO, _ACCB
                        MOVW      _ACCELO, _ACCALO
                        LDI       _ACCBLO, 000h
                        LDI       _ACCBHI, 000h
                        LDI       _ACCCLO, 020h
                        LDI       _ACCCHI, 041h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat_R
                        STS       DDS.PARAM, _ACCB
                        STS       DDS.PARAM+1, _ACCA
                        STS       DDS.PARAM+2, _ACCALO
                        STS       DDS.PARAM+3, _ACCAHI
                        .ENDBLOCK 957
                        .BRANCH   20,DDS._L0260
                        JMP       DDS._L0260
DDS._L0324:
                        .LINE     958
                        CPI       _ACCA, 151
                        .BRANCH   3,DDS._L0328
                        BREQ      DDS._L0328
                        .BRANCH   20,DDS._L0327
                        JMP       DDS._L0327
DDS._L0328:
DDS._L0326:
                        .BLOCK    959
                        .LINE     959
                        LDI       _ACCA, 001h
                        STS       DDS.NACHKOMMA, _ACCA
                        .LINE     960
                        LDI       _ACCCLO, DDS.InitLevel AND 0FFh
                        LDI       _ACCCHI, DDS.InitLevel SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        STS       DDS.PARAM, _ACCB
                        STS       DDS.PARAM+1, _ACCA
                        STS       DDS.PARAM+2, _ACCALO
                        STS       DDS.PARAM+3, _ACCAHI
                        .ENDBLOCK 961
                        .BRANCH   20,DDS._L0260
                        JMP       DDS._L0260
DDS._L0327:
                        .LINE     962
                        CPI       _ACCA, 152
                        .BRANCH   3,DDS._L0331
                        BREQ      DDS._L0331
                        .BRANCH   20,DDS._L0330
                        JMP       DDS._L0330
DDS._L0331:
DDS._L0329:
                        .BLOCK    963
                        .LINE     963
                        LDI       _ACCA, 001h
                        STS       DDS.NACHKOMMA, _ACCA
                        .LINE     964
                        LDI       _ACCCLO, DDS.InitLogicLevel AND 0FFh
                        LDI       _ACCCHI, DDS.InitLogicLevel SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        STS       DDS.PARAM, _ACCB
                        STS       DDS.PARAM+1, _ACCA
                        STS       DDS.PARAM+2, _ACCALO
                        STS       DDS.PARAM+3, _ACCAHI
                        .ENDBLOCK 965
                        .BRANCH   20,DDS._L0260
                        JMP       DDS._L0260
DDS._L0330:
                        .LINE     966
                        CPI       _ACCA, 153
                        .BRANCH   3,DDS._L0334
                        BREQ      DDS._L0334
                        .BRANCH   20,DDS._L0333
                        JMP       DDS._L0333
DDS._L0334:
DDS._L0332:
                        .BLOCK    967
                        .LINE     967
                        LDI       _ACCA, 002h
                        STS       DDS.NACHKOMMA, _ACCA
                        .LINE     968
                        LDI       _ACCCLO, DDS.InitdB AND 0FFh
                        LDI       _ACCCHI, DDS.InitdB SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        STS       DDS.PARAM, _ACCB
                        STS       DDS.PARAM+1, _ACCA
                        STS       DDS.PARAM+2, _ACCALO
                        STS       DDS.PARAM+3, _ACCAHI
                        .ENDBLOCK 969
                        .BRANCH   20,DDS._L0260
                        JMP       DDS._L0260
DDS._L0333:
                        .LINE     970
                        CPI       _ACCA, 154
                        .BRANCH   3,DDS._L0337
                        BREQ      DDS._L0337
                        .BRANCH   20,DDS._L0336
                        JMP       DDS._L0336
DDS._L0337:
DDS._L0335:
                        .BLOCK    971
                        .LINE     971
                        LDI       _ACCCLO, DDS.InitWave AND 0FFh
                        LDI       _ACCCHI, DDS.InitWave SHRB 8
                        CALL      SYSTEM.ReadEEp8
                        STS       DDS.PARAMBYTE, _ACCA
                        .LINE     972
                        .BRANCH   17,DDS.WRITEPARAMBYTESER
                        CALL      DDS.WRITEPARAMBYTESER
                        .LINE     973
                        .BRANCH   20,DDS.ParseGetParam_X
                        JMP       DDS.ParseGetParam_X
                        .ENDBLOCK 974
                        .BRANCH   20,DDS._L0260
                        JMP       DDS._L0260
DDS._L0336:
                        .LINE     975
                        CPI       _ACCA, 155
                        .BRANCH   3,DDS._L0340
                        BREQ      DDS._L0340
                        .BRANCH   20,DDS._L0339
                        JMP       DDS._L0339
DDS._L0340:
DDS._L0338:
                        .BLOCK    976
                        .LINE     976
                        LDI       _ACCCLO, DDS.InitBurst AND 0FFh
                        LDI       _ACCCHI, DDS.InitBurst SHRB 8
                        CALL      SYSTEM.ReadEEp8
                        STS       DDS.PARAMBYTE, _ACCA
                        .LINE     977
                        .BRANCH   17,DDS.WRITEPARAMBYTESER
                        CALL      DDS.WRITEPARAMBYTESER
                        .LINE     978
                        .BRANCH   20,DDS.ParseGetParam_X
                        JMP       DDS.ParseGetParam_X
                        .ENDBLOCK 979
                        .BRANCH   20,DDS._L0260
                        JMP       DDS._L0260
DDS._L0339:
                        .LINE     980
                        CPI       _ACCA, 170
                        .BRANCH   3,DDS._L0343
                        BREQ      DDS._L0343
                        .BRANCH   20,DDS._L0342
                        JMP       DDS._L0342
DDS._L0343:
DDS._L0341:
                        .BLOCK    981
                        .LINE     981
                        LDI       _ACCA, 004h
                        STS       DDS.NACHKOMMA, _ACCA
                        .LINE     982
                        LDI       _ACCCLO, DDS.InitOffset AND 0FFh
                        LDI       _ACCCHI, DDS.InitOffset SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        STS       DDS.PARAM, _ACCB
                        STS       DDS.PARAM+1, _ACCA
                        STS       DDS.PARAM+2, _ACCALO
                        STS       DDS.PARAM+3, _ACCAHI
                        .ENDBLOCK 983
                        .BRANCH   20,DDS._L0260
                        JMP       DDS._L0260
DDS._L0342:
                        .LINE     984
                        CPI       _ACCA, 200
                        .BRANCH   3,DDS._L0346
                        BREQ      DDS._L0346
                        .BRANCH   20,DDS._L0345
                        JMP       DDS._L0345
DDS._L0346:
DDS._L0344:
                        .BLOCK    985
                        .LINE     985
                        LDI       _ACCA, 004h
                        STS       DDS.NACHKOMMA, _ACCA
                        .LINE     986
                        LDI       _ACCCLO, DDS.LevelScaleLow AND 0FFh
                        LDI       _ACCCHI, DDS.LevelScaleLow SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        STS       DDS.PARAM, _ACCB
                        STS       DDS.PARAM+1, _ACCA
                        STS       DDS.PARAM+2, _ACCALO
                        STS       DDS.PARAM+3, _ACCAHI
                        .ENDBLOCK 987
                        .BRANCH   20,DDS._L0260
                        JMP       DDS._L0260
DDS._L0345:
                        .LINE     988
                        CPI       _ACCA, 201
                        .BRANCH   3,DDS._L0349
                        BREQ      DDS._L0349
                        .BRANCH   20,DDS._L0348
                        JMP       DDS._L0348
DDS._L0349:
DDS._L0347:
                        .BLOCK    989
                        .LINE     989
                        LDI       _ACCA, 004h
                        STS       DDS.NACHKOMMA, _ACCA
                        .LINE     990
                        LDI       _ACCCLO, DDS.LevelScaleHi AND 0FFh
                        LDI       _ACCCHI, DDS.LevelScaleHi SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        STS       DDS.PARAM, _ACCB
                        STS       DDS.PARAM+1, _ACCA
                        STS       DDS.PARAM+2, _ACCALO
                        STS       DDS.PARAM+3, _ACCAHI
                        .ENDBLOCK 991
                        .BRANCH   20,DDS._L0260
                        JMP       DDS._L0260
DDS._L0348:
                        .LINE     992
                        CPI       _ACCA, 202
                        .BRANCH   3,DDS._L0352
                        BREQ      DDS._L0352
                        .BRANCH   20,DDS._L0351
                        JMP       DDS._L0351
DDS._L0352:
DDS._L0350:
                        .BLOCK    993
                        .LINE     993
                        LDI       _ACCA, 004h
                        STS       DDS.NACHKOMMA, _ACCA
                        .LINE     994
                        LDS       _ACCB, DDS.PwrGain
                        LDS       _ACCA, DDS.PwrGain+1
                        LDS       _ACCALO, DDS.PwrGain+2
                        LDS       _ACCAHI, DDS.PwrGain+3
                        STS       DDS.PARAM, _ACCB
                        STS       DDS.PARAM+1, _ACCA
                        STS       DDS.PARAM+2, _ACCALO
                        STS       DDS.PARAM+3, _ACCAHI
                        .ENDBLOCK 995
                        .BRANCH   20,DDS._L0260
                        JMP       DDS._L0260
DDS._L0351:
                        .LINE     996
                        CPI       _ACCA, 203
                        .BRANCH   3,DDS._L0355
                        BREQ      DDS._L0355
                        .BRANCH   20,DDS._L0354
                        JMP       DDS._L0354
DDS._L0355:
DDS._L0353:
                        .BLOCK    997
                        .LINE     997
                        LDI       _ACCA, 004h
                        STS       DDS.NACHKOMMA, _ACCA
                        .LINE     998
                        LDS       _ACCB, DDS.AttnFac
                        LDS       _ACCA, DDS.AttnFac+1
                        LDS       _ACCALO, DDS.AttnFac+2
                        LDS       _ACCAHI, DDS.AttnFac+3
                        STS       DDS.PARAM, _ACCB
                        STS       DDS.PARAM+1, _ACCA
                        STS       DDS.PARAM+2, _ACCALO
                        STS       DDS.PARAM+3, _ACCAHI
                        .ENDBLOCK 999
                        .BRANCH   20,DDS._L0260
                        JMP       DDS._L0260
DDS._L0354:
                        .LINE     1000
                        CPI       _ACCA, 210
                        .BRANCH   2,DDS._L0358
                        BRCC      DDS._L0358
                        .BRANCH   20,DDS._L0357
                        JMP       DDS._L0357
DDS._L0358:
                        CPI       _ACCA, 213
                        .BRANCH   3,DDS._L0359
                        BREQ      DDS._L0359
                        .BRANCH   1,DDS._L0357
                        BRCS      DDS._L0359
                        .BRANCH   20,DDS._L0357
                        JMP       DDS._L0357
DDS._L0359:
DDS._L0356:
                        .BLOCK    1001
                        .LINE     1001
                        LDI       _ACCA, 004h
                        STS       DDS.NACHKOMMA, _ACCA
                        .LINE     1002
                        LDI       _ACCCLO, DDS.ADCscales AND 0FFh
                        LDI       _ACCCHI, DDS.ADCscales SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DDS.SubCh
                        SUBI      _ACCA, 0D2h AND 0FFh
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        CALL      SYSTEM._ReadEEp32
                        STS       DDS.PARAM, _ACCB
                        STS       DDS.PARAM+1, _ACCA
                        STS       DDS.PARAM+2, _ACCALO
                        STS       DDS.PARAM+3, _ACCAHI
                        .ENDBLOCK 1003
                        .BRANCH   20,DDS._L0260
                        JMP       DDS._L0260
DDS._L0357:
                        .LINE     1004
                        CPI       _ACCA, 251
                        .BRANCH   3,DDS._L0362
                        BREQ      DDS._L0362
                        .BRANCH   20,DDS._L0361
                        JMP       DDS._L0361
DDS._L0362:
DDS._L0360:
                        .BLOCK    1005
                        .LINE     1005
                        LDS       _ACCB, DDS.Errcount
                        LDS       _ACCA, DDS.Errcount+1
                        SBRS      _ACCA, 7
                        RJMP      DDS._L0363
                        LDI       _ACCAHI, 0FFh
                        LDI       _ACCALO, 0FFh
                        RJMP      DDS._L0364
DDS._L0363:
                        CLR       _ACCAHI
                        CLR       _ACCALO
DDS._L0364:
                        SET
                        BLD       Flags, _SIGN
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.LIntToFloat
                        STS       DDS.PARAM, _ACCB
                        STS       DDS.PARAM+1, _ACCA
                        STS       DDS.PARAM+2, _ACCALO
                        STS       DDS.PARAM+3, _ACCAHI
                        .ENDBLOCK 1006
                        .BRANCH   20,DDS._L0260
                        JMP       DDS._L0260
DDS._L0361:
                        .LINE     1007
                        CPI       _ACCA, 252
                        .BRANCH   3,DDS._L0367
                        BREQ      DDS._L0367
                        .BRANCH   20,DDS._L0366
                        JMP       DDS._L0366
DDS._L0367:
DDS._L0365:
                        .BLOCK    1008
                        .LINE     1008
                        LDI       _ACCCLO, DDS.EESerBaudReg AND 0FFh
                        LDI       _ACCCHI, DDS.EESerBaudReg SHRB 8
                        CALL      SYSTEM.ReadEEp8
                        STS       DDS.PARAMBYTE, _ACCA
                        .LINE     1009
                        .BRANCH   17,DDS.WRITEPARAMBYTESER
                        CALL      DDS.WRITEPARAMBYTESER
                        .LINE     1010
                        .BRANCH   20,DDS.ParseGetParam_X
                        JMP       DDS.ParseGetParam_X
                        .ENDBLOCK 1011
                        .BRANCH   20,DDS._L0260
                        JMP       DDS._L0260
DDS._L0366:
                        .LINE     1012
                        CPI       _ACCA, 253
                        .BRANCH   3,DDS._L0370
                        BREQ      DDS._L0370
                        .BRANCH   20,DDS._L0369
                        JMP       DDS._L0369
DDS._L0370:
DDS._L0368:
                        .BLOCK    1013
                        .LINE     1013
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.Serout SHRB 1
                        LDI       _ACCA, SYSTEM.Serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, DDS.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DDS.SerInpStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     1014
                        .BRANCH   17,DDS.SERCRLF
                        CALL      DDS.SERCRLF
                        .LINE     1015
                        .BRANCH   20,DDS.ParseGetParam_X
                        JMP       DDS.ParseGetParam_X
                        .ENDBLOCK 1016
                        .BRANCH   20,DDS._L0260
                        JMP       DDS._L0260
DDS._L0369:
                        .LINE     1017
                        CPI       _ACCA, 254
                        .BRANCH   3,DDS._L0373
                        BREQ      DDS._L0373
                        .BRANCH   20,DDS._L0372
                        JMP       DDS._L0372
DDS._L0373:
DDS._L0371:
                        .BLOCK    1018
                        .LINE     1018
                        .BRANCH   17,DDS.WRITECHPREFIX
                        CALL      DDS.WRITECHPREFIX
                        .LINE     1019
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.serout SHRB 1
                        LDI       _ACCA, SYSTEM.serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, DDS.Vers1Str AND 0FFh
                        LDI       _ACCCHI, DDS.Vers1Str SHRB 8
                        LPM       _ACCBHI, Z+
                        TST       _ACCBHI
                        BREQ      DDS._L0374
                        CALL      SYSTEM.StrConst2Str
DDS._L0374:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     1020
                        .BRANCH   17,DDS.SERCRLF
                        CALL      DDS.SERCRLF
                        .LINE     1021
                        .BRANCH   20,DDS.ParseGetParam_X
                        JMP       DDS.ParseGetParam_X
                        .ENDBLOCK 1022
                        .BRANCH   20,DDS._L0260
                        JMP       DDS._L0260
DDS._L0372:
                        .LINE     1023
                        CPI       _ACCA, 250
                        .BRANCH   3,DDS._L0377
                        BREQ      DDS._L0377
                        .BRANCH   20,DDS._L0376
                        JMP       DDS._L0376
DDS._L0377:
                        .BRANCH   20,DDS._L0375
                        JMP       DDS._L0375
DDS._L0376:
                        CPI       _ACCA, 255
                        .BRANCH   3,DDS._L0379
                        BREQ      DDS._L0379
                        .BRANCH   20,DDS._L0378
                        JMP       DDS._L0378
DDS._L0379:
DDS._L0375:
                        .BLOCK    1024
                        .LINE     1024
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDS       _ACCA, DDS.Status
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,DDS.SERPROMPT
                        CALL      DDS.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1025
                        .BRANCH   20,DDS.ParseGetParam_X
                        JMP       DDS.ParseGetParam_X
                        .ENDBLOCK 1026
                        .BRANCH   20,DDS._L0260
                        JMP       DDS._L0260
DDS._L0378:
                        .BLOCK    1027
                        .LINE     1028
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 005h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,DDS.SERPROMPT
                        CALL      DDS.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1029
                        .BRANCH   20,DDS.ParseGetParam_X
                        JMP       DDS.ParseGetParam_X
                        .ENDBLOCK 1030
DDS._L0260:
                        .LINE     1031
                        .BRANCH   17,DDS.WRITEPARAMSER
                        CALL      DDS.WRITEPARAMSER
                        .ENDBLOCK 1032
DDS.ParseGetParam_X:
                        .LINE     1032
                        .BRANCH   19
                        RET
                        .ENDFUNC  1032

                        .FUNC     ParseSetParam, 0040Ah, 00020h
DDS.ParseSetParam:
                        .BLOCK    1035
                        .LINE     1036
                        LDS       _ACCB, 0036Bh
                        CLR       _ACCA
                        SBRC      _ACCB, 007h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DDS._L0382
                        BRNE      DDS._L0382
                        .BRANCH   20,DDS._L0380
                        JMP       DDS._L0380
DDS._L0382:
                        .BLOCK    1036
                        .LINE     1037
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 002h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,DDS.SERPROMPT
                        CALL      DDS.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1038
                        .BRANCH   20,DDS.ParseSetParam_X
                        JMP       DDS.ParseSetParam_X
                        .ENDBLOCK 1039
DDS._L0380:
DDS._L0381:
                        .LINE     1040
                        LDI       _ACCA, 0FFh
                        STS       DDS.CHANGEDFLAG, _ACCA
                        .LINE     1041
                        LDS       _ACCA, DDS.SubCh
                        .LINE     1042
                        CPI       _ACCA, 0
                        .BRANCH   3,DDS._L0386
                        BREQ      DDS._L0386
                        .BRANCH   20,DDS._L0385
                        JMP       DDS._L0385
DDS._L0386:
DDS._L0384:
                        .BLOCK    1043
                        .LINE     1043
                        LDS       _ACCB, DDS.Param
                        LDS       _ACCA, DDS.Param+1
                        LDS       _ACCALO, DDS.Param+2
                        LDS       _ACCAHI, DDS.Param+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        POP       _ACCEHI
                        POP       _ACCELO
                        POP       _ACCDHI
                        POP       _ACCDLO
                        LDI       _ACCBLO, 000h
                        LDI       _ACCBHI, 000h
                        LDI       _ACCCLO, 020h
                        LDI       _ACCCHI, 041h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat_R
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.FloatToLInt
                        STS       DDS.FREQUENZ, _ACCB
                        STS       DDS.FREQUENZ+1, _ACCA
                        STS       DDS.FREQUENZ+2, _ACCALO
                        STS       DDS.FREQUENZ+3, _ACCAHI
                        .ENDBLOCK 1044
                        .BRANCH   20,DDS._L0383
                        JMP       DDS._L0383
DDS._L0385:
                        .LINE     1045
                        CPI       _ACCA, 1
                        .BRANCH   3,DDS._L0389
                        BREQ      DDS._L0389
                        .BRANCH   20,DDS._L0388
                        JMP       DDS._L0388
DDS._L0389:
DDS._L0387:
                        .BLOCK    1046
                        .LINE     1046
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCB, DDS.Param
                        LDS       _ACCA, DDS.Param+1
                        LDS       _ACCALO, DDS.Param+2
                        LDS       _ACCAHI, DDS.Param+3
                        ST        -Y, _ACCAHI
                        ST        -Y, _ACCALO
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  4
                        .FRAME  0
                        .BRANCH   17,DDS.RMS2DACLEVEL
                        CALL       DDS.RMS2DACLEVEL
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        STS       DDS.DACLEVEL, _ACCB
                        STS       DDS.DACLEVEL+1, _ACCA
                        STS       DDS.DACLEVEL+2, _ACCALO
                        STS       DDS.DACLEVEL+3, _ACCAHI
                        .LINE     1047
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCB, DDS.Param
                        LDS       _ACCA, DDS.Param+1
                        LDS       _ACCALO, DDS.Param+2
                        LDS       _ACCAHI, DDS.Param+3
                        ST        -Y, _ACCAHI
                        ST        -Y, _ACCALO
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  4
                        .FRAME  0
                        .BRANCH   17,DDS.LEVEL2DB
                        CALL       DDS.LEVEL2DB
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        STS       DDS.DB, _ACCB
                        STS       DDS.DB+1, _ACCA
                        STS       DDS.DB+2, _ACCALO
                        STS       DDS.DB+3, _ACCAHI
                        .ENDBLOCK 1048
                        .BRANCH   20,DDS._L0383
                        JMP       DDS._L0383
DDS._L0388:
                        .LINE     1049
                        CPI       _ACCA, 2
                        .BRANCH   3,DDS._L0392
                        BREQ      DDS._L0392
                        .BRANCH   20,DDS._L0391
                        JMP       DDS._L0391
DDS._L0392:
DDS._L0390:
                        .BLOCK    1050
                        .LINE     1050
                        LDS       _ACCB, DDS.Param
                        LDS       _ACCA, DDS.Param+1
                        LDS       _ACCALO, DDS.Param+2
                        LDS       _ACCAHI, DDS.Param+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DDS.PwrGain
                        LDS       _ACCA, DDS.PwrGain+1
                        LDS       _ACCALO, DDS.PwrGain+2
                        LDS       _ACCAHI, DDS.PwrGain+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat
                        MOVW      _ACCDLO, _ACCB
                        MOVW      _ACCELO, _ACCALO
                        LDI       _ACCBLO, 0F3h
                        LDI       _ACCBHI, 004h
                        LDI       _ACCCLO, 035h
                        LDI       _ACCCHI, 040h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat_R
                        STS       DDS.DACLEVEL, _ACCB
                        STS       DDS.DACLEVEL+1, _ACCA
                        STS       DDS.DACLEVEL+2, _ACCALO
                        STS       DDS.DACLEVEL+3, _ACCAHI
                        .LINE     1051
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCB, DDS.DACLevel
                        LDS       _ACCA, DDS.DACLevel+1
                        LDS       _ACCALO, DDS.DACLevel+2
                        LDS       _ACCAHI, DDS.DACLevel+3
                        ST        -Y, _ACCAHI
                        ST        -Y, _ACCALO
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  4
                        .FRAME  0
                        .BRANCH   17,DDS.DACLEVEL2DB
                        CALL       DDS.DACLEVEL2DB
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        STS       DDS.DB, _ACCB
                        STS       DDS.DB+1, _ACCA
                        STS       DDS.DB+2, _ACCALO
                        STS       DDS.DB+3, _ACCAHI
                        .ENDBLOCK 1052
                        .BRANCH   20,DDS._L0383
                        JMP       DDS._L0383
DDS._L0391:
                        .LINE     1053
                        CPI       _ACCA, 3
                        .BRANCH   3,DDS._L0395
                        BREQ      DDS._L0395
                        .BRANCH   20,DDS._L0394
                        JMP       DDS._L0394
DDS._L0395:
DDS._L0393:
                        .BLOCK    1054
                        .LINE     1054
                        LDS       _ACCB, DDS.param
                        LDS       _ACCA, DDS.param+1
                        LDS       _ACCALO, DDS.param+2
                        LDS       _ACCAHI, DDS.param+3
                        STS       DDS.DB, _ACCB
                        STS       DDS.DB+1, _ACCA
                        STS       DDS.DB+2, _ACCALO
                        STS       DDS.DB+3, _ACCAHI
                        .LINE     1055
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCB, DDS.db
                        LDS       _ACCA, DDS.db+1
                        LDS       _ACCALO, DDS.db+2
                        LDS       _ACCAHI, DDS.db+3
                        ST        -Y, _ACCAHI
                        ST        -Y, _ACCALO
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  4
                        .FRAME  0
                        .BRANCH   17,DDS.DB2DACLEVEL
                        CALL       DDS.DB2DACLEVEL
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        STS       DDS.DACLEVEL, _ACCB
                        STS       DDS.DACLEVEL+1, _ACCA
                        STS       DDS.DACLEVEL+2, _ACCALO
                        STS       DDS.DACLEVEL+3, _ACCAHI
                        .ENDBLOCK 1056
                        .BRANCH   20,DDS._L0383
                        JMP       DDS._L0383
DDS._L0394:
                        .LINE     1057
                        CPI       _ACCA, 4
                        .BRANCH   3,DDS._L0398
                        BREQ      DDS._L0398
                        .BRANCH   20,DDS._L0397
                        JMP       DDS._L0397
DDS._L0398:
DDS._L0396:
                        .BLOCK    1058
                        .LINE     1058
                        LDS       _ACCA, DDS.ParamByte
                        STS       DDS.WAVE, _ACCA
                        .LINE     1059
                        .BRANCH   17,DDS.SETLIMITS
                        CALL      DDS.SETLIMITS
                        .LINE     1060
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCB, DDS.DACLevel
                        LDS       _ACCA, DDS.DACLevel+1
                        LDS       _ACCALO, DDS.DACLevel+2
                        LDS       _ACCAHI, DDS.DACLevel+3
                        ST        -Y, _ACCAHI
                        ST        -Y, _ACCALO
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  4
                        .FRAME  0
                        .BRANCH   17,DDS.DACLEVEL2DB
                        CALL       DDS.DACLEVEL2DB
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        STS       DDS.DB, _ACCB
                        STS       DDS.DB+1, _ACCA
                        STS       DDS.DB+2, _ACCALO
                        STS       DDS.DB+3, _ACCAHI
                        .LINE     1061
                        LDS       _ACCA, DDS.wave
                        CPI       _ACCA, 004h
                        LDI       _ACCA, 0h
                        BRNE      DDS._L0399
                        SER       _ACCA
DDS._L0399:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0402
                        BRNE      DDS._L0402
                        .BRANCH   20,DDS._L0400
                        JMP       DDS._L0400
DDS._L0402:
                        .BLOCK    1061
                        .LINE     1062
                        LDI       _ACCCLO, DDS.InitLogicLevel AND 0FFh
                        LDI       _ACCCHI, DDS.InitLogicLevel SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DDS.PwrGain
                        LDS       _ACCA, DDS.PwrGain+1
                        LDS       _ACCALO, DDS.PwrGain+2
                        LDS       _ACCAHI, DDS.PwrGain+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat
                        MOVW      _ACCDLO, _ACCB
                        MOVW      _ACCELO, _ACCALO
                        LDI       _ACCBLO, 0F3h
                        LDI       _ACCBHI, 004h
                        LDI       _ACCCLO, 035h
                        LDI       _ACCCHI, 040h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat_R
                        STS       DDS.DACLEVEL, _ACCB
                        STS       DDS.DACLEVEL+1, _ACCA
                        STS       DDS.DACLEVEL+2, _ACCALO
                        STS       DDS.DACLEVEL+3, _ACCAHI
                        .LINE     1063
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCB, DDS.DACLevel
                        LDS       _ACCA, DDS.DACLevel+1
                        LDS       _ACCALO, DDS.DACLevel+2
                        LDS       _ACCAHI, DDS.DACLevel+3
                        ST        -Y, _ACCAHI
                        ST        -Y, _ACCALO
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  4
                        .FRAME  0
                        .BRANCH   17,DDS.DACLEVEL2DB
                        CALL       DDS.DACLEVEL2DB
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        STS       DDS.DB, _ACCB
                        STS       DDS.DB+1, _ACCA
                        STS       DDS.DB+2, _ACCALO
                        STS       DDS.DB+3, _ACCAHI
                        .ENDBLOCK 1064
DDS._L0400:
DDS._L0401:
                        .ENDBLOCK 1065
                        .BRANCH   20,DDS._L0383
                        JMP       DDS._L0383
DDS._L0397:
                        .LINE     1066
                        CPI       _ACCA, 5
                        .BRANCH   3,DDS._L0405
                        BREQ      DDS._L0405
                        .BRANCH   20,DDS._L0404
                        JMP       DDS._L0404
DDS._L0405:
DDS._L0403:
                        .BLOCK    1067
                        .LINE     1067
                        LDS       _ACCA, DDS.ParamByte
                        STS       DDS.BURSTMODE, _ACCA
                        .ENDBLOCK 1068
                        .BRANCH   20,DDS._L0383
                        JMP       DDS._L0383
DDS._L0404:
                        .LINE     1069
                        CPI       _ACCA, 9
                        .BRANCH   3,DDS._L0408
                        BREQ      DDS._L0408
                        .BRANCH   20,DDS._L0407
                        JMP       DDS._L0407
DDS._L0408:
DDS._L0406:
                        .BLOCK    1070
                        .LINE     1070
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCA, DDS.ParamByte
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DDS.SERAUX
                        CALL      DDS.SERAUX
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 1071
                        .BRANCH   20,DDS._L0383
                        JMP       DDS._L0383
DDS._L0407:
                        .LINE     1072
                        CPI       _ACCA, 19
                        .BRANCH   3,DDS._L0411
                        BREQ      DDS._L0411
                        .BRANCH   20,DDS._L0410
                        JMP       DDS._L0410
DDS._L0411:
DDS._L0409:
                        .BLOCK    1073
                        .LINE     1073
                        LDS       _ACCA, DDS.ParamByte
                        STS       DDS.RANGE, _ACCA
                        .ENDBLOCK 1074
                        .BRANCH   20,DDS._L0383
                        JMP       DDS._L0383
DDS._L0410:
                        .LINE     1075
                        CPI       _ACCA, 20
                        .BRANCH   3,DDS._L0414
                        BREQ      DDS._L0414
                        .BRANCH   20,DDS._L0413
                        JMP       DDS._L0413
DDS._L0414:
DDS._L0412:
                        .BLOCK    1076
                        .LINE     1076
                        LDS       _ACCB, DDS.Param
                        LDS       _ACCA, DDS.Param+1
                        LDS       _ACCALO, DDS.Param+2
                        LDS       _ACCAHI, DDS.Param+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        POP       _ACCEHI
                        POP       _ACCELO
                        POP       _ACCDHI
                        POP       _ACCDLO
                        LDI       _ACCBLO, 000h
                        LDI       _ACCBHI, 000h
                        LDI       _ACCCLO, 07Ah
                        LDI       _ACCCHI, 044h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat_R
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.FloatToLInt
                        SBRC      _ACCAHI, 7
                        RJMP      DDS._L0415
                        OR        _ACCAHI, _ACCALO
                        BRNE      DDS._L0416
                        RJMP      DDS._L0417
DDS._L0415:
                        CPI       _ACCAHI, 0FFh
                        BRNE      DDS._L0416
                        CPI       _ACCALO, 0FFh
                        BREQ      DDS._L0417
DDS._L0416:
                        SET
                        BLD       Flags, _ERRFLAG
DDS._L0417:
                        STS       DDS.OFFSET, _ACCB
                        STS       DDS.OFFSET+1, _ACCA
                        .ENDBLOCK 1077
                        .BRANCH   20,DDS._L0383
                        JMP       DDS._L0383
DDS._L0413:
                        .LINE     1078
                        CPI       _ACCA, 80
                        .BRANCH   3,DDS._L0420
                        BREQ      DDS._L0420
                        .BRANCH   20,DDS._L0419
                        JMP       DDS._L0419
DDS._L0420:
DDS._L0418:
                        .BLOCK    1079
                        .LINE     1079
                        LDS       _ACCA, DDS.ParamByte
                        CPI       _ACCA, 006h
                        LDI       _ACCA, 0h
                        BREQ      DDS._L0421
                        BRLO      DDS._L0421
                        SER       _ACCA
DDS._L0421:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0424
                        BRNE      DDS._L0424
                        .BRANCH   20,DDS._L0422
                        JMP       DDS._L0422
DDS._L0424:
                        .BLOCK    1079
                        .LINE     1080
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 005h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,DDS.SERPROMPT
                        CALL      DDS.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1081
                        .BRANCH   20,DDS.ParseSetParam_X
                        JMP       DDS.ParseSetParam_X
                        .ENDBLOCK 1082
DDS._L0422:
DDS._L0423:
                        .LINE     1083
                        LDS       _ACCA, DDS.ParamByte
                        STS       DDS.MODIFY, _ACCA
                        .ENDBLOCK 1084
                        .BRANCH   20,DDS._L0383
                        JMP       DDS._L0383
DDS._L0419:
                        .LINE     1085
                        CPI       _ACCA, 89
                        .BRANCH   3,DDS._L0427
                        BREQ      DDS._L0427
                        .BRANCH   20,DDS._L0426
                        JMP       DDS._L0426
DDS._L0427:
DDS._L0425:
                        .BLOCK    1086
                        .LINE     1086
                        LDS       _ACCB, 0036Bh
                        CLR       _ACCA
                        SBRC      _ACCB, 004h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DDS._L0430
                        BRNE      DDS._L0430
                        .BRANCH   20,DDS._L0428
                        JMP       DDS._L0428
DDS._L0430:
                        .BLOCK    1086
                        .LINE     1087
                        LDS       _ACCB, DDS.ParamInt
                        LDS       _ACCA, DDS.ParamInt+1
                        STS       DDS.INCRAST, _ACCB
                        STS       DDS.INCRAST+1, _ACCA
                        .LINE     1088
                        LDS       _ACCB, DDS.IncRast
                        LDS       _ACCA, DDS.IncRast+1
                        LDI       _ACCCLO, DDS.INITINCRAST AND 0FFh
                        LDI       _ACCCHI, DDS.INITINCRAST SHRB 8
                        MOVW      _ACCALO, _ACCB
                        CALL      SYSTEM._WriteEEp16
                        ADIW      _ACCCLO, 01h
                        .ENDBLOCK 1089
                        .BRANCH   20,DDS._L0429
                        JMP       DDS._L0429
DDS._L0428:
                        .BLOCK    1089
                        .LINE     1090
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 006h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,DDS.SERPROMPT
                        CALL      DDS.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1091
                        .BRANCH   20,DDS.ParseSetParam_X
                        JMP       DDS.ParseSetParam_X
                        .ENDBLOCK 1092
DDS._L0429:
                        .ENDBLOCK 1093
                        .BRANCH   20,DDS._L0383
                        JMP       DDS._L0383
DDS._L0426:
                        .LINE     1094
                        CPI       _ACCA, 150
                        .BRANCH   2,DDS._L0433
                        BRCC      DDS._L0433
                        .BRANCH   20,DDS._L0432
                        JMP       DDS._L0432
DDS._L0433:
                        CPI       _ACCA, 170
                        .BRANCH   3,DDS._L0434
                        BREQ      DDS._L0434
                        .BRANCH   1,DDS._L0432
                        BRCS      DDS._L0434
                        .BRANCH   20,DDS._L0432
                        JMP       DDS._L0432
DDS._L0434:
DDS._L0431:
                        .BLOCK    1095
                        .LINE     1095
                        LDS       _ACCB, 0036Bh
                        CLR       _ACCA
                        SBRC      _ACCB, 004h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DDS._L0437
                        BRNE      DDS._L0437
                        .BRANCH   20,DDS._L0435
                        JMP       DDS._L0435
DDS._L0437:
                        .BLOCK    1095
                        .LINE     1096
                        LDS       _ACCA, DDS.SubCh
                        .LINE     1097
                        CPI       _ACCA, 150
                        .BRANCH   3,DDS._L0441
                        BREQ      DDS._L0441
                        .BRANCH   20,DDS._L0440
                        JMP       DDS._L0440
DDS._L0441:
DDS._L0439:
                        .BLOCK    1098
                        .LINE     1098
                        LDS       _ACCB, DDS.Param
                        LDS       _ACCA, DDS.Param+1
                        LDS       _ACCALO, DDS.Param+2
                        LDS       _ACCAHI, DDS.Param+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        POP       _ACCEHI
                        POP       _ACCELO
                        POP       _ACCDHI
                        POP       _ACCDLO
                        LDI       _ACCBLO, 000h
                        LDI       _ACCBHI, 000h
                        LDI       _ACCCLO, 020h
                        LDI       _ACCCHI, 041h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat_R
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.FloatToLInt
                        LDI       _ACCCLO, DDS.INITFREQUENZ AND 0FFh
                        LDI       _ACCCHI, DDS.INITFREQUENZ SHRB 8
                        MOVW      _ACCBLO, _ACCB
                        CALL      SYSTEM._WriteEEp32
                        ADIW      _ACCCLO, 01h
                        .ENDBLOCK 1099
                        .BRANCH   20,DDS._L0438
                        JMP       DDS._L0438
DDS._L0440:
                        .LINE     1100
                        CPI       _ACCA, 151
                        .BRANCH   3,DDS._L0444
                        BREQ      DDS._L0444
                        .BRANCH   20,DDS._L0443
                        JMP       DDS._L0443
DDS._L0444:
DDS._L0442:
                        .BLOCK    1101
                        .LINE     1101
                        LDS       _ACCB, DDS.Param
                        LDS       _ACCA, DDS.Param+1
                        LDS       _ACCALO, DDS.Param+2
                        LDS       _ACCAHI, DDS.Param+3
                        LDI       _ACCCLO, DDS.INITLEVEL AND 0FFh
                        LDI       _ACCCHI, DDS.INITLEVEL SHRB 8
                        MOVW      _ACCBLO, _ACCB
                        CALL      SYSTEM._WriteEEp32
                        ADIW      _ACCCLO, 01h
                        .ENDBLOCK 1102
                        .BRANCH   20,DDS._L0438
                        JMP       DDS._L0438
DDS._L0443:
                        .LINE     1103
                        CPI       _ACCA, 152
                        .BRANCH   3,DDS._L0447
                        BREQ      DDS._L0447
                        .BRANCH   20,DDS._L0446
                        JMP       DDS._L0446
DDS._L0447:
DDS._L0445:
                        .BLOCK    1104
                        .LINE     1104
                        LDS       _ACCB, DDS.Param
                        LDS       _ACCA, DDS.Param+1
                        LDS       _ACCALO, DDS.Param+2
                        LDS       _ACCAHI, DDS.Param+3
                        LDI       _ACCCLO, DDS.INITLOGICLEVEL AND 0FFh
                        LDI       _ACCCHI, DDS.INITLOGICLEVEL SHRB 8
                        MOVW      _ACCBLO, _ACCB
                        CALL      SYSTEM._WriteEEp32
                        ADIW      _ACCCLO, 01h
                        .ENDBLOCK 1105
                        .BRANCH   20,DDS._L0438
                        JMP       DDS._L0438
DDS._L0446:
                        .LINE     1106
                        CPI       _ACCA, 154
                        .BRANCH   3,DDS._L0450
                        BREQ      DDS._L0450
                        .BRANCH   20,DDS._L0449
                        JMP       DDS._L0449
DDS._L0450:
DDS._L0448:
                        .BLOCK    1107
                        .LINE     1107
                        LDS       _ACCA, DDS.ParamByte
                        LDI       _ACCCLO, DDS.INITWAVE AND 0FFh
                        LDI       _ACCCHI, DDS.INITWAVE SHRB 8
                        CALL      SYSTEM.WriteEEp8
                        ADIW      _ACCCLO, 01h
                        .ENDBLOCK 1108
                        .BRANCH   20,DDS._L0438
                        JMP       DDS._L0438
DDS._L0449:
                        .LINE     1109
                        CPI       _ACCA, 155
                        .BRANCH   3,DDS._L0453
                        BREQ      DDS._L0453
                        .BRANCH   20,DDS._L0452
                        JMP       DDS._L0452
DDS._L0453:
DDS._L0451:
                        .BLOCK    1110
                        .LINE     1110
                        LDS       _ACCA, DDS.ParamByte
                        LDI       _ACCCLO, DDS.INITBURST AND 0FFh
                        LDI       _ACCCHI, DDS.INITBURST SHRB 8
                        CALL      SYSTEM.WriteEEp8
                        ADIW      _ACCCLO, 01h
                        .ENDBLOCK 1111
                        .BRANCH   20,DDS._L0438
                        JMP       DDS._L0438
DDS._L0452:
                        .LINE     1112
                        CPI       _ACCA, 170
                        .BRANCH   3,DDS._L0456
                        BREQ      DDS._L0456
                        .BRANCH   20,DDS._L0455
                        JMP       DDS._L0455
DDS._L0456:
DDS._L0454:
                        .BLOCK    1113
                        .LINE     1113
                        LDS       _ACCB, DDS.Param
                        LDS       _ACCA, DDS.Param+1
                        LDS       _ACCALO, DDS.Param+2
                        LDS       _ACCAHI, DDS.Param+3
                        LDI       _ACCCLO, DDS.INITOFFSET AND 0FFh
                        LDI       _ACCCHI, DDS.INITOFFSET SHRB 8
                        MOVW      _ACCBLO, _ACCB
                        CALL      SYSTEM._WriteEEp32
                        ADIW      _ACCCLO, 01h
                        .ENDBLOCK 1114
                        .BRANCH   20,DDS._L0438
                        JMP       DDS._L0438
DDS._L0455:
                        .BLOCK    1115
                        .LINE     1116
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 005h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,DDS.SERPROMPT
                        CALL      DDS.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1117
                        .BRANCH   20,DDS.ParseSetParam_X
                        JMP       DDS.ParseSetParam_X
                        .ENDBLOCK 1118
DDS._L0438:
                        .ENDBLOCK 1119
                        .BRANCH   20,DDS._L0436
                        JMP       DDS._L0436
DDS._L0435:
                        .BLOCK    1119
                        .LINE     1120
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 006h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,DDS.SERPROMPT
                        CALL      DDS.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1121
                        .BRANCH   20,DDS.ParseSetParam_X
                        JMP       DDS.ParseSetParam_X
                        .ENDBLOCK 1122
DDS._L0436:
                        .ENDBLOCK 1123
                        .BRANCH   20,DDS._L0383
                        JMP       DDS._L0383
DDS._L0432:
                        .LINE     1124
                        CPI       _ACCA, 200
                        .BRANCH   2,DDS._L0459
                        BRCC      DDS._L0459
                        .BRANCH   20,DDS._L0458
                        JMP       DDS._L0458
DDS._L0459:
                        CPI       _ACCA, 213
                        .BRANCH   3,DDS._L0460
                        BREQ      DDS._L0460
                        .BRANCH   1,DDS._L0458
                        BRCS      DDS._L0460
                        .BRANCH   20,DDS._L0458
                        JMP       DDS._L0458
DDS._L0460:
DDS._L0457:
                        .BLOCK    1125
                        .LINE     1125
                        LDS       _ACCB, 0036Bh
                        CLR       _ACCA
                        SBRC      _ACCB, 004h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DDS._L0463
                        BRNE      DDS._L0463
                        .BRANCH   20,DDS._L0461
                        JMP       DDS._L0461
DDS._L0463:
                        .BLOCK    1125
                        .LINE     1126
                        LDS       _ACCA, DDS.SubCh
                        .LINE     1127
                        CPI       _ACCA, 200
                        .BRANCH   3,DDS._L0467
                        BREQ      DDS._L0467
                        .BRANCH   20,DDS._L0466
                        JMP       DDS._L0466
DDS._L0467:
DDS._L0465:
                        .BLOCK    1128
                        .LINE     1128
                        LDS       _ACCB, DDS.Param
                        LDS       _ACCA, DDS.Param+1
                        LDS       _ACCALO, DDS.Param+2
                        LDS       _ACCAHI, DDS.Param+3
                        LDI       _ACCCLO, DDS.LEVELSCALELOW AND 0FFh
                        LDI       _ACCCHI, DDS.LEVELSCALELOW SHRB 8
                        MOVW      _ACCBLO, _ACCB
                        CALL      SYSTEM._WriteEEp32
                        ADIW      _ACCCLO, 01h
                        .ENDBLOCK 1129
                        .BRANCH   20,DDS._L0464
                        JMP       DDS._L0464
DDS._L0466:
                        .LINE     1130
                        CPI       _ACCA, 201
                        .BRANCH   3,DDS._L0470
                        BREQ      DDS._L0470
                        .BRANCH   20,DDS._L0469
                        JMP       DDS._L0469
DDS._L0470:
DDS._L0468:
                        .BLOCK    1131
                        .LINE     1131
                        LDS       _ACCB, DDS.Param
                        LDS       _ACCA, DDS.Param+1
                        LDS       _ACCALO, DDS.Param+2
                        LDS       _ACCAHI, DDS.Param+3
                        LDI       _ACCCLO, DDS.LEVELSCALEHI AND 0FFh
                        LDI       _ACCCHI, DDS.LEVELSCALEHI SHRB 8
                        MOVW      _ACCBLO, _ACCB
                        CALL      SYSTEM._WriteEEp32
                        ADIW      _ACCCLO, 01h
                        .ENDBLOCK 1132
                        .BRANCH   20,DDS._L0464
                        JMP       DDS._L0464
DDS._L0469:
                        .LINE     1133
                        CPI       _ACCA, 202
                        .BRANCH   3,DDS._L0473
                        BREQ      DDS._L0473
                        .BRANCH   20,DDS._L0472
                        JMP       DDS._L0472
DDS._L0473:
DDS._L0471:
                        .BLOCK    1134
                        .LINE     1134
                        LDS       _ACCB, DDS.Param
                        LDS       _ACCA, DDS.Param+1
                        LDS       _ACCALO, DDS.Param+2
                        LDS       _ACCAHI, DDS.Param+3
                        LDI       _ACCCLO, DDS.INITPWRGAIN AND 0FFh
                        LDI       _ACCCHI, DDS.INITPWRGAIN SHRB 8
                        MOVW      _ACCBLO, _ACCB
                        CALL      SYSTEM._WriteEEp32
                        ADIW      _ACCCLO, 01h
                        .LINE     1135
                        .BRANCH   17,DDS.PATCHCOPYFROMEE
                        CALL      DDS.PATCHCOPYFROMEE
                        .ENDBLOCK 1136
                        .BRANCH   20,DDS._L0464
                        JMP       DDS._L0464
DDS._L0472:
                        .LINE     1137
                        CPI       _ACCA, 203
                        .BRANCH   3,DDS._L0476
                        BREQ      DDS._L0476
                        .BRANCH   20,DDS._L0475
                        JMP       DDS._L0475
DDS._L0476:
DDS._L0474:
                        .BLOCK    1138
                        .LINE     1138
                        LDS       _ACCB, DDS.Param
                        LDS       _ACCA, DDS.Param+1
                        LDS       _ACCALO, DDS.Param+2
                        LDS       _ACCAHI, DDS.Param+3
                        LDI       _ACCCLO, DDS.INITATTNFAC AND 0FFh
                        LDI       _ACCCHI, DDS.INITATTNFAC SHRB 8
                        MOVW      _ACCBLO, _ACCB
                        CALL      SYSTEM._WriteEEp32
                        ADIW      _ACCCLO, 01h
                        .LINE     1139
                        .BRANCH   17,DDS.PATCHCOPYFROMEE
                        CALL      DDS.PATCHCOPYFROMEE
                        .ENDBLOCK 1140
                        .BRANCH   20,DDS._L0464
                        JMP       DDS._L0464
DDS._L0475:
                        .LINE     1141
                        CPI       _ACCA, 204
                        .BRANCH   3,DDS._L0479
                        BREQ      DDS._L0479
                        .BRANCH   20,DDS._L0478
                        JMP       DDS._L0478
DDS._L0479:
DDS._L0477:
                        .BLOCK    1142
                        .LINE     1142
                        LDS       _ACCB, DDS.Param
                        LDS       _ACCA, DDS.Param+1
                        LDS       _ACCALO, DDS.Param+2
                        LDS       _ACCAHI, DDS.Param+3
                        LDI       _ACCCLO, DDS.INITLOGICLEVEL AND 0FFh
                        LDI       _ACCCHI, DDS.INITLOGICLEVEL SHRB 8
                        MOVW      _ACCBLO, _ACCB
                        CALL      SYSTEM._WriteEEp32
                        ADIW      _ACCCLO, 01h
                        .LINE     1143
                        .BRANCH   17,DDS.PATCHCOPYFROMEE
                        CALL      DDS.PATCHCOPYFROMEE
                        .ENDBLOCK 1144
                        .BRANCH   20,DDS._L0464
                        JMP       DDS._L0464
DDS._L0478:
                        .LINE     1145
                        CPI       _ACCA, 210
                        .BRANCH   2,DDS._L0482
                        BRCC      DDS._L0482
                        .BRANCH   20,DDS._L0481
                        JMP       DDS._L0481
DDS._L0482:
                        CPI       _ACCA, 213
                        .BRANCH   3,DDS._L0483
                        BREQ      DDS._L0483
                        .BRANCH   1,DDS._L0481
                        BRCS      DDS._L0483
                        .BRANCH   20,DDS._L0481
                        JMP       DDS._L0481
DDS._L0483:
DDS._L0480:
                        .BLOCK    1146
                        .LINE     1146
                        LDI       _ACCCLO, DDS.ADCscales AND 0FFh
                        LDI       _ACCCHI, DDS.ADCscales SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DDS.SubCh
                        SUBI      _ACCA, 0D2h AND 0FFh
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCB, DDS.Param
                        LDS       _ACCA, DDS.Param+1
                        LDS       _ACCALO, DDS.Param+2
                        LDS       _ACCAHI, DDS.Param+3
                        POP       _ACCCHI
                        POP       _ACCCLO
                        MOVW      _ACCBLO, _ACCB
                        CALL      SYSTEM._WriteEEp32
                        .ENDBLOCK 1147
                        .BRANCH   20,DDS._L0464
                        JMP       DDS._L0464
DDS._L0481:
DDS._L0464:
                        .ENDBLOCK 1149
                        .BRANCH   20,DDS._L0462
                        JMP       DDS._L0462
DDS._L0461:
                        .BLOCK    1149
                        .LINE     1150
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 006h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,DDS.SERPROMPT
                        CALL      DDS.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1151
                        .BRANCH   20,DDS.ParseSetParam_X
                        JMP       DDS.ParseSetParam_X
                        .ENDBLOCK 1152
DDS._L0462:
                        .ENDBLOCK 1153
                        .BRANCH   20,DDS._L0383
                        JMP       DDS._L0383
DDS._L0458:
                        .LINE     1154
                        CPI       _ACCA, 251
                        .BRANCH   3,DDS._L0486
                        BREQ      DDS._L0486
                        .BRANCH   20,DDS._L0485
                        JMP       DDS._L0485
DDS._L0486:
DDS._L0484:
                        .BLOCK    1155
                        .LINE     1155
                        LDS       _ACCB, DDS.ParamInt
                        LDS       _ACCA, DDS.ParamInt+1
                        STS       DDS.ERRCOUNT, _ACCB
                        STS       DDS.ERRCOUNT+1, _ACCA
                        .ENDBLOCK 1156
                        .BRANCH   20,DDS._L0383
                        JMP       DDS._L0383
DDS._L0485:
                        .LINE     1157
                        CPI       _ACCA, 252
                        .BRANCH   3,DDS._L0489
                        BREQ      DDS._L0489
                        .BRANCH   20,DDS._L0488
                        JMP       DDS._L0488
DDS._L0489:
DDS._L0487:
                        .BLOCK    1158
                        .LINE     1158
                        LDS       _ACCB, 0036Bh
                        CLR       _ACCA
                        SBRC      _ACCB, 004h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DDS._L0492
                        BRNE      DDS._L0492
                        .BRANCH   20,DDS._L0490
                        JMP       DDS._L0490
DDS._L0492:
                        .BLOCK    1158
                        .LINE     1159
                        LDS       _ACCA, DDS.ParamByte
                        LDI       _ACCCLO, DDS.EESERBAUDREG AND 0FFh
                        LDI       _ACCCHI, DDS.EESERBAUDREG SHRB 8
                        CALL      SYSTEM.WriteEEp8
                        ADIW      _ACCCLO, 01h
                        .ENDBLOCK 1160
                        .BRANCH   20,DDS._L0491
                        JMP       DDS._L0491
DDS._L0490:
                        .BLOCK    1160
                        .LINE     1161
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 006h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,DDS.SERPROMPT
                        CALL      DDS.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1162
                        .BRANCH   20,DDS.ParseSetParam_X
                        JMP       DDS.ParseSetParam_X
                        .ENDBLOCK 1163
DDS._L0491:
                        .ENDBLOCK 1164
                        .BRANCH   20,DDS._L0383
                        JMP       DDS._L0383
DDS._L0488:
                        .LINE     1165
                        CPI       _ACCA, 250
                        .BRANCH   3,DDS._L0495
                        BREQ      DDS._L0495
                        .BRANCH   20,DDS._L0494
                        JMP       DDS._L0494
DDS._L0495:
DDS._L0493:
                        .BRANCH   20,DDS._L0383
                        JMP       DDS._L0383
DDS._L0494:
                        .BLOCK    1167
                        .LINE     1168
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 005h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,DDS.SERPROMPT
                        CALL      DDS.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1169
                        .BRANCH   20,DDS.ParseSetParam_X
                        JMP       DDS.ParseSetParam_X
                        .ENDBLOCK 1170
DDS._L0383:
                        .LINE     1171
                        LDS       _ACCA, 0036Bh
                        CBR       _ACCA, 010h
                        STS       0036Bh, _ACCA
                        .LINE     1172
                        LDS       _ACCA, DDS.SubCh
                        CPI       _ACCA, 0FAh
                        LDI       _ACCA, 0h
                        BRNE      DDS._L0496
                        SER       _ACCA
DDS._L0496:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0499
                        BRNE      DDS._L0499
                        .BRANCH   20,DDS._L0497
                        JMP       DDS._L0497
DDS._L0499:
                        .BLOCK    1173
                        .LINE     1173
                        LDS       _ACCA, 0036Bh
                        SBR       _ACCA, 010h
                        STS       0036Bh, _ACCA
                        .ENDBLOCK 1174
DDS._L0497:
DDS._L0498:
                        .LINE     1176
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DDS.CHECKLIMITS
                        CALL       DDS.CHECKLIMITS
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        TST       _ACCA
                        .BRANCH   4,DDS._L0502
                        BRNE      DDS._L0502
                        .BRANCH   20,DDS._L0500
                        JMP       DDS._L0500
DDS._L0502:
                        .BLOCK    1176
                        .LINE     1177
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 005h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDS       _ACCA, DDS.Status
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,DDS.SERPROMPT
                        CALL      DDS.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 1178
                        .BRANCH   20,DDS._L0501
                        JMP       DDS._L0501
DDS._L0500:
                        .BLOCK    1178
                        .LINE     1179
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDS       _ACCA, DDS.Status
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,DDS.SERPROMPT
                        CALL      DDS.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 1180
DDS._L0501:
                        .LINE     1181
                        .BRANCH   17,DDS.SWITCHRANGE
                        CALL      DDS.SWITCHRANGE
                        .LINE     1182
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DDS.SETLEVELDDS
                        CALL      DDS.SETLEVELDDS
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 1183
DDS.ParseSetParam_X:
                        .LINE     1183
                        .BRANCH   19
                        RET
                        .ENDFUNC  1183

                        .FUNC     Cmd2Index, 004A5h, 00020h
DDS.Cmd2Index:
                        SBIW      _FRAMEPTR, 1
                        .BLOCK    1192
                        .LINE     1193
                        LDI       _ACCCLO, DDS.ParamStr AND 0FFh
                        LDI       _ACCCHI, DDS.ParamStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        ADIW      _ACCCLO, 1
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        LDI       _ACCA, 028h
                        ST        -Y, _ACCA
                        LDI       _ACCA, 0FEH ROLB _DEVICE
                        AND       Flags, _ACCA
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        .FRAME  3
                        LDI       _ACCCLO, DDS.ParamStr AND 0FFh
                        LDI       _ACCCHI, DDS.ParamStr SHRB 8
                        CALL      SYSTEM.UpperCaseStr
                        LDI       _ACCA, 028h
                        PUSH      _ACCA
                        LDD       _ACCA, Y+000h
                        POP       _ACCB
                        SUB       _ACCB, _ACCA
                        MOV       _ACCA, _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z, _ACCA
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .LINE     1194
                        .LOOP
                        MOVW      _ACCCLO, _FRAMEPTR
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 000h
                        ST        Z, _ACCA
                        LDI       _ACCA, 015h
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
DDS._L0505:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      DDS._L0506
                        CLR       _ACCA
DDS._L0506:
                        TST       _ACCA
                        .BRANCH   3,DDS._L0507
                        BREQ      DDS._L0507
                        .BRANCH   20,DDS._L0504
                        JMP       DDS._L0504
DDS._L0507:
                        .BLOCK    1195
                        .LINE     1195
                        LDI       _ACCCLO, DDS.ParamStr AND 0FFh
                        LDI       _ACCCHI, DDS.ParamStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCCLO, DDS.CmdStrArr AND 0FFh
                        LDI       _ACCCHI, DDS.CmdStrArr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCA, Y+003h
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LDI       _ACCBLO, 00004h AND 0FFh
                        LDI       _ACCBHI, 00004h SHRB 8
                        CLT
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.MUL16
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        POP       _ACCBHI
                        POP       _ACCBLO
                        SET
                        BLD       Flags, _STRCONST
                        CALL      SYSTEM.StringComp
                        LDI       _ACCA, 0h
                        BRNE      DDS._L0508
                        SER       _ACCA
DDS._L0508:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0511
                        BRNE      DDS._L0511
                        .BRANCH   20,DDS._L0509
                        JMP       DDS._L0509
DDS._L0511:
                        .BLOCK    1195
                        .LINE     1196
                        LDD       _ACCA, Y+003h
                        ADIW      _FRAMEPTR, 3
                        .BRANCH   20,DDS.Cmd2Index_X
                        JMP       DDS.Cmd2Index_X
                        .ENDBLOCK 1197
DDS._L0509:
DDS._L0510:
                        .ENDBLOCK 1198
DDS._L0503:
                        .LINE     1198
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,DDS._L0504
                        BREQ      DDS._L0504
                        .BRANCH   20,DDS._L0505
                        JMP       DDS._L0505
DDS._L0504:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .LINE     1199
                        LDI       _ACCA, 016h
                        .ENDBLOCK 1200
DDS.Cmd2Index_X:
                        .LINE     1200
                        .BRANCH   19
                        RET
                        .ENDFUNC  1200

                        .FUNC     ParseExtract, 004B2h, 00020h
DDS.ParseExtract:
                        SBIW      _FRAMEPTR, 2
                        .BLOCK    1206
                        .LINE     1207
                        LDI       _ACCCLO, DDS.ParamStr AND 0FFh
                        LDI       _ACCCHI, DDS.ParamStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        ADIW      _ACCCLO, 1
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        LDI       _ACCA, 028h
                        ST        -Y, _ACCA
                        LDI       _ACCA, 0FEH ROLB _DEVICE
                        AND       Flags, _ACCA
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        .FRAME  3
                        LDI       _ACCA, 028h
                        PUSH      _ACCA
                        LDD       _ACCA, Y+000h
                        POP       _ACCB
                        SUB       _ACCB, _ACCA
                        MOV       _ACCA, _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z, _ACCA
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .LINE     1208
                        LDI       _ACCA, 000h
                        STD       Y+000h, _ACCA
                        .LINE     1209
DDS._L0512:
                        LDI       _ACCCLO, DDS.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DDS.SerInpStr SHRB 8
                        LDS       _ACCA, DDS.SerInpPtr
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCA, Z+
                        CPI       _ACCA, 020h
                        LDI       _ACCA, 0h
                        BRNE      DDS._L0514
                        SER       _ACCA
DDS._L0514:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0515
                        BRNE      DDS._L0515
                        .BRANCH   20,DDS._L0513
                        JMP       DDS._L0513
DDS._L0515:
                        .BLOCK    1210
                        .LINE     1210
                        LDS       _ACCA, DDS.serInpPtr
                        INC       _ACCA
                        STS       DDS.serInpPtr, _ACCA
                        .ENDBLOCK 1211
                        .LINE     1211
                        .BRANCH   20,DDS._L0512
                        JMP       DDS._L0512
DDS._L0513:
                        .LINE     1212
                        LDI       _ACCCLO, DDS.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DDS.SerInpStr SHRB 8
                        LDS       _ACCA, DDS.SerInpPtr
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCA, Z+
                        CPI       _ACCA, 039h
                        .BRANCH   3,DDS._L0516
                        BREQ      DDS._L0516
                        .BRANCH   1,DDS._L0517
                        BRSH      DDS._L0517
                        CPI       _ACCA, 02Ah
                        .BRANCH   1,DDS._L0517
                        BRLO      DDS._L0517
                        CLR       _ACCDLO
                        .BRANCH   20,DDS._L0516
                        RJMP      DDS._L0516
DDS._L0517:
                        LDI       _ACCDLO, 001h
DDS._L0516:
                        LDI       _ACCA, 0h
                        BRNE      DDS._L0518
                        SER       _ACCA
DDS._L0518:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0521
                        BRNE      DDS._L0521
                        .BRANCH   20,DDS._L0519
                        JMP       DDS._L0519
DDS._L0521:
                        .BLOCK    1213
                        .LINE     1213
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .LINE     1214
                        .LOOP
                        LDI       _ACCCLO, DDS.i AND 0FFh
                        LDI       _ACCCHI, DDS.i SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDS       _ACCA, DDS.SerInpPtr
                        ST        Z, _ACCA
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCCLO, DDS.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DDS.SerInpStr SHRB 8
                        LD        _ACCA, Z
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
DDS._L0524:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      DDS._L0525
                        CLR       _ACCA
DDS._L0525:
                        TST       _ACCA
                        .BRANCH   3,DDS._L0526
                        BREQ      DDS._L0526
                        .BRANCH   20,DDS._L0523
                        JMP       DDS._L0523
DDS._L0526:
                        .BLOCK    1215
                        .LINE     1215
                        LDI       _ACCCLO, DDS.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DDS.SerInpStr SHRB 8
                        MOV       _ACCA, DDS.i
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCA, Z+
                        STD       Y+004h, _ACCA
                        .LINE     1216
                        LDD       _ACCA, Y+004h
                        CPI       _ACCA, 039h
                        LDI       _ACCA, 0FFh
                        BRLO      DDS._L0527
                        BREQ      DDS._L0527
                        CLR       _ACCA
DDS._L0527:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0530
                        BRNE      DDS._L0530
                        .BRANCH   20,DDS._L0528
                        JMP       DDS._L0528
DDS._L0530:
                        .BLOCK    1216
                        .LINE     1217
                        LDD       _ACCA, Y+004h
                        MOV       _ACCEHI, _ACCA
                        LDI       _ACCELO, 001h
                        LDI       _ACCA, _ACCELO SHRB 8
                        LDI       _ACCB, _ACCELO AND 0FFh
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDI       _ACCCLO, DDS.ParamStr AND 0FFh
                        LDI       _ACCCHI, DDS.ParamStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCA, 028h
                        PUSH      _ACCA
                        LDI       _ACCFHI, 000h
                        CALL      SYSTEM.StringAppend
                        .ENDBLOCK 1219
                        .BRANCH   20,DDS._L0529
                        JMP       DDS._L0529
DDS._L0528:
                        .BLOCK    1219
                        .LINE     1219
                        MOV       _ACCA, DDS.i
                        STS       DDS.SERINPPTR, _ACCA
                        .LINE     1220
                        LDD       _ACCA, Y+003h
                        ADIW      _FRAMEPTR, 3
                        .BRANCH   20,DDS.ParseExtract_X
                        JMP       DDS.ParseExtract_X
                        .ENDBLOCK 1221
DDS._L0529:
                        .ENDBLOCK 1222
DDS._L0522:
                        .LINE     1222
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,DDS._L0523
                        BREQ      DDS._L0523
                        .BRANCH   20,DDS._L0524
                        JMP       DDS._L0524
DDS._L0523:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .ENDBLOCK 1223
                        .BRANCH   20,DDS._L0520
                        JMP       DDS._L0520
DDS._L0519:
                        .BLOCK    1223
                        .LINE     1224
                        .LOOP
                        LDI       _ACCCLO, DDS.i AND 0FFh
                        LDI       _ACCCHI, DDS.i SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDS       _ACCA, DDS.SerInpPtr
                        ST        Z, _ACCA
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCCLO, DDS.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DDS.SerInpStr SHRB 8
                        LD        _ACCA, Z
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
DDS._L0533:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      DDS._L0534
                        CLR       _ACCA
DDS._L0534:
                        TST       _ACCA
                        .BRANCH   3,DDS._L0535
                        BREQ      DDS._L0535
                        .BRANCH   20,DDS._L0532
                        JMP       DDS._L0532
DDS._L0535:
                        .BLOCK    1225
                        .LINE     1225
                        LDI       _ACCCLO, DDS.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DDS.SerInpStr SHRB 8
                        MOV       _ACCA, DDS.i
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCA, Z+
                        STD       Y+004h, _ACCA
                        .LINE     1226
                        LDD       _ACCA, Y+004h
                        CPI       _ACCA, 041h
                        LDI       _ACCA, 0
                        BRLO      DDS._L0536
                        LDI       _ACCA, 0FFh
DDS._L0536:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0539
                        BRNE      DDS._L0539
                        .BRANCH   20,DDS._L0537
                        JMP       DDS._L0537
DDS._L0539:
                        .BLOCK    1226
                        .LINE     1227
                        LDD       _ACCA, Y+004h
                        MOV       _ACCEHI, _ACCA
                        LDI       _ACCELO, 001h
                        LDI       _ACCA, _ACCELO SHRB 8
                        LDI       _ACCB, _ACCELO AND 0FFh
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDI       _ACCCLO, DDS.ParamStr AND 0FFh
                        LDI       _ACCCHI, DDS.ParamStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCA, 028h
                        PUSH      _ACCA
                        LDI       _ACCFHI, 000h
                        CALL      SYSTEM.StringAppend
                        .ENDBLOCK 1229
                        .BRANCH   20,DDS._L0538
                        JMP       DDS._L0538
DDS._L0537:
                        .BLOCK    1229
                        .LINE     1229
                        MOV       _ACCA, DDS.i
                        STS       DDS.SERINPPTR, _ACCA
                        .LINE     1230
                        LDD       _ACCA, Y+003h
                        ADIW      _FRAMEPTR, 3
                        .BRANCH   20,DDS.ParseExtract_X
                        JMP       DDS.ParseExtract_X
                        .ENDBLOCK 1231
DDS._L0538:
                        .ENDBLOCK 1232
DDS._L0531:
                        .LINE     1232
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,DDS._L0532
                        BREQ      DDS._L0532
                        .BRANCH   20,DDS._L0533
                        JMP       DDS._L0533
DDS._L0532:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .ENDBLOCK 1233
DDS._L0520:
                        .LINE     1234
                        LDD       _ACCA, Y+000h
                        .ENDBLOCK 1235
DDS.ParseExtract_X:
                        .LINE     1235
                        .BRANCH   19
                        RET
                        .ENDFUNC  1235

                        .FUNC     ParseSubCh, 004D5h, 00020h
DDS.ParseSubCh:
                        SBIW      _FRAMEPTR, 12
                        .BLOCK    1248
                        .LINE     1249
                        LDI       _ACCCLO, DDS.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DDS.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCCLO, $St_String20 AND 0FFh
                        LDI       _ACCCHI, $St_String20 SHRB 8
                        POP       _ACCBHI
                        POP       _ACCBLO
                        SET
                        BLD       Flags, _STRCONST
                        CALL      SYSTEM.StringComp
                        LDI       _ACCA, 0h
                        BRNE      DDS._L0540
                        SER       _ACCA
DDS._L0540:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0543
                        BRNE      DDS._L0543
                        .BRANCH   20,DDS._L0541
                        JMP       DDS._L0541
DDS._L0543:
                        .BLOCK    1249
                        .LINE     1250
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,DDS.SERPROMPT
                        CALL      DDS.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1251
                        .BRANCH   20,DDS.ParseSubCh_X
                        JMP       DDS.ParseSubCh_X
                        .ENDBLOCK 1252
DDS._L0541:
DDS._L0542:
                        .LINE     1253
                        LDI       _ACCA, 03Ah
                        PUSH      _ACCA
                        LDI       _ACCCLO, DDS.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DDS.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCELO, 001h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCB
                        CALL      SYSTEM.PosChInVarStr
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      DDS._L0544
                        BRLO      DDS._L0544
                        SER       _ACCA
DDS._L0544:
                        STD       Y+005h, _ACCA
                        .LINE     1254
                        LDI       _ACCA, 03Dh
                        PUSH      _ACCA
                        LDI       _ACCCLO, DDS.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DDS.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCELO, 001h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCB
                        CALL      SYSTEM.PosChInVarStr
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      DDS._L0545
                        BRLO      DDS._L0545
                        SER       _ACCA
DDS._L0545:
                        COM       _ACCA
                        STD       Y+001h, _ACCA
                        .LINE     1255
                        LDI       _ACCCLO, DDS.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DDS.SerInpStr SHRB 8
                        ADIW      _ACCCLO, 00001h
                        LD        _ACCA, Z+
                        STD       Y+006h, _ACCA
                        .LINE     1256
                        LDD       _ACCA, Y+006h
                        CPI       _ACCA, 02Ah
                        LDI       _ACCA, 0h
                        BRNE      DDS._L0546
                        SER       _ACCA
DDS._L0546:
                        STD       Y+002h, _ACCA
                        .LINE     1257
                        LDD       _ACCA, Y+006h
                        CPI       _ACCA, 023h
                        LDI       _ACCA, 0h
                        BRNE      DDS._L0547
                        SER       _ACCA
DDS._L0547:
                        STD       Y+003h, _ACCA
                        .LINE     1258
                        LDD       _ACCA, Y+003h
                        TST       _ACCA
                        .BRANCH   4,DDS._L0550
                        BRNE      DDS._L0550
                        .BRANCH   20,DDS._L0548
                        JMP       DDS._L0548
DDS._L0550:
                        .BLOCK    1258
                        .LINE     1259
                        .BRANCH   17,DDS.WRITESERINP
                        CALL      DDS.WRITESERINP
                        .LINE     1260
                        .BRANCH   20,DDS.ParseSubCh_X
                        JMP       DDS.ParseSubCh_X
                        .ENDBLOCK 1261
DDS._L0548:
DDS._L0549:
                        .LINE     1262
                        LDI       _ACCA, 001h
                        STS       DDS.SERINPPTR, _ACCA
                        .LINE     1263
                        LDD       _ACCA, Y+005h
                        TST       _ACCA
                        .BRANCH   4,DDS._L0553
                        BRNE      DDS._L0553
                        .BRANCH   20,DDS._L0551
                        JMP       DDS._L0551
DDS._L0553:
                        .BLOCK    1263
                        .LINE     1264
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DDS.PARSEEXTRACT
                        CALL       DDS.PARSEEXTRACT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        STD       Y+000h, _ACCA
                        .LINE     1265
                        LDS       _ACCA, DDS.SerInpPtr
                        INC       _ACCA
                        STS       DDS.SerInpPtr, _ACCA
                        .LINE     1266
                        LDD       _ACCA, Y+002h
                        TST       _ACCA
                        .BRANCH   4,DDS._L0556
                        BRNE      DDS._L0556
                        .BRANCH   20,DDS._L0554
                        JMP       DDS._L0554
DDS._L0556:
                        .BLOCK    1267
                        .LINE     1267
                        .BRANCH   17,DDS.WRITESERINP
                        CALL      DDS.WRITESERINP
                        .ENDBLOCK 1268
                        .BRANCH   20,DDS._L0555
                        JMP       DDS._L0555
DDS._L0554:
                        .BLOCK    1268
                        .LINE     1269
                        LDI       _ACCCLO, DDS.ParamStr AND 0FFh
                        LDI       _ACCCHI, DDS.ParamStr SHRB 8
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        CLT
                        BLD       Flags, _ERRFLAG
                        LDI       _ACCB, 000h
                        CALL      SYSTEM.Str2Int
                        MOV       _ACCA, _ACCB
                        STS       DDS.CURRENTCH, _ACCA
                        .ENDBLOCK 1270
DDS._L0555:
                        .ENDBLOCK 1271
DDS._L0551:
DDS._L0552:
                        .LINE     1272
                        LDD       _ACCA, Y+002h
                        COM       _ACCA
                        PUSH      _ACCA
                        LDS       _ACCA, DDS.CurrentCh
                        PUSH      _ACCA
                        LDS       _ACCA, DDS.SlaveCh
                        POP       _ACCB
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0h
                        BREQ      DDS._L0557
                        SER       _ACCA
DDS._L0557:
                        POP       _ACCB
                        AND       _ACCA, _ACCB
                        PUSH      _ACCA
                        LDD       _ACCA, Y+005h
                        POP       _ACCB
                        AND       _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   4,DDS._L0560
                        BRNE      DDS._L0560
                        .BRANCH   20,DDS._L0558
                        JMP       DDS._L0558
DDS._L0560:
                        .BLOCK    1273
                        .LINE     1273
                        .BRANCH   17,DDS.WRITESERINP
                        CALL      DDS.WRITESERINP
                        .LINE     1274
                        .BRANCH   20,DDS.ParseSubCh_X
                        JMP       DDS.ParseSubCh_X
                        .ENDBLOCK 1275
DDS._L0558:
DDS._L0559:
                        .LINE     1279
                        LDI       _ACCA, 021h
                        PUSH      _ACCA
                        LDI       _ACCCLO, DDS.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DDS.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCELO, 001h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCB
                        CALL      SYSTEM.PosChInVarStr
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      DDS._L0561
                        BRLO      DDS._L0561
                        SER       _ACCA
DDS._L0561:
                        PUSH      _ACCA
                        LDI       _ACCA, 03Fh
                        PUSH      _ACCA
                        LDI       _ACCCLO, DDS.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DDS.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCELO, 001h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCB
                        CALL      SYSTEM.PosChInVarStr
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      DDS._L0562
                        BRLO      DDS._L0562
                        SER       _ACCA
DDS._L0562:
                        POP       _ACCB
                        OR        _ACCA, _ACCB
                        STS       DDS.VERBOSE, _ACCA
                        .LINE     1280
                        LDI       _ACCA, 024h
                        PUSH      _ACCA
                        LDI       _ACCCLO, DDS.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DDS.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCELO, 001h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCB
                        CALL      SYSTEM.PosChInVarStr
                        STD       Y+00Ah, _ACCA
                        .LINE     1281
                        LDD       _ACCA, Y+00Ah
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      DDS._L0563
                        BRLO      DDS._L0563
                        SER       _ACCA
DDS._L0563:
                        STD       Y+004h, _ACCA
                        .LINE     1282
                        LDD       _ACCA, Y+004h
                        TST       _ACCA
                        .BRANCH   4,DDS._L0566
                        BRNE      DDS._L0566
                        .BRANCH   20,DDS._L0564
                        JMP       DDS._L0564
DDS._L0566:
                        .BLOCK    1282
                        .LINE     1283
                        LDI       _ACCCLO, DDS.ParamStr AND 0FFh
                        LDI       _ACCCHI, DDS.ParamStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        ADIW      _ACCCLO, 1
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        LDI       _ACCA, 028h
                        ST        -Y, _ACCA
                        LDI       _ACCA, 0FEH ROLB _DEVICE
                        AND       Flags, _ACCA
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        .FRAME  3
                        LDI       _ACCCLO, DDS.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DDS.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCA, Y+00Dh
                        SUBI      _ACCA, -001h AND 0FFh
                        PUSH      _ACCA
                        LDI       _ACCA, 002h
                        POP       _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        CALL      SYSTEM.StrCopyV
                        LDI       _ACCA, 028h
                        PUSH      _ACCA
                        LDD       _ACCA, Y+000h
                        POP       _ACCB
                        SUB       _ACCB, _ACCA
                        MOV       _ACCA, _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z, _ACCA
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .LINE     1284
                        LDI       _ACCCLO, DDS.ParamStr AND 0FFh
                        LDI       _ACCCHI, DDS.ParamStr SHRB 8
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        CLT
                        BLD       Flags, _ERRFLAG
                        LDI       _ACCB, 0FFh
                        CALL      SYSTEM.Str2Int
                        MOV       _ACCA, _ACCB
                        STD       Y+008h, _ACCA
                        .LINE     1285
                        LDI       _ACCA, 000h
                        STD       Y+009h, _ACCA
                        .LINE     1286
                        .LOOP
                        LDI       _ACCCLO, DDS.i AND 0FFh
                        LDI       _ACCCHI, DDS.i SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 001h
                        ST        Z, _ACCA
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCA, Y+00Ch
                        SUBI      _ACCA, 001h AND 0FFh
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
DDS._L0569:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      DDS._L0570
                        CLR       _ACCA
DDS._L0570:
                        TST       _ACCA
                        .BRANCH   3,DDS._L0571
                        BREQ      DDS._L0571
                        .BRANCH   20,DDS._L0568
                        JMP       DDS._L0568
DDS._L0571:
                        .BLOCK    1287
                        .LINE     1287
                        LDI       _ACCCLO, DDS.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DDS.SerInpStr SHRB 8
                        MOV       _ACCA, DDS.i
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCA, Z+
                        STD       Y+009h, _ACCA
                        .LINE     1288
                        LDD       _ACCA, Y+00Ch
                        PUSH      _ACCA
                        LDD       _ACCA, Y+009h
                        POP       _ACCB
                        EOR       _ACCA, _ACCB
                        STD       Y+00Ch, _ACCA
                        .ENDBLOCK 1289
DDS._L0567:
                        .LINE     1289
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,DDS._L0568
                        BREQ      DDS._L0568
                        .BRANCH   20,DDS._L0569
                        JMP       DDS._L0569
DDS._L0568:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .LINE     1290
                        LDD       _ACCA, Y+009h
                        PUSH      _ACCA
                        LDD       _ACCA, Y+008h
                        POP       _ACCB
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0h
                        BREQ      DDS._L0572
                        SER       _ACCA
DDS._L0572:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0575
                        BRNE      DDS._L0575
                        .BRANCH   20,DDS._L0573
                        JMP       DDS._L0573
DDS._L0575:
                        .BLOCK    1290
                        .LINE     1291
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 007h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,DDS.SERPROMPT
                        CALL      DDS.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1292
                        .BRANCH   20,DDS.ParseSubCh_X
                        JMP       DDS.ParseSubCh_X
                        .ENDBLOCK 1293
DDS._L0573:
DDS._L0574:
                        .ENDBLOCK 1294
DDS._L0564:
DDS._L0565:
                        .LINE     1296
                        LDI       _ACCA, 019h
                        STS       DDS.ActivityTimer, _ACCA
                        .LINE     1297
                        CBI       00032h, 002h
                        .LINE     1301
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DDS.PARSEEXTRACT
                        CALL       DDS.PARSEEXTRACT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        TST       _ACCA
                        .BRANCH   4,DDS._L0578
                        BRNE      DDS._L0578
                        .BRANCH   20,DDS._L0576
                        JMP       DDS._L0576
DDS._L0578:
                        .BLOCK    1301
                        .LINE     1302
                        LDI       _ACCA, 000h
                        STD       Y+007h, _ACCA
                        .ENDBLOCK 1303
                        .BRANCH   20,DDS._L0577
                        JMP       DDS._L0577
DDS._L0576:
                        .BLOCK    1303
                        .LINE     1304
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DDS.CMD2INDEX
                        CALL       DDS.CMD2INDEX
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        STS       DDS.CMDWHICH, _ACCA
                        .LINE     1305
                        LDS       _ACCA, DDS.CmdWhich
                        CPI       _ACCA, 016h
                        LDI       _ACCA, 0h
                        BRNE      DDS._L0579
                        SER       _ACCA
DDS._L0579:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0582
                        BRNE      DDS._L0582
                        .BRANCH   20,DDS._L0580
                        JMP       DDS._L0580
DDS._L0582:
                        .BLOCK    1305
                        .LINE     1306
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 004h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,DDS.SERPROMPT
                        CALL      DDS.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1307
                        .BRANCH   20,DDS.ParseSubCh_X
                        JMP       DDS.ParseSubCh_X
                        .ENDBLOCK 1308
DDS._L0580:
DDS._L0581:
                        .LINE     1309
                        LDI       _ACCCLO, DDS.Cmd2SubChArr AND 0FFh
                        LDI       _ACCCHI, DDS.Cmd2SubChArr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DDS.CmdWhich
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LPM       _ACCA, Z
                        STD       Y+007h, _ACCA
                        .LINE     1310
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DDS.PARSEEXTRACT
                        CALL       DDS.PARSEEXTRACT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 1311
DDS._L0577:
                        .LINE     1312
                        LDI       _ACCCLO, DDS.ParamStr AND 0FFh
                        LDI       _ACCCHI, DDS.ParamStr SHRB 8
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        CLT
                        BLD       Flags, _ERRFLAG
                        LDI       _ACCB, 000h
                        CALL      SYSTEM.Str2Int
                        MOV       _ACCA, _ACCB
                        PUSH      _ACCA
                        LDD       _ACCA, Y+007h
                        POP       _ACCB
                        ADD       _ACCA, _ACCB
                        STS       DDS.SUBCH, _ACCA
                        .LINE     1314
                        LDD       _ACCA, Y+001h
                        TST       _ACCA
                        .BRANCH   4,DDS._L0585
                        BRNE      DDS._L0585
                        .BRANCH   20,DDS._L0583
                        JMP       DDS._L0583
DDS._L0585:
                        .BLOCK    1314
                        .LINE     1315
                        .BRANCH   17,DDS.PARSEGETPARAM
                        CALL      DDS.PARSEGETPARAM
                        .ENDBLOCK 1316
                        .BRANCH   20,DDS._L0584
                        JMP       DDS._L0584
DDS._L0583:
                        .BLOCK    1316
                        .LINE     1317
                        LDI       _ACCA, 03Dh
                        PUSH      _ACCA
                        LDI       _ACCCLO, DDS.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DDS.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCELO, 001h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCB
                        CALL      SYSTEM.PosChInVarStr
                        SUBI      _ACCA, -001h AND 0FFh
                        STS       DDS.SERINPPTR, _ACCA
                        .LINE     1318
                        LDS       _ACCA, DDS.SerInpPtr
                        CPI       _ACCA, 001h
                        LDI       _ACCA, 0h
                        BREQ      DDS._L0586
                        BRLO      DDS._L0586
                        SER       _ACCA
DDS._L0586:
                        PUSH      _ACCA
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DDS.PARSEEXTRACT
                        CALL       DDS.PARSEEXTRACT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        POP       _ACCB
                        AND       _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   4,DDS._L0589
                        BRNE      DDS._L0589
                        .BRANCH   20,DDS._L0587
                        JMP       DDS._L0587
DDS._L0589:
                        .BLOCK    1318
                        .LINE     1319
                        LDI       _ACCCLO, DDS.ParamStr AND 0FFh
                        LDI       _ACCCHI, DDS.ParamStr SHRB 8
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        CALL      SYSTEM.Str2Float
                        STS       DDS.PARAM, _ACCB
                        STS       DDS.PARAM+1, _ACCA
                        STS       DDS.PARAM+2, _ACCALO
                        STS       DDS.PARAM+3, _ACCAHI
                        .LINE     1320
                        LDS       _ACCB, DDS.Param
                        LDS       _ACCA, DDS.Param+1
                        LDS       _ACCALO, DDS.Param+2
                        LDS       _ACCAHI, DDS.Param+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.FloatToLInt
                        SBRC      _ACCAHI, 7
                        RJMP      DDS._L0590
                        OR        _ACCAHI, _ACCALO
                        BRNE      DDS._L0591
                        RJMP      DDS._L0592
DDS._L0590:
                        CPI       _ACCAHI, 0FFh
                        BRNE      DDS._L0591
                        CPI       _ACCALO, 0FFh
                        BREQ      DDS._L0592
DDS._L0591:
                        SET
                        BLD       Flags, _ERRFLAG
DDS._L0592:
                        STS       DDS.PARAMINT, _ACCB
                        STS       DDS.PARAMINT+1, _ACCA
                        .LINE     1321
                        LDS       _ACCB, DDS.ParamInt
                        LDS       _ACCA, DDS.ParamInt+1
                        MOV       _ACCA, _ACCB
                        STS       DDS.PARAMBYTE, _ACCA
                        .ENDBLOCK 1322
                        .BRANCH   20,DDS._L0588
                        JMP       DDS._L0588
DDS._L0587:
                        .BLOCK    1322
                        .LINE     1323
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 005h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,DDS.SERPROMPT
                        CALL      DDS.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1324
                        .BRANCH   20,DDS.ParseSubCh_X
                        JMP       DDS.ParseSubCh_X
                        .ENDBLOCK 1325
DDS._L0588:
                        .LINE     1326
                        .BRANCH   17,DDS.PARSESETPARAM
                        CALL      DDS.PARSESETPARAM
                        .ENDBLOCK 1327
DDS._L0584:
                        .ENDBLOCK 1328
DDS.ParseSubCh_X:
                        .LINE     1328
                        .BRANCH   19
                        RET
                        .ENDFUNC  1328

                        .FUNC     Chores, 00535h, 00020h
DDS.Chores:
                        .BLOCK    1335
                        .ENDBLOCK 1338
DDS.Chores_X:
                        .LINE     1338
                        .BRANCH   19
                        RET
                        .ENDFUNC  1338

                        .FUNC     CheckSer, 0053Ch, 00020h
DDS.CheckSer:
                        SBIW      _FRAMEPTR, 1
                        .BLOCK    1343
                        .LINE     1344
DDS._L0593:
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        MOVW      _ACCCLO, _FRAMEPTR
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 002h
                        ST        -Y, _ACCA
                        .FRAME  3
                        .FRAME  0
                        CALL       SYSTEM.SERINP_TO
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        TST       _ACCA
                        .BRANCH   4,DDS._L0595
                        BRNE      DDS._L0595
                        .BRANCH   20,DDS._L0594
                        JMP       DDS._L0594
DDS._L0595:
                        .BLOCK    1346
                        .LINE     1346
                        LDD       _ACCA, Y+000h
                        CPI       _ACCA, 07Fh
                        .BRANCH   3,DDS._L0596
                        BREQ      DDS._L0596
                        .BRANCH   1,DDS._L0597
                        BRSH      DDS._L0597
                        CPI       _ACCA, 020h
                        .BRANCH   1,DDS._L0597
                        BRLO      DDS._L0597
                        CLR       _ACCDLO
                        .BRANCH   20,DDS._L0596
                        RJMP      DDS._L0596
DDS._L0597:
                        LDI       _ACCDLO, 001h
DDS._L0596:
                        LDI       _ACCA, 0h
                        BRNE      DDS._L0598
                        SER       _ACCA
DDS._L0598:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0601
                        BRNE      DDS._L0601
                        .BRANCH   20,DDS._L0599
                        JMP       DDS._L0599
DDS._L0601:
                        .BLOCK    1347
                        .LINE     1347
                        LDD       _ACCA, Y+000h
                        MOV       _ACCEHI, _ACCA
                        LDI       _ACCELO, 001h
                        LDI       _ACCA, _ACCELO SHRB 8
                        LDI       _ACCB, _ACCELO AND 0FFh
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDI       _ACCCLO, DDS.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DDS.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCA, 03Fh
                        PUSH      _ACCA
                        LDI       _ACCFHI, 000h
                        CALL      SYSTEM.StringAppend
                        .ENDBLOCK 1348
DDS._L0599:
DDS._L0600:
                        .LINE     1349
                        LDD       _ACCA, Y+000h
                        CPI       _ACCA, 008h
                        LDI       _ACCA, 0h
                        BRNE      DDS._L0602
                        SER       _ACCA
DDS._L0602:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0605
                        BRNE      DDS._L0605
                        .BRANCH   20,DDS._L0603
                        JMP       DDS._L0603
DDS._L0605:
                        .BLOCK    1350
                        .LINE     1350
                        LDI       _ACCCLO, DDS.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DDS.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCCLO, DDS.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DDS.SerInpStr SHRB 8
                        LD        _ACCA, Z
                        SUBI      _ACCA, 001h AND 0FFh
                        POP       _ACCCHI
                        POP       _ACCCLO
                        CPI       _ACCA, 63
                        BRCS      DDS._L0606
                        LDI       _ACCA, 63
DDS._L0606:
                        ST        Z+, _ACCA
                        .ENDBLOCK 1351
DDS._L0603:
DDS._L0604:
                        .LINE     1352
                        LDD       _ACCA, Y+000h
                        CPI       _ACCA, 00Dh
                        LDI       _ACCA, 0h
                        BRNE      DDS._L0607
                        SER       _ACCA
DDS._L0607:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0610
                        BRNE      DDS._L0610
                        .BRANCH   20,DDS._L0608
                        JMP       DDS._L0608
DDS._L0610:
                        .BLOCK    1352
                        .LINE     1353
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DDS.PARSESUBCH
                        CALL      DDS.PARSESUBCH
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1363
                        LDI       _ACCCLO, DDS.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DDS.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        ADIW      _ACCCLO, 1
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        LDI       _ACCA, 03Fh
                        ST        -Y, _ACCA
                        LDI       _ACCA, 0FEH ROLB _DEVICE
                        AND       Flags, _ACCA
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        .FRAME  3
                        LDI       _ACCA, 03Fh
                        PUSH      _ACCA
                        LDD       _ACCA, Y+000h
                        POP       _ACCB
                        SUB       _ACCB, _ACCA
                        MOV       _ACCA, _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z, _ACCA
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDBLOCK 1364
DDS._L0608:
DDS._L0609:
                        .ENDBLOCK 1365
                        .LINE     1365
                        .BRANCH   20,DDS._L0593
                        JMP       DDS._L0593
DDS._L0594:
                        .ENDBLOCK 1367
DDS.CheckSer_X:
                        .LINE     1367
                        .BRANCH   19
                        RET
                        .ENDFUNC  1367

                        .FUNC     CheckDelay, 00559h, 00020h
DDS.CheckDelay:
                        SBIW      _FRAMEPTR, 1
                        .BLOCK    1372
                        .LINE     1373
                        .LOOP
                        MOVW      _ACCCLO, _FRAMEPTR
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 001h
                        ST        Z, _ACCA
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCA, Y+003h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
DDS._L0613:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      DDS._L0614
                        CLR       _ACCA
DDS._L0614:
                        TST       _ACCA
                        .BRANCH   3,DDS._L0615
                        BREQ      DDS._L0615
                        .BRANCH   20,DDS._L0612
                        JMP       DDS._L0612
DDS._L0615:
                        .BLOCK    1374
                        .LINE     1374
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DDS.CHECKSER
                        CALL      DDS.CHECKSER
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 1375
DDS._L0611:
                        .LINE     1375
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,DDS._L0612
                        BREQ      DDS._L0612
                        .BRANCH   20,DDS._L0613
                        JMP       DDS._L0613
DDS._L0612:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .ENDBLOCK 1376
DDS.CheckDelay_X:
                        .LINE     1376
                        .BRANCH   19
                        RET
                        .ENDFUNC  1376

                        .FUNC     initall, 00564h, 00020h
DDS.initall:
                        .BLOCK    1382
                        .LINE     1383
                        LDI       _ACCA, 01Fh
                        OUT       DDRB, _ACCA
                        .LINE     1384
                        LDI       _ACCA, 017h
                        OUT       PORTB, _ACCA
                        .LINE     1385
                        LDI       _ACCA, 0FCh
                        OUT       DDRC, _ACCA
                        .LINE     1386
                        LDI       _ACCA, 0FFh
                        OUT       PORTC, _ACCA
                        .LINE     1387
                        LDI       _ACCA, 00Ch
                        OUT       DDRD, _ACCA
                        .LINE     1388
                        LDI       _ACCA, 0FCh
                        OUT       PORTD, _ACCA
                        .LINE     1390
                        LDI       _ACCCLO, DDS.EESerBaudReg AND 0FFh
                        LDI       _ACCCHI, DDS.EESerBaudReg SHRB 8
                        CALL      SYSTEM.ReadEEp8
                        MOV       DDS.I, _ACCA
                        .LINE     1391
                        MOV       _ACCA, DDS.i
                        CPI       _ACCA, 0EFh
                        .BRANCH   3,DDS._L0616
                        BREQ      DDS._L0616
                        .BRANCH   1,DDS._L0617
                        BRSH      DDS._L0617
                        CPI       _ACCA, 009h
                        .BRANCH   1,DDS._L0617
                        BRLO      DDS._L0617
                        CLR       _ACCDLO
                        .BRANCH   20,DDS._L0616
                        RJMP      DDS._L0616
DDS._L0617:
                        LDI       _ACCDLO, 001h
DDS._L0616:
                        LDI       _ACCA, 0h
                        BRNE      DDS._L0618
                        SER       _ACCA
DDS._L0618:
                        COM       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DDS._L0621
                        BRNE      DDS._L0621
                        .BRANCH   20,DDS._L0619
                        JMP       DDS._L0619
DDS._L0621:
                        .BLOCK    1391
                        .LINE     1392
                        LDI       _ACCA, 033h
                        LDI       _ACCCLO, DDS.EESERBAUDREG AND 0FFh
                        LDI       _ACCCHI, DDS.EESERBAUDREG SHRB 8
                        CALL      SYSTEM.WriteEEp8
                        ADIW      _ACCCLO, 01h
                        .LINE     1393
                        LDI       _ACCA, 033h
                        MOV       DDS.I, _ACCA
                        .ENDBLOCK 1394
DDS._L0619:
DDS._L0620:
                        .LINE     1395
                        MOV       _ACCA, DDS.i
                        OUT       UBRR1, _ACCA
                        .LINE     1396
                        IN        _ACCA, UCSRA
                        ORI       _ACCA, 002h
                        OUT       UCSRA, _ACCA
                        .LINE     1401
                        .BRANCH   17,DDS.PATCHCOPYFROMEE
                        CALL      DDS.PATCHCOPYFROMEE
                        .LINE     1403
                        LDI       _ACCA, 001h
                        .FRAME  0
                        CALL      SYSTEM.UDELAY
                        .LINE     1404
                        IN        _ACCA, PinD
                        COM       _ACCA
                        LDI       _ACCALO, 005h
                        CALL      SYSTEM.SHR8_R
                        STS       DDS.SLAVECH, _ACCA
                        .LINE     1405
                        CBI       00032h, 002h
                        .LINE     1408
                        LDI       _ACCA, 000h
                        .FRAME  0
                        CALL       SYSTEM.LCDSETUP_M
                        TST       _ACCA
                        .BRANCH   4,DDS._L0624
                        BRNE      DDS._L0624
                        .BRANCH   20,DDS._L0622
                        JMP       DDS._L0622
DDS._L0624:
                        .BLOCK    1408
                        .LINE     1409
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  3
                        .FRAME  0
                        CALL      SYSTEM.LCDCURSOR_M
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1410
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  3
                        LDI       _ACCA, 003h
                        ST        -Y, _ACCA
                        .FRAME  4
                        LDI       _ACCA, 007h
                        ST        -Y, _ACCA
                        .FRAME  5
                        LDI       _ACCA, 00Fh
                        ST        -Y, _ACCA
                        .FRAME  6
                        LDI       _ACCA, 007h
                        ST        -Y, _ACCA
                        .FRAME  7
                        LDI       _ACCA, 003h
                        ST        -Y, _ACCA
                        .FRAME  8
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  9
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  10
                        .FRAME  0
                        CALL      SYSTEM.LCDCHARSET_M
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1411
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  2
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  3
                        LDI       _ACCA, 003h
                        ST        -Y, _ACCA
                        .FRAME  4
                        LDI       _ACCA, 005h
                        ST        -Y, _ACCA
                        .FRAME  5
                        LDI       _ACCA, 009h
                        ST        -Y, _ACCA
                        .FRAME  6
                        LDI       _ACCA, 005h
                        ST        -Y, _ACCA
                        .FRAME  7
                        LDI       _ACCA, 003h
                        ST        -Y, _ACCA
                        .FRAME  8
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  9
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  10
                        .FRAME  0
                        CALL      SYSTEM.LCDCHARSET_M
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1412
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 002h
                        ST        -Y, _ACCA
                        .FRAME  2
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  3
                        LDI       _ACCA, 002h
                        ST        -Y, _ACCA
                        .FRAME  4
                        LDI       _ACCA, 005h
                        ST        -Y, _ACCA
                        .FRAME  5
                        LDI       _ACCA, 00Ah
                        ST        -Y, _ACCA
                        .FRAME  6
                        LDI       _ACCA, 005h
                        ST        -Y, _ACCA
                        .FRAME  7
                        LDI       _ACCA, 002h
                        ST        -Y, _ACCA
                        .FRAME  8
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  9
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  10
                        .FRAME  0
                        CALL      SYSTEM.LCDCHARSET_M
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1414
                        LDI       _ACCA, 0FFh
                        STS       DDS.LCDPRESENT, _ACCA
                        .LINE     1415
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, DDS.Vers3Str AND 0FFh
                        LDI       _ACCCHI, DDS.Vers3Str SHRB 8
                        LPM       _ACCBHI, Z+
                        TST       _ACCBHI
                        BREQ      DDS._L0625
                        CALL      SYSTEM.StrConst2Str
DDS._L0625:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     1416
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  3
                        .FRAME  0
                        CALL      SYSTEM.LCDXY_M
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1417
                        LDI       _ACCCLO, DDS.EEinitialised AND 0FFh
                        LDI       _ACCCHI, DDS.EEinitialised SHRB 8
                        CALL      SYSTEM._ReadEEp16
                        CPI       _ACCA, 0AAh
                        BRNE      DDS._L0626
                        CPI       _ACCB, 055h
DDS._L0626:
                        LDI       _ACCA, 0h
                        BREQ      DDS._L0627
                        SER       _ACCA
DDS._L0627:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0630
                        BRNE      DDS._L0630
                        .BRANCH   20,DDS._L0628
                        JMP       DDS._L0628
DDS._L0630:
                        .BLOCK    1417
                        .LINE     1418
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, DDS.EEnotProgrammedStr AND 0FFh
                        LDI       _ACCCHI, DDS.EEnotProgrammedStr SHRB 8
                        LPM       _ACCBHI, Z+
                        TST       _ACCBHI
                        BREQ      DDS._L0631
                        CALL      SYSTEM.StrConst2Str
DDS._L0631:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .ENDBLOCK 1419
                        .BRANCH   20,DDS._L0629
                        JMP       DDS._L0629
DDS._L0628:
                        .BLOCK    1419
                        .LINE     1420
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, DDS.AdrStr AND 0FFh
                        LDI       _ACCCHI, DDS.AdrStr SHRB 8
                        LPM       _ACCBHI, Z+
                        TST       _ACCBHI
                        BREQ      DDS._L0632
                        CALL      SYSTEM.StrConst2Str
DDS._L0632:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     1421
                        LDS       _ACCA, DDS.SlaveCh
                        SUBI      _ACCA, -030h AND 0FFh
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .ENDBLOCK 1422
DDS._L0629:
                        .ENDBLOCK 1423
DDS._L0622:
DDS._L0623:
                        .LINE     1426
                        LDI       _ACCA, 004h
                        STS       DDS.OLDRANGE, _ACCA
                        .LINE     1427
                        LDI       _ACCA, 001h
                        STS       DDS.RANGE, _ACCA
                        .LINE     1428
                        .BRANCH   17,DDS.SWITCHRANGE
                        CALL      DDS.SWITCHRANGE
                        .LINE     1430
                        LDI       _ACCA, 003E8h SHRB 8
                        LDI       _ACCB, 003E8h AND 0FFh
                        .FRAME  0
                        CALL      SYSTEM.MDELAY
                        .LINE     1431
                        LDS       _ACCA, DDS.SlaveCh
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      DDS._L0633
                        BRLO      DDS._L0633
                        SER       _ACCA
DDS._L0633:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0636
                        BRNE      DDS._L0636
                        .BRANCH   20,DDS._L0634
                        JMP       DDS._L0634
DDS._L0636:
                        .BLOCK    1431
                        .LINE     1432
                        .LOOP
                        LDI       _ACCCLO, DDS.i AND 0FFh
                        LDI       _ACCCHI, DDS.i SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 000h
                        ST        Z, _ACCA
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DDS.SlaveCh
                        SUBI      _ACCA, 001h AND 0FFh
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
DDS._L0639:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      DDS._L0640
                        CLR       _ACCA
DDS._L0640:
                        TST       _ACCA
                        .BRANCH   3,DDS._L0641
                        BREQ      DDS._L0641
                        .BRANCH   20,DDS._L0638
                        JMP       DDS._L0638
DDS._L0641:
                        .BLOCK    1433
                        .LINE     1433
                        CLR       _ACCA
                        SBIC      032h, 002h
                        SER       _ACCA
                        COM       _ACCA
                        CLT
                        TST       _ACCA
                        BREQ      DDS._L0642
                        SET
DDS._L0642:
                        IN        _ACCA, 00032h
                        BLD       _ACCA, 002h
                        OUT       00032h, _ACCA
                        .LINE     1434
                        LDI       _ACCA, 00096h SHRB 8
                        LDI       _ACCB, 00096h AND 0FFh
                        .FRAME  3
                        CALL      SYSTEM.MDELAY
                        .LINE     1435
                        CLR       _ACCA
                        SBIC      032h, 002h
                        SER       _ACCA
                        COM       _ACCA
                        CLT
                        TST       _ACCA
                        BREQ      DDS._L0643
                        SET
DDS._L0643:
                        IN        _ACCA, 00032h
                        BLD       _ACCA, 002h
                        OUT       00032h, _ACCA
                        .LINE     1436
                        LDI       _ACCA, 00096h SHRB 8
                        LDI       _ACCB, 00096h AND 0FFh
                        .FRAME  3
                        CALL      SYSTEM.MDELAY
                        .ENDBLOCK 1437
DDS._L0637:
                        .LINE     1437
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,DDS._L0638
                        BREQ      DDS._L0638
                        .BRANCH   20,DDS._L0639
                        JMP       DDS._L0639
DDS._L0638:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .ENDBLOCK 1438
DDS._L0634:
DDS._L0635:
                        .LINE     1439
                        SBI       00032h, 002h
                        .LINE     1441
                        LDI       _ACCA, 000h
                        STS       DDS.STATUS, _ACCA
                        .LINE     1442
                        LDI       _ACCA, 1 SHLB IntFlag
                        OR        Flags, _ACCA
                        SEI
                        .LINE     1444
                        LDI       _ACCA, 001h
                        STS       DDS.BURSTCOUNT, _ACCA
                        .LINE     1445
                        LDI       _ACCA, 001h
                        STS       DDS.BurstTimer, _ACCA
                        .LINE     1446
DDS._L0644:
                        CALL       SYSTEM.SERSTAT
                        TST       _ACCA
                        .BRANCH   4,DDS._L0646
                        BRNE      DDS._L0646
                        .BRANCH   20,DDS._L0645
                        JMP       DDS._L0645
DDS._L0646:
                        .BLOCK    1446
                        .LINE     1447
                        CALL       SYSTEM.SERINP
                        MOV       DDS.I, _ACCA
                        .ENDBLOCK 1448
                        .LINE     1448
                        .BRANCH   20,DDS._L0644
                        JMP       DDS._L0644
DDS._L0645:
                        .LINE     1450
                        CALL      SYSTEM.INCRCOUNT4START
                        .LINE     1451
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCB, 000000000h AND 0FFh
                        LDI       _ACCA, 000000000h SHRB 8
                        LDI       _ACCALO, 000000000h SHRB 16
                        LDI       _ACCAHI, 000000000h SHRB 24
                        ST        -Y, _ACCAHI
                        ST        -Y, _ACCALO
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  5
                        .FRAME  0
                        CALL      SYSTEM.SETINCRVAL4
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1452
                        LDI       _ACCA, 000h
                        .FRAME  0
                        CALL       SYSTEM.GETINCRVAL4
                        STS       DDS.INCRVALUE, _ACCB
                        STS       DDS.INCRVALUE+1, _ACCA
                        STS       DDS.INCRVALUE+2, _ACCALO
                        STS       DDS.INCRVALUE+3, _ACCAHI
                        .LINE     1453
                        LDS       _ACCB, DDS.IncrValue
                        LDS       _ACCA, DDS.IncrValue+1
                        LDS       _ACCALO, DDS.IncrValue+2
                        LDS       _ACCAHI, DDS.IncrValue+3
                        STS       DDS.OLDINCRVALUE, _ACCB
                        STS       DDS.OLDINCRVALUE+1, _ACCA
                        STS       DDS.OLDINCRVALUE+2, _ACCALO
                        STS       DDS.OLDINCRVALUE+3, _ACCAHI
                        .LINE     1454
                        LDI       _ACCA, 00000h SHRB 8
                        LDI       _ACCB, 00000h AND 0FFh
                        STS       DDS.INCRDIFF, _ACCB
                        STS       DDS.INCRDIFF+1, _ACCA
                        .LINE     1455
                        LDI       _ACCA, 000h
                        STS       DDS.INCRFINE, _ACCA
                        .LINE     1457
                        LDI       _ACCA, 001h
                        STS       DDS.MODIFY, _ACCA
                        .LINE     1458
                        LDS       _ACCB, DDS.DACLevel
                        LDS       _ACCA, DDS.DACLevel+1
                        LDS       _ACCALO, DDS.DACLevel+2
                        LDS       _ACCAHI, DDS.DACLevel+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 07Ah
                        LDI       _ACCAHI, 044h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      DDS._L0648
                        BRPL      DDS._L0649
                        BRMI      DDS._L0647
DDS._L0649:
                        CLZ
                        CLC
                        RJMP      DDS._L0648
DDS._L0647:
                        CLZ
                        SEC
DDS._L0648:
                        LDI       _ACCA, 0h
                        BREQ      DDS._L0650
                        BRLO      DDS._L0650
                        SER       _ACCA
DDS._L0650:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0653
                        BRNE      DDS._L0653
                        .BRANCH   20,DDS._L0651
                        JMP       DDS._L0651
DDS._L0653:
                        .BLOCK    1459
                        .LINE     1459
                        LDI       _ACCA, 0FFh
                        STS       DDS.LEVELRANGE, _ACCA
                        .ENDBLOCK 1460
DDS._L0651:
DDS._L0652:
                        .LINE     1461
                        LDI       _ACCA, 001F4h SHRB 8
                        LDI       _ACCB, 001F4h AND 0FFh
                        .FRAME  0
                        CALL      SYSTEM.MDELAY
                        .LINE     1462
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DDS.SETLEVELDDS
                        CALL      DDS.SETLEVELDDS
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1463
                        LDI       _ACCA, 000FAh SHRB 8
                        LDI       _ACCB, 000FAh AND 0FFh
                        .FRAME  0
                        CALL      SYSTEM.MDELAY
                        .LINE     1464
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DDS.SETLEVELDDS
                        CALL      DDS.SETLEVELDDS
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1465
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCB, DDS.DACLevel
                        LDS       _ACCA, DDS.DACLevel+1
                        LDS       _ACCALO, DDS.DACLevel+2
                        LDS       _ACCAHI, DDS.DACLevel+3
                        ST        -Y, _ACCAHI
                        ST        -Y, _ACCALO
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  4
                        .FRAME  0
                        .BRANCH   17,DDS.DACLEVEL2DB
                        CALL       DDS.DACLEVEL2DB
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        STS       DDS.DB, _ACCB
                        STS       DDS.DB+1, _ACCA
                        STS       DDS.DB+2, _ACCALO
                        STS       DDS.DB+3, _ACCAHI
                        .LINE     1467
                        LDI       _ACCA, 0FFh
                        STS       DDS.FIRSTTURN, _ACCA
                        .LINE     1468
                        LDI       _ACCA, 0FEh
                        STS       DDS.SUBCH, _ACCA
                        .LINE     1469
                        .BRANCH   17,DDS.WRITECHPREFIX
                        CALL      DDS.WRITECHPREFIX
                        .LINE     1470
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.serout SHRB 1
                        LDI       _ACCA, SYSTEM.serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, DDS.Vers1Str AND 0FFh
                        LDI       _ACCCHI, DDS.Vers1Str SHRB 8
                        LPM       _ACCBHI, Z+
                        TST       _ACCBHI
                        BREQ      DDS._L0654
                        CALL      SYSTEM.StrConst2Str
DDS._L0654:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     1471
                        LDI       _ACCCLO, DDS.EEinitialised AND 0FFh
                        LDI       _ACCCHI, DDS.EEinitialised SHRB 8
                        CALL      SYSTEM._ReadEEp16
                        CPI       _ACCA, 0AAh
                        BRNE      DDS._L0655
                        CPI       _ACCB, 055h
DDS._L0655:
                        LDI       _ACCA, 0h
                        BREQ      DDS._L0656
                        SER       _ACCA
DDS._L0656:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0659
                        BRNE      DDS._L0659
                        .BRANCH   20,DDS._L0657
                        JMP       DDS._L0657
DDS._L0659:
                        .BLOCK    1471
                        .LINE     1472
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.Serout SHRB 1
                        LDI       _ACCA, SYSTEM.Serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, DDS.EEnotProgrammedStr AND 0FFh
                        LDI       _ACCCHI, DDS.EEnotProgrammedStr SHRB 8
                        LPM       _ACCBHI, Z+
                        TST       _ACCBHI
                        BREQ      DDS._L0660
                        CALL      SYSTEM.StrConst2Str
DDS._L0660:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .ENDBLOCK 1473
DDS._L0657:
DDS._L0658:
                        .LINE     1474
                        .BRANCH   17,DDS.SERCRLF
                        CALL      DDS.SERCRLF
                        .LINE     1475
                        LDI       _ACCA, 0FFh
                        STS       DDS.CURRENTCH, _ACCA
                        .LINE     1476
                        LDI       _ACCA, 00000h SHRB 8
                        LDI       _ACCB, 00000h AND 0FFh
                        STS       DDS.ERRCOUNT, _ACCB
                        STS       DDS.ERRCOUNT+1, _ACCA
                        .LINE     1477
                        LDI       _ACCA, 0FFh
                        STS       DDS.CHANGEDFLAG, _ACCA
                        .ENDBLOCK 1478
DDS.initall_X:
                        .LINE     1478
                        .BRANCH   19
                        RET
                        .ENDFUNC  1478



                        ; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                        ; Program body
                        ; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

                        .FUNC     $_Main, 005CAh, 00020h
                        .ENTRYMAIN $
DDS.$_Main:

                        .BLOCK    1482
                        .LINE     1483
                        .BRANCH   17,DDS.INITALL
                        CALL      DDS.INITALL
DDS._L0661:
                        .BLOCK    1485
                        .LINE     1486
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DDS.CHECKSER
                        CALL      DDS.CHECKSER
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1487
                        SER       _ACCA
                        LDS       _ACCB, DDS.ActivityTimer
                        TST       _ACCB
                        BREQ      DDS._L0663
                        COM       _ACCA
DDS._L0663:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0666
                        BRNE      DDS._L0666
                        .BRANCH   20,DDS._L0664
                        JMP       DDS._L0664
DDS._L0666:
                        .BLOCK    1487
                        .LINE     1488
                        SBI       00032h, 002h
                        .ENDBLOCK 1489
DDS._L0664:
DDS._L0665:
                        .LINE     1491
                        LDS       _ACCA, DDS.LCDpresent
                        PUSH      _ACCA
                        CALL       SYSTEM.SERSTAT
                        COM       _ACCA
                        POP       _ACCB
                        AND       _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   4,DDS._L0669
                        BRNE      DDS._L0669
                        .BRANCH   20,DDS._L0667
                        JMP       DDS._L0667
DDS._L0669:
                        .BLOCK    1491
                        .LINE     1492
                        LDI       _ACCA, 000h
                        .FRAME  0
                        CALL       SYSTEM.GETINCRVAL4
                        STS       DDS.INCRVALUE, _ACCB
                        STS       DDS.INCRVALUE+1, _ACCA
                        STS       DDS.INCRVALUE+2, _ACCALO
                        STS       DDS.INCRVALUE+3, _ACCAHI
                        .LINE     1494
                        LDS       _ACCB, DDS.IncrValue
                        LDS       _ACCA, DDS.IncrValue+1
                        LDS       _ACCALO, DDS.IncrValue+2
                        LDS       _ACCAHI, DDS.IncrValue+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DDS.OldIncrValue
                        LDS       _ACCA, DDS.OldIncrValue+1
                        LDS       _ACCALO, DDS.OldIncrValue+2
                        LDS       _ACCAHI, DDS.OldIncrValue+3
                        MOVW      _ACCBLO, _ACCB
                        MOVW      _ACCCLO, _ACCALO
                        POP       _ACCAHI
                        POP       _ACCALO
                        POP       _ACCA
                        POP       _ACCB
                        LDI       _ACCDLO, 080h
                        EOR       _ACCCHI, _ACCDLO
                        EOR       _ACCAHI, _ACCDLO
                        CP        _ACCAHI, _ACCCHI
                        BRNE      DDS._L0670
                        CP        _ACCALO, _ACCCLO
                        BRNE      DDS._L0670
                        CP        _ACCA, _ACCBHI
                        BRNE      DDS._L0670
                        CP        _ACCB, _ACCBLO
DDS._L0670:
                        LDI       _ACCA, 0h
                        BREQ      DDS._L0671
                        SER       _ACCA
DDS._L0671:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0674
                        BRNE      DDS._L0674
                        .BRANCH   20,DDS._L0672
                        JMP       DDS._L0672
DDS._L0674:
                        .BLOCK    1494
                        .LINE     1495
                        LDI       _ACCA, 019h
                        STS       DDS.ActivityTimer, _ACCA
                        .LINE     1496
                        CBI       00032h, 002h
                        .LINE     1497
                        LDS       _ACCB, DDS.IncrDiff
                        LDS       _ACCA, DDS.IncrDiff+1
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDS       _ACCB, DDS.IncrValue
                        LDS       _ACCA, DDS.IncrValue+1
                        LDS       _ACCALO, DDS.IncrValue+2
                        LDS       _ACCAHI, DDS.IncrValue+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DDS.OldIncrValue
                        LDS       _ACCA, DDS.OldIncrValue+1
                        LDS       _ACCALO, DDS.OldIncrValue+2
                        LDS       _ACCAHI, DDS.OldIncrValue+3
                        SUBI      _ACCB, 01h
                        SBCI      _ACCA, 00h
                        SBCI      _ACCALO, 00h
                        SBCI      _ACCAHI, 00h
                        COM       _ACCALO
                        COM       _ACCAHI
                        COM       _ACCA
                        COM       _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        ADD       _ACCB, _ACCBLO
                        ADC       _ACCA, _ACCBHI
                        ADC       _ACCALO, _ACCCLO
                        ADC       _ACCAHI, _ACCCHI
                        POP       _ACCAHI
                        POP       _ACCALO
                        ADD       _ACCB, _ACCALO
                        ADC       _ACCA, _ACCAHI
                        STS       DDS.INCRDIFF, _ACCB
                        STS       DDS.INCRDIFF+1, _ACCA
                        .LINE     1498
                        LDS       _ACCB, DDS.IncrValue
                        LDS       _ACCA, DDS.IncrValue+1
                        LDS       _ACCALO, DDS.IncrValue+2
                        LDS       _ACCAHI, DDS.IncrValue+3
                        STS       DDS.OLDINCRVALUE, _ACCB
                        STS       DDS.OLDINCRVALUE+1, _ACCA
                        STS       DDS.OLDINCRVALUE+2, _ACCALO
                        STS       DDS.OLDINCRVALUE+3, _ACCAHI
                        .LINE     1499
                        LDI       _ACCA, 014h
                        STS       DDS.IncrTimer, _ACCA
                        .LINE     1500
                        LDS       _ACCB, DDS.IncrDiff
                        LDS       _ACCA, DDS.IncrDiff+1
                        TST       _ACCA
                        BRPL      DDS._L0675
                        NEG       _ACCB
                        BRNE      DDS._L0676
                        DEC       _ACCA
DDS._L0676:
                        COM       _ACCA
DDS._L0675:
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDS       _ACCB, DDS.IncRast
                        LDS       _ACCA, DDS.IncRast+1
                        MOVW      _ACCALO, _ACCB
                        POP       _ACCA
                        POP       _ACCB
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        EOR       _ACCAHI, _ACCBLO
                        CP        _ACCA, _ACCAHI
                        BRNE      DDS._L0677
                        CP        _ACCB, _ACCALO
DDS._L0677:
                        LDI       _ACCA, 0
                        BRLO      DDS._L0678
                        LDI       _ACCA, 0FFh
DDS._L0678:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0681
                        BRNE      DDS._L0681
                        .BRANCH   20,DDS._L0679
                        JMP       DDS._L0679
DDS._L0681:
                        .BLOCK    1501
                        .LINE     1501
                        LDI       _ACCA, 0FFh
                        STS       DDS.CHANGEDFLAG, _ACCA
                        .LINE     1503
                        LDS       _ACCB, DDS.IncrDiff
                        LDS       _ACCA, DDS.IncrDiff+1
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDS       _ACCB, DDS.IncRast
                        LDS       _ACCA, DDS.IncRast+1
                        SET
                        BLD       Flags, _SIGN
                        POP       _ACCBHI
                        POP       _ACCBLO
                        CALL      SYSTEM.DIV16
                        STS       DDS.INCRDIFF, _ACCB
                        STS       DDS.INCRDIFF+1, _ACCA
                        .LINE     1506
                        LDS       _ACCB, DDS.IncrDiff
                        LDS       _ACCA, DDS.IncrDiff+1
                        TST       _ACCA
                        BREQ      DDS._L0682
                        BRPL      DDS._L0683
                        SER       _ACCB
                        SER       _ACCA
                        RJMP      DDS._L0684
DDS._L0682:
                        TST       _ACCB
                        BREQ      DDS._L0684
DDS._L0683:
                        CLR       _ACCA
                        LDI       _ACCB, 1
DDS._L0684:
                        STS       DDS.INCRACCINT10, _ACCB
                        STS       DDS.INCRACCINT10+1, _ACCA
                        .LINE     1507
                        LDS       _ACCB, DDS.IncrDiff
                        LDS       _ACCA, DDS.IncrDiff+1
                        MOV       _ACCA, _ACCB
                        STS       DDS.INCRDIFFBYTE, _ACCA
                        .LINE     1508
                        LDS       _ACCB, DDS.IncrAccInt10
                        LDS       _ACCA, DDS.IncrAccInt10+1
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDI       _ACCCLO, DDS.IncrAccArray AND 0FFh
                        LDI       _ACCCHI, DDS.IncrAccArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCB, DDS.IncrDiff
                        LDS       _ACCA, DDS.IncrDiff+1
                        TST       _ACCA
                        BRPL      DDS._L0685
                        NEG       _ACCB
                        BRNE      DDS._L0686
                        DEC       _ACCA
DDS._L0686:
                        COM       _ACCA
DDS._L0685:
                        MOV       _ACCA, _ACCB
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LPM       _ACCB, Z+
                        LPM       _ACCA, Z
                        SET
                        BLD       Flags, _SIGN
                        POP       _ACCBHI
                        POP       _ACCBLO
                        CALL      SYSTEM.MUL16
                        STS       DDS.INCRDIFF, _ACCB
                        STS       DDS.INCRDIFF+1, _ACCA
                        .LINE     1515
                        LDS       _ACCB, DDS.IncrDiff
                        LDS       _ACCA, DDS.IncrDiff+1
                        LDI       _ACCBLO, 0000Ah AND 0FFh
                        LDI       _ACCBHI, 0000Ah SHRB 8
                        SET
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.MUL16
                        STS       DDS.INCRACCINT10, _ACCB
                        STS       DDS.INCRACCINT10+1, _ACCA
                        .LINE     1516
                        LDS       _ACCB, DDS.IncrDiff
                        LDS       _ACCA, DDS.IncrDiff+1
                        SBRS      _ACCA, 7
                        RJMP      DDS._L0687
                        LDI       _ACCAHI, 0FFh
                        LDI       _ACCALO, 0FFh
                        RJMP      DDS._L0688
DDS._L0687:
                        CLR       _ACCAHI
                        CLR       _ACCALO
DDS._L0688:
                        SET
                        BLD       Flags, _SIGN
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.LIntToFloat
                        STS       DDS.INCRACCFLOAT, _ACCB
                        STS       DDS.INCRACCFLOAT+1, _ACCA
                        STS       DDS.INCRACCFLOAT+2, _ACCALO
                        STS       DDS.INCRACCFLOAT+3, _ACCAHI
                        .LINE     1517
                        LDI       _ACCA, 096h
                        STS       DDS.DisplayTimer, _ACCA
                        .LINE     1518
                        LDS       _ACCA, DDS.FirstTurn
                        TST       _ACCA
                        .BRANCH   4,DDS._L0691
                        BRNE      DDS._L0691
                        .BRANCH   20,DDS._L0689
                        JMP       DDS._L0689
DDS._L0691:
                        .BLOCK    1518
                        .LINE     1519
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDS       _ACCA, DDS.Status
                        SUBI      _ACCA, -043h AND 0FFh
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,DDS.SERPROMPT
                        CALL      DDS.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 1520
DDS._L0689:
DDS._L0690:
                        .LINE     1521
                        LDS       _ACCA, DDS.Modify
                        .LINE     1522
                        CPI       _ACCA, 1
                        .BRANCH   3,DDS._L0695
                        BREQ      DDS._L0695
                        .BRANCH   20,DDS._L0694
                        JMP       DDS._L0694
DDS._L0695:
DDS._L0693:
                        .BLOCK    1523
                        .LINE     1523
                        LDS       _ACCA, DDS.IncrFine
                        TST       _ACCA
                        .BRANCH   4,DDS._L0698
                        BRNE      DDS._L0698
                        .BRANCH   20,DDS._L0696
                        JMP       DDS._L0696
DDS._L0698:
                        .BLOCK    1523
                        .LINE     1524
                        LDS       _ACCA, DDS.FirstTurn
                        TST       _ACCA
                        .BRANCH   4,DDS._L0701
                        BRNE      DDS._L0701
                        .BRANCH   20,DDS._L0699
                        JMP       DDS._L0699
DDS._L0701:
                        .BLOCK    1524
                        .LINE     1525
                        LDS       _ACCB, DDS.Frequenz
                        LDS       _ACCA, DDS.Frequenz+1
                        LDS       _ACCALO, DDS.Frequenz+2
                        LDS       _ACCAHI, DDS.Frequenz+3
                        MOVW      _ACCDLO, _ACCB
                        MOVW      _ACCELO, _ACCALO
                        LDI       _ACCBLO, 00000000Ah AND 0FFh
                        LDI       _ACCBHI, 00000000Ah SHRB 8
                        LDI       _ACCCLO, 00000000Ah SHRB 16
                        LDI       _ACCCHI, 00000000Ah SHRB 24
                        SET
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.DIV32_R
                        STS       DDS.FREQUENZ, _ACCB
                        STS       DDS.FREQUENZ+1, _ACCA
                        STS       DDS.FREQUENZ+2, _ACCALO
                        STS       DDS.FREQUENZ+3, _ACCAHI
                        .LINE     1526
                        LDS       _ACCB, DDS.Frequenz
                        LDS       _ACCA, DDS.Frequenz+1
                        LDS       _ACCALO, DDS.Frequenz+2
                        LDS       _ACCAHI, DDS.Frequenz+3
                        LDI       _ACCDLO, 00000000Ah AND 0FFh
                        LDI       _ACCDHI, 00000000Ah SHRB 8
                        LDI       _ACCELO, 00000000Ah SHRB 16
                        LDI       _ACCEHI, 00000000Ah SHRB 24
                        SET
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.MUL32_R
                        STS       DDS.FREQUENZ, _ACCB
                        STS       DDS.FREQUENZ+1, _ACCA
                        STS       DDS.FREQUENZ+2, _ACCALO
                        STS       DDS.FREQUENZ+3, _ACCAHI
                        .ENDBLOCK 1527
DDS._L0699:
DDS._L0700:
                        .LINE     1528
                        LDS       _ACCB, DDS.Frequenz
                        LDS       _ACCA, DDS.Frequenz+1
                        LDS       _ACCALO, DDS.Frequenz+2
                        LDS       _ACCAHI, DDS.Frequenz+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DDS.IncrAccInt10
                        LDS       _ACCA, DDS.IncrAccInt10+1
                        SBRS      _ACCA, 7
                        RJMP      DDS._L0702
                        LDI       _ACCAHI, 0FFh
                        LDI       _ACCALO, 0FFh
                        RJMP      DDS._L0703
DDS._L0702:
                        CLR       _ACCAHI
                        CLR       _ACCALO
DDS._L0703:
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        ADD       _ACCB, _ACCBLO
                        ADC       _ACCA, _ACCBHI
                        ADC       _ACCALO, _ACCCLO
                        ADC       _ACCAHI, _ACCCHI
                        STS       DDS.FREQUENZ, _ACCB
                        STS       DDS.FREQUENZ+1, _ACCA
                        STS       DDS.FREQUENZ+2, _ACCALO
                        STS       DDS.FREQUENZ+3, _ACCAHI
                        .ENDBLOCK 1529
                        .BRANCH   20,DDS._L0697
                        JMP       DDS._L0697
DDS._L0696:
                        .BLOCK    1529
                        .LINE     1530
                        LDS       _ACCA, DDS.TerzNum
                        PUSH      _ACCA
                        LDS       _ACCA, DDS.IncrDiffByte
                        POP       _ACCB
                        ADD       _ACCA, _ACCB
                        STS       DDS.TERZNUM, _ACCA
                        .LINE     1531
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DDS.CHECKLIMITS
                        CALL       DDS.CHECKLIMITS
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1532
                        LDS       _ACCA, DDS.TerzNum
                        LDI       _ACCCLO, DDS.TerzArray AND 0FFh
                        LDI       _ACCCHI, DDS.TerzArray SHRB 8
                        ANDI      _ACCA, 31
                        CLR       _ACCB
                        LSL       _ACCA
                        ROL       _ACCB
                        LSL       _ACCA
                        ROL       _ACCB
                        ADD       _ACCCLO, _ACCA
                        ADC       _ACCCHI, _ACCB
                        CALL      SYSTEM._ReadEEp32
                        STS       DDS.FREQUENZ, _ACCB
                        STS       DDS.FREQUENZ+1, _ACCA
                        STS       DDS.FREQUENZ+2, _ACCALO
                        STS       DDS.FREQUENZ+3, _ACCAHI
                        .ENDBLOCK 1533
DDS._L0697:
                        .LINE     1534
                        LDI       _ACCA, 000h
                        STS       DDS.SUBCH, _ACCA
                        .LINE     1535
                        .BRANCH   17,DDS.PARSEGETPARAM
                        CALL      DDS.PARSEGETPARAM
                        .ENDBLOCK 1536
                        .BRANCH   20,DDS._L0692
                        JMP       DDS._L0692
DDS._L0694:
                        .LINE     1537
                        CPI       _ACCA, 2
                        .BRANCH   3,DDS._L0706
                        BREQ      DDS._L0706
                        .BRANCH   20,DDS._L0705
                        JMP       DDS._L0705
DDS._L0706:
                        .BRANCH   20,DDS._L0704
                        JMP       DDS._L0704
DDS._L0705:
                        CPI       _ACCA, 3
                        .BRANCH   3,DDS._L0708
                        BREQ      DDS._L0708
                        .BRANCH   20,DDS._L0707
                        JMP       DDS._L0707
DDS._L0708:
DDS._L0704:
                        .BLOCK    1538
                        .LINE     1538
                        LDS       _ACCA, DDS.IncrFine
                        TST       _ACCA
                        .BRANCH   4,DDS._L0711
                        BRNE      DDS._L0711
                        .BRANCH   20,DDS._L0709
                        JMP       DDS._L0709
DDS._L0711:
                        .BLOCK    1538
                        .LINE     1539
                        LDS       _ACCA, DDS.FirstTurn
                        TST       _ACCA
                        .BRANCH   4,DDS._L0714
                        BRNE      DDS._L0714
                        .BRANCH   20,DDS._L0712
                        JMP       DDS._L0712
DDS._L0714:
                        .BLOCK    1539
                        .LINE     1540
                        LDS       _ACCB, DDS.DACLevel
                        LDS       _ACCA, DDS.DACLevel+1
                        LDS       _ACCALO, DDS.DACLevel+2
                        LDS       _ACCAHI, DDS.DACLevel+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.IntFloat
                        STS       DDS.DACLEVEL, _ACCB
                        STS       DDS.DACLEVEL+1, _ACCA
                        STS       DDS.DACLEVEL+2, _ACCALO
                        STS       DDS.DACLEVEL+3, _ACCAHI
                        .LINE     1541
                        LDI       _ACCA, 000h
                        STS       DDS.FIRSTTURN, _ACCA
                        .ENDBLOCK 1542
DDS._L0712:
DDS._L0713:
                        .LINE     1543
                        LDS       _ACCB, DDS.DACLevel
                        LDS       _ACCA, DDS.DACLevel+1
                        LDS       _ACCALO, DDS.DACLevel+2
                        LDS       _ACCAHI, DDS.DACLevel+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DDS.IncrAccFloat
                        LDS       _ACCA, DDS.IncrAccFloat+1
                        LDS       _ACCALO, DDS.IncrAccFloat+2
                        LDS       _ACCAHI, DDS.IncrAccFloat+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.AddFloat
                        STS       DDS.DACLEVEL, _ACCB
                        STS       DDS.DACLEVEL+1, _ACCA
                        STS       DDS.DACLEVEL+2, _ACCALO
                        STS       DDS.DACLEVEL+3, _ACCAHI
                        .LINE     1544
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DDS.CHECKLIMITS
                        CALL       DDS.CHECKLIMITS
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1545
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCB, DDS.DACLevel
                        LDS       _ACCA, DDS.DACLevel+1
                        LDS       _ACCALO, DDS.DACLevel+2
                        LDS       _ACCAHI, DDS.DACLevel+3
                        ST        -Y, _ACCAHI
                        ST        -Y, _ACCALO
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  4
                        .FRAME  0
                        .BRANCH   17,DDS.DACLEVEL2DB
                        CALL       DDS.DACLEVEL2DB
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        STS       DDS.DB, _ACCB
                        STS       DDS.DB+1, _ACCA
                        STS       DDS.DB+2, _ACCALO
                        STS       DDS.DB+3, _ACCAHI
                        .ENDBLOCK 1546
                        .BRANCH   20,DDS._L0710
                        JMP       DDS._L0710
DDS._L0709:
                        .BLOCK    1546
                        .LINE     1547
                        LDS       _ACCA, DDS.FirstTurn
                        TST       _ACCA
                        .BRANCH   4,DDS._L0717
                        BRNE      DDS._L0717
                        .BRANCH   20,DDS._L0715
                        JMP       DDS._L0715
DDS._L0717:
                        .BLOCK    1547
                        .LINE     1548
                        LDS       _ACCB, DDS.db
                        LDS       _ACCA, DDS.db+1
                        LDS       _ACCALO, DDS.db+2
                        LDS       _ACCAHI, DDS.db+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.IntFloat
                        STS       DDS.DB, _ACCB
                        STS       DDS.DB+1, _ACCA
                        STS       DDS.DB+2, _ACCALO
                        STS       DDS.DB+3, _ACCAHI
                        .ENDBLOCK 1549
DDS._L0715:
DDS._L0716:
                        .LINE     1550
                        LDS       _ACCB, DDS.dB
                        LDS       _ACCA, DDS.dB+1
                        LDS       _ACCALO, DDS.dB+2
                        LDS       _ACCAHI, DDS.dB+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DDS.IncrAccFloat
                        LDS       _ACCA, DDS.IncrAccFloat+1
                        LDS       _ACCALO, DDS.IncrAccFloat+2
                        LDS       _ACCAHI, DDS.IncrAccFloat+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.AddFloat
                        STS       DDS.DB, _ACCB
                        STS       DDS.DB+1, _ACCA
                        STS       DDS.DB+2, _ACCALO
                        STS       DDS.DB+3, _ACCAHI
                        .LINE     1551
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCB, DDS.db
                        LDS       _ACCA, DDS.db+1
                        LDS       _ACCALO, DDS.db+2
                        LDS       _ACCAHI, DDS.db+3
                        ST        -Y, _ACCAHI
                        ST        -Y, _ACCALO
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  4
                        .FRAME  0
                        .BRANCH   17,DDS.DB2DACLEVEL
                        CALL       DDS.DB2DACLEVEL
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        STS       DDS.DACLEVEL, _ACCB
                        STS       DDS.DACLEVEL+1, _ACCA
                        STS       DDS.DACLEVEL+2, _ACCALO
                        STS       DDS.DACLEVEL+3, _ACCAHI
                        .ENDBLOCK 1552
DDS._L0710:
                        .LINE     1553
                        LDI       _ACCA, 001h
                        STS       DDS.SUBCH, _ACCA
                        .LINE     1554
                        .BRANCH   17,DDS.PARSEGETPARAM
                        CALL      DDS.PARSEGETPARAM
                        .ENDBLOCK 1555
                        .BRANCH   20,DDS._L0692
                        JMP       DDS._L0692
DDS._L0707:
                        .LINE     1556
                        CPI       _ACCA, 0
                        .BRANCH   3,DDS._L0720
                        BREQ      DDS._L0720
                        .BRANCH   20,DDS._L0719
                        JMP       DDS._L0719
DDS._L0720:
DDS._L0718:
                        .BLOCK    1557
                        .LINE     1557
                        LDS       _ACCA, DDS.Wave
                        PUSH      _ACCA
                        LDS       _ACCB, DDS.IncrDiff
                        LDS       _ACCA, DDS.IncrDiff+1
                        MOV       _ACCA, _ACCB
                        POP       _ACCB
                        ADD       _ACCA, _ACCB
                        STS       DDS.WAVE, _ACCA
                        .LINE     1558
                        .BRANCH   17,DDS.SETLIMITS
                        CALL      DDS.SETLIMITS
                        .LINE     1559
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DDS.CHECKLIMITS
                        CALL       DDS.CHECKLIMITS
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1560
                        LDI       _ACCA, 004h
                        STS       DDS.SUBCH, _ACCA
                        .LINE     1561
                        .BRANCH   17,DDS.PARSEGETPARAM
                        CALL      DDS.PARSEGETPARAM
                        .LINE     1562
                        LDS       _ACCA, DDS.wave
                        CPI       _ACCA, 005h
                        LDI       _ACCA, 0
                        BRLO      DDS._L0721
                        LDI       _ACCA, 0FFh
DDS._L0721:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0724
                        BRNE      DDS._L0724
                        .BRANCH   20,DDS._L0722
                        JMP       DDS._L0722
DDS._L0724:
                        .BLOCK    1562
                        .LINE     1563
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCA, DDS.wave
                        SUBI      _ACCA, 005h AND 0FFh
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DDS.SERAUX
                        CALL      DDS.SERAUX
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 1564
DDS._L0722:
DDS._L0723:
                        .LINE     1565
                        LDS       _ACCA, DDS.wave
                        CPI       _ACCA, 004h
                        LDI       _ACCA, 0h
                        BRNE      DDS._L0725
                        SER       _ACCA
DDS._L0725:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0728
                        BRNE      DDS._L0728
                        .BRANCH   20,DDS._L0726
                        JMP       DDS._L0726
DDS._L0728:
                        .BLOCK    1565
                        .LINE     1566
                        LDI       _ACCCLO, DDS.InitLogicLevel AND 0FFh
                        LDI       _ACCCHI, DDS.InitLogicLevel SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DDS.PwrGain
                        LDS       _ACCA, DDS.PwrGain+1
                        LDS       _ACCALO, DDS.PwrGain+2
                        LDS       _ACCAHI, DDS.PwrGain+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat
                        MOVW      _ACCDLO, _ACCB
                        MOVW      _ACCELO, _ACCALO
                        LDI       _ACCBLO, 0F3h
                        LDI       _ACCBHI, 004h
                        LDI       _ACCCLO, 035h
                        LDI       _ACCCHI, 040h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat_R
                        STS       DDS.DACLEVEL, _ACCB
                        STS       DDS.DACLEVEL+1, _ACCA
                        STS       DDS.DACLEVEL+2, _ACCALO
                        STS       DDS.DACLEVEL+3, _ACCAHI
                        .LINE     1567
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCB, DDS.DACLevel
                        LDS       _ACCA, DDS.DACLevel+1
                        LDS       _ACCALO, DDS.DACLevel+2
                        LDS       _ACCAHI, DDS.DACLevel+3
                        ST        -Y, _ACCAHI
                        ST        -Y, _ACCALO
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  4
                        .FRAME  0
                        .BRANCH   17,DDS.DACLEVEL2DB
                        CALL       DDS.DACLEVEL2DB
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        STS       DDS.DB, _ACCB
                        STS       DDS.DB+1, _ACCA
                        STS       DDS.DB+2, _ACCALO
                        STS       DDS.DB+3, _ACCAHI
                        .ENDBLOCK 1568
DDS._L0726:
DDS._L0727:
                        .ENDBLOCK 1569
                        .BRANCH   20,DDS._L0692
                        JMP       DDS._L0692
DDS._L0719:
                        .LINE     1570
                        CPI       _ACCA, 5
                        .BRANCH   3,DDS._L0731
                        BREQ      DDS._L0731
                        .BRANCH   20,DDS._L0730
                        JMP       DDS._L0730
DDS._L0731:
DDS._L0729:
                        .BLOCK    1571
                        .LINE     1571
                        LDS       _ACCA, DDS.BurstMode
                        PUSH      _ACCA
                        LDS       _ACCB, DDS.IncrDiff
                        LDS       _ACCA, DDS.IncrDiff+1
                        MOV       _ACCA, _ACCB
                        POP       _ACCB
                        ADD       _ACCA, _ACCB
                        STS       DDS.BURSTMODE, _ACCA
                        .LINE     1572
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DDS.CHECKLIMITS
                        CALL       DDS.CHECKLIMITS
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1573
                        LDI       _ACCA, 005h
                        STS       DDS.SUBCH, _ACCA
                        .LINE     1574
                        .BRANCH   17,DDS.PARSEGETPARAM
                        CALL      DDS.PARSEGETPARAM
                        .ENDBLOCK 1575
                        .BRANCH   20,DDS._L0692
                        JMP       DDS._L0692
DDS._L0730:
                        .LINE     1576
                        CPI       _ACCA, 6
                        .BRANCH   3,DDS._L0734
                        BREQ      DDS._L0734
                        .BRANCH   20,DDS._L0733
                        JMP       DDS._L0733
DDS._L0734:
DDS._L0732:
                        .BLOCK    1577
                        .LINE     1577
                        LDS       _ACCA, DDS.IncrFine
                        TST       _ACCA
                        .BRANCH   4,DDS._L0737
                        BRNE      DDS._L0737
                        .BRANCH   20,DDS._L0735
                        JMP       DDS._L0735
DDS._L0737:
                        .BLOCK    1577
                        .LINE     1578
                        LDS       _ACCB, DDS.Offset
                        LDS       _ACCA, DDS.Offset+1
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDS       _ACCB, DDS.IncrDiff
                        LDS       _ACCA, DDS.IncrDiff+1
                        LDI       _ACCBLO, 00005h AND 0FFh
                        LDI       _ACCBHI, 00005h SHRB 8
                        SET
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.MUL16
                        POP       _ACCAHI
                        POP       _ACCALO
                        ADD       _ACCB, _ACCALO
                        ADC       _ACCA, _ACCAHI
                        STS       DDS.OFFSET, _ACCB
                        STS       DDS.OFFSET+1, _ACCA
                        .ENDBLOCK 1579
                        .BRANCH   20,DDS._L0736
                        JMP       DDS._L0736
DDS._L0735:
                        .BLOCK    1579
                        .LINE     1580
                        LDS       _ACCA, DDS.FirstTurn
                        TST       _ACCA
                        .BRANCH   4,DDS._L0740
                        BRNE      DDS._L0740
                        .BRANCH   20,DDS._L0738
                        JMP       DDS._L0738
DDS._L0740:
                        .BLOCK    1580
                        .LINE     1581
                        LDS       _ACCB, DDS.Offset
                        LDS       _ACCA, DDS.Offset+1
                        MOVW      _ACCBLO, _ACCB
                        LDI       _ACCALO, 00064h AND 0FFh
                        LDI       _ACCAHI, 00064h SHRB 8
                        SET
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.DIV16_R
                        STS       DDS.OFFSET, _ACCB
                        STS       DDS.OFFSET+1, _ACCA
                        .LINE     1582
                        LDS       _ACCB, DDS.Offset
                        LDS       _ACCA, DDS.Offset+1
                        LDI       _ACCBLO, 00064h AND 0FFh
                        LDI       _ACCBHI, 00064h SHRB 8
                        SET
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.MUL16
                        STS       DDS.OFFSET, _ACCB
                        STS       DDS.OFFSET+1, _ACCA
                        .ENDBLOCK 1583
DDS._L0738:
DDS._L0739:
                        .LINE     1584
                        LDS       _ACCB, DDS.Offset
                        LDS       _ACCA, DDS.Offset+1
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDS       _ACCB, DDS.IncrAccInt10
                        LDS       _ACCA, DDS.IncrAccInt10+1
                        LDI       _ACCBLO, 0000Ah AND 0FFh
                        LDI       _ACCBHI, 0000Ah SHRB 8
                        SET
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.MUL16
                        POP       _ACCAHI
                        POP       _ACCALO
                        ADD       _ACCB, _ACCALO
                        ADC       _ACCA, _ACCAHI
                        STS       DDS.OFFSET, _ACCB
                        STS       DDS.OFFSET+1, _ACCA
                        .ENDBLOCK 1585
DDS._L0736:
                        .LINE     1586
                        LDI       _ACCA, 014h
                        STS       DDS.SUBCH, _ACCA
                        .LINE     1587
                        .BRANCH   17,DDS.PARSEGETPARAM
                        CALL      DDS.PARSEGETPARAM
                        .ENDBLOCK 1588
                        .BRANCH   20,DDS._L0692
                        JMP       DDS._L0692
DDS._L0733:
                        .LINE     1589
                        CPI       _ACCA, 4
                        .BRANCH   3,DDS._L0743
                        BREQ      DDS._L0743
                        .BRANCH   20,DDS._L0742
                        JMP       DDS._L0742
DDS._L0743:
DDS._L0741:
                        .BLOCK    1590
                        .LINE     1590
                        LDI       _ACCA, 00Ah
                        STS       DDS.DisplayTimer, _ACCA
                        .LINE     1591
                        LDS       _ACCA, DDS.Range
                        PUSH      _ACCA
                        LDS       _ACCA, DDS.IncrDiffByte
                        POP       _ACCB
                        ADD       _ACCA, _ACCB
                        STS       DDS.RANGE, _ACCA
                        .LINE     1592
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DDS.CHECKLIMITS
                        CALL       DDS.CHECKLIMITS
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1593
                        .BRANCH   17,DDS.SWITCHRANGE
                        CALL      DDS.SWITCHRANGE
                        .LINE     1594
                        LDI       _ACCA, 013h
                        STS       DDS.SUBCH, _ACCA
                        .LINE     1595
                        .BRANCH   17,DDS.PARSEGETPARAM
                        CALL      DDS.PARSEGETPARAM
                        .ENDBLOCK 1596
                        .BRANCH   20,DDS._L0692
                        JMP       DDS._L0692
DDS._L0742:
DDS._L0692:
                        .LINE     1598
                        LDI       _ACCA, 00000h SHRB 8
                        LDI       _ACCB, 00000h AND 0FFh
                        STS       DDS.INCRDIFF, _ACCB
                        STS       DDS.INCRDIFF+1, _ACCA
                        .LINE     1599
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DDS.CHECKLIMITS
                        CALL       DDS.CHECKLIMITS
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1600
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DDS.SOLLWERTEONLCD
                        CALL      DDS.SOLLWERTEONLCD
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1601
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DDS.SETLEVELDDS
                        CALL      DDS.SETLEVELDDS
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1602
                        LDI       _ACCA, 000h
                        STS       DDS.FIRSTTURN, _ACCA
                        .ENDBLOCK 1603
DDS._L0679:
DDS._L0680:
                        .ENDBLOCK 1604
DDS._L0672:
DDS._L0673:
                        .LINE     1605
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DDS.CHECKDELAY
                        CALL      DDS.CHECKDELAY
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1606
                        LDI       _ACCA, 000h
                        .FRAME  0
                        CALL       SYSTEM.LCDPORTINP_M
                        ORI       _ACCA, 0C7h
                        STS       DDS.BUTTONTEMP, _ACCA
                        .LINE     1607
                        LDS       _ACCA, DDS.ButtonTemp
                        CPI       _ACCA, 0FFh
                        LDI       _ACCA, 0h
                        BREQ      DDS._L0744
                        SER       _ACCA
DDS._L0744:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0747
                        BRNE      DDS._L0747
                        .BRANCH   20,DDS._L0745
                        JMP       DDS._L0745
DDS._L0747:
                        .BLOCK    1607
                        .LINE     1608
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DDS.CHECKDELAY
                        CALL      DDS.CHECKDELAY
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1609
                        LDI       _ACCA, 0FFh
                        STS       DDS.VERBOSE, _ACCA
                        .LINE     1610
                        LDI       _ACCA, 000h
                        .FRAME  0
                        CALL       SYSTEM.LCDPORTINP_M
                        ORI       _ACCA, 0C7h
                        STS       DDS.BUTTONTEMP, _ACCA
                        .LINE     1611
                        LDS       _ACCA, DDS.ButtonTemp
                        CPI       _ACCA, 0FFh
                        LDI       _ACCA, 0h
                        BREQ      DDS._L0748
                        SER       _ACCA
DDS._L0748:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0751
                        BRNE      DDS._L0751
                        .BRANCH   20,DDS._L0749
                        JMP       DDS._L0749
DDS._L0751:
                        .BLOCK    1611
                        .LINE     1612
                        LDI       _ACCA, 0FFh
                        STS       DDS.CHANGEDFLAG, _ACCA
                        .LINE     1613
                        LDS       _ACCB, 0027Dh
                        CLR       _ACCA
                        SBRC      _ACCB, 003h
                        SER       _ACCA
                        COM       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DDS._L0754
                        BRNE      DDS._L0754
                        .BRANCH   20,DDS._L0752
                        JMP       DDS._L0752
DDS._L0754:
                        .BLOCK    1613
                        .LINE     1614
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDS       _ACCA, DDS.Status
                        SUBI      _ACCA, -043h AND 0FFh
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,DDS.SERPROMPT
                        CALL      DDS.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1615
                        LDS       _ACCA, DDS.IncrFine
                        COM       _ACCA
                        STS       DDS.INCRFINE, _ACCA
                        .ENDBLOCK 1616
DDS._L0752:
DDS._L0753:
                        .LINE     1617
                        LDS       _ACCB, 0027Dh
                        CLR       _ACCA
                        SBRC      _ACCB, 005h
                        SER       _ACCA
                        COM       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DDS._L0757
                        BRNE      DDS._L0757
                        .BRANCH   20,DDS._L0755
                        JMP       DDS._L0755
DDS._L0757:
                        .BLOCK    1617
                        .LINE     1618
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDS       _ACCA, DDS.Status
                        SUBI      _ACCA, -041h AND 0FFh
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,DDS.SERPROMPT
                        CALL      DDS.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1619
                        LDS       _ACCA, DDS.Modify
                        INC       _ACCA
                        CPI       _ACCA, 7
                        BRCS      DDS._L0758
                        CLR       _ACCA
DDS._L0758:
                        STS       DDS.Modify, _ACCA
                        .ENDBLOCK 1620
DDS._L0755:
DDS._L0756:
                        .LINE     1621
                        LDS       _ACCB, 0027Dh
                        CLR       _ACCA
                        SBRC      _ACCB, 004h
                        SER       _ACCA
                        COM       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DDS._L0761
                        BRNE      DDS._L0761
                        .BRANCH   20,DDS._L0759
                        JMP       DDS._L0759
DDS._L0761:
                        .BLOCK    1621
                        .LINE     1622
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDS       _ACCA, DDS.Status
                        SUBI      _ACCA, -042h AND 0FFh
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,DDS.SERPROMPT
                        CALL      DDS.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1623
                        LDS       _ACCA, DDS.Modify
                        DEC       _ACCA
                        BRPL      DDS._L0762
                        LDI       _ACCA, 6
DDS._L0762:
                        STS       DDS.Modify, _ACCA
                        .ENDBLOCK 1624
DDS._L0759:
DDS._L0760:
                        .LINE     1625
                        LDI       _ACCA, 096h
                        STS       DDS.DisplayTimer, _ACCA
                        .LINE     1626
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DDS.SOLLWERTEONLCD
                        CALL      DDS.SOLLWERTEONLCD
                        POP       _FPTRHI
                        POP       _FRAMEPTR
DDS._L0763:
                        .BLOCK    1627
                        .LINE     1628
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DDS.CHECKDELAY
                        CALL      DDS.CHECKDELAY
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1629
                        LDI       _ACCA, 000h
                        .FRAME  0
                        CALL       SYSTEM.LCDPORTINP_M
                        ORI       _ACCA, 0C7h
                        STS       DDS.BUTTONTEMP, _ACCA
                        .ENDBLOCK 1630
                        .LINE     1630
DDS._L0764:
                        LDS       _ACCA, DDS.ButtonTemp
                        CPI       _ACCA, 0FFh
                        LDI       _ACCA, 0h
                        BRNE      DDS._L0766
                        SER       _ACCA
DDS._L0766:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0767
                        BRNE      DDS._L0767
                        .BRANCH   20,DDS._L0763
                        JMP       DDS._L0763
DDS._L0767:
DDS._L0765:
                        .LINE     1631
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DDS.SETLEVELDDS
                        CALL      DDS.SETLEVELDDS
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1632
                        LDI       _ACCA, 000h
                        STS       DDS.FIRSTTURN, _ACCA
                        .ENDBLOCK 1633
DDS._L0749:
DDS._L0750:
                        .ENDBLOCK 1634
DDS._L0745:
DDS._L0746:
                        .ENDBLOCK 1635
DDS._L0667:
DDS._L0668:
                        .LINE     1636
                        SER       _ACCA
                        LDS       _ACCB, DDS.IncrTimer
                        TST       _ACCB
                        BREQ      DDS._L0768
                        COM       _ACCA
DDS._L0768:
                        TST       _ACCA
                        .BRANCH   4,DDS._L0771
                        BRNE      DDS._L0771
                        .BRANCH   20,DDS._L0769
                        JMP       DDS._L0769
DDS._L0771:
                        .BLOCK    1636
                        .LINE     1637
                        LDI       _ACCA, 014h
                        STS       DDS.IncrTimer, _ACCA
                        .LINE     1638
                        LDS       _ACCA, DDS.FirstTurn
                        COM       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DDS._L0774
                        BRNE      DDS._L0774
                        .BRANCH   20,DDS._L0772
                        JMP       DDS._L0772
DDS._L0774:
                        .BLOCK    1638
                        .LINE     1639
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDS       _ACCA, DDS.Status
                        SUBI      _ACCA, -040h AND 0FFh
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,DDS.SERPROMPT
                        CALL      DDS.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 1640
DDS._L0772:
DDS._L0773:
                        .LINE     1641
                        LDI       _ACCA, 0FFh
                        STS       DDS.FIRSTTURN, _ACCA
                        .ENDBLOCK 1642
DDS._L0769:
DDS._L0770:
                        .LINE     1645
                        SER       _ACCA
                        LDS       _ACCB, DDS.DisplayTimer
                        TST       _ACCB
                        BREQ      DDS._L0775
                        COM       _ACCA
DDS._L0775:
                        PUSH      _ACCA
                        LDS       _ACCA, DDS.LCDpresent
                        POP       _ACCB
                        AND       _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   4,DDS._L0778
                        BRNE      DDS._L0778
                        .BRANCH   20,DDS._L0776
                        JMP       DDS._L0776
DDS._L0778:
                        .BLOCK    1645
                        .LINE     1646
                        LDI       _ACCA, 019h
                        STS       DDS.DisplayTimer, _ACCA
                        .LINE     1648
                        LDI       _ACCA, 000h
                        STS       DDS.INCRFINE, _ACCA
                        .LINE     1649
                        LDS       _ACCA, 0036Bh
                        CBR       _ACCA, 080h
                        STS       0036Bh, _ACCA
                        .LINE     1650
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DDS.SOLLWERTEONLCD
                        CALL      DDS.SOLLWERTEONLCD
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1651
                        LDI       _ACCA, 000h
                        STS       DDS.CHANGEDFLAG, _ACCA
                        .ENDBLOCK 1653
DDS._L0776:
DDS._L0777:
                        .ENDBLOCK 1654
                        .LINE     1654
                        .BRANCH   20,DDS._L0661
                        JMP       DDS._L0661
DDS._L0662:
                        .ENDBLOCK 1655

DDS.$_MAINEX:
                        .LINE     1655
                        NOP
                        .LINE     1655
                        .BRANCH   20,DDS.$_MAINEX
                        RJMP      DDS.$_MAINEX


                        .ENDFUNC  1655

SYSTEM.$Main_stk        .EQU    0036Fh          ; var iData  Process stack area
SYSTEM.$Main_stk_e      .EQU    003EEh          ; var iData  Process stack area
SYSTEM.$Main_Frame      .EQU    003EFh          ; var iData  Process stack area
SYSTEM.$Main_Frame_e    .EQU    004EEh          ; var iData  Process stack area

                        ; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                        ; Initialisation and Library Routines
                        ; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

                        .ENTRY
SYSTEM.RESET:
                        CLI
                        ; >> Stack Init [main process only] <<
                        LDI       _ACCA, 003h
                        LDI       _ACCB, 0EEh
                        OUT       sph, _ACCA
                        OUT       spl, _ACCB


                        ; >> Memory Init <<
                        CLR       _ACCA
                        LDI       _ACCCLO, 16
                        LDI       _ACCCHI, 0
                        LDI       _ACCBLO, 0
                        LDI       _ACCBHI, 0
                        ADIW      _ACCCLO, 1
SYSTEM._L0779:
                        SBIW      _ACCCLO, 001h
                        BREQ      SYSTEM._L0781
SYSTEM._L0780:
                        ST        X+, _ACCA
                        RJMP      SYSTEM._L0779
SYSTEM._L0781:
                        LDI       _ACCBLO, 00060h AND 0FFh
                        LDI       _ACCBHI, 00060h SHRB 8
                        LDI       _ACCCLO, 00800h AND 0FFh
                        LDI       _ACCCHI, 00800h SHRB 8
                        ADIW      _ACCCLO, 1
SYSTEM._L0782:
                        SBIW      _ACCCLO, 001h
                        BREQ      SYSTEM._L0784
SYSTEM._L0783:
                        ST        X+, _ACCA
                        RJMP      SYSTEM._L0782
SYSTEM._L0784:
                        LDI       _FRAMEPTR, 004EEh AND 0FFh
                        LDI       _FPTRHI, 004EEh SHRB 8

                        CLI
                        LDI       _ACCA, 0FEH ROLB IntFlag
                        AND       Flags, _ACCA

                        ; ============ init structured constants ============
                        ; >> Hardware Init <<

                        ; >> SysTick init: 10msec <<
                        ; >> real SysTick (exact): 9.984 msec <<
                        LDI       _ACCA, 064h
                        STS       SysTickTime, _ACCA
                        OUT       tcnt0, _ACCA
                        LDI       _ACCA, 5
                        OUT       tccr0, _ACCA
                        LDI       _ACCA, 001h
                        OUT       timsk, _ACCA

                        ; >> ADC Init <<
                        LDI       _ACCA, 002h
                        OUT       admux, _ACCA
                        LDI       _ACCA ,0C6h
                        OUT       adcsr, _ACCA

                        ; >> SERPORT Init <<
                        ; >> Baudrate 38400Baud <<
                        
                        ; percent Baudrate error : >> 0.160% <<
                        LDI       _ACCA, 018h
                        OUT       ucr1, _ACCA
                        LDI       _ACCA, 019h
                        OUT       ubrr1, _ACCA
                        LDI       _ACCA, 000h
                        OUT       ubrrh, _ACCA
                        LDI       _ACCA, 0
                        STS       _RXINP, _ACCA
                        STS       _RXOUTP, _ACCA
                        STS       _RXCOUNT, _ACCA
                        SBI       ucr1, 7
                        LDI       _ACCA, 0
                        STS       _TXINP, _ACCA
                        STS       _TXOUTP, _ACCA
                        STS       _TXCOUNT, _ACCA
                        LDI       _ACCA, 086h
                        OUT       ucsrc, _ACCA
                        IN        _ACCA, UDR1

                        ; >> IncrPort4 Init <<
                        LDI       _ACCA, 0
                        STS       TCCR1A, _ACCA
                        LDI       _ACCA, 009h
                        STS       TCCR1B, _ACCA
                        LDI       _ACCA, 00FA0h SHRB 8
                        LDI       _ACCB, 00FA0h AND 0FFh
                        STS       OCR1AH, _ACCA
                        STS       OCR1AL, _ACCB

                        ; >> TWIPORT Init <<
                        LDI       _ACCA, 00Ch
                        OUT       TWBR, _ACCA
                        LDI       _ACCA, 0FFh
                        STS       TWI_DevLock, _ACCA

                        CLR       Flags
                        CLR       Flags2

                        ; ============ Start User Main Program ============

                        .DEB      MAINENTRY
                        JMP       DDS.$_Main

                        ; ============ Interrupt Service ============

SYSTEM.$INTERRUPT_TIMER0:
                        .DEB      SYSTICKENTRY
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        PUSH      _ACCB
                        PUSH      _ACCA
                        IN        _ACCA, SREG
                        PUSH      _ACCA
                        LDS       _ACCA, SysTickTime
                        IN        _ACCB, tcnt0
                        ADD       _ACCA, _ACCB
                        OUT       tcnt0, _ACCA
                        LDI       _ACCA, 0FEH ROLB IntFlag
                        AND       Flags, _ACCA
                        CALL      DDS.onSysTick
                        IN        _ACCB, adcl
                        IN        _ACCA, adch
                        PUSH      _ACCBLO
                        PUSH      _ACCBHI
                        IN        _ACCCHI, admux
                        ANDI      _ACCCHI, 7
                        LDI       _ACCCLO, 002h
                        CP        _ACCCLO, _ACCCHI
                        BRNE      SYSTEM._L0785
                        LDS       _ACCBLO, _ADCBUFF
                        LDS       _ACCBHI, _ADCBUFF+1
                        ADD       _ACCB, _ACCBLO;
                        ADC       _ACCA, _ACCBHI;
                        LSR       _ACCA
                        ROR       _ACCB
                        STS       _ADCBUFF, _ACCB
                        STS       _ADCBUFF+1, _ACCA
                        LDI       _ACCCLO, 003h
                        RJMP      SYSTEM._L0786
SYSTEM._L0785:
                        LDS       _ACCBLO, _ADCBUFF+2
                        LDS       _ACCBHI, _ADCBUFF+3
                        ADD       _ACCB, _ACCBLO;
                        ADC       _ACCA, _ACCBHI;
                        LSR       _ACCA
                        ROR       _ACCB
                        STS       _ADCBUFF+2, _ACCB
                        STS       _ADCBUFF+3, _ACCA
SYSTEM._L0786:
                        LDS       _ACCA, _ADCBUFF+4
                        ANDI      _ACCA, 1
                        BRNE      SYSTEM._L0787
                        IN        _ACCCHI, admux
                        CBR       _ACCCHI, 7
                        OR        _ACCCLO, _ACCCHI
                        OUT       admux, _ACCCLO
SYSTEM._L0787:
                        POP       _ACCBHI
                        POP       _ACCBLO
                        ;
                        LDS       _ACCB, _TWI_TO
                        TST       _ACCB
                        BREQ      SYSTEM._L0788
                        DEC       _ACCB
                        STS       _TWI_TO, _ACCB
SYSTEM._L0788:
                        LDS       _ACCA, _RXTIMEOUT
                        TST       _ACCA
                        BREQ      SYSTEM._L0789
                        DEC       _ACCA
                        STS       _RXTIMEOUT, _ACCA
SYSTEM._L0789:
                        LDS       _ACCA, DDS.BurstTimer
                        TST       _ACCA
                        BREQ      SYSTEM._L0790
                        SUBI      _ACCA, 1
                        STS       DDS.BurstTimer, _ACCA
SYSTEM._L0790:
                        LDS       _ACCA, DDS.ActivityTimer
                        TST       _ACCA
                        BREQ      SYSTEM._L0791
                        SUBI      _ACCA, 1
                        STS       DDS.ActivityTimer, _ACCA
SYSTEM._L0791:
                        LDS       _ACCA, DDS.DisplayTimer
                        TST       _ACCA
                        BREQ      SYSTEM._L0792
                        SUBI      _ACCA, 1
                        STS       DDS.DisplayTimer, _ACCA
SYSTEM._L0792:
                        LDS       _ACCA, DDS.IncrTimer
                        TST       _ACCA
                        BREQ      SYSTEM._L0793
                        SUBI      _ACCA, 1
                        STS       DDS.IncrTimer, _ACCA
SYSTEM._L0793:
                        LDI       _ACCA, 1 SHLB IntFlag
                        OR        Flags, _ACCA
                        SBI       adcsr, 6
                        ;
                        POP       _ACCA
                        OUT       SREG, _ACCA
                        POP       _ACCA
                        POP       _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        .DEB      SYSTICKEXIT
                        RETI

SYSTEM.$INTERRUPT_TXEMPTY:
SYSTEM.$INTERRUPT_UDRE:
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        PUSH      _ACCB
                        PUSH      _ACCA
                        IN        _ACCA, SREG
                        PUSH      _ACCA
                        LDS       _ACCA, _TXCOUNT
                        TST       _ACCA
                        BRNE      SYSTEM._L0794
SYSTEM._L0798:
                        CBI       ucr1, 5
                        RJMP      SYSTEM._L0796
SYSTEM._L0794:
                        LDS       _ACCB, _TXOUTP
                        CLR       _ACCA
                        LDI       _ACCCLO, _TXBUFF AND 0FFh
                        LDI       _ACCCHI, _TXBUFF SHRB 8
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCA, Z
                        OUT       UDR1, _ACCA
                        LDS       _ACCA, _TXCOUNT
                        DEC       _ACCA
                        STS       _TXCOUNT, _ACCA
                        BRNE      SYSTEM._L0797
                        CBI       ucr1, 5
SYSTEM._L0797:
                        INC       _ACCB
                        CPI       _ACCB, 255
                        BRNE      SYSTEM._L0795
                        CLR       _ACCB
SYSTEM._L0795:
                        STS       _TXOUTP, _ACCB
SYSTEM._L0796:
                        POP       _ACCA
                        OUT       SREG, _ACCA
                        POP       _ACCA
                        POP       _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        RETI

SYSTEM.$INTERRUPT_RXRDY:
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        PUSH      _ACCB
                        PUSH      _ACCA
                        IN        _ACCA, SREG
                        PUSH      _ACCA
SYSTEM._L0804:
                        LDS       _ACCA, _RXCOUNT
                        CPI       _ACCA, 255
                        BRNE      SYSTEM._L0799
                        IN        _ACCB, UDR1
                        RJMP      SYSTEM._L0801
SYSTEM._L0799:
                        IN        _ACCA, UDR1
                        PUSH      _ACCA
                        CLR       _ACCA
                        LDS       _ACCB, _RXINP
                        LDI       _ACCCLO, _RXBUFF AND 0FFh
                        LDI       _ACCCHI, _RXBUFF SHRB 8
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        POP       _ACCA
                        ST        Z, _ACCA
                        LDS       _ACCA, _RXCOUNT
                        INC       _ACCA
                        STS       _RXCOUNT, _ACCA
                        INC       _ACCB
                        CPI       _ACCB, 255
                        BRNE      SYSTEM._L0800
                        CLR       _ACCB
SYSTEM._L0800:
                        STS       _RXINP, _ACCB
                        SBIC      usr1, 7
                        RJMP      SYSTEM._L0804
SYSTEM._L0801:
SYSTEM._L0806:
                        POP       _ACCA
                        OUT       SREG, _ACCA
                        POP       _ACCA
                        POP       _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        RETI

SYSTEM.$INTERRUPT_TIMER1COMPA:
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        PUSH      _ACCB
                        PUSH      _ACCA
                        IN        _ACCA, SREG
                        PUSH      _ACCA
                        RJMP      SYSTEM._L0811

SYSTEM._L0807:
                        MOV       _ACCB, _ACCA
                        LSR       _ACCA
                        LSR       _ACCA
                        ANDI      _ACCB, 3
                        BRNE      SYSTEM._L0808
                        ADIW      _ACCCLO, 4
                        RET
SYSTEM._L0808:
                        CPI       _ACCB, 1
                        BREQ      SYSTEM._L0809
                        LDD       _ACCALO, Z+0
                        LDD       _ACCAHI, Z+1
                        LDD       _ACCDLO, Z+2
                        LDD       _ACCDHI, Z+3
                        SUBI      _ACCALO, 0FFh
                        SBCI      _ACCAHI, 0FFh
                        SBCI      _ACCDLO, 0FFh
                        SBCI      _ACCDHI, 0FFh
                        RJMP      SYSTEM._L0810
SYSTEM._L0809:
                        LDD       _ACCALO, Z+0
                        LDD       _ACCAHI, Z+1
                        LDD       _ACCDLO, Z+2
                        LDD       _ACCDHI, Z+3
                        SUBI      _ACCALO, 1
                        SBCI      _ACCAHI, 0
                        SBCI      _ACCDLO, 0
                        SBCI      _ACCDHI, 0
SYSTEM._L0810:
                        ST        Z+, _ACCALO
                        ST        Z+, _ACCAHI
                        ST        Z+, _ACCDLO
                        ST        Z+, _ACCDHI
                        RET

SYSTEM._L0811:
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        PUSH      _ACCDLO
                        PUSH      _ACCDHI
                        IN        _ACCA, PINA
                        .DEB      Incr4Int
                        ANDI      _ACCA, 03h;
                        LDI       _ACCCLO, _INCRSTATE4 AND 0FFh
                        LDI       _ACCCHI, _INCRSTATE4 SHRB 8
                        LDD       _ACCB, Z+0
                        STD       Z+0, _ACCA
                        MOV       _ACCALO, _ACCB;
                        EOR       _ACCALO, _ACCA;
                        BREQ      SYSTEM._L0812
                        MOV       _ACCAHI, _ACCALO;
                        ANDI      _ACCALO, 055h;
                        ANDI      _ACCAHI, 0AAh;
                        MOV       _ACCDLO, _ACCALO;
                        EOR       _ACCDLO, _ACCAHI;
                        AND       _ACCALO, _ACCDLO
                        AND       _ACCAHI, _ACCDLO
                        MOV       _ACCCLO, _ACCB;
                        ANDI      _ACCCLO, 055h;
                        MOV       _ACCDLO, _ACCB;
                        ANDI      _ACCDLO, 0AAh;
                        LSR       _ACCDLO;
                        EOR       _ACCCLO, _ACCDLO;
                        COM       _ACCCLO;
                        MOV       _ACCCHI, _ACCA;
                        ANDI      _ACCCHI, 055h;
                        MOV       _ACCDLO, _ACCA;
                        ANDI      _ACCDLO, 0AAh;
                        LSR       _ACCDLO;
                        EOR       _ACCCHI, _ACCDLO;
                        COM       _ACCCHI;
                        MOV       _ACCA, _ACCALO;
                        AND       _ACCA, _ACCCLO;
                        MOV       _ACCB, _ACCCHI;
                        LSL       _ACCB;
                        AND       _ACCB, _ACCAHI;
                        LSR       _ACCB;
                        OR        _ACCA, _ACCB;
                        AND       _ACCALO, _ACCCHI;
                        LSL       _ACCALO;
                        LSL       _ACCCLO;
                        AND       _ACCAHI, _ACCCLO;
                        OR        _ACCALO, _ACCAHI;
                        OR        _ACCA, _ACCALO;
                        LDI       _ACCCLO, _INCRCOUNT4_0 AND 0FFh
                        LDI       _ACCCHI, _INCRCOUNT4_0 SHRB 8
                        RCALL     SYSTEM._L0807
SYSTEM._L0812:
                        POP       _ACCDHI
                        POP       _ACCDLO
                        POP       _ACCAHI
                        POP       _ACCALO
                        POP       _ACCA
                        OUT       SREG, _ACCA
                        POP       _ACCA
                        POP       _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        RETI


                        ; ============ Library ============

SYSTEM._LCDM_ini:
                        LDS       _ACCDLO, _LCDM_PORT
                        ORI       _ACCDLO, 20h
                        LDI       _ACCBLO, 00002h AND 0FFh
                        LDI       _ACCBHI, 00002h SHRB 8
                        LDI       _ACCAHI, 002h
                        LDI       _ACCCLO, _ACCELO AND 0FFh
                        LDI       _ACCCHI, _ACCELO SHRB 8
                        LDI       _ACCELO, 00000h AND 0FFh
                        LDI       _ACCEHI, 00000h SHRB 8
                        CLT
                        BLD       Flags, _I2C2BYTE
                        LDI       _ACCDHI, 000h
                        CALL      SYSTEM.TWIout
                        LDS       _ACCDLO, _LCDM_PORT
                        ORI       _ACCDLO, 20h
                        LDI       _ACCBLO, 00002h AND 0FFh
                        LDI       _ACCBHI, 00002h SHRB 8
                        LDI       _ACCAHI, 004h
                        LDI       _ACCCLO, _ACCELO AND 0FFh
                        LDI       _ACCCHI, _ACCELO SHRB 8
                        LDI       _ACCELO, 00000h AND 0FFh
                        LDI       _ACCEHI, 00000h SHRB 8
                        LDI       _ACCDHI, 000h
                        CALL      SYSTEM.TWIout
                        LDS       _ACCDLO, _LCDM_PORT
                        ORI       _ACCDLO, 20h
                        LDI       _ACCBLO, 00002h AND 0FFh
                        LDI       _ACCBHI, 00002h SHRB 8
                        LDI       _ACCAHI, 006h
                        LDI       _ACCCLO, _ACCELO AND 0FFh
                        LDI       _ACCCHI, _ACCELO SHRB 8
                        LDI       _ACCELO, 0F800h AND 0FFh
                        LDI       _ACCEHI, 0F800h SHRB 8
                        LDI       _ACCDHI, 000h
                        CALL      SYSTEM.TWIout
                        RET

SYSTEM._LCDM_CLOSE:
                        LDS       _ACCDLO, _LCDM_PORT
                        ORI       _ACCDLO, 20h
                        LDI       _ACCBLO, 00001h AND 0FFh
                        LDI       _ACCBHI, 00001h SHRB 8
                        LDI       _ACCAHI, 003h
                        LDI       _ACCCLO, _ACCELO AND 0FFh
                        LDI       _ACCCHI, _ACCELO SHRB 8
                        CLT
                        BLD       Flags, _I2C2BYTE
                        LDI       _ACCDHI, 000h
                        CALL      SYSTEM.TWIout
                        LDS       _ACCDLO, _LCDM_PORT
                        ORI       _ACCDLO, 20h
                        LDI       _ACCBLO, 00001h AND 0FFh
                        LDI       _ACCBHI, 00001h SHRB 8
                        LDI       _ACCAHI, 003h
                        LDI       _ACCCLO, _ACCELO AND 0FFh
                        LDI       _ACCCHI, _ACCELO SHRB 8
                        LDI       _ACCELO, 000h
                        LDI       _ACCDHI, 000h
                        CALL      SYSTEM.TWIout
                        RET

SYSTEM._LCDM_START_RW:
                        PUSH      _ACCELO
                        MOV       _ACCALO, _ACCA
                        LDI       _ACCELO, 000h
                        RCALL     SYSTEM._LCDM_CLOSE
                        POP       _ACCELO
                        PUSH      _ACCELO
                        ANDI      _ACCELO, 2
                        BREQ       SYSTEM._L0813
                        LDS       _ACCDLO, _LCDM_PORT
                        ORI       _ACCDLO, 20h
                        LDI       _ACCBLO, 00001h AND 0FFh
                        LDI       _ACCBHI, 00001h SHRB 8
                        LDI       _ACCAHI, 006h
                        LDI       _ACCCLO, _ACCELO AND 0FFh
                        LDI       _ACCCHI, _ACCELO SHRB 8
                        LDI       _ACCELO, 0FFh
                        LDI       _ACCDHI, 000h
                        CALL      SYSTEM.TWIout
                        RJMP      SYSTEM._L0814
SYSTEM._L0813:
                        LDS       _ACCDLO, _LCDM_PORT
                        ORI       _ACCDLO, 20h
                        LDI       _ACCBLO, 00001h AND 0FFh
                        LDI       _ACCBHI, 00001h SHRB 8
                        LDI       _ACCAHI, 006h
                        LDI       _ACCCLO, _ACCELO AND 0FFh
                        LDI       _ACCCHI, _ACCELO SHRB 8
                        LDI       _ACCELO, 000h
                        LDI       _ACCDHI, 000h
                        CALL      SYSTEM.TWIout
                        LDS       _ACCDLO, _LCDM_PORT
                        ORI       _ACCDLO, 20h
                        LDI       _ACCBLO, 00001h AND 0FFh
                        LDI       _ACCBHI, 00001h SHRB 8
                        LDI       _ACCAHI, 006h
                        LDI       _ACCCLO, _ACCELO AND 0FFh
                        LDI       _ACCCHI, _ACCELO SHRB 8
                        MOV       _ACCELO, _ACCALO
                        LDI       _ACCDHI, 000h
                        CALL      SYSTEM.TWIout
SYSTEM._L0814:
                        LDS       _ACCDLO, _LCDM_PORT
                        ORI       _ACCDLO, 20h
                        LDI       _ACCBLO, 00001h AND 0FFh
                        LDI       _ACCBHI, 00001h SHRB 8
                        LDI       _ACCAHI, 003h
                        LDI       _ACCCLO, _ACCELO AND 0FFh
                        LDI       _ACCCHI, _ACCELO SHRB 8
                        POP       _ACCELO
                        PUSH      _ACCELO
                        LDI       _ACCDHI, 000h
                        CALL      SYSTEM.TWIout
                        LDS       _ACCDLO, _LCDM_PORT
                        ORI       _ACCDLO, 20h
                        LDI       _ACCBLO, 00001h AND 0FFh
                        LDI       _ACCBHI, 00001h SHRB 8
                        LDI       _ACCAHI, 003h
                        LDI       _ACCCLO, _ACCELO AND 0FFh
                        LDI       _ACCCHI, _ACCELO SHRB 8
                        POP       _ACCELO
                        PUSH      _ACCELO
                        ORI       _ACCELO, 1
                        LDI       _ACCDHI, 000h
                        CALL      SYSTEM.TWIout
                        POP       _ACCELO
                        ANDI      _ACCELO, 2
                        BREQ       SYSTEM._L0815
                        LDS       _ACCDLO, _LCDM_PORT
                        ORI       _ACCDLO, 20h
                        LDI       _ACCBLO, 00000h AND 0FFh
                        LDI       _ACCBHI, 00000h SHRB 8
                        LDI       _ACCAHI, 000h
                        LDI       _ACCDHI, 000h
                        CALL      SYSTEM.TWIout
SYSTEM._L0815:
                        RET

SYSTEM._LCDM_Busy_Rd:
                        LDI       _ACCELO, 002h
                        RCALL     SYSTEM._LCDM_START_RW
                        LDS       _ACCDLO, _LCDM_PORT
                        ORI       _ACCDLO, 20h
                        LDI       _ACCBLO, 00001h AND 0FFh
                        LDI       _ACCBHI, 00001h SHRB 8
                        LDI       _ACCCLO, _ACCELO AND 0FFh
                        LDI       _ACCCHI, _ACCELO SHRB 8
                        CALL      SYSTEM.TWIinp
                        PUSH      _ACCELO
                        LDI       _ACCELO, 002h
                        RCALL     SYSTEM._LCDM_CLOSE
                        POP       _ACCA
                        .DEB      LCDBUSY_RD
                        RET

SYSTEM._LCDWAIT_M:
                        LDI       _ACCCLO, 00280h AND 0FFh
                        LDI       _ACCCHI, 00280h SHRB 8
SYSTEM._L0816:
                        RCALL     SYSTEM._LCDM_Busy_Rd
                        TST       _ACCA
                        BRPL       SYSTEM._L0817
                        SBIW      _ACCCLO, 1
                        BRNE      SYSTEM._L0816
                        CLR       _ACCB
                        CLR       _ACCA
                        RET
SYSTEM._L0817:
                        MOV       _ACCB, _ACCA
                        SER       _ACCA
                        RET

SYSTEM._LCDM_Ctrl_Wr:
                        PUSH      _ACCA
                        RCALL     SYSTEM._LCDWAIT_M
                        TST       _ACCA
                        BRNE      SYSTEM._L0818
                        POP       _ACCB
                        RET
SYSTEM._L0818:
                        POP       _ACCA
SYSTEM._LCDM_Ctrl_Wr_NW:
                        .DEB      LCDCTRL_WR
                        LDI       _ACCELO, 000h
                        RCALL     SYSTEM._LCDM_START_RW
                        LDI       _ACCELO, 000h
                        RCALL     SYSTEM._LCDM_CLOSE
                        SER       _ACCA
                        RET

SYSTEM._LCDM_Data_Wr:
                        .DEB      LCDOUT_M
                        LDI       _ACCELO, 004h
                        RCALL     SYSTEM._LCDM_START_RW
                        LDI       _ACCELO, 004h
                        RCALL     SYSTEM._LCDM_CLOSE
                        SER       _ACCA
                        RET

SYSTEM._LCDM_Data_Rd:
                        LDI       _ACCELO, 006h
                        RCALL     SYSTEM._LCDM_START_RW
                        LDS       _ACCDLO, _LCDM_PORT
                        ORI       _ACCDLO, 20h
                        LDI       _ACCBLO, 00001h AND 0FFh
                        LDI       _ACCBHI, 00001h SHRB 8
                        LDI       _ACCCLO, _ACCELO AND 0FFh
                        LDI       _ACCCHI, _ACCELO SHRB 8
                        CALL      SYSTEM.TWIinp
                        PUSH      _ACCELO
                        LDI       _ACCELO, 006h
                        RCALL     SYSTEM._LCDM_CLOSE
                        POP       _ACCA
                        .DEB      LCDINP_M
                        RET

SYSTEM.LCDSETUP_M:
                        STS       _LCDM_PORT, _ACCA
                        ORI       _ACCA, 20h
                        CALL      SYSTEM.TWIstat
                        .DEB      I2CSTAT_M
                        TST       _ACCA
                        BRNE       SYSTEM._L0819
                        RET
SYSTEM._L0819:
                        RCALL     SYSTEM._LCDM_ini
                        LDI       _ACCB, 16
                        CLR       _ACCA
                        CALL      SYSTEM.MDELAY
                        LDI       _ACCA, 30h
                        RCALL     SYSTEM._LCDM_Ctrl_Wr_NW
                        LDI       _ACCB, 5
                        CLR       _ACCA
                        CALL      SYSTEM.MDELAY
                        LDI       _ACCA, 30h
                        RCALL     SYSTEM._LCDM_Ctrl_Wr_NW
                        LDI       _ACCB, 1
                        CLR       _ACCA
                        CALL      SYSTEM.MDELAY
                        LDI       _ACCA, 30h
                        RCALL     SYSTEM._LCDM_Ctrl_Wr_NW
                        LDI       _ACCB, 1
                        CLR       _ACCA
                        CALL      SYSTEM.MDELAY
                        LDI       _ACCA, 38h
                        RCALL     SYSTEM._LCDM_Ctrl_Wr
                        LDI       _ACCA, 08h
                        RCALL     SYSTEM._LCDM_Ctrl_Wr
                        LDI       _ACCA, 1
                        RCALL     SYSTEM._LCDM_Ctrl_Wr
                        LDI       _ACCA, 6
                        RCALL     SYSTEM._LCDM_Ctrl_Wr_NW
                        RET

SYSTEM.LCDOUT_M:
                        RJMP      SYSTEM._LCDM_Data_Wr

SYSTEM.LCDCTRL_M:
                        LDD       _ACCA, Y+001h
                        STS       _LCDM_PORT, _ACCA
                        LDD       _ACCA, Y+000h
                        RJMP      SYSTEM._LCDM_Ctrl_Wr

SYSTEM.LCDINP_M:
                        STS       _LCDM_PORT, _ACCA
                        RJMP      SYSTEM._LCDM_Data_Rd

SYSTEM.LCDSTAT_M:
                        STS       _LCDM_PORT, _ACCA
                        RJMP      SYSTEM._LCDM_Busy_Rd

SYSTEM.LCDsetPort_M:
                        STS       _LCDM_PORT, _ACCA
                        RET

SYSTEM.LCDgetPort_M:
                        LDS       _ACCA, _LCDM_PORT
                        RET

SYSTEM.LCDON_M:
                        LDD       _ACCA, Y+000h
                        STS       _LCDM_PORT, _ACCA
                        LDI       _ACCA, 0FFh
                        LDI       _ACCB, 0FFh
                        RJMP      SYSTEM._L0820
SYSTEM.LCDCURSOR_M:
                        LDD       _ACCA, Y+002h
                        STS       _LCDM_PORT, _ACCA
                        LDD       _ACCA, Y+000h
                        LDD       _ACCB, Y+001h
SYSTEM._L0820:
                        TST       _ACCA
                        BRNE       SYSTEM._L0821
                        LDI       _ACCA, 0Ch
                        RJMP      SYSTEM._L0822

SYSTEM._L0821:
                        LDI       _ACCA, 0Dh
SYSTEM._L0822:
                        TST       _ACCB
                        BREQ       SYSTEM._L0823
                        ORI       _ACCA, 2
SYSTEM._L0823:
                        RJMP      SYSTEM._LCDM_Ctrl_Wr

SYSTEM.LCDXY_M:
                        LDD       _ACCA, Y+002h
                        STS       _LCDM_PORT, _ACCA
                        LDD       _ACCA, Y+000h
                        LDD       _ACCB, Y+001h
                        CPI       _ACCA, 0
                        BRNE       SYSTEM._L0824
                        LDI       _ACCA, 080h
                        RJMP      SYSTEM._L0828

SYSTEM._L0824:
                        CPI       _ACCA, 1
                        BRNE       SYSTEM._L0825
                        LDI       _ACCA, 0C0h
                        RJMP      SYSTEM._L0828

SYSTEM._L0825:
                        CPI       _ACCA, 2
                        BRNE       SYSTEM._L0826
                        LDI       _ACCA, 088h
                        RJMP      SYSTEM._L0828

SYSTEM._L0826:
                        CPI       _ACCA, 3
                        BRNE       SYSTEM._L0827
                        LDI       _ACCA, 0C8h
                        RJMP      SYSTEM._L0828

SYSTEM._L0827:
                        LDI       _ACCA, 080h
SYSTEM._L0828:
                        ADD       _ACCA, _ACCB
                        RJMP      SYSTEM._LCDM_Ctrl_Wr_NW

SYSTEM.LCDCLREOL_M:
                        STS       _LCDM_PORT, _ACCA
                        RCALL     SYSTEM._LCDWAIT_M
                        RCALL     SYSTEM._LCDM_Busy_Rd
                        ORI       _ACCA, 80h
                        PUSH      _ACCA
                        ANDI      _ACCA, 07h
                        LDI       _ACCB, 008h
                        SUB       _ACCB, _ACCA
SYSTEM._L0829:
                        PUSH      _ACCB
                        LDI       _ACCA, 20h
                        RCALL     SYSTEM._LCDM_Data_Wr
                        POP       _ACCB
                        DEC       _ACCB
                        BRNE       SYSTEM._L0829
                        POP       _ACCA
                        RJMP      SYSTEM._LCDM_Ctrl_Wr

SYSTEM.LCDCHARSET_M:
                        LDD       _ACCA, Y+009h
                        STS       _LCDM_PORT, _ACCA
                        LDD       _ACCA, Y+008h
                        ANDI      _ACCA, 0Fh
                        LSL       _ACCA
                        LSL       _ACCA
                        LSL       _ACCA
                        ORI       _ACCA, 40h
                        RCALL     SYSTEM._LCDM_Ctrl_Wr
                        LDD       _ACCA, Y+007h
                        RCALL     SYSTEM._LCDM_Data_Wr
                        LDD       _ACCA, Y+006h
                        RCALL     SYSTEM._LCDM_Data_Wr
                        LDD       _ACCA, Y+005h
                        RCALL     SYSTEM._LCDM_Data_Wr
                        LDD       _ACCA, Y+004h
                        RCALL     SYSTEM._LCDM_Data_Wr
                        LDD       _ACCA, Y+003h
                        RCALL     SYSTEM._LCDM_Data_Wr
                        LDD       _ACCA, Y+002h
                        RCALL     SYSTEM._LCDM_Data_Wr
                        LDD       _ACCA, Y+001h
                        RCALL     SYSTEM._LCDM_Data_Wr
                        LDD       _ACCA, Y+000h
                        RCALL     SYSTEM._LCDM_Data_Wr
                        LDI       _ACCA, 80h
                        RJMP      SYSTEM._LCDM_Ctrl_Wr

SYSTEM.LCDportInp_M:
                        MOV       _ACCDLO, _ACCA
                        ORI       _ACCDLO, 20h
                        PUSH      _ACCDLO
                        LDI       _ACCBLO, 00000h AND 0FFh
                        LDI       _ACCBHI, 00000h SHRB 8
                        LDI       _ACCAHI, 001h
                        LDI       _ACCDHI, 000h
                        CALL      SYSTEM.TWIout
                        POP       _ACCDLO
                        LDI       _ACCBLO, 00001h AND 0FFh
                        LDI       _ACCBHI, 00001h SHRB 8
                        LDI       _ACCCLO, _ACCELO AND 0FFh
                        LDI       _ACCCHI, _ACCELO SHRB 8
                        CALL      SYSTEM.TWIinp
                        MOV       _ACCA, _ACCELO
                        ANDI      _ACCA, 0F8h
                        RET

SYSTEM.TWISTARTB:
                        LDI       _ACCA, 0
                        STS       TWI_DevLock, _ACCA
                        IN        _ACCA, TWSR
                        ANDI      _ACCA, 0FCh
                        CPI       _ACCA, 000h
                        BRNE      SYSTEM._L0841
                        LDI       _ACCA, 090h
                        OUT       TWCR, _ACCA
SYSTEM._L0841:
                        LDI       _ACCA, 0A4h
                        OUT       TWCR, _ACCA
                        LDI       _ACCA, 10
                        STS       _TWI_TO, _ACCA
SYSTEM._L0839:
                        IN        _ACCA, TWCR
                        ANDI      _ACCA, 080h
                        BRNE      SYSTEM._L0842
                        LDS       _ACCA, _TWI_TO
                        TST       _ACCA
                        BRNE      SYSTEM._L0839
                        OUT       TWCR, _ACCA
                        RJMP      SYSTEM.TWI_ERROR
SYSTEM._L0842:
                        IN        _ACCA, TWSR
                        ANDI      _ACCA, 0FCh
                        CPI       _ACCA, 008h
                        BRNE      SYSTEM._L0846
                        RJMP      SYSTEM.TWI_ERROR
SYSTEM._L0846:
                        RJMP      SYSTEM.TWI_OK

SYSTEM.TWISTOPB:
SYSTEM._L0847:
                        IN        _ACCA, TWSR
                        ANDI      _ACCA, 0FCh
                        CPI       _ACCA, 0F8h
                        BREQ      SYSTEM._L0847
                        CPI       _ACCA, 000h
                        BRNE      SYSTEM._L0848
                        LDI       _ACCA, 090h
                        OUT       TWCR, _ACCA
                        NOP
SYSTEM._L0848:
                        LDI       _ACCB, 094h
                        OUT       TWCR, _ACCB
                        SER       _ACCA
                        STS       TWI_DevLock, _ACCA
                        RET

SYSTEM.TWISENDBYTE:
                        OUT       TWDR, _ACCDLO
                        LDI       _ACCA, 084h
                        OUT       TWCR, _ACCA
                        LDI       _ACCA, 10
                        STS       _TWI_TO, _ACCA
SYSTEM._L0850:
                        IN        _ACCA, TWCR
                        ANDI      _ACCA, 080h
                        BRNE      SYSTEM._L0851
                        LDS       _ACCA, _TWI_TO
                        TST       _ACCA
                        BRNE      SYSTEM._L0850
                        RJMP      SYSTEM.TWI_ERROR
SYSTEM._L0851:
                        IN        _ACCA, TWSR
                        ANDI      _ACCA, 0FCh
                        CPI       _ACCA, 028h
                        BREQ      SYSTEM.TWI_OK
                        CPI       _ACCA, 018h
                        BREQ      SYSTEM.TWI_OK
                        CPI       _ACCA, 040h
                        BREQ      SYSTEM.TWI_OK
                        RJMP      SYSTEM.TWI_ERROR

SYSTEM.TWIRECVBYTE:
                        LDI       _ACCA, 0C4h
                        OUT       TWCR, _ACCA
                        SBIW      _ACCBLO, 1
                        BRMI      SYSTEM.TWISTOPB
                        BRNE      SYSTEM._L0852
                        LDI       _ACCA, 084h
SYSTEM._L0852:
                        OUT       TWCR, _ACCA
SYSTEM._L0853:
                        IN        _ACCA, TWCR
                        SBRS      _ACCA, 7
                        RJMP      SYSTEM._L0853
                        IN        _ACCA, TWSR
                        ANDI      _ACCA, 0FCh
                        CPI       _ACCA, 058h
                        BREQ      SYSTEM._L0855
                        CPI       _ACCA, 050h
                        BRNE      SYSTEM.TWI_ERROR
SYSTEM._L0855:
                        IN        _ACCA, TWDR
                        ST        Z+, _ACCA
                        RJMP      SYSTEM.TWIRECVBYTE
SYSTEM.TWI_OK:
                        LDI       _ACCA, true
                        RET
SYSTEM.TWI_ERROR:
                        IN        _ACCA, TWSR
                        ANDI      _ACCA, 0FCh
                        CPI       _ACCA, 000h
                        BRNE      SYSTEM._L0854
                        LDI       _ACCA, 090h
                        OUT       TWCR, _ACCA
SYSTEM._L0854:
                        LDI       _ACCA, false
                        RET

SYSTEM.TWISTAT:
                        MOV       _ACCDLO, _ACCA
                        RCALL     SYSTEM.TWISTARTB
                        CLC
                        ROL       _ACCDLO
                        RCALL     SYSTEM.TWISENDBYTE
                        MOV       _ACCBHI, _ACCA
                        RCALL     SYSTEM.TWISTOPB
                        MOV       _ACCA, _ACCBHI
                        RET

SYSTEM.TWIINP:
                        RCALL     SYSTEM.TWISTARTB
                        SEC
                        ROL       _ACCDLO
                        RCALL     SYSTEM.TWISENDBYTE
                        TST       _ACCA
                        BREQ      SYSTEM._L0857
                        RCALL     SYSTEM.TWIRECVBYTE
                        TST       _ACCA
                        BREQ      SYSTEM._L0857
                        RJMP      SYSTEM.TWI_OK
SYSTEM._L0857:
                        RCALL     SYSTEM.TWI_ERROR
                        SER       _ACCB
                        STS       TWI_DevLock, _ACCB
                        RET

SYSTEM.TWIOUT:
                        RCALL     SYSTEM.TWISTARTB
                        CLC
                        ROL       _ACCDLO
                        RCALL     SYSTEM.TWISENDBYTE
                        TST       _ACCA
                        BREQ      SYSTEM._L0863
SYSTEM._L0858:
                        MOV       _ACCDLO, _ACCAHI
                        RCALL     SYSTEM.TWISENDBYTE
                        TST       _ACCA
                        BREQ      SYSTEM._L0863
                        BST       Flags, _I2C2BYTE
                        BRTC      SYSTEM._L0862
                        MOV       _ACCDLO, _ACCALO
SYSTEM._L0860:
                        RCALL     SYSTEM.TWISENDBYTE
                        TST       _ACCA
                        BREQ      SYSTEM._L0863
SYSTEM._L0862:
                        TST       _ACCBLO
                        BRNE       SYSTEM._L0867
                        TST       _ACCBHI
                        BREQ       SYSTEM._L0861
SYSTEM._L0867:
                        TST       _ACCDHI
                        BRNE      SYSTEM._L0864
                        LD        _ACCDLO, Z+
                        RJMP      SYSTEM._L0866
SYSTEM._L0864:
                        CPI       _ACCDHI, 1
                        BRNE      SYSTEM._L0865
                        LPM       _ACCDLO, Z+
                        RJMP      SYSTEM._L0866
SYSTEM._L0865:
                        CALL      SYSTEM.ReadEEp8D
                        ADIW      _ACCCLO, 01h
SYSTEM._L0866:
                        SBIW      _ACCBLO, 1
                        RJMP      SYSTEM._L0860
SYSTEM._L0861:
                        RCALL     SYSTEM.TWISTOPB
                        RJMP      SYSTEM.TWI_OK
SYSTEM._L0863:
                        RCALL     SYSTEM.TWI_ERROR
                        SER       _ACCB
                        STS       TWI_DevLock, _ACCB
                        CLR       _ACCA
                        RET

SYSTEM.SERINP_TO:
                        LDD       _ACCA, Y+000h
                        STS       _RXTIMEOUT, _ACCA
SYSTEM._L0868:
                        RCALL     SYSTEM.SERSTAT
                        TST       _ACCA
                        BRNE      SYSTEM._L0869
                        LDS       _ACCA, _RXTIMEOUT
                        TST       _ACCA
                        BRNE      SYSTEM._L0868
                        RET
SYSTEM._L0869:
                        RCALL     SYSTEM.SERINP
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        ST        Z+, _ACCA
                        STD       Y+002h, _ACCCHI
                        STD       Y+001h, _ACCCLO
                        SER       _ACCA
                        RET

SYSTEM.SERINP:
SYSTEM._L0870:
                        LDS       _ACCA, _RXCOUNT
                        TST       _ACCA
                        BREQ      SYSTEM._L0870
                        LDS       _ACCB, _RXOUTP
                        CLR       _ACCA
                        LDI       _ACCCLO, _RXBUFF AND 0FFh
                        LDI       _ACCCHI, _RXBUFF SHRB 8
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCA, Z
                        CLI
                        LDS       _ACCCLO, _RXCOUNT
                        DEC       _ACCCLO
                        STS       _RXCOUNT, _ACCCLO
                        SBRC      Flags, IntFlag
                        SEI
                        LDS       _ACCB, _RXOUTP
                        INC       _ACCB
                        CPI       _ACCB, 255
                        BRNE      SYSTEM._L0871
                        CLR       _ACCB
SYSTEM._L0871:
                        STS       _RXOUTP, _ACCB
                        RET

SYSTEM.SERSTAT:
                        CLR       _ACCA
                        LDS       _ACCB, _RXCOUNT
                        TST       _ACCB
                        BREQ      SYSTEM._L0873
                        COM       _ACCA
SYSTEM._L0873:
                        RET

SYSTEM.SEROUT:
SYSTEM._L0874:
                        LDS       _ACCB, _TXCOUNT
                        CPI       _ACCB, 255
                        BREQ      SYSTEM._L0874
                        CLI
                        LDS       _ACCB, _TXINP
                        LDI       _ACCCLO, _TXBUFF AND 0FFh
                        LDI       _ACCCHI, _TXBUFF SHRB 8
                        ADD       _ACCCLO, _ACCB
                        CLR       _ACCB
                        ADC       _ACCCHI, _ACCB
                        ST        Z, _ACCA
                        LDS       _ACCB, _TXCOUNT
                        INC       _ACCB
                        STS       _TXCOUNT, _ACCB
                        LDS       _ACCB, _TXINP
                        INC       _ACCB
                        CPI       _ACCB, 255
                        BRNE      SYSTEM._L0875
                        CLR       _ACCB
SYSTEM._L0875:
                        STS       _TXINP, _ACCB
                        SBI       ucr1, 5
                        SBRC      Flags, IntFlag
                        SEI
                        RET

SYSTEM.IncrCount4start:
                        CLI
                        IN        _ACCA, TIMSK
                        ORI       _ACCA, 010h
                        OUT       TIMSK, _ACCA
                        SBRC      Flags, IntFlag
                        SEI
                        RET

SYSTEM.GetIncrVal4:
                        LDI       _ACCCLO, _INCRCOUNT4_0 AND 0FFh
                        LDI       _ACCCHI, _INCRCOUNT4_0 SHRB 8
                        CPI       _ACCA, 1
                        BRCS      SYSTEM._L0876
                        LDI       _ACCB, 0
                        LDI       _ACCA, 0
                        LDI       _ACCALO, 0
                        LDI       _ACCAHI, 0
                        RET
SYSTEM._L0876:
                        CLR       _ACCB
                        LSL       _ACCA
                        LSL       _ACCA
                        ADD       _ACCCLO, _ACCA
                        ADC       _ACCCHI, _ACCB
                        CLI
                        LD        _ACCB, Z+
                        LD        _ACCA, Z+
                        LD        _ACCALO, Z+
                        LD        _ACCAHI, Z+
                        SBRC      Flags, IntFlag
                        SEI
                        RET

SYSTEM.SetIncrVal4:
                        LDD       _ACCA, Y+004h
                        CPI       _ACCA, 1
                        BRCS      SYSTEM._L0877
                        RET
SYSTEM._L0877:
                        LDI       _ACCCLO, _INCRCOUNT4_0 AND 0FFh
                        LDI       _ACCCHI, _INCRCOUNT4_0 SHRB 8
                        CLR       _ACCB
                        LSL       _ACCA
                        LSL       _ACCA
                        ADD       _ACCCLO, _ACCA
                        ADC       _ACCCHI, _ACCB
                        LDD       _ACCAHI, Y+003h
                        LDD       _ACCALO, Y+002h
                        LDD       _ACCA, Y+001h
                        LDD       _ACCB, Y+000h
                        CLI
                        ST        Z+, _ACCB
                        ST        Z+, _ACCA
                        ST        Z+, _ACCALO
                        ST        Z+, _ACCAHI
                        SBRC      Flags, IntFlag
                        SEI
                        RET


SYSTEM.MDELAY:
                        .DEB      DEBdelay
                        MOVW      _ACCDLO, _ACCB
                        CLR       _ACCA
                        CP        _ACCDLO, _ACCA
                        CPC       _ACCDHI, _ACCA
                        BREQ      SYSTEM.MDELAY3
SYSTEM.MDELAY1:
                        LDI       _ACCB, 00C7Ah AND 0FFh
                        LDI       _ACCA, 00C7Ah SHRB 8
SYSTEM.MDELAY2:
                        SUBI      _ACCB, 001h
                        SBCI      _ACCA, 000h
                        NOP
                        BRNE      SYSTEM.MDELAY2
                        SUBI      _ACCDLO, 001h
                        SBCI      _ACCDHI, 000h
                        BRNE      SYSTEM.MDELAY1
SYSTEM.MDELAY3:
                        RET

SYSTEM.UDELAY:
                        TST       _ACCA
                        BREQ      SYSTEM.UDELAY3
SYSTEM.UDELAY1:
                        LDI       _ACCB, 00026h AND 0FFh
SYSTEM.UDELAY2:
                        DEC       _ACCB
                        NOP
                        BRNE      SYSTEM.UDELAY2
                        DEC       _ACCA
                        BRNE      SYSTEM.UDELAY1
SYSTEM.UDELAY3:
                        RET

SYSTEM.BlockCopyC:
SYSTEM._L0878:
                        SUBI      _ACCALO, 001h
                        SBCI      _ACCAHI, 000h
                        BRCS      SYSTEM._L0879
                        LD        _ACCA, Z+
                        ST        X+, _ACCA
                        RJMP      SYSTEM._L0878
SYSTEM._L0879:
                        RET

SYSTEM._EEpWaitReady:
                        SBRC      Flags, IntFlag
                        SEI
                        SBIC      eecr, 1
                        RJMP      SYSTEM._EEpWaitReady

                        CLI
                        SBIC      eecr, 1
                        RJMP      SYSTEM._EEpWaitReady

                        RET

SYSTEM.WriteEEp8:
                        RCALL     SYSTEM._EEpWaitReady
                        PUSH      _ACCDLO
                        OUT       eearl, _ACCCLO
                        OUT       eearh, _ACCCHI
                        SBI       eecr, 0
                        NOP
                        IN        _ACCDLO, eedr
                        CP        _ACCA, _ACCDLO
                        BREQ      SYSTEM._L0880
                        OUT       eedr, _ACCA
                        SBI       eecr, 2
                        SBI       eecr, 1
SYSTEM._L0880:
                        POP       _ACCDLO
                        SBRC      Flags, IntFlag
                        SEI
                        RET

SYSTEM._WriteEEp16:
                        MOV       _ACCA, _ACCALO
                        RCALL     SYSTEM.WriteEEp8
                        MOV       _ACCA, _ACCAHI
                        ADIW      _ACCCLO, 01h
                        RCALL     SYSTEM.WriteEEp8
                        RET

SYSTEM._WriteEEp32:
                        MOV       _ACCA, _ACCBLO
                        RCALL     SYSTEM.WriteEEp8
                        MOV       _ACCA, _ACCBHI
                        ADIW      _ACCCLO, 01h
                        RCALL     SYSTEM.WriteEEp8
                        MOV       _ACCA, _ACCALO
                        ADIW      _ACCCLO, 01h
                        RCALL     SYSTEM.WriteEEp8
                        MOV       _ACCA, _ACCAHI
                        ADIW      _ACCCLO, 01h
                        RCALL     SYSTEM.WriteEEp8
                        RET

SYSTEM.ReadEEp8:
                        RCALL     SYSTEM._EEpWaitReady
                        OUT       eearl, _ACCCLO
                        OUT       eearh, _ACCCHI
                        SBI       eecr, 0
                        NOP
                        IN        _ACCA, eedr
                        SBRC      Flags, IntFlag
                        SEI
                        RET

SYSTEM._ReadEEp16:
                        RCALL     SYSTEM.ReadEEp8
                        MOV       _ACCB, _ACCA
                        ADIW      _ACCCLO, 01h
                        RCALL     SYSTEM.ReadEEp8
                        RET

SYSTEM._ReadEEp32:
                        CALL      SYSTEM.ReadEEp8
                        MOV       _ACCB, _ACCA
                        ADIW      _ACCCLO, 01h
                        RCALL     SYSTEM.ReadEEp8
                        MOV       _ACCBLO, _ACCA
                        ADIW      _ACCCLO, 01h
                        RCALL     SYSTEM.ReadEEp8
                        MOV       _ACCALO, _ACCA
                        ADIW      _ACCCLO, 01h
                        RCALL     SYSTEM.ReadEEp8
                        MOV       _ACCAHI, _ACCA
                        MOV       _ACCA, _ACCBLO
                        RET

SYSTEM.ReadEEp8D:
                        RCALL     SYSTEM._EEpWaitReady
                        OUT       eearl, _ACCCLO
                        OUT       eearh, _ACCCHI
                        SBI       eecr, 0
                        NOP
                        IN        _ACCDLO, eedr
                        SBRC      Flags, IntFlag
                        SEI
                        RET

SYSTEM.StringAppend:
                        POP       _ACCAHI
                        POP       _ACCALO
                        POP       _ACCB
                        POP       _ACCBHI
                        POP       _ACCBLO
                        POP       _ACCCHI
                        POP       _ACCCLO
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        MOV       _ACCFLO, _ACCFHI
                        ANDI      _ACCFLO, 10h
                        BREQ      SYSTEM._L0881
SYSTEM._L0881:
                        LD        _ACCA, X
                        INC       _ACCA
                        RJMP      SYSTEM._StrIns

SYSTEM.StringInsert:
                        POP       _ACCAHI
                        POP       _ACCALO
                        POP       _ACCB
                        POP       _ACCBHI
                        POP       _ACCBLO
                        POP       _ACCCHI
                        POP       _ACCCLO
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
SYSTEM._StrIns:
                        MOV       _ACCFLO, _ACCFHI
                        ANDI      _ACCFLO, 3
                        TST       _ACCFLO
                        BREQ      SYSTEM._L0882
                        LSR       _ACCFLO
                        BRNE      SYSTEM._L0884
                        PUSH      _ACCA
                        CALL      SYSTEM.ReadEEp8
                        MOV       _ACCAHI, _ACCA
                        POP       _ACCA
                        ADIW      _ACCCLO, 01h
                        RJMP      SYSTEM._L0883
SYSTEM._L0884:
                        LPM       _ACCAHI, Z+
                        RJMP      SYSTEM._L0883
SYSTEM._L0882:
                        LD        _ACCAHI, Z+
SYSTEM._L0883:
                        TST       _ACCAHI
                        BREQ      SYSTEM._L0891
                        MOV       _ACCFLO, _ACCFHI
                        ANDI      _ACCFLO, 10h
                        BREQ      SYSTEM._L0886
SYSTEM._L0886:
                        LD        _ACCALO, X
SYSTEM._L0888:
                        CP        _ACCB, _ACCA
                        BRCC      SYSTEM._L0890
SYSTEM._L0891:
                        RET
SYSTEM._L0890:
                        MOV       _ACCDLO, _ACCB
                        SUB       _ACCDLO, _ACCA
                        MOV       _ACCDHI, _ACCDLO
                        SUB       _ACCDLO, _ACCAHI
                        BRCS      SYSTEM._L0896
                        CP        _ACCALO, _ACCA
                        BRCC      SYSTEM._L0893
                        MOV       _ACCELO, _ACCAHI
                        ADD       _ACCELO, _ACCALO
                        CP        _ACCB, _ACCELO
                        BRCS      SYSTEM._L0892
                        MOV       _ACCB, _ACCELO
SYSTEM._L0892:
                        RJMP      SYSTEM._L0896
SYSTEM._L0893:
                        PUSH      _ACCBLO
                        PUSH      _ACCBHI
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        MOV       _ACCDHI, _ACCALO
                        SUB       _ACCDHI, _ACCA
                        CP        _ACCDHI, _ACCDLO
                        BRCC      SYSTEM._L0894
                        MOV       _ACCDLO, _ACCDHI
SYSTEM._L0894:
                        CLR       _ACCDHI
                        ADD       _ACCBLO, _ACCA
                        ADC       _ACCBHI, _ACCDHI
                        ADD       _ACCBLO, _ACCDLO
                        ADC       _ACCBHI, _ACCDHI
                        ADIW      _ACCBLO, 1
                        MOVW      _ACCCLO, _ACCBLO
                        ADD       _ACCCLO, _ACCAHI
                        ADC       _ACCCHI, _ACCDHI
                        MOV       _ACCDHI, _ACCDLO
                        INC       _ACCDHI
                        MOV       _ACCFLO, _ACCFHI
                        ANDI      _ACCFLO, 10h
                        BREQ      SYSTEM._L0895
SYSTEM._L0895:
                        LD        _ACCGLO, -X
                        ST        -Z, _ACCGLO
                        DEC       _ACCDHI
                        BRNE     SYSTEM._L0895
SYSTEM._L0889:
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        MOV       _ACCB, _ACCA
                        ADD       _ACCB, _ACCAHI
                        ADD       _ACCB, _ACCDLO
                        BRNE     SYSTEM._L0900
SYSTEM._L0896:
                        ADD       _ACCAHI, _ACCDLO
                        INC       _ACCAHI
SYSTEM._L0900:
                        MOV       _ACCFLO, _ACCFHI
                        ANDI      _ACCFLO, 10h
                        BREQ      SYSTEM._L0903
SYSTEM._L0903:
                        ST        X, _ACCB
SYSTEM._L0902:
                        CLR       _ACCALO
                        ADD       _ACCBLO, _ACCA
                        ADC       _ACCBHI, _ACCALO
SYSTEM._L0901:
                        MOV       _ACCFLO, _ACCFHI
                        ANDI      _ACCFLO, 3
                        TST       _ACCFLO
                        BREQ      SYSTEM._L0904
                        LSR       _ACCFLO
                        BRNE      SYSTEM._L0906
                        CALL      SYSTEM.ReadEEp8
                        MOV       _ACCGLO, _ACCA
                        ADIW      _ACCCLO, 01h
                        RJMP      SYSTEM._L0905
SYSTEM._L0906:
                        LPM       _ACCGLO, Z+
                        RJMP      SYSTEM._L0905
SYSTEM._L0904:
                        LD        _ACCGLO, Z+
SYSTEM._L0905:
                        MOV       _ACCFLO, _ACCFHI
                        ANDI      _ACCFLO, 10h
                        BREQ      SYSTEM._L0907
SYSTEM._L0907:
                        ST        X+, _ACCGLO
SYSTEM._L0908:
                        DEC       _ACCAHI
                        BRNE     SYSTEM._L0901
SYSTEM._L0899:
                        RET

SYSTEM.Str2Int:
                        CLR       _ACCAHI
                        CLR       _ACCALO
                        CLR       _ACCBHI
                        CLR       _ACCBLO
                        BST       Flags, _EEPROM
                        BRTC      SYSTEM._L0913
                        CALL      SYSTEM.ReadEEp8
                        ADIW      _ACCCLO, 01h
                        RJMP     SYSTEM._L0914
SYSTEM._L0913:
                        LD        _ACCA, Z+
SYSTEM._L0914:
                        TST       _ACCA
                        BRNE      SYSTEM._L0910
SYSTEM._L0909:
                        CLR       _ACCA
                        CLR       _ACCB
                        RET

SYSTEM._L0910:
                        MOV       _ACCDHI, _ACCA
                        TST       _ACCB
                        BREQ      SYSTEM._L0915
                        INC       _ACCDHI
                        RJMP      SYSTEM.Hex2Int
SYSTEM._L0915:
                        BST       Flags, _EEPROM
                        BRTC      SYSTEM._L0916
                        CALL      SYSTEM.ReadEEp8
                        ADIW      _ACCCLO, 01h
                        RJMP     SYSTEM._L0917
SYSTEM._L0916:
                        LD        _ACCA, Z+
SYSTEM._L0917:
                        CLT
                        BLD       Flags, _NEGATIVE
                        CPI       _ACCA, 02Dh
                        BRNE      SYSTEM._L0911
                        DEC       _ACCDHI
                        BREQ      SYSTEM._L0909
                        SET
                        BLD       Flags, _NEGATIVE
                        BST       Flags, _EEPROM
                        BRTC      SYSTEM._L0918
                        CALL      SYSTEM.ReadEEp8
                        ADIW      _ACCCLO, 01h
                        RJMP     SYSTEM._L0919
SYSTEM._L0918:
                        LD        _ACCA, Z+
SYSTEM._L0919:
                        RJMP      SYSTEM.Dec2Int
SYSTEM._L0911:
                        CPI       _ACCA, 02Bh
                        BRNE      SYSTEM._L0912
                        DEC       _ACCDHI
                        BREQ      SYSTEM._L0909
                        CLT
                        BLD       Flags, _NEGATIVE
                        BST       Flags, _EEPROM
                        BRTC      SYSTEM._L0920
                        CALL      SYSTEM.ReadEEp8
                        ADIW      _ACCCLO, 01h
                        RJMP     SYSTEM._L0921
SYSTEM._L0920:
                        LD        _ACCA, Z+
SYSTEM._L0921:
                        RJMP      SYSTEM.Dec2Int
SYSTEM._L0912:
                        CPI       _ACCA, 024h
                        BRNE      SYSTEM.Dec2Int
                        RJMP      SYSTEM.Hex2Int
SYSTEM.Dec2Int:
                        MOV       _ACCB, _ACCDHI
                        DEC       _ACCB
                        BRMI      SYSTEM._L0909
                        CLR       _ACCDHI
                        CLR       _ACCEHI
                        CLR       _ACCFHI
                        CLR       _ACCFLO
                        PUSH      _ACCB
                        RJMP      SYSTEM.Dec2Int1
SYSTEM._L0922:
                        PUSH      _ACCB
                        BST       Flags, _EEPROM
                        BRTC      SYSTEM._L0925
                        CALL      SYSTEM.ReadEEp8
                        ADIW      _ACCCLO, 01h
                        RJMP     SYSTEM._L0926
SYSTEM._L0925:
                        LD        _ACCA, Z+
SYSTEM._L0926:
SYSTEM.Dec2Int1:
                        CPI       _ACCA, 030h
                        BRCS      SYSTEM.Str2Ierr1
                        CPI       _ACCA, 03Ah
                        BRCC      SYSTEM.Str2Ierr1
                        SUBI      _ACCA, 030h
                        MOV       _ACCDLO, _ACCA
                        MOVW      _ACCB, _ACCBLO
                        LSL       _ACCB
                        ROL       _ACCA
                        ROL       _ACCEHI
                        ROL       _ACCFHI
                        LSL       _ACCB
                        ROL       _ACCA
                        ROL       _ACCEHI
                        ROL       _ACCFHI
                        ADD       _ACCB, _ACCBLO
                        ADC       _ACCA, _ACCBHI
                        ADC       _ACCEHI, _ACCFLO
                        ADC       _ACCFHI, _ACCFLO
                        ADD       _ACCEHI, _ACCALO
                        ADC       _ACCFHI, _ACCAHI
                        LSL       _ACCB
                        ROL       _ACCA
                        ROL       _ACCEHI
                        ROL       _ACCFHI
                        ADD       _ACCB, _ACCDLO
                        ADC       _ACCA, _ACCDHI
                        ADC       _ACCEHI, _ACCFLO
                        ADC       _ACCFHI, _ACCFLO
                        MOVW      _ACCBLO, _ACCB
                        MOV       _ACCALO, _ACCEHI
                        MOV       _ACCAHI, _ACCFHI
                        POP       _ACCB
                        DEC       _ACCB
                        BRMI      SYSTEM.Str2Iex
                        RJMP      SYSTEM._L0922
SYSTEM.Str2Ierr1:
                        POP       _ACCB
SYSTEM.Str2Ierr:
                        SET
                        BLD       Flags, _ERRFLAG
                        CLR       _ACCA
                        CLR       _ACCB
                        CLR       _ACCAHI
                        CLR       _ACCALO
                        RET

SYSTEM.Str2Iex:
                        MOVW      _ACCB, _ACCBLO
                        BST       Flags, _NEGATIVE
                        BRTC      SYSTEM._L0927
                        SUBI      _ACCB, 01h
                        SBCI      _ACCA, 00h
                        SBCI      _ACCALO, 00h
                        SBCI      _ACCAHI, 00h
                        COM       _ACCALO
                        COM       _ACCAHI
                        COM       _ACCA
                        COM       _ACCB
SYSTEM._L0927:
                        RET

SYSTEM.Hex2Int:
                        CLT
                        BLD       Flags, _NEGATIVE
                        DEC       _ACCDHI
                        BREQ      SYSTEM._L0927
                        CPI       _ACCDHI, 009h
                        BRSH      SYSTEM.Str2Ierr
SYSTEM._L0928:
                        BST       Flags, _EEPROM
                        BRTC      SYSTEM._L0932
                        CALL      SYSTEM.ReadEEp8
                        ADIW      _ACCCLO, 01h
                        RJMP     SYSTEM._L0933
SYSTEM._L0932:
                        LD        _ACCA, Z+
SYSTEM._L0933:
                        CPI       _ACCA, 061h
                        BRLO      SYSTEM._L0929
                        SUBI      _ACCA, 020h
SYSTEM._L0929:
                        CPI       _ACCA, 030h
                        BRLO      SYSTEM.Str2Ierr
                        CPI       _ACCA, 03Ah
                        BRLO      SYSTEM._L0930
                        CPI       _ACCA, 041h
                        BRLO      SYSTEM.Str2Ierr
                        CPI       _ACCA, 047h
                        BRSH      SYSTEM.Str2Ierr
                        SUBI      _ACCA, -9 AND 0FFh
SYSTEM._L0930:
                        ANDI      _ACCA, 00Fh
                        LDI       _ACCB, 4
SYSTEM._L0931:
                        LSL       _ACCBLO
                        ROL       _ACCBHI
                        ROL       _ACCALO
                        ROL       _ACCAHI
                        DEC       _ACCB
                        BRNE      SYSTEM._L0931
                        OR        _ACCBLO, _ACCA
                        DEC       _ACCDHI
                        BRNE      SYSTEM._L0928
                        RJMP      SYSTEM.Str2Iex
SYSTEM.PosChInVarStr:
                        CLR       _ACCA
                        LD        _ACCBHI, Z
                        TST       _ACCBHI
                        BREQ      SYSTEM._L0935
                        TST       _ACCELO
                        BRNE      SYSTEM._L0934
                        INC       _ACCELO
SYSTEM._L0934:
                        CP        _ACCBHI, _ACCELO
                        BRCS      SYSTEM._L0935
                        ADD       _ACCCLO, _ACCELO
                        ADC       _ACCCHI, _ACCA
                        DEC       _ACCELO
                        SUB       _ACCBHI, _ACCELO
                        MOV       _ACCA, _ACCELO
SYSTEM._L0936:
                        INC       _ACCA
                        LD        _ACCBLO, Z+
                        CP        _ACCB, _ACCBLO
                        BREQ      SYSTEM._L0935
                        DEC       _ACCBHI
                        BRNE      SYSTEM._L0936
                        CLR       _ACCA
SYSTEM._L0935:
                        RET


SYSTEM.UpperCaseStr:
                        LD        _ACCA, Z+
                        TST       _ACCA
                        BREQ      SYSTEM._L0938
                        MOV       _ACCBHI, _ACCA
SYSTEM._L0937:
                        LD        _ACCA, Z+
                        CPI       _ACCA, 061h
                        BRCS      SYSTEM._L0939
                        CPI       _ACCA, 07Bh
                        BRCC      SYSTEM._L0939
                        ANDI      _ACCA, 0DFh
SYSTEM._L0939:
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCBHI
                        BRNE      SYSTEM._L0937
SYSTEM._L0938:
                        RET


SYSTEM.StrCopyV:
                        TST       _ACCA
                        BREQ      SYSTEM._L0942
                        LD        _ACCBHI, Z
                        TST       _ACCBHI
                        BREQ      SYSTEM._L0942
                        SUB       _ACCBHI, _ACCB
                        BRCS      SYSTEM._L0942
                        INC       _ACCBHI
                        CLR       _ACCBLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCBLO
                        CP        _ACCBHI, _ACCA
                        BRCS      SYSTEM._L0941
                        MOV       _ACCBHI, _ACCA
SYSTEM._L0941:
                        LD        _ACCA, Z+
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCBHI
                        BRNE      SYSTEM._L0941
SYSTEM._L0942:
                        RET


SYSTEM.StrConst2Str:
SYSTEM._L0943:
                        LPM      _ACCA, Z+
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCBHI
                        BRNE      SYSTEM._L0943
                        RET


SYSTEM.StrVar2Str:
                        LD        _ACCA, Z+
                        TST       _ACCA
                        BREQ      SYSTEM._L0945
                        MOV       _ACCBHI, _ACCA
SYSTEM._L0944:
                        LD        _ACCA, Z+
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCBHI
                        BRNE      SYSTEM._L0944
SYSTEM._L0945:
                        RET


SYSTEM.Byte2Str:
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        SBIW      _FRAMEPTR, 6
                        LDD       _ACCB, Y+9
                        CLR       _ACCA
                        MOVW      _ACCALO, _ACCB
                        ANDI      _ACCB, 0Fh
                        SWAP      _ACCALO
                        ANDI      _ACCALO, 0Fh
                        MOVW      _ACCELO, _ACCALO
                        LSL       _ACCELO
                        ROL       _ACCEHI
                        LSL       _ACCELO
                        ROL       _ACCEHI
                        MOVW      _ACCDLO, _ACCB
                        SUB       _ACCDLO, _ACCELO
                        SBC       _ACCDHI, _ACCEHI
                        SUBI      _ACCDLO, 20 AND 0FFh
                        SBCI      _ACCDHI, 0
                        STD       Y+0, _ACCDLO
                        STD       Y+1, _ACCDHI
                        MOVW      _ACCDLO, _ACCALO
                        LSL       _ACCDLO
                        ROL       _ACCDHI
                        SUBI      _ACCDLO, 38 AND 0FFh
                        SBCI      _ACCDHI, 0
                        STD       Y+2, _ACCDLO
                        STD       Y+3, _ACCDHI
                        LDI       _ACCDLO, 4
                        STD       Y+4, _ACCDLO
                        STD       Y+5, _ACCA
                        MOVW      _ACCCLO, _FRAMEPTR
                        LDI       _ACCA, 2
                        LDD       R24, Z+0
                        LDD       R25, Z+1
                        LDD       R26, Z+2
                        LDD       R27, Z+3
SYSTEM._cv8_1:
                        TST       R25
                        BRPL      SYSTEM._cv8_2
                        ADIW      R24, 10
                        SBIW      R26, 1
                        RJMP      SYSTEM._cv8_1
SYSTEM._cv8_2:
                        ST        Z+, R24
                        ST        Z+, R25
                        MOVW      R24, R26
                        DEC       _ACCA
                        BREQ      SYSTEM._cv8_X
                        LDD       R26, Z+2
                        LDD       R27, Z+3
                        RJMP      SYSTEM._cv8_1
SYSTEM._cv8_X:
                        ST        Z+, R24
                        ST        Z+, R25
                        LDD       _ACCALO, Y+8
                        LDD       _ACCAHI, Y+7
                        LDD       _ACCDLO, Y+6
                        LDI       _ACCDHI, 3
                        LDI       _ACCFLO, 0
                        MOVW      _ACCCLO, _FRAMEPTR
                        MOVW      _ACCBLO, _FRAMEPTR
                        ADIW      XL, 10
                        RCALL     SYSTEM._B2STR
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        RET


SYSTEM.Long2Str:
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        SBIW      _FRAMEPTR, 28
                        MOVW      _ACCBLO, _FRAMEPTR
                        ADIW      XL, 20
                        MOVW      _ACCCLO, _FRAMEPTR
                        ADIW      ZL, 31
                        CLR       _ACCFLO
                        BST       Flags, _SIGN
                        BRTC      SYSTEM._cv32_0
                        LDD       _ACCAHI, Z+3
                        TST       _ACCAHI
                        BRPL      SYSTEM._cv32_0
                        LDI       _ACCFLO, 2Dh
                        LDD       _ACCALO, Z+2
                        LDD       _ACCA, Z+1
                        LDD       _ACCB, Z+0
                        SUBI      _ACCB, 01h
                        SBCI      _ACCA, 00h
                        SBCI      _ACCALO, 00h
                        SBCI      _ACCAHI, 00h
                        COM       _ACCB
                        COM       _ACCA
                        COM       _ACCALO
                        COM       _ACCAHI
                        STD       Z+0, _ACCB
                        STD       Z+1, _ACCA
                        STD       Z+2, _ACCALO
                        STD       Z+3, _ACCAHI
SYSTEM._cv32_0:
                        LDI       _ACCALO, 4
                        PUSH      _ACCFLO
SYSTEM._cv32_LP:
                        LDD       _ACCB, Z+000h
                        ANDI      _ACCB, 0fh
                        ST        X+, _ACCB
                        LD        _ACCB, Z+
                        SWAP      _ACCB
                        ANDI      _ACCB, 0fh
                        ST        X+, _ACCB
                        DEC       _ACCALO
                        BRNE      SYSTEM._cv32_LP
                        LDI       _ACCBHI, 0
                        MOVW      _ACCCLO, _FRAMEPTR
                        ADIW      ZL, 20
                        LDD       _ACCELO, Z+1
                        LDI       _ACCEHI, 0
                        LDD       _ACCDLO, Z+2
                        ADD       _ACCELO, _ACCDLO
                        ADC       _ACCEHI, _ACCBHI
                        LDD       _ACCDLO, Z+3
                        ADD       _ACCELO, _ACCDLO
                        ADC       _ACCEHI, _ACCBHI
                        LDD       _ACCDLO, Z+4
                        ADD       _ACCELO, _ACCDLO
                        ADC       _ACCEHI, _ACCBHI
                        LDD       _ACCDLO, Z+5
                        ADD       _ACCELO, _ACCDLO
                        ADC       _ACCEHI, _ACCBHI
                        LDD       _ACCDLO, Z+6
                        ADD       _ACCELO, _ACCDLO
                        ADC       _ACCEHI, _ACCBHI
                        LDD       _ACCDLO, Z+7
                        ADD       _ACCELO, _ACCDLO
                        ADC       _ACCEHI, _ACCBHI
                        LSL       _ACCELO
                        ROL       _ACCEHI
                        LSL       _ACCELO
                        ROL       _ACCEHI
                        LDD       _ACCDLO, Z+0
                        CLR       _ACCDHI
                        SUB       _ACCDLO, _ACCELO
                        SBC       _ACCDHI, _ACCEHI
                        SUBI      _ACCDLO, 20 AND 0FFh
                        SBCI      _ACCDHI, 0
                        STD       Y+0, _ACCDLO
                        STD       Y+1, _ACCDHI
                        LDD       _ACCELO, Z+1
                        CLR       _ACCEHI
                        LDD       _ACCDLO, Z+6
                        ADD       _ACCELO, _ACCDLO
                        ADC       _ACCEHI, _ACCBHI
                        LSL       _ACCELO
                        ROL       _ACCEHI
                        LDD       _ACCALO, Z+2
                        LDD       _ACCB, Z+7
                        CLR       _ACCA
                        ADD       _ACCB, _ACCALO
                        ADC       _ACCA, _ACCBHI
                        RCALL     SYSTEM._MUL6
                        ADD       _ACCELO, _ACCB
                        ADC       _ACCEHI, _ACCA
                        LDD       _ACCDLO, Z+4
                        CLR       _ACCDHI
                        LSL       _ACCDLO
                        ROL       _ACCDHI
                        LSL       _ACCDLO
                        ROL       _ACCDHI
                        ADD       _ACCELO, _ACCDLO
                        ADC       _ACCEHI, _ACCDHI
                        LDD       _ACCB, Z+5
                        CLR       _ACCA
                        RCALL     SYSTEM._MUL8
                        ADD       _ACCELO, _ACCB
                        ADC       _ACCEHI, _ACCA
                        SUBI      _ACCELO, 428 AND 0FFh
                        SBCI      _ACCEHI, 428 SHRB 8
                        STD       Y+2, _ACCELO
                        STD       Y+3, _ACCEHI
                        LDD       _ACCELO, Z+2
                        CLR       _ACCEHI
                        LDD       _ACCDLO, Z+6
                        ADD       _ACCELO, _ACCDLO
                        ADC       _ACCEHI, _ACCBHI
                        LSL       _ACCELO
                        ROL       _ACCEHI
                        LDD       _ACCDLO, Z+3
                        ADD       _ACCELO, _ACCDLO
                        ADC       _ACCEHI, _ACCBHI
                        LDD       _ACCB, Z+4
                        CLR       _ACCA
                        LDD       _ACCDLO, Z+5
                        ADD       _ACCB, _ACCDLO
                        ADC       _ACCA, _ACCBHI
                        RCALL     SYSTEM._MUL5
                        ADD       _ACCELO, _ACCB
                        ADC       _ACCEHI, _ACCA
                        LDD       _ACCDLO, Z+7
                        CLR       _ACCDHI
                        LSL       _ACCDLO
                        ROL       _ACCDHI
                        LSL       _ACCDLO
                        ROL       _ACCDHI
                        ADD       _ACCELO, _ACCDLO
                        ADC       _ACCEHI, _ACCDHI
                        SUBI      _ACCELO, 287 AND 0FFh
                        SBCI      _ACCEHI, 287 SHRB 8
                        STD       Y+4, _ACCELO
                        STD       Y+5, _ACCEHI
                        LDD       _ACCELO, Z+3
                        CLR       _ACCEHI
                        LSL       _ACCELO
                        ROL       _ACCEHI
                        LSL       _ACCELO
                        ROL       _ACCEHI
                        LDD       _ACCB, Z+4
                        CLR       _ACCA
                        LDD       _ACCDLO, Z+7
                        ADD       _ACCB, _ACCDLO
                        ADC       _ACCA, _ACCBHI
                        RCALL     SYSTEM._MUL5
                        ADD       _ACCELO, _ACCB
                        ADC       _ACCEHI, _ACCA
                        LDD       _ACCB, Z+5
                        CLR       _ACCA
                        RCALL     SYSTEM._MUL8
                        ADD       _ACCELO, _ACCB
                        ADC       _ACCEHI, _ACCA
                        LDD       _ACCB, Z+6
                        CLR       _ACCA
                        RCALL     SYSTEM._MUL7
                        ADD       _ACCELO, _ACCB
                        ADC       _ACCEHI, _ACCA
                        SUBI      _ACCELO, 437 AND 0FFh
                        SBCI      _ACCEHI, 437 SHRB 8
                        STD       Y+6, _ACCELO
                        STD       Y+7, _ACCEHI
                        LDD       _ACCELO, Z+5
                        CLR       _ACCEHI
                        LSL       _ACCELO
                        ROL       _ACCEHI
                        LSL       _ACCELO
                        ROL       _ACCEHI
                        LDD       _ACCB, Z+4
                        CLR       _ACCA
                        RCALL     SYSTEM._MUL6
                        ADD       _ACCELO, _ACCB
                        ADC       _ACCEHI, _ACCA
                        LDD       _ACCB, Z+6
                        CLR       _ACCA
                        RCALL     SYSTEM._MUL7
                        ADD       _ACCELO, _ACCB
                        ADC       _ACCEHI, _ACCA
                        LDD       _ACCB, Z+7
                        CLR       _ACCA
                        RCALL     SYSTEM._MUL3
                        ADD       _ACCELO, _ACCB
                        ADC       _ACCEHI, _ACCA
                        SUBI      _ACCELO, 303 AND 0FFh
                        SBCI      _ACCEHI, 303 SHRB 8
                        STD       Y+8, _ACCELO
                        STD       Y+9, _ACCEHI
                        LDD       _ACCELO, Z+7
                        CLR       _ACCEHI
                        LSL       _ACCELO
                        ROL       _ACCEHI
                        LSL       _ACCELO
                        ROL       _ACCEHI
                        LDD       _ACCB, Z+6
                        CLR       _ACCA
                        RCALL     SYSTEM._MUL7
                        ADD       _ACCELO, _ACCB
                        ADC       _ACCEHI, _ACCA
                        SUBI      _ACCELO, 165 AND 0FFh
                        SBCI      _ACCEHI, 165 SHRB 8
                        STD       Y+10, _ACCELO
                        STD       Y+11, _ACCEHI
                        LDD       _ACCELO, Z+5
                        CLR       _ACCEHI
                        LDD       _ACCB, Z+6
                        CLR       _ACCA
                        RCALL     SYSTEM._MUL6
                        ADD       _ACCELO, _ACCB
                        ADC       _ACCEHI, _ACCA
                        LDD       _ACCB, Z+7
                        CLR       _ACCA
                        RCALL     SYSTEM._MUL8
                        ADD       _ACCELO, _ACCB
                        ADC       _ACCEHI, _ACCA
                        SUBI      _ACCELO, 230 AND 0FFh
                        SBCI      _ACCEHI, 230 SHRB 8
                        STD       Y+12, _ACCELO
                        STD       Y+13, _ACCEHI
                        LDD       _ACCELO, Z+6
                        CLR       _ACCEHI
                        LDD       _ACCB, Z+7
                        CLR       _ACCA
                        RCALL     SYSTEM._MUL6
                        ADD       _ACCELO, _ACCB
                        ADC       _ACCEHI, _ACCA
                        SUBI      _ACCELO, 105 AND 0FFh
                        SBCI      _ACCEHI, 105 SHRB 8
                        STD       Y+14, _ACCELO
                        STD       Y+15, _ACCEHI
                        LDD       _ACCELO, Z+7
                        CLR       _ACCEHI
                        LSL       _ACCELO
                        ROL       _ACCEHI
                        SUBI      _ACCELO, 37 AND 0FFh
                        SBCI      _ACCEHI, 37 SHRB 8
                        STD       Y+16, _ACCELO
                        STD       Y+17, _ACCEHI
                        LDI       _ACCELO, 5
                        LDI       _ACCEHI, 0
                        STD       Y+18, _ACCELO
                        STD       Y+19, _ACCEHI
                        MOVW      _ACCCLO, _FRAMEPTR
                        LDI       _ACCA, 9
                        LDD       R24, Z+0
                        LDD       R25, Z+1
                        LDD       R26, Z+2
                        LDD       R27, Z+3
SYSTEM._cv32_1:
                        TST       R25
                        BRPL      SYSTEM._cv32_2
                        ADIW      R24, 10
                        SBIW      R26, 1
                        RJMP      SYSTEM._cv32_1
SYSTEM._cv32_2:
                        ST        Z+, R24
                        ST        Z+, R25
                        MOVW      R24, R26
                        DEC       _ACCA
                        BREQ      SYSTEM._cv32_X
                        LDD       R26, Z+2
                        LDD       R27, Z+3
                        RJMP      SYSTEM._cv32_1
SYSTEM._cv32_X:
                        ST        Z+, R24
                        ST        Z+, R25
                        POP       _ACCFLO
                        LDD       _ACCALO, Y+30
                        LDD       _ACCAHI, Y+29
                        LDD       _ACCDLO, Y+28
                        LDI       _ACCDHI, 10
                        MOVW      _ACCCLO, _FRAMEPTR
                        MOVW      _ACCBLO, _FRAMEPTR
                        ADIW      XL, 35
                        RCALL     SYSTEM._B2STR
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        RET

SYSTEM._B2STR:
                        PUSH      _ACCBLO
                        PUSH      _ACCBHI
                        LD        _ACCA, X+
                        LD        _ACCB, X+
                        LD        _ACCELO, X+
                        ST        -Y, _ACCELO
                        ST        -Y, _ACCB
                        ST        -Y, _ACCA
                        TST       _ACCFLO
                        BREQ       SYSTEM._B2STR_NM
                        TST       _ACCALO
                        BREQ       SYSTEM._B2STR_NM
                        DEC       _ACCALO
SYSTEM._B2STR_NM:
                        MOV       _ACCELO, _ACCDHI
                        MOV       _ACCEHI, _ACCDHI
                        LSL       _ACCEHI
                        DEC       _ACCEHI
                        MOVW      _ACCBLO, _ACCCLO
                        CLR       _ACCB
                        ADD       XL, _ACCEHI
                        ADC       XH, _ACCB
SYSTEM._B2STR_0:
                        LD        _ACCA, -X
                        TST       _ACCA
                        BRNE       SYSTEM._B2STR_1
                        SBIW      XL, 1
                        DEC       _ACCELO
                        BRNE       SYSTEM._B2STR_0
SYSTEM._B2STR_1:
                        TST       _ACCELO
                        BRNE       SYSTEM._B2STR_2
                        ADIW      XL, 1
                        INC       _ACCELO
SYSTEM._B2STR_2:
                        ADIW      XL, 2
                        TST       _ACCAHI
                        BRNE       SYSTEM._B2STR_PNT
                        TST       _ACCALO
                        BREQ       SYSTEM._B2STR_3
                        RJMP       SYSTEM._B2STR_FILL
SYSTEM._B2STR_3:
                        RJMP       SYSTEM._B2STR_WR
SYSTEM._B2STR_PNT:
                        TST       _ACCALO
                        BREQ       SYSTEM._B2STR_PNTE0
                        DEC       _ACCALO
SYSTEM._B2STR_PNTE0:
                        CLR       _ACCB
                        MOVW      _ACCBLO, _ACCCLO
                        CP        _ACCAHI, _ACCDHI
                        BRCC       SYSTEM._B2STR_PNTGT
                        MOV       _ACCEHI, _ACCAHI
                        LSL       _ACCEHI
                        ADD       XL, _ACCEHI
                        ADC       XH, _ACCB
                        LDI       _ACCA, 2Eh
                        ST        -X, _ACCA
                        CP        _ACCAHI, _ACCELO
                        BRCS       SYSTEM._B2STR_PNTE1
                        MOV       _ACCELO, _ACCAHI
                        INC       _ACCELO
SYSTEM._B2STR_PNTE1:
                        MOV       _ACCEHI, _ACCELO
                        LSL       _ACCEHI
                        MOVW      _ACCBLO, _ACCCLO
                        ADD       XL, _ACCEHI
                        ADC       XH, _ACCB
                        RJMP       SYSTEM._B2STR_FILL
SYSTEM._B2STR_PNTGT:
                        ADD       XL, _ACCEHI
                        ADC       XH, _ACCB
                        ADIW      XL, 1
                        MOV       _ACCEHI, _ACCAHI
                        ADDI      _ACCEHI, 2
                        CP        _ACCALO, _ACCEHI
                        BRCS       SYSTEM._B2STR_PNTG0
                        MOV       _ACCB, _ACCALO
                        SUB       _ACCB, _ACCEHI
                        INC       _ACCB
                        RJMP       SYSTEM._B2STR_PNTG1
SYSTEM._B2STR_PNTG0:
                        CLR       _ACCB
SYSTEM._B2STR_PNTG1:
                        MOV       _ACCALO, _ACCB
SYSTEM._B2STR_PNTG2:
                        TST       _ACCB
                        BREQ       SYSTEM._B2STR_PNTG3
                        MOV       _ACCA, _ACCDLO
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCB
                        RJMP       SYSTEM._B2STR_PNTG2
SYSTEM._B2STR_PNTG3:
                        MOV       _ACCEHI, _ACCAHI
                        SUB       _ACCEHI, _ACCDHI
                        MOV       _ACCELO, _ACCDHI
                        ADD       _ACCALO, _ACCEHI
                        TST       _ACCFLO
                        BREQ       SYSTEM._B2STR_PNTG4
                        MOV       _ACCA, _ACCFLO
                        CALL      SYSTEM.Char2Str
                        CLR       _ACCFLO
                        INC       _ACCALO
SYSTEM._B2STR_PNTG4:
                        ADDI      _ACCALO, 2
                        LDI       _ACCA, 30h
                        CALL      SYSTEM.Char2Str
                        LDI       _ACCA, 2Eh
                        CALL      SYSTEM.Char2Str
                        LDI       _ACCA, 30h
SYSTEM._B2STR_PNTG5:
                        TST       _ACCEHI
                        BREQ       SYSTEM._B2STR_WR
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCEHI
                        RJMP       SYSTEM._B2STR_PNTG5
SYSTEM._B2STR_FILL:
                        CP        _ACCELO, _ACCALO
                        BRCS       SYSTEM._B2STR_F0
                        CLR       _ACCALO
                        RJMP       SYSTEM._B2STR_WR
SYSTEM._B2STR_F0:
                        SUB       _ACCALO, _ACCELO
                        MOV       _ACCB, _ACCALO
SYSTEM._B2STR_F1:
                        MOV       _ACCA, _ACCDLO
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCB
                        BRNE       SYSTEM._B2STR_F1
SYSTEM._B2STR_WR:
                        TST       _ACCFLO
                        BREQ       SYSTEM._B2STR_WR0
                        MOV       _ACCA, _ACCFLO
                        CALL      SYSTEM.Char2Str
SYSTEM._B2STR_WR0:
                        LD        _ACCA, -X
                        TST       _ACCA
                        BREQ       SYSTEM._B2STR_WR1
                        CALL      SYSTEM.Char2Str
SYSTEM._B2STR_WR1:
                        LD        _ACCA, -X
                        ORI       _ACCA, 30h
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCELO
                        BRNE       SYSTEM._B2STR_WR0
                        POP       _ACCBHI
                        POP       _ACCBLO
                        LDD        _ACCA, Y+0
                        ST         X+, _ACCA
                        LDD        _ACCA, Y+1
                        ST         X+, _ACCA
                        LDD        _ACCA, Y+2
                        ST         X+, _ACCA
                        RET

SYSTEM._MUL3:
                        MOVW      _ACCALO, _ACCB
                        LSL       _ACCB
                        ROL       _ACCA
                        ADD       _ACCB, _ACCALO
                        ADC       _ACCA, _ACCAHI
                        RET

SYSTEM._MUL5:
                        MOVW      _ACCALO, _ACCB
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        ADD       _ACCB, _ACCALO
                        ADC       _ACCA, _ACCAHI
                        RET

SYSTEM._MUL6:
                        LSL       _ACCB
                        ROL       _ACCA
                        MOVW      _ACCALO, _ACCB
                        LSL       _ACCB
                        ROL       _ACCA
                        ADD       _ACCB, _ACCALO
                        ADC       _ACCA, _ACCAHI
                        RET

SYSTEM._MUL7:
                        MOVW      _ACCALO, _ACCB
                        MOVW      _ACCDLO, _ACCB
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCALO
                        ROL       _ACCAHI
                        ADD       _ACCB, _ACCALO
                        ADC       _ACCA, _ACCAHI
                        ADD       _ACCB, _ACCDLO
                        ADC       _ACCA, _ACCDHI
                        RET

SYSTEM._MUL8:
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        RET


SYSTEM.Int2Str:
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        SBIW      _FRAMEPTR, 10
                        LDD       XL, Y+13
                        LDD       XH, Y+14
                        CLR       _ACCFLO
                        BST       Flags, _SIGN
                        BRTC      SYSTEM._cv16_0
                        TST       XH
                        BRPL      SYSTEM._cv16_0
                        LDI       _ACCFLO, 2Dh
                        SUBI      XL, 01h
                        SBCI      XH, 00h
                        COM       XL
                        COM       XH
SYSTEM._cv16_0:
                        PUSH      _ACCFLO
                        mov       r24, XH
                        swap      r24
                        andi      r24, 0Fh
                        subi      r24, -0F0h and 0FFh
                        mov       r19, r24
                        add       r19, r24
                        subi      r24, -0E2h and 0ffh
                        mov       r18, r24
                        subi      r24, -32h and 0ffh
                        mov       r16, r24
                        mov       r24, XH
                        andi      r24, 0Fh
                        add       r18, r24
                        add       r18, r24
                        add       r16, r24
                        subi      r24, -0E9h and $ff
                        mov       r17, r24
                        add       r17, r24
                        add       r17, r24
                        mov       r24, XL
                        swap      r24
                        andi      r24, 0Fh
                        add       r17, r24
                        add       r16, r24
                        rol       r17
                        rol       r16
                        com       r16
                        clc
                        rol       r16
                        mov       r24, XL
                        andi      r24, 0Fh
                        add       r16, r24
                        rol       r19
                        ldi       r24, 07h
                        mov       r20, r24
                        ldi       r24, 0Ah
SYSTEM._cv16_1:
                        add       r16,r24
                        dec       r17
                        brcc      SYSTEM._cv16_1
SYSTEM._cv16_2:
                        add       r17, r24
                        dec       r18
                        brcc      SYSTEM._cv16_2
SYSTEM._cv16_3:
                        add       r18, r24
                        dec       r19
                        brcc      SYSTEM._cv16_3
SYSTEM._cv16_4:
                        add       r19, r24
                        dec       r20
                        brcc      SYSTEM._cv16_4
SYSTEM._cv16_5:
                        MOVW      _ACCBLO, _FRAMEPTR
                        clr       ZH
                        ldi       ZL, 16
                        ldi       r25, 5
                        ldi       r23, 0
SYSTEM._cv16_6:
                        ld        r24, Z+
                        st        X+, r24
                        st        X+, r23
                        dec       r25
                        brne      SYSTEM._cv16_6
                        LDD       _ACCALO, Y+12
                        LDD       _ACCAHI, Y+11
                        LDD       _ACCDLO, Y+10
                        LDI       _ACCDHI, 5
                        POP       _ACCFLO
                        MOVW      _ACCCLO, _FRAMEPTR
                        MOVW      _ACCBLO, _FRAMEPTR
                        ADIW      XL, 15
                        RCALL     SYSTEM._B2STR
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        RET


SYSTEM.StringComp:
                        LD        _ACCB, X+
                        SBRC      FLAGS, _STRCONST
                        RJMP      SYSTEM._L0946
                        LD        _ACCGLO, Z+
                        RJMP      SYSTEM._L0947
SYSTEM._L0946:
                        LPM       _ACCGLO, Z+
SYSTEM._L0947:
                        CP        _ACCB, _ACCGLO
                        BREQ      SYSTEM._L0948
                        CLZ
                        RET
SYSTEM._L0948:
                        TST       _ACCB
                        BRNE      SYSTEM._L0949
                        SEZ
                        RET
SYSTEM._L0949:
                        DEC       _ACCB
                        LD        _ACCA, X+
                        SBRC      FLAGS, _STRCONST
                        RJMP      SYSTEM._L0950
                        LD        _ACCGLO, Z+
                        RJMP      SYSTEM._L0951
SYSTEM._L0950:
                        LPM       _ACCGLO, Z+
SYSTEM._L0951:
                        CP        _ACCA, _ACCGLO
                        BREQ      SYSTEM._L0948
                        CLZ
                        RET


SYSTEM.Hex2Str8:
                        LDI       _ACCBHI, 2
SYSTEM._L0952:
                        SWAP      _ACCDLO
                        MOV       _ACCA, _ACCDLO
                        ANDI      _ACCA, 0Fh
                        CPI       _ACCA, 010
                        BRCS      SYSTEM._L0953
                        ADDI      _ACCA, 7
SYSTEM._L0953:
                        ADDI      _ACCA, 30h
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCBHI
                        BRNE      SYSTEM._L0952
                        RET


SYSTEM.Char2Str:
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        BST       Flags, _DEVICE
                        BRTS      SYSTEM._L0958
                        PUSH      _ACCA
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LDD       _ACCA, Y+000h
                        TST       _ACCA
                        BRNE      SYSTEM._L0955
                        POP       _ACCA
                        SET
                        BLD       Flags, _ERRFLAG
                        POP       _ACCCHI
                        POP       _ACCCLO
                        RET
SYSTEM._L0955:
                        DEC       _ACCA
                        STD       Y+000h, _ACCA
                        POP       _ACCA
                        BST       Flags, _EEPROM
                        BRTS      SYSTEM._L0956
                        ST        Z+, _ACCA
                        RJMP      SYSTEM._L0957
SYSTEM._L0956:
                        CALL      SYSTEM.WriteEEp8
                        ADIW      _ACCCLO, 01h
SYSTEM._L0957:
                        STD       Y+002h, _ACCCHI
                        STD       Y+001h, _ACCCLO
                        POP       _ACCCHI
                        POP       _ACCCLO
                        RET
SYSTEM._L0958:
                        LDD       _ACCCLO, Y+000h
                        LDD       _ACCCHI, Y+001h
                        PUSH      _ACCA
                        PUSH      _ACCB
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        PUSH      _ACCBLO
                        PUSH      _ACCBHI
                        PUSH      _ACCELO
                        PUSH      _ACCEHI
                        PUSH      _ACCDLO
                        PUSH      _ACCDHI
                        PUSH      _ACCFLO
                        PUSH      _ACCFHI
                        ICALL
                        POP       _ACCFHI
                        POP       _ACCFLO
                        POP       _ACCDHI
                        POP       _ACCDLO
                        POP       _ACCEHI
                        POP       _ACCELO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        POP       _ACCAHI
                        POP       _ACCALO
                        POP       _ACCB
                        POP       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        RET

SYSTEM.FTRUNCX:
                        PUSH      _ACCELO
                        PUSH      _ACCEHI
                        MOV       _ACCEHI, _ACCAHI
                        MOV       _ACCELO, _ACCALO
                        ROL       _ACCELO
                        ROL       _ACCEHI
                        SUBI      _ACCEHI, 127
                        BRCC      SYSTEM._L0959
                        POP       _ACCEHI
                        POP       _ACCELO
                        CLR       _ACCA
                        CLR       _ACCB
                        CLR       _ACCAHI
                        CLR       _ACCALO
                        RET
SYSTEM._L0959:
                        ORI       _ACCALO, 080h
                        MOV       _ACCELO, _ACCAHI
                        CLR       _ACCAHI
                        CPI       _ACCEHI, 24
                        BRSH      SYSTEM._L0961
                        SUBI      _ACCEHI, 23
                        NEG       _ACCEHI
SYSTEM._L0960:
                        BREQ      SYSTEM._L0963
                        LSR       _ACCAHI
                        ROR       _ACCALO
                        ROR       _ACCA
                        ROR       _ACCB
                        DEC       _ACCEHI
                        RJMP      SYSTEM._L0960
SYSTEM._L0961:
                        SUBI      _ACCEHI, 23
SYSTEM._L0962:
                        BREQ      SYSTEM._L0963
                        LSL       _ACCB
                        ROL       _ACCA
                        ROL       _ACCALO
                        ROL       _ACCAHI
                        DEC       _ACCEHI
                        RJMP      SYSTEM._L0962
SYSTEM._L0963:
                        SBRS      _ACCELO, 7
                        RJMP      SYSTEM._L0964
                        SUBI      _ACCB, 01h
                        SBCI      _ACCA, 00h
                        SBCI      _ACCALO, 00h
                        SBCI      _ACCAHI, 00h
                        COM       _ACCB
                        COM       _ACCA
                        COM       _ACCAHI
                        COM       _ACCALO
SYSTEM._L0964:
                        POP       _ACCEHI
                        POP       _ACCELO
                        RET

SYSTEM.FENTIERx:
                        CPI       _ACCAHI, 0CFh
                        BRLO      SYSTEM._L0965
                        LDI       _ACCAHI, 080h
                        CLR       _ACCALO
                        CLR       _ACCA
                        CLR       _ACCB
                        RET
SYSTEM._L0965:
                        SBRC      _ACCAHI, 7
                        RJMP      SYSTEM._L0966
                        CPI       _ACCAHI, 04Fh
                        BRLO      SYSTEM._L0966
                        LDI       _ACCAHI, 07Fh
                        LDI       _ACCALO, 0FFh
                        LDI       _ACCA, 0FFh
                        LDI       _ACCB, 0FFh
                        RET
SYSTEM._L0966:
                        SBRS      _ACCAHI, 7
                        RJMP      SYSTEM.FTRUNCX
                        ANDI      _ACCAHI, 07Fh
                        CALL      SYSTEM.FTRUNCX
                        SUBI      _ACCB, 01h
                        SBCI      _ACCA, 00h
                        SBCI      _ACCALO, 00h
                        SBCI      _ACCAHI, 00h
                        COM       _ACCALO
                        COM       _ACCAHI
                        COM       _ACCA
                        COM       _ACCB
                        RET

SYSTEM.FloatToLInt:
                        MOV       _ACCDHI, _ACCAHI
                        MOV       _ACCBHI, _ACCAHI
                        MOV       _ACCBLO, _ACCALO
                        CLR       _ACCAHI
                        ORI       _ACCALO, 080h
                        ANDI      _ACCBHI, 07Fh
                        ANDI      _ACCBLO, 080h
                        ROL       _ACCBLO
                        ROL       _ACCBHI
                        SUBI      _ACCBHI, 07Fh
                        BRPL      SYSTEM._L0968
                        CLR       _ACCAHI
                        CLR       _ACCALO
                        CLR       _ACCA
                        CLR       _ACCB
                        RET
SYSTEM._L0968:
                        CPI       _ACCBHI, 23
                        BRCC      SYSTEM._L0970
                        LDI       _ACCBLO, 23
                        SUB       _ACCBLO, _ACCBHI
                        BREQ      SYSTEM._L0972
SYSTEM._L0969:
                        LSR       _ACCAHI
                        ROR       _ACCALO
                        ROR       _ACCA
                        ROR       _ACCB
                        DEC       _ACCBLO
                        BRNE      SYSTEM._L0969
                        RJMP      SYSTEM._L0972
SYSTEM._L0970:
                        SUBI      _ACCBHI, 23
                        BREQ      SYSTEM._L0972
                        MOV       _ACCBLO, _ACCBHI
SYSTEM._L0971:
                        LSL       _ACCB
                        ROL       _ACCA
                        ROL       _ACCALO
                        ROL       _ACCAHI
                        BRCC      SYSTEM._L0973
                        SET
                        BLD       Flags, _ERRFLAG
SYSTEM._L0973:
                        DEC       _ACCBLO
                        BRNE      SYSTEM._L0971
SYSTEM._L0972:
                        SBRS      _ACCDHI, 7
                        RET
                        SUBI      _ACCB, 01h
                        SBCI      _ACCA, 00h
                        SBCI      _ACCALO, 00h
                        SBCI      _ACCAHI, 00h
                        COM       _ACCALO
                        COM       _ACCAHI
                        COM       _ACCA
                        COM       _ACCB
                        RET


SYSTEM.HighF:
                        MOV       _ACCDLO, _ACCAHI
                        AND       _ACCDLO, _ACCCHI
                        ANDI      _ACCDLO, 080h
                        SBRS      _ACCAHI, 7
                        RJMP      SYSTEM._L0974
                        CBR       _ACCAHI, 080h
                        SBRS      _ACCDLO, 7
                        RJMP      SYSTEM._L0976
SYSTEM._L0974:
                        SBRS      _ACCCHI, 7
                        RJMP      SYSTEM._L0975
                        CBR       _ACCCHI, 080h
                        SBRS      _ACCDLO, 7
                        RJMP      SYSTEM._L0977
SYSTEM._L0975:
                        CP        _ACCAHI, _ACCCHI
                        BRLO      SYSTEM._L0976
                        BRNE      SYSTEM._L0977
                        CP        _ACCALO, _ACCCLO
                        BRLO      SYSTEM._L0976
                        BRNE      SYSTEM._L0977
                        CP        _ACCA, _ACCBHI
                        BRLO      SYSTEM._L0976
                        BRNE      SYSTEM._L0977
                        CP        _ACCB, _ACCBLO
                        BRLO      SYSTEM._L0976
                        BRNE      SYSTEM._L0977
                        RJMP      SYSTEM._L0981
SYSTEM._L0976:
                        SBRC      _ACCDLO, 7
                        RJMP      SYSTEM._L0979
SYSTEM._L0978:
                        BST       Flags, _NEGATIVE
                        BRTS      SYSTEM._L0980
                        MOVW      _ACCB, _ACCBLO
                        MOVW      _ACCALO, _ACCCLO
SYSTEM._L0980:
                        INC       _ACCDHI
                        RJMP      SYSTEM._L0981
SYSTEM._L0977:
                        SBRC      _ACCDLO, 7
                        RJMP      SYSTEM._L0978
SYSTEM._L0979:
                        DEC       _ACCDHI
SYSTEM._L0981:
                        OR        _ACCAHI, _ACCDLO
                        RET

SYSTEM.LIntToFloat:
                        TST       _ACCAHI
                        BRNE      SYSTEM._L0982
                        TST       _ACCALO
                        BRNE      SYSTEM._L0982
                        TST       _ACCA
                        BRNE      SYSTEM._L0982
                        TST       _ACCB
                        BRNE      SYSTEM._L0982
                        RET
SYSTEM._L0982:
                        CLR       _ACCBLO
                        SBRS      Flags, _SIGN
                        RJMP      SYSTEM._L0983
                        MOV       _ACCBLO, _ACCAHI
                        ANDI      _ACCBLO, 080h
                        TST       _ACCAHI
                        BRPL      SYSTEM._L0988
                        SUBI      _ACCB, 01h
                        SBCI      _ACCA, 00h
                        SBCI      _ACCALO, 00h
                        SBCI      _ACCAHI, 00h
                        COM       _ACCALO
                        COM       _ACCAHI
                        COM       _ACCA
                        COM       _ACCB
SYSTEM._L0988:
SYSTEM._L0983:
                        LDI       _ACCBHI, 150
SYSTEM._L0984:
                        TST       _ACCAHI
                        BREQ      SYSTEM._L0985
                        LSR       _ACCAHI
                        ROR       _ACCALO
                        ROR       _ACCA
                        ROR       _ACCB
                        INC       _ACCBHI
                        RJMP      SYSTEM._L0984
SYSTEM._L0985:
                        SBRC      _ACCALO, 7
                        RJMP      SYSTEM._L0986
                        LSL       _ACCB
                        ROL       _ACCA
                        ROL       _ACCALO
                        ROL       _ACCAHI
                        DEC       _ACCBHI
                        RJMP      SYSTEM._L0985
SYSTEM._L0986:
                        ANDI      _ACCALO, 07Fh
                        MOV       _ACCAHI, _ACCBHI
                        LSR       _ACCAHI
                        BRCC      SYSTEM._L0987
                        ORI       _ACCALO, 080h
SYSTEM._L0987:
                        OR        _ACCAHI, _ACCBLO
                        RET

SYSTEM.MulFloat:
                        MOVW      _ACCBLO, _ACCB
                        MOVW      _ACCCLO, _ACCALO
                        POP       _ACCA
                        POP       _ACCB
                        POP       _ACCEHI
                        POP       _ACCELO
                        POP       _ACCDHI
                        POP       _ACCDLO
                        PUSH      _ACCB
                        PUSH      _ACCA
SYSTEM.MulFloat_R:
                        TST       _ACCCHI
                        BREQ      SYSTEM._L0989
                        TST       _ACCEHI
                        BRNE      SYSTEM._L0990
SYSTEM._L0989:
                        CLR       _ACCB
                        CLR       _ACCA
                        CLR       _ACCALO
                        CLR       _ACCAHI
                        RET
SYSTEM._L0990:
                        MOV       _ACCAHI, _ACCCHI
                        EOR       _ACCAHI, _ACCEHI
                        ANDI      _ACCAHI, 080h
                        ROL       _ACCCLO
                        ROL       _ACCCHI
                        SEC
                        ROR       _ACCCLO
                        ROL       _ACCELO
                        ROL       _ACCEHI
                        SEC
                        ROR       _ACCELO
                        CLR       _ACCA
                        ADD       _ACCCHI, _ACCEHI
                        ADC       _ACCA, _ACCA
                        SUBI      _ACCCHI, 07Fh
                        SBCI      _ACCA, 00h
                        TST       _ACCA
                        BRNE      SYSTEM._L0991
                        CPI       _ACCCHI, 0FFh
                        BRLO      SYSTEM._L0992
SYSTEM._L0991:
                        SET
                        BLD       Flags, _ERRFLAG
                        ANDI      _ACCAHI, 080h
                        ORI       _ACCAHI, 07Eh
                        LDI       _ACCALO, 0FFh
                        LDI       _ACCB, 0FFh
                        LDI       _ACCA, 0FFh
                        RET
SYSTEM._L0992:
                        CPI       _ACCCHI, 01h
                        BRSH      SYSTEM._L0993
                        CLR       _ACCAHI
                        CLR       _ACCALO
                        CLR       _ACCB
                        CLR       _ACCA
                        SET
                        BLD       Flags, _ERRFLAG
                        RET
SYSTEM._L0993:
                        PUSH      _ACCAHI
                        PUSH      _ACCCHI
                        CLR       _ACCCHI
                        CLR       _ACCEHI
                        CLR       _ACCFHI
                        CLR       _ACCFLO
                        CLR       _ACCGHI
                        CLR       _ACCGLO
                        LSR       _ACCEHI
                        ROR       _ACCELO
                        ROR       _ACCDHI
                        ROR       _ACCDLO
                        LDI       _ACCA, 32
SYSTEM._L0994:
                        BRCC      SYSTEM._L0995
                        ADD       _ACCFLO, _ACCBLO
                        ADC       _ACCFHI, _ACCBHI
                        ADC       _ACCGLO, _ACCCLO
                        ADC       _ACCGHI, _ACCCHI
SYSTEM._L0995:
                        ROR       _ACCGHI
                        ROR       _ACCGLO
                        ROR       _ACCFHI
                        ROR       _ACCFLO
                        ROR       _ACCEHI
                        ROR       _ACCELO
                        ROR       _ACCDHI
                        ROR       _ACCDLO
                        DEC       _ACCA
                        BRNE      SYSTEM._L0994
                        LDI       _ACCALO, 23
SYSTEM._L0996:
                        LSR       _ACCGHI
                        ROR       _ACCGLO
                        ROR       _ACCFHI
                        ROR       _ACCFLO
                        ROR       _ACCEHI
                        ROR       _ACCELO
                        ROR       _ACCDHI
                        ROR       _ACCDLO
                        DEC       _ACCALO
                        BRNE      SYSTEM._L0996
                        MOV       _ACCB, _ACCDLO
                        MOV       _ACCA, _ACCDHI
                        MOV       _ACCALO, _ACCELO
                        MOV       _ACCAHI, _ACCEHI
                        POP       _ACCBHI
                        POP       _ACCGLO
                        TST       _ACCAHI
                        BREQ      SYSTEM._L0997
                        LSR       _ACCAHI
                        ROR       _ACCALO
                        ROR       _ACCA
                        ROR       _ACCB
                        INC       _ACCBHI
SYSTEM._L0997:
                        MOV       _ACCAHI, _ACCGLO
                        ROL       _ACCALO
                        LSR       _ACCBHI
                        ROR       _ACCALO
                        OR        _ACCAHI, _ACCBHI
                        RET

SYSTEM.DivFloat:
                        MOVW      _ACCBLO, _ACCB
                        MOVW      _ACCCLO, _ACCALO
                        POP       _ACCA
                        POP       _ACCB
                        POP       _ACCEHI
                        POP       _ACCELO
                        POP       _ACCDHI
                        POP       _ACCDLO
                        PUSH      _ACCB
                        PUSH      _ACCA
SYSTEM.DivFloat_R:
                        MOV       _ACCAHI, _ACCCHI
                        EOR       _ACCAHI, _ACCEHI
                        ANDI      _ACCAHI, 080h
                        TST       _ACCCHI
                        BRNE      SYSTEM._L0999
SYSTEM._L0998:
                        SET
                        BLD       Flags, _ERRFLAG
                        ANDI      _ACCAHI, 080h
                        ORI       _ACCAHI, 07Eh
                        LDI       _ACCALO, 0FFh
                        LDI       _ACCA, 0FFh
                        LDI       _ACCB, 0FFh
                        RET
SYSTEM._L0999:
                        ROL       _ACCCLO
                        ROL       _ACCCHI
                        SEC
                        ROR       _ACCCLO
                        ROL       _ACCELO
                        ROL       _ACCEHI
                        SEC
                        ROR       _ACCELO
                        TST       _ACCEHI
                        BRNE      SYSTEM._L1001
                        CLR       _ACCAHI
                        CLR       _ACCALO
                        CLR       _ACCA
                        CLR       _ACCB
                        RET
SYSTEM._L1001:
                        CLR       _ACCA
                        SUB       _ACCEHI, _ACCCHI
                        SBCI      _ACCA, 00h
                        MOV       _ACCCHI, _ACCEHI
                        LDI       _ACCB, 7Eh
                        ADD       _ACCCHI, _ACCB
                        CLR       _ACCB
                        ADC       _ACCA, _ACCB
                        TST      _ACCA
                        BRNE     SYSTEM._L1003
                        CPI       _ACCCHI, 0FFh
                        BRNE      SYSTEM._L1002
SYSTEM._L1003:
                        SET
                        BLD       Flags, _ERRFLAG
                        ANDI      _ACCAHI, 080h
                        ORI       _ACCAHI, 07Eh
                        LDI       _ACCALO, 0FFh
                        LDI       _ACCB, 0FFh
                        LDI       _ACCA, 0FFh
                        RET
SYSTEM._L1002:
                        TST       _ACCCHI
                        BRNE      SYSTEM._L1000
                        SET
                        BLD       Flags, _ERRFLAG
                        CLR       _ACCAHI
                        CLR       _ACCALO
                        CLR       _ACCB
                        CLR       _ACCA
                        RET
SYSTEM._L1000:
                        PUSH      _ACCAHI
                        PUSH      _ACCCHI
                        CLR       _ACCCHI
                        CLR       _ACCFLO
                        CLR       _ACCFHI
                        MOV       _ACCEHI, _ACCELO
                        MOV       _ACCELO, _ACCDHI
                        MOV       _ACCDHI, _ACCDLO
                        CLR       _ACCDLO
                        LDI       _ACCA, 48
                        CLR       _ACCALO
                        CLR       _ACCAHI
                        CLR       _ACCGLO
                        CLR       _ACCGHI
                        CLR       _ACCHLO
                        CLR       _ACCHHI
                        CLC
SYSTEM._L1004:
                        ROL       _ACCFLO
                        ROL       _ACCFHI
                        ROL       _ACCDLO
                        ROL       _ACCDHI
                        ROL       _ACCELO
                        ROL       _ACCEHI
                        ROL       _ACCALO
                        ROL       _ACCAHI
                        ROL       _ACCGLO
                        ROL       _ACCGHI
                        ROL       _ACCHLO
                        ROL       _ACCHHI
                        BRCC      SYSTEM._L1005
                        CLR       _ACCB
                        SUB       _ACCALO, _ACCBLO
                        SBC       _ACCAHI, _ACCBHI
                        SBC       _ACCGLO, _ACCCLO
                        SBC       _ACCGHI, _ACCCHI
                        SBC       _ACCHLO, _ACCB
                        SBC       _ACCHHI, _ACCB
                        SEC
                        RJMP      SYSTEM._L1007
SYSTEM._L1005:
                        CLR       _ACCB
                        CP        _ACCHHI, _ACCB
                        BRLO      SYSTEM._L1007
                        BRNE      SYSTEM._L1006
                        CP        _ACCHLO, _ACCB
                        BRLO      SYSTEM._L1007
                        BRNE      SYSTEM._L1006
                        CP        _ACCGHI, _ACCCHI
                        BRLO      SYSTEM._L1007
                        BRNE      SYSTEM._L1006
                        CP        _ACCGLO, _ACCCLO
                        BRLO      SYSTEM._L1007
                        BRNE      SYSTEM._L1006
                        CP        _ACCAHI, _ACCBHI
                        BRLO      SYSTEM._L1007
                        BRNE      SYSTEM._L1006
                        CP        _ACCALO, _ACCBLO
                        BRLO      SYSTEM._L1007
SYSTEM._L1006:
                        CLR       _ACCB
                        SUB       _ACCALO, _ACCBLO
                        SBC       _ACCAHI, _ACCBHI
                        SBC       _ACCGLO, _ACCCLO
                        SBC       _ACCGHI, _ACCCHI
                        SBC       _ACCHLO, _ACCB
                        SBC       _ACCHHI, _ACCB
SYSTEM._L1007:
                        DEC       _ACCA
                        BRCS      SYSTEM._L1008
                        SEC
                        RJMP      SYSTEM._L1009
SYSTEM._L1008:
                        CLC
SYSTEM._L1009:
                        BRNE      SYSTEM._L1004
                        ROL       _ACCFLO
                        ROL       _ACCFHI
                        ROL       _ACCDLO
                        ROL       _ACCDHI
                        ROL       _ACCELO
                        ROL       _ACCEHI
                        MOV       _ACCB, _ACCFLO
                        MOV       _ACCA, _ACCFHI
                        MOV       _ACCALO, _ACCDLO
                        MOV       _ACCAHI, _ACCDHI
                        POP       _ACCBHI
                        TST       _ACCAHI
                        BREQ      SYSTEM._L1010
                        LSR       _ACCAHI
                        ROR       _ACCALO
                        ROR       _ACCA
                        ROR       _ACCB
                        INC       _ACCBHI
SYSTEM._L1010:
                        POP       _ACCAHI
                        ROL       _ACCALO
                        LSR       _ACCBHI
                        ROR       _ACCALO
                        OR        _ACCAHI, _ACCBHI
                        RET

SYSTEM.RoundFloat:
                        CLR       _ACCDHI
                        CLR       _ACCDLO
                        LDI       _ACCEHI, 07Fh
                        MOV       _ACCELO, _ACCAHI
                        ROL       _ACCELO
                        ROR       _ACCEHI
                        CLR       _ACCELO
                        MOVW      _ACCBLO, _ACCB
                        MOVW      _ACCCLO, _ACCALO
                        CALL      SYSTEM.AddFloat1
                        JMP       SYSTEM.FTRUNCX

SYSTEM.SubFloat:
                        MOVW      _ACCBLO, _ACCB
                        MOVW      _ACCCLO, _ACCALO
                        POP       _ACCA
                        POP       _ACCB
                        POP       _ACCEHI
                        POP       _ACCELO
                        POP       _ACCDHI
                        POP       _ACCDLO
                        PUSH      _ACCB
                        PUSH      _ACCA
SYSTEM.SubFloat1:
                        LDI       _ACCA, 80h
                        EOR       _ACCCHI, _ACCA
                        RJMP      SYSTEM.AddFloat1
SYSTEM.AddFloat:
                        MOVW      _ACCBLO, _ACCB
                        MOVW      _ACCCLO, _ACCALO
                        POP       _ACCA
                        POP       _ACCB
                        POP       _ACCEHI
                        POP       _ACCELO
                        POP       _ACCDHI
                        POP       _ACCDLO
                        PUSH      _ACCB
                        PUSH      _ACCA
SYSTEM.AddFloat1:
                        MOV       _ACCA, _ACCCHI
                        ANDI      _ACCA, 07Fh
                        MOV       _ACCB, _ACCEHI
                        ANDI      _ACCB, 07Fh
                        CP        _ACCB, _ACCA
                        BRCS      SYSTEM._L1011
                        BRNE      SYSTEM._L1012
                        CP        _ACCELO, _ACCCLO
                        BRCS      SYSTEM._L1011
                        BRNE      SYSTEM._L1012
                        CP        _ACCDHI, _ACCBHI
                        BRCS      SYSTEM._L1011
                        BRNE      SYSTEM._L1012
                        CP        _ACCDLO, _ACCBLO
                        BRCS      SYSTEM._L1011
SYSTEM._L1012:
                        MOVW      _ACCB, _ACCDLO
                        MOVW      _ACCALO, _ACCELO
                        MOV       _ACCDHI, _ACCBHI
                        MOV       _ACCDLO, _ACCBLO
                        MOV       _ACCEHI, _ACCCHI
                        MOV       _ACCELO, _ACCCLO
                        MOVW      _ACCBLO, _ACCB
                        MOVW      _ACCCLO, _ACCALO
                        RJMP      SYSTEM._L1021
SYSTEM._L1011:
                        MOVW      _ACCB, _ACCBLO
                        MOVW      _ACCALO, _ACCCLO
SYSTEM._L1021:
                        ANDI      _ACCALO, 07Fh
                        ORI       _ACCALO, 080h
                        CLR       _ACCAHI
                        SBRS      _ACCCHI, 7
                        RJMP      SYSTEM._L1013
                        SUBI      _ACCB, 01h
                        SBCI      _ACCA, 00h
                        SBCI      _ACCALO, 00h
                        SBCI      _ACCAHI, 00h
                        COM       _ACCALO
                        COM       _ACCAHI
                        COM       _ACCA
                        COM       _ACCB
SYSTEM._L1013:
                        PUSH      _ACCA
                        MOV       _ACCFHI, _ACCCHI
                        MOV       _ACCFLO, _ACCCLO
                        ROL       _ACCFLO
                        ROL       _ACCFHI
                        MOV       _ACCFLO, _ACCEHI
                        MOV       _ACCGLO, _ACCELO
                        ROL       _ACCGLO
                        ROL       _ACCFLO
                        MOV       _ACCGHI, _ACCDHI
                        MOV       _ACCGLO, _ACCDLO
                        MOV       _ACCHLO, _ACCELO
                        LDI       _ACCA, 080h
                        OR        _ACCHLO, _ACCA
                        CLR       _ACCHHI
                        MOV       _ACCA, _ACCFHI
                        SUB       _ACCA, _ACCFLO
                        TST       _ACCA
SYSTEM._L1014:
                        BREQ      SYSTEM._L1015
                        LSR       _ACCHLO
                        ROR       _ACCGHI
                        ROR       _ACCGLO
                        DEC       _ACCA
                        RJMP      SYSTEM._L1014
SYSTEM._L1015:
                        MOV       _ACCA, _ACCEHI
                        MOV       _ACCDLO, _ACCGLO
                        MOV       _ACCDHI, _ACCGHI
                        MOV       _ACCELO, _ACCHLO
                        MOV       _ACCEHI, _ACCHHI
                        SBRS      _ACCA, 7
                        RJMP      SYSTEM._L1016
                        SUBI      _ACCDLO, 01h
                        SBCI      _ACCDHI, 00h
                        SBCI      _ACCELO, 00h
                        SBCI      _ACCEHI, 00h
                        COM       _ACCDLO
                        COM       _ACCDHI
                        COM       _ACCEHI
                        COM       _ACCELO
SYSTEM._L1016:
                        POP       _ACCA
                        ADD       _ACCB, _ACCDLO
                        ADC       _ACCA, _ACCDHI
                        ADC       _ACCALO, _ACCELO
                        ADC       _ACCAHI, _ACCEHI
                        SBRS      _ACCAHI, 7
                        RJMP      SYSTEM._L1017
                        ORI       _ACCCHI, 080h
                        SUBI      _ACCB, 01h
                        SBCI      _ACCA, 00h
                        SBCI      _ACCALO, 00h
                        SBCI      _ACCAHI, 00h
                        COM       _ACCALO
                        COM       _ACCAHI
                        COM       _ACCA
                        COM       _ACCB
                        RJMP      SYSTEM._L1018
SYSTEM._L1017:
                        ANDI      _ACCCHI, 07Fh
SYSTEM._L1018:
                        MOV       _ACCFLO, _ACCAHI
                        ANDI      _ACCFLO, 07Fh
                        BREQ      SYSTEM._L1019
                        LSR       _ACCAHI
                        ROR       _ACCALO
                        ROR       _ACCA
                        ROR       _ACCB
                        INC       _ACCFHI
                        BRNE      SYSTEM._L1019
                        LDI       _ACCA, 0FFh
                        LDI       _ACCB, 0FFh
                        LDI       _ACCALO, 0FFh
                        LDI       _ACCAHI, 07Fh
                        SBRC      _ACCCHI, 7
                        ORI       _ACCAHI, 080h
                        SET
                        BLD       Flags, _ERRFLAG
                        RET
SYSTEM._L1019:
                        SBRC      _ACCALO, 7
                        RJMP      SYSTEM._L1020
                        TST       _ACCFHI
                        BREQ      SYSTEM._L1020
                        LSL       _ACCB
                        ROL       _ACCA
                        ROL       _ACCALO
                        ROL       _ACCAHI
                        DEC       _ACCFHI
                        RJMP      SYSTEM._L1019
SYSTEM._L1020:
                        MOV       _ACCAHI, _ACCFHI
                        CLR       _ACCFHI
                        LSR       _ACCAHI
                        TST       _ACCAHI
                        BREQ      SYSTEM._L1022
                        ROR       _ACCFHI
                        ANDI      _ACCALO, 07Fh
                        OR        _ACCALO, _ACCFHI
                        SBRC      _ACCCHI, 7
                        ORI       _ACCAHI, 080h
                        RET
SYSTEM._L1022:
                        CLR       _ACCALO
                        CLR       _ACCA
                        CLR       _ACCB
                        RET

SYSTEM.SqrFloat:
                        MOVW      _ACCBLO, _ACCB
                        MOVW      _ACCCLO, _ACCALO
                        MOVW      _ACCDLO, _ACCB
                        MOVW      _ACCELO, _ACCALO
                        JMP       SYSTEM.MulFloat_R

SYSTEM.IntFloat:
                        MOV       _ACCEHI, _ACCAHI
                        MOV       _ACCELO, _ACCALO
                        ROL       _ACCELO
                        ROL       _ACCEHI
                        CPI       _ACCEHI, 127
                        BRSH      SYSTEM._L1023
                        CLR       _ACCA
                        CLR       _ACCB
                        CLR       _ACCAHI
                        CLR       _ACCALO
                        RET
SYSTEM._L1023:
                        CPI       _ACCEHI, 151
                        BRLO      SYSTEM._L1024
                        RET
SYSTEM._L1024:
                        SUBI      _ACCEHI, 150
                        NEG       _ACCEHI
                        LDI       _ACCBHI, 0FFh
                        LDI       _ACCBLO, 0FFh
                        LDI       _ACCCHI, 0FFh
                        LDI       _ACCCLO, 0FFh
SYSTEM._L1025:
                        BREQ      SYSTEM._L1026
                        LSL       _ACCBLO
                        ROL       _ACCBHI
                        ROL       _ACCCLO
                        ROL       _ACCCHI
                        DEC       _ACCEHI
                        RJMP      SYSTEM._L1025
SYSTEM._L1026:
                        AND       _ACCB, _ACCBLO
                        AND       _ACCA, _ACCBHI
                        AND       _ACCALO, _ACCCLO
                        AND       _ACCAHI, _ACCCHI
                        RET

SYSTEM.Str2Float:
                        CLT
                        BLD       Flags, _ERRFLAG
                        CLR       _ACCHHI
                        CLR       _ACCHLO
                        CLR       _ACCA
                        CLR       _ACCB
                        CLR       _ACCAHI
                        CLR       _ACCALO
                        PUSH      _ACCALO
                        RCALL     SYSTEM.Str2FltRdChr
                        MOV       _ACCBLO, _ACCDLO
                        ADIW      _ACCCLO, 1
                        RCALL     SYSTEM.ACSkipSpace
SYSTEM.Str2Flt1:
                        RCALL     SYSTEM.ACNUM
                        BRCS      SYSTEM.Str2Flt4
                        CPI       _ACCDLO, 2Bh
                        BRNE      SYSTEM.Str2Flt2
                        ADIW      _ACCCLO, 1
                        DEC       _ACCBLO
                        RJMP      SYSTEM.Str2Flt1
SYSTEM.Str2Flt2:
                        CPI       _ACCDLO, 2Dh
                        BRNE      SYSTEM.Str2Flt3
                        POP       _ACCDLO
                        COM       _ACCDLO
                        PUSH      _ACCDLO
                        ADIW      _ACCCLO, 1
                        DEC       _ACCBLO
                        RCALL     SYSTEM.ACNUM
                        BRCS      SYSTEM.Str2Flt4
SYSTEM.Str2Flt3:
                        CPI       _ACCDLO, DECIMALSEP
                        BRNE      SYSTEM.Str2Flt5
                        ADIW      _ACCCLO, 1
                        DEC       _ACCBLO
                        RCALL     SYSTEM.ACNUM
                        BRCC      SYSTEM.Str2Flt5
                        RJMP      SYSTEM.Str2Flt11
SYSTEM.Str2Flt5:
                        POP       _ACCDLO
                        CLR       _ACCHHI
                        CLR       _ACCHLO
                        CLR       _ACCA
                        CLR       _ACCB
                        SET
                        BLD       Flags, _ERRFLAG
                        SEC
                        RET

SYSTEM.Str2Flt4:
                        RCALL     SYSTEM.ACNUM
                        BRCC      SYSTEM.Str2Flt10
                        RCALL     SYSTEM.ADDNXT
                        ADIW      _ACCCLO, 1
                        DEC       _ACCBLO
                        TST       _ACCDLO
                        BREQ      SYSTEM.Str2Flt4
SYSTEM.Str2Flt6:
                        INC       _ACCAHI
                        ADIW      _ACCCLO, 1
                        DEC       _ACCBLO
                        RCALL     SYSTEM.ACNUM
                        BRCS      SYSTEM.Str2Flt6
                        CPI       _ACCDLO, DECIMALSEP
                        BRNE      SYSTEM.Str2Flt7
SYSTEM.Str2Flt8:
                        RCALL     SYSTEM.ACNUM
                        BRCC      SYSTEM.Str2Flt7
                        ADIW      _ACCCLO, 1
                        DEC       _ACCBLO
                        RJMP      SYSTEM.Str2Flt8
SYSTEM.Str2Flt7:
                        CPI       _ACCDLO, 45h
                        BREQ      SYSTEM.Str2Flt13
                        CPI       _ACCDLO, 65h
                        BREQ      SYSTEM.Str2Flt13
                        RJMP      SYSTEM.ACFIN
SYSTEM.Str2Flt13:
                        ADIW      _ACCCLO, 1
                        DEC       _ACCBLO
                        RCALL     SYSTEM.ACNUM
                        BRCS      SYSTEM.Str2Flt9
                        CPI       _ACCDLO, 2Dh
                        BREQ      SYSTEM.Str2Flt15
                        CPI       _ACCDLO, 2Bh
                        BREQ      SYSTEM.Str2Flt16
                        RJMP      SYSTEM.Str2Flt5
SYSTEM.Str2Flt15:
                        COM       _ACCHLO
SYSTEM.Str2Flt16:
                        ADIW      _ACCCLO, 1
                        DEC       _ACCBLO
                        RCALL     SYSTEM.ACNUM
                        BRCC      SYSTEM.Str2Flt5
SYSTEM.Str2Flt9:
                        SUBI      _ACCDLO, 30h
                        MOV       _ACCHHI, _ACCDLO
                        ADIW      _ACCCLO, 1
                        DEC       _ACCBLO
                        RCALL     SYSTEM.ACNUM
                        BRCC      SYSTEM.Str2Flt14
                        MOV       _ACCDHI, _ACCHHI
                        LSL       _ACCDHI
                        LSL       _ACCDHI
                        ADD       _ACCDHI, _ACCHHI
                        LSL       _ACCDHI
                        SUBI      _ACCDLO, 30h
                        ADD       _ACCDLO, _ACCDHI
                        MOV       _ACCHHI, _ACCDLO
                        CPI       _ACCDLO, 38
                        BRSH      SYSTEM.Str2Flt5
SYSTEM.Str2Flt14:
                        MOV       _ACCDLO, _ACCHHI
                        TST       _ACCHLO
                        BRPL      SYSTEM.Str2Flt12
                        NEG       _ACCDLO
SYSTEM.Str2Flt12:
                        ADD       _ACCDLO, _ACCAHI
                        MOV       _ACCAHI, _ACCDLO
                        RJMP      SYSTEM.ACFIN
SYSTEM.Str2Flt10:
                        CPI       _ACCDLO, DECIMALSEP
                        BRNE      SYSTEM.Str2Flt7
                        ADIW      _ACCCLO, 1
                        DEC       _ACCBLO
SYSTEM.Str2Flt11:
                        RCALL     SYSTEM.ACNUM
                        BRCC      SYSTEM.Str2Flt7
                        RCALL     SYSTEM.ADDNXT
                        ADIW      _ACCCLO, 1
                        DEC       _ACCBLO
                        TST       _ACCDLO
                        BRNE      SYSTEM.Str2Flt8
                        DEC       _ACCAHI
                        RJMP      SYSTEM.Str2Flt11

SYSTEM.ADDNXT:
                        MOV       _ACCFLO, _ACCALO
                        MOV       _ACCEHI, _ACCA
                        MOV       _ACCELO, _ACCB
                        LSL       _ACCB
                        ROL       _ACCA
                        ROL       _ACCALO
                        BRCS      SYSTEM.ADDNXT1
                        LSL       _ACCB
                        ROL       _ACCA
                        ROL       _ACCALO
                        BRCS      SYSTEM.ADDNXT1
                        ADD       _ACCB, _ACCELO
                        ADC       _ACCA, _ACCEHI
                        ADC       _ACCALO, _ACCFLO
                        BRCS      SYSTEM.ADDNXT1
                        LSL       _ACCB
                        ROL       _ACCA
                        ROL       _ACCALO
                        BRCS      SYSTEM.ADDNXT1
                        RCALL     SYSTEM.Str2FltRdChr
                        SUBI      _ACCDLO, 30h
                        CLR       _ACCDHI
                        ADD       _ACCB, _ACCDLO
                        ADC       _ACCA, _ACCDHI
                        ADC       _ACCALO, _ACCDHI
                        BRCS      SYSTEM.ADDNXT1
                        CLR       _ACCDLO
                        RET

SYSTEM.ADDNXT1:
                        MOV       _ACCALO, _ACCFLO
                        MOV       _ACCA, _ACCEHI
                        MOV       _ACCB, _ACCELO
                        SER       _ACCDLO
                        RET

SYSTEM.ACFIN:
                        POP       _ACCDLO
                        RCALL     SYSTEM.CHCK0
                        BREQ      SYSTEM.ACFIN3
                        MOV       _ACCHHI, _ACCAHI
                        CLR       _ACCAHI
                        CLT
                        BLD       Flags, _ERRFLAG
                        CLT
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.LIntToFloat
                        SBRC      _ACCDLO, 7
                        ORI       _ACCAHI, 80h
                        MOV       _ACCHLO, _ACCHHI
                        TST       _ACCHHI
                        BREQ      SYSTEM.ACFIN3
                        BRPL      SYSTEM.ACFIN1
                        NEG       _ACCHHI
SYSTEM.ACFIN1:
                        TST       _ACCHLO
                        BRMI      SYSTEM.ACFIN2
                        LDI       _ACCBLO, 000h
                        LDI       _ACCBHI, 000h
                        LDI       _ACCCLO, 020h
                        LDI       _ACCCHI, 041h
                        RJMP      SYSTEM.ACFIN4
SYSTEM.ACFIN2:
                        LDI       _ACCBLO, 0CDh
                        LDI       _ACCBHI, 0CCh
                        LDI       _ACCCLO, 0CCh
                        LDI       _ACCCHI, 03Dh
SYSTEM.ACFIN4:
                        MOV       _ACCDLO, _ACCB
                        MOV       _ACCDHI, _ACCA
                        MOV       _ACCELO, _ACCALO
                        MOV       _ACCEHI, _ACCAHI
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat_R
                        DEC       _ACCHHI
                        BRNE      SYSTEM.ACFIN1
SYSTEM.ACFIN3:
                        RET

SYSTEM.ACSkipSpace:
                        TST       _ACCBLO
                        BRNE      SYSTEM._L1027
                        RET
SYSTEM._L1027:
                        RCALL     SYSTEM.Str2FltRdChr
                        CPI       _ACCDLO, 020h
                        BRNE      SYSTEM._L1028
                        ADIW      _ACCCLO, 1
                        DEC       _ACCBLO
                        RJMP      SYSTEM.ACSkipSpace
SYSTEM._L1028:
                        RET

SYSTEM.ACNUM:
                        TST       _ACCBLO
                        BRNE      SYSTEM.ACNUM0
                        CLR       _ACCDLO
                        CLC
                        RET
SYSTEM.ACNUM0:
                        RCALL     SYSTEM.Str2FltRdChr
                        CPI       _ACCDLO, 030h
                        BRLO      SYSTEM.ACNUM1
                        CPI       _ACCDLO, 03Ah
                        BRSH      SYSTEM.ACNUM1
                        SEC
                        RET
SYSTEM.ACNUM1:
                        CLC
                        RET

SYSTEM.CHCK0:
                        TST       _ACCAHI
                        BRNE      SYSTEM.CHCK01
                        TST       _ACCALO
                        BRNE      SYSTEM.CHCK01
                        TST       _ACCA
                        BRNE      SYSTEM.CHCK01
                        TST       _ACCB
SYSTEM.CHCK01:
                        RET

SYSTEM.Str2FltRdChr:
                        BST       Flags, _EEPROM
                        BRTC      SYSTEM._L1029
                        CALL      SYSTEM.ReadEEp8D
                        RET
SYSTEM._L1029:
                        LD        _ACCDLO, Z
                        RET
SYSTEM.Float2Str_C:
                        PUSH      _ACCDHI
SYSTEM._L1031:
                        MOVW      _ACCELO, _ACCB
                        MOVW      _ACCFLO, _ACCALO
                        LDI       _ACCBLO, 07Fh
                        LDI       _ACCBHI, 096h
                        LDI       _ACCCLO, 018h
                        LDI       _ACCCHI, 04Bh
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        MOVW      _ACCB, _ACCELO
                        MOVW      _ACCALO, _ACCFLO
                        TST       _ACCDHI
                        BRMI      SYSTEM._L1033
                        BREQ      SYSTEM._L1033
                        LDI       _ACCBLO, 000h
                        LDI       _ACCBHI, 024h
                        LDI       _ACCCLO, 074h
                        LDI       _ACCCHI, 049h
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BRMI      SYSTEM._L1034
                        BREQ      SYSTEM._L1034
                        POP       _ACCDHI
                        DEC       _ACCDHI
                        PUSH      _ACCDHI
                        LDI       _ACCBLO, 000h
                        LDI       _ACCBHI, 000h
                        LDI       _ACCCLO, 020h
                        LDI       _ACCCHI, 041h
SYSTEM._L1032:
                        MOV       _ACCDLO, _ACCELO
                        MOV       _ACCDHI, _ACCEHI
                        MOV       _ACCELO, _ACCFLO
                        MOV       _ACCEHI, _ACCFHI
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat_R
                        RJMP      SYSTEM._L1031
SYSTEM._L1033:
                        POP       _ACCDHI
                        INC       _ACCDHI
                        PUSH      _ACCDHI
                        LDI       _ACCBLO, 0CDh
                        LDI       _ACCBHI, 0CCh
                        LDI       _ACCCLO, 0CCh
                        LDI       _ACCCHI, 03Dh
                        RJMP      SYSTEM._L1032
SYSTEM._L1034:
                        POP       _ACCDHI
                        RET

SYSTEM.Float2Str:
                        POP       _ACCDHI
                        POP       _ACCDLO
                        POP       _ACCCLO
                        POP       _ACCBLO
                        POP       _ACCBHI
                        POP       _ACCAHI
                        POP       _ACCALO
                        POP       _ACCA
                        POP       _ACCB
                        PUSH      _ACCDLO
                        PUSH      _ACCDHI
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCEHI, 17
                        LDI       _ACCELO, 30h
SYSTEM._L1030:
                        ST        -Y, _ACCELO
                        DEC       _ACCEHI
                        BRNE      SYSTEM._L1030
                        CLR       _ACCGLO
                        STD       Y+0, _ACCGLO
                        STD       Y+14, _ACCBHI
                        STD       Y+15, _ACCBLO
                        STD       Y+16, _ACCCLO
                        CLT
                        BLD       Flags, _ERRFLAG
                        MOV       _ACCEHI, _ACCAHI
                        ANDI      _ACCEHI, 07Fh
                        TST       _ACCEHI
                        BRNE      SYSTEM._L1041
                        LDD       _ACCA, Y+15
                        LDI       _ACCB, DECIMALSEP
                        CPI       _ACCA, 45h
                        BRNE      SYSTEM._L1042
                        LDI       _ACCA, 0FFh
                        STD       Y+15, _ACCA
                        LDI       _ACCA, 30h
                        RCALL     SYSTEM.Float2Str_P
                        LDI       _ACCA, 45h
                        RCALL     SYSTEM.Float2Str_P
                        LDI       _ACCA, 30h
                        RCALL     SYSTEM.Float2Str_P
                        LDI       _ACCALO, 0FFh
                        LDD       _ACCAHI, Y+14
                        RJMP      SYSTEM.Float2Str_F
SYSTEM._L1042:
                        LDI       _ACCA, 30h
                        RCALL     SYSTEM.Float2Str_P
                        LDI       _ACCA, DECIMALSEP
                        RCALL     SYSTEM.Float2Str_P
                        LDI       _ACCA, 30h
                        RCALL     SYSTEM.Float2Str_P
                        RCALL     SYSTEM.Float2Str_R
                        RJMP      SYSTEM.Float2Str_F
SYSTEM._L1041:
                        LDD       _ACCCHI, Y+15
                        CPI       _ACCCHI, 45h
                        BREQ      SYSTEM._L1043
                        CP        _ACCBLO, _ACCBHI
                        BRCS      SYSTEM._L1043
                        MOV       _ACCBHI, _ACCBLO
                        INC       _ACCBHI
                        STD       Y+14, _ACCBHI
SYSTEM._L1043:
                        CLR       _ACCDHI
                        TST       _ACCAHI
                        BRPL      SYSTEM._L1040
                        ANDI      _ACCAHI, 07Fh
                        PUSH      _ACCA
                        LDI       _ACCA, 2Dh
                        RCALL     SYSTEM.Float2Str_P
                        POP       _ACCA
SYSTEM._L1040:
                        RCALL     SYSTEM.Float2Str_C
                        PUSH      _ACCDHI
                        PUSH      _ACCELO
                        PUSH      _ACCEHI
                        PUSH      _ACCFLO
                        PUSH      _ACCFHI
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 03Fh
                        LDD       _ACCDLO, Y+15
                        LDD       _ACCBLO, Y+14
                        SUBI      _ACCDHI, -8 AND 0FFh
                        CPI       _ACCDHI, 8
                        BRGE      SYSTEM._L1046
                        CPI       _ACCDHI, -5 AND 0FFh
                        BRLT      SYSTEM._L1046
                        CPI       _ACCDLO, 45h
                        BREQ      SYSTEM._L1046
                        TST       _ACCBLO
                        BRNE      SYSTEM._L1044
                        SUB       _ACCDLO, _ACCDHI
SYSTEM._L1044:
                        MOV       _ACCBLO, _ACCDHI
                        LDI       _ACCDHI, 9
                        SUB       _ACCDHI, _ACCDLO
                        SUB       _ACCDHI, _ACCBLO
                        BRMI      SYSTEM._L1047
                        BRNE      SYSTEM._L1045
                        COM       _ACCDHI
                        STD       Y+15, _ACCDHI
                        RJMP      SYSTEM._L1046
SYSTEM._L1045:
                        DEC       _ACCDHI
                        BREQ      SYSTEM._L1046
                        PUSH      _ACCDHI
                        MOVW      _ACCDLO, _ACCB
                        MOVW      _ACCELO, _ACCALO
                        LDI       _ACCBLO, 000h
                        LDI       _ACCBHI, 000h
                        LDI       _ACCCLO, 020h
                        LDI       _ACCCHI, 041h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat_R
                        POP       _ACCDHI
                        RJMP      SYSTEM._L1045
SYSTEM._L1047:
SYSTEM._L1046:
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.AddFloat
                        POP       _ACCDHI
                        RCALL     SYSTEM.Float2Str_C
                        PUSH      _ACCDHI
                        MOVW      _ACCELO, _ACCB
                        MOVW      _ACCFLO, _ACCALO
                        ROL       _ACCALO
                        ROL       _ACCAHI
                        ORI       _ACCFLO, 80h
                        SUBI      _ACCAHI, 81h
                        NEG       _ACCAHI
                        SUBI      _ACCAHI, -21 AND 0FFh
                        RJMP      SYSTEM._L1036
SYSTEM._L1035:
                        LSR       _ACCFLO
                        ROR       _ACCEHI
                        ROR       _ACCELO
                        DEC       _ACCAHI
SYSTEM._L1036:
                        BRNE      SYSTEM._L1035
                        POP       _ACCBHI
                        LDI       _ACCBLO, 1
                        LDD       _ACCDLO, Y+15
                        CPI       _ACCDLO, 45h
                        BRNE      SYSTEM._L1048
                        SUBI      _ACCBHI, -8 AND 0FFh
                        MOV       _ACCALO, _ACCBHI
                        BRPL      SYSTEM._L1049
                        NEG       _ACCALO
SYSTEM._L1049:
                        RJMP      SYSTEM._L1037
SYSTEM._L1048:
                        LDI       _ACCALO, 7
                        SUBI      _ACCBHI, -8 AND 0FFh
                        CPI       _ACCBHI, 8
                        BRGE      SYSTEM._L1037
                        CPI       _ACCBHI, -5 AND 0FFh
                        BRLT      SYSTEM._L1037
                        DEC       _ACCBHI
                        MOV       _ACCBLO, _ACCBHI
                        LDI       _ACCBHI, 2
SYSTEM._L1037:
                        SUBI      _ACCBHI, 2
                        TST       _ACCBLO
                        BREQ      SYSTEM._L1051
                        BRPL      SYSTEM._L1038
SYSTEM._L1051:
                        LDI       _ACCA, 30h
                        RCALL     SYSTEM.Float2Str_P
                        LDI       _ACCA, DECIMALSEP
                        RCALL     SYSTEM.Float2Str_P
                        TST       _ACCBLO
                        BREQ      SYSTEM._L1038
SYSTEM._L1050:
                        LDI       _ACCA, 30h
                        RCALL     SYSTEM.Float2Str_P
                        DEC       _ACCALO
                        INC       _ACCBLO
                        BRNE      SYSTEM._L1050
SYSTEM._L1038:
                        LDI       _ACCCLO, SYSTEM.DECDIG AND 0FFh
                        LDI       _ACCCHI, SYSTEM.DECDIG SHRB 8
SYSTEM._L1039:
                        CLR       _ACCAHI
SYSTEM._L1052:
                        LPM       _ACCB, Z+
                        LPM       _ACCA, Z
                        ADIW      _ACCCLO, 1
                        LPM
                        ADIW      _ACCCLO, 02h
SYSTEM._L1057:
                        SUB       _ACCELO, _ACCB
                        SBC       _ACCEHI, _ACCA
                        SBC       _ACCFLO, _ACCGLO
                        BRCS      SYSTEM._L1053
                        INC       _ACCAHI
                        RJMP      SYSTEM._L1057
SYSTEM._L1053:
                        ADD       _ACCELO, _ACCB
                        ADC       _ACCEHI, _ACCA
                        ADC       _ACCFLO, _ACCGLO
                        CPI       _ACCAHI, 10
                        BRLT      SYSTEM._L1058
                        LDI       _ACCAHI, 1
                        INC       _ACCBHI
SYSTEM._L1058:
                        LDI       _ACCA, 30h
                        ADD       _ACCA, _ACCAHI
                        RCALL     SYSTEM.Float2Str_P
                        DEC       _ACCBLO
                        BRNE      SYSTEM._L1054
                        LDI       _ACCA, DECIMALSEP
                        RCALL     SYSTEM.Float2Str_P
SYSTEM._L1054:
                        DEC       _ACCALO
                        BRMI      SYSTEM._L1055
                        BRNE      SYSTEM._L1039
SYSTEM._L1055:
                        RCALL     SYSTEM.Float2Str_R
                        TST       _ACCBHI
                        BREQ      SYSTEM.Float2Str_F
                        LDI       _ACCA, 0FFh
                        STD       Y+15, _ACCA
                        LDI       _ACCA, 45h
                        RCALL     SYSTEM.Float2Str_P
                        TST       _ACCBHI
                        BRPL      SYSTEM._L1056
                        NEG       _ACCBHI
                        LDI       _ACCA, 2Dh
                        RCALL     SYSTEM.Float2Str_P
SYSTEM._L1056:
                        LDI       _ACCB, 10
                        MOV       _ACCA, _ACCBHI
                        CALL      SYSTEM.DIV8_R
                        TST       _ACCA
                        BREQ      SYSTEM._L1060
                        ORI       _ACCA, 30h
                        RCALL     SYSTEM.Float2Str_P
SYSTEM._L1060:
                        MOV       _ACCA, _ACCB
                        ORI       _ACCA, 30h
                        RCALL     SYSTEM.Float2Str_P
SYSTEM.Float2Str_F:
                        POP       _ACCCHI
                        POP       _ACCCLO
                        MOVW      _ACCBLO, _FRAMEPTR
                        LDD       _ACCALO, Y+15
                        LDD       _ACCAHI, Y+14
                        SBIW      _FRAMEPTR, 3
                        LDD       _ACCB, Z+0
                        STD       Y+0, _ACCB
                        LDD       _ACCB, Z+1
                        STD       Y+1, _ACCB
                        LDD       _ACCB, Z+2
                        STD       Y+2, _ACCB
                        CPI       _ACCALO, 0FFh
                        BREQ      SYSTEM._L1062
                        TST       _ACCAHI
                        BREQ      SYSTEM._L1062
                        TST       _ACCALO
                        BRNE      SYSTEM._L1061
                        RCALL     SYSTEM.Float2Str_D
                        ST        X, _ACCDHI
                        RJMP      SYSTEM._L1062
SYSTEM._L1061:
                        RCALL     SYSTEM.Float2Str_D
                        LD        _ACCDLO, X
                        SUB       _ACCAHI, _ACCALO
                        DEC       _ACCAHI
                        SUB       _ACCAHI, _ACCDHI
                        BREQ      SYSTEM._L1067
                        BRCS      SYSTEM._L1067
                        LDD       _ACCA, Y+16+3
SYSTEM._L1065:
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCAHI
                        BRNE      SYSTEM._L1065
SYSTEM._L1067:
                        ST        X, _ACCDHI
                        RCALL     SYSTEM.Float2Str_W
                        LDI       _ACCA, DECIMALSEP
                        CALL      SYSTEM.Char2Str
                        ADIW      _ACCBLO, 1
                        SUB       _ACCDLO, _ACCDHI
SYSTEM._L1069:
                        DEC       _ACCDLO
                        BREQ      SYSTEM._L1068
                        LD        _ACCA, X+
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCALO
                        BREQ      SYSTEM._L1066
                        RJMP      SYSTEM._L1069
SYSTEM._L1068:
                        LDI       _ACCA, 030h
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCALO
                        BRNE      SYSTEM._L1068
                        RJMP      SYSTEM._L1066
SYSTEM._L1062:
                        LD        _ACCB, X
                        SUB       _ACCAHI, _ACCB
                        BREQ      SYSTEM._L1064
                        BRCS      SYSTEM._L1064
                        LDD       _ACCA, Y+16+3
SYSTEM._L1063:
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCAHI
                        BRNE      SYSTEM._L1063
SYSTEM._L1064:
                        RCALL     SYSTEM.Float2Str_W
SYSTEM._L1066:
                        LDD       _ACCB, Y+0
                        STD       Z+0, _ACCB
                        LDD       _ACCB, Y+1
                        STD       Z+1, _ACCB
                        LDD       _ACCB, Y+2
                        STD       Z+2, _ACCB
                        MOVW      _FRAMEPTR, _ACCCLO
                        RET

SYSTEM.Float2Str_W:
                        LD        _ACCB, X+
SYSTEM._L1070:
                        LD        _ACCA, X+
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCB
                        BRNE      SYSTEM._L1070
                        RET

SYSTEM.Float2Str_D:
                        PUSH      _ACCBLO
                        PUSH      _ACCBHI
                        CLR       _ACCDHI
                        LD        _ACCB, X+
SYSTEM._L1071:
                        LD        _ACCA, X+
                        CPI       _ACCA, DECIMALSEP
                        BREQ      SYSTEM._L1072
                        INC       _ACCDHI
                        DEC       _ACCB
                        BRNE      SYSTEM._L1071
SYSTEM._L1072:
                        POP       _ACCBHI
                        POP       _ACCBLO
                        RET

SYSTEM.Float2Str_R:
                        LDD       _ACCCLO, Y+0
                        MOV       _ACCA, _ACCCLO
                        INC       _ACCCLO
                        CLR       _ACCCHI
                        ADD       _ACCCLO, _FRAMEPTR
                        ADC       _ACCCHI, _FPTRHI
SYSTEM._L1073:
                        DEC       _ACCA
                        LD        _ACCB, -Z
                        CPI       _ACCB, 030h
                        BREQ      SYSTEM._L1073
                        CPI       _ACCB, DECIMALSEP
                        BREQ      SYSTEM._L1074
                        INC       _ACCA
SYSTEM._L1074:
                        STD       Y+0, _ACCA
                        RET

SYSTEM.Float2Str_P:
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCCLO, Y+0
                        INC       _ACCCLO
                        STD       Y+0, _ACCCLO
                        CLR       _ACCCHI
                        ADD       _ACCCLO, _FRAMEPTR
                        ADC       _ACCCHI, _FPTRHI
                        STD       Z+0, _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        RET

SYSTEM.ExpFloat:
                        LDI       _ACCDLO, 3FB8AA3Bh AND 0FFh
                        LDI       _ACCDHI, 3FB8AA3Bh SHRB 8
                        LDI       _ACCELO, 3FB8AA3Bh SHRB 16
                        LDI       _ACCEHI, 3FB8AA3Bh SHRB 24
                        MOVW      _ACCBLO, _ACCB
                        MOVW      _ACCCLO, _ACCALO
                        CALL      SYSTEM.MulFloat_R
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCDLO, 3F000000h AND 0FFh
                        LDI       _ACCDHI, 3F000000h SHRB 8
                        LDI       _ACCELO, 3F000000h SHRB 16
                        LDI       _ACCEHI, 3F000000h SHRB 24
                        MOVW      _ACCBLO, _ACCB
                        MOVW      _ACCCLO, _ACCALO
                        CALL      SYSTEM.AddFloat1
                        CALL      SYSTEM.FENTIERx
                        SBRS      _ACCAHI, 7
                        RJMP      SYSTEM._L1076
                        CPI       _ACCAHI, 0FFh
                        BRNE      SYSTEM._L1075
                        CPI       _ACCALO, 0FFh
                        BRNE      SYSTEM._L1075
                        CPI       _ACCA, 0FFh
                        BRNE      SYSTEM._L1075
                        CPI       _ACCB, -128 AND 0FFh
                        BRSH      SYSTEM._L1078
SYSTEM._L1075:
                        LDI       _ACCB, 00000000h AND 0FFh
                        LDI       _ACCA, 00000000h SHRB 8
                        LDI       _ACCALO, 00000000h SHRB 16
                        LDI       _ACCAHI, 00000000h SHRB 24
                        RJMP      SYSTEM._L1077
SYSTEM._L1076:
                        TST       _ACCAHI
                        BRNE      SYSTEM._L1077
                        TST       _ACCALO
                        BRNE      SYSTEM._L1077
                        TST       _ACCA
                        BRNE      SYSTEM._L1077
                        CPI       _ACCB, 127
                        BRLO      SYSTEM._L1078
                        LDI       _ACCB, 7FFFFFFFh AND 0FFh
                        LDI       _ACCA, 7FFFFFFFh SHRB 8
                        LDI       _ACCALO, 7FFFFFFFh SHRB 16
                        LDI       _ACCAHI, 7FFFFFFFh SHRB 24
SYSTEM._L1077:
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        SET
                        BLD       Flags, _ERRFLAG
                        RET
SYSTEM._L1078:
                        MOVW      _ACCBLO, _ACCB
                        MOVW      _ACCCLO, _ACCALO
                        POP       _ACCAHI
                        POP       _ACCALO
                        POP       _ACCA
                        POP       _ACCB
                        PUSH      _ACCBLO
                        PUSH      _ACCBHI
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        MOVW      _ACCB, _ACCBLO
                        MOVW      _ACCALO, _ACCCLO
                        SET
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.LIntToFloat
                        LDI       _ACCBLO, 80h
                        EOR       _ACCAHI, _ACCBLO
                        MOVW      _ACCBLO, _ACCB
                        MOVW      _ACCCLO, _ACCALO
                        POP       _ACCEHI
                        POP       _ACCELO
                        POP       _ACCDHI
                        POP       _ACCDLO
                        CALL      SYSTEM.AddFloat1
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        CALL      SYSTEM.SqrFloat
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCDLO, 3D6C5665h AND 0FFh
                        LDI       _ACCDHI, 3D6C5665h SHRB 8
                        LDI       _ACCELO, 3D6C5665h SHRB 16
                        LDI       _ACCEHI, 3D6C5665h SHRB 24
                        MOVW      _ACCBLO, _ACCB
                        MOVW      _ACCCLO, _ACCALO
                        CALL      SYSTEM.MulFloat_R
                        LDI       _ACCDLO, 40E6E1AAh AND 0FFh
                        LDI       _ACCDHI, 40E6E1AAh SHRB 8
                        LDI       _ACCELO, 40E6E1AAh SHRB 16
                        LDI       _ACCEHI, 40E6E1AAh SHRB 24
                        MOVW      _ACCBLO, _ACCB
                        MOVW      _ACCCLO, _ACCALO
                        CALL      SYSTEM.AddFloat1
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        POP       _ACCEHI
                        POP       _ACCELO
                        POP       _ACCDHI
                        POP       _ACCDLO
                        PUSH      _ACCBLO
                        PUSH      _ACCBHI
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        MOVW      _ACCBLO, _ACCB
                        MOVW      _ACCCLO, _ACCALO
                        CALL      SYSTEM.MulFloat_R
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCDLO, 41A68BB7h AND 0FFh
                        LDI       _ACCDHI, 41A68BB7h SHRB 8
                        LDI       _ACCELO, 41A68BB7h SHRB 16
                        LDI       _ACCEHI, 41A68BB7h SHRB 24
                        CALL      SYSTEM.AddFloat1
                        MOVW      _ACCDLO, _ACCB
                        MOVW      _ACCELO, _ACCALO
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        PUSH      _ACCBLO
                        PUSH      _ACCBHI
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCA, 80h
                        EOR       _ACCCHI, _ACCA
                        CALL      SYSTEM.AddFloat1
                        POP       _ACCEHI
                        POP       _ACCELO
                        POP       _ACCDHI
                        POP       _ACCDLO
                        MOVW      _ACCBLO, _ACCB
                        MOVW      _ACCCLO, _ACCALO
                        CALL      SYSTEM.DivFloat_R
                        LDI       _ACCBLO, 3F000000h AND 0FFh
                        LDI       _ACCBHI, 3F000000h SHRB 8
                        LDI       _ACCCLO, 3F000000h SHRB 16
                        LDI       _ACCCHI, 3F000000h SHRB 24
                        MOVW      _ACCDLO, _ACCB
                        MOVW      _ACCELO, _ACCALO
                        CALL      SYSTEM.AddFloat1
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        MOV       _ACCEHI, _ACCAHI
                        LSL       _ACCALO
                        ROL       _ACCEHI
                        INC       _ACCBLO
                        ADD       _ACCEHI, _ACCBLO
                        LSR       _ACCEHI
                        ROR       _ACCALO
                        ANDI      _ACCAHI, 080h
                        OR        _ACCAHI, _ACCEHI
                        RET

SYSTEM.PowFloat:
                        POP       _ACCBHI
                        POP       _ACCBLO
                        POP       _ACCEHI
                        POP       _ACCELO
                        POP       _ACCDHI
                        POP       _ACCDLO
                        PUSH      _ACCBLO
                        PUSH      _ACCBHI
SYSTEM.PowFloat1:
                        TST       _ACCEHI
                        BRNE      SYSTEM._L1079
                        CLR       _ACCA
                        CLR       _ACCB
                        CLR       _ACCAHI
                        CLR       _ACCALO
                        RET
SYSTEM._L1079:
                        TST       _ACCAHI
                        BRNE      SYSTEM._L1080
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 080h
                        LDI       _ACCAHI, 03Fh
                        RET
SYSTEM._L1080:
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        MOVW      _ACCB, _ACCDLO
                        MOVW      _ACCALO, _ACCELO
                        CALL      SYSTEM.LogNFloat
                        POP       _ACCEHI
                        POP       _ACCELO
                        POP       _ACCDHI
                        POP       _ACCDLO
                        MOVW      _ACCBLO, _ACCB
                        MOVW      _ACCCLO, _ACCALO
                        CALL      SYSTEM.MulFloat_R
                        JMP       SYSTEM.ExpFloat

SYSTEM.LogNFloat:
                        MOV       _ACCEHI, _ACCAHI
                        MOV       _ACCELO, _ACCALO
                        ROL       _ACCELO
                        ROL       _ACCEHI
                        CLR       _ACCELO
                        SUBI      _ACCEHI, 127
                        SBCI      _ACCELO, 00h
                        PUSH      _ACCELO
                        PUSH      _ACCEHI
                        ANDI      _ACCAHI, 080h
                        ORI       _ACCAHI, 03Fh
                        ORI       _ACCALO, 080h
                        LDI       _ACCBHI, 004h
                        LDI       _ACCBLO, 0F3h
                        LDI       _ACCCHI, 03Fh
                        LDI       _ACCCLO, 0B5h
                        MOVW      _ACCDLO, _ACCB
                        MOVW      _ACCELO, _ACCALO
                        CALL      SYSTEM.MulFloat_R
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        MOVW      _ACCDLO, _ACCB
                        MOVW      _ACCELO, _ACCALO
                        LDI       _ACCBLO, 000h
                        LDI       _ACCBHI, 000h
                        LDI       _ACCCLO, 080h
                        LDI       _ACCCHI, 03Fh
                        CALL      SYSTEM.SubFloat1
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCDLO, 000h
                        LDI       _ACCDHI, 000h
                        LDI       _ACCELO, 080h
                        LDI       _ACCEHI, 03Fh
                        CALL      SYSTEM.AddFloat1
                        POP       _ACCEHI
                        POP       _ACCELO
                        POP       _ACCDHI
                        POP       _ACCDLO
                        MOVW      _ACCBLO, _ACCB
                        MOVW      _ACCCLO, _ACCALO
                        CALL      SYSTEM.DivFloat_R
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        CALL      SYSTEM.SqrFloat
                        ORI       _ACCAHI, 080h
                        MOVW      _ACCBLO, _ACCB
                        MOVW      _ACCCLO, _ACCALO
                        LDI       _ACCDLO, 3FD4114Ch AND 0FFh
                        LDI       _ACCDHI, 3FD4114Ch SHRB 8
                        LDI       _ACCELO, 3FD4114Ch SHRB 16
                        LDI       _ACCEHI, 3FD4114Ch SHRB 24
                        CALL      SYSTEM.AddFloat1
                        LDI       _ACCDLO, 3FEA3855h AND 0FFh
                        LDI       _ACCDHI, 3FEA3855h SHRB 8
                        LDI       _ACCELO, 3FEA3855h SHRB 16
                        LDI       _ACCEHI, 3FEA3855h SHRB 24
                        MOVW      _ACCBLO, _ACCB
                        MOVW      _ACCCLO, _ACCALO
                        CALL      SYSTEM.DivFloat_R
                        LDI       _ACCDLO, 3F654226h AND 0FFh
                        LDI       _ACCDHI, 3F654226h SHRB 8
                        LDI       _ACCELO, 3F654226h SHRB 16
                        LDI       _ACCEHI, 3F654226h SHRB 24
                        MOVW      _ACCBLO, _ACCB
                        MOVW      _ACCCLO, _ACCALO
                        CALL      SYSTEM.AddFloat1
                        POP       _ACCEHI
                        POP       _ACCELO
                        POP       _ACCDHI
                        POP       _ACCDLO
                        MOVW      _ACCBLO, _ACCB
                        MOVW      _ACCCLO, _ACCALO
                        CALL      SYSTEM.MulFloat_R
                        POP       _ACCEHI
                        POP       _ACCELO
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        MOV       _ACCB, _ACCEHI
                        MOV       _ACCA, _ACCELO
                        MOV       _ACCAHI, _ACCELO
                        MOV       _ACCALO, _ACCELO
                        SET
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.LIntToFloat
                        LDI       _ACCDLO, 0BF000000h AND 0FFh
                        LDI       _ACCDHI, 0BF000000h SHRB 8
                        LDI       _ACCELO, 0BF000000h SHRB 16
                        LDI       _ACCEHI, 0BF000000h SHRB 24
                        MOVW      _ACCBLO, _ACCB
                        MOVW      _ACCCLO, _ACCALO
                        CALL      SYSTEM.AddFloat1
                        MOVW      _ACCBLO, _ACCB
                        MOVW      _ACCCLO, _ACCALO
                        LDI       _ACCDLO, 3F317218h AND 0FFh
                        LDI       _ACCDHI, 3F317218h SHRB 8
                        LDI       _ACCELO, 3F317218h SHRB 16
                        LDI       _ACCEHI, 3F317218h SHRB 24
                        CALL      SYSTEM.MulFloat_R
                        MOVW      _ACCBLO, _ACCB
                        MOVW      _ACCCLO, _ACCALO
                        POP       _ACCEHI
                        POP       _ACCELO
                        POP       _ACCDHI
                        POP       _ACCDLO
                        JMP       SYSTEM.AddFloat1

SYSTEM.Log10Float:
                        CALL      SYSTEM.LogNFloat
                        MOVW      _ACCDLO, _ACCB
                        MOVW      _ACCELO, _ACCALO
                        LDI       _ACCBLO, 40135D80h AND 0FFh
                        LDI       _ACCBHI, 40135D80h SHRB 8
                        LDI       _ACCCLO, 40135D80h SHRB 16
                        LDI       _ACCCHI, 40135D80h SHRB 24
                        JMP       SYSTEM.DivFloat_R


SYSTEM.SHR8:
                        MOV       _ACCALO, _ACCA
                        MOV       _ACCA, _ACCB
SYSTEM.SHR8_R:
                        TST       _ACCALO
                        BREQ      SYSTEM._L1082
                        CPI       _ACCALO, 08h
                        BRCS      SYSTEM._L1081
                        CLR       _ACCA
                        RET
SYSTEM._L1081:
                        LSR       _ACCA
                        DEC       _ACCALO
                        BRNE      SYSTEM._L1081
SYSTEM._L1082:
                        RET


SYSTEM.DIV8:
                        POP       _ACCAHI
                        POP       _ACCALO
                        MOV       _ACCB, _ACCA
                        POP       _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
SYSTEM.DIV8_R:
                        CLR       _ACCAHI
                        LDI       _ACCALO, 9
SYSTEM._L1083:
                        ROL       _ACCA
                        DEC       _ACCALO
                        BRNE      SYSTEM._L1084
                        MOV       _ACCB, _ACCAHI
                        RET
SYSTEM._L1084:
                        ROL       _ACCAHI
                        SUB       _ACCAHI, _ACCB
                        BRCC      SYSTEM._L1085
                        ADD       _ACCAHI, _ACCB
                        CLC
                        RJMP      SYSTEM._L1083
SYSTEM._L1085:
                        SEC
                        RJMP      SYSTEM._L1083


SYSTEM.MUL16:
                        MOVW      _ACCALO, _ACCB
                        CLR       _ACCDLO
                        BST       Flags, _SIGN
                        BRTC      SYSTEM.MUL16_G
                        MOVW      _ACCELO, _ACCBLO
                        MULS      _ACCAHI, _ACCEHI
                        MOVW      _ACCCLO, _ACCGLO
                        MUL       _ACCALO, _ACCELO
                        MOVW      _ACCB, _ACCGLO
                        MULSU     _ACCAHI, _ACCELO
                        SBC       _ACCCHI, _ACCDLO
                        ADD       _ACCA, _ACCGLO
                        ADC       _ACCCLO, _ACCGHI
                        ADC       _ACCCHI, _ACCDLO
                        MULSU     _ACCEHI, _ACCALO
                        SBC       _ACCCHI, _ACCDLO
                        ADD       _ACCA, _ACCGLO
                        ADC       _ACCCLO, _ACCGHI
                        ADC       _ACCCHI, _ACCDLO
                        RET

SYSTEM.MUL16_G:
                        MUL       _ACCAHI, _ACCBHI
                        MOVW      _ACCCLO, _ACCGLO
                        MUL       _ACCALO, _ACCBLO
                        MOVW      _ACCB, _ACCGLO
                        MUL       _ACCAHI, _ACCBLO
                        ADD       _ACCA, _ACCGLO
                        ADC       _ACCCLO, _ACCGHI
                        ADC       _ACCCHI, _ACCDLO
                        MUL       _ACCALO, _ACCBHI
                        ADD       _ACCA, _ACCGLO
                        ADC       _ACCCLO, _ACCGHI
                        ADC       _ACCCHI, _ACCDLO
                        RET


SYSTEM.DIV16:
                        MOVW      _ACCALO, _ACCB
SYSTEM.DIV16_R:
                        CLR       _ACCDHI
                        BST       Flags, _SIGN
                        BRTC      SYSTEM._L1087
                        MOV       _ACCDHI, _ACCBHI
                        MOV       _ACCDLO, _ACCAHI
                        EOR       _ACCDLO, _ACCBHI
                        CLT
                        SBRS      _ACCDLO, 7
                        BLD       Flags, _SIGN
                        SBRS      _ACCAHI, 7
                        RJMP      SYSTEM._L1089
                        NEG       _ACCALO
                        BRNE      SYSTEM._L1090
                        DEC       _ACCAHI
SYSTEM._L1090:
                        COM       _ACCAHI
SYSTEM._L1089:
                        SBRS      _ACCBHI, 7
                        RJMP      SYSTEM._L1087
                        NEG       _ACCBLO
                        BRNE      SYSTEM._L1091
                        DEC       _ACCBHI
SYSTEM._L1091:
                        COM       _ACCBHI
SYSTEM._L1087:
                        CLR       _ACCCLO
                        SUB       _ACCCHI, _ACCCHI
                        LDI       _ACCA, 17
SYSTEM._L1092:
                        ROL       _ACCBLO
                        ROL       _ACCBHI
                        DEC       _ACCA
                        BRNE      SYSTEM._L1093
                        MOVW      _ACCB, _ACCBLO
                        BST       Flags, _SIGN
                        BRTC      SYSTEM._L1088
                        NEG       _ACCB
                        BRNE      SYSTEM._L1095
                        DEC       _ACCA
SYSTEM._L1095:
                        COM       _ACCA
SYSTEM._L1088:
                        RET
SYSTEM._L1093:
                        ROL       _ACCCLO
                        ROL       _ACCCHI
                        SUB       _ACCCLO, _ACCALO
                        SBC       _ACCCHI, _ACCAHI
                        BRCC      SYSTEM._L1094
                        ADD       _ACCCLO, _ACCALO
                        ADC       _ACCCHI, _ACCAHI
                        CLC
                        RJMP      SYSTEM._L1092
SYSTEM._L1094:
                        SEC
                        RJMP      SYSTEM._L1092


SYSTEM.MUL32:
                        MOVW      _ACCBLO, _ACCB
                        MOVW      _ACCCLO, _ACCALO
                        POP       _ACCA
                        POP       _ACCB
                        POP       _ACCEHI
                        POP       _ACCELO
                        POP       _ACCDHI
                        POP       _ACCDLO
                        PUSH      _ACCB
                        PUSH      _ACCA
                        RJMP      SYSTEM._L1096
SYSTEM.MUL32_R:
                        MOVW      _ACCBLO, _ACCB
                        MOVW      _ACCCLO, _ACCALO
SYSTEM._L1096:
                        BST       Flags, _SIGN
                        BRTC      SYSTEM._L1097
                        MOV       _ACCFLO, _ACCCHI
                        EOR       _ACCFLO, _ACCEHI
                        CLT
                        SBRS      _ACCFLO, 7
                        BLD       Flags, _SIGN
                        SBRS      _ACCCHI, 7
                        RJMP      SYSTEM._L1099
                        COM       _ACCBLO
                        COM       _ACCBHI
                        COM       _ACCCLO
                        COM       _ACCCHI
                        SUBI      _ACCBLO, 0FFh
                        SBCI      _ACCBHI, 0FFh
                        SBCI      _ACCCLO, 0FFh
                        SBCI      _ACCCHI, 0FFh
SYSTEM._L1099:
                        SBRS      _ACCEHI, 7
                        RJMP      SYSTEM._L1097
                        COM       _ACCDLO
                        COM       _ACCDHI
                        COM       _ACCELO
                        COM       _ACCEHI
                        SUBI      _ACCDLO, 0FFh
                        SBCI      _ACCDHI, 0FFh
                        SBCI      _ACCELO, 0FFh
                        SBCI      _ACCEHI, 0FFh
SYSTEM._L1097:
                        CLR       _ACCFHI
                        CLR       _ACCFLO
                        CLR       _ACCGHI
                        CLR       _ACCGLO
                        LDI       _ACCA, 32
                        LSR       _ACCEHI
                        ROR       _ACCELO
                        ROR       _ACCDHI
                        ROR       _ACCDLO
SYSTEM._L1101:
                        BRCC      SYSTEM._L1100
                        ADD       _ACCFLO, _ACCBLO
                        ADC       _ACCFHI, _ACCBHI
                        ADC       _ACCGLO, _ACCCLO
                        ADC       _ACCGHI, _ACCCHI
SYSTEM._L1100:
                        ROR       _ACCGHI
                        ROR       _ACCGLO
                        ROR       _ACCFHI
                        ROR       _ACCFLO
                        ROR       _ACCEHI
                        ROR       _ACCELO
                        ROR       _ACCDHI
                        ROR       _ACCDLO
                        DEC       _ACCA
                        BRNE      SYSTEM._L1101
                        MOVW      _ACCB, _ACCDLO
                        MOVW      _ACCALO, _ACCELO
                        BST       Flags, _SIGN
                        BRTC      SYSTEM._L1098
                        SUBI      _ACCB, 01h
                        SBCI      _ACCA, 00h
                        SBCI      _ACCALO, 00h
                        SBCI      _ACCAHI, 00h
                        COM       _ACCALO
                        COM       _ACCAHI
                        COM       _ACCA
                        COM       _ACCB
SYSTEM._L1098:
                        RET



SYSTEM.DIV32:
                        MOVW      _ACCBLO, _ACCB
                        MOVW      _ACCCLO, _ACCALO
                        POP       _ACCA
                        POP       _ACCB
                        POP       _ACCEHI
                        POP       _ACCELO
                        POP       _ACCDHI
                        POP       _ACCDLO
                        PUSH      _ACCB
                        PUSH      _ACCA
SYSTEM.DIV32_R:
                        CLR       _ACCA
                        BST       Flags, _SIGN
                        BRTC      SYSTEM.DIV32_U
                        MOV       _ACCA, _ACCEHI
                        MOV       _ACCFLO, _ACCCHI
                        EOR       _ACCFLO, _ACCEHI
                        CLT
                        SBRS      _ACCFLO, 7
                        BLD       Flags, _SIGN
                        SBRS      _ACCCHI, 7
                        RJMP      SYSTEM._L1102
                        COM       _ACCBLO
                        COM       _ACCBHI
                        COM       _ACCCLO
                        COM       _ACCCHI
                        SUBI      _ACCBLO, 0FFh
                        SBCI      _ACCBHI, 0FFh
                        SBCI      _ACCCLO, 0FFh
                        SBCI      _ACCCHI, 0FFh
SYSTEM._L1102:
                        SBRS      _ACCEHI, 7
                        RJMP      SYSTEM.DIV32_U
                        COM       _ACCDLO
                        COM       _ACCDHI
                        COM       _ACCELO
                        COM       _ACCEHI
                        SUBI      _ACCDLO, 0FFh
                        SBCI      _ACCDHI, 0FFh
                        SBCI      _ACCELO, 0FFh
                        SBCI      _ACCEHI, 0FFh
SYSTEM.DIV32_U:
                        PUSH      _ACCA
                        CLR       _ACCFLO
                        CLR       _ACCFHI
                        CLR       _ACCGLO
                        CLR       _ACCGHI
                        LDI       _ACCA, 33
SYSTEM._L1104:
                        ROL       _ACCDLO
                        ROL       _ACCDHI
                        ROL       _ACCELO
                        ROL       _ACCEHI
                        DEC       _ACCA
                        BRNE      SYSTEM._L1103
                        MOVW      _ACCB, _ACCDLO
                        MOVW      _ACCALO, _ACCELO
                        BST       Flags, _SIGN
                        BRTC      SYSTEM._L1106
                        SUBI      _ACCB, 01h
                        SBCI      _ACCA, 00h
                        SBCI      _ACCALO, 00h
                        SBCI      _ACCAHI, 00h
                        COM       _ACCALO
                        COM       _ACCAHI
                        COM       _ACCA
                        COM       _ACCB
SYSTEM._L1106:
                        POP       _ACCDHI
                        RET
SYSTEM._L1103:
                        ROL       _ACCFLO
                        ROL       _ACCFHI
                        ROL       _ACCGLO
                        ROL       _ACCGHI
                        SUB       _ACCFLO, _ACCBLO
                        SBC       _ACCFHI, _ACCBHI
                        SBC       _ACCGLO, _ACCCLO
                        SBC       _ACCGHI, _ACCCHI
                        BRCC      SYSTEM._L1105
                        ADD       _ACCFLO, _ACCBLO
                        ADC       _ACCFHI, _ACCBHI
                        ADC       _ACCGLO, _ACCCLO
                        ADC       _ACCGHI, _ACCCHI
                        CLC
                        RJMP      SYSTEM._L1104
SYSTEM._L1105:
                        SEC
                        RJMP      SYSTEM._L1104


SYSTEM.SHL32:
                        TST       _ACCCLO
                        BREQ      SYSTEM._L1108
                        CPI       _ACCCLO, 20h
                        BRCS      SYSTEM._L1107
                        CLR       _ACCA
                        CLR       _ACCB
                        CLR       _ACCALO
                        CLR       _ACCAHI
                        RET
SYSTEM._L1107:
                        LSL       _ACCB
                        ROL       _ACCA
                        ROL       _ACCALO
                        ROL       _ACCAHI
                        DEC       _ACCCLO
                        BRNE      SYSTEM._L1107
SYSTEM._L1108:
                        RET

SYSTEM.GETADC:
                        CLI
                        CPI       _ACCA, 003h
                        BRNE      SYSTEM._L1109
                        LDS       _ACCB, _ADCBUFF
                        LDS       _ACCA, _ADCBUFF +1
                        RJMP      SYSTEM._L1110
SYSTEM._L1109:
                        LDS       _ACCB, _ADCBUFF +2
                        LDS       _ACCA, _ADCBUFF +3
SYSTEM._L1110:
                        SBRC      Flags, IntFlag
                        SEI
                        RET

SYSTEM.SETADCFIXED:
                        CLI
                        LDS       _ACCB, _ADCBUFF +4
                        LDD       _ACCA, Y+001h
                        TST       _ACCA
                        BRNE      SYSTEM._L1111
                        ANDI      _ACCB, 0FEh
                        RJMP      SYSTEM._L1112
                        ORI       _ACCB, 01h
                        LDD       _ACCA, Y+000h
                        CPI       _ACCA, 003h
                        BREQ      SYSTEM._L1111
                        LDI       _ACCA, 004h
SYSTEM._L1111:
                        DEC       _ACCA
                        IN        _ACCCHI, admux
                        CBR       _ACCCHI, 7
                        OR        _ACCA, _ACCCHI
                        OUT       admux, _ACCA
SYSTEM._L1112:
                        STS       _ADCBUFF +4, _ACCB
                        SBRC      Flags, IntFlag
                        SEI
                        RET

SYSTEM.GetBitCount8:
                        LDI       _ACCCLO, 8
                        LDI       _ACCCHI, 0
SYSTEM._L1113:
                        LSL       _ACCA
                        BRCC      SYSTEM._L1114
                        INC       _ACCCHI
SYSTEM._L1114:
                        DEC       _ACCCLO
                        BRNE      SYSTEM._L1113
                        MOV       _ACCA, _ACCCHI
                        RET

SYSTEM.GetBitCount16:
                        LDI       _ACCCLO, 16
                        LDI       _ACCCHI, 0
SYSTEM._L1115:
                        LSL       _ACCB
                        ROL       _ACCA
                        BRCC      SYSTEM._L1116
                        INC       _ACCCHI
SYSTEM._L1116:
                        DEC       _ACCCLO
                        BRNE      SYSTEM._L1115
                        MOV       _ACCA, _ACCCHI
                        RET

SYSTEM.GetBitCount32:
                        LDI       _ACCCLO, 32
                        LDI       _ACCCHI, 0
SYSTEM._L1117:
                        LSL       _ACCB
                        ROL       _ACCA
                        ROL       _ACCALO
                        ROL       _ACCAHI
                        BRCC      SYSTEM._L1118
                        INC       _ACCCHI
SYSTEM._L1118:
                        DEC       _ACCCLO
                        BRNE      SYSTEM._L1117
                        MOV       _ACCA, _ACCCHI
                        RET

SYSTEM.GetBitCount64:
                        LDI       _ACCCLO, 64
                        LDI       _ACCCHI, 0
SYSTEM._L1119:
                        LSL       _ACCB
                        ROL       _ACCA
                        ROL       _ACCALO
                        ROL       _ACCAHI
                        ROL       _ACCDLO
                        ROL       _ACCDHI
                        ROL       _ACCELO
                        ROL       _ACCEHI
                        BRCC      SYSTEM._L1120
                        INC       _ACCCHI
SYSTEM._L1120:
                        DEC       _ACCCLO
                        BRNE      SYSTEM._L1119
                        MOV       _ACCA, _ACCCHI
                        RET

SYSTEM.DefIntErr:
                        RETI


                        .ROMCONST $

SYSTEM.DECDIG:
                        .Byte     040h
                        .Byte     042h
                        .Byte     00Fh
                        .Byte     000h
                        .Byte     0A0h
                        .Byte     086h
                        .Byte     001h
                        .Byte     000h
SYSTEM.IntDivTab:
                        .Byte     010h
                        .Byte     027h
                        .Byte     000h
                        .Byte     000h
                        .Byte     0E8h
                        .Byte     003h
                        .Byte     000h
                        .Byte     000h
                        .Byte     064h
                        .Byte     000h
                        .Byte     000h
                        .Byte     000h
                        .Byte     00Ah
                        .Byte     000h
                        .Byte     000h
                        .Byte     000h
SYSTEM.StrDivTabX:
                        .Byte     001h
                        .Byte     000h
                        .Byte     000h
                        .Byte     000h

                        ; ============ String-constant tables ============
                        .SYM      DDS.Vers1Str
DDS.Vers1Str:
                        .BYTE     28
                        .ASCII    "3.71 [DDS by CM/c't 03/2007]"

                        .SYM      DDS.Vers3Str
DDS.Vers3Str:
                        .BYTE     8
                        .ASCII    "DDS 3.71"

                        .SYM      DDS.EEnotProgrammedStr
DDS.EEnotProgrammedStr:
                        .BYTE     14
                        .ASCII    "EEPROM EMPTY! "

                        .SYM      DDS.AdrStr
DDS.AdrStr:
                        .BYTE     4
                        .ASCII    "Adr "

                        .SYM      DDS.FrequStr
DDS.FrequStr:
                        .BYTE     8
                        .ASCII    "Frequ Hz"

                        .SYM      DDS.LevelStr
DDS.LevelStr:
                        .BYTE     6
                        .ASCII    "Level "

                        .SYM      DDS.PeakStr
DDS.PeakStr:
                        .BYTE     8
                        .ASCII    "PeakL mV"

                        .SYM      DDS.OffsetStr
DDS.OffsetStr:
                        .BYTE     8
                        .ASCII    "Offset V"

                        .SYM      DDS.WaveStr
DDS.WaveStr:
                        .BYTE     8
                        .ASCII    "Function"

                        .SYM      DDS.BurstStr
DDS.BurstStr:
                        .BYTE     8
                        .ASCII    "Burst ms"

$St_String13:
                        .BYTE     8
                        .ASCII    "In    1V"

$St_String14:
                        .BYTE     8
                        .ASCII    "In 100mV"

$St_String15:
                        .BYTE     8
                        .ASCII    "In   10V"

$St_String16:
                        .BYTE     8
                        .ASCII    "In  100V"

$St_String17:
                        .BYTE     1
                        .ASCII    "+"

$St_String18:
                        .BYTE     7
                        .ASCII    "OVRLOAD"

$St_String19:
                        .BYTE     4
                        .ASCII    "    "

$St_String20:
                        .BYTE     0


                        ; ============ array-constant tables ============
                        .SYM      DDS.fhz
DDS.fhz:
                        .WORD     09000h
                        .WORD     003D0h
                        .WORD     0A800h
                        .WORD     00061h
                        .WORD     0C400h
                        .WORD     00009h
                        .WORD     0FA00h
                        .WORD     00000h
                        .WORD     01900h
                        .WORD     00000h
                        .WORD     00280h
                        .WORD     00000h
                        .WORD     00040h
                        .WORD     00000h
                        .WORD     00006h
                        .WORD     00000h

                        .SYM      DDS.ErrStrArr
DDS.ErrStrArr:
                        .BYTE     4
                        .ASCII    "[OK]"
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h

                        .BYTE     8
                        .ASCII    "[SRQUSR]"
                        .BYTE     00h

                        .BYTE     6
                        .ASCII    "[BUSY]"
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h

                        .BYTE     8
                        .ASCII    "[OVERLD]"
                        .BYTE     00h

                        .BYTE     8
                        .ASCII    "[CMDERR]"
                        .BYTE     00h

                        .BYTE     8
                        .ASCII    "[PARERR]"
                        .BYTE     00h

                        .BYTE     8
                        .ASCII    "[LOCKED]"
                        .BYTE     00h

                        .BYTE     8
                        .ASCII    "[CHKSUM]"
                        .BYTE     00h


                        .SYM      DDS.WaveSelStrArr
DDS.WaveSelStrArr:
                        .BYTE     3
                        .ASCII    "Off"
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h

                        .BYTE     3
                        .ASCII    "Sin"
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h

                        .BYTE     3
                        .ASCII    "Tri"
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h

                        .BYTE     3
                        .ASCII    "Squ"
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h

                        .BYTE     3
                        .ASCII    "Lgc"
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h

                        .BYTE     3
                        .ASCII    "Ext"
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h


                        .SYM      DDS.CmdStrArr
DDS.CmdStrArr:
                        .BYTE     3
                        .ASCII    "STR"

                        .BYTE     3
                        .ASCII    "IDN"

                        .BYTE     3
                        .ASCII    "TRG"

                        .BYTE     3
                        .ASCII    "VAL"

                        .BYTE     3
                        .ASCII    "FRQ"

                        .BYTE     3
                        .ASCII    "LVL"

                        .BYTE     3
                        .ASCII    "LVP"

                        .BYTE     3
                        .ASCII    "DBU"

                        .BYTE     3
                        .ASCII    "WAV"

                        .BYTE     3
                        .ASCII    "BST"

                        .BYTE     3
                        .ASCII    "AUX"

                        .BYTE     3
                        .ASCII    "INL"

                        .BYTE     3
                        .ASCII    "RNG"

                        .BYTE     3
                        .ASCII    "DCO"

                        .BYTE     3
                        .ASCII    "DSP"

                        .BYTE     3
                        .ASCII    "ALL"

                        .BYTE     3
                        .ASCII    "OPT"

                        .BYTE     3
                        .ASCII    "SCL"

                        .BYTE     3
                        .ASCII    "WEN"

                        .BYTE     3
                        .ASCII    "ERC"

                        .BYTE     3
                        .ASCII    "SBD"

                        .BYTE     3
                        .ASCII    "NOP"


                        .SYM      DDS.Cmd2SubChArr
DDS.Cmd2SubChArr:
                        .BYTE     0FFh
                        .BYTE     0FEh
                        .BYTE     0F9h
                        .BYTE     000h
                        .BYTE     000h
                        .BYTE     001h
                        .BYTE     002h
                        .BYTE     003h
                        .BYTE     004h
                        .BYTE     005h
                        .BYTE     009h
                        .BYTE     00Ah
                        .BYTE     013h
                        .BYTE     014h
                        .BYTE     050h
                        .BYTE     063h
                        .BYTE     096h
                        .BYTE     0C8h
                        .BYTE     0FAh
                        .BYTE     0FBh
                        .BYTE     0FCh
                        .BYTE     000h

                        .SYM      DDS.InpGains
DDS.InpGains:
                        .WORD     0CCCDh
                        .WORD     03DCCh
                        .WORD     00000h
                        .WORD     03F80h
                        .WORD     00000h
                        .WORD     04120h
                        .WORD     00000h
                        .WORD     042C8h

                        .SYM      DDS.IncrAccArray
DDS.IncrAccArray:
                        .WORD     00000h
                        .WORD     00001h
                        .WORD     00005h
                        .WORD     0000Ah
                        .WORD     00019h
                        .WORD     00032h
                        .WORD     00064h
                        .WORD     000FAh
                        .WORD     001F4h
                        .WORD     003E8h
                        .WORD     009C4h
                        .WORD     01388h
                        .WORD     02710h
                        .WORD     061A8h
                        .WORD     061A8h
                        .WORD     061A8h


                        ; ============ Fixed addr String-constant tables ============

                        ; ============ fixed addr array-constant tables ============

                        ; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                        ; Reset and Interrupt vectors
                        ; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


                        .ENDCODE
SYSTEM.ENDCODE:
                        .ORG       0, VECTTAB
                        .VECTTAB
SYSTEM.VectTab:
                        JMP       SYSTEM.RESET
                        JMP       SYSTEM.DefIntErr
                        JMP       SYSTEM.DefIntErr
                        JMP       SYSTEM.DefIntErr
                        JMP       SYSTEM.DefIntErr
                        JMP       SYSTEM.DefIntErr
                        JMP       SYSTEM.DefIntErr
                        JMP       SYSTEM.$INTERRUPT_TIMER1COMPA
                        JMP       SYSTEM.DefIntErr
                        JMP       SYSTEM.DefIntErr
                        JMP       SYSTEM.DefIntErr
                        JMP       SYSTEM.$INTERRUPT_TIMER0
                        JMP       SYSTEM.DefIntErr
                        JMP       SYSTEM.$INTERRUPT_RXRDY
                        JMP       SYSTEM.$INTERRUPT_TXEMPTY
                        JMP       SYSTEM.DefIntErr
                        JMP       SYSTEM.DefIntErr
                        JMP       SYSTEM.DefIntErr
                        JMP       SYSTEM.DefIntErr
                        JMP       SYSTEM.DefIntErr
                        JMP       SYSTEM.DefIntErr

                        .VECTTABE
SYSTEM.ENDPROG:

                        .END

                        ; ============ End of Program ============


                        ; System uses registers
                        ; from bottom     = 00000h
                        ; upto            = 00006h
                        ; and
                        ; from            = 00010h
                        ; upto            = 0001Fh
                        ;
                        ; Stackframe at   = ...003EEh


                        ; ===== Current top of User Vars in Data is 00009h =====

                        ; ===== Current top of User Vars in IData is 004EEh =====

                        ; ===== Current top of User Vars in EEprom is 000BFh =====


                        ; ===== Imported Library Routines =====

                        ; Shift  right byte SHR8
                        ; Divide       byte DIV8
                        ; Multiply     word MUL16
                        ; Divide       word DIV16
                        ; Higher float
                        ; LongWord and LongInt types
                        ; Multiply     long MUL32
                        ; Divide       long DIV32
                        ; Shift  left  long SHL32
                        ; Convert to hex string HexStr
                        ; Convert byte to string
                        ; Convert int to string
                        ; Convert long to string
                        ; Convert string to int
                        ; String compare
                        ; Copy partial String
                        ; Floating point type
                        ; float multiply
                        ; float divide
                        ; float add
                        ; float subtract
                        ; float square
                        ; float power of x
                        ; float exponent of x
                        ; float log naturalis
                        ; float log decimal
                        ; float round
                        ; float integer
                        ; float float to int
                        ; float int to float
                        ; float float to string
                        ; float string to float
                        ; EEprom read
                        ; EEprom write

                        ; Pascal Statements : 863
                        ; Assembler Lines   : 31600
                        ; Optimizer removed : 530 lines = 1060Bytes

                        ; >> real SysTick (exact): 9.984 msec <<

;  Linker removed the following functions and procedures
;
;  Module/Unit             Function/Procedure
;  ------------------------------------------
;
