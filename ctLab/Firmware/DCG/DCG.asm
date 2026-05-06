
                        .FILE     H:\PROJAVR\ADA-C DCG_MCB\DCG.pas

                        ; Compiled by E-LAB AVRco PASCAL Compiler Rev 4.89.00
                        ; Version     : Profi
                        ;
                        ; Licenced to : Redaktion CT
                        ;
                        ; (c)E-LAB Computers, Grombacherstr. 27  e-mail info@e-lab.de
                        ; D-74906 Bad Rappenau  Tel. 07268/9124-0 Fax. 07268/9124-24
                        ; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                        ; Source File : DCG.pas
                        ; Compiled    : 16. Mai 2010  20:59:01
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
COMPILERREV             .EQU    1EEh            ; const 
COMPILERBUILD_Y         .EQU    008h            ; const 
COMPILERBUILD_M         .EQU    00Ah            ; const 
COMPILERBUILD_D         .EQU    013h            ; const 
COMPILEYEAR             .EQU    00Ah            ; const 
COMPILEMONTH            .EQU    005h            ; const 
COMPILEDAY              .EQU    010h            ; const 
COMPILEHOUR             .EQU    014h            ; const 
COMPILEMINUTE           .EQU    03Bh            ; const 
PROJECTBUILD            .EQU    0AAh            ; const 
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
$_SAVERET               .EQU    004h            ; var Data   byte
$_SAVERET1              .EQU    005h            ; var Data   byte
FLAGS                   .EQU    006h            ; var Data   byte
FLAGS2                  .EQU    007h            ; var Data   byte
_SYSTFLAGS              .EQU    008h            ; var Data   byte
SYSTICK                 .EQU    001h            ; const 
PROCCLOCK               .EQU    0F42400h        ; const 
DECIMALSEP              .EQU    02Eh            ; const 
CPU_ID                  .EQU    1E9502h         ; const 
ROMconstPage            .EQU    0FFFFFFFFFFFFFFFFh          ; const 
STACKSIZE               .EQU    080h            ; const 
FRAMESIZE               .EQU    100h            ; const 
SERPORT                 .EQU    9600h           ; const 
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
UBRR0L                  .EQU    029h            ; var pData  byte
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
TickTimerPrsc           .EQU    267h            ; var iData  byte
_TTimerReloadVal        .EQU    268h            ; var iData  word
_INCRSTATE4             .EQU    26Ah            ; var iData  byte
_INCRCOUNT4_0           .EQU    26Bh            ; var iData  longint
_INCRCOUNT4_D0          .EQU    26Fh            ; var iData  longint
_TWI_TO                 .EQU    273h            ; var iData  byte
TWI_DevLock             .EQU    274h            ; var iData  DeviceLock
EEPROM                  .EQU    000h            ; var EEprom array



                        .RESET     000000h
                        .ORG       000000h, CODE_START
                        .STARTCODE 000054h

                        .UNIT     DCG

                        .XDATASTART -1


                        ; ============ user definitions module: DCG ============

DCG.DDRBinit            .EQU    0BFh            ; const byte     191
DCG.PortBinit           .EQU    0D3h            ; const byte     211
DCG.DDRCinit            .EQU    0FCh            ; const byte     252
DCG.PortCinit           .EQU    00Fh            ; const byte     15
DCG.DDRDinit            .EQU    00Ch            ; const byte     12
DCG.PortDinit           .EQU    0FCh            ; const byte     252
DCG.BtnInPortReg        .EQU    030h            ; const byte     48
DCG.LEDOutPort          .EQU    032h            ; const byte     50
DCG.ControlBitPort      .EQU    038h            ; const byte     56
DCG.ControlBitPin       .EQU    036h            ; const byte     54
DCG.MPXPort             .EQU    035h            ; const byte     53
DCG.b_SCLK              .EQU    000h            ; const byte     0
DCG.b_SDATAOUT          .EQU    001h            ; const byte     1
DCG.b_STRDAC            .EQU    004h            ; const byte     4
DCG.b_SDATAIN1          .EQU    006h            ; const byte     6
DCG.b_STRAD16           .EQU    007h            ; const byte     7
;Vers1Str                .EQU    '2.92 [DCG by CM/'; const String
;Vers3Str                .EQU    'DCG 2.92'; const String
;ErrStrArr               .EQU    ; const Array
;FaultStrArr             .EQU    ; const Array
;MenuStrArr              .EQU    ; const Array
;AdrStr                  .EQU    'Adr '; const String
DCG.ErrSubCh            .EQU    0FFh            ; const byte     255
;CmdStrArr               .EQU    ; const Array
;Cmd2SubChArr            .EQU    ; const Array
DCG.DC2mA               .EQU    000h            ; const byte     0
DCG.DC20mA              .EQU    001h            ; const byte     1
DCG.DC200mA             .EQU    002h            ; const byte     2
DCG.DC2A                .EQU    003h            ; const byte     3
DCG.Ulow                .EQU    000h            ; const byte     0
DCG.Uhigh               .EQU    001h            ; const byte     1
DCG.high                .EQU    0FFh            ; const boolean  true
DCG.low                 .EQU    000h            ; const boolean  false
;IncrAccArray            .EQU    ; const Array
DCG.dummy               .EQU    00000h          ; var EEprom longint
                        .SYM      dummy, 00000h, 04005h, 3
DCG.DACUoffsets         .EQU    00004h          ; var EEprom array
                        .SYM      DACUoffsets, 00004h, 04034h, 3
DCG.DACUscales          .EQU    00008h          ; var EEprom array
                        .SYM      DACUscales, 00008h, 04036h, 3
DCG.DACIoffsets         .EQU    00010h          ; var EEprom array
                        .SYM      DACIoffsets, 00010h, 04034h, 3
DCG.DACIscales          .EQU    00018h          ; var EEprom array
                        .SYM      DACIscales, 00018h, 04036h, 3
DCG.ADCUoffsets         .EQU    00028h          ; var EEprom array
                        .SYM      ADCUoffsets, 00028h, 04034h, 3
DCG.ADCUscales          .EQU    0002Ch          ; var EEprom array
                        .SYM      ADCUscales, 0002Ch, 04036h, 3
DCG.ADCIoffsets         .EQU    00034h          ; var EEprom array
                        .SYM      ADCIoffsets, 00034h, 04034h, 3
DCG.ADCIscales          .EQU    0003Ch          ; var EEprom array
                        .SYM      ADCIscales, 0003Ch, 04036h, 3
DCG.OptionArray         .EQU    0004Ch          ; var EEprom array
                        .SYM      OptionArray, 0004Ch, 04036h, 3
DCG.InitIncRast         .EQU    0000000B0h      ; var EEprom Float
                        .SYM      InitIncRast, 000B0h, 04006h, 3
DCG.EESerBaudReg        .EQU    000B4h          ; var EEprom byte
                        .SYM      EESerBaudReg, 000B4h, 0400Dh, 3
DCG.TrackChSave         .EQU    000B5h          ; var EEprom byte
                        .SYM      TrackChSave, 000B5h, 0400Dh, 3
DCG.EEinitialised       .EQU    000B6h          ; var EEprom word
                        .SYM      EEinitialised, 000B6h, 0400Eh, 3
                        .SYM      InitVolt, 0004Ch, 04006h, 3
DCG.InitVolt            .EQU    04Ch            ; var EEprom Float
                        .SYM      InitAmp, 00050h, 04006h, 3
DCG.InitAmp             .EQU    050h            ; var EEprom Float
                        .SYM      InitGainPre, 00054h, 04006h, 3
DCG.InitGainPre         .EQU    054h            ; var EEprom Float
                        .SYM      InitGainOut, 00058h, 04006h, 3
DCG.InitGainOut         .EQU    058h            ; var EEprom Float
                        .SYM      InitGainI, 0005Ch, 04006h, 3
DCG.InitGainI           .EQU    05Ch            ; var EEprom Float
                        .SYM      Uref, 00060h, 04006h, 3
DCG.Uref                .EQU    060h            ; var EEprom Float
                        .SYM      Umax, 00064h, 04006h, 3
DCG.Umax                .EQU    064h            ; var EEprom Float
                        .SYM      RSenseArray, 00068h, 04036h, 3
DCG.RSenseArray         .EQU    068h            ; var EEprom array
                        .SYM      ImaxArray, 00078h, 04036h, 3
DCG.ImaxArray           .EQU    078h            ; var EEprom array
                        .SYM      Imax, 00084h, 04006h, 3
DCG.Imax                .EQU    084h            ; var EEprom Float
                        .SYM      ADCUfacs, 00088h, 04036h, 3
DCG.ADCUfacs            .EQU    088h            ; var EEprom array
                        .SYM      InitOptions, 00090h, 04006h, 3
DCG.InitOptions         .EQU    090h            ; var EEprom Float
                        .SYM      InitSwitchU, 00094h, 04006h, 3
DCG.InitSwitchU         .EQU    094h            ; var EEprom Float
                        .SYM      InitHystLow, 00098h, 04006h, 3
DCG.InitHystLow         .EQU    098h            ; var EEprom Float
                        .SYM      InitHystHigh, 0009Ch, 04006h, 3
DCG.InitHystHigh        .EQU    09Ch            ; var EEprom Float
                        .SYM      InitFanOnTemp, 000A0h, 04006h, 3
DCG.InitFanOnTemp       .EQU    0A0h            ; var EEprom Float
                        .SYM      InitRipplePercent, 000A4h, 04006h, 3
DCG.InitRipplePercent   .EQU    0A4h            ; var EEprom Float
                        .SYM      InitTonTime, 000A8h, 04006h, 3
DCG.InitTonTime         .EQU    0A8h            ; var EEprom Float
                        .SYM      InitToffTime, 000ACh, 04006h, 3
DCG.InitToffTime        .EQU    0ACh            ; var EEprom Float
                        .SYM      i, 00009h, 0000Dh, 3
DCG.i                   .EQU    009h            ; var Data   byte
                        .SYM      k, 0000Ah, 0000Dh, 3
DCG.k                   .EQU    00Ah            ; var Data   byte
                        .SYM      m, 0000Bh, 0000Dh, 3
DCG.m                   .EQU    00Bh            ; var Data   byte
                        .SYM      SlaveCh, 00275h, 0000Dh, 3
DCG.SlaveCh             .EQU    275h            ; var iData  byte
                        .SYM      ButtonTemp, 00276h, 0000Dh, 3
DCG.ButtonTemp          .EQU    276h            ; var iData  byte
                        .SYM      RangeTemp, 00277h, 0000Dh, 3
DCG.RangeTemp           .EQU    277h            ; var iData  byte
                        .SYM      PWonTime, 00278h, 00004h, 3
DCG.PWonTime            .EQU    278h            ; var iData  integer
                        .SYM      PWoffTime, 0027Ah, 00004h, 3
DCG.PWoffTime           .EQU    27Ah            ; var iData  integer
                        .SYM      PWcounter, 0027Ch, 00004h, 3
DCG.PWcounter           .EQU    27Ch            ; var iData  integer
                        .SYM      PWonOff, 0027Eh, 00003h, 3
DCG.PWonOff             .EQU    27Eh            ; var iData  boolean
                        .SYM      ADCUoffset, 0027Fh, 00004h, 3
DCG.ADCUoffset          .EQU    27Fh            ; var iData  integer
                        .SYM      ADCIoffset, 00281h, 00004h, 3
DCG.ADCIoffset          .EQU    281h            ; var iData  integer
                        .SYM      DACrawUon, 00283h, 0000Eh, 3
DCG.DACrawUon           .EQU    283h            ; var iData  word
                        .SYM      DACrawUoff, 00285h, 0000Eh, 3
DCG.DACrawUoff          .EQU    285h            ; var iData  word
                        .SYM      DACrawI, 00287h, 0000Eh, 3
DCG.DACrawI             .EQU    287h            ; var iData  word
                        .SYM      ADCrawU, 00289h, 0000Eh, 3
DCG.ADCrawU             .EQU    289h            ; var iData  word
                        .SYM      ADCrawI, 0028Bh, 0000Eh, 3
DCG.ADCrawI             .EQU    28Bh            ; var iData  word
                        .SYM      AD16long, 0028Dh, 00005h, 3
DCG.AD16long            .EQU    28Dh            ; var iData  longint
                        .SYM      Temperature, 00291h, 00006h, 3
DCG.Temperature         .EQU    291h            ; var iData  Float
                        .SYM      Switchpoint, 00295h, 00006h, 3
DCG.Switchpoint         .EQU    295h            ; var iData  Float
                        .SYM      TemperatureTimer, 00299h, 0000Dh, 3
DCG.TemperatureTimer    .EQU    299h            ; var iData  byte
                        .SYM      DACtemp, 0029Ah, 0000Eh, 3
DCG.DACtemp             .EQU    29Ah            ; var iData  word
                        .SYM      ADCtemp, 0029Ch, 0000Eh, 3
DCG.ADCtemp             .EQU    29Ch            ; var iData  word
                        .SYM      LevelByteHi, 0029Eh, 0000Dh, 3
DCG.LevelByteHi         .EQU    29Eh            ; var iData  byte
                        .SYM      LevelByteLo, 0029Fh, 0000Dh, 3
DCG.LevelByteLo         .EQU    29Fh            ; var iData  byte
                        .SYM      I2CslaveAdr, 002A0h, 0000Dh, 3
DCG.I2CslaveAdr         .EQU    2A0h            ; var iData  byte
                        .SYM      RipplePercent, 002A1h, 00004h, 3
DCG.RipplePercent       .EQU    2A1h            ; var iData  integer
                        .SYM      DCVolt, 002A3h, 00006h, 3
DCG.DCVolt              .EQU    2A3h            ; var iData  Float
                        .SYM      DCVoltMod, 002A7h, 00006h, 3
DCG.DCVoltMod           .EQU    2A7h            ; var iData  Float
                        .SYM      RippleVoltage, 002ABh, 00006h, 3
DCG.RippleVoltage       .EQU    2ABh            ; var iData  Float
                        .SYM      DCWatt, 002AFh, 00006h, 3
DCG.DCWatt              .EQU    2AFh            ; var iData  Float
                        .SYM      DCVoltIntegrated, 002B3h, 00006h, 3
DCG.DCVoltIntegrated    .EQU    2B3h            ; var iData  Float
                        .SYM      DCAmpIntegrated, 002B7h, 00006h, 3
DCG.DCAmpIntegrated     .EQU    2B7h            ; var iData  Float
                        .SYM      RelaisVoltLow, 002BBh, 00006h, 3
DCG.RelaisVoltLow       .EQU    2BBh            ; var iData  Float
                        .SYM      RelaisVoltHigh, 002BFh, 00006h, 3
DCG.RelaisVoltHigh      .EQU    2BFh            ; var iData  Float
                        .SYM      DCAmp, 002C3h, 00006h, 3
DCG.DCAmp               .EQU    2C3h            ; var iData  Float
                        .SYM      DCAmpMod, 002C7h, 00006h, 3
DCG.DCAmpMod            .EQU    2C7h            ; var iData  Float
                        .SYM      DACLSBUarray, 002CBh, 00036h, 3
DCG.DACLSBUarray        .EQU    2CBh            ; var iData  array
                        .SYM      DACLSBIarray, 002D3h, 00036h, 3
DCG.DACLSBIarray        .EQU    2D3h            ; var iData  array
                        .SYM      ADCLSBUarray, 002E3h, 00036h, 3
DCG.ADCLSBUarray        .EQU    2E3h            ; var iData  array
                        .SYM      ADCLSBIarray, 002EBh, 00036h, 3
DCG.ADCLSBIarray        .EQU    2EBh            ; var iData  array
                        .SYM      Options, 002FBh, 0000Dh, 3
DCG.Options             .EQU    2FBh            ; var iData  byte
                        .SYM      DACmax, 002FCh, 00005h, 3
DCG.DACmax              .EQU    2FCh            ; var iData  longint
                        .SYM      CmdWhich, 00300h, 0000Ah, 3
DCG.CmdWhich            .EQU    300h            ; var iData  enum
                        .SYM      SubCh, 00301h, 0000Dh, 3
DCG.SubCh               .EQU    301h            ; var iData  byte
                        .SYM      CurrentCh, 00302h, 0000Dh, 3
DCG.CurrentCh           .EQU    302h            ; var iData  byte
                        .SYM      OmniFlag, 00303h, 00003h, 3
DCG.OmniFlag            .EQU    303h            ; var iData  boolean
                        .SYM      verbose, 00304h, 00003h, 3
DCG.verbose             .EQU    304h            ; var iData  boolean
                        .SYM      Param, 00305h, 00006h, 3
DCG.Param               .EQU    305h            ; var iData  Float
                        .SYM      ParamInt, 00309h, 00004h, 3
DCG.ParamInt            .EQU    309h            ; var iData  integer
                        .SYM      ParamByte, 0030Bh, 0000Dh, 3
DCG.ParamByte           .EQU    30Bh            ; var iData  byte
DCG.SerInpStr           .EQU    30Ch            ; var iData  string
                        .SYM      SerInpStr, 0030Ch, 0303Ch, 3
                        .SYM      SerInpPtr, 0034Ch, 0000Dh, 3
DCG.SerInpPtr           .EQU    34Ch            ; var iData  byte
                        .SYM      Prefix, 0034Dh, 0000Ch, 3
DCG.Prefix              .EQU    34Dh            ; var iData  char
                        .SYM      UIToggle, 0034Eh, 00003h, 3
DCG.UIToggle            .EQU    34Eh            ; var iData  boolean
                        .SYM      IRange, 0034Fh, 0000Dh, 3
DCG.IRange              .EQU    34Fh            ; var iData  byte
                        .SYM      oldIRange, 00350h, 0000Dh, 3
DCG.oldIRange           .EQU    350h            ; var iData  byte
                        .SYM      IAutoRange, 00351h, 0000Dh, 3
DCG.IAutoRange          .EQU    351h            ; var iData  byte
                        .SYM      URange, 00352h, 0000Dh, 3
DCG.URange              .EQU    352h            ; var iData  byte
                        .SYM      oldUrange, 00353h, 0000Dh, 3
DCG.oldUrange           .EQU    353h            ; var iData  byte
                        .SYM      RelaisState, 00354h, 00003h, 3
DCG.RelaisState         .EQU    354h            ; var iData  boolean
                        .SYM      oldRelaisState, 00355h, 00003h, 3
DCG.oldRelaisState      .EQU    355h            ; var iData  boolean
                        .SYM      URangeHigh, 00356h, 00003h, 3
DCG.URangeHigh          .EQU    356h            ; var iData  boolean
DCG.DisplayTimer        .EQU    357h            ; var iData  word
                        .SYM      DisplayTimer, 00357h, 0000Eh, 3
DCG.RelaisTimer         .EQU    359h            ; var iData  word
                        .SYM      RelaisTimer, 00359h, 0000Eh, 3
                        .SYM      DisplayToggle, 0035Bh, 0000Dh, 3
DCG.DisplayToggle       .EQU    35Bh            ; var iData  byte
DCG.ActivityTimer       .EQU    35Ch            ; var iData  byte
                        .SYM      ActivityTimer, 0035Ch, 0000Dh, 3
DCG.IncrTimer           .EQU    35Dh            ; var iData  byte
                        .SYM      IncrTimer, 0035Dh, 0000Dh, 3
DCG.IntegrateTimer      .EQU    35Eh            ; var iData  byte
                        .SYM      IntegrateTimer, 0035Eh, 0000Dh, 3
                        .SYM      LCDpresent, 0035Fh, 00003h, 3
DCG.LCDpresent          .EQU    35Fh            ; var iData  boolean
                        .SYM      Modify, 00360h, 0000Ah, 3
DCG.Modify              .EQU    360h            ; var iData  enum
                        .SYM      TrackChannel, 00361h, 0000Dh, 3
DCG.TrackChannel        .EQU    361h            ; var iData  byte
                        .SYM      IncrValue, 00362h, 00005h, 3
DCG.IncrValue           .EQU    362h            ; var iData  longint
                        .SYM      OldIncrValue, 00366h, 00005h, 3
DCG.OldIncrValue        .EQU    366h            ; var iData  longint
                        .SYM      IncrFine, 0036Ah, 00003h, 3
DCG.IncrFine            .EQU    36Ah            ; var iData  boolean
                        .SYM      FirstTurn, 0036Bh, 00003h, 3
DCG.FirstTurn           .EQU    36Bh            ; var iData  boolean
                        .SYM      IncrAccFloat, 0036Ch, 00006h, 3
DCG.IncrAccFloat        .EQU    36Ch            ; var iData  Float
                        .SYM      IncFineDiv, 00370h, 00006h, 3
DCG.IncFineDiv          .EQU    370h            ; var iData  Float
                        .SYM      IncCoarseDiv, 00374h, 00006h, 3
DCG.IncCoarseDiv        .EQU    374h            ; var iData  Float
                        .SYM      IncrDiff, 00378h, 00004h, 3
DCG.IncrDiff            .EQU    378h            ; var iData  integer
                        .SYM      IncrAccInt10, 0037Ah, 00004h, 3
DCG.IncrAccInt10        .EQU    37Ah            ; var iData  integer
                        .SYM      IncRast, 0037Ch, 00004h, 3
DCG.IncRast             .EQU    37Ch            ; var iData  integer
                        .SYM      IncrDiffByte, 0037Eh, 0000Dh, 3
DCG.IncrDiffByte        .EQU    37Eh            ; var iData  byte
                        .SYM      digits, 0037Fh, 0000Dh, 3
DCG.digits              .EQU    37Fh            ; var iData  byte
                        .SYM      nachkomma, 00380h, 0000Dh, 3
DCG.nachkomma           .EQU    380h            ; var iData  byte
                        .SYM      ChangedFlag, 00381h, 00003h, 3
DCG.ChangedFlag         .EQU    381h            ; var iData  boolean
                        .SYM      TempF, 00382h, 00006h, 3
DCG.TempF               .EQU    382h            ; var iData  Float
DCG.ParamStr            .EQU    386h            ; var iData  string
                        .SYM      ParamStr, 00386h, 0303Ch, 3
                        .SYM      CheckLimitErr, 003AFh, 0000Ah, 3
DCG.CheckLimitErr       .EQU    3AFh            ; var iData  enum
                        .SYM      Status, 003B0h, 0000Dh, 3
DCG.Status              .EQU    3B0h            ; var iData  byte
                        .SYM      FaultFlags, 003B1h, 0000Dh, 3
DCG.FaultFlags          .EQU    3B1h            ; var iData  byte
                        .SYM      ButtonNumber, 003B2h, 0000Dh, 3
DCG.ButtonNumber        .EQU    3B2h            ; var iData  byte
                        .SYM      ErrCount, 003B3h, 00004h, 3
DCG.ErrCount            .EQU    3B3h            ; var iData  integer
                        .SYM      ErrFlag, 003B5h, 00003h, 3
DCG.ErrFlag             .EQU    3B5h            ; var iData  boolean
                        .SYM      FaultTimer, 003B6h, 0000Dh, 3
DCG.FaultTimer          .EQU    3B6h            ; var iData  byte
                        .SYM      ToggleTimer, 003B7h, 0000Dh, 3
DCG.ToggleTimer         .EQU    3B7h            ; var iData  byte
                        .SYM      NoToggle, 003B8h, 00003h, 3
DCG.NoToggle            .EQU    3B8h            ; var iData  boolean
                        .SYM      Wh, 003B9h, 00006h, 3
DCG.Wh                  .EQU    3B9h            ; var iData  Float
                        .SYM      Ah, 003BDh, 00006h, 3
DCG.Ah                  .EQU    3BDh            ; var iData  Float
                        .SYM      CurrAmp, 003C1h, 00006h, 3
DCG.CurrAmp             .EQU    3C1h            ; var iData  Float
                        .SYM      CurrVolt, 003C5h, 00006h, 3
DCG.CurrVolt            .EQU    3C5h            ; var iData  Float

                        .FILE     DCG-HW.pas
                        .FUNC     ShiftOut1257, 00003h, 00020h
DCG.ShiftOut1257:
                        .RETURNS   0
                        .BLOCK    5
                        .ASM
                        .LINE     7
                        cbi  DCG.ControlBitPort, DCG.b_SDATAOUT
                        .LINE     8
                        cbi  DCG.ControlBitPort, DCG.b_SCLK
                        .LINE     9
                        sbi  DCG.ControlBitPort, DCG.b_STRDAC
                        .LINE     11
                        LDS _ACCA, DCG.DACtemp+1 ; MSB linksbündig
                        .LINE     12
                        LSL  _ACCA
                        .LINE     13
                        LSL  _ACCA
                        .LINE     14
                        LSL  _ACCA
                        .LINE     15
                        LSL  _ACCA ; Bit 3 sitzt jetzt oben
                        .LINE     16
                        ldi  _ACCB, 4
                        DCG.1257loop1:
                        .LINE     19
                        sbrc _ACCA,7 // Bit high?
                        .LINE     20
                        sbi  DCG.ControlBitPort, DCG.b_SDATAOUT
                        .LINE     21
                        sbi  DCG.ControlBitPort, DCG.b_SCLK
                        .LINE     22
                        LSL  _ACCA
                        .LINE     23
                        nop
                        .LINE     24
                        cbi  DCG.ControlBitPort, DCG.b_SDATAOUT
                        .LINE     25
                        cbi  DCG.ControlBitPort, DCG.b_SCLK
                        .LINE     26
                        dec _ACCB
                        .LINE     27
                        BRNE  DCG.1257loop1
                        .LINE     29
                        LDS _ACCA, DCG.DACtemp         ; LSB Level zuletzt
                        .LINE     30
                        ldi  _ACCB, 7 ; 7 Bits ohne Load
                        DCG.1257loop2:
                        .LINE     33
                        sbrc _ACCA,7 // Bit high?
                        .LINE     34
                        sbi  DCG.ControlBitPort, DCG.b_SDATAOUT
                        .LINE     35
                        sbi  DCG.ControlBitPort, DCG.b_SCLK
                        .LINE     36
                        LSL  _ACCA
                        .LINE     37
                        nop
                        .LINE     38
                        cbi  DCG.ControlBitPort, DCG.b_SDATAOUT
                        .LINE     39
                        cbi  DCG.ControlBitPort, DCG.b_SCLK
                        .LINE     40
                        dec _ACCB
                        .LINE     41
                        BRNE  DCG.1257loop2
                        .LINE     43
                        LSL  _ACCA ; LSB mit Load-impuls
                        .LINE     44
                        sbrc _ACCA,7 // Bit high?
                        .LINE     45
                        sbi  DCG.ControlBitPort, DCG.b_SDATAOUT
                        .LINE     46
                        sbi  DCG.ControlBitPort, DCG.b_SCLK
                        .LINE     47
                        cbi  DCG.ControlBitPort, DCG.b_STRDAC
                        .LINE     48
                        nop
                        .LINE     49
                        cbi  DCG.ControlBitPort, DCG.b_SDATAOUT
                        .LINE     50
                        cbi  DCG.ControlBitPort, DCG.b_SCLK
                        .LINE     51
                        sbi  DCG.ControlBitPort, DCG.b_STRDAC
                        .endasm
                        .ENDBLOCK 53
DCG.ShiftOut1257_X:
                        .LINE     53
                        .BRANCH   19
                        RET
                        .ENDFUNC  53

                        .FUNC     ShiftOut1655, 00037h, 00020h
DCG.ShiftOut1655:
                        .RETURNS   0
                        .BLOCK    57
                        .ASM
                        .LINE     59
                        cbi  DCG.ControlBitPort, DCG.b_SCLK
                        .LINE     60
                        cbi  DCG.ControlBitPort, DCG.b_SDATAOUT
                        .LINE     61
                        cbi  DCG.ControlBitPort, DCG.b_STRDAC
                        .LINE     63
                        LDS _ACCA, DCG.DACtemp+1 ; MSB linksbündig
                        .LINE     64
                        ldi  _ACCB, 8 ; 8 Bits ohne Load
                        DCG.1655loop1:
                        .LINE     67
                        sbrc _ACCA,7 // Bit high?
                        .LINE     68
                        sbi  DCG.ControlBitPort, DCG.b_SDATAOUT
                        .LINE     69
                        sbi  DCG.ControlBitPort, DCG.b_SCLK
                        .LINE     70
                        LSL  _ACCA
                        .LINE     71
                        cbi  DCG.ControlBitPort, DCG.b_SDATAOUT
                        .LINE     72
                        cbi  DCG.ControlBitPort, DCG.b_SCLK
                        .LINE     73
                        dec _ACCB
                        .LINE     74
                        BRNE  DCG.1655loop1
                        .LINE     76
                        LDS _ACCA, DCG.DACtemp         ; LSB Level zuletzt
                        .LINE     77
                        ldi  _ACCB, 8 ; 8 Bits ohne Load
                        DCG.1655loop2:
                        .LINE     80
                        sbrc _ACCA,7 // Bit high?
                        .LINE     81
                        sbi  DCG.ControlBitPort, DCG.b_SDATAOUT
                        .LINE     82
                        sbi  DCG.ControlBitPort, DCG.b_SCLK
                        .LINE     83
                        LSL  _ACCA
                        .LINE     84
                        cbi  DCG.ControlBitPort, DCG.b_SDATAOUT
                        .LINE     85
                        cbi  DCG.ControlBitPort, DCG.b_SCLK
                        .LINE     86
                        dec _ACCB
                        .LINE     87
                        BRNE  DCG.1655loop2
                        .LINE     88
                        sbi  DCG.ControlBitPort, DCG.b_STRDAC
                        .endasm
                        .ENDBLOCK 90
DCG.ShiftOut1655_X:
                        .LINE     90
                        .BRANCH   19
                        RET
                        .ENDFUNC  90

                        .FUNC     ShiftIn1864, 0005Dh, 00020h
DCG.ShiftIn1864:
                        .RETURNS   0
                        .BLOCK    95
                        .ASM
                        .LINE     97
                        cbi  DCG.ControlBitPort, DCG.b_STRAD16
                        .LINE     98
                        cbi  DCG.ControlBitPort, DCG.b_SCLK
                        .LINE     99
                        ldi  _ACCB, 8 ; 8 Bits
                        .LINE     100
                        nop
                        .LINE     101
                        nop
                        .LINE     102
                        nop
                        DCG.1864loop1:
                        .LINE     104
                        clc
                        .LINE     105
                        sbi  DCG.ControlBitPort, DCG.b_SCLK
                        .LINE     106
                        sbic DCG.ControlBitPin, DCG.b_SDATAIN1 // Bit gesetzt?
                        .LINE     107
                        sec
                        .LINE     108
                        cbi  DCG.ControlBitPort, DCG.b_SCLK
                        .LINE     109
                        rol _ACCA  // Carry-Bit einschieben
                        .LINE     110
                        dec _ACCB
                        .LINE     111
                        BRNE  DCG.1864loop1
                        .LINE     112
                        sts DCG.ADCtemp+1,_ACCA; Hi Byte vom Integer
                        .LINE     113
                        ldi  _ACCB, 8 ; 8 Bits
                        DCG.1864loop2:
                        .LINE     115
                        clc
                        .LINE     116
                        sbi  DCG.ControlBitPort, DCG.b_SCLK
                        .LINE     117
                        sbic DCG.ControlBitPin, DCG.b_SDATAIN1 // Bit gesetzt?
                        .LINE     118
                        sec
                        .LINE     119
                        cbi  DCG.ControlBitPort, DCG.b_SCLK
                        .LINE     120
                        rol _ACCA
                        .LINE     121
                        dec _ACCB
                        .LINE     122
                        BRNE  DCG.1864loop2
                        .LINE     123
                        sts DCG.ADCtemp,_ACCA; Low Byte vom Integer
                        .LINE     124
                        sbi  DCG.ControlBitPort, DCG.b_SCLK
                        .LINE     125
                        nop
                        .LINE     126
                        sbi  DCG.ControlBitPort, DCG.b_STRAD16
                        .endasm
                        .ENDBLOCK 128
DCG.ShiftIn1864_X:
                        .LINE     128
                        .BRANCH   19
                        RET
                        .ENDFUNC  128

                        .FUNC     OnSysTick, 00082h, 00020h
DCG.OnSysTick:
                        .RETURNS   0
                        .BLOCK    132
                        .LINE     133
                        SBI       00035h, 005h
                        .LINE     134
                        CBI       00035h, 004h
                        .LINE     135
                        LDS       _ACCB, 002FBh
                        CLR       _ACCA
                        SBRC      _ACCB, 001h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DCG._L0002
                        BRNE      DCG._L0002
                        .BRANCH   20,DCG._L0000
                        JMP       DCG._L0000
DCG._L0002:
                        .BLOCK    135
                        .LINE     136
                        .BRANCH   17,DCG.SHIFTIN1864
                        CALL      DCG.SHIFTIN1864
                        .ENDBLOCK 137
DCG._L0000:
DCG._L0001:
                        .LINE     138
                        LDS       _ACCA, DCG.UIToggle
                        TST       _ACCA
                        .BRANCH   4,DCG._L0005
                        BRNE      DCG._L0005
                        .BRANCH   20,DCG._L0003
                        JMP       DCG._L0003
DCG._L0005:
                        .BLOCK    138
                        .LINE     139
                        LDS       _ACCA, DCG.PWonOff
                        TST       _ACCA
                        .BRANCH   4,DCG._L0008
                        BRNE      DCG._L0008
                        .BRANCH   20,DCG._L0006
                        JMP       DCG._L0006
DCG._L0008:
                        .BLOCK    139
                        .LINE     140
                        LDS       _ACCB, DCG.PWcounter
                        LDS       _ACCA, DCG.PWcounter+1
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        CPI       _ACCA, 080h
                        BRNE      DCG._L0009
                        CPI       _ACCB, 000h
DCG._L0009:
                        LDI       _ACCA, 0h
                        BRNE      DCG._L0010
                        SER       _ACCA
DCG._L0010:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0013
                        BRNE      DCG._L0013
                        .BRANCH   20,DCG._L0011
                        JMP       DCG._L0011
DCG._L0013:
                        .BLOCK    140
                        .LINE     141
                        LDS       _ACCB, DCG.PWoffTime
                        LDS       _ACCA, DCG.PWoffTime+1
                        STS       DCG.PWCOUNTER, _ACCB
                        STS       DCG.PWCOUNTER+1, _ACCA
                        .LINE     142
                        LDI       _ACCA, 000h
                        STS       DCG.PWONOFF, _ACCA
                        .LINE     143
                        LDS       _ACCB, DCG.DACrawUoff
                        LDS       _ACCA, DCG.DACrawUoff+1
                        STS       DCG.DACTEMP, _ACCB
                        STS       DCG.DACTEMP+1, _ACCA
                        .ENDBLOCK 144
                        .BRANCH   20,DCG._L0012
                        JMP       DCG._L0012
DCG._L0011:
                        .BLOCK    144
                        .LINE     145
                        LDS       _ACCB, DCG.DACrawUon
                        LDS       _ACCA, DCG.DACrawUon+1
                        STS       DCG.DACTEMP, _ACCB
                        STS       DCG.DACTEMP+1, _ACCA
                        .ENDBLOCK 146
DCG._L0012:
                        .ENDBLOCK 147
                        .BRANCH   20,DCG._L0007
                        JMP       DCG._L0007
DCG._L0006:
                        .BLOCK    147
                        .LINE     148
                        LDS       _ACCB, DCG.PWcounter
                        LDS       _ACCA, DCG.PWcounter+1
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        CPI       _ACCA, 080h
                        BRNE      DCG._L0014
                        CPI       _ACCB, 000h
DCG._L0014:
                        LDI       _ACCA, 0h
                        BRNE      DCG._L0015
                        SER       _ACCA
DCG._L0015:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0018
                        BRNE      DCG._L0018
                        .BRANCH   20,DCG._L0016
                        JMP       DCG._L0016
DCG._L0018:
                        .BLOCK    148
                        .LINE     149
                        LDS       _ACCB, DCG.PWonTime
                        LDS       _ACCA, DCG.PWonTime+1
                        STS       DCG.PWCOUNTER, _ACCB
                        STS       DCG.PWCOUNTER+1, _ACCA
                        .LINE     150
                        LDI       _ACCA, 0FFh
                        STS       DCG.PWONOFF, _ACCA
                        .LINE     151
                        LDS       _ACCB, DCG.DACrawUon
                        LDS       _ACCA, DCG.DACrawUon+1
                        STS       DCG.DACTEMP, _ACCB
                        STS       DCG.DACTEMP+1, _ACCA
                        .ENDBLOCK 152
                        .BRANCH   20,DCG._L0017
                        JMP       DCG._L0017
DCG._L0016:
                        .BLOCK    152
                        .LINE     153
                        LDS       _ACCB, DCG.DACrawUoff
                        LDS       _ACCA, DCG.DACrawUoff+1
                        STS       DCG.DACTEMP, _ACCB
                        STS       DCG.DACTEMP+1, _ACCA
                        .ENDBLOCK 154
DCG._L0017:
                        .ENDBLOCK 155
DCG._L0007:
                        .ENDBLOCK 156
                        .BRANCH   20,DCG._L0004
                        JMP       DCG._L0004
DCG._L0003:
                        .BLOCK    156
                        .LINE     157
                        LDS       _ACCB, DCG.DACrawI
                        LDS       _ACCA, DCG.DACrawI+1
                        STS       DCG.DACTEMP, _ACCB
                        STS       DCG.DACTEMP+1, _ACCA
                        .ENDBLOCK 158
DCG._L0004:
                        .LINE     159
                        LDI       _ACCELO, 00000h AND 0FFh
                        LDI       _ACCEHI, 00000h SHRB 8
                        LDI       _ACCALO, 00001h AND 0FFh
                        LDI       _ACCAHI, 00001h SHRB 8
                        LDI       _ACCCLO, DCG.PWcounter AND 0FFh
                        LDI       _ACCCHI, DCG.PWcounter SHRB 8
                        CALL      SYSTEM._DEClim16S
                        .LINE     160
                        LDS       _ACCB, 002FBh
                        CLR       _ACCA
                        SBRC      _ACCB, 000h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DCG._L0021
                        BRNE      DCG._L0021
                        .BRANCH   20,DCG._L0019
                        JMP       DCG._L0019
DCG._L0021:
                        .BLOCK    160
                        .LINE     161
                        .BRANCH   17,DCG.SHIFTOUT1655
                        CALL      DCG.SHIFTOUT1655
                        .ENDBLOCK 162
                        .BRANCH   20,DCG._L0020
                        JMP       DCG._L0020
DCG._L0019:
                        .BLOCK    162
                        .LINE     163
                        .BRANCH   17,DCG.SHIFTOUT1257
                        CALL      DCG.SHIFTOUT1257
                        .ENDBLOCK 164
DCG._L0020:
                        .ASM
                        .LINE     166
                        ldi  _ACCB, 40
                        DAC16settleLoop1:  // 10 µs warten
                        .LINE     168
                        dec _ACCB
                        .LINE     169
                        BRNE DAC16settleLoop1
                        .endasm
                        .LINE     171
                        LDS       _ACCA, DCG.UIToggle
                        TST       _ACCA
                        .BRANCH   4,DCG._L0024
                        BRNE      DCG._L0024
                        .BRANCH   20,DCG._L0022
                        JMP       DCG._L0022
DCG._L0024:
                        .BLOCK    172
                        .LINE     172
                        LDS       _ACCB, DCG.ADCrawU
                        LDS       _ACCA, DCG.ADCrawU+1
                        LSR       _ACCA
                        ROR       _ACCB
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDS       _ACCB, DCG.ADCtemp
                        LDS       _ACCA, DCG.ADCtemp+1
                        LSR       _ACCA
                        ROR       _ACCB
                        POP       _ACCAHI
                        POP       _ACCALO
                        ADD       _ACCB, _ACCALO
                        ADC       _ACCA, _ACCAHI
                        STS       DCG.ADCRAWU, _ACCB
                        STS       DCG.ADCRAWU+1, _ACCA
                        .LINE     173
                        SBI       00035h, 006h
                        .LINE     174
                        SBI       00035h, 004h
                        .ENDBLOCK 175
                        .BRANCH   20,DCG._L0023
                        JMP       DCG._L0023
DCG._L0022:
                        .BLOCK    175
                        .LINE     176
                        LDS       _ACCB, DCG.ADCrawI
                        LDS       _ACCA, DCG.ADCrawI+1
                        LSR       _ACCA
                        ROR       _ACCB
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDS       _ACCB, DCG.ADCtemp
                        LDS       _ACCA, DCG.ADCtemp+1
                        LSR       _ACCA
                        ROR       _ACCB
                        POP       _ACCAHI
                        POP       _ACCALO
                        ADD       _ACCB, _ACCALO
                        ADC       _ACCA, _ACCAHI
                        STS       DCG.ADCRAWI, _ACCB
                        STS       DCG.ADCRAWI+1, _ACCA
                        .LINE     177
                        CBI       00035h, 006h
                        .LINE     178
                        CBI       00035h, 005h
                        .ENDBLOCK 179
DCG._L0023:
                        .LINE     180
                        LDS       _ACCA, DCG.UIToggle
                        COM       _ACCA
                        STS       DCG.UITOGGLE, _ACCA
                        .ENDBLOCK 181
DCG.OnSysTick_X:
                        .LINE     181
                        .BRANCH   19
                        RET
                        .ENDFUNC  181

                        .FUNC     GetADC10, 000B9h, 00020h
DCG.GetADC10:
                        .RETURNS   2
                        SBIW      _FRAMEPTR, 2
                        .BLOCK    191
                        .LINE     192
                        LDD       _ACCA, Y+002h
                        SUBI      _ACCA, 001h AND 0FFh
                        ANDI      _ACCA, 007h
                        OUT       ADMUX, _ACCA
                        .ASM
                        .LINE     194
                        ldi  _ACCB, 15
                        ADC10settleLoop1:  // 3 µs warten
                        .LINE     196
                        dec _ACCB
                        .LINE     197
                        BRNE ADC10settleLoop1
                        .LINE     198
                        ldi  _ACCB, $C7    // Teiler 128
                        .LINE     199
                        out ADCSRA, _ACCB
                        ADC10endLoop1:
                        .LINE     201
                        in _ACCB, ADCSRA
                        .LINE     202
                        sbrc _ACCB,6 // auf Bit 6 low warten
                        .LINE     203
                        rjmp ADC10endLoop1
                        .endasm
                        .LINE     205
                        IN        _ACCA, ADCL
                        STD       Y+000h, _ACCA
                        .LINE     206
                        IN        _ACCA, ADCH
                        STD       Y+001h, _ACCA
                        .LINE     207
                        LDD       _ACCB, Y+000h
                        LDD       _ACCA, Y+001h
                        .ENDBLOCK 208
DCG.GetADC10_X:
                        .LINE     208
                        .BRANCH   19
                        RET
                        .ENDFUNC  208


                        .FILE     H:\PROJAVR\ADA-C DCG_MCB\DCG.pas
                        .FUNC     SetLM75Temp, 001C9h, 00020h
DCG.SetLM75Temp:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 2
                        .BLOCK    460
                        .LINE     461
                        LDS       _ACCA, DCG.I2CslaveAdr
                        PUSH      _ACCA
                        LDI       _ACCA, 001h
                        PUSH      _ACCA
                        CLT
                        BLD       Flags, _I2C2BYTE
                        LDI       _ACCCLO, _ACCELO AND 0FFh
                        LDI       _ACCCHI, _ACCELO SHRB 8
                        POP       _ACCAHI
                        POP       _ACCDLO
                        LDI       _ACCBLO, 00001h AND 0FFh
                        LDI       _ACCBHI, 00001h SHRB 8
                        LDI       _ACCELO, 004h
                        LDI       _ACCDHI, 000h
                        CALL       SYSTEM.TWIOut
                        .LINE     463
                        LDS       _ACCB, DCG.Param
                        LDS       _ACCA, DCG.Param+1
                        LDS       _ACCALO, DCG.Param+2
                        LDS       _ACCAHI, DCG.Param+3
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
                        LDI       _ACCCLO, 000h
                        LDI       _ACCCHI, 040h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat_R
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.FloatToLInt
                        SBRC      _ACCAHI, 7
                        RJMP      DCG._L0025
                        OR        _ACCAHI, _ACCALO
                        BRNE      DCG._L0026
                        RJMP      DCG._L0027
DCG._L0025:
                        CPI       _ACCAHI, 0FFh
                        BRNE      DCG._L0026
                        CPI       _ACCALO, 0FFh
                        BREQ      DCG._L0027
DCG._L0026:
                        SET
                        BLD       Flags, _ERRFLAG
DCG._L0027:
                        STD       Y+001h, _ACCA
                        STD       Y+000h, _ACCB
                        .LINE     464
                        LDD       _ACCB, Y+000h
                        LDD       _ACCA, Y+001h
                        LDI       _ACCALO, 007h
                        CALL      SYSTEM.SHL16
                        MOV       _ACCBLO, _ACCA
                        MOV       _ACCA, _ACCB
                        MOV       _ACCB, _ACCBLO
                        STD       Y+001h, _ACCA
                        STD       Y+000h, _ACCB
                        .LINE     465
                        LDS       _ACCA, DCG.I2CslaveAdr
                        PUSH      _ACCA
                        LDI       _ACCA, 003h
                        PUSH      _ACCA
                        CLT
                        BLD       Flags, _I2C2BYTE
                        MOVW      _ACCCLO, _FRAMEPTR
                        LDI       _ACCBLO, 00002h AND 0FFh
                        LDI       _ACCBHI, 00002h SHRB 8
                        POP       _ACCAHI
                        POP       _ACCDLO
                        LDI       _ACCDHI, 000h
                        CALL       SYSTEM.TWIOut
                        .LINE     467
                        LDS       _ACCB, DCG.Param
                        LDS       _ACCA, DCG.Param+1
                        LDS       _ACCALO, DCG.Param+2
                        LDS       _ACCAHI, DCG.Param+3
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
                        LDI       _ACCCLO, 000h
                        LDI       _ACCCHI, 040h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat_R
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.FloatToLInt
                        SBRC      _ACCAHI, 7
                        RJMP      DCG._L0028
                        OR        _ACCAHI, _ACCALO
                        BRNE      DCG._L0029
                        RJMP      DCG._L0030
DCG._L0028:
                        CPI       _ACCAHI, 0FFh
                        BRNE      DCG._L0029
                        CPI       _ACCALO, 0FFh
                        BREQ      DCG._L0030
DCG._L0029:
                        SET
                        BLD       Flags, _ERRFLAG
DCG._L0030:
                        SUBI      _ACCB, 00006h AND 0FFh
                        SBCI      _ACCA, 00006h SHRB 8
                        STD       Y+001h, _ACCA
                        STD       Y+000h, _ACCB
                        .LINE     468
                        LDD       _ACCB, Y+000h
                        LDD       _ACCA, Y+001h
                        LDI       _ACCALO, 007h
                        CALL      SYSTEM.SHL16
                        MOV       _ACCBLO, _ACCA
                        MOV       _ACCA, _ACCB
                        MOV       _ACCB, _ACCBLO
                        STD       Y+001h, _ACCA
                        STD       Y+000h, _ACCB
                        .LINE     469
                        LDS       _ACCA, DCG.I2CslaveAdr
                        PUSH      _ACCA
                        LDI       _ACCA, 002h
                        PUSH      _ACCA
                        CLT
                        BLD       Flags, _I2C2BYTE
                        MOVW      _ACCCLO, _FRAMEPTR
                        LDI       _ACCBLO, 00002h AND 0FFh
                        LDI       _ACCBHI, 00002h SHRB 8
                        POP       _ACCAHI
                        POP       _ACCDLO
                        LDI       _ACCDHI, 000h
                        CALL       SYSTEM.TWIOut
                        .LINE     470
                        LDS       _ACCA, DCG.I2CslaveAdr
                        PUSH      _ACCA
                        LDI       _ACCA, 000h
                        MOV       _ACCAHI, _ACCA
                        CLT
                        BLD       Flags, _I2C2BYTE
                        POP       _ACCDLO
                        LDI       _ACCBLO, 00000h AND 0FFh
                        LDI       _ACCBHI, 00000h SHRB 8
                        LDI       _ACCDHI, 000h
                        CALL       SYSTEM.TWIOut
                        .ENDBLOCK 471
DCG.SetLM75Temp_X:
                        .LINE     471
                        .BRANCH   19
                        RET
                        .ENDFUNC  471

                        .FUNC     GetLM75Temp, 001D9h, 00020h
DCG.GetLM75Temp:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 2
                        .BLOCK    476
                        .LINE     477
                        LDS       _ACCA, DCG.I2CslaveAdr
                        PUSH      _ACCA
                        LDI       _ACCA, 000h
                        MOV       _ACCAHI, _ACCA
                        CLT
                        BLD       Flags, _I2C2BYTE
                        POP       _ACCDLO
                        LDI       _ACCBLO, 00000h AND 0FFh
                        LDI       _ACCBHI, 00000h SHRB 8
                        LDI       _ACCDHI, 000h
                        CALL       SYSTEM.TWIOut
                        .LINE     478
                        LDS       _ACCA, DCG.I2CslaveAdr
                        PUSH      _ACCA
                        MOVW      _ACCCLO, _FRAMEPTR
                        LDI       _ACCBLO, 00002h AND 0FFh
                        LDI       _ACCBHI, 00002h SHRB 8
                        POP       _ACCDLO
                        CALL       SYSTEM.TWIInp
                        .LINE     479
                        LDD       _ACCB, Y+000h
                        LDD       _ACCA, Y+001h
                        MOV       _ACCBLO, _ACCA
                        MOV       _ACCA, _ACCB
                        MOV       _ACCB, _ACCBLO
                        LDI       _ACCALO, 007h
                        CALL      SYSTEM.SHR16
                        STD       Y+001h, _ACCA
                        STD       Y+000h, _ACCB
                        .LINE     480
                        LDD       _ACCB, Y+000h
                        LDD       _ACCA, Y+001h
                        SBRS      _ACCA, 7
                        RJMP      DCG._L0031
                        LDI       _ACCAHI, 0FFh
                        LDI       _ACCALO, 0FFh
                        RJMP      DCG._L0032
DCG._L0031:
                        CLR       _ACCAHI
                        CLR       _ACCALO
DCG._L0032:
                        SET
                        BLD       Flags, _SIGN
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.LIntToFloat
                        MOVW      _ACCDLO, _ACCB
                        MOVW      _ACCELO, _ACCALO
                        LDI       _ACCBLO, 000h
                        LDI       _ACCBHI, 000h
                        LDI       _ACCCLO, 000h
                        LDI       _ACCCHI, 040h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat_R
                        STS       DCG.TEMPERATURE, _ACCB
                        STS       DCG.TEMPERATURE+1, _ACCA
                        STS       DCG.TEMPERATURE+2, _ACCALO
                        STS       DCG.TEMPERATURE+3, _ACCAHI
                        .ENDBLOCK 481
DCG.GetLM75Temp_X:
                        .LINE     481
                        .BRANCH   19
                        RET
                        .ENDFUNC  481

                        .FUNC     InitScales, 001E3h, 00020h
DCG.InitScales:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 14
                        .BLOCK    486
                        .LINE     487
                        LDI       _ACCCLO, DCG.InitOptions AND 0FFh
                        LDI       _ACCCHI, DCG.InitOptions SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.FloatToLInt
                        SBRC      _ACCAHI, 7
                        RJMP      DCG._L0033
                        OR        _ACCAHI, _ACCALO
                        BRNE      DCG._L0034
                        RJMP      DCG._L0035
DCG._L0033:
                        CPI       _ACCAHI, 0FFh
                        BRNE      DCG._L0034
                        CPI       _ACCALO, 0FFh
                        BREQ      DCG._L0035
DCG._L0034:
                        SET
                        BLD       Flags, _ERRFLAG
DCG._L0035:
                        STD       Y+00Dh, _ACCA
                        STD       Y+00Ch, _ACCB
                        .LINE     488
                        LDD       _ACCB, Y+00Ch
                        LDD       _ACCA, Y+00Dh
                        MOV       _ACCA, _ACCB
                        STS       DCG.OPTIONS, _ACCA
                        .LINE     489
                        LDS       _ACCB, 002FBh
                        CLR       _ACCA
                        SBRC      _ACCB, 000h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DCG._L0038
                        BRNE      DCG._L0038
                        .BRANCH   20,DCG._L0036
                        JMP       DCG._L0036
DCG._L0038:
                        .BLOCK    489
                        .LINE     490
                        LDI       _ACCCLO, DCG.Uref AND 0FFh
                        LDI       _ACCCHI, DCG.Uref SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        MOVW      _ACCBLO, _ACCB
                        MOVW      _ACCCLO, _ACCALO
                        LDI       _ACCDLO, 000h
                        LDI       _ACCDHI, 000h
                        LDI       _ACCELO, 000h
                        LDI       _ACCEHI, 040h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat_R
                        STD       Y+00Bh, _ACCAHI
                        STD       Y+00Ah, _ACCALO
                        STD       Y+009h, _ACCA
                        STD       Y+008h, _ACCB
                        .LINE     491
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 080h
                        LDI       _ACCAHI, 047h
                        STD       Y+003h, _ACCAHI
                        STD       Y+002h, _ACCALO
                        STD       Y+001h, _ACCA
                        STD       Y+000h, _ACCB
                        .ENDBLOCK 492
                        .BRANCH   20,DCG._L0037
                        JMP       DCG._L0037
DCG._L0036:
                        .BLOCK    492
                        .LINE     493
                        LDI       _ACCCLO, DCG.Uref AND 0FFh
                        LDI       _ACCCHI, DCG.Uref SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        STD       Y+00Bh, _ACCAHI
                        STD       Y+00Ah, _ACCALO
                        STD       Y+009h, _ACCA
                        STD       Y+008h, _ACCB
                        .LINE     494
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 080h
                        LDI       _ACCAHI, 045h
                        STD       Y+003h, _ACCAHI
                        STD       Y+002h, _ACCALO
                        STD       Y+001h, _ACCA
                        STD       Y+000h, _ACCB
                        .ENDBLOCK 495
DCG._L0037:
                        .LINE     496
                        LDS       _ACCB, 002FBh
                        CLR       _ACCA
                        SBRC      _ACCB, 001h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DCG._L0041
                        BRNE      DCG._L0041
                        .BRANCH   20,DCG._L0039
                        JMP       DCG._L0039
DCG._L0041:
                        .BLOCK    496
                        .LINE     497
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 080h
                        LDI       _ACCAHI, 047h
                        STD       Y+007h, _ACCAHI
                        STD       Y+006h, _ACCALO
                        STD       Y+005h, _ACCA
                        STD       Y+004h, _ACCB
                        .ENDBLOCK 498
                        .BRANCH   20,DCG._L0040
                        JMP       DCG._L0040
DCG._L0039:
                        .BLOCK    498
                        .LINE     499
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 080h
                        LDI       _ACCAHI, 044h
                        STD       Y+007h, _ACCAHI
                        STD       Y+006h, _ACCALO
                        STD       Y+005h, _ACCA
                        STD       Y+004h, _ACCB
                        .ENDBLOCK 500
DCG._L0040:
                        .LINE     501
                        LDI       _ACCCLO, DCG.DACLSBUarray AND 0FFh
                        LDI       _ACCCHI, DCG.DACLSBUarray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCAHI, Y+00Bh
                        LDD       _ACCALO, Y+00Ah
                        LDD       _ACCA, Y+009h
                        LDD       _ACCB, Y+008h
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, DCG.InitGainOut AND 0FFh
                        LDI       _ACCCHI, DCG.InitGainOut SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDD       _ACCAHI, Y+003h
                        LDD       _ACCALO, Y+002h
                        LDD       _ACCA, Y+001h
                        LDD       _ACCB, Y+000h
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, DCG.DACUscales AND 0FFh
                        LDI       _ACCCHI, DCG.DACUscales SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z+, _ACCB
                        ST        Z+, _ACCA
                        ST        Z+, _ACCALO
                        ST        Z+, _ACCAHI
                        .LINE     502
                        LDI       _ACCCLO, DCG.DACLSBUarray AND 0FFh
                        LDI       _ACCCHI, DCG.DACLSBUarray SHRB 8
                        ADIW      _ACCCLO, 00004h
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCAHI, Y+00Bh
                        LDD       _ACCALO, Y+00Ah
                        LDD       _ACCA, Y+009h
                        LDD       _ACCB, Y+008h
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, DCG.InitGainPre AND 0FFh
                        LDI       _ACCCHI, DCG.InitGainPre SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, DCG.InitGainOut AND 0FFh
                        LDI       _ACCCHI, DCG.InitGainOut SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDD       _ACCAHI, Y+003h
                        LDD       _ACCALO, Y+002h
                        LDD       _ACCA, Y+001h
                        LDD       _ACCB, Y+000h
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, DCG.DACUscales AND 0FFh
                        LDI       _ACCCHI, DCG.DACUscales SHRB 8
                        ADIW      _ACCCLO, 00004h
                        CALL      SYSTEM._ReadEEp32
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z+, _ACCB
                        ST        Z+, _ACCA
                        ST        Z+, _ACCALO
                        ST        Z+, _ACCAHI
                        .LINE     503
                        .LOOP
                        LDI       _ACCCLO, DCG.i AND 0FFh
                        LDI       _ACCCHI, DCG.i SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 000h
                        ST        Z, _ACCA
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
DCG._L0044:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      DCG._L0045
                        CLR       _ACCA
DCG._L0045:
                        TST       _ACCA
                        .BRANCH   3,DCG._L0046
                        BREQ      DCG._L0046
                        .BRANCH   20,DCG._L0043
                        JMP       DCG._L0043
DCG._L0046:
                        .BLOCK    504
                        .LINE     504
                        LDI       _ACCCLO, DCG.ADCLSBUarray AND 0FFh
                        LDI       _ACCCHI, DCG.ADCLSBUarray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        MOV       _ACCA, DCG.i
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
                        LDI       _ACCCLO, DCG.ADCUfacs AND 0FFh
                        LDI       _ACCCHI, DCG.ADCUfacs SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        MOV       _ACCA, DCG.i
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
                        ADIW      _ACCCLO, 01h
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, DCG.ADCUscales AND 0FFh
                        LDI       _ACCCHI, DCG.ADCUscales SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        MOV       _ACCA, DCG.i
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
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, DCG.Uref AND 0FFh
                        LDI       _ACCCHI, DCG.Uref SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, DCG.InitGainOut AND 0FFh
                        LDI       _ACCCHI, DCG.InitGainOut SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDD       _ACCAHI, Y+00Ah
                        LDD       _ACCALO, Y+009h
                        LDD       _ACCA, Y+008h
                        LDD       _ACCB, Y+007h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z+, _ACCB
                        ST        Z+, _ACCA
                        ST        Z+, _ACCALO
                        ST        Z+, _ACCAHI
                        .ENDBLOCK 505
DCG._L0042:
                        .LINE     505
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,DCG._L0043
                        BREQ      DCG._L0043
                        .BRANCH   20,DCG._L0044
                        JMP       DCG._L0044
DCG._L0043:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .LINE     507
                        LDD       _ACCAHI, Y+00Bh
                        LDD       _ACCALO, Y+00Ah
                        LDD       _ACCA, Y+009h
                        LDD       _ACCB, Y+008h
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, DCG.InitGainI AND 0FFh
                        LDI       _ACCCHI, DCG.InitGainI SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        STD       Y+00Bh, _ACCAHI
                        STD       Y+00Ah, _ACCALO
                        STD       Y+009h, _ACCA
                        STD       Y+008h, _ACCB
                        .LINE     508
                        .LOOP
                        LDI       _ACCCLO, DCG.i AND 0FFh
                        LDI       _ACCCHI, DCG.i SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 000h
                        ST        Z, _ACCA
                        LDI       _ACCA, 003h
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
DCG._L0049:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      DCG._L0050
                        CLR       _ACCA
DCG._L0050:
                        TST       _ACCA
                        .BRANCH   3,DCG._L0051
                        BREQ      DCG._L0051
                        .BRANCH   20,DCG._L0048
                        JMP       DCG._L0048
DCG._L0051:
                        .BLOCK    510
                        .LINE     510
                        LDI       _ACCCLO, DCG.DACLSBIarray AND 0FFh
                        LDI       _ACCCHI, DCG.DACLSBIarray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        MOV       _ACCA, DCG.i
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
                        LDD       _ACCAHI, Y+00Eh
                        LDD       _ACCALO, Y+00Dh
                        LDD       _ACCA, Y+00Ch
                        LDD       _ACCB, Y+00Bh
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, DCG.RSenseArray AND 0FFh
                        LDI       _ACCCHI, DCG.RSenseArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        MOV       _ACCA, DCG.i
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
                        ADIW      _ACCCLO, 01h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDD       _ACCAHI, Y+006h
                        LDD       _ACCALO, Y+005h
                        LDD       _ACCA, Y+004h
                        LDD       _ACCB, Y+003h
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, DCG.DACIscales AND 0FFh
                        LDI       _ACCCHI, DCG.DACIscales SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        MOV       _ACCA, DCG.i
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
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z+, _ACCB
                        ST        Z+, _ACCA
                        ST        Z+, _ACCALO
                        ST        Z+, _ACCAHI
                        .LINE     512
                        LDI       _ACCCLO, DCG.ADCLSBIarray AND 0FFh
                        LDI       _ACCCHI, DCG.ADCLSBIarray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        MOV       _ACCA, DCG.i
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
                        LDI       _ACCCLO, DCG.ADCIscales AND 0FFh
                        LDI       _ACCCHI, DCG.ADCIscales SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        MOV       _ACCA, DCG.i
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
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, DCG.Uref AND 0FFh
                        LDI       _ACCCHI, DCG.Uref SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, DCG.RSenseArray AND 0FFh
                        LDI       _ACCCHI, DCG.RSenseArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        MOV       _ACCA, DCG.i
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
                        ADIW      _ACCCLO, 01h
                        MOVW      _ACCBLO, _ACCB
                        MOVW      _ACCCLO, _ACCALO
                        LDI       _ACCDLO, 000h
                        LDI       _ACCDHI, 000h
                        LDI       _ACCELO, 000h
                        LDI       _ACCEHI, 040h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat_R
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDD       _ACCAHI, Y+00Ah
                        LDD       _ACCALO, Y+009h
                        LDD       _ACCA, Y+008h
                        LDD       _ACCB, Y+007h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z+, _ACCB
                        ST        Z+, _ACCA
                        ST        Z+, _ACCALO
                        ST        Z+, _ACCAHI
                        .ENDBLOCK 513
DCG._L0047:
                        .LINE     513
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,DCG._L0048
                        BREQ      DCG._L0048
                        .BRANCH   20,DCG._L0049
                        JMP       DCG._L0049
DCG._L0048:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .LINE     514
                        LDD       _ACCAHI, Y+003h
                        LDD       _ACCALO, Y+002h
                        LDD       _ACCA, Y+001h
                        LDD       _ACCB, Y+000h
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 080h
                        LDI       _ACCAHI, 03Fh
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.SubFloat
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.FloatToLInt
                        STS       DCG.DACMAX, _ACCB
                        STS       DCG.DACMAX+1, _ACCA
                        STS       DCG.DACMAX+2, _ACCALO
                        STS       DCG.DACMAX+3, _ACCAHI
                        .LINE     515
                        LDI       _ACCCLO, DCG.InitSwitchU AND 0FFh
                        LDI       _ACCCHI, DCG.InitSwitchU SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        STS       DCG.SWITCHPOINT, _ACCB
                        STS       DCG.SWITCHPOINT+1, _ACCA
                        STS       DCG.SWITCHPOINT+2, _ACCALO
                        STS       DCG.SWITCHPOINT+3, _ACCAHI
                        .LINE     516
                        LDI       _ACCCLO, DCG.TrackChSave AND 0FFh
                        LDI       _ACCCHI, DCG.TrackChSave SHRB 8
                        CALL      SYSTEM.ReadEEp8
                        STS       DCG.TRACKCHANNEL, _ACCA
                        .LINE     517
                        LDI       _ACCCLO, DCG.InitFanOnTemp AND 0FFh
                        LDI       _ACCCHI, DCG.InitFanOnTemp SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        STS       DCG.PARAM, _ACCB
                        STS       DCG.PARAM+1, _ACCA
                        STS       DCG.PARAM+2, _ACCALO
                        STS       DCG.PARAM+3, _ACCAHI
                        .LINE     518
                        LDI       _ACCA, 048h
                        STS       DCG.I2CSLAVEADR, _ACCA
                        .LINE     519
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DCG.SETLM75TEMP
                        CALL      DCG.SETLM75TEMP
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     520
                        LDI       _ACCCLO, DCG.InitHystLow AND 0FFh
                        LDI       _ACCCHI, DCG.InitHystLow SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        STS       DCG.RELAISVOLTLOW, _ACCB
                        STS       DCG.RELAISVOLTLOW+1, _ACCA
                        STS       DCG.RELAISVOLTLOW+2, _ACCALO
                        STS       DCG.RELAISVOLTLOW+3, _ACCAHI
                        .LINE     521
                        LDI       _ACCCLO, DCG.InitHystHigh AND 0FFh
                        LDI       _ACCCHI, DCG.InitHystHigh SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        STS       DCG.RELAISVOLTHIGH, _ACCB
                        STS       DCG.RELAISVOLTHIGH+1, _ACCA
                        STS       DCG.RELAISVOLTHIGH+2, _ACCALO
                        STS       DCG.RELAISVOLTHIGH+3, _ACCAHI
                        .LINE     522
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 080h
                        LDI       _ACCAHI, 03Fh
                        STS       DCG.DCVOLTMOD, _ACCB
                        STS       DCG.DCVOLTMOD+1, _ACCA
                        STS       DCG.DCVOLTMOD+2, _ACCALO
                        STS       DCG.DCVOLTMOD+3, _ACCAHI
                        .LINE     523
                        LDI       _ACCCLO, DCG.InitRipplePercent AND 0FFh
                        LDI       _ACCCHI, DCG.InitRipplePercent SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.FloatToLInt
                        SBRC      _ACCAHI, 7
                        RJMP      DCG._L0052
                        OR        _ACCAHI, _ACCALO
                        BRNE      DCG._L0053
                        RJMP      DCG._L0054
DCG._L0052:
                        CPI       _ACCAHI, 0FFh
                        BRNE      DCG._L0053
                        CPI       _ACCALO, 0FFh
                        BREQ      DCG._L0054
DCG._L0053:
                        SET
                        BLD       Flags, _ERRFLAG
DCG._L0054:
                        STS       DCG.RIPPLEPERCENT, _ACCB
                        STS       DCG.RIPPLEPERCENT+1, _ACCA
                        .LINE     524
                        LDI       _ACCCLO, DCG.InitTonTime AND 0FFh
                        LDI       _ACCCHI, DCG.InitTonTime SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.FloatToLInt
                        SBRC      _ACCAHI, 7
                        RJMP      DCG._L0055
                        OR        _ACCAHI, _ACCALO
                        BRNE      DCG._L0056
                        RJMP      DCG._L0057
DCG._L0055:
                        CPI       _ACCAHI, 0FFh
                        BRNE      DCG._L0056
                        CPI       _ACCALO, 0FFh
                        BREQ      DCG._L0057
DCG._L0056:
                        SET
                        BLD       Flags, _ERRFLAG
DCG._L0057:
                        STS       DCG.PWONTIME, _ACCB
                        STS       DCG.PWONTIME+1, _ACCA
                        .LINE     525
                        LDI       _ACCCLO, DCG.InitToffTime AND 0FFh
                        LDI       _ACCCHI, DCG.InitToffTime SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.FloatToLInt
                        SBRC      _ACCAHI, 7
                        RJMP      DCG._L0058
                        OR        _ACCAHI, _ACCALO
                        BRNE      DCG._L0059
                        RJMP      DCG._L0060
DCG._L0058:
                        CPI       _ACCAHI, 0FFh
                        BRNE      DCG._L0059
                        CPI       _ACCALO, 0FFh
                        BREQ      DCG._L0060
DCG._L0059:
                        SET
                        BLD       Flags, _ERRFLAG
DCG._L0060:
                        STS       DCG.PWOFFTIME, _ACCB
                        STS       DCG.PWOFFTIME+1, _ACCA
                        .LINE     526
                        LDI       _ACCCLO, DCG.InitTonTime AND 0FFh
                        LDI       _ACCCHI, DCG.InitTonTime SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.FloatToLInt
                        SBRC      _ACCAHI, 7
                        RJMP      DCG._L0061
                        OR        _ACCAHI, _ACCALO
                        BRNE      DCG._L0062
                        RJMP      DCG._L0063
DCG._L0061:
                        CPI       _ACCAHI, 0FFh
                        BRNE      DCG._L0062
                        CPI       _ACCALO, 0FFh
                        BREQ      DCG._L0063
DCG._L0062:
                        SET
                        BLD       Flags, _ERRFLAG
DCG._L0063:
                        STS       DCG.PWCOUNTER, _ACCB
                        STS       DCG.PWCOUNTER+1, _ACCA
                        .ENDBLOCK 527
DCG.InitScales_X:
                        .LINE     527
                        .BRANCH   19
                        RET
                        .ENDFUNC  527

                        .FUNC     SetShunt, 00216h, 00020h
DCG.SetShunt:
                        .RETURNS   0
                        .BLOCK    535
                        .LINE     536
                        LDD       _ACCA, Y+000h
                        .LINE     537
                        CPI       _ACCA, 0
                        .BRANCH   3,DCG._L0067
                        BREQ      DCG._L0067
                        .BRANCH   20,DCG._L0066
                        JMP       DCG._L0066
DCG._L0067:
DCG._L0065:
                        .BLOCK    538
                        .LINE     538
                        SBI       00035h, 002h
                        .LINE     539
                        SBI       00035h, 003h
                        .ENDBLOCK 540
                        .BRANCH   20,DCG._L0064
                        JMP       DCG._L0064
DCG._L0066:
                        .LINE     541
                        CPI       _ACCA, 1
                        .BRANCH   3,DCG._L0070
                        BREQ      DCG._L0070
                        .BRANCH   20,DCG._L0069
                        JMP       DCG._L0069
DCG._L0070:
DCG._L0068:
                        .BLOCK    542
                        .LINE     542
                        CBI       00035h, 002h
                        .LINE     543
                        SBI       00035h, 003h
                        .ENDBLOCK 544
                        .BRANCH   20,DCG._L0064
                        JMP       DCG._L0064
DCG._L0069:
                        .LINE     545
                        CPI       _ACCA, 2
                        .BRANCH   3,DCG._L0073
                        BREQ      DCG._L0073
                        .BRANCH   20,DCG._L0072
                        JMP       DCG._L0072
DCG._L0073:
DCG._L0071:
                        .BLOCK    546
                        .LINE     546
                        SBI       00035h, 002h
                        .LINE     547
                        CBI       00035h, 003h
                        .ENDBLOCK 548
                        .BRANCH   20,DCG._L0064
                        JMP       DCG._L0064
DCG._L0072:
                        .BLOCK    549
                        .LINE     550
                        CBI       00035h, 002h
                        .LINE     551
                        CBI       00035h, 003h
                        .ENDBLOCK 552
DCG._L0064:
                        .ENDBLOCK 553
DCG.SetShunt_X:
                        .LINE     553
                        .BRANCH   19
                        RET
                        .ENDFUNC  553

                        .FUNC     CalcRangeI, 0022Bh, 00020h
DCG.CalcRangeI:
                        .RETURNS   0
                        .BLOCK    556
                        .LINE     557
                        LDI       _ACCA, 000h
                        STS       DCG.IRANGE, _ACCA
                        .LINE     558
                        .LOOP
                        LDI       _ACCCLO, DCG.i AND 0FFh
                        LDI       _ACCCHI, DCG.i SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 000h
                        ST        Z, _ACCA
                        LDI       _ACCA, 003h
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
DCG._L0076:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      DCG._L0077
                        CLR       _ACCA
DCG._L0077:
                        TST       _ACCA
                        .BRANCH   3,DCG._L0078
                        BREQ      DCG._L0078
                        .BRANCH   20,DCG._L0075
                        JMP       DCG._L0075
DCG._L0078:
                        .BLOCK    559
                        .LINE     559
                        LDS       _ACCB, DCG.DCAmp
                        LDS       _ACCA, DCG.DCAmp+1
                        LDS       _ACCALO, DCG.DCAmp+2
                        LDS       _ACCAHI, DCG.DCAmp+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, DCG.ImaxArray AND 0FFh
                        LDI       _ACCCHI, DCG.ImaxArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        MOV       _ACCA, DCG.i
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
                        ADIW      _ACCCLO, 01h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      DCG._L0080
                        BRPL      DCG._L0081
                        BRMI      DCG._L0079
DCG._L0081:
                        CLZ
                        CLC
                        RJMP      DCG._L0080
DCG._L0079:
                        CLZ
                        SEC
DCG._L0080:
                        LDI       _ACCA, 0h
                        BREQ      DCG._L0082
                        BRLO      DCG._L0082
                        SER       _ACCA
DCG._L0082:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0085
                        BRNE      DCG._L0085
                        .BRANCH   20,DCG._L0083
                        JMP       DCG._L0083
DCG._L0085:
                        .BLOCK    559
                        .LINE     560
                        CLR       _ACCA
                        LDS       _ACCB, DCG.IRange
                        LDI       _ACCEHI, 003h
                        CP        _ACCB, _ACCEHI
                        BRCC      DCG._L0086
                        INC       _ACCB
                        STS       DCG.IRange, _ACCB
                        SER       _ACCA
DCG._L0086:
                        .ENDBLOCK 561
DCG._L0083:
DCG._L0084:
                        .ENDBLOCK 562
DCG._L0074:
                        .LINE     562
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,DCG._L0075
                        BREQ      DCG._L0075
                        .BRANCH   20,DCG._L0076
                        JMP       DCG._L0076
DCG._L0075:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .ENDBLOCK 564
DCG.CalcRangeI_X:
                        .LINE     564
                        .BRANCH   19
                        RET
                        .ENDFUNC  564

                        .FUNC     SetLevelDAC, 00236h, 00020h
DCG.SetLevelDAC:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 6
                        .BLOCK    570
                        .LINE     572
                        .BRANCH   17,DCG.CALCRANGEI
                        CALL      DCG.CALCRANGEI
                        .LINE     573
                        LDS       _ACCA, DCG.IRange
                        PUSH      _ACCA
                        LDS       _ACCA, DCG.oldIrange
                        POP       _ACCB
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0h
                        BREQ      DCG._L0087
                        SER       _ACCA
DCG._L0087:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0090
                        BRNE      DCG._L0090
                        .BRANCH   20,DCG._L0088
                        JMP       DCG._L0088
DCG._L0090:
                        .BLOCK    573
                        .LINE     574
                        CLI
                        LDI       _ACCA, 0FEH ROLB IntFlag
                        AND       Flags, _ACCA
                        .LINE     575
                        LDI       _ACCA, 00000h SHRB 8
                        LDI       _ACCB, 00000h AND 0FFh
                        STS       DCG.DACRAWI, _ACCB
                        STS       DCG.DACRAWI+1, _ACCA
                        .LINE     576
                        LDI       _ACCA, 1 SHLB IntFlag
                        OR        Flags, _ACCA
                        SEI
                        .LINE     578
                        LDI       _ACCA, 00004h SHRB 8
                        LDI       _ACCB, 00004h AND 0FFh
                        .FRAME  0
                        CALL      SYSTEM.MDELAY
                        .LINE     579
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCA, DCG.IRange
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DCG.SETSHUNT
                        CALL      DCG.SETSHUNT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 580
DCG._L0088:
DCG._L0089:
                        .LINE     581
                        LDS       _ACCA, DCG.IRange
                        STS       DCG.OLDIRANGE, _ACCA
                        .LINE     582
                        LDS       _ACCA, DCG.IRange
                        STS       DCG.IAUTORANGE, _ACCA
                        .LINE     584
                        LDS       _ACCB, DCG.DCAmp
                        LDS       _ACCA, DCG.DCAmp+1
                        LDS       _ACCALO, DCG.DCAmp+2
                        LDS       _ACCAHI, DCG.DCAmp+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DCG.DCAmpMod
                        LDS       _ACCA, DCG.DCAmpMod+1
                        LDS       _ACCALO, DCG.DCAmpMod+2
                        LDS       _ACCAHI, DCG.DCAmpMod+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, DCG.DACLSBIarray AND 0FFh
                        LDI       _ACCCHI, DCG.DACLSBIarray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DCG.IRange
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
                        LD        _ACCB, Z+
                        LD        _ACCA, Z+
                        LD        _ACCALO, Z+
                        LD        _ACCAHI, Z+
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 03Fh
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.AddFloat
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.FloatToLInt
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, DCG.DACIoffsets AND 0FFh
                        LDI       _ACCCHI, DCG.DACIoffsets SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DCG.IRange
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        CALL      SYSTEM._ReadEEp16
                        SBRS      _ACCA, 7
                        RJMP      DCG._L0091
                        LDI       _ACCAHI, 0FFh
                        LDI       _ACCALO, 0FFh
                        RJMP      DCG._L0092
DCG._L0091:
                        CLR       _ACCAHI
                        CLR       _ACCALO
DCG._L0092:
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        ADD       _ACCB, _ACCBLO
                        ADC       _ACCA, _ACCBHI
                        ADC       _ACCALO, _ACCCLO
                        ADC       _ACCAHI, _ACCCHI
                        STD       Y+005h, _ACCAHI
                        STD       Y+004h, _ACCALO
                        STD       Y+003h, _ACCA
                        STD       Y+002h, _ACCB
                        .LINE     585
                        LDD       _ACCAHI, Y+005h
                        LDD       _ACCALO, Y+004h
                        LDD       _ACCA, Y+003h
                        LDD       _ACCB, Y+002h
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DCG.DACmax
                        LDS       _ACCA, DCG.DACmax+1
                        LDS       _ACCALO, DCG.DACmax+2
                        LDS       _ACCAHI, DCG.DACmax+3
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
                        BRNE      DCG._L0093
                        CP        _ACCALO, _ACCCLO
                        BRNE      DCG._L0093
                        CP        _ACCA, _ACCBHI
                        BRNE      DCG._L0093
                        CP        _ACCB, _ACCBLO
DCG._L0093:
                        LDI       _ACCA, 0h
                        BREQ      DCG._L0094
                        BRLO      DCG._L0094
                        SER       _ACCA
DCG._L0094:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0097
                        BRNE      DCG._L0097
                        .BRANCH   20,DCG._L0095
                        JMP       DCG._L0095
DCG._L0097:
                        .BLOCK    585
                        .LINE     586
                        LDS       _ACCB, DCG.DACmax
                        LDS       _ACCA, DCG.DACmax+1
                        LDS       _ACCALO, DCG.DACmax+2
                        LDS       _ACCAHI, DCG.DACmax+3
                        STD       Y+005h, _ACCAHI
                        STD       Y+004h, _ACCALO
                        STD       Y+003h, _ACCA
                        STD       Y+002h, _ACCB
                        .ENDBLOCK 587
DCG._L0095:
DCG._L0096:
                        .LINE     588
                        LDD       _ACCAHI, Y+005h
                        LDD       _ACCALO, Y+004h
                        LDD       _ACCA, Y+003h
                        LDD       _ACCB, Y+002h
                        LDI       _ACCDLO, 080h
                        EOR       _ACCAHI, _ACCDLO
                        CPI       _ACCAHI, 080h
                        BRNE      DCG._L0098
                        CPI       _ACCALO, 000h
                        BRNE      DCG._L0098
                        CPI       _ACCA, 000h
                        BRNE      DCG._L0098
                        CPI       _ACCB, 000h
DCG._L0098:
                        LDI       _ACCA, 0FFh
                        BRLO      DCG._L0099
                        CLR       _ACCA
DCG._L0099:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0102
                        BRNE      DCG._L0102
                        .BRANCH   20,DCG._L0100
                        JMP       DCG._L0100
DCG._L0102:
                        .BLOCK    588
                        .LINE     589
                        LDI       _ACCB, 000000000h AND 0FFh
                        LDI       _ACCA, 000000000h SHRB 8
                        LDI       _ACCALO, 000000000h SHRB 16
                        LDI       _ACCAHI, 000000000h SHRB 24
                        STD       Y+005h, _ACCAHI
                        STD       Y+004h, _ACCALO
                        STD       Y+003h, _ACCA
                        STD       Y+002h, _ACCB
                        .ENDBLOCK 590
DCG._L0100:
DCG._L0101:
                        .LINE     591
                        CLI
                        LDI       _ACCA, 0FEH ROLB IntFlag
                        AND       Flags, _ACCA
                        .LINE     592
                        LDD       _ACCAHI, Y+005h
                        LDD       _ACCALO, Y+004h
                        LDD       _ACCA, Y+003h
                        LDD       _ACCB, Y+002h
                        STS       DCG.DACRAWI, _ACCB
                        STS       DCG.DACRAWI+1, _ACCA
                        .LINE     593
                        LDI       _ACCA, 1 SHLB IntFlag
                        OR        Flags, _ACCA
                        SEI
                        .LINE     597
                        LDI       _ACCA, 000h
                        STS       DCG.URANGE, _ACCA
                        .LINE     598
                        LDS       _ACCB, DCG.DCVolt
                        LDS       _ACCA, DCG.DCVolt+1
                        LDS       _ACCALO, DCG.DCVolt+2
                        LDS       _ACCAHI, DCG.DCVolt+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DCG.Switchpoint
                        LDS       _ACCA, DCG.Switchpoint+1
                        LDS       _ACCALO, DCG.Switchpoint+2
                        LDS       _ACCAHI, DCG.Switchpoint+3
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      DCG._L0104
                        BRPL      DCG._L0105
                        BRMI      DCG._L0103
DCG._L0105:
                        CLZ
                        CLC
                        RJMP      DCG._L0104
DCG._L0103:
                        CLZ
                        SEC
DCG._L0104:
                        LDI       _ACCA, 0h
                        BREQ      DCG._L0106
                        BRLO      DCG._L0106
                        SER       _ACCA
DCG._L0106:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0109
                        BRNE      DCG._L0109
                        .BRANCH   20,DCG._L0107
                        JMP       DCG._L0107
DCG._L0109:
                        .BLOCK    598
                        .LINE     599
                        LDI       _ACCA, 001h
                        STS       DCG.URANGE, _ACCA
                        .ENDBLOCK 600
DCG._L0107:
DCG._L0108:
                        .LINE     601
                        LDS       _ACCA, DCG.URange
                        PUSH      _ACCA
                        LDS       _ACCA, DCG.oldUrange
                        POP       _ACCB
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0h
                        BREQ      DCG._L0110
                        SER       _ACCA
DCG._L0110:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0113
                        BRNE      DCG._L0113
                        .BRANCH   20,DCG._L0111
                        JMP       DCG._L0111
DCG._L0113:
                        .BLOCK    601
                        .LINE     602
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 080h
                        LDI       _ACCAHI, 03Fh
                        STS       DCG.DCVOLTMOD, _ACCB
                        STS       DCG.DCVOLTMOD+1, _ACCA
                        STS       DCG.DCVOLTMOD+2, _ACCALO
                        STS       DCG.DCVOLTMOD+3, _ACCAHI
                        .LINE     603
                        CLI
                        LDI       _ACCA, 0FEH ROLB IntFlag
                        AND       Flags, _ACCA
                        .LINE     604
                        LDI       _ACCA, 00000h SHRB 8
                        LDI       _ACCB, 00000h AND 0FFh
                        STS       DCG.DACRAWUON, _ACCB
                        STS       DCG.DACRAWUON+1, _ACCA
                        .LINE     605
                        LDI       _ACCA, 00000h SHRB 8
                        LDI       _ACCB, 00000h AND 0FFh
                        STS       DCG.DACRAWUOFF, _ACCB
                        STS       DCG.DACRAWUOFF+1, _ACCA
                        .LINE     606
                        LDI       _ACCA, 1 SHLB IntFlag
                        OR        Flags, _ACCA
                        SEI
                        .LINE     607
                        LDI       _ACCA, 00004h SHRB 8
                        LDI       _ACCB, 00004h AND 0FFh
                        .FRAME  0
                        CALL      SYSTEM.MDELAY
                        .LINE     608
                        LDS       _ACCA, DCG.URange
                        TST       _ACCA
                        BREQ      DCG._L0114
                        LDI       _ACCA, 0FFh
DCG._L0114:
                        CLT
                        TST       _ACCA
                        BREQ      DCG._L0115
                        SET
DCG._L0115:
                        IN        _ACCA, 00038h
                        BLD       _ACCA, 005h
                        OUT       00038h, _ACCA
                        .ENDBLOCK 609
DCG._L0111:
DCG._L0112:
                        .LINE     610
                        LDS       _ACCA, DCG.URange
                        STS       DCG.OLDURANGE, _ACCA
                        .LINE     611
                        LDS       _ACCB, DCG.DCVolt
                        LDS       _ACCA, DCG.DCVolt+1
                        LDS       _ACCALO, DCG.DCVolt+2
                        LDS       _ACCAHI, DCG.DCVolt+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DCG.DCVoltMod
                        LDS       _ACCA, DCG.DCVoltMod+1
                        LDS       _ACCALO, DCG.DCVoltMod+2
                        LDS       _ACCAHI, DCG.DCVoltMod+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, DCG.DACLSBUarray AND 0FFh
                        LDI       _ACCCHI, DCG.DACLSBUarray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DCG.Urange
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
                        LD        _ACCB, Z+
                        LD        _ACCA, Z+
                        LD        _ACCALO, Z+
                        LD        _ACCAHI, Z+
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 03Fh
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.AddFloat
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.FloatToLInt
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, DCG.DACUoffsets AND 0FFh
                        LDI       _ACCCHI, DCG.DACUoffsets SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DCG.Urange
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        CALL      SYSTEM._ReadEEp16
                        SBRS      _ACCA, 7
                        RJMP      DCG._L0116
                        LDI       _ACCAHI, 0FFh
                        LDI       _ACCALO, 0FFh
                        RJMP      DCG._L0117
DCG._L0116:
                        CLR       _ACCAHI
                        CLR       _ACCALO
DCG._L0117:
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        ADD       _ACCB, _ACCBLO
                        ADC       _ACCA, _ACCBHI
                        ADC       _ACCALO, _ACCCLO
                        ADC       _ACCAHI, _ACCCHI
                        STD       Y+005h, _ACCAHI
                        STD       Y+004h, _ACCALO
                        STD       Y+003h, _ACCA
                        STD       Y+002h, _ACCB
                        .LINE     612
                        LDD       _ACCAHI, Y+005h
                        LDD       _ACCALO, Y+004h
                        LDD       _ACCA, Y+003h
                        LDD       _ACCB, Y+002h
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DCG.DACmax
                        LDS       _ACCA, DCG.DACmax+1
                        LDS       _ACCALO, DCG.DACmax+2
                        LDS       _ACCAHI, DCG.DACmax+3
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
                        BRNE      DCG._L0118
                        CP        _ACCALO, _ACCCLO
                        BRNE      DCG._L0118
                        CP        _ACCA, _ACCBHI
                        BRNE      DCG._L0118
                        CP        _ACCB, _ACCBLO
DCG._L0118:
                        LDI       _ACCA, 0h
                        BREQ      DCG._L0119
                        BRLO      DCG._L0119
                        SER       _ACCA
DCG._L0119:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0122
                        BRNE      DCG._L0122
                        .BRANCH   20,DCG._L0120
                        JMP       DCG._L0120
DCG._L0122:
                        .BLOCK    612
                        .LINE     613
                        LDS       _ACCB, DCG.DACmax
                        LDS       _ACCA, DCG.DACmax+1
                        LDS       _ACCALO, DCG.DACmax+2
                        LDS       _ACCAHI, DCG.DACmax+3
                        STD       Y+005h, _ACCAHI
                        STD       Y+004h, _ACCALO
                        STD       Y+003h, _ACCA
                        STD       Y+002h, _ACCB
                        .ENDBLOCK 614
DCG._L0120:
DCG._L0121:
                        .LINE     615
                        LDD       _ACCAHI, Y+005h
                        LDD       _ACCALO, Y+004h
                        LDD       _ACCA, Y+003h
                        LDD       _ACCB, Y+002h
                        LDI       _ACCDLO, 080h
                        EOR       _ACCAHI, _ACCDLO
                        CPI       _ACCAHI, 080h
                        BRNE      DCG._L0123
                        CPI       _ACCALO, 000h
                        BRNE      DCG._L0123
                        CPI       _ACCA, 000h
                        BRNE      DCG._L0123
                        CPI       _ACCB, 000h
DCG._L0123:
                        LDI       _ACCA, 0FFh
                        BRLO      DCG._L0124
                        CLR       _ACCA
DCG._L0124:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0127
                        BRNE      DCG._L0127
                        .BRANCH   20,DCG._L0125
                        JMP       DCG._L0125
DCG._L0127:
                        .BLOCK    615
                        .LINE     616
                        LDI       _ACCB, 000000000h AND 0FFh
                        LDI       _ACCA, 000000000h SHRB 8
                        LDI       _ACCALO, 000000000h SHRB 16
                        LDI       _ACCAHI, 000000000h SHRB 24
                        STD       Y+005h, _ACCAHI
                        STD       Y+004h, _ACCALO
                        STD       Y+003h, _ACCA
                        STD       Y+002h, _ACCB
                        .ENDBLOCK 617
DCG._L0125:
DCG._L0126:
                        .LINE     618
                        CLI
                        LDI       _ACCA, 0FEH ROLB IntFlag
                        AND       Flags, _ACCA
                        .LINE     619
                        LDD       _ACCAHI, Y+005h
                        LDD       _ACCALO, Y+004h
                        LDD       _ACCA, Y+003h
                        LDD       _ACCB, Y+002h
                        STS       DCG.DACRAWUON, _ACCB
                        STS       DCG.DACRAWUON+1, _ACCA
                        .LINE     620
                        LDI       _ACCA, 1 SHLB IntFlag
                        OR        Flags, _ACCA
                        SEI
                        .LINE     621
                        LDS       _ACCB, DCG.PWoffTime
                        LDS       _ACCA, DCG.PWoffTime+1
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        CPI       _ACCA, 080h
                        BRNE      DCG._L0128
                        CPI       _ACCB, 000h
DCG._L0128:
                        LDI       _ACCA, 0h
                        BREQ      DCG._L0129
                        BRLO      DCG._L0129
                        SER       _ACCA
DCG._L0129:
                        PUSH      _ACCA
                        LDS       _ACCB, DCG.RipplePercent
                        LDS       _ACCA, DCG.RipplePercent+1
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        CPI       _ACCA, 080h
                        BRNE      DCG._L0130
                        CPI       _ACCB, 000h
DCG._L0130:
                        LDI       _ACCA, 0h
                        BREQ      DCG._L0131
                        BRLO      DCG._L0131
                        SER       _ACCA
DCG._L0131:
                        POP       _ACCB
                        AND       _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   4,DCG._L0134
                        BRNE      DCG._L0134
                        .BRANCH   20,DCG._L0132
                        JMP       DCG._L0132
DCG._L0134:
                        .BLOCK    621
                        .LINE     622
                        LDD       _ACCAHI, Y+005h
                        LDD       _ACCALO, Y+004h
                        LDD       _ACCA, Y+003h
                        LDD       _ACCB, Y+002h
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DCG.RipplePercent
                        LDS       _ACCA, DCG.RipplePercent+1
                        NEG       _ACCB
                        BRNE      DCG._L0135
                        DEC       _ACCA
DCG._L0135:
                        COM       _ACCA
                        SUBI      _ACCB, -00064h AND 0FFh
                        SBCI      _ACCA, -00064h SHRB 8
                        SBRS      _ACCA, 7
                        RJMP      DCG._L0136
                        LDI       _ACCAHI, 0FFh
                        LDI       _ACCALO, 0FFh
                        RJMP      DCG._L0137
DCG._L0136:
                        CLR       _ACCAHI
                        CLR       _ACCALO
DCG._L0137:
                        SET
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.MUL32
                        MOVW      _ACCDLO, _ACCB
                        MOVW      _ACCELO, _ACCALO
                        LDI       _ACCBLO, 000000064h AND 0FFh
                        LDI       _ACCBHI, 000000064h SHRB 8
                        LDI       _ACCCLO, 000000064h SHRB 16
                        LDI       _ACCCHI, 000000064h SHRB 24
                        SET
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.DIV32_R
                        STD       Y+005h, _ACCAHI
                        STD       Y+004h, _ACCALO
                        STD       Y+003h, _ACCA
                        STD       Y+002h, _ACCB
                        .ENDBLOCK 623
DCG._L0132:
DCG._L0133:
                        .LINE     624
                        CLI
                        LDI       _ACCA, 0FEH ROLB IntFlag
                        AND       Flags, _ACCA
                        .LINE     625
                        LDD       _ACCAHI, Y+005h
                        LDD       _ACCALO, Y+004h
                        LDD       _ACCA, Y+003h
                        LDD       _ACCB, Y+002h
                        STS       DCG.DACRAWUOFF, _ACCB
                        STS       DCG.DACRAWUOFF+1, _ACCA
                        .LINE     626
                        LDI       _ACCA, 1 SHLB IntFlag
                        OR        Flags, _ACCA
                        SEI
                        .ENDBLOCK 627
DCG.SetLevelDAC_X:
                        .LINE     627
                        .BRANCH   19
                        RET
                        .ENDFUNC  627

                        .FUNC     GetVoltage, 00275h, 00020h
DCG.GetVoltage:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 4
                        .BLOCK    633
                        .LINE     634
                        LDS       _ACCB, 002FBh
                        CLR       _ACCA
                        SBRC      _ACCB, 001h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DCG._L0140
                        BRNE      DCG._L0140
                        .BRANCH   20,DCG._L0138
                        JMP       DCG._L0138
DCG._L0140:
                        .BLOCK    634
                        .LINE     635
                        CLI
                        LDI       _ACCA, 0FEH ROLB IntFlag
                        AND       Flags, _ACCA
                        .LINE     636
                        LDS       _ACCB, DCG.ADCrawU
                        LDS       _ACCA, DCG.ADCrawU+1
                        CLR       _ACCAHI
                        CLR       _ACCALO
                        STD       Y+003h, _ACCAHI
                        STD       Y+002h, _ACCALO
                        STD       Y+001h, _ACCA
                        STD       Y+000h, _ACCB
                        .LINE     637
                        LDI       _ACCA, 1 SHLB IntFlag
                        OR        Flags, _ACCA
                        SEI
                        .ENDBLOCK 638
                        .BRANCH   20,DCG._L0139
                        JMP       DCG._L0139
DCG._L0138:
                        .BLOCK    638
                        .LINE     639
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 003h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DCG.GETADC10
                        CALL       DCG.GETADC10
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        CLR       _ACCAHI
                        CLR       _ACCALO
                        STD       Y+003h, _ACCAHI
                        STD       Y+002h, _ACCALO
                        STD       Y+001h, _ACCA
                        STD       Y+000h, _ACCB
                        .ENDBLOCK 640
DCG._L0139:
                        .LINE     641
                        LDD       _ACCAHI, Y+003h
                        LDD       _ACCALO, Y+002h
                        LDD       _ACCA, Y+001h
                        LDD       _ACCB, Y+000h
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, DCG.ADCUoffsets AND 0FFh
                        LDI       _ACCCHI, DCG.ADCUoffsets SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DCG.Urange
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        CALL      SYSTEM._ReadEEp16
                        SBRS      _ACCA, 7
                        RJMP      DCG._L0141
                        LDI       _ACCAHI, 0FFh
                        LDI       _ACCALO, 0FFh
                        RJMP      DCG._L0142
DCG._L0141:
                        CLR       _ACCAHI
                        CLR       _ACCALO
DCG._L0142:
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        ADD       _ACCB, _ACCBLO
                        ADC       _ACCA, _ACCBHI
                        ADC       _ACCALO, _ACCCLO
                        ADC       _ACCAHI, _ACCCHI
                        STD       Y+003h, _ACCAHI
                        STD       Y+002h, _ACCALO
                        STD       Y+001h, _ACCA
                        STD       Y+000h, _ACCB
                        .LINE     642
                        LDD       _ACCAHI, Y+003h
                        LDD       _ACCALO, Y+002h
                        LDD       _ACCA, Y+001h
                        LDD       _ACCB, Y+000h
                        CLT
                        BLD       Flags, _ERRFLAG
                        SET
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.LIntToFloat
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, DCG.ADCLSBUarray AND 0FFh
                        LDI       _ACCCHI, DCG.ADCLSBUarray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DCG.Urange
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
                        LD        _ACCB, Z+
                        LD        _ACCA, Z+
                        LD        _ACCALO, Z+
                        LD        _ACCAHI, Z+
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        STS       DCG.PARAM, _ACCB
                        STS       DCG.PARAM+1, _ACCA
                        STS       DCG.PARAM+2, _ACCALO
                        STS       DCG.PARAM+3, _ACCAHI
                        .ENDBLOCK 643
DCG.GetVoltage_X:
                        .LINE     643
                        .BRANCH   19
                        RET
                        .ENDFUNC  643

                        .FUNC     getInputVoltage, 00285h, 00020h
DCG.getInputVoltage:
                        .RETURNS   0
                        .BLOCK    647
                        .LINE     648
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 005h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DCG.GETADC10
                        CALL       DCG.GETADC10
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        CLR       _ACCAHI
                        CLR       _ACCALO
                        CLT
                        BLD       Flags, _SIGN
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.LIntToFloat
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, DCG.Uref AND 0FFh
                        LDI       _ACCCHI, DCG.Uref SHRB 8
                        CALL      SYSTEM._ReadEEp32
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
                        LDI       _ACCBLO, 02Bh
                        LDI       _ACCBHI, 0F6h
                        LDI       _ACCCLO, 097h
                        LDI       _ACCCHI, 03Ch
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat_R
                        STS       DCG.PARAM, _ACCB
                        STS       DCG.PARAM+1, _ACCA
                        STS       DCG.PARAM+2, _ACCALO
                        STS       DCG.PARAM+3, _ACCAHI
                        .ENDBLOCK 649
DCG.getInputVoltage_X:
                        .LINE     649
                        .BRANCH   19
                        RET
                        .ENDFUNC  649

                        .FUNC     GetCurrent, 0028Bh, 00020h
DCG.GetCurrent:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 4
                        .BLOCK    655
                        .LINE     655
                        LDS       _ACCB, 002FBh
                        CLR       _ACCA
                        SBRC      _ACCB, 001h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DCG._L0145
                        BRNE      DCG._L0145
                        .BRANCH   20,DCG._L0143
                        JMP       DCG._L0143
DCG._L0145:
                        .BLOCK    655
                        .LINE     656
                        CLI
                        LDI       _ACCA, 0FEH ROLB IntFlag
                        AND       Flags, _ACCA
                        .LINE     657
                        LDS       _ACCB, DCG.ADCrawI
                        LDS       _ACCA, DCG.ADCrawI+1
                        CLR       _ACCAHI
                        CLR       _ACCALO
                        STD       Y+003h, _ACCAHI
                        STD       Y+002h, _ACCALO
                        STD       Y+001h, _ACCA
                        STD       Y+000h, _ACCB
                        .LINE     658
                        LDI       _ACCA, 1 SHLB IntFlag
                        OR        Flags, _ACCA
                        SEI
                        .ENDBLOCK 659
                        .BRANCH   20,DCG._L0144
                        JMP       DCG._L0144
DCG._L0143:
                        .BLOCK    659
                        .LINE     660
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 004h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DCG.GETADC10
                        CALL       DCG.GETADC10
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        CLR       _ACCAHI
                        CLR       _ACCALO
                        STD       Y+003h, _ACCAHI
                        STD       Y+002h, _ACCALO
                        STD       Y+001h, _ACCA
                        STD       Y+000h, _ACCB
                        .ENDBLOCK 661
DCG._L0144:
                        .LINE     662
                        LDD       _ACCAHI, Y+003h
                        LDD       _ACCALO, Y+002h
                        LDD       _ACCA, Y+001h
                        LDD       _ACCB, Y+000h
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, DCG.ADCIoffsets AND 0FFh
                        LDI       _ACCCHI, DCG.ADCIoffsets SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DCG.Irange
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        CALL      SYSTEM._ReadEEp16
                        SBRS      _ACCA, 7
                        RJMP      DCG._L0146
                        LDI       _ACCAHI, 0FFh
                        LDI       _ACCALO, 0FFh
                        RJMP      DCG._L0147
DCG._L0146:
                        CLR       _ACCAHI
                        CLR       _ACCALO
DCG._L0147:
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        ADD       _ACCB, _ACCBLO
                        ADC       _ACCA, _ACCBHI
                        ADC       _ACCALO, _ACCCLO
                        ADC       _ACCAHI, _ACCCHI
                        STD       Y+003h, _ACCAHI
                        STD       Y+002h, _ACCALO
                        STD       Y+001h, _ACCA
                        STD       Y+000h, _ACCB
                        .LINE     663
                        LDD       _ACCAHI, Y+003h
                        LDD       _ACCALO, Y+002h
                        LDD       _ACCA, Y+001h
                        LDD       _ACCB, Y+000h
                        CLT
                        BLD       Flags, _ERRFLAG
                        SET
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.LIntToFloat
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, DCG.ADCLSBIarray AND 0FFh
                        LDI       _ACCCHI, DCG.ADCLSBIarray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DCG.Irange
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
                        LD        _ACCB, Z+
                        LD        _ACCA, Z+
                        LD        _ACCALO, Z+
                        LD        _ACCAHI, Z+
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        STS       DCG.PARAM, _ACCB
                        STS       DCG.PARAM+1, _ACCA
                        STS       DCG.PARAM+2, _ACCALO
                        STS       DCG.PARAM+3, _ACCAHI
                        .ENDBLOCK 664
DCG.GetCurrent_X:
                        .LINE     664
                        .BRANCH   19
                        RET
                        .ENDFUNC  664

                        .FUNC     IncFacI, 0029Ch, 00020h
DCG.IncFacI:
                        .RETURNS   0
                        .BLOCK    669
                        .LINE     670
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 0C8h
                        LDI       _ACCAHI, 042h
                        STS       DCG.INCCOARSEDIV, _ACCB
                        STS       DCG.INCCOARSEDIV+1, _ACCA
                        STS       DCG.INCCOARSEDIV+2, _ACCALO
                        STS       DCG.INCCOARSEDIV+3, _ACCAHI
                        .LINE     671
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 040h
                        LDI       _ACCALO, 01Ch
                        LDI       _ACCAHI, 046h
                        STS       DCG.INCFINEDIV, _ACCB
                        STS       DCG.INCFINEDIV+1, _ACCA
                        STS       DCG.INCFINEDIV+2, _ACCALO
                        STS       DCG.INCFINEDIV+3, _ACCAHI
                        .LINE     672
                        LDS       _ACCB, DCG.Param
                        LDS       _ACCA, DCG.Param+1
                        LDS       _ACCALO, DCG.Param+2
                        LDS       _ACCAHI, DCG.Param+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 080h
                        LDI       _ACCAHI, 03Fh
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      DCG._L0149
                        BRPL      DCG._L0150
                        BRMI      DCG._L0148
DCG._L0150:
                        CLZ
                        CLC
                        RJMP      DCG._L0149
DCG._L0148:
                        CLZ
                        SEC
DCG._L0149:
                        LDI       _ACCA, 0
                        BRLO      DCG._L0151
                        LDI       _ACCA, 0FFh
DCG._L0151:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0154
                        BRNE      DCG._L0154
                        .BRANCH   20,DCG._L0152
                        JMP       DCG._L0152
DCG._L0154:
                        .BLOCK    672
                        .LINE     673
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 07Ah
                        LDI       _ACCAHI, 044h
                        STS       DCG.INCFINEDIV, _ACCB
                        STS       DCG.INCFINEDIV+1, _ACCA
                        STS       DCG.INCFINEDIV+2, _ACCALO
                        STS       DCG.INCFINEDIV+3, _ACCAHI
                        .ENDBLOCK 674
DCG._L0152:
DCG._L0153:
                        .ENDBLOCK 679
DCG.IncFacI_X:
                        .LINE     679
                        .BRANCH   19
                        RET
                        .ENDFUNC  679

                        .FUNC     IncFacU, 002A9h, 00020h
DCG.IncFacU:
                        .RETURNS   0
                        .BLOCK    682
                        .LINE     683
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 020h
                        LDI       _ACCAHI, 041h
                        STS       DCG.INCCOARSEDIV, _ACCB
                        STS       DCG.INCCOARSEDIV+1, _ACCA
                        STS       DCG.INCCOARSEDIV+2, _ACCALO
                        STS       DCG.INCCOARSEDIV+3, _ACCAHI
                        .LINE     684
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 07Ah
                        LDI       _ACCAHI, 044h
                        STS       DCG.INCFINEDIV, _ACCB
                        STS       DCG.INCFINEDIV+1, _ACCA
                        STS       DCG.INCFINEDIV+2, _ACCALO
                        STS       DCG.INCFINEDIV+3, _ACCAHI
                        .LINE     685
                        LDS       _ACCB, DCG.Param
                        LDS       _ACCA, DCG.Param+1
                        LDS       _ACCALO, DCG.Param+2
                        LDS       _ACCAHI, DCG.Param+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 080h
                        LDI       _ACCAHI, 03Fh
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      DCG._L0156
                        BRPL      DCG._L0157
                        BRMI      DCG._L0155
DCG._L0157:
                        CLZ
                        CLC
                        RJMP      DCG._L0156
DCG._L0155:
                        CLZ
                        SEC
DCG._L0156:
                        LDI       _ACCA, 0
                        BRLO      DCG._L0158
                        LDI       _ACCA, 0FFh
DCG._L0158:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0161
                        BRNE      DCG._L0161
                        .BRANCH   20,DCG._L0159
                        JMP       DCG._L0159
DCG._L0161:
                        .BLOCK    685
                        .LINE     686
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 0C8h
                        LDI       _ACCAHI, 042h
                        STS       DCG.INCFINEDIV, _ACCB
                        STS       DCG.INCFINEDIV+1, _ACCA
                        STS       DCG.INCFINEDIV+2, _ACCALO
                        STS       DCG.INCFINEDIV+3, _ACCAHI
                        .ENDBLOCK 687
DCG._L0159:
DCG._L0160:
                        .ENDBLOCK 692
DCG.IncFacU_X:
                        .LINE     692
                        .BRANCH   19
                        RET
                        .ENDFUNC  692

                        .FUNC     RoundIncParam, 002B6h, 00020h
DCG.RoundIncParam:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 2
                        .BLOCK    696
                        .LINE     697
                        LDS       _ACCA, DCG.IncrFine
                        COM       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DCG._L0164
                        BRNE      DCG._L0164
                        .BRANCH   20,DCG._L0162
                        JMP       DCG._L0162
DCG._L0164:
                        .BLOCK    697
                        .LINE     698
                        LDS       _ACCB, DCG.Param
                        LDS       _ACCA, DCG.Param+1
                        LDS       _ACCALO, DCG.Param+2
                        LDS       _ACCAHI, DCG.Param+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DCG.IncCoarseDiv
                        LDS       _ACCA, DCG.IncCoarseDiv+1
                        LDS       _ACCALO, DCG.IncCoarseDiv+2
                        LDS       _ACCAHI, DCG.IncCoarseDiv+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.RoundFloat
                        STD       Y+001h, _ACCA
                        STD       Y+000h, _ACCB
                        .LINE     699
                        LDD       _ACCB, Y+000h
                        LDD       _ACCA, Y+001h
                        SBRS      _ACCA, 7
                        RJMP      DCG._L0165
                        LDI       _ACCAHI, 0FFh
                        LDI       _ACCALO, 0FFh
                        RJMP      DCG._L0166
DCG._L0165:
                        CLR       _ACCAHI
                        CLR       _ACCALO
DCG._L0166:
                        SET
                        BLD       Flags, _SIGN
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.LIntToFloat
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DCG.IncCoarseDiv
                        LDS       _ACCA, DCG.IncCoarseDiv+1
                        LDS       _ACCALO, DCG.IncCoarseDiv+2
                        LDS       _ACCAHI, DCG.IncCoarseDiv+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat
                        STS       DCG.PARAM, _ACCB
                        STS       DCG.PARAM+1, _ACCA
                        STS       DCG.PARAM+2, _ACCALO
                        STS       DCG.PARAM+3, _ACCAHI
                        .LINE     700
                        LDI       _ACCA, 000h
                        STS       DCG.FIRSTTURN, _ACCA
                        .ENDBLOCK 705
DCG._L0162:
DCG._L0163:
                        .ENDBLOCK 706
DCG.RoundIncParam_X:
                        .LINE     706
                        .BRANCH   19
                        RET
                        .ENDFUNC  706

                        .FUNC     SetAccParam, 002C4h, 00020h
DCG.SetAccParam:
                        .RETURNS   0
                        .BLOCK    709
                        .LINE     710
                        LDS       _ACCA, DCG.IncrFine
                        TST       _ACCA
                        .BRANCH   4,DCG._L0169
                        BRNE      DCG._L0169
                        .BRANCH   20,DCG._L0167
                        JMP       DCG._L0167
DCG._L0169:
                        .BLOCK    710
                        .LINE     711
                        LDS       _ACCB, DCG.IncrAccFloat
                        LDS       _ACCA, DCG.IncrAccFloat+1
                        LDS       _ACCALO, DCG.IncrAccFloat+2
                        LDS       _ACCAHI, DCG.IncrAccFloat+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DCG.IncFineDiv
                        LDS       _ACCA, DCG.IncFineDiv+1
                        LDS       _ACCALO, DCG.IncFineDiv+2
                        LDS       _ACCAHI, DCG.IncFineDiv+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat
                        STS       DCG.INCRACCFLOAT, _ACCB
                        STS       DCG.INCRACCFLOAT+1, _ACCA
                        STS       DCG.INCRACCFLOAT+2, _ACCALO
                        STS       DCG.INCRACCFLOAT+3, _ACCAHI
                        .ENDBLOCK 712
                        .BRANCH   20,DCG._L0168
                        JMP       DCG._L0168
DCG._L0167:
                        .BLOCK    712
                        .LINE     713
                        LDS       _ACCB, DCG.IncrAccFloat
                        LDS       _ACCA, DCG.IncrAccFloat+1
                        LDS       _ACCALO, DCG.IncrAccFloat+2
                        LDS       _ACCAHI, DCG.IncrAccFloat+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DCG.IncCoarseDiv
                        LDS       _ACCA, DCG.IncCoarseDiv+1
                        LDS       _ACCALO, DCG.IncCoarseDiv+2
                        LDS       _ACCAHI, DCG.IncCoarseDiv+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat
                        STS       DCG.INCRACCFLOAT, _ACCB
                        STS       DCG.INCRACCFLOAT+1, _ACCA
                        STS       DCG.INCRACCFLOAT+2, _ACCALO
                        STS       DCG.INCRACCFLOAT+3, _ACCAHI
                        .ENDBLOCK 714
DCG._L0168:
                        .LINE     715
                        LDS       _ACCB, DCG.Param
                        LDS       _ACCA, DCG.Param+1
                        LDS       _ACCALO, DCG.Param+2
                        LDS       _ACCAHI, DCG.Param+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DCG.IncrAccFloat
                        LDS       _ACCA, DCG.IncrAccFloat+1
                        LDS       _ACCALO, DCG.IncrAccFloat+2
                        LDS       _ACCAHI, DCG.IncrAccFloat+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.AddFloat
                        STS       DCG.PARAM, _ACCB
                        STS       DCG.PARAM+1, _ACCA
                        STS       DCG.PARAM+2, _ACCALO
                        STS       DCG.PARAM+3, _ACCAHI
                        .ENDBLOCK 716
DCG.SetAccParam_X:
                        .LINE     716
                        .BRANCH   19
                        RET
                        .ENDFUNC  716

                        .FUNC     SerCRLF, 002D2h, 00020h
DCG.SerCRLF:
                        .RETURNS   0
                        .BLOCK    723
                        .LINE     724
                        LDI       _ACCA, 00Dh
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .LINE     725
                        LDI       _ACCA, 00Ah
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .ENDBLOCK 726
DCG.SerCRLF_X:
                        .LINE     726
                        .BRANCH   19
                        RET
                        .ENDFUNC  726

                        .FUNC     WriteChPrefix, 002D8h, 00020h
DCG.WriteChPrefix:
                        .RETURNS   0
                        .BLOCK    729
                        .LINE     730
                        LDI       _ACCA, 023h
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .LINE     731
                        LDS       _ACCA, DCG.SlaveCh
                        SUBI      _ACCA, -030h AND 0FFh
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .LINE     732
                        LDI       _ACCA, 03Ah
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .LINE     733
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.Serout SHRB 1
                        LDI       _ACCA, SYSTEM.Serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDS       _ACCA, DCG.SubCh
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
                        .LINE     734
                        LDI       _ACCA, 03Dh
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .ENDBLOCK 735
DCG.WriteChPrefix_X:
                        .LINE     735
                        .BRANCH   19
                        RET
                        .ENDFUNC  735

                        .FUNC     WriteSerInp, 002E1h, 00020h
DCG.WriteSerInp:
                        .RETURNS   0
                        .BLOCK    738
                        .LINE     739
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.Serout SHRB 1
                        LDI       _ACCA, SYSTEM.Serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, DCG.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DCG.SerInpStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     740
                        .BRANCH   17,DCG.SERCRLF
                        CALL      DCG.SERCRLF
                        .ENDBLOCK 741
DCG.WriteSerInp_X:
                        .LINE     741
                        .BRANCH   19
                        RET
                        .ENDFUNC  741

                        .FUNC     SerPrompt, 002E7h, 00020h
DCG.SerPrompt:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 2
                        .BLOCK    747
                        .LINE     748
                        LDI       _ACCA, 0FFh
                        STS       DCG.SUBCH, _ACCA
                        .LINE     749
                        .BRANCH   17,DCG.WRITECHPREFIX
                        CALL      DCG.WRITECHPREFIX
                        .LINE     750
                        LDD       _ACCA, Y+002h
                        CPI       _ACCA, 001h
                        LDI       _ACCA, 0h
                        BRNE      DCG._L0170
                        SER       _ACCA
DCG._L0170:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0173
                        BRNE      DCG._L0173
                        .BRANCH   20,DCG._L0171
                        JMP       DCG._L0171
DCG._L0173:
                        .BLOCK    750
                        .LINE     751
                        LDS       _ACCA, DCG.Status
                        PUSH      _ACCA
                        LDS       _ACCA, DCG.ButtonNumber
                        POP       _ACCB
                        OR        _ACCA, _ACCB
                        ORI       _ACCA, 040h
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 752
                        .BRANCH   20,DCG._L0172
                        JMP       DCG._L0172
DCG._L0171:
                        .BLOCK    752
                        .LINE     753
                        LDS       _ACCA, DCG.FaultFlags
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      DCG._L0174
                        SER       _ACCA
DCG._L0174:
                        PUSH      _ACCA
                        LDD       _ACCA, Y+002h
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BRNE      DCG._L0175
                        SER       _ACCA
DCG._L0175:
                        POP       _ACCB
                        OR        _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   4,DCG._L0178
                        BRNE      DCG._L0178
                        .BRANCH   20,DCG._L0176
                        JMP       DCG._L0176
DCG._L0178:
                        .BLOCK    753
                        .LINE     754
                        LDS       _ACCA, DCG.Status
                        PUSH      _ACCA
                        LDS       _ACCA, DCG.FaultFlags
                        POP       _ACCB
                        OR        _ACCA, _ACCB
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 755
                        .BRANCH   20,DCG._L0177
                        JMP       DCG._L0177
DCG._L0176:
                        .BLOCK    755
                        .LINE     756
                        LDS       _ACCA, DCG.Status
                        PUSH      _ACCA
                        LDD       _ACCA, Y+002h
                        POP       _ACCB
                        OR        _ACCA, _ACCB
                        STD       Y+000h, _ACCA
                        .LINE     757
                        LDD       _ACCA, Y+002h
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      DCG._L0179
                        SER       _ACCA
DCG._L0179:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0182
                        BRNE      DCG._L0182
                        .BRANCH   20,DCG._L0180
                        JMP       DCG._L0180
DCG._L0182:
                        .BLOCK    757
                        .LINE     758
                        LDS       _ACCBLO, DCG.ErrCount
                        LDS       _ACCBHI, DCG.ErrCount+1
                        ADIW      _ACCBLO, 1
                        STS       DCG.ErrCount, _ACCBLO
                        STS       DCG.ErrCount+1, _ACCBHI
                        .ENDBLOCK 759
DCG._L0180:
DCG._L0181:
                        .ENDBLOCK 760
DCG._L0177:
                        .ENDBLOCK 761
DCG._L0172:
                        .LINE     762
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.Serout SHRB 1
                        LDI       _ACCA, SYSTEM.Serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDD       _ACCA, Y+002h
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
                        .LINE     763
                        LDS       _ACCA, DCG.FaultFlags
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      DCG._L0183
                        SER       _ACCA
DCG._L0183:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0186
                        BRNE      DCG._L0186
                        .BRANCH   20,DCG._L0184
                        JMP       DCG._L0184
DCG._L0186:
                        .BLOCK    763
                        .LINE     764
                        LDS       _ACCA, DCG.FaultFlags
                        STD       Y+001h, _ACCA
                        .LINE     765
                        .LOOP
                        LDI       _ACCCLO, DCG.i AND 0FFh
                        LDI       _ACCCHI, DCG.i SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 000h
                        ST        Z, _ACCA
                        LDI       _ACCA, 003h
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
DCG._L0189:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      DCG._L0190
                        CLR       _ACCA
DCG._L0190:
                        TST       _ACCA
                        .BRANCH   3,DCG._L0191
                        BREQ      DCG._L0191
                        .BRANCH   20,DCG._L0188
                        JMP       DCG._L0188
DCG._L0191:
                        .BLOCK    766
                        .LINE     766
                        LDD       _ACCA, Y+004h
                        ANDI      _ACCA, 001h
                        CPI       _ACCA, 001h
                        LDI       _ACCA, 0h
                        BRNE      DCG._L0192
                        SER       _ACCA
DCG._L0192:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0195
                        BRNE      DCG._L0195
                        .BRANCH   20,DCG._L0193
                        JMP       DCG._L0193
DCG._L0195:
                        .BLOCK    766
                        .LINE     767
                        LDI       _ACCA, 020h
                        .FRAME  3
                        CALL      SYSTEM.SEROUT
                        .LINE     768
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.serout SHRB 1
                        LDI       _ACCA, SYSTEM.serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  5
                        LDI       _ACCCLO, DCG.FaultStrArr AND 0FFh
                        LDI       _ACCCHI, DCG.FaultStrArr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        MOV       _ACCA, DCG.i
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LDI       _ACCBLO, 0000Bh AND 0FFh
                        LDI       _ACCBHI, 0000Bh SHRB 8
                        CLT
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.MUL16
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        CALL      SYSTEM.StrConst2Str
DCG._L0196:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  3
                        .ENDBLOCK 769
DCG._L0193:
DCG._L0194:
                        .LINE     770
                        LDD       _ACCA, Y+004h
                        LSR       _ACCA
                        STD       Y+004h, _ACCA
                        .ENDBLOCK 771
DCG._L0187:
                        .LINE     771
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,DCG._L0188
                        BREQ      DCG._L0188
                        .BRANCH   20,DCG._L0189
                        JMP       DCG._L0189
DCG._L0188:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .ENDBLOCK 772
                        .BRANCH   20,DCG._L0185
                        JMP       DCG._L0185
DCG._L0184:
                        .BLOCK    772
                        .LINE     773
                        LDI       _ACCA, 020h
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .LINE     774
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.serout SHRB 1
                        LDI       _ACCA, SYSTEM.serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, DCG.ErrStrArr AND 0FFh
                        LDI       _ACCCHI, DCG.ErrStrArr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCA, Y+004h
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LDI       _ACCBLO, 00009h AND 0FFh
                        LDI       _ACCBHI, 00009h SHRB 8
                        CLT
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.MUL16
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        CALL      SYSTEM.StrConst2Str
DCG._L0197:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     775
                        LDS       _ACCB, 003B0h
                        CLR       _ACCA
                        SBRC      _ACCB, 005h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DCG._L0200
                        BRNE      DCG._L0200
                        .BRANCH   20,DCG._L0198
                        JMP       DCG._L0198
DCG._L0200:
                        .BLOCK    776
                        .LINE     776
                        LDI       _ACCA, 020h
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .LINE     777
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.serout SHRB 1
                        LDI       _ACCA, SYSTEM.serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, $St_String4 AND 0FFh
                        LDI       _ACCCHI, $St_String4 SHRB 8
                        CALL      SYSTEM.StrConst2Str
DCG._L0201:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .ENDBLOCK 778
DCG._L0198:
DCG._L0199:
                        .ENDBLOCK 779
DCG._L0185:
                        .LINE     780
                        .BRANCH   17,DCG.SERCRLF
                        CALL      DCG.SERCRLF
                        .ENDBLOCK 781
DCG.SerPrompt_X:
                        .LINE     781
                        .BRANCH   19
                        RET
                        .ENDFUNC  781

                        .FUNC     ParamToStr, 00311h, 00020h
DCG.ParamToStr:
                        .RETURNS   0
                        .BLOCK    786
                        .LINE     787
                        LDS       _ACCB, DCG.Param
                        LDS       _ACCA, DCG.Param+1
                        LDS       _ACCALO, DCG.Param+2
                        LDS       _ACCAHI, DCG.Param+3
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
                        BREQ      DCG._L0203
                        BRPL      DCG._L0204
                        BRMI      DCG._L0202
DCG._L0204:
                        CLZ
                        CLC
                        RJMP      DCG._L0203
DCG._L0202:
                        CLZ
                        SEC
DCG._L0203:
                        LDI       _ACCA, 0FFh
                        BRLO      DCG._L0205
                        BREQ      DCG._L0205
                        CLR       _ACCA
DCG._L0205:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0208
                        BRNE      DCG._L0208
                        .BRANCH   20,DCG._L0206
                        JMP       DCG._L0206
DCG._L0208:
                        .BLOCK    787
                        .LINE     788
                        LDI       _ACCCLO, DCG.ParamStr AND 0FFh
                        LDI       _ACCCHI, DCG.ParamStr SHRB 8
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
                        LDI       _ACCCLO, $St_String5 AND 0FFh
                        LDI       _ACCCHI, $St_String5 SHRB 8
                        CALL      SYSTEM.StrConst2Str
DCG._L0209:
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
                        .ENDBLOCK 789
                        .BRANCH   20,DCG._L0207
                        JMP       DCG._L0207
DCG._L0206:
                        .BLOCK    789
                        .LINE     790
                        LDI       _ACCCLO, DCG.ParamStr AND 0FFh
                        LDI       _ACCCHI, DCG.ParamStr SHRB 8
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
                        LDS       _ACCB, DCG.Param
                        LDS       _ACCA, DCG.Param+1
                        LDS       _ACCALO, DCG.Param+2
                        LDS       _ACCAHI, DCG.Param+3
                        ST        -Y, _ACCAHI
                        ST        -Y, _ACCALO
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  7
                        LDS       _ACCA, DCG.digits
                        ST        -Y, _ACCA
                        .FRAME  8
                        LDS       _ACCA, DCG.nachkomma
                        ST        -Y, _ACCA
                        .FRAME  9
                        LDI       _ACCA, 030h
                        ST        -Y, _ACCA
                        .FRAME  10
                        CALL      SYSTEM.Float2Str
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
                        .ENDBLOCK 791
DCG._L0207:
                        .ENDBLOCK 792
DCG.ParamToStr_X:
                        .LINE     792
                        .BRANCH   19
                        RET
                        .ENDFUNC  792

                        .FUNC     SendTrackCmd, 0031Ah, 00020h
DCG.SendTrackCmd:
                        .RETURNS   0
                        .BLOCK    796
                        .LINE     797
                        LDS       _ACCA, DCG.TrackChannel
                        CPI       _ACCA, 0FFh
                        LDI       _ACCA, 0h
                        BREQ      DCG._L0210
                        SER       _ACCA
DCG._L0210:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0213
                        BRNE      DCG._L0213
                        .BRANCH   20,DCG._L0211
                        JMP       DCG._L0211
DCG._L0213:
                        .BLOCK    797
                        .LINE     798
                        LDS       _ACCA, DCG.TrackChannel
                        SUBI      _ACCA, -030h AND 0FFh
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .LINE     799
                        LDI       _ACCA, 03Ah
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .LINE     800
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.Serout SHRB 1
                        LDI       _ACCA, SYSTEM.Serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCA, 030h
                        CALL      SYSTEM.Char2Str
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     801
                        LDI       _ACCA, 03Dh
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .LINE     802
                        LDS       _ACCB, DCG.DCVolt
                        LDS       _ACCA, DCG.DCVolt+1
                        LDS       _ACCALO, DCG.DCVolt+2
                        LDS       _ACCAHI, DCG.DCVolt+3
                        STS       DCG.PARAM, _ACCB
                        STS       DCG.PARAM+1, _ACCA
                        STS       DCG.PARAM+2, _ACCALO
                        STS       DCG.PARAM+3, _ACCAHI
                        .LINE     803
                        .BRANCH   17,DCG.PARAMTOSTR
                        CALL      DCG.PARAMTOSTR
                        .LINE     804
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.Serout SHRB 1
                        LDI       _ACCA, SYSTEM.Serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, DCG.ParamStr AND 0FFh
                        LDI       _ACCCHI, DCG.ParamStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     805
                        LDI       _ACCA, 021h
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .LINE     806
                        .BRANCH   17,DCG.SERCRLF
                        CALL      DCG.SERCRLF
                        .LINE     807
                        LDS       _ACCA, DCG.TrackChannel
                        SUBI      _ACCA, -030h AND 0FFh
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .LINE     808
                        LDI       _ACCA, 03Ah
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .LINE     809
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.Serout SHRB 1
                        LDI       _ACCA, SYSTEM.Serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCA, 031h
                        CALL      SYSTEM.Char2Str
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     810
                        LDI       _ACCA, 03Dh
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .LINE     811
                        LDS       _ACCB, DCG.DCAmp
                        LDS       _ACCA, DCG.DCAmp+1
                        LDS       _ACCALO, DCG.DCAmp+2
                        LDS       _ACCAHI, DCG.DCAmp+3
                        STS       DCG.PARAM, _ACCB
                        STS       DCG.PARAM+1, _ACCA
                        STS       DCG.PARAM+2, _ACCALO
                        STS       DCG.PARAM+3, _ACCAHI
                        .LINE     812
                        .BRANCH   17,DCG.PARAMTOSTR
                        CALL      DCG.PARAMTOSTR
                        .LINE     813
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.Serout SHRB 1
                        LDI       _ACCA, SYSTEM.Serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, DCG.ParamStr AND 0FFh
                        LDI       _ACCCHI, DCG.ParamStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     814
                        LDI       _ACCA, 021h
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .LINE     815
                        .BRANCH   17,DCG.SERCRLF
                        CALL      DCG.SERCRLF
                        .ENDBLOCK 816
DCG._L0211:
DCG._L0212:
                        .ENDBLOCK 817
DCG.SendTrackCmd_X:
                        .LINE     817
                        .BRANCH   19
                        RET
                        .ENDFUNC  817

                        .FUNC     Setcursor, 00333h, 00020h
DCG.Setcursor:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 1
                        .BLOCK    821
                        .LINE     822
                        LDI       _ACCA, 001h
                        STD       Y+000h, _ACCA
                        .LINE     823
                        LDD       _ACCA, Y+001h
                        TST       _ACCA
                        .BRANCH   4,DCG._L0216
                        BRNE      DCG._L0216
                        .BRANCH   20,DCG._L0214
                        JMP       DCG._L0214
DCG._L0216:
                        .BLOCK    823
                        .LINE     824
                        LDS       _ACCA, DCG.IncrFine
                        TST       _ACCA
                        .BRANCH   4,DCG._L0219
                        BRNE      DCG._L0219
                        .BRANCH   20,DCG._L0217
                        JMP       DCG._L0217
DCG._L0219:
                        .BLOCK    824
                        .LINE     825
                        LDI       _ACCA, 002h
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 826
                        .BRANCH   20,DCG._L0218
                        JMP       DCG._L0218
DCG._L0217:
                        .BLOCK    826
                        .LINE     827
                        LDI       _ACCA, 000h
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 828
DCG._L0218:
                        .ENDBLOCK 829
                        .BRANCH   20,DCG._L0215
                        JMP       DCG._L0215
DCG._L0214:
                        .BLOCK    829
                        .LINE     830
                        LDS       _ACCA, DCG.NoToggle
                        COM       _ACCA
                        PUSH      _ACCA
                        LDS       _ACCA, DCG.Modify
                        CPI       _ACCA, 001h
                        LDI       _ACCA, 0h
                        BRNE      DCG._L0220
                        SER       _ACCA
DCG._L0220:
                        POP       _ACCB
                        AND       _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   4,DCG._L0223
                        BRNE      DCG._L0223
                        .BRANCH   20,DCG._L0221
                        JMP       DCG._L0221
DCG._L0223:
                        .BLOCK    830
                        .LINE     831
                        LDI       _ACCA, 000h
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 832
DCG._L0221:
DCG._L0222:
                        .ENDBLOCK 833
DCG._L0215:
                        .LINE     834
                        LDS       _ACCA, DCG.Modify
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BRNE      DCG._L0224
                        SER       _ACCA
DCG._L0224:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0227
                        BRNE      DCG._L0227
                        .BRANCH   20,DCG._L0225
                        JMP       DCG._L0225
DCG._L0227:
                        .BLOCK    834
                        .LINE     835
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 007h
                        ST        -Y, _ACCA
                        .FRAME  2
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  3
                        .FRAME  0
                        CALL      SYSTEM.LCDXY_M
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     836
                        LDD       _ACCA, Y+000h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .LINE     837
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
                        .ENDBLOCK 838
                        .BRANCH   20,DCG._L0226
                        JMP       DCG._L0226
DCG._L0225:
                        .BLOCK    838
                        .LINE     839
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
                        .LINE     840
                        LDD       _ACCA, Y+000h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .LINE     841
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 007h
                        ST        -Y, _ACCA
                        .FRAME  2
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  3
                        .FRAME  0
                        CALL      SYSTEM.LCDXY_M
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 842
DCG._L0226:
                        .LINE     843
                        LDS       _ACCA, DCG.NoToggle
                        TST       _ACCA
                        .BRANCH   4,DCG._L0230
                        BRNE      DCG._L0230
                        .BRANCH   20,DCG._L0228
                        JMP       DCG._L0228
DCG._L0230:
                        .BLOCK    843
                        .LINE     844
                        LDI       _ACCA, 020h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .ENDBLOCK 845
                        .BRANCH   20,DCG._L0229
                        JMP       DCG._L0229
DCG._L0228:
                        .BLOCK    845
                        .LINE     846
                        LDS       _ACCA, DCG.ToggleTimer
                        CPI       _ACCA, 008h
                        LDI       _ACCA, 0FFh
                        BRLO      DCG._L0231
                        CLR       _ACCA
DCG._L0231:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0234
                        BRNE      DCG._L0234
                        .BRANCH   20,DCG._L0232
                        JMP       DCG._L0232
DCG._L0234:
                        .BLOCK    846
                        .LINE     847
                        LDI       _ACCA, 004h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .ENDBLOCK 848
                        .BRANCH   20,DCG._L0233
                        JMP       DCG._L0233
DCG._L0232:
                        .BLOCK    848
                        .LINE     849
                        LDI       _ACCA, 005h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .ENDBLOCK 850
DCG._L0233:
                        .ENDBLOCK 851
DCG._L0229:
                        .ENDBLOCK 852
DCG.Setcursor_X:
                        .LINE     852
                        .BRANCH   19
                        RET
                        .ENDFUNC  852

                        .FUNC     IstLeistungOnLCD, 00357h, 00020h
DCG.IstLeistungOnLCD:
                        .RETURNS   0
                        .BLOCK    856
                        .LINE     857
                        LDI       _ACCA, 005h
                        STS       DCG.DIGITS, _ACCA
                        .LINE     858
                        LDI       _ACCA, 003h
                        STS       DCG.NACHKOMMA, _ACCA
                        .LINE     859
                        LDS       _ACCB, DCG.CurrVolt
                        LDS       _ACCA, DCG.CurrVolt+1
                        LDS       _ACCALO, DCG.CurrVolt+2
                        LDS       _ACCAHI, DCG.CurrVolt+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DCG.CurrAmp
                        LDS       _ACCA, DCG.CurrAmp+1
                        LDS       _ACCALO, DCG.CurrAmp+2
                        LDS       _ACCAHI, DCG.CurrAmp+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        STS       DCG.PARAM, _ACCB
                        STS       DCG.PARAM+1, _ACCA
                        STS       DCG.PARAM+2, _ACCALO
                        STS       DCG.PARAM+3, _ACCAHI
                        .LINE     860
                        LDS       _ACCB, DCG.Param
                        LDS       _ACCA, DCG.Param+1
                        LDS       _ACCALO, DCG.Param+2
                        LDS       _ACCAHI, DCG.Param+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCB, 06Fh
                        LDI       _ACCA, 012h
                        LDI       _ACCALO, 083h
                        LDI       _ACCAHI, 03Ah
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      DCG._L0236
                        BRPL      DCG._L0237
                        BRMI      DCG._L0235
DCG._L0237:
                        CLZ
                        CLC
                        RJMP      DCG._L0236
DCG._L0235:
                        CLZ
                        SEC
DCG._L0236:
                        LDI       _ACCA, 0FFh
                        BRLO      DCG._L0238
                        CLR       _ACCA
DCG._L0238:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0241
                        BRNE      DCG._L0241
                        .BRANCH   20,DCG._L0239
                        JMP       DCG._L0239
DCG._L0241:
                        .BLOCK    860
                        .LINE     861
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 000h
                        STS       DCG.PARAM, _ACCB
                        STS       DCG.PARAM+1, _ACCA
                        STS       DCG.PARAM+2, _ACCALO
                        STS       DCG.PARAM+3, _ACCAHI
                        .ENDBLOCK 862
DCG._L0239:
DCG._L0240:
                        .LINE     863
                        .BRANCH   17,DCG.PARAMTOSTR
                        CALL      DCG.PARAMTOSTR
                        .LINE     864
                        LDI       _ACCCLO, DCG.ParamStr AND 0FFh
                        LDI       _ACCCHI, DCG.ParamStr SHRB 8
                        LDI       _ACCA, 005h
                        CPI       _ACCA, 40
                        BRCS      DCG._L0242
                        LDI       _ACCA, 40
DCG._L0242:
                        ST        Z+, _ACCA
                        .LINE     865
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
                        .LINE     866
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, DCG.ParamStr AND 0FFh
                        LDI       _ACCCHI, DCG.ParamStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        LDI       _ACCCLO, $St_String6 AND 0FFh
                        LDI       _ACCCHI, $St_String6 SHRB 8
                        CALL      SYSTEM.StrConst2Str
DCG._L0243:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .ENDBLOCK 867
DCG.IstLeistungOnLCD_X:
                        .LINE     867
                        .BRANCH   19
                        RET
                        .ENDFUNC  867

                        .FUNC     CapOnLCD, 00365h, 00020h
DCG.CapOnLCD:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 5
                        .BLOCK    872
                        .LINE     873
                        LDS       _ACCB, DCG.Ah
                        LDS       _ACCA, DCG.Ah+1
                        LDS       _ACCALO, DCG.Ah+2
                        LDS       _ACCAHI, DCG.Ah+3
                        STS       DCG.PARAM, _ACCB
                        STS       DCG.PARAM+1, _ACCA
                        STS       DCG.PARAM+2, _ACCALO
                        STS       DCG.PARAM+3, _ACCAHI
                        .LINE     874
                        LDI       _ACCA, 005h
                        STS       DCG.DIGITS, _ACCA
                        .LINE     875
                        MOVW      _ACCCLO, _FRAMEPTR
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        ADIW      _ACCCLO, 1
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        LDI       _ACCA, 004h
                        ST        -Y, _ACCA
                        LDI       _ACCA, 0FEH ROLB _DEVICE
                        AND       Flags, _ACCA
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        .FRAME  3
                        LDI       _ACCCLO, $St_String7 AND 0FFh
                        LDI       _ACCCHI, $St_String7 SHRB 8
                        CALL      SYSTEM.StrConst2Str
DCG._L0244:
                        LDI       _ACCA, 004h
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
                        .LINE     876
                        LDS       _ACCB, DCG.Ah
                        LDS       _ACCA, DCG.Ah+1
                        LDS       _ACCALO, DCG.Ah+2
                        LDS       _ACCAHI, DCG.Ah+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 0C8h
                        LDI       _ACCAHI, 042h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      DCG._L0246
                        BRPL      DCG._L0247
                        BRMI      DCG._L0245
DCG._L0247:
                        CLZ
                        CLC
                        RJMP      DCG._L0246
DCG._L0245:
                        CLZ
                        SEC
DCG._L0246:
                        LDI       _ACCA, 0FFh
                        BRLO      DCG._L0248
                        CLR       _ACCA
DCG._L0248:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0251
                        BRNE      DCG._L0251
                        .BRANCH   20,DCG._L0249
                        JMP       DCG._L0249
DCG._L0251:
                        .BLOCK    876
                        .LINE     877
                        LDI       _ACCA, 002h
                        STS       DCG.NACHKOMMA, _ACCA
                        .ENDBLOCK 878
DCG._L0249:
DCG._L0250:
                        .LINE     879
                        LDS       _ACCB, DCG.Ah
                        LDS       _ACCA, DCG.Ah+1
                        LDS       _ACCALO, DCG.Ah+2
                        LDS       _ACCAHI, DCG.Ah+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 020h
                        LDI       _ACCAHI, 041h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      DCG._L0253
                        BRPL      DCG._L0254
                        BRMI      DCG._L0252
DCG._L0254:
                        CLZ
                        CLC
                        RJMP      DCG._L0253
DCG._L0252:
                        CLZ
                        SEC
DCG._L0253:
                        LDI       _ACCA, 0FFh
                        BRLO      DCG._L0255
                        CLR       _ACCA
DCG._L0255:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0258
                        BRNE      DCG._L0258
                        .BRANCH   20,DCG._L0256
                        JMP       DCG._L0256
DCG._L0258:
                        .BLOCK    879
                        .LINE     880
                        LDI       _ACCA, 003h
                        STS       DCG.NACHKOMMA, _ACCA
                        .ENDBLOCK 881
DCG._L0256:
DCG._L0257:
                        .LINE     882
                        LDS       _ACCB, DCG.Ah
                        LDS       _ACCA, DCG.Ah+1
                        LDS       _ACCALO, DCG.Ah+2
                        LDS       _ACCAHI, DCG.Ah+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCB, 0CDh
                        LDI       _ACCA, 0CCh
                        LDI       _ACCALO, 0CCh
                        LDI       _ACCAHI, 03Dh
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      DCG._L0260
                        BRPL      DCG._L0261
                        BRMI      DCG._L0259
DCG._L0261:
                        CLZ
                        CLC
                        RJMP      DCG._L0260
DCG._L0259:
                        CLZ
                        SEC
DCG._L0260:
                        LDI       _ACCA, 0FFh
                        BRLO      DCG._L0262
                        CLR       _ACCA
DCG._L0262:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0265
                        BRNE      DCG._L0265
                        .BRANCH   20,DCG._L0263
                        JMP       DCG._L0263
DCG._L0265:
                        .BLOCK    882
                        .LINE     883
                        LDS       _ACCB, DCG.Param
                        LDS       _ACCA, DCG.Param+1
                        LDS       _ACCALO, DCG.Param+2
                        LDS       _ACCAHI, DCG.Param+3
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
                        STS       DCG.PARAM, _ACCB
                        STS       DCG.PARAM+1, _ACCA
                        STS       DCG.PARAM+2, _ACCALO
                        STS       DCG.PARAM+3, _ACCAHI
                        .LINE     884
                        MOVW      _ACCCLO, _FRAMEPTR
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        ADIW      _ACCCLO, 1
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        LDI       _ACCA, 004h
                        ST        -Y, _ACCA
                        LDI       _ACCA, 0FEH ROLB _DEVICE
                        AND       Flags, _ACCA
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        .FRAME  3
                        LDI       _ACCCLO, $St_String8 AND 0FFh
                        LDI       _ACCCHI, $St_String8 SHRB 8
                        CALL      SYSTEM.StrConst2Str
DCG._L0266:
                        LDI       _ACCA, 004h
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
                        .LINE     885
                        LDI       _ACCA, 004h
                        STS       DCG.DIGITS, _ACCA
                        .LINE     886
                        LDI       _ACCA, 001h
                        STS       DCG.NACHKOMMA, _ACCA
                        .ENDBLOCK 887
DCG._L0263:
DCG._L0264:
                        .LINE     888
                        LDS       _ACCB, DCG.Ah
                        LDS       _ACCA, DCG.Ah+1
                        LDS       _ACCALO, DCG.Ah+2
                        LDS       _ACCAHI, DCG.Ah+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCB, 00Ah
                        LDI       _ACCA, 0D7h
                        LDI       _ACCALO, 023h
                        LDI       _ACCAHI, 03Ch
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      DCG._L0268
                        BRPL      DCG._L0269
                        BRMI      DCG._L0267
DCG._L0269:
                        CLZ
                        CLC
                        RJMP      DCG._L0268
DCG._L0267:
                        CLZ
                        SEC
DCG._L0268:
                        LDI       _ACCA, 0FFh
                        BRLO      DCG._L0270
                        CLR       _ACCA
DCG._L0270:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0273
                        BRNE      DCG._L0273
                        .BRANCH   20,DCG._L0271
                        JMP       DCG._L0271
DCG._L0273:
                        .BLOCK    888
                        .LINE     889
                        LDI       _ACCA, 002h
                        STS       DCG.NACHKOMMA, _ACCA
                        .ENDBLOCK 890
DCG._L0271:
DCG._L0272:
                        .LINE     895
                        .BRANCH   17,DCG.PARAMTOSTR
                        CALL      DCG.PARAMTOSTR
                        .LINE     896
                        LDI       _ACCCLO, DCG.ParamStr AND 0FFh
                        LDI       _ACCCHI, DCG.ParamStr SHRB 8
                        LDS       _ACCA, DCG.digits
                        CPI       _ACCA, 40
                        BRCS      DCG._L0274
                        LDI       _ACCA, 40
DCG._L0274:
                        ST        Z+, _ACCA
                        .LINE     897
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
                        .LINE     898
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, DCG.ParamStr AND 0FFh
                        LDI       _ACCCHI, DCG.ParamStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        MOVW      _ACCCLO, _FRAMEPTR
                        ADIW      _ACCCLO, 000002h
                        CALL      SYSTEM.StrVar2Str
                        LDI       _ACCA, 001h
                        CALL      SYSTEM.Char2Str
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     900
                        LDS       _ACCB, DCG.Wh
                        LDS       _ACCA, DCG.Wh+1
                        LDS       _ACCALO, DCG.Wh+2
                        LDS       _ACCAHI, DCG.Wh+3
                        STS       DCG.PARAM, _ACCB
                        STS       DCG.PARAM+1, _ACCA
                        STS       DCG.PARAM+2, _ACCALO
                        STS       DCG.PARAM+3, _ACCAHI
                        .LINE     901
                        LDI       _ACCA, 005h
                        STS       DCG.DIGITS, _ACCA
                        .LINE     902
                        MOVW      _ACCCLO, _FRAMEPTR
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        ADIW      _ACCCLO, 1
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        LDI       _ACCA, 004h
                        ST        -Y, _ACCA
                        LDI       _ACCA, 0FEH ROLB _DEVICE
                        AND       Flags, _ACCA
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        .FRAME  3
                        LDI       _ACCCLO, $St_String9 AND 0FFh
                        LDI       _ACCCHI, $St_String9 SHRB 8
                        CALL      SYSTEM.StrConst2Str
DCG._L0275:
                        LDI       _ACCA, 004h
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
                        .LINE     903
                        LDS       _ACCB, DCG.Wh
                        LDS       _ACCA, DCG.Wh+1
                        LDS       _ACCALO, DCG.Wh+2
                        LDS       _ACCAHI, DCG.Wh+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 0C8h
                        LDI       _ACCAHI, 042h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      DCG._L0277
                        BRPL      DCG._L0278
                        BRMI      DCG._L0276
DCG._L0278:
                        CLZ
                        CLC
                        RJMP      DCG._L0277
DCG._L0276:
                        CLZ
                        SEC
DCG._L0277:
                        LDI       _ACCA, 0FFh
                        BRLO      DCG._L0279
                        CLR       _ACCA
DCG._L0279:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0282
                        BRNE      DCG._L0282
                        .BRANCH   20,DCG._L0280
                        JMP       DCG._L0280
DCG._L0282:
                        .BLOCK    903
                        .LINE     904
                        LDI       _ACCA, 002h
                        STS       DCG.NACHKOMMA, _ACCA
                        .ENDBLOCK 905
DCG._L0280:
DCG._L0281:
                        .LINE     906
                        LDS       _ACCB, DCG.Wh
                        LDS       _ACCA, DCG.Wh+1
                        LDS       _ACCALO, DCG.Wh+2
                        LDS       _ACCAHI, DCG.Wh+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 020h
                        LDI       _ACCAHI, 041h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      DCG._L0284
                        BRPL      DCG._L0285
                        BRMI      DCG._L0283
DCG._L0285:
                        CLZ
                        CLC
                        RJMP      DCG._L0284
DCG._L0283:
                        CLZ
                        SEC
DCG._L0284:
                        LDI       _ACCA, 0FFh
                        BRLO      DCG._L0286
                        CLR       _ACCA
DCG._L0286:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0289
                        BRNE      DCG._L0289
                        .BRANCH   20,DCG._L0287
                        JMP       DCG._L0287
DCG._L0289:
                        .BLOCK    906
                        .LINE     907
                        LDI       _ACCA, 003h
                        STS       DCG.NACHKOMMA, _ACCA
                        .ENDBLOCK 908
DCG._L0287:
DCG._L0288:
                        .LINE     909
                        LDS       _ACCB, DCG.Wh
                        LDS       _ACCA, DCG.Wh+1
                        LDS       _ACCALO, DCG.Wh+2
                        LDS       _ACCAHI, DCG.Wh+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCB, 0CDh
                        LDI       _ACCA, 0CCh
                        LDI       _ACCALO, 0CCh
                        LDI       _ACCAHI, 03Dh
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      DCG._L0291
                        BRPL      DCG._L0292
                        BRMI      DCG._L0290
DCG._L0292:
                        CLZ
                        CLC
                        RJMP      DCG._L0291
DCG._L0290:
                        CLZ
                        SEC
DCG._L0291:
                        LDI       _ACCA, 0FFh
                        BRLO      DCG._L0293
                        CLR       _ACCA
DCG._L0293:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0296
                        BRNE      DCG._L0296
                        .BRANCH   20,DCG._L0294
                        JMP       DCG._L0294
DCG._L0296:
                        .BLOCK    909
                        .LINE     910
                        LDS       _ACCB, DCG.Param
                        LDS       _ACCA, DCG.Param+1
                        LDS       _ACCALO, DCG.Param+2
                        LDS       _ACCAHI, DCG.Param+3
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
                        STS       DCG.PARAM, _ACCB
                        STS       DCG.PARAM+1, _ACCA
                        STS       DCG.PARAM+2, _ACCALO
                        STS       DCG.PARAM+3, _ACCAHI
                        .LINE     911
                        MOVW      _ACCCLO, _FRAMEPTR
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        ADIW      _ACCCLO, 1
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        LDI       _ACCA, 004h
                        ST        -Y, _ACCA
                        LDI       _ACCA, 0FEH ROLB _DEVICE
                        AND       Flags, _ACCA
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        .FRAME  3
                        LDI       _ACCCLO, $St_String10 AND 0FFh
                        LDI       _ACCCHI, $St_String10 SHRB 8
                        CALL      SYSTEM.StrConst2Str
DCG._L0297:
                        LDI       _ACCA, 004h
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
                        .LINE     912
                        LDI       _ACCA, 004h
                        STS       DCG.DIGITS, _ACCA
                        .LINE     913
                        LDI       _ACCA, 001h
                        STS       DCG.NACHKOMMA, _ACCA
                        .ENDBLOCK 914
DCG._L0294:
DCG._L0295:
                        .LINE     915
                        LDS       _ACCB, DCG.Wh
                        LDS       _ACCA, DCG.Wh+1
                        LDS       _ACCALO, DCG.Wh+2
                        LDS       _ACCAHI, DCG.Wh+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCB, 00Ah
                        LDI       _ACCA, 0D7h
                        LDI       _ACCALO, 023h
                        LDI       _ACCAHI, 03Ch
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      DCG._L0299
                        BRPL      DCG._L0300
                        BRMI      DCG._L0298
DCG._L0300:
                        CLZ
                        CLC
                        RJMP      DCG._L0299
DCG._L0298:
                        CLZ
                        SEC
DCG._L0299:
                        LDI       _ACCA, 0FFh
                        BRLO      DCG._L0301
                        CLR       _ACCA
DCG._L0301:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0304
                        BRNE      DCG._L0304
                        .BRANCH   20,DCG._L0302
                        JMP       DCG._L0302
DCG._L0304:
                        .BLOCK    915
                        .LINE     916
                        LDI       _ACCA, 002h
                        STS       DCG.NACHKOMMA, _ACCA
                        .ENDBLOCK 917
DCG._L0302:
DCG._L0303:
                        .LINE     923
                        .BRANCH   17,DCG.PARAMTOSTR
                        CALL      DCG.PARAMTOSTR
                        .LINE     924
                        LDI       _ACCCLO, DCG.ParamStr AND 0FFh
                        LDI       _ACCCHI, DCG.ParamStr SHRB 8
                        LDS       _ACCA, DCG.digits
                        CPI       _ACCA, 40
                        BRCS      DCG._L0305
                        LDI       _ACCA, 40
DCG._L0305:
                        ST        Z+, _ACCA
                        .LINE     925
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
                        .LINE     926
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, DCG.ParamStr AND 0FFh
                        LDI       _ACCCHI, DCG.ParamStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        MOVW      _ACCCLO, _FRAMEPTR
                        ADIW      _ACCCLO, 000002h
                        CALL      SYSTEM.StrVar2Str
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .ENDBLOCK 927
DCG.CapOnLCD_X:
                        .LINE     927
                        .BRANCH   19
                        RET
                        .ENDFUNC  927

                        .FUNC     SpannungOnLCD, 003A3h, 00020h
DCG.SpannungOnLCD:
                        .RETURNS   0
                        .BLOCK    932
                        .LINE     933
                        LDI       _ACCA, 005h
                        STS       DCG.DIGITS, _ACCA
                        .LINE     934
                        LDI       _ACCA, 003h
                        STS       DCG.NACHKOMMA, _ACCA
                        .LINE     935
                        LDS       _ACCB, DCG.Param
                        LDS       _ACCA, DCG.Param+1
                        LDS       _ACCALO, DCG.Param+2
                        LDS       _ACCAHI, DCG.Param+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCB, 0E7h
                        LDI       _ACCA, 0FBh
                        LDI       _ACCALO, 01Fh
                        LDI       _ACCAHI, 041h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      DCG._L0307
                        BRPL      DCG._L0308
                        BRMI      DCG._L0306
DCG._L0308:
                        CLZ
                        CLC
                        RJMP      DCG._L0307
DCG._L0306:
                        CLZ
                        SEC
DCG._L0307:
                        LDI       _ACCA, 0h
                        BREQ      DCG._L0309
                        BRLO      DCG._L0309
                        SER       _ACCA
DCG._L0309:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0312
                        BRNE      DCG._L0312
                        .BRANCH   20,DCG._L0310
                        JMP       DCG._L0310
DCG._L0312:
                        .BLOCK    935
                        .LINE     936
                        LDI       _ACCA, 002h
                        STS       DCG.NACHKOMMA, _ACCA
                        .ENDBLOCK 937
DCG._L0310:
DCG._L0311:
                        .LINE     938
                        .BRANCH   17,DCG.PARAMTOSTR
                        CALL      DCG.PARAMTOSTR
                        .LINE     939
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
                        .LINE     940
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, DCG.ParamStr AND 0FFh
                        LDI       _ACCCHI, DCG.ParamStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     941
                        LDI       _ACCA, 020h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .LINE     942
                        LDI       _ACCA, 056h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .ENDBLOCK 943
DCG.SpannungOnLCD_X:
                        .LINE     943
                        .BRANCH   19
                        RET
                        .ENDFUNC  943

                        .FUNC     IstSpannungOnLCD, 003B1h, 00020h
DCG.IstSpannungOnLCD:
                        .RETURNS   0
                        .BLOCK    946
                        .LINE     947
                        LDS       _ACCA, DCG.NoToggle
                        PUSH      _ACCA
                        CLR       _ACCA
                        SBIC      030h, 004h
                        SER       _ACCA
                        COM       _ACCA
                        POP       _ACCB
                        OR        _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   4,DCG._L0315
                        BRNE      DCG._L0315
                        .BRANCH   20,DCG._L0313
                        JMP       DCG._L0313
DCG._L0315:
                        .BLOCK    947
                        .LINE     948
                        LDS       _ACCB, DCG.DCVoltIntegrated
                        LDS       _ACCA, DCG.DCVoltIntegrated+1
                        LDS       _ACCALO, DCG.DCVoltIntegrated+2
                        LDS       _ACCAHI, DCG.DCVoltIntegrated+3
                        STS       DCG.PARAM, _ACCB
                        STS       DCG.PARAM+1, _ACCA
                        STS       DCG.PARAM+2, _ACCALO
                        STS       DCG.PARAM+3, _ACCAHI
                        .ENDBLOCK 949
                        .BRANCH   20,DCG._L0314
                        JMP       DCG._L0314
DCG._L0313:
                        .BLOCK    949
                        .LINE     950
                        LDS       _ACCA, DCG.ToggleTimer
                        CPI       _ACCA, 008h
                        LDI       _ACCA, 0FFh
                        BRLO      DCG._L0316
                        CLR       _ACCA
DCG._L0316:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0319
                        BRNE      DCG._L0319
                        .BRANCH   20,DCG._L0317
                        JMP       DCG._L0317
DCG._L0319:
                        .BLOCK    950
                        .LINE     951
                        LDS       _ACCB, DCG.DCVolt
                        LDS       _ACCA, DCG.DCVolt+1
                        LDS       _ACCALO, DCG.DCVolt+2
                        LDS       _ACCAHI, DCG.DCVolt+3
                        STS       DCG.PARAM, _ACCB
                        STS       DCG.PARAM+1, _ACCA
                        STS       DCG.PARAM+2, _ACCALO
                        STS       DCG.PARAM+3, _ACCAHI
                        .ENDBLOCK 952
                        .BRANCH   20,DCG._L0318
                        JMP       DCG._L0318
DCG._L0317:
                        .BLOCK    952
                        .LINE     953
                        LDS       _ACCB, DCG.DCVolt
                        LDS       _ACCA, DCG.DCVolt+1
                        LDS       _ACCALO, DCG.DCVolt+2
                        LDS       _ACCAHI, DCG.DCVolt+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DCG.RippleVoltage
                        LDS       _ACCA, DCG.RippleVoltage+1
                        LDS       _ACCALO, DCG.RippleVoltage+2
                        LDS       _ACCAHI, DCG.RippleVoltage+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.SubFloat
                        STS       DCG.PARAM, _ACCB
                        STS       DCG.PARAM+1, _ACCA
                        STS       DCG.PARAM+2, _ACCALO
                        STS       DCG.PARAM+3, _ACCAHI
                        .ENDBLOCK 954
DCG._L0318:
                        .ENDBLOCK 955
DCG._L0314:
                        .LINE     956
                        .BRANCH   17,DCG.SPANNUNGONLCD
                        CALL      DCG.SPANNUNGONLCD
                        .ENDBLOCK 957
DCG.IstSpannungOnLCD_X:
                        .LINE     957
                        .BRANCH   19
                        RET
                        .ENDFUNC  957

                        .FUNC     SollSpannungOnLCD, 003BFh, 00020h
DCG.SollSpannungOnLCD:
                        .RETURNS   0
                        .BLOCK    960
                        .LINE     961
                        LDS       _ACCB, DCG.DCVolt
                        LDS       _ACCA, DCG.DCVolt+1
                        LDS       _ACCALO, DCG.DCVolt+2
                        LDS       _ACCAHI, DCG.DCVolt+3
                        STS       DCG.PARAM, _ACCB
                        STS       DCG.PARAM+1, _ACCA
                        STS       DCG.PARAM+2, _ACCALO
                        STS       DCG.PARAM+3, _ACCAHI
                        .LINE     962
                        .BRANCH   17,DCG.SPANNUNGONLCD
                        CALL      DCG.SPANNUNGONLCD
                        .ENDBLOCK 963
DCG.SollSpannungOnLCD_X:
                        .LINE     963
                        .BRANCH   19
                        RET
                        .ENDFUNC  963

                        .FUNC     Prefix_I, 003C5h, 00020h
DCG.Prefix_I:
                        .RETURNS   0
                        .BLOCK    966
                        .LINE     967
                        LDI       _ACCA, 020h
                        STS       DCG.PREFIX, _ACCA
                        .LINE     968
                        LDS       _ACCB, DCG.Param
                        LDS       _ACCA, DCG.Param+1
                        LDS       _ACCALO, DCG.Param+2
                        LDS       _ACCAHI, DCG.Param+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 080h
                        LDI       _ACCAHI, 03Fh
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      DCG._L0321
                        BRPL      DCG._L0322
                        BRMI      DCG._L0320
DCG._L0322:
                        CLZ
                        CLC
                        RJMP      DCG._L0321
DCG._L0320:
                        CLZ
                        SEC
DCG._L0321:
                        LDI       _ACCA, 0FFh
                        BRLO      DCG._L0323
                        CLR       _ACCA
DCG._L0323:
                        PUSH      _ACCA
                        LDD       _ACCA, Y+000h
                        POP       _ACCB
                        AND       _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   4,DCG._L0326
                        BRNE      DCG._L0326
                        .BRANCH   20,DCG._L0324
                        JMP       DCG._L0324
DCG._L0326:
                        .BLOCK    969
                        .LINE     969
                        LDS       _ACCB, DCG.Param
                        LDS       _ACCA, DCG.Param+1
                        LDS       _ACCALO, DCG.Param+2
                        LDS       _ACCAHI, DCG.Param+3
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
                        STS       DCG.PARAM, _ACCB
                        STS       DCG.PARAM+1, _ACCA
                        STS       DCG.PARAM+2, _ACCALO
                        STS       DCG.PARAM+3, _ACCAHI
                        .LINE     970
                        LDI       _ACCA, 06Dh
                        STS       DCG.PREFIX, _ACCA
                        .ENDBLOCK 971
DCG._L0324:
DCG._L0325:
                        .ENDBLOCK 972
DCG.Prefix_I_X:
                        .LINE     972
                        .BRANCH   19
                        RET
                        .ENDFUNC  972

                        .FUNC     ParamStrOnLCDlower, 003CEh, 00020h
DCG.ParamStrOnLCDlower:
                        .RETURNS   0
                        .BLOCK    975
                        .LINE     976
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
                        .LINE     977
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, DCG.ParamStr AND 0FFh
                        LDI       _ACCCHI, DCG.ParamStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .ENDBLOCK 978
DCG.ParamStrOnLCDlower_X:
                        .LINE     978
                        .BRANCH   19
                        RET
                        .ENDFUNC  978

                        .FUNC     FaultsOnLCD, 003D4h, 00020h
DCG.FaultsOnLCD:
                        .RETURNS   0
                        .BLOCK    981
                        .LINE     982
                        LDS       _ACCA, DCG.DisplayToggle
                        .LINE     983
                        CPI       _ACCA, 0
                        .BRANCH   3,DCG._L0330
                        BREQ      DCG._L0330
                        .BRANCH   20,DCG._L0329
                        JMP       DCG._L0329
DCG._L0330:
                        .BRANCH   20,DCG._L0328
                        JMP       DCG._L0328
DCG._L0329:
                        CPI       _ACCA, 1
                        .BRANCH   3,DCG._L0332
                        BREQ      DCG._L0332
                        .BRANCH   20,DCG._L0331
                        JMP       DCG._L0331
DCG._L0332:
DCG._L0328:
                        .BLOCK    984
                        .LINE     984
                        LDS       _ACCB, 003B1h
                        CLR       _ACCA
                        SBRC      _ACCB, 003h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DCG._L0335
                        BRNE      DCG._L0335
                        .BRANCH   20,DCG._L0333
                        JMP       DCG._L0333
DCG._L0335:
                        .BLOCK    984
                        .LINE     985
                        LDI       _ACCCLO, DCG.ParamStr AND 0FFh
                        LDI       _ACCCHI, DCG.ParamStr SHRB 8
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
                        LDI       _ACCCLO, $St_String11 AND 0FFh
                        LDI       _ACCCHI, $St_String11 SHRB 8
                        CALL      SYSTEM.StrConst2Str
DCG._L0336:
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
                        .LINE     986
                        .BRANCH   17,DCG.PARAMSTRONLCDLOWER
                        CALL      DCG.PARAMSTRONLCDLOWER
                        .ENDBLOCK 987
DCG._L0333:
DCG._L0334:
                        .ENDBLOCK 988
                        .BRANCH   20,DCG._L0327
                        JMP       DCG._L0327
DCG._L0331:
                        .LINE     989
                        CPI       _ACCA, 2
                        .BRANCH   3,DCG._L0339
                        BREQ      DCG._L0339
                        .BRANCH   20,DCG._L0338
                        JMP       DCG._L0338
DCG._L0339:
                        .BRANCH   20,DCG._L0337
                        JMP       DCG._L0337
DCG._L0338:
                        CPI       _ACCA, 3
                        .BRANCH   3,DCG._L0341
                        BREQ      DCG._L0341
                        .BRANCH   20,DCG._L0340
                        JMP       DCG._L0340
DCG._L0341:
DCG._L0337:
                        .BLOCK    990
                        .LINE     990
                        LDS       _ACCB, 003B1h
                        CLR       _ACCA
                        SBRC      _ACCB, 002h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DCG._L0344
                        BRNE      DCG._L0344
                        .BRANCH   20,DCG._L0342
                        JMP       DCG._L0342
DCG._L0344:
                        .BLOCK    990
                        .LINE     991
                        LDI       _ACCCLO, DCG.ParamStr AND 0FFh
                        LDI       _ACCCHI, DCG.ParamStr SHRB 8
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
                        LDI       _ACCCLO, $St_String12 AND 0FFh
                        LDI       _ACCCHI, $St_String12 SHRB 8
                        CALL      SYSTEM.StrConst2Str
DCG._L0345:
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
                        .LINE     992
                        .BRANCH   17,DCG.PARAMSTRONLCDLOWER
                        CALL      DCG.PARAMSTRONLCDLOWER
                        .ENDBLOCK 993
DCG._L0342:
DCG._L0343:
                        .ENDBLOCK 994
                        .BRANCH   20,DCG._L0327
                        JMP       DCG._L0327
DCG._L0340:
                        .LINE     995
                        CPI       _ACCA, 4
                        .BRANCH   3,DCG._L0348
                        BREQ      DCG._L0348
                        .BRANCH   20,DCG._L0347
                        JMP       DCG._L0347
DCG._L0348:
                        .BRANCH   20,DCG._L0346
                        JMP       DCG._L0346
DCG._L0347:
                        CPI       _ACCA, 5
                        .BRANCH   3,DCG._L0350
                        BREQ      DCG._L0350
                        .BRANCH   20,DCG._L0349
                        JMP       DCG._L0349
DCG._L0350:
DCG._L0346:
                        .BLOCK    996
                        .LINE     996
                        LDS       _ACCB, 003B1h
                        CLR       _ACCA
                        SBRC      _ACCB, 001h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DCG._L0353
                        BRNE      DCG._L0353
                        .BRANCH   20,DCG._L0351
                        JMP       DCG._L0351
DCG._L0353:
                        .BLOCK    996
                        .LINE     997
                        LDI       _ACCCLO, DCG.ParamStr AND 0FFh
                        LDI       _ACCCHI, DCG.ParamStr SHRB 8
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
                        LDI       _ACCCLO, $St_String13 AND 0FFh
                        LDI       _ACCCHI, $St_String13 SHRB 8
                        CALL      SYSTEM.StrConst2Str
DCG._L0354:
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
                        .LINE     998
                        .BRANCH   17,DCG.PARAMSTRONLCDLOWER
                        CALL      DCG.PARAMSTRONLCDLOWER
                        .ENDBLOCK 999
DCG._L0351:
DCG._L0352:
                        .ENDBLOCK 1000
                        .BRANCH   20,DCG._L0327
                        JMP       DCG._L0327
DCG._L0349:
DCG._L0327:
                        .LINE     1002
                        LDS       _ACCA, DCG.DisplayToggle
                        INC       _ACCA
                        STS       DCG.DisplayToggle, _ACCA
                        .LINE     1003
                        LDS       _ACCA, DCG.DisplayToggle
                        CPI       _ACCA, 007h
                        LDI       _ACCA, 0h
                        BREQ      DCG._L0355
                        BRLO      DCG._L0355
                        SER       _ACCA
DCG._L0355:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0358
                        BRNE      DCG._L0358
                        .BRANCH   20,DCG._L0356
                        JMP       DCG._L0356
DCG._L0358:
                        .BLOCK    1003
                        .LINE     1004
                        LDI       _ACCA, 000h
                        STS       DCG.DISPLAYTOGGLE, _ACCA
                        .ENDBLOCK 1005
DCG._L0356:
DCG._L0357:
                        .ENDBLOCK 1006
DCG.FaultsOnLCD_X:
                        .LINE     1006
                        .BRANCH   19
                        RET
                        .ENDFUNC  1006

                        .FUNC     StromOnLCD, 003F0h, 00020h
DCG.StromOnLCD:
                        .RETURNS   0
                        .BLOCK    1009
                        .LINE     1010
                        LDI       _ACCA, 005h
                        STS       DCG.DIGITS, _ACCA
                        .LINE     1011
                        LDI       _ACCA, 003h
                        STS       DCG.NACHKOMMA, _ACCA
                        .LINE     1012
                        .BRANCH   17,DCG.PARAMTOSTR
                        CALL      DCG.PARAMTOSTR
                        .LINE     1013
                        LDI       _ACCCLO, DCG.ParamStr AND 0FFh
                        LDI       _ACCCHI, DCG.ParamStr SHRB 8
                        LDI       _ACCA, 005h
                        CPI       _ACCA, 40
                        BRCS      DCG._L0359
                        LDI       _ACCA, 40
DCG._L0359:
                        ST        Z+, _ACCA
                        .LINE     1014
                        .BRANCH   17,DCG.PARAMSTRONLCDLOWER
                        CALL      DCG.PARAMSTRONLCDLOWER
                        .LINE     1015
                        LDS       _ACCA, DCG.Prefix
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .LINE     1016
                        LDI       _ACCA, 041h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .LINE     1017
                        LDS       _ACCA, DCG.NoToggle
                        TST       _ACCA
                        .BRANCH   4,DCG._L0362
                        BRNE      DCG._L0362
                        .BRANCH   20,DCG._L0360
                        JMP       DCG._L0360
DCG._L0362:
                        .BLOCK    1017
                        .LINE     1018
                        LDI       _ACCA, 020h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .ENDBLOCK 1019
                        .BRANCH   20,DCG._L0361
                        JMP       DCG._L0361
DCG._L0360:
                        .BLOCK    1019
                        .LINE     1020
                        LDS       _ACCA, DCG.ToggleTimer
                        CPI       _ACCA, 008h
                        LDI       _ACCA, 0FFh
                        BRLO      DCG._L0363
                        CLR       _ACCA
DCG._L0363:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0366
                        BRNE      DCG._L0366
                        .BRANCH   20,DCG._L0364
                        JMP       DCG._L0364
DCG._L0366:
                        .BLOCK    1020
                        .LINE     1021
                        LDI       _ACCA, 004h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .ENDBLOCK 1022
                        .BRANCH   20,DCG._L0365
                        JMP       DCG._L0365
DCG._L0364:
                        .BLOCK    1022
                        .LINE     1023
                        LDI       _ACCA, 005h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .ENDBLOCK 1024
DCG._L0365:
                        .ENDBLOCK 1025
DCG._L0361:
                        .LINE     1026
                        .BRANCH   17,DCG.FAULTSONLCD
                        CALL      DCG.FAULTSONLCD
                        .ENDBLOCK 1027
DCG.StromOnLCD_X:
                        .LINE     1027
                        .BRANCH   19
                        RET
                        .ENDFUNC  1027

                        .FUNC     IstStromOnLCD, 00405h, 00020h
DCG.IstStromOnLCD:
                        .RETURNS   0
                        .BLOCK    1030
                        .LINE     1031
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DCG.GETCURRENT
                        CALL      DCG.GETCURRENT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1032
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCA, DCG.IRange
                        CPI       _ACCA, 003h
                        LDI       _ACCA, 0h
                        BREQ      DCG._L0367
                        SER       _ACCA
DCG._L0367:
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DCG.PREFIX_I
                        CALL      DCG.PREFIX_I
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1033
                        .BRANCH   17,DCG.STROMONLCD
                        CALL      DCG.STROMONLCD
                        .ENDBLOCK 1034
DCG.IstStromOnLCD_X:
                        .LINE     1034
                        .BRANCH   19
                        RET
                        .ENDFUNC  1034

                        .FUNC     SollStromOnLCD, 0040Ch, 00020h
DCG.SollStromOnLCD:
                        .RETURNS   0
                        .BLOCK    1037
                        .LINE     1038
                        LDS       _ACCB, DCG.DCAmp
                        LDS       _ACCA, DCG.DCAmp+1
                        LDS       _ACCALO, DCG.DCAmp+2
                        LDS       _ACCAHI, DCG.DCAmp+3
                        STS       DCG.PARAM, _ACCB
                        STS       DCG.PARAM+1, _ACCA
                        STS       DCG.PARAM+2, _ACCALO
                        STS       DCG.PARAM+3, _ACCAHI
                        .LINE     1039
                        .BRANCH   17,DCG.CALCRANGEI
                        CALL      DCG.CALCRANGEI
                        .LINE     1040
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 0FFh
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DCG.PREFIX_I
                        CALL      DCG.PREFIX_I
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1041
                        .BRANCH   17,DCG.STROMONLCD
                        CALL      DCG.STROMONLCD
                        .ENDBLOCK 1042
DCG.SollStromOnLCD_X:
                        .LINE     1042
                        .BRANCH   19
                        RET
                        .ENDFUNC  1042

                        .FUNC     IntegerOnLCD, 00414h, 00020h
DCG.IntegerOnLCD:
                        .RETURNS   0
                        .BLOCK    1045
                        .LINE     1046
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDS       _ACCB, DCG.ParamInt
                        LDS       _ACCA, DCG.ParamInt+1
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  4
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        LDI       _ACCA, 020h
                        ST        -Y, _ACCA
                        .FRAME  7
                        SET
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.Int2Str
                        .FRAME  2
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .ENDBLOCK 1047
DCG.IntegerOnLCD_X:
                        .LINE     1047
                        .BRANCH   19
                        RET
                        .ENDFUNC  1047

                        .FUNC     OptionsOnLCD, 00419h, 00020h
DCG.OptionsOnLCD:
                        .RETURNS   0
                        .BLOCK    1050
                        .LINE     1051
                        LDI       _ACCCLO, DCG.ParamStr AND 0FFh
                        LDI       _ACCCHI, DCG.ParamStr SHRB 8
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
                        LDI       _ACCCLO, DCG.MenuStrArr AND 0FFh
                        LDI       _ACCCHI, DCG.MenuStrArr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DCG.Modify
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LDI       _ACCBLO, 00009h AND 0FFh
                        LDI       _ACCBHI, 00009h SHRB 8
                        CLT
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.MUL16
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        CALL      SYSTEM.StrConst2Str
DCG._L0368:
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
                        .LINE     1052
                        .BRANCH   17,DCG.PARAMSTRONLCDLOWER
                        CALL      DCG.PARAMSTRONLCDLOWER
                        .LINE     1053
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
                        .LINE     1054
                        LDI       _ACCA, 000h
                        .FRAME  0
                        CALL      SYSTEM.LCDCLREOL_M
                        .LINE     1055
                        LDS       _ACCA, DCG.Modify
                        .LINE     1057
                        CPI       _ACCA, 6
                        .BRANCH   3,DCG._L0372
                        BREQ      DCG._L0372
                        .BRANCH   20,DCG._L0371
                        JMP       DCG._L0371
DCG._L0372:
DCG._L0370:
                        .BLOCK    1058
                        .LINE     1058
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DCG.CAPONLCD
                        CALL      DCG.CAPONLCD
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 1059
                        .BRANCH   20,DCG._L0369
                        JMP       DCG._L0369
DCG._L0371:
                        .LINE     1060
                        CPI       _ACCA, 7
                        .BRANCH   3,DCG._L0375
                        BREQ      DCG._L0375
                        .BRANCH   20,DCG._L0374
                        JMP       DCG._L0374
DCG._L0375:
DCG._L0373:
                        .BLOCK    1061
                        .LINE     1061
                        .BRANCH   17,DCG.ISTLEISTUNGONLCD
                        CALL      DCG.ISTLEISTUNGONLCD
                        .ENDBLOCK 1062
                        .BRANCH   20,DCG._L0369
                        JMP       DCG._L0369
DCG._L0374:
                        .LINE     1063
                        CPI       _ACCA, 3
                        .BRANCH   3,DCG._L0378
                        BREQ      DCG._L0378
                        .BRANCH   20,DCG._L0377
                        JMP       DCG._L0377
DCG._L0378:
DCG._L0376:
                        .BLOCK    1064
                        .LINE     1064
                        LDS       _ACCB, DCG.PWonTime
                        LDS       _ACCA, DCG.PWonTime+1
                        STS       DCG.PARAMINT, _ACCB
                        STS       DCG.PARAMINT+1, _ACCA
                        .LINE     1065
                        .BRANCH   17,DCG.INTEGERONLCD
                        CALL      DCG.INTEGERONLCD
                        .ENDBLOCK 1066
                        .BRANCH   20,DCG._L0369
                        JMP       DCG._L0369
DCG._L0377:
                        .LINE     1067
                        CPI       _ACCA, 4
                        .BRANCH   3,DCG._L0381
                        BREQ      DCG._L0381
                        .BRANCH   20,DCG._L0380
                        JMP       DCG._L0380
DCG._L0381:
DCG._L0379:
                        .BLOCK    1068
                        .LINE     1068
                        LDS       _ACCB, DCG.PWoffTime
                        LDS       _ACCA, DCG.PWoffTime+1
                        STS       DCG.PARAMINT, _ACCB
                        STS       DCG.PARAMINT+1, _ACCA
                        .LINE     1069
                        .BRANCH   17,DCG.INTEGERONLCD
                        CALL      DCG.INTEGERONLCD
                        .ENDBLOCK 1070
                        .BRANCH   20,DCG._L0369
                        JMP       DCG._L0369
DCG._L0380:
                        .LINE     1071
                        CPI       _ACCA, 2
                        .BRANCH   3,DCG._L0384
                        BREQ      DCG._L0384
                        .BRANCH   20,DCG._L0383
                        JMP       DCG._L0383
DCG._L0384:
DCG._L0382:
                        .BLOCK    1072
                        .LINE     1072
                        LDS       _ACCB, DCG.RipplePercent
                        LDS       _ACCA, DCG.RipplePercent+1
                        STS       DCG.PARAMINT, _ACCB
                        STS       DCG.PARAMINT+1, _ACCA
                        .LINE     1073
                        .BRANCH   17,DCG.INTEGERONLCD
                        CALL      DCG.INTEGERONLCD
                        .ENDBLOCK 1074
                        .BRANCH   20,DCG._L0369
                        JMP       DCG._L0369
DCG._L0383:
                        .LINE     1075
                        CPI       _ACCA, 5
                        .BRANCH   3,DCG._L0387
                        BREQ      DCG._L0387
                        .BRANCH   20,DCG._L0386
                        JMP       DCG._L0386
DCG._L0387:
DCG._L0385:
                        .BLOCK    1076
                        .LINE     1076
                        LDS       _ACCA, DCG.TrackChannel
                        CPI       _ACCA, 0FFh
                        LDI       _ACCA, 0h
                        BRNE      DCG._L0388
                        SER       _ACCA
DCG._L0388:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0391
                        BRNE      DCG._L0391
                        .BRANCH   20,DCG._L0389
                        JMP       DCG._L0389
DCG._L0391:
                        .BLOCK    1076
                        .LINE     1077
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, $St_String14 AND 0FFh
                        LDI       _ACCCHI, $St_String14 SHRB 8
                        CALL      SYSTEM.StrConst2Str
DCG._L0392:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .ENDBLOCK 1078
                        .BRANCH   20,DCG._L0390
                        JMP       DCG._L0390
DCG._L0389:
                        .BLOCK    1078
                        .LINE     1079
                        LDS       _ACCA, DCG.TrackChannel
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        STS       DCG.PARAMINT, _ACCB
                        STS       DCG.PARAMINT+1, _ACCA
                        .LINE     1080
                        .BRANCH   17,DCG.INTEGERONLCD
                        CALL      DCG.INTEGERONLCD
                        .ENDBLOCK 1081
DCG._L0390:
                        .ENDBLOCK 1082
                        .BRANCH   20,DCG._L0369
                        JMP       DCG._L0369
DCG._L0386:
DCG._L0369:
                        .LINE     1084
                        LDS       _ACCA, DCG.modify
                        CPI       _ACCA, 006h
                        LDI       _ACCA, 0FFh
                        BRLO      DCG._L0393
                        CLR       _ACCA
DCG._L0393:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0396
                        BRNE      DCG._L0396
                        .BRANCH   20,DCG._L0394
                        JMP       DCG._L0394
DCG._L0396:
                        .BLOCK    1084
                        .LINE     1085
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
                        .LINE     1086
                        LDI       _ACCA, 000h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .ENDBLOCK 1087
DCG._L0394:
DCG._L0395:
                        .LINE     1089
                        .BRANCH   17,DCG.FAULTSONLCD
                        CALL      DCG.FAULTSONLCD
                        .ENDBLOCK 1090
DCG.OptionsOnLCD_X:
                        .LINE     1090
                        .BRANCH   19
                        RET
                        .ENDFUNC  1090

                        .FUNC     WerteOnLCD, 00444h, 00020h
DCG.WerteOnLCD:
                        .RETURNS   0
                        .BLOCK    1093
                        .LINE     1094
                        LDS       _ACCA, DCG.Modify
                        CPI       _ACCA, 001h
                        LDI       _ACCA, 0h
                        BREQ      DCG._L0397
                        BRLO      DCG._L0397
                        SER       _ACCA
DCG._L0397:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0400
                        BRNE      DCG._L0400
                        .BRANCH   20,DCG._L0398
                        JMP       DCG._L0398
DCG._L0400:
                        .BLOCK    1094
                        .LINE     1095
                        .BRANCH   17,DCG.OPTIONSONLCD
                        CALL      DCG.OPTIONSONLCD
                        .ENDBLOCK 1096
                        .BRANCH   20,DCG._L0399
                        JMP       DCG._L0399
DCG._L0398:
                        .BLOCK    1096
                        .LINE     1097
                        .BRANCH   17,DCG.SOLLSPANNUNGONLCD
                        CALL      DCG.SOLLSPANNUNGONLCD
                        .LINE     1098
                        .BRANCH   17,DCG.SOLLSTROMONLCD
                        CALL      DCG.SOLLSTROMONLCD
                        .LINE     1099
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 0FFh
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DCG.SETCURSOR
                        CALL      DCG.SETCURSOR
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 1100
DCG._L0399:
                        .LINE     1101
                        .BRANCH   17,DCG.FAULTSONLCD
                        CALL      DCG.FAULTSONLCD
                        .ENDBLOCK 1102
DCG.WerteOnLCD_X:
                        .LINE     1102
                        .BRANCH   19
                        RET
                        .ENDFUNC  1102

                        .FUNC     WriteParamSer, 00450h, 00020h
DCG.WriteParamSer:
                        .RETURNS   0
                        .BLOCK    1105
                        .LINE     1106
                        .BRANCH   17,DCG.PARAMTOSTR
                        CALL      DCG.PARAMTOSTR
                        .LINE     1107
                        .BRANCH   17,DCG.WRITECHPREFIX
                        CALL      DCG.WRITECHPREFIX
                        .LINE     1108
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.serout SHRB 1
                        LDI       _ACCA, SYSTEM.serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, DCG.ParamStr AND 0FFh
                        LDI       _ACCCHI, DCG.ParamStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     1109
                        .BRANCH   17,DCG.SERCRLF
                        CALL      DCG.SERCRLF
                        .ENDBLOCK 1110
DCG.WriteParamSer_X:
                        .LINE     1110
                        .BRANCH   19
                        RET
                        .ENDFUNC  1110

                        .FUNC     WriteParamIntSer, 00458h, 00020h
DCG.WriteParamIntSer:
                        .RETURNS   0
                        .BLOCK    1113
                        .LINE     1114
                        LDI       _ACCCLO, DCG.ParamStr AND 0FFh
                        LDI       _ACCCHI, DCG.ParamStr SHRB 8
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
                        LDS       _ACCB, DCG.ParamInt
                        LDS       _ACCA, DCG.ParamInt+1
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
                        .LINE     1115
                        LDI       _ACCCLO, DCG.ParamStr AND 0FFh
                        LDI       _ACCCHI, DCG.ParamStr SHRB 8
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
                        LDI       _ACCCLO, DCG.ParamStr AND 0FFh
                        LDI       _ACCCHI, DCG.ParamStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LD        _ACCB, Z+
                        LDI       _ACCALO, 1
DCG._L0401:
                        TST       _ACCB
                        BREQ      DCG._L0402
                        LD        _ACCA, Z+
                        CPI       _ACCA, 20h
                        BRNE      DCG._L0402
                        INC       _ACCALO
                        DEC       _ACCB
                        RJMP      DCG._L0401
DCG._L0402:
                        MOV       _ACCA, _ACCB
                        CLR       _ACCAHI
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCAHI
                        SBIW      _ACCCLO, 02h
DCG._L0403:
                        TST       _ACCB
                        BREQ      DCG._L0404
                        LD        _ACCA, Z
                        SBIW      _ACCCLO, 01h
                        CPI       _ACCA, 20h
                        BRNE      DCG._L0404
                        DEC       _ACCB
                        RJMP      DCG._L0403
DCG._L0404:
                        MOV       _ACCA, _ACCB
                        PUSH      _ACCALO
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
                        .LINE     1116
                        .BRANCH   17,DCG.WRITECHPREFIX
                        CALL      DCG.WRITECHPREFIX
                        .LINE     1117
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.Serout SHRB 1
                        LDI       _ACCA, SYSTEM.Serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, DCG.ParamStr AND 0FFh
                        LDI       _ACCCHI, DCG.ParamStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     1118
                        .BRANCH   17,DCG.SERCRLF
                        CALL      DCG.SERCRLF
                        .ENDBLOCK 1119
DCG.WriteParamIntSer_X:
                        .LINE     1119
                        .BRANCH   19
                        RET
                        .ENDFUNC  1119

                        .FUNC     CheckLimits, 00461h, 00020h
DCG.CheckLimits:
                        .RETURNS   0
                        .BLOCK    1122
                        .LINE     1123
                        LDI       _ACCA, 000h
                        STS       DCG.CHECKLIMITERR, _ACCA
                        .LINE     1124
                        LDS       _ACCB, DCG.DCVolt
                        LDS       _ACCA, DCG.DCVolt+1
                        LDS       _ACCALO, DCG.DCVolt+2
                        LDS       _ACCAHI, DCG.DCVolt+3
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
                        BREQ      DCG._L0406
                        BRPL      DCG._L0407
                        BRMI      DCG._L0405
DCG._L0407:
                        CLZ
                        CLC
                        RJMP      DCG._L0406
DCG._L0405:
                        CLZ
                        SEC
DCG._L0406:
                        LDI       _ACCA, 0FFh
                        BRLO      DCG._L0408
                        CLR       _ACCA
DCG._L0408:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0411
                        BRNE      DCG._L0411
                        .BRANCH   20,DCG._L0409
                        JMP       DCG._L0409
DCG._L0411:
                        .BLOCK    1124
                        .LINE     1125
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 000h
                        STS       DCG.DCVOLT, _ACCB
                        STS       DCG.DCVOLT+1, _ACCA
                        STS       DCG.DCVOLT+2, _ACCALO
                        STS       DCG.DCVOLT+3, _ACCAHI
                        .LINE     1126
                        LDI       _ACCA, 005h
                        STS       DCG.CHECKLIMITERR, _ACCA
                        .ENDBLOCK 1127
DCG._L0409:
DCG._L0410:
                        .LINE     1128
                        LDS       _ACCB, DCG.DCVolt
                        LDS       _ACCA, DCG.DCVolt+1
                        LDS       _ACCALO, DCG.DCVolt+2
                        LDS       _ACCAHI, DCG.DCVolt+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, DCG.Umax AND 0FFh
                        LDI       _ACCCHI, DCG.Umax SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      DCG._L0413
                        BRPL      DCG._L0414
                        BRMI      DCG._L0412
DCG._L0414:
                        CLZ
                        CLC
                        RJMP      DCG._L0413
DCG._L0412:
                        CLZ
                        SEC
DCG._L0413:
                        LDI       _ACCA, 0h
                        BREQ      DCG._L0415
                        BRLO      DCG._L0415
                        SER       _ACCA
DCG._L0415:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0418
                        BRNE      DCG._L0418
                        .BRANCH   20,DCG._L0416
                        JMP       DCG._L0416
DCG._L0418:
                        .BLOCK    1128
                        .LINE     1129
                        LDI       _ACCCLO, DCG.Umax AND 0FFh
                        LDI       _ACCCHI, DCG.Umax SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        STS       DCG.DCVOLT, _ACCB
                        STS       DCG.DCVOLT+1, _ACCA
                        STS       DCG.DCVOLT+2, _ACCALO
                        STS       DCG.DCVOLT+3, _ACCAHI
                        .LINE     1130
                        LDI       _ACCA, 005h
                        STS       DCG.CHECKLIMITERR, _ACCA
                        .ENDBLOCK 1131
DCG._L0416:
DCG._L0417:
                        .LINE     1132
                        LDS       _ACCB, DCG.DCAmp
                        LDS       _ACCA, DCG.DCAmp+1
                        LDS       _ACCALO, DCG.DCAmp+2
                        LDS       _ACCAHI, DCG.DCAmp+3
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
                        BREQ      DCG._L0420
                        BRPL      DCG._L0421
                        BRMI      DCG._L0419
DCG._L0421:
                        CLZ
                        CLC
                        RJMP      DCG._L0420
DCG._L0419:
                        CLZ
                        SEC
DCG._L0420:
                        LDI       _ACCA, 0FFh
                        BRLO      DCG._L0422
                        CLR       _ACCA
DCG._L0422:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0425
                        BRNE      DCG._L0425
                        .BRANCH   20,DCG._L0423
                        JMP       DCG._L0423
DCG._L0425:
                        .BLOCK    1132
                        .LINE     1133
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 000h
                        STS       DCG.DCAMP, _ACCB
                        STS       DCG.DCAMP+1, _ACCA
                        STS       DCG.DCAMP+2, _ACCALO
                        STS       DCG.DCAMP+3, _ACCAHI
                        .LINE     1134
                        LDI       _ACCA, 005h
                        STS       DCG.CHECKLIMITERR, _ACCA
                        .ENDBLOCK 1135
DCG._L0423:
DCG._L0424:
                        .LINE     1136
                        LDS       _ACCB, DCG.DCAmp
                        LDS       _ACCA, DCG.DCAmp+1
                        LDS       _ACCALO, DCG.DCAmp+2
                        LDS       _ACCAHI, DCG.DCAmp+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, DCG.Imax AND 0FFh
                        LDI       _ACCCHI, DCG.Imax SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      DCG._L0427
                        BRPL      DCG._L0428
                        BRMI      DCG._L0426
DCG._L0428:
                        CLZ
                        CLC
                        RJMP      DCG._L0427
DCG._L0426:
                        CLZ
                        SEC
DCG._L0427:
                        LDI       _ACCA, 0h
                        BREQ      DCG._L0429
                        BRLO      DCG._L0429
                        SER       _ACCA
DCG._L0429:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0432
                        BRNE      DCG._L0432
                        .BRANCH   20,DCG._L0430
                        JMP       DCG._L0430
DCG._L0432:
                        .BLOCK    1136
                        .LINE     1137
                        LDI       _ACCCLO, DCG.Imax AND 0FFh
                        LDI       _ACCCHI, DCG.Imax SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        STS       DCG.DCAMP, _ACCB
                        STS       DCG.DCAMP+1, _ACCA
                        STS       DCG.DCAMP+2, _ACCALO
                        STS       DCG.DCAMP+3, _ACCAHI
                        .LINE     1138
                        LDI       _ACCA, 005h
                        STS       DCG.CHECKLIMITERR, _ACCA
                        .ENDBLOCK 1139
DCG._L0430:
DCG._L0431:
                        .LINE     1140
                        LDS       _ACCB, DCG.PWonTime
                        LDS       _ACCA, DCG.PWonTime+1
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        CPI       _ACCA, 080h
                        BRNE      DCG._L0433
                        CPI       _ACCB, 002h
DCG._L0433:
                        LDI       _ACCA, 0FFh
                        BRLO      DCG._L0434
                        CLR       _ACCA
DCG._L0434:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0437
                        BRNE      DCG._L0437
                        .BRANCH   20,DCG._L0435
                        JMP       DCG._L0435
DCG._L0437:
                        .BLOCK    1140
                        .LINE     1141
                        LDI       _ACCA, 00002h SHRB 8
                        LDI       _ACCB, 00002h AND 0FFh
                        STS       DCG.PWONTIME, _ACCB
                        STS       DCG.PWONTIME+1, _ACCA
                        .LINE     1142
                        LDI       _ACCA, 005h
                        STS       DCG.CHECKLIMITERR, _ACCA
                        .ENDBLOCK 1143
DCG._L0435:
DCG._L0436:
                        .LINE     1144
                        LDS       _ACCB, DCG.PWoffTime
                        LDS       _ACCA, DCG.PWoffTime+1
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        CPI       _ACCA, 080h
                        BRNE      DCG._L0438
                        CPI       _ACCB, 000h
DCG._L0438:
                        LDI       _ACCA, 0FFh
                        BRLO      DCG._L0439
                        CLR       _ACCA
DCG._L0439:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0442
                        BRNE      DCG._L0442
                        .BRANCH   20,DCG._L0440
                        JMP       DCG._L0440
DCG._L0442:
                        .BLOCK    1144
                        .LINE     1145
                        LDI       _ACCA, 00000h SHRB 8
                        LDI       _ACCB, 00000h AND 0FFh
                        STS       DCG.PWOFFTIME, _ACCB
                        STS       DCG.PWOFFTIME+1, _ACCA
                        .LINE     1146
                        LDI       _ACCA, 005h
                        STS       DCG.CHECKLIMITERR, _ACCA
                        .ENDBLOCK 1147
DCG._L0440:
DCG._L0441:
                        .LINE     1148
                        LDS       _ACCB, DCG.RipplePercent
                        LDS       _ACCA, DCG.RipplePercent+1
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        CPI       _ACCA, 080h
                        BRNE      DCG._L0443
                        CPI       _ACCB, 000h
DCG._L0443:
                        LDI       _ACCA, 0FFh
                        BRLO      DCG._L0444
                        CLR       _ACCA
DCG._L0444:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0447
                        BRNE      DCG._L0447
                        .BRANCH   20,DCG._L0445
                        JMP       DCG._L0445
DCG._L0447:
                        .BLOCK    1148
                        .LINE     1149
                        LDI       _ACCA, 00000h SHRB 8
                        LDI       _ACCB, 00000h AND 0FFh
                        STS       DCG.RIPPLEPERCENT, _ACCB
                        STS       DCG.RIPPLEPERCENT+1, _ACCA
                        .LINE     1150
                        LDI       _ACCA, 005h
                        STS       DCG.CHECKLIMITERR, _ACCA
                        .ENDBLOCK 1151
DCG._L0445:
DCG._L0446:
                        .LINE     1152
                        LDS       _ACCB, DCG.RipplePercent
                        LDS       _ACCA, DCG.RipplePercent+1
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        CPI       _ACCA, 080h
                        BRNE      DCG._L0448
                        CPI       _ACCB, 064h
DCG._L0448:
                        LDI       _ACCA, 0h
                        BREQ      DCG._L0449
                        BRLO      DCG._L0449
                        SER       _ACCA
DCG._L0449:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0452
                        BRNE      DCG._L0452
                        .BRANCH   20,DCG._L0450
                        JMP       DCG._L0450
DCG._L0452:
                        .BLOCK    1152
                        .LINE     1153
                        LDI       _ACCA, 00064h SHRB 8
                        LDI       _ACCB, 00064h AND 0FFh
                        STS       DCG.RIPPLEPERCENT, _ACCB
                        STS       DCG.RIPPLEPERCENT+1, _ACCA
                        .LINE     1154
                        LDI       _ACCA, 005h
                        STS       DCG.CHECKLIMITERR, _ACCA
                        .ENDBLOCK 1155
DCG._L0450:
DCG._L0451:
                        .LINE     1156
                        LDS       _ACCA, DCG.Modify
                        PUSH      _ACCA
                        LDI       _ACCA, 080h
                        POP       _ACCB
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0
                        BRLO      DCG._L0453
                        LDI       _ACCA, 0FFh
DCG._L0453:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0456
                        BRNE      DCG._L0456
                        .BRANCH   20,DCG._L0454
                        JMP       DCG._L0454
DCG._L0456:
                        .BLOCK    1156
                        .LINE     1157
                        LDI       _ACCA, 000h
                        STS       DCG.MODIFY, _ACCA
                        .LINE     1158
                        LDI       _ACCA, 005h
                        STS       DCG.CHECKLIMITERR, _ACCA
                        .ENDBLOCK 1159
DCG._L0454:
DCG._L0455:
                        .LINE     1161
                        LDS       _ACCA, DCG.Modify
                        CPI       _ACCA, 007h
                        LDI       _ACCA, 0h
                        BREQ      DCG._L0457
                        BRLO      DCG._L0457
                        SER       _ACCA
DCG._L0457:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0460
                        BRNE      DCG._L0460
                        .BRANCH   20,DCG._L0458
                        JMP       DCG._L0458
DCG._L0460:
                        .BLOCK    1161
                        .LINE     1162
                        LDI       _ACCA, 000h
                        STS       DCG.MODIFY, _ACCA
                        .LINE     1164
                        LDI       _ACCA, 005h
                        STS       DCG.CHECKLIMITERR, _ACCA
                        .ENDBLOCK 1165
DCG._L0458:
DCG._L0459:
                        .LINE     1166
                        LDS       _ACCA, DCG.Trackchannel
                        CPI       _ACCA, 080h
                        LDI       _ACCA, 0
                        BRLO      DCG._L0461
                        LDI       _ACCA, 0FFh
DCG._L0461:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0464
                        BRNE      DCG._L0464
                        .BRANCH   20,DCG._L0462
                        JMP       DCG._L0462
DCG._L0464:
                        .BLOCK    1166
                        .LINE     1167
                        LDI       _ACCA, 0FFh
                        STS       DCG.TRACKCHANNEL, _ACCA
                        .ENDBLOCK 1168
                        .BRANCH   20,DCG._L0463
                        JMP       DCG._L0463
DCG._L0462:
                        .BLOCK    1168
                        .LINE     1169
                        LDS       _ACCA, DCG.Trackchannel
                        CPI       _ACCA, 007h
                        LDI       _ACCA, 0h
                        BREQ      DCG._L0465
                        BRLO      DCG._L0465
                        SER       _ACCA
DCG._L0465:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0468
                        BRNE      DCG._L0468
                        .BRANCH   20,DCG._L0466
                        JMP       DCG._L0466
DCG._L0468:
                        .BLOCK    1169
                        .LINE     1170
                        LDI       _ACCA, 007h
                        STS       DCG.TRACKCHANNEL, _ACCA
                        .ENDBLOCK 1171
DCG._L0466:
DCG._L0467:
                        .ENDBLOCK 1172
DCG._L0463:
                        .LINE     1173
                        LDS       _ACCB, DCG.RipplePercent
                        LDS       _ACCA, DCG.RipplePercent+1
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        CPI       _ACCA, 080h
                        BRNE      DCG._L0469
                        CPI       _ACCB, 000h
DCG._L0469:
                        LDI       _ACCA, 0h
                        BRNE      DCG._L0470
                        SER       _ACCA
DCG._L0470:
                        STS       DCG.NOTOGGLE, _ACCA
                        .LINE     1174
                        LDS       _ACCA, DCG.noToggle
                        TST       _ACCA
                        .BRANCH   4,DCG._L0473
                        BRNE      DCG._L0473
                        .BRANCH   20,DCG._L0471
                        JMP       DCG._L0471
DCG._L0473:
                        .BLOCK    1174
                        .LINE     1175
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 000h
                        STS       DCG.RIPPLEVOLTAGE, _ACCB
                        STS       DCG.RIPPLEVOLTAGE+1, _ACCA
                        STS       DCG.RIPPLEVOLTAGE+2, _ACCALO
                        STS       DCG.RIPPLEVOLTAGE+3, _ACCAHI
                        .ENDBLOCK 1176
                        .BRANCH   20,DCG._L0472
                        JMP       DCG._L0472
DCG._L0471:
                        .BLOCK    1176
                        .LINE     1177
                        LDS       _ACCB, DCG.RipplePercent
                        LDS       _ACCA, DCG.RipplePercent+1
                        SBRS      _ACCA, 7
                        RJMP      DCG._L0474
                        LDI       _ACCAHI, 0FFh
                        LDI       _ACCALO, 0FFh
                        RJMP      DCG._L0475
DCG._L0474:
                        CLR       _ACCAHI
                        CLR       _ACCALO
DCG._L0475:
                        SET
                        BLD       Flags, _SIGN
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.LIntToFloat
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DCG.DCVolt
                        LDS       _ACCA, DCG.DCVolt+1
                        LDS       _ACCALO, DCG.DCVolt+2
                        LDS       _ACCAHI, DCG.DCVolt+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        MOVW      _ACCDLO, _ACCB
                        MOVW      _ACCELO, _ACCALO
                        LDI       _ACCBLO, 000h
                        LDI       _ACCBHI, 000h
                        LDI       _ACCCLO, 0C8h
                        LDI       _ACCCHI, 042h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat_R
                        STS       DCG.RIPPLEVOLTAGE, _ACCB
                        STS       DCG.RIPPLEVOLTAGE+1, _ACCA
                        STS       DCG.RIPPLEVOLTAGE+2, _ACCALO
                        STS       DCG.RIPPLEVOLTAGE+3, _ACCAHI
                        .ENDBLOCK 1178
DCG._L0472:
                        .ENDBLOCK 1179
DCG.CheckLimits_X:
                        .LINE     1179
                        .BRANCH   19
                        RET
                        .ENDFUNC  1179


                        .FILE     DCG-Parser.pas
                        .FUNC     paramdiv1000, 00001h, 00020h
DCG.paramdiv1000:
                        .RETURNS   0
                        .BLOCK    3
                        .LINE     4
                        LDS       _ACCB, DCG.Param
                        LDS       _ACCA, DCG.Param+1
                        LDS       _ACCALO, DCG.Param+2
                        LDS       _ACCAHI, DCG.Param+3
                        MOVW      _ACCDLO, _ACCB
                        MOVW      _ACCELO, _ACCALO
                        LDI       _ACCBLO, 000h
                        LDI       _ACCBHI, 000h
                        LDI       _ACCCLO, 07Ah
                        LDI       _ACCCHI, 044h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat_R
                        STS       DCG.PARAM, _ACCB
                        STS       DCG.PARAM+1, _ACCA
                        STS       DCG.PARAM+2, _ACCALO
                        STS       DCG.PARAM+3, _ACCAHI
                        .ENDBLOCK 5
DCG.paramdiv1000_X:
                        .LINE     5
                        .BRANCH   19
                        RET
                        .ENDFUNC  5

                        .FUNC     parammul1000, 00007h, 00020h
DCG.parammul1000:
                        .RETURNS   0
                        .BLOCK    9
                        .LINE     10
                        LDS       _ACCB, DCG.Param
                        LDS       _ACCA, DCG.Param+1
                        LDS       _ACCALO, DCG.Param+2
                        LDS       _ACCAHI, DCG.Param+3
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
                        STS       DCG.PARAM, _ACCB
                        STS       DCG.PARAM+1, _ACCA
                        STS       DCG.PARAM+2, _ACCALO
                        STS       DCG.PARAM+3, _ACCAHI
                        .ENDBLOCK 11
DCG.parammul1000_X:
                        .LINE     11
                        .BRANCH   19
                        RET
                        .ENDFUNC  11

                        .FUNC     ParseGetParam, 00023h, 00020h
DCG.ParseGetParam:
                        .RETURNS   0
                        .BLOCK    36
                        .LINE     37
                        LDI       _ACCA, 001h
                        STS       DCG.DIGITS, _ACCA
                        .LINE     38
                        LDI       _ACCA, 004h
                        STS       DCG.NACHKOMMA, _ACCA
                        .LINE     39
                        LDS       _ACCA, DCG.SubCh
                        .LINE     40
                        CPI       _ACCA, 0
                        .BRANCH   3,DCG._L0479
                        BREQ      DCG._L0479
                        .BRANCH   20,DCG._L0478
                        JMP       DCG._L0478
DCG._L0479:
DCG._L0477:
                        .BLOCK    41
                        .LINE     41
                        LDS       _ACCB, DCG.DCVolt
                        LDS       _ACCA, DCG.DCVolt+1
                        LDS       _ACCALO, DCG.DCVolt+2
                        LDS       _ACCAHI, DCG.DCVolt+3
                        STS       DCG.PARAM, _ACCB
                        STS       DCG.PARAM+1, _ACCA
                        STS       DCG.PARAM+2, _ACCALO
                        STS       DCG.PARAM+3, _ACCAHI
                        .LINE     42
                        .BRANCH   17,DCG.WRITEPARAMSER
                        CALL      DCG.WRITEPARAMSER
                        .ENDBLOCK 43
                        .BRANCH   20,DCG._L0476
                        JMP       DCG._L0476
DCG._L0478:
                        .LINE     44
                        CPI       _ACCA, 1
                        .BRANCH   3,DCG._L0482
                        BREQ      DCG._L0482
                        .BRANCH   20,DCG._L0481
                        JMP       DCG._L0481
DCG._L0482:
DCG._L0480:
                        .BLOCK    45
                        .LINE     45
                        LDS       _ACCB, DCG.DCAmp
                        LDS       _ACCA, DCG.DCAmp+1
                        LDS       _ACCALO, DCG.DCAmp+2
                        LDS       _ACCAHI, DCG.DCAmp+3
                        STS       DCG.PARAM, _ACCB
                        STS       DCG.PARAM+1, _ACCA
                        STS       DCG.PARAM+2, _ACCALO
                        STS       DCG.PARAM+3, _ACCAHI
                        .LINE     46
                        LDS       _ACCA, DCG.IRange
                        LDI       _ACCB, 007h AND 0FFh
                        SUB       _ACCB, _ACCA
                        MOV       _ACCA, _ACCB
                        STS       DCG.NACHKOMMA, _ACCA
                        .LINE     47
                        .BRANCH   17,DCG.WRITEPARAMSER
                        CALL      DCG.WRITEPARAMSER
                        .ENDBLOCK 48
                        .BRANCH   20,DCG._L0476
                        JMP       DCG._L0476
DCG._L0481:
                        .LINE     49
                        CPI       _ACCA, 2
                        .BRANCH   3,DCG._L0485
                        BREQ      DCG._L0485
                        .BRANCH   20,DCG._L0484
                        JMP       DCG._L0484
DCG._L0485:
DCG._L0483:
                        .BLOCK    50
                        .LINE     50
                        LDS       _ACCB, DCG.DCAmp
                        LDS       _ACCA, DCG.DCAmp+1
                        LDS       _ACCALO, DCG.DCAmp+2
                        LDS       _ACCAHI, DCG.DCAmp+3
                        STS       DCG.PARAM, _ACCB
                        STS       DCG.PARAM+1, _ACCA
                        STS       DCG.PARAM+2, _ACCALO
                        STS       DCG.PARAM+3, _ACCAHI
                        .LINE     51
                        .BRANCH   17,DCG.PARAMMUL1000
                        CALL      DCG.PARAMMUL1000
                        .LINE     52
                        LDI       _ACCA, 002h
                        STS       DCG.NACHKOMMA, _ACCA
                        .LINE     53
                        .BRANCH   17,DCG.WRITEPARAMSER
                        CALL      DCG.WRITEPARAMSER
                        .ENDBLOCK 54
                        .BRANCH   20,DCG._L0476
                        JMP       DCG._L0476
DCG._L0484:
                        .LINE     55
                        CPI       _ACCA, 3
                        .BRANCH   3,DCG._L0488
                        BREQ      DCG._L0488
                        .BRANCH   20,DCG._L0487
                        JMP       DCG._L0487
DCG._L0488:
DCG._L0486:
                        .BLOCK    56
                        .LINE     56
                        LDS       _ACCB, DCG.DCAmp
                        LDS       _ACCA, DCG.DCAmp+1
                        LDS       _ACCALO, DCG.DCAmp+2
                        LDS       _ACCAHI, DCG.DCAmp+3
                        STS       DCG.PARAM, _ACCB
                        STS       DCG.PARAM+1, _ACCA
                        STS       DCG.PARAM+2, _ACCALO
                        STS       DCG.PARAM+3, _ACCAHI
                        .LINE     57
                        .BRANCH   17,DCG.PARAMMUL1000
                        CALL      DCG.PARAMMUL1000
                        .LINE     58
                        .BRANCH   17,DCG.PARAMMUL1000
                        CALL      DCG.PARAMMUL1000
                        .LINE     59
                        LDI       _ACCA, 000h
                        STS       DCG.NACHKOMMA, _ACCA
                        .LINE     60
                        .BRANCH   17,DCG.WRITEPARAMSER
                        CALL      DCG.WRITEPARAMSER
                        .ENDBLOCK 61
                        .BRANCH   20,DCG._L0476
                        JMP       DCG._L0476
DCG._L0487:
                        .LINE     63
                        CPI       _ACCA, 7
                        .BRANCH   3,DCG._L0491
                        BREQ      DCG._L0491
                        .BRANCH   20,DCG._L0490
                        JMP       DCG._L0490
DCG._L0491:
DCG._L0489:
                        .BLOCK    64
                        .LINE     64
                        LDS       _ACCB, DCG.Ah
                        LDS       _ACCA, DCG.Ah+1
                        LDS       _ACCALO, DCG.Ah+2
                        LDS       _ACCAHI, DCG.Ah+3
                        STS       DCG.PARAM, _ACCB
                        STS       DCG.PARAM+1, _ACCA
                        STS       DCG.PARAM+2, _ACCALO
                        STS       DCG.PARAM+3, _ACCAHI
                        .LINE     65
                        .BRANCH   17,DCG.WRITEPARAMSER
                        CALL      DCG.WRITEPARAMSER
                        .ENDBLOCK 66
                        .BRANCH   20,DCG._L0476
                        JMP       DCG._L0476
DCG._L0490:
                        .LINE     67
                        CPI       _ACCA, 8
                        .BRANCH   3,DCG._L0494
                        BREQ      DCG._L0494
                        .BRANCH   20,DCG._L0493
                        JMP       DCG._L0493
DCG._L0494:
DCG._L0492:
                        .BLOCK    68
                        .LINE     68
                        LDS       _ACCB, DCG.Wh
                        LDS       _ACCA, DCG.Wh+1
                        LDS       _ACCALO, DCG.Wh+2
                        LDS       _ACCAHI, DCG.Wh+3
                        STS       DCG.PARAM, _ACCB
                        STS       DCG.PARAM+1, _ACCA
                        STS       DCG.PARAM+2, _ACCALO
                        STS       DCG.PARAM+3, _ACCAHI
                        .LINE     69
                        .BRANCH   17,DCG.WRITEPARAMSER
                        CALL      DCG.WRITEPARAMSER
                        .ENDBLOCK 70
                        .BRANCH   20,DCG._L0476
                        JMP       DCG._L0476
DCG._L0493:
                        .LINE     72
                        CPI       _ACCA, 10
                        .BRANCH   3,DCG._L0497
                        BREQ      DCG._L0497
                        .BRANCH   20,DCG._L0496
                        JMP       DCG._L0496
DCG._L0497:
DCG._L0495:
                        .BLOCK    73
                        .LINE     73
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DCG.GETVOLTAGE
                        CALL      DCG.GETVOLTAGE
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     74
                        .BRANCH   17,DCG.WRITEPARAMSER
                        CALL      DCG.WRITEPARAMSER
                        .ENDBLOCK 75
                        .BRANCH   20,DCG._L0476
                        JMP       DCG._L0476
DCG._L0496:
                        .LINE     76
                        CPI       _ACCA, 11
                        .BRANCH   3,DCG._L0500
                        BREQ      DCG._L0500
                        .BRANCH   20,DCG._L0499
                        JMP       DCG._L0499
DCG._L0500:
DCG._L0498:
                        .BLOCK    77
                        .LINE     77
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DCG.GETCURRENT
                        CALL      DCG.GETCURRENT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     78
                        LDS       _ACCA, DCG.IRange
                        LDI       _ACCB, 008h AND 0FFh
                        SUB       _ACCB, _ACCA
                        MOV       _ACCA, _ACCB
                        STS       DCG.NACHKOMMA, _ACCA
                        .LINE     79
                        .BRANCH   17,DCG.WRITEPARAMSER
                        CALL      DCG.WRITEPARAMSER
                        .ENDBLOCK 80
                        .BRANCH   20,DCG._L0476
                        JMP       DCG._L0476
DCG._L0499:
                        .LINE     81
                        CPI       _ACCA, 12
                        .BRANCH   3,DCG._L0503
                        BREQ      DCG._L0503
                        .BRANCH   20,DCG._L0502
                        JMP       DCG._L0502
DCG._L0503:
DCG._L0501:
                        .BLOCK    82
                        .LINE     82
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DCG.GETCURRENT
                        CALL      DCG.GETCURRENT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     83
                        .BRANCH   17,DCG.PARAMMUL1000
                        CALL      DCG.PARAMMUL1000
                        .LINE     84
                        LDI       _ACCA, 002h
                        STS       DCG.NACHKOMMA, _ACCA
                        .LINE     85
                        .BRANCH   17,DCG.WRITEPARAMSER
                        CALL      DCG.WRITEPARAMSER
                        .ENDBLOCK 86
                        .BRANCH   20,DCG._L0476
                        JMP       DCG._L0476
DCG._L0502:
                        .LINE     87
                        CPI       _ACCA, 13
                        .BRANCH   3,DCG._L0506
                        BREQ      DCG._L0506
                        .BRANCH   20,DCG._L0505
                        JMP       DCG._L0505
DCG._L0506:
DCG._L0504:
                        .BLOCK    88
                        .LINE     88
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DCG.GETCURRENT
                        CALL      DCG.GETCURRENT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     89
                        .BRANCH   17,DCG.PARAMMUL1000
                        CALL      DCG.PARAMMUL1000
                        .LINE     90
                        .BRANCH   17,DCG.PARAMMUL1000
                        CALL      DCG.PARAMMUL1000
                        .LINE     91
                        LDI       _ACCA, 000h
                        STS       DCG.NACHKOMMA, _ACCA
                        .LINE     92
                        .BRANCH   17,DCG.WRITEPARAMSER
                        CALL      DCG.WRITEPARAMSER
                        .ENDBLOCK 93
                        .BRANCH   20,DCG._L0476
                        JMP       DCG._L0476
DCG._L0505:
                        .LINE     94
                        CPI       _ACCA, 15
                        .BRANCH   3,DCG._L0509
                        BREQ      DCG._L0509
                        .BRANCH   20,DCG._L0508
                        JMP       DCG._L0508
DCG._L0509:
DCG._L0507:
                        .BLOCK    95
                        .LINE     95
                        .BRANCH   17,DCG.GETINPUTVOLTAGE
                        CALL      DCG.GETINPUTVOLTAGE
                        .LINE     96
                        .BRANCH   17,DCG.WRITEPARAMSER
                        CALL      DCG.WRITEPARAMSER
                        .ENDBLOCK 97
                        .BRANCH   20,DCG._L0476
                        JMP       DCG._L0476
DCG._L0508:
                        .LINE     98
                        CPI       _ACCA, 16
                        .BRANCH   3,DCG._L0512
                        BREQ      DCG._L0512
                        .BRANCH   20,DCG._L0511
                        JMP       DCG._L0511
DCG._L0512:
DCG._L0510:
                        .BLOCK    99
                        .LINE     99
                        LDS       _ACCB, DCG.DCVoltIntegrated
                        LDS       _ACCA, DCG.DCVoltIntegrated+1
                        LDS       _ACCALO, DCG.DCVoltIntegrated+2
                        LDS       _ACCAHI, DCG.DCVoltIntegrated+3
                        STS       DCG.PARAM, _ACCB
                        STS       DCG.PARAM+1, _ACCA
                        STS       DCG.PARAM+2, _ACCALO
                        STS       DCG.PARAM+3, _ACCAHI
                        .LINE     100
                        .BRANCH   17,DCG.WRITEPARAMSER
                        CALL      DCG.WRITEPARAMSER
                        .ENDBLOCK 101
                        .BRANCH   20,DCG._L0476
                        JMP       DCG._L0476
DCG._L0511:
                        .LINE     102
                        CPI       _ACCA, 17
                        .BRANCH   3,DCG._L0515
                        BREQ      DCG._L0515
                        .BRANCH   20,DCG._L0514
                        JMP       DCG._L0514
DCG._L0515:
DCG._L0513:
                        .BLOCK    103
                        .LINE     103
                        LDS       _ACCB, DCG.DCAmpIntegrated
                        LDS       _ACCA, DCG.DCAmpIntegrated+1
                        LDS       _ACCALO, DCG.DCAmpIntegrated+2
                        LDS       _ACCAHI, DCG.DCAmpIntegrated+3
                        STS       DCG.PARAM, _ACCB
                        STS       DCG.PARAM+1, _ACCA
                        STS       DCG.PARAM+2, _ACCALO
                        STS       DCG.PARAM+3, _ACCAHI
                        .LINE     104
                        LDS       _ACCA, DCG.IRange
                        LDI       _ACCB, 008h AND 0FFh
                        SUB       _ACCB, _ACCA
                        MOV       _ACCA, _ACCB
                        STS       DCG.NACHKOMMA, _ACCA
                        .LINE     105
                        .BRANCH   17,DCG.WRITEPARAMSER
                        CALL      DCG.WRITEPARAMSER
                        .ENDBLOCK 106
                        .BRANCH   20,DCG._L0476
                        JMP       DCG._L0476
DCG._L0514:
                        .LINE     107
                        CPI       _ACCA, 18
                        .BRANCH   3,DCG._L0518
                        BREQ      DCG._L0518
                        .BRANCH   20,DCG._L0517
                        JMP       DCG._L0517
DCG._L0518:
DCG._L0516:
                        .BLOCK    108
                        .LINE     108
                        LDS       _ACCB, DCG.CurrAmp
                        LDS       _ACCA, DCG.CurrAmp+1
                        LDS       _ACCALO, DCG.CurrAmp+2
                        LDS       _ACCAHI, DCG.CurrAmp+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DCG.CurrVolt
                        LDS       _ACCA, DCG.CurrVolt+1
                        LDS       _ACCALO, DCG.CurrVolt+2
                        LDS       _ACCAHI, DCG.CurrVolt+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        STS       DCG.PARAM, _ACCB
                        STS       DCG.PARAM+1, _ACCA
                        STS       DCG.PARAM+2, _ACCALO
                        STS       DCG.PARAM+3, _ACCAHI
                        .LINE     109
                        .BRANCH   17,DCG.WRITEPARAMSER
                        CALL      DCG.WRITEPARAMSER
                        .ENDBLOCK 110
                        .BRANCH   20,DCG._L0476
                        JMP       DCG._L0476
DCG._L0517:
                        .LINE     111
                        CPI       _ACCA, 20
                        .BRANCH   3,DCG._L0521
                        BREQ      DCG._L0521
                        .BRANCH   20,DCG._L0520
                        JMP       DCG._L0520
DCG._L0521:
DCG._L0519:
                        .BLOCK    112
                        .LINE     112
                        LDS       _ACCB, DCG.DCVoltMod
                        LDS       _ACCA, DCG.DCVoltMod+1
                        LDS       _ACCALO, DCG.DCVoltMod+2
                        LDS       _ACCAHI, DCG.DCVoltMod+3
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
                        LDI       _ACCCLO, 0C8h
                        LDI       _ACCCHI, 042h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat_R
                        STS       DCG.PARAM, _ACCB
                        STS       DCG.PARAM+1, _ACCA
                        STS       DCG.PARAM+2, _ACCALO
                        STS       DCG.PARAM+3, _ACCAHI
                        .LINE     113
                        .BRANCH   17,DCG.WRITEPARAMSER
                        CALL      DCG.WRITEPARAMSER
                        .ENDBLOCK 114
                        .BRANCH   20,DCG._L0476
                        JMP       DCG._L0476
DCG._L0520:
                        .LINE     115
                        CPI       _ACCA, 21
                        .BRANCH   2,DCG._L0524
                        BRCC      DCG._L0524
                        .BRANCH   20,DCG._L0523
                        JMP       DCG._L0523
DCG._L0524:
                        CPI       _ACCA, 23
                        .BRANCH   3,DCG._L0525
                        BREQ      DCG._L0525
                        .BRANCH   1,DCG._L0523
                        BRCS      DCG._L0525
                        .BRANCH   20,DCG._L0523
                        JMP       DCG._L0523
DCG._L0525:
DCG._L0522:
                        .BLOCK    116
                        .LINE     116
                        LDS       _ACCB, DCG.DCAmpMod
                        LDS       _ACCA, DCG.DCAmpMod+1
                        LDS       _ACCALO, DCG.DCAmpMod+2
                        LDS       _ACCAHI, DCG.DCAmpMod+3
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
                        LDI       _ACCCLO, 0C8h
                        LDI       _ACCCHI, 042h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat_R
                        STS       DCG.PARAM, _ACCB
                        STS       DCG.PARAM+1, _ACCA
                        STS       DCG.PARAM+2, _ACCALO
                        STS       DCG.PARAM+3, _ACCAHI
                        .LINE     117
                        .BRANCH   17,DCG.WRITEPARAMSER
                        CALL      DCG.WRITEPARAMSER
                        .ENDBLOCK 118
                        .BRANCH   20,DCG._L0476
                        JMP       DCG._L0476
DCG._L0523:
                        .LINE     119
                        CPI       _ACCA, 27
                        .BRANCH   3,DCG._L0528
                        BREQ      DCG._L0528
                        .BRANCH   20,DCG._L0527
                        JMP       DCG._L0527
DCG._L0528:
DCG._L0526:
                        .BLOCK    120
                        .LINE     120
                        LDS       _ACCB, DCG.PWonTime
                        LDS       _ACCA, DCG.PWonTime+1
                        STS       DCG.PARAMINT, _ACCB
                        STS       DCG.PARAMINT+1, _ACCA
                        .LINE     121
                        .BRANCH   17,DCG.WRITEPARAMINTSER
                        CALL      DCG.WRITEPARAMINTSER
                        .ENDBLOCK 122
                        .BRANCH   20,DCG._L0476
                        JMP       DCG._L0476
DCG._L0527:
                        .LINE     123
                        CPI       _ACCA, 28
                        .BRANCH   3,DCG._L0531
                        BREQ      DCG._L0531
                        .BRANCH   20,DCG._L0530
                        JMP       DCG._L0530
DCG._L0531:
DCG._L0529:
                        .BLOCK    124
                        .LINE     124
                        LDS       _ACCB, DCG.PWoffTime
                        LDS       _ACCA, DCG.PWoffTime+1
                        STS       DCG.PARAMINT, _ACCB
                        STS       DCG.PARAMINT+1, _ACCA
                        .LINE     125
                        .BRANCH   17,DCG.WRITEPARAMINTSER
                        CALL      DCG.WRITEPARAMINTSER
                        .ENDBLOCK 126
                        .BRANCH   20,DCG._L0476
                        JMP       DCG._L0476
DCG._L0530:
                        .LINE     127
                        CPI       _ACCA, 29
                        .BRANCH   3,DCG._L0534
                        BREQ      DCG._L0534
                        .BRANCH   20,DCG._L0533
                        JMP       DCG._L0533
DCG._L0534:
DCG._L0532:
                        .BLOCK    128
                        .LINE     128
                        LDS       _ACCB, DCG.RipplePercent
                        LDS       _ACCA, DCG.RipplePercent+1
                        STS       DCG.PARAMINT, _ACCB
                        STS       DCG.PARAMINT+1, _ACCA
                        .LINE     129
                        .BRANCH   17,DCG.WRITEPARAMINTSER
                        CALL      DCG.WRITEPARAMINTSER
                        .ENDBLOCK 130
                        .BRANCH   20,DCG._L0476
                        JMP       DCG._L0476
DCG._L0533:
                        .LINE     131
                        CPI       _ACCA, 50
                        .BRANCH   3,DCG._L0537
                        BREQ      DCG._L0537
                        .BRANCH   20,DCG._L0536
                        JMP       DCG._L0536
DCG._L0537:
DCG._L0535:
                        .BLOCK    132
                        .LINE     132
                        LDS       _ACCB, DCG.ADCrawU
                        LDS       _ACCA, DCG.ADCrawU+1
                        STS       DCG.PARAMINT, _ACCB
                        STS       DCG.PARAMINT+1, _ACCA
                        .LINE     133
                        .BRANCH   17,DCG.WRITEPARAMINTSER
                        CALL      DCG.WRITEPARAMINTSER
                        .ENDBLOCK 134
                        .BRANCH   20,DCG._L0476
                        JMP       DCG._L0476
DCG._L0536:
                        .LINE     135
                        CPI       _ACCA, 51
                        .BRANCH   3,DCG._L0540
                        BREQ      DCG._L0540
                        .BRANCH   20,DCG._L0539
                        JMP       DCG._L0539
DCG._L0540:
DCG._L0538:
                        .BLOCK    136
                        .LINE     136
                        LDS       _ACCB, DCG.ADCrawi
                        LDS       _ACCA, DCG.ADCrawi+1
                        STS       DCG.PARAMINT, _ACCB
                        STS       DCG.PARAMINT+1, _ACCA
                        .LINE     137
                        .BRANCH   17,DCG.WRITEPARAMINTSER
                        CALL      DCG.WRITEPARAMINTSER
                        .ENDBLOCK 138
                        .BRANCH   20,DCG._L0476
                        JMP       DCG._L0476
DCG._L0539:
                        .LINE     139
                        CPI       _ACCA, 52
                        .BRANCH   3,DCG._L0543
                        BREQ      DCG._L0543
                        .BRANCH   20,DCG._L0542
                        JMP       DCG._L0542
DCG._L0543:
DCG._L0541:
                        .BLOCK    140
                        .LINE     140
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 003h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DCG.GETADC10
                        CALL       DCG.GETADC10
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        STS       DCG.PARAMINT, _ACCB
                        STS       DCG.PARAMINT+1, _ACCA
                        .LINE     141
                        .BRANCH   17,DCG.WRITEPARAMINTSER
                        CALL      DCG.WRITEPARAMINTSER
                        .ENDBLOCK 142
                        .BRANCH   20,DCG._L0476
                        JMP       DCG._L0476
DCG._L0542:
                        .LINE     143
                        CPI       _ACCA, 53
                        .BRANCH   3,DCG._L0546
                        BREQ      DCG._L0546
                        .BRANCH   20,DCG._L0545
                        JMP       DCG._L0545
DCG._L0546:
DCG._L0544:
                        .BLOCK    144
                        .LINE     144
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 004h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DCG.GETADC10
                        CALL       DCG.GETADC10
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        STS       DCG.PARAMINT, _ACCB
                        STS       DCG.PARAMINT+1, _ACCA
                        .LINE     145
                        .BRANCH   17,DCG.WRITEPARAMINTSER
                        CALL      DCG.WRITEPARAMINTSER
                        .ENDBLOCK 146
                        .BRANCH   20,DCG._L0476
                        JMP       DCG._L0476
DCG._L0545:
                        .LINE     147
                        CPI       _ACCA, 54
                        .BRANCH   3,DCG._L0549
                        BREQ      DCG._L0549
                        .BRANCH   20,DCG._L0548
                        JMP       DCG._L0548
DCG._L0549:
DCG._L0547:
                        .BLOCK    148
                        .LINE     148
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 005h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DCG.GETADC10
                        CALL       DCG.GETADC10
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        STS       DCG.PARAMINT, _ACCB
                        STS       DCG.PARAMINT+1, _ACCA
                        .LINE     149
                        .BRANCH   17,DCG.WRITEPARAMINTSER
                        CALL      DCG.WRITEPARAMINTSER
                        .ENDBLOCK 150
                        .BRANCH   20,DCG._L0476
                        JMP       DCG._L0476
DCG._L0548:
                        .LINE     151
                        CPI       _ACCA, 70
                        .BRANCH   3,DCG._L0552
                        BREQ      DCG._L0552
                        .BRANCH   20,DCG._L0551
                        JMP       DCG._L0551
DCG._L0552:
DCG._L0550:
                        .BLOCK    152
                        .LINE     152
                        LDS       _ACCB, DCG.DACrawUon
                        LDS       _ACCA, DCG.DACrawUon+1
                        STS       DCG.PARAMINT, _ACCB
                        STS       DCG.PARAMINT+1, _ACCA
                        .LINE     153
                        .BRANCH   17,DCG.WRITEPARAMINTSER
                        CALL      DCG.WRITEPARAMINTSER
                        .ENDBLOCK 154
                        .BRANCH   20,DCG._L0476
                        JMP       DCG._L0476
DCG._L0551:
                        .LINE     155
                        CPI       _ACCA, 71
                        .BRANCH   3,DCG._L0555
                        BREQ      DCG._L0555
                        .BRANCH   20,DCG._L0554
                        JMP       DCG._L0554
DCG._L0555:
DCG._L0553:
                        .BLOCK    156
                        .LINE     156
                        LDS       _ACCB, DCG.DACrawI
                        LDS       _ACCA, DCG.DACrawI+1
                        STS       DCG.PARAMINT, _ACCB
                        STS       DCG.PARAMINT+1, _ACCA
                        .LINE     157
                        .BRANCH   17,DCG.WRITEPARAMINTSER
                        CALL      DCG.WRITEPARAMINTSER
                        .ENDBLOCK 158
                        .BRANCH   20,DCG._L0476
                        JMP       DCG._L0476
DCG._L0554:
                        .LINE     159
                        CPI       _ACCA, 80
                        .BRANCH   3,DCG._L0558
                        BREQ      DCG._L0558
                        .BRANCH   20,DCG._L0557
                        JMP       DCG._L0557
DCG._L0558:
DCG._L0556:
                        .BLOCK    160
                        .LINE     160
                        LDS       _ACCA, DCG.Modify
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        STS       DCG.PARAMINT, _ACCB
                        STS       DCG.PARAMINT+1, _ACCA
                        .LINE     161
                        .BRANCH   17,DCG.WRITEPARAMINTSER
                        CALL      DCG.WRITEPARAMINTSER
                        .ENDBLOCK 162
                        .BRANCH   20,DCG._L0476
                        JMP       DCG._L0476
DCG._L0557:
                        .LINE     163
                        CPI       _ACCA, 89
                        .BRANCH   3,DCG._L0561
                        BREQ      DCG._L0561
                        .BRANCH   20,DCG._L0560
                        JMP       DCG._L0560
DCG._L0561:
DCG._L0559:
                        .BLOCK    164
                        .LINE     164
                        LDS       _ACCB, DCG.IncRast
                        LDS       _ACCA, DCG.IncRast+1
                        STS       DCG.PARAMINT, _ACCB
                        STS       DCG.PARAMINT+1, _ACCA
                        .LINE     165
                        .BRANCH   17,DCG.WRITEPARAMINTSER
                        CALL      DCG.WRITEPARAMINTSER
                        .ENDBLOCK 166
                        .BRANCH   20,DCG._L0476
                        JMP       DCG._L0476
DCG._L0560:
                        .LINE     167
                        CPI       _ACCA, 99
                        .BRANCH   3,DCG._L0564
                        BREQ      DCG._L0564
                        .BRANCH   20,DCG._L0563
                        JMP       DCG._L0563
DCG._L0564:
DCG._L0562:
                        .BLOCK    168
                        .LINE     168
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DCG.GETVOLTAGE
                        CALL      DCG.GETVOLTAGE
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     169
                        LDI       _ACCA, 00Ah
                        STS       DCG.SUBCH, _ACCA
                        .LINE     170
                        .BRANCH   17,DCG.WRITEPARAMSER
                        CALL      DCG.WRITEPARAMSER
                        .LINE     171
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DCG.GETCURRENT
                        CALL      DCG.GETCURRENT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     172
                        LDI       _ACCA, 00Bh
                        STS       DCG.SUBCH, _ACCA
                        .LINE     173
                        .BRANCH   17,DCG.WRITEPARAMSER
                        CALL      DCG.WRITEPARAMSER
                        .LINE     174
                        .BRANCH   17,DCG.GETINPUTVOLTAGE
                        CALL      DCG.GETINPUTVOLTAGE
                        .LINE     175
                        LDI       _ACCA, 00Fh
                        STS       DCG.SUBCH, _ACCA
                        .LINE     176
                        .BRANCH   17,DCG.WRITEPARAMSER
                        CALL      DCG.WRITEPARAMSER
                        .ENDBLOCK 177
                        .BRANCH   20,DCG._L0476
                        JMP       DCG._L0476
DCG._L0563:
                        .LINE     178
                        CPI       _ACCA, 100
                        .BRANCH   3,DCG._L0567
                        BREQ      DCG._L0567
                        .BRANCH   20,DCG._L0566
                        JMP       DCG._L0566
DCG._L0567:
                        .BRANCH   20,DCG._L0565
                        JMP       DCG._L0565
DCG._L0566:
                        CPI       _ACCA, 101
                        .BRANCH   3,DCG._L0569
                        BREQ      DCG._L0569
                        .BRANCH   20,DCG._L0568
                        JMP       DCG._L0568
DCG._L0569:
DCG._L0565:
                        .BLOCK    179
                        .LINE     179
                        LDI       _ACCCLO, DCG.DACUoffsets AND 0FFh
                        LDI       _ACCCHI, DCG.DACUoffsets SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DCG.subCh
                        SUBI      _ACCA, 064h AND 0FFh
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        CALL      SYSTEM._ReadEEp16
                        STS       DCG.PARAMINT, _ACCB
                        STS       DCG.PARAMINT+1, _ACCA
                        .LINE     180
                        .BRANCH   17,DCG.WRITEPARAMINTSER
                        CALL      DCG.WRITEPARAMINTSER
                        .ENDBLOCK 181
                        .BRANCH   20,DCG._L0476
                        JMP       DCG._L0476
DCG._L0568:
                        .LINE     182
                        CPI       _ACCA, 102
                        .BRANCH   2,DCG._L0572
                        BRCC      DCG._L0572
                        .BRANCH   20,DCG._L0571
                        JMP       DCG._L0571
DCG._L0572:
                        CPI       _ACCA, 105
                        .BRANCH   3,DCG._L0573
                        BREQ      DCG._L0573
                        .BRANCH   1,DCG._L0571
                        BRCS      DCG._L0573
                        .BRANCH   20,DCG._L0571
                        JMP       DCG._L0571
DCG._L0573:
DCG._L0570:
                        .BLOCK    183
                        .LINE     183
                        LDI       _ACCCLO, DCG.DACIoffsets AND 0FFh
                        LDI       _ACCCHI, DCG.DACIoffsets SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DCG.subCh
                        SUBI      _ACCA, 066h AND 0FFh
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        CALL      SYSTEM._ReadEEp16
                        STS       DCG.PARAMINT, _ACCB
                        STS       DCG.PARAMINT+1, _ACCA
                        .LINE     184
                        .BRANCH   17,DCG.WRITEPARAMINTSER
                        CALL      DCG.WRITEPARAMINTSER
                        .ENDBLOCK 185
                        .BRANCH   20,DCG._L0476
                        JMP       DCG._L0476
DCG._L0571:
                        .LINE     186
                        CPI       _ACCA, 110
                        .BRANCH   3,DCG._L0576
                        BREQ      DCG._L0576
                        .BRANCH   20,DCG._L0575
                        JMP       DCG._L0575
DCG._L0576:
                        .BRANCH   20,DCG._L0574
                        JMP       DCG._L0574
DCG._L0575:
                        CPI       _ACCA, 111
                        .BRANCH   3,DCG._L0578
                        BREQ      DCG._L0578
                        .BRANCH   20,DCG._L0577
                        JMP       DCG._L0577
DCG._L0578:
DCG._L0574:
                        .BLOCK    187
                        .LINE     187
                        LDI       _ACCCLO, DCG.ADCUoffsets AND 0FFh
                        LDI       _ACCCHI, DCG.ADCUoffsets SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DCG.subCh
                        SUBI      _ACCA, 06Eh AND 0FFh
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        CALL      SYSTEM._ReadEEp16
                        STS       DCG.PARAMINT, _ACCB
                        STS       DCG.PARAMINT+1, _ACCA
                        .LINE     188
                        .BRANCH   17,DCG.WRITEPARAMINTSER
                        CALL      DCG.WRITEPARAMINTSER
                        .ENDBLOCK 189
                        .BRANCH   20,DCG._L0476
                        JMP       DCG._L0476
DCG._L0577:
                        .LINE     190
                        CPI       _ACCA, 112
                        .BRANCH   2,DCG._L0581
                        BRCC      DCG._L0581
                        .BRANCH   20,DCG._L0580
                        JMP       DCG._L0580
DCG._L0581:
                        CPI       _ACCA, 115
                        .BRANCH   3,DCG._L0582
                        BREQ      DCG._L0582
                        .BRANCH   1,DCG._L0580
                        BRCS      DCG._L0582
                        .BRANCH   20,DCG._L0580
                        JMP       DCG._L0580
DCG._L0582:
DCG._L0579:
                        .BLOCK    191
                        .LINE     191
                        LDI       _ACCCLO, DCG.ADCIoffsets AND 0FFh
                        LDI       _ACCCHI, DCG.ADCIoffsets SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DCG.subCh
                        SUBI      _ACCA, 070h AND 0FFh
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        CALL      SYSTEM._ReadEEp16
                        STS       DCG.PARAMINT, _ACCB
                        STS       DCG.PARAMINT+1, _ACCA
                        .LINE     192
                        .BRANCH   17,DCG.WRITEPARAMINTSER
                        CALL      DCG.WRITEPARAMINTSER
                        .ENDBLOCK 193
                        .BRANCH   20,DCG._L0476
                        JMP       DCG._L0476
DCG._L0580:
                        .LINE     194
                        CPI       _ACCA, 150
                        .BRANCH   2,DCG._L0585
                        BRCC      DCG._L0585
                        .BRANCH   20,DCG._L0584
                        JMP       DCG._L0584
DCG._L0585:
                        CPI       _ACCA, 174
                        .BRANCH   3,DCG._L0586
                        BREQ      DCG._L0586
                        .BRANCH   1,DCG._L0584
                        BRCS      DCG._L0586
                        .BRANCH   20,DCG._L0584
                        JMP       DCG._L0584
DCG._L0586:
DCG._L0583:
                        .BLOCK    195
                        .LINE     195
                        LDI       _ACCCLO, DCG.OptionArray AND 0FFh
                        LDI       _ACCCHI, DCG.OptionArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DCG.subCh
                        SUBI      _ACCA, 096h AND 0FFh
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
                        STS       DCG.PARAM, _ACCB
                        STS       DCG.PARAM+1, _ACCA
                        STS       DCG.PARAM+2, _ACCALO
                        STS       DCG.PARAM+3, _ACCAHI
                        .LINE     196
                        .BRANCH   17,DCG.WRITEPARAMSER
                        CALL      DCG.WRITEPARAMSER
                        .ENDBLOCK 197
                        .BRANCH   20,DCG._L0476
                        JMP       DCG._L0476
DCG._L0584:
                        .LINE     198
                        CPI       _ACCA, 200
                        .BRANCH   3,DCG._L0589
                        BREQ      DCG._L0589
                        .BRANCH   20,DCG._L0588
                        JMP       DCG._L0588
DCG._L0589:
                        .BRANCH   20,DCG._L0587
                        JMP       DCG._L0587
DCG._L0588:
                        CPI       _ACCA, 201
                        .BRANCH   3,DCG._L0591
                        BREQ      DCG._L0591
                        .BRANCH   20,DCG._L0590
                        JMP       DCG._L0590
DCG._L0591:
DCG._L0587:
                        .BLOCK    199
                        .LINE     199
                        LDI       _ACCCLO, DCG.DACUscales AND 0FFh
                        LDI       _ACCCHI, DCG.DACUscales SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DCG.subCh
                        SUBI      _ACCA, 0C8h AND 0FFh
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
                        STS       DCG.PARAM, _ACCB
                        STS       DCG.PARAM+1, _ACCA
                        STS       DCG.PARAM+2, _ACCALO
                        STS       DCG.PARAM+3, _ACCAHI
                        .LINE     200
                        LDI       _ACCA, 005h
                        STS       DCG.NACHKOMMA, _ACCA
                        .LINE     201
                        .BRANCH   17,DCG.WRITEPARAMSER
                        CALL      DCG.WRITEPARAMSER
                        .ENDBLOCK 202
                        .BRANCH   20,DCG._L0476
                        JMP       DCG._L0476
DCG._L0590:
                        .LINE     203
                        CPI       _ACCA, 202
                        .BRANCH   2,DCG._L0594
                        BRCC      DCG._L0594
                        .BRANCH   20,DCG._L0593
                        JMP       DCG._L0593
DCG._L0594:
                        CPI       _ACCA, 205
                        .BRANCH   3,DCG._L0595
                        BREQ      DCG._L0595
                        .BRANCH   1,DCG._L0593
                        BRCS      DCG._L0595
                        .BRANCH   20,DCG._L0593
                        JMP       DCG._L0593
DCG._L0595:
DCG._L0592:
                        .BLOCK    204
                        .LINE     204
                        LDI       _ACCCLO, DCG.DACIscales AND 0FFh
                        LDI       _ACCCHI, DCG.DACIscales SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DCG.subCh
                        SUBI      _ACCA, 0CAh AND 0FFh
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
                        STS       DCG.PARAM, _ACCB
                        STS       DCG.PARAM+1, _ACCA
                        STS       DCG.PARAM+2, _ACCALO
                        STS       DCG.PARAM+3, _ACCAHI
                        .LINE     205
                        LDI       _ACCA, 005h
                        STS       DCG.NACHKOMMA, _ACCA
                        .LINE     206
                        .BRANCH   17,DCG.WRITEPARAMSER
                        CALL      DCG.WRITEPARAMSER
                        .ENDBLOCK 207
                        .BRANCH   20,DCG._L0476
                        JMP       DCG._L0476
DCG._L0593:
                        .LINE     208
                        CPI       _ACCA, 210
                        .BRANCH   3,DCG._L0598
                        BREQ      DCG._L0598
                        .BRANCH   20,DCG._L0597
                        JMP       DCG._L0597
DCG._L0598:
                        .BRANCH   20,DCG._L0596
                        JMP       DCG._L0596
DCG._L0597:
                        CPI       _ACCA, 211
                        .BRANCH   3,DCG._L0600
                        BREQ      DCG._L0600
                        .BRANCH   20,DCG._L0599
                        JMP       DCG._L0599
DCG._L0600:
DCG._L0596:
                        .BLOCK    209
                        .LINE     209
                        LDI       _ACCCLO, DCG.ADCUscales AND 0FFh
                        LDI       _ACCCHI, DCG.ADCUscales SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DCG.subCh
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
                        STS       DCG.PARAM, _ACCB
                        STS       DCG.PARAM+1, _ACCA
                        STS       DCG.PARAM+2, _ACCALO
                        STS       DCG.PARAM+3, _ACCAHI
                        .LINE     210
                        LDI       _ACCA, 005h
                        STS       DCG.NACHKOMMA, _ACCA
                        .LINE     211
                        .BRANCH   17,DCG.WRITEPARAMSER
                        CALL      DCG.WRITEPARAMSER
                        .ENDBLOCK 212
                        .BRANCH   20,DCG._L0476
                        JMP       DCG._L0476
DCG._L0599:
                        .LINE     213
                        CPI       _ACCA, 212
                        .BRANCH   2,DCG._L0603
                        BRCC      DCG._L0603
                        .BRANCH   20,DCG._L0602
                        JMP       DCG._L0602
DCG._L0603:
                        CPI       _ACCA, 215
                        .BRANCH   3,DCG._L0604
                        BREQ      DCG._L0604
                        .BRANCH   1,DCG._L0602
                        BRCS      DCG._L0604
                        .BRANCH   20,DCG._L0602
                        JMP       DCG._L0602
DCG._L0604:
DCG._L0601:
                        .BLOCK    214
                        .LINE     214
                        LDI       _ACCCLO, DCG.ADCIscales AND 0FFh
                        LDI       _ACCCHI, DCG.ADCIscales SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DCG.subCh
                        SUBI      _ACCA, 0D4h AND 0FFh
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
                        STS       DCG.PARAM, _ACCB
                        STS       DCG.PARAM+1, _ACCA
                        STS       DCG.PARAM+2, _ACCALO
                        STS       DCG.PARAM+3, _ACCAHI
                        .LINE     215
                        LDI       _ACCA, 005h
                        STS       DCG.NACHKOMMA, _ACCA
                        .LINE     216
                        .BRANCH   17,DCG.WRITEPARAMSER
                        CALL      DCG.WRITEPARAMSER
                        .ENDBLOCK 217
                        .BRANCH   20,DCG._L0476
                        JMP       DCG._L0476
DCG._L0602:
                        .LINE     218
                        CPI       _ACCA, 233
                        .BRANCH   3,DCG._L0607
                        BREQ      DCG._L0607
                        .BRANCH   20,DCG._L0606
                        JMP       DCG._L0606
DCG._L0607:
DCG._L0605:
                        .BLOCK    219
                        .LINE     219
                        LDS       _ACCB, DCG.Temperature
                        LDS       _ACCA, DCG.Temperature+1
                        LDS       _ACCALO, DCG.Temperature+2
                        LDS       _ACCAHI, DCG.Temperature+3
                        STS       DCG.PARAM, _ACCB
                        STS       DCG.PARAM+1, _ACCA
                        STS       DCG.PARAM+2, _ACCALO
                        STS       DCG.PARAM+3, _ACCAHI
                        .LINE     220
                        LDI       _ACCA, 001h
                        STS       DCG.NACHKOMMA, _ACCA
                        .LINE     221
                        .BRANCH   17,DCG.WRITEPARAMSER
                        CALL      DCG.WRITEPARAMSER
                        .ENDBLOCK 222
                        .BRANCH   20,DCG._L0476
                        JMP       DCG._L0476
DCG._L0606:
                        .LINE     223
                        CPI       _ACCA, 251
                        .BRANCH   3,DCG._L0610
                        BREQ      DCG._L0610
                        .BRANCH   20,DCG._L0609
                        JMP       DCG._L0609
DCG._L0610:
DCG._L0608:
                        .BLOCK    224
                        .LINE     224
                        LDS       _ACCB, DCG.Errcount
                        LDS       _ACCA, DCG.Errcount+1
                        STS       DCG.PARAMINT, _ACCB
                        STS       DCG.PARAMINT+1, _ACCA
                        .LINE     225
                        .BRANCH   17,DCG.WRITEPARAMINTSER
                        CALL      DCG.WRITEPARAMINTSER
                        .ENDBLOCK 226
                        .BRANCH   20,DCG._L0476
                        JMP       DCG._L0476
DCG._L0609:
                        .LINE     227
                        CPI       _ACCA, 252
                        .BRANCH   3,DCG._L0613
                        BREQ      DCG._L0613
                        .BRANCH   20,DCG._L0612
                        JMP       DCG._L0612
DCG._L0613:
DCG._L0611:
                        .BLOCK    228
                        .LINE     228
                        LDI       _ACCCLO, DCG.EESerBaudReg AND 0FFh
                        LDI       _ACCCHI, DCG.EESerBaudReg SHRB 8
                        CALL      SYSTEM.ReadEEp8
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        STS       DCG.PARAMINT, _ACCB
                        STS       DCG.PARAMINT+1, _ACCA
                        .LINE     229
                        .BRANCH   17,DCG.WRITEPARAMINTSER
                        CALL      DCG.WRITEPARAMINTSER
                        .ENDBLOCK 230
                        .BRANCH   20,DCG._L0476
                        JMP       DCG._L0476
DCG._L0612:
                        .LINE     231
                        CPI       _ACCA, 253
                        .BRANCH   3,DCG._L0616
                        BREQ      DCG._L0616
                        .BRANCH   20,DCG._L0615
                        JMP       DCG._L0615
DCG._L0616:
DCG._L0614:
                        .BLOCK    232
                        .LINE     232
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.Serout SHRB 1
                        LDI       _ACCA, SYSTEM.Serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, DCG.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DCG.SerInpStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     233
                        .BRANCH   17,DCG.SERCRLF
                        CALL      DCG.SERCRLF
                        .LINE     234
                        .BRANCH   20,DCG.ParseGetParam_X
                        JMP       DCG.ParseGetParam_X
                        .ENDBLOCK 235
                        .BRANCH   20,DCG._L0476
                        JMP       DCG._L0476
DCG._L0615:
                        .LINE     236
                        CPI       _ACCA, 254
                        .BRANCH   3,DCG._L0619
                        BREQ      DCG._L0619
                        .BRANCH   20,DCG._L0618
                        JMP       DCG._L0618
DCG._L0619:
DCG._L0617:
                        .BLOCK    237
                        .LINE     237
                        .BRANCH   17,DCG.WRITECHPREFIX
                        CALL      DCG.WRITECHPREFIX
                        .LINE     238
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.serout SHRB 1
                        LDI       _ACCA, SYSTEM.serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, DCG.Vers1Str AND 0FFh
                        LDI       _ACCCHI, DCG.Vers1Str SHRB 8
                        CALL      SYSTEM.StrConst2Str
DCG._L0620:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     239
                        .BRANCH   17,DCG.SERCRLF
                        CALL      DCG.SERCRLF
                        .ENDBLOCK 240
                        .BRANCH   20,DCG._L0476
                        JMP       DCG._L0476
DCG._L0618:
                        .LINE     241
                        CPI       _ACCA, 250
                        .BRANCH   3,DCG._L0623
                        BREQ      DCG._L0623
                        .BRANCH   20,DCG._L0622
                        JMP       DCG._L0622
DCG._L0623:
                        .BRANCH   20,DCG._L0621
                        JMP       DCG._L0621
DCG._L0622:
                        CPI       _ACCA, 255
                        .BRANCH   3,DCG._L0625
                        BREQ      DCG._L0625
                        .BRANCH   20,DCG._L0624
                        JMP       DCG._L0624
DCG._L0625:
DCG._L0621:
                        .BLOCK    242
                        .LINE     242
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DCG.SERPROMPT
                        CALL      DCG.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 243
                        .BRANCH   20,DCG._L0476
                        JMP       DCG._L0476
DCG._L0624:
                        .BLOCK    244
                        .LINE     245
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 005h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DCG.SERPROMPT
                        CALL      DCG.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 246
DCG._L0476:
                        .ENDBLOCK 247
DCG.ParseGetParam_X:
                        .LINE     247
                        .BRANCH   19
                        RET
                        .ENDFUNC  247

                        .FUNC     ParseSetParam, 000FAh, 00020h
DCG.ParseSetParam:
                        .RETURNS   0
                        .BLOCK    251
                        .LINE     252
                        LDS       _ACCB, 003B0h
                        CLR       _ACCA
                        SBRC      _ACCB, 007h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DCG._L0628
                        BRNE      DCG._L0628
                        .BRANCH   20,DCG._L0626
                        JMP       DCG._L0626
DCG._L0628:
                        .BLOCK    252
                        .LINE     253
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 002h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DCG.SERPROMPT
                        CALL      DCG.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     254
                        .BRANCH   20,DCG.ParseSetParam_X
                        JMP       DCG.ParseSetParam_X
                        .ENDBLOCK 255
DCG._L0626:
DCG._L0627:
                        .LINE     256
                        LDI       _ACCA, 0FFh
                        STS       DCG.CHANGEDFLAG, _ACCA
                        .LINE     257
                        LDS       _ACCA, DCG.SubCh
                        .LINE     258
                        CPI       _ACCA, 0
                        .BRANCH   3,DCG._L0632
                        BREQ      DCG._L0632
                        .BRANCH   20,DCG._L0631
                        JMP       DCG._L0631
DCG._L0632:
DCG._L0630:
                        .BLOCK    259
                        .LINE     259
                        LDS       _ACCB, DCG.Param
                        LDS       _ACCA, DCG.Param+1
                        LDS       _ACCALO, DCG.Param+2
                        LDS       _ACCAHI, DCG.Param+3
                        STS       DCG.DCVOLT, _ACCB
                        STS       DCG.DCVOLT+1, _ACCA
                        STS       DCG.DCVOLT+2, _ACCALO
                        STS       DCG.DCVOLT+3, _ACCAHI
                        .ENDBLOCK 260
                        .BRANCH   20,DCG._L0629
                        JMP       DCG._L0629
DCG._L0631:
                        .LINE     261
                        CPI       _ACCA, 1
                        .BRANCH   3,DCG._L0635
                        BREQ      DCG._L0635
                        .BRANCH   20,DCG._L0634
                        JMP       DCG._L0634
DCG._L0635:
DCG._L0633:
                        .BLOCK    262
                        .LINE     262
                        LDS       _ACCB, DCG.Param
                        LDS       _ACCA, DCG.Param+1
                        LDS       _ACCALO, DCG.Param+2
                        LDS       _ACCAHI, DCG.Param+3
                        STS       DCG.DCAMP, _ACCB
                        STS       DCG.DCAMP+1, _ACCA
                        STS       DCG.DCAMP+2, _ACCALO
                        STS       DCG.DCAMP+3, _ACCAHI
                        .ENDBLOCK 263
                        .BRANCH   20,DCG._L0629
                        JMP       DCG._L0629
DCG._L0634:
                        .LINE     264
                        CPI       _ACCA, 2
                        .BRANCH   3,DCG._L0638
                        BREQ      DCG._L0638
                        .BRANCH   20,DCG._L0637
                        JMP       DCG._L0637
DCG._L0638:
DCG._L0636:
                        .BLOCK    265
                        .LINE     265
                        .BRANCH   17,DCG.PARAMDIV1000
                        CALL      DCG.PARAMDIV1000
                        .LINE     266
                        LDS       _ACCB, DCG.Param
                        LDS       _ACCA, DCG.Param+1
                        LDS       _ACCALO, DCG.Param+2
                        LDS       _ACCAHI, DCG.Param+3
                        STS       DCG.DCAMP, _ACCB
                        STS       DCG.DCAMP+1, _ACCA
                        STS       DCG.DCAMP+2, _ACCALO
                        STS       DCG.DCAMP+3, _ACCAHI
                        .ENDBLOCK 267
                        .BRANCH   20,DCG._L0629
                        JMP       DCG._L0629
DCG._L0637:
                        .LINE     268
                        CPI       _ACCA, 3
                        .BRANCH   3,DCG._L0641
                        BREQ      DCG._L0641
                        .BRANCH   20,DCG._L0640
                        JMP       DCG._L0640
DCG._L0641:
DCG._L0639:
                        .BLOCK    269
                        .LINE     269
                        .BRANCH   17,DCG.PARAMDIV1000
                        CALL      DCG.PARAMDIV1000
                        .LINE     270
                        .BRANCH   17,DCG.PARAMDIV1000
                        CALL      DCG.PARAMDIV1000
                        .LINE     271
                        LDS       _ACCB, DCG.Param
                        LDS       _ACCA, DCG.Param+1
                        LDS       _ACCALO, DCG.Param+2
                        LDS       _ACCAHI, DCG.Param+3
                        STS       DCG.DCAMP, _ACCB
                        STS       DCG.DCAMP+1, _ACCA
                        STS       DCG.DCAMP+2, _ACCALO
                        STS       DCG.DCAMP+3, _ACCAHI
                        .ENDBLOCK 272
                        .BRANCH   20,DCG._L0629
                        JMP       DCG._L0629
DCG._L0640:
                        .LINE     274
                        CPI       _ACCA, 7
                        .BRANCH   3,DCG._L0644
                        BREQ      DCG._L0644
                        .BRANCH   20,DCG._L0643
                        JMP       DCG._L0643
DCG._L0644:
DCG._L0642:
                        .BLOCK    275
                        .LINE     275
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 000h
                        STS       DCG.AH, _ACCB
                        STS       DCG.AH+1, _ACCA
                        STS       DCG.AH+2, _ACCALO
                        STS       DCG.AH+3, _ACCAHI
                        .LINE     276
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 000h
                        STS       DCG.WH, _ACCB
                        STS       DCG.WH+1, _ACCA
                        STS       DCG.WH+2, _ACCALO
                        STS       DCG.WH+3, _ACCAHI
                        .ENDBLOCK 277
                        .BRANCH   20,DCG._L0629
                        JMP       DCG._L0629
DCG._L0643:
                        .LINE     278
                        CPI       _ACCA, 8
                        .BRANCH   3,DCG._L0647
                        BREQ      DCG._L0647
                        .BRANCH   20,DCG._L0646
                        JMP       DCG._L0646
DCG._L0647:
DCG._L0645:
                        .BLOCK    279
                        .LINE     279
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 000h
                        STS       DCG.WH, _ACCB
                        STS       DCG.WH+1, _ACCA
                        STS       DCG.WH+2, _ACCALO
                        STS       DCG.WH+3, _ACCAHI
                        .LINE     280
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 000h
                        STS       DCG.AH, _ACCB
                        STS       DCG.AH+1, _ACCA
                        STS       DCG.AH+2, _ACCALO
                        STS       DCG.AH+3, _ACCAHI
                        .ENDBLOCK 281
                        .BRANCH   20,DCG._L0629
                        JMP       DCG._L0629
DCG._L0646:
                        .LINE     283
                        CPI       _ACCA, 20
                        .BRANCH   3,DCG._L0650
                        BREQ      DCG._L0650
                        .BRANCH   20,DCG._L0649
                        JMP       DCG._L0649
DCG._L0650:
DCG._L0648:
                        .BLOCK    284
                        .LINE     284
                        LDS       _ACCB, DCG.Param
                        LDS       _ACCA, DCG.Param+1
                        LDS       _ACCALO, DCG.Param+2
                        LDS       _ACCAHI, DCG.Param+3
                        MOVW      _ACCDLO, _ACCB
                        MOVW      _ACCELO, _ACCALO
                        LDI       _ACCBLO, 000h
                        LDI       _ACCBHI, 000h
                        LDI       _ACCCLO, 0C8h
                        LDI       _ACCCHI, 042h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat_R
                        STS       DCG.DCVOLTMOD, _ACCB
                        STS       DCG.DCVOLTMOD+1, _ACCA
                        STS       DCG.DCVOLTMOD+2, _ACCALO
                        STS       DCG.DCVOLTMOD+3, _ACCAHI
                        .ENDBLOCK 285
                        .BRANCH   20,DCG._L0629
                        JMP       DCG._L0629
DCG._L0649:
                        .LINE     286
                        CPI       _ACCA, 21
                        .BRANCH   2,DCG._L0653
                        BRCC      DCG._L0653
                        .BRANCH   20,DCG._L0652
                        JMP       DCG._L0652
DCG._L0653:
                        CPI       _ACCA, 23
                        .BRANCH   3,DCG._L0654
                        BREQ      DCG._L0654
                        .BRANCH   1,DCG._L0652
                        BRCS      DCG._L0654
                        .BRANCH   20,DCG._L0652
                        JMP       DCG._L0652
DCG._L0654:
DCG._L0651:
                        .BLOCK    287
                        .LINE     287
                        LDS       _ACCB, DCG.Param
                        LDS       _ACCA, DCG.Param+1
                        LDS       _ACCALO, DCG.Param+2
                        LDS       _ACCAHI, DCG.Param+3
                        MOVW      _ACCDLO, _ACCB
                        MOVW      _ACCELO, _ACCALO
                        LDI       _ACCBLO, 000h
                        LDI       _ACCBHI, 000h
                        LDI       _ACCCLO, 0C8h
                        LDI       _ACCCHI, 042h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat_R
                        STS       DCG.DCAMPMOD, _ACCB
                        STS       DCG.DCAMPMOD+1, _ACCA
                        STS       DCG.DCAMPMOD+2, _ACCALO
                        STS       DCG.DCAMPMOD+3, _ACCAHI
                        .ENDBLOCK 288
                        .BRANCH   20,DCG._L0629
                        JMP       DCG._L0629
DCG._L0652:
                        .LINE     289
                        CPI       _ACCA, 27
                        .BRANCH   3,DCG._L0657
                        BREQ      DCG._L0657
                        .BRANCH   20,DCG._L0656
                        JMP       DCG._L0656
DCG._L0657:
DCG._L0655:
                        .BLOCK    290
                        .LINE     290
                        LDS       _ACCB, DCG.ParamInt
                        LDS       _ACCA, DCG.ParamInt+1
                        STS       DCG.PWONTIME, _ACCB
                        STS       DCG.PWONTIME+1, _ACCA
                        .ENDBLOCK 291
                        .BRANCH   20,DCG._L0629
                        JMP       DCG._L0629
DCG._L0656:
                        .LINE     292
                        CPI       _ACCA, 28
                        .BRANCH   3,DCG._L0660
                        BREQ      DCG._L0660
                        .BRANCH   20,DCG._L0659
                        JMP       DCG._L0659
DCG._L0660:
DCG._L0658:
                        .BLOCK    293
                        .LINE     293
                        LDS       _ACCB, DCG.ParamInt
                        LDS       _ACCA, DCG.ParamInt+1
                        STS       DCG.PWOFFTIME, _ACCB
                        STS       DCG.PWOFFTIME+1, _ACCA
                        .ENDBLOCK 294
                        .BRANCH   20,DCG._L0629
                        JMP       DCG._L0629
DCG._L0659:
                        .LINE     295
                        CPI       _ACCA, 29
                        .BRANCH   3,DCG._L0663
                        BREQ      DCG._L0663
                        .BRANCH   20,DCG._L0662
                        JMP       DCG._L0662
DCG._L0663:
DCG._L0661:
                        .BLOCK    296
                        .LINE     296
                        LDS       _ACCB, DCG.ParamInt
                        LDS       _ACCA, DCG.ParamInt+1
                        STS       DCG.RIPPLEPERCENT, _ACCB
                        STS       DCG.RIPPLEPERCENT+1, _ACCA
                        .ENDBLOCK 297
                        .BRANCH   20,DCG._L0629
                        JMP       DCG._L0629
DCG._L0662:
                        .LINE     298
                        CPI       _ACCA, 80
                        .BRANCH   3,DCG._L0666
                        BREQ      DCG._L0666
                        .BRANCH   20,DCG._L0665
                        JMP       DCG._L0665
DCG._L0666:
DCG._L0664:
                        .BLOCK    299
                        .LINE     299
                        LDS       _ACCA, DCG.ParamByte
                        STS       DCG.MODIFY, _ACCA
                        .LINE     300
                        .BRANCH   17,DCG.WERTEONLCD
                        CALL      DCG.WERTEONLCD
                        .ENDBLOCK 301
                        .BRANCH   20,DCG._L0629
                        JMP       DCG._L0629
DCG._L0665:
                        .LINE     302
                        CPI       _ACCA, 89
                        .BRANCH   3,DCG._L0669
                        BREQ      DCG._L0669
                        .BRANCH   20,DCG._L0668
                        JMP       DCG._L0668
DCG._L0669:
DCG._L0667:
                        .BLOCK    303
                        .LINE     303
                        LDS       _ACCB, 003B0h
                        CLR       _ACCA
                        SBRC      _ACCB, 004h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DCG._L0672
                        BRNE      DCG._L0672
                        .BRANCH   20,DCG._L0670
                        JMP       DCG._L0670
DCG._L0672:
                        .BLOCK    303
                        .LINE     304
                        LDS       _ACCB, DCG.ParamInt
                        LDS       _ACCA, DCG.ParamInt+1
                        STS       DCG.INCRAST, _ACCB
                        STS       DCG.INCRAST+1, _ACCA
                        .LINE     305
                        LDS       _ACCB, DCG.Param
                        LDS       _ACCA, DCG.Param+1
                        LDS       _ACCALO, DCG.Param+2
                        LDS       _ACCAHI, DCG.Param+3
                        LDI       _ACCCLO, DCG.INITINCRAST AND 0FFh
                        LDI       _ACCCHI, DCG.INITINCRAST SHRB 8
                        MOVW      _ACCBLO, _ACCB
                        CALL      SYSTEM._WriteEEp32
                        ADIW      _ACCCLO, 01h
                        .ENDBLOCK 306
                        .BRANCH   20,DCG._L0671
                        JMP       DCG._L0671
DCG._L0670:
                        .BLOCK    306
                        .LINE     307
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 006h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DCG.SERPROMPT
                        CALL      DCG.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     308
                        .BRANCH   20,DCG.ParseSetParam_X
                        JMP       DCG.ParseSetParam_X
                        .ENDBLOCK 309
DCG._L0671:
                        .ENDBLOCK 310
                        .BRANCH   20,DCG._L0629
                        JMP       DCG._L0629
DCG._L0668:
                        .LINE     311
                        CPI       _ACCA, 100
                        .BRANCH   2,DCG._L0675
                        BRCC      DCG._L0675
                        .BRANCH   20,DCG._L0674
                        JMP       DCG._L0674
DCG._L0675:
                        CPI       _ACCA, 115
                        .BRANCH   3,DCG._L0676
                        BREQ      DCG._L0676
                        .BRANCH   1,DCG._L0674
                        BRCS      DCG._L0676
                        .BRANCH   20,DCG._L0674
                        JMP       DCG._L0674
DCG._L0676:
                        .BRANCH   20,DCG._L0673
                        JMP       DCG._L0673
DCG._L0674:
                        CPI       _ACCA, 200
                        .BRANCH   2,DCG._L0678
                        BRCC      DCG._L0678
                        .BRANCH   20,DCG._L0677
                        JMP       DCG._L0677
DCG._L0678:
                        CPI       _ACCA, 215
                        .BRANCH   3,DCG._L0679
                        BREQ      DCG._L0679
                        .BRANCH   1,DCG._L0677
                        BRCS      DCG._L0679
                        .BRANCH   20,DCG._L0677
                        JMP       DCG._L0677
DCG._L0679:
DCG._L0673:
                        .BLOCK    312
                        .LINE     312
                        LDS       _ACCB, 003B0h
                        CLR       _ACCA
                        SBRC      _ACCB, 004h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DCG._L0682
                        BRNE      DCG._L0682
                        .BRANCH   20,DCG._L0680
                        JMP       DCG._L0680
DCG._L0682:
                        .BLOCK    312
                        .LINE     313
                        LDS       _ACCA, DCG.SubCh
                        .LINE     314
                        CPI       _ACCA, 100
                        .BRANCH   3,DCG._L0686
                        BREQ      DCG._L0686
                        .BRANCH   20,DCG._L0685
                        JMP       DCG._L0685
DCG._L0686:
                        .BRANCH   20,DCG._L0684
                        JMP       DCG._L0684
DCG._L0685:
                        CPI       _ACCA, 101
                        .BRANCH   3,DCG._L0688
                        BREQ      DCG._L0688
                        .BRANCH   20,DCG._L0687
                        JMP       DCG._L0687
DCG._L0688:
DCG._L0684:
                        .BLOCK    315
                        .LINE     315
                        LDI       _ACCCLO, DCG.DACUoffsets AND 0FFh
                        LDI       _ACCCHI, DCG.DACUoffsets SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DCG.SubCh
                        SUBI      _ACCA, 064h AND 0FFh
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LDS       _ACCB, DCG.ParamInt
                        LDS       _ACCA, DCG.ParamInt+1
                        MOVW      _ACCALO, _ACCB
                        CALL      SYSTEM._WriteEEp16
                        .ENDBLOCK 316
                        .BRANCH   20,DCG._L0683
                        JMP       DCG._L0683
DCG._L0687:
                        .LINE     317
                        CPI       _ACCA, 102
                        .BRANCH   2,DCG._L0691
                        BRCC      DCG._L0691
                        .BRANCH   20,DCG._L0690
                        JMP       DCG._L0690
DCG._L0691:
                        CPI       _ACCA, 105
                        .BRANCH   3,DCG._L0692
                        BREQ      DCG._L0692
                        .BRANCH   1,DCG._L0690
                        BRCS      DCG._L0692
                        .BRANCH   20,DCG._L0690
                        JMP       DCG._L0690
DCG._L0692:
DCG._L0689:
                        .BLOCK    318
                        .LINE     318
                        LDI       _ACCCLO, DCG.DACIoffsets AND 0FFh
                        LDI       _ACCCHI, DCG.DACIoffsets SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DCG.SubCh
                        SUBI      _ACCA, 066h AND 0FFh
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LDS       _ACCB, DCG.ParamInt
                        LDS       _ACCA, DCG.ParamInt+1
                        MOVW      _ACCALO, _ACCB
                        CALL      SYSTEM._WriteEEp16
                        .ENDBLOCK 319
                        .BRANCH   20,DCG._L0683
                        JMP       DCG._L0683
DCG._L0690:
                        .LINE     320
                        CPI       _ACCA, 110
                        .BRANCH   3,DCG._L0695
                        BREQ      DCG._L0695
                        .BRANCH   20,DCG._L0694
                        JMP       DCG._L0694
DCG._L0695:
                        .BRANCH   20,DCG._L0693
                        JMP       DCG._L0693
DCG._L0694:
                        CPI       _ACCA, 111
                        .BRANCH   3,DCG._L0697
                        BREQ      DCG._L0697
                        .BRANCH   20,DCG._L0696
                        JMP       DCG._L0696
DCG._L0697:
DCG._L0693:
                        .BLOCK    321
                        .LINE     321
                        LDI       _ACCCLO, DCG.ADCUoffsets AND 0FFh
                        LDI       _ACCCHI, DCG.ADCUoffsets SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DCG.SubCh
                        SUBI      _ACCA, 06Eh AND 0FFh
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LDS       _ACCB, DCG.ParamInt
                        LDS       _ACCA, DCG.ParamInt+1
                        MOVW      _ACCALO, _ACCB
                        CALL      SYSTEM._WriteEEp16
                        .ENDBLOCK 322
                        .BRANCH   20,DCG._L0683
                        JMP       DCG._L0683
DCG._L0696:
                        .LINE     323
                        CPI       _ACCA, 112
                        .BRANCH   2,DCG._L0700
                        BRCC      DCG._L0700
                        .BRANCH   20,DCG._L0699
                        JMP       DCG._L0699
DCG._L0700:
                        CPI       _ACCA, 115
                        .BRANCH   3,DCG._L0701
                        BREQ      DCG._L0701
                        .BRANCH   1,DCG._L0699
                        BRCS      DCG._L0701
                        .BRANCH   20,DCG._L0699
                        JMP       DCG._L0699
DCG._L0701:
DCG._L0698:
                        .BLOCK    324
                        .LINE     324
                        LDI       _ACCCLO, DCG.ADCIoffsets AND 0FFh
                        LDI       _ACCCHI, DCG.ADCIoffsets SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DCG.SubCh
                        SUBI      _ACCA, 070h AND 0FFh
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LDS       _ACCB, DCG.ParamInt
                        LDS       _ACCA, DCG.ParamInt+1
                        MOVW      _ACCALO, _ACCB
                        CALL      SYSTEM._WriteEEp16
                        .ENDBLOCK 325
                        .BRANCH   20,DCG._L0683
                        JMP       DCG._L0683
DCG._L0699:
                        .LINE     326
                        CPI       _ACCA, 200
                        .BRANCH   3,DCG._L0704
                        BREQ      DCG._L0704
                        .BRANCH   20,DCG._L0703
                        JMP       DCG._L0703
DCG._L0704:
                        .BRANCH   20,DCG._L0702
                        JMP       DCG._L0702
DCG._L0703:
                        CPI       _ACCA, 201
                        .BRANCH   3,DCG._L0706
                        BREQ      DCG._L0706
                        .BRANCH   20,DCG._L0705
                        JMP       DCG._L0705
DCG._L0706:
DCG._L0702:
                        .BLOCK    327
                        .LINE     327
                        LDI       _ACCCLO, DCG.DACUscales AND 0FFh
                        LDI       _ACCCHI, DCG.DACUscales SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DCG.SubCh
                        SUBI      _ACCA, 0C8h AND 0FFh
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
                        LDS       _ACCB, DCG.Param
                        LDS       _ACCA, DCG.Param+1
                        LDS       _ACCALO, DCG.Param+2
                        LDS       _ACCAHI, DCG.Param+3
                        POP       _ACCCHI
                        POP       _ACCCLO
                        MOVW      _ACCBLO, _ACCB
                        CALL      SYSTEM._WriteEEp32
                        .ENDBLOCK 328
                        .BRANCH   20,DCG._L0683
                        JMP       DCG._L0683
DCG._L0705:
                        .LINE     329
                        CPI       _ACCA, 202
                        .BRANCH   2,DCG._L0709
                        BRCC      DCG._L0709
                        .BRANCH   20,DCG._L0708
                        JMP       DCG._L0708
DCG._L0709:
                        CPI       _ACCA, 205
                        .BRANCH   3,DCG._L0710
                        BREQ      DCG._L0710
                        .BRANCH   1,DCG._L0708
                        BRCS      DCG._L0710
                        .BRANCH   20,DCG._L0708
                        JMP       DCG._L0708
DCG._L0710:
DCG._L0707:
                        .BLOCK    330
                        .LINE     330
                        LDI       _ACCCLO, DCG.DACIscales AND 0FFh
                        LDI       _ACCCHI, DCG.DACIscales SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DCG.SubCh
                        SUBI      _ACCA, 0CAh AND 0FFh
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
                        LDS       _ACCB, DCG.Param
                        LDS       _ACCA, DCG.Param+1
                        LDS       _ACCALO, DCG.Param+2
                        LDS       _ACCAHI, DCG.Param+3
                        POP       _ACCCHI
                        POP       _ACCCLO
                        MOVW      _ACCBLO, _ACCB
                        CALL      SYSTEM._WriteEEp32
                        .ENDBLOCK 331
                        .BRANCH   20,DCG._L0683
                        JMP       DCG._L0683
DCG._L0708:
                        .LINE     332
                        CPI       _ACCA, 210
                        .BRANCH   3,DCG._L0713
                        BREQ      DCG._L0713
                        .BRANCH   20,DCG._L0712
                        JMP       DCG._L0712
DCG._L0713:
                        .BRANCH   20,DCG._L0711
                        JMP       DCG._L0711
DCG._L0712:
                        CPI       _ACCA, 211
                        .BRANCH   3,DCG._L0715
                        BREQ      DCG._L0715
                        .BRANCH   20,DCG._L0714
                        JMP       DCG._L0714
DCG._L0715:
DCG._L0711:
                        .BLOCK    333
                        .LINE     333
                        LDI       _ACCCLO, DCG.ADCUscales AND 0FFh
                        LDI       _ACCCHI, DCG.ADCUscales SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DCG.SubCh
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
                        LDS       _ACCB, DCG.Param
                        LDS       _ACCA, DCG.Param+1
                        LDS       _ACCALO, DCG.Param+2
                        LDS       _ACCAHI, DCG.Param+3
                        POP       _ACCCHI
                        POP       _ACCCLO
                        MOVW      _ACCBLO, _ACCB
                        CALL      SYSTEM._WriteEEp32
                        .ENDBLOCK 334
                        .BRANCH   20,DCG._L0683
                        JMP       DCG._L0683
DCG._L0714:
                        .LINE     335
                        CPI       _ACCA, 212
                        .BRANCH   2,DCG._L0718
                        BRCC      DCG._L0718
                        .BRANCH   20,DCG._L0717
                        JMP       DCG._L0717
DCG._L0718:
                        CPI       _ACCA, 215
                        .BRANCH   3,DCG._L0719
                        BREQ      DCG._L0719
                        .BRANCH   1,DCG._L0717
                        BRCS      DCG._L0719
                        .BRANCH   20,DCG._L0717
                        JMP       DCG._L0717
DCG._L0719:
DCG._L0716:
                        .BLOCK    336
                        .LINE     336
                        LDI       _ACCCLO, DCG.ADCIscales AND 0FFh
                        LDI       _ACCCHI, DCG.ADCIscales SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DCG.SubCh
                        SUBI      _ACCA, 0D4h AND 0FFh
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
                        LDS       _ACCB, DCG.Param
                        LDS       _ACCA, DCG.Param+1
                        LDS       _ACCALO, DCG.Param+2
                        LDS       _ACCAHI, DCG.Param+3
                        POP       _ACCCHI
                        POP       _ACCCLO
                        MOVW      _ACCBLO, _ACCB
                        CALL      SYSTEM._WriteEEp32
                        .ENDBLOCK 337
                        .BRANCH   20,DCG._L0683
                        JMP       DCG._L0683
DCG._L0717:
DCG._L0683:
                        .LINE     339
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DCG.INITSCALES
                        CALL      DCG.INITSCALES
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     340
                        LDI       _ACCA, 00003h SHRB 8
                        LDI       _ACCB, 00003h AND 0FFh
                        .FRAME  0
                        CALL      SYSTEM.MDELAY
                        .ENDBLOCK 341
                        .BRANCH   20,DCG._L0681
                        JMP       DCG._L0681
DCG._L0680:
                        .BLOCK    341
                        .LINE     342
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 006h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DCG.SERPROMPT
                        CALL      DCG.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     343
                        .BRANCH   20,DCG.ParseSetParam_X
                        JMP       DCG.ParseSetParam_X
                        .ENDBLOCK 344
DCG._L0681:
                        .ENDBLOCK 345
                        .BRANCH   20,DCG._L0629
                        JMP       DCG._L0629
DCG._L0677:
                        .LINE     346
                        CPI       _ACCA, 150
                        .BRANCH   2,DCG._L0722
                        BRCC      DCG._L0722
                        .BRANCH   20,DCG._L0721
                        JMP       DCG._L0721
DCG._L0722:
                        CPI       _ACCA, 174
                        .BRANCH   3,DCG._L0723
                        BREQ      DCG._L0723
                        .BRANCH   1,DCG._L0721
                        BRCS      DCG._L0723
                        .BRANCH   20,DCG._L0721
                        JMP       DCG._L0721
DCG._L0723:
DCG._L0720:
                        .BLOCK    347
                        .LINE     347
                        LDS       _ACCB, 003B0h
                        CLR       _ACCA
                        SBRC      _ACCB, 004h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DCG._L0726
                        BRNE      DCG._L0726
                        .BRANCH   20,DCG._L0724
                        JMP       DCG._L0724
DCG._L0726:
                        .BLOCK    347
                        .LINE     348
                        LDI       _ACCCLO, DCG.OptionArray AND 0FFh
                        LDI       _ACCCHI, DCG.OptionArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DCG.subCh
                        SUBI      _ACCA, 096h AND 0FFh
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
                        LDS       _ACCB, DCG.Param
                        LDS       _ACCA, DCG.Param+1
                        LDS       _ACCALO, DCG.Param+2
                        LDS       _ACCAHI, DCG.Param+3
                        POP       _ACCCHI
                        POP       _ACCCLO
                        MOVW      _ACCBLO, _ACCB
                        CALL      SYSTEM._WriteEEp32
                        .LINE     349
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DCG.INITSCALES
                        CALL      DCG.INITSCALES
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     350
                        LDI       _ACCA, 00003h SHRB 8
                        LDI       _ACCB, 00003h AND 0FFh
                        .FRAME  0
                        CALL      SYSTEM.MDELAY
                        .ENDBLOCK 351
                        .BRANCH   20,DCG._L0725
                        JMP       DCG._L0725
DCG._L0724:
                        .BLOCK    351
                        .LINE     352
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 006h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DCG.SERPROMPT
                        CALL      DCG.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     353
                        .BRANCH   20,DCG.ParseSetParam_X
                        JMP       DCG.ParseSetParam_X
                        .ENDBLOCK 354
DCG._L0725:
                        .ENDBLOCK 355
                        .BRANCH   20,DCG._L0629
                        JMP       DCG._L0629
DCG._L0721:
                        .LINE     356
                        CPI       _ACCA, 250
                        .BRANCH   3,DCG._L0729
                        BREQ      DCG._L0729
                        .BRANCH   20,DCG._L0728
                        JMP       DCG._L0728
DCG._L0729:
DCG._L0727:
                        .BRANCH   20,DCG._L0629
                        JMP       DCG._L0629
DCG._L0728:
                        .LINE     358
                        CPI       _ACCA, 251
                        .BRANCH   3,DCG._L0732
                        BREQ      DCG._L0732
                        .BRANCH   20,DCG._L0731
                        JMP       DCG._L0731
DCG._L0732:
DCG._L0730:
                        .BLOCK    359
                        .LINE     359
                        LDS       _ACCB, DCG.ParamInt
                        LDS       _ACCA, DCG.ParamInt+1
                        STS       DCG.ERRCOUNT, _ACCB
                        STS       DCG.ERRCOUNT+1, _ACCA
                        .ENDBLOCK 360
                        .BRANCH   20,DCG._L0629
                        JMP       DCG._L0629
DCG._L0731:
                        .LINE     361
                        CPI       _ACCA, 252
                        .BRANCH   3,DCG._L0735
                        BREQ      DCG._L0735
                        .BRANCH   20,DCG._L0734
                        JMP       DCG._L0734
DCG._L0735:
DCG._L0733:
                        .BLOCK    362
                        .LINE     362
                        LDS       _ACCB, 003B0h
                        CLR       _ACCA
                        SBRC      _ACCB, 004h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DCG._L0738
                        BRNE      DCG._L0738
                        .BRANCH   20,DCG._L0736
                        JMP       DCG._L0736
DCG._L0738:
                        .BLOCK    362
                        .LINE     363
                        LDS       _ACCA, DCG.ParamByte
                        LDI       _ACCCLO, DCG.EESERBAUDREG AND 0FFh
                        LDI       _ACCCHI, DCG.EESERBAUDREG SHRB 8
                        CALL      SYSTEM.WriteEEp8
                        ADIW      _ACCCLO, 01h
                        .ENDBLOCK 364
                        .BRANCH   20,DCG._L0737
                        JMP       DCG._L0737
DCG._L0736:
                        .BLOCK    364
                        .LINE     365
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 006h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DCG.SERPROMPT
                        CALL      DCG.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     366
                        .BRANCH   20,DCG.ParseSetParam_X
                        JMP       DCG.ParseSetParam_X
                        .ENDBLOCK 367
DCG._L0737:
                        .ENDBLOCK 368
                        .BRANCH   20,DCG._L0629
                        JMP       DCG._L0629
DCG._L0734:
                        .BLOCK    369
                        .LINE     370
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 005h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DCG.SERPROMPT
                        CALL      DCG.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     371
                        .BRANCH   20,DCG.ParseSetParam_X
                        JMP       DCG.ParseSetParam_X
                        .ENDBLOCK 372
DCG._L0629:
                        .LINE     373
                        LDS       _ACCA, 003B0h
                        CBR       _ACCA, 010h
                        STS       003B0h, _ACCA
                        .LINE     374
                        LDS       _ACCA, DCG.SubCh
                        CPI       _ACCA, 0FAh
                        LDI       _ACCA, 0h
                        BRNE      DCG._L0739
                        SER       _ACCA
DCG._L0739:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0742
                        BRNE      DCG._L0742
                        .BRANCH   20,DCG._L0740
                        JMP       DCG._L0740
DCG._L0742:
                        .BLOCK    375
                        .LINE     375
                        LDS       _ACCA, 003B0h
                        SBR       _ACCA, 010h
                        STS       003B0h, _ACCA
                        .ENDBLOCK 376
DCG._L0740:
DCG._L0741:
                        .LINE     377
                        .BRANCH   17,DCG.CHECKLIMITS
                        CALL      DCG.CHECKLIMITS
                        .LINE     378
                        LDS       _ACCA, DCG.verbose
                        PUSH      _ACCA
                        LDS       _ACCA, DCG.CheckLimitErr
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      DCG._L0743
                        SER       _ACCA
DCG._L0743:
                        POP       _ACCB
                        OR        _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   4,DCG._L0746
                        BRNE      DCG._L0746
                        .BRANCH   20,DCG._L0744
                        JMP       DCG._L0744
DCG._L0746:
                        .BLOCK    378
                        .LINE     379
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCA, DCG.CheckLimitErr
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DCG.SERPROMPT
                        CALL      DCG.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 380
DCG._L0744:
DCG._L0745:
                        .LINE     381
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DCG.SETLEVELDAC
                        CALL      DCG.SETLEVELDAC
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 382
DCG.ParseSetParam_X:
                        .LINE     382
                        .BRANCH   19
                        RET
                        .ENDFUNC  382

                        .FUNC     Cmd2Index, 00185h, 00020h
DCG.Cmd2Index:
                        .RETURNS   1
                        SBIW      _FRAMEPTR, 1
                        .BLOCK    392
                        .LINE     393
                        LDI       _ACCCLO, DCG.ParamStr AND 0FFh
                        LDI       _ACCCHI, DCG.ParamStr SHRB 8
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
                        LDI       _ACCCLO, DCG.ParamStr AND 0FFh
                        LDI       _ACCCHI, DCG.ParamStr SHRB 8
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
                        .LINE     394
                        .LOOP
                        MOVW      _ACCCLO, _FRAMEPTR
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 000h
                        ST        Z, _ACCA
                        LDI       _ACCA, 01Ah
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
DCG._L0749:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      DCG._L0750
                        CLR       _ACCA
DCG._L0750:
                        TST       _ACCA
                        .BRANCH   3,DCG._L0751
                        BREQ      DCG._L0751
                        .BRANCH   20,DCG._L0748
                        JMP       DCG._L0748
DCG._L0751:
                        .BLOCK    395
                        .LINE     395
                        LDI       _ACCCLO, DCG.ParamStr AND 0FFh
                        LDI       _ACCCHI, DCG.ParamStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCCLO, DCG.CmdStrArr AND 0FFh
                        LDI       _ACCCHI, DCG.CmdStrArr SHRB 8
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
                        BRNE      DCG._L0752
                        SER       _ACCA
DCG._L0752:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0755
                        BRNE      DCG._L0755
                        .BRANCH   20,DCG._L0753
                        JMP       DCG._L0753
DCG._L0755:
                        .BLOCK    395
                        .LINE     396
                        LDD       _ACCA, Y+003h
                        ADIW      _FRAMEPTR, 3
                        .BRANCH   20,DCG.Cmd2Index_X
                        JMP       DCG.Cmd2Index_X
                        .ENDBLOCK 397
DCG._L0753:
DCG._L0754:
                        .ENDBLOCK 398
DCG._L0747:
                        .LINE     398
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,DCG._L0748
                        BREQ      DCG._L0748
                        .BRANCH   20,DCG._L0749
                        JMP       DCG._L0749
DCG._L0748:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .LINE     399
                        LDI       _ACCA, 01Bh
                        .ENDBLOCK 400
DCG.Cmd2Index_X:
                        .LINE     400
                        .BRANCH   19
                        RET
                        .ENDFUNC  400

                        .FUNC     ParseExtract, 00192h, 00020h
DCG.ParseExtract:
                        .RETURNS   1
                        SBIW      _FRAMEPTR, 2
                        .BLOCK    406
                        .LINE     407
                        LDI       _ACCCLO, DCG.ParamStr AND 0FFh
                        LDI       _ACCCHI, DCG.ParamStr SHRB 8
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
                        .LINE     408
                        LDI       _ACCA, 000h
                        STD       Y+000h, _ACCA
                        .LINE     409
DCG._L0756:
                        LDI       _ACCCLO, DCG.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DCG.SerInpStr SHRB 8
                        LDS       _ACCA, DCG.SerInpPtr
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCA, Z+
                        CPI       _ACCA, 020h
                        LDI       _ACCA, 0h
                        BRNE      DCG._L0758
                        SER       _ACCA
DCG._L0758:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0759
                        BRNE      DCG._L0759
                        .BRANCH   20,DCG._L0757
                        JMP       DCG._L0757
DCG._L0759:
                        .BLOCK    410
                        .LINE     410
                        LDS       _ACCA, DCG.serInpPtr
                        INC       _ACCA
                        STS       DCG.serInpPtr, _ACCA
                        .ENDBLOCK 411
                        .LINE     411
                        .BRANCH   20,DCG._L0756
                        JMP       DCG._L0756
DCG._L0757:
                        .LINE     412
                        LDI       _ACCCLO, DCG.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DCG.SerInpStr SHRB 8
                        LDS       _ACCA, DCG.SerInpPtr
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCA, Z+
                        CPI       _ACCA, 039h
                        .BRANCH   3,DCG._L0760
                        BREQ      DCG._L0760
                        .BRANCH   1,DCG._L0761
                        BRSH      DCG._L0761
                        CPI       _ACCA, 02Ah
                        .BRANCH   1,DCG._L0761
                        BRLO      DCG._L0761
                        LDI       _ACCDLO, 0
                        SEZ
                        .BRANCH   20,DCG._L0760
                        RJMP      DCG._L0760
DCG._L0761:
                        LDI       _ACCDLO, 001h
DCG._L0760:
                        LDI       _ACCA, 0h
                        BRNE      DCG._L0762
                        SER       _ACCA
DCG._L0762:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0765
                        BRNE      DCG._L0765
                        .BRANCH   20,DCG._L0763
                        JMP       DCG._L0763
DCG._L0765:
                        .BLOCK    413
                        .LINE     413
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .LINE     414
                        .LOOP
                        LDI       _ACCCLO, DCG.i AND 0FFh
                        LDI       _ACCCHI, DCG.i SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDS       _ACCA, DCG.SerInpPtr
                        ST        Z, _ACCA
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCCLO, DCG.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DCG.SerInpStr SHRB 8
                        LD        _ACCA, Z
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
DCG._L0768:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      DCG._L0769
                        CLR       _ACCA
DCG._L0769:
                        TST       _ACCA
                        .BRANCH   3,DCG._L0770
                        BREQ      DCG._L0770
                        .BRANCH   20,DCG._L0767
                        JMP       DCG._L0767
DCG._L0770:
                        .BLOCK    415
                        .LINE     415
                        LDI       _ACCCLO, DCG.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DCG.SerInpStr SHRB 8
                        MOV       _ACCA, DCG.i
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCA, Z+
                        STD       Y+004h, _ACCA
                        .LINE     416
                        LDD       _ACCA, Y+004h
                        CPI       _ACCA, 039h
                        .BRANCH   3,DCG._L0771
                        BREQ      DCG._L0771
                        .BRANCH   1,DCG._L0772
                        BRSH      DCG._L0772
                        CPI       _ACCA, 02Ah
                        .BRANCH   1,DCG._L0772
                        BRLO      DCG._L0772
                        LDI       _ACCDLO, 0
                        SEZ
                        .BRANCH   20,DCG._L0771
                        RJMP      DCG._L0771
DCG._L0772:
                        LDI       _ACCDLO, 001h
DCG._L0771:
                        LDI       _ACCA, 0h
                        BRNE      DCG._L0773
                        SER       _ACCA
DCG._L0773:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0776
                        BRNE      DCG._L0776
                        .BRANCH   20,DCG._L0774
                        JMP       DCG._L0774
DCG._L0776:
                        .BLOCK    416
                        .LINE     417
                        LDD       _ACCA, Y+004h
                        MOV       _ACCEHI, _ACCA
                        LDI       _ACCELO, 001h
                        LDI       _ACCA, _ACCELO SHRB 8
                        LDI       _ACCB, _ACCELO AND 0FFh
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDI       _ACCCLO, DCG.ParamStr AND 0FFh
                        LDI       _ACCCHI, DCG.ParamStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCA, 028h
                        PUSH      _ACCA
                        LDI       _ACCFHI, 000h
                        CALL      SYSTEM.StringAppend
                        .ENDBLOCK 419
                        .BRANCH   20,DCG._L0775
                        JMP       DCG._L0775
DCG._L0774:
                        .BLOCK    419
                        .LINE     419
                        MOV       _ACCA, DCG.i
                        STS       DCG.SERINPPTR, _ACCA
                        .LINE     420
                        LDD       _ACCA, Y+003h
                        ADIW      _FRAMEPTR, 3
                        .BRANCH   20,DCG.ParseExtract_X
                        JMP       DCG.ParseExtract_X
                        .ENDBLOCK 421
DCG._L0775:
                        .ENDBLOCK 422
DCG._L0766:
                        .LINE     422
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,DCG._L0767
                        BREQ      DCG._L0767
                        .BRANCH   20,DCG._L0768
                        JMP       DCG._L0768
DCG._L0767:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .ENDBLOCK 423
                        .BRANCH   20,DCG._L0764
                        JMP       DCG._L0764
DCG._L0763:
                        .BLOCK    423
                        .LINE     424
                        .LOOP
                        LDI       _ACCCLO, DCG.i AND 0FFh
                        LDI       _ACCCHI, DCG.i SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDS       _ACCA, DCG.SerInpPtr
                        ST        Z, _ACCA
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCCLO, DCG.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DCG.SerInpStr SHRB 8
                        LD        _ACCA, Z
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
DCG._L0779:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      DCG._L0780
                        CLR       _ACCA
DCG._L0780:
                        TST       _ACCA
                        .BRANCH   3,DCG._L0781
                        BREQ      DCG._L0781
                        .BRANCH   20,DCG._L0778
                        JMP       DCG._L0778
DCG._L0781:
                        .BLOCK    425
                        .LINE     425
                        LDI       _ACCCLO, DCG.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DCG.SerInpStr SHRB 8
                        MOV       _ACCA, DCG.i
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCA, Z+
                        STD       Y+004h, _ACCA
                        .LINE     426
                        LDD       _ACCA, Y+004h
                        CPI       _ACCA, 041h
                        LDI       _ACCA, 0
                        BRLO      DCG._L0782
                        LDI       _ACCA, 0FFh
DCG._L0782:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0785
                        BRNE      DCG._L0785
                        .BRANCH   20,DCG._L0783
                        JMP       DCG._L0783
DCG._L0785:
                        .BLOCK    426
                        .LINE     427
                        LDD       _ACCA, Y+004h
                        MOV       _ACCEHI, _ACCA
                        LDI       _ACCELO, 001h
                        LDI       _ACCA, _ACCELO SHRB 8
                        LDI       _ACCB, _ACCELO AND 0FFh
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDI       _ACCCLO, DCG.ParamStr AND 0FFh
                        LDI       _ACCCHI, DCG.ParamStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCA, 028h
                        PUSH      _ACCA
                        LDI       _ACCFHI, 000h
                        CALL      SYSTEM.StringAppend
                        .ENDBLOCK 429
                        .BRANCH   20,DCG._L0784
                        JMP       DCG._L0784
DCG._L0783:
                        .BLOCK    429
                        .LINE     429
                        MOV       _ACCA, DCG.i
                        STS       DCG.SERINPPTR, _ACCA
                        .LINE     430
                        LDD       _ACCA, Y+003h
                        ADIW      _FRAMEPTR, 3
                        .BRANCH   20,DCG.ParseExtract_X
                        JMP       DCG.ParseExtract_X
                        .ENDBLOCK 431
DCG._L0784:
                        .ENDBLOCK 432
DCG._L0777:
                        .LINE     432
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,DCG._L0778
                        BREQ      DCG._L0778
                        .BRANCH   20,DCG._L0779
                        JMP       DCG._L0779
DCG._L0778:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .ENDBLOCK 433
DCG._L0764:
                        .LINE     434
                        LDD       _ACCA, Y+000h
                        .ENDBLOCK 435
DCG.ParseExtract_X:
                        .LINE     435
                        .BRANCH   19
                        RET
                        .ENDFUNC  435

                        .FUNC     ParseSubCh, 001B5h, 00020h
DCG.ParseSubCh:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 12
                        .BLOCK    448
                        .LINE     449
                        LDI       _ACCCLO, DCG.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DCG.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCCLO, $St_String15 AND 0FFh
                        LDI       _ACCCHI, $St_String15 SHRB 8
                        POP       _ACCBHI
                        POP       _ACCBLO
                        SET
                        BLD       Flags, _STRCONST
                        CALL      SYSTEM.StringComp
                        LDI       _ACCA, 0h
                        BRNE      DCG._L0786
                        SER       _ACCA
DCG._L0786:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0789
                        BRNE      DCG._L0789
                        .BRANCH   20,DCG._L0787
                        JMP       DCG._L0787
DCG._L0789:
                        .BLOCK    449
                        .LINE     450
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DCG.SERPROMPT
                        CALL      DCG.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     451
                        .BRANCH   20,DCG.ParseSubCh_X
                        JMP       DCG.ParseSubCh_X
                        .ENDBLOCK 452
DCG._L0787:
DCG._L0788:
                        .LINE     453
                        LDI       _ACCA, 03Ah
                        PUSH      _ACCA
                        LDI       _ACCCLO, DCG.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DCG.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCELO, 001h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCB
                        CALL      SYSTEM.PosChInVarStr
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      DCG._L0790
                        BRLO      DCG._L0790
                        SER       _ACCA
DCG._L0790:
                        STD       Y+005h, _ACCA
                        .LINE     454
                        LDI       _ACCA, 03Dh
                        PUSH      _ACCA
                        LDI       _ACCCLO, DCG.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DCG.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCELO, 001h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCB
                        CALL      SYSTEM.PosChInVarStr
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      DCG._L0791
                        BRLO      DCG._L0791
                        SER       _ACCA
DCG._L0791:
                        COM       _ACCA
                        STD       Y+001h, _ACCA
                        .LINE     455
                        LDI       _ACCCLO, DCG.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DCG.SerInpStr SHRB 8
                        ADIW      _ACCCLO, 00001h
                        LD        _ACCA, Z+
                        STD       Y+006h, _ACCA
                        .LINE     456
                        LDD       _ACCA, Y+006h
                        CPI       _ACCA, 02Ah
                        LDI       _ACCA, 0h
                        BRNE      DCG._L0792
                        SER       _ACCA
DCG._L0792:
                        STD       Y+002h, _ACCA
                        .LINE     457
                        LDD       _ACCA, Y+006h
                        CPI       _ACCA, 023h
                        LDI       _ACCA, 0h
                        BRNE      DCG._L0793
                        SER       _ACCA
DCG._L0793:
                        STD       Y+003h, _ACCA
                        .LINE     458
                        LDD       _ACCA, Y+003h
                        TST       _ACCA
                        .BRANCH   4,DCG._L0796
                        BRNE      DCG._L0796
                        .BRANCH   20,DCG._L0794
                        JMP       DCG._L0794
DCG._L0796:
                        .BLOCK    458
                        .LINE     459
                        .BRANCH   17,DCG.WRITESERINP
                        CALL      DCG.WRITESERINP
                        .LINE     460
                        .BRANCH   20,DCG.ParseSubCh_X
                        JMP       DCG.ParseSubCh_X
                        .ENDBLOCK 461
DCG._L0794:
DCG._L0795:
                        .LINE     462
                        LDI       _ACCA, 001h
                        STS       DCG.SERINPPTR, _ACCA
                        .LINE     463
                        LDD       _ACCA, Y+005h
                        TST       _ACCA
                        .BRANCH   4,DCG._L0799
                        BRNE      DCG._L0799
                        .BRANCH   20,DCG._L0797
                        JMP       DCG._L0797
DCG._L0799:
                        .BLOCK    463
                        .LINE     464
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DCG.PARSEEXTRACT
                        CALL       DCG.PARSEEXTRACT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        STD       Y+000h, _ACCA
                        .LINE     465
                        LDS       _ACCA, DCG.SerInpPtr
                        INC       _ACCA
                        STS       DCG.SerInpPtr, _ACCA
                        .LINE     466
                        LDD       _ACCA, Y+002h
                        TST       _ACCA
                        .BRANCH   4,DCG._L0802
                        BRNE      DCG._L0802
                        .BRANCH   20,DCG._L0800
                        JMP       DCG._L0800
DCG._L0802:
                        .BLOCK    467
                        .LINE     467
                        .BRANCH   17,DCG.WRITESERINP
                        CALL      DCG.WRITESERINP
                        .ENDBLOCK 468
                        .BRANCH   20,DCG._L0801
                        JMP       DCG._L0801
DCG._L0800:
                        .BLOCK    468
                        .LINE     469
                        LDI       _ACCCLO, DCG.ParamStr AND 0FFh
                        LDI       _ACCCHI, DCG.ParamStr SHRB 8
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        CLT
                        BLD       Flags, _ERRFLAG
                        LDI       _ACCB, 000h
                        CALL      SYSTEM.Str2Int
                        MOV       _ACCA, _ACCB
                        STS       DCG.CURRENTCH, _ACCA
                        .ENDBLOCK 470
DCG._L0801:
                        .ENDBLOCK 471
DCG._L0797:
DCG._L0798:
                        .LINE     472
                        LDD       _ACCA, Y+002h
                        COM       _ACCA
                        PUSH      _ACCA
                        LDS       _ACCA, DCG.CurrentCh
                        PUSH      _ACCA
                        LDS       _ACCA, DCG.SlaveCh
                        POP       _ACCB
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0h
                        BREQ      DCG._L0803
                        SER       _ACCA
DCG._L0803:
                        POP       _ACCB
                        AND       _ACCA, _ACCB
                        PUSH      _ACCA
                        LDD       _ACCA, Y+005h
                        POP       _ACCB
                        AND       _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   4,DCG._L0806
                        BRNE      DCG._L0806
                        .BRANCH   20,DCG._L0804
                        JMP       DCG._L0804
DCG._L0806:
                        .BLOCK    473
                        .LINE     473
                        .BRANCH   17,DCG.WRITESERINP
                        CALL      DCG.WRITESERINP
                        .LINE     474
                        .BRANCH   20,DCG.ParseSubCh_X
                        JMP       DCG.ParseSubCh_X
                        .ENDBLOCK 475
DCG._L0804:
DCG._L0805:
                        .LINE     479
                        LDI       _ACCA, 021h
                        PUSH      _ACCA
                        LDI       _ACCCLO, DCG.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DCG.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCELO, 001h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCB
                        CALL      SYSTEM.PosChInVarStr
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      DCG._L0807
                        BRLO      DCG._L0807
                        SER       _ACCA
DCG._L0807:
                        PUSH      _ACCA
                        LDI       _ACCA, 03Fh
                        PUSH      _ACCA
                        LDI       _ACCCLO, DCG.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DCG.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCELO, 001h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCB
                        CALL      SYSTEM.PosChInVarStr
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      DCG._L0808
                        BRLO      DCG._L0808
                        SER       _ACCA
DCG._L0808:
                        POP       _ACCB
                        OR        _ACCA, _ACCB
                        STS       DCG.VERBOSE, _ACCA
                        .LINE     480
                        LDI       _ACCA, 024h
                        PUSH      _ACCA
                        LDI       _ACCCLO, DCG.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DCG.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCELO, 001h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCB
                        CALL      SYSTEM.PosChInVarStr
                        STD       Y+00Ah, _ACCA
                        .LINE     481
                        LDD       _ACCA, Y+00Ah
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      DCG._L0809
                        BRLO      DCG._L0809
                        SER       _ACCA
DCG._L0809:
                        STD       Y+004h, _ACCA
                        .LINE     482
                        LDD       _ACCA, Y+004h
                        TST       _ACCA
                        .BRANCH   4,DCG._L0812
                        BRNE      DCG._L0812
                        .BRANCH   20,DCG._L0810
                        JMP       DCG._L0810
DCG._L0812:
                        .BLOCK    482
                        .LINE     483
                        LDI       _ACCCLO, DCG.ParamStr AND 0FFh
                        LDI       _ACCCHI, DCG.ParamStr SHRB 8
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
                        LDI       _ACCCLO, DCG.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DCG.SerInpStr SHRB 8
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
                        .LINE     484
                        LDI       _ACCCLO, DCG.ParamStr AND 0FFh
                        LDI       _ACCCHI, DCG.ParamStr SHRB 8
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        CLT
                        BLD       Flags, _ERRFLAG
                        LDI       _ACCB, 0FFh
                        CALL      SYSTEM.Str2Int
                        MOV       _ACCA, _ACCB
                        STD       Y+008h, _ACCA
                        .LINE     485
                        LDI       _ACCA, 000h
                        STD       Y+009h, _ACCA
                        .LINE     486
                        .LOOP
                        LDI       _ACCCLO, DCG.i AND 0FFh
                        LDI       _ACCCHI, DCG.i SHRB 8
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
DCG._L0815:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      DCG._L0816
                        CLR       _ACCA
DCG._L0816:
                        TST       _ACCA
                        .BRANCH   3,DCG._L0817
                        BREQ      DCG._L0817
                        .BRANCH   20,DCG._L0814
                        JMP       DCG._L0814
DCG._L0817:
                        .BLOCK    487
                        .LINE     487
                        LDI       _ACCCLO, DCG.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DCG.SerInpStr SHRB 8
                        MOV       _ACCA, DCG.i
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCA, Z+
                        STD       Y+009h, _ACCA
                        .LINE     488
                        LDD       _ACCA, Y+00Ch
                        PUSH      _ACCA
                        LDD       _ACCA, Y+009h
                        POP       _ACCB
                        EOR       _ACCA, _ACCB
                        STD       Y+00Ch, _ACCA
                        .ENDBLOCK 489
DCG._L0813:
                        .LINE     489
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,DCG._L0814
                        BREQ      DCG._L0814
                        .BRANCH   20,DCG._L0815
                        JMP       DCG._L0815
DCG._L0814:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .LINE     490
                        LDD       _ACCA, Y+009h
                        PUSH      _ACCA
                        LDD       _ACCA, Y+008h
                        POP       _ACCB
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0h
                        BREQ      DCG._L0818
                        SER       _ACCA
DCG._L0818:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0821
                        BRNE      DCG._L0821
                        .BRANCH   20,DCG._L0819
                        JMP       DCG._L0819
DCG._L0821:
                        .BLOCK    490
                        .LINE     491
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 007h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DCG.SERPROMPT
                        CALL      DCG.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     492
                        .BRANCH   20,DCG.ParseSubCh_X
                        JMP       DCG.ParseSubCh_X
                        .ENDBLOCK 493
DCG._L0819:
DCG._L0820:
                        .ENDBLOCK 494
DCG._L0810:
DCG._L0811:
                        .LINE     496
                        LDI       _ACCA, 0FFh
                        STS       DCG.ActivityTimer, _ACCA
                        .LINE     497
                        CBI       00032h, 002h
                        .LINE     501
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DCG.PARSEEXTRACT
                        CALL       DCG.PARSEEXTRACT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        TST       _ACCA
                        .BRANCH   4,DCG._L0824
                        BRNE      DCG._L0824
                        .BRANCH   20,DCG._L0822
                        JMP       DCG._L0822
DCG._L0824:
                        .BLOCK    501
                        .LINE     502
                        LDI       _ACCA, 000h
                        STD       Y+007h, _ACCA
                        .ENDBLOCK 503
                        .BRANCH   20,DCG._L0823
                        JMP       DCG._L0823
DCG._L0822:
                        .BLOCK    503
                        .LINE     504
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DCG.CMD2INDEX
                        CALL       DCG.CMD2INDEX
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        STS       DCG.CMDWHICH, _ACCA
                        .LINE     505
                        LDS       _ACCA, DCG.CmdWhich
                        CPI       _ACCA, 01Bh
                        LDI       _ACCA, 0h
                        BRNE      DCG._L0825
                        SER       _ACCA
DCG._L0825:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0828
                        BRNE      DCG._L0828
                        .BRANCH   20,DCG._L0826
                        JMP       DCG._L0826
DCG._L0828:
                        .BLOCK    505
                        .LINE     506
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 004h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DCG.SERPROMPT
                        CALL      DCG.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     507
                        .BRANCH   20,DCG.ParseSubCh_X
                        JMP       DCG.ParseSubCh_X
                        .ENDBLOCK 508
DCG._L0826:
DCG._L0827:
                        .LINE     509
                        LDI       _ACCCLO, DCG.Cmd2SubChArr AND 0FFh
                        LDI       _ACCCHI, DCG.Cmd2SubChArr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DCG.CmdWhich
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LPM       _ACCA, Z
                        STD       Y+007h, _ACCA
                        .LINE     510
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DCG.PARSEEXTRACT
                        CALL       DCG.PARSEEXTRACT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 511
DCG._L0823:
                        .LINE     512
                        LDI       _ACCCLO, DCG.ParamStr AND 0FFh
                        LDI       _ACCCHI, DCG.ParamStr SHRB 8
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
                        STS       DCG.SUBCH, _ACCA
                        .LINE     514
                        LDD       _ACCA, Y+001h
                        TST       _ACCA
                        .BRANCH   4,DCG._L0831
                        BRNE      DCG._L0831
                        .BRANCH   20,DCG._L0829
                        JMP       DCG._L0829
DCG._L0831:
                        .BLOCK    514
                        .LINE     515
                        .BRANCH   17,DCG.PARSEGETPARAM
                        CALL      DCG.PARSEGETPARAM
                        .ENDBLOCK 516
                        .BRANCH   20,DCG._L0830
                        JMP       DCG._L0830
DCG._L0829:
                        .BLOCK    516
                        .LINE     517
                        LDI       _ACCA, 03Dh
                        PUSH      _ACCA
                        LDI       _ACCCLO, DCG.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DCG.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCELO, 001h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCB
                        CALL      SYSTEM.PosChInVarStr
                        SUBI      _ACCA, -001h AND 0FFh
                        STS       DCG.SERINPPTR, _ACCA
                        .LINE     518
                        LDS       _ACCA, DCG.SerInpPtr
                        CPI       _ACCA, 001h
                        LDI       _ACCA, 0h
                        BREQ      DCG._L0832
                        BRLO      DCG._L0832
                        SER       _ACCA
DCG._L0832:
                        PUSH      _ACCA
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DCG.PARSEEXTRACT
                        CALL       DCG.PARSEEXTRACT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        POP       _ACCB
                        AND       _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   4,DCG._L0835
                        BRNE      DCG._L0835
                        .BRANCH   20,DCG._L0833
                        JMP       DCG._L0833
DCG._L0835:
                        .BLOCK    518
                        .LINE     519
                        LDI       _ACCCLO, DCG.ParamStr AND 0FFh
                        LDI       _ACCCHI, DCG.ParamStr SHRB 8
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        CALL      SYSTEM.Str2Float
                        STS       DCG.PARAM, _ACCB
                        STS       DCG.PARAM+1, _ACCA
                        STS       DCG.PARAM+2, _ACCALO
                        STS       DCG.PARAM+3, _ACCAHI
                        .LINE     520
                        LDS       _ACCB, DCG.Param
                        LDS       _ACCA, DCG.Param+1
                        LDS       _ACCALO, DCG.Param+2
                        LDS       _ACCAHI, DCG.Param+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.FloatToLInt
                        SBRC      _ACCAHI, 7
                        RJMP      DCG._L0836
                        OR        _ACCAHI, _ACCALO
                        BRNE      DCG._L0837
                        RJMP      DCG._L0838
DCG._L0836:
                        CPI       _ACCAHI, 0FFh
                        BRNE      DCG._L0837
                        CPI       _ACCALO, 0FFh
                        BREQ      DCG._L0838
DCG._L0837:
                        SET
                        BLD       Flags, _ERRFLAG
DCG._L0838:
                        STS       DCG.PARAMINT, _ACCB
                        STS       DCG.PARAMINT+1, _ACCA
                        .LINE     521
                        LDS       _ACCB, DCG.ParamInt
                        LDS       _ACCA, DCG.ParamInt+1
                        MOV       _ACCA, _ACCB
                        STS       DCG.PARAMBYTE, _ACCA
                        .ENDBLOCK 522
                        .BRANCH   20,DCG._L0834
                        JMP       DCG._L0834
DCG._L0833:
                        .BLOCK    522
                        .LINE     523
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 005h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DCG.SERPROMPT
                        CALL      DCG.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     524
                        .BRANCH   20,DCG.ParseSubCh_X
                        JMP       DCG.ParseSubCh_X
                        .ENDBLOCK 525
DCG._L0834:
                        .LINE     526
                        .BRANCH   17,DCG.PARSESETPARAM
                        CALL      DCG.PARSESETPARAM
                        .ENDBLOCK 527
DCG._L0830:
                        .ENDBLOCK 528
DCG.ParseSubCh_X:
                        .LINE     528
                        .BRANCH   19
                        RET
                        .ENDFUNC  528


                        .FILE     H:\PROJAVR\ADA-C DCG_MCB\DCG.pas
                        .FUNC     SwitchRelais, 004A2h, 00020h
DCG.SwitchRelais:
                        .RETURNS   0
                        .BLOCK    1187
                        .LINE     1188
                        LDS       _ACCB, 003B1h
                        CLR       _ACCA
                        SBRC      _ACCB, 003h
                        SER       _ACCA
                        PUSH      _ACCA
                        LDS       _ACCB, 003B1h
                        CLR       _ACCA
                        SBRC      _ACCB, 002h
                        SER       _ACCA
                        POP       _ACCB
                        OR        _ACCA, _ACCB
                        COM       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DCG._L0841
                        BRNE      DCG._L0841
                        .BRANCH   20,DCG._L0839
                        JMP       DCG._L0839
DCG._L0841:
                        .BLOCK    1188
                        .LINE     1189
                        LDS       _ACCA, DCG.RelaisState
                        PUSH      _ACCA
                        LDS       _ACCA, DCG.oldRelaisState
                        POP       _ACCB
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0h
                        BREQ      DCG._L0842
                        SER       _ACCA
DCG._L0842:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0845
                        BRNE      DCG._L0845
                        .BRANCH   20,DCG._L0843
                        JMP       DCG._L0843
DCG._L0845:
                        .BLOCK    1189
                        .LINE     1190
                        LDS       _ACCA, DCG.RelaisState
                        CPI       _ACCA, 0FFh
                        LDI       _ACCA, 0h
                        BRNE      DCG._L0846
                        SER       _ACCA
DCG._L0846:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0849
                        BRNE      DCG._L0849
                        .BRANCH   20,DCG._L0847
                        JMP       DCG._L0847
DCG._L0849:
                        .BLOCK    1190
                        .LINE     1191
                        CBI       00038h, 003h
                        .LINE     1192
                        LDI       _ACCA, 0000Ah SHRB 8
                        LDI       _ACCB, 0000Ah AND 0FFh
                        .FRAME  0
                        CALL      SYSTEM.MDELAY
                        .LINE     1193
                        SBI       00038h, 002h
                        .ENDBLOCK 1194
                        .BRANCH   20,DCG._L0848
                        JMP       DCG._L0848
DCG._L0847:
                        .BLOCK    1194
                        .LINE     1195
                        CBI       00038h, 002h
                        .LINE     1196
                        LDI       _ACCA, 0000Ah SHRB 8
                        LDI       _ACCB, 0000Ah AND 0FFh
                        .FRAME  0
                        CALL      SYSTEM.MDELAY
                        .LINE     1197
                        SBI       00038h, 003h
                        .ENDBLOCK 1198
DCG._L0848:
                        .ENDBLOCK 1199
DCG._L0843:
DCG._L0844:
                        .LINE     1200
                        LDS       _ACCA, DCG.RelaisState
                        STS       DCG.OLDRELAISSTATE, _ACCA
                        .ENDBLOCK 1201
DCG._L0839:
DCG._L0840:
                        .ENDBLOCK 1202
DCG.SwitchRelais_X:
                        .LINE     1202
                        .BRANCH   19
                        RET
                        .ENDFUNC  1202

                        .FUNC     FaultCheck, 004B4h, 00020h
DCG.FaultCheck:
                        .RETURNS   0
                        .BLOCK    1205
                        .LINE     1206
                        LDS       _ACCB, 002FBh
                        CLR       _ACCA
                        SBRC      _ACCB, 002h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DCG._L0852
                        BRNE      DCG._L0852
                        .BRANCH   20,DCG._L0850
                        JMP       DCG._L0850
DCG._L0852:
                        .BLOCK    1206
                        .LINE     1207
                        LDS       _ACCA, DCG.TemperatureTimer
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BRNE      DCG._L0853
                        SER       _ACCA
DCG._L0853:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0856
                        BRNE      DCG._L0856
                        .BRANCH   20,DCG._L0854
                        JMP       DCG._L0854
DCG._L0856:
                        .BLOCK    1207
                        .LINE     1208
                        LDI       _ACCA, 014h
                        STS       DCG.TEMPERATURETIMER, _ACCA
                        .LINE     1209
                        LDI       _ACCA, 048h
                        STS       DCG.I2CSLAVEADR, _ACCA
                        .LINE     1210
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DCG.GETLM75TEMP
                        CALL      DCG.GETLM75TEMP
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 1211
DCG._L0854:
DCG._L0855:
                        .LINE     1212
                        LDS       _ACCA, DCG.TemperatureTimer
                        DEC       _ACCA
                        STS       DCG.TemperatureTimer, _ACCA
                        .ENDBLOCK 1213
                        .BRANCH   20,DCG._L0851
                        JMP       DCG._L0851
DCG._L0850:
                        .BLOCK    1213
                        .LINE     1214
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 000h
                        STS       DCG.TEMPERATURE, _ACCB
                        STS       DCG.TEMPERATURE+1, _ACCA
                        STS       DCG.TEMPERATURE+2, _ACCALO
                        STS       DCG.TEMPERATURE+3, _ACCAHI
                        .ENDBLOCK 1215
DCG._L0851:
                        .LINE     1216
                        LDS       _ACCB, DCG.Temperature
                        LDS       _ACCA, DCG.Temperature+1
                        LDS       _ACCALO, DCG.Temperature+2
                        LDS       _ACCAHI, DCG.Temperature+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 08Ch
                        LDI       _ACCAHI, 042h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      DCG._L0858
                        BRPL      DCG._L0859
                        BRMI      DCG._L0857
DCG._L0859:
                        CLZ
                        CLC
                        RJMP      DCG._L0858
DCG._L0857:
                        CLZ
                        SEC
DCG._L0858:
                        LDI       _ACCA, 0h
                        BREQ      DCG._L0860
                        BRLO      DCG._L0860
                        SER       _ACCA
DCG._L0860:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0863
                        BRNE      DCG._L0863
                        .BRANCH   20,DCG._L0861
                        JMP       DCG._L0861
DCG._L0863:
                        .BLOCK    1216
                        .LINE     1217
                        LDS       _ACCA, 003B1h
                        SBR       _ACCA, 008h
                        STS       003B1h, _ACCA
                        .LINE     1218
                        CBI       00038h, 002h
                        .LINE     1219
                        CBI       00038h, 003h
                        .ENDBLOCK 1220
                        .BRANCH   20,DCG._L0862
                        JMP       DCG._L0862
DCG._L0861:
                        .BLOCK    1220
                        .LINE     1221
                        LDS       _ACCB, 003B1h
                        CLR       _ACCA
                        SBRC      _ACCB, 003h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DCG._L0866
                        BRNE      DCG._L0866
                        .BRANCH   20,DCG._L0864
                        JMP       DCG._L0864
DCG._L0866:
                        .BLOCK    1222
                        .LINE     1222
                        LDI       _ACCA, 000h
                        STS       DCG.RELAISSTATE, _ACCA
                        .LINE     1223
                        LDI       _ACCA, 0FFh
                        STS       DCG.OLDRELAISSTATE, _ACCA
                        .ENDBLOCK 1224
DCG._L0864:
DCG._L0865:
                        .LINE     1225
                        LDS       _ACCA, 003B1h
                        CBR       _ACCA, 008h
                        STS       003B1h, _ACCA
                        .ENDBLOCK 1226
DCG._L0862:
                        .LINE     1227
                        .BRANCH   17,DCG.GETINPUTVOLTAGE
                        CALL      DCG.GETINPUTVOLTAGE
                        .LINE     1228
                        LDS       _ACCB, DCG.Param
                        LDS       _ACCA, DCG.Param+1
                        LDS       _ACCALO, DCG.Param+2
                        LDS       _ACCAHI, DCG.Param+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 040h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.SubFloat
                        STS       DCG.PARAM, _ACCB
                        STS       DCG.PARAM+1, _ACCA
                        STS       DCG.PARAM+2, _ACCALO
                        STS       DCG.PARAM+3, _ACCAHI
                        .LINE     1229
                        LDS       _ACCB, DCG.DCVoltIntegrated
                        LDS       _ACCA, DCG.DCVoltIntegrated+1
                        LDS       _ACCALO, DCG.DCVoltIntegrated+2
                        LDS       _ACCAHI, DCG.DCVoltIntegrated+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DCG.Param
                        LDS       _ACCA, DCG.Param+1
                        LDS       _ACCALO, DCG.Param+2
                        LDS       _ACCAHI, DCG.Param+3
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      DCG._L0868
                        BRPL      DCG._L0869
                        BRMI      DCG._L0867
DCG._L0869:
                        CLZ
                        CLC
                        RJMP      DCG._L0868
DCG._L0867:
                        CLZ
                        SEC
DCG._L0868:
                        LDI       _ACCA, 0h
                        BREQ      DCG._L0870
                        BRLO      DCG._L0870
                        SER       _ACCA
DCG._L0870:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0873
                        BRNE      DCG._L0873
                        .BRANCH   20,DCG._L0871
                        JMP       DCG._L0871
DCG._L0873:
                        .BLOCK    1230
                        .LINE     1230
                        LDS       _ACCA, 003B1h
                        SBR       _ACCA, 004h
                        STS       003B1h, _ACCA
                        .LINE     1231
                        CBI       00038h, 002h
                        .LINE     1232
                        CBI       00038h, 003h
                        .ENDBLOCK 1233
                        .BRANCH   20,DCG._L0872
                        JMP       DCG._L0872
DCG._L0871:
                        .BLOCK    1233
                        .LINE     1234
                        LDS       _ACCB, 003B1h
                        CLR       _ACCA
                        SBRC      _ACCB, 002h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DCG._L0876
                        BRNE      DCG._L0876
                        .BRANCH   20,DCG._L0874
                        JMP       DCG._L0874
DCG._L0876:
                        .BLOCK    1235
                        .LINE     1235
                        LDI       _ACCA, 000h
                        STS       DCG.RELAISSTATE, _ACCA
                        .LINE     1236
                        LDI       _ACCA, 0FFh
                        STS       DCG.OLDRELAISSTATE, _ACCA
                        .ENDBLOCK 1237
DCG._L0874:
DCG._L0875:
                        .LINE     1238
                        LDS       _ACCA, 003B1h
                        CBR       _ACCA, 004h
                        STS       003B1h, _ACCA
                        .ENDBLOCK 1239
DCG._L0872:
                        .LINE     1240
                        LDS       _ACCB, DCG.Param
                        LDS       _ACCA, DCG.Param+1
                        LDS       _ACCALO, DCG.Param+2
                        LDS       _ACCAHI, DCG.Param+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 0A0h
                        LDI       _ACCAHI, 040h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      DCG._L0878
                        BRPL      DCG._L0879
                        BRMI      DCG._L0877
DCG._L0879:
                        CLZ
                        CLC
                        RJMP      DCG._L0878
DCG._L0877:
                        CLZ
                        SEC
DCG._L0878:
                        LDI       _ACCA, 0FFh
                        BRLO      DCG._L0880
                        CLR       _ACCA
DCG._L0880:
                        CLT
                        TST       _ACCA
                        BREQ      DCG._L0881
                        SET
DCG._L0881:
                        LDS       _ACCA, 003B1h
                        BLD       _ACCA, 001h
                        STS       003B1h, _ACCA
                        .LINE     1241
                        LDS       _ACCB, 003B1h
                        CLR       _ACCA
                        SBRC      _ACCB, 001h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DCG._L0884
                        BRNE      DCG._L0884
                        .BRANCH   20,DCG._L0882
                        JMP       DCG._L0882
DCG._L0884:
                        .BLOCK    1241
                        .LINE     1242
                        LDS       _ACCA, 003B1h
                        CBR       _ACCA, 004h
                        STS       003B1h, _ACCA
                        .ENDBLOCK 1243
DCG._L0882:
DCG._L0883:
                        .LINE     1244
                        LDS       _ACCA, DCG.FaultFlags
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      DCG._L0885
                        SER       _ACCA
DCG._L0885:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0888
                        BRNE      DCG._L0888
                        .BRANCH   20,DCG._L0886
                        JMP       DCG._L0886
DCG._L0888:
                        .BLOCK    1244
                        .LINE     1245
                        LDS       _ACCA, 003B0h
                        SBR       _ACCA, 020h
                        STS       003B0h, _ACCA
                        .ENDBLOCK 1246
DCG._L0886:
DCG._L0887:
                        .ENDBLOCK 1247
DCG.FaultCheck_X:
                        .LINE     1247
                        .BRANCH   19
                        RET
                        .ENDFUNC  1247

                        .FUNC     Chores, 004E1h, 00020h
DCG.Chores:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 4
                        .BLOCK    1252
                        .LINE     1253
                        CLR       _ACCA
                        SBIC      030h, 004h
                        SER       _ACCA
                        COM       _ACCA
                        CLT
                        TST       _ACCA
                        BREQ      DCG._L0889
                        SET
DCG._L0889:
                        IN        _ACCA, 00032h
                        BLD       _ACCA, 003h
                        OUT       00032h, _ACCA
                        .LINE     1254
                        SER       _ACCA
                        LDS       _ACCB, DCG.IntegrateTimer
                        TST       _ACCB
                        BREQ      DCG._L0890
                        COM       _ACCA
DCG._L0890:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0893
                        BRNE      DCG._L0893
                        .BRANCH   20,DCG._L0891
                        JMP       DCG._L0891
DCG._L0893:
                        .BLOCK    1254
                        .LINE     1255
                        LDI       _ACCA, 028h
                        STS       DCG.IntegrateTimer, _ACCA
                        .LINE     1257
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DCG.GETCURRENT
                        CALL      DCG.GETCURRENT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1258
                        LDS       _ACCB, DCG.Param
                        LDS       _ACCA, DCG.Param+1
                        LDS       _ACCALO, DCG.Param+2
                        LDS       _ACCAHI, DCG.Param+3
                        STS       DCG.CURRAMP, _ACCB
                        STS       DCG.CURRAMP+1, _ACCA
                        STS       DCG.CURRAMP+2, _ACCALO
                        STS       DCG.CURRAMP+3, _ACCAHI
                        .LINE     1259
                        LDS       _ACCB, DCG.DCAmpIntegrated
                        LDS       _ACCA, DCG.DCAmpIntegrated+1
                        LDS       _ACCALO, DCG.DCAmpIntegrated+2
                        LDS       _ACCAHI, DCG.DCAmpIntegrated+3
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
                        LDI       _ACCCLO, 0E0h
                        LDI       _ACCCHI, 040h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat_R
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DCG.Param
                        LDS       _ACCA, DCG.Param+1
                        LDS       _ACCALO, DCG.Param+2
                        LDS       _ACCAHI, DCG.Param+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.AddFloat
                        MOVW      _ACCDLO, _ACCB
                        MOVW      _ACCELO, _ACCALO
                        LDI       _ACCBLO, 000h
                        LDI       _ACCBHI, 000h
                        LDI       _ACCCLO, 000h
                        LDI       _ACCCHI, 041h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat_R
                        STS       DCG.DCAMPINTEGRATED, _ACCB
                        STS       DCG.DCAMPINTEGRATED+1, _ACCA
                        STS       DCG.DCAMPINTEGRATED+2, _ACCALO
                        STS       DCG.DCAMPINTEGRATED+3, _ACCAHI
                        .LINE     1261
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DCG.GETVOLTAGE
                        CALL      DCG.GETVOLTAGE
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1263
                        LDS       _ACCB, DCG.Param
                        LDS       _ACCA, DCG.Param+1
                        LDS       _ACCALO, DCG.Param+2
                        LDS       _ACCAHI, DCG.Param+3
                        STS       DCG.CURRVOLT, _ACCB
                        STS       DCG.CURRVOLT+1, _ACCA
                        STS       DCG.CURRVOLT+2, _ACCALO
                        STS       DCG.CURRVOLT+3, _ACCAHI
                        .LINE     1265
                        LDS       _ACCB, DCG.DCVoltIntegrated
                        LDS       _ACCA, DCG.DCVoltIntegrated+1
                        LDS       _ACCALO, DCG.DCVoltIntegrated+2
                        LDS       _ACCAHI, DCG.DCVoltIntegrated+3
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
                        LDI       _ACCCLO, 0E0h
                        LDI       _ACCCHI, 040h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat_R
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DCG.Param
                        LDS       _ACCA, DCG.Param+1
                        LDS       _ACCALO, DCG.Param+2
                        LDS       _ACCAHI, DCG.Param+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.AddFloat
                        MOVW      _ACCDLO, _ACCB
                        MOVW      _ACCELO, _ACCALO
                        LDI       _ACCBLO, 000h
                        LDI       _ACCBHI, 000h
                        LDI       _ACCCLO, 000h
                        LDI       _ACCCHI, 041h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat_R
                        STS       DCG.DCVOLTINTEGRATED, _ACCB
                        STS       DCG.DCVOLTINTEGRATED+1, _ACCA
                        STS       DCG.DCVOLTINTEGRATED+2, _ACCALO
                        STS       DCG.DCVOLTINTEGRATED+3, _ACCAHI
                        .LINE     1267
                        CLR       _ACCA
                        SBIC      030h, 004h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DCG._L0896
                        BRNE      DCG._L0896
                        .BRANCH   20,DCG._L0894
                        JMP       DCG._L0894
DCG._L0896:
                        .BLOCK    1267
                        .LINE     1268
                        LDS       _ACCB, DCG.DCVolt
                        LDS       _ACCA, DCG.DCVolt+1
                        LDS       _ACCALO, DCG.DCVolt+2
                        LDS       _ACCAHI, DCG.DCVolt+3
                        STD       Y+003h, _ACCAHI
                        STD       Y+002h, _ACCALO
                        STD       Y+001h, _ACCA
                        STD       Y+000h, _ACCB
                        .ENDBLOCK 1269
                        .BRANCH   20,DCG._L0895
                        JMP       DCG._L0895
DCG._L0894:
                        .BLOCK    1269
                        .LINE     1270
                        LDS       _ACCB, DCG.DCVoltIntegrated
                        LDS       _ACCA, DCG.DCVoltIntegrated+1
                        LDS       _ACCALO, DCG.DCVoltIntegrated+2
                        LDS       _ACCAHI, DCG.DCVoltIntegrated+3
                        STD       Y+003h, _ACCAHI
                        STD       Y+002h, _ACCALO
                        STD       Y+001h, _ACCA
                        STD       Y+000h, _ACCB
                        .ENDBLOCK 1271
DCG._L0895:
                        .LINE     1273
                        LDD       _ACCAHI, Y+003h
                        LDD       _ACCALO, Y+002h
                        LDD       _ACCA, Y+001h
                        LDD       _ACCB, Y+000h
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DCG.RelaisVoltHigh
                        LDS       _ACCA, DCG.RelaisVoltHigh+1
                        LDS       _ACCALO, DCG.RelaisVoltHigh+2
                        LDS       _ACCAHI, DCG.RelaisVoltHigh+3
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      DCG._L0898
                        BRPL      DCG._L0899
                        BRMI      DCG._L0897
DCG._L0899:
                        CLZ
                        CLC
                        RJMP      DCG._L0898
DCG._L0897:
                        CLZ
                        SEC
DCG._L0898:
                        LDI       _ACCA, 0h
                        BREQ      DCG._L0900
                        BRLO      DCG._L0900
                        SER       _ACCA
DCG._L0900:
                        PUSH      _ACCA
                        LDS       _ACCB, 003B0h
                        CLR       _ACCA
                        SBRC      _ACCB, 005h
                        SER       _ACCA
                        COM       _ACCA
                        POP       _ACCB
                        AND       _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   4,DCG._L0903
                        BRNE      DCG._L0903
                        .BRANCH   20,DCG._L0901
                        JMP       DCG._L0901
DCG._L0903:
                        .BLOCK    1273
                        .LINE     1274
                        LDI       _ACCA, 0FFh
                        STS       DCG.RELAISSTATE, _ACCA
                        .ENDBLOCK 1275
DCG._L0901:
DCG._L0902:
                        .LINE     1276
                        CLR       _ACCA
                        MOV       _ACCB, _SYSTFLAGS
                        ANDI      _ACCB, 002h
                        BRNE      DCG._L0904
                        COM       _ACCA
DCG._L0904:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0907
                        BRNE      DCG._L0907
                        .BRANCH   20,DCG._L0905
                        JMP       DCG._L0905
DCG._L0907:
                        .BLOCK    1276
                        .LINE     1277
                        LDI       _ACCA, 007D0h SHRB 8
                        LDI       _ACCB, 007D0h AND 0FFh
                        LDI       _ACCCLO, DCG.RelaisTimer AND 0FFh
                        LDI       _ACCCHI, DCG.RelaisTimer SHRB 8
                        LDI       _ACCBHI, 002h
                        CALL      SYSTEM.SetSysTimer
                        .LINE     1278
                        LDD       _ACCAHI, Y+003h
                        LDD       _ACCALO, Y+002h
                        LDD       _ACCA, Y+001h
                        LDD       _ACCB, Y+000h
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DCG.RelaisVoltLow
                        LDS       _ACCA, DCG.RelaisVoltLow+1
                        LDS       _ACCALO, DCG.RelaisVoltLow+2
                        LDS       _ACCAHI, DCG.RelaisVoltLow+3
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      DCG._L0909
                        BRPL      DCG._L0910
                        BRMI      DCG._L0908
DCG._L0910:
                        CLZ
                        CLC
                        RJMP      DCG._L0909
DCG._L0908:
                        CLZ
                        SEC
DCG._L0909:
                        LDI       _ACCA, 0FFh
                        BRLO      DCG._L0911
                        CLR       _ACCA
DCG._L0911:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0914
                        BRNE      DCG._L0914
                        .BRANCH   20,DCG._L0912
                        JMP       DCG._L0912
DCG._L0914:
                        .BLOCK    1278
                        .LINE     1279
                        LDI       _ACCA, 000h
                        STS       DCG.RELAISSTATE, _ACCA
                        .ENDBLOCK 1280
DCG._L0912:
DCG._L0913:
                        .ENDBLOCK 1281
DCG._L0905:
DCG._L0906:
                        .LINE     1283
                        .BRANCH   17,DCG.FAULTCHECK
                        CALL      DCG.FAULTCHECK
                        .LINE     1284
                        LDS       _ACCA, DCG.FaultFlags
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BRNE      DCG._L0915
                        SER       _ACCA
DCG._L0915:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0918
                        BRNE      DCG._L0918
                        .BRANCH   20,DCG._L0916
                        JMP       DCG._L0916
DCG._L0918:
                        .BLOCK    1284
                        .LINE     1285
                        CLR       _ACCA
                        SBIC      030h, 004h
                        SER       _ACCA
                        COM       _ACCA
                        CLT
                        TST       _ACCA
                        BREQ      DCG._L0919
                        SET
DCG._L0919:
                        LDS       _ACCA, 003B0h
                        BLD       _ACCA, 005h
                        STS       003B0h, _ACCA
                        .ENDBLOCK 1286
DCG._L0916:
DCG._L0917:
                        .LINE     1287
                        LDS       _ACCA, DCG.FaultTimer
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BRNE      DCG._L0920
                        SER       _ACCA
DCG._L0920:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0923
                        BRNE      DCG._L0923
                        .BRANCH   20,DCG._L0921
                        JMP       DCG._L0921
DCG._L0923:
                        .BLOCK    1288
                        .LINE     1288
                        LDS       _ACCA, DCG.FaultFlags
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      DCG._L0924
                        SER       _ACCA
DCG._L0924:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0927
                        BRNE      DCG._L0927
                        .BRANCH   20,DCG._L0925
                        JMP       DCG._L0925
DCG._L0927:
                        .BLOCK    1288
                        .LINE     1289
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 003h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DCG.SERPROMPT
                        CALL      DCG.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 1290
DCG._L0925:
DCG._L0926:
                        .LINE     1291
                        LDI       _ACCA, 00Ah
                        STS       DCG.FAULTTIMER, _ACCA
                        .ENDBLOCK 1292
DCG._L0921:
DCG._L0922:
                        .LINE     1293
                        LDS       _ACCA, DCG.FaultTimer
                        DEC       _ACCA
                        STS       DCG.FaultTimer, _ACCA
                        .ENDBLOCK 1294
DCG._L0891:
DCG._L0892:
                        .LINE     1295
                        .BRANCH   17,DCG.SWITCHRELAIS
                        CALL      DCG.SWITCHRELAIS
                        .LINE     1296
                        LDS       _ACCB, DCG.RipplePercent
                        LDS       _ACCA, DCG.RipplePercent+1
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        CPI       _ACCA, 080h
                        BRNE      DCG._L0928
                        CPI       _ACCB, 000h
DCG._L0928:
                        LDI       _ACCA, 0h
                        BRNE      DCG._L0929
                        SER       _ACCA
DCG._L0929:
                        STS       DCG.NOTOGGLE, _ACCA
                        .ENDBLOCK 1297
DCG.Chores_X:
                        .LINE     1297
                        .BRANCH   19
                        RET
                        .ENDFUNC  1297

                        .FUNC     CheckSer, 00513h, 00020h
DCG.CheckSer:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 1
                        .BLOCK    1302
                        .LINE     1303
DCG._L0930:
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        MOVW      _ACCCLO, _FRAMEPTR
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 014h
                        ST        -Y, _ACCA
                        .FRAME  3
                        .FRAME  0
                        CALL       SYSTEM.SERINP_TO
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        TST       _ACCA
                        .BRANCH   4,DCG._L0932
                        BRNE      DCG._L0932
                        .BRANCH   20,DCG._L0931
                        JMP       DCG._L0931
DCG._L0932:
                        .BLOCK    1305
                        .LINE     1305
                        LDD       _ACCA, Y+000h
                        CPI       _ACCA, 07Fh
                        .BRANCH   3,DCG._L0933
                        BREQ      DCG._L0933
                        .BRANCH   1,DCG._L0934
                        BRSH      DCG._L0934
                        CPI       _ACCA, 020h
                        .BRANCH   1,DCG._L0934
                        BRLO      DCG._L0934
                        LDI       _ACCDLO, 0
                        SEZ
                        .BRANCH   20,DCG._L0933
                        RJMP      DCG._L0933
DCG._L0934:
                        LDI       _ACCDLO, 001h
DCG._L0933:
                        LDI       _ACCA, 0h
                        BRNE      DCG._L0935
                        SER       _ACCA
DCG._L0935:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0938
                        BRNE      DCG._L0938
                        .BRANCH   20,DCG._L0936
                        JMP       DCG._L0936
DCG._L0938:
                        .BLOCK    1306
                        .LINE     1306
                        LDD       _ACCA, Y+000h
                        MOV       _ACCEHI, _ACCA
                        LDI       _ACCELO, 001h
                        LDI       _ACCA, _ACCELO SHRB 8
                        LDI       _ACCB, _ACCELO AND 0FFh
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDI       _ACCCLO, DCG.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DCG.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCA, 03Fh
                        PUSH      _ACCA
                        LDI       _ACCFHI, 000h
                        CALL      SYSTEM.StringAppend
                        .ENDBLOCK 1307
DCG._L0936:
DCG._L0937:
                        .LINE     1308
                        LDD       _ACCA, Y+000h
                        CPI       _ACCA, 008h
                        LDI       _ACCA, 0h
                        BRNE      DCG._L0939
                        SER       _ACCA
DCG._L0939:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0942
                        BRNE      DCG._L0942
                        .BRANCH   20,DCG._L0940
                        JMP       DCG._L0940
DCG._L0942:
                        .BLOCK    1309
                        .LINE     1309
                        LDI       _ACCCLO, DCG.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DCG.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCCLO, DCG.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DCG.SerInpStr SHRB 8
                        LD        _ACCA, Z
                        SUBI      _ACCA, 001h AND 0FFh
                        POP       _ACCCHI
                        POP       _ACCCLO
                        CPI       _ACCA, 63
                        BRCS      DCG._L0943
                        LDI       _ACCA, 63
DCG._L0943:
                        ST        Z+, _ACCA
                        .ENDBLOCK 1310
DCG._L0940:
DCG._L0941:
                        .LINE     1311
                        LDD       _ACCA, Y+000h
                        CPI       _ACCA, 00Dh
                        LDI       _ACCA, 0h
                        BRNE      DCG._L0944
                        SER       _ACCA
DCG._L0944:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0947
                        BRNE      DCG._L0947
                        .BRANCH   20,DCG._L0945
                        JMP       DCG._L0945
DCG._L0947:
                        .BLOCK    1311
                        .LINE     1312
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DCG.CHORES
                        CALL      DCG.CHORES
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1313
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DCG.PARSESUBCH
                        CALL      DCG.PARSESUBCH
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1314
                        LDI       _ACCCLO, DCG.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DCG.SerInpStr SHRB 8
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
                        .ENDBLOCK 1315
DCG._L0945:
DCG._L0946:
                        .ENDBLOCK 1316
                        .LINE     1316
                        .BRANCH   20,DCG._L0930
                        JMP       DCG._L0930
DCG._L0931:
                        .LINE     1317
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DCG.CHORES
                        CALL      DCG.CHORES
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 1318
DCG.CheckSer_X:
                        .LINE     1318
                        .BRANCH   19
                        RET
                        .ENDFUNC  1318

                        .FUNC     CheckDelay, 00528h, 00020h
DCG.CheckDelay:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 1
                        .BLOCK    1323
                        .LINE     1324
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
DCG._L0950:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      DCG._L0951
                        CLR       _ACCA
DCG._L0951:
                        TST       _ACCA
                        .BRANCH   3,DCG._L0952
                        BREQ      DCG._L0952
                        .BRANCH   20,DCG._L0949
                        JMP       DCG._L0949
DCG._L0952:
                        .BLOCK    1325
                        .LINE     1325
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DCG.CHECKSER
                        CALL      DCG.CHECKSER
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 1326
DCG._L0948:
                        .LINE     1326
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,DCG._L0949
                        BREQ      DCG._L0949
                        .BRANCH   20,DCG._L0950
                        JMP       DCG._L0950
DCG._L0949:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .ENDBLOCK 1327
DCG.CheckDelay_X:
                        .LINE     1327
                        .BRANCH   19
                        RET
                        .ENDFUNC  1327

                        .FUNC     onTickTimer, 00532h, 00020h
DCG.onTickTimer:
                        .RETURNS   0
                        .BLOCK    1331
                        .LINE     1332
                        LDS       _ACCB, DCG.RipplePercent
                        LDS       _ACCA, DCG.RipplePercent+1
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        CPI       _ACCA, 080h
                        BRNE      DCG._L0953
                        CPI       _ACCB, 000h
DCG._L0953:
                        LDI       _ACCA, 0h
                        BREQ      DCG._L0954
                        BRLO      DCG._L0954
                        SER       _ACCA
DCG._L0954:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0957
                        BRNE      DCG._L0957
                        .BRANCH   20,DCG._L0955
                        JMP       DCG._L0955
DCG._L0957:
                        .BLOCK    1332
                        .LINE     1333
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 000h
                        STS       DCG.AH, _ACCB
                        STS       DCG.AH+1, _ACCA
                        STS       DCG.AH+2, _ACCALO
                        STS       DCG.AH+3, _ACCAHI
                        .LINE     1334
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 000h
                        STS       DCG.WH, _ACCB
                        STS       DCG.WH+1, _ACCA
                        STS       DCG.WH+2, _ACCALO
                        STS       DCG.WH+3, _ACCAHI
                        .ENDBLOCK 1335
                        .BRANCH   20,DCG._L0956
                        JMP       DCG._L0956
DCG._L0955:
                        .BLOCK    1335
                        .LINE     1336
                        LDS       _ACCB, DCG.CurrAmp
                        LDS       _ACCA, DCG.CurrAmp+1
                        LDS       _ACCALO, DCG.CurrAmp+2
                        LDS       _ACCAHI, DCG.CurrAmp+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCB, 0ACh
                        LDI       _ACCA, 0C5h
                        LDI       _ACCALO, 027h
                        LDI       _ACCAHI, 037h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      DCG._L0959
                        BRPL      DCG._L0960
                        BRMI      DCG._L0958
DCG._L0960:
                        CLZ
                        CLC
                        RJMP      DCG._L0959
DCG._L0958:
                        CLZ
                        SEC
DCG._L0959:
                        LDI       _ACCA, 0FFh
                        BRLO      DCG._L0961
                        CLR       _ACCA
DCG._L0961:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0964
                        BRNE      DCG._L0964
                        .BRANCH   20,DCG._L0962
                        JMP       DCG._L0962
DCG._L0964:
                        .BLOCK    1336
                        .LINE     1337
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 000h
                        STS       DCG.CURRAMP, _ACCB
                        STS       DCG.CURRAMP+1, _ACCA
                        STS       DCG.CURRAMP+2, _ACCALO
                        STS       DCG.CURRAMP+3, _ACCAHI
                        .ENDBLOCK 1338
DCG._L0962:
DCG._L0963:
                        .LINE     1339
                        LDS       _ACCB, DCG.Ah
                        LDS       _ACCA, DCG.Ah+1
                        LDS       _ACCALO, DCG.Ah+2
                        LDS       _ACCAHI, DCG.Ah+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DCG.CurrAmp
                        LDS       _ACCA, DCG.CurrAmp+1
                        LDS       _ACCALO, DCG.CurrAmp+2
                        LDS       _ACCAHI, DCG.CurrAmp+3
                        MOVW      _ACCDLO, _ACCB
                        MOVW      _ACCELO, _ACCALO
                        LDI       _ACCBLO, 000h
                        LDI       _ACCBHI, 0A0h
                        LDI       _ACCCLO, 08Ch
                        LDI       _ACCCHI, 046h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat_R
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.AddFloat
                        STS       DCG.AH, _ACCB
                        STS       DCG.AH+1, _ACCA
                        STS       DCG.AH+2, _ACCALO
                        STS       DCG.AH+3, _ACCAHI
                        .LINE     1340
                        LDS       _ACCB, DCG.Wh
                        LDS       _ACCA, DCG.Wh+1
                        LDS       _ACCALO, DCG.Wh+2
                        LDS       _ACCAHI, DCG.Wh+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DCG.CurrAmp
                        LDS       _ACCA, DCG.CurrAmp+1
                        LDS       _ACCALO, DCG.CurrAmp+2
                        LDS       _ACCAHI, DCG.CurrAmp+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DCG.CurrVolt
                        LDS       _ACCA, DCG.CurrVolt+1
                        LDS       _ACCALO, DCG.CurrVolt+2
                        LDS       _ACCAHI, DCG.CurrVolt+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        MOVW      _ACCDLO, _ACCB
                        MOVW      _ACCELO, _ACCALO
                        LDI       _ACCBLO, 000h
                        LDI       _ACCBHI, 0A0h
                        LDI       _ACCCLO, 08Ch
                        LDI       _ACCCHI, 046h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat_R
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.AddFloat
                        STS       DCG.WH, _ACCB
                        STS       DCG.WH+1, _ACCA
                        STS       DCG.WH+2, _ACCALO
                        STS       DCG.WH+3, _ACCAHI
                        .ENDBLOCK 1341
DCG._L0956:
                        .ENDBLOCK 1342
DCG.onTickTimer_X:
                        .LINE     1342
                        .BRANCH   19
                        RET
                        .ENDFUNC  1342

                        .FUNC     initall, 00544h, 00020h
DCG.initall:
                        .RETURNS   0
                        .BLOCK    1350
                        .LINE     1357
                        LDI       _ACCA, 0BFh
                        OUT       DDRB, _ACCA
                        .LINE     1358
                        LDI       _ACCA, 0D3h
                        OUT       PORTB, _ACCA
                        .LINE     1359
                        LDI       _ACCA, 0FCh
                        OUT       DDRC, _ACCA
                        .LINE     1360
                        LDI       _ACCA, 00Fh
                        OUT       PORTC, _ACCA
                        .LINE     1361
                        LDI       _ACCA, 00Ch
                        OUT       DDRD, _ACCA
                        .LINE     1362
                        LDI       _ACCA, 0FCh
                        OUT       PORTD, _ACCA
                        .LINE     1364
                        LDI       _ACCCLO, DCG.EESerBaudReg AND 0FFh
                        LDI       _ACCCHI, DCG.EESerBaudReg SHRB 8
                        CALL      SYSTEM.ReadEEp8
                        MOV       DCG.I, _ACCA
                        .LINE     1365
                        MOV       _ACCA, DCG.i
                        CPI       _ACCA, 0EFh
                        .BRANCH   3,DCG._L0965
                        BREQ      DCG._L0965
                        .BRANCH   1,DCG._L0966
                        BRSH      DCG._L0966
                        CPI       _ACCA, 009h
                        .BRANCH   1,DCG._L0966
                        BRLO      DCG._L0966
                        LDI       _ACCDLO, 0
                        SEZ
                        .BRANCH   20,DCG._L0965
                        RJMP      DCG._L0965
DCG._L0966:
                        LDI       _ACCDLO, 001h
DCG._L0965:
                        LDI       _ACCA, 0h
                        BRNE      DCG._L0967
                        SER       _ACCA
DCG._L0967:
                        COM       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DCG._L0970
                        BRNE      DCG._L0970
                        .BRANCH   20,DCG._L0968
                        JMP       DCG._L0968
DCG._L0970:
                        .BLOCK    1365
                        .LINE     1366
                        LDI       _ACCA, 033h
                        LDI       _ACCCLO, DCG.EESERBAUDREG AND 0FFh
                        LDI       _ACCCHI, DCG.EESERBAUDREG SHRB 8
                        CALL      SYSTEM.WriteEEp8
                        ADIW      _ACCCLO, 01h
                        .LINE     1367
                        LDI       _ACCA, 033h
                        MOV       DCG.I, _ACCA
                        .ENDBLOCK 1368
DCG._L0968:
DCG._L0969:
                        .LINE     1369
                        MOV       _ACCA, DCG.i
                        OUT       UBRR1, _ACCA
                        .LINE     1370
                        IN        _ACCA, UCSRA
                        ORI       _ACCA, 002h
                        OUT       UCSRA, _ACCA
                        .LINE     1375
                        LDI       _ACCA, 001h
                        .FRAME  0
                        CALL      SYSTEM.UDELAY
                        .LINE     1376
                        IN        _ACCA, PinD
                        COM       _ACCA
                        LDI       _ACCALO, 005h
                        CALL      SYSTEM.SHR8_R
                        STS       DCG.SLAVECH, _ACCA
                        .LINE     1378
                        CBI       00032h, 002h
                        .LINE     1380
                        LDI       _ACCA, 000h
                        .FRAME  0
                        CALL       SYSTEM.LCDSETUP_M
                        TST       _ACCA
                        .BRANCH   4,DCG._L0973
                        BRNE      DCG._L0973
                        .BRANCH   20,DCG._L0971
                        JMP       DCG._L0971
DCG._L0973:
                        .BLOCK    1380
                        .LINE     1381
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
                        .LINE     1382
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
                        .LINE     1383
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
                        .LINE     1384
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
                        .LINE     1385
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 003h
                        ST        -Y, _ACCA
                        .FRAME  2
                        LDI       _ACCA, 00Eh
                        ST        -Y, _ACCA
                        .FRAME  3
                        LDI       _ACCA, 011h
                        ST        -Y, _ACCA
                        .FRAME  4
                        LDI       _ACCA, 011h
                        ST        -Y, _ACCA
                        .FRAME  5
                        LDI       _ACCA, 011h
                        ST        -Y, _ACCA
                        .FRAME  6
                        LDI       _ACCA, 00Ah
                        ST        -Y, _ACCA
                        .FRAME  7
                        LDI       _ACCA, 00Ah
                        ST        -Y, _ACCA
                        .FRAME  8
                        LDI       _ACCA, 01Bh
                        ST        -Y, _ACCA
                        .FRAME  9
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  10
                        .FRAME  0
                        CALL      SYSTEM.LCDCHARSET_M
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1386
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 004h
                        ST        -Y, _ACCA
                        .FRAME  2
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  3
                        LDI       _ACCA, 00Eh
                        ST        -Y, _ACCA
                        .FRAME  4
                        LDI       _ACCA, 01Fh
                        ST        -Y, _ACCA
                        .FRAME  5
                        LDI       _ACCA, 01Fh
                        ST        -Y, _ACCA
                        .FRAME  6
                        LDI       _ACCA, 01Fh
                        ST        -Y, _ACCA
                        .FRAME  7
                        LDI       _ACCA, 00Eh
                        ST        -Y, _ACCA
                        .FRAME  8
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  9
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  10
                        .FRAME  0
                        CALL      SYSTEM.LCDCHARSET_M
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1387
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 005h
                        ST        -Y, _ACCA
                        .FRAME  2
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  3
                        LDI       _ACCA, 00Eh
                        ST        -Y, _ACCA
                        .FRAME  4
                        LDI       _ACCA, 011h
                        ST        -Y, _ACCA
                        .FRAME  5
                        LDI       _ACCA, 015h
                        ST        -Y, _ACCA
                        .FRAME  6
                        LDI       _ACCA, 011h
                        ST        -Y, _ACCA
                        .FRAME  7
                        LDI       _ACCA, 00Eh
                        ST        -Y, _ACCA
                        .FRAME  8
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  9
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  10
                        .FRAME  0
                        CALL      SYSTEM.LCDCHARSET_M
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1389
                        LDI       _ACCA, 0FFh
                        STS       DCG.LCDPRESENT, _ACCA
                        .LINE     1390
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, DCG.Vers3Str AND 0FFh
                        LDI       _ACCCHI, DCG.Vers3Str SHRB 8
                        CALL      SYSTEM.StrConst2Str
DCG._L0974:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     1391
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
                        .LINE     1392
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, DCG.AdrStr AND 0FFh
                        LDI       _ACCCHI, DCG.AdrStr SHRB 8
                        CALL      SYSTEM.StrConst2Str
DCG._L0975:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     1393
                        LDS       _ACCA, DCG.SlaveCh
                        SUBI      _ACCA, -030h AND 0FFh
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .ENDBLOCK 1394
DCG._L0971:
DCG._L0972:
                        .LINE     1396
                        LDI       _ACCA, 003E8h SHRB 8
                        LDI       _ACCB, 003E8h AND 0FFh
                        .FRAME  0
                        CALL      SYSTEM.MDELAY
                        .LINE     1397
                        LDS       _ACCA, DCG.SlaveCh
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      DCG._L0976
                        BRLO      DCG._L0976
                        SER       _ACCA
DCG._L0976:
                        TST       _ACCA
                        .BRANCH   4,DCG._L0979
                        BRNE      DCG._L0979
                        .BRANCH   20,DCG._L0977
                        JMP       DCG._L0977
DCG._L0979:
                        .BLOCK    1397
                        .LINE     1398
                        .LOOP
                        LDI       _ACCCLO, DCG.i AND 0FFh
                        LDI       _ACCCHI, DCG.i SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 000h
                        ST        Z, _ACCA
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DCG.SlaveCh
                        SUBI      _ACCA, 001h AND 0FFh
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
DCG._L0982:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      DCG._L0983
                        CLR       _ACCA
DCG._L0983:
                        TST       _ACCA
                        .BRANCH   3,DCG._L0984
                        BREQ      DCG._L0984
                        .BRANCH   20,DCG._L0981
                        JMP       DCG._L0981
DCG._L0984:
                        .BLOCK    1399
                        .LINE     1399
                        CLR       _ACCA
                        SBIC      032h, 002h
                        SER       _ACCA
                        COM       _ACCA
                        CLT
                        TST       _ACCA
                        BREQ      DCG._L0985
                        SET
DCG._L0985:
                        IN        _ACCA, 00032h
                        BLD       _ACCA, 002h
                        OUT       00032h, _ACCA
                        .LINE     1400
                        LDI       _ACCA, 00096h SHRB 8
                        LDI       _ACCB, 00096h AND 0FFh
                        .FRAME  3
                        CALL      SYSTEM.MDELAY
                        .LINE     1401
                        CLR       _ACCA
                        SBIC      032h, 002h
                        SER       _ACCA
                        COM       _ACCA
                        CLT
                        TST       _ACCA
                        BREQ      DCG._L0986
                        SET
DCG._L0986:
                        IN        _ACCA, 00032h
                        BLD       _ACCA, 002h
                        OUT       00032h, _ACCA
                        .LINE     1402
                        LDI       _ACCA, 00096h SHRB 8
                        LDI       _ACCB, 00096h AND 0FFh
                        .FRAME  3
                        CALL      SYSTEM.MDELAY
                        .ENDBLOCK 1403
DCG._L0980:
                        .LINE     1403
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,DCG._L0981
                        BREQ      DCG._L0981
                        .BRANCH   20,DCG._L0982
                        JMP       DCG._L0982
DCG._L0981:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .ENDBLOCK 1404
DCG._L0977:
DCG._L0978:
                        .LINE     1405
                        SBI       00032h, 002h
                        .LINE     1407
                        LDI       _ACCA, 000h
                        STS       DCG.STATUS, _ACCA
                        .LINE     1408
                        LDI       _ACCA, 1 SHLB IntFlag
                        OR        Flags, _ACCA
                        SEI
                        .LINE     1409
DCG._L0987:
                        CALL       SYSTEM.SERSTAT
                        TST       _ACCA
                        .BRANCH   4,DCG._L0989
                        BRNE      DCG._L0989
                        .BRANCH   20,DCG._L0988
                        JMP       DCG._L0988
DCG._L0989:
                        .BLOCK    1409
                        .LINE     1410
                        CALL       SYSTEM.SERINP
                        MOV       DCG.I, _ACCA
                        .ENDBLOCK 1411
                        .LINE     1411
                        .BRANCH   20,DCG._L0987
                        JMP       DCG._L0987
DCG._L0988:
                        .LINE     1412
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DCG.INITSCALES
                        CALL      DCG.INITSCALES
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1413
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 080h
                        LDI       _ACCAHI, 03Fh
                        STS       DCG.DCAMPMOD, _ACCB
                        STS       DCG.DCAMPMOD+1, _ACCA
                        STS       DCG.DCAMPMOD+2, _ACCALO
                        STS       DCG.DCAMPMOD+3, _ACCAHI
                        .LINE     1414
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 000h
                        STS       DCG.DCVOLT, _ACCB
                        STS       DCG.DCVOLT+1, _ACCA
                        STS       DCG.DCVOLT+2, _ACCALO
                        STS       DCG.DCVOLT+3, _ACCAHI
                        .LINE     1415
                        LDI       _ACCCLO, DCG.InitAmp AND 0FFh
                        LDI       _ACCCHI, DCG.InitAmp SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        STS       DCG.DCAMP, _ACCB
                        STS       DCG.DCAMP+1, _ACCA
                        STS       DCG.DCAMP+2, _ACCALO
                        STS       DCG.DCAMP+3, _ACCAHI
                        .LINE     1416
                        LDI       _ACCA, 0FFh
                        STS       DCG.OLDURANGE, _ACCA
                        .LINE     1417
                        LDI       _ACCA, 0FFh
                        STS       DCG.OLDIRANGE, _ACCA
                        .LINE     1418
                        .BRANCH   17,DCG.CALCRANGEI
                        CALL      DCG.CALCRANGEI
                        .LINE     1419
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DCG.SETLEVELDAC
                        CALL      DCG.SETLEVELDAC
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1421
                        LDI       _ACCCLO, DCG.InitIncRast AND 0FFh
                        LDI       _ACCCHI, DCG.InitIncRast SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.FloatToLInt
                        SBRC      _ACCAHI, 7
                        RJMP      DCG._L0990
                        OR        _ACCAHI, _ACCALO
                        BRNE      DCG._L0991
                        RJMP      DCG._L0992
DCG._L0990:
                        CPI       _ACCAHI, 0FFh
                        BRNE      DCG._L0991
                        CPI       _ACCALO, 0FFh
                        BREQ      DCG._L0992
DCG._L0991:
                        SET
                        BLD       Flags, _ERRFLAG
DCG._L0992:
                        STS       DCG.INCRAST, _ACCB
                        STS       DCG.INCRAST+1, _ACCA
                        .LINE     1422
                        LDI       _ACCA, 001h
                        STS       DCG.MODIFY, _ACCA
                        .LINE     1423
                        CALL      SYSTEM.INCRCOUNT4START
                        .LINE     1424
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
                        .LINE     1425
                        LDI       _ACCA, 000h
                        .FRAME  0
                        CALL       SYSTEM.GETINCRVAL4
                        STS       DCG.INCRVALUE, _ACCB
                        STS       DCG.INCRVALUE+1, _ACCA
                        STS       DCG.INCRVALUE+2, _ACCALO
                        STS       DCG.INCRVALUE+3, _ACCAHI
                        .LINE     1426
                        LDS       _ACCB, DCG.IncrValue
                        LDS       _ACCA, DCG.IncrValue+1
                        LDS       _ACCALO, DCG.IncrValue+2
                        LDS       _ACCAHI, DCG.IncrValue+3
                        STS       DCG.OLDINCRVALUE, _ACCB
                        STS       DCG.OLDINCRVALUE+1, _ACCA
                        STS       DCG.OLDINCRVALUE+2, _ACCALO
                        STS       DCG.OLDINCRVALUE+3, _ACCAHI
                        .LINE     1427
                        LDI       _ACCA, 000h
                        STS       DCG.INCRFINE, _ACCA
                        .LINE     1428
                        LDI       _ACCA, 00000h SHRB 8
                        LDI       _ACCB, 00000h AND 0FFh
                        STS       DCG.INCRDIFF, _ACCB
                        STS       DCG.INCRDIFF+1, _ACCA
                        .LINE     1429
                        LDI       _ACCA, 0FFh
                        STS       DCG.FIRSTTURN, _ACCA
                        .LINE     1430
                        LDI       _ACCA, 0FEh
                        STS       DCG.SUBCH, _ACCA
                        .LINE     1431
                        .BRANCH   17,DCG.WRITECHPREFIX
                        CALL      DCG.WRITECHPREFIX
                        .LINE     1432
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.serout SHRB 1
                        LDI       _ACCA, SYSTEM.serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, DCG.Vers1Str AND 0FFh
                        LDI       _ACCCHI, DCG.Vers1Str SHRB 8
                        CALL      SYSTEM.StrConst2Str
DCG._L0993:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     1433
                        .BRANCH   17,DCG.SERCRLF
                        CALL      DCG.SERCRLF
                        .LINE     1434
                        LDI       _ACCA, 0FFh
                        STS       DCG.CURRENTCH, _ACCA
                        .LINE     1435
                        SBI       00035h, 007h
                        .LINE     1436
                        LDI       _ACCA, 0000Ah SHRB 8
                        LDI       _ACCB, 0000Ah AND 0FFh
                        .FRAME  0
                        CALL      SYSTEM.MDELAY
                        .LINE     1437
                        LDI       _ACCCLO, DCG.InitVolt AND 0FFh
                        LDI       _ACCCHI, DCG.InitVolt SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        STS       DCG.DCVOLT, _ACCB
                        STS       DCG.DCVOLT+1, _ACCA
                        STS       DCG.DCVOLT+2, _ACCALO
                        STS       DCG.DCVOLT+3, _ACCAHI
                        .LINE     1438
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DCG.SETLEVELDAC
                        CALL      DCG.SETLEVELDAC
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1439
                        LDI       _ACCA, 0FFh
                        STS       DCG.OLDRELAISSTATE, _ACCA
                        .LINE     1440
                        LDI       _ACCA, 000h
                        STS       DCG.RELAISSTATE, _ACCA
                        .LINE     1441
                        .BRANCH   17,DCG.SWITCHRELAIS
                        CALL      DCG.SWITCHRELAIS
                        .LINE     1442
                        LDI       _ACCA, 00000h SHRB 8
                        LDI       _ACCB, 00000h AND 0FFh
                        STS       DCG.ERRCOUNT, _ACCB
                        STS       DCG.ERRCOUNT+1, _ACCA
                        .LINE     1443
                        LDI       _ACCA, 000C8h SHRB 8
                        LDI       _ACCB, 000C8h AND 0FFh
                        .FRAME  0
                        CALL      SYSTEM.MDELAY
                        .LINE     1444
                        .BRANCH   17,DCG.FAULTCHECK
                        CALL      DCG.FAULTCHECK
                        .LINE     1445
                        LDS       _ACCB, 003B1h
                        CLR       _ACCA
                        SBRC      _ACCB, 001h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DCG._L0996
                        BRNE      DCG._L0996
                        .BRANCH   20,DCG._L0994
                        JMP       DCG._L0994
DCG._L0996:
                        .BLOCK    1446
                        .LINE     1446
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 008h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DCG.SERPROMPT
                        CALL      DCG.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 1447
DCG._L0994:
DCG._L0995:
                        .LINE     1449
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCB, 000030D40h AND 0FFh
                        LDI       _ACCA, 000030D40h SHRB 8
                        LDI       _ACCALO, 000030D40h SHRB 16
                        LDI       _ACCAHI, 000030D40h SHRB 24
                        ST        -Y, _ACCAHI
                        ST        -Y, _ACCALO
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  4
                        .FRAME  0
                        CALL       SYSTEM.TICKTIMERTIME
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1450
                        CALL      SYSTEM.TICKTIMERSTART
                        .LINE     1451
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 000h
                        STS       DCG.AH, _ACCB
                        STS       DCG.AH+1, _ACCA
                        STS       DCG.AH+2, _ACCALO
                        STS       DCG.AH+3, _ACCAHI
                        .LINE     1452
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 000h
                        STS       DCG.WH, _ACCB
                        STS       DCG.WH+1, _ACCA
                        STS       DCG.WH+2, _ACCALO
                        STS       DCG.WH+3, _ACCAHI
                        .LINE     1454
                        LDS       _ACCB, DCG.RipplePercent
                        LDS       _ACCA, DCG.RipplePercent+1
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        CPI       _ACCA, 080h
                        BRNE      DCG._L0997
                        CPI       _ACCB, 000h
DCG._L0997:
                        LDI       _ACCA, 0h
                        BRNE      DCG._L0998
                        SER       _ACCA
DCG._L0998:
                        STS       DCG.NOTOGGLE, _ACCA
                        .ENDBLOCK 1455
DCG.initall_X:
                        .LINE     1455
                        .BRANCH   19
                        RET
                        .ENDFUNC  1455



                        ; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                        ; Program body
                        ; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

                        .FUNC     $_Main, 005B3h, 00020h
                        .ENTRYMAIN $
DCG.$_Main:

                        .BLOCK    1459
                        .LINE     1460
                        .BRANCH   17,DCG.INITALL
                        CALL      DCG.INITALL
DCG._L0999:
                        .BLOCK    1462
                        .LINE     1463
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DCG.CHECKSER
                        CALL      DCG.CHECKSER
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1464
                        SER       _ACCA
                        LDS       _ACCB, DCG.ActivityTimer
                        TST       _ACCB
                        BREQ      DCG._L1001
                        COM       _ACCA
DCG._L1001:
                        TST       _ACCA
                        .BRANCH   4,DCG._L1004
                        BRNE      DCG._L1004
                        .BRANCH   20,DCG._L1002
                        JMP       DCG._L1002
DCG._L1004:
                        .BLOCK    1464
                        .LINE     1465
                        SBI       00032h, 002h
                        .ENDBLOCK 1466
DCG._L1002:
DCG._L1003:
                        .LINE     1467
                        LDS       _ACCA, DCG.LCDpresent
                        TST       _ACCA
                        .BRANCH   4,DCG._L1007
                        BRNE      DCG._L1007
                        .BRANCH   20,DCG._L1005
                        JMP       DCG._L1005
DCG._L1007:
                        .BLOCK    1467
                        .LINE     1468
                        LDI       _ACCA, 0FFh
                        STS       DCG.VERBOSE, _ACCA
                        .LINE     1469
                        LDI       _ACCA, 000h
                        .FRAME  0
                        CALL       SYSTEM.GETINCRVAL4
                        STS       DCG.INCRVALUE, _ACCB
                        STS       DCG.INCRVALUE+1, _ACCA
                        STS       DCG.INCRVALUE+2, _ACCALO
                        STS       DCG.INCRVALUE+3, _ACCAHI
                        .LINE     1471
                        LDS       _ACCB, DCG.IncrValue
                        LDS       _ACCA, DCG.IncrValue+1
                        LDS       _ACCALO, DCG.IncrValue+2
                        LDS       _ACCAHI, DCG.IncrValue+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DCG.OldIncrValue
                        LDS       _ACCA, DCG.OldIncrValue+1
                        LDS       _ACCALO, DCG.OldIncrValue+2
                        LDS       _ACCAHI, DCG.OldIncrValue+3
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
                        BRNE      DCG._L1008
                        CP        _ACCALO, _ACCCLO
                        BRNE      DCG._L1008
                        CP        _ACCA, _ACCBHI
                        BRNE      DCG._L1008
                        CP        _ACCB, _ACCBLO
DCG._L1008:
                        LDI       _ACCA, 0h
                        BREQ      DCG._L1009
                        SER       _ACCA
DCG._L1009:
                        TST       _ACCA
                        .BRANCH   4,DCG._L1012
                        BRNE      DCG._L1012
                        .BRANCH   20,DCG._L1010
                        JMP       DCG._L1010
DCG._L1012:
                        .BLOCK    1471
                        .LINE     1472
                        LDI       _ACCA, 0FAh
                        STS       DCG.ActivityTimer, _ACCA
                        .LINE     1473
                        LDI       _ACCA, 000h
                        STS       DCG.FAULTTIMER, _ACCA
                        .LINE     1474
                        CBI       00032h, 002h
                        .LINE     1475
                        LDS       _ACCB, DCG.IncrDiff
                        LDS       _ACCA, DCG.IncrDiff+1
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDS       _ACCB, DCG.IncrValue
                        LDS       _ACCA, DCG.IncrValue+1
                        LDS       _ACCALO, DCG.IncrValue+2
                        LDS       _ACCAHI, DCG.IncrValue+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DCG.OldIncrValue
                        LDS       _ACCA, DCG.OldIncrValue+1
                        LDS       _ACCALO, DCG.OldIncrValue+2
                        LDS       _ACCAHI, DCG.OldIncrValue+3
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
                        STS       DCG.INCRDIFF, _ACCB
                        STS       DCG.INCRDIFF+1, _ACCA
                        .LINE     1476
                        LDS       _ACCB, DCG.IncrValue
                        LDS       _ACCA, DCG.IncrValue+1
                        LDS       _ACCALO, DCG.IncrValue+2
                        LDS       _ACCAHI, DCG.IncrValue+3
                        STS       DCG.OLDINCRVALUE, _ACCB
                        STS       DCG.OLDINCRVALUE+1, _ACCA
                        STS       DCG.OLDINCRVALUE+2, _ACCALO
                        STS       DCG.OLDINCRVALUE+3, _ACCAHI
                        .LINE     1477
                        LDI       _ACCA, 0C8h
                        STS       DCG.IncrTimer, _ACCA
                        .LINE     1478
                        LDS       _ACCB, DCG.IncrDiff
                        LDS       _ACCA, DCG.IncrDiff+1
                        TST       _ACCA
                        BRPL      DCG._L1013
                        NEG       _ACCB
                        BRNE      DCG._L1014
                        DEC       _ACCA
DCG._L1014:
                        COM       _ACCA
DCG._L1013:
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDS       _ACCB, DCG.IncRast
                        LDS       _ACCA, DCG.IncRast+1
                        MOVW      _ACCALO, _ACCB
                        POP       _ACCA
                        POP       _ACCB
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        EOR       _ACCAHI, _ACCBLO
                        CP        _ACCA, _ACCAHI
                        BRNE      DCG._L1015
                        CP        _ACCB, _ACCALO
DCG._L1015:
                        LDI       _ACCA, 0
                        BRLO      DCG._L1016
                        LDI       _ACCA, 0FFh
DCG._L1016:
                        TST       _ACCA
                        .BRANCH   4,DCG._L1019
                        BRNE      DCG._L1019
                        .BRANCH   20,DCG._L1017
                        JMP       DCG._L1017
DCG._L1019:
                        .BLOCK    1479
                        .LINE     1479
                        LDI       _ACCA, 0FFh
                        STS       DCG.CHANGEDFLAG, _ACCA
                        .LINE     1480
                        LDS       _ACCA, 003B0h
                        SBR       _ACCA, 080h
                        STS       003B0h, _ACCA
                        .LINE     1481
                        LDS       _ACCB, DCG.IncrDiff
                        LDS       _ACCA, DCG.IncrDiff+1
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDS       _ACCB, DCG.IncRast
                        LDS       _ACCA, DCG.IncRast+1
                        SET
                        BLD       Flags, _SIGN
                        POP       _ACCBHI
                        POP       _ACCBLO
                        CALL      SYSTEM.DIV16
                        STS       DCG.INCRDIFF, _ACCB
                        STS       DCG.INCRDIFF+1, _ACCA
                        .LINE     1483
                        LDS       _ACCB, DCG.IncrDiff
                        LDS       _ACCA, DCG.IncrDiff+1
                        TST       _ACCA
                        BREQ      DCG._L1020
                        BRPL      DCG._L1021
                        SER       _ACCB
                        SER       _ACCA
                        RJMP      DCG._L1022
DCG._L1020:
                        TST       _ACCB
                        BREQ      DCG._L1022
DCG._L1021:
                        CLR       _ACCA
                        LDI       _ACCB, 1
DCG._L1022:
                        STS       DCG.INCRACCINT10, _ACCB
                        STS       DCG.INCRACCINT10+1, _ACCA
                        .LINE     1484
                        LDS       _ACCB, DCG.IncrDiff
                        LDS       _ACCA, DCG.IncrDiff+1
                        MOV       _ACCA, _ACCB
                        STS       DCG.INCRDIFFBYTE, _ACCA
                        .LINE     1485
                        LDS       _ACCB, DCG.IncrAccInt10
                        LDS       _ACCA, DCG.IncrAccInt10+1
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDI       _ACCCLO, DCG.IncrAccArray AND 0FFh
                        LDI       _ACCCHI, DCG.IncrAccArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCB, DCG.IncrDiff
                        LDS       _ACCA, DCG.IncrDiff+1
                        TST       _ACCA
                        BRPL      DCG._L1023
                        NEG       _ACCB
                        BRNE      DCG._L1024
                        DEC       _ACCA
DCG._L1024:
                        COM       _ACCA
DCG._L1023:
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
                        STS       DCG.INCRDIFF, _ACCB
                        STS       DCG.INCRDIFF+1, _ACCA
                        .LINE     1492
                        LDS       _ACCB, DCG.IncrDiff
                        LDS       _ACCA, DCG.IncrDiff+1
                        LDI       _ACCBLO, 0000Ah AND 0FFh
                        LDI       _ACCBHI, 0000Ah SHRB 8
                        SET
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.MUL16
                        STS       DCG.INCRACCINT10, _ACCB
                        STS       DCG.INCRACCINT10+1, _ACCA
                        .LINE     1493
                        LDS       _ACCB, DCG.IncrDiff
                        LDS       _ACCA, DCG.IncrDiff+1
                        SBRS      _ACCA, 7
                        RJMP      DCG._L1025
                        LDI       _ACCAHI, 0FFh
                        LDI       _ACCALO, 0FFh
                        RJMP      DCG._L1026
DCG._L1025:
                        CLR       _ACCAHI
                        CLR       _ACCALO
DCG._L1026:
                        SET
                        BLD       Flags, _SIGN
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.LIntToFloat
                        STS       DCG.INCRACCFLOAT, _ACCB
                        STS       DCG.INCRACCFLOAT+1, _ACCA
                        STS       DCG.INCRACCFLOAT+2, _ACCALO
                        STS       DCG.INCRACCFLOAT+3, _ACCAHI
                        .LINE     1494
                        LDI       _ACCA, 005DCh SHRB 8
                        LDI       _ACCB, 005DCh AND 0FFh
                        LDI       _ACCCLO, DCG.DisplayTimer AND 0FFh
                        LDI       _ACCCHI, DCG.DisplayTimer SHRB 8
                        LDI       _ACCBHI, 001h
                        CALL      SYSTEM.SetSysTimer
                        .LINE     1495
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 080h
                        LDI       _ACCAHI, 03Fh
                        STS       DCG.DCAMPMOD, _ACCB
                        STS       DCG.DCAMPMOD+1, _ACCA
                        STS       DCG.DCAMPMOD+2, _ACCALO
                        STS       DCG.DCAMPMOD+3, _ACCAHI
                        .LINE     1496
                        LDS       _ACCA, DCG.Modify
                        .LINE     1497
                        CPI       _ACCA, 1
                        .BRANCH   3,DCG._L1030
                        BREQ      DCG._L1030
                        .BRANCH   20,DCG._L1029
                        JMP       DCG._L1029
DCG._L1030:
DCG._L1028:
                        .BLOCK    1498
                        .LINE     1498
                        LDS       _ACCB, DCG.DCVolt
                        LDS       _ACCA, DCG.DCVolt+1
                        LDS       _ACCALO, DCG.DCVolt+2
                        LDS       _ACCAHI, DCG.DCVolt+3
                        STS       DCG.PARAM, _ACCB
                        STS       DCG.PARAM+1, _ACCA
                        STS       DCG.PARAM+2, _ACCALO
                        STS       DCG.PARAM+3, _ACCAHI
                        .LINE     1499
                        LDS       _ACCA, DCG.FirstTurn
                        TST       _ACCA
                        .BRANCH   4,DCG._L1033
                        BRNE      DCG._L1033
                        .BRANCH   20,DCG._L1031
                        JMP       DCG._L1031
DCG._L1033:
                        .BLOCK    1499
                        .LINE     1500
                        .BRANCH   17,DCG.INCFACU
                        CALL      DCG.INCFACU
                        .LINE     1501
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DCG.ROUNDINCPARAM
                        CALL      DCG.ROUNDINCPARAM
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1502
                        LDI       _ACCA, 004h
                        STS       DCG.BUTTONNUMBER, _ACCA
                        .LINE     1503
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DCG.SERPROMPT
                        CALL      DCG.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 1504
DCG._L1031:
DCG._L1032:
                        .LINE     1505
                        .BRANCH   17,DCG.SETACCPARAM
                        CALL      DCG.SETACCPARAM
                        .LINE     1506
                        LDS       _ACCB, DCG.Param
                        LDS       _ACCA, DCG.Param+1
                        LDS       _ACCALO, DCG.Param+2
                        LDS       _ACCAHI, DCG.Param+3
                        STS       DCG.DCVOLT, _ACCB
                        STS       DCG.DCVOLT+1, _ACCA
                        STS       DCG.DCVOLT+2, _ACCALO
                        STS       DCG.DCVOLT+3, _ACCAHI
                        .LINE     1507
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 080h
                        LDI       _ACCAHI, 03Fh
                        STS       DCG.DCVOLTMOD, _ACCB
                        STS       DCG.DCVOLTMOD+1, _ACCA
                        STS       DCG.DCVOLTMOD+2, _ACCALO
                        STS       DCG.DCVOLTMOD+3, _ACCAHI
                        .LINE     1508
                        .BRANCH   17,DCG.CHECKLIMITS
                        CALL      DCG.CHECKLIMITS
                        .LINE     1509
                        .BRANCH   17,DCG.SOLLSPANNUNGONLCD
                        CALL      DCG.SOLLSPANNUNGONLCD
                        .LINE     1510
                        .BRANCH   17,DCG.ISTSTROMONLCD
                        CALL      DCG.ISTSTROMONLCD
                        .LINE     1511
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 0FFh
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DCG.SETCURSOR
                        CALL      DCG.SETCURSOR
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1512
                        LDI       _ACCA, 000h
                        STS       DCG.SUBCH, _ACCA
                        .LINE     1513
                        .BRANCH   17,DCG.PARSEGETPARAM
                        CALL      DCG.PARSEGETPARAM
                        .ENDBLOCK 1514
                        .BRANCH   20,DCG._L1027
                        JMP       DCG._L1027
DCG._L1029:
                        .LINE     1515
                        CPI       _ACCA, 0
                        .BRANCH   3,DCG._L1036
                        BREQ      DCG._L1036
                        .BRANCH   20,DCG._L1035
                        JMP       DCG._L1035
DCG._L1036:
DCG._L1034:
                        .BLOCK    1516
                        .LINE     1516
                        .BRANCH   17,DCG.CALCRANGEI
                        CALL      DCG.CALCRANGEI
                        .LINE     1517
                        LDS       _ACCB, DCG.DCamp
                        LDS       _ACCA, DCG.DCamp+1
                        LDS       _ACCALO, DCG.DCamp+2
                        LDS       _ACCAHI, DCG.DCamp+3
                        STS       DCG.PARAM, _ACCB
                        STS       DCG.PARAM+1, _ACCA
                        STS       DCG.PARAM+2, _ACCALO
                        STS       DCG.PARAM+3, _ACCAHI
                        .LINE     1518
                        LDS       _ACCA, DCG.FirstTurn
                        TST       _ACCA
                        .BRANCH   4,DCG._L1039
                        BRNE      DCG._L1039
                        .BRANCH   20,DCG._L1037
                        JMP       DCG._L1037
DCG._L1039:
                        .BLOCK    1518
                        .LINE     1519
                        .BRANCH   17,DCG.INCFACI
                        CALL      DCG.INCFACI
                        .LINE     1520
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DCG.ROUNDINCPARAM
                        CALL      DCG.ROUNDINCPARAM
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1521
                        LDI       _ACCA, 004h
                        STS       DCG.BUTTONNUMBER, _ACCA
                        .LINE     1522
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DCG.SERPROMPT
                        CALL      DCG.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 1523
DCG._L1037:
DCG._L1038:
                        .LINE     1524
                        .BRANCH   17,DCG.SETACCPARAM
                        CALL      DCG.SETACCPARAM
                        .LINE     1525
                        LDS       _ACCB, DCG.Param
                        LDS       _ACCA, DCG.Param+1
                        LDS       _ACCALO, DCG.Param+2
                        LDS       _ACCAHI, DCG.Param+3
                        STS       DCG.DCAMP, _ACCB
                        STS       DCG.DCAMP+1, _ACCA
                        STS       DCG.DCAMP+2, _ACCALO
                        STS       DCG.DCAMP+3, _ACCAHI
                        .LINE     1526
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 080h
                        LDI       _ACCAHI, 03Fh
                        STS       DCG.DCAMPMOD, _ACCB
                        STS       DCG.DCAMPMOD+1, _ACCA
                        STS       DCG.DCAMPMOD+2, _ACCALO
                        STS       DCG.DCAMPMOD+3, _ACCAHI
                        .LINE     1527
                        .BRANCH   17,DCG.CHECKLIMITS
                        CALL      DCG.CHECKLIMITS
                        .LINE     1528
                        .BRANCH   17,DCG.SOLLSTROMONLCD
                        CALL      DCG.SOLLSTROMONLCD
                        .LINE     1529
                        .BRANCH   17,DCG.ISTSPANNUNGONLCD
                        CALL      DCG.ISTSPANNUNGONLCD
                        .LINE     1530
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 0FFh
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DCG.SETCURSOR
                        CALL      DCG.SETCURSOR
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1531
                        LDI       _ACCA, 001h
                        STS       DCG.SUBCH, _ACCA
                        .LINE     1532
                        .BRANCH   17,DCG.PARSEGETPARAM
                        CALL      DCG.PARSEGETPARAM
                        .ENDBLOCK 1533
                        .BRANCH   20,DCG._L1027
                        JMP       DCG._L1027
DCG._L1035:
                        .LINE     1534
                        CPI       _ACCA, 3
                        .BRANCH   3,DCG._L1042
                        BREQ      DCG._L1042
                        .BRANCH   20,DCG._L1041
                        JMP       DCG._L1041
DCG._L1042:
DCG._L1040:
                        .BLOCK    1535
                        .LINE     1535
                        LDS       _ACCA, DCG.FirstTurn
                        TST       _ACCA
                        .BRANCH   4,DCG._L1045
                        BRNE      DCG._L1045
                        .BRANCH   20,DCG._L1043
                        JMP       DCG._L1043
DCG._L1045:
                        .BLOCK    1535
                        .LINE     1536
                        LDI       _ACCA, 004h
                        STS       DCG.BUTTONNUMBER, _ACCA
                        .LINE     1537
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DCG.SERPROMPT
                        CALL      DCG.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1538
                        LDI       _ACCA, 000h
                        STS       DCG.FIRSTTURN, _ACCA
                        .ENDBLOCK 1539
DCG._L1043:
DCG._L1044:
                        .LINE     1540
                        LDS       _ACCB, DCG.PWonTime
                        LDS       _ACCA, DCG.PWonTime+1
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDS       _ACCB, DCG.IncrDiff
                        LDS       _ACCA, DCG.IncrDiff+1
                        PUSH      _ACCB
                        PUSH      _ACCA
                        POP       _ACCAHI
                        POP       _ACCALO
                        ADD       _ACCB, _ACCALO
                        ADC       _ACCA, _ACCAHI
                        POP       _ACCAHI
                        POP       _ACCALO
                        ADD       _ACCB, _ACCALO
                        ADC       _ACCA, _ACCAHI
                        STS       DCG.PWONTIME, _ACCB
                        STS       DCG.PWONTIME+1, _ACCA
                        .LINE     1541
                        .BRANCH   17,DCG.CHECKLIMITS
                        CALL      DCG.CHECKLIMITS
                        .LINE     1542
                        LDI       _ACCA, 01Bh
                        STS       DCG.SUBCH, _ACCA
                        .LINE     1543
                        .BRANCH   17,DCG.PARSEGETPARAM
                        CALL      DCG.PARSEGETPARAM
                        .LINE     1544
                        .BRANCH   17,DCG.OPTIONSONLCD
                        CALL      DCG.OPTIONSONLCD
                        .ENDBLOCK 1545
                        .BRANCH   20,DCG._L1027
                        JMP       DCG._L1027
DCG._L1041:
                        .LINE     1546
                        CPI       _ACCA, 4
                        .BRANCH   3,DCG._L1048
                        BREQ      DCG._L1048
                        .BRANCH   20,DCG._L1047
                        JMP       DCG._L1047
DCG._L1048:
DCG._L1046:
                        .BLOCK    1547
                        .LINE     1547
                        LDS       _ACCA, DCG.FirstTurn
                        TST       _ACCA
                        .BRANCH   4,DCG._L1051
                        BRNE      DCG._L1051
                        .BRANCH   20,DCG._L1049
                        JMP       DCG._L1049
DCG._L1051:
                        .BLOCK    1547
                        .LINE     1548
                        LDI       _ACCA, 004h
                        STS       DCG.BUTTONNUMBER, _ACCA
                        .LINE     1549
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DCG.SERPROMPT
                        CALL      DCG.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1550
                        LDI       _ACCA, 000h
                        STS       DCG.FIRSTTURN, _ACCA
                        .ENDBLOCK 1551
DCG._L1049:
DCG._L1050:
                        .LINE     1552
                        LDS       _ACCB, DCG.PWoffTime
                        LDS       _ACCA, DCG.PWoffTime+1
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDS       _ACCB, DCG.IncrDiff
                        LDS       _ACCA, DCG.IncrDiff+1
                        PUSH      _ACCB
                        PUSH      _ACCA
                        POP       _ACCAHI
                        POP       _ACCALO
                        ADD       _ACCB, _ACCALO
                        ADC       _ACCA, _ACCAHI
                        POP       _ACCAHI
                        POP       _ACCALO
                        ADD       _ACCB, _ACCALO
                        ADC       _ACCA, _ACCAHI
                        STS       DCG.PWOFFTIME, _ACCB
                        STS       DCG.PWOFFTIME+1, _ACCA
                        .LINE     1553
                        .BRANCH   17,DCG.CHECKLIMITS
                        CALL      DCG.CHECKLIMITS
                        .LINE     1554
                        LDI       _ACCA, 01Ch
                        STS       DCG.SUBCH, _ACCA
                        .LINE     1555
                        .BRANCH   17,DCG.PARSEGETPARAM
                        CALL      DCG.PARSEGETPARAM
                        .LINE     1556
                        .BRANCH   17,DCG.OPTIONSONLCD
                        CALL      DCG.OPTIONSONLCD
                        .ENDBLOCK 1557
                        .BRANCH   20,DCG._L1027
                        JMP       DCG._L1027
DCG._L1047:
                        .LINE     1558
                        CPI       _ACCA, 2
                        .BRANCH   3,DCG._L1054
                        BREQ      DCG._L1054
                        .BRANCH   20,DCG._L1053
                        JMP       DCG._L1053
DCG._L1054:
DCG._L1052:
                        .BLOCK    1559
                        .LINE     1559
                        LDS       _ACCA, DCG.FirstTurn
                        TST       _ACCA
                        .BRANCH   4,DCG._L1057
                        BRNE      DCG._L1057
                        .BRANCH   20,DCG._L1055
                        JMP       DCG._L1055
DCG._L1057:
                        .BLOCK    1559
                        .LINE     1560
                        LDI       _ACCA, 004h
                        STS       DCG.BUTTONNUMBER, _ACCA
                        .LINE     1561
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DCG.SERPROMPT
                        CALL      DCG.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1562
                        LDI       _ACCA, 000h
                        STS       DCG.FIRSTTURN, _ACCA
                        .ENDBLOCK 1563
DCG._L1055:
DCG._L1056:
                        .LINE     1564
                        LDS       _ACCB, DCG.RipplePercent
                        LDS       _ACCA, DCG.RipplePercent+1
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDS       _ACCB, DCG.IncrDiff
                        LDS       _ACCA, DCG.IncrDiff+1
                        POP       _ACCAHI
                        POP       _ACCALO
                        ADD       _ACCB, _ACCALO
                        ADC       _ACCA, _ACCAHI
                        STS       DCG.RIPPLEPERCENT, _ACCB
                        STS       DCG.RIPPLEPERCENT+1, _ACCA
                        .LINE     1565
                        .BRANCH   17,DCG.CHECKLIMITS
                        CALL      DCG.CHECKLIMITS
                        .LINE     1566
                        LDI       _ACCA, 01Dh
                        STS       DCG.SUBCH, _ACCA
                        .LINE     1567
                        .BRANCH   17,DCG.PARSEGETPARAM
                        CALL      DCG.PARSEGETPARAM
                        .LINE     1568
                        .BRANCH   17,DCG.OPTIONSONLCD
                        CALL      DCG.OPTIONSONLCD
                        .ENDBLOCK 1569
                        .BRANCH   20,DCG._L1027
                        JMP       DCG._L1027
DCG._L1053:
                        .LINE     1570
                        CPI       _ACCA, 5
                        .BRANCH   3,DCG._L1060
                        BREQ      DCG._L1060
                        .BRANCH   20,DCG._L1059
                        JMP       DCG._L1059
DCG._L1060:
DCG._L1058:
                        .BLOCK    1571
                        .LINE     1571
                        LDS       _ACCA, DCG.Trackchannel
                        PUSH      _ACCA
                        LDS       _ACCB, DCG.IncrDiff
                        LDS       _ACCA, DCG.IncrDiff+1
                        MOV       _ACCA, _ACCB
                        POP       _ACCB
                        ADD       _ACCA, _ACCB
                        STS       DCG.TRACKCHANNEL, _ACCA
                        .LINE     1572
                        .BRANCH   17,DCG.CHECKLIMITS
                        CALL      DCG.CHECKLIMITS
                        .LINE     1573
                        .BRANCH   17,DCG.OPTIONSONLCD
                        CALL      DCG.OPTIONSONLCD
                        .ENDBLOCK 1574
                        .BRANCH   20,DCG._L1027
                        JMP       DCG._L1027
DCG._L1059:
DCG._L1027:
                        .LINE     1576
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DCG.SETLEVELDAC
                        CALL      DCG.SETLEVELDAC
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1577
                        LDI       _ACCA, 00000h SHRB 8
                        LDI       _ACCB, 00000h AND 0FFh
                        STS       DCG.INCRDIFF, _ACCB
                        STS       DCG.INCRDIFF+1, _ACCA
                        .ENDBLOCK 1578
DCG._L1017:
DCG._L1018:
                        .ENDBLOCK 1579
DCG._L1010:
DCG._L1011:
                        .LINE     1580
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DCG.CHECKDELAY
                        CALL      DCG.CHECKDELAY
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1581
                        LDI       _ACCA, 000h
                        .FRAME  0
                        CALL       SYSTEM.LCDPORTINP_M
                        ORI       _ACCA, 0C7h
                        STS       DCG.BUTTONTEMP, _ACCA
                        .LINE     1582
                        LDS       _ACCA, DCG.ButtonTemp
                        CPI       _ACCA, 0FFh
                        LDI       _ACCA, 0h
                        BREQ      DCG._L1061
                        SER       _ACCA
DCG._L1061:
                        TST       _ACCA
                        .BRANCH   4,DCG._L1064
                        BRNE      DCG._L1064
                        .BRANCH   20,DCG._L1062
                        JMP       DCG._L1062
DCG._L1064:
                        .BLOCK    1582
                        .LINE     1583
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DCG.CHECKDELAY
                        CALL      DCG.CHECKDELAY
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1584
                        LDI       _ACCA, 0FFh
                        STS       DCG.VERBOSE, _ACCA
                        .LINE     1585
                        LDI       _ACCA, 000h
                        .FRAME  0
                        CALL       SYSTEM.LCDPORTINP_M
                        ORI       _ACCA, 0C7h
                        STS       DCG.BUTTONTEMP, _ACCA
                        .LINE     1586
                        LDS       _ACCA, DCG.ButtonTemp
                        CPI       _ACCA, 0FFh
                        LDI       _ACCA, 0h
                        BREQ      DCG._L1065
                        SER       _ACCA
DCG._L1065:
                        TST       _ACCA
                        .BRANCH   4,DCG._L1068
                        BRNE      DCG._L1068
                        .BRANCH   20,DCG._L1066
                        JMP       DCG._L1066
DCG._L1068:
                        .BLOCK    1586
                        .LINE     1587
                        LDI       _ACCA, 003E8h SHRB 8
                        LDI       _ACCB, 003E8h AND 0FFh
                        LDI       _ACCCLO, DCG.DisplayTimer AND 0FFh
                        LDI       _ACCCHI, DCG.DisplayTimer SHRB 8
                        LDI       _ACCBHI, 001h
                        CALL      SYSTEM.SetSysTimer
                        .LINE     1588
                        LDS       _ACCB, 00276h
                        CLR       _ACCA
                        SBRC      _ACCB, 003h
                        SER       _ACCA
                        COM       _ACCA
                        PUSH      _ACCA
                        LDS       _ACCA, DCG.Modify
                        CPI       _ACCA, 000h
                        .BRANCH   3,DCG._L1069
                        BREQ      DCG._L1069
                        CPI       _ACCA, 001h
                        .BRANCH   3,DCG._L1069
                        BREQ      DCG._L1069
                        CPI       _ACCA, 006h
                        .BRANCH   3,DCG._L1069
                        BREQ      DCG._L1069
DCG._L1069:
                        LDI       _ACCA, 0h
                        BRNE      DCG._L1070
                        SER       _ACCA
DCG._L1070:
                        POP       _ACCB
                        AND       _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   4,DCG._L1073
                        BRNE      DCG._L1073
                        .BRANCH   20,DCG._L1071
                        JMP       DCG._L1071
DCG._L1073:
                        .BLOCK    1588
                        .LINE     1589
                        LDS       _ACCA, DCG.IncrFine
                        COM       _ACCA
                        STS       DCG.INCRFINE, _ACCA
                        .LINE     1590
                        LDI       _ACCA, 005DCh SHRB 8
                        LDI       _ACCB, 005DCh AND 0FFh
                        LDI       _ACCCLO, DCG.DisplayTimer AND 0FFh
                        LDI       _ACCCHI, DCG.DisplayTimer SHRB 8
                        LDI       _ACCBHI, 001h
                        CALL      SYSTEM.SetSysTimer
                        .LINE     1591
                        LDI       _ACCA, 003h
                        STS       DCG.BUTTONNUMBER, _ACCA
                        .LINE     1592
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DCG.SERPROMPT
                        CALL      DCG.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1593
                        .BRANCH   17,DCG.SOLLSPANNUNGONLCD
                        CALL      DCG.SOLLSPANNUNGONLCD
                        .LINE     1594
                        .BRANCH   17,DCG.SOLLSTROMONLCD
                        CALL      DCG.SOLLSTROMONLCD
                        .LINE     1595
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 0FFh
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DCG.SETCURSOR
                        CALL      DCG.SETCURSOR
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1597
                        LDS       _ACCA, DCG.modify
                        CPI       _ACCA, 006h
                        LDI       _ACCA, 0h
                        BRNE      DCG._L1074
                        SER       _ACCA
DCG._L1074:
                        TST       _ACCA
                        .BRANCH   4,DCG._L1077
                        BRNE      DCG._L1077
                        .BRANCH   20,DCG._L1075
                        JMP       DCG._L1075
DCG._L1077:
                        .BLOCK    1597
                        .LINE     1598
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 000h
                        STS       DCG.AH, _ACCB
                        STS       DCG.AH+1, _ACCA
                        STS       DCG.AH+2, _ACCALO
                        STS       DCG.AH+3, _ACCAHI
                        .LINE     1599
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 000h
                        STS       DCG.WH, _ACCB
                        STS       DCG.WH+1, _ACCA
                        STS       DCG.WH+2, _ACCALO
                        STS       DCG.WH+3, _ACCAHI
                        .ENDBLOCK 1600
DCG._L1075:
DCG._L1076:
                        .ENDBLOCK 1603
DCG._L1071:
DCG._L1072:
                        .LINE     1604
                        LDS       _ACCB, 00276h
                        CLR       _ACCA
                        SBRC      _ACCB, 005h
                        SER       _ACCA
                        COM       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DCG._L1080
                        BRNE      DCG._L1080
                        .BRANCH   20,DCG._L1078
                        JMP       DCG._L1078
DCG._L1080:
                        .BLOCK    1604
                        .LINE     1605
                        LDI       _ACCA, 001h
                        STS       DCG.BUTTONNUMBER, _ACCA
                        .LINE     1606
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DCG.SERPROMPT
                        CALL      DCG.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1607
                        LDS       _ACCA, DCG.modify
                        CPI       _ACCA, 005h
                        LDI       _ACCA, 0h
                        BRNE      DCG._L1081
                        SER       _ACCA
DCG._L1081:
                        TST       _ACCA
                        .BRANCH   4,DCG._L1084
                        BRNE      DCG._L1084
                        .BRANCH   20,DCG._L1082
                        JMP       DCG._L1082
DCG._L1084:
                        .BLOCK    1607
                        .LINE     1608
                        LDS       _ACCA, DCG.TrackChannel
                        LDI       _ACCCLO, DCG.TRACKCHSAVE AND 0FFh
                        LDI       _ACCCHI, DCG.TRACKCHSAVE SHRB 8
                        CALL      SYSTEM.WriteEEp8
                        ADIW      _ACCCLO, 01h
                        .ENDBLOCK 1609
DCG._L1082:
DCG._L1083:
                        .LINE     1611
                        LDS       _ACCA, DCG.modify
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BRNE      DCG._L1085
                        SER       _ACCA
DCG._L1085:
                        TST       _ACCA
                        .BRANCH   4,DCG._L1088
                        BRNE      DCG._L1088
                        .BRANCH   20,DCG._L1086
                        JMP       DCG._L1086
DCG._L1088:
                        .BLOCK    1611
                        .LINE     1612
                        LDI       _ACCA, 007h
                        STS       DCG.MODIFY, _ACCA
                        .ENDBLOCK 1613
                        .BRANCH   20,DCG._L1087
                        JMP       DCG._L1087
DCG._L1086:
                        .BLOCK    1613
                        .LINE     1614
                        LDS       _ACCA, DCG.modify
                        DEC       _ACCA
                        BRPL      DCG._L1089
                        LDI       _ACCA, 7
DCG._L1089:
                        STS       DCG.modify, _ACCA
                        .ENDBLOCK 1616
DCG._L1087:
                        .ENDBLOCK 1617
DCG._L1078:
DCG._L1079:
                        .LINE     1618
                        LDS       _ACCB, 00276h
                        CLR       _ACCA
                        SBRC      _ACCB, 004h
                        SER       _ACCA
                        COM       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DCG._L1092
                        BRNE      DCG._L1092
                        .BRANCH   20,DCG._L1090
                        JMP       DCG._L1090
DCG._L1092:
                        .BLOCK    1618
                        .LINE     1619
                        LDI       _ACCA, 002h
                        STS       DCG.BUTTONNUMBER, _ACCA
                        .LINE     1620
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DCG.SERPROMPT
                        CALL      DCG.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1622
                        LDS       _ACCA, DCG.modify
                        CPI       _ACCA, 007h
                        LDI       _ACCA, 0h
                        BRNE      DCG._L1093
                        SER       _ACCA
DCG._L1093:
                        TST       _ACCA
                        .BRANCH   4,DCG._L1096
                        BRNE      DCG._L1096
                        .BRANCH   20,DCG._L1094
                        JMP       DCG._L1094
DCG._L1096:
                        .BLOCK    1622
                        .LINE     1623
                        LDI       _ACCA, 000h
                        STS       DCG.MODIFY, _ACCA
                        .ENDBLOCK 1624
                        .BRANCH   20,DCG._L1095
                        JMP       DCG._L1095
DCG._L1094:
                        .BLOCK    1624
                        .LINE     1625
                        LDS       _ACCA, DCG.modify
                        INC       _ACCA
                        CPI       _ACCA, 8
                        BRCS      DCG._L1097
                        CLR       _ACCA
DCG._L1097:
                        STS       DCG.modify, _ACCA
                        .ENDBLOCK 1627
DCG._L1095:
                        .ENDBLOCK 1629
DCG._L1090:
DCG._L1091:
                        .LINE     1630
                        .BRANCH   17,DCG.WERTEONLCD
                        CALL      DCG.WERTEONLCD
                        .LINE     1631
                        LDI       _ACCA, 050h
                        STS       DCG.SUBCH, _ACCA
                        .LINE     1632
                        .BRANCH   17,DCG.PARSEGETPARAM
                        CALL      DCG.PARSEGETPARAM
                        .LINE     1633
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 080h
                        LDI       _ACCAHI, 03Fh
                        STS       DCG.DCAMPMOD, _ACCB
                        STS       DCG.DCAMPMOD+1, _ACCA
                        STS       DCG.DCAMPMOD+2, _ACCALO
                        STS       DCG.DCAMPMOD+3, _ACCAHI
DCG._L1098:
                        .BLOCK    1634
                        .LINE     1635
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DCG.CHECKDELAY
                        CALL      DCG.CHECKDELAY
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1636
                        LDI       _ACCA, 000h
                        .FRAME  0
                        CALL       SYSTEM.LCDPORTINP_M
                        ORI       _ACCA, 0C7h
                        STS       DCG.BUTTONTEMP, _ACCA
                        .ENDBLOCK 1637
                        .LINE     1637
DCG._L1099:
                        LDS       _ACCA, DCG.ButtonTemp
                        CPI       _ACCA, 0FFh
                        LDI       _ACCA, 0h
                        BRNE      DCG._L1101
                        SER       _ACCA
DCG._L1101:
                        TST       _ACCA
                        .BRANCH   4,DCG._L1102
                        BRNE      DCG._L1102
                        .BRANCH   20,DCG._L1098
                        JMP       DCG._L1098
DCG._L1102:
DCG._L1100:
                        .LINE     1638
                        LDI       _ACCA, 000h
                        STS       DCG.BUTTONNUMBER, _ACCA
                        .LINE     1639
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DCG.SERPROMPT
                        CALL      DCG.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 1640
DCG._L1066:
DCG._L1067:
                        .LINE     1641
                        LDI       _ACCA, 000h
                        STS       DCG.TOGGLETIMER, _ACCA
                        .ENDBLOCK 1642
DCG._L1062:
DCG._L1063:
                        .ENDBLOCK 1643
DCG._L1005:
DCG._L1006:
                        .LINE     1644
                        SER       _ACCA
                        LDS       _ACCB, DCG.IncrTimer
                        TST       _ACCB
                        BREQ      DCG._L1103
                        COM       _ACCA
DCG._L1103:
                        PUSH      _ACCA
                        LDS       _ACCA, DCG.LCDpresent
                        POP       _ACCB
                        AND       _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   4,DCG._L1106
                        BRNE      DCG._L1106
                        .BRANCH   20,DCG._L1104
                        JMP       DCG._L1104
DCG._L1106:
                        .BLOCK    1644
                        .LINE     1645
                        LDI       _ACCA, 0C8h
                        STS       DCG.IncrTimer, _ACCA
                        .LINE     1646
                        LDS       _ACCA, DCG.FirstTurn
                        COM       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DCG._L1109
                        BRNE      DCG._L1109
                        .BRANCH   20,DCG._L1107
                        JMP       DCG._L1107
DCG._L1109:
                        .BLOCK    1646
                        .LINE     1647
                        .BRANCH   17,DCG.SENDTRACKCMD
                        CALL      DCG.SENDTRACKCMD
                        .LINE     1648
                        LDS       _ACCA, 003B0h
                        CBR       _ACCA, 080h
                        STS       003B0h, _ACCA
                        .LINE     1649
                        LDI       _ACCA, 000h
                        STS       DCG.BUTTONNUMBER, _ACCA
                        .LINE     1650
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DCG.SERPROMPT
                        CALL      DCG.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 1651
DCG._L1107:
DCG._L1108:
                        .LINE     1652
                        LDI       _ACCA, 0FFh
                        STS       DCG.FIRSTTURN, _ACCA
                        .ENDBLOCK 1653
DCG._L1104:
DCG._L1105:
                        .LINE     1654
                        CLR       _ACCA
                        MOV       _ACCB, _SYSTFLAGS
                        ANDI      _ACCB, 001h
                        BRNE      DCG._L1110
                        COM       _ACCA
DCG._L1110:
                        PUSH      _ACCA
                        LDS       _ACCA, DCG.LCDpresent
                        POP       _ACCB
                        AND       _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   4,DCG._L1113
                        BRNE      DCG._L1113
                        .BRANCH   20,DCG._L1111
                        JMP       DCG._L1111
DCG._L1113:
                        .BLOCK    1654
                        .LINE     1655
                        LDI       _ACCA, 000C8h SHRB 8
                        LDI       _ACCB, 000C8h AND 0FFh
                        LDI       _ACCCLO, DCG.DisplayTimer AND 0FFh
                        LDI       _ACCCHI, DCG.DisplayTimer SHRB 8
                        LDI       _ACCBHI, 001h
                        CALL      SYSTEM.SetSysTimer
                        .LINE     1656
                        LDI       _ACCA, 000h
                        STS       DCG.INCRFINE, _ACCA
                        .LINE     1657
                        LDI       _ACCA, 000h
                        STS       DCG.CHANGEDFLAG, _ACCA
                        .LINE     1658
                        LDS       _ACCA, 003B0h
                        CBR       _ACCA, 080h
                        STS       003B0h, _ACCA
                        .LINE     1659
                        LDS       _ACCA, DCG.ToggleTimer
                        INC       _ACCA
                        STS       DCG.ToggleTimer, _ACCA
                        .LINE     1660
                        LDS       _ACCA, DCG.ToggleTimer
                        CPI       _ACCA, 010h
                        LDI       _ACCA, 0
                        BRLO      DCG._L1114
                        LDI       _ACCA, 0FFh
DCG._L1114:
                        TST       _ACCA
                        .BRANCH   4,DCG._L1117
                        BRNE      DCG._L1117
                        .BRANCH   20,DCG._L1115
                        JMP       DCG._L1115
DCG._L1117:
                        .BLOCK    1660
                        .LINE     1661
                        LDI       _ACCA, 000h
                        STS       DCG.TOGGLETIMER, _ACCA
                        .ENDBLOCK 1662
DCG._L1115:
DCG._L1116:
                        .LINE     1663
                        LDS       _ACCA, DCG.modify
                        CPI       _ACCA, 001h
                        LDI       _ACCA, 0FFh
                        BRLO      DCG._L1118
                        BREQ      DCG._L1118
                        CLR       _ACCA
DCG._L1118:
                        TST       _ACCA
                        .BRANCH   4,DCG._L1121
                        BRNE      DCG._L1121
                        .BRANCH   20,DCG._L1119
                        JMP       DCG._L1119
DCG._L1121:
                        .BLOCK    1663
                        .LINE     1664
                        .BRANCH   17,DCG.ISTSPANNUNGONLCD
                        CALL      DCG.ISTSPANNUNGONLCD
                        .LINE     1665
                        .BRANCH   17,DCG.ISTSTROMONLCD
                        CALL      DCG.ISTSTROMONLCD
                        .LINE     1666
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DCG.SETCURSOR
                        CALL      DCG.SETCURSOR
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 1667
DCG._L1119:
DCG._L1120:
                        .LINE     1669
                        LDS       _ACCA, DCG.modify
                        CPI       _ACCA, 006h
                        LDI       _ACCA, 0
                        BRLO      DCG._L1122
                        LDI       _ACCA, 0FFh
DCG._L1122:
                        TST       _ACCA
                        .BRANCH   4,DCG._L1125
                        BRNE      DCG._L1125
                        .BRANCH   20,DCG._L1123
                        JMP       DCG._L1123
DCG._L1125:
                        .BLOCK    1669
                        .LINE     1670
                        .BRANCH   17,DCG.WERTEONLCD
                        CALL      DCG.WERTEONLCD
                        .ENDBLOCK 1671
DCG._L1123:
DCG._L1124:
                        .ENDBLOCK 1673
DCG._L1111:
DCG._L1112:
                        .ENDBLOCK 1674
                        .LINE     1674
                        .BRANCH   20,DCG._L0999
                        JMP       DCG._L0999
DCG._L1000:
                        .ENDBLOCK 1675

DCG.$_MAINEX:
                        .LINE     1675
                        NOP
                        .LINE     1675
                        .BRANCH   20,DCG.$_MAINEX
                        RJMP      DCG.$_MAINEX


                        .ENDFUNC  1675

SYSTEM.$Main_stk        .EQU    003C9h          ; var iData  Process stack area
SYSTEM.$Main_stk_e      .EQU    00448h          ; var iData  Process stack area
SYSTEM.$Main_reg        .EQU    00449h          ; var iData  Process register area
SYSTEM.$Main_reg_e      .EQU    0045Bh          ; var iData  Process register area
SYSTEM.$Main_Frame      .EQU    0045Ch          ; var iData  Process stack area
SYSTEM.$Main_Frame_e    .EQU    0055Bh          ; var iData  Process stack area

                        ; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                        ; Initialisation and Library Routines
                        ; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

                        .ENTRY
SYSTEM.RESET:
                        CLI
                        ; >> Stack Init [main process only] <<
                        LDI       _ACCA, 004h
                        LDI       _ACCB, 048h
                        OUT       sph, _ACCA
                        OUT       spl, _ACCB


                        ; >> Memory Init <<
                        CLR       _ACCA
                        LDI       _ACCCLO, 16
                        LDI       _ACCCHI, 0
                        LDI       _ACCBLO, 0
                        LDI       _ACCBHI, 0
                        ADIW      _ACCCLO, 1
SYSTEM._L1126:
                        SBIW      _ACCCLO, 001h
                        BREQ      SYSTEM._L1128
SYSTEM._L1127:
                        ST        X+, _ACCA
                        RJMP      SYSTEM._L1126
SYSTEM._L1128:
                        LDI       _ACCBLO, 00060h AND 0FFh
                        LDI       _ACCBHI, 00060h SHRB 8
                        LDI       _ACCCLO, 00800h AND 0FFh
                        LDI       _ACCCHI, 00800h SHRB 8
                        ADIW      _ACCCLO, 1
SYSTEM._L1129:
                        SBIW      _ACCCLO, 001h
                        BREQ      SYSTEM._L1131
SYSTEM._L1130:
                        ST        X+, _ACCA
                        RJMP      SYSTEM._L1129
SYSTEM._L1131:
                        LDI       _FRAMEPTR, 0055Bh AND 0FFh
                        LDI       _FPTRHI, 0055Bh SHRB 8

                        CLI
                        LDI       _ACCA, 0FEH ROLB IntFlag
                        AND       Flags, _ACCA

                        ; ============ init structured constants ============
                        ; >> Hardware Init <<

                        ; >> SysTick init: 1msec <<
                        ; >> real SysTick (exact): 1.000 msec <<
                        LDI       _ACCA, 006h
                        STS       SysTickTime, _ACCA
                        OUT       tcnt0, _ACCA
                        LDI       _ACCA, 3
                        OUT       tccr0, _ACCA
                        LDI       _ACCA, 001h
                        OUT       timsk, _ACCA

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
                        LDI       _ACCA, 00Bh
                        STS       TCCR2, _ACCA
                        LDI       _ACCA, 07Dh
                        STS       OCR2, _ACCA

                        ; >> TickTimer Init <<
                        LDI       _ACCA, 0
                        STS       TCCR1A, _ACCA
                        LDI       _ACCA, 08h
                        STS       TCCR1B, _ACCA
                        STS       TickTimerPrsc, _ACCA
                        LDI       _ACCA, 0
                        LDI       _ACCB, 0FFh
                        STS       OCR1AH, _ACCA
                        STS       OCR1AL, _ACCB
                        STS       _TTimerReloadVal+1, _ACCA
                        STS       _TTimerReloadVal, _ACCB

                        ; >> TWIPORT Init <<
                        LDI       _ACCA, 00Ch
                        OUT       TWBR, _ACCA
                        LDI       _ACCA, 0FFh
                        STS       TWI_DevLock, _ACCA

                        CLR       Flags
                        CLR       Flags2

                        ; ============ Start User Main Program ============

                        .DEB      MAINENTRY
                        JMP       DCG.$_Main

                        ; ============ Interrupt Service ============

SYSTEM.$INTERRUPT_TIMER0:
                        .DEB      SYSTICKENTRY
                        CALL      SYSTEM.SaveAllRegs
                        LDS       _ACCA, SysTickTime
                        IN        _ACCB, tcnt0
                        ADD       _ACCA, _ACCB
                        OUT       tcnt0, _ACCA
                        LDI       _ACCA, 0FEH ROLB IntFlag
                        AND       Flags, _ACCA
                        CALL      DCG.onSysTick
                        LDS       _ACCB, _TWI_TO
                        TST       _ACCB
                        BREQ      SYSTEM._L1132
                        DEC       _ACCB
                        STS       _TWI_TO, _ACCB
SYSTEM._L1132:
                        LDS       _ACCA, _RXTIMEOUT
                        TST       _ACCA
                        BREQ      SYSTEM._L1133
                        DEC       _ACCA
                        STS       _RXTIMEOUT, _ACCA
SYSTEM._L1133:
                        LDS       _ACCCLO, DCG.DisplayTimer
                        LDS       _ACCCHI, DCG.DisplayTimer+1
                        TST       _ACCCHI
                        BRNE      SYSTEM._L1134
                        TST       _ACCCLO
                        BREQ      SYSTEM._L1135
SYSTEM._L1134:
                        SBIW      _ACCCLO, 1
                        STS       DCG.DisplayTimer, _ACCCLO
                        STS       DCG.DisplayTimer+1, _ACCCHI
                        RJMP      SYSTEM._L1136
SYSTEM._L1135:
                        MOV       _ACCA, _SYSTFLAGS
                        ANDI      _ACCA, 0FEh
                        MOV       _SYSTFLAGS, _ACCA
SYSTEM._L1136:
                        LDS       _ACCCLO, DCG.RelaisTimer
                        LDS       _ACCCHI, DCG.RelaisTimer+1
                        TST       _ACCCHI
                        BRNE      SYSTEM._L1137
                        TST       _ACCCLO
                        BREQ      SYSTEM._L1138
SYSTEM._L1137:
                        SBIW      _ACCCLO, 1
                        STS       DCG.RelaisTimer, _ACCCLO
                        STS       DCG.RelaisTimer+1, _ACCCHI
                        RJMP      SYSTEM._L1139
SYSTEM._L1138:
                        MOV       _ACCA, _SYSTFLAGS
                        ANDI      _ACCA, 0FDh
                        MOV       _SYSTFLAGS, _ACCA
SYSTEM._L1139:
                        LDS       _ACCA, DCG.ActivityTimer
                        TST       _ACCA
                        BREQ      SYSTEM._L1140
                        SUBI      _ACCA, 1
                        STS       DCG.ActivityTimer, _ACCA
SYSTEM._L1140:
                        LDS       _ACCA, DCG.IncrTimer
                        TST       _ACCA
                        BREQ      SYSTEM._L1141
                        SUBI      _ACCA, 1
                        STS       DCG.IncrTimer, _ACCA
SYSTEM._L1141:
                        LDS       _ACCA, DCG.IntegrateTimer
                        TST       _ACCA
                        BREQ      SYSTEM._L1142
                        SUBI      _ACCA, 1
                        STS       DCG.IntegrateTimer, _ACCA
SYSTEM._L1142:
                        LDI       _ACCA, 1 SHLB IntFlag
                        OR        Flags, _ACCA
                        CALL      SYSTEM.RestoreAllRegs
                        POP       $_SaveRet
                        OUT       SREG, $_SaveRet
                        .DEB      SYSTICKEXIT
                        RETI

SYSTEM.$INTERRUPT_TIMER2COMP:
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        PUSH      _ACCB
                        PUSH      _ACCA
                        IN        _ACCA, SREG
                        PUSH      _ACCA
                        RJMP      SYSTEM._L1148

SYSTEM._L1143:
                        MOV       _ACCB, _ACCA
                        LSR       _ACCA
                        LSR       _ACCA
                        ANDI      _ACCB, 3
                        BREQ      SYSTEM._L1144
                        CPI       _ACCB, 3
                        BRNE      SYSTEM._L1145
SYSTEM._L1144:
                        ADIW      _ACCCLO, 4
                        RET
SYSTEM._L1145:
                        LDD       _ACCALO, Z+0
                        LDD       _ACCAHI, Z+1
                        LDD       _ACCDLO, Z+2
                        LDD       _ACCDHI, Z+3
                        CPI       _ACCB, 1
                        BREQ      SYSTEM._L1146
                        SUBI      _ACCALO, 0FFh
                        SBCI      _ACCAHI, 0FFh
                        SBCI      _ACCDLO, 0FFh
                        SBCI      _ACCDHI, 0FFh
                        RJMP      SYSTEM._L1147
SYSTEM._L1146:
                        SUBI      _ACCALO, 1
                        SBCI      _ACCAHI, 0
                        SBCI      _ACCDLO, 0
                        SBCI      _ACCDHI, 0
SYSTEM._L1147:
                        ST        Z+, _ACCALO
                        ST        Z+, _ACCAHI
                        ST        Z+, _ACCDLO
                        ST        Z+, _ACCDHI
                        RET

SYSTEM._L1148:
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
                        BREQ      SYSTEM._L1149
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
                        RCALL     SYSTEM._L1143
SYSTEM._L1149:
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
                        BRNE      SYSTEM._L1150
SYSTEM._L1154:
                        CBI       ucr1, 5
                        RJMP      SYSTEM._L1152
SYSTEM._L1150:
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
                        BRNE      SYSTEM._L1153
                        CBI       ucr1, 5
SYSTEM._L1153:
                        INC       _ACCB
                        CPI       _ACCB, 255
                        BRNE      SYSTEM._L1151
                        CLR       _ACCB
SYSTEM._L1151:
                        STS       _TXOUTP, _ACCB
SYSTEM._L1152:
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
SYSTEM._L1160:
                        LDS       _ACCA, _RXCOUNT
                        CPI       _ACCA, 255
                        BRNE      SYSTEM._L1155
                        IN        _ACCB, UDR1
                        RJMP      SYSTEM._L1157
SYSTEM._L1155:
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
                        BRNE      SYSTEM._L1156
                        CLR       _ACCB
SYSTEM._L1156:
                        STS       _RXINP, _ACCB
                        SBIC      usr1, 7
                        RJMP      SYSTEM._L1160
SYSTEM._L1157:
SYSTEM._L1162:
                        POP       _ACCA
                        OUT       SREG, _ACCA
                        POP       _ACCA
                        POP       _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        RETI

SYSTEM.$INTERRUPT_TIMER1COMPA:
                        CALL      SYSTEM.SaveAllRegs
                        CALL      DCG.onTickTimer
                        CALL      SYSTEM.RestoreAllRegs
                        POP       $_SaveRet
                        OUT       SREG, $_SaveRet
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
                        BREQ       SYSTEM._L1163
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
                        RJMP      SYSTEM._L1164
SYSTEM._L1163:
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
SYSTEM._L1164:
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
                        BREQ       SYSTEM._L1165
                        LDS       _ACCDLO, _LCDM_PORT
                        ORI       _ACCDLO, 20h
                        LDI       _ACCBLO, 00000h AND 0FFh
                        LDI       _ACCBHI, 00000h SHRB 8
                        LDI       _ACCAHI, 000h
                        LDI       _ACCDHI, 000h
                        CALL      SYSTEM.TWIout
SYSTEM._L1165:
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
SYSTEM._L1166:
                        RCALL     SYSTEM._LCDM_Busy_Rd
                        TST       _ACCA
                        BRPL       SYSTEM._L1167
                        SBIW      _ACCCLO, 1
                        BRNE      SYSTEM._L1166
                        CLR       _ACCB
                        CLR       _ACCA
                        RET
SYSTEM._L1167:
                        MOV       _ACCB, _ACCA
                        SER       _ACCA
                        RET

SYSTEM._LCDM_Ctrl_Wr:
                        PUSH      _ACCA
                        RCALL     SYSTEM._LCDWAIT_M
                        TST       _ACCA
                        BRNE      SYSTEM._L1168
                        POP       _ACCB
                        RET
SYSTEM._L1168:
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
                        BRNE       SYSTEM._L1169
                        RET
SYSTEM._L1169:
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
                        RJMP      SYSTEM._L1170
SYSTEM.LCDCURSOR_M:
                        LDD       _ACCA, Y+002h
                        STS       _LCDM_PORT, _ACCA
                        LDD       _ACCA, Y+000h
                        LDD       _ACCB, Y+001h
SYSTEM._L1170:
                        TST       _ACCA
                        BRNE       SYSTEM._L1171
                        LDI       _ACCA, 0Ch
                        RJMP      SYSTEM._L1172

SYSTEM._L1171:
                        LDI       _ACCA, 0Dh
SYSTEM._L1172:
                        TST       _ACCB
                        BREQ       SYSTEM._L1173
                        ORI       _ACCA, 2
SYSTEM._L1173:
                        RJMP      SYSTEM._LCDM_Ctrl_Wr

SYSTEM.LCDXY_M:
                        LDD       _ACCA, Y+002h
                        STS       _LCDM_PORT, _ACCA
                        LDD       _ACCA, Y+000h
                        LDD       _ACCB, Y+001h
                        CPI       _ACCA, 0
                        BRNE       SYSTEM._L1174
                        LDI       _ACCA, 080h
                        RJMP      SYSTEM._L1178

SYSTEM._L1174:
                        CPI       _ACCA, 1
                        BRNE       SYSTEM._L1175
                        LDI       _ACCA, 0C0h
                        RJMP      SYSTEM._L1178

SYSTEM._L1175:
                        CPI       _ACCA, 2
                        BRNE       SYSTEM._L1176
                        LDI       _ACCA, 088h
                        RJMP      SYSTEM._L1178

SYSTEM._L1176:
                        CPI       _ACCA, 3
                        BRNE       SYSTEM._L1177
                        LDI       _ACCA, 0C8h
                        RJMP      SYSTEM._L1178

SYSTEM._L1177:
                        LDI       _ACCA, 080h
SYSTEM._L1178:
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
SYSTEM._L1179:
                        PUSH      _ACCB
                        LDI       _ACCA, 20h
                        RCALL     SYSTEM._LCDM_Data_Wr
                        POP       _ACCB
                        DEC       _ACCB
                        BRNE       SYSTEM._L1179
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
                        BRNE      SYSTEM._L1191
                        LDI       _ACCA, 090h
                        OUT       TWCR, _ACCA
SYSTEM._L1191:
                        LDI       _ACCA, 0A4h
                        OUT       TWCR, _ACCA
                        LDI       _ACCA, 100
                        STS       _TWI_TO, _ACCA
SYSTEM._L1189:
                        IN        _ACCA, TWCR
                        ANDI      _ACCA, 080h
                        BRNE      SYSTEM._L1192
                        LDS       _ACCA, _TWI_TO
                        TST       _ACCA
                        BRNE      SYSTEM._L1189
                        OUT       TWCR, _ACCA
                        RJMP      SYSTEM.TWI_ERROR
SYSTEM._L1192:
                        IN        _ACCA, TWSR
                        ANDI      _ACCA, 0FCh
                        CPI       _ACCA, 008h
                        BRNE      SYSTEM._L1196
                        RJMP      SYSTEM.TWI_ERROR
SYSTEM._L1196:
                        RJMP      SYSTEM.TWI_OK

SYSTEM.TWISTOPB:
SYSTEM._L1197:
                        IN        _ACCA, TWSR
                        ANDI      _ACCA, 0FCh
                        CPI       _ACCA, 0F8h
                        BREQ      SYSTEM._L1197
                        CPI       _ACCA, 000h
                        BRNE      SYSTEM._L1198
                        LDI       _ACCA, 090h
                        OUT       TWCR, _ACCA
                        NOP
SYSTEM._L1198:
                        LDI       _ACCB, 094h
                        OUT       TWCR, _ACCB
                        SER       _ACCA
                        STS       TWI_DevLock, _ACCA
                        RET

SYSTEM.TWISENDBYTE:
                        OUT       TWDR, _ACCDLO
                        LDI       _ACCA, 084h
                        OUT       TWCR, _ACCA
                        LDI       _ACCA, 100
                        STS       _TWI_TO, _ACCA
SYSTEM._L1200:
                        IN        _ACCA, TWCR
                        ANDI      _ACCA, 080h
                        BRNE      SYSTEM._L1201
                        LDS       _ACCA, _TWI_TO
                        TST       _ACCA
                        BRNE      SYSTEM._L1200
                        RJMP      SYSTEM.TWI_ERROR
SYSTEM._L1201:
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
                        BRNE      SYSTEM._L1202
                        LDI       _ACCA, 084h
SYSTEM._L1202:
                        OUT       TWCR, _ACCA
SYSTEM._L1203:
                        IN        _ACCA, TWCR
                        SBRS      _ACCA, 7
                        RJMP      SYSTEM._L1203
                        IN        _ACCA, TWSR
                        ANDI      _ACCA, 0FCh
                        CPI       _ACCA, 058h
                        BREQ      SYSTEM._L1205
                        CPI       _ACCA, 050h
                        BRNE      SYSTEM.TWI_ERROR
SYSTEM._L1205:
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
                        BRNE      SYSTEM._L1204
                        LDI       _ACCA, 090h
                        OUT       TWCR, _ACCA
SYSTEM._L1204:
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
                        BREQ      SYSTEM._L1207
                        RCALL     SYSTEM.TWIRECVBYTE
                        TST       _ACCA
                        BREQ      SYSTEM._L1207
                        RJMP      SYSTEM.TWI_OK
SYSTEM._L1207:
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
                        BREQ      SYSTEM._L1213
SYSTEM._L1208:
                        MOV       _ACCDLO, _ACCAHI
                        RCALL     SYSTEM.TWISENDBYTE
                        TST       _ACCA
                        BREQ      SYSTEM._L1213
                        BST       Flags, _I2C2BYTE
                        BRTC      SYSTEM._L1212
                        MOV       _ACCDLO, _ACCALO
SYSTEM._L1210:
                        RCALL     SYSTEM.TWISENDBYTE
                        TST       _ACCA
                        BREQ      SYSTEM._L1213
SYSTEM._L1212:
                        TST       _ACCBLO
                        BRNE       SYSTEM._L1217
                        TST       _ACCBHI
                        BREQ       SYSTEM._L1211
SYSTEM._L1217:
                        TST       _ACCDHI
                        BRNE      SYSTEM._L1214
                        LD        _ACCDLO, Z+
                        RJMP      SYSTEM._L1216
SYSTEM._L1214:
                        CPI       _ACCDHI, 1
                        BRNE      SYSTEM._L1215
                        LPM       _ACCDLO, Z+
                        RJMP      SYSTEM._L1216
SYSTEM._L1215:
                        CALL      SYSTEM.ReadEEp8D
                        ADIW      _ACCCLO, 01h
SYSTEM._L1216:
                        SBIW      _ACCBLO, 1
                        RJMP      SYSTEM._L1210
SYSTEM._L1211:
                        RCALL     SYSTEM.TWISTOPB
                        RJMP      SYSTEM.TWI_OK
SYSTEM._L1213:
                        RCALL     SYSTEM.TWI_ERROR
                        SER       _ACCB
                        STS       TWI_DevLock, _ACCB
                        CLR       _ACCA
                        RET

SYSTEM.TickTimerCalc:
                        CLT
                        BLD       Flags, _SIGN
                        LDI       _ACCB, 000000040h AND 0FFh
                        LDI       _ACCA, 000000040h SHRB 8
                        LDI       _ACCALO, 000000040h SHRB 16
                        LDI       _ACCAHI, 000000040h SHRB 24
                        LDD       _ACCEHI, Y+003h
                        LDD       _ACCELO, Y+002h
                        LDD       _ACCDHI, Y+001h
                        LDD       _ACCDLO, Y+000h
                        CALL      SYSTEM.MUL32_R
                        LSR       _ACCAHI
                        ROR       _ACCALO
                        ROR       _ACCA
                        ROR       _ACCB
                        LSR       _ACCAHI
                        ROR       _ACCALO
                        ROR       _ACCA
                        ROR       _ACCB
                        LDI       _ACCDLO, 1
                        RJMP      SYSTEM._L1219

SYSTEM._L1218:
                        INC       _ACCDLO
                        LSR       _ACCAHI
                        ROR       _ACCALO
                        ROR       _ACCA
                        ROR       _ACCB
                        LSR       _ACCAHI
                        ROR       _ACCALO
                        ROR       _ACCA
                        ROR       _ACCB
                        CPI       _ACCDLO, 4
                        BRCC      SYSTEM._L1219
                        LSR       _ACCAHI
                        ROR       _ACCALO
                        ROR       _ACCA
                        ROR       _ACCB
SYSTEM._L1219:
                        TST       _ACCALO
                        BRNE      SYSTEM._L1218
                        TST       _ACCAHI
                        BRNE      SYSTEM._L1218
                        MOV       _ACCDHI, _ACCA
                        CPI       _ACCDLO, 6
                        BRCC     SYSTEM._L1220
                        LDI       _ACCA, 0FFh
                        RET
SYSTEM._L1220:
                        LDI       _ACCA, 0
                        RET
SYSTEM.TickTimerTime:
                        RCALL     SYSTEM.TickTimerStop
                        RCALL     SYSTEM.TickTimerCalc
                        TST       _ACCA
                        BRNE      SYSTEM._L1221
                        RET
SYSTEM._L1221:
                        MOV       _ACCA, _ACCDHI
SYSTEM.TimerSet:
                        CLI
                        STS       OCR1AH, _ACCA
                        STS       OCR1AL, _ACCB
                        LDS       _ACCA, TickTimerPrsc
                        CBR       _ACCA, 07h
                        OR        _ACCA, _ACCDLO
                        STS       TCCR1B, _ACCA
                        STS       TickTimerPrsc, _ACCA
                        SBRC      Flags, IntFlag
                        SEI
                        LDI       _ACCA, 0FFh
                        RET

SYSTEM.TickTimerStart:
                        LDI       _ACCALO, 0
                        CLI
                        STS       TCNT1H, _ACCALO
                        STS       TCNT1L, _ACCALO
                        LDS       _ACCA, TIFR
                        SBR       _ACCA, 010h
                        STS       TIFR, _ACCA
                        LDS       _ACCA, TIMSK;
                        SBR       _ACCA, 010h
                        STS       TIMSK, _ACCA;
                        LDS       _ACCA, TickTimerPrsc
                        STS       TCCR1B, _ACCA;
                        SBRC      Flags, IntFlag
                        SEI
                        RET

SYSTEM.TickTimerStop:
                        LDI       _ACCA, 0;
                        STS       TCCR1B, _ACCA;
                        RET

SYSTEM.SERINP_TO:
                        LDD       _ACCA, Y+000h
                        STS       _RXTIMEOUT, _ACCA
SYSTEM._L1222:
                        RCALL     SYSTEM.SERSTAT
                        TST       _ACCA
                        BRNE      SYSTEM._L1223
                        LDS       _ACCA, _RXTIMEOUT
                        TST       _ACCA
                        BRNE      SYSTEM._L1222
                        RET
SYSTEM._L1223:
                        RCALL     SYSTEM.SERINP
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        ST        Z+, _ACCA
                        STD       Y+002h, _ACCCHI
                        STD       Y+001h, _ACCCLO
                        SER       _ACCA
                        RET

SYSTEM.SERINP:
SYSTEM._L1224:
                        LDS       _ACCA, _RXCOUNT
                        TST       _ACCA
                        BREQ      SYSTEM._L1224
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
                        BRNE      SYSTEM._L1225
                        CLR       _ACCB
SYSTEM._L1225:
                        STS       _RXOUTP, _ACCB
                        RET

SYSTEM.SERSTAT:
                        CLR       _ACCA
                        LDS       _ACCB, _RXCOUNT
                        TST       _ACCB
                        BREQ      SYSTEM._L1230
                        COM       _ACCA
SYSTEM._L1230:
                        RET

SYSTEM.SEROUT:
SYSTEM._L1234:
                        LDS       _ACCB, _TXCOUNT
                        CPI       _ACCB, 255
                        BREQ      SYSTEM._L1234
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
                        BRNE      SYSTEM._L1235
                        CLR       _ACCB
SYSTEM._L1235:
                        STS       _TXINP, _ACCB
                        SBI       ucr1, 5
                        SBRC      Flags, IntFlag
                        SEI
                        RET

SYSTEM.IncrCount4start:
                        CLI
                        IN        _ACCA, TIMSK
                        ORI       _ACCA, 080h
                        OUT       TIMSK, _ACCA
                        SBRC      Flags, IntFlag
                        SEI
                        RET

SYSTEM.GetIncrVal4:
                        LDI       _ACCCLO, _INCRCOUNT4_0 AND 0FFh
                        LDI       _ACCCHI, _INCRCOUNT4_0 SHRB 8
                        CPI       _ACCA, 1
                        BRCS      SYSTEM._L1239
                        LDI       _ACCB, 0
                        LDI       _ACCA, 0
                        LDI       _ACCALO, 0
                        LDI       _ACCAHI, 0
                        RET
SYSTEM._L1239:
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
                        BRCS      SYSTEM._L1240
                        RET
SYSTEM._L1240:
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

SYSTEM.SaveAllRegs:
                        POP       $_SaveRet1
                        POP       $_SaveRet
                        STS       SYSTEM.$Main_reg, _ACCA
                        STS       SYSTEM.$Main_reg+1, _ACCB
                        IN        _ACCA, SREG
                        PUSH      _ACCA
                        STS       SYSTEM.$Main_reg+2, _ACCAHI
                        STS       SYSTEM.$Main_reg+3, _ACCALO
                        STS       SYSTEM.$Main_reg+4, _ACCBHI
                        STS       SYSTEM.$Main_reg+5, _ACCBLO
                        STS       SYSTEM.$Main_reg+6, _ACCCHI
                        STS       SYSTEM.$Main_reg+7, _ACCCLO
                        STS       SYSTEM.$Main_reg+8, _ACCDHI
                        STS       SYSTEM.$Main_reg+9, _ACCDLO
                        STS       SYSTEM.$Main_reg+10, _ACCEHI
                        STS       SYSTEM.$Main_reg+11, _ACCELO
                        STS       SYSTEM.$Main_reg+12, Flags
                        STS       SYSTEM.$Main_reg+13, _ACCGLO
                        STS       SYSTEM.$Main_reg+14, _ACCFHI
                        STS       SYSTEM.$Main_reg+15, _ACCFLO
                        STS       SYSTEM.$Main_reg+16, _ACCGHI
                        STS       SYSTEM.$Main_reg+17, _ACCHHI
                        STS       SYSTEM.$Main_reg+18, _ACCHLO
                        CLT
                        BLD       Flags, IntFlag
                        MOVW      _ACCCLO, $_SaveRet
                        IJMP

SYSTEM.RestoreAllRegs:
                        LDS       _ACCA, SYSTEM.$Main_reg
                        LDS       _ACCB, SYSTEM.$Main_reg+1
                        LDS       _ACCAHI, SYSTEM.$Main_reg+2
                        LDS       _ACCALO, SYSTEM.$Main_reg+3
                        LDS       _ACCBHI, SYSTEM.$Main_reg+4
                        LDS       _ACCBLO, SYSTEM.$Main_reg+5
                        LDS       _ACCCHI, SYSTEM.$Main_reg+6
                        LDS       _ACCCLO, SYSTEM.$Main_reg+7
                        LDS       _ACCDHI, SYSTEM.$Main_reg+8
                        LDS       _ACCDLO, SYSTEM.$Main_reg+9
                        LDS       _ACCEHI, SYSTEM.$Main_reg+10
                        LDS       _ACCELO, SYSTEM.$Main_reg+11
                        LDS       Flags, SYSTEM.$Main_reg+12
                        LDS       _ACCGLO, SYSTEM.$Main_reg+13
                        LDS       _ACCFHI, SYSTEM.$Main_reg+14
                        LDS       _ACCFLO, SYSTEM.$Main_reg+15
                        LDS       _ACCGHI, SYSTEM.$Main_reg+16
                        LDS       _ACCHHI, SYSTEM.$Main_reg+17
                        LDS       _ACCHLO, SYSTEM.$Main_reg+18
                        SET
                        BLD       Flags, IntFlag
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

SYSTEM._DEClim16S:
                        CLR       _ACCA
                        LD        _ACCBLO, Z
                        LDD       _ACCBHI, Z+1
                        SUB       _ACCBLO, _ACCALO
                        SBC       _ACCBHI, _ACCAHI
                        BRVS      SYSTEM._L1243
                        LDI       _ACCB, 080h
                        EOR       _ACCBHI, _ACCB
                        EOR       _ACCEHI, _ACCB
                        CP        _ACCELO, _ACCBLO
                        CPC       _ACCEHI, _ACCBHI
                        EOR       _ACCBHI, _ACCB
                        EOR       _ACCEHI, _ACCB
                        BRCC      SYSTEM._L1243
                        SER       _ACCA
                        RJMP      SYSTEM._L1244
SYSTEM._L1243:
                        MOV       _ACCBLO, _ACCELO
                        MOV       _ACCBHI, _ACCEHI
SYSTEM._L1244:
                        ST        Z, _ACCBLO
                        STD       Z+1, _ACCBHI
                        RET

SYSTEM.BlockCopyC:
SYSTEM._L1245:
                        SUBI      _ACCALO, 001h
                        SBCI      _ACCAHI, 000h
                        BRCS      SYSTEM._L1246
                        LD        _ACCA, Z+
                        ST        X+, _ACCA
                        RJMP      SYSTEM._L1245
SYSTEM._L1246:
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
                        BREQ      SYSTEM._L1247
                        OUT       eedr, _ACCA
                        SBI       eecr, 2
                        SBI       eecr, 1
SYSTEM._L1247:
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
                        BREQ      SYSTEM._L1248
SYSTEM._L1248:
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
                        BREQ      SYSTEM._L1249
                        LSR       _ACCFLO
                        BRNE      SYSTEM._L1251
                        PUSH      _ACCA
                        CALL      SYSTEM.ReadEEp8
                        MOV       _ACCAHI, _ACCA
                        POP       _ACCA
                        ADIW      _ACCCLO, 01h
                        RJMP      SYSTEM._L1250
SYSTEM._L1251:
                        LPM       _ACCAHI, Z+
                        RJMP      SYSTEM._L1250
SYSTEM._L1249:
                        LD        _ACCAHI, Z+
SYSTEM._L1250:
                        TST       _ACCAHI
                        BREQ      SYSTEM._L1258
                        MOV       _ACCFLO, _ACCFHI
                        ANDI      _ACCFLO, 10h
                        BREQ      SYSTEM._L1253
SYSTEM._L1253:
                        LD        _ACCALO, X
SYSTEM._L1255:
                        CP        _ACCB, _ACCA
                        BRCC      SYSTEM._L1257
SYSTEM._L1258:
                        RET
SYSTEM._L1257:
                        MOV       _ACCDLO, _ACCB
                        SUB       _ACCDLO, _ACCA
                        MOV       _ACCDHI, _ACCDLO
                        SUB       _ACCDLO, _ACCAHI
                        BRCS      SYSTEM._L1263
                        CP        _ACCALO, _ACCA
                        BRCC      SYSTEM._L1260
                        MOV       _ACCELO, _ACCAHI
                        ADD       _ACCELO, _ACCALO
                        CP        _ACCB, _ACCELO
                        BRCS      SYSTEM._L1259
                        MOV       _ACCB, _ACCELO
SYSTEM._L1259:
                        RJMP      SYSTEM._L1263
SYSTEM._L1260:
                        PUSH      _ACCBLO
                        PUSH      _ACCBHI
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        MOV       _ACCDHI, _ACCALO
                        SUB       _ACCDHI, _ACCA
                        CP        _ACCDHI, _ACCDLO
                        BRCC      SYSTEM._L1261
                        MOV       _ACCDLO, _ACCDHI
SYSTEM._L1261:
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
                        BREQ      SYSTEM._L1262
SYSTEM._L1262:
                        LD        _ACCGLO, -X
                        ST        -Z, _ACCGLO
                        DEC       _ACCDHI
                        BRNE     SYSTEM._L1262
SYSTEM._L1256:
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        MOV       _ACCB, _ACCA
                        ADD       _ACCB, _ACCAHI
                        ADD       _ACCB, _ACCDLO
                        BRNE     SYSTEM._L1267
SYSTEM._L1263:
                        ADD       _ACCAHI, _ACCDLO
                        INC       _ACCAHI
SYSTEM._L1267:
                        MOV       _ACCFLO, _ACCFHI
                        ANDI      _ACCFLO, 10h
                        BREQ      SYSTEM._L1270
SYSTEM._L1270:
                        ST        X, _ACCB
SYSTEM._L1269:
                        CLR       _ACCALO
                        ADD       _ACCBLO, _ACCA
                        ADC       _ACCBHI, _ACCALO
SYSTEM._L1268:
                        MOV       _ACCFLO, _ACCFHI
                        ANDI      _ACCFLO, 3
                        TST       _ACCFLO
                        BREQ      SYSTEM._L1271
                        LSR       _ACCFLO
                        BRNE      SYSTEM._L1273
                        CALL      SYSTEM.ReadEEp8
                        MOV       _ACCGLO, _ACCA
                        ADIW      _ACCCLO, 01h
                        RJMP      SYSTEM._L1272
SYSTEM._L1273:
                        LPM       _ACCGLO, Z+
                        RJMP      SYSTEM._L1272
SYSTEM._L1271:
                        LD        _ACCGLO, Z+
SYSTEM._L1272:
                        MOV       _ACCFLO, _ACCFHI
                        ANDI      _ACCFLO, 10h
                        BREQ      SYSTEM._L1274
SYSTEM._L1274:
                        ST        X+, _ACCGLO
SYSTEM._L1275:
                        DEC       _ACCAHI
                        BRNE     SYSTEM._L1268
SYSTEM._L1266:
                        RET

SYSTEM.Str2Int:
                        CLR       _ACCAHI
                        CLR       _ACCALO
                        CLR       _ACCBHI
                        CLR       _ACCBLO
                        BST       Flags, _EEPROM
                        BRTC      SYSTEM._L1280
                        CALL      SYSTEM.ReadEEp8
                        ADIW      _ACCCLO, 01h
                        RJMP     SYSTEM._L1281
SYSTEM._L1280:
                        LD        _ACCA, Z+
SYSTEM._L1281:
                        TST       _ACCA
                        BRNE      SYSTEM._L1277
SYSTEM._L1276:
                        CLR       _ACCA
                        CLR       _ACCB
                        RET

SYSTEM._L1277:
                        MOV       _ACCDHI, _ACCA
                        TST       _ACCB
                        BREQ      SYSTEM._L1282
                        INC       _ACCDHI
                        RJMP      SYSTEM.Hex2Int
SYSTEM._L1282:
                        BST       Flags, _EEPROM
                        BRTC      SYSTEM._L1283
                        CALL      SYSTEM.ReadEEp8
                        ADIW      _ACCCLO, 01h
                        RJMP     SYSTEM._L1284
SYSTEM._L1283:
                        LD        _ACCA, Z+
SYSTEM._L1284:
                        CLT
                        BLD       Flags, _NEGATIVE
                        CPI       _ACCA, 02Dh
                        BRNE      SYSTEM._L1278
                        DEC       _ACCDHI
                        BREQ      SYSTEM._L1276
                        SET
                        BLD       Flags, _NEGATIVE
                        BST       Flags, _EEPROM
                        BRTC      SYSTEM._L1285
                        CALL      SYSTEM.ReadEEp8
                        ADIW      _ACCCLO, 01h
                        RJMP     SYSTEM._L1286
SYSTEM._L1285:
                        LD        _ACCA, Z+
SYSTEM._L1286:
                        RJMP      SYSTEM.Dec2Int
SYSTEM._L1278:
                        CPI       _ACCA, 02Bh
                        BRNE      SYSTEM._L1279
                        DEC       _ACCDHI
                        BREQ      SYSTEM._L1276
                        CLT
                        BLD       Flags, _NEGATIVE
                        BST       Flags, _EEPROM
                        BRTC      SYSTEM._L1287
                        CALL      SYSTEM.ReadEEp8
                        ADIW      _ACCCLO, 01h
                        RJMP     SYSTEM._L1288
SYSTEM._L1287:
                        LD        _ACCA, Z+
SYSTEM._L1288:
                        RJMP      SYSTEM.Dec2Int
SYSTEM._L1279:
                        CPI       _ACCA, 024h
                        BRNE      SYSTEM.Dec2Int
                        RJMP      SYSTEM.Hex2Int
SYSTEM.Dec2Int:
                        MOV       _ACCB, _ACCDHI
                        DEC       _ACCB
                        BRMI      SYSTEM._L1276
                        CLR       _ACCDHI
                        CLR       _ACCEHI
                        CLR       _ACCFHI
                        CLR       _ACCFLO
                        PUSH      _ACCB
                        RJMP      SYSTEM.Dec2Int1
SYSTEM._L1289:
                        PUSH      _ACCB
                        BST       Flags, _EEPROM
                        BRTC      SYSTEM._L1292
                        CALL      SYSTEM.ReadEEp8
                        ADIW      _ACCCLO, 01h
                        RJMP     SYSTEM._L1293
SYSTEM._L1292:
                        LD        _ACCA, Z+
SYSTEM._L1293:
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
                        RJMP      SYSTEM._L1289
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
                        BRTC      SYSTEM._L1294
                        SUBI      _ACCB, 01h
                        SBCI      _ACCA, 00h
                        SBCI      _ACCALO, 00h
                        SBCI      _ACCAHI, 00h
                        COM       _ACCALO
                        COM       _ACCAHI
                        COM       _ACCA
                        COM       _ACCB
SYSTEM._L1294:
                        RET

SYSTEM.Hex2Int:
                        CLT
                        BLD       Flags, _NEGATIVE
                        DEC       _ACCDHI
                        BREQ      SYSTEM._L1294
                        CPI       _ACCDHI, 009h
                        BRSH      SYSTEM.Str2Ierr
SYSTEM._L1295:
                        BST       Flags, _EEPROM
                        BRTC      SYSTEM._L1299
                        CALL      SYSTEM.ReadEEp8
                        ADIW      _ACCCLO, 01h
                        RJMP     SYSTEM._L1300
SYSTEM._L1299:
                        LD        _ACCA, Z+
SYSTEM._L1300:
                        CPI       _ACCA, 061h
                        BRLO      SYSTEM._L1296
                        SUBI      _ACCA, 020h
SYSTEM._L1296:
                        CPI       _ACCA, 030h
                        BRLO      SYSTEM.Str2Ierr
                        CPI       _ACCA, 03Ah
                        BRLO      SYSTEM._L1297
                        CPI       _ACCA, 041h
                        BRLO      SYSTEM.Str2Ierr
                        CPI       _ACCA, 047h
                        BRSH      SYSTEM.Str2Ierr
                        SUBI      _ACCA, -9 AND 0FFh
SYSTEM._L1297:
                        ANDI      _ACCA, 00Fh
                        LDI       _ACCB, 4
SYSTEM._L1298:
                        LSL       _ACCBLO
                        ROL       _ACCBHI
                        ROL       _ACCALO
                        ROL       _ACCAHI
                        DEC       _ACCB
                        BRNE      SYSTEM._L1298
                        OR        _ACCBLO, _ACCA
                        DEC       _ACCDHI
                        BRNE      SYSTEM._L1295
                        RJMP      SYSTEM.Str2Iex
SYSTEM.PosChInVarStr:
                        CLR       _ACCA
                        LD        _ACCBHI, Z
                        TST       _ACCBHI
                        BREQ      SYSTEM._L1302
                        TST       _ACCELO
                        BRNE      SYSTEM._L1301
                        INC       _ACCELO
SYSTEM._L1301:
                        CP        _ACCBHI, _ACCELO
                        BRCS      SYSTEM._L1302
                        ADD       _ACCCLO, _ACCELO
                        ADC       _ACCCHI, _ACCA
                        DEC       _ACCELO
                        SUB       _ACCBHI, _ACCELO
                        MOV       _ACCA, _ACCELO
SYSTEM._L1303:
                        INC       _ACCA
                        LD        _ACCBLO, Z+
                        CP        _ACCB, _ACCBLO
                        BREQ      SYSTEM._L1302
                        DEC       _ACCBHI
                        BRNE      SYSTEM._L1303
                        CLR       _ACCA
SYSTEM._L1302:
                        RET


SYSTEM.UpperCaseStr:
                        LD        _ACCA, Z+
                        TST       _ACCA
                        BREQ      SYSTEM._L1305
                        MOV       _ACCBHI, _ACCA
SYSTEM._L1304:
                        LD        _ACCA, Z+
                        CPI       _ACCA, 061h
                        BRCS      SYSTEM._L1306
                        CPI       _ACCA, 07Bh
                        BRCC      SYSTEM._L1306
                        ANDI      _ACCA, 0DFh
SYSTEM._L1306:
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCBHI
                        BRNE      SYSTEM._L1304
SYSTEM._L1305:
                        RET


SYSTEM.StrCopyV:
                        TST       _ACCA
                        BREQ      SYSTEM._L1309
                        LD        _ACCBHI, Z
                        TST       _ACCBHI
                        BREQ      SYSTEM._L1309
                        SUB       _ACCBHI, _ACCB
                        BRCS      SYSTEM._L1309
                        INC       _ACCBHI
                        CLR       _ACCBLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCBLO
                        CP        _ACCBHI, _ACCA
                        BRCS      SYSTEM._L1308
                        MOV       _ACCBHI, _ACCA
SYSTEM._L1308:
                        LD        _ACCA, Z+
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCBHI
                        BRNE      SYSTEM._L1308
SYSTEM._L1309:
                        RET


SYSTEM.StrConst2Str:
                        LPM       _ACCBHI, Z+
                        TST       _ACCBHI
                        BREQ      SYSTEM._L1311
SYSTEM.StrConst2StrPart:
SYSTEM._L1310:
                        LPM      _ACCA, Z+
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCBHI
                        BRNE      SYSTEM._L1310
SYSTEM._L1311:
                        RET


SYSTEM.StrVar2Str:
                        LD        _ACCA, Z+
                        TST       _ACCA
                        BREQ      SYSTEM._L1313
                        MOV       _ACCBHI, _ACCA
SYSTEM._L1312:
                        LD        _ACCA, Z+
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCBHI
                        BRNE      SYSTEM._L1312
SYSTEM._L1313:
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
                        RJMP      SYSTEM._L1314
                        LD        _ACCGLO, Z+
                        RJMP      SYSTEM._L1315
SYSTEM._L1314:
                        LPM       _ACCGLO, Z+
SYSTEM._L1315:
                        CP        _ACCB, _ACCGLO
                        BREQ      SYSTEM._L1316
                        CLZ
                        RET
SYSTEM._L1316:
                        TST       _ACCB
                        BRNE      SYSTEM._L1317
                        SEZ
                        RET
SYSTEM._L1317:
                        DEC       _ACCB
                        LD        _ACCA, X+
                        SBRC      FLAGS, _STRCONST
                        RJMP      SYSTEM._L1318
                        LD        _ACCGLO, Z+
                        RJMP      SYSTEM._L1319
SYSTEM._L1318:
                        LPM       _ACCGLO, Z+
SYSTEM._L1319:
                        CP        _ACCA, _ACCGLO
                        BREQ      SYSTEM._L1316
                        CLZ
                        RET


SYSTEM.Char2Str:
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        BST       Flags, _DEVICE
                        BRTS      SYSTEM._L1323
                        PUSH      _ACCA
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LDD       _ACCA, Y+000h
                        TST       _ACCA
                        BRNE      SYSTEM._L1320
                        POP       _ACCA
                        SET
                        BLD       Flags, _ERRFLAG
                        POP       _ACCCHI
                        POP       _ACCCLO
                        RET
SYSTEM._L1320:
                        DEC       _ACCA
                        STD       Y+000h, _ACCA
                        POP       _ACCA
                        BST       Flags, _EEPROM
                        BRTS      SYSTEM._L1321
                        ST        Z+, _ACCA
                        RJMP      SYSTEM._L1322
SYSTEM._L1321:
                        CALL      SYSTEM.WriteEEp8
                        ADIW      _ACCCLO, 01h
SYSTEM._L1322:
                        STD       Y+002h, _ACCCHI
                        STD       Y+001h, _ACCCLO
                        POP       _ACCCHI
                        POP       _ACCCLO
                        RET
SYSTEM._L1323:
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
                        BRCC      SYSTEM._L1324
                        POP       _ACCEHI
                        POP       _ACCELO
                        CLR       _ACCA
                        CLR       _ACCB
                        CLR       _ACCAHI
                        CLR       _ACCALO
                        RET
SYSTEM._L1324:
                        ORI       _ACCALO, 080h
                        MOV       _ACCELO, _ACCAHI
                        CLR       _ACCAHI
                        CPI       _ACCEHI, 24
                        BRSH      SYSTEM._L1326
                        SUBI      _ACCEHI, 23
                        NEG       _ACCEHI
SYSTEM._L1325:
                        BREQ      SYSTEM._L1328
                        LSR       _ACCAHI
                        ROR       _ACCALO
                        ROR       _ACCA
                        ROR       _ACCB
                        DEC       _ACCEHI
                        RJMP      SYSTEM._L1325
SYSTEM._L1326:
                        SUBI      _ACCEHI, 23
SYSTEM._L1327:
                        BREQ      SYSTEM._L1328
                        LSL       _ACCB
                        ROL       _ACCA
                        ROL       _ACCALO
                        ROL       _ACCAHI
                        DEC       _ACCEHI
                        RJMP      SYSTEM._L1327
SYSTEM._L1328:
                        SBRS      _ACCELO, 7
                        RJMP      SYSTEM._L1329
                        SUBI      _ACCB, 01h
                        SBCI      _ACCA, 00h
                        SBCI      _ACCALO, 00h
                        SBCI      _ACCAHI, 00h
                        COM       _ACCB
                        COM       _ACCA
                        COM       _ACCAHI
                        COM       _ACCALO
SYSTEM._L1329:
                        POP       _ACCEHI
                        POP       _ACCELO
                        RET

SYSTEM.FENTIERx:
                        CPI       _ACCAHI, 0CFh
                        BRLO      SYSTEM._L1330
                        LDI       _ACCAHI, 080h
                        CLR       _ACCALO
                        CLR       _ACCA
                        CLR       _ACCB
                        RET
SYSTEM._L1330:
                        SBRC      _ACCAHI, 7
                        RJMP      SYSTEM._L1331
                        CPI       _ACCAHI, 04Fh
                        BRLO      SYSTEM._L1331
                        LDI       _ACCAHI, 07Fh
                        LDI       _ACCALO, 0FFh
                        LDI       _ACCA, 0FFh
                        LDI       _ACCB, 0FFh
                        RET
SYSTEM._L1331:
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
                        BRPL      SYSTEM._L1333
                        CLR       _ACCAHI
                        CLR       _ACCALO
                        CLR       _ACCA
                        CLR       _ACCB
                        RET
SYSTEM._L1333:
                        CPI       _ACCBHI, 23
                        BRCC      SYSTEM._L1335
                        LDI       _ACCBLO, 23
                        SUB       _ACCBLO, _ACCBHI
                        BREQ      SYSTEM._L1337
SYSTEM._L1334:
                        LSR       _ACCAHI
                        ROR       _ACCALO
                        ROR       _ACCA
                        ROR       _ACCB
                        DEC       _ACCBLO
                        BRNE      SYSTEM._L1334
                        RJMP      SYSTEM._L1337
SYSTEM._L1335:
                        SUBI      _ACCBHI, 23
                        BREQ      SYSTEM._L1337
                        MOV       _ACCBLO, _ACCBHI
SYSTEM._L1336:
                        LSL       _ACCB
                        ROL       _ACCA
                        ROL       _ACCALO
                        ROL       _ACCAHI
                        BRCC      SYSTEM._L1338
                        SET
                        BLD       Flags, _ERRFLAG
SYSTEM._L1338:
                        DEC       _ACCBLO
                        BRNE      SYSTEM._L1336
SYSTEM._L1337:
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
                        RJMP      SYSTEM._L1339
                        CBR       _ACCAHI, 080h
                        SBRS      _ACCDLO, 7
                        RJMP      SYSTEM._L1341
SYSTEM._L1339:
                        SBRS      _ACCCHI, 7
                        RJMP      SYSTEM._L1340
                        CBR       _ACCCHI, 080h
                        SBRS      _ACCDLO, 7
                        RJMP      SYSTEM._L1342
SYSTEM._L1340:
                        CP        _ACCAHI, _ACCCHI
                        BRLO      SYSTEM._L1341
                        BRNE      SYSTEM._L1342
                        CP        _ACCALO, _ACCCLO
                        BRLO      SYSTEM._L1341
                        BRNE      SYSTEM._L1342
                        CP        _ACCA, _ACCBHI
                        BRLO      SYSTEM._L1341
                        BRNE      SYSTEM._L1342
                        CP        _ACCB, _ACCBLO
                        BRLO      SYSTEM._L1341
                        BRNE      SYSTEM._L1342
                        RJMP      SYSTEM._L1346
SYSTEM._L1341:
                        SBRC      _ACCDLO, 7
                        RJMP      SYSTEM._L1344
SYSTEM._L1343:
                        BST       Flags, _NEGATIVE
                        BRTS      SYSTEM._L1345
                        MOVW      _ACCB, _ACCBLO
                        MOVW      _ACCALO, _ACCCLO
SYSTEM._L1345:
                        INC       _ACCDHI
                        RJMP      SYSTEM._L1346
SYSTEM._L1342:
                        SBRC      _ACCDLO, 7
                        RJMP      SYSTEM._L1343
SYSTEM._L1344:
                        DEC       _ACCDHI
SYSTEM._L1346:
                        OR        _ACCAHI, _ACCDLO
                        RET

SYSTEM.LIntToFloat:
                        TST       _ACCAHI
                        BRNE      SYSTEM._L1347
                        TST       _ACCALO
                        BRNE      SYSTEM._L1347
                        TST       _ACCA
                        BRNE      SYSTEM._L1347
                        TST       _ACCB
                        BRNE      SYSTEM._L1347
                        RET
SYSTEM._L1347:
                        CLR       _ACCBLO
                        SBRS      Flags, _SIGN
                        RJMP      SYSTEM._L1348
                        MOV       _ACCBLO, _ACCAHI
                        ANDI      _ACCBLO, 080h
                        TST       _ACCAHI
                        BRPL      SYSTEM._L1353
                        SUBI      _ACCB, 01h
                        SBCI      _ACCA, 00h
                        SBCI      _ACCALO, 00h
                        SBCI      _ACCAHI, 00h
                        COM       _ACCALO
                        COM       _ACCAHI
                        COM       _ACCA
                        COM       _ACCB
SYSTEM._L1353:
SYSTEM._L1348:
                        LDI       _ACCBHI, 150
SYSTEM._L1349:
                        TST       _ACCAHI
                        BREQ      SYSTEM._L1350
                        LSR       _ACCAHI
                        ROR       _ACCALO
                        ROR       _ACCA
                        ROR       _ACCB
                        INC       _ACCBHI
                        RJMP      SYSTEM._L1349
SYSTEM._L1350:
                        SBRC      _ACCALO, 7
                        RJMP      SYSTEM._L1351
                        LSL       _ACCB
                        ROL       _ACCA
                        ROL       _ACCALO
                        ROL       _ACCAHI
                        DEC       _ACCBHI
                        RJMP      SYSTEM._L1350
SYSTEM._L1351:
                        ANDI      _ACCALO, 07Fh
                        MOV       _ACCAHI, _ACCBHI
                        LSR       _ACCAHI
                        BRCC      SYSTEM._L1352
                        ORI       _ACCALO, 080h
SYSTEM._L1352:
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
                        BREQ      SYSTEM._L1354
                        TST       _ACCEHI
                        BRNE      SYSTEM._L1355
SYSTEM._L1354:
                        CLR       _ACCB
                        CLR       _ACCA
                        CLR       _ACCALO
                        CLR       _ACCAHI
                        RET
SYSTEM._L1355:
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
                        BRNE      SYSTEM._L1356
                        CPI       _ACCCHI, 0FFh
                        BRLO      SYSTEM._L1357
SYSTEM._L1356:
                        SET
                        BLD       Flags, _ERRFLAG
                        ANDI      _ACCAHI, 080h
                        ORI       _ACCAHI, 07Eh
                        LDI       _ACCALO, 0FFh
                        LDI       _ACCB, 0FFh
                        LDI       _ACCA, 0FFh
                        RET
SYSTEM._L1357:
                        CPI       _ACCCHI, 01h
                        BRSH      SYSTEM._L1358
                        CLR       _ACCAHI
                        CLR       _ACCALO
                        CLR       _ACCB
                        CLR       _ACCA
                        SET
                        BLD       Flags, _ERRFLAG
                        RET
SYSTEM._L1358:
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
SYSTEM._L1359:
                        BRCC      SYSTEM._L1360
                        ADD       _ACCFLO, _ACCBLO
                        ADC       _ACCFHI, _ACCBHI
                        ADC       _ACCGLO, _ACCCLO
                        ADC       _ACCGHI, _ACCCHI
SYSTEM._L1360:
                        ROR       _ACCGHI
                        ROR       _ACCGLO
                        ROR       _ACCFHI
                        ROR       _ACCFLO
                        ROR       _ACCEHI
                        ROR       _ACCELO
                        ROR       _ACCDHI
                        ROR       _ACCDLO
                        DEC       _ACCA
                        BRNE      SYSTEM._L1359
                        LDI       _ACCALO, 23
SYSTEM._L1361:
                        LSR       _ACCGHI
                        ROR       _ACCGLO
                        ROR       _ACCFHI
                        ROR       _ACCFLO
                        ROR       _ACCEHI
                        ROR       _ACCELO
                        ROR       _ACCDHI
                        ROR       _ACCDLO
                        DEC       _ACCALO
                        BRNE      SYSTEM._L1361
                        MOV       _ACCB, _ACCDLO
                        MOV       _ACCA, _ACCDHI
                        MOV       _ACCALO, _ACCELO
                        MOV       _ACCAHI, _ACCEHI
                        POP       _ACCBHI
                        POP       _ACCGLO
                        TST       _ACCAHI
                        BREQ      SYSTEM._L1362
                        LSR       _ACCAHI
                        ROR       _ACCALO
                        ROR       _ACCA
                        ROR       _ACCB
                        INC       _ACCBHI
SYSTEM._L1362:
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
                        BRNE      SYSTEM._L1364
SYSTEM._L1363:
                        SET
                        BLD       Flags, _ERRFLAG
                        ANDI      _ACCAHI, 080h
                        ORI       _ACCAHI, 07Eh
                        LDI       _ACCALO, 0FFh
                        LDI       _ACCA, 0FFh
                        LDI       _ACCB, 0FFh
                        RET
SYSTEM._L1364:
                        ROL       _ACCCLO
                        ROL       _ACCCHI
                        SEC
                        ROR       _ACCCLO
                        ROL       _ACCELO
                        ROL       _ACCEHI
                        SEC
                        ROR       _ACCELO
                        TST       _ACCEHI
                        BRNE      SYSTEM._L1366
                        CLR       _ACCAHI
                        CLR       _ACCALO
                        CLR       _ACCA
                        CLR       _ACCB
                        RET
SYSTEM._L1366:
                        CLR       _ACCA
                        SUB       _ACCEHI, _ACCCHI
                        SBCI      _ACCA, 00h
                        MOV       _ACCCHI, _ACCEHI
                        LDI       _ACCB, 7Eh
                        ADD       _ACCCHI, _ACCB
                        CLR       _ACCB
                        ADC       _ACCA, _ACCB
                        TST      _ACCA
                        BRNE     SYSTEM._L1368
                        CPI       _ACCCHI, 0FFh
                        BRNE      SYSTEM._L1367
SYSTEM._L1368:
                        SET
                        BLD       Flags, _ERRFLAG
                        ANDI      _ACCAHI, 080h
                        ORI       _ACCAHI, 07Eh
                        LDI       _ACCALO, 0FFh
                        LDI       _ACCB, 0FFh
                        LDI       _ACCA, 0FFh
                        RET
SYSTEM._L1367:
                        TST       _ACCCHI
                        BRNE      SYSTEM._L1365
                        SET
                        BLD       Flags, _ERRFLAG
                        CLR       _ACCAHI
                        CLR       _ACCALO
                        CLR       _ACCB
                        CLR       _ACCA
                        RET
SYSTEM._L1365:
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
SYSTEM._L1369:
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
                        BRCC      SYSTEM._L1370
                        CLR       _ACCB
                        SUB       _ACCALO, _ACCBLO
                        SBC       _ACCAHI, _ACCBHI
                        SBC       _ACCGLO, _ACCCLO
                        SBC       _ACCGHI, _ACCCHI
                        SBC       _ACCHLO, _ACCB
                        SBC       _ACCHHI, _ACCB
                        SEC
                        RJMP      SYSTEM._L1372
SYSTEM._L1370:
                        CLR       _ACCB
                        CP        _ACCHHI, _ACCB
                        BRLO      SYSTEM._L1372
                        BRNE      SYSTEM._L1371
                        CP        _ACCHLO, _ACCB
                        BRLO      SYSTEM._L1372
                        BRNE      SYSTEM._L1371
                        CP        _ACCGHI, _ACCCHI
                        BRLO      SYSTEM._L1372
                        BRNE      SYSTEM._L1371
                        CP        _ACCGLO, _ACCCLO
                        BRLO      SYSTEM._L1372
                        BRNE      SYSTEM._L1371
                        CP        _ACCAHI, _ACCBHI
                        BRLO      SYSTEM._L1372
                        BRNE      SYSTEM._L1371
                        CP        _ACCALO, _ACCBLO
                        BRLO      SYSTEM._L1372
SYSTEM._L1371:
                        CLR       _ACCB
                        SUB       _ACCALO, _ACCBLO
                        SBC       _ACCAHI, _ACCBHI
                        SBC       _ACCGLO, _ACCCLO
                        SBC       _ACCGHI, _ACCCHI
                        SBC       _ACCHLO, _ACCB
                        SBC       _ACCHHI, _ACCB
SYSTEM._L1372:
                        DEC       _ACCA
                        BRCS      SYSTEM._L1373
                        SEC
                        RJMP      SYSTEM._L1374
SYSTEM._L1373:
                        CLC
SYSTEM._L1374:
                        BRNE      SYSTEM._L1369
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
                        BREQ      SYSTEM._L1375
                        LSR       _ACCAHI
                        ROR       _ACCALO
                        ROR       _ACCA
                        ROR       _ACCB
                        INC       _ACCBHI
SYSTEM._L1375:
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
                        BRCS      SYSTEM._L1376
                        BRNE      SYSTEM._L1377
                        CP        _ACCELO, _ACCCLO
                        BRCS      SYSTEM._L1376
                        BRNE      SYSTEM._L1377
                        CP        _ACCDHI, _ACCBHI
                        BRCS      SYSTEM._L1376
                        BRNE      SYSTEM._L1377
                        CP        _ACCDLO, _ACCBLO
                        BRCS      SYSTEM._L1376
SYSTEM._L1377:
                        MOVW      _ACCB, _ACCDLO
                        MOVW      _ACCALO, _ACCELO
                        MOV       _ACCDHI, _ACCBHI
                        MOV       _ACCDLO, _ACCBLO
                        MOV       _ACCEHI, _ACCCHI
                        MOV       _ACCELO, _ACCCLO
                        MOVW      _ACCBLO, _ACCB
                        MOVW      _ACCCLO, _ACCALO
                        RJMP      SYSTEM._L1386
SYSTEM._L1376:
                        MOVW      _ACCB, _ACCBLO
                        MOVW      _ACCALO, _ACCCLO
SYSTEM._L1386:
                        ANDI      _ACCALO, 07Fh
                        ORI       _ACCALO, 080h
                        CLR       _ACCAHI
                        SBRS      _ACCCHI, 7
                        RJMP      SYSTEM._L1378
                        SUBI      _ACCB, 01h
                        SBCI      _ACCA, 00h
                        SBCI      _ACCALO, 00h
                        SBCI      _ACCAHI, 00h
                        COM       _ACCALO
                        COM       _ACCAHI
                        COM       _ACCA
                        COM       _ACCB
SYSTEM._L1378:
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
SYSTEM._L1379:
                        BREQ      SYSTEM._L1380
                        LSR       _ACCHLO
                        ROR       _ACCGHI
                        ROR       _ACCGLO
                        DEC       _ACCA
                        RJMP      SYSTEM._L1379
SYSTEM._L1380:
                        MOV       _ACCA, _ACCEHI
                        MOV       _ACCDLO, _ACCGLO
                        MOV       _ACCDHI, _ACCGHI
                        MOV       _ACCELO, _ACCHLO
                        MOV       _ACCEHI, _ACCHHI
                        SBRS      _ACCA, 7
                        RJMP      SYSTEM._L1381
                        SUBI      _ACCDLO, 01h
                        SBCI      _ACCDHI, 00h
                        SBCI      _ACCELO, 00h
                        SBCI      _ACCEHI, 00h
                        COM       _ACCDLO
                        COM       _ACCDHI
                        COM       _ACCEHI
                        COM       _ACCELO
SYSTEM._L1381:
                        POP       _ACCA
                        ADD       _ACCB, _ACCDLO
                        ADC       _ACCA, _ACCDHI
                        ADC       _ACCALO, _ACCELO
                        ADC       _ACCAHI, _ACCEHI
                        SBRS      _ACCAHI, 7
                        RJMP      SYSTEM._L1382
                        ORI       _ACCCHI, 080h
                        SUBI      _ACCB, 01h
                        SBCI      _ACCA, 00h
                        SBCI      _ACCALO, 00h
                        SBCI      _ACCAHI, 00h
                        COM       _ACCALO
                        COM       _ACCAHI
                        COM       _ACCA
                        COM       _ACCB
                        RJMP      SYSTEM._L1383
SYSTEM._L1382:
                        ANDI      _ACCCHI, 07Fh
SYSTEM._L1383:
                        MOV       _ACCFLO, _ACCAHI
                        ANDI      _ACCFLO, 07Fh
                        BREQ      SYSTEM._L1384
                        LSR       _ACCAHI
                        ROR       _ACCALO
                        ROR       _ACCA
                        ROR       _ACCB
                        INC       _ACCFHI
                        BRNE      SYSTEM._L1384
                        LDI       _ACCA, 0FFh
                        LDI       _ACCB, 0FFh
                        LDI       _ACCALO, 0FFh
                        LDI       _ACCAHI, 07Fh
                        SBRC      _ACCCHI, 7
                        ORI       _ACCAHI, 080h
                        SET
                        BLD       Flags, _ERRFLAG
                        RET
SYSTEM._L1384:
                        SBRC      _ACCALO, 7
                        RJMP      SYSTEM._L1385
                        TST       _ACCFHI
                        BREQ      SYSTEM._L1385
                        LSL       _ACCB
                        ROL       _ACCA
                        ROL       _ACCALO
                        ROL       _ACCAHI
                        DEC       _ACCFHI
                        RJMP      SYSTEM._L1384
SYSTEM._L1385:
                        MOV       _ACCAHI, _ACCFHI
                        CLR       _ACCFHI
                        LSR       _ACCAHI
                        TST       _ACCAHI
                        BREQ      SYSTEM._L1387
                        ROR       _ACCFHI
                        ANDI      _ACCALO, 07Fh
                        OR        _ACCALO, _ACCFHI
                        SBRC      _ACCCHI, 7
                        ORI       _ACCAHI, 080h
                        RET
SYSTEM._L1387:
                        CLR       _ACCALO
                        CLR       _ACCA
                        CLR       _ACCB
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
                        BRNE      SYSTEM._L1388
                        RET
SYSTEM._L1388:
                        RCALL     SYSTEM.Str2FltRdChr
                        CPI       _ACCDLO, 020h
                        BRNE      SYSTEM._L1389
                        ADIW      _ACCCLO, 1
                        DEC       _ACCBLO
                        RJMP      SYSTEM.ACSkipSpace
SYSTEM._L1389:
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
                        BRTC      SYSTEM._L1390
                        CALL      SYSTEM.ReadEEp8D
                        RET
SYSTEM._L1390:
                        LD        _ACCDLO, Z
                        RET
SYSTEM.Float2Str_C:
                        PUSH      _ACCDHI
SYSTEM._L1392:
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
                        BRMI      SYSTEM._L1394
                        BREQ      SYSTEM._L1394
                        LDI       _ACCBLO, 000h
                        LDI       _ACCBHI, 024h
                        LDI       _ACCCLO, 074h
                        LDI       _ACCCHI, 049h
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BRMI      SYSTEM._L1395
                        BREQ      SYSTEM._L1395
                        POP       _ACCDHI
                        DEC       _ACCDHI
                        PUSH      _ACCDHI
                        LDI       _ACCBLO, 000h
                        LDI       _ACCBHI, 000h
                        LDI       _ACCCLO, 020h
                        LDI       _ACCCHI, 041h
SYSTEM._L1393:
                        MOV       _ACCDLO, _ACCELO
                        MOV       _ACCDHI, _ACCEHI
                        MOV       _ACCELO, _ACCFLO
                        MOV       _ACCEHI, _ACCFHI
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat_R
                        RJMP      SYSTEM._L1392
SYSTEM._L1394:
                        POP       _ACCDHI
                        INC       _ACCDHI
                        PUSH      _ACCDHI
                        LDI       _ACCBLO, 0CDh
                        LDI       _ACCBHI, 0CCh
                        LDI       _ACCCLO, 0CCh
                        LDI       _ACCCHI, 03Dh
                        RJMP      SYSTEM._L1393
SYSTEM._L1395:
                        POP       _ACCDHI
                        RET

SYSTEM.Float2Str:
                        LD        _ACCCLO, Y+
                        LD        _ACCBLO, Y+
                        LD        _ACCBHI, Y+
                        LD        _ACCB, Y+
                        LD        _ACCA, Y+
                        LD        _ACCALO, Y+
                        LD        _ACCAHI, Y+
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCEHI, 17
                        LDI       _ACCELO, 30h
SYSTEM._L1391:
                        ST        -Y, _ACCELO
                        DEC       _ACCEHI
                        BRNE      SYSTEM._L1391
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
                        BRNE      SYSTEM._L1402
                        LDD       _ACCA, Y+15
                        LDI       _ACCB, DECIMALSEP
                        CPI       _ACCA, 45h
                        BRNE      SYSTEM._L1403
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
SYSTEM._L1403:
                        LDI       _ACCA, 30h
                        RCALL     SYSTEM.Float2Str_P
                        LDI       _ACCA, DECIMALSEP
                        RCALL     SYSTEM.Float2Str_P
                        LDI       _ACCA, 30h
                        RCALL     SYSTEM.Float2Str_P
                        RCALL     SYSTEM.Float2Str_R
                        RJMP      SYSTEM.Float2Str_F
SYSTEM._L1402:
                        LDD       _ACCCHI, Y+15
                        CPI       _ACCCHI, 45h
                        BREQ      SYSTEM._L1404
                        CP        _ACCBLO, _ACCBHI
                        BRCS      SYSTEM._L1404
                        MOV       _ACCBHI, _ACCBLO
                        INC       _ACCBHI
                        STD       Y+14, _ACCBHI
SYSTEM._L1404:
                        CLR       _ACCDHI
                        TST       _ACCAHI
                        BRPL      SYSTEM._L1401
                        ANDI      _ACCAHI, 07Fh
                        PUSH      _ACCA
                        LDI       _ACCA, 2Dh
                        RCALL     SYSTEM.Float2Str_P
                        POP       _ACCA
SYSTEM._L1401:
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
                        BRGE      SYSTEM._L1407
                        CPI       _ACCDHI, -5 AND 0FFh
                        BRLT      SYSTEM._L1407
                        CPI       _ACCDLO, 45h
                        BREQ      SYSTEM._L1407
                        TST       _ACCBLO
                        BRNE      SYSTEM._L1405
                        SUB       _ACCDLO, _ACCDHI
SYSTEM._L1405:
                        MOV       _ACCBLO, _ACCDHI
                        LDI       _ACCDHI, 9
                        SUB       _ACCDHI, _ACCDLO
                        SUB       _ACCDHI, _ACCBLO
                        BRMI      SYSTEM._L1408
                        BRNE      SYSTEM._L1406
                        COM       _ACCDHI
                        STD       Y+15, _ACCDHI
                        RJMP      SYSTEM._L1407
SYSTEM._L1406:
                        DEC       _ACCDHI
                        BREQ      SYSTEM._L1407
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
                        RJMP      SYSTEM._L1406
SYSTEM._L1408:
SYSTEM._L1407:
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
                        RJMP      SYSTEM._L1397
SYSTEM._L1396:
                        LSR       _ACCFLO
                        ROR       _ACCEHI
                        ROR       _ACCELO
                        DEC       _ACCAHI
SYSTEM._L1397:
                        BRNE      SYSTEM._L1396
                        POP       _ACCBHI
                        LDI       _ACCBLO, 1
                        LDD       _ACCDLO, Y+15
                        CPI       _ACCDLO, 45h
                        BRNE      SYSTEM._L1409
                        SUBI      _ACCBHI, -8 AND 0FFh
                        MOV       _ACCALO, _ACCBHI
                        BRPL      SYSTEM._L1410
                        NEG       _ACCALO
SYSTEM._L1410:
                        RJMP      SYSTEM._L1398
SYSTEM._L1409:
                        LDI       _ACCALO, 7
                        SUBI      _ACCBHI, -8 AND 0FFh
                        CPI       _ACCBHI, 8
                        BRGE      SYSTEM._L1398
                        CPI       _ACCBHI, -5 AND 0FFh
                        BRLT      SYSTEM._L1398
                        DEC       _ACCBHI
                        MOV       _ACCBLO, _ACCBHI
                        LDI       _ACCBHI, 2
SYSTEM._L1398:
                        SUBI      _ACCBHI, 2
                        TST       _ACCBLO
                        BREQ      SYSTEM._L1412
                        BRPL      SYSTEM._L1399
SYSTEM._L1412:
                        LDI       _ACCA, 30h
                        RCALL     SYSTEM.Float2Str_P
                        LDI       _ACCA, DECIMALSEP
                        RCALL     SYSTEM.Float2Str_P
                        TST       _ACCBLO
                        BREQ      SYSTEM._L1399
SYSTEM._L1411:
                        LDI       _ACCA, 30h
                        RCALL     SYSTEM.Float2Str_P
                        DEC       _ACCALO
                        INC       _ACCBLO
                        BRNE      SYSTEM._L1411
SYSTEM._L1399:
                        LDI       _ACCCLO, SYSTEM.DECDIG AND 0FFh
                        LDI       _ACCCHI, SYSTEM.DECDIG SHRB 8
SYSTEM._L1400:
                        CLR       _ACCAHI
SYSTEM._L1413:
                        LPM       _ACCB, Z+
                        LPM       _ACCA, Z
                        ADIW      _ACCCLO, 1
                        LPM
                        ADIW      _ACCCLO, 02h
SYSTEM._L1418:
                        SUB       _ACCELO, _ACCB
                        SBC       _ACCEHI, _ACCA
                        SBC       _ACCFLO, _ACCGLO
                        BRCS      SYSTEM._L1414
                        INC       _ACCAHI
                        RJMP      SYSTEM._L1418
SYSTEM._L1414:
                        ADD       _ACCELO, _ACCB
                        ADC       _ACCEHI, _ACCA
                        ADC       _ACCFLO, _ACCGLO
                        CPI       _ACCAHI, 10
                        BRLT      SYSTEM._L1419
                        LDI       _ACCAHI, 1
                        INC       _ACCBHI
SYSTEM._L1419:
                        LDI       _ACCA, 30h
                        ADD       _ACCA, _ACCAHI
                        RCALL     SYSTEM.Float2Str_P
                        DEC       _ACCBLO
                        BRNE      SYSTEM._L1415
                        LDI       _ACCA, DECIMALSEP
                        RCALL     SYSTEM.Float2Str_P
SYSTEM._L1415:
                        DEC       _ACCALO
                        BRMI      SYSTEM._L1416
                        BRNE      SYSTEM._L1400
SYSTEM._L1416:
                        RCALL     SYSTEM.Float2Str_R
                        TST       _ACCBHI
                        BREQ      SYSTEM.Float2Str_F
                        LDI       _ACCA, 0FFh
                        STD       Y+15, _ACCA
                        LDI       _ACCA, 45h
                        RCALL     SYSTEM.Float2Str_P
                        TST       _ACCBHI
                        BRPL      SYSTEM._L1417
                        NEG       _ACCBHI
                        LDI       _ACCA, 2Dh
                        RCALL     SYSTEM.Float2Str_P
SYSTEM._L1417:
                        LDI       _ACCB, 10
                        MOV       _ACCA, _ACCBHI
                        CALL      SYSTEM.DIV8_R
                        TST       _ACCA
                        BREQ      SYSTEM._L1421
                        ORI       _ACCA, 30h
                        RCALL     SYSTEM.Float2Str_P
SYSTEM._L1421:
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
                        BREQ      SYSTEM._L1423
                        TST       _ACCAHI
                        BREQ      SYSTEM._L1423
                        TST       _ACCALO
                        BRNE      SYSTEM._L1422
                        RCALL     SYSTEM.Float2Str_D
                        ST        X, _ACCDHI
                        RJMP      SYSTEM._L1423
SYSTEM._L1422:
                        RCALL     SYSTEM.Float2Str_D
                        LD        _ACCDLO, X
                        SUB       _ACCAHI, _ACCALO
                        DEC       _ACCAHI
                        SUB       _ACCAHI, _ACCDHI
                        BREQ      SYSTEM._L1428
                        BRCS      SYSTEM._L1428
                        LDD       _ACCA, Y+16+3
SYSTEM._L1426:
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCAHI
                        BRNE      SYSTEM._L1426
SYSTEM._L1428:
                        ST        X, _ACCDHI
                        RCALL     SYSTEM.Float2Str_W
                        LDI       _ACCA, DECIMALSEP
                        CALL      SYSTEM.Char2Str
                        ADIW      _ACCBLO, 1
                        SUB       _ACCDLO, _ACCDHI
SYSTEM._L1430:
                        DEC       _ACCDLO
                        BREQ      SYSTEM._L1429
                        LD        _ACCA, X+
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCALO
                        BREQ      SYSTEM._L1427
                        RJMP      SYSTEM._L1430
SYSTEM._L1429:
                        LDI       _ACCA, 030h
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCALO
                        BRNE      SYSTEM._L1429
                        RJMP      SYSTEM._L1427
SYSTEM._L1423:
                        LD        _ACCB, X
                        SUB       _ACCAHI, _ACCB
                        BREQ      SYSTEM._L1425
                        BRCS      SYSTEM._L1425
                        LDD       _ACCA, Y+16+3
SYSTEM._L1424:
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCAHI
                        BRNE      SYSTEM._L1424
SYSTEM._L1425:
                        RCALL     SYSTEM.Float2Str_W
SYSTEM._L1427:
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
SYSTEM._L1431:
                        LD        _ACCA, X+
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCB
                        BRNE      SYSTEM._L1431
                        RET

SYSTEM.Float2Str_D:
                        PUSH      _ACCBLO
                        PUSH      _ACCBHI
                        CLR       _ACCDHI
                        LD        _ACCB, X+
SYSTEM._L1432:
                        LD        _ACCA, X+
                        CPI       _ACCA, DECIMALSEP
                        BREQ      SYSTEM._L1433
                        INC       _ACCDHI
                        DEC       _ACCB
                        BRNE      SYSTEM._L1432
SYSTEM._L1433:
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
SYSTEM._L1434:
                        DEC       _ACCA
                        LD        _ACCB, -Z
                        CPI       _ACCB, 030h
                        BREQ      SYSTEM._L1434
                        CPI       _ACCB, DECIMALSEP
                        BREQ      SYSTEM._L1435
                        INC       _ACCA
SYSTEM._L1435:
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


SYSTEM.SHR8:
                        MOV       _ACCALO, _ACCA
                        MOV       _ACCA, _ACCB
SYSTEM.SHR8_R:
                        TST       _ACCALO
                        BREQ      SYSTEM._L1437
                        CPI       _ACCALO, 08h
                        BRCS      SYSTEM._L1436
                        CLR       _ACCA
                        RET
SYSTEM._L1436:
                        LSR       _ACCA
                        DEC       _ACCALO
                        BRNE      SYSTEM._L1436
SYSTEM._L1437:
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
SYSTEM._L1438:
                        ROL       _ACCA
                        DEC       _ACCALO
                        BRNE      SYSTEM._L1439
                        MOV       _ACCB, _ACCAHI
                        RET
SYSTEM._L1439:
                        ROL       _ACCAHI
                        SUB       _ACCAHI, _ACCB
                        BRCC      SYSTEM._L1440
                        ADD       _ACCAHI, _ACCB
                        CLC
                        RJMP      SYSTEM._L1438
SYSTEM._L1440:
                        SEC
                        RJMP      SYSTEM._L1438


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
                        BRTC      SYSTEM._L1442
                        MOV       _ACCDHI, _ACCBHI
                        MOV       _ACCDLO, _ACCAHI
                        EOR       _ACCDLO, _ACCBHI
                        CLT
                        SBRS      _ACCDLO, 7
                        BLD       Flags, _SIGN
                        SBRS      _ACCAHI, 7
                        RJMP      SYSTEM._L1444
                        NEG       _ACCALO
                        BRNE      SYSTEM._L1445
                        DEC       _ACCAHI
SYSTEM._L1445:
                        COM       _ACCAHI
SYSTEM._L1444:
                        SBRS      _ACCBHI, 7
                        RJMP      SYSTEM._L1442
                        NEG       _ACCBLO
                        BRNE      SYSTEM._L1446
                        DEC       _ACCBHI
SYSTEM._L1446:
                        COM       _ACCBHI
SYSTEM._L1442:
                        CLR       _ACCCLO
                        SUB       _ACCCHI, _ACCCHI
                        LDI       _ACCA, 17
SYSTEM._L1447:
                        ROL       _ACCBLO
                        ROL       _ACCBHI
                        DEC       _ACCA
                        BRNE      SYSTEM._L1448
                        MOVW      _ACCB, _ACCBLO
                        BST       Flags, _SIGN
                        BRTC      SYSTEM._L1443
                        NEG       _ACCB
                        BRNE      SYSTEM._L1450
                        DEC       _ACCA
SYSTEM._L1450:
                        COM       _ACCA
SYSTEM._L1443:
                        RET
SYSTEM._L1448:
                        ROL       _ACCCLO
                        ROL       _ACCCHI
                        SUB       _ACCCLO, _ACCALO
                        SBC       _ACCCHI, _ACCAHI
                        BRCC      SYSTEM._L1449
                        ADD       _ACCCLO, _ACCALO
                        ADC       _ACCCHI, _ACCAHI
                        CLC
                        RJMP      SYSTEM._L1447
SYSTEM._L1449:
                        SEC
                        RJMP      SYSTEM._L1447


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
                        RJMP      SYSTEM._L1451
SYSTEM.MUL32_R:
                        MOVW      _ACCBLO, _ACCB
                        MOVW      _ACCCLO, _ACCALO
SYSTEM._L1451:
                        BST       Flags, _SIGN
                        BRTC      SYSTEM._L1452
                        MOV       _ACCFLO, _ACCCHI
                        EOR       _ACCFLO, _ACCEHI
                        CLT
                        SBRS      _ACCFLO, 7
                        BLD       Flags, _SIGN
                        SBRS      _ACCCHI, 7
                        RJMP      SYSTEM._L1454
                        COM       _ACCBLO
                        COM       _ACCBHI
                        COM       _ACCCLO
                        COM       _ACCCHI
                        SUBI      _ACCBLO, 0FFh
                        SBCI      _ACCBHI, 0FFh
                        SBCI      _ACCCLO, 0FFh
                        SBCI      _ACCCHI, 0FFh
SYSTEM._L1454:
                        SBRS      _ACCEHI, 7
                        RJMP      SYSTEM._L1452
                        COM       _ACCDLO
                        COM       _ACCDHI
                        COM       _ACCELO
                        COM       _ACCEHI
                        SUBI      _ACCDLO, 0FFh
                        SBCI      _ACCDHI, 0FFh
                        SBCI      _ACCELO, 0FFh
                        SBCI      _ACCEHI, 0FFh
SYSTEM._L1452:
                        CLR       _ACCFHI
                        CLR       _ACCFLO
                        CLR       _ACCGHI
                        CLR       _ACCGLO
                        LDI       _ACCA, 32
                        LSR       _ACCEHI
                        ROR       _ACCELO
                        ROR       _ACCDHI
                        ROR       _ACCDLO
SYSTEM._L1456:
                        BRCC      SYSTEM._L1455
                        ADD       _ACCFLO, _ACCBLO
                        ADC       _ACCFHI, _ACCBHI
                        ADC       _ACCGLO, _ACCCLO
                        ADC       _ACCGHI, _ACCCHI
SYSTEM._L1455:
                        ROR       _ACCGHI
                        ROR       _ACCGLO
                        ROR       _ACCFHI
                        ROR       _ACCFLO
                        ROR       _ACCEHI
                        ROR       _ACCELO
                        ROR       _ACCDHI
                        ROR       _ACCDLO
                        DEC       _ACCA
                        BRNE      SYSTEM._L1456
                        MOVW      _ACCB, _ACCDLO
                        MOVW      _ACCALO, _ACCELO
                        BST       Flags, _SIGN
                        BRTC      SYSTEM._L1453
                        SUBI      _ACCB, 01h
                        SBCI      _ACCA, 00h
                        SBCI      _ACCALO, 00h
                        SBCI      _ACCAHI, 00h
                        COM       _ACCALO
                        COM       _ACCAHI
                        COM       _ACCA
                        COM       _ACCB
SYSTEM._L1453:
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
                        RJMP      SYSTEM._L1457
                        COM       _ACCBLO
                        COM       _ACCBHI
                        COM       _ACCCLO
                        COM       _ACCCHI
                        SUBI      _ACCBLO, 0FFh
                        SBCI      _ACCBHI, 0FFh
                        SBCI      _ACCCLO, 0FFh
                        SBCI      _ACCCHI, 0FFh
SYSTEM._L1457:
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
SYSTEM._L1459:
                        ROL       _ACCDLO
                        ROL       _ACCDHI
                        ROL       _ACCELO
                        ROL       _ACCEHI
                        DEC       _ACCA
                        BRNE      SYSTEM._L1458
                        MOVW      _ACCB, _ACCDLO
                        MOVW      _ACCALO, _ACCELO
                        BST       Flags, _SIGN
                        BRTC      SYSTEM._L1461
                        SUBI      _ACCB, 01h
                        SBCI      _ACCA, 00h
                        SBCI      _ACCALO, 00h
                        SBCI      _ACCAHI, 00h
                        COM       _ACCALO
                        COM       _ACCAHI
                        COM       _ACCA
                        COM       _ACCB
SYSTEM._L1461:
                        POP       _ACCDHI
                        RET
SYSTEM._L1458:
                        ROL       _ACCFLO
                        ROL       _ACCFHI
                        ROL       _ACCGLO
                        ROL       _ACCGHI
                        SUB       _ACCFLO, _ACCBLO
                        SBC       _ACCFHI, _ACCBHI
                        SBC       _ACCGLO, _ACCCLO
                        SBC       _ACCGHI, _ACCCHI
                        BRCC      SYSTEM._L1460
                        ADD       _ACCFLO, _ACCBLO
                        ADC       _ACCFHI, _ACCBHI
                        ADC       _ACCGLO, _ACCCLO
                        ADC       _ACCGHI, _ACCCHI
                        CLC
                        RJMP      SYSTEM._L1459
SYSTEM._L1460:
                        SEC
                        RJMP      SYSTEM._L1459


SYSTEM.SHR16:
                        TST       _ACCALO
                        BREQ      SYSTEM._L1463
                        CPI       _ACCALO, 10h
                        BRCS      SYSTEM._L1462
                        CLR       _ACCA
                        CLR       _ACCB
                        RET
SYSTEM._L1462:
                        LSR       _ACCA
                        ROR       _ACCB
                        DEC       _ACCALO
                        BRNE      SYSTEM._L1462
SYSTEM._L1463:
                        RET


SYSTEM.SHL16:
                        TST       _ACCALO
                        BREQ      SYSTEM._L1465
                        CPI       _ACCALO, 10h
                        BRCS      SYSTEM._L1464
                        CLR       _ACCA
                        CLR       _ACCB
                        RET
SYSTEM._L1464:
                        LSL       _ACCB
                        ROL       _ACCA
                        DEC       _ACCALO
                        BRNE      SYSTEM._L1464
SYSTEM._L1465:
                        RET

SYSTEM.SetSysTimer:
                        CLI
                        ST        Z+, _ACCB
                        ST        Z+, _ACCA
                        MOV       _ACCBLO, _SYSTFLAGS
                        TST       _ACCA
                        BRNE       SYSTEM._L1466
                        TST       _ACCB
                        BRNE       SYSTEM._L1466
                        COM       _ACCBHI
                        AND       _ACCBLO, _ACCBHI
                        MOV       _SYSTFLAGS, _ACCBLO
                        SBRC      Flags, IntFlag
                        SEI
                        RET
SYSTEM._L1466:
                        OR        _ACCBLO, _ACCBHI
                        MOV       _SYSTFLAGS, _ACCBLO
                        SBRC      Flags, IntFlag
                        SEI
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
                        .SYM      DCG.Vers1Str
DCG.Vers1Str:
                        .BYTE     28
                        .ASCII    "2.92 [DCG by CM/c't 05/2010]"

                        .SYM      DCG.Vers3Str
DCG.Vers3Str:
                        .BYTE     8
                        .ASCII    "DCG 2.92"

                        .SYM      DCG.AdrStr
DCG.AdrStr:
                        .BYTE     4
                        .ASCII    "Adr "

$St_String4:
                        .BYTE     8
                        .ASCII    "[ICONST]"

$St_String5:
                        .BYTE     5
                        .ASCII    "0.000"

$St_String6:
                        .BYTE     3
                        .ASCII    " W"
                        .BYTE     001h

$St_String7:
                        .BYTE     2
                        .ASCII    "Ah"

$St_String8:
                        .BYTE     3
                        .ASCII    "mAh"

$St_String9:
                        .BYTE     3
                        .ASCII    "Wh "

$St_String10:
                        .BYTE     4
                        .ASCII    "mWh "

$St_String11:
                        .BYTE     8
                        .ASCII    "OVRTEMP "

$St_String12:
                        .BYTE     8
                        .ASCII    "OVRVOLT "

$St_String13:
                        .BYTE     8
                        .ASCII    "FUSEBLW "

$St_String14:
                        .BYTE     3
                        .ASCII    "OFF"

$St_String15:
                        .BYTE     0


                        ; ============ array-constant tables ============
                        .SYM      DCG.ErrStrArr
DCG.ErrStrArr:
                        .BYTE     4
                        .ASCII    "[OK]"
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h

                        .BYTE     8
                        .ASCII    "[SRQUSR]"

                        .BYTE     6
                        .ASCII    "[BUSY]"
                        .BYTE     00h
                        .BYTE     00h

                        .BYTE     7
                        .ASCII    "[OVRLD]"
                        .BYTE     00h

                        .BYTE     8
                        .ASCII    "[CMDERR]"

                        .BYTE     8
                        .ASCII    "[PARERR]"

                        .BYTE     8
                        .ASCII    "[LOCKED]"

                        .BYTE     8
                        .ASCII    "[CHKSUM]"


                        .SYM      DCG.FaultStrArr
DCG.FaultStrArr:
                        .BYTE     9
                        .ASCII    "[OVRPOWR]"
                        .BYTE     00h

                        .BYTE     9
                        .ASCII    "[FUSEBLW]"
                        .BYTE     00h

                        .BYTE     9
                        .ASCII    "[OVRVOLT]"
                        .BYTE     00h

                        .BYTE     9
                        .ASCII    "[OVRTEMP]"
                        .BYTE     00h


                        .SYM      DCG.MenuStrArr
DCG.MenuStrArr:
                        .BYTE     0
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h

                        .BYTE     0
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h

                        .BYTE     8
                        .ASCII    "Ripple %"

                        .BYTE     8
                        .ASCII    "T on  ms"

                        .BYTE     8
                        .ASCII    "T off ms"

                        .BYTE     8
                        .ASCII    "TrackChn"

                        .BYTE     0
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h

                        .BYTE     8
                        .ASCII    "Power   "


                        .SYM      DCG.CmdStrArr
DCG.CmdStrArr:
                        .BYTE     3
                        .ASCII    "STR"

                        .BYTE     3
                        .ASCII    "IDN"

                        .BYTE     3
                        .ASCII    "CHN"

                        .BYTE     3
                        .ASCII    "VAL"

                        .BYTE     3
                        .ASCII    "DCV"

                        .BYTE     3
                        .ASCII    "DCA"

                        .BYTE     3
                        .ASCII    "MAH"

                        .BYTE     3
                        .ASCII    "MWH"

                        .BYTE     3
                        .ASCII    "MSV"

                        .BYTE     3
                        .ASCII    "MSA"

                        .BYTE     3
                        .ASCII    "MSW"

                        .BYTE     3
                        .ASCII    "PCV"

                        .BYTE     3
                        .ASCII    "PCA"

                        .BYTE     3
                        .ASCII    "RON"

                        .BYTE     3
                        .ASCII    "ROF"

                        .BYTE     3
                        .ASCII    "RIP"

                        .BYTE     3
                        .ASCII    "RAW"

                        .BYTE     3
                        .ASCII    "DSP"

                        .BYTE     3
                        .ASCII    "OFS"

                        .BYTE     3
                        .ASCII    "SCL"

                        .BYTE     3
                        .ASCII    "OPT"

                        .BYTE     3
                        .ASCII    "ALL"

                        .BYTE     3
                        .ASCII    "TMP"

                        .BYTE     3
                        .ASCII    "WEN"

                        .BYTE     3
                        .ASCII    "ERC"

                        .BYTE     3
                        .ASCII    "SBD"

                        .BYTE     3
                        .ASCII    "NOP"


                        .SYM      DCG.Cmd2SubChArr
DCG.Cmd2SubChArr:
                        .BYTE     0FFh
                        .BYTE     0FEh
                        .BYTE     0FDh
                        .BYTE     000h
                        .BYTE     000h
                        .BYTE     001h
                        .BYTE     007h
                        .BYTE     008h
                        .BYTE     00Ah
                        .BYTE     00Bh
                        .BYTE     012h
                        .BYTE     014h
                        .BYTE     015h
                        .BYTE     01Bh
                        .BYTE     01Ch
                        .BYTE     01Dh
                        .BYTE     032h
                        .BYTE     050h
                        .BYTE     064h
                        .BYTE     0C8h
                        .BYTE     096h
                        .BYTE     063h
                        .BYTE     0E9h
                        .BYTE     0FAh
                        .BYTE     0FBh
                        .BYTE     0FCh
                        .BYTE     000h

                        .SYM      DCG.IncrAccArray
DCG.IncrAccArray:
                        .WORD     00000h
                        .WORD     00001h
                        .WORD     00002h
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


                        ; ============ Fixed addr String-constant tables ============

                        ; ============ fixed addr array-constant tables ============

                        ; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                        ; Reset and Interrupt vectors
                        ; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


                        .ENDCODE
SYSTEM.ENDCODE:
                        .ORG       000000h, VECTTAB
                        .VECTTAB
SYSTEM.VectTab:
                        JMP       SYSTEM.RESET
                        JMP       SYSTEM.DefIntErr
                        JMP       SYSTEM.DefIntErr
                        JMP       SYSTEM.DefIntErr
                        JMP       SYSTEM.$INTERRUPT_TIMER2COMP
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
                        ; upto            = 00008h
                        ; and
                        ; from            = 00010h
                        ; upto            = 0001Fh
                        ;
                        ; Stackframe at   = ...00448h


                        ; ===== Current top of User Vars in Data is 0000Bh =====

                        ; ===== Current top of User Vars in IData is 0055Bh =====

                        ; ===== Current top of User Vars in EEprom is 000B7h =====


                        ; ===== Imported Library Routines =====

                        ; Shift  right byte SHR8
                        ; Divide       byte DIV8
                        ; Multiply     word MUL16
                        ; Divide       word DIV16
                        ; Shift  right word SHR16
                        ; Shift  left  word SHL16
                        ; Higher float
                        ; LongWord and LongInt types
                        ; Multiply     long MUL32
                        ; Divide       long DIV32
                        ; Convert byte to string
                        ; Convert int to string
                        ; Convert string to int
                        ; String compare
                        ; Copy partial String
                        ; Floating point type
                        ; float multiply
                        ; float divide
                        ; float add
                        ; float subtract
                        ; float round
                        ; float float to int
                        ; float int to float
                        ; float float to string
                        ; float string to float
                        ; EEprom read
                        ; EEprom write

                        ; Pascal Statements : 1123
                        ; Assembler Lines   : 38804
                        ; Optimizer removed : 754 lines = 1508Bytes

                        ; >> real SysTick (exact): 1.000 msec <<

;  Linker removed the following functions and procedures
;
;  Module/Unit             Function/Procedure
;  ------------------------------------------
;
