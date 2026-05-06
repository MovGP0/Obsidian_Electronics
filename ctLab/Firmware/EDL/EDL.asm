
                        .FILE     H:\PROJAVR\ADA-C EDL_MCB\EDL.pas

                        ; Compiled by E-LAB AVRco PASCAL Compiler Rev 4.89.00
                        ; Version     : Profi
                        ;
                        ; Licenced to : Redaktion CT
                        ;
                        ; (c)E-LAB Computers, Grombacherstr. 27  e-mail info@e-lab.de
                        ; D-74906 Bad Rappenau  Tel. 07268/9124-0 Fax. 07268/9124-24
                        ; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                        ; Source File : EDL.pas
                        ; Compiled    : 21. Mai 2010  20:33:37
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
COMPILEDAY              .EQU    015h            ; const 
COMPILEHOUR             .EQU    014h            ; const 
COMPILEMINUTE           .EQU    021h            ; const 
PROJECTBUILD            .EQU    00Ah            ; const 
OPTIMISERREV            .EQU      0300h         ; const
OPTIMISERBUILD          .EQU      0311h         ; const
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

                        .UNIT     EDL

                        .XDATASTART -1


                        ; ============ user definitions module: EDL ============

EDL.DDRBinit            .EQU    0BBh            ; const byte     187
EDL.PortBinit           .EQU    0FDh            ; const byte     253
EDL.DDRCinit            .EQU    0FCh            ; const byte     252
EDL.PortCinit           .EQU    0C3h            ; const byte     195
EDL.DDRDinit            .EQU    00Ch            ; const byte     12
EDL.PortDinit           .EQU    0FFh            ; const byte     255
EDL.BtnInPortReg        .EQU    030h            ; const byte     48
EDL.LEDOutPort          .EQU    032h            ; const byte     50
EDL.ControlBitPort      .EQU    038h            ; const byte     56
EDL.ControlBitPin       .EQU    036h            ; const byte     54
EDL.MPXPort             .EQU    035h            ; const byte     53
EDL.b_SCLK              .EQU    007h            ; const byte     7
EDL.b_SDATAOUT          .EQU    005h            ; const byte     5
EDL.b_SDATAIN1          .EQU    006h            ; const byte     6
EDL.b_STRAD16           .EQU    004h            ; const byte     4
EDL.b_STRDAC            .EQU    003h            ; const byte     3
EDL.b_ADC16sw           .EQU    001h            ; const byte     1
;Vers1Str                .EQU    '1.784 [EDL by CM'; const String
;Vers3Str                .EQU    'EDL 1.78'; const String
;FaultStrArr             .EQU    ; const Array
;ErrStrArr               .EQU    ; const Array
;MenuStrArr              .EQU    ; const Array
;ModeStrArr              .EQU    ; const Array
;AdrStr                  .EQU    'Adr '; const String
;EEnotProgrammedStr      .EQU    'EEPROM EMPTY! '; const String
;AdjustStr               .EQU    'Adj R44 '; const String
EDL.ErrSubCh            .EQU    0FFh            ; const byte     255
;CmdStrArr               .EQU    ; const Array
;Cmd2SubChArr            .EQU    ; const Array
EDL.ShuntA              .EQU    000h            ; const byte     0
EDL.ShuntB              .EQU    001h            ; const byte     1
EDL.ShuntC              .EQU    002h            ; const byte     2
EDL.ShuntD              .EQU    003h            ; const byte     3
EDL.high                .EQU    0FFh            ; const boolean  true
EDL.low                 .EQU    000h            ; const boolean  false
;IncrAccArray            .EQU    ; const Array
EDL.TemperatureMax      .EQU    046h            ; const byte     70
EDL.dummy               .EQU    00000h          ; var EEprom longint
                        .SYM      dummy, 00000h, 04005h, 3
EDL.DACIoffsets         .EQU    00004h          ; var EEprom array
                        .SYM      DACIoffsets, 00004h, 04034h, 3
EDL.DACIscales          .EQU    0000Ch          ; var EEprom array
                        .SYM      DACIscales, 0000Ch, 04036h, 3
EDL.DACRscales          .EQU    0001Ch          ; var EEprom array
                        .SYM      DACRscales, 0001Ch, 04036h, 3
EDL.ADC16UscaleLow      .EQU    00000002Ch      ; var EEprom Float
                        .SYM      ADC16UscaleLow, 0002Ch, 04006h, 3
EDL.ADC16UscaleHigh     .EQU    000000030h      ; var EEprom Float
                        .SYM      ADC16UscaleHigh, 00030h, 04006h, 3
EDL.ADCUoffsets         .EQU    00034h          ; var EEprom array
                        .SYM      ADCUoffsets, 00034h, 04034h, 3
EDL.ADCIoffsets         .EQU    00038h          ; var EEprom array
                        .SYM      ADCIoffsets, 00038h, 04034h, 3
EDL.ADCIscales          .EQU    00040h          ; var EEprom array
                        .SYM      ADCIscales, 00040h, 04036h, 3
EDL.OptionArray         .EQU    00050h          ; var EEprom array
                        .SYM      OptionArray, 00050h, 04036h, 3
EDL.InitIncRast         .EQU    0000000A8h      ; var EEprom Float
                        .SYM      InitIncRast, 000A8h, 04006h, 3
EDL.EESerBaudReg        .EQU    000ACh          ; var EEprom byte
                        .SYM      EESerBaudReg, 000ACh, 0400Dh, 3
EDL.TrackChSave         .EQU    000ADh          ; var EEprom byte
                        .SYM      TrackChSave, 000ADh, 0400Dh, 3
EDL.EETrigMask          .EQU    000AEh          ; var EEprom byte
                        .SYM      EETrigMask, 000AEh, 0400Dh, 3
EDL.EEinitialised       .EQU    000AFh          ; var EEprom word
                        .SYM      EEinitialised, 000AFh, 0400Eh, 3
EDL.EEfirstRun          .EQU    000B1h          ; var EEprom boolean
                        .SYM      EEfirstRun, 000B1h, 04003h, 3
                        .SYM      InitVolt, 00050h, 04006h, 3
EDL.InitVolt            .EQU    050h            ; var EEprom Float
                        .SYM      InitAmp, 00054h, 04006h, 3
EDL.InitAmp             .EQU    054h            ; var EEprom Float
                        .SYM      InitLowDividerU, 00058h, 04006h, 3
EDL.InitLowDividerU     .EQU    058h            ; var EEprom Float
                        .SYM      InitHiDividerU, 0005Ch, 04006h, 3
EDL.InitHiDividerU      .EQU    05Ch            ; var EEprom Float
                        .SYM      InitGainI, 00060h, 04006h, 3
EDL.InitGainI           .EQU    060h            ; var EEprom Float
                        .SYM      Uref, 00064h, 04006h, 3
EDL.Uref                .EQU    064h            ; var EEprom Float
                        .SYM      Pmax, 00068h, 04006h, 3
EDL.Pmax                .EQU    068h            ; var EEprom Float
                        .SYM      RSenseArray, 0006Ch, 04036h, 3
EDL.RSenseArray         .EQU    06Ch            ; var EEprom array
                        .SYM      ImaxArray, 0007Ch, 04036h, 3
EDL.ImaxArray           .EQU    07Ch            ; var EEprom array
                        .SYM      Imax, 00088h, 04006h, 3
EDL.Imax                .EQU    088h            ; var EEprom Float
                        .SYM      UmaxHi, 0008Ch, 04006h, 3
EDL.UmaxHi              .EQU    08Ch            ; var EEprom Float
                        .SYM      UmaxLo, 00090h, 04006h, 3
EDL.UmaxLo              .EQU    090h            ; var EEprom Float
                        .SYM      InitOptions, 00094h, 04006h, 3
EDL.InitOptions         .EQU    094h            ; var EEprom Float
                        .SYM      InitIpercent, 00098h, 04006h, 3
EDL.InitIpercent        .EQU    098h            ; var EEprom Float
                        .SYM      InitTonTime, 0009Ch, 04006h, 3
EDL.InitTonTime         .EQU    09Ch            ; var EEprom Float
                        .SYM      InitToffTime, 000A0h, 04006h, 3
EDL.InitToffTime        .EQU    0A0h            ; var EEprom Float
                        .SYM      InitFanOnTemp, 000A4h, 04006h, 3
EDL.InitFanOnTemp       .EQU    0A4h            ; var EEprom Float
                        .SYM      i, 00009h, 0000Dh, 3
EDL.i                   .EQU    009h            ; var Data   byte
                        .SYM      j, 0000Ah, 0000Dh, 3
EDL.j                   .EQU    00Ah            ; var Data   byte
                        .SYM      k, 0000Bh, 0000Dh, 3
EDL.k                   .EQU    00Bh            ; var Data   byte
                        .SYM      m, 0000Ch, 0000Dh, 3
EDL.m                   .EQU    00Ch            ; var Data   byte
                        .SYM      SlaveCh, 00275h, 0000Dh, 3
EDL.SlaveCh             .EQU    275h            ; var iData  byte
                        .SYM      ButtonTemp, 00276h, 0000Dh, 3
EDL.ButtonTemp          .EQU    276h            ; var iData  byte
                        .SYM      RangeTemp, 00277h, 0000Dh, 3
EDL.RangeTemp           .EQU    277h            ; var iData  byte
                        .SYM      ThisMeas, 00278h, 0000Ah, 3
EDL.ThisMeas            .EQU    278h            ; var iData  enum
                        .SYM      LastMeas, 00279h, 0000Ah, 3
EDL.LastMeas            .EQU    279h            ; var iData  enum
                        .SYM      NextMeas, 0027Ah, 0000Ah, 3
EDL.NextMeas            .EQU    27Ah            ; var iData  enum
                        .SYM      DACchanged, 0027Bh, 00003h, 3
EDL.DACchanged          .EQU    27Bh            ; var iData  boolean
                        .SYM      ModeSelect, 0027Ch, 0000Ah, 3
EDL.ModeSelect          .EQU    27Ch            ; var iData  enum
                        .SYM      ADCrawU, 0027Dh, 0000Eh, 3
EDL.ADCrawU             .EQU    27Dh            ; var iData  word
                        .SYM      ADCrawI, 0027Fh, 0000Eh, 3
EDL.ADCrawI             .EQU    27Fh            ; var iData  word
                        .SYM      AD16, 00281h, 0000Eh, 3
EDL.AD16                .EQU    281h            ; var iData  word
                        .SYM      AD16temp, 00283h, 0000Eh, 3
EDL.AD16temp            .EQU    283h            ; var iData  word
                        .SYM      AD16tempIon, 00285h, 0000Eh, 3
EDL.AD16tempIon         .EQU    285h            ; var iData  word
                        .SYM      AD16tempIoff, 00287h, 0000Eh, 3
EDL.AD16tempIoff        .EQU    287h            ; var iData  word
                        .SYM      AD16tempUon, 00289h, 0000Eh, 3
EDL.AD16tempUon         .EQU    289h            ; var iData  word
                        .SYM      AD16tempUoff, 0028Bh, 0000Eh, 3
EDL.AD16tempUoff        .EQU    28Bh            ; var iData  word
                        .SYM      AD16select, 0028Dh, 00003h, 3
EDL.AD16select          .EQU    28Dh            ; var iData  boolean
                        .SYM      AD10ready, 0028Eh, 00003h, 3
EDL.AD10ready           .EQU    28Eh            ; var iData  boolean
                        .SYM      AD10, 0028Fh, 00004h, 3
EDL.AD10                .EQU    28Fh            ; var iData  integer
                        .SYM      AD16long, 00291h, 00005h, 3
EDL.AD16long            .EQU    291h            ; var iData  longint
                        .SYM      Temperature, 00295h, 00006h, 3
EDL.Temperature         .EQU    295h            ; var iData  Float
                        .SYM      TemperatureExtern, 00299h, 00006h, 3
EDL.TemperatureExtern   .EQU    299h            ; var iData  Float
                        .SYM      Switchpoint, 0029Dh, 00006h, 3
EDL.Switchpoint         .EQU    29Dh            ; var iData  Float
                        .SYM      TemperatureTimer, 002A1h, 0000Dh, 3
EDL.TemperatureTimer    .EQU    2A1h            ; var iData  byte
                        .SYM      DACtemp, 002A2h, 0000Eh, 3
EDL.DACtemp             .EQU    2A2h            ; var iData  word
                        .SYM      DACtempOn, 002A4h, 0000Eh, 3
EDL.DACtempOn           .EQU    2A4h            ; var iData  word
                        .SYM      DACtempOff, 002A6h, 0000Eh, 3
EDL.DACtempOff          .EQU    2A6h            ; var iData  word
                        .SYM      ADCtemp, 002A8h, 0000Eh, 3
EDL.ADCtemp             .EQU    2A8h            ; var iData  word
                        .SYM      I2CslaveAdr, 002AAh, 0000Dh, 3
EDL.I2CslaveAdr         .EQU    2AAh            ; var iData  byte
                        .SYM      DCAmp, 002ABh, 00006h, 3
EDL.DCAmp               .EQU    2ABh            ; var iData  Float
                        .SYM      DCohm, 002AFh, 00006h, 3
EDL.DCohm               .EQU    2AFh            ; var iData  Float
                        .SYM      DCAmpMod, 002B3h, 00006h, 3
EDL.DCAmpMod            .EQU    2B3h            ; var iData  Float
                        .SYM      DCohmMin, 002B7h, 00006h, 3
EDL.DCohmMin            .EQU    2B7h            ; var iData  Float
                        .SYM      DCohmMax, 002BBh, 00006h, 3
EDL.DCohmMax            .EQU    2BBh            ; var iData  Float
                        .SYM      DCWatt, 002BFh, 00006h, 3
EDL.DCWatt              .EQU    2BFh            ; var iData  Float
                        .SYM      DCVolt, 002C3h, 00006h, 3
EDL.DCVolt              .EQU    2C3h            ; var iData  Float
                        .SYM      Pon, 002C7h, 00006h, 3
EDL.Pon                 .EQU    2C7h            ; var iData  Float
                        .SYM      Poff, 002CBh, 00006h, 3
EDL.Poff                .EQU    2CBh            ; var iData  Float
                        .SYM      Ptot, 002CFh, 00006h, 3
EDL.Ptot                .EQU    2CFh            ; var iData  Float
                        .SYM      Psoa, 002D3h, 00006h, 3
EDL.Psoa                .EQU    2D3h            ; var iData  Float
                        .SYM      DividerU, 002D7h, 00006h, 3
EDL.DividerU            .EQU    2D7h            ; var iData  Float
                        .SYM      IntegrateCounter, 002DBh, 0000Dh, 3
EDL.IntegrateCounter    .EQU    2DBh            ; var iData  byte
                        .SYM      Ipercent, 002DCh, 00004h, 3
EDL.Ipercent            .EQU    2DCh            ; var iData  integer
                        .SYM      PWonTime, 002DEh, 00004h, 3
EDL.PWonTime            .EQU    2DEh            ; var iData  integer
                        .SYM      PWoffTime, 002E0h, 00004h, 3
EDL.PWoffTime           .EQU    2E0h            ; var iData  integer
                        .SYM      PWcounter, 002E2h, 00004h, 3
EDL.PWcounter           .EQU    2E2h            ; var iData  integer
                        .SYM      PWonOff, 002E4h, 00003h, 3
EDL.PWonOff             .EQU    2E4h            ; var iData  boolean
                        .SYM      ShuntRange, 002E5h, 0000Dh, 3
EDL.ShuntRange          .EQU    2E5h            ; var iData  byte
                        .SYM      DACLSBIarray, 002E6h, 00036h, 3
EDL.DACLSBIarray        .EQU    2E6h            ; var iData  array
                        .SYM      DACLSBRarray, 002F6h, 00036h, 3
EDL.DACLSBRarray        .EQU    2F6h            ; var iData  array
                        .SYM      ADC16LSBU, 00306h, 00006h, 3
EDL.ADC16LSBU           .EQU    306h            ; var iData  Float
                        .SYM      ADC10LSBU, 0030Ah, 00006h, 3
EDL.ADC10LSBU           .EQU    30Ah            ; var iData  Float
                        .SYM      ADC16LSBIarray, 0030Eh, 00036h, 3
EDL.ADC16LSBIarray      .EQU    30Eh            ; var iData  array
                        .SYM      ADC10LSBIarray, 0031Eh, 00036h, 3
EDL.ADC10LSBIarray      .EQU    31Eh            ; var iData  array
                        .SYM      ADCUoffset, 0032Eh, 00004h, 3
EDL.ADCUoffset          .EQU    32Eh            ; var iData  integer
                        .SYM      Options, 00330h, 0000Dh, 3
EDL.Options             .EQU    330h            ; var iData  byte
                        .SYM      DACtype, 00331h, 0000Ah, 3
EDL.DACtype             .EQU    331h            ; var iData  enum
                        .SYM      DACmax, 00332h, 00005h, 3
EDL.DACmax              .EQU    332h            ; var iData  longint
                        .SYM      CmdWhich, 00336h, 0000Ah, 3
EDL.CmdWhich            .EQU    336h            ; var iData  enum
                        .SYM      SubCh, 00337h, 0000Dh, 3
EDL.SubCh               .EQU    337h            ; var iData  byte
                        .SYM      CurrentCh, 00338h, 0000Dh, 3
EDL.CurrentCh           .EQU    338h            ; var iData  byte
                        .SYM      NegativeFlag, 00339h, 00003h, 3
EDL.NegativeFlag        .EQU    339h            ; var iData  boolean
                        .SYM      OmniFlag, 0033Ah, 00003h, 3
EDL.OmniFlag            .EQU    33Ah            ; var iData  boolean
                        .SYM      verbose, 0033Bh, 00003h, 3
EDL.verbose             .EQU    33Bh            ; var iData  boolean
                        .SYM      Param, 0033Ch, 00006h, 3
EDL.Param               .EQU    33Ch            ; var iData  Float
                        .SYM      ParamInt, 00340h, 00004h, 3
EDL.ParamInt            .EQU    340h            ; var iData  integer
                        .SYM      ParamByte, 00342h, 0000Dh, 3
EDL.ParamByte           .EQU    342h            ; var iData  byte
EDL.SerInpStr           .EQU    343h            ; var iData  string
                        .SYM      SerInpStr, 00343h, 0303Ch, 3
                        .SYM      SerInpPtr, 00383h, 0000Dh, 3
EDL.SerInpPtr           .EQU    383h            ; var iData  byte
                        .SYM      Prefix, 00384h, 0000Ch, 3
EDL.Prefix              .EQU    384h            ; var iData  char
                        .SYM      ShuntSelect, 00385h, 0000Dh, 3
EDL.ShuntSelect         .EQU    385h            ; var iData  byte
                        .SYM      OldShuntSelect, 00386h, 0000Dh, 3
EDL.OldShuntSelect      .EQU    386h            ; var iData  byte
                        .SYM      IAutoRange, 00387h, 0000Dh, 3
EDL.IAutoRange          .EQU    387h            ; var iData  byte
EDL.DisplayTimer        .EQU    388h            ; var iData  word
                        .SYM      DisplayTimer, 00388h, 0000Eh, 3
                        .SYM      DisplayToggle, 0038Ah, 0000Dh, 3
EDL.DisplayToggle       .EQU    38Ah            ; var iData  byte
EDL.ActivityTimer       .EQU    38Bh            ; var iData  byte
                        .SYM      ActivityTimer, 0038Bh, 0000Dh, 3
EDL.IncrTimer           .EQU    38Ch            ; var iData  byte
                        .SYM      IncrTimer, 0038Ch, 0000Dh, 3
EDL.IntegrateTimer      .EQU    38Dh            ; var iData  byte
                        .SYM      IntegrateTimer, 0038Dh, 0000Dh, 3
                        .SYM      FaultTimer, 0038Eh, 0000Dh, 3
EDL.FaultTimer          .EQU    38Eh            ; var iData  byte
                        .SYM      ToggleTimer, 0038Fh, 0000Dh, 3
EDL.ToggleTimer         .EQU    38Fh            ; var iData  byte
                        .SYM      NoToggle, 00390h, 00003h, 3
EDL.NoToggle            .EQU    390h            ; var iData  boolean
                        .SYM      LCDpresent, 00391h, 00003h, 3
EDL.LCDpresent          .EQU    391h            ; var iData  boolean
                        .SYM      Modify, 00392h, 0000Ah, 3
EDL.Modify              .EQU    392h            ; var iData  enum
                        .SYM      TrackChannel, 00393h, 0000Dh, 3
EDL.TrackChannel        .EQU    393h            ; var iData  byte
                        .SYM      IncrValue, 00394h, 00005h, 3
EDL.IncrValue           .EQU    394h            ; var iData  longint
                        .SYM      OldIncrValue, 00398h, 00005h, 3
EDL.OldIncrValue        .EQU    398h            ; var iData  longint
                        .SYM      IncrFine, 0039Ch, 00003h, 3
EDL.IncrFine            .EQU    39Ch            ; var iData  boolean
                        .SYM      FirstTurn, 0039Dh, 00003h, 3
EDL.FirstTurn           .EQU    39Dh            ; var iData  boolean
                        .SYM      IncrAccFloat, 0039Eh, 00006h, 3
EDL.IncrAccFloat        .EQU    39Eh            ; var iData  Float
                        .SYM      IncFineDiv, 003A2h, 00006h, 3
EDL.IncFineDiv          .EQU    3A2h            ; var iData  Float
                        .SYM      IncCoarseDiv, 003A6h, 00006h, 3
EDL.IncCoarseDiv        .EQU    3A6h            ; var iData  Float
                        .SYM      IncrDiff, 003AAh, 00004h, 3
EDL.IncrDiff            .EQU    3AAh            ; var iData  integer
                        .SYM      IncrAccInt10, 003ACh, 00004h, 3
EDL.IncrAccInt10        .EQU    3ACh            ; var iData  integer
                        .SYM      IncRast, 003AEh, 00004h, 3
EDL.IncRast             .EQU    3AEh            ; var iData  integer
                        .SYM      IncrDiffByte, 003B0h, 0000Dh, 3
EDL.IncrDiffByte        .EQU    3B0h            ; var iData  byte
                        .SYM      Autorepeat, 003B1h, 0000Dh, 3
EDL.Autorepeat          .EQU    3B1h            ; var iData  byte
                        .SYM      digits, 003B2h, 0000Dh, 3
EDL.digits              .EQU    3B2h            ; var iData  byte
                        .SYM      nachkomma, 003B3h, 0000Dh, 3
EDL.nachkomma           .EQU    3B3h            ; var iData  byte
                        .SYM      ChangedFlag, 003B4h, 00003h, 3
EDL.ChangedFlag         .EQU    3B4h            ; var iData  boolean
                        .SYM      TempF, 003B5h, 00006h, 3
EDL.TempF               .EQU    3B5h            ; var iData  Float
                        .SYM      TempRI, 003B9h, 00004h, 3
EDL.TempRI              .EQU    3B9h            ; var iData  integer
EDL.ParamStr            .EQU    3BBh            ; var iData  string
                        .SYM      ParamStr, 003BBh, 0303Ch, 3
                        .SYM      Status, 003E4h, 0000Dh, 3
EDL.Status              .EQU    3E4h            ; var iData  byte
                        .SYM      FaultFlags, 003E5h, 0000Dh, 3
EDL.FaultFlags          .EQU    3E5h            ; var iData  byte
                        .SYM      ButtonNumber, 003E6h, 0000Dh, 3
EDL.ButtonNumber        .EQU    3E6h            ; var iData  byte
                        .SYM      FaultTimerByte, 003E7h, 0000Dh, 3
EDL.FaultTimerByte      .EQU    3E7h            ; var iData  byte
                        .SYM      ErrCount, 003E8h, 00004h, 3
EDL.ErrCount            .EQU    3E8h            ; var iData  integer
                        .SYM      ErrFlag, 003EAh, 00003h, 3
EDL.ErrFlag             .EQU    3EAh            ; var iData  boolean
                        .SYM      CheckLimitErr, 003EBh, 0000Ah, 3
EDL.CheckLimitErr       .EQU    3EBh            ; var iData  enum
                        .SYM      OutputEnable, 003ECh, 00003h, 3
EDL.OutputEnable        .EQU    3ECh            ; var iData  boolean
                        .SYM      TrigMask, 003EDh, 0000Dh, 3
EDL.TrigMask            .EQU    3EDh            ; var iData  byte
                        .SYM      TrigOffSema, 003EEh, 00003h, 3
EDL.TrigOffSema         .EQU    3EEh            ; var iData  boolean
                        .SYM      TrigOnSema, 003EFh, 00003h, 3
EDL.TrigOnSema          .EQU    3EFh            ; var iData  boolean
                        .SYM      RModeON, 003F0h, 00003h, 3
EDL.RModeON             .EQU    3F0h            ; var iData  boolean
                        .SYM      IModeON, 003F1h, 00003h, 3
EDL.IModeON             .EQU    3F1h            ; var iData  boolean
                        .SYM      PModeOn, 003F2h, 00003h, 3
EDL.PModeOn             .EQU    3F2h            ; var iData  boolean
                        .SYM      Wh, 003F3h, 00006h, 3
EDL.Wh                  .EQU    3F3h            ; var iData  Float
                        .SYM      Ah, 003F7h, 00006h, 3
EDL.Ah                  .EQU    3F7h            ; var iData  Float
                        .SYM      CurrAmp, 003FBh, 00006h, 3
EDL.CurrAmp             .EQU    3FBh            ; var iData  Float
                        .SYM      CurrVolt, 003FFh, 00006h, 3
EDL.CurrVolt            .EQU    3FFh            ; var iData  Float

                        .FILE     EDL-HW.pas
                        .FUNC     ShiftOut8501, 00003h, 00020h
EDL.ShiftOut8501:
                        .RETURNS   0
                        .BLOCK    5
                        .ASM
                        .LINE     7
                        sbi  EDL.ControlBitPort, EDL.b_SCLK
                        .LINE     8
                        cbi  EDL.ControlBitPort, EDL.b_SDATAOUT
                        .LINE     9
                        cbi  EDL.ControlBitPort, EDL.b_STRDAC
                        .LINE     11
                        ldi  _ACCB, 8
                        EDL.8501loop0:  ; acht Nullen rausschieben, für PowerDown OFF
                        .LINE     13
                        cbi  EDL.ControlBitPort, EDL.b_SCLK
                        .LINE     14
                        nop
                        .LINE     15
                        sbi  EDL.ControlBitPort, EDL.b_SCLK
                        .LINE     16
                        dec  _ACCB
                        .LINE     17
                        BRNE EDL.8501loop0
                        .LINE     19
                        LDS  _ACCA, EDL.DACtemp+1 ; MSB linksbündig
                        .LINE     20
                        ldi  _ACCB, 8 ; 8 Bits ohne Load
                        EDL.8501loop1:
                        .LINE     23
                        sbrc _ACCA,7 // Bit high?
                        .LINE     24
                        sbi  EDL.ControlBitPort, EDL.b_SDATAOUT
                        .LINE     25
                        cbi  EDL.ControlBitPort, EDL.b_SCLK
                        .LINE     26
                        LSL  _ACCA
                        .LINE     27
                        cbi  EDL.ControlBitPort, EDL.b_SDATAOUT
                        .LINE     28
                        sbi  EDL.ControlBitPort, EDL.b_SCLK
                        .LINE     29
                        dec _ACCB
                        .LINE     30
                        BRNE EDL.8501loop1
                        .LINE     32
                        LDS _ACCA, EDL.DACtemp         ; LSB Level zuletzt
                        .LINE     33
                        ldi  _ACCB, 8 ; 8 Bits ohne Load
                        EDL.8501loop2:
                        .LINE     36
                        sbrc _ACCA,7 // Bit high?
                        .LINE     37
                        sbi  EDL.ControlBitPort, EDL.b_SDATAOUT
                        .LINE     38
                        cbi  EDL.ControlBitPort, EDL.b_SCLK
                        .LINE     39
                        LSL  _ACCA
                        .LINE     40
                        cbi  EDL.ControlBitPort, EDL.b_SDATAOUT
                        .LINE     41
                        sbi  EDL.ControlBitPort, EDL.b_SCLK
                        .LINE     42
                        dec  _ACCB
                        .LINE     43
                        BRNE EDL.8501loop2
                        .LINE     44
                        cbi  EDL.ControlBitPort, EDL.b_SCLK
                        .LINE     45
                        sbi  EDL.ControlBitPort, EDL.b_STRDAC
                        .endasm
                        .ENDBLOCK 47
                        .LINE     47
                        .BRANCH   19
                        RET
                        .ENDFUNC  47

                        .FUNC     ShiftOut5452, 00031h, 00020h
EDL.ShiftOut5452:
                        .RETURNS   0
                        .BLOCK    51
                        .ASM
                        .LINE     53
                        cbi  EDL.ControlBitPort, EDL.b_SDATAOUT
                        .LINE     54
                        cbi  EDL.ControlBitPort, EDL.b_SCLK
                        .LINE     55
                        cbi  EDL.ControlBitPort, EDL.b_STRDAC
                        .LINE     57
                        LDS _ACCA, EDL.DACtemp+1 ; MSB linksbündig
                        .LINE     58
                        sbi  EDL.ControlBitPort, EDL.b_SCLK ; 2 Control-Bits auf 0, Default falling edge
                        .LINE     59
                        cbi  EDL.ControlBitPort, EDL.b_SCLK
                        .LINE     60
                        sbi  EDL.ControlBitPort, EDL.b_SCLK ; 2 Control-Bits auf 0, Default falling edge
                        .LINE     61
                        cbi  EDL.ControlBitPort, EDL.b_SCLK
                        .LINE     62
                        ldi  _ACCB, 4
                        EDL.5452loop1:
                        .LINE     65
                        sbrc _ACCA,3 // Bit high?
                        .LINE     66
                        sbi  EDL.ControlBitPort, EDL.b_SDATAOUT
                        .LINE     67
                        sbrs _ACCA,3 // Bit low?
                        .LINE     68
                        cbi  EDL.ControlBitPort, EDL.b_SDATAOUT
                        .LINE     69
                        sbi  EDL.ControlBitPort, EDL.b_SCLK
                        .LINE     70
                        LSL  _ACCA
                        .LINE     71
                        cbi  EDL.ControlBitPort, EDL.b_SCLK
                        .LINE     72
                        dec _ACCB
                        .LINE     73
                        BRNE  EDL.5452loop1
                        .LINE     75
                        LDS _ACCA, EDL.DACtemp         ; LSB Level zuletzt
                        .LINE     76
                        ldi  _ACCB, 8 ; 8 Bits
                        EDL.5452loop2:
                        .LINE     79
                        sbrc _ACCA,7 // Bit high?
                        .LINE     80
                        sbi  EDL.ControlBitPort, EDL.b_SDATAOUT
                        .LINE     81
                        sbrs _ACCA,7 // Bit low?
                        .LINE     82
                        cbi  EDL.ControlBitPort, EDL.b_SDATAOUT
                        .LINE     83
                        sbi  EDL.ControlBitPort, EDL.b_SCLK
                        .LINE     84
                        LSL  _ACCA
                        .LINE     85
                        cbi  EDL.ControlBitPort, EDL.b_SCLK
                        .LINE     86
                        dec _ACCB
                        .LINE     87
                        BRNE  EDL.5452loop2
                        .LINE     88
                        sbi  EDL.ControlBitPort, EDL.b_SCLK ; noch zwei Füll-Bits (ignored)
                        .LINE     89
                        cbi  EDL.ControlBitPort, EDL.b_SCLK
                        .LINE     90
                        sbi  EDL.ControlBitPort, EDL.b_SCLK
                        .LINE     91
                        cbi  EDL.ControlBitPort, EDL.b_SCLK
                        .LINE     92
                        sbi  EDL.ControlBitPort, EDL.b_STRDAC
                        .endasm
                        .ENDBLOCK 94
                        .LINE     94
                        .BRANCH   19
                        RET
                        .ENDFUNC  94

                        .FUNC     ShiftOut8043, 00060h, 00020h
EDL.ShiftOut8043:
                        .RETURNS   0
                        .BLOCK    100
                        .ASM
                        .LINE     102
                        cbi  EDL.ControlBitPort, EDL.b_SDATAOUT
                        .LINE     103
                        cbi  EDL.ControlBitPort, EDL.b_SCLK
                        .LINE     105
                        LDS _ACCA, EDL.DACtemp+1 ; MSB linksbündig
                        .LINE     106
                        ldi  _ACCB, 4
                        EDL.8043loop1:
                        .LINE     109
                        sbrc _ACCA,3 // Bit high?
                        .LINE     110
                        sbi  EDL.ControlBitPort, EDL.b_SDATAOUT
                        .LINE     111
                        sbrs _ACCA,3 // Bit low?
                        .LINE     112
                        cbi  EDL.ControlBitPort, EDL.b_SDATAOUT
                        .LINE     113
                        sbi  EDL.ControlBitPort, EDL.b_SCLK
                        .LINE     114
                        LSL  _ACCA
                        .LINE     115
                        cbi  EDL.ControlBitPort, EDL.b_SCLK
                        .LINE     116
                        dec _ACCB
                        .LINE     117
                        BRNE  EDL.8043loop1
                        .LINE     119
                        LDS _ACCA, EDL.DACtemp         ; LSB Level zuletzt
                        .LINE     120
                        ldi  _ACCB, 7 ; 7 Bits
                        EDL.8043loop2:
                        .LINE     123
                        sbrc _ACCA,7 // Bit high?
                        .LINE     124
                        sbi  EDL.ControlBitPort, EDL.b_SDATAOUT
                        .LINE     125
                        sbrs _ACCA,7 // Bit low?
                        .LINE     126
                        cbi  EDL.ControlBitPort, EDL.b_SDATAOUT
                        .LINE     127
                        sbi  EDL.ControlBitPort, EDL.b_SCLK
                        .LINE     128
                        LSL  _ACCA
                        .LINE     129
                        cbi  EDL.ControlBitPort, EDL.b_SCLK
                        .LINE     130
                        dec _ACCB
                        .LINE     131
                        BRNE  EDL.8043loop2
                        .LINE     132
                        sbrc _ACCA,7 // Bit high?
                        .LINE     133
                        sbi  EDL.ControlBitPort, EDL.b_SDATAOUT
                        .LINE     134
                        sbrs _ACCA,7 // Bit low?
                        .LINE     135
                        cbi  EDL.ControlBitPort, EDL.b_SDATAOUT
                        .LINE     136
                        sbi  EDL.ControlBitPort, EDL.b_SCLK
                        .LINE     137
                        cbi  EDL.ControlBitPort, EDL.b_STRDAC ; Load-Impuls
                        .LINE     138
                        cbi  EDL.ControlBitPort, EDL.b_SCLK
                        .LINE     139
                        sbi  EDL.ControlBitPort, EDL.b_STRDAC
                        .endasm
                        .ENDBLOCK 141
                        .LINE     141
                        .BRANCH   19
                        RET
                        .ENDFUNC  141

                        .FUNC     ShiftOut8811, 00090h, 00020h
EDL.ShiftOut8811:
                        .RETURNS   0
                        .BLOCK    147
                        .ASM
                        .LINE     149
                        cbi  EDL.ControlBitPort, EDL.b_SDATAOUT
                        .LINE     150
                        cbi  EDL.ControlBitPort, EDL.b_SCLK
                        .LINE     151
                        cbi  EDL.ControlBitPort, EDL.b_STRDAC ; Load-Impuls
                        .LINE     153
                        LDS _ACCA, EDL.DACtemp+1 ; MSB linksbündig
                        .LINE     154
                        ldi  _ACCB, 8
                        EDL.8811loop1:
                        .LINE     157
                        sbrc _ACCA,7 // Bit high?
                        .LINE     158
                        sbi  EDL.ControlBitPort, EDL.b_SDATAOUT
                        .LINE     159
                        sbrs _ACCA,7 // Bit low?
                        .LINE     160
                        cbi  EDL.ControlBitPort, EDL.b_SDATAOUT
                        .LINE     161
                        sbi  EDL.ControlBitPort, EDL.b_SCLK
                        .LINE     162
                        LSL  _ACCA
                        .LINE     163
                        cbi  EDL.ControlBitPort, EDL.b_SCLK
                        .LINE     164
                        dec _ACCB
                        .LINE     165
                        BRNE  EDL.8811loop1
                        .LINE     167
                        LDS _ACCA, EDL.DACtemp         ; LSB Level zuletzt
                        .LINE     168
                        ldi  _ACCB, 8 ; 8 Bits
                        EDL.8811loop2:
                        .LINE     171
                        sbrc _ACCA,7 // Bit high?
                        .LINE     172
                        sbi  EDL.ControlBitPort, EDL.b_SDATAOUT
                        .LINE     173
                        sbrs _ACCA,7 // Bit low?
                        .LINE     174
                        cbi  EDL.ControlBitPort, EDL.b_SDATAOUT
                        .LINE     175
                        sbi  EDL.ControlBitPort, EDL.b_SCLK
                        .LINE     176
                        LSL  _ACCA
                        .LINE     177
                        cbi  EDL.ControlBitPort, EDL.b_SCLK
                        .LINE     178
                        dec _ACCB
                        .LINE     179
                        BRNE  EDL.8811loop2
                        .LINE     180
                        cbi  EDL.ControlBitPort, EDL.b_SCLK
                        .LINE     181
                        sbi  EDL.ControlBitPort, EDL.b_STRDAC
                        .endasm
                        .ENDBLOCK 183
                        .LINE     183
                        .BRANCH   19
                        RET
                        .ENDFUNC  183


                        .FUNC     ShiftIn1864, 000E5h, 00020h
EDL.ShiftIn1864:
                        .RETURNS   0
                        .BLOCK    231
                        .ASM
                        .LINE     233
                        cbi  EDL.ControlBitPort, EDL.b_SCLK
                        .LINE     234
                        cbi  EDL.ControlBitPort, EDL.b_STRAD16
                        .LINE     235
                        ldi  _ACCB, 8 ; 8 Bits
                        .LINE     236
                        nop
                        .LINE     237
                        nop
                        .LINE     238
                        nop
                        EDL.1864loop1:
                        .LINE     240
                        clc
                        .LINE     241
                        sbi  EDL.ControlBitPort, EDL.b_SCLK
                        .LINE     242
                        sbic EDL.ControlBitPin, EDL.b_SDATAIN1 // Bit gesetzt?
                        .LINE     243
                        sec
                        .LINE     244
                        cbi  EDL.ControlBitPort, EDL.b_SCLK
                        .LINE     245
                        rol _ACCA  // Carry-Bit einschieben
                        .LINE     246
                        dec _ACCB
                        .LINE     247
                        BRNE  EDL.1864loop1
                        .LINE     248
                        sts EDL.AD16temp+1,_ACCA; Hi Byte vom Integer
                        .LINE     249
                        ldi  _ACCB, 8 ; 8 Bits
                        EDL.1864loop2:
                        .LINE     251
                        clc
                        .LINE     252
                        sbi  EDL.ControlBitPort, EDL.b_SCLK
                        .LINE     253
                        sbic EDL.ControlBitPin, EDL.b_SDATAIN1 // Bit gesetzt?
                        .LINE     254
                        sec
                        .LINE     255
                        cbi  EDL.ControlBitPort, EDL.b_SCLK
                        .LINE     256
                        rol _ACCA
                        .LINE     257
                        dec _ACCB
                        .LINE     258
                        BRNE  EDL.1864loop2
                        .LINE     259
                        sts EDL.AD16temp,_ACCA; Low Byte vom Integer
                        .LINE     260
                        sbi  EDL.ControlBitPort, EDL.b_STRAD16  // nächste ADC-Wandlung freigeben
                        .LINE     261
                        cbi  EDL.ControlBitPort, EDL.b_SCLK
                        .endasm
                        .ENDBLOCK 263
                        .LINE     263
                        .BRANCH   19
                        RET
                        .ENDFUNC  263

                        .FUNC     OnSysTick, 0010Ah, 00020h
EDL.OnSysTick:
                        .RETURNS   0
                        .BLOCK    268
                        .LINE     269
                        .BRANCH   17,EDL.SHIFTIN1864
                        RCALL     EDL.SHIFTIN1864
                        .LINE     270
                        LDS       _ACCBLO, EDL.PWcounter
                        LDS       _ACCBHI, EDL.PWcounter+1
                        SBIW      _ACCBLO, 1
                        STS       EDL.PWcounter, _ACCBLO
                        STS       EDL.PWcounter+1, _ACCBHI
                        .LINE     271
                        LDS       _ACCB, EDL.PWoffTime
                        LDS       _ACCA, EDL.PWoffTime+1
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        CPI       _ACCA, 080h
                        BRNE      EDL._L0000
                        CPI       _ACCB, 000h
EDL._L0000:
                        .BRANCH   4, EDL._L0002
                        BRNE      EDL._L0002
                        .BLOCK    271
                        .LINE     272
                        LDI       _ACCA, 0FFh
                        STS       EDL.PWONOFF, _ACCA
                        .ENDBLOCK 273
EDL._L0002:
                        .LINE     274
                        CLR       _ACCA
                        SBIC      036h, 002h
                        SER       _ACCA
                        COM       _ACCA
                        PUSH      _ACCA
                        LDS       _ACCB, 003EDh
                        CLR       _ACCA
                        SBRC      _ACCB, 000h
                        SER       _ACCA
                        POP       _ACCB
                        AND       _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   3, EDL._L0005
                        BREQ      EDL._L0005
                        .BLOCK    275
                        .LINE     275
                        LDI       _ACCA, 000h
                        STS       EDL.PWONOFF, _ACCA
                        .ENDBLOCK 276
EDL._L0005:
                        .LINE     277
                        LDS       _ACCA, EDL.PWonOff
                        TST       _ACCA
                        .BRANCH   4,EDL._L0010
                        BRNE      EDL._L0010
                        .BRANCH   20,EDL._L0008
                        RJMP      EDL._L0008
EDL._L0010:
                        .BLOCK    278
                        .LINE     278
                        SBI       00035h, 007h
                        .LINE     279
                        LDS       _ACCB, 003E4h
                        SBRS      _ACCB, 005h
                        .BRANCH   20,EDL._L0011
                        RJMP      EDL._L0011
                        .BLOCK    279
                        .LINE     280
                        LDI       _ACCA, 00000h SHRB 8
                        LDI       _ACCB, 00000h AND 0FFh
                        .BRANCH   20, _CSE0000
                        RJMP      _CSE0000
                        .ENDBLOCK 281
EDL._L0011:
                        .BLOCK    281
                        .LINE     282
                        LDS       _ACCB, EDL.DACtempOn
                        LDS       _ACCA, EDL.DACtempOn+1
_CSE0000:                         
                        STS       EDL.DACTEMP, _ACCB
                        STS       EDL.DACTEMP+1, _ACCA
                        .ENDBLOCK 283
                        .LINE     284
                        LDS       _ACCA, EDL.DACtype
                        .LINE     285
                        CPI       _ACCA, 0
                        .BRANCH   4, EDL._L0016
                        BRNE      EDL._L0016
                        .BLOCK    286
                        .LINE     286
                        .BRANCH   17,EDL.SHIFTOUT8043
                        RCALL     EDL.SHIFTOUT8043
                        .ENDBLOCK 287
                        .BRANCH   20,EDL._L0014
                        RJMP      EDL._L0014
EDL._L0016:
                        .LINE     289
                        CPI       _ACCA, 1
                        .BRANCH   4, EDL._L0019
                        BRNE      EDL._L0019
                        .BLOCK    290
                        .LINE     290
                        .BRANCH   17,EDL.SHIFTOUT5452
                        RCALL     EDL.SHIFTOUT5452
                        .ENDBLOCK 291
                        .BRANCH   20,EDL._L0014
                        RJMP      EDL._L0014
EDL._L0019:
                        .LINE     292
                        CPI       _ACCA, 2
                        .BRANCH   4, EDL._L0022
                        BRNE      EDL._L0022
                        .BLOCK    293
                        .LINE     293
                        .BRANCH   17,EDL.SHIFTOUT8501
                        RCALL     EDL.SHIFTOUT8501
                        .ENDBLOCK 294
                        .BRANCH   20,EDL._L0014
                        RJMP      EDL._L0014
EDL._L0022:
                        .LINE     295
                        CPI       _ACCA, 3
                        .BRANCH   4, EDL._L0025
                        BRNE      EDL._L0025
                        .BLOCK    296
                        .LINE     296
                        .BRANCH   17,EDL.SHIFTOUT8811
                        RCALL     EDL.SHIFTOUT8811
                        .ENDBLOCK 297
EDL._L0025:
EDL._L0014:
                        .LINE     299
                        LDS       _ACCB, EDL.PWcounter
                        LDS       _ACCA, EDL.PWcounter+1
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        CPI       _ACCA, 080h
                        BRNE      EDL._L0027
                        CPI       _ACCB, 000h
EDL._L0027:
                        .BRANCH   1, EDL._L0031
                        BRLO      EDL._L0031
                        .BRANCH   4, EDL._L0029
                        BRNE      EDL._L0029
EDL._L0031:
                        .BLOCK    299
                        .LINE     300
                        LDS       _ACCA, EDL.AD16select
                        COM       _ACCA
                        STS       EDL.AD16SELECT, _ACCA
                        .LINE     301
                        CLT
                        TST       _ACCA
                        BREQ      EDL._L0032
                        SET
EDL._L0032:
                        IN        _ACCA, 00038h
                        BLD       _ACCA, 001h
                        OUT       00038h, _ACCA
                        .LINE     302
                        LDI       _ACCA, 000h
                        STS       EDL.PWONOFF, _ACCA
                        .LINE     303
                        LDS       _ACCB, EDL.PWoffTime
                        LDS       _ACCA, EDL.PWoffTime+1
                        STS       EDL.PWCOUNTER, _ACCB
                        STS       EDL.PWCOUNTER+1, _ACCA
                        .ENDBLOCK 304
EDL._L0029:
                        .LINE     305
                        LDS       _ACCA, EDL.AD16select
                        TST       _ACCA
                        .BRANCH   3, EDL._L0033
                        BREQ      EDL._L0033
                        .BLOCK    305
                        .LINE     306
                        LDI       _ACCA, 002h
                        .BRANCH   20, _CSE0001
                        RJMP      _CSE0001
                        .ENDBLOCK 307
EDL._L0033:
                        .BLOCK    307
                        .LINE     308
                        LDI       _ACCA, 003h
_CSE0001:                         
                        STS       EDL.NEXTMEAS, _ACCA
                        .ENDBLOCK 309
                        .ENDBLOCK 310
                        .BRANCH   20,EDL._L0009
                        RJMP      EDL._L0009
EDL._L0008:
                        .BLOCK    310
                        .LINE     311
                        CBI       00035h, 007h
                        .LINE     312
                        LDS       _ACCB, 003E4h
                        SBRS      _ACCB, 005h
                        .BRANCH   20,EDL._L0036
                        RJMP      EDL._L0036
                        .BLOCK    312
                        .LINE     313
                        LDI       _ACCA, 00000h SHRB 8
                        LDI       _ACCB, 00000h AND 0FFh
                        .BRANCH   20, _CSE0002
                        RJMP      _CSE0002
                        .ENDBLOCK 314
EDL._L0036:
                        .BLOCK    314
                        .LINE     315
                        LDS       _ACCB, EDL.DACtempOff
                        LDS       _ACCA, EDL.DACtempOff+1
_CSE0002:                         
                        STS       EDL.DACTEMP, _ACCB
                        STS       EDL.DACTEMP+1, _ACCA
                        .ENDBLOCK 316
                        .LINE     317
                        LDS       _ACCA, EDL.DACtype
                        .LINE     318
                        CPI       _ACCA, 0
                        .BRANCH   4, EDL._L0041
                        BRNE      EDL._L0041
                        .BLOCK    319
                        .LINE     319
                        .BRANCH   17,EDL.SHIFTOUT8043
                        RCALL     EDL.SHIFTOUT8043
                        .ENDBLOCK 320
                        .BRANCH   20,EDL._L0039
                        RJMP      EDL._L0039
EDL._L0041:
                        .LINE     322
                        CPI       _ACCA, 1
                        .BRANCH   4, EDL._L0044
                        BRNE      EDL._L0044
                        .BLOCK    323
                        .LINE     323
                        .BRANCH   17,EDL.SHIFTOUT5452
                        RCALL     EDL.SHIFTOUT5452
                        .ENDBLOCK 324
                        .BRANCH   20,EDL._L0039
                        RJMP      EDL._L0039
EDL._L0044:
                        .LINE     325
                        CPI       _ACCA, 2
                        .BRANCH   4, EDL._L0047
                        BRNE      EDL._L0047
                        .BLOCK    326
                        .LINE     326
                        .BRANCH   17,EDL.SHIFTOUT8501
                        RCALL     EDL.SHIFTOUT8501
                        .ENDBLOCK 327
                        .BRANCH   20,EDL._L0039
                        RJMP      EDL._L0039
EDL._L0047:
                        .LINE     328
                        CPI       _ACCA, 3
                        .BRANCH   4, EDL._L0050
                        BRNE      EDL._L0050
                        .BLOCK    329
                        .LINE     329
                        .BRANCH   17,EDL.SHIFTOUT8811
                        RCALL     EDL.SHIFTOUT8811
                        .ENDBLOCK 330
EDL._L0050:
EDL._L0039:
                        .LINE     332
                        LDS       _ACCB, EDL.PWcounter
                        LDS       _ACCA, EDL.PWcounter+1
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        CPI       _ACCA, 080h
                        BRNE      EDL._L0052
                        CPI       _ACCB, 000h
EDL._L0052:
                        .BRANCH   1, EDL._L0056
                        BRLO      EDL._L0056
                        .BRANCH   4, EDL._L0054
                        BRNE      EDL._L0054
EDL._L0056:
                        .BLOCK    332
                        .LINE     333
                        LDS       _ACCA, EDL.AD16select
                        COM       _ACCA
                        STS       EDL.AD16SELECT, _ACCA
                        .LINE     334
                        CLT
                        TST       _ACCA
                        BREQ      EDL._L0057
                        SET
EDL._L0057:
                        IN        _ACCA, 00038h
                        BLD       _ACCA, 001h
                        OUT       00038h, _ACCA
                        .LINE     335
                        LDI       _ACCA, 0FFh
                        STS       EDL.PWONOFF, _ACCA
                        .LINE     336
                        LDS       _ACCB, EDL.PWonTime
                        LDS       _ACCA, EDL.PWonTime+1
                        STS       EDL.PWCOUNTER, _ACCB
                        STS       EDL.PWCOUNTER+1, _ACCA
                        .ENDBLOCK 337
EDL._L0054:
                        .LINE     338
                        LDS       _ACCA, EDL.AD16select
                        TST       _ACCA
                        .BRANCH   3, EDL._L0058
                        BREQ      EDL._L0058
                        .BLOCK    338
                        .LINE     339
                        LDI       _ACCA, 000h
                        .BRANCH   20, _CSE0003
                        RJMP      _CSE0003
                        .ENDBLOCK 340
EDL._L0058:
                        .BLOCK    340
                        .LINE     341
                        LDI       _ACCA, 001h
_CSE0003:                         
                        STS       EDL.NEXTMEAS, _ACCA
                        .ENDBLOCK 342
                        .ENDBLOCK 343
EDL._L0009:
                        .LINE     345
                        LDS       _ACCA, EDL.LastMeas
                        .LINE     346
                        CPI       _ACCA, 0
                        .BRANCH   4, EDL._L0063
                        BRNE      EDL._L0063
                        .BLOCK    347
                        .LINE     347
                        LDS       _ACCALO, EDL.AD16tempIoff
                        LDS       _ACCAHI, EDL.AD16tempIoff+1
                        LSR       _ACCAHI
                        ROR       _ACCALO
                        LDS       _ACCB, EDL.AD16temp
                        LDS       _ACCA, EDL.AD16temp+1
                        LSR       _ACCA
                        ROR       _ACCB
                        ADD       _ACCB, _ACCALO
                        ADC       _ACCA, _ACCAHI
                        STS       EDL.AD16TEMPIOFF, _ACCB
                        STS       EDL.AD16TEMPIOFF+1, _ACCA
                        .ENDBLOCK 348
                        .BRANCH   20,EDL._L0061
                        RJMP      EDL._L0061
EDL._L0063:
                        .LINE     349
                        CPI       _ACCA, 1
                        .BRANCH   4, EDL._L0066
                        BRNE      EDL._L0066
                        .BLOCK    350
                        .LINE     350
                        LDS       _ACCALO, EDL.AD16tempUoff
                        LDS       _ACCAHI, EDL.AD16tempUoff+1
                        LSR       _ACCAHI
                        ROR       _ACCALO
                        LDS       _ACCB, EDL.AD16temp
                        LDS       _ACCA, EDL.AD16temp+1
                        LSR       _ACCA
                        ROR       _ACCB
                        ADD       _ACCB, _ACCALO
                        ADC       _ACCA, _ACCAHI
                        STS       EDL.AD16TEMPUOFF, _ACCB
                        STS       EDL.AD16TEMPUOFF+1, _ACCA
                        .ENDBLOCK 351
                        .BRANCH   20,EDL._L0061
                        RJMP      EDL._L0061
EDL._L0066:
                        .LINE     352
                        CPI       _ACCA, 2
                        .BRANCH   4, EDL._L0069
                        BRNE      EDL._L0069
                        .BLOCK    353
                        .LINE     353
                        LDS       _ACCALO, EDL.AD16tempIon
                        LDS       _ACCAHI, EDL.AD16tempIon+1
                        LSR       _ACCAHI
                        ROR       _ACCALO
                        LDS       _ACCB, EDL.AD16temp
                        LDS       _ACCA, EDL.AD16temp+1
                        LSR       _ACCA
                        ROR       _ACCB
                        ADD       _ACCB, _ACCALO
                        ADC       _ACCA, _ACCAHI
                        STS       EDL.AD16TEMPION, _ACCB
                        STS       EDL.AD16TEMPION+1, _ACCA
                        .ENDBLOCK 354
                        .BRANCH   20,EDL._L0061
                        RJMP      EDL._L0061
EDL._L0069:
                        .LINE     355
                        CPI       _ACCA, 3
                        .BRANCH   4, EDL._L0072
                        BRNE      EDL._L0072
                        .BLOCK    356
                        .LINE     356
                        LDS       _ACCALO, EDL.AD16tempUon
                        LDS       _ACCAHI, EDL.AD16tempUon+1
                        LSR       _ACCAHI
                        ROR       _ACCALO
                        LDS       _ACCB, EDL.AD16temp
                        LDS       _ACCA, EDL.AD16temp+1
                        LSR       _ACCA
                        ROR       _ACCB
                        ADD       _ACCB, _ACCALO
                        ADC       _ACCA, _ACCAHI
                        STS       EDL.AD16TEMPUON, _ACCB
                        STS       EDL.AD16TEMPUON+1, _ACCA
                        .ENDBLOCK 357
EDL._L0072:
EDL._L0061:
                        .LINE     359
                        LDS       _ACCA, EDL.ThisMeas
                        STS       EDL.LASTMEAS, _ACCA
                        .LINE     360
                        LDS       _ACCA, EDL.NextMeas
                        STS       EDL.THISMEAS, _ACCA
                        .ENDBLOCK 361
                        .LINE     361
                        .BRANCH   19
                        RET
                        .ENDFUNC  361

                        .FUNC     GetADC10, 0016Dh, 00020h
EDL.GetADC10:
                        .RETURNS   2
                        SBIW      _FRAMEPTR, 2
                        .BLOCK    371
                        .LINE     372
                        LDD       _ACCA, Y+002h
                        SUBI      _ACCA, 001h AND 0FFh
                        ANDI      _ACCA, 007h
                        OUT       ADMUX, _ACCA
                        .ASM
                        .LINE     374
                        ldi  _ACCB, 15
                        ADC10settleLoop1:  // 3 µs warten
                        .LINE     376
                        dec _ACCB
                        .LINE     377
                        BRNE ADC10settleLoop1
                        .LINE     378
                        ldi  _ACCB, $C7    // Teiler 128
                        .LINE     379
                        out ADCSRA, _ACCB    // fürATMega32
                        // mcb für ATMega644    sts ADCSRA, _ACCB
                        ADC10endLoop1:
                        .LINE     382
                        in _ACCB, ADCSRA    // für ATMega32
                        // mcb für ATMega644    lds _ACCB, ADCSRA
                        .LINE     384
                        sbrc _ACCB,6 // auf Bit 6 low warten
                        .LINE     385
                        rjmp ADC10endLoop1
                        .endasm
                        .LINE     387
                        IN        _ACCA, ADCL
                        STD       Y+000h, _ACCA
                        .LINE     388
                        IN        _ACCA, ADCH
                        STD       Y+001h, _ACCA
                        .LINE     389
                        LDD       _ACCB, Y+000h
                        .ENDBLOCK 390
                        .LINE     390
                        .BRANCH   19
                        RET
                        .ENDFUNC  390


                        .FILE     H:\PROJAVR\ADA-C EDL_MCB\EDL.pas
                        .FUNC     SetLM75Temp, 001F1h, 00020h
EDL.SetLM75Temp:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 3
                        .BLOCK    500
                        .LINE     502
                        LDI       _ACCA, 004h
                        STD       Y+002h, _ACCA
                        .LINE     503
                        LDS       _ACCDLO, EDL.I2CslaveAdr
                        LDI       _ACCAHI, 001h
                        CLT
                        BLD       Flags, _I2C2BYTE
                        MOVW      _ACCCLO, _FRAMEPTR
                        ADIW      _ACCCLO, 000002h
                        LDI       _ACCBLO, 00001h AND 0FFh
                        LDI       _ACCBHI, 00001h SHRB 8
                        LDI       _ACCDHI, 000h
                        CALL       SYSTEM.TWIOut
                        .LINE     504
                        LDS       _ACCDLO, EDL.Param
                        LDS       _ACCDHI, EDL.Param+1
                        LDS       _ACCELO, EDL.Param+2
                        LDS       _ACCEHI, EDL.Param+3
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
                        RJMP      EDL._L0074
                        OR        _ACCAHI, _ACCALO
                        BRNE      EDL._L0075
                        RJMP      EDL._L0076
EDL._L0074:
                        CPI       _ACCAHI, 0FFh
                        BRNE      EDL._L0075
                        CPI       _ACCALO, 0FFh
                        BREQ      EDL._L0076
EDL._L0075:
                        SET
                        BLD       Flags, _ERRFLAG
EDL._L0076:
                        STD       Y+001h, _ACCA
                        STD       Y+000h, _ACCB
                        .LINE     505
                        LDI       _ACCALO, 007h
                        CALL      SYSTEM.SHL16
                        MOV       _ACCBLO, _ACCA
                        MOV       _ACCA, _ACCB
                        MOV       _ACCB, _ACCBLO
                        STD       Y+001h, _ACCA
                        STD       Y+000h, _ACCB
                        .LINE     506
                        LDS       _ACCDLO, EDL.I2CslaveAdr
                        LDI       _ACCAHI, 003h
                        CLT
                        BLD       Flags, _I2C2BYTE
                        MOVW      _ACCCLO, _FRAMEPTR
                        LDI       _ACCBLO, 00002h AND 0FFh
                        LDI       _ACCBHI, 00002h SHRB 8
                        LDI       _ACCDHI, 000h
                        CALL       SYSTEM.TWIOut
                        .LINE     507
                        LDS       _ACCDLO, EDL.Param
                        LDS       _ACCDHI, EDL.Param+1
                        LDS       _ACCELO, EDL.Param+2
                        LDS       _ACCEHI, EDL.Param+3
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
                        RJMP      EDL._L0077
                        OR        _ACCAHI, _ACCALO
                        BRNE      EDL._L0078
                        RJMP      EDL._L0079
EDL._L0077:
                        CPI       _ACCAHI, 0FFh
                        BRNE      EDL._L0078
                        CPI       _ACCALO, 0FFh
                        BREQ      EDL._L0079
EDL._L0078:
                        SET
                        BLD       Flags, _ERRFLAG
EDL._L0079:
                        SUBI      _ACCB, 00006h AND 0FFh
                        SBCI      _ACCA, 00006h SHRB 8
                        STD       Y+001h, _ACCA
                        STD       Y+000h, _ACCB
                        .LINE     508
                        LDI       _ACCALO, 007h
                        CALL      SYSTEM.SHL16
                        MOV       _ACCBLO, _ACCA
                        MOV       _ACCA, _ACCB
                        MOV       _ACCB, _ACCBLO
                        STD       Y+001h, _ACCA
                        STD       Y+000h, _ACCB
                        .LINE     509
                        LDS       _ACCDLO, EDL.I2CslaveAdr
                        LDI       _ACCAHI, 002h
                        CLT
                        BLD       Flags, _I2C2BYTE
                        MOVW      _ACCCLO, _FRAMEPTR
                        LDI       _ACCBLO, 00002h AND 0FFh
                        LDI       _ACCBHI, 00002h SHRB 8
                        LDI       _ACCDHI, 000h
                        CALL       SYSTEM.TWIOut
                        .LINE     510
                        LDS       _ACCDLO, EDL.I2CslaveAdr
                        CLR       _ACCAHI
                        CLT
                        BLD       Flags, _I2C2BYTE
                        LDI       _ACCBLO, 00000h AND 0FFh
                        LDI       _ACCBHI, 00000h SHRB 8
                        CALL       SYSTEM.TWIOut
                        .ENDBLOCK 512
                        .LINE     512
                        .BRANCH   19
                        RET
                        .ENDFUNC  512

                        .FUNC     GetOneLM75Temp, 00202h, 00020h
EDL.GetOneLM75Temp:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 2
                        .BLOCK    517
                        .LINE     518
                        LDS       _ACCDLO, EDL.I2CslaveAdr
                        CLR       _ACCAHI
                        CLT
                        BLD       Flags, _I2C2BYTE
                        LDI       _ACCBLO, 00000h AND 0FFh
                        LDI       _ACCBHI, 00000h SHRB 8
                        LDI       _ACCDHI, 000h
                        CALL       SYSTEM.TWIOut
                        .LINE     519
                        LDS       _ACCDLO, EDL.I2CslaveAdr
                        MOVW      _ACCCLO, _FRAMEPTR
                        LDI       _ACCBLO, 00002h AND 0FFh
                        LDI       _ACCBHI, 00002h SHRB 8
                        CALL       SYSTEM.TWIInp
                        .LINE     520
                        LDD       _ACCA, Y+000h
                        LDD       _ACCB, Y+001h
                        LDI       _ACCALO, 007h
                        CALL      SYSTEM.SHR16
                        STD       Y+001h, _ACCA
                        STD       Y+000h, _ACCB
                        .LINE     521
                        SBRS      _ACCA, 7
                        RJMP      EDL._L0080
                        LDI       _ACCAHI, 0FFh
                        LDI       _ACCALO, 0FFh
                        RJMP      EDL._L0081
EDL._L0080:
                        CLR       _ACCAHI
                        CLR       _ACCALO
EDL._L0081:
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
                        STS       EDL.TEMPERATURE, _ACCB
                        STS       EDL.TEMPERATURE+1, _ACCA
                        STS       EDL.TEMPERATURE+2, _ACCALO
                        STS       EDL.TEMPERATURE+3, _ACCAHI
                        .ENDBLOCK 523
                        .LINE     523
                        .BRANCH   19
                        RET
                        .ENDFUNC  523

                        .FUNC     GetLM75Temp, 0020Dh, 00020h
EDL.GetLM75Temp:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 2
                        .BLOCK    528
                        .LINE     529
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 000h
                        STS       EDL.TEMPERATURE, _ACCB
                        STS       EDL.TEMPERATURE+1, _ACCA
                        STS       EDL.TEMPERATURE+2, _ACCALO
                        STS       EDL.TEMPERATURE+3, _ACCAHI
                        .LINE     530
                        LDS       _ACCB, 00330h
                        SBRS      _ACCB, 002h
                        .BRANCH   20,EDL._L0082
                        RJMP      EDL._L0082
                        .BLOCK    530
                        .LINE     531
                        LDI       _ACCA, 049h
                        STS       EDL.I2CSLAVEADR, _ACCA
                        .LINE     532
                        .BRANCH   17,EDL.GETONELM75TEMP
                        RCALL     EDL.GETONELM75TEMP
                        ADIW      _FRAMEPTR, 2
                        .ENDBLOCK 533
EDL._L0082:
                        .LINE     535
                        LDS       _ACCB, 00330h
                        CLR       _ACCA
                        SBRC      _ACCB, 003h
                        SER       _ACCA
                        PUSH      _ACCA
                        LDS       _ACCA, EDL.ShuntSelect
                        CPI       _ACCA, 003h
                        LDI       _ACCA, 0h
                        BRNE      EDL._L0085
                        SER       _ACCA
EDL._L0085:
                        POP       _ACCB
                        AND       _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   3, EDL._L0086
                        BREQ      EDL._L0086
                        .BLOCK    535
                        .LINE     536
                        LDI       _ACCA, 048h
                        STS       EDL.I2CSLAVEADR, _ACCA
                        .LINE     537
                        .BRANCH   17,EDL.GETONELM75TEMP
                        RCALL     EDL.GETONELM75TEMP
                        ADIW      _FRAMEPTR, 2
                        .ENDBLOCK 538
EDL._L0086:
                        .LINE     539
                        LDS       _ACCB, 00330h
                        SBRS      _ACCB, 004h
                        .BRANCH   20,EDL._L0089
                        RJMP      EDL._L0089
                        .BLOCK    539
                        .LINE     540
                        LDI       _ACCDLO, 04Ah
                        STS       EDL.I2CSLAVEADR, _ACCDLO
                        .LINE     541
                        CLR       _ACCAHI
                        CLT
                        BLD       Flags, _I2C2BYTE
                        LDI       _ACCBLO, 00000h AND 0FFh
                        LDI       _ACCBHI, 00000h SHRB 8
                        LDI       _ACCDHI, 000h
                        CALL       SYSTEM.TWIOut
                        .LINE     542
                        LDS       _ACCDLO, EDL.I2CslaveAdr
                        MOVW      _ACCCLO, _FRAMEPTR
                        LDI       _ACCBLO, 00002h AND 0FFh
                        LDI       _ACCBHI, 00002h SHRB 8
                        CALL       SYSTEM.TWIInp
                        .LINE     543
                        LDD       _ACCA, Y+000h
                        LDD       _ACCB, Y+001h
                        LDI       _ACCALO, 007h
                        CALL      SYSTEM.SHR16
                        STD       Y+001h, _ACCA
                        STD       Y+000h, _ACCB
                        .LINE     544
                        SBRS      _ACCA, 7
                        RJMP      EDL._L0092
                        LDI       _ACCAHI, 0FFh
                        LDI       _ACCALO, 0FFh
                        RJMP      EDL._L0093
EDL._L0092:
                        CLR       _ACCAHI
                        CLR       _ACCALO
EDL._L0093:
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
                        STS       EDL.TEMPERATUREEXTERN, _ACCB
                        STS       EDL.TEMPERATUREEXTERN+1, _ACCA
                        STS       EDL.TEMPERATUREEXTERN+2, _ACCALO
                        STS       EDL.TEMPERATUREEXTERN+3, _ACCAHI
                        .ENDBLOCK 545
EDL._L0089:
                        .ENDBLOCK 546
                        .LINE     546
                        .BRANCH   19
                        RET
                        .ENDFUNC  546

                        .FUNC     InitScaleU, 00224h, 00020h
EDL.InitScaleU:
                        .RETURNS   0
                        .BLOCK    549
                        .LINE     550
                        LDS       _ACCA, EDL.ModeSelect
                        CPI       _ACCA, 002h
                        .BRANCH   3,EDL._L0094
                        BREQ      EDL._L0094
                        CPI       _ACCA, 004h
                        .BRANCH   3,EDL._L0094
                        BREQ      EDL._L0094
                        CPI       _ACCA, 006h
                        .BRANCH   3,EDL._L0094
                        BREQ      EDL._L0094
EDL._L0094:
                        .BRANCH   3, EDL._L0098
                        BREQ      EDL._L0098
                        .BRANCH   20,EDL._L0096
                        RJMP      EDL._L0096
EDL._L0098:
                        .BLOCK    550
                        .LINE     551
                        SBI       00035h, 005h
                        .LINE     552
                        LDI       _ACCCLO, EDL.InitLowDividerU AND 0FFh
                        LDI       _ACCCHI, EDL.InitLowDividerU SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        STS       EDL.DIVIDERU, _ACCB
                        STS       EDL.DIVIDERU+1, _ACCA
                        STS       EDL.DIVIDERU+2, _ACCALO
                        STS       EDL.DIVIDERU+3, _ACCAHI
                        .LINE     553
                        LDI       _ACCCLO, EDL.ADC16UscaleLow AND 0FFh
                        LDI       _ACCCHI, EDL.ADC16UscaleLow SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, EDL.Uref AND 0FFh
                        LDI       _ACCCHI, EDL.Uref SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, EDL.DividerU
                        LDS       _ACCA, EDL.DividerU+1
                        LDS       _ACCALO, EDL.DividerU+2
                        LDS       _ACCAHI, EDL.DividerU+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        MOVW      _ACCDLO, _ACCB
                        MOVW      _ACCELO, _ACCALO
                        LDI       _ACCBLO, 000h
                        LDI       _ACCBHI, 0FFh
                        LDI       _ACCCLO, 07Fh
                        LDI       _ACCCHI, 047h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat_R
                        STS       EDL.ADC16LSBU, _ACCB
                        STS       EDL.ADC16LSBU+1, _ACCA
                        STS       EDL.ADC16LSBU+2, _ACCALO
                        STS       EDL.ADC16LSBU+3, _ACCAHI
                        .LINE     555
                        LDI       _ACCCLO, EDL.ADCUoffsets AND 0FFh
                        LDI       _ACCCHI, EDL.ADCUoffsets SHRB 8
                        .BRANCH   20, _CSE0004
                        RJMP      _CSE0004
                        .ENDBLOCK 556
EDL._L0096:
                        .BLOCK    556
                        .LINE     557
                        CBI       00035h, 005h
                        .LINE     558
                        LDI       _ACCCLO, EDL.InitHiDividerU AND 0FFh
                        LDI       _ACCCHI, EDL.InitHiDividerU SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        STS       EDL.DIVIDERU, _ACCB
                        STS       EDL.DIVIDERU+1, _ACCA
                        STS       EDL.DIVIDERU+2, _ACCALO
                        STS       EDL.DIVIDERU+3, _ACCAHI
                        .LINE     559
                        LDI       _ACCCLO, EDL.ADC16UscaleHigh AND 0FFh
                        LDI       _ACCCHI, EDL.ADC16UscaleHigh SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, EDL.Uref AND 0FFh
                        LDI       _ACCCHI, EDL.Uref SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, EDL.DividerU
                        LDS       _ACCA, EDL.DividerU+1
                        LDS       _ACCALO, EDL.DividerU+2
                        LDS       _ACCAHI, EDL.DividerU+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        MOVW      _ACCDLO, _ACCB
                        MOVW      _ACCELO, _ACCALO
                        LDI       _ACCBLO, 000h
                        LDI       _ACCBHI, 0FFh
                        LDI       _ACCCLO, 07Fh
                        LDI       _ACCCHI, 047h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat_R
                        STS       EDL.ADC16LSBU, _ACCB
                        STS       EDL.ADC16LSBU+1, _ACCA
                        STS       EDL.ADC16LSBU+2, _ACCALO
                        STS       EDL.ADC16LSBU+3, _ACCAHI
                        .LINE     561
                        LDI       _ACCCLO, EDL.ADCUoffsets AND 0FFh
                        LDI       _ACCCHI, EDL.ADCUoffsets SHRB 8
                        ADIW      _ACCCLO, 00002h
_CSE0004:                         
                        CALL      SYSTEM._ReadEEp16
                        STS       EDL.ADCUOFFSET, _ACCB
                        STS       EDL.ADCUOFFSET+1, _ACCA
                        .ENDBLOCK 562
                        .ENDBLOCK 563
                        .LINE     563
                        .BRANCH   19
                        RET
                        .ENDFUNC  563

                        .FUNC     InitScales, 00235h, 00020h
EDL.InitScales:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 18
                        .BLOCK    568
                        .LINE     569
                        LDI       _ACCCLO, EDL.EETrigMask AND 0FFh
                        LDI       _ACCCHI, EDL.EETrigMask SHRB 8
                        CALL      SYSTEM.ReadEEp8
                        STS       EDL.TRIGMASK, _ACCA
                        .LINE     570
                        LDI       _ACCCLO, EDL.InitOptions AND 0FFh
                        LDI       _ACCCHI, EDL.InitOptions SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.FloatToLInt
                        SBRC      _ACCAHI, 7
                        RJMP      EDL._L0099
                        OR        _ACCAHI, _ACCALO
                        BRNE      EDL._L0100
                        RJMP      EDL._L0101
EDL._L0099:
                        CPI       _ACCAHI, 0FFh
                        BRNE      EDL._L0100
                        CPI       _ACCALO, 0FFh
                        BREQ      EDL._L0101
EDL._L0100:
                        SET
                        BLD       Flags, _ERRFLAG
EDL._L0101:
                        STD       Y+011h, _ACCA
                        STD       Y+010h, _ACCB
                        .LINE     571
                        MOV       _ACCA, _ACCB
                        STS       EDL.OPTIONS, _ACCA
                        .LINE     572
                        ANDI      _ACCA, 003h
                        STS       EDL.DACTYPE, _ACCA
                        .LINE     573
                        LDI       _ACCCLO, EDL.Uref AND 0FFh
                        LDI       _ACCCHI, EDL.Uref SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        STD       Y+00Fh, _ACCAHI
                        STD       Y+00Eh, _ACCALO
                        STD       Y+00Dh, _ACCA
                        STD       Y+00Ch, _ACCB
                        .LINE     574
                        .BRANCH   17,EDL.INITSCALEU
                        RCALL     EDL.INITSCALEU
                        .LINE     575
                        LDS       _ACCA, EDL.DACtype
                        CPI       _ACCA, 003h
                        .BRANCH   4, EDL._L0103
                        BRNE      EDL._L0103
                        .BLOCK    575
                        .LINE     576
                        LDI       _ACCB, 000010063h AND 0FFh
                        LDI       _ACCA, 000010063h SHRB 8
                        LDI       _ACCALO, 000010063h SHRB 16
                        .BRANCH   20, _CSE0005
                        RJMP      _CSE0005
                        .ENDBLOCK 577
EDL._L0103:
                        .BLOCK    577
                        .LINE     578
                        LDI       _ACCB, 000000FFFh AND 0FFh
                        LDI       _ACCA, 000000FFFh SHRB 8
                        LDI       _ACCALO, 000000FFFh SHRB 16
_CSE0005:                         
                        LDI       _ACCAHI, 000000FFFh SHRB 24
                        STS       EDL.DACMAX, _ACCB
                        STS       EDL.DACMAX+1, _ACCA
                        STS       EDL.DACMAX+2, _ACCALO
                        STS       EDL.DACMAX+3, _ACCAHI
                        .ENDBLOCK 579
                        .LINE     580
                        CLT
                        BLD       Flags, _ERRFLAG
                        SET
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.LIntToFloat
                        STD       Y+00Bh, _ACCAHI
                        STD       Y+00Ah, _ACCALO
                        STD       Y+009h, _ACCA
                        STD       Y+008h, _ACCB
                        .LINE     581
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 0FFh
                        LDI       _ACCALO, 07Fh
                        LDI       _ACCAHI, 047h
                        STD       Y+003h, _ACCAHI
                        STD       Y+002h, _ACCALO
                        STD       Y+001h, _ACCA
                        STD       Y+000h, _ACCB
                        .LINE     582
                        LDI       _ACCA, 0C0h
                        LDI       _ACCAHI, 044h
                        STD       Y+007h, _ACCAHI
                        STD       Y+006h, _ACCALO
                        STD       Y+005h, _ACCA
                        STD       Y+004h, _ACCB
                        .LINE     583
                        .LOOP
                        LDI       _ACCCLO, EDL.i AND 0FFh
                        LDI       _ACCCHI, EDL.i SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 000h
                        ST        Z, _ACCA
                        LDI       _ACCA, 003h
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
EDL._L0108:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        .BRANCH   2, EDL._L0110
                        BRSH      EDL._L0110
                        .BRANCH   20,EDL._L0107
                        RJMP      EDL._L0107
EDL._L0110:
                        .BLOCK    585
                        .LINE     585
                        LDI       _ACCCLO, EDL.DACLSBIarray AND 0FFh
                        LDI       _ACCCHI, EDL.DACLSBIarray SHRB 8
                        MOV       _ACCB, EDL.i
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCAHI, Y+012h
                        LDD       _ACCALO, Y+011h
                        LDD       _ACCA, Y+010h
                        LDD       _ACCB, Y+00Fh
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, EDL.RSenseArray AND 0FFh
                        LDI       _ACCCHI, EDL.RSenseArray SHRB 8
                        MOV       _ACCB, EDL.i
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
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
                        LDD       _ACCAHI, Y+00Eh
                        LDD       _ACCALO, Y+00Dh
                        LDD       _ACCA, Y+00Ch
                        LDD       _ACCB, Y+00Bh
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, EDL.DACIscales AND 0FFh
                        LDI       _ACCCHI, EDL.DACIscales SHRB 8
                        MOV       _ACCB, EDL.i
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
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
                        LDI       _ACCCLO, EDL.InitGainI AND 0FFh
                        LDI       _ACCCHI, EDL.InitGainI SHRB 8
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
                        .LINE     588
                        LDI       _ACCCLO, EDL.DACLSBRarray AND 0FFh
                        LDI       _ACCCHI, EDL.DACLSBRarray SHRB 8
                        MOV       _ACCB, EDL.i
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCCLO, EDL.InitGainI AND 0FFh
                        LDI       _ACCCHI, EDL.InitGainI SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, EDL.RSenseArray AND 0FFh
                        LDI       _ACCCHI, EDL.RSenseArray SHRB 8
                        MOV       _ACCB, EDL.i
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        CALL      SYSTEM._ReadEEp32
                        ADIW      _ACCCLO, 01h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDD       _ACCAHI, Y+00Eh
                        LDD       _ACCALO, Y+00Dh
                        LDD       _ACCA, Y+00Ch
                        LDD       _ACCB, Y+00Bh
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, EDL.DACIscales AND 0FFh
                        LDI       _ACCCHI, EDL.DACIscales SHRB 8
                        MOV       _ACCB, EDL.i
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        CALL      SYSTEM._ReadEEp32
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z+, _ACCB
                        ST        Z+, _ACCA
                        ST        Z+, _ACCALO
                        ST        Z+, _ACCAHI
                        .LINE     591
                        LDI       _ACCCLO, EDL.ADC16LSBIarray AND 0FFh
                        LDI       _ACCCHI, EDL.ADC16LSBIarray SHRB 8
                        MOV       _ACCB, EDL.i
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCCLO, EDL.ADCIscales AND 0FFh
                        LDI       _ACCCHI, EDL.ADCIscales SHRB 8
                        MOV       _ACCB, EDL.i
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        CALL      SYSTEM._ReadEEp32
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, EDL.Uref AND 0FFh
                        LDI       _ACCCHI, EDL.Uref SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, EDL.RSenseArray AND 0FFh
                        LDI       _ACCCHI, EDL.RSenseArray SHRB 8
                        MOV       _ACCB, EDL.i
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
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
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, EDL.InitGainI AND 0FFh
                        LDI       _ACCCHI, EDL.InitGainI SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z+, _ACCB
                        ST        Z+, _ACCA
                        ST        Z+, _ACCALO
                        ST        Z+, _ACCAHI
                        .LINE     592
                        LDI       _ACCCLO, EDL.ADC10LSBIarray AND 0FFh
                        LDI       _ACCCHI, EDL.ADC10LSBIarray SHRB 8
                        MOV       _ACCB, EDL.i
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCCLO, EDL.ADCIscales AND 0FFh
                        LDI       _ACCCHI, EDL.ADCIscales SHRB 8
                        MOV       _ACCB, EDL.i
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        CALL      SYSTEM._ReadEEp32
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, EDL.Uref AND 0FFh
                        LDI       _ACCCHI, EDL.Uref SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, EDL.RSenseArray AND 0FFh
                        LDI       _ACCCHI, EDL.RSenseArray SHRB 8
                        MOV       _ACCB, EDL.i
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
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
                        LDD       _ACCAHI, Y+00Ah
                        LDD       _ACCALO, Y+009h
                        LDD       _ACCA, Y+008h
                        LDD       _ACCB, Y+007h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, EDL.InitGainI AND 0FFh
                        LDI       _ACCCHI, EDL.InitGainI SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z+, _ACCB
                        ST        Z+, _ACCA
                        ST        Z+, _ACCALO
                        ST        Z+, _ACCAHI
                        .ENDBLOCK 593
                        .LINE     593
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,EDL._L0107
                        BREQ      EDL._L0107
                        .BRANCH   20,EDL._L0108
                        RJMP      EDL._L0108
EDL._L0107:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .LINE     594
                        LDI       _ACCCLO, EDL.TrackChSave AND 0FFh
                        LDI       _ACCCHI, EDL.TrackChSave SHRB 8
                        CALL      SYSTEM.ReadEEp8
                        STS       EDL.TRACKCHANNEL, _ACCA
                        .LINE     595
                        LDI       _ACCCLO, EDL.InitFanOnTemp AND 0FFh
                        LDI       _ACCCHI, EDL.InitFanOnTemp SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        STS       EDL.PARAM, _ACCB
                        STS       EDL.PARAM+1, _ACCA
                        STS       EDL.PARAM+2, _ACCALO
                        STS       EDL.PARAM+3, _ACCAHI
                        .LINE     596
                        LDS       _ACCB, 00330h
                        SBRS      _ACCB, 002h
                        .BRANCH   20,EDL._L0111
                        RJMP      EDL._L0111
                        .BLOCK    596
                        .LINE     597
                        LDI       _ACCA, 049h
                        STS       EDL.I2CSLAVEADR, _ACCA
                        .LINE     598
                        .BRANCH   17,EDL.SETLM75TEMP
                        RCALL     EDL.SETLM75TEMP
                        ADIW      _FRAMEPTR, 3
                        .ENDBLOCK 599
EDL._L0111:
                        .LINE     600
                        LDS       _ACCB, 00330h
                        SBRS      _ACCB, 003h
                        .BRANCH   20,EDL._L0114
                        RJMP      EDL._L0114
                        .BLOCK    600
                        .LINE     601
                        LDI       _ACCA, 048h
                        STS       EDL.I2CSLAVEADR, _ACCA
                        .LINE     602
                        .BRANCH   17,EDL.SETLM75TEMP
                        RCALL     EDL.SETLM75TEMP
                        ADIW      _FRAMEPTR, 3
                        .ENDBLOCK 603
EDL._L0114:
                        .LINE     604
                        LDI       _ACCCLO, EDL.InitTonTime AND 0FFh
                        LDI       _ACCCHI, EDL.InitTonTime SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.FloatToLInt
                        SBRC      _ACCAHI, 7
                        RJMP      EDL._L0117
                        OR        _ACCAHI, _ACCALO
                        BRNE      EDL._L0118
                        RJMP      EDL._L0119
EDL._L0117:
                        CPI       _ACCAHI, 0FFh
                        BRNE      EDL._L0118
                        CPI       _ACCALO, 0FFh
                        BREQ      EDL._L0119
EDL._L0118:
                        SET
                        BLD       Flags, _ERRFLAG
EDL._L0119:
                        STS       EDL.PWONTIME, _ACCB
                        STS       EDL.PWONTIME+1, _ACCA
                        .LINE     605
                        LDI       _ACCCLO, EDL.InitToffTime AND 0FFh
                        LDI       _ACCCHI, EDL.InitToffTime SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.FloatToLInt
                        SBRC      _ACCAHI, 7
                        RJMP      EDL._L0120
                        OR        _ACCAHI, _ACCALO
                        BRNE      EDL._L0121
                        RJMP      EDL._L0122
EDL._L0120:
                        CPI       _ACCAHI, 0FFh
                        BRNE      EDL._L0121
                        CPI       _ACCALO, 0FFh
                        BREQ      EDL._L0122
EDL._L0121:
                        SET
                        BLD       Flags, _ERRFLAG
EDL._L0122:
                        STS       EDL.PWOFFTIME, _ACCB
                        STS       EDL.PWOFFTIME+1, _ACCA
                        .LINE     606
                        LDI       _ACCCLO, EDL.InitIpercent AND 0FFh
                        LDI       _ACCCHI, EDL.InitIpercent SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.FloatToLInt
                        SBRC      _ACCAHI, 7
                        RJMP      EDL._L0123
                        OR        _ACCAHI, _ACCALO
                        BRNE      EDL._L0124
                        RJMP      EDL._L0125
EDL._L0123:
                        CPI       _ACCAHI, 0FFh
                        BRNE      EDL._L0124
                        CPI       _ACCALO, 0FFh
                        BREQ      EDL._L0125
EDL._L0124:
                        SET
                        BLD       Flags, _ERRFLAG
EDL._L0125:
                        STS       EDL.IPERCENT, _ACCB
                        STS       EDL.IPERCENT+1, _ACCA
                        .LINE     607
                        LDI       _ACCCLO, EDL.RSenseArray AND 0FFh
                        LDI       _ACCCHI, EDL.RSenseArray SHRB 8
                        ADIW      _ACCCLO, 0000Ch
                        CALL      SYSTEM._ReadEEp32
                        ADIW      _ACCCLO, 01h
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, EDL.DividerU
                        LDS       _ACCA, EDL.DividerU+1
                        LDS       _ACCALO, EDL.DividerU+2
                        LDS       _ACCAHI, EDL.DividerU+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, EDL.InitGainI AND 0FFh
                        LDI       _ACCCHI, EDL.InitGainI SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        MOVW      _ACCDLO, _ACCB
                        MOVW      _ACCELO, _ACCALO
                        LDI       _ACCBLO, 0CDh
                        LDI       _ACCBHI, 0CCh
                        LDI       _ACCCLO, 08Ch
                        LDI       _ACCCHI, 03Fh
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat_R
                        STS       EDL.DCOHMMIN, _ACCB
                        STS       EDL.DCOHMMIN+1, _ACCA
                        STS       EDL.DCOHMMIN+2, _ACCALO
                        STS       EDL.DCOHMMIN+3, _ACCAHI
                        .LINE     608
                        LDI       _ACCCLO, EDL.RSenseArray AND 0FFh
                        LDI       _ACCCHI, EDL.RSenseArray SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        ADIW      _ACCCLO, 01h
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, EDL.DividerU
                        LDS       _ACCA, EDL.DividerU+1
                        LDS       _ACCALO, EDL.DividerU+2
                        LDS       _ACCAHI, EDL.DividerU+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, EDL.InitGainI AND 0FFh
                        LDI       _ACCCHI, EDL.InitGainI SHRB 8
                        CALL      SYSTEM._ReadEEp32
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
                        CALL      SYSTEM.MulFloat_R
                        STS       EDL.DCOHMMAX, _ACCB
                        STS       EDL.DCOHMMAX+1, _ACCA
                        STS       EDL.DCOHMMAX+2, _ACCALO
                        STS       EDL.DCOHMMAX+3, _ACCAHI
                        .ENDBLOCK 609
                        .LINE     609
                        .BRANCH   19
                        RET
                        .ENDFUNC  609

                        .FUNC     SerCRLF, 00268h, 00020h
EDL.SerCRLF:
                        .RETURNS   0
                        .BLOCK    617
                        .LINE     618
                        LDI       _ACCA, 00Dh
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .LINE     619
                        LDI       _ACCA, 00Ah
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .ENDBLOCK 620
                        .LINE     620
                        .BRANCH   19
                        RET
                        .ENDFUNC  620

                        .FUNC     WriteChPrefix, 0026Eh, 00020h
EDL.WriteChPrefix:
                        .RETURNS   0
                        .BLOCK    623
                        .LINE     624
                        LDI       _ACCA, 023h
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .LINE     625
                        LDS       _ACCA, EDL.SlaveCh
                        SUBI      _ACCA, -030h AND 0FFh
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .LINE     626
                        LDI       _ACCA, 03Ah
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .LINE     627
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.Serout SHRB 1
                        LDI       _ACCA, SYSTEM.Serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDS       _ACCA, EDL.SubCh
                        ST        -Y, _ACCA
                        .FRAME  3
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        ST        -Y, _ACCA
                        LDI       _ACCA, 020h
                        ST        -Y, _ACCA
                        .FRAME  6
                        CALL      SYSTEM.Byte2Str
                        .FRAME  2
                        ADIW      _FRAMEPTR, 6
                        .FRAME  0
                        .LINE     628
                        LDI       _ACCA, 03Dh
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .ENDBLOCK 629
                        .LINE     629
                        .BRANCH   19
                        RET
                        .ENDFUNC  629

                        .FUNC     WriteSerInp, 00277h, 00020h
EDL.WriteSerInp:
                        .RETURNS   0
                        .BLOCK    632
                        .LINE     633
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.Serout SHRB 1
                        LDI       _ACCA, SYSTEM.Serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, EDL.SerInpStr AND 0FFh
                        LDI       _ACCCHI, EDL.SerInpStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        ADIW      _FRAMEPTR, 2
                        .FRAME  0
                        .LINE     634
                        .BRANCH   17,EDL.SERCRLF
                        RCALL     EDL.SERCRLF
                        .ENDBLOCK 635
                        .LINE     635
                        .BRANCH   19
                        RET
                        .ENDFUNC  635

                        .FUNC     SetShunt, 0027Eh, 00020h
EDL.SetShunt:
                        .RETURNS   0
                        .BLOCK    639
                        .LINE     640
                        LDD       _ACCA, Y+000h
                        .LINE     641
                        CPI       _ACCA, 0
                        .BRANCH   4, EDL._L0128
                        BRNE      EDL._L0128
                        .BLOCK    642
                        .LINE     642
                        SBI       00035h, 002h
                        .LINE     643
                        .BRANCH   20, _CSE0007
                        RJMP      _CSE0007
                        .ENDBLOCK 644
EDL._L0128:
                        .LINE     645
                        CPI       _ACCA, 1
                        .BRANCH   4, EDL._L0131
                        BRNE      EDL._L0131
                        .BLOCK    646
                        .LINE     646
                        CBI       00035h, 002h
                        .LINE     647
_CSE0007:                         
                        SBI       00035h, 003h
                        .ENDBLOCK 648
                        .BRANCH   20,EDL._L0126
                        RJMP      EDL._L0126
EDL._L0131:
                        .LINE     649
                        CPI       _ACCA, 2
                        .BRANCH   4, EDL._L0134
                        BRNE      EDL._L0134
                        .BLOCK    650
                        .LINE     650
                        SBI       00035h, 002h
                        .LINE     651
                        .BRANCH   20, _CSE0006
                        RJMP      _CSE0006
                        .ENDBLOCK 652
EDL._L0134:
                        .LINE     653
                        CPI       _ACCA, 3
                        .BRANCH   4, EDL._L0137
                        BRNE      EDL._L0137
                        .BLOCK    654
                        .LINE     654
                        CBI       00035h, 002h
                        .LINE     655
_CSE0006:                         
                        CBI       00035h, 003h
                        .ENDBLOCK 656
EDL._L0137:
EDL._L0126:
                        .ENDBLOCK 658
                        .LINE     658
                        .BRANCH   19
                        RET
                        .ENDFUNC  658

                        .FUNC     CalcRangeI, 00294h, 00020h
EDL.CalcRangeI:
                        .RETURNS   0
                        .BLOCK    661
                        .LINE     662
                        LDI       _ACCA, 000h
                        STS       EDL.SHUNTSELECT, _ACCA
                        .LINE     663
                        .LOOP
                        LDI       _ACCCLO, EDL.i AND 0FFh
                        LDI       _ACCCHI, EDL.i SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        ST        Z, _ACCA
                        LDI       _ACCA, 003h
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
EDL._L0141:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        .BRANCH   1, EDL._L0140
                        BRLO      EDL._L0140
                        .BLOCK    664
                        .LINE     664
                        LDS       _ACCBHI, EDL.DCAmp+1
                        LDI       _ACCCLO, EDL.ImaxArray AND 0FFh
                        LDI       _ACCCHI, EDL.ImaxArray SHRB 8
                        MOV       _ACCB, EDL.i
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        CALL      SYSTEM._ReadEEp32
                        ADIW      _ACCCLO, 01h
                        LDS       _ACCCHI, EDL.DCAmp+3
                        LDS       _ACCCLO, EDL.DCAmp+2
                        LDS       _ACCBLO, EDL.DCAmp
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      EDL._L0145
                        BRPL      EDL._L0146
                        BRMI      EDL._L0144
EDL._L0146:
                        CLZ
                        CLC
                        RJMP      EDL._L0145
EDL._L0144:
                        CLZ
                        SEC
EDL._L0145:
                        .BRANCH   3, EDL._L0148
                        BREQ      EDL._L0148
                        .BRANCH   1, EDL._L0148
                        BRLO      EDL._L0148
                        .BLOCK    664
                        .LINE     665
                        CLR       _ACCA
                        LDS       _ACCB, EDL.ShuntSelect
                        LDI       _ACCEHI, 003h
                        CP        _ACCB, _ACCEHI
                        BRCC      EDL._L0151
                        INC       _ACCB
                        STS       EDL.ShuntSelect, _ACCB
                        SER       _ACCA
EDL._L0151:
                        .ENDBLOCK 666
EDL._L0148:
                        .ENDBLOCK 667
                        .LINE     667
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   4, EDL._L0141
                        BRNE      EDL._L0141
EDL._L0140:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .ENDBLOCK 668
                        .LINE     668
                        .BRANCH   19
                        RET
                        .ENDFUNC  668

                        .FUNC     CalcRangeR, 0029Eh, 00020h
EDL.CalcRangeR:
                        .RETURNS   0
                        .BLOCK    671
                        .LINE     672
                        LDI       _ACCA, 000h
                        STS       EDL.SHUNTSELECT, _ACCA
                        .LINE     673
                        .LOOP
                        LDI       _ACCCLO, EDL.i AND 0FFh
                        LDI       _ACCCHI, EDL.i SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        ST        Z, _ACCA
                        LDI       _ACCA, 003h
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
EDL._L0154:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        .BRANCH   2, EDL._L0156
                        BRSH      EDL._L0156
                        .BRANCH   20,EDL._L0153
                        RJMP      EDL._L0153
EDL._L0156:
                        .BLOCK    674
                        .LINE     674
                        LDS       _ACCB, EDL.DCohm
                        LDS       _ACCA, EDL.DCohm+1
                        LDS       _ACCALO, EDL.DCohm+2
                        LDS       _ACCAHI, EDL.DCohm+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, EDL.RSenseArray AND 0FFh
                        LDI       _ACCCHI, EDL.RSenseArray SHRB 8
                        MOV       _ACCB, EDL.i
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        CALL      SYSTEM._ReadEEp32
                        ADIW      _ACCCLO, 01h
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, EDL.InitGainI AND 0FFh
                        LDI       _ACCCHI, EDL.InitGainI SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, EDL.DividerU
                        LDS       _ACCA, EDL.DividerU+1
                        LDS       _ACCALO, EDL.DividerU+2
                        LDS       _ACCAHI, EDL.DividerU+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        MOVW      _ACCDLO, _ACCB
                        MOVW      _ACCELO, _ACCALO
                        LDI       _ACCBLO, 0CDh
                        LDI       _ACCBHI, 0CCh
                        LDI       _ACCCLO, 08Ch
                        LDI       _ACCCHI, 03Fh
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat_R
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      EDL._L0158
                        BRPL      EDL._L0159
                        BRMI      EDL._L0157
EDL._L0159:
                        CLZ
                        CLC
                        RJMP      EDL._L0158
EDL._L0157:
                        CLZ
                        SEC
EDL._L0158:
                        .BRANCH   2, EDL._L0161
                        BRSH      EDL._L0161
                        .BLOCK    674
                        .LINE     675
                        CLR       _ACCA
                        LDS       _ACCB, EDL.ShuntSelect
                        LDI       _ACCEHI, 003h
                        CP        _ACCB, _ACCEHI
                        BRCC      EDL._L0164
                        INC       _ACCB
                        STS       EDL.ShuntSelect, _ACCB
                        SER       _ACCA
EDL._L0164:
                        .ENDBLOCK 676
EDL._L0161:
                        .ENDBLOCK 677
                        .LINE     677
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,EDL._L0153
                        BREQ      EDL._L0153
                        .BRANCH   20,EDL._L0154
                        RJMP      EDL._L0154
EDL._L0153:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .ENDBLOCK 678
                        .LINE     678
                        .BRANCH   19
                        RET
                        .ENDFUNC  678

                        .FUNC     GetVoltage, 002A8h, 00020h
EDL.GetVoltage:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 4
                        .BLOCK    686
                        .LINE     687
                        CLI
                        LDI       _ACCA, 0FEH ROLB IntFlag
                        AND       Flags, _ACCA
                        .LINE     688
                        LDS       _ACCB, EDL.PWoffTime
                        LDS       _ACCA, EDL.PWoffTime+1
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        CPI       _ACCA, 080h
                        BRNE      EDL._L0165
                        CPI       _ACCB, 000h
EDL._L0165:
                        LDI       _ACCA, 0h
                        BRNE      EDL._L0166
                        SER       _ACCA
EDL._L0166:
                        PUSH      _ACCA
                        LDS       _ACCB, EDL.Ipercent
                        LDS       _ACCA, EDL.Ipercent+1
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        CPI       _ACCA, 080h
                        BRNE      EDL._L0167
                        CPI       _ACCB, 064h
EDL._L0167:
                        LDI       _ACCA, 0h
                        BRNE      EDL._L0168
                        SER       _ACCA
EDL._L0168:
                        POP       _ACCB
                        OR        _ACCA, _ACCB
                        MOV       _ACCB, _ACCA
                        LDD       _ACCA, Y+004h
                        OR        _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   3, EDL._L0169
                        BREQ      EDL._L0169
                        .BLOCK    688
                        .LINE     689
                        LDS       _ACCB, EDL.AD16tempUon
                        LDS       _ACCA, EDL.AD16tempUon+1
                        .BRANCH   20, _CSE0008
                        RJMP      _CSE0008
                        .ENDBLOCK 690
EDL._L0169:
                        .BLOCK    690
                        .LINE     691
                        LDS       _ACCB, EDL.AD16tempUoff
                        LDS       _ACCA, EDL.AD16tempUoff+1
_CSE0008:                         
                        CLR       _ACCAHI
                        CLR       _ACCALO
                        STD       Y+003h, _ACCAHI
                        STD       Y+002h, _ACCALO
                        STD       Y+001h, _ACCA
                        STD       Y+000h, _ACCB
                        .ENDBLOCK 692
                        .LINE     693
                        LDI       _ACCA, 1 SHLB IntFlag
                        OR        Flags, _ACCA
                        SEI
                        .LINE     694
                        LDD       _ACCA, Y+001h
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, EDL.ADCUoffset
                        LDS       _ACCA, EDL.ADCUoffset+1
                        SBRS      _ACCA, 7
                        RJMP      EDL._L0172
                        LDI       _ACCAHI, 0FFh
                        LDI       _ACCALO, 0FFh
                        RJMP      EDL._L0173
EDL._L0172:
                        CLR       _ACCAHI
                        CLR       _ACCALO
EDL._L0173:
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
                        .LINE     695
                        CLT
                        BLD       Flags, _ERRFLAG
                        SET
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.LIntToFloat
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, EDL.ADC16LSBU
                        LDS       _ACCA, EDL.ADC16LSBU+1
                        LDS       _ACCALO, EDL.ADC16LSBU+2
                        LDS       _ACCAHI, EDL.ADC16LSBU+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        STS       EDL.PARAM, _ACCB
                        STS       EDL.PARAM+1, _ACCA
                        STS       EDL.PARAM+2, _ACCALO
                        STS       EDL.PARAM+3, _ACCAHI
                        .ENDBLOCK 696
                        .LINE     696
                        .BRANCH   19
                        RET
                        .ENDFUNC  696

                        .FUNC     GetCurrent, 002BAh, 00020h
EDL.GetCurrent:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 4
                        .BLOCK    702
                        .LINE     702
                        LDS       _ACCA, EDL.OutputEnable
                        TST       _ACCA
                        .BRANCH   4,EDL._L0176
                        BRNE      EDL._L0176
                        .BRANCH   20,EDL._L0174
                        RJMP      EDL._L0174
EDL._L0176:
                        .BLOCK    703
                        .LINE     703
                        CLI
                        LDI       _ACCA, 0FEH ROLB IntFlag
                        AND       Flags, _ACCA
                        .LINE     704
                        LDS       _ACCB, EDL.PWoffTime
                        LDS       _ACCA, EDL.PWoffTime+1
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        CPI       _ACCA, 080h
                        BRNE      EDL._L0177
                        CPI       _ACCB, 000h
EDL._L0177:
                        LDI       _ACCA, 0h
                        BRNE      EDL._L0178
                        SER       _ACCA
EDL._L0178:
                        PUSH      _ACCA
                        LDS       _ACCB, EDL.Ipercent
                        LDS       _ACCA, EDL.Ipercent+1
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        CPI       _ACCA, 080h
                        BRNE      EDL._L0179
                        CPI       _ACCB, 064h
EDL._L0179:
                        LDI       _ACCA, 0h
                        BRNE      EDL._L0180
                        SER       _ACCA
EDL._L0180:
                        POP       _ACCB
                        OR        _ACCA, _ACCB
                        MOV       _ACCB, _ACCA
                        LDD       _ACCA, Y+004h
                        OR        _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   3, EDL._L0181
                        BREQ      EDL._L0181
                        .BLOCK    704
                        .LINE     705
                        LDS       _ACCB, EDL.AD16tempIon
                        LDS       _ACCA, EDL.AD16tempIon+1
                        .BRANCH   20, _CSE0009
                        RJMP      _CSE0009
                        .ENDBLOCK 706
EDL._L0181:
                        .BLOCK    706
                        .LINE     707
                        LDS       _ACCB, EDL.AD16tempIoff
                        LDS       _ACCA, EDL.AD16tempIoff+1
_CSE0009:                         
                        CLR       _ACCAHI
                        CLR       _ACCALO
                        STD       Y+003h, _ACCAHI
                        STD       Y+002h, _ACCALO
                        STD       Y+001h, _ACCA
                        STD       Y+000h, _ACCB
                        .ENDBLOCK 708
                        .LINE     709
                        LDI       _ACCA, 1 SHLB IntFlag
                        OR        Flags, _ACCA
                        SEI
                        .LINE     710
                        LDD       _ACCA, Y+001h
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, EDL.ADCIoffsets AND 0FFh
                        LDI       _ACCCHI, EDL.ADCIoffsets SHRB 8
                        LDS       _ACCB, EDL.ShuntSelect
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        CALL      SYSTEM._ReadEEp16
                        SBRS      _ACCA, 7
                        RJMP      EDL._L0184
                        LDI       _ACCAHI, 0FFh
                        LDI       _ACCALO, 0FFh
                        RJMP      EDL._L0185
EDL._L0184:
                        CLR       _ACCAHI
                        CLR       _ACCALO
EDL._L0185:
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
                        .LINE     711
                        CLT
                        BLD       Flags, _ERRFLAG
                        SET
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.LIntToFloat
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, EDL.ADC16LSBIarray AND 0FFh
                        LDI       _ACCCHI, EDL.ADC16LSBIarray SHRB 8
                        LDS       _ACCB, EDL.ShuntSelect
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCB, Z+
                        LD        _ACCA, Z+
                        LD        _ACCALO, Z+
                        LD        _ACCAHI, Z+
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        .BRANCH   20, _CSE0010
                        RJMP      _CSE0010
                        .ENDBLOCK 712
EDL._L0174:
                        .BLOCK    712
                        .LINE     713
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 000h
_CSE0010:                         
                        STS       EDL.PARAM, _ACCB
                        STS       EDL.PARAM+1, _ACCA
                        STS       EDL.PARAM+2, _ACCALO
                        STS       EDL.PARAM+3, _ACCAHI
                        .ENDBLOCK 714
                        .ENDBLOCK 715
                        .LINE     715
                        .BRANCH   19
                        RET
                        .ENDFUNC  715

                        .FUNC     GetRi, 002E1h, 00020h
EDL.GetRi:
                        .RETURNS   1
                        SBIW      _FRAMEPTR, 8
                        .BLOCK    740
                        .LINE     741
                        LDS       _ACCB, EDL.PWoffTime
                        LDS       _ACCA, EDL.PWoffTime+1
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        CPI       _ACCA, 080h
                        BRNE      EDL._L0186
                        CPI       _ACCB, 000h
EDL._L0186:
                        LDI       _ACCA, 0h
                        BRNE      EDL._L0187
                        SER       _ACCA
EDL._L0187:
                        PUSH      _ACCA
                        LDS       _ACCB, EDL.Ipercent
                        LDS       _ACCA, EDL.Ipercent+1
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        CPI       _ACCA, 080h
                        BRNE      EDL._L0188
                        CPI       _ACCB, 064h
EDL._L0188:
                        LDI       _ACCA, 0h
                        BRNE      EDL._L0189
                        SER       _ACCA
EDL._L0189:
                        POP       _ACCB
                        OR        _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   3, EDL._L0190
                        BREQ      EDL._L0190
                        .BLOCK    741
                        .LINE     742
                        .BRANCH   20, EDL._L0202
                        RJMP      EDL._L0202
                        .ENDBLOCK 743
EDL._L0190:
                        .LINE     744
                        LDS       _ACCA, EDL.ModeSelect
                        CPI       _ACCA, 002h
                        .BRANCH   3,EDL._L0193
                        BREQ      EDL._L0193
                        CPI       _ACCA, 001h
                        .BRANCH   3,EDL._L0193
                        BREQ      EDL._L0193
EDL._L0193:
                        .BRANCH   3, EDL._L0195
                        BREQ      EDL._L0195
                        .BLOCK    744
                        .LINE     745
                        .BRANCH   20, EDL._L0202
                        RJMP      EDL._L0202
                        .ENDBLOCK 746
EDL._L0195:
                        .LINE     747
                        LDI       _ACCA, 0FFh
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.GETVOLTAGE
                        RCALL     EDL.GETVOLTAGE
                        ADIW      _FRAMEPTR, 5
                        .LINE     748
                        LDS       _ACCB, EDL.Param
                        LDS       _ACCA, EDL.Param+1
                        LDS       _ACCALO, EDL.Param+2
                        LDS       _ACCAHI, EDL.Param+3
                        STD       Y+007h, _ACCAHI
                        STD       Y+006h, _ACCALO
                        STD       Y+005h, _ACCA
                        STD       Y+004h, _ACCB
                        .LINE     749
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.GETVOLTAGE
                        RCALL     EDL.GETVOLTAGE
                        ADIW      _FRAMEPTR, 5
                        .LINE     750
                        LDS       _ACCB, EDL.Param
                        LDS       _ACCA, EDL.Param+1
                        LDS       _ACCALO, EDL.Param+2
                        LDS       _ACCAHI, EDL.Param+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDD       _ACCAHI, Y+007h
                        LDD       _ACCALO, Y+006h
                        LDD       _ACCA, Y+005h
                        LDD       _ACCB, Y+004h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.SubFloat
                        STD       Y+007h, _ACCAHI
                        STD       Y+006h, _ACCALO
                        STD       Y+005h, _ACCA
                        STD       Y+004h, _ACCB
                        .LINE     751
                        LDI       _ACCA, 0FFh
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.GETCURRENT
                        RCALL     EDL.GETCURRENT
                        ADIW      _FRAMEPTR, 5
                        .LINE     752
                        LDS       _ACCB, EDL.Param
                        LDS       _ACCA, EDL.Param+1
                        LDS       _ACCALO, EDL.Param+2
                        LDS       _ACCAHI, EDL.Param+3
                        STD       Y+003h, _ACCAHI
                        STD       Y+002h, _ACCALO
                        STD       Y+001h, _ACCA
                        STD       Y+000h, _ACCB
                        .LINE     753
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.GETCURRENT
                        RCALL     EDL.GETCURRENT
                        ADIW      _FRAMEPTR, 5
                        .LINE     754
                        LDD       _ACCAHI, Y+003h
                        LDD       _ACCALO, Y+002h
                        LDD       _ACCA, Y+001h
                        LDD       _ACCB, Y+000h
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, EDL.Param
                        LDS       _ACCA, EDL.Param+1
                        LDS       _ACCALO, EDL.Param+2
                        LDS       _ACCAHI, EDL.Param+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.SubFloat
                        STD       Y+003h, _ACCAHI
                        STD       Y+002h, _ACCALO
                        STD       Y+001h, _ACCA
                        STD       Y+000h, _ACCB
                        .LINE     755
                        MOVW      _ACCBLO, _ACCB
                        MOVW      _ACCCLO, _ACCALO
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 000h
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      EDL._L0199
                        BRPL      EDL._L0200
                        BRMI      EDL._L0198
EDL._L0200:
                        CLZ
                        CLC
                        RJMP      EDL._L0199
EDL._L0198:
                        CLZ
                        SEC
EDL._L0199:
                        .BRANCH   3, EDL._L0202
                        BREQ      EDL._L0202
                        .BRANCH   1, EDL._L0202
                        BRLO      EDL._L0202
                        .BLOCK    755
                        .LINE     756
                        LDD       _ACCAHI, Y+007h
                        LDD       _ACCALO, Y+006h
                        LDD       _ACCA, Y+005h
                        LDD       _ACCB, Y+004h
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDD       _ACCAHI, Y+003h
                        LDD       _ACCALO, Y+002h
                        LDD       _ACCA, Y+001h
                        LDD       _ACCB, Y+000h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat
                        STS       EDL.PARAM, _ACCB
                        STS       EDL.PARAM+1, _ACCA
                        STS       EDL.PARAM+2, _ACCALO
                        STS       EDL.PARAM+3, _ACCAHI
                        .LINE     757
                        LDI       _ACCA, 0FFh
                        .BRANCH   20,EDL.GetRi_X
                        RJMP      EDL.GetRi_X
                        .ENDBLOCK 758
EDL._L0202:
                        .BLOCK    758
                        .LINE     759
                        LDI       _ACCA, 000h
                        .ENDBLOCK 760
                        .ENDBLOCK 761
EDL.GetRi_X:
                        .LINE     761
                        .BRANCH   19
                        RET
                        .ENDFUNC  761

                        .FUNC     SetLevelDAC_I, 002FDh, 00020h
EDL.SetLevelDAC_I:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 10
                        .BLOCK    769
                        .LINE     771
                        .BRANCH   17,EDL.INITSCALEU
                        RCALL     EDL.INITSCALEU
                        .LINE     772
                        .BRANCH   17,EDL.CALCRANGEI
                        RCALL     EDL.CALCRANGEI
                        .LINE     774
                        LDS       _ACCA, EDL.ShuntRange
                        CPI       _ACCA, 003h
                        LDI       _ACCA, 0FFh
                        BRLO      EDL._L0205
                        BREQ      EDL._L0205
                        CLR       _ACCA
EDL._L0205:
                        PUSH      _ACCA
                        LDS       _ACCB, EDL.ShuntRange
                        LDS       _ACCA, EDL.ShuntSelect
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0
                        BRLO      EDL._L0206
                        LDI       _ACCA, 0FFh
EDL._L0206:
                        POP       _ACCB
                        AND       _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   3, EDL._L0207
                        BREQ      EDL._L0207
                        .BLOCK    774
                        .LINE     775
                        LDS       _ACCA, EDL.ShuntRange
                        STS       EDL.SHUNTSELECT, _ACCA
                        .ENDBLOCK 776
EDL._L0207:
                        .LINE     777
                        LDS       _ACCB, EDL.ShuntSelect
                        LDS       _ACCA, EDL.OldShuntSelect
                        CP        _ACCB, _ACCA
                        .BRANCH   3, EDL._L0211
                        BREQ      EDL._L0211
                        .BLOCK    777
                        .LINE     778
                        LDI       _ACCA, 00000h SHRB 8
                        LDI       _ACCB, 00000h AND 0FFh
                        STS       EDL.DACTEMP, _ACCB
                        STS       EDL.DACTEMP+1, _ACCA
                        .LINE     780
                        LDI       _ACCB, 00002h AND 0FFh
                        .FRAME  0
                        CALL      SYSTEM.MDELAY
                        .ENDBLOCK 781
EDL._L0211:
                        .LINE     782
                        LDS       _ACCA, EDL.ShuntSelect
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.SETSHUNT
                        RCALL     EDL.SETSHUNT
                        ADIW      _FRAMEPTR, 1
                        .LINE     783
                        LDS       _ACCA, EDL.ShuntSelect
                        STS       EDL.OLDSHUNTSELECT, _ACCA
                        .LINE     789
                        LDS       _ACCB, EDL.DCAmp
                        LDS       _ACCA, EDL.DCAmp+1
                        LDS       _ACCALO, EDL.DCAmp+2
                        LDS       _ACCAHI, EDL.DCAmp+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, EDL.DCAmpMod
                        LDS       _ACCA, EDL.DCAmpMod+1
                        LDS       _ACCALO, EDL.DCAmpMod+2
                        LDS       _ACCAHI, EDL.DCAmpMod+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, EDL.DACLSBIarray AND 0FFh
                        LDI       _ACCCHI, EDL.DACLSBIarray SHRB 8
                        LDS       _ACCB, EDL.ShuntSelect
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
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
                        LDI       _ACCCLO, EDL.DACIoffsets AND 0FFh
                        LDI       _ACCCHI, EDL.DACIoffsets SHRB 8
                        LDS       _ACCB, EDL.ShuntSelect
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        CALL      SYSTEM._ReadEEp16
                        SBRS      _ACCA, 7
                        RJMP      EDL._L0214
                        LDI       _ACCAHI, 0FFh
                        LDI       _ACCALO, 0FFh
                        RJMP      EDL._L0215
EDL._L0214:
                        CLR       _ACCAHI
                        CLR       _ACCALO
EDL._L0215:
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        ADD       _ACCB, _ACCBLO
                        ADC       _ACCA, _ACCBHI
                        ADC       _ACCALO, _ACCCLO
                        ADC       _ACCAHI, _ACCCHI
                        STD       Y+009h, _ACCAHI
                        STD       Y+008h, _ACCALO
                        STD       Y+007h, _ACCA
                        STD       Y+006h, _ACCB
                        .LINE     790
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, EDL.DACmax
                        LDS       _ACCA, EDL.DACmax+1
                        LDS       _ACCALO, EDL.DACmax+2
                        LDS       _ACCAHI, EDL.DACmax+3
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
                        BRNE      EDL._L0216
                        CP        _ACCALO, _ACCCLO
                        BRNE      EDL._L0216
                        CP        _ACCA, _ACCBHI
                        BRNE      EDL._L0216
                        CP        _ACCB, _ACCBLO
EDL._L0216:
                        .BRANCH   3, EDL._L0218
                        BREQ      EDL._L0218
                        .BRANCH   1, EDL._L0218
                        BRLO      EDL._L0218
                        .BLOCK    790
                        .LINE     791
                        LDS       _ACCB, EDL.DACmax
                        LDS       _ACCA, EDL.DACmax+1
                        LDS       _ACCALO, EDL.DACmax+2
                        LDS       _ACCAHI, EDL.DACmax+3
                        STD       Y+009h, _ACCAHI
                        STD       Y+008h, _ACCALO
                        STD       Y+007h, _ACCA
                        STD       Y+006h, _ACCB
                        .ENDBLOCK 792
EDL._L0218:
                        .LINE     793
                        LDD       _ACCAHI, Y+009h
                        LDD       _ACCALO, Y+008h
                        LDD       _ACCA, Y+007h
                        LDD       _ACCB, Y+006h
                        LDI       _ACCDLO, 080h
                        EOR       _ACCAHI, _ACCDLO
                        CPI       _ACCAHI, 080h
                        BRNE      EDL._L0221
                        CPI       _ACCALO, 000h
                        BRNE      EDL._L0221
                        CPI       _ACCA, 000h
                        BRNE      EDL._L0221
                        CPI       _ACCB, 000h
EDL._L0221:
                        .BRANCH   2, EDL._L0223
                        BRSH      EDL._L0223
                        .BLOCK    793
                        .LINE     794
                        LDI       _ACCB, 000000000h AND 0FFh
                        LDI       _ACCA, 000000000h SHRB 8
                        LDI       _ACCALO, 000000000h SHRB 16
                        LDI       _ACCAHI, 000000000h SHRB 24
                        STD       Y+009h, _ACCAHI
                        STD       Y+008h, _ACCALO
                        STD       Y+007h, _ACCA
                        STD       Y+006h, _ACCB
                        .ENDBLOCK 795
EDL._L0223:
                        .LINE     796
                        CLI
                        LDI       _ACCA, 0FEH ROLB IntFlag
                        AND       Flags, _ACCA
                        .LINE     797
                        LDD       _ACCAHI, Y+009h
                        LDD       _ACCALO, Y+008h
                        LDD       _ACCA, Y+007h
                        LDD       _ACCB, Y+006h
                        STS       EDL.DACTEMPON, _ACCB
                        STS       EDL.DACTEMPON+1, _ACCA
                        .LINE     798
                        LDI       _ACCA, 1 SHLB IntFlag
                        OR        Flags, _ACCA
                        SEI
                        .LINE     799
                        LDS       _ACCB, EDL.Ipercent
                        LDS       _ACCA, EDL.Ipercent+1
                        SBRS      _ACCA, 7
                        RJMP      EDL._L0226
                        LDI       _ACCAHI, 0FFh
                        LDI       _ACCALO, 0FFh
                        RJMP      EDL._L0227
EDL._L0226:
                        CLR       _ACCAHI
                        CLR       _ACCALO
EDL._L0227:
                        SET
                        BLD       Flags, _SIGN
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.LIntToFloat
                        MOVW      _ACCDLO, _ACCB
                        MOVW      _ACCELO, _ACCALO
                        LDI       _ACCBLO, 000h
                        LDI       _ACCBHI, 000h
                        LDI       _ACCCLO, 0C8h
                        LDI       _ACCCHI, 042h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat_R
                        STD       Y+003h, _ACCAHI
                        STD       Y+002h, _ACCALO
                        STD       Y+001h, _ACCA
                        STD       Y+000h, _ACCB
                        .LINE     801
                        LDS       _ACCB, EDL.DCAmp
                        LDS       _ACCA, EDL.DCAmp+1
                        LDS       _ACCALO, EDL.DCAmp+2
                        LDS       _ACCAHI, EDL.DCAmp+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, EDL.DCAmpMod
                        LDS       _ACCA, EDL.DCAmpMod+1
                        LDS       _ACCALO, EDL.DCAmpMod+2
                        LDS       _ACCAHI, EDL.DCAmpMod+3
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
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, EDL.DACLSBIarray AND 0FFh
                        LDI       _ACCCHI, EDL.DACLSBIarray SHRB 8
                        LDS       _ACCB, EDL.ShuntSelect
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
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
                        LDI       _ACCCLO, EDL.DACIoffsets AND 0FFh
                        LDI       _ACCCHI, EDL.DACIoffsets SHRB 8
                        LDS       _ACCB, EDL.ShuntSelect
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        CALL      SYSTEM._ReadEEp16
                        SBRS      _ACCA, 7
                        RJMP      EDL._L0228
                        LDI       _ACCAHI, 0FFh
                        LDI       _ACCALO, 0FFh
                        RJMP      EDL._L0229
EDL._L0228:
                        CLR       _ACCAHI
                        CLR       _ACCALO
EDL._L0229:
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        ADD       _ACCB, _ACCBLO
                        ADC       _ACCA, _ACCBHI
                        ADC       _ACCALO, _ACCCLO
                        ADC       _ACCAHI, _ACCCHI
                        STD       Y+009h, _ACCAHI
                        STD       Y+008h, _ACCALO
                        STD       Y+007h, _ACCA
                        STD       Y+006h, _ACCB
                        .LINE     802
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, EDL.DACmax
                        LDS       _ACCA, EDL.DACmax+1
                        LDS       _ACCALO, EDL.DACmax+2
                        LDS       _ACCAHI, EDL.DACmax+3
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
                        BRNE      EDL._L0230
                        CP        _ACCALO, _ACCCLO
                        BRNE      EDL._L0230
                        CP        _ACCA, _ACCBHI
                        BRNE      EDL._L0230
                        CP        _ACCB, _ACCBLO
EDL._L0230:
                        .BRANCH   3, EDL._L0232
                        BREQ      EDL._L0232
                        .BRANCH   1, EDL._L0232
                        BRLO      EDL._L0232
                        .BLOCK    802
                        .LINE     803
                        LDS       _ACCB, EDL.DACmax
                        LDS       _ACCA, EDL.DACmax+1
                        LDS       _ACCALO, EDL.DACmax+2
                        LDS       _ACCAHI, EDL.DACmax+3
                        STD       Y+009h, _ACCAHI
                        STD       Y+008h, _ACCALO
                        STD       Y+007h, _ACCA
                        STD       Y+006h, _ACCB
                        .ENDBLOCK 804
EDL._L0232:
                        .LINE     805
                        LDD       _ACCAHI, Y+009h
                        LDD       _ACCALO, Y+008h
                        LDD       _ACCA, Y+007h
                        LDD       _ACCB, Y+006h
                        LDI       _ACCDLO, 080h
                        EOR       _ACCAHI, _ACCDLO
                        CPI       _ACCAHI, 080h
                        BRNE      EDL._L0235
                        CPI       _ACCALO, 000h
                        BRNE      EDL._L0235
                        CPI       _ACCA, 000h
                        BRNE      EDL._L0235
                        CPI       _ACCB, 000h
EDL._L0235:
                        .BRANCH   2, EDL._L0237
                        BRSH      EDL._L0237
                        .BLOCK    805
                        .LINE     806
                        LDI       _ACCB, 000000000h AND 0FFh
                        LDI       _ACCA, 000000000h SHRB 8
                        LDI       _ACCALO, 000000000h SHRB 16
                        LDI       _ACCAHI, 000000000h SHRB 24
                        STD       Y+009h, _ACCAHI
                        STD       Y+008h, _ACCALO
                        STD       Y+007h, _ACCA
                        STD       Y+006h, _ACCB
                        .ENDBLOCK 807
EDL._L0237:
                        .LINE     808
                        CLI
                        LDI       _ACCA, 0FEH ROLB IntFlag
                        AND       Flags, _ACCA
                        .LINE     809
                        LDD       _ACCAHI, Y+009h
                        LDD       _ACCALO, Y+008h
                        LDD       _ACCA, Y+007h
                        LDD       _ACCB, Y+006h
                        STS       EDL.DACTEMPOFF, _ACCB
                        STS       EDL.DACTEMPOFF+1, _ACCA
                        .LINE     810
                        LDI       _ACCA, 1 SHLB IntFlag
                        OR        Flags, _ACCA
                        SEI
                        .LINE     811
                        SBI       00038h, 000h
                        .LINE     812
                        LDS       _ACCA, EDL.ModeSelect
                        CPI       _ACCA, 000h
                        .BRANCH   3, EDL._L0241
                        BREQ      EDL._L0241
                        .BLOCK    812
                        .LINE     813
                        LDS       _ACCA, EDL.OutputEnable
                        CLT
                        TST       _ACCA
                        BREQ      EDL._L0244
                        SET
EDL._L0244:
                        IN        _ACCA, 00035h
                        BLD       _ACCA, 004h
                        OUT       00035h, _ACCA
                        .ENDBLOCK 814
                        .BRANCH   20,EDL._L0242
                        RJMP      EDL._L0242
EDL._L0241:
                        .BLOCK    814
                        .LINE     815
                        CBI       00035h, 004h
                        .ENDBLOCK 816
EDL._L0242:
                        .ENDBLOCK 829
                        .LINE     829
                        .BRANCH   19
                        RET
                        .ENDFUNC  829

                        .FUNC     SetLevelDAC_R, 00340h, 00020h
EDL.SetLevelDAC_R:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 10
                        .BLOCK    836
                        .LINE     838
                        .BRANCH   17,EDL.INITSCALEU
                        RCALL     EDL.INITSCALEU
                        .LINE     839
                        .BRANCH   17,EDL.CALCRANGER
                        RCALL     EDL.CALCRANGER
                        .LINE     840
                        LDS       _ACCB, EDL.ShuntSelect
                        LDS       _ACCA, EDL.OldShuntSelect
                        CP        _ACCB, _ACCA
                        .BRANCH   3, EDL._L0246
                        BREQ      EDL._L0246
                        .BLOCK    840
                        .LINE     841
                        LDI       _ACCA, 00000h SHRB 8
                        LDI       _ACCB, 00000h AND 0FFh
                        STS       EDL.DACTEMP, _ACCB
                        STS       EDL.DACTEMP+1, _ACCA
                        .LINE     843
                        LDI       _ACCB, 00002h AND 0FFh
                        .FRAME  0
                        CALL      SYSTEM.MDELAY
                        .ENDBLOCK 844
EDL._L0246:
                        .LINE     845
                        LDS       _ACCA, EDL.ShuntSelect
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.SETSHUNT
                        RCALL     EDL.SETSHUNT
                        ADIW      _FRAMEPTR, 1
                        .LINE     846
                        LDS       _ACCA, EDL.ShuntSelect
                        STS       EDL.OLDSHUNTSELECT, _ACCA
                        .LINE     853
                        LDS       _ACCB, EDL.DividerU
                        LDS       _ACCA, EDL.DividerU+1
                        LDS       _ACCALO, EDL.DividerU+2
                        LDS       _ACCAHI, EDL.DividerU+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, EDL.DACLSBRarray AND 0FFh
                        LDI       _ACCCHI, EDL.DACLSBRarray SHRB 8
                        LDS       _ACCB, EDL.ShuntSelect
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCB, Z+
                        LD        _ACCA, Z+
                        LD        _ACCALO, Z+
                        LD        _ACCAHI, Z+
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
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
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, EDL.DCohm
                        LDS       _ACCA, EDL.DCohm+1
                        LDS       _ACCALO, EDL.DCohm+2
                        LDS       _ACCAHI, EDL.DCohm+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.FloatToLInt
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, EDL.DACIoffsets AND 0FFh
                        LDI       _ACCCHI, EDL.DACIoffsets SHRB 8
                        LDS       _ACCB, EDL.ShuntSelect
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        CALL      SYSTEM._ReadEEp16
                        SBRS      _ACCA, 7
                        RJMP      EDL._L0249
                        LDI       _ACCAHI, 0FFh
                        LDI       _ACCALO, 0FFh
                        RJMP      EDL._L0250
EDL._L0249:
                        CLR       _ACCAHI
                        CLR       _ACCALO
EDL._L0250:
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        ADD       _ACCB, _ACCBLO
                        ADC       _ACCA, _ACCBHI
                        ADC       _ACCALO, _ACCCLO
                        ADC       _ACCAHI, _ACCCHI
                        STD       Y+009h, _ACCAHI
                        STD       Y+008h, _ACCALO
                        STD       Y+007h, _ACCA
                        STD       Y+006h, _ACCB
                        .LINE     855
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, EDL.DACmax
                        LDS       _ACCA, EDL.DACmax+1
                        LDS       _ACCALO, EDL.DACmax+2
                        LDS       _ACCAHI, EDL.DACmax+3
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
                        BRNE      EDL._L0251
                        CP        _ACCALO, _ACCCLO
                        BRNE      EDL._L0251
                        CP        _ACCA, _ACCBHI
                        BRNE      EDL._L0251
                        CP        _ACCB, _ACCBLO
EDL._L0251:
                        .BRANCH   3, EDL._L0253
                        BREQ      EDL._L0253
                        .BRANCH   1, EDL._L0253
                        BRLO      EDL._L0253
                        .BLOCK    855
                        .LINE     856
                        LDS       _ACCB, EDL.DACmax
                        LDS       _ACCA, EDL.DACmax+1
                        LDS       _ACCALO, EDL.DACmax+2
                        LDS       _ACCAHI, EDL.DACmax+3
                        STD       Y+009h, _ACCAHI
                        STD       Y+008h, _ACCALO
                        STD       Y+007h, _ACCA
                        STD       Y+006h, _ACCB
                        .ENDBLOCK 857
EDL._L0253:
                        .LINE     858
                        LDD       _ACCAHI, Y+009h
                        LDD       _ACCALO, Y+008h
                        LDD       _ACCA, Y+007h
                        LDD       _ACCB, Y+006h
                        LDI       _ACCDLO, 080h
                        EOR       _ACCAHI, _ACCDLO
                        CPI       _ACCAHI, 080h
                        BRNE      EDL._L0256
                        CPI       _ACCALO, 000h
                        BRNE      EDL._L0256
                        CPI       _ACCA, 000h
                        BRNE      EDL._L0256
                        CPI       _ACCB, 000h
EDL._L0256:
                        .BRANCH   2, EDL._L0258
                        BRSH      EDL._L0258
                        .BLOCK    858
                        .LINE     859
                        LDI       _ACCB, 000000000h AND 0FFh
                        LDI       _ACCA, 000000000h SHRB 8
                        LDI       _ACCALO, 000000000h SHRB 16
                        LDI       _ACCAHI, 000000000h SHRB 24
                        STD       Y+009h, _ACCAHI
                        STD       Y+008h, _ACCALO
                        STD       Y+007h, _ACCA
                        STD       Y+006h, _ACCB
                        .ENDBLOCK 860
EDL._L0258:
                        .LINE     861
                        CLI
                        LDI       _ACCA, 0FEH ROLB IntFlag
                        AND       Flags, _ACCA
                        .LINE     862
                        LDD       _ACCAHI, Y+009h
                        LDD       _ACCALO, Y+008h
                        LDD       _ACCA, Y+007h
                        LDD       _ACCB, Y+006h
                        STS       EDL.DACTEMPON, _ACCB
                        STS       EDL.DACTEMPON+1, _ACCA
                        .LINE     863
                        STS       EDL.DACTEMPOFF, _ACCB
                        STS       EDL.DACTEMPOFF+1, _ACCA
                        .LINE     864
                        LDI       _ACCA, 1 SHLB IntFlag
                        OR        Flags, _ACCA
                        SEI
                        .LINE     865
                        CBI       00038h, 000h
                        .LINE     866
                        LDS       _ACCA, EDL.ModeSelect
                        CPI       _ACCA, 000h
                        .BRANCH   3, EDL._L0262
                        BREQ      EDL._L0262
                        .BLOCK    866
                        .LINE     867
                        LDS       _ACCA, EDL.OutputEnable
                        CLT
                        TST       _ACCA
                        BREQ      EDL._L0265
                        SET
EDL._L0265:
                        IN        _ACCA, 00035h
                        BLD       _ACCA, 004h
                        OUT       00035h, _ACCA
                        .ENDBLOCK 868
                        .BRANCH   20,EDL._L0263
                        RJMP      EDL._L0263
EDL._L0262:
                        .BLOCK    868
                        .LINE     869
                        CBI       00035h, 004h
                        .ENDBLOCK 870
EDL._L0263:
                        .ENDBLOCK 878
                        .LINE     878
                        .BRANCH   19
                        RET
                        .ENDFUNC  878

                        .FUNC     SetLevelDAC_P, 00371h, 00020h
EDL.SetLevelDAC_P:
                        .RETURNS   0
                        .BLOCK    883
                        .LINE     884
                        LDI       _ACCA, 0FFh
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.GETVOLTAGE
                        RCALL     EDL.GETVOLTAGE
                        ADIW      _FRAMEPTR, 5
                        .LINE     887
                        LDS       _ACCB, EDL.DCWatt
                        LDS       _ACCA, EDL.DCWatt+1
                        LDS       _ACCALO, EDL.DCWatt+2
                        LDS       _ACCAHI, EDL.DCWatt+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, EDL.Param
                        LDS       _ACCA, EDL.Param+1
                        LDS       _ACCALO, EDL.Param+2
                        LDS       _ACCAHI, EDL.Param+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat
                        STS       EDL.DCAMP, _ACCB
                        STS       EDL.DCAMP+1, _ACCA
                        STS       EDL.DCAMP+2, _ACCALO
                        STS       EDL.DCAMP+3, _ACCAHI
                        .LINE     888
                        .BRANCH   17,EDL.SETLEVELDAC_I
                        RCALL     EDL.SETLEVELDAC_I
                        ADIW      _FRAMEPTR, 10
                        .ENDBLOCK 889
                        .LINE     889
                        .BRANCH   19
                        RET
                        .ENDFUNC  889

                        .FUNC     SerPrompt, 00380h, 00020h
EDL.SerPrompt:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 2
                        .BLOCK    900
                        .LINE     901
                        LDI       _ACCA, 0FFh
                        STS       EDL.SUBCH, _ACCA
                        .LINE     902
                        .BRANCH   17,EDL.WRITECHPREFIX
                        RCALL     EDL.WRITECHPREFIX
                        .LINE     903
                        LDD       _ACCA, Y+002h
                        CPI       _ACCA, 001h
                        .BRANCH   4, EDL._L0267
                        BRNE      EDL._L0267
                        .BLOCK    903
                        .LINE     904
                        LDS       _ACCB, EDL.Status
                        LDS       _ACCA, EDL.ButtonNumber
                        OR        _ACCA, _ACCB
                        ORI       _ACCA, 040h
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 905
                        .BRANCH   20,EDL._L0268
                        RJMP      EDL._L0268
EDL._L0267:
                        .BLOCK    905
                        .LINE     906
                        LDS       _ACCA, EDL.FaultFlags
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      EDL._L0270
                        SER       _ACCA
EDL._L0270:
                        PUSH      _ACCA
                        LDD       _ACCA, Y+002h
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BRNE      EDL._L0271
                        SER       _ACCA
EDL._L0271:
                        POP       _ACCB
                        OR        _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   3, EDL._L0272
                        BREQ      EDL._L0272
                        .BLOCK    906
                        .LINE     907
                        LDS       _ACCB, EDL.Status
                        LDS       _ACCA, EDL.FaultFlags
                        OR        _ACCA, _ACCB
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 908
                        .BRANCH   20,EDL._L0273
                        RJMP      EDL._L0273
EDL._L0272:
                        .BLOCK    908
                        .LINE     909
                        LDS       _ACCB, EDL.Status
                        LDD       _ACCA, Y+002h
                        OR        _ACCA, _ACCB
                        STD       Y+000h, _ACCA
                        .LINE     910
                        LDD       _ACCA, Y+002h
                        CPI       _ACCA, 000h
                        .BRANCH   3, EDL._L0276
                        BREQ      EDL._L0276
                        .BLOCK    910
                        .LINE     911
                        LDS       _ACCBLO, EDL.ErrCount
                        LDS       _ACCBHI, EDL.ErrCount+1
                        ADIW      _ACCBLO, 1
                        STS       EDL.ErrCount, _ACCBLO
                        STS       EDL.ErrCount+1, _ACCBHI
                        .ENDBLOCK 912
EDL._L0276:
                        .ENDBLOCK 913
EDL._L0273:
                        .ENDBLOCK 914
EDL._L0268:
                        .LINE     915
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.Serout SHRB 1
                        LDI       _ACCA, SYSTEM.Serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDD       _ACCA, Y+002h
                        ST        -Y, _ACCA
                        .FRAME  3
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        ST        -Y, _ACCA
                        LDI       _ACCA, 020h
                        ST        -Y, _ACCA
                        .FRAME  6
                        CALL      SYSTEM.Byte2Str
                        .FRAME  2
                        ADIW      _FRAMEPTR, 6
                        .FRAME  0
                        .LINE     916
                        LDS       _ACCA, EDL.FaultFlags
                        CPI       _ACCA, 000h
                        .BRANCH   4, EDL._L0280
                        BRNE      EDL._L0280
                        .BLOCK    916
                        .LINE     917
                        LDI       _ACCA, 020h
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .LINE     918
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.serout SHRB 1
                        LDI       _ACCA, SYSTEM.serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDD       _ACCB, Y+004h
                        CLR       _ACCA
                        LDI       _ACCBLO, 00009h AND 0FFh
                        LDI       _ACCBHI, 00009h SHRB 8
                        CLT
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.MUL16
                        LDI       _ACCCHI, EDL.ErrStrArr SHRB 8
                        LDI       _ACCCLO, EDL.ErrStrArr AND 0FFh
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        CALL      SYSTEM.StrConst2Str
                        ADIW      _FRAMEPTR, 2
                        .FRAME  0
                        .ENDBLOCK 919
                        .BRANCH   20,EDL._L0281
                        RJMP      EDL._L0281
EDL._L0280:
                        .BLOCK    919
                        .LINE     920
                        LDS       _ACCA, EDL.FaultFlags
                        STD       Y+001h, _ACCA
                        .LINE     921
                        .LOOP
                        LDI       _ACCCLO, EDL.i AND 0FFh
                        LDI       _ACCCHI, EDL.i SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 000h
                        ST        Z, _ACCA
                        LDI       _ACCA, 004h
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
EDL._L0286:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        .BRANCH   1, EDL._L0285
                        BRLO      EDL._L0285
                        .BLOCK    922
                        .LINE     922
                        LDD       _ACCA, Y+004h
                        ANDI      _ACCA, 001h
                        CPI       _ACCA, 001h
                        .BRANCH   4, EDL._L0290
                        BRNE      EDL._L0290
                        .BLOCK    922
                        .LINE     923
                        LDI       _ACCA, 020h
                        .FRAME  3
                        CALL      SYSTEM.SEROUT
                        .LINE     924
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.serout SHRB 1
                        LDI       _ACCA, SYSTEM.serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  5
                        MOV       _ACCB, EDL.i
                        CLR       _ACCA
                        LDI       _ACCBLO, 0000Bh AND 0FFh
                        LDI       _ACCBHI, 0000Bh SHRB 8
                        CLT
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.MUL16
                        LDI       _ACCCHI, EDL.FaultStrArr SHRB 8
                        LDI       _ACCCLO, EDL.FaultStrArr AND 0FFh
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        CALL      SYSTEM.StrConst2Str
                        ADIW      _FRAMEPTR, 2
                        .FRAME  3
                        .ENDBLOCK 925
EDL._L0290:
                        .LINE     926
                        LDD       _ACCA, Y+004h
                        LSR       _ACCA
                        STD       Y+004h, _ACCA
                        .ENDBLOCK 927
                        .LINE     927
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   4, EDL._L0286
                        BRNE      EDL._L0286
EDL._L0285:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .ENDBLOCK 928
EDL._L0281:
                        .LINE     929
                        .BRANCH   17,EDL.SERCRLF
                        RCALL     EDL.SERCRLF
                        .ENDBLOCK 930
                        .LINE     930
                        .BRANCH   19
                        RET
                        .ENDFUNC  930

                        .FUNC     IncFacI, 003A6h, 00020h
EDL.IncFacI:
                        .RETURNS   0
                        .BLOCK    935
                        .LINE     936
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 0C8h
                        LDI       _ACCAHI, 042h
                        STS       EDL.INCCOARSEDIV, _ACCB
                        STS       EDL.INCCOARSEDIV+1, _ACCA
                        STS       EDL.INCCOARSEDIV+2, _ACCALO
                        STS       EDL.INCCOARSEDIV+3, _ACCAHI
                        .LINE     937
                        LDI       _ACCA, 040h
                        LDI       _ACCALO, 01Ch
                        LDI       _ACCAHI, 046h
                        STS       EDL.INCFINEDIV, _ACCB
                        STS       EDL.INCFINEDIV+1, _ACCA
                        STS       EDL.INCFINEDIV+2, _ACCALO
                        STS       EDL.INCFINEDIV+3, _ACCAHI
                        .LINE     938
                        LDS       _ACCBLO, EDL.Param
                        LDS       _ACCBHI, EDL.Param+1
                        LDS       _ACCCLO, EDL.Param+2
                        LDS       _ACCCHI, EDL.Param+3
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 080h
                        LDI       _ACCAHI, 03Fh
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      EDL._L0295
                        BRPL      EDL._L0296
                        BRMI      EDL._L0294
EDL._L0296:
                        CLZ
                        CLC
                        RJMP      EDL._L0295
EDL._L0294:
                        CLZ
                        SEC
EDL._L0295:
                        .BRANCH   1, EDL._L0298
                        BRLO      EDL._L0298
                        .BLOCK    938
                        .LINE     939
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 07Ah
                        LDI       _ACCAHI, 044h
                        STS       EDL.INCFINEDIV, _ACCB
                        STS       EDL.INCFINEDIV+1, _ACCA
                        STS       EDL.INCFINEDIV+2, _ACCALO
                        STS       EDL.INCFINEDIV+3, _ACCAHI
                        .ENDBLOCK 940
EDL._L0298:
                        .ENDBLOCK 945
                        .LINE     945
                        .BRANCH   19
                        RET
                        .ENDFUNC  945

                        .FUNC     IncFacR, 003B3h, 00020h
EDL.IncFacR:
                        .RETURNS   0
                        .BLOCK    948
                        .LINE     949
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 020h
                        LDI       _ACCAHI, 041h
                        STS       EDL.INCCOARSEDIV, _ACCB
                        STS       EDL.INCCOARSEDIV+1, _ACCA
                        STS       EDL.INCCOARSEDIV+2, _ACCALO
                        STS       EDL.INCCOARSEDIV+3, _ACCAHI
                        .LINE     950
                        LDS       _ACCBLO, EDL.Param
                        LDS       _ACCBHI, EDL.Param+1
                        LDS       _ACCCLO, EDL.Param+2
                        LDS       _ACCCHI, EDL.Param+3
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      EDL._L0302
                        BRPL      EDL._L0303
                        BRMI      EDL._L0301
EDL._L0303:
                        CLZ
                        CLC
                        RJMP      EDL._L0302
EDL._L0301:
                        CLZ
                        SEC
EDL._L0302:
                        .BRANCH   1, EDL._L0305
                        BRLO      EDL._L0305
                        .BLOCK    950
                        .LINE     951
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 080h
                        LDI       _ACCAHI, 03Fh
                        STS       EDL.INCCOARSEDIV, _ACCB
                        STS       EDL.INCCOARSEDIV+1, _ACCA
                        STS       EDL.INCCOARSEDIV+2, _ACCALO
                        STS       EDL.INCCOARSEDIV+3, _ACCAHI
                        .ENDBLOCK 952
EDL._L0305:
                        .LINE     953
                        LDS       _ACCBLO, EDL.Param
                        LDS       _ACCBHI, EDL.Param+1
                        LDS       _ACCCLO, EDL.Param+2
                        LDS       _ACCCHI, EDL.Param+3
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 0C8h
                        LDI       _ACCAHI, 042h
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      EDL._L0309
                        BRPL      EDL._L0310
                        BRMI      EDL._L0308
EDL._L0310:
                        CLZ
                        CLC
                        RJMP      EDL._L0309
EDL._L0308:
                        CLZ
                        SEC
EDL._L0309:
                        .BRANCH   1, EDL._L0312
                        BRLO      EDL._L0312
                        .BLOCK    953
                        .LINE     954
                        LDI       _ACCB, 0CDh
                        LDI       _ACCA, 0CCh
                        LDI       _ACCALO, 0CCh
                        LDI       _ACCAHI, 03Dh
                        STS       EDL.INCCOARSEDIV, _ACCB
                        STS       EDL.INCCOARSEDIV+1, _ACCA
                        STS       EDL.INCCOARSEDIV+2, _ACCALO
                        STS       EDL.INCCOARSEDIV+3, _ACCAHI
                        .ENDBLOCK 955
EDL._L0312:
                        .LINE     956
                        LDS       _ACCBLO, EDL.Param
                        LDS       _ACCBHI, EDL.Param+1
                        LDS       _ACCCLO, EDL.Param+2
                        LDS       _ACCCHI, EDL.Param+3
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 07Ah
                        LDI       _ACCAHI, 044h
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      EDL._L0316
                        BRPL      EDL._L0317
                        BRMI      EDL._L0315
EDL._L0317:
                        CLZ
                        CLC
                        RJMP      EDL._L0316
EDL._L0315:
                        CLZ
                        SEC
EDL._L0316:
                        .BRANCH   1, EDL._L0319
                        BRLO      EDL._L0319
                        .BLOCK    956
                        .LINE     957
                        LDI       _ACCB, 00Ah
                        LDI       _ACCA, 0D7h
                        LDI       _ACCALO, 023h
                        LDI       _ACCAHI, 03Ch
                        STS       EDL.INCCOARSEDIV, _ACCB
                        STS       EDL.INCCOARSEDIV+1, _ACCA
                        STS       EDL.INCCOARSEDIV+2, _ACCALO
                        STS       EDL.INCCOARSEDIV+3, _ACCAHI
                        .ENDBLOCK 958
EDL._L0319:
                        .LINE     959
                        LDS       _ACCDLO, EDL.IncCoarseDiv
                        LDS       _ACCDHI, EDL.IncCoarseDiv+1
                        LDS       _ACCELO, EDL.IncCoarseDiv+2
                        LDS       _ACCEHI, EDL.IncCoarseDiv+3
                        LDI       _ACCBLO, 000h
                        LDI       _ACCBHI, 000h
                        LDI       _ACCCLO, 0C8h
                        LDI       _ACCCHI, 042h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat_R
                        STS       EDL.INCFINEDIV, _ACCB
                        STS       EDL.INCFINEDIV+1, _ACCA
                        STS       EDL.INCFINEDIV+2, _ACCALO
                        STS       EDL.INCFINEDIV+3, _ACCAHI
                        .ENDBLOCK 964
                        .LINE     964
                        .BRANCH   19
                        RET
                        .ENDFUNC  964

                        .FUNC     IncFacP, 003C7h, 00020h
EDL.IncFacP:
                        .RETURNS   0
                        .BLOCK    968
                        .LINE     969
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 020h
                        LDI       _ACCAHI, 041h
                        STS       EDL.INCCOARSEDIV, _ACCB
                        STS       EDL.INCCOARSEDIV+1, _ACCA
                        STS       EDL.INCCOARSEDIV+2, _ACCALO
                        STS       EDL.INCCOARSEDIV+3, _ACCAHI
                        .LINE     970
                        LDI       _ACCALO, 07Ah
                        LDI       _ACCAHI, 044h
                        STS       EDL.INCFINEDIV, _ACCB
                        STS       EDL.INCFINEDIV+1, _ACCA
                        STS       EDL.INCFINEDIV+2, _ACCALO
                        STS       EDL.INCFINEDIV+3, _ACCAHI
                        .LINE     971
                        LDS       _ACCBLO, EDL.Param
                        LDS       _ACCBHI, EDL.Param+1
                        LDS       _ACCCLO, EDL.Param+2
                        LDS       _ACCCHI, EDL.Param+3
                        LDI       _ACCALO, 020h
                        LDI       _ACCAHI, 041h
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      EDL._L0323
                        BRPL      EDL._L0324
                        BRMI      EDL._L0322
EDL._L0324:
                        CLZ
                        CLC
                        RJMP      EDL._L0323
EDL._L0322:
                        CLZ
                        SEC
EDL._L0323:
                        .BRANCH   1, EDL._L0326
                        BRLO      EDL._L0326
                        .BLOCK    971
                        .LINE     972
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 0C8h
                        LDI       _ACCAHI, 042h
                        STS       EDL.INCFINEDIV, _ACCB
                        STS       EDL.INCFINEDIV+1, _ACCA
                        STS       EDL.INCFINEDIV+2, _ACCALO
                        STS       EDL.INCFINEDIV+3, _ACCAHI
                        .ENDBLOCK 973
EDL._L0326:
                        .ENDBLOCK 978
                        .LINE     978
                        .BRANCH   19
                        RET
                        .ENDFUNC  978

                        .FUNC     IncFacV, 003D4h, 00020h
EDL.IncFacV:
                        .RETURNS   0
                        .BLOCK    981
                        .LINE     982
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 020h
                        LDI       _ACCAHI, 041h
                        STS       EDL.INCCOARSEDIV, _ACCB
                        STS       EDL.INCCOARSEDIV+1, _ACCA
                        STS       EDL.INCCOARSEDIV+2, _ACCALO
                        STS       EDL.INCCOARSEDIV+3, _ACCAHI
                        .LINE     983
                        LDI       _ACCALO, 07Ah
                        LDI       _ACCAHI, 044h
                        STS       EDL.INCFINEDIV, _ACCB
                        STS       EDL.INCFINEDIV+1, _ACCA
                        STS       EDL.INCFINEDIV+2, _ACCALO
                        STS       EDL.INCFINEDIV+3, _ACCAHI
                        .LINE     984
                        LDS       _ACCBLO, EDL.Param
                        LDS       _ACCBHI, EDL.Param+1
                        LDS       _ACCCLO, EDL.Param+2
                        LDS       _ACCCHI, EDL.Param+3
                        LDI       _ACCALO, 020h
                        LDI       _ACCAHI, 041h
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      EDL._L0330
                        BRPL      EDL._L0331
                        BRMI      EDL._L0329
EDL._L0331:
                        CLZ
                        CLC
                        RJMP      EDL._L0330
EDL._L0329:
                        CLZ
                        SEC
EDL._L0330:
                        .BRANCH   1, EDL._L0333
                        BRLO      EDL._L0333
                        .BLOCK    984
                        .LINE     985
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 0C8h
                        LDI       _ACCAHI, 042h
                        STS       EDL.INCFINEDIV, _ACCB
                        STS       EDL.INCFINEDIV+1, _ACCA
                        STS       EDL.INCFINEDIV+2, _ACCALO
                        STS       EDL.INCFINEDIV+3, _ACCAHI
                        .ENDBLOCK 986
EDL._L0333:
                        .ENDBLOCK 991
                        .LINE     991
                        .BRANCH   19
                        RET
                        .ENDFUNC  991

                        .FUNC     RoundIncParam, 003E4h, 00020h
EDL.RoundIncParam:
                        .RETURNS   0
                        .BLOCK    997
                        .LINE     998
                        LDS       _ACCA, EDL.IncrFine
                        COM       _ACCA
                        TST       _ACCA
                        .BRANCH   4,EDL._L0338
                        BRNE      EDL._L0338
                        .BRANCH   20,EDL._L0336
                        RJMP      EDL._L0336
EDL._L0338:
                        .BLOCK    998
                        .LINE     999
                        LDS       _ACCB, EDL.Param
                        LDS       _ACCA, EDL.Param+1
                        LDS       _ACCALO, EDL.Param+2
                        LDS       _ACCAHI, EDL.Param+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, EDL.IncCoarseDiv
                        LDS       _ACCA, EDL.IncCoarseDiv+1
                        LDS       _ACCALO, EDL.IncCoarseDiv+2
                        LDS       _ACCAHI, EDL.IncCoarseDiv+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.RoundFloat
                        STS       EDL.TEMPRI, _ACCB
                        STS       EDL.TEMPRI+1, _ACCA
                        .LINE     1000
                        SBRS      _ACCA, 7
                        RJMP      EDL._L0339
                        LDI       _ACCAHI, 0FFh
                        LDI       _ACCALO, 0FFh
                        RJMP      EDL._L0340
EDL._L0339:
                        CLR       _ACCAHI
                        CLR       _ACCALO
EDL._L0340:
                        SET
                        BLD       Flags, _SIGN
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.LIntToFloat
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, EDL.IncCoarseDiv
                        LDS       _ACCA, EDL.IncCoarseDiv+1
                        LDS       _ACCALO, EDL.IncCoarseDiv+2
                        LDS       _ACCAHI, EDL.IncCoarseDiv+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat
                        STS       EDL.PARAM, _ACCB
                        STS       EDL.PARAM+1, _ACCA
                        STS       EDL.PARAM+2, _ACCALO
                        STS       EDL.PARAM+3, _ACCAHI
                        .LINE     1001
                        LDI       _ACCA, 000h
                        STS       EDL.FIRSTTURN, _ACCA
                        .ENDBLOCK 1007
EDL._L0336:
                        .ENDBLOCK 1008
                        .LINE     1008
                        .BRANCH   19
                        RET
                        .ENDFUNC  1008

                        .FUNC     SetAccParam, 003F2h, 00020h
EDL.SetAccParam:
                        .RETURNS   0
                        .BLOCK    1011
                        .LINE     1012
                        LDS       _ACCA, EDL.IncrFine
                        TST       _ACCA
                        .BRANCH   3, EDL._L0341
                        BREQ      EDL._L0341
                        .BLOCK    1012
                        .LINE     1013
                        LDS       _ACCB, EDL.IncrAccFloat
                        LDS       _ACCA, EDL.IncrAccFloat+1
                        LDS       _ACCALO, EDL.IncrAccFloat+2
                        LDS       _ACCAHI, EDL.IncrAccFloat+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, EDL.IncFineDiv
                        LDS       _ACCA, EDL.IncFineDiv+1
                        LDS       _ACCALO, EDL.IncFineDiv+2
                        LDS       _ACCAHI, EDL.IncFineDiv+3
                        .BRANCH   20, _CSE0011
                        RJMP      _CSE0011
                        .ENDBLOCK 1014
EDL._L0341:
                        .BLOCK    1014
                        .LINE     1015
                        LDS       _ACCB, EDL.IncrAccFloat
                        LDS       _ACCA, EDL.IncrAccFloat+1
                        LDS       _ACCALO, EDL.IncrAccFloat+2
                        LDS       _ACCAHI, EDL.IncrAccFloat+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, EDL.IncCoarseDiv
                        LDS       _ACCA, EDL.IncCoarseDiv+1
                        LDS       _ACCALO, EDL.IncCoarseDiv+2
                        LDS       _ACCAHI, EDL.IncCoarseDiv+3
_CSE0011:                         
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat
                        STS       EDL.INCRACCFLOAT, _ACCB
                        STS       EDL.INCRACCFLOAT+1, _ACCA
                        STS       EDL.INCRACCFLOAT+2, _ACCALO
                        STS       EDL.INCRACCFLOAT+3, _ACCAHI
                        .ENDBLOCK 1016
                        .LINE     1017
                        LDS       _ACCB, EDL.Param
                        LDS       _ACCA, EDL.Param+1
                        LDS       _ACCALO, EDL.Param+2
                        LDS       _ACCAHI, EDL.Param+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, EDL.IncrAccFloat
                        LDS       _ACCA, EDL.IncrAccFloat+1
                        LDS       _ACCALO, EDL.IncrAccFloat+2
                        LDS       _ACCAHI, EDL.IncrAccFloat+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.AddFloat
                        STS       EDL.PARAM, _ACCB
                        STS       EDL.PARAM+1, _ACCA
                        STS       EDL.PARAM+2, _ACCALO
                        STS       EDL.PARAM+3, _ACCAHI
                        .ENDBLOCK 1018
                        .LINE     1018
                        .BRANCH   19
                        RET
                        .ENDFUNC  1018

                        .FUNC     ParamToStr, 003FCh, 00020h
EDL.ParamToStr:
                        .RETURNS   0
                        .BLOCK    1021
                        .LINE     1022
                        LDS       _ACCBLO, EDL.Param
                        LDS       _ACCBHI, EDL.Param+1
                        LDS       _ACCCLO, EDL.Param+2
                        LDS       _ACCCHI, EDL.Param+3
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 000h
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      EDL._L0345
                        BRPL      EDL._L0346
                        BRMI      EDL._L0344
EDL._L0346:
                        CLZ
                        CLC
                        RJMP      EDL._L0345
EDL._L0344:
                        CLZ
                        SEC
EDL._L0345:
                        .BRANCH   1, EDL._L0350
                        BRLO      EDL._L0350
                        .BRANCH   4, EDL._L0348
                        BRNE      EDL._L0348
EDL._L0350:
                        .BLOCK    1022
                        .LINE     1023
                        LDI       _ACCCLO, EDL.ParamStr AND 0FFh
                        LDI       _ACCCHI, EDL.ParamStr SHRB 8
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
                        LDI       _ACCCLO, $St_String6 AND 0FFh
                        LDI       _ACCCHI, $St_String6 SHRB 8
                        CALL      SYSTEM.StrConst2Str
                        .BRANCH   20, _CSE0012
                        RJMP      _CSE0012
                        .FRAME  0
                        .ENDBLOCK 1024
EDL._L0348:
                        .BLOCK    1024
                        .LINE     1025
                        LDI       _ACCCLO, EDL.ParamStr AND 0FFh
                        LDI       _ACCCHI, EDL.ParamStr SHRB 8
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
                        LDS       _ACCB, EDL.Param
                        LDS       _ACCA, EDL.Param+1
                        LDS       _ACCALO, EDL.Param+2
                        LDS       _ACCAHI, EDL.Param+3
                        ST        -Y, _ACCAHI
                        ST        -Y, _ACCALO
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  7
                        LDS       _ACCA, EDL.digits
                        ST        -Y, _ACCA
                        .FRAME  8
                        LDS       _ACCA, EDL.nachkomma
                        ST        -Y, _ACCA
                        .FRAME  9
                        LDI       _ACCA, 030h
                        ST        -Y, _ACCA
                        .FRAME  10
                        CALL      SYSTEM.Float2Str
                        .FRAME  3
_CSE0012:                         
                        LDI       _ACCB, 028h
                        LDD       _ACCA, Y+000h
                        SUB       _ACCB, _ACCA
                        MOV       _ACCA, _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z, _ACCA
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDBLOCK 1026
                        .ENDBLOCK 1027
                        .LINE     1027
                        .BRANCH   19
                        RET
                        .ENDFUNC  1027

                        .FUNC     Setcursor, 00405h, 00020h
EDL.Setcursor:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 2
                        .BLOCK    1031
                        .LINE     1032
                        LDD       _ACCA, Y+002h
                        TST       _ACCA
                        .BRANCH   3, EDL._L0352
                        BREQ      EDL._L0352
                        .BLOCK    1032
                        .LINE     1033
                        LDS       _ACCA, EDL.IncrFine
                        TST       _ACCA
                        .BRANCH   3, EDL._L0355
                        BREQ      EDL._L0355
                        .BLOCK    1033
                        .LINE     1034
                        LDI       _ACCA, 002h
                        .BRANCH   20, _CSE0013
                        RJMP      _CSE0013
                        .ENDBLOCK 1035
EDL._L0355:
                        .BLOCK    1035
                        .LINE     1036
                        LDI       _ACCA, 000h
_CSE0013:                         
                        STD       Y+001h, _ACCA
                        .ENDBLOCK 1037
                        .ENDBLOCK 1038
                        .BRANCH   20,EDL._L0353
                        RJMP      EDL._L0353
EDL._L0352:
                        .BLOCK    1038
                        .LINE     1039
                        LDI       _ACCA, 001h
                        STD       Y+001h, _ACCA
                        .ENDBLOCK 1040
EDL._L0353:
                        .LINE     1041
                        LDI       _ACCA, 000h
                        STD       Y+000h, _ACCA
                        .LINE     1042
                        LDS       _ACCA, EDL.Modify
                        CPI       _ACCA, 000h
                        .BRANCH   4, EDL._L0359
                        BRNE      EDL._L0359
                        .BLOCK    1042
                        .LINE     1043
                        LDI       _ACCA, 001h
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 1044
EDL._L0359:
                        .LINE     1045
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 007h
                        ST        -Y, _ACCA
                        .FRAME  2
                        LDD       _ACCA, Y+002h
                        ST        -Y, _ACCA
                        .FRAME  3
                        .FRAME  0
                        CALL      SYSTEM.LCDXY_M
                        ADIW      _FRAMEPTR, 3
                        .LINE     1046
                        LDD       _ACCA, Y+001h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .ENDBLOCK 1047
                        .LINE     1047
                        .BRANCH   19
                        RET
                        .ENDFUNC  1047

                        .FUNC     SpannungOnLCD, 0041Ah, 00020h
EDL.SpannungOnLCD:
                        .RETURNS   0
                        .BLOCK    1051
                        .LINE     1052
                        LDI       _ACCA, 005h
                        STS       EDL.DIGITS, _ACCA
                        .LINE     1053
                        LDI       _ACCA, 003h
                        STS       EDL.NACHKOMMA, _ACCA
                        .LINE     1054
                        LDS       _ACCBLO, EDL.Param
                        LDS       _ACCBHI, EDL.Param+1
                        LDS       _ACCCLO, EDL.Param+2
                        LDS       _ACCCHI, EDL.Param+3
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 020h
                        LDI       _ACCAHI, 041h
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      EDL._L0363
                        BRPL      EDL._L0364
                        BRMI      EDL._L0362
EDL._L0364:
                        CLZ
                        CLC
                        RJMP      EDL._L0363
EDL._L0362:
                        CLZ
                        SEC
EDL._L0363:
                        .BRANCH   1, EDL._L0366
                        BRLO      EDL._L0366
                        .BLOCK    1054
                        .LINE     1055
                        LDI       _ACCA, 002h
                        STS       EDL.NACHKOMMA, _ACCA
                        .ENDBLOCK 1056
EDL._L0366:
                        .LINE     1057
                        .BRANCH   17,EDL.PARAMTOSTR
                        RCALL     EDL.PARAMTOSTR
                        .LINE     1058
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        ST        -Y, _ACCA
                        .FRAME  2
                        ST        -Y, _ACCA
                        .FRAME  3
                        .FRAME  0
                        CALL      SYSTEM.LCDXY_M
                        ADIW      _FRAMEPTR, 3
                        .LINE     1059
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, EDL.ParamStr AND 0FFh
                        LDI       _ACCCHI, EDL.ParamStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        ADIW      _FRAMEPTR, 2
                        .FRAME  0
                        .LINE     1060
                        LDI       _ACCA, 020h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .LINE     1061
                        LDI       _ACCA, 056h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .LINE     1062
                        LDS       _ACCA, EDL.NoToggle
                        TST       _ACCA
                        .BRANCH   3, EDL._L0369
                        BREQ      EDL._L0369
                        .BLOCK    1062
                        .LINE     1063
                        LDI       _ACCA, 020h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .ENDBLOCK 1064
                        .BRANCH   20,EDL._L0370
                        RJMP      EDL._L0370
EDL._L0369:
                        .BLOCK    1064
                        .LINE     1065
                        LDS       _ACCA, EDL.ToggleTimer
                        CPI       _ACCA, 008h
                        .BRANCH   2, EDL._L0373
                        BRSH      EDL._L0373
                        .BLOCK    1065
                        .LINE     1066
                        LDI       _ACCA, 004h
                        .FRAME  0
                        .BRANCH   20, _CSE0014
                        RJMP      _CSE0014
                        .ENDBLOCK 1067
EDL._L0373:
                        .BLOCK    1067
                        .LINE     1068
                        LDI       _ACCA, 005h
                        .FRAME  0
_CSE0014:                         
                        CALL      SYSTEM.LCDOUT_M
                        .ENDBLOCK 1069
                        .ENDBLOCK 1070
EDL._L0370:
                        .ENDBLOCK 1071
                        .LINE     1071
                        .BRANCH   19
                        RET
                        .ENDFUNC  1071

                        .FUNC     IstSpannungOnLCD, 00432h, 00020h
EDL.IstSpannungOnLCD:
                        .RETURNS   0
                        .BLOCK    1075
                        .LINE     1076
                        LDS       _ACCA, EDL.ToggleTimer
                        CPI       _ACCA, 008h
                        LDI       _ACCA, 0FFh
                        BRLO      EDL._L0376
                        CLR       _ACCA
EDL._L0376:
                        MOV       _ACCB, _ACCA
                        LDS       _ACCA, EDL.NoToggle
                        OR        _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   3, EDL._L0377
                        BREQ      EDL._L0377
                        .BLOCK    1076
                        .LINE     1077
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 0FFh
                        .BRANCH   20, _CSE0015
                        RJMP      _CSE0015
                        .FRAME  1
                        .FRAME  0
                        .ENDBLOCK 1078
EDL._L0377:
                        .BLOCK    1078
                        .LINE     1079
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
_CSE0015:                         
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.GETVOLTAGE
                        CALL      EDL.GETVOLTAGE
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 1080
                        .LINE     1081
                        .BRANCH   17,EDL.SPANNUNGONLCD
                        RCALL     EDL.SPANNUNGONLCD
                        .LINE     1082
                        LDS       _ACCA, EDL.ToggleTimer
                        CPI       _ACCA, 010h
                        .BRANCH   1, EDL._L0381
                        BRLO      EDL._L0381
                        .BLOCK    1082
                        .LINE     1083
                        LDI       _ACCA, 000h
                        STS       EDL.TOGGLETIMER, _ACCA
                        .ENDBLOCK 1084
EDL._L0381:
                        .ENDBLOCK 1085
                        .LINE     1085
                        .BRANCH   19
                        RET
                        .ENDFUNC  1085

                        .FUNC     SollSpannungOnLCD, 0043Fh, 00020h
EDL.SollSpannungOnLCD:
                        .RETURNS   0
                        .BLOCK    1088
                        .LINE     1089
                        LDS       _ACCB, EDL.DCVolt
                        LDS       _ACCA, EDL.DCVolt+1
                        LDS       _ACCALO, EDL.DCVolt+2
                        LDS       _ACCAHI, EDL.DCVolt+3
                        STS       EDL.PARAM, _ACCB
                        STS       EDL.PARAM+1, _ACCA
                        STS       EDL.PARAM+2, _ACCALO
                        STS       EDL.PARAM+3, _ACCAHI
                        .LINE     1090
                        .BRANCH   17,EDL.SPANNUNGONLCD
                        RCALL     EDL.SPANNUNGONLCD
                        .ENDBLOCK 1091
                        .LINE     1091
                        .BRANCH   19
                        RET
                        .ENDFUNC  1091

                        .FUNC     paramdiv1000, 00446h, 00020h
EDL.paramdiv1000:
                        .RETURNS   0
                        .BLOCK    1095
                        .LINE     1096
                        LDS       _ACCB, EDL.Param
                        LDS       _ACCA, EDL.Param+1
                        LDS       _ACCALO, EDL.Param+2
                        LDS       _ACCAHI, EDL.Param+3
                        MOVW      _ACCDLO, _ACCB
                        MOVW      _ACCELO, _ACCALO
                        LDI       _ACCBLO, 000h
                        LDI       _ACCBHI, 000h
                        LDI       _ACCCLO, 07Ah
                        LDI       _ACCCHI, 044h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat_R
                        STS       EDL.PARAM, _ACCB
                        STS       EDL.PARAM+1, _ACCA
                        STS       EDL.PARAM+2, _ACCALO
                        STS       EDL.PARAM+3, _ACCAHI
                        .ENDBLOCK 1097
                        .LINE     1097
                        .BRANCH   19
                        RET
                        .ENDFUNC  1097

                        .FUNC     parammul1000, 0044Bh, 00020h
EDL.parammul1000:
                        .RETURNS   0
                        .BLOCK    1100
                        .LINE     1101
                        LDS       _ACCDLO, EDL.Param
                        LDS       _ACCDHI, EDL.Param+1
                        LDS       _ACCELO, EDL.Param+2
                        LDS       _ACCEHI, EDL.Param+3
                        LDI       _ACCBLO, 000h
                        LDI       _ACCBHI, 000h
                        LDI       _ACCCLO, 07Ah
                        LDI       _ACCCHI, 044h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat_R
                        STS       EDL.PARAM, _ACCB
                        STS       EDL.PARAM+1, _ACCA
                        STS       EDL.PARAM+2, _ACCALO
                        STS       EDL.PARAM+3, _ACCAHI
                        .ENDBLOCK 1102
                        .LINE     1102
                        .BRANCH   19
                        RET
                        .ENDFUNC  1102

                        .FUNC     Prefix_R, 00450h, 00020h
EDL.Prefix_R:
                        .RETURNS   0
                        .BLOCK    1105
                        .LINE     1106
                        LDI       _ACCA, 020h
                        STS       EDL.PREFIX, _ACCA
                        .LINE     1107
                        LDS       _ACCBLO, EDL.Param
                        LDS       _ACCBHI, EDL.Param+1
                        LDS       _ACCCLO, EDL.Param+2
                        LDS       _ACCCHI, EDL.Param+3
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 07Ah
                        LDI       _ACCAHI, 044h
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      EDL._L0385
                        BRPL      EDL._L0386
                        BRMI      EDL._L0384
EDL._L0386:
                        CLZ
                        CLC
                        RJMP      EDL._L0385
EDL._L0384:
                        CLZ
                        SEC
EDL._L0385:
                        .BRANCH   1, EDL._L0388
                        BRLO      EDL._L0388
                        .BLOCK    1107
                        .LINE     1108
                        .BRANCH   17,EDL.PARAMDIV1000
                        RCALL     EDL.PARAMDIV1000
                        .LINE     1109
                        LDI       _ACCA, 06Bh
                        STS       EDL.PREFIX, _ACCA
                        .ENDBLOCK 1110
EDL._L0388:
                        .ENDBLOCK 1111
                        .LINE     1111
                        .BRANCH   19
                        RET
                        .ENDFUNC  1111

                        .FUNC     Prefix_I, 00459h, 00020h
EDL.Prefix_I:
                        .RETURNS   0
                        .BLOCK    1114
                        .LINE     1115
                        LDI       _ACCA, 020h
                        STS       EDL.PREFIX, _ACCA
                        .LINE     1116
                        LDS       _ACCBLO, EDL.Param
                        LDS       _ACCBHI, EDL.Param+1
                        LDS       _ACCCLO, EDL.Param+2
                        LDS       _ACCCHI, EDL.Param+3
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 080h
                        LDI       _ACCAHI, 03Fh
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      EDL._L0392
                        BRPL      EDL._L0393
                        BRMI      EDL._L0391
EDL._L0393:
                        CLZ
                        CLC
                        RJMP      EDL._L0392
EDL._L0391:
                        CLZ
                        SEC
EDL._L0392:
                        LDI       _ACCA, 0FFh
                        BRLO      EDL._L0394
                        CLR       _ACCA
EDL._L0394:
                        MOV       _ACCB, _ACCA
                        LDD       _ACCA, Y+000h
                        AND       _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   3, EDL._L0395
                        BREQ      EDL._L0395
                        .BLOCK    1117
                        .LINE     1117
                        .BRANCH   17,EDL.PARAMMUL1000
                        RCALL     EDL.PARAMMUL1000
                        .LINE     1118
                        LDI       _ACCA, 06Dh
                        STS       EDL.PREFIX, _ACCA
                        .ENDBLOCK 1119
EDL._L0395:
                        .ENDBLOCK 1120
                        .LINE     1120
                        .BRANCH   19
                        RET
                        .ENDFUNC  1120

                        .FUNC     StromOnLCD, 00462h, 00020h
EDL.StromOnLCD:
                        .RETURNS   0
                        .BLOCK    1123
                        .LINE     1124
                        LDI       _ACCA, 005h
                        STS       EDL.DIGITS, _ACCA
                        .LINE     1125
                        LDI       _ACCA, 003h
                        STS       EDL.NACHKOMMA, _ACCA
                        .LINE     1126
                        .BRANCH   17,EDL.PARAMTOSTR
                        RCALL     EDL.PARAMTOSTR
                        .LINE     1127
                        LDI       _ACCCLO, EDL.ParamStr AND 0FFh
                        LDI       _ACCCHI, EDL.ParamStr SHRB 8
                        LDI       _ACCA, 005h
                        CPI       _ACCA, 40
                        BRCS      EDL._L0398
                        LDI       _ACCA, 40
EDL._L0398:
                        ST        Z+, _ACCA
                        .LINE     1129
                        LDS       _ACCA, EDL.Modify
                        CPI       _ACCA, 009h
                        .BRANCH   4, EDL._L0400
                        BRNE      EDL._L0400
                        .BLOCK    1129
                        .LINE     1130
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        ST        -Y, _ACCA
                        .FRAME  2
                        .BRANCH   20, _CSE0016
                        RJMP      _CSE0016
                        .FRAME  3
                        .FRAME  0
                        .ENDBLOCK 1131
EDL._L0400:
                        .BLOCK    1131
                        .LINE     1132
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        ST        -Y, _ACCA
                        .FRAME  2
                        LDI       _ACCA, 001h
_CSE0016:                         
                        ST        -Y, _ACCA
                        .FRAME  3
                        .FRAME  0
                        CALL      SYSTEM.LCDXY_M
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 1133
                        .LINE     1134
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, EDL.ParamStr AND 0FFh
                        LDI       _ACCCHI, EDL.ParamStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        ADIW      _FRAMEPTR, 2
                        .FRAME  0
                        .LINE     1135
                        LDS       _ACCA, EDL.Prefix
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .LINE     1136
                        LDI       _ACCA, 041h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .LINE     1137
                        LDS       _ACCA, EDL.NoToggle
                        TST       _ACCA
                        .BRANCH   3, EDL._L0403
                        BREQ      EDL._L0403
                        .BLOCK    1137
                        .LINE     1138
                        LDI       _ACCA, 020h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .ENDBLOCK 1139
                        .BRANCH   20,EDL._L0404
                        RJMP      EDL._L0404
EDL._L0403:
                        .BLOCK    1139
                        .LINE     1140
                        LDS       _ACCA, EDL.ToggleTimer
                        CPI       _ACCA, 008h
                        .BRANCH   2, EDL._L0407
                        BRSH      EDL._L0407
                        .BLOCK    1140
                        .LINE     1141
                        LDI       _ACCA, 004h
                        .FRAME  0
                        .BRANCH   20, _CSE0017
                        RJMP      _CSE0017
                        .ENDBLOCK 1142
EDL._L0407:
                        .BLOCK    1142
                        .LINE     1143
                        LDI       _ACCA, 005h
                        .FRAME  0
_CSE0017:                         
                        CALL      SYSTEM.LCDOUT_M
                        .ENDBLOCK 1144
                        .ENDBLOCK 1145
EDL._L0404:
                        .ENDBLOCK 1147
                        .LINE     1147
                        .BRANCH   19
                        RET
                        .ENDFUNC  1147

                        .FUNC     WiderstandOnLCD, 0047Dh, 00020h
EDL.WiderstandOnLCD:
                        .RETURNS   0
                        .BLOCK    1150
                        .LINE     1151
                        LDI       _ACCA, 005h
                        STS       EDL.DIGITS, _ACCA
                        .LINE     1152
                        LDI       _ACCA, 003h
                        STS       EDL.NACHKOMMA, _ACCA
                        .LINE     1153
                        LDS       _ACCB, EDL.DCohm
                        LDS       _ACCA, EDL.DCohm+1
                        LDS       _ACCALO, EDL.DCohm+2
                        LDS       _ACCAHI, EDL.DCohm+3
                        STS       EDL.PARAM, _ACCB
                        STS       EDL.PARAM+1, _ACCA
                        STS       EDL.PARAM+2, _ACCALO
                        STS       EDL.PARAM+3, _ACCAHI
                        .LINE     1154
                        .BRANCH   17,EDL.PREFIX_R
                        RCALL     EDL.PREFIX_R
                        .LINE     1155
                        .BRANCH   17,EDL.PARAMTOSTR
                        RCALL     EDL.PARAMTOSTR
                        .LINE     1156
                        LDI       _ACCCLO, EDL.ParamStr AND 0FFh
                        LDI       _ACCCHI, EDL.ParamStr SHRB 8
                        LDI       _ACCA, 005h
                        CPI       _ACCA, 40
                        BRCS      EDL._L0410
                        LDI       _ACCA, 40
EDL._L0410:
                        ST        Z+, _ACCA
                        .LINE     1157
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        ST        -Y, _ACCA
                        .FRAME  2
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  3
                        .FRAME  0
                        CALL      SYSTEM.LCDXY_M
                        ADIW      _FRAMEPTR, 3
                        .LINE     1158
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, EDL.ParamStr AND 0FFh
                        LDI       _ACCCHI, EDL.ParamStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        ADIW      _FRAMEPTR, 2
                        .FRAME  0
                        .LINE     1159
                        LDS       _ACCA, EDL.Prefix
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .LINE     1160
                        LDI       _ACCA, 003h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .LINE     1162
                        LDS       _ACCA, EDL.NoToggle
                        TST       _ACCA
                        .BRANCH   3, EDL._L0411
                        BREQ      EDL._L0411
                        .BLOCK    1162
                        .LINE     1163
                        LDI       _ACCA, 020h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .ENDBLOCK 1164
                        .BRANCH   20,EDL._L0412
                        RJMP      EDL._L0412
EDL._L0411:
                        .BLOCK    1164
                        .LINE     1165
                        LDS       _ACCA, EDL.ToggleTimer
                        CPI       _ACCA, 008h
                        .BRANCH   2, EDL._L0415
                        BRSH      EDL._L0415
                        .BLOCK    1165
                        .LINE     1166
                        LDI       _ACCA, 004h
                        .FRAME  0
                        .BRANCH   20, _CSE0018
                        RJMP      _CSE0018
                        .ENDBLOCK 1167
EDL._L0415:
                        .BLOCK    1167
                        .LINE     1168
                        LDI       _ACCA, 005h
                        .FRAME  0
_CSE0018:                         
                        CALL      SYSTEM.LCDOUT_M
                        .ENDBLOCK 1169
                        .ENDBLOCK 1170
EDL._L0412:
                        .ENDBLOCK 1172
                        .LINE     1172
                        .BRANCH   19
                        RET
                        .ENDFUNC  1172

                        .FUNC     IstStromOnLCD, 00496h, 00020h
EDL.IstStromOnLCD:
                        .RETURNS   0
                        .BLOCK    1175
                        .LINE     1176
                        LDS       _ACCA, EDL.ToggleTimer
                        CPI       _ACCA, 008h
                        LDI       _ACCA, 0FFh
                        BRLO      EDL._L0418
                        CLR       _ACCA
EDL._L0418:
                        MOV       _ACCB, _ACCA
                        LDS       _ACCA, EDL.NoToggle
                        OR        _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   3, EDL._L0419
                        BREQ      EDL._L0419
                        .BLOCK    1176
                        .LINE     1177
                        LDI       _ACCA, 0FFh
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.GETCURRENT
                        CALL      EDL.GETCURRENT
                        ADIW      _FRAMEPTR, 5
                        .LINE     1178
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCA, EDL.ShuntSelect
                        CPI       _ACCA, 003h
                        LDI       _ACCA, 0h
                        .BRANCH   3, EDL._L0423
                        BREQ      EDL._L0423
                        SER       _ACCA
                        .BRANCH   20, EDL._L0423
                        RJMP      EDL._L0423
                        .FRAME  1
                        .FRAME  0
                        .ENDBLOCK 1180
EDL._L0419:
                        .BLOCK    1180
                        .LINE     1181
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.GETCURRENT
                        CALL      EDL.GETCURRENT
                        ADIW      _FRAMEPTR, 5
                        .LINE     1182
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCA, EDL.ShuntSelect
                        CPI       _ACCA, 003h
                        LDI       _ACCA, 0h
                        BREQ      EDL._L0423
                        SER       _ACCA
EDL._L0423:
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.PREFIX_I
                        RCALL     EDL.PREFIX_I
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 1183
                        .LINE     1184
                        .BRANCH   17,EDL.STROMONLCD
                        RCALL     EDL.STROMONLCD
                        .LINE     1186
                        LDS       _ACCA, EDL.ToggleTimer
                        CPI       _ACCA, 010h
                        .BRANCH   1, EDL._L0425
                        BRLO      EDL._L0425
                        .BLOCK    1186
                        .LINE     1187
                        LDI       _ACCA, 000h
                        STS       EDL.TOGGLETIMER, _ACCA
                        .ENDBLOCK 1188
EDL._L0425:
                        .ENDBLOCK 1189
                        .LINE     1189
                        .BRANCH   19
                        RET
                        .ENDFUNC  1189

                        .FUNC     SollStromOnLCD, 004A7h, 00020h
EDL.SollStromOnLCD:
                        .RETURNS   0
                        .BLOCK    1192
                        .LINE     1193
                        LDS       _ACCB, EDL.DCAmp
                        LDS       _ACCA, EDL.DCAmp+1
                        LDS       _ACCALO, EDL.DCAmp+2
                        LDS       _ACCAHI, EDL.DCAmp+3
                        STS       EDL.PARAM, _ACCB
                        STS       EDL.PARAM+1, _ACCA
                        STS       EDL.PARAM+2, _ACCALO
                        STS       EDL.PARAM+3, _ACCAHI
                        .LINE     1194
                        LDI       _ACCA, 0FFh
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.PREFIX_I
                        RCALL     EDL.PREFIX_I
                        ADIW      _FRAMEPTR, 1
                        .LINE     1195
                        .BRANCH   17,EDL.STROMONLCD
                        RCALL     EDL.STROMONLCD
                        .ENDBLOCK 1196
                        .LINE     1196
                        .BRANCH   19
                        RET
                        .ENDFUNC  1196

                        .FUNC     IstLeistungOnLCD, 004AEh, 00020h
EDL.IstLeistungOnLCD:
                        .RETURNS   0
                        .BLOCK    1199
                        .LINE     1200
                        LDI       _ACCA, 005h
                        STS       EDL.DIGITS, _ACCA
                        .LINE     1201
                        LDI       _ACCA, 003h
                        STS       EDL.NACHKOMMA, _ACCA
                        .LINE     1202
                        LDS       _ACCBLO, EDL.Ptot
                        LDS       _ACCBHI, EDL.Ptot+1
                        LDS       _ACCCLO, EDL.Ptot+2
                        LDS       _ACCCHI, EDL.Ptot+3
                        STS       EDL.PARAM, _ACCBLO
                        STS       EDL.PARAM+1, _ACCBHI
                        STS       EDL.PARAM+2, _ACCCLO
                        STS       EDL.PARAM+3, _ACCCHI
                        .LINE     1203
                        LDI       _ACCB, 06Fh
                        LDI       _ACCA, 012h
                        LDI       _ACCALO, 083h
                        LDI       _ACCAHI, 03Ah
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      EDL._L0429
                        BRPL      EDL._L0430
                        BRMI      EDL._L0428
EDL._L0430:
                        CLZ
                        CLC
                        RJMP      EDL._L0429
EDL._L0428:
                        CLZ
                        SEC
EDL._L0429:
                        .BRANCH   2, EDL._L0432
                        BRSH      EDL._L0432
                        .BLOCK    1203
                        .LINE     1204
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 000h
                        STS       EDL.PARAM, _ACCB
                        STS       EDL.PARAM+1, _ACCA
                        STS       EDL.PARAM+2, _ACCALO
                        STS       EDL.PARAM+3, _ACCAHI
                        .ENDBLOCK 1205
EDL._L0432:
                        .LINE     1206
                        .BRANCH   17,EDL.PARAMTOSTR
                        RCALL     EDL.PARAMTOSTR
                        .LINE     1207
                        LDI       _ACCCLO, EDL.ParamStr AND 0FFh
                        LDI       _ACCCHI, EDL.ParamStr SHRB 8
                        LDI       _ACCA, 005h
                        CPI       _ACCA, 40
                        BRCS      EDL._L0435
                        LDI       _ACCA, 40
EDL._L0435:
                        ST        Z+, _ACCA
                        .LINE     1209
                        LDS       _ACCA, EDL.Modify
                        CPI       _ACCA, 000h
                        .BRANCH   3,EDL._L0436
                        BREQ      EDL._L0436
                        CPI       _ACCA, 001h
                        .BRANCH   3,EDL._L0436
                        BREQ      EDL._L0436
EDL._L0436:
                        .BRANCH   4, EDL._L0438
                        BRNE      EDL._L0438
                        .BLOCK    1209
                        .LINE     1210
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        ST        -Y, _ACCA
                        .FRAME  2
                        LDI       _ACCA, 001h
                        .BRANCH   20, _CSE0019
                        RJMP      _CSE0019
                        .FRAME  3
                        .FRAME  0
                        .ENDBLOCK 1211
EDL._L0438:
                        .BLOCK    1211
                        .LINE     1212
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        ST        -Y, _ACCA
                        .FRAME  2
_CSE0019:                         
                        ST        -Y, _ACCA
                        .FRAME  3
                        .FRAME  0
                        CALL      SYSTEM.LCDXY_M
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 1213
                        .LINE     1215
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, EDL.ParamStr AND 0FFh
                        LDI       _ACCCHI, EDL.ParamStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        LDI       _ACCCLO, $St_String7 AND 0FFh
                        LDI       _ACCCHI, $St_String7 SHRB 8
                        CALL      SYSTEM.StrConst2Str
                        ADIW      _FRAMEPTR, 2
                        .FRAME  0
                        .LINE     1217
                        LDS       _ACCA, EDL.NoToggle
                        TST       _ACCA
                        .BRANCH   3, EDL._L0442
                        BREQ      EDL._L0442
                        .BLOCK    1217
                        .LINE     1218
                        LDI       _ACCA, 020h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .ENDBLOCK 1219
                        .BRANCH   20,EDL._L0443
                        RJMP      EDL._L0443
EDL._L0442:
                        .BLOCK    1219
                        .LINE     1220
                        LDS       _ACCA, EDL.ToggleTimer
                        CPI       _ACCA, 008h
                        .BRANCH   2, EDL._L0446
                        BRSH      EDL._L0446
                        .BLOCK    1220
                        .LINE     1221
                        LDI       _ACCA, 004h
                        .FRAME  0
                        .BRANCH   20, _CSE0020
                        RJMP      _CSE0020
                        .ENDBLOCK 1222
EDL._L0446:
                        .BLOCK    1222
                        .LINE     1223
                        LDI       _ACCA, 005h
                        .FRAME  0
_CSE0020:                         
                        CALL      SYSTEM.LCDOUT_M
                        .ENDBLOCK 1224
                        .ENDBLOCK 1225
EDL._L0443:
                        .ENDBLOCK 1227
                        .LINE     1227
                        .BRANCH   19
                        RET
                        .ENDFUNC  1227

                        .FUNC     SollLeistungOnLCD, 004CEh, 00020h
EDL.SollLeistungOnLCD:
                        .RETURNS   0
                        .BLOCK    1231
                        .LINE     1232
                        LDS       _ACCBLO, EDL.DCWatt
                        LDS       _ACCA, EDL.DCWatt+1
                        LDS       _ACCCLO, EDL.DCWatt+2
                        LDS       _ACCCHI, EDL.DCWatt+3
                        STS       EDL.PARAM, _ACCBLO
                        STS       EDL.PARAM+1, _ACCA
                        STS       EDL.PARAM+2, _ACCCLO
                        STS       EDL.PARAM+3, _ACCCHI
                        .LINE     1233
                        LDI       _ACCA, 005h
                        STS       EDL.DIGITS, _ACCA
                        .LINE     1234
                        LDI       _ACCA, 003h
                        STS       EDL.NACHKOMMA, _ACCA
                        .LINE     1235
                        LDS       _ACCBHI, EDL.Param+1
                        LDI       _ACCB, 06Fh
                        LDI       _ACCA, 012h
                        LDI       _ACCALO, 083h
                        LDI       _ACCAHI, 03Ah
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      EDL._L0450
                        BRPL      EDL._L0451
                        BRMI      EDL._L0449
EDL._L0451:
                        CLZ
                        CLC
                        RJMP      EDL._L0450
EDL._L0449:
                        CLZ
                        SEC
EDL._L0450:
                        .BRANCH   2, EDL._L0453
                        BRSH      EDL._L0453
                        .BLOCK    1235
                        .LINE     1236
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 000h
                        STS       EDL.PARAM, _ACCB
                        STS       EDL.PARAM+1, _ACCA
                        STS       EDL.PARAM+2, _ACCALO
                        STS       EDL.PARAM+3, _ACCAHI
                        .ENDBLOCK 1237
EDL._L0453:
                        .LINE     1238
                        .BRANCH   17,EDL.PARAMTOSTR
                        RCALL     EDL.PARAMTOSTR
                        .LINE     1239
                        LDI       _ACCCLO, EDL.ParamStr AND 0FFh
                        LDI       _ACCCHI, EDL.ParamStr SHRB 8
                        LDI       _ACCA, 005h
                        CPI       _ACCA, 40
                        BRCS      EDL._L0456
                        LDI       _ACCA, 40
EDL._L0456:
                        ST        Z+, _ACCA
                        .LINE     1240
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        ST        -Y, _ACCA
                        .FRAME  2
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  3
                        .FRAME  0
                        CALL      SYSTEM.LCDXY_M
                        ADIW      _FRAMEPTR, 3
                        .LINE     1241
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, EDL.ParamStr AND 0FFh
                        LDI       _ACCCHI, EDL.ParamStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        ADIW      _FRAMEPTR, 2
                        .FRAME  0
                        .LINE     1242
                        LDI       _ACCA, 020h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .LINE     1243
                        LDI       _ACCA, 057h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .LINE     1244
                        .BRANCH   17,EDL.ISTSPANNUNGONLCD
                        RCALL     EDL.ISTSPANNUNGONLCD
                        .ENDBLOCK 1245
                        .LINE     1245
                        .BRANCH   19
                        RET
                        .ENDFUNC  1245

                        .FUNC     CapOnLCD, 004DFh, 00020h
EDL.CapOnLCD:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 5
                        .BLOCK    1250
                        .LINE     1251
                        LDS       _ACCB, EDL.Ah
                        LDS       _ACCA, EDL.Ah+1
                        LDS       _ACCALO, EDL.Ah+2
                        LDS       _ACCAHI, EDL.Ah+3
                        STS       EDL.PARAM, _ACCB
                        STS       EDL.PARAM+1, _ACCA
                        STS       EDL.PARAM+2, _ACCALO
                        STS       EDL.PARAM+3, _ACCAHI
                        .LINE     1252
                        LDI       _ACCA, 005h
                        STS       EDL.DIGITS, _ACCA
                        .LINE     1253
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
                        LDI       _ACCA, 004h
                        LDD       _ACCB, Y+000h
                        SUB       _ACCA, _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z, _ACCA
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .LINE     1254
                        LDS       _ACCBLO, EDL.Ah
                        LDS       _ACCBHI, EDL.Ah+1
                        LDS       _ACCCLO, EDL.Ah+2
                        LDS       _ACCCHI, EDL.Ah+3
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 0C8h
                        LDI       _ACCAHI, 042h
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      EDL._L0459
                        BRPL      EDL._L0460
                        BRMI      EDL._L0458
EDL._L0460:
                        CLZ
                        CLC
                        RJMP      EDL._L0459
EDL._L0458:
                        CLZ
                        SEC
EDL._L0459:
                        .BRANCH   2, EDL._L0462
                        BRSH      EDL._L0462
                        .BLOCK    1254
                        .LINE     1255
                        LDI       _ACCA, 002h
                        STS       EDL.NACHKOMMA, _ACCA
                        .ENDBLOCK 1256
EDL._L0462:
                        .LINE     1257
                        LDS       _ACCBLO, EDL.Ah
                        LDS       _ACCBHI, EDL.Ah+1
                        LDS       _ACCCLO, EDL.Ah+2
                        LDS       _ACCCHI, EDL.Ah+3
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 020h
                        LDI       _ACCAHI, 041h
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      EDL._L0466
                        BRPL      EDL._L0467
                        BRMI      EDL._L0465
EDL._L0467:
                        CLZ
                        CLC
                        RJMP      EDL._L0466
EDL._L0465:
                        CLZ
                        SEC
EDL._L0466:
                        .BRANCH   2, EDL._L0469
                        BRSH      EDL._L0469
                        .BLOCK    1257
                        .LINE     1258
                        LDI       _ACCA, 003h
                        STS       EDL.NACHKOMMA, _ACCA
                        .ENDBLOCK 1259
EDL._L0469:
                        .LINE     1260
                        LDS       _ACCBLO, EDL.Ah
                        LDS       _ACCBHI, EDL.Ah+1
                        LDS       _ACCCLO, EDL.Ah+2
                        LDS       _ACCCHI, EDL.Ah+3
                        LDI       _ACCB, 0CDh
                        LDI       _ACCA, 0CCh
                        LDI       _ACCALO, 0CCh
                        LDI       _ACCAHI, 03Dh
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      EDL._L0473
                        BRPL      EDL._L0474
                        BRMI      EDL._L0472
EDL._L0474:
                        CLZ
                        CLC
                        RJMP      EDL._L0473
EDL._L0472:
                        CLZ
                        SEC
EDL._L0473:
                        .BRANCH   2, EDL._L0476
                        BRSH      EDL._L0476
                        .BLOCK    1260
                        .LINE     1261
                        LDS       _ACCDLO, EDL.Param
                        LDS       _ACCDHI, EDL.Param+1
                        LDS       _ACCELO, EDL.Param+2
                        LDS       _ACCEHI, EDL.Param+3
                        LDI       _ACCBLO, 000h
                        LDI       _ACCBHI, 000h
                        LDI       _ACCCLO, 07Ah
                        LDI       _ACCCHI, 044h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat_R
                        STS       EDL.PARAM, _ACCB
                        STS       EDL.PARAM+1, _ACCA
                        STS       EDL.PARAM+2, _ACCALO
                        STS       EDL.PARAM+3, _ACCAHI
                        .LINE     1262
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
                        LDI       _ACCA, 004h
                        LDD       _ACCB, Y+000h
                        SUB       _ACCA, _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z, _ACCA
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .LINE     1263
                        LDI       _ACCA, 004h
                        STS       EDL.DIGITS, _ACCA
                        .LINE     1264
                        LDI       _ACCA, 001h
                        STS       EDL.NACHKOMMA, _ACCA
                        .ENDBLOCK 1265
EDL._L0476:
                        .LINE     1266
                        LDS       _ACCBLO, EDL.Ah
                        LDS       _ACCBHI, EDL.Ah+1
                        LDS       _ACCCLO, EDL.Ah+2
                        LDS       _ACCCHI, EDL.Ah+3
                        LDI       _ACCB, 00Ah
                        LDI       _ACCA, 0D7h
                        LDI       _ACCALO, 023h
                        LDI       _ACCAHI, 03Ch
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      EDL._L0481
                        BRPL      EDL._L0482
                        BRMI      EDL._L0480
EDL._L0482:
                        CLZ
                        CLC
                        RJMP      EDL._L0481
EDL._L0480:
                        CLZ
                        SEC
EDL._L0481:
                        .BRANCH   2, EDL._L0484
                        BRSH      EDL._L0484
                        .BLOCK    1266
                        .LINE     1267
                        LDI       _ACCA, 002h
                        STS       EDL.NACHKOMMA, _ACCA
                        .ENDBLOCK 1268
EDL._L0484:
                        .LINE     1273
                        .BRANCH   17,EDL.PARAMTOSTR
                        RCALL     EDL.PARAMTOSTR
                        .LINE     1274
                        LDI       _ACCCLO, EDL.ParamStr AND 0FFh
                        LDI       _ACCCHI, EDL.ParamStr SHRB 8
                        LDS       _ACCA, EDL.digits
                        CPI       _ACCA, 40
                        BRCS      EDL._L0487
                        LDI       _ACCA, 40
EDL._L0487:
                        ST        Z+, _ACCA
                        .LINE     1275
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        ST        -Y, _ACCA
                        .FRAME  2
                        ST        -Y, _ACCA
                        .FRAME  3
                        .FRAME  0
                        CALL      SYSTEM.LCDXY_M
                        ADIW      _FRAMEPTR, 3
                        .LINE     1276
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, EDL.ParamStr AND 0FFh
                        LDI       _ACCCHI, EDL.ParamStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        MOVW      _ACCCLO, _FRAMEPTR
                        ADIW      _ACCCLO, 000002h
                        CALL      SYSTEM.StrVar2Str
                        ADIW      _FRAMEPTR, 2
                        .FRAME  0
                        .LINE     1278
                        LDS       _ACCB, EDL.Wh
                        LDS       _ACCA, EDL.Wh+1
                        LDS       _ACCALO, EDL.Wh+2
                        LDS       _ACCAHI, EDL.Wh+3
                        STS       EDL.PARAM, _ACCB
                        STS       EDL.PARAM+1, _ACCA
                        STS       EDL.PARAM+2, _ACCALO
                        STS       EDL.PARAM+3, _ACCAHI
                        .LINE     1279
                        LDI       _ACCA, 005h
                        STS       EDL.DIGITS, _ACCA
                        .LINE     1280
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
                        LDI       _ACCA, 004h
                        LDD       _ACCB, Y+000h
                        SUB       _ACCA, _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z, _ACCA
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .LINE     1281
                        LDS       _ACCBLO, EDL.Wh
                        LDS       _ACCBHI, EDL.Wh+1
                        LDS       _ACCCLO, EDL.Wh+2
                        LDS       _ACCCHI, EDL.Wh+3
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 0C8h
                        LDI       _ACCAHI, 042h
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      EDL._L0490
                        BRPL      EDL._L0491
                        BRMI      EDL._L0489
EDL._L0491:
                        CLZ
                        CLC
                        RJMP      EDL._L0490
EDL._L0489:
                        CLZ
                        SEC
EDL._L0490:
                        .BRANCH   2, EDL._L0493
                        BRSH      EDL._L0493
                        .BLOCK    1281
                        .LINE     1282
                        LDI       _ACCA, 002h
                        STS       EDL.NACHKOMMA, _ACCA
                        .ENDBLOCK 1283
EDL._L0493:
                        .LINE     1284
                        LDS       _ACCBLO, EDL.Wh
                        LDS       _ACCBHI, EDL.Wh+1
                        LDS       _ACCCLO, EDL.Wh+2
                        LDS       _ACCCHI, EDL.Wh+3
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 020h
                        LDI       _ACCAHI, 041h
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      EDL._L0497
                        BRPL      EDL._L0498
                        BRMI      EDL._L0496
EDL._L0498:
                        CLZ
                        CLC
                        RJMP      EDL._L0497
EDL._L0496:
                        CLZ
                        SEC
EDL._L0497:
                        .BRANCH   2, EDL._L0500
                        BRSH      EDL._L0500
                        .BLOCK    1284
                        .LINE     1285
                        LDI       _ACCA, 003h
                        STS       EDL.NACHKOMMA, _ACCA
                        .ENDBLOCK 1286
EDL._L0500:
                        .LINE     1287
                        LDS       _ACCBLO, EDL.Wh
                        LDS       _ACCBHI, EDL.Wh+1
                        LDS       _ACCCLO, EDL.Wh+2
                        LDS       _ACCCHI, EDL.Wh+3
                        LDI       _ACCB, 0CDh
                        LDI       _ACCA, 0CCh
                        LDI       _ACCALO, 0CCh
                        LDI       _ACCAHI, 03Dh
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      EDL._L0504
                        BRPL      EDL._L0505
                        BRMI      EDL._L0503
EDL._L0505:
                        CLZ
                        CLC
                        RJMP      EDL._L0504
EDL._L0503:
                        CLZ
                        SEC
EDL._L0504:
                        .BRANCH   2, EDL._L0507
                        BRSH      EDL._L0507
                        .BLOCK    1287
                        .LINE     1288
                        LDS       _ACCDLO, EDL.Param
                        LDS       _ACCDHI, EDL.Param+1
                        LDS       _ACCELO, EDL.Param+2
                        LDS       _ACCEHI, EDL.Param+3
                        LDI       _ACCBLO, 000h
                        LDI       _ACCBHI, 000h
                        LDI       _ACCCLO, 07Ah
                        LDI       _ACCCHI, 044h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat_R
                        STS       EDL.PARAM, _ACCB
                        STS       EDL.PARAM+1, _ACCA
                        STS       EDL.PARAM+2, _ACCALO
                        STS       EDL.PARAM+3, _ACCAHI
                        .LINE     1289
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
                        LDI       _ACCCLO, $St_String11 AND 0FFh
                        LDI       _ACCCHI, $St_String11 SHRB 8
                        CALL      SYSTEM.StrConst2Str
                        LDI       _ACCA, 004h
                        LDD       _ACCB, Y+000h
                        SUB       _ACCA, _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z, _ACCA
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .LINE     1290
                        LDI       _ACCA, 004h
                        STS       EDL.DIGITS, _ACCA
                        .LINE     1291
                        LDI       _ACCA, 001h
                        STS       EDL.NACHKOMMA, _ACCA
                        .ENDBLOCK 1292
EDL._L0507:
                        .LINE     1293
                        LDS       _ACCBLO, EDL.Wh
                        LDS       _ACCBHI, EDL.Wh+1
                        LDS       _ACCCLO, EDL.Wh+2
                        LDS       _ACCCHI, EDL.Wh+3
                        LDI       _ACCB, 00Ah
                        LDI       _ACCA, 0D7h
                        LDI       _ACCALO, 023h
                        LDI       _ACCAHI, 03Ch
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      EDL._L0512
                        BRPL      EDL._L0513
                        BRMI      EDL._L0511
EDL._L0513:
                        CLZ
                        CLC
                        RJMP      EDL._L0512
EDL._L0511:
                        CLZ
                        SEC
EDL._L0512:
                        .BRANCH   2, EDL._L0515
                        BRSH      EDL._L0515
                        .BLOCK    1293
                        .LINE     1294
                        LDI       _ACCA, 002h
                        STS       EDL.NACHKOMMA, _ACCA
                        .ENDBLOCK 1295
EDL._L0515:
                        .LINE     1301
                        .BRANCH   17,EDL.PARAMTOSTR
                        RCALL     EDL.PARAMTOSTR
                        .LINE     1302
                        LDI       _ACCCLO, EDL.ParamStr AND 0FFh
                        LDI       _ACCCHI, EDL.ParamStr SHRB 8
                        LDS       _ACCA, EDL.digits
                        CPI       _ACCA, 40
                        BRCS      EDL._L0518
                        LDI       _ACCA, 40
EDL._L0518:
                        ST        Z+, _ACCA
                        .LINE     1303
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        ST        -Y, _ACCA
                        .FRAME  2
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  3
                        .FRAME  0
                        CALL      SYSTEM.LCDXY_M
                        ADIW      _FRAMEPTR, 3
                        .LINE     1304
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, EDL.ParamStr AND 0FFh
                        LDI       _ACCCHI, EDL.ParamStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        MOVW      _ACCCLO, _FRAMEPTR
                        ADIW      _ACCCLO, 000002h
                        CALL      SYSTEM.StrVar2Str
                        ADIW      _FRAMEPTR, 2
                        .FRAME  0
                        .ENDBLOCK 1305
                        .LINE     1305
                        .BRANCH   19
                        RET
                        .ENDFUNC  1305

                        .FUNC     RiOnLCD, 0051Eh, 00020h
EDL.RiOnLCD:
                        .RETURNS   0
                        .BLOCK    1311
                        .LINE     1312
                        LDI       _ACCA, 005h
                        STS       EDL.DIGITS, _ACCA
                        .LINE     1313
                        LDI       _ACCA, 003h
                        STS       EDL.NACHKOMMA, _ACCA
                        .LINE     1314
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        ST        -Y, _ACCA
                        .FRAME  2
                        ST        -Y, _ACCA
                        .FRAME  3
                        .FRAME  0
                        CALL      SYSTEM.LCDXY_M
                        ADIW      _FRAMEPTR, 3
                        .LINE     1315
                        .BRANCH   17,EDL.GETRI
                        CALL       EDL.GETRI
                        ADIW      _FRAMEPTR, 8
                        TST       _ACCA
                        .BRANCH   3, EDL._L0519
                        BREQ      EDL._L0519
                        .BLOCK    1315
                        .LINE     1316
                        .BRANCH   17,EDL.PARAMTOSTR
                        RCALL     EDL.PARAMTOSTR
                        .LINE     1317
                        LDI       _ACCCLO, EDL.ParamStr AND 0FFh
                        LDI       _ACCCHI, EDL.ParamStr SHRB 8
                        LDI       _ACCA, 005h
                        CPI       _ACCA, 40
                        BRCS      EDL._L0522
                        LDI       _ACCA, 40
EDL._L0522:
                        ST        Z+, _ACCA
                        .ENDBLOCK 1318
                        .BRANCH   20,EDL._L0520
                        RJMP      EDL._L0520
EDL._L0519:
                        .BLOCK    1318
                        .LINE     1319
                        LDI       _ACCCLO, EDL.ParamStr AND 0FFh
                        LDI       _ACCCHI, EDL.ParamStr SHRB 8
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
                        LDI       _ACCA, 028h
                        LDD       _ACCB, Y+000h
                        SUB       _ACCA, _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z, _ACCA
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDBLOCK 1320
EDL._L0520:
                        .LINE     1321
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, EDL.ParamStr AND 0FFh
                        LDI       _ACCCHI, EDL.ParamStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        ADIW      _FRAMEPTR, 2
                        .FRAME  0
                        .LINE     1322
                        LDI       _ACCA, 020h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .LINE     1323
                        LDI       _ACCA, 003h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .ENDBLOCK 1324
                        .LINE     1324
                        .BRANCH   19
                        RET
                        .ENDFUNC  1324

                        .FUNC     WerteOnLCD, 0052Eh, 00020h
EDL.WerteOnLCD:
                        .RETURNS   0
                        .BLOCK    1327
                        .LINE     1328
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        ST        -Y, _ACCA
                        .FRAME  2
                        ST        -Y, _ACCA
                        .FRAME  3
                        .FRAME  0
                        CALL      SYSTEM.LCDXY_M
                        ADIW      _FRAMEPTR, 3
                        .LINE     1330
                        LDS       _ACCA, EDL.Modify
                        .LINE     1331
                        CPI       _ACCA, 6
                        .BRANCH   4, EDL._L0526
                        BRNE      EDL._L0526
                        .BLOCK    1332
                        .LINE     1332
                        LDI       _ACCA, 001h
                        STS       EDL.DIGITS, _ACCA
                        .LINE     1333
                        STS       EDL.NACHKOMMA, _ACCA
                        .LINE     1334
                        LDS       _ACCB, EDL.Temperature
                        LDS       _ACCA, EDL.Temperature+1
                        LDS       _ACCALO, EDL.Temperature+2
                        LDS       _ACCAHI, EDL.Temperature+3
                        STS       EDL.PARAM, _ACCB
                        STS       EDL.PARAM+1, _ACCA
                        STS       EDL.PARAM+2, _ACCALO
                        STS       EDL.PARAM+3, _ACCAHI
                        .LINE     1335
                        .BRANCH   17,EDL.PARAMTOSTR
                        RCALL     EDL.PARAMTOSTR
                        .LINE     1336
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, EDL.ParamStr AND 0FFh
                        LDI       _ACCCHI, EDL.ParamStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        ADIW      _FRAMEPTR, 2
                        .FRAME  0
                        .LINE     1337
                        LDI       _ACCA, 000h
                        .FRAME  0
                        CALL      SYSTEM.LCDCLREOL_M
                        .LINE     1338
                        .BRANCH   20, EDL._L0537
                        RJMP      EDL._L0537
                        .FRAME  1
                        .FRAME  0
                        .ENDBLOCK 1339
EDL._L0526:
                        .LINE     1340
                        CPI       _ACCA, 7
                        .BRANCH   4, EDL._L0529
                        BRNE      EDL._L0529
                        .BLOCK    1341
                        .LINE     1341
                        .BRANCH   17,EDL.RIONLCD
                        RCALL     EDL.RIONLCD
                        .LINE     1342
                        .BRANCH   20, EDL._L0537
                        RJMP      EDL._L0537
                        .FRAME  1
                        .FRAME  0
                        .ENDBLOCK 1343
EDL._L0529:
                        .LINE     1345
                        CPI       _ACCA, 8
                        .BRANCH   4, EDL._L0532
                        BRNE      EDL._L0532
                        .BLOCK    1346
                        .LINE     1346
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,EDL.CAPONLCD
                        RCALL     EDL.CAPONLCD
                        .BRANCH   20, _CSE0023
                        RJMP      _CSE0023
                        .ENDBLOCK 1347
EDL._L0532:
                        .LINE     1348
                        CPI       _ACCA, 9
                        .BRANCH   4, EDL._L0535
                        BRNE      EDL._L0535
                        .BLOCK    1349
                        .LINE     1349
                        LDS       _ACCA, EDL.ModeSelect
                        .LINE     1350
                        CPI       _ACCA, 6
                        .BRANCH   3,EDL._L0538
                        BREQ      EDL._L0538
                        CPI       _ACCA, 5
                        .BRANCH   4, EDL._L0541
                        BRNE      EDL._L0541
EDL._L0538:
                        .BLOCK    1351
                        .LINE     1351
                        .BRANCH   17,EDL.ISTSTROMONLCD
                        RCALL     EDL.ISTSTROMONLCD
                        .ENDBLOCK 1352
                        .BRANCH   20,EDL._L0537
                        RJMP      EDL._L0537
EDL._L0541:
                        .BLOCK    1353
                        .LINE     1354
                        .BRANCH   17,EDL.ISTLEISTUNGONLCD
                        RCALL     EDL.ISTLEISTUNGONLCD
                        .ENDBLOCK 1355
EDL._L0537:
                        .LINE     1356
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
_CSE0024:                         
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.SETCURSOR
                        RCALL     EDL.SETCURSOR
_CSE0023:                         
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 1357
                        .BRANCH   20,EDL._L0524
                        RJMP      EDL._L0524
EDL._L0535:
                        .LINE     1358
                        CPI       _ACCA, 0
                        .BRANCH   4, EDL._L0544
                        BRNE      EDL._L0544
                        .BLOCK    1359
                        .LINE     1359
                        LDS       _ACCA, EDL.ModeSelect
                        .LINE     1360
                        CPI       _ACCA, 3
                        .BRANCH   3,EDL._L0547
                        BREQ      EDL._L0547
                        CPI       _ACCA, 4
                        .BRANCH   4, EDL._L0550
                        BRNE      EDL._L0550
EDL._L0547:
                        .BLOCK    1361
                        .LINE     1361
                        .BRANCH   17,EDL.WIDERSTANDONLCD
                        RCALL     EDL.WIDERSTANDONLCD
                        .LINE     1362
                        LDI       _ACCA, 0FFh
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.SETCURSOR
                        RCALL     EDL.SETCURSOR
                        ADIW      _FRAMEPTR, 3
                        .LINE     1363
                        .BRANCH   17,EDL.ISTSPANNUNGONLCD
                        RCALL     EDL.ISTSPANNUNGONLCD
                        .ENDBLOCK 1364
                        RJMP      EDL._L0524
EDL._L0550:
                        .LINE     1365
                        CPI       _ACCA, 1
                        .BRANCH   3,EDL._L0552
                        BREQ      EDL._L0552
                        CPI       _ACCA, 2
                        .BRANCH   4, EDL._L0555
                        BRNE      EDL._L0555
EDL._L0552:
                        .BLOCK    1366
                        .LINE     1366
                        MOV       _ACCB, _SYSTFLAGS
                        ANDI      _ACCB, 001h
                        .BRANCH   4, EDL._L0558
                        BRNE      EDL._L0558
                        .BLOCK    1366
                        .LINE     1367
                        .BRANCH   17,EDL.ISTSTROMONLCD
                        RCALL     EDL.ISTSTROMONLCD
                        .LINE     1368
                        .BRANCH   17,EDL.ISTSPANNUNGONLCD
                        RCALL     EDL.ISTSPANNUNGONLCD
                        .LINE     1369
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        .BRANCH   20, _CSE0025
                        RJMP      _CSE0025
                        .FRAME  1
                        .FRAME  0
                        .ENDBLOCK 1370
EDL._L0558:
                        .BLOCK    1370
                        .LINE     1371
                        .BRANCH   17,EDL.SOLLSTROMONLCD
                        RCALL     EDL.SOLLSTROMONLCD
                        .LINE     1372
                        .BRANCH   17,EDL.ISTSPANNUNGONLCD
                        RCALL     EDL.ISTSPANNUNGONLCD
                        .LINE     1373
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 0FFh
_CSE0025:                         
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.SETCURSOR
                        RCALL     EDL.SETCURSOR
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 1374
                        .ENDBLOCK 1375
                        RJMP      EDL._L0524
EDL._L0555:
                        .LINE     1376
                        CPI       _ACCA, 5
                        .BRANCH   3,EDL._L0561
                        BREQ      EDL._L0561
                        CPI       _ACCA, 6
                        .BRANCH   4, EDL._L0564
                        BRNE      EDL._L0564
EDL._L0561:
                        .BLOCK    1377
                        .LINE     1377
                        MOV       _ACCB, _SYSTFLAGS
                        ANDI      _ACCB, 001h
                        .BRANCH   4, EDL._L0567
                        BRNE      EDL._L0567
                        .BLOCK    1377
                        .LINE     1378
                        .BRANCH   17,EDL.ISTLEISTUNGONLCD
                        RCALL     EDL.ISTLEISTUNGONLCD
                        .LINE     1379
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        .BRANCH   20, _CSE0026
                        RJMP      _CSE0026
                        .FRAME  1
                        .FRAME  0
                        .ENDBLOCK 1380
EDL._L0567:
                        .BLOCK    1380
                        .LINE     1381
                        .BRANCH   17,EDL.SOLLLEISTUNGONLCD
                        RCALL     EDL.SOLLLEISTUNGONLCD
                        .LINE     1382
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 0FFh
_CSE0026:                         
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.SETCURSOR
                        RCALL     EDL.SETCURSOR
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 1383
                        .ENDBLOCK 1384
EDL._L0564:
                        .ENDBLOCK 1386
                        .BRANCH   20,EDL._L0524
                        RJMP      EDL._L0524
EDL._L0544:
                        .LINE     1387
                        CPI       _ACCA, 1
                        .BRANCH   4, EDL._L0571
                        BRNE      EDL._L0571
                        .BLOCK    1388
                        .LINE     1388
                        LDS       _ACCA, EDL.ModeSelect
                        .LINE     1389
                        CPI       _ACCA, 3
                        .BRANCH   3,EDL._L0574
                        BREQ      EDL._L0574
                        CPI       _ACCA, 4
                        .BRANCH   4, EDL._L0577
                        BRNE      EDL._L0577
EDL._L0574:
                        .BLOCK    1390
                        .LINE     1390
                        .BRANCH   17,EDL.WIDERSTANDONLCD
                        RCALL     EDL.WIDERSTANDONLCD
                        .ENDBLOCK 1391
                        .BRANCH   20,EDL._L0573
                        RJMP      EDL._L0573
EDL._L0577:
                        .LINE     1392
                        CPI       _ACCA, 1
                        .BRANCH   3,EDL._L0579
                        BREQ      EDL._L0579
                        CPI       _ACCA, 2
                        .BRANCH   4, EDL._L0582
                        BRNE      EDL._L0582
EDL._L0579:
                        .BLOCK    1393
                        .LINE     1393
                        .BRANCH   17,EDL.ISTSTROMONLCD
                        RCALL     EDL.ISTSTROMONLCD
                        .ENDBLOCK 1394
                        .BRANCH   20,EDL._L0573
                        RJMP      EDL._L0573
EDL._L0582:
                        .LINE     1395
                        CPI       _ACCA, 5
                        .BRANCH   3,EDL._L0584
                        BREQ      EDL._L0584
                        CPI       _ACCA, 6
                        .BRANCH   4, EDL._L0587
                        BRNE      EDL._L0587
EDL._L0584:
                        .BLOCK    1396
                        .LINE     1396
                        .BRANCH   17,EDL.ISTLEISTUNGONLCD
                        RCALL     EDL.ISTLEISTUNGONLCD
                        .ENDBLOCK 1397
EDL._L0587:
EDL._L0573:
                        .LINE     1399
                        MOV       _ACCB, _SYSTFLAGS
                        ANDI      _ACCB, 001h
                        .BRANCH   4, EDL._L0590
                        BRNE      EDL._L0590
                        .BLOCK    1399
                        .LINE     1400
                        .BRANCH   17,EDL.ISTSPANNUNGONLCD
                        RCALL     EDL.ISTSPANNUNGONLCD
                        .LINE     1401
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        .BRANCH   20, _CSE0027
                        RJMP      _CSE0027
                        .FRAME  1
                        .FRAME  0
                        .ENDBLOCK 1402
EDL._L0590:
                        .BLOCK    1402
                        .LINE     1403
                        .BRANCH   17,EDL.SOLLSPANNUNGONLCD
                        RCALL     EDL.SOLLSPANNUNGONLCD
                        .LINE     1404
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 0FFh
_CSE0027:                         
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.SETCURSOR
                        RCALL     EDL.SETCURSOR
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 1405
                        .ENDBLOCK 1408
                        .BRANCH   20,EDL._L0524
                        RJMP      EDL._L0524
EDL._L0571:
                        .LINE     1409
                        CPI       _ACCA, 2
                        .BRANCH   4, EDL._L0594
                        BRNE      EDL._L0594
                        .BLOCK    1410
                        .LINE     1410
                        LDI       _ACCA, 000h
                        .FRAME  0
                        CALL      SYSTEM.LCDCLREOL_M
                        .LINE     1411
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDS       _ACCB, EDL.ModeSelect
                        CLR       _ACCA
                        LDI       _ACCBLO, 00009h AND 0FFh
                        LDI       _ACCBHI, 00009h SHRB 8
                        CLT
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.MUL16
                        LDI       _ACCCHI, EDL.ModeStrArr SHRB 8
                        LDI       _ACCCLO, EDL.ModeStrArr AND 0FFh
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        CALL      SYSTEM.StrConst2Str
                        .BRANCH   20, _CSE0021
                        RJMP      _CSE0021
                        .FRAME  0
                        .FRAME  1
                        .FRAME  0
                        .ENDBLOCK 1413
EDL._L0594:
                        .LINE     1414
                        CPI       _ACCA, 3
                        .BRANCH   4, EDL._L0598
                        BRNE      EDL._L0598
                        .BLOCK    1415
                        .LINE     1415
                        LDI       _ACCA, 000h
                        .FRAME  0
                        CALL      SYSTEM.LCDCLREOL_M
                        .LINE     1416
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDS       _ACCB, EDL.PWonTime
                        LDS       _ACCA, EDL.PWonTime+1
                        .BRANCH   20, _CSE0022
                        RJMP      _CSE0022
                        .FRAME  4
                        .FRAME  7
                        .FRAME  2
                        .FRAME  0
                        .FRAME  1
                        .FRAME  0
                        .ENDBLOCK 1418
EDL._L0598:
                        .LINE     1419
                        CPI       _ACCA, 4
                        .BRANCH   4, EDL._L0601
                        BRNE      EDL._L0601
                        .BLOCK    1420
                        .LINE     1420
                        LDI       _ACCA, 000h
                        .FRAME  0
                        CALL      SYSTEM.LCDCLREOL_M
                        .LINE     1421
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDS       _ACCB, EDL.PWoffTime
                        LDS       _ACCA, EDL.PWoffTime+1
_CSE0022:                         
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  4
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        ST        -Y, _ACCA
                        LDI       _ACCA, 020h
                        ST        -Y, _ACCA
                        .FRAME  7
                        SET
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.Int2Str
                        .FRAME  2
                        ADIW      _FRAMEPTR, 5
_CSE0021:                         
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     1422
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 0FFh
                        .BRANCH   20, _CSE0024
                        RJMP      _CSE0024
                        .FRAME  1
                        .FRAME  0
                        .ENDBLOCK 1423
EDL._L0601:
                        .LINE     1424
                        CPI       _ACCA, 5
                        .BRANCH   3,EDL._L0605
                        BREQ      EDL._L0605
                        .BRANCH   20,EDL._L0604
                        RJMP      EDL._L0604
EDL._L0605:
                        .BLOCK    1425
                        .LINE     1425
                        LDI       _ACCA, 000h
                        .FRAME  0
                        CALL      SYSTEM.LCDCLREOL_M
                        .LINE     1426
                        LDS       _ACCB, EDL.Ipercent
                        LDS       _ACCA, EDL.Ipercent+1
                        SBRS      _ACCA, 7
                        RJMP      EDL._L0606
                        LDI       _ACCAHI, 0FFh
                        LDI       _ACCALO, 0FFh
                        RJMP      EDL._L0607
EDL._L0606:
                        CLR       _ACCAHI
                        CLR       _ACCALO
EDL._L0607:
                        SET
                        BLD       Flags, _SIGN
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.LIntToFloat
                        STS       EDL.PARAM, _ACCB
                        STS       EDL.PARAM+1, _ACCA
                        STS       EDL.PARAM+2, _ACCALO
                        STS       EDL.PARAM+3, _ACCAHI
                        .LINE     1427
                        LDI       _ACCA, 001h
                        STS       EDL.DIGITS, _ACCA
                        .LINE     1428
                        LDI       _ACCA, 000h
                        STS       EDL.NACHKOMMA, _ACCA
                        .LINE     1429
                        .BRANCH   17,EDL.PARAMTOSTR
                        RCALL     EDL.PARAMTOSTR
                        .LINE     1430
                        LDS       _ACCBLO, EDL.Param
                        LDS       _ACCBHI, EDL.Param+1
                        LDS       _ACCCLO, EDL.Param+2
                        LDS       _ACCCHI, EDL.Param+3
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 000h
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      EDL._L0609
                        BRPL      EDL._L0610
                        BRMI      EDL._L0608
EDL._L0610:
                        CLZ
                        CLC
                        RJMP      EDL._L0609
EDL._L0608:
                        CLZ
                        SEC
EDL._L0609:
                        .BRANCH   4, EDL._L0612
                        BRNE      EDL._L0612
                        .BLOCK    1430
                        .LINE     1431
                        LDI       _ACCCLO, EDL.ParamStr AND 0FFh
                        LDI       _ACCCHI, EDL.ParamStr SHRB 8
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
                        LDD       _ACCB, Y+000h
                        SUB       _ACCA, _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z, _ACCA
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDBLOCK 1432
EDL._L0612:
                        .LINE     1433
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, EDL.ParamStr AND 0FFh
                        LDI       _ACCCHI, EDL.ParamStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        .BRANCH   20, _CSE0021
                        RJMP      _CSE0021
                        .FRAME  0
                        .FRAME  1
                        .FRAME  0
                        .ENDBLOCK 1435
EDL._L0604:
EDL._L0524:
                        .LINE     1438
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        ST        -Y, _ACCA
                        .FRAME  2
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  3
                        .FRAME  0
                        CALL      SYSTEM.LCDXY_M
                        ADIW      _FRAMEPTR, 3
                        .LINE     1439
                        LDI       _ACCCLO, EDL.ParamStr AND 0FFh
                        LDI       _ACCCHI, EDL.ParamStr SHRB 8
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
                        LDS       _ACCB, EDL.Modify
                        CLR       _ACCA
                        LDI       _ACCBLO, 00009h AND 0FFh
                        LDI       _ACCBHI, 00009h SHRB 8
                        CLT
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.MUL16
                        LDI       _ACCCHI, EDL.MenuStrArr SHRB 8
                        LDI       _ACCCLO, EDL.MenuStrArr AND 0FFh
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        CALL      SYSTEM.StrConst2Str
                        LDI       _ACCA, 028h
                        LDD       _ACCB, Y+000h
                        SUB       _ACCA, _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z, _ACCA
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .LINE     1440
                        LDS       _ACCA, EDL.DisplayToggle
                        .LINE     1441
                        CPI       _ACCA, 0
                        .BRANCH   3,EDL._L0617
                        BREQ      EDL._L0617
                        CPI       _ACCA, 1
                        .BRANCH   4, EDL._L0620
                        BRNE      EDL._L0620
EDL._L0617:
                        .BLOCK    1442
                        .LINE     1442
                        LDS       _ACCB, 003E5h
                        SBRS      _ACCB, 003h
                        RJMP      EDL._L0616
                        .BLOCK    1442
                        .LINE     1443
                        LDI       _ACCCLO, EDL.ParamStr AND 0FFh
                        LDI       _ACCCHI, EDL.ParamStr SHRB 8
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
                        LDI       _ACCA, 028h
                        LDD       _ACCB, Y+000h
                        SUB       _ACCA, _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z, _ACCA
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDBLOCK 1444
                        .ENDBLOCK 1445
                        .BRANCH   20,EDL._L0616
                        RJMP      EDL._L0616
EDL._L0620:
                        .LINE     1446
                        CPI       _ACCA, 2
                        .BRANCH   3,EDL._L0626
                        BREQ      EDL._L0626
                        CPI       _ACCA, 3
                        .BRANCH   4, EDL._L0629
                        BRNE      EDL._L0629
EDL._L0626:
                        .BLOCK    1447
                        .LINE     1447
                        LDS       _ACCB, 003E5h
                        SBRS      _ACCB, 002h
                        RJMP      EDL._L0616
                        .BLOCK    1447
                        .LINE     1448
                        LDI       _ACCCLO, EDL.ParamStr AND 0FFh
                        LDI       _ACCCHI, EDL.ParamStr SHRB 8
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
                        LDI       _ACCCLO, $St_String14 AND 0FFh
                        LDI       _ACCCHI, $St_String14 SHRB 8
                        CALL      SYSTEM.StrConst2Str
                        LDI       _ACCA, 028h
                        LDD       _ACCB, Y+000h
                        SUB       _ACCA, _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z, _ACCA
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDBLOCK 1449
                        .ENDBLOCK 1450
                        .BRANCH   20,EDL._L0616
                        RJMP      EDL._L0616
EDL._L0629:
                        .LINE     1451
                        CPI       _ACCA, 4
                        .BRANCH   3,EDL._L0635
                        BREQ      EDL._L0635
                        CPI       _ACCA, 5
                        .BRANCH   4, EDL._L0638
                        BRNE      EDL._L0638
EDL._L0635:
                        .BLOCK    1452
                        .LINE     1452
                        LDS       _ACCB, 003E5h
                        SBRS      _ACCB, 000h
                        RJMP      EDL._L0616
                        .BLOCK    1452
                        .LINE     1453
                        LDI       _ACCCLO, EDL.ParamStr AND 0FFh
                        LDI       _ACCCHI, EDL.ParamStr SHRB 8
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
                        LDI       _ACCCLO, $St_String15 AND 0FFh
                        LDI       _ACCCHI, $St_String15 SHRB 8
                        CALL      SYSTEM.StrConst2Str
                        LDI       _ACCA, 028h
                        LDD       _ACCB, Y+000h
                        SUB       _ACCA, _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z, _ACCA
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDBLOCK 1454
                        .ENDBLOCK 1455
                        .BRANCH   20,EDL._L0616
                        RJMP      EDL._L0616
EDL._L0638:
                        .LINE     1457
                        CPI       _ACCA, 6
                        .BRANCH   3,EDL._L0644
                        BREQ      EDL._L0644
                        CPI       _ACCA, 7
                        .BRANCH   4, EDL._L0647
                        BRNE      EDL._L0647
EDL._L0644:
                        .BLOCK    1458
                        .LINE     1458
                        LDS       _ACCB, 003E5h
                        SBRS      _ACCB, 004h
                        .BRANCH   20,EDL._L0649
                        RJMP      EDL._L0649
                        .BLOCK    1458
                        .LINE     1459
                        LDI       _ACCCLO, EDL.ParamStr AND 0FFh
                        LDI       _ACCCHI, EDL.ParamStr SHRB 8
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
                        LDI       _ACCCLO, $St_String16 AND 0FFh
                        LDI       _ACCCHI, $St_String16 SHRB 8
                        CALL      SYSTEM.StrConst2Str
                        LDI       _ACCA, 028h
                        LDD       _ACCB, Y+000h
                        SUB       _ACCA, _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z, _ACCA
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDBLOCK 1460
EDL._L0649:
                        .ENDBLOCK 1461
EDL._L0647:
EDL._L0616:
                        .LINE     1464
                        LDS       _ACCA, EDL.DisplayToggle
                        INC       _ACCA
                        STS       EDL.DisplayToggle, _ACCA
                        .LINE     1465
                        CPI       _ACCA, 009h
                        .BRANCH   3, EDL._L0654
                        BREQ      EDL._L0654
                        .BRANCH   1, EDL._L0654
                        BRLO      EDL._L0654
                        .BLOCK    1465
                        .LINE     1466
                        LDI       _ACCA, 000h
                        STS       EDL.DISPLAYTOGGLE, _ACCA
                        .ENDBLOCK 1467
EDL._L0654:
                        .LINE     1468
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, EDL.ParamStr AND 0FFh
                        LDI       _ACCCHI, EDL.ParamStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        ADIW      _FRAMEPTR, 2
                        .FRAME  0
                        .ENDBLOCK 1469
                        .LINE     1469
                        .BRANCH   19
                        RET
                        .ENDFUNC  1469

                        .FUNC     WriteParamSer, 005BFh, 00020h
EDL.WriteParamSer:
                        .RETURNS   0
                        .BLOCK    1472
                        .LINE     1473
                        .BRANCH   17,EDL.PARAMTOSTR
                        RCALL     EDL.PARAMTOSTR
                        .LINE     1474
                        .BRANCH   17,EDL.WRITECHPREFIX
                        CALL      EDL.WRITECHPREFIX
                        .LINE     1475
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.serout SHRB 1
                        LDI       _ACCA, SYSTEM.serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, EDL.ParamStr AND 0FFh
                        LDI       _ACCCHI, EDL.ParamStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        ADIW      _FRAMEPTR, 2
                        .FRAME  0
                        .LINE     1476
                        .BRANCH   17,EDL.SERCRLF
                        CALL      EDL.SERCRLF
                        .ENDBLOCK 1477
                        .LINE     1477
                        .BRANCH   19
                        RET
                        .ENDFUNC  1477

                        .FUNC     WriteParamIntSer, 005C7h, 00020h
EDL.WriteParamIntSer:
                        .RETURNS   0
                        .BLOCK    1480
                        .LINE     1481
                        LDI       _ACCCLO, EDL.ParamStr AND 0FFh
                        LDI       _ACCCHI, EDL.ParamStr SHRB 8
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
                        LDS       _ACCB, EDL.ParamInt
                        LDS       _ACCA, EDL.ParamInt+1
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  5
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        ST        -Y, _ACCA
                        LDI       _ACCA, 020h
                        ST        -Y, _ACCA
                        .FRAME  8
                        SET
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.Int2Str
                        .FRAME  3
                        ADIW      _FRAMEPTR, 5
                        LDI       _ACCB, 028h
                        LDD       _ACCA, Y+000h
                        SUB       _ACCB, _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z, _ACCB
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .LINE     1482
                        LDI       _ACCCLO, EDL.ParamStr AND 0FFh
                        LDI       _ACCCHI, EDL.ParamStr SHRB 8
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
                        LDI       _ACCCLO, EDL.ParamStr AND 0FFh
                        LDI       _ACCCHI, EDL.ParamStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LD        _ACCB, Z+
                        LDI       _ACCALO, 1
EDL._L0657:
                        TST       _ACCB
                        BREQ      EDL._L0658
                        LD        _ACCA, Z+
                        CPI       _ACCA, 20h
                        BRNE      EDL._L0658
                        INC       _ACCALO
                        DEC       _ACCB
                        RJMP      EDL._L0657
EDL._L0658:
                        MOV       _ACCA, _ACCB
                        CLR       _ACCAHI
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCAHI
                        SBIW      _ACCCLO, 02h
EDL._L0659:
                        TST       _ACCB
                        BREQ      EDL._L0660
                        LD        _ACCA, Z
                        SBIW      _ACCCLO, 01h
                        CPI       _ACCA, 20h
                        BRNE      EDL._L0660
                        DEC       _ACCB
                        RJMP      EDL._L0659
EDL._L0660:
                        MOV       _ACCA, _ACCB
                        MOV       _ACCB, _ACCALO
                        POP       _ACCCHI
                        POP       _ACCCLO
                        CALL      SYSTEM.StrCopyV
                        LDI       _ACCA, 028h
                        LDD       _ACCB, Y+000h
                        SUB       _ACCA, _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z, _ACCA
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .LINE     1483
                        .BRANCH   17,EDL.WRITECHPREFIX
                        CALL      EDL.WRITECHPREFIX
                        .LINE     1484
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.Serout SHRB 1
                        LDI       _ACCA, SYSTEM.Serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, EDL.ParamStr AND 0FFh
                        LDI       _ACCCHI, EDL.ParamStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        ADIW      _FRAMEPTR, 2
                        .FRAME  0
                        .LINE     1485
                        .BRANCH   17,EDL.SERCRLF
                        CALL      EDL.SERCRLF
                        .ENDBLOCK 1486
                        .LINE     1486
                        .BRANCH   19
                        RET
                        .ENDFUNC  1486

                        .FUNC     CheckLimits, 005D0h, 00020h
EDL.CheckLimits:
                        .RETURNS   0
                        .BLOCK    1489
                        .LINE     1490
                        LDI       _ACCA, 000h
                        STS       EDL.CHECKLIMITERR, _ACCA
                        .LINE     1491
                        STS       EDL.NOTOGGLE, _ACCA
                        .LINE     1492
                        LDS       _ACCBLO, EDL.DCohm
                        LDS       _ACCBHI, EDL.DCohm+1
                        LDS       _ACCCLO, EDL.DCohm+2
                        LDS       _ACCCHI, EDL.DCohm+3
                        LDS       _ACCB, EDL.DCohmMin
                        LDS       _ACCA, EDL.DCohmMin+1
                        LDS       _ACCALO, EDL.DCohmMin+2
                        LDS       _ACCAHI, EDL.DCohmMin+3
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      EDL._L0662
                        BRPL      EDL._L0663
                        BRMI      EDL._L0661
EDL._L0663:
                        CLZ
                        CLC
                        RJMP      EDL._L0662
EDL._L0661:
                        CLZ
                        SEC
EDL._L0662:
                        .BRANCH   2, EDL._L0665
                        BRSH      EDL._L0665
                        .BLOCK    1492
                        .LINE     1493
                        LDS       _ACCB, EDL.DCohmMin
                        LDS       _ACCA, EDL.DCohmMin+1
                        LDS       _ACCALO, EDL.DCohmMin+2
                        LDS       _ACCAHI, EDL.DCohmMin+3
                        STS       EDL.DCOHM, _ACCB
                        STS       EDL.DCOHM+1, _ACCA
                        STS       EDL.DCOHM+2, _ACCALO
                        STS       EDL.DCOHM+3, _ACCAHI
                        .LINE     1494
                        LDI       _ACCA, 005h
                        STS       EDL.CHECKLIMITERR, _ACCA
                        .ENDBLOCK 1495
EDL._L0665:
                        .LINE     1496
                        LDS       _ACCBLO, EDL.DCohm
                        LDS       _ACCBHI, EDL.DCohm+1
                        LDS       _ACCCLO, EDL.DCohm+2
                        LDS       _ACCCHI, EDL.DCohm+3
                        LDS       _ACCB, EDL.DCohmMax
                        LDS       _ACCA, EDL.DCohmMax+1
                        LDS       _ACCALO, EDL.DCohmMax+2
                        LDS       _ACCAHI, EDL.DCohmMax+3
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      EDL._L0669
                        BRPL      EDL._L0670
                        BRMI      EDL._L0668
EDL._L0670:
                        CLZ
                        CLC
                        RJMP      EDL._L0669
EDL._L0668:
                        CLZ
                        SEC
EDL._L0669:
                        .BRANCH   3, EDL._L0672
                        BREQ      EDL._L0672
                        .BRANCH   1, EDL._L0672
                        BRLO      EDL._L0672
                        .BLOCK    1496
                        .LINE     1497
                        LDS       _ACCB, EDL.DCohmMax
                        LDS       _ACCA, EDL.DCohmMax+1
                        LDS       _ACCALO, EDL.DCohmMax+2
                        LDS       _ACCAHI, EDL.DCohmMax+3
                        STS       EDL.DCOHM, _ACCB
                        STS       EDL.DCOHM+1, _ACCA
                        STS       EDL.DCOHM+2, _ACCALO
                        STS       EDL.DCOHM+3, _ACCAHI
                        .LINE     1498
                        LDI       _ACCA, 005h
                        STS       EDL.CHECKLIMITERR, _ACCA
                        .ENDBLOCK 1499
EDL._L0672:
                        .LINE     1500
                        LDS       _ACCBLO, EDL.DCAmp
                        LDS       _ACCBHI, EDL.DCAmp+1
                        LDS       _ACCCLO, EDL.DCAmp+2
                        LDS       _ACCCHI, EDL.DCAmp+3
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 000h
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      EDL._L0676
                        BRPL      EDL._L0677
                        BRMI      EDL._L0675
EDL._L0677:
                        CLZ
                        CLC
                        RJMP      EDL._L0676
EDL._L0675:
                        CLZ
                        SEC
EDL._L0676:
                        .BRANCH   2, EDL._L0679
                        BRSH      EDL._L0679
                        .BLOCK    1500
                        .LINE     1501
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 000h
                        STS       EDL.DCAMP, _ACCB
                        STS       EDL.DCAMP+1, _ACCA
                        STS       EDL.DCAMP+2, _ACCALO
                        STS       EDL.DCAMP+3, _ACCAHI
                        .LINE     1502
                        LDI       _ACCA, 005h
                        STS       EDL.CHECKLIMITERR, _ACCA
                        .ENDBLOCK 1503
EDL._L0679:
                        .LINE     1504
                        LDS       _ACCBHI, EDL.DCAmp+1
                        LDI       _ACCCLO, EDL.Imax AND 0FFh
                        LDI       _ACCCHI, EDL.Imax SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        LDS       _ACCCHI, EDL.DCAmp+3
                        LDS       _ACCCLO, EDL.DCAmp+2
                        LDS       _ACCBLO, EDL.DCAmp
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      EDL._L0683
                        BRPL      EDL._L0684
                        BRMI      EDL._L0682
EDL._L0684:
                        CLZ
                        CLC
                        RJMP      EDL._L0683
EDL._L0682:
                        CLZ
                        SEC
EDL._L0683:
                        .BRANCH   3, EDL._L0686
                        BREQ      EDL._L0686
                        .BRANCH   1, EDL._L0686
                        BRLO      EDL._L0686
                        .BLOCK    1504
                        .LINE     1505
                        LDI       _ACCCLO, EDL.Imax AND 0FFh
                        LDI       _ACCCHI, EDL.Imax SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        STS       EDL.DCAMP, _ACCB
                        STS       EDL.DCAMP+1, _ACCA
                        STS       EDL.DCAMP+2, _ACCALO
                        STS       EDL.DCAMP+3, _ACCAHI
                        .LINE     1506
                        LDI       _ACCA, 005h
                        STS       EDL.CHECKLIMITERR, _ACCA
                        .ENDBLOCK 1507
EDL._L0686:
                        .LINE     1508
                        LDS       _ACCB, EDL.Ipercent
                        LDS       _ACCA, EDL.Ipercent+1
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        CPI       _ACCA, 080h
                        BRNE      EDL._L0689
                        CPI       _ACCB, 000h
EDL._L0689:
                        .BRANCH   2, EDL._L0691
                        BRSH      EDL._L0691
                        .BLOCK    1508
                        .LINE     1509
                        LDI       _ACCA, 00000h SHRB 8
                        LDI       _ACCB, 00000h AND 0FFh
                        STS       EDL.IPERCENT, _ACCB
                        STS       EDL.IPERCENT+1, _ACCA
                        .LINE     1510
                        LDI       _ACCA, 005h
                        STS       EDL.CHECKLIMITERR, _ACCA
                        .ENDBLOCK 1511
EDL._L0691:
                        .LINE     1512
                        LDS       _ACCB, EDL.Ipercent
                        LDS       _ACCA, EDL.Ipercent+1
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        CPI       _ACCA, 080h
                        BRNE      EDL._L0694
                        CPI       _ACCB, 064h
EDL._L0694:
                        .BRANCH   1, EDL._L0696
                        BRLO      EDL._L0696
                        .BLOCK    1512
                        .LINE     1513
                        LDI       _ACCA, 0FFh
                        STS       EDL.NOTOGGLE, _ACCA
                        .LINE     1514
                        LDI       _ACCA, 00064h SHRB 8
                        LDI       _ACCB, 00064h AND 0FFh
                        STS       EDL.IPERCENT, _ACCB
                        STS       EDL.IPERCENT+1, _ACCA
                        .LINE     1515
                        LDI       _ACCA, 005h
                        STS       EDL.CHECKLIMITERR, _ACCA
                        .ENDBLOCK 1516
EDL._L0696:
                        .LINE     1517
                        LDS       _ACCB, EDL.PWonTime
                        LDS       _ACCA, EDL.PWonTime+1
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        CPI       _ACCA, 080h
                        BRNE      EDL._L0699
                        CPI       _ACCB, 001h
EDL._L0699:
                        .BRANCH   2, EDL._L0701
                        BRSH      EDL._L0701
                        .BLOCK    1517
                        .LINE     1518
                        LDI       _ACCA, 00001h SHRB 8
                        LDI       _ACCB, 00001h AND 0FFh
                        STS       EDL.PWONTIME, _ACCB
                        STS       EDL.PWONTIME+1, _ACCA
                        .LINE     1519
                        LDI       _ACCA, 005h
                        STS       EDL.CHECKLIMITERR, _ACCA
                        .ENDBLOCK 1520
EDL._L0701:
                        .LINE     1521
                        LDS       _ACCB, EDL.PWoffTime
                        LDS       _ACCA, EDL.PWoffTime+1
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        CPI       _ACCA, 080h
                        BRNE      EDL._L0704
                        CPI       _ACCB, 000h
EDL._L0704:
                        .BRANCH   2, EDL._L0706
                        BRSH      EDL._L0706
                        .BLOCK    1521
                        .LINE     1522
                        LDI       _ACCA, 00000h SHRB 8
                        LDI       _ACCB, 00000h AND 0FFh
                        STS       EDL.PWOFFTIME, _ACCB
                        STS       EDL.PWOFFTIME+1, _ACCA
                        .LINE     1523
                        LDI       _ACCA, 005h
                        STS       EDL.CHECKLIMITERR, _ACCA
                        .ENDBLOCK 1524
EDL._L0706:
                        .LINE     1525
                        LDS       _ACCB, EDL.PWoffTime
                        LDS       _ACCA, EDL.PWoffTime+1
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        CPI       _ACCA, 080h
                        BRNE      EDL._L0709
                        CPI       _ACCB, 000h
EDL._L0709:
                        .BRANCH   4, EDL._L0711
                        BRNE      EDL._L0711
                        .BLOCK    1525
                        .LINE     1526
                        LDI       _ACCA, 0FFh
                        STS       EDL.NOTOGGLE, _ACCA
                        .ENDBLOCK 1527
EDL._L0711:
                        .LINE     1528
                        LDS       _ACCA, EDL.Trackchannel
                        CPI       _ACCA, 07Fh
                        .BRANCH   3, EDL._L0715
                        BREQ      EDL._L0715
                        .BRANCH   1, EDL._L0715
                        BRLO      EDL._L0715
                        .BLOCK    1528
                        .LINE     1529
                        LDI       _ACCA, 0FFh
                        STS       EDL.TRACKCHANNEL, _ACCA
                        .ENDBLOCK 1530
                        .BRANCH   20,EDL._L0716
                        RJMP      EDL._L0716
EDL._L0715:
                        .BLOCK    1530
                        .LINE     1531
                        LDS       _ACCA, EDL.Trackchannel
                        CPI       _ACCA, 007h
                        .BRANCH   3, EDL._L0719
                        BREQ      EDL._L0719
                        .BRANCH   1, EDL._L0719
                        BRLO      EDL._L0719
                        .BLOCK    1531
                        .LINE     1532
                        LDI       _ACCA, 007h
                        STS       EDL.TRACKCHANNEL, _ACCA
                        .ENDBLOCK 1533
EDL._L0719:
                        .ENDBLOCK 1534
EDL._L0716:
                        .LINE     1535
                        LDS       _ACCB, EDL.ModeSelect
                        LDI       _ACCA, 080h
                        CP        _ACCB, _ACCA
                        .BRANCH   1, EDL._L0723
                        BRLO      EDL._L0723
                        .BLOCK    1535
                        .LINE     1536
                        LDI       _ACCA, 000h
                        STS       EDL.MODESELECT, _ACCA
                        .LINE     1537
                        LDI       _ACCA, 005h
                        STS       EDL.CHECKLIMITERR, _ACCA
                        .ENDBLOCK 1538
EDL._L0723:
                        .LINE     1540
                        LDS       _ACCA, EDL.ModeSelect
                        CPI       _ACCA, 006h
                        .BRANCH   3, EDL._L0727
                        BREQ      EDL._L0727
                        .BRANCH   1, EDL._L0727
                        BRLO      EDL._L0727
                        .BLOCK    1540
                        .LINE     1541
                        LDI       _ACCA, 006h
                        STS       EDL.MODESELECT, _ACCA
                        .LINE     1542
                        LDI       _ACCA, 005h
                        STS       EDL.CHECKLIMITERR, _ACCA
                        .ENDBLOCK 1543
EDL._L0727:
                        .LINE     1544
                        LDS       _ACCBHI, EDL.DCWatt+1
                        LDI       _ACCCLO, EDL.Pmax AND 0FFh
                        LDI       _ACCCHI, EDL.Pmax SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        LDS       _ACCCHI, EDL.DCWatt+3
                        LDS       _ACCCLO, EDL.DCWatt+2
                        LDS       _ACCBLO, EDL.DCWatt
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      EDL._L0731
                        BRPL      EDL._L0732
                        BRMI      EDL._L0730
EDL._L0732:
                        CLZ
                        CLC
                        RJMP      EDL._L0731
EDL._L0730:
                        CLZ
                        SEC
EDL._L0731:
                        .BRANCH   3, EDL._L0734
                        BREQ      EDL._L0734
                        .BRANCH   1, EDL._L0734
                        BRLO      EDL._L0734
                        .BLOCK    1544
                        .LINE     1545
                        LDI       _ACCCLO, EDL.Pmax AND 0FFh
                        LDI       _ACCCHI, EDL.Pmax SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        STS       EDL.DCWATT, _ACCB
                        STS       EDL.DCWATT+1, _ACCA
                        STS       EDL.DCWATT+2, _ACCALO
                        STS       EDL.DCWATT+3, _ACCAHI
                        .ENDBLOCK 1546
EDL._L0734:
                        .LINE     1547
                        LDS       _ACCBLO, EDL.DCWatt
                        LDS       _ACCBHI, EDL.DCWatt+1
                        LDS       _ACCCLO, EDL.DCWatt+2
                        LDS       _ACCCHI, EDL.DCWatt+3
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 000h
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      EDL._L0738
                        BRPL      EDL._L0739
                        BRMI      EDL._L0737
EDL._L0739:
                        CLZ
                        CLC
                        RJMP      EDL._L0738
EDL._L0737:
                        CLZ
                        SEC
EDL._L0738:
                        .BRANCH   2, EDL._L0741
                        BRSH      EDL._L0741
                        .BLOCK    1547
                        .LINE     1548
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 000h
                        STS       EDL.DCWATT, _ACCB
                        STS       EDL.DCWATT+1, _ACCA
                        STS       EDL.DCWATT+2, _ACCALO
                        STS       EDL.DCWATT+3, _ACCAHI
                        .LINE     1549
                        LDI       _ACCA, 005h
                        STS       EDL.CHECKLIMITERR, _ACCA
                        .ENDBLOCK 1550
EDL._L0741:
                        .LINE     1551
                        LDS       _ACCA, EDL.ModeSelect
                        CPI       _ACCA, 001h
                        .BRANCH   3,EDL._L0744
                        BREQ      EDL._L0744
                        CPI       _ACCA, 003h
                        .BRANCH   3,EDL._L0744
                        BREQ      EDL._L0744
                        CPI       _ACCA, 005h
                        .BRANCH   3,EDL._L0744
                        BREQ      EDL._L0744
EDL._L0744:
                        .BRANCH   4, EDL._L0746
                        BRNE      EDL._L0746
                        .BLOCK    1551
                        .LINE     1552
                        LDS       _ACCBHI, EDL.DCVolt+1
                        LDI       _ACCCLO, EDL.UmaxHi AND 0FFh
                        LDI       _ACCCHI, EDL.UmaxHi SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        LDS       _ACCCHI, EDL.DCVolt+3
                        LDS       _ACCCLO, EDL.DCVolt+2
                        LDS       _ACCBLO, EDL.DCVolt
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      EDL._L0750
                        BRPL      EDL._L0751
                        BRMI      EDL._L0749
EDL._L0751:
                        CLZ
                        CLC
                        RJMP      EDL._L0750
EDL._L0749:
                        CLZ
                        SEC
EDL._L0750:
                        .BRANCH   3,EDL._L0747
                        BREQ      EDL._L0747
                        .BRANCH   1,EDL._L0747
                        BRLO      EDL._L0747
                        .BLOCK    1552
                        .LINE     1553
                        LDI       _ACCCLO, EDL.UmaxHi AND 0FFh
                        LDI       _ACCCHI, EDL.UmaxHi SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        STS       EDL.DCVOLT, _ACCB
                        STS       EDL.DCVOLT+1, _ACCA
                        STS       EDL.DCVOLT+2, _ACCALO
                        STS       EDL.DCVOLT+3, _ACCAHI
                        .ENDBLOCK 1554
                        .ENDBLOCK 1555
                        .BRANCH   20,EDL._L0747
                        RJMP      EDL._L0747
EDL._L0746:
                        .BLOCK    1555
                        .LINE     1556
                        LDS       _ACCBHI, EDL.DCVolt+1
                        LDI       _ACCCLO, EDL.UmaxLo AND 0FFh
                        LDI       _ACCCHI, EDL.UmaxLo SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        LDS       _ACCCHI, EDL.DCVolt+3
                        LDS       _ACCCLO, EDL.DCVolt+2
                        LDS       _ACCBLO, EDL.DCVolt
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      EDL._L0757
                        BRPL      EDL._L0758
                        BRMI      EDL._L0756
EDL._L0758:
                        CLZ
                        CLC
                        RJMP      EDL._L0757
EDL._L0756:
                        CLZ
                        SEC
EDL._L0757:
                        .BRANCH   3, EDL._L0760
                        BREQ      EDL._L0760
                        .BRANCH   1, EDL._L0760
                        BRLO      EDL._L0760
                        .BLOCK    1556
                        .LINE     1557
                        LDI       _ACCCLO, EDL.UmaxLo AND 0FFh
                        LDI       _ACCCHI, EDL.UmaxLo SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        STS       EDL.DCVOLT, _ACCB
                        STS       EDL.DCVOLT+1, _ACCA
                        STS       EDL.DCVOLT+2, _ACCALO
                        STS       EDL.DCVOLT+3, _ACCAHI
                        .ENDBLOCK 1558
EDL._L0760:
                        .ENDBLOCK 1559
EDL._L0747:
                        .LINE     1560
                        LDS       _ACCBLO, EDL.DCVolt
                        LDS       _ACCBHI, EDL.DCVolt+1
                        LDS       _ACCCLO, EDL.DCVolt+2
                        LDS       _ACCCHI, EDL.DCVolt+3
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 000h
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      EDL._L0764
                        BRPL      EDL._L0765
                        BRMI      EDL._L0763
EDL._L0765:
                        CLZ
                        CLC
                        RJMP      EDL._L0764
EDL._L0763:
                        CLZ
                        SEC
EDL._L0764:
                        .BRANCH   2, EDL._L0767
                        BRSH      EDL._L0767
                        .BLOCK    1560
                        .LINE     1561
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 000h
                        STS       EDL.DCVOLT, _ACCB
                        STS       EDL.DCVOLT+1, _ACCA
                        STS       EDL.DCVOLT+2, _ACCALO
                        STS       EDL.DCVOLT+3, _ACCAHI
                        .LINE     1562
                        LDI       _ACCA, 005h
                        STS       EDL.CHECKLIMITERR, _ACCA
                        .ENDBLOCK 1563
EDL._L0767:
                        .LINE     1565
                        LDS       _ACCA, EDL.ModeSelect
                        CPI       _ACCA, 003h
                        .BRANCH   1, EDL._L0771
                        BRLO      EDL._L0771
                        .BLOCK    1566
                        .LINE     1566
                        LDI       _ACCA, 0FFh
                        STS       EDL.NOTOGGLE, _ACCA
                        .ENDBLOCK 1567
EDL._L0771:
                        .ENDBLOCK 1568
                        .LINE     1568
                        .BRANCH   19
                        RET
                        .ENDFUNC  1568


                        .FILE     EDL-Parser.pas
                        .FUNC     ParseGetParam, 00018h, 00020h
EDL.ParseGetParam:
                        .RETURNS   0
                        .BLOCK    25
                        .LINE     26
                        LDI       _ACCA, 001h
                        STS       EDL.DIGITS, _ACCA
                        .LINE     27
                        LDI       _ACCA, 004h
                        STS       EDL.NACHKOMMA, _ACCA
                        .LINE     28
                        LDS       _ACCA, EDL.SubCh
                        .LINE     29
                        CPI       _ACCA, 0
                        .BRANCH   4, EDL._L0776
                        BRNE      EDL._L0776
                        .BLOCK    30
                        .LINE     30
                        LDS       _ACCA, EDL.OutputEnable
                        TST       _ACCA
                        .BRANCH   3, EDL._L0778
                        BREQ      EDL._L0778
                        .BLOCK    30
                        .LINE     31
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 080h
                        LDI       _ACCAHI, 03Fh
                        .BRANCH   20, _CSE0028
                        RJMP      _CSE0028
                        .ENDBLOCK 32
EDL._L0778:
                        .BLOCK    32
                        .LINE     33
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 000h
_CSE0028:                         
                        STS       EDL.PARAM, _ACCB
                        STS       EDL.PARAM+1, _ACCA
                        STS       EDL.PARAM+2, _ACCALO
                        STS       EDL.PARAM+3, _ACCAHI
                        .ENDBLOCK 34
                        .LINE     35
                        .BRANCH   17,EDL.WRITEPARAMSER
                        .BRANCH   20, _CSE0032
                        RJMP      _CSE0032
                        .ENDBLOCK 36
EDL._L0776:
                        .LINE     37
                        CPI       _ACCA, 1
                        .BRANCH   4, EDL._L0782
                        BRNE      EDL._L0782
                        .BLOCK    38
                        .LINE     38
                        LDS       _ACCB, EDL.DCAmp
                        LDS       _ACCA, EDL.DCAmp+1
                        LDS       _ACCALO, EDL.DCAmp+2
                        LDS       _ACCAHI, EDL.DCAmp+3
                        STS       EDL.PARAM, _ACCB
                        STS       EDL.PARAM+1, _ACCA
                        STS       EDL.PARAM+2, _ACCALO
                        STS       EDL.PARAM+3, _ACCAHI
                        .LINE     39
                        LDS       _ACCA, EDL.ShuntSelect
                        LDI       _ACCB, 007h AND 0FFh
                        .BRANCH   20, _CSE0034
                        RJMP      _CSE0034
                        .ENDBLOCK 41
EDL._L0782:
                        .LINE     42
                        CPI       _ACCA, 2
                        .BRANCH   4, EDL._L0785
                        BRNE      EDL._L0785
                        .BLOCK    43
                        .LINE     43
                        LDS       _ACCB, EDL.DCAmp
                        LDS       _ACCA, EDL.DCAmp+1
                        LDS       _ACCALO, EDL.DCAmp+2
                        LDS       _ACCAHI, EDL.DCAmp+3
                        STS       EDL.PARAM, _ACCB
                        STS       EDL.PARAM+1, _ACCA
                        STS       EDL.PARAM+2, _ACCALO
                        STS       EDL.PARAM+3, _ACCAHI
                        .LINE     44
                        .BRANCH   17,EDL.PARAMMUL1000
                        .BRANCH   20, _CSE0037
                        RJMP      _CSE0037
                        .ENDBLOCK 47
EDL._L0785:
                        .LINE     49
                        CPI       _ACCA, 3
                        .BRANCH   4, EDL._L0788
                        BRNE      EDL._L0788
                        .BLOCK    50
                        .LINE     50
                        LDS       _ACCB, EDL.DCWatt
                        LDS       _ACCA, EDL.DCWatt+1
                        LDS       _ACCALO, EDL.DCWatt+2
                        LDS       _ACCAHI, EDL.DCWatt+3
                        .BRANCH   20, _CSE0043
                        RJMP      _CSE0043
                        .ENDBLOCK 53
EDL._L0788:
                        .LINE     54
                        CPI       _ACCA, 4
                        .BRANCH   4, EDL._L0791
                        BRNE      EDL._L0791
                        .BLOCK    55
                        .LINE     55
                        LDS       _ACCB, EDL.DCVolt
                        LDS       _ACCA, EDL.DCVolt+1
                        LDS       _ACCALO, EDL.DCVolt+2
                        LDS       _ACCAHI, EDL.DCVolt+3
_CSE0043:                         
                        STS       EDL.PARAM, _ACCB
                        STS       EDL.PARAM+1, _ACCA
                        STS       EDL.PARAM+2, _ACCALO
                        STS       EDL.PARAM+3, _ACCAHI
                        .LINE     56
_CSE0041:                         
                        LDI       _ACCA, 002h
_CSE0042:                         
                        STS       EDL.NACHKOMMA, _ACCA
                        .LINE     57
                        .BRANCH   20, _CSE0050
                        RJMP      _CSE0050
                        .ENDBLOCK 58
EDL._L0791:
                        .LINE     60
                        CPI       _ACCA, 5
                        .BRANCH   4, EDL._L0794
                        BRNE      EDL._L0794
                        .BLOCK    61
                        .LINE     61
                        LDS       _ACCB, EDL.DCohm
                        LDS       _ACCA, EDL.DCohm+1
                        LDS       _ACCALO, EDL.DCohm+2
                        LDS       _ACCAHI, EDL.DCohm+3
                        STS       EDL.PARAM, _ACCB
                        STS       EDL.PARAM+1, _ACCA
                        STS       EDL.PARAM+2, _ACCALO
                        STS       EDL.PARAM+3, _ACCAHI
                        .LINE     62
                        LDS       _ACCA, EDL.ShuntSelect
                        SUBI      _ACCA, -001h AND 0FFh
                        .BRANCH   20, _CSE0036
                        RJMP      _CSE0036
                        .ENDBLOCK 64
EDL._L0794:
                        .LINE     67
                        CPI       _ACCA, 7
                        .BRANCH   4, EDL._L0797
                        BRNE      EDL._L0797
                        .BLOCK    68
                        .LINE     68
                        LDS       _ACCB, EDL.Ah
                        LDS       _ACCA, EDL.Ah+1
                        LDS       _ACCALO, EDL.Ah+2
                        LDS       _ACCAHI, EDL.Ah+3
                        .BRANCH   20, _CSE0049
                        RJMP      _CSE0049
                        .ENDBLOCK 70
EDL._L0797:
                        .LINE     71
                        CPI       _ACCA, 8
                        .BRANCH   4, EDL._L0800
                        BRNE      EDL._L0800
                        .BLOCK    72
                        .LINE     72
                        LDS       _ACCB, EDL.Wh
                        LDS       _ACCA, EDL.Wh+1
                        LDS       _ACCALO, EDL.Wh+2
                        LDS       _ACCAHI, EDL.Wh+3
                        .BRANCH   20, _CSE0049
                        RJMP      _CSE0049
                        .ENDBLOCK 74
EDL._L0800:
                        .LINE     76
                        CPI       _ACCA, 9
                        .BRANCH   4, EDL._L0803
                        BRNE      EDL._L0803
                        .BLOCK    77
                        .LINE     77
                        LDS       _ACCA, EDL.ShuntSelect
                        .BRANCH   20, _CSE0045
                        RJMP      _CSE0045
                        .ENDBLOCK 79
EDL._L0803:
                        .LINE     80
                        CPI       _ACCA, 10
                        .BRANCH   4, EDL._L0806
                        BRNE      EDL._L0806
                        .BLOCK    81
                        .LINE     81
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 0FFh
                        .BRANCH   20, _CSE0051
                        RJMP      _CSE0051
                        .FRAME  1
                        .FRAME  0
                        .ENDBLOCK 83
EDL._L0806:
                        .LINE     84
                        CPI       _ACCA, 11
                        .BRANCH   4, EDL._L0809
                        BRNE      EDL._L0809
                        .BLOCK    85
                        .LINE     85
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 0FFh
                        .BRANCH   20, _CSE0035
                        RJMP      _CSE0035
                        .FRAME  1
                        .FRAME  0
                        .ENDBLOCK 88
EDL._L0809:
                        .LINE     89
                        CPI       _ACCA, 12
                        .BRANCH   4, EDL._L0812
                        BRNE      EDL._L0812
                        .BLOCK    90
                        .LINE     90
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 0FFh
                        .BRANCH   20, _CSE0038
                        RJMP      _CSE0038
                        .FRAME  1
                        .FRAME  0
                        .ENDBLOCK 94
EDL._L0812:
                        .LINE     105
                        CPI       _ACCA, 15
                        .BRANCH   4, EDL._L0815
                        BRNE      EDL._L0815
                        .BLOCK    106
                        .LINE     106
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
_CSE0051:                         
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.GETVOLTAGE
                        CALL      EDL.GETVOLTAGE
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     82
                        .LINE     107
                        .BRANCH   17,EDL.WRITEPARAMSER
_CSE0050:                         
                        RCALL     EDL.WRITEPARAMSER
                        .ENDBLOCK 108
                        .BRANCH   20,EDL._L0774
                        RJMP      EDL._L0774
EDL._L0815:
                        .LINE     109
                        CPI       _ACCA, 16
                        .BRANCH   4, EDL._L0818
                        BRNE      EDL._L0818
                        .BLOCK    110
                        .LINE     110
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
_CSE0035:                         
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.GETCURRENT
                        CALL      EDL.GETCURRENT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     111
                        LDS       _ACCA, EDL.ShuntSelect
                        LDI       _ACCB, 008h AND 0FFh
_CSE0034:                         
                        SUB       _ACCB, _ACCA
                        MOV       _ACCA, _ACCB
                        .BRANCH   20, _CSE0036
                        RJMP      _CSE0036
                        .BRANCH   17,EDL.WRITEPARAMSER
_CSE0032:                         
                        RCALL     EDL.WRITEPARAMSER
                        .ENDBLOCK 113
                        .BRANCH   20,EDL._L0774
                        RJMP      EDL._L0774
EDL._L0818:
                        .LINE     114
                        CPI       _ACCA, 17
                        .BRANCH   4, EDL._L0821
                        BRNE      EDL._L0821
                        .BLOCK    115
                        .LINE     115
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
_CSE0038:                         
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.GETCURRENT
                        CALL      EDL.GETCURRENT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     116
                        .BRANCH   17,EDL.PARAMMUL1000
_CSE0037:                         
                        CALL      EDL.PARAMMUL1000
                        .LINE     117
                        .BRANCH   20, _CSE0041
                        RJMP      _CSE0041
_CSE0036:                         
                        STS       EDL.NACHKOMMA, _ACCA
                        .BRANCH   17,EDL.WRITEPARAMSER
                        RCALL     EDL.WRITEPARAMSER
                        .ENDBLOCK 119
                        .BRANCH   20,EDL._L0774
                        RJMP      EDL._L0774
EDL._L0821:
                        .LINE     120
                        CPI       _ACCA, 18
                        .BRANCH   4, EDL._L0824
                        BRNE      EDL._L0824
                        .BLOCK    121
                        .LINE     121
                        LDS       _ACCB, EDL.Ptot
                        LDS       _ACCA, EDL.Ptot+1
                        LDS       _ACCALO, EDL.Ptot+2
                        LDS       _ACCAHI, EDL.Ptot+3
                        .BRANCH   20, _CSE0049
                        RJMP      _CSE0049
                        .ENDBLOCK 123
EDL._L0824:
                        .LINE     124
                        CPI       _ACCA, 19
                        .BRANCH   4, EDL._L0827
                        BRNE      EDL._L0827
                        .BLOCK    125
                        .LINE     125
                        LDS       _ACCA, EDL.ModeSelect
                        .BRANCH   20, _CSE0045
                        RJMP      _CSE0045
                        .ENDBLOCK 127
EDL._L0827:
                        .LINE     128
                        CPI       _ACCA, 21
                        .BRANCH   3,EDL._L0829
                        BREQ      EDL._L0829
                        CPI       _ACCA, 22
                        .BRANCH   4, EDL._L0832
                        BRNE      EDL._L0832
EDL._L0829:
                        .BLOCK    129
                        .LINE     129
                        LDS       _ACCDLO, EDL.DCAmpMod
                        LDS       _ACCDHI, EDL.DCAmpMod+1
                        LDS       _ACCELO, EDL.DCAmpMod+2
                        LDS       _ACCEHI, EDL.DCAmpMod+3
                        LDI       _ACCBLO, 000h
                        LDI       _ACCBHI, 000h
                        LDI       _ACCCLO, 0C8h
                        LDI       _ACCCHI, 042h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat_R
                        .BRANCH   20, _CSE0049
                        RJMP      _CSE0049
                        .ENDBLOCK 131
EDL._L0832:
                        .LINE     132
                        CPI       _ACCA, 27
                        .BRANCH   4, EDL._L0835
                        BRNE      EDL._L0835
                        .BLOCK    133
                        .LINE     133
                        LDS       _ACCB, EDL.PWonTime
                        LDS       _ACCA, EDL.PWonTime+1
                        .BRANCH   20, _CSE0046
                        RJMP      _CSE0046
                        .ENDBLOCK 135
EDL._L0835:
                        .LINE     136
                        CPI       _ACCA, 28
                        .BRANCH   4, EDL._L0838
                        BRNE      EDL._L0838
                        .BLOCK    137
                        .LINE     137
                        LDS       _ACCB, EDL.PWoffTime
                        LDS       _ACCA, EDL.PWoffTime+1
                        .BRANCH   20, _CSE0046
                        RJMP      _CSE0046
                        .ENDBLOCK 139
EDL._L0838:
                        .LINE     140
                        CPI       _ACCA, 29
                        .BRANCH   4, EDL._L0841
                        BRNE      EDL._L0841
                        .BLOCK    141
                        .LINE     141
                        LDS       _ACCB, EDL.Ipercent
                        LDS       _ACCA, EDL.Ipercent+1
                        .BRANCH   20, _CSE0046
                        RJMP      _CSE0046
                        .ENDBLOCK 143
EDL._L0841:
                        .LINE     144
                        CPI       _ACCA, 50
                        .BRANCH   4, EDL._L0844
                        BRNE      EDL._L0844
                        .BLOCK    145
                        .LINE     145
                        CLI
                        LDI       _ACCA, 0FEH ROLB IntFlag
                        AND       Flags, _ACCA
                        .LINE     146
                        LDS       _ACCB, EDL.AD16tempUon
                        LDS       _ACCA, EDL.AD16tempUon+1
                        .BRANCH   20, _CSE0044
                        RJMP      _CSE0044
                        .ENDBLOCK 149
EDL._L0844:
                        .LINE     150
                        CPI       _ACCA, 51
                        .BRANCH   4, EDL._L0847
                        BRNE      EDL._L0847
                        .BLOCK    151
                        .LINE     151
                        CLI
                        LDI       _ACCA, 0FEH ROLB IntFlag
                        AND       Flags, _ACCA
                        .LINE     152
                        LDS       _ACCB, EDL.AD16tempIon
                        LDS       _ACCA, EDL.AD16tempIon+1
_CSE0044:                         
                        STS       EDL.PARAMINT, _ACCB
                        STS       EDL.PARAMINT+1, _ACCA
                        .LINE     153
                        LDI       _ACCA, 1 SHLB IntFlag
                        OR        Flags, _ACCA
                        SEI
                        .LINE     154
                        .BRANCH   17,EDL.WRITEPARAMINTSER
                        .BRANCH   20, _CSE0047
                        RJMP      _CSE0047
                        .ENDBLOCK 155
EDL._L0847:
                        .LINE     156
                        CPI       _ACCA, 52
                        .BRANCH   4, EDL._L0850
                        BRNE      EDL._L0850
                        .BLOCK    157
                        .LINE     157
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 003h
                        .BRANCH   20, _CSE0040
                        RJMP      _CSE0040
                        .FRAME  1
                        .FRAME  0
                        .ENDBLOCK 159
EDL._L0850:
                        .LINE     160
                        CPI       _ACCA, 53
                        .BRANCH   4, EDL._L0853
                        BRNE      EDL._L0853
                        .BLOCK    161
                        .LINE     161
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 004h
_CSE0040:                         
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.GETADC10
                        CALL       EDL.GETADC10
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .BRANCH   20, _CSE0046
                        RJMP      _CSE0046
                        .ENDBLOCK 163
EDL._L0853:
                        .LINE     164
                        CPI       _ACCA, 70
                        .BRANCH   4, EDL._L0856
                        BRNE      EDL._L0856
                        .BLOCK    165
                        .LINE     165
                        LDS       _ACCB, EDL.DACtempOn
                        LDS       _ACCA, EDL.DACtempOn+1
                        .BRANCH   20, _CSE0046
                        RJMP      _CSE0046
                        .ENDBLOCK 167
EDL._L0856:
                        .LINE     168
                        CPI       _ACCA, 71
                        .BRANCH   4, EDL._L0859
                        BRNE      EDL._L0859
                        .BLOCK    169
                        .LINE     169
                        LDS       _ACCB, EDL.DACtempOff
                        LDS       _ACCA, EDL.DACtempOff+1
                        .BRANCH   20, _CSE0046
                        RJMP      _CSE0046
                        .ENDBLOCK 171
EDL._L0859:
                        .LINE     172
                        CPI       _ACCA, 72
                        .BRANCH   4, EDL._L0862
                        BRNE      EDL._L0862
                        .BLOCK    173
                        .LINE     173
                        LDS       _ACCB, EDL.DACtemp
                        LDS       _ACCA, EDL.DACtemp+1
                        .BRANCH   20, _CSE0046
                        RJMP      _CSE0046
                        .ENDBLOCK 175
EDL._L0862:
                        .LINE     176
                        CPI       _ACCA, 80
                        .BRANCH   4, EDL._L0865
                        BRNE      EDL._L0865
                        .BLOCK    177
                        .LINE     177
                        LDS       _ACCA, EDL.Modify
                        .BRANCH   20, _CSE0045
                        RJMP      _CSE0045
                        .ENDBLOCK 179
EDL._L0865:
                        .LINE     180
                        CPI       _ACCA, 89
                        .BRANCH   4, EDL._L0868
                        BRNE      EDL._L0868
                        .BLOCK    181
                        .LINE     181
                        LDS       _ACCB, EDL.IncRast
                        LDS       _ACCA, EDL.IncRast+1
                        .BRANCH   20, _CSE0046
                        RJMP      _CSE0046
                        .ENDBLOCK 183
EDL._L0868:
                        .LINE     184
                        CPI       _ACCA, 99
                        .BRANCH   4, EDL._L0871
                        BRNE      EDL._L0871
                        .BLOCK    185
                        .LINE     185
                        LDI       _ACCA, 0FFh
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.GETVOLTAGE
                        CALL      EDL.GETVOLTAGE
                        ADIW      _FRAMEPTR, 5
                        .LINE     186
                        LDI       _ACCA, 00Ah
                        STS       EDL.SUBCH, _ACCA
                        .LINE     187
                        .BRANCH   17,EDL.WRITEPARAMSER
                        RCALL     EDL.WRITEPARAMSER
                        .LINE     188
                        LDI       _ACCA, 0FFh
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.GETCURRENT
                        CALL      EDL.GETCURRENT
                        ADIW      _FRAMEPTR, 5
                        .LINE     189
                        LDI       _ACCA, 00Bh
                        STS       EDL.SUBCH, _ACCA
                        .LINE     190
                        .BRANCH   17,EDL.WRITEPARAMSER
                        RCALL     EDL.WRITEPARAMSER
                        .LINE     191
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.GETVOLTAGE
                        CALL      EDL.GETVOLTAGE
                        ADIW      _FRAMEPTR, 5
                        .LINE     192
                        LDI       _ACCA, 00Fh
                        STS       EDL.SUBCH, _ACCA
                        .LINE     193
                        .BRANCH   17,EDL.WRITEPARAMSER
                        RCALL     EDL.WRITEPARAMSER
                        .LINE     194
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.GETCURRENT
                        CALL      EDL.GETCURRENT
                        ADIW      _FRAMEPTR, 5
                        .LINE     195
                        LDI       _ACCA, 010h
                        STS       EDL.SUBCH, _ACCA
                        .LINE     196
                        .BRANCH   17,EDL.WRITEPARAMSER
                        .BRANCH   20, _CSE0032
                        RJMP      _CSE0032
                        .ENDBLOCK 197
EDL._L0871:
                        .LINE     198
                        CPI       _ACCA, 100
                        .BRANCH   3,EDL._L0873
                        BREQ      EDL._L0873
                        CPI       _ACCA, 101
                        .BRANCH   4, EDL._L0876
                        BRNE      EDL._L0876
EDL._L0873:
                        .BLOCK    199
                        .LINE     199
                        LDI       _ACCA, 00000h SHRB 8
                        LDI       _ACCB, 00000h AND 0FFh
                        .BRANCH   20, _CSE0046
                        RJMP      _CSE0046
                        .ENDBLOCK 201
EDL._L0876:
                        .LINE     202
                        CPI       _ACCA, 102
                        .BRANCH   1, EDL._L0879
                        BRCS      EDL._L0879
                        CPI       _ACCA, 105
                        .BRANCH   3,EDL._L0881
                        BREQ      EDL._L0881
                        .BRANCH   2, EDL._L0879
                        BRCC      EDL._L0879
EDL._L0881:
                        .BLOCK    203
                        .LINE     203
                        LDI       _ACCCLO, EDL.DACIoffsets AND 0FFh
                        LDI       _ACCCHI, EDL.DACIoffsets SHRB 8
                        LDS       _ACCA, EDL.subCh
                        SUBI      _ACCA, 066h AND 0FFh
                        .BRANCH   20, _CSE0031
                        RJMP      _CSE0031
                        .ENDBLOCK 205
EDL._L0879:
                        .LINE     206
                        CPI       _ACCA, 110
                        .BRANCH   3,EDL._L0882
                        BREQ      EDL._L0882
                        CPI       _ACCA, 111
                        .BRANCH   4, EDL._L0885
                        BRNE      EDL._L0885
EDL._L0882:
                        .BLOCK    207
                        .LINE     207
                        LDI       _ACCCLO, EDL.ADCUoffsets AND 0FFh
                        LDI       _ACCCHI, EDL.ADCUoffsets SHRB 8
                        LDS       _ACCA, EDL.subCh
                        SUBI      _ACCA, 06Eh AND 0FFh
                        .BRANCH   20, _CSE0031
                        RJMP      _CSE0031
                        .ENDBLOCK 209
EDL._L0885:
                        .LINE     210
                        CPI       _ACCA, 112
                        .BRANCH   1, EDL._L0888
                        BRCS      EDL._L0888
                        CPI       _ACCA, 115
                        .BRANCH   3,EDL._L0890
                        BREQ      EDL._L0890
                        .BRANCH   2, EDL._L0888
                        BRCC      EDL._L0888
EDL._L0890:
                        .BLOCK    211
                        .LINE     211
                        LDI       _ACCCLO, EDL.ADCIoffsets AND 0FFh
                        LDI       _ACCCHI, EDL.ADCIoffsets SHRB 8
                        LDS       _ACCA, EDL.subCh
                        SUBI      _ACCA, 070h AND 0FFh
_CSE0031:                         
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        CALL      SYSTEM._ReadEEp16
                        .BRANCH   20, _CSE0046
                        RJMP      _CSE0046
                        .ENDBLOCK 213
EDL._L0888:
                        .LINE     214
                        CPI       _ACCA, 150
                        .BRANCH   1, EDL._L0892
                        BRCS      EDL._L0892
                        CPI       _ACCA, 171
                        .BRANCH   3,EDL._L0894
                        BREQ      EDL._L0894
                        .BRANCH   2, EDL._L0892
                        BRCC      EDL._L0892
EDL._L0894:
                        .BLOCK    215
                        .LINE     215
                        LDI       _ACCCLO, EDL.OptionArray AND 0FFh
                        LDI       _ACCCHI, EDL.OptionArray SHRB 8
                        LDS       _ACCB, EDL.subCh
                        SUBI      _ACCB, 096h AND 0FFh
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        CALL      SYSTEM._ReadEEp32
                        .BRANCH   20, _CSE0049
                        RJMP      _CSE0049
                        .ENDBLOCK 217
EDL._L0892:
                        .LINE     218
                        CPI       _ACCA, 200
                        .BRANCH   3,EDL._L0895
                        BREQ      EDL._L0895
                        CPI       _ACCA, 201
                        .BRANCH   4, EDL._L0898
                        BRNE      EDL._L0898
EDL._L0895:
                        .BLOCK    219
                        .LINE     219
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 000h
_CSE0049:                         
                        STS       EDL.PARAM, _ACCB
                        STS       EDL.PARAM+1, _ACCA
                        STS       EDL.PARAM+2, _ACCALO
                        STS       EDL.PARAM+3, _ACCAHI
                        .LINE     220
                        .BRANCH   20, _CSE0050
                        RJMP      _CSE0050
                        .ENDBLOCK 221
EDL._L0898:
                        .LINE     222
                        CPI       _ACCA, 202
                        .BRANCH   1, EDL._L0901
                        BRCS      EDL._L0901
                        CPI       _ACCA, 205
                        .BRANCH   3,EDL._L0903
                        BREQ      EDL._L0903
                        .BRANCH   2, EDL._L0901
                        BRCC      EDL._L0901
EDL._L0903:
                        .BLOCK    223
                        .LINE     223
                        LDI       _ACCCLO, EDL.DACIscales AND 0FFh
                        LDI       _ACCCHI, EDL.DACIscales SHRB 8
                        LDS       _ACCA, EDL.subCh
                        SUBI      _ACCA, 0CAh AND 0FFh
                        .BRANCH   20, _CSE0030
                        RJMP      _CSE0030
                        .ENDBLOCK 226
EDL._L0901:
                        .LINE     227
                        CPI       _ACCA, 210
                        .BRANCH   4, EDL._L0905
                        BRNE      EDL._L0905
                        .BLOCK    228
                        .LINE     228
                        LDI       _ACCCLO, EDL.ADC16UscaleLow AND 0FFh
                        LDI       _ACCCHI, EDL.ADC16UscaleLow SHRB 8
                        .BRANCH   20, _CSE0029
                        RJMP      _CSE0029
                        .ENDBLOCK 231
EDL._L0905:
                        .LINE     232
                        CPI       _ACCA, 211
                        .BRANCH   4, EDL._L0908
                        BRNE      EDL._L0908
                        .BLOCK    233
                        .LINE     233
                        LDI       _ACCCLO, EDL.ADC16UscaleHigh AND 0FFh
                        LDI       _ACCCHI, EDL.ADC16UscaleHigh SHRB 8
                        .BRANCH   20, _CSE0029
                        RJMP      _CSE0029
                        .ENDBLOCK 236
EDL._L0908:
                        .LINE     237
                        CPI       _ACCA, 212
                        .BRANCH   1, EDL._L0911
                        BRCS      EDL._L0911
                        CPI       _ACCA, 215
                        .BRANCH   3,EDL._L0913
                        BREQ      EDL._L0913
                        .BRANCH   2, EDL._L0911
                        BRCC      EDL._L0911
EDL._L0913:
                        .BLOCK    238
                        .LINE     238
                        LDI       _ACCCLO, EDL.ADCIscales AND 0FFh
                        LDI       _ACCCHI, EDL.ADCIscales SHRB 8
                        LDS       _ACCA, EDL.subCh
                        SUBI      _ACCA, 0D4h AND 0FFh
_CSE0030:                         
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
_CSE0029:                         
                        CALL      SYSTEM._ReadEEp32
                        STS       EDL.PARAM, _ACCB
                        STS       EDL.PARAM+1, _ACCA
                        STS       EDL.PARAM+2, _ACCALO
                        STS       EDL.PARAM+3, _ACCAHI
                        .LINE     239
                        LDI       _ACCA, 005h
                        .BRANCH   20, _CSE0036
                        RJMP      _CSE0036
                        .ENDBLOCK 241
EDL._L0911:
                        .LINE     254
                        CPI       _ACCA, 233
                        .BRANCH   4, EDL._L0915
                        BRNE      EDL._L0915
                        .BLOCK    255
                        .LINE     255
                        LDS       _ACCB, EDL.Temperature
                        LDS       _ACCA, EDL.Temperature+1
                        LDS       _ACCALO, EDL.Temperature+2
                        LDS       _ACCAHI, EDL.Temperature+3
                        .BRANCH   20, _CSE0039
                        RJMP      _CSE0039
                        .ENDBLOCK 258
EDL._L0915:
                        .LINE     259
                        CPI       _ACCA, 234
                        .BRANCH   4, EDL._L0918
                        BRNE      EDL._L0918
                        .BLOCK    260
                        .LINE     260
                        LDS       _ACCB, EDL.TemperatureExtern
                        LDS       _ACCA, EDL.TemperatureExtern+1
                        LDS       _ACCALO, EDL.TemperatureExtern+2
                        LDS       _ACCAHI, EDL.TemperatureExtern+3
_CSE0039:                         
                        STS       EDL.PARAM, _ACCB
                        STS       EDL.PARAM+1, _ACCA
                        STS       EDL.PARAM+2, _ACCALO
                        STS       EDL.PARAM+3, _ACCAHI
                        .LINE     261
                        LDI       _ACCA, 001h
                        .BRANCH   20, _CSE0042
                        RJMP      _CSE0042
                        .ENDBLOCK 263
EDL._L0918:
                        .LINE     264
                        CPI       _ACCA, 240
                        .BRANCH   4, EDL._L0921
                        BRNE      EDL._L0921
                        .BLOCK    265
                        .LINE     265
                        LDS       _ACCA, EDL.TrigMask
                        .BRANCH   20, _CSE0045
                        RJMP      _CSE0045
                        .ENDBLOCK 267
EDL._L0921:
                        .LINE     268
                        CPI       _ACCA, 251
                        .BRANCH   4, EDL._L0924
                        BRNE      EDL._L0924
                        .BLOCK    269
                        .LINE     269
                        LDS       _ACCB, EDL.Errcount
                        LDS       _ACCA, EDL.Errcount+1
                        .BRANCH   20, _CSE0046
                        RJMP      _CSE0046
                        .ENDBLOCK 271
EDL._L0924:
                        .LINE     272
                        CPI       _ACCA, 252
                        .BRANCH   4, EDL._L0927
                        BRNE      EDL._L0927
                        .BLOCK    273
                        .LINE     273
                        LDI       _ACCCLO, EDL.EESerBaudReg AND 0FFh
                        LDI       _ACCCHI, EDL.EESerBaudReg SHRB 8
                        CALL      SYSTEM.ReadEEp8
_CSE0045:                         
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
_CSE0046:                         
                        STS       EDL.PARAMINT, _ACCB
                        STS       EDL.PARAMINT+1, _ACCA
                        .LINE     126
                        .LINE     134
                        .LINE     138
                        .LINE     142
                        .LINE     162
                        .LINE     158
                        .LINE     166
                        .LINE     170
                        .LINE     174
                        .LINE     178
                        .LINE     182
                        .LINE     200
                        .LINE     212
                        .LINE     204
                        .LINE     208
                        .LINE     266
                        .LINE     270
                        .LINE     78
                        .LINE     274
                        .BRANCH   17,EDL.WRITEPARAMINTSER
_CSE0047:                         
                        RCALL     EDL.WRITEPARAMINTSER
                        .ENDBLOCK 275
                        .BRANCH   20,EDL._L0774
                        RJMP      EDL._L0774
EDL._L0927:
                        .LINE     276
                        CPI       _ACCA, 253
                        .BRANCH   4, EDL._L0930
                        BRNE      EDL._L0930
                        .BLOCK    277
                        .LINE     277
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.Serout SHRB 1
                        LDI       _ACCA, SYSTEM.Serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, EDL.SerInpStr AND 0FFh
                        LDI       _ACCCHI, EDL.SerInpStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        ADIW      _FRAMEPTR, 2
                        .FRAME  0
                        .LINE     278
                        .BRANCH   17,EDL.SERCRLF
                        CALL      EDL.SERCRLF
                        .LINE     279
                        .BRANCH   20,EDL.ParseGetParam_X
                        RJMP      EDL.ParseGetParam_X
                        .ENDBLOCK 280
EDL._L0930:
                        .LINE     281
                        CPI       _ACCA, 254
                        .BRANCH   4, EDL._L0933
                        BRNE      EDL._L0933
                        .BLOCK    282
                        .LINE     282
                        .BRANCH   17,EDL.WRITECHPREFIX
                        CALL      EDL.WRITECHPREFIX
                        .LINE     283
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.serout SHRB 1
                        LDI       _ACCA, SYSTEM.serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, EDL.Vers1Str AND 0FFh
                        LDI       _ACCCHI, EDL.Vers1Str SHRB 8
                        CALL      SYSTEM.StrConst2Str
                        ADIW      _FRAMEPTR, 2
                        .FRAME  0
                        .LINE     284
                        .BRANCH   17,EDL.SERCRLF
                        CALL      EDL.SERCRLF
                        .ENDBLOCK 285
                        .BRANCH   20,EDL._L0774
                        RJMP      EDL._L0774
EDL._L0933:
                        .LINE     286
                        CPI       _ACCA, 250
                        .BRANCH   3,EDL._L0936
                        BREQ      EDL._L0936
                        CPI       _ACCA, 255
                        .BRANCH   4, EDL._L0939
                        BRNE      EDL._L0939
EDL._L0936:
                        .BLOCK    287
                        .LINE     287
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        .BRANCH   20, _CSE0052
                        RJMP      _CSE0052
                        .FRAME  1
                        .FRAME  0
                        .ENDBLOCK 288
EDL._L0939:
                        .BLOCK    289
                        .LINE     290
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 005h
_CSE0052:                         
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.SERPROMPT
                        CALL      EDL.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 291
EDL._L0774:
                        .ENDBLOCK 292
EDL.ParseGetParam_X:
                        .LINE     292
                        .BRANCH   19
                        RET
                        .ENDFUNC  292

                        .FUNC     ParseSetParam, 00127h, 00020h
EDL.ParseSetParam:
                        .RETURNS   0
                        .BLOCK    296
                        .LINE     297
                        LDS       _ACCB, 003E4h
                        SBRS      _ACCB, 007h
                        .BRANCH   20,EDL._L0941
                        RJMP      EDL._L0941
                        .BLOCK    297
                        .LINE     298
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 002h
                        .BRANCH   20, _CSE0053
                        RJMP      _CSE0053
                        .FRAME  1
                        .FRAME  0
                        .ENDBLOCK 300
EDL._L0941:
                        .LINE     301
                        LDI       _ACCA, 0FFh
                        STS       EDL.CHANGEDFLAG, _ACCA
                        .LINE     302
                        LDS       _ACCA, EDL.SubCh
                        .LINE     303
                        CPI       _ACCA, 0
                        .BRANCH   4, EDL._L0946
                        BRNE      EDL._L0946
                        .BLOCK    304
                        .LINE     304
                        LDS       _ACCBLO, EDL.Param
                        LDS       _ACCBHI, EDL.Param+1
                        LDS       _ACCCLO, EDL.Param+2
                        LDS       _ACCCHI, EDL.Param+3
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 000h
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      EDL._L0949
                        BRPL      EDL._L0950
                        BRMI      EDL._L0948
EDL._L0950:
                        CLZ
                        CLC
                        RJMP      EDL._L0949
EDL._L0948:
                        CLZ
                        SEC
EDL._L0949:
                        LDI       _ACCA, 0h
                        BREQ      EDL._L0951
                        SER       _ACCA
EDL._L0951:
                        STS       EDL.OUTPUTENABLE, _ACCA
                        .LINE     305
                        LDS       _ACCA, EDL.ModeSelect
                        CPI       _ACCA, 000h
                        .BRANCH   4, EDL._L0953
                        BRNE      EDL._L0953
                        .BLOCK    305
                        .LINE     306
                        CBI       00035h, 004h
                        .ENDBLOCK 307
                        RJMP      EDL._L0944
EDL._L0953:
                        .BLOCK    307
                        .LINE     308
                        LDS       _ACCA, EDL.OutputEnable
                        CLT
                        TST       _ACCA
                        BREQ      EDL._L0956
                        SET
EDL._L0956:
                        IN        _ACCA, 00035h
                        BLD       _ACCA, 004h
                        OUT       00035h, _ACCA
                        .ENDBLOCK 309
                        .ENDBLOCK 310
                        .BRANCH   20,EDL._L0944
                        RJMP      EDL._L0944
EDL._L0946:
                        .LINE     311
                        CPI       _ACCA, 1
                        .BRANCH   3, _CSE0054
                        BREQ      _CSE0054
                        .BLOCK    312
                        .LINE     312
                        .ENDBLOCK 313
                        .LINE     314
                        CPI       _ACCA, 2
                        .BRANCH   4, EDL._L0961
                        BRNE      EDL._L0961
                        .BLOCK    315
                        .LINE     315
                        .BRANCH   17,EDL.PARAMDIV1000
                        CALL      EDL.PARAMDIV1000
                        .LINE     316
_CSE0054:                         
                        LDS       _ACCB, EDL.Param
                        LDS       _ACCA, EDL.Param+1
                        LDS       _ACCALO, EDL.Param+2
                        LDS       _ACCAHI, EDL.Param+3
                        STS       EDL.DCAMP, _ACCB
                        STS       EDL.DCAMP+1, _ACCA
                        STS       EDL.DCAMP+2, _ACCALO
                        STS       EDL.DCAMP+3, _ACCAHI
                        .ENDBLOCK 317
                        .BRANCH   20,EDL._L0944
                        RJMP      EDL._L0944
EDL._L0961:
                        .LINE     319
                        CPI       _ACCA, 3
                        .BRANCH   4, EDL._L0964
                        BRNE      EDL._L0964
                        .BLOCK    320
                        .LINE     320
                        LDS       _ACCB, EDL.Param
                        LDS       _ACCA, EDL.Param+1
                        LDS       _ACCALO, EDL.Param+2
                        LDS       _ACCAHI, EDL.Param+3
                        STS       EDL.DCWATT, _ACCB
                        STS       EDL.DCWATT+1, _ACCA
                        STS       EDL.DCWATT+2, _ACCALO
                        STS       EDL.DCWATT+3, _ACCAHI
                        .ENDBLOCK 321
                        .BRANCH   20,EDL._L0944
                        RJMP      EDL._L0944
EDL._L0964:
                        .LINE     322
                        CPI       _ACCA, 4
                        .BRANCH   4, EDL._L0967
                        BRNE      EDL._L0967
                        .BLOCK    323
                        .LINE     323
                        LDS       _ACCA, 003E5h
                        CBR       _ACCA, 010h
                        STS       003E5h, _ACCA
                        .LINE     324
                        LDI       _ACCA, 0FFh
                        STS       EDL.OUTPUTENABLE, _ACCA
                        .LINE     325
                        LDS       _ACCB, EDL.Param
                        LDS       _ACCA, EDL.Param+1
                        LDS       _ACCALO, EDL.Param+2
                        LDS       _ACCAHI, EDL.Param+3
                        STS       EDL.DCVOLT, _ACCB
                        STS       EDL.DCVOLT+1, _ACCA
                        STS       EDL.DCVOLT+2, _ACCALO
                        STS       EDL.DCVOLT+3, _ACCAHI
                        .ENDBLOCK 326
                        .BRANCH   20,EDL._L0944
                        RJMP      EDL._L0944
EDL._L0967:
                        .LINE     328
                        CPI       _ACCA, 5
                        .BRANCH   4, EDL._L0970
                        BRNE      EDL._L0970
                        .BLOCK    329
                        .LINE     329
                        LDS       _ACCB, EDL.Param
                        LDS       _ACCA, EDL.Param+1
                        LDS       _ACCALO, EDL.Param+2
                        LDS       _ACCAHI, EDL.Param+3
                        STS       EDL.DCOHM, _ACCB
                        STS       EDL.DCOHM+1, _ACCA
                        STS       EDL.DCOHM+2, _ACCALO
                        STS       EDL.DCOHM+3, _ACCAHI
                        .ENDBLOCK 330
                        .BRANCH   20,EDL._L0944
                        RJMP      EDL._L0944
EDL._L0970:
                        .LINE     332
                        CPI       _ACCA, 7
                        .BRANCH   4, EDL._L0973
                        BRNE      EDL._L0973
                        .BLOCK    333
                        .LINE     333
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 000h
                        STS       EDL.AH, _ACCB
                        STS       EDL.AH+1, _ACCA
                        STS       EDL.AH+2, _ACCALO
                        STS       EDL.AH+3, _ACCAHI
                        .LINE     334
                        STS       EDL.WH, _ACCB
                        STS       EDL.WH+1, _ACCA
                        STS       EDL.WH+2, _ACCALO
                        STS       EDL.WH+3, _ACCAHI
                        .ENDBLOCK 335
                        .BRANCH   20,EDL._L0944
                        RJMP      EDL._L0944
EDL._L0973:
                        .LINE     336
                        CPI       _ACCA, 8
                        .BRANCH   4, EDL._L0976
                        BRNE      EDL._L0976
                        .BLOCK    337
                        .LINE     337
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 000h
                        STS       EDL.WH, _ACCB
                        STS       EDL.WH+1, _ACCA
                        STS       EDL.WH+2, _ACCALO
                        STS       EDL.WH+3, _ACCAHI
                        .LINE     338
                        STS       EDL.AH, _ACCB
                        STS       EDL.AH+1, _ACCA
                        STS       EDL.AH+2, _ACCALO
                        STS       EDL.AH+3, _ACCAHI
                        .ENDBLOCK 339
                        .BRANCH   20,EDL._L0944
                        RJMP      EDL._L0944
EDL._L0976:
                        .LINE     341
                        CPI       _ACCA, 9
                        .BRANCH   4, EDL._L0979
                        BRNE      EDL._L0979
                        .BLOCK    342
                        .LINE     342
                        LDS       _ACCA, EDL.ParamInt
                        STS       EDL.SHUNTRANGE, _ACCA
                        .ENDBLOCK 343
                        .BRANCH   20,EDL._L0944
                        RJMP      EDL._L0944
EDL._L0979:
                        .LINE     344
                        CPI       _ACCA, 19
                        .BRANCH   4, EDL._L0982
                        BRNE      EDL._L0982
                        .BLOCK    345
                        .LINE     345
                        LDS       _ACCA, EDL.ParamByte
                        STS       EDL.MODESELECT, _ACCA
                        .LINE     346
                        CPI       _ACCA, 000h
                        .BRANCH   4, EDL._L0985
                        BRNE      EDL._L0985
                        .BLOCK    346
                        .LINE     347
                        CBI       00035h, 004h
                        .LINE     348
                        LDI       _ACCA, 000h
                        STS       EDL.OUTPUTENABLE, _ACCA
                        .LINE     349
                        .BRANCH   17,EDL.SETLEVELDAC_I
                        CALL      EDL.SETLEVELDAC_I
                        ADIW      _FRAMEPTR, 10
                        .ENDBLOCK 350
                        RJMP      EDL._L0944
EDL._L0985:
                        .BLOCK    350
                        .LINE     351
                        LDI       _ACCA, 0FFh
                        STS       EDL.OUTPUTENABLE, _ACCA
                        .ENDBLOCK 352
                        .ENDBLOCK 353
                        .BRANCH   20,EDL._L0944
                        RJMP      EDL._L0944
EDL._L0982:
                        .LINE     354
                        CPI       _ACCA, 21
                        .BRANCH   3,EDL._L0988
                        BREQ      EDL._L0988
                        CPI       _ACCA, 22
                        .BRANCH   4, EDL._L0991
                        BRNE      EDL._L0991
EDL._L0988:
                        .BLOCK    355
                        .LINE     355
                        LDS       _ACCB, EDL.Param
                        LDS       _ACCA, EDL.Param+1
                        LDS       _ACCALO, EDL.Param+2
                        LDS       _ACCAHI, EDL.Param+3
                        MOVW      _ACCDLO, _ACCB
                        MOVW      _ACCELO, _ACCALO
                        LDI       _ACCBLO, 000h
                        LDI       _ACCBHI, 000h
                        LDI       _ACCCLO, 0C8h
                        LDI       _ACCCHI, 042h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat_R
                        STS       EDL.DCAMPMOD, _ACCB
                        STS       EDL.DCAMPMOD+1, _ACCA
                        STS       EDL.DCAMPMOD+2, _ACCALO
                        STS       EDL.DCAMPMOD+3, _ACCAHI
                        .ENDBLOCK 356
                        .BRANCH   20,EDL._L0944
                        RJMP      EDL._L0944
EDL._L0991:
                        .LINE     357
                        CPI       _ACCA, 27
                        .BRANCH   4, EDL._L0994
                        BRNE      EDL._L0994
                        .BLOCK    358
                        .LINE     358
                        LDS       _ACCB, EDL.ParamInt
                        LDS       _ACCA, EDL.ParamInt+1
                        STS       EDL.PWONTIME, _ACCB
                        STS       EDL.PWONTIME+1, _ACCA
                        .ENDBLOCK 359
                        .BRANCH   20,EDL._L0944
                        RJMP      EDL._L0944
EDL._L0994:
                        .LINE     360
                        CPI       _ACCA, 28
                        .BRANCH   4, EDL._L0997
                        BRNE      EDL._L0997
                        .BLOCK    361
                        .LINE     361
                        LDS       _ACCB, EDL.ParamInt
                        LDS       _ACCA, EDL.ParamInt+1
                        STS       EDL.PWOFFTIME, _ACCB
                        STS       EDL.PWOFFTIME+1, _ACCA
                        .ENDBLOCK 362
                        .BRANCH   20,EDL._L0944
                        RJMP      EDL._L0944
EDL._L0997:
                        .LINE     363
                        CPI       _ACCA, 29
                        .BRANCH   4, EDL._L1000
                        BRNE      EDL._L1000
                        .BLOCK    364
                        .LINE     364
                        LDS       _ACCB, EDL.ParamInt
                        LDS       _ACCA, EDL.ParamInt+1
                        STS       EDL.IPERCENT, _ACCB
                        STS       EDL.IPERCENT+1, _ACCA
                        .ENDBLOCK 365
                        .BRANCH   20,EDL._L0944
                        RJMP      EDL._L0944
EDL._L1000:
                        .LINE     366
                        CPI       _ACCA, 70
                        .BRANCH   4, EDL._L1003
                        BRNE      EDL._L1003
                        .BLOCK    367
                        .LINE     367
                        CLI
                        LDI       _ACCA, 0FEH ROLB IntFlag
                        AND       Flags, _ACCA
                        .LINE     368
                        LDS       _ACCB, EDL.ParamInt
                        LDS       _ACCA, EDL.ParamInt+1
                        STS       EDL.DACTEMPON, _ACCB
                        STS       EDL.DACTEMPON+1, _ACCA
                        .LINE     369
                        LDI       _ACCA, 1 SHLB IntFlag
                        OR        Flags, _ACCA
                        SEI
                        .LINE     370
                        LDS       _ACCA, EDL.verbose
                        TST       _ACCA
                        .BRANCH   3, EDL._L1005
                        BREQ      EDL._L1005
                        .BLOCK    370
                        .LINE     371
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.SERPROMPT
                        CALL      EDL.SERPROMPT
                        ADIW      _FRAMEPTR, 3
                        .ENDBLOCK 372
EDL._L1005:
                        .LINE     373
                        .BRANCH   20,EDL.ParseSetParam_X
                        RJMP      EDL.ParseSetParam_X
                        .ENDBLOCK 374
EDL._L1003:
                        .LINE     375
                        CPI       _ACCA, 71
                        .BRANCH   4, EDL._L1009
                        BRNE      EDL._L1009
                        .BLOCK    376
                        .LINE     376
                        CLI
                        LDI       _ACCA, 0FEH ROLB IntFlag
                        AND       Flags, _ACCA
                        .LINE     377
                        LDS       _ACCB, EDL.ParamInt
                        LDS       _ACCA, EDL.ParamInt+1
                        STS       EDL.DACTEMPOFF, _ACCB
                        STS       EDL.DACTEMPOFF+1, _ACCA
                        .LINE     378
                        LDI       _ACCA, 1 SHLB IntFlag
                        OR        Flags, _ACCA
                        SEI
                        .LINE     379
                        LDS       _ACCA, EDL.verbose
                        TST       _ACCA
                        .BRANCH   3, EDL._L1011
                        BREQ      EDL._L1011
                        .BLOCK    379
                        .LINE     380
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.SERPROMPT
                        CALL      EDL.SERPROMPT
                        ADIW      _FRAMEPTR, 3
                        .ENDBLOCK 381
EDL._L1011:
                        .LINE     382
                        .BRANCH   20,EDL.ParseSetParam_X
                        RJMP      EDL.ParseSetParam_X
                        .ENDBLOCK 383
EDL._L1009:
                        .LINE     384
                        CPI       _ACCA, 80
                        .BRANCH   4, EDL._L1015
                        BRNE      EDL._L1015
                        .BLOCK    385
                        .LINE     385
                        LDS       _ACCA, EDL.ParamByte
                        STS       EDL.MODIFY, _ACCA
                        .LINE     386
                        .BRANCH   17,EDL.WERTEONLCD
                        CALL      EDL.WERTEONLCD
                        .ENDBLOCK 387
                        .BRANCH   20,EDL._L0944
                        RJMP      EDL._L0944
EDL._L1015:
                        .LINE     388
                        CPI       _ACCA, 89
                        .BRANCH   3,EDL._L1017
                        BREQ      EDL._L1017
                        CPI       _ACCA, 100
                        .BRANCH   1, EDL._L1020
                        BRCS      EDL._L1020
                        CPI       _ACCA, 115
                        .BRANCH   3,EDL._L1017
                        BREQ      EDL._L1017
                        .BRANCH   1,EDL._L1017
                        BRCS      EDL._L1017
                        .BRANCH   20,EDL._L1020
EDL._L1020:
                        CPI       _ACCA, 200
                        .BRANCH   2,EDL._L1024
                        BRCC      EDL._L1024
                        .BRANCH   20,EDL._L1023
                        RJMP      EDL._L1023
EDL._L1024:
                        CPI       _ACCA, 223
                        .BRANCH   3,EDL._L1025
                        BREQ      EDL._L1025
                        .BRANCH   1,EDL._L1023
                        BRCS      EDL._L1025
                        .BRANCH   20,EDL._L1023
                        RJMP      EDL._L1023
EDL._L1025:
EDL._L1017:
                        .BLOCK    389
                        .LINE     389
                        LDS       _ACCB, 003E4h
                        SBRS      _ACCB, 004h
                        RJMP      EDL._L1089
                        .BLOCK    389
                        .LINE     390
                        LDS       _ACCA, EDL.SubCh
                        .LINE     391
                        CPI       _ACCA, 89
                        .BRANCH   4, EDL._L1031
                        BRNE      EDL._L1031
                        .BLOCK    392
                        .LINE     392
                        LDS       _ACCB, EDL.Param
                        LDS       _ACCA, EDL.Param+1
                        LDS       _ACCALO, EDL.Param+2
                        LDS       _ACCAHI, EDL.Param+3
                        LDI       _ACCCLO, EDL.INITINCRAST AND 0FFh
                        LDI       _ACCCHI, EDL.INITINCRAST SHRB 8
                        MOVW      _ACCBLO, _ACCB
                        CALL      SYSTEM._WriteEEp32
                        ADIW      _ACCCLO, 01h
                        .LINE     393
                        LDS       _ACCB, EDL.ParamInt
                        LDS       _ACCA, EDL.ParamInt+1
                        STS       EDL.INCRAST, _ACCB
                        STS       EDL.INCRAST+1, _ACCA
                        .ENDBLOCK 394
                        .BRANCH   20,EDL._L1029
                        RJMP      EDL._L1029
EDL._L1031:
                        .LINE     395
                        CPI       _ACCA, 100
                        .BRANCH   3,EDL._L1033
                        BREQ      EDL._L1033
                        CPI       _ACCA, 101
                        .BRANCH   4, EDL._L1036
                        BRNE      EDL._L1036
EDL._L1033:
                        .BRANCH   20,EDL._L1029
                        RJMP      EDL._L1029
EDL._L1036:
                        .LINE     397
                        CPI       _ACCA, 102
                        .BRANCH   1, EDL._L1039
                        BRCS      EDL._L1039
                        CPI       _ACCA, 105
                        .BRANCH   3,EDL._L1041
                        BREQ      EDL._L1041
                        .BRANCH   2, EDL._L1039
                        BRCC      EDL._L1039
EDL._L1041:
                        .BLOCK    398
                        .LINE     398
                        LDI       _ACCCLO, EDL.DACIoffsets AND 0FFh
                        LDI       _ACCCHI, EDL.DACIoffsets SHRB 8
                        LDS       _ACCA, EDL.SubCh
                        SUBI      _ACCA, 066h AND 0FFh
                        .BRANCH   20, _CSE0056
                        RJMP      _CSE0056
                        .ENDBLOCK 399
EDL._L1039:
                        .LINE     400
                        CPI       _ACCA, 110
                        .BRANCH   3,EDL._L1042
                        BREQ      EDL._L1042
                        CPI       _ACCA, 111
                        .BRANCH   4, EDL._L1045
                        BRNE      EDL._L1045
EDL._L1042:
                        .BLOCK    401
                        .LINE     401
                        LDI       _ACCCLO, EDL.ADCUoffsets AND 0FFh
                        LDI       _ACCCHI, EDL.ADCUoffsets SHRB 8
                        LDS       _ACCA, EDL.SubCh
                        SUBI      _ACCA, 06Eh AND 0FFh
                        .BRANCH   20, _CSE0056
                        RJMP      _CSE0056
                        .ENDBLOCK 402
EDL._L1045:
                        .LINE     403
                        CPI       _ACCA, 112
                        .BRANCH   1, EDL._L1048
                        BRCS      EDL._L1048
                        CPI       _ACCA, 115
                        .BRANCH   3,EDL._L1050
                        BREQ      EDL._L1050
                        .BRANCH   2, EDL._L1048
                        BRCC      EDL._L1048
EDL._L1050:
                        .BLOCK    404
                        .LINE     404
                        LDI       _ACCCLO, EDL.ADCIoffsets AND 0FFh
                        LDI       _ACCCHI, EDL.ADCIoffsets SHRB 8
                        LDS       _ACCA, EDL.SubCh
                        SUBI      _ACCA, 070h AND 0FFh
_CSE0056:                         
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LDS       _ACCALO, EDL.ParamInt
                        LDS       _ACCAHI, EDL.ParamInt+1
                        CALL      SYSTEM._WriteEEp16
                        .ENDBLOCK 405
                        .BRANCH   20,EDL._L1029
                        RJMP      EDL._L1029
EDL._L1048:
                        .LINE     406
                        CPI       _ACCA, 200
                        .BRANCH   3,EDL._L1051
                        BREQ      EDL._L1051
                        CPI       _ACCA, 201
                        .BRANCH   4, EDL._L1054
                        BRNE      EDL._L1054
EDL._L1051:
                        .BRANCH   20,EDL._L1029
                        RJMP      EDL._L1029
EDL._L1054:
                        .LINE     408
                        CPI       _ACCA, 202
                        .BRANCH   1, EDL._L1057
                        BRCS      EDL._L1057
                        CPI       _ACCA, 205
                        .BRANCH   3,EDL._L1059
                        BREQ      EDL._L1059
                        .BRANCH   2, EDL._L1057
                        BRCC      EDL._L1057
EDL._L1059:
                        .BLOCK    409
                        .LINE     409
                        LDI       _ACCCLO, EDL.DACIscales AND 0FFh
                        LDI       _ACCCHI, EDL.DACIscales SHRB 8
                        LDS       _ACCA, EDL.SubCh
                        SUBI      _ACCA, 0CAh AND 0FFh
                        .BRANCH   20, _CSE0055
                        RJMP      _CSE0055
                        .ENDBLOCK 410
EDL._L1057:
                        .LINE     411
                        CPI       _ACCA, 210
                        .BRANCH   4, EDL._L1061
                        BRNE      EDL._L1061
                        .BLOCK    412
                        .LINE     412
                        LDS       _ACCB, EDL.Param
                        LDS       _ACCA, EDL.Param+1
                        LDS       _ACCALO, EDL.Param+2
                        LDS       _ACCAHI, EDL.Param+3
                        LDI       _ACCCLO, EDL.ADC16USCALELOW AND 0FFh
                        LDI       _ACCCHI, EDL.ADC16USCALELOW SHRB 8
                        .BRANCH   20, _CSE0057
                        RJMP      _CSE0057
                        .ENDBLOCK 413
EDL._L1061:
                        .LINE     414
                        CPI       _ACCA, 211
                        .BRANCH   4, EDL._L1064
                        BRNE      EDL._L1064
                        .BLOCK    415
                        .LINE     415
                        LDS       _ACCB, EDL.Param
                        LDS       _ACCA, EDL.Param+1
                        LDS       _ACCALO, EDL.Param+2
                        LDS       _ACCAHI, EDL.Param+3
                        LDI       _ACCCLO, EDL.ADC16USCALEHIGH AND 0FFh
                        LDI       _ACCCHI, EDL.ADC16USCALEHIGH SHRB 8
_CSE0057:                         
                        MOVW      _ACCBLO, _ACCB
                        CALL      SYSTEM._WriteEEp32
                        ADIW      _ACCCLO, 01h
                        .ENDBLOCK 416
                        .BRANCH   20,EDL._L1029
                        RJMP      EDL._L1029
EDL._L1064:
                        .LINE     417
                        CPI       _ACCA, 212
                        .BRANCH   1, EDL._L1067
                        BRCS      EDL._L1067
                        CPI       _ACCA, 215
                        .BRANCH   3,EDL._L1069
                        BREQ      EDL._L1069
                        .BRANCH   2, EDL._L1067
                        BRCC      EDL._L1067
EDL._L1069:
                        .BLOCK    418
                        .LINE     418
                        LDI       _ACCCLO, EDL.ADCIscales AND 0FFh
                        LDI       _ACCCHI, EDL.ADCIscales SHRB 8
                        LDS       _ACCA, EDL.SubCh
                        SUBI      _ACCA, 0D4h AND 0FFh
_CSE0055:                         
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LDS       _ACCB, EDL.Param
                        LDS       _ACCA, EDL.Param+1
                        LDS       _ACCALO, EDL.Param+2
                        LDS       _ACCAHI, EDL.Param+3
                        MOVW      _ACCBLO, _ACCB
                        CALL      SYSTEM._WriteEEp32
                        .ENDBLOCK 419
EDL._L1067:
EDL._L1029:
                        .LINE     429
                        .BRANCH   17,EDL.INITSCALES
                        CALL      EDL.INITSCALES
                        ADIW      _FRAMEPTR, 18
                        .LINE     430
                        LDI       _ACCA, 00003h SHRB 8
                        LDI       _ACCB, 00003h AND 0FFh
                        .FRAME  0
                        CALL      SYSTEM.MDELAY
                        .ENDBLOCK 431
                        RJMP      EDL._L0944
                        .BLOCK    431
                        .FRAME  1
                        .FRAME  0
                        .ENDBLOCK 434
                        .ENDBLOCK 435
EDL._L1023:
                        .LINE     436
                        CPI       _ACCA, 150
                        .BRANCH   1, EDL._L1071
                        BRCS      EDL._L1071
                        CPI       _ACCA, 171
                        .BRANCH   3,EDL._L1073
                        BREQ      EDL._L1073
                        .BRANCH   2, EDL._L1071
                        BRCC      EDL._L1071
EDL._L1073:
                        .BLOCK    437
                        .LINE     437
                        LDS       _ACCB, 003E4h
                        SBRS      _ACCB, 004h
                        RJMP      EDL._L1089
                        .BLOCK    437
                        .LINE     438
                        LDI       _ACCCLO, EDL.OptionArray AND 0FFh
                        LDI       _ACCCHI, EDL.OptionArray SHRB 8
                        LDS       _ACCB, EDL.subCh
                        SUBI      _ACCB, 096h AND 0FFh
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LDS       _ACCB, EDL.Param
                        LDS       _ACCA, EDL.Param+1
                        LDS       _ACCALO, EDL.Param+2
                        LDS       _ACCAHI, EDL.Param+3
                        MOVW      _ACCBLO, _ACCB
                        CALL      SYSTEM._WriteEEp32
                        .LINE     439
                        .BRANCH   17,EDL.INITSCALES
                        CALL      EDL.INITSCALES
                        ADIW      _FRAMEPTR, 18
                        .LINE     440
                        LDI       _ACCA, 00003h SHRB 8
                        LDI       _ACCB, 00003h AND 0FFh
                        .FRAME  0
                        CALL      SYSTEM.MDELAY
                        .ENDBLOCK 441
                        RJMP      EDL._L0944
                        .BLOCK    441
                        .FRAME  1
                        .FRAME  0
                        .ENDBLOCK 444
                        .ENDBLOCK 445
EDL._L1071:
                        .LINE     446
                        CPI       _ACCA, 240
                        .BRANCH   4, EDL._L1078
                        BRNE      EDL._L1078
                        .BLOCK    447
                        .LINE     447
                        LDS       _ACCA, EDL.ParamInt
                        STS       EDL.TRIGMASK, _ACCA
                        .LINE     448
                        LDI       _ACCCLO, EDL.EETRIGMASK AND 0FFh
                        LDI       _ACCCHI, EDL.EETRIGMASK SHRB 8
                        CALL      SYSTEM.WriteEEp8
                        ADIW      _ACCCLO, 01h
                        .ENDBLOCK 449
                        .BRANCH   20,EDL._L0944
                        RJMP      EDL._L0944
EDL._L1078:
                        .LINE     450
                        CPI       _ACCA, 250
                        .BRANCH   3, EDL._L0944
                        BREQ      EDL._L0944
                        .LINE     452
                        CPI       _ACCA, 251
                        .BRANCH   4, EDL._L1084
                        BRNE      EDL._L1084
                        .BLOCK    453
                        .LINE     453
                        LDS       _ACCB, EDL.ParamInt
                        LDS       _ACCA, EDL.ParamInt+1
                        STS       EDL.ERRCOUNT, _ACCB
                        STS       EDL.ERRCOUNT+1, _ACCA
                        .ENDBLOCK 454
                        .BRANCH   20,EDL._L0944
                        RJMP      EDL._L0944
EDL._L1084:
                        .LINE     455
                        CPI       _ACCA, 252
                        .BRANCH   4, EDL._L1087
                        BRNE      EDL._L1087
                        .BLOCK    456
                        .LINE     456
                        LDS       _ACCB, 003E4h
                        SBRS      _ACCB, 004h
                        .BRANCH   20,EDL._L1089
                        RJMP      EDL._L1089
                        .BLOCK    456
                        .LINE     457
                        LDS       _ACCA, EDL.ParamByte
                        LDI       _ACCCLO, EDL.EESERBAUDREG AND 0FFh
                        LDI       _ACCCHI, EDL.EESERBAUDREG SHRB 8
                        CALL      SYSTEM.WriteEEp8
                        ADIW      _ACCCLO, 01h
                        .ENDBLOCK 458
                        RJMP      EDL._L0944
EDL._L1089:
                        .BLOCK    458
                        .LINE     459
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 006h
_CSE0053:                         
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.SERPROMPT
                        CALL      EDL.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     465
                        .LINE     299
                        .LINE     443
                        .LINE     433
                        .LINE     460
                        .BRANCH   20,EDL.ParseSetParam_X
                        RJMP      EDL.ParseSetParam_X
                        .ENDBLOCK 461
                        .ENDBLOCK 462
EDL._L1087:
                        .BLOCK    463
                        .LINE     464
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 005h
                        .BRANCH   20, _CSE0053
                        RJMP      _CSE0053
                        .FRAME  1
                        .FRAME  0
                        .ENDBLOCK 466
EDL._L0944:
                        .LINE     467
                        LDS       _ACCA, 003E4h
                        CBR       _ACCA, 010h
                        STS       003E4h, _ACCA
                        .LINE     468
                        LDS       _ACCA, EDL.SubCh
                        CPI       _ACCA, 0FAh
                        .BRANCH   4, EDL._L1093
                        BRNE      EDL._L1093
                        .BLOCK    469
                        .LINE     469
                        LDS       _ACCA, 003E4h
                        SBR       _ACCA, 010h
                        STS       003E4h, _ACCA
                        .ENDBLOCK 470
EDL._L1093:
                        .LINE     471
                        .BRANCH   17,EDL.CHECKLIMITS
                        RCALL     EDL.CHECKLIMITS
                        .LINE     472
                        LDS       _ACCA, EDL.verbose
                        TST       _ACCA
                        .BRANCH   3, EDL._L1096
                        BREQ      EDL._L1096
                        .BLOCK    472
                        .LINE     473
                        LDS       _ACCA, EDL.CheckLimitErr
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.SERPROMPT
                        CALL      EDL.SERPROMPT
                        ADIW      _FRAMEPTR, 3
                        .ENDBLOCK 474
EDL._L1096:
                        .LINE     476
                        LDS       _ACCA, EDL.ModeSelect
                        .LINE     477
                        CPI       _ACCA, 3
                        .BRANCH   3,EDL._L1100
                        BREQ      EDL._L1100
                        CPI       _ACCA, 4
                        .BRANCH   4, EDL._L1103
                        BRNE      EDL._L1103
EDL._L1100:
                        .BLOCK    478
                        .LINE     478
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,EDL.SETLEVELDAC_R
                        CALL      EDL.SETLEVELDAC_R
                        .BRANCH   20, _CSE0058
                        RJMP      _CSE0058
                        .ENDBLOCK 479
EDL._L1103:
                        .LINE     480
                        CPI       _ACCA, 1
                        .BRANCH   3,EDL._L1105
                        BREQ      EDL._L1105
                        CPI       _ACCA, 2
                        .BRANCH   4, EDL._L1108
                        BRNE      EDL._L1108
EDL._L1105:
                        .BLOCK    481
                        .LINE     481
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,EDL.SETLEVELDAC_I
                        CALL      EDL.SETLEVELDAC_I
_CSE0058:                         
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 482
                        .BRANCH   20,EDL._L1099
                        RJMP      EDL._L1099
EDL._L1108:
                        .LINE     483
                        CPI       _ACCA, 5
                        .BRANCH   3,EDL._L1110
                        BREQ      EDL._L1110
                        CPI       _ACCA, 6
                        .BRANCH   4, EDL._L1113
                        BRNE      EDL._L1113
EDL._L1110:
                        .BLOCK    484
                        .LINE     484
                        .BRANCH   17,EDL.SETLEVELDAC_P
                        CALL      EDL.SETLEVELDAC_P
                        .ENDBLOCK 485
EDL._L1113:
EDL._L1099:
                        .ENDBLOCK 488
EDL.ParseSetParam_X:
                        .LINE     488
                        .BRANCH   19
                        RET
                        .ENDFUNC  488

                        .FUNC     Cmd2Index, 001EFh, 00020h
EDL.Cmd2Index:
                        .RETURNS   1
                        SBIW      _FRAMEPTR, 1
                        .BLOCK    498
                        .LINE     499
                        LDI       _ACCCLO, EDL.ParamStr AND 0FFh
                        LDI       _ACCCHI, EDL.ParamStr SHRB 8
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
                        LDI       _ACCCLO, EDL.ParamStr AND 0FFh
                        LDI       _ACCCHI, EDL.ParamStr SHRB 8
                        CALL      SYSTEM.UpperCaseStr
                        LDI       _ACCB, 028h
                        LDD       _ACCA, Y+000h
                        SUB       _ACCB, _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z, _ACCB
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .LINE     500
                        .LOOP
                        .FRAME    0
                        LDI       _ACCA, 000h
                        STD       Y+000h, _ACCA
EDL._L1117:
                        CPI       _ACCA, 01Fh
                        .BRANCH   2, EDL._L1116
                        BRSH      EDL._L1116
                        .BLOCK    501
                        .LINE     501
                        LDD       _ACCB, Y+000h
                        CLR       _ACCA
                        LDI       _ACCBLO, 00004h AND 0FFh
                        LDI       _ACCBHI, 00004h SHRB 8
                        CLT
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.MUL16
                        LDI       _ACCCHI, EDL.CmdStrArr SHRB 8
                        LDI       _ACCCLO, EDL.CmdStrArr AND 0FFh
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LDI       _ACCBHI, EDL.ParamStr SHRB 8
                        LDI       _ACCBLO, EDL.ParamStr AND 0FFh
                        SET
                        BLD       Flags, _STRCONST
                        CALL      SYSTEM.StringComp
                        .BRANCH   4, EDL._L1121
                        BRNE      EDL._L1121
                        .BLOCK    501
                        .LINE     502
                        LDD       _ACCA, Y+000h
                        .BRANCH   20,EDL.Cmd2Index_X
                        RJMP      EDL.Cmd2Index_X
                        .ENDBLOCK 503
EDL._L1121:
                        .ENDBLOCK 504
                        .LINE     504
                        LDD       _ACCA, Y+000h
                        INC       _ACCA
                        STD       Y+000h, _ACCA
                        TST       _ACCA
                        .BRANCH   4, EDL._L1117
                        BRNE      EDL._L1117
EDL._L1116:
                        .FRAME  0
                        .ENDLOOP
                        .LINE     505
                        LDI       _ACCA, 01Fh
                        .ENDBLOCK 506
EDL.Cmd2Index_X:
                        .LINE     506
                        .BRANCH   19
                        RET
                        .ENDFUNC  506

                        .FUNC     ParseExtract, 001FCh, 00020h
EDL.ParseExtract:
                        .RETURNS   1
                        SBIW      _FRAMEPTR, 2
                        .BLOCK    512
                        .LINE     513
                        LDI       _ACCCLO, EDL.ParamStr AND 0FFh
                        LDI       _ACCCHI, EDL.ParamStr SHRB 8
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
                        LDD       _ACCB, Y+000h
                        SUB       _ACCA, _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z, _ACCA
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .LINE     514
                        LDI       _ACCA, 000h
                        STD       Y+000h, _ACCA
                        .LINE     515
EDL._L1124:
                        LDI       _ACCCLO, EDL.SerInpStr AND 0FFh
                        LDI       _ACCCHI, EDL.SerInpStr SHRB 8
                        LDS       _ACCB, EDL.SerInpPtr
                        CLR       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCA, Z+
                        CPI       _ACCA, 020h
                        .BRANCH   4, EDL._L1125
                        BRNE      EDL._L1125
                        .BLOCK    516
                        .LINE     516
                        LDS       _ACCA, EDL.serInpPtr
                        INC       _ACCA
                        STS       EDL.serInpPtr, _ACCA
                        .ENDBLOCK 517
                        .LINE     517
                        .BRANCH   20,EDL._L1124
                        RJMP      EDL._L1124
EDL._L1125:
                        .LINE     518
                        LDI       _ACCCLO, EDL.SerInpStr AND 0FFh
                        LDI       _ACCCHI, EDL.SerInpStr SHRB 8
                        LDS       _ACCB, EDL.SerInpPtr
                        CLR       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCA, Z+
                        CPI       _ACCA, 039h
                        .BRANCH   3,EDL._L1128
                        BREQ      EDL._L1128
                        .BRANCH   1,EDL._L1129
                        BRSH      EDL._L1129
                        CPI       _ACCA, 02Ah
                        .BRANCH   1,EDL._L1129
                        BRLO      EDL._L1129
                        LDI       _ACCDLO, 0
                        SEZ
                        .BRANCH   20,EDL._L1128
                        RJMP      EDL._L1128
EDL._L1129:
                        LDI       _ACCDLO, 001h
EDL._L1128:
                        .BRANCH   3, EDL._L1133
                        BREQ      EDL._L1133
                        .BRANCH   20,EDL._L1131
                        RJMP      EDL._L1131
EDL._L1133:
                        .BLOCK    519
                        .LINE     519
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .LINE     520
                        .LOOP
                        LDI       _ACCCLO, EDL.i AND 0FFh
                        LDI       _ACCCHI, EDL.i SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDS       _ACCA, EDL.SerInpPtr
                        ST        Z, _ACCA
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCCLO, EDL.SerInpStr AND 0FFh
                        LDI       _ACCCHI, EDL.SerInpStr SHRB 8
                        LD        _ACCA, Z
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
EDL._L1136:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        .BRANCH   1, EDL._L1135
                        BRLO      EDL._L1135
                        .BLOCK    521
                        .LINE     521
                        LDI       _ACCCLO, EDL.SerInpStr AND 0FFh
                        LDI       _ACCCHI, EDL.SerInpStr SHRB 8
                        MOV       _ACCB, EDL.i
                        CLR       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCA, Z+
                        STD       Y+004h, _ACCA
                        .LINE     522
                        CPI       _ACCA, 039h
                        .BRANCH   3,EDL._L1139
                        BREQ      EDL._L1139
                        .BRANCH   1,EDL._L1140
                        BRSH      EDL._L1140
                        CPI       _ACCA, 02Ah
                        .BRANCH   1,EDL._L1140
                        BRLO      EDL._L1140
                        LDI       _ACCDLO, 0
                        SEZ
                        .BRANCH   20,EDL._L1139
                        RJMP      EDL._L1139
EDL._L1140:
                        LDI       _ACCDLO, 001h
EDL._L1139:
                        .BRANCH   4, EDL._L1142
                        BRNE      EDL._L1142
                        .BLOCK    522
                        .LINE     523
                        LDD       _ACCEHI, Y+004h
                        LDI       _ACCELO, 001h
                        LDI       _ACCA, _ACCELO SHRB 8
                        LDI       _ACCB, _ACCELO AND 0FFh
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDI       _ACCCLO, EDL.ParamStr AND 0FFh
                        LDI       _ACCCHI, EDL.ParamStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCA, 028h
                        PUSH      _ACCA
                        LDI       _ACCFHI, 000h
                        CALL      SYSTEM.StringAppend
                        .ENDBLOCK 525
                        .BRANCH   20,EDL._L1143
                        RJMP      EDL._L1143
EDL._L1142:
                        .BLOCK    525
                        .LINE     525
                        .BRANCH   20, EDL._L1151
                        RJMP      EDL._L1151
                        .ENDBLOCK 527
EDL._L1143:
                        .ENDBLOCK 528
                        .LINE     528
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   4, EDL._L1136
                        BRNE      EDL._L1136
EDL._L1135:
                        .BRANCH   20, EDL._L1146
                        RJMP      EDL._L1146
                        .FRAME  0
                        .ENDLOOP
                        .ENDBLOCK 529
EDL._L1131:
                        .BLOCK    529
                        .LINE     530
                        .LOOP
                        LDI       _ACCCLO, EDL.i AND 0FFh
                        LDI       _ACCCHI, EDL.i SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDS       _ACCA, EDL.SerInpPtr
                        ST        Z, _ACCA
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCCLO, EDL.SerInpStr AND 0FFh
                        LDI       _ACCCHI, EDL.SerInpStr SHRB 8
                        LD        _ACCA, Z
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
EDL._L1147:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        .BRANCH   1, EDL._L1146
                        BRLO      EDL._L1146
                        .BLOCK    531
                        .LINE     531
                        LDI       _ACCCLO, EDL.SerInpStr AND 0FFh
                        LDI       _ACCCHI, EDL.SerInpStr SHRB 8
                        MOV       _ACCB, EDL.i
                        CLR       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCA, Z+
                        STD       Y+004h, _ACCA
                        .LINE     532
                        CPI       _ACCA, 041h
                        .BRANCH   1, EDL._L1151
                        BRLO      EDL._L1151
                        .BLOCK    532
                        .LINE     533
                        LDD       _ACCEHI, Y+004h
                        LDI       _ACCELO, 001h
                        LDI       _ACCA, _ACCELO SHRB 8
                        LDI       _ACCB, _ACCELO AND 0FFh
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDI       _ACCCLO, EDL.ParamStr AND 0FFh
                        LDI       _ACCCHI, EDL.ParamStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCA, 028h
                        PUSH      _ACCA
                        LDI       _ACCFHI, 000h
                        CALL      SYSTEM.StringAppend
                        .ENDBLOCK 535
                        .BRANCH   20,EDL._L1152
                        RJMP      EDL._L1152
EDL._L1151:
                        .BLOCK    535
                        .LINE     535
                        MOV       _ACCA, EDL.i
                        STS       EDL.SERINPPTR, _ACCA
                        .LINE     526
                        .LINE     536
                        LDD       _ACCA, Y+003h
                        ADIW      _FRAMEPTR, 3
                        .BRANCH   20,EDL.ParseExtract_X
                        RJMP      EDL.ParseExtract_X
                        .ENDBLOCK 537
EDL._L1152:
                        .ENDBLOCK 538
                        .LINE     538
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   4, EDL._L1147
                        BRNE      EDL._L1147
EDL._L1146:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .ENDBLOCK 539
                        .LINE     540
                        LDD       _ACCA, Y+000h
                        .ENDBLOCK 541
EDL.ParseExtract_X:
                        .LINE     541
                        .BRANCH   19
                        RET
                        .ENDFUNC  541

                        .FUNC     ParseSubCh, 0021Fh, 00020h
EDL.ParseSubCh:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 12
                        .BLOCK    554
                        .LINE     555
                        LDI       _ACCBLO, EDL.SerInpStr AND 0FFh
                        LDI       _ACCBHI, EDL.SerInpStr SHRB 8
                        LDI       _ACCCLO, $St_String17 AND 0FFh
                        LDI       _ACCCHI, $St_String17 SHRB 8
                        SET
                        BLD       Flags, _STRCONST
                        CALL      SYSTEM.StringComp
                        .BRANCH   4, EDL._L1155
                        BRNE      EDL._L1155
                        .BLOCK    555
                        .LINE     556
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        .BRANCH   20, _CSE0059
                        RJMP      _CSE0059
                        .FRAME  1
                        .FRAME  0
                        .ENDBLOCK 558
EDL._L1155:
                        .LINE     559
                        LDI       _ACCB, 03Ah
                        LDI       _ACCCLO, EDL.SerInpStr AND 0FFh
                        LDI       _ACCCHI, EDL.SerInpStr SHRB 8
                        LDI       _ACCELO, 001h
                        CALL      SYSTEM.PosChInVarStr
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      EDL._L1158
                        BRLO      EDL._L1158
                        SER       _ACCA
EDL._L1158:
                        STD       Y+005h, _ACCA
                        .LINE     560
                        LDI       _ACCB, 03Dh
                        LDI       _ACCCLO, EDL.SerInpStr AND 0FFh
                        LDI       _ACCCHI, EDL.SerInpStr SHRB 8
                        LDI       _ACCELO, 001h
                        CALL      SYSTEM.PosChInVarStr
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      EDL._L1159
                        BRLO      EDL._L1159
                        SER       _ACCA
EDL._L1159:
                        COM       _ACCA
                        STD       Y+001h, _ACCA
                        .LINE     561
                        LDI       _ACCCLO, EDL.SerInpStr AND 0FFh
                        LDI       _ACCCHI, EDL.SerInpStr SHRB 8
                        ADIW      _ACCCLO, 00001h
                        LD        _ACCA, Z+
                        STD       Y+006h, _ACCA
                        .LINE     562
                        CPI       _ACCA, 02Ah
                        LDI       _ACCA, 0h
                        BRNE      EDL._L1160
                        SER       _ACCA
EDL._L1160:
                        STD       Y+002h, _ACCA
                        .LINE     563
                        LDD       _ACCA, Y+006h
                        CPI       _ACCA, 023h
                        LDI       _ACCA, 0h
                        BRNE      EDL._L1161
                        SER       _ACCA
EDL._L1161:
                        STD       Y+003h, _ACCA
                        .LINE     564
                        TST       _ACCA
                        .BRANCH   4, EDL._L1174
                        BRNE      EDL._L1174
                        .BLOCK    564
                        .LINE     565
                        .BRANCH   17,EDL.WRITESERINP
                        .ENDBLOCK 567
                        .LINE     568
                        LDI       _ACCA, 001h
                        STS       EDL.SERINPPTR, _ACCA
                        .LINE     569
                        LDD       _ACCA, Y+005h
                        TST       _ACCA
                        .BRANCH   3, EDL._L1165
                        BREQ      EDL._L1165
                        .BLOCK    569
                        .LINE     570
                        .BRANCH   17,EDL.PARSEEXTRACT
                        RCALL     EDL.PARSEEXTRACT
                        ADIW      _FRAMEPTR, 2
                        STD       Y+000h, _ACCA
                        .LINE     571
                        LDS       _ACCA, EDL.SerInpPtr
                        INC       _ACCA
                        STS       EDL.SerInpPtr, _ACCA
                        .LINE     572
                        LDD       _ACCA, Y+002h
                        TST       _ACCA
                        .BRANCH   3, EDL._L1168
                        BREQ      EDL._L1168
                        .BLOCK    573
                        .LINE     573
                        .BRANCH   17,EDL.WRITESERINP
                        CALL      EDL.WRITESERINP
                        .ENDBLOCK 574
                        .BRANCH   20,EDL._L1169
                        RJMP      EDL._L1169
EDL._L1168:
                        .BLOCK    574
                        .LINE     575
                        LDI       _ACCCLO, EDL.ParamStr AND 0FFh
                        LDI       _ACCCHI, EDL.ParamStr SHRB 8
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        CLT
                        BLD       Flags, _ERRFLAG
                        LDI       _ACCB, 000h
                        CALL      SYSTEM.Str2Int
                        MOV       _ACCA, _ACCB
                        STS       EDL.CURRENTCH, _ACCA
                        .ENDBLOCK 576
EDL._L1169:
                        .ENDBLOCK 577
EDL._L1165:
                        .LINE     578
                        LDD       _ACCA, Y+002h
                        COM       _ACCA
                        PUSH      _ACCA
                        LDS       _ACCB, EDL.CurrentCh
                        LDS       _ACCA, EDL.SlaveCh
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0h
                        BREQ      EDL._L1171
                        SER       _ACCA
EDL._L1171:
                        POP       _ACCB
                        AND       _ACCA, _ACCB
                        MOV       _ACCB, _ACCA
                        LDD       _ACCA, Y+005h
                        AND       _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   3, EDL._L1172
                        BREQ      EDL._L1172
EDL._L1174:
                        .BLOCK    579
                        .LINE     579
                        .BRANCH   17,EDL.WRITESERINP
                        CALL      EDL.WRITESERINP
                        .LINE     566
                        .LINE     580
                        .BRANCH   20,EDL.ParseSubCh_X
                        RJMP      EDL.ParseSubCh_X
                        .ENDBLOCK 581
EDL._L1172:
                        .LINE     585
                        LDI       _ACCB, 021h
                        LDI       _ACCCLO, EDL.SerInpStr AND 0FFh
                        LDI       _ACCCHI, EDL.SerInpStr SHRB 8
                        LDI       _ACCELO, 001h
                        CALL      SYSTEM.PosChInVarStr
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      EDL._L1175
                        BRLO      EDL._L1175
                        SER       _ACCA
EDL._L1175:
                        PUSH      _ACCA
                        LDI       _ACCB, 03Fh
                        LDI       _ACCCLO, EDL.SerInpStr AND 0FFh
                        LDI       _ACCCHI, EDL.SerInpStr SHRB 8
                        LDI       _ACCELO, 001h
                        CALL      SYSTEM.PosChInVarStr
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      EDL._L1176
                        BRLO      EDL._L1176
                        SER       _ACCA
EDL._L1176:
                        POP       _ACCB
                        OR        _ACCA, _ACCB
                        STS       EDL.VERBOSE, _ACCA
                        .LINE     586
                        LDI       _ACCB, 024h
                        LDI       _ACCCLO, EDL.SerInpStr AND 0FFh
                        LDI       _ACCCHI, EDL.SerInpStr SHRB 8
                        LDI       _ACCELO, 001h
                        CALL      SYSTEM.PosChInVarStr
                        STD       Y+00Ah, _ACCA
                        .LINE     587
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      EDL._L1177
                        BRLO      EDL._L1177
                        SER       _ACCA
EDL._L1177:
                        STD       Y+004h, _ACCA
                        .LINE     588
                        TST       _ACCA
                        .BRANCH   4,EDL._L1180
                        BRNE      EDL._L1180
                        .BRANCH   20,EDL._L1178
                        RJMP      EDL._L1178
EDL._L1180:
                        .BLOCK    588
                        .LINE     589
                        LDI       _ACCCLO, EDL.ParamStr AND 0FFh
                        LDI       _ACCCHI, EDL.ParamStr SHRB 8
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
                        LDI       _ACCCLO, EDL.SerInpStr AND 0FFh
                        LDI       _ACCCHI, EDL.SerInpStr SHRB 8
                        LDD       _ACCB, Y+00Dh
                        SUBI      _ACCB, -001h AND 0FFh
                        LDI       _ACCA, 002h
                        CALL      SYSTEM.StrCopyV
                        LDI       _ACCA, 028h
                        LDD       _ACCB, Y+000h
                        SUB       _ACCA, _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z, _ACCA
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .LINE     590
                        LDI       _ACCCLO, EDL.ParamStr AND 0FFh
                        LDI       _ACCCHI, EDL.ParamStr SHRB 8
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        CLT
                        BLD       Flags, _ERRFLAG
                        LDI       _ACCB, 0FFh
                        CALL      SYSTEM.Str2Int
                        STD       Y+008h, _ACCB
                        .LINE     591
                        LDI       _ACCA, 000h
                        STD       Y+009h, _ACCA
                        .LINE     592
                        .LOOP
                        LDI       _ACCCLO, EDL.i AND 0FFh
                        LDI       _ACCCHI, EDL.i SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 001h
                        ST        Z, _ACCA
                        LDD       _ACCA, Y+00Ch
                        SUBI      _ACCA, 001h AND 0FFh
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
EDL._L1183:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        .BRANCH   1, EDL._L1182
                        BRLO      EDL._L1182
                        .BLOCK    593
                        .LINE     593
                        LDI       _ACCCLO, EDL.SerInpStr AND 0FFh
                        LDI       _ACCCHI, EDL.SerInpStr SHRB 8
                        MOV       _ACCB, EDL.i
                        CLR       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCA, Z+
                        STD       Y+009h, _ACCA
                        .LINE     594
                        LDD       _ACCB, Y+00Ch
                        EOR       _ACCA, _ACCB
                        STD       Y+00Ch, _ACCA
                        .ENDBLOCK 595
                        .LINE     595
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   4, EDL._L1183
                        BRNE      EDL._L1183
EDL._L1182:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .LINE     596
                        LDD       _ACCB, Y+009h
                        LDD       _ACCA, Y+008h
                        CP        _ACCB, _ACCA
                        .BRANCH   3, EDL._L1187
                        BREQ      EDL._L1187
                        .BLOCK    596
                        .LINE     597
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 007h
                        .BRANCH   20, _CSE0059
                        RJMP      _CSE0059
                        .FRAME  1
                        .FRAME  0
                        .ENDBLOCK 599
EDL._L1187:
                        .ENDBLOCK 600
EDL._L1178:
                        .LINE     602
                        LDI       _ACCA, 0FFh
                        STS       EDL.ActivityTimer, _ACCA
                        .LINE     603
                        CBI       00032h, 002h
                        .LINE     607
                        .BRANCH   17,EDL.PARSEEXTRACT
                        RCALL     EDL.PARSEEXTRACT
                        ADIW      _FRAMEPTR, 2
                        TST       _ACCA
                        .BRANCH   3, EDL._L1190
                        BREQ      EDL._L1190
                        .BLOCK    607
                        .LINE     608
                        LDI       _ACCA, 000h
                        STD       Y+007h, _ACCA
                        .ENDBLOCK 609
                        .BRANCH   20,EDL._L1191
                        RJMP      EDL._L1191
EDL._L1190:
                        .BLOCK    609
                        .LINE     610
                        .BRANCH   17,EDL.CMD2INDEX
                        RCALL     EDL.CMD2INDEX
                        ADIW      _FRAMEPTR, 1
                        STS       EDL.CMDWHICH, _ACCA
                        .LINE     611
                        CPI       _ACCA, 01Fh
                        .BRANCH   4, EDL._L1194
                        BRNE      EDL._L1194
                        .BLOCK    611
                        .LINE     612
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 004h
                        .BRANCH   20, _CSE0059
                        RJMP      _CSE0059
                        .FRAME  1
                        .FRAME  0
                        .ENDBLOCK 614
EDL._L1194:
                        .LINE     615
                        LDI       _ACCCLO, EDL.Cmd2SubChArr AND 0FFh
                        LDI       _ACCCHI, EDL.Cmd2SubChArr SHRB 8
                        LDS       _ACCB, EDL.CmdWhich
                        CLR       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LPM       _ACCA, Z
                        STD       Y+007h, _ACCA
                        .LINE     616
                        .BRANCH   17,EDL.PARSEEXTRACT
                        RCALL     EDL.PARSEEXTRACT
                        ADIW      _FRAMEPTR, 2
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 617
EDL._L1191:
                        .LINE     618
                        LDI       _ACCCLO, EDL.ParamStr AND 0FFh
                        LDI       _ACCCHI, EDL.ParamStr SHRB 8
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        CLT
                        BLD       Flags, _ERRFLAG
                        LDI       _ACCB, 000h
                        CALL      SYSTEM.Str2Int
                        MOV       _ACCA, _ACCB
                        MOV       _ACCB, _ACCA
                        LDD       _ACCA, Y+007h
                        ADD       _ACCA, _ACCB
                        STS       EDL.SUBCH, _ACCA
                        .LINE     620
                        LDD       _ACCA, Y+001h
                        TST       _ACCA
                        .BRANCH   3, EDL._L1197
                        BREQ      EDL._L1197
                        .BLOCK    620
                        .LINE     621
                        .BRANCH   17,EDL.PARSEGETPARAM
                        RCALL     EDL.PARSEGETPARAM
                        .ENDBLOCK 622
                        .BRANCH   20,EDL._L1198
                        RJMP      EDL._L1198
EDL._L1197:
                        .BLOCK    622
                        .LINE     623
                        LDI       _ACCB, 03Dh
                        LDI       _ACCCLO, EDL.SerInpStr AND 0FFh
                        LDI       _ACCCHI, EDL.SerInpStr SHRB 8
                        LDI       _ACCELO, 001h
                        CALL      SYSTEM.PosChInVarStr
                        SUBI      _ACCA, -001h AND 0FFh
                        STS       EDL.SERINPPTR, _ACCA
                        .LINE     624
                        CPI       _ACCA, 001h
                        LDI       _ACCA, 0h
                        BREQ      EDL._L1200
                        BRLO      EDL._L1200
                        SER       _ACCA
EDL._L1200:
                        PUSH      _ACCA
                        .BRANCH   17,EDL.PARSEEXTRACT
                        RCALL     EDL.PARSEEXTRACT
                        ADIW      _FRAMEPTR, 2
                        POP       _ACCB
                        AND       _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   3, EDL._L1201
                        BREQ      EDL._L1201
                        .BLOCK    624
                        .LINE     625
                        LDI       _ACCCLO, EDL.ParamStr AND 0FFh
                        LDI       _ACCCHI, EDL.ParamStr SHRB 8
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        CALL      SYSTEM.Str2Float
                        STS       EDL.PARAM, _ACCB
                        STS       EDL.PARAM+1, _ACCA
                        STS       EDL.PARAM+2, _ACCALO
                        STS       EDL.PARAM+3, _ACCAHI
                        .LINE     626
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.FloatToLInt
                        SBRC      _ACCAHI, 7
                        RJMP      EDL._L1204
                        OR        _ACCAHI, _ACCALO
                        BRNE      EDL._L1205
                        RJMP      EDL._L1206
EDL._L1204:
                        CPI       _ACCAHI, 0FFh
                        BRNE      EDL._L1205
                        CPI       _ACCALO, 0FFh
                        BREQ      EDL._L1206
EDL._L1205:
                        SET
                        BLD       Flags, _ERRFLAG
EDL._L1206:
                        STS       EDL.PARAMINT, _ACCB
                        STS       EDL.PARAMINT+1, _ACCA
                        .LINE     627
                        STS       EDL.PARAMBYTE, _ACCB
                        .ENDBLOCK 628
                        .BRANCH   20,EDL._L1202
                        RJMP      EDL._L1202
EDL._L1201:
                        .BLOCK    628
                        .LINE     629
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 005h
_CSE0059:                         
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.SERPROMPT
                        CALL      EDL.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     630
                        .BRANCH   20,EDL.ParseSubCh_X
                        RJMP      EDL.ParseSubCh_X
                        .ENDBLOCK 631
EDL._L1202:
                        .LINE     632
                        .BRANCH   17,EDL.PARSESETPARAM
                        RCALL     EDL.PARSESETPARAM
                        .ENDBLOCK 633
EDL._L1198:
                        .ENDBLOCK 634
EDL.ParseSubCh_X:
                        .LINE     634
                        .BRANCH   19
                        RET
                        .ENDFUNC  634


                        .FILE     H:\PROJAVR\ADA-C EDL_MCB\EDL.pas
                        .FUNC     FaultCheck, 00627h, 00020h
EDL.FaultCheck:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 4
                        .BLOCK    1577
                        .LINE     1578
                        LDS       _ACCB, 00330h
                        CLR       _ACCA
                        SBRC      _ACCB, 002h
                        SER       _ACCA
                        PUSH      _ACCA
                        CLR       _ACCA
                        SBRC      _ACCB, 003h
                        SER       _ACCA
                        POP       _ACCB
                        OR        _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   3, EDL._L1207
                        BREQ      EDL._L1207
                        .BLOCK    1578
                        .LINE     1579
                        LDS       _ACCA, EDL.TemperatureTimer
                        CPI       _ACCA, 000h
                        .BRANCH   4, EDL._L1211
                        BRNE      EDL._L1211
                        .BLOCK    1579
                        .LINE     1580
                        LDI       _ACCA, 014h
                        STS       EDL.TEMPERATURETIMER, _ACCA
                        .LINE     1581
                        .BRANCH   17,EDL.GETLM75TEMP
                        CALL      EDL.GETLM75TEMP
                        ADIW      _FRAMEPTR, 2
                        .ENDBLOCK 1582
EDL._L1211:
                        .LINE     1583
                        LDS       _ACCA, EDL.TemperatureTimer
                        DEC       _ACCA
                        STS       EDL.TemperatureTimer, _ACCA
                        .ENDBLOCK 1584
                        .BRANCH   20,EDL._L1208
                        RJMP      EDL._L1208
EDL._L1207:
                        .BLOCK    1584
                        .LINE     1585
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 000h
                        STS       EDL.TEMPERATURE, _ACCB
                        STS       EDL.TEMPERATURE+1, _ACCA
                        STS       EDL.TEMPERATURE+2, _ACCALO
                        STS       EDL.TEMPERATURE+3, _ACCAHI
                        .ENDBLOCK 1586
EDL._L1208:
                        .LINE     1587
                        LDS       _ACCBLO, EDL.Temperature
                        LDS       _ACCBHI, EDL.Temperature+1
                        LDS       _ACCCLO, EDL.Temperature+2
                        LDS       _ACCCHI, EDL.Temperature+3
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 08Ch
                        LDI       _ACCAHI, 042h
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      EDL._L1215
                        BRPL      EDL._L1216
                        BRMI      EDL._L1214
EDL._L1216:
                        CLZ
                        CLC
                        RJMP      EDL._L1215
EDL._L1214:
                        CLZ
                        SEC
EDL._L1215:
                        CLT       
                        BREQ      EDL._L1217
                        BRLO      EDL._L1217
                        SET       
EDL._L1217:
                        LDS       _ACCA, 003E5h
                        BLD       _ACCA, 003h
                        STS       003E5h, _ACCA
                        .LINE     1588
                        LDS       _ACCA, EDL.ModeSelect
                        CPI       _ACCA, 001h
                        .BRANCH   3,EDL._L1219
                        BREQ      EDL._L1219
                        CPI       _ACCA, 003h
                        .BRANCH   3,EDL._L1219
                        BREQ      EDL._L1219
                        CPI       _ACCA, 005h
                        .BRANCH   3,EDL._L1219
                        BREQ      EDL._L1219
EDL._L1219:
                        .BRANCH   4, EDL._L1221
                        BRNE      EDL._L1221
                        .BLOCK    1588
                        .LINE     1589
                        LDI       _ACCCLO, EDL.UmaxHi AND 0FFh
                        LDI       _ACCCHI, EDL.UmaxHi SHRB 8
                        .BRANCH   20, _CSE0060
                        RJMP      _CSE0060
                        .ENDBLOCK 1590
EDL._L1221:
                        .BLOCK    1590
                        .LINE     1591
                        LDI       _ACCCLO, EDL.UmaxLo AND 0FFh
                        LDI       _ACCCHI, EDL.UmaxLo SHRB 8
_CSE0060:                         
                        CALL      SYSTEM._ReadEEp32
                        STD       Y+003h, _ACCAHI
                        STD       Y+002h, _ACCALO
                        STD       Y+001h, _ACCA
                        STD       Y+000h, _ACCB
                        .ENDBLOCK 1592
                        .LINE     1593
                        LDI       _ACCA, 0FFh
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.GETVOLTAGE
                        CALL      EDL.GETVOLTAGE
                        ADIW      _FRAMEPTR, 5
                        .LINE     1594
                        LDS       _ACCBLO, EDL.Param
                        LDS       _ACCBHI, EDL.Param+1
                        LDS       _ACCCLO, EDL.Param+2
                        LDS       _ACCCHI, EDL.Param+3
                        LDD       _ACCAHI, Y+003h
                        LDD       _ACCALO, Y+002h
                        LDD       _ACCA, Y+001h
                        LDD       _ACCB, Y+000h
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      EDL._L1225
                        BRPL      EDL._L1226
                        BRMI      EDL._L1224
EDL._L1226:
                        CLZ
                        CLC
                        RJMP      EDL._L1225
EDL._L1224:
                        CLZ
                        SEC
EDL._L1225:
                        CLT       
                        BREQ      EDL._L1227
                        BRLO      EDL._L1227
                        SET       
EDL._L1227:
                        LDS       _ACCA, 003E5h
                        BLD       _ACCA, 002h
                        STS       003E5h, _ACCA
                        .LINE     1595
                        LDS       _ACCBHI, EDL.Psoa+1
                        LDI       _ACCCLO, EDL.Pmax AND 0FFh
                        LDI       _ACCCHI, EDL.Pmax SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        LDS       _ACCCHI, EDL.Psoa+3
                        LDS       _ACCCLO, EDL.Psoa+2
                        LDS       _ACCBLO, EDL.Psoa
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      EDL._L1230
                        BRPL      EDL._L1231
                        BRMI      EDL._L1229
EDL._L1231:
                        CLZ
                        CLC
                        RJMP      EDL._L1230
EDL._L1229:
                        CLZ
                        SEC
EDL._L1230:
                        CLT       
                        BREQ      EDL._L1232
                        BRLO      EDL._L1232
                        SET       
EDL._L1232:
                        LDS       _ACCA, 003E5h
                        BLD       _ACCA, 000h
                        STS       003E5h, _ACCA
                        .LINE     1597
                        LDS       _ACCBLO, EDL.Param
                        LDS       _ACCBHI, EDL.Param+1
                        LDS       _ACCCLO, EDL.Param+2
                        LDS       _ACCCHI, EDL.Param+3
                        LDS       _ACCB, EDL.DCVolt
                        LDS       _ACCA, EDL.DCVolt+1
                        LDS       _ACCALO, EDL.DCVolt+2
                        LDS       _ACCAHI, EDL.DCVolt+3
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      EDL._L1235
                        BRPL      EDL._L1236
                        BRMI      EDL._L1234
EDL._L1236:
                        CLZ
                        CLC
                        RJMP      EDL._L1235
EDL._L1234:
                        CLZ
                        SEC
EDL._L1235:
                        LDI       _ACCA, 0FFh
                        BRLO      EDL._L1237
                        CLR       _ACCA
EDL._L1237:
                        PUSH      _ACCA
                        LDS       _ACCBLO, EDL.DCVolt
                        LDS       _ACCBHI, EDL.DCVolt+1
                        LDS       _ACCCLO, EDL.DCVolt+2
                        LDS       _ACCCHI, EDL.DCVolt+3
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 000h
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BREQ      EDL._L1239
                        BRPL      EDL._L1240
                        BRMI      EDL._L1238
EDL._L1240:
                        CLZ
                        CLC
                        RJMP      EDL._L1239
EDL._L1238:
                        CLZ
                        SEC
EDL._L1239:
                        LDI       _ACCA, 0h
                        BREQ      EDL._L1241
                        BRLO      EDL._L1241
                        SER       _ACCA
EDL._L1241:
                        POP       _ACCB
                        AND       _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   3, EDL._L1242
                        BREQ      EDL._L1242
                        .BLOCK    1597
                        .LINE     1598
                        LDS       _ACCA, 003E5h
                        SBR       _ACCA, 010h
                        STS       003E5h, _ACCA
                        .LINE     1599
                        LDI       _ACCA, 000h
                        STS       EDL.OUTPUTENABLE, _ACCA
                        .ENDBLOCK 1600
EDL._L1242:
                        .LINE     1601
                        LDS       _ACCA, EDL.FaultFlags
                        CPI       _ACCA, 000h
                        .BRANCH   3, EDL._L1246
                        BREQ      EDL._L1246
                        .BLOCK    1601
                        .LINE     1602
                        LDS       _ACCA, 003E4h
                        SBR       _ACCA, 020h
                        STS       003E4h, _ACCA
                        .LINE     1605
                        IN        _ACCA, DDRD
                        ORI       _ACCA, 008h
                        OUT       DDRD, _ACCA
                        .LINE     1606
                        CBI       00032h, 003h
                        .LINE     1609
                        CBI       00032h, 003h
                        .LINE     1610
                        CBI       00035h, 004h
                        .ENDBLOCK 1611
                        .BRANCH   20,EDL._L1247
                        RJMP      EDL._L1247
EDL._L1246:
                        .BLOCK    1611
                        .LINE     1612
                        LDS       _ACCA, 003E4h
                        CBR       _ACCA, 020h
                        STS       003E4h, _ACCA
                        .LINE     1613
                        SBI       00032h, 003h
                        .LINE     1616
                        LDS       _ACCA, EDL.RModeOn
                        TST       _ACCA
                        .BRANCH   3, EDL._L1249
                        BREQ      EDL._L1249
                        .BLOCK    1616
                        .LINE     1617
                        IN        _ACCA, DDRD
                        ANDI      _ACCA, 0F7h
                        OUT       DDRD, _ACCA
                        .LINE     1618
                        CBI       00032h, 003h
                        .ENDBLOCK 1619
EDL._L1249:
                        .LINE     1621
                        LDS       _ACCA, EDL.IModeOn
                        TST       _ACCA
                        .BRANCH   3, EDL._L1252
                        BREQ      EDL._L1252
                        .BLOCK    1621
                        .LINE     1622
                        IN        _ACCA, DDRD
                        ORI       _ACCA, 008h
                        OUT       DDRD, _ACCA
                        .LINE     1623
                        SBI       00032h, 003h
                        .ENDBLOCK 1624
EDL._L1252:
                        .LINE     1626
                        LDS       _ACCA, EDL.RModeOn
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BRNE      EDL._L1255
                        SER       _ACCA
EDL._L1255:
                        PUSH      _ACCA
                        LDS       _ACCA, EDL.IModeOn
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BRNE      EDL._L1256
                        SER       _ACCA
EDL._L1256:
                        POP       _ACCB
                        AND       _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   3, EDL._L1257
                        BREQ      EDL._L1257
                        .BLOCK    1626
                        .LINE     1627
                        IN        _ACCA, DDRD
                        ANDI      _ACCA, 0F7h
                        OUT       DDRD, _ACCA
                        .LINE     1628
                        CBI       00032h, 003h
                        .ENDBLOCK 1629
EDL._L1257:
                        .LINE     1631
                        LDS       _ACCA, EDL.OutputEnable
                        CLT
                        TST       _ACCA
                        BREQ      EDL._L1260
                        SET
EDL._L1260:
                        IN        _ACCA, 00035h
                        BLD       _ACCA, 004h
                        OUT       00035h, _ACCA
                        .ENDBLOCK 1632
EDL._L1247:
                        .ENDBLOCK 1633
                        .LINE     1633
                        .BRANCH   19
                        RET
                        .ENDFUNC  1633

                        .FUNC     Chores, 00663h, 00020h
EDL.Chores:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 4
                        .BLOCK    1638
                        .LINE     1639
                        LDS       _ACCB, EDL.IntegrateTimer
                        TST       _ACCB
                        .BRANCH   3, EDL._L1264
                        BREQ      EDL._L1264
                        .BRANCH   20,EDL._L1262
                        RJMP      EDL._L1262
EDL._L1264:
                        .BLOCK    1639
                        .LINE     1640
                        LDI       _ACCA, 028h
                        STS       EDL.IntegrateTimer, _ACCA
                        .LINE     1641
                        LDI       _ACCA, 0FFh
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.GETVOLTAGE
                        CALL      EDL.GETVOLTAGE
                        ADIW      _FRAMEPTR, 5
                        .LINE     1642
                        LDS       _ACCB, EDL.Param
                        LDS       _ACCA, EDL.Param+1
                        LDS       _ACCALO, EDL.Param+2
                        LDS       _ACCAHI, EDL.Param+3
                        STS       EDL.PON, _ACCB
                        STS       EDL.PON+1, _ACCA
                        STS       EDL.PON+2, _ACCALO
                        STS       EDL.PON+3, _ACCAHI
                        .LINE     1643
                        LDS       _ACCA, EDL.ModeSelect
                        .LINE     1644
                        CPI       _ACCA, 0
                        .BRANCH   4, EDL._L1267
                        BRNE      EDL._L1267
                        .BLOCK    1645
                        .LINE     1645
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 000h
                        STS       EDL.PSOA, _ACCB
                        STS       EDL.PSOA+1, _ACCA
                        STS       EDL.PSOA+2, _ACCALO
                        STS       EDL.PSOA+3, _ACCAHI
                        .LINE     1646
                        CBI       00035h, 004h
                        .ENDBLOCK 1647
                        .BRANCH   20,EDL._L1265
                        RJMP      EDL._L1265
EDL._L1267:
                        .LINE     1648
                        CPI       _ACCA, 4
                        .BRANCH   3,EDL._L1269
                        BREQ      EDL._L1269
                        CPI       _ACCA, 3
                        .BRANCH   4, EDL._L1272
                        BRNE      EDL._L1272
EDL._L1269:
                        .BLOCK    1649
                        .LINE     1649
                        LDS       _ACCB, EDL.Param
                        LDS       _ACCA, EDL.Param+1
                        LDS       _ACCALO, EDL.Param+2
                        LDS       _ACCAHI, EDL.Param+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, EDL.DCohm
                        LDS       _ACCA, EDL.DCohm+1
                        LDS       _ACCALO, EDL.DCohm+2
                        LDS       _ACCAHI, EDL.DCohm+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat
                        STS       EDL.PSOA, _ACCB
                        STS       EDL.PSOA+1, _ACCA
                        STS       EDL.PSOA+2, _ACCALO
                        STS       EDL.PSOA+3, _ACCAHI
                        .LINE     1650
                        LDS       _ACCA, EDL.OutputEnable
                        CLT
                        TST       _ACCA
                        BREQ      EDL._L1274
                        SET
EDL._L1274:
                        .BRANCH   20, EDL._L1281
                        RJMP      EDL._L1281
                        .ENDBLOCK 1651
EDL._L1272:
                        .LINE     1653
                        CPI       _ACCA, 6
                        .BRANCH   3,EDL._L1275
                        BREQ      EDL._L1275
                        CPI       _ACCA, 5
                        .BRANCH   4, EDL._L1278
                        BRNE      EDL._L1278
EDL._L1275:
                        .BLOCK    1654
                        .LINE     1654
                        LDI       _ACCCLO, EDL.Pmax AND 0FFh
                        LDI       _ACCCHI, EDL.Pmax SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        STS       EDL.PSOA, _ACCB
                        STS       EDL.PSOA+1, _ACCA
                        STS       EDL.PSOA+2, _ACCALO
                        STS       EDL.PSOA+3, _ACCAHI
                        .LINE     1655
                        LDS       _ACCA, EDL.OutputEnable
                        CLT
                        TST       _ACCA
                        .BRANCH   3, EDL._L1281
                        BREQ      EDL._L1281
                        SET
                        .BRANCH   20, EDL._L1281
                        RJMP      EDL._L1281
                        .ENDBLOCK 1656
EDL._L1278:
                        .BLOCK    1658
                        .LINE     1659
                        LDS       _ACCB, EDL.Param
                        LDS       _ACCA, EDL.Param+1
                        LDS       _ACCALO, EDL.Param+2
                        LDS       _ACCAHI, EDL.Param+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, EDL.DCamp
                        LDS       _ACCA, EDL.DCamp+1
                        LDS       _ACCALO, EDL.DCamp+2
                        LDS       _ACCAHI, EDL.DCamp+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        STS       EDL.PSOA, _ACCB
                        STS       EDL.PSOA+1, _ACCA
                        STS       EDL.PSOA+2, _ACCALO
                        STS       EDL.PSOA+3, _ACCAHI
                        .LINE     1660
                        LDS       _ACCA, EDL.OutputEnable
                        CLT
                        TST       _ACCA
                        BREQ      EDL._L1281
                        SET
EDL._L1281:
                        IN        _ACCA, 00035h
                        BLD       _ACCA, 004h
                        OUT       00035h, _ACCA
                        .ENDBLOCK 1661
EDL._L1265:
                        .LINE     1662
                        LDI       _ACCA, 0FFh
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.GETCURRENT
                        CALL      EDL.GETCURRENT
                        ADIW      _FRAMEPTR, 5
                        .LINE     1663
                        LDS       _ACCB, EDL.Pon
                        LDS       _ACCA, EDL.Pon+1
                        LDS       _ACCALO, EDL.Pon+2
                        LDS       _ACCAHI, EDL.Pon+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, EDL.Param
                        LDS       _ACCA, EDL.Param+1
                        LDS       _ACCALO, EDL.Param+2
                        LDS       _ACCAHI, EDL.Param+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        STS       EDL.PON, _ACCB
                        STS       EDL.PON+1, _ACCA
                        STS       EDL.PON+2, _ACCALO
                        STS       EDL.PON+3, _ACCAHI
                        .LINE     1665
                        LDS       _ACCB, EDL.Param
                        LDS       _ACCA, EDL.Param+1
                        LDS       _ACCALO, EDL.Param+2
                        LDS       _ACCAHI, EDL.Param+3
                        STS       EDL.CURRAMP, _ACCB
                        STS       EDL.CURRAMP+1, _ACCA
                        STS       EDL.CURRAMP+2, _ACCALO
                        STS       EDL.CURRAMP+3, _ACCAHI
                        .LINE     1666
                        LDI       _ACCA, 0FFh
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.GETVOLTAGE
                        CALL      EDL.GETVOLTAGE
                        ADIW      _FRAMEPTR, 5
                        .LINE     1667
                        LDS       _ACCB, EDL.Param
                        LDS       _ACCA, EDL.Param+1
                        LDS       _ACCALO, EDL.Param+2
                        LDS       _ACCAHI, EDL.Param+3
                        STS       EDL.CURRVOLT, _ACCB
                        STS       EDL.CURRVOLT+1, _ACCA
                        STS       EDL.CURRVOLT+2, _ACCALO
                        STS       EDL.CURRVOLT+3, _ACCAHI
                        .LINE     1669
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.GETVOLTAGE
                        CALL      EDL.GETVOLTAGE
                        ADIW      _FRAMEPTR, 5
                        .LINE     1670
                        LDS       _ACCB, EDL.Param
                        LDS       _ACCA, EDL.Param+1
                        LDS       _ACCALO, EDL.Param+2
                        LDS       _ACCAHI, EDL.Param+3
                        STS       EDL.POFF, _ACCB
                        STS       EDL.POFF+1, _ACCA
                        STS       EDL.POFF+2, _ACCALO
                        STS       EDL.POFF+3, _ACCAHI
                        .LINE     1671
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.GETCURRENT
                        CALL      EDL.GETCURRENT
                        ADIW      _FRAMEPTR, 5
                        .LINE     1672
                        LDS       _ACCB, EDL.Poff
                        LDS       _ACCA, EDL.Poff+1
                        LDS       _ACCALO, EDL.Poff+2
                        LDS       _ACCAHI, EDL.Poff+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, EDL.Param
                        LDS       _ACCA, EDL.Param+1
                        LDS       _ACCALO, EDL.Param+2
                        LDS       _ACCAHI, EDL.Param+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        STS       EDL.POFF, _ACCB
                        STS       EDL.POFF+1, _ACCA
                        STS       EDL.POFF+2, _ACCALO
                        STS       EDL.POFF+3, _ACCAHI
                        .LINE     1673
                        LDS       _ACCB, EDL.PWonTime
                        LDS       _ACCA, EDL.PWonTime+1
                        SBRS      _ACCA, 7
                        RJMP      EDL._L1282
                        LDI       _ACCAHI, 0FFh
                        LDI       _ACCALO, 0FFh
                        RJMP      EDL._L1283
EDL._L1282:
                        CLR       _ACCAHI
                        CLR       _ACCALO
EDL._L1283:
                        SET
                        BLD       Flags, _SIGN
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.LIntToFloat
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, EDL.PWoffTime
                        LDS       _ACCA, EDL.PWoffTime+1
                        SBRS      _ACCA, 7
                        RJMP      EDL._L1284
                        LDI       _ACCAHI, 0FFh
                        LDI       _ACCALO, 0FFh
                        RJMP      EDL._L1285
EDL._L1284:
                        CLR       _ACCAHI
                        CLR       _ACCALO
EDL._L1285:
                        SET
                        BLD       Flags, _SIGN
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.LIntToFloat
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.AddFloat
                        STD       Y+003h, _ACCAHI
                        STD       Y+002h, _ACCALO
                        STD       Y+001h, _ACCA
                        STD       Y+000h, _ACCB
                        .LINE     1674
                        LDS       _ACCB, EDL.Pon
                        LDS       _ACCA, EDL.Pon+1
                        LDS       _ACCALO, EDL.Pon+2
                        LDS       _ACCAHI, EDL.Pon+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, EDL.PWonTime
                        LDS       _ACCA, EDL.PWonTime+1
                        SBRS      _ACCA, 7
                        RJMP      EDL._L1286
                        LDI       _ACCAHI, 0FFh
                        LDI       _ACCALO, 0FFh
                        RJMP      EDL._L1287
EDL._L1286:
                        CLR       _ACCAHI
                        CLR       _ACCALO
EDL._L1287:
                        SET
                        BLD       Flags, _SIGN
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.LIntToFloat
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, EDL.Poff
                        LDS       _ACCA, EDL.Poff+1
                        LDS       _ACCALO, EDL.Poff+2
                        LDS       _ACCAHI, EDL.Poff+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, EDL.PWoffTime
                        LDS       _ACCA, EDL.PWoffTime+1
                        SBRS      _ACCA, 7
                        RJMP      EDL._L1288
                        LDI       _ACCAHI, 0FFh
                        LDI       _ACCALO, 0FFh
                        RJMP      EDL._L1289
EDL._L1288:
                        CLR       _ACCAHI
                        CLR       _ACCALO
EDL._L1289:
                        SET
                        BLD       Flags, _SIGN
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.LIntToFloat
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.AddFloat
                        STS       EDL.PTOT, _ACCB
                        STS       EDL.PTOT+1, _ACCA
                        STS       EDL.PTOT+2, _ACCALO
                        STS       EDL.PTOT+3, _ACCAHI
                        .LINE     1675
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDD       _ACCAHI, Y+003h
                        LDD       _ACCALO, Y+002h
                        LDD       _ACCA, Y+001h
                        LDD       _ACCB, Y+000h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat
                        STS       EDL.PTOT, _ACCB
                        STS       EDL.PTOT+1, _ACCA
                        STS       EDL.PTOT+2, _ACCALO
                        STS       EDL.PTOT+3, _ACCAHI
                        .LINE     1676
                        .BRANCH   17,EDL.FAULTCHECK
                        RCALL     EDL.FAULTCHECK
                        ADIW      _FRAMEPTR, 4
                        .LINE     1677
                        LDS       _ACCA, EDL.FaultTimerByte
                        CPI       _ACCA, 000h
                        .BRANCH   4, EDL._L1291
                        BRNE      EDL._L1291
                        .BLOCK    1678
                        .LINE     1678
                        LDS       _ACCB, 003EDh
                        SBRS      _ACCB, 001h
                        .BRANCH   20,EDL._L1294
                        RJMP      EDL._L1294
                        .BLOCK    1678
                        .LINE     1679
                        LDI       _ACCA, 00Ah
                        STS       EDL.SUBCH, _ACCA
                        .LINE     1680
                        .BRANCH   17,EDL.PARSEGETPARAM
                        CALL      EDL.PARSEGETPARAM
                        .LINE     1681
                        LDI       _ACCA, 00Bh
                        STS       EDL.SUBCH, _ACCA
                        .LINE     1682
                        .BRANCH   17,EDL.PARSEGETPARAM
                        CALL      EDL.PARSEGETPARAM
                        .LINE     1683
                        LDS       _ACCA, EDL.NoToggle
                        COM       _ACCA
                        TST       _ACCA
                        .BRANCH   3, EDL._L1297
                        BREQ      EDL._L1297
                        .BLOCK    1684
                        .LINE     1684
                        LDI       _ACCA, 00Fh
                        STS       EDL.SUBCH, _ACCA
                        .LINE     1685
                        .BRANCH   17,EDL.PARSEGETPARAM
                        CALL      EDL.PARSEGETPARAM
                        .LINE     1686
                        LDI       _ACCA, 010h
                        STS       EDL.SUBCH, _ACCA
                        .LINE     1687
                        .BRANCH   17,EDL.PARSEGETPARAM
                        CALL      EDL.PARSEGETPARAM
                        .ENDBLOCK 1688
EDL._L1297:
                        .ENDBLOCK 1689
EDL._L1294:
                        .LINE     1690
                        LDS       _ACCA, EDL.FaultFlags
                        CPI       _ACCA, 000h
                        .BRANCH   3, EDL._L1301
                        BREQ      EDL._L1301
                        .BLOCK    1690
                        .LINE     1691
                        LDI       _ACCA, 003h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.SERPROMPT
                        CALL      EDL.SERPROMPT
                        ADIW      _FRAMEPTR, 3
                        .ENDBLOCK 1692
EDL._L1301:
                        .LINE     1693
                        LDI       _ACCA, 00Ah
                        STS       EDL.FAULTTIMERBYTE, _ACCA
                        .ENDBLOCK 1694
EDL._L1291:
                        .LINE     1695
                        LDS       _ACCA, EDL.FaultTimerByte
                        DEC       _ACCA
                        STS       EDL.FaultTimerByte, _ACCA
                        .LINE     1696
                        LDS       _ACCB, 003EDh
                        SBRS      _ACCB, 000h
                        .BRANCH   20,EDL._L1304
                        RJMP      EDL._L1304
                        .BLOCK    1696
                        .LINE     1697
                        SBIS      036h, 002h
                        .BRANCH   20,EDL._L1307
                        RJMP      EDL._L1307
                        .BLOCK    1697
                        .LINE     1698
                        LDS       _ACCA, EDL.TrigOnSema
                        COM       _ACCA
                        TST       _ACCA
                        .BRANCH   3,EDL._L1308
                        BREQ      EDL._L1308
                        .BLOCK    1698
                        .LINE     1699
                        LDI       _ACCA, 00Ah
                        STS       EDL.SUBCH, _ACCA
                        .LINE     1700
                        .BRANCH   17,EDL.PARSEGETPARAM
                        CALL      EDL.PARSEGETPARAM
                        .LINE     1701
                        LDI       _ACCA, 00Bh
                        STS       EDL.SUBCH, _ACCA
                        .LINE     1702
                        .BRANCH   17,EDL.PARSEGETPARAM
                        CALL      EDL.PARSEGETPARAM
                        .LINE     1703
                        LDI       _ACCA, 0FFh
                        STS       EDL.TRIGONSEMA, _ACCA
                        .LINE     1704
                        LDI       _ACCA, 000h
                        STS       EDL.TRIGOFFSEMA, _ACCA
                        .ENDBLOCK 1705
                        .ENDBLOCK 1706
                        .BRANCH   20,EDL._L1308
                        RJMP      EDL._L1308
EDL._L1307:
                        .BLOCK    1706
                        .LINE     1707
                        LDS       _ACCA, EDL.TrigOffSema
                        COM       _ACCA
                        TST       _ACCA
                        .BRANCH   3, EDL._L1313
                        BREQ      EDL._L1313
                        .BLOCK    1707
                        .LINE     1708
                        LDI       _ACCA, 00Fh
                        STS       EDL.SUBCH, _ACCA
                        .LINE     1709
                        .BRANCH   17,EDL.PARSEGETPARAM
                        CALL      EDL.PARSEGETPARAM
                        .LINE     1710
                        LDI       _ACCA, 010h
                        STS       EDL.SUBCH, _ACCA
                        .LINE     1711
                        .BRANCH   17,EDL.PARSEGETPARAM
                        CALL      EDL.PARSEGETPARAM
                        .LINE     1712
                        LDI       _ACCA, 0FFh
                        STS       EDL.TRIGOFFSEMA, _ACCA
                        .LINE     1713
                        LDI       _ACCA, 000h
                        STS       EDL.TRIGONSEMA, _ACCA
                        .ENDBLOCK 1714
EDL._L1313:
                        .ENDBLOCK 1715
EDL._L1308:
                        .ENDBLOCK 1716
EDL._L1304:
                        .ENDBLOCK 1717
EDL._L1262:
                        .ENDBLOCK 1718
                        .LINE     1718
                        .BRANCH   19
                        RET
                        .ENDFUNC  1718

                        .FUNC     CheckSer, 006B8h, 00020h
EDL.CheckSer:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 1
                        .BLOCK    1723
                        .LINE     1724
EDL._L1316:
                        MOVW      _ACCCLO, _FRAMEPTR
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 014h
                        ST        -Y, _ACCA
                        .FRAME  3
                        .FRAME  0
                        CALL       SYSTEM.SERINP_TO
                        ADIW      _FRAMEPTR, 3
                        TST       _ACCA
                        .BRANCH   4,EDL._L1318
                        BRNE      EDL._L1318
                        .BRANCH   20,EDL._L1317
                        RJMP      EDL._L1317
EDL._L1318:
                        .BLOCK    1726
                        .LINE     1726
                        LDD       _ACCA, Y+000h
                        CPI       _ACCA, 07Fh
                        .BRANCH   3,EDL._L1319
                        BREQ      EDL._L1319
                        .BRANCH   1,EDL._L1320
                        BRSH      EDL._L1320
                        CPI       _ACCA, 020h
                        .BRANCH   1,EDL._L1320
                        BRLO      EDL._L1320
                        LDI       _ACCDLO, 0
                        SEZ
                        .BRANCH   20,EDL._L1319
                        RJMP      EDL._L1319
EDL._L1320:
                        LDI       _ACCDLO, 001h
EDL._L1319:
                        .BRANCH   4, EDL._L1322
                        BRNE      EDL._L1322
                        .BLOCK    1727
                        .LINE     1727
                        LDD       _ACCEHI, Y+000h
                        LDI       _ACCELO, 001h
                        LDI       _ACCA, _ACCELO SHRB 8
                        LDI       _ACCB, _ACCELO AND 0FFh
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDI       _ACCCLO, EDL.SerInpStr AND 0FFh
                        LDI       _ACCCHI, EDL.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCA, 03Fh
                        PUSH      _ACCA
                        LDI       _ACCFHI, 000h
                        CALL      SYSTEM.StringAppend
                        .ENDBLOCK 1728
EDL._L1322:
                        .LINE     1729
                        LDD       _ACCA, Y+000h
                        CPI       _ACCA, 008h
                        .BRANCH   4, EDL._L1326
                        BRNE      EDL._L1326
                        .BLOCK    1730
                        .LINE     1730
                        LDI       _ACCCLO, EDL.SerInpStr AND 0FFh
                        LDI       _ACCCHI, EDL.SerInpStr SHRB 8
                        LD        _ACCA, Z
                        SUBI      _ACCA, 001h AND 0FFh
                        LDI       _ACCCHI, EDL.SerInpStr SHRB 8
                        LDI       _ACCCLO, EDL.SerInpStr AND 0FFh
                        CPI       _ACCA, 63
                        BRCS      EDL._L1329
                        LDI       _ACCA, 63
EDL._L1329:
                        ST        Z+, _ACCA
                        .ENDBLOCK 1731
EDL._L1326:
                        .LINE     1732
                        LDD       _ACCA, Y+000h
                        CPI       _ACCA, 00Dh
                        .BRANCH   4,EDL._L1316
                        BRNE      EDL._L1316
                        .BLOCK    1732
                        .LINE     1733
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,EDL.CHORES
                        RCALL     EDL.CHORES
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1734
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,EDL.PARSESUBCH
                        RCALL     EDL.PARSESUBCH
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1735
                        LDI       _ACCCLO, EDL.SerInpStr AND 0FFh
                        LDI       _ACCCHI, EDL.SerInpStr SHRB 8
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
                        LDI       _ACCB, 03Fh
                        LDD       _ACCA, Y+000h
                        SUB       _ACCB, _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z, _ACCB
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDBLOCK 1736
                        .ENDBLOCK 1737
                        .LINE     1737
                        .BRANCH   20,EDL._L1316
                        RJMP      EDL._L1316
EDL._L1317:
                        .LINE     1738
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,EDL.CHORES
                        RCALL     EDL.CHORES
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 1739
                        .LINE     1739
                        .BRANCH   19
                        RET
                        .ENDFUNC  1739

                        .FUNC     CheckDelay, 006CDh, 00020h
EDL.CheckDelay:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 1
                        .BLOCK    1744
                        .LINE     1745
                        .LOOP
                        .FRAME    0
                        LDI       _ACCA, 001h
                        STD       Y+000h, _ACCA
                        LDD       _ACCA, Y+001h
                        ST        -Y, _ACCA
                        .FRAME    1
                        LDD       _ACCA, Y+001h
EDL._L1336:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        .BRANCH   1, EDL._L1335
                        BRLO      EDL._L1335
                        .BLOCK    1746
                        .LINE     1746
                        .BRANCH   17,EDL.CHECKSER
                        RCALL     EDL.CHECKSER
                        ADIW      _FRAMEPTR, 1
                        .ENDBLOCK 1747
                        .LINE     1747
                        LDD       _ACCA, Y+001h
                        INC       _ACCA
                        STD       Y+001h, _ACCA
                        TST       _ACCA
                        .BRANCH   4, EDL._L1336
                        BRNE      EDL._L1336
EDL._L1335:
                        ADIW      _FRAMEPTR, 1
                        .FRAME  0
                        .ENDLOOP
                        .ENDBLOCK 1748
                        .LINE     1748
                        .BRANCH   19
                        RET
                        .ENDFUNC  1748

                        .FUNC     onTickTimer, 006D7h, 00020h
EDL.onTickTimer:
                        .RETURNS   0
                        .BLOCK    1752
                        .LINE     1753
                        LDS       _ACCB, EDL.PWoffTime
                        LDS       _ACCA, EDL.PWoffTime+1
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        CPI       _ACCA, 080h
                        BRNE      EDL._L1339
                        CPI       _ACCB, 000h
EDL._L1339:
                        LDI       _ACCA, 0h
                        BRNE      EDL._L1340
                        SER       _ACCA
EDL._L1340:
                        PUSH      _ACCA
                        LDS       _ACCB, EDL.Ipercent
                        LDS       _ACCA, EDL.Ipercent+1
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        CPI       _ACCA, 080h
                        BRNE      EDL._L1341
                        CPI       _ACCB, 064h
EDL._L1341:
                        LDI       _ACCA, 0h
                        BRNE      EDL._L1342
                        SER       _ACCA
EDL._L1342:
                        POP       _ACCB
                        OR        _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   4,EDL._L1345
                        BRNE      EDL._L1345
                        .BRANCH   20,EDL._L1343
                        RJMP      EDL._L1343
EDL._L1345:
                        .BLOCK    1753
                        .LINE     1754
                        LDS       _ACCB, EDL.Ah
                        LDS       _ACCA, EDL.Ah+1
                        LDS       _ACCALO, EDL.Ah+2
                        LDS       _ACCAHI, EDL.Ah+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, EDL.CurrAmp
                        LDS       _ACCA, EDL.CurrAmp+1
                        LDS       _ACCALO, EDL.CurrAmp+2
                        LDS       _ACCAHI, EDL.CurrAmp+3
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
                        STS       EDL.AH, _ACCB
                        STS       EDL.AH+1, _ACCA
                        STS       EDL.AH+2, _ACCALO
                        STS       EDL.AH+3, _ACCAHI
                        .LINE     1755
                        LDS       _ACCB, EDL.Wh
                        LDS       _ACCA, EDL.Wh+1
                        LDS       _ACCALO, EDL.Wh+2
                        LDS       _ACCAHI, EDL.Wh+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, EDL.CurrAmp
                        LDS       _ACCA, EDL.CurrAmp+1
                        LDS       _ACCALO, EDL.CurrAmp+2
                        LDS       _ACCAHI, EDL.CurrAmp+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, EDL.CurrVolt
                        LDS       _ACCA, EDL.CurrVolt+1
                        LDS       _ACCALO, EDL.CurrVolt+2
                        LDS       _ACCAHI, EDL.CurrVolt+3
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
                        .BRANCH   20, _CSE0061
                        RJMP      _CSE0061
                        .ENDBLOCK 1756
EDL._L1343:
                        .BLOCK    1756
                        .LINE     1757
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 000h
                        STS       EDL.AH, _ACCB
                        STS       EDL.AH+1, _ACCA
                        STS       EDL.AH+2, _ACCALO
                        STS       EDL.AH+3, _ACCAHI
                        .LINE     1758
_CSE0061:                         
                        STS       EDL.WH, _ACCB
                        STS       EDL.WH+1, _ACCA
                        STS       EDL.WH+2, _ACCALO
                        STS       EDL.WH+3, _ACCAHI
                        .ENDBLOCK 1759
                        .ENDBLOCK 1760
                        .LINE     1760
                        .BRANCH   19
                        RET
                        .ENDFUNC  1760

                        .FUNC     initall, 006E5h, 00020h
EDL.initall:
                        .RETURNS   0
                        .BLOCK    1767
                        .LINE     1769
                        LDI       _ACCA, 0BBh
                        OUT       DDRB, _ACCA
                        .LINE     1770
                        LDI       _ACCA, 0FDh
                        OUT       PORTB, _ACCA
                        .LINE     1771
                        LDI       _ACCA, 0FCh
                        OUT       DDRC, _ACCA
                        .LINE     1772
                        LDI       _ACCA, 0C3h
                        OUT       PORTC, _ACCA
                        .LINE     1773
                        LDI       _ACCA, 00Ch
                        OUT       DDRD, _ACCA
                        .LINE     1774
                        LDI       _ACCA, 0FFh
                        OUT       PORTD, _ACCA
                        .LINE     1776
                        LDI       _ACCA, 00000h SHRB 8
                        LDI       _ACCB, 00000h AND 0FFh
                        STS       EDL.DACTEMP, _ACCB
                        STS       EDL.DACTEMP+1, _ACCA
                        .LINE     1778
                        .BRANCH   17,EDL.SHIFTOUT8043
                        CALL      EDL.SHIFTOUT8043
                        .LINE     1780
                        LDI       _ACCCLO, EDL.EESerBaudReg AND 0FFh
                        LDI       _ACCCHI, EDL.EESerBaudReg SHRB 8
                        CALL      SYSTEM.ReadEEp8
                        MOV       EDL.I, _ACCA
                        .LINE     1781
                        MOV       _ACCA, EDL.i
                        CPI       _ACCA, 0EFh
                        .BRANCH   3,EDL._L1346
                        BREQ      EDL._L1346
                        .BRANCH   1,EDL._L1347
                        BRSH      EDL._L1347
                        CPI       _ACCA, 009h
                        .BRANCH   1,EDL._L1347
                        BRLO      EDL._L1347
                        LDI       _ACCDLO, 0
                        SEZ
                        .BRANCH   20,EDL._L1346
                        RJMP      EDL._L1346
EDL._L1347:
                        LDI       _ACCDLO, 001h
EDL._L1346:
                        .BRANCH   3, EDL._L1349
                        BREQ      EDL._L1349
                        .BLOCK    1781
                        .LINE     1782
                        LDI       _ACCA, 033h
                        LDI       _ACCCLO, EDL.EESERBAUDREG AND 0FFh
                        LDI       _ACCCHI, EDL.EESERBAUDREG SHRB 8
                        CALL      SYSTEM.WriteEEp8
                        ADIW      _ACCCLO, 01h
                        .LINE     1783
                        MOV       EDL.I, _ACCA
                        .ENDBLOCK 1784
EDL._L1349:
                        .LINE     1786
                        OUT       UBRR1, EDL.i
                        .LINE     1788
                        IN        _ACCA, UCSRA
                        ORI       _ACCA, 002h
                        OUT       UCSRA, _ACCA
                        .LINE     1795
                        LDI       _ACCA, 001h
                        .FRAME  0
                        CALL      SYSTEM.UDELAY
                        .LINE     1796
                        IN        _ACCA, PinD
                        COM       _ACCA
                        LDI       _ACCALO, 005h
                        CALL      SYSTEM.SHR8_R
                        STS       EDL.SLAVECH, _ACCA
                        .LINE     1798
                        CBI       00032h, 002h
                        .LINE     1800
                        LDI       _ACCA, 000h
                        .FRAME  0
                        CALL       SYSTEM.LCDSETUP_M
                        TST       _ACCA
                        .BRANCH   4,EDL._L1354
                        BRNE      EDL._L1354
                        .BRANCH   20,EDL._L1352
                        RJMP      EDL._L1352
EDL._L1354:
                        .BLOCK    1800
                        .LINE     1801
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        ST        -Y, _ACCA
                        .FRAME  2
                        ST        -Y, _ACCA
                        .FRAME  3
                        .FRAME  0
                        CALL      SYSTEM.LCDCURSOR_M
                        ADIW      _FRAMEPTR, 3
                        .LINE     1802
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
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
                        ADIW      _FRAMEPTR, 10
                        .LINE     1803
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  2
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
                        ADIW      _FRAMEPTR, 10
                        .LINE     1804
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
                        ADIW      _FRAMEPTR, 10
                        .LINE     1805
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
                        ST        -Y, _ACCA
                        .FRAME  5
                        ST        -Y, _ACCA
                        .FRAME  6
                        LDI       _ACCA, 00Ah
                        ST        -Y, _ACCA
                        .FRAME  7
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
                        ADIW      _FRAMEPTR, 10
                        .LINE     1806
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
                        ST        -Y, _ACCA
                        .FRAME  6
                        ST        -Y, _ACCA
                        .FRAME  7
                        LDI       _ACCA, 00Eh
                        ST        -Y, _ACCA
                        .FRAME  8
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  9
                        ST        -Y, _ACCA
                        .FRAME  10
                        .FRAME  0
                        CALL      SYSTEM.LCDCHARSET_M
                        ADIW      _FRAMEPTR, 10
                        .LINE     1807
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
                        ST        -Y, _ACCA
                        .FRAME  10
                        .FRAME  0
                        CALL      SYSTEM.LCDCHARSET_M
                        ADIW      _FRAMEPTR, 10
                        .LINE     1809
                        LDI       _ACCA, 0FFh
                        STS       EDL.LCDPRESENT, _ACCA
                        .LINE     1810
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, EDL.Vers3Str AND 0FFh
                        LDI       _ACCCHI, EDL.Vers3Str SHRB 8
                        CALL      SYSTEM.StrConst2Str
                        ADIW      _FRAMEPTR, 2
                        .FRAME  0
                        .LINE     1811
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        ST        -Y, _ACCA
                        .FRAME  2
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  3
                        .FRAME  0
                        CALL      SYSTEM.LCDXY_M
                        ADIW      _FRAMEPTR, 3
                        .LINE     1812
                        LDI       _ACCCLO, EDL.EEinitialised AND 0FFh
                        LDI       _ACCCHI, EDL.EEinitialised SHRB 8
                        CALL      SYSTEM._ReadEEp16
                        CPI       _ACCA, 0AAh
                        BRNE      EDL._L1356
                        CPI       _ACCB, 055h
EDL._L1356:
                        .BRANCH   3, EDL._L1358
                        BREQ      EDL._L1358
                        .BLOCK    1812
                        .LINE     1813
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, EDL.EEnotProgrammedStr AND 0FFh
                        LDI       _ACCCHI, EDL.EEnotProgrammedStr SHRB 8
                        CALL      SYSTEM.StrConst2Str
                        ADIW      _FRAMEPTR, 2
                        .FRAME  0
                        .ENDBLOCK 1814
                        .BRANCH   20,EDL._L1359
                        RJMP      EDL._L1359
EDL._L1358:
                        .BLOCK    1814
                        .LINE     1815
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, EDL.AdrStr AND 0FFh
                        LDI       _ACCCHI, EDL.AdrStr SHRB 8
                        CALL      SYSTEM.StrConst2Str
                        ADIW      _FRAMEPTR, 2
                        .FRAME  0
                        .LINE     1816
                        LDS       _ACCA, EDL.SlaveCh
                        SUBI      _ACCA, -030h AND 0FFh
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .ENDBLOCK 1817
EDL._L1359:
                        .ENDBLOCK 1818
EDL._L1352:
                        .LINE     1820
                        LDI       _ACCA, 003E8h SHRB 8
                        LDI       _ACCB, 003E8h AND 0FFh
                        .FRAME  0
                        CALL      SYSTEM.MDELAY
                        .LINE     1821
                        LDS       _ACCA, EDL.SlaveCh
                        CPI       _ACCA, 000h
                        .BRANCH   3, EDL._L1364
                        BREQ      EDL._L1364
                        .BRANCH   1, EDL._L1364
                        BRLO      EDL._L1364
                        .BLOCK    1821
                        .LINE     1822
                        .LOOP
                        LDI       _ACCCLO, EDL.i AND 0FFh
                        LDI       _ACCCHI, EDL.i SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 000h
                        ST        Z, _ACCA
                        LDS       _ACCA, EDL.SlaveCh
                        SUBI      _ACCA, 001h AND 0FFh
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
EDL._L1369:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        .BRANCH   1, EDL._L1368
                        BRLO      EDL._L1368
                        .BLOCK    1823
                        .LINE     1823
                        SET       
                        SBIC      032h, 002h
                        CLT       
                        IN        _ACCA, 00032h
                        BLD       _ACCA, 002h
                        OUT       00032h, _ACCA
                        .LINE     1824
                        LDI       _ACCA, 00096h SHRB 8
                        LDI       _ACCB, 00096h AND 0FFh
                        .FRAME  3
                        CALL      SYSTEM.MDELAY
                        .LINE     1825
                        SET       
                        SBIC      032h, 002h
                        CLT       
                        IN        _ACCA, 00032h
                        BLD       _ACCA, 002h
                        OUT       00032h, _ACCA
                        .LINE     1826
                        LDI       _ACCA, 00096h SHRB 8
                        LDI       _ACCB, 00096h AND 0FFh
                        .FRAME  3
                        CALL      SYSTEM.MDELAY
                        .ENDBLOCK 1827
                        .LINE     1827
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   4, EDL._L1369
                        BRNE      EDL._L1369
EDL._L1368:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .ENDBLOCK 1828
EDL._L1364:
                        .LINE     1829
                        SBI       00032h, 002h
                        .LINE     1830
                        LDI       _ACCA, 001h
                        STS       EDL.MODESELECT, _ACCA
                        .LINE     1831
                        LDI       _ACCA, 000h
                        STS       EDL.STATUS, _ACCA
                        .LINE     1832
                        LDI       _ACCA, 1 SHLB IntFlag
                        OR        Flags, _ACCA
                        SEI
                        .LINE     1833
EDL._L1374:
                        CALL       SYSTEM.SERSTAT
                        TST       _ACCA
                        .BRANCH   3, EDL._L1375
                        BREQ      EDL._L1375
                        .BLOCK    1833
                        .LINE     1834
                        CALL       SYSTEM.SERINP
                        MOV       EDL.I, _ACCA
                        .ENDBLOCK 1835
                        .LINE     1835
                        .BRANCH   20,EDL._L1374
                        RJMP      EDL._L1374
EDL._L1375:
                        .LINE     1836
                        LDI       _ACCA, 0FFh
                        STS       EDL.OUTPUTENABLE, _ACCA
                        .LINE     1837
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 080h
                        LDI       _ACCAHI, 03Fh
                        STS       EDL.DCAMPMOD, _ACCB
                        STS       EDL.DCAMPMOD+1, _ACCA
                        STS       EDL.DCAMPMOD+2, _ACCALO
                        STS       EDL.DCAMPMOD+3, _ACCAHI
                        .LINE     1838
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 000h
                        STS       EDL.DCAMP, _ACCB
                        STS       EDL.DCAMP+1, _ACCA
                        STS       EDL.DCAMP+2, _ACCALO
                        STS       EDL.DCAMP+3, _ACCAHI
                        .LINE     1839
                        .BRANCH   17,EDL.INITSCALES
                        CALL      EDL.INITSCALES
                        ADIW      _FRAMEPTR, 18
                        .LINE     1840
                        LDI       _ACCA, 004h
                        STS       EDL.SHUNTRANGE, _ACCA
                        .LINE     1841
                        LDI       _ACCA, 0FFh
                        STS       EDL.OLDSHUNTSELECT, _ACCA
                        .LINE     1842
                        .BRANCH   17,EDL.CALCRANGEI
                        CALL      EDL.CALCRANGEI
                        .LINE     1843
                        LDI       _ACCCLO, EDL.InitIncRast AND 0FFh
                        LDI       _ACCCHI, EDL.InitIncRast SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.FloatToLInt
                        SBRC      _ACCAHI, 7
                        RJMP      EDL._L1377
                        OR        _ACCAHI, _ACCALO
                        BRNE      EDL._L1378
                        RJMP      EDL._L1379
EDL._L1377:
                        CPI       _ACCAHI, 0FFh
                        BRNE      EDL._L1378
                        CPI       _ACCALO, 0FFh
                        BREQ      EDL._L1379
EDL._L1378:
                        SET
                        BLD       Flags, _ERRFLAG
EDL._L1379:
                        STS       EDL.INCRAST, _ACCB
                        STS       EDL.INCRAST+1, _ACCA
                        .LINE     1844
                        LDI       _ACCA, 000h
                        STS       EDL.MODIFY, _ACCA
                        .LINE     1845
                        CALL      SYSTEM.INCRCOUNT4START
                        .LINE     1846
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCB, 000000000h AND 0FFh
                        LDI       _ACCALO, 000000000h SHRB 16
                        LDI       _ACCAHI, 000000000h SHRB 24
                        ST        -Y, _ACCAHI
                        ST        -Y, _ACCALO
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  5
                        .FRAME  0
                        CALL      SYSTEM.SETINCRVAL4
                        ADIW      _FRAMEPTR, 5
                        .LINE     1847
                        LDI       _ACCA, 000h
                        .FRAME  0
                        CALL       SYSTEM.GETINCRVAL4
                        STS       EDL.INCRVALUE, _ACCB
                        STS       EDL.INCRVALUE+1, _ACCA
                        STS       EDL.INCRVALUE+2, _ACCALO
                        STS       EDL.INCRVALUE+3, _ACCAHI
                        .LINE     1848
                        STS       EDL.OLDINCRVALUE, _ACCB
                        STS       EDL.OLDINCRVALUE+1, _ACCA
                        STS       EDL.OLDINCRVALUE+2, _ACCALO
                        STS       EDL.OLDINCRVALUE+3, _ACCAHI
                        .LINE     1849
                        LDI       _ACCA, 000h
                        STS       EDL.INCRFINE, _ACCA
                        .LINE     1850
                        LDI       _ACCB, 00000h AND 0FFh
                        STS       EDL.INCRDIFF, _ACCB
                        STS       EDL.INCRDIFF+1, _ACCA
                        .LINE     1851
                        LDI       _ACCA, 0FFh
                        STS       EDL.FIRSTTURN, _ACCA
                        .LINE     1852
                        LDI       _ACCA, 0FEh
                        STS       EDL.SUBCH, _ACCA
                        .LINE     1853
                        .BRANCH   17,EDL.WRITECHPREFIX
                        CALL      EDL.WRITECHPREFIX
                        .LINE     1854
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.serout SHRB 1
                        LDI       _ACCA, SYSTEM.serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, EDL.Vers1Str AND 0FFh
                        LDI       _ACCCHI, EDL.Vers1Str SHRB 8
                        CALL      SYSTEM.StrConst2Str
                        ADIW      _FRAMEPTR, 2
                        .FRAME  0
                        .LINE     1855
                        .BRANCH   17,EDL.SERCRLF
                        CALL      EDL.SERCRLF
                        .LINE     1856
                        LDI       _ACCA, 0FFh
                        STS       EDL.CURRENTCH, _ACCA
                        .LINE     1857
                        LDI       _ACCA, 0000Ah SHRB 8
                        LDI       _ACCB, 0000Ah AND 0FFh
                        .FRAME  0
                        CALL      SYSTEM.MDELAY
                        .LINE     1858
                        .BRANCH   17,EDL.SETLEVELDAC_I
                        CALL      EDL.SETLEVELDAC_I
                        ADIW      _FRAMEPTR, 10
                        .LINE     1859
                        LDI       _ACCA, 00000h SHRB 8
                        LDI       _ACCB, 00000h AND 0FFh
                        STS       EDL.ERRCOUNT, _ACCB
                        STS       EDL.ERRCOUNT+1, _ACCA
                        .LINE     1860
                        LDI       _ACCB, 000C8h AND 0FFh
                        .FRAME  0
                        CALL      SYSTEM.MDELAY
                        .LINE     1861
                        .BRANCH   17,EDL.FAULTCHECK
                        RCALL     EDL.FAULTCHECK
                        ADIW      _FRAMEPTR, 4
                        .LINE     1862
                        LDI       _ACCA, 000h
                        STS       EDL.MODIFY, _ACCA
                        .LINE     1863
                        LDS       _ACCA, EDL.LCDpresent
                        TST       _ACCA
                        .BRANCH   3, EDL._L1381
                        BREQ      EDL._L1381
                        .BLOCK    1863
                        .LINE     1864
                        LDI       _ACCA, 000h
                        .FRAME  0
                        CALL       SYSTEM.LCDPORTINP_M
                        ORI       _ACCA, 0C7h
                        .BRANCH   20, _CSE0062
                        RJMP      _CSE0062
                        .ENDBLOCK 1865
EDL._L1381:
                        .BLOCK    1865
                        .LINE     1866
                        LDI       _ACCA, 0FFh
_CSE0062:                         
                        STS       EDL.BUTTONTEMP, _ACCA
                        .ENDBLOCK 1867
                        .LINE     1868
                        CPI       _ACCA, 0FFh
                        LDI       _ACCA, 0h
                        BREQ      EDL._L1384
                        SER       _ACCA
EDL._L1384:
                        MOV       _ACCB, _ACCA
                        LDI       _ACCCLO, EDL.EEfirstRun AND 0FFh
                        LDI       _ACCCHI, EDL.EEfirstRun SHRB 8
                        CALL      SYSTEM.ReadEEp8
                        OR        _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   4,EDL._L1387
                        BRNE      EDL._L1387
                        .BRANCH   20,EDL._L1385
                        RJMP      EDL._L1385
EDL._L1387:
                        .BLOCK    1868
                        .LINE     1869
                        LDS       _ACCA, EDL.LCDpresent
                        TST       _ACCA
                        .BRANCH   3, EDL._L1388
                        BREQ      EDL._L1388
                        .BLOCK    1869
                        .LINE     1870
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        ST        -Y, _ACCA
                        .FRAME  2
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  3
                        .FRAME  0
                        RCALL     SYSTEM.LCDXY_M
                        ADIW      _FRAMEPTR, 3
                        .LINE     1871
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, EDL.AdjustStr AND 0FFh
                        LDI       _ACCCHI, EDL.AdjustStr SHRB 8
                        CALL      SYSTEM.StrConst2Str
                        ADIW      _FRAMEPTR, 2
                        .FRAME  0
                        .ENDBLOCK 1872
EDL._L1388:
                        .LINE     1873
                        LDI       _ACCA, 000h
                        LDI       _ACCCLO, EDL.EEFIRSTRUN AND 0FFh
                        LDI       _ACCCHI, EDL.EEFIRSTRUN SHRB 8
                        CALL      SYSTEM.WriteEEp8
                        ADIW      _ACCCLO, 01h
                        .LINE     1874
                        LDI       _ACCCLO, EDL.ImaxArray AND 0FFh
                        LDI       _ACCCHI, EDL.ImaxArray SHRB 8
                        ADIW      _ACCCLO, 00008h
                        CALL      SYSTEM._ReadEEp32
                        ADIW      _ACCCLO, 01h
                        STS       EDL.DCAMP, _ACCB
                        STS       EDL.DCAMP+1, _ACCA
                        STS       EDL.DCAMP+2, _ACCALO
                        STS       EDL.DCAMP+3, _ACCAHI
                        .LINE     1875
                        .BRANCH   17,EDL.SETLEVELDAC_I
                        CALL      EDL.SETLEVELDAC_I
                        ADIW      _FRAMEPTR, 10
                        .LINE     1876
                        LDI       _ACCA, 00000h SHRB 8
                        LDI       _ACCB, 00000h AND 0FFh
                        STS       EDL.DACTEMPON, _ACCB
                        STS       EDL.DACTEMPON+1, _ACCA
                        .LINE     1877
                        STS       EDL.DACTEMPOFF, _ACCB
                        STS       EDL.DACTEMPOFF+1, _ACCA
EDL._L1392:
                        .BLOCK    1879
                        .LINE     1879
                        CBI       00035h, 005h
                        .LINE     1880
                        CBI       00032h, 002h
                        .LINE     1881
                        LDI       _ACCA, 005DCh SHRB 8
                        LDI       _ACCB, 005DCh AND 0FFh
                        .FRAME  0
                        CALL      SYSTEM.MDELAY
                        .LINE     1882
                        SBI       00035h, 005h
                        .LINE     1883
                        SBI       00032h, 002h
                        .LINE     1884
                        LDI       _ACCA, 005DCh SHRB 8
                        LDI       _ACCB, 005DCh AND 0FFh
                        .FRAME  0
                        CALL      SYSTEM.MDELAY
                        .ENDBLOCK 1885
                        .LINE     1885
                        .BRANCH   20,EDL._L1392
                        RJMP      EDL._L1392
                        .ENDBLOCK 1886
EDL._L1385:
                        .LINE     1887
                        .BRANCH   17,EDL.INITSCALES
                        CALL      EDL.INITSCALES
                        ADIW      _FRAMEPTR, 18
                        .LINE     1888
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 080h
                        LDI       _ACCAHI, 03Fh
                        STS       EDL.DCAMPMOD, _ACCB
                        STS       EDL.DCAMPMOD+1, _ACCA
                        STS       EDL.DCAMPMOD+2, _ACCALO
                        STS       EDL.DCAMPMOD+3, _ACCAHI
                        .LINE     1889
                        LDI       _ACCCLO, EDL.InitAmp AND 0FFh
                        LDI       _ACCCHI, EDL.InitAmp SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        STS       EDL.DCAMP, _ACCB
                        STS       EDL.DCAMP+1, _ACCA
                        STS       EDL.DCAMP+2, _ACCALO
                        STS       EDL.DCAMP+3, _ACCAHI
                        .LINE     1890
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 0C8h
                        LDI       _ACCAHI, 042h
                        STS       EDL.DCOHM, _ACCB
                        STS       EDL.DCOHM+1, _ACCA
                        STS       EDL.DCOHM+2, _ACCALO
                        STS       EDL.DCOHM+3, _ACCAHI
                        .LINE     1891
                        .BRANCH   17,EDL.CHECKLIMITS
                        CALL      EDL.CHECKLIMITS
                        .LINE     1892
                        .BRANCH   17,EDL.SETLEVELDAC_I
                        CALL      EDL.SETLEVELDAC_I
                        ADIW      _FRAMEPTR, 10
                        .LINE     1893
                        LDI       _ACCA, 028h
                        STS       EDL.IntegrateTimer, _ACCA
                        .LINE     1895
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
                        ADIW      _FRAMEPTR, 4
                        .LINE     1896
                        CALL      SYSTEM.TICKTIMERSTART
                        .LINE     1897
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 000h
                        STS       EDL.AH, _ACCB
                        STS       EDL.AH+1, _ACCA
                        STS       EDL.AH+2, _ACCALO
                        STS       EDL.AH+3, _ACCAHI
                        .LINE     1898
                        STS       EDL.WH, _ACCB
                        STS       EDL.WH+1, _ACCA
                        STS       EDL.WH+2, _ACCALO
                        STS       EDL.WH+3, _ACCAHI
                        .ENDBLOCK 1900
                        .LINE     1900
                        .BRANCH   19
                        RET
                        .ENDFUNC  1900



                        ; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                        ; Program body
                        ; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

                        .FUNC     $_Main, 00770h, 00020h
                        .ENTRYMAIN $
EDL.$_Main:

                        .BLOCK    1904
                        .LINE     1905
                        .BRANCH   17,EDL.INITALL
                        RCALL     EDL.INITALL
EDL._L1394:
                        .BLOCK    1907
                        .LINE     1908
                        .BRANCH   17,EDL.CHECKSER
                        RCALL     EDL.CHECKSER
                        ADIW      _FRAMEPTR, 1
                        .LINE     1911
                        LDS       _ACCA, EDL.modeselect
                        CPI       _ACCA, 006h
                        .BRANCH   3,EDL._L1396
                        BREQ      EDL._L1396
                        CPI       _ACCA, 005h
                        .BRANCH   3,EDL._L1396
                        BREQ      EDL._L1396
EDL._L1396:
                        .BRANCH   4, EDL._L1398
                        BRNE      EDL._L1398
                        .BLOCK    1911
                        .LINE     1912
                        .BRANCH   17,EDL.SETLEVELDAC_P
                        CALL      EDL.SETLEVELDAC_P
                        .ENDBLOCK 1913
EDL._L1398:
                        .LINE     1916
                        LDS       _ACCB, EDL.ActivityTimer
                        TST       _ACCB
                        .BRANCH   4, EDL._L1402
                        BRNE      EDL._L1402
                        .BLOCK    1916
                        .LINE     1917
                        SBI       00032h, 002h
                        .ENDBLOCK 1918
EDL._L1402:
                        .LINE     1919
                        LDS       _ACCA, EDL.LCDpresent
                        TST       _ACCA
                        .BRANCH   4,EDL._L1407
                        BRNE      EDL._L1407
                        .BRANCH   20,EDL._L1405
                        RJMP      EDL._L1405
EDL._L1407:
                        .BLOCK    1919
                        .LINE     1920
                        LDI       _ACCA, 0FFh
                        STS       EDL.VERBOSE, _ACCA
                        .LINE     1921
                        LDI       _ACCA, 000h
                        .FRAME  0
                        CALL       SYSTEM.GETINCRVAL4
                        STS       EDL.INCRVALUE, _ACCB
                        STS       EDL.INCRVALUE+1, _ACCA
                        STS       EDL.INCRVALUE+2, _ACCALO
                        STS       EDL.INCRVALUE+3, _ACCAHI
                        .LINE     1923
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, EDL.OldIncrValue
                        LDS       _ACCA, EDL.OldIncrValue+1
                        LDS       _ACCALO, EDL.OldIncrValue+2
                        LDS       _ACCAHI, EDL.OldIncrValue+3
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
                        BRNE      EDL._L1408
                        CP        _ACCALO, _ACCCLO
                        BRNE      EDL._L1408
                        CP        _ACCA, _ACCBHI
                        BRNE      EDL._L1408
                        CP        _ACCB, _ACCBLO
EDL._L1408:
                        .BRANCH   4, EDL._L1412
                        BRNE      EDL._L1412
                        .BRANCH   20,EDL._L1410
                        RJMP      EDL._L1410
EDL._L1412:
                        .BLOCK    1923
                        .LINE     1924
                        LDI       _ACCA, 000h
                        STS       EDL.FAULTTIMERBYTE, _ACCA
                        .LINE     1925
                        LDI       _ACCA, 0FAh
                        STS       EDL.ActivityTimer, _ACCA
                        .LINE     1926
                        CBI       00032h, 002h
                        .LINE     1927
                        LDS       _ACCBLO, EDL.IncrValue
                        LDS       _ACCBHI, EDL.IncrValue+1
                        LDS       _ACCCLO, EDL.IncrValue+2
                        LDS       _ACCCHI, EDL.IncrValue+3
                        LDS       _ACCB, EDL.OldIncrValue
                        LDS       _ACCA, EDL.OldIncrValue+1
                        LDS       _ACCALO, EDL.OldIncrValue+2
                        LDS       _ACCAHI, EDL.OldIncrValue+3
                        SUBI      _ACCB, 01h
                        SBCI      _ACCA, 00h
                        SBCI      _ACCALO, 00h
                        SBCI      _ACCAHI, 00h
                        COM       _ACCALO
                        COM       _ACCAHI
                        COM       _ACCA
                        COM       _ACCB
                        ADD       _ACCB, _ACCBLO
                        ADC       _ACCA, _ACCBHI
                        ADC       _ACCALO, _ACCCLO
                        ADC       _ACCAHI, _ACCCHI
                        LDS       _ACCAHI, EDL.IncrDiff+1
                        LDS       _ACCALO, EDL.IncrDiff
                        ADD       _ACCB, _ACCALO
                        ADC       _ACCA, _ACCAHI
                        STS       EDL.INCRDIFF, _ACCB
                        STS       EDL.INCRDIFF+1, _ACCA
                        .LINE     1928
                        LDS       _ACCB, EDL.IncrValue
                        LDS       _ACCA, EDL.IncrValue+1
                        LDS       _ACCALO, EDL.IncrValue+2
                        LDS       _ACCAHI, EDL.IncrValue+3
                        STS       EDL.OLDINCRVALUE, _ACCB
                        STS       EDL.OLDINCRVALUE+1, _ACCA
                        STS       EDL.OLDINCRVALUE+2, _ACCALO
                        STS       EDL.OLDINCRVALUE+3, _ACCAHI
                        .LINE     1929
                        LDI       _ACCA, 0C8h
                        STS       EDL.IncrTimer, _ACCA
                        .LINE     1930
                        LDS       _ACCB, EDL.IncrDiff
                        LDS       _ACCA, EDL.IncrDiff+1
                        TST       _ACCA
                        BRPL      EDL._L1413
                        NEG       _ACCB
                        BRNE      EDL._L1414
                        DEC       _ACCA
EDL._L1414:
                        COM       _ACCA
EDL._L1413:
                        LDS       _ACCALO, EDL.IncRast
                        LDS       _ACCAHI, EDL.IncRast+1
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        EOR       _ACCAHI, _ACCBLO
                        CP        _ACCA, _ACCAHI
                        BRNE      EDL._L1415
                        CP        _ACCB, _ACCALO
EDL._L1415:
                        .BRANCH   2, EDL._L1419
                        BRSH      EDL._L1419
                        .BRANCH   20,EDL._L1417
                        RJMP      EDL._L1417
EDL._L1419:
                        .BLOCK    1931
                        .LINE     1931
                        LDI       _ACCA, 0FFh
                        STS       EDL.CHANGEDFLAG, _ACCA
                        .LINE     1932
                        LDS       _ACCA, 003E4h
                        SBR       _ACCA, 080h
                        STS       003E4h, _ACCA
                        .LINE     1933
                        LDS       _ACCBLO, EDL.IncrDiff
                        LDS       _ACCBHI, EDL.IncrDiff+1
                        LDS       _ACCB, EDL.IncRast
                        LDS       _ACCA, EDL.IncRast+1
                        SET
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.DIV16
                        STS       EDL.INCRDIFF, _ACCB
                        STS       EDL.INCRDIFF+1, _ACCA
                        .LINE     1935
                        TST       _ACCA
                        BREQ      EDL._L1420
                        BRPL      EDL._L1421
                        SER       _ACCB
                        SER       _ACCA
                        RJMP      EDL._L1422
EDL._L1420:
                        TST       _ACCB
                        BREQ      EDL._L1422
EDL._L1421:
                        CLR       _ACCA
                        LDI       _ACCB, 1
EDL._L1422:
                        STS       EDL.INCRACCINT10, _ACCB
                        STS       EDL.INCRACCINT10+1, _ACCA
                        .LINE     1936
                        LDS       _ACCA, EDL.IncrDiff
                        STS       EDL.INCRDIFFBYTE, _ACCA
                        .LINE     1937
                        LDS       _ACCA, EDL.IncrAccInt10+1
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDI       _ACCCLO, EDL.IncrAccArray AND 0FFh
                        LDI       _ACCCHI, EDL.IncrAccArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCB, EDL.IncrDiff
                        LDS       _ACCA, EDL.IncrDiff+1
                        TST       _ACCA
                        BRPL      EDL._L1423
                        NEG       _ACCB
                        BRNE      EDL._L1424
                        DEC       _ACCA
EDL._L1424:
                        COM       _ACCA
EDL._L1423:
                        MOV       _ACCB, _ACCB
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
                        STS       EDL.INCRDIFF, _ACCB
                        STS       EDL.INCRDIFF+1, _ACCA
                        .LINE     1943
                        LDI       _ACCBLO, 0000Ah AND 0FFh
                        LDI       _ACCBHI, 0000Ah SHRB 8
                        SET
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.MUL16
                        STS       EDL.INCRACCINT10, _ACCB
                        STS       EDL.INCRACCINT10+1, _ACCA
                        .LINE     1944
                        LDS       _ACCB, EDL.IncrDiff
                        LDS       _ACCA, EDL.IncrDiff+1
                        SBRS      _ACCA, 7
                        RJMP      EDL._L1425
                        LDI       _ACCAHI, 0FFh
                        LDI       _ACCALO, 0FFh
                        RJMP      EDL._L1426
EDL._L1425:
                        CLR       _ACCAHI
                        CLR       _ACCALO
EDL._L1426:
                        SET
                        BLD       Flags, _SIGN
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.LIntToFloat
                        STS       EDL.INCRACCFLOAT, _ACCB
                        STS       EDL.INCRACCFLOAT+1, _ACCA
                        STS       EDL.INCRACCFLOAT+2, _ACCALO
                        STS       EDL.INCRACCFLOAT+3, _ACCAHI
                        .LINE     1945
                        LDI       _ACCA, 005DCh SHRB 8
                        LDI       _ACCB, 005DCh AND 0FFh
                        LDI       _ACCCLO, EDL.DisplayTimer AND 0FFh
                        LDI       _ACCCHI, EDL.DisplayTimer SHRB 8
                        LDI       _ACCBHI, 001h
                        CALL      SYSTEM.SetSysTimer
                        .LINE     1946
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 080h
                        LDI       _ACCAHI, 03Fh
                        STS       EDL.DCAMPMOD, _ACCB
                        STS       EDL.DCAMPMOD+1, _ACCA
                        STS       EDL.DCAMPMOD+2, _ACCALO
                        STS       EDL.DCAMPMOD+3, _ACCAHI
                        .LINE     1947
                        LDI       _ACCA, 004h
                        STS       EDL.SHUNTRANGE, _ACCA
                        .LINE     1948
                        LDS       _ACCA, EDL.Modify
                        .LINE     1950
                        CPI       _ACCA, 0
                        .BRANCH   3,EDL._L1430
                        BREQ      EDL._L1430
                        .BRANCH   20,EDL._L1429
                        RJMP      EDL._L1429
EDL._L1430:
                        .BLOCK    1951
                        .LINE     1951
                        LDS       _ACCA, EDL.ModeSelect
                        .LINE     1952
                        CPI       _ACCA, 4
                        .BRANCH   3,EDL._L1432
                        BREQ      EDL._L1432
                        CPI       _ACCA, 3
                        .BRANCH   3,EDL._L1436
                        BREQ      EDL._L1436
                        .BRANCH   20,EDL._L1435
                        RJMP      EDL._L1435
EDL._L1436:
EDL._L1432:
                        .BLOCK    1953
                        .LINE     1953
                        LDS       _ACCB, EDL.DCohm
                        LDS       _ACCA, EDL.DCohm+1
                        LDS       _ACCALO, EDL.DCohm+2
                        LDS       _ACCAHI, EDL.DCohm+3
                        STS       EDL.PARAM, _ACCB
                        STS       EDL.PARAM+1, _ACCA
                        STS       EDL.PARAM+2, _ACCALO
                        STS       EDL.PARAM+3, _ACCAHI
                        .LINE     1954
                        LDS       _ACCA, EDL.FirstTurn
                        TST       _ACCA
                        .BRANCH   3, EDL._L1437
                        BREQ      EDL._L1437
                        .BLOCK    1954
                        .LINE     1955
                        .BRANCH   17,EDL.INCFACR
                        CALL      EDL.INCFACR
                        .LINE     1956
                        .BRANCH   17,EDL.ROUNDINCPARAM
                        CALL      EDL.ROUNDINCPARAM
                        .LINE     1957
                        LDI       _ACCA, 004h
                        STS       EDL.BUTTONNUMBER, _ACCA
                        .LINE     1958
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.SERPROMPT
                        CALL      EDL.SERPROMPT
                        ADIW      _FRAMEPTR, 3
                        .ENDBLOCK 1959
EDL._L1437:
                        .LINE     1960
                        .BRANCH   17,EDL.SETACCPARAM
                        CALL      EDL.SETACCPARAM
                        .LINE     1961
                        LDS       _ACCB, EDL.Param
                        LDS       _ACCA, EDL.Param+1
                        LDS       _ACCALO, EDL.Param+2
                        LDS       _ACCAHI, EDL.Param+3
                        STS       EDL.DCOHM, _ACCB
                        STS       EDL.DCOHM+1, _ACCA
                        STS       EDL.DCOHM+2, _ACCALO
                        STS       EDL.DCOHM+3, _ACCAHI
                        .LINE     1962
                        .BRANCH   17,EDL.CHECKLIMITS
                        CALL      EDL.CHECKLIMITS
                        .LINE     1963
                        .BRANCH   17,EDL.SETLEVELDAC_R
                        CALL      EDL.SETLEVELDAC_R
                        ADIW      _FRAMEPTR, 10
                        .LINE     1964
                        LDI       _ACCA, 005h
                        STS       EDL.SUBCH, _ACCA
                        .LINE     1965
                        .BRANCH   17,EDL.PARSEGETPARAM
                        CALL      EDL.PARSEGETPARAM
                        .LINE     1966
                        LDI       _ACCB, 00Ah
                        LDI       _ACCA, 0D7h
                        LDI       _ACCALO, 0A3h
                        LDI       _ACCAHI, 03Ch
                        STS       EDL.DCAMP, _ACCB
                        STS       EDL.DCAMP+1, _ACCA
                        STS       EDL.DCAMP+2, _ACCALO
                        STS       EDL.DCAMP+3, _ACCAHI
                        .ENDBLOCK 1967
                        RJMP      EDL._L1427
EDL._L1435:
                        .LINE     1968
                        CPI       _ACCA, 2
                        .BRANCH   3,EDL._L1440
                        BREQ      EDL._L1440
                        CPI       _ACCA, 1
                        .BRANCH   3,EDL._L1444
                        BREQ      EDL._L1444
                        .BRANCH   20,EDL._L1443
                        RJMP      EDL._L1443
EDL._L1444:
EDL._L1440:
                        .BLOCK    1969
                        .LINE     1969
                        LDS       _ACCB, EDL.DCamp
                        LDS       _ACCA, EDL.DCamp+1
                        LDS       _ACCALO, EDL.DCamp+2
                        LDS       _ACCAHI, EDL.DCamp+3
                        STS       EDL.PARAM, _ACCB
                        STS       EDL.PARAM+1, _ACCA
                        STS       EDL.PARAM+2, _ACCALO
                        STS       EDL.PARAM+3, _ACCAHI
                        .LINE     1970
                        LDS       _ACCA, EDL.FirstTurn
                        TST       _ACCA
                        .BRANCH   3, EDL._L1445
                        BREQ      EDL._L1445
                        .BLOCK    1970
                        .LINE     1971
                        .BRANCH   17,EDL.INCFACI
                        CALL      EDL.INCFACI
                        .LINE     1972
                        .BRANCH   17,EDL.ROUNDINCPARAM
                        CALL      EDL.ROUNDINCPARAM
                        .LINE     1973
                        LDI       _ACCA, 004h
                        STS       EDL.BUTTONNUMBER, _ACCA
                        .LINE     1974
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.SERPROMPT
                        CALL      EDL.SERPROMPT
                        ADIW      _FRAMEPTR, 3
                        .ENDBLOCK 1975
EDL._L1445:
                        .LINE     1976
                        .BRANCH   17,EDL.SETACCPARAM
                        CALL      EDL.SETACCPARAM
                        .LINE     1977
                        LDS       _ACCB, EDL.Param
                        LDS       _ACCA, EDL.Param+1
                        LDS       _ACCALO, EDL.Param+2
                        LDS       _ACCAHI, EDL.Param+3
                        STS       EDL.DCAMP, _ACCB
                        STS       EDL.DCAMP+1, _ACCA
                        STS       EDL.DCAMP+2, _ACCALO
                        STS       EDL.DCAMP+3, _ACCAHI
                        .LINE     1978
                        .BRANCH   17,EDL.CHECKLIMITS
                        CALL      EDL.CHECKLIMITS
                        .LINE     1979
                        .BRANCH   17,EDL.SETLEVELDAC_I
                        CALL      EDL.SETLEVELDAC_I
                        ADIW      _FRAMEPTR, 10
                        .LINE     1980
                        LDI       _ACCA, 001h
                        .BRANCH   20, _CSE0063
                        RJMP      _CSE0063
                        .ENDBLOCK 1983
EDL._L1443:
                        .LINE     1984
                        CPI       _ACCA, 6
                        .BRANCH   3,EDL._L1448
                        BREQ      EDL._L1448
                        CPI       _ACCA, 5
                        .BRANCH   3,EDL._L1452
                        BREQ      EDL._L1452
                        RJMP      EDL._L1427
EDL._L1452:
EDL._L1448:
                        .BLOCK    1985
                        .LINE     1985
                        LDS       _ACCB, EDL.DCWatt
                        LDS       _ACCA, EDL.DCWatt+1
                        LDS       _ACCALO, EDL.DCWatt+2
                        LDS       _ACCAHI, EDL.DCWatt+3
                        STS       EDL.PARAM, _ACCB
                        STS       EDL.PARAM+1, _ACCA
                        STS       EDL.PARAM+2, _ACCALO
                        STS       EDL.PARAM+3, _ACCAHI
                        .LINE     1986
                        LDS       _ACCA, EDL.FirstTurn
                        TST       _ACCA
                        .BRANCH   3, EDL._L1453
                        BREQ      EDL._L1453
                        .BLOCK    1986
                        .LINE     1987
                        .BRANCH   17,EDL.INCFACP
                        CALL      EDL.INCFACP
                        .LINE     1988
                        .BRANCH   17,EDL.ROUNDINCPARAM
                        CALL      EDL.ROUNDINCPARAM
                        .LINE     1989
                        LDI       _ACCA, 004h
                        STS       EDL.BUTTONNUMBER, _ACCA
                        .LINE     1990
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.SERPROMPT
                        CALL      EDL.SERPROMPT
                        ADIW      _FRAMEPTR, 3
                        .ENDBLOCK 1991
EDL._L1453:
                        .LINE     1992
                        .BRANCH   17,EDL.SETACCPARAM
                        CALL      EDL.SETACCPARAM
                        .LINE     1993
                        LDS       _ACCB, EDL.Param
                        LDS       _ACCA, EDL.Param+1
                        LDS       _ACCALO, EDL.Param+2
                        LDS       _ACCAHI, EDL.Param+3
                        STS       EDL.DCWATT, _ACCB
                        STS       EDL.DCWATT+1, _ACCA
                        STS       EDL.DCWATT+2, _ACCALO
                        STS       EDL.DCWATT+3, _ACCAHI
                        .LINE     1994
                        .BRANCH   17,EDL.CHECKLIMITS
                        CALL      EDL.CHECKLIMITS
                        .LINE     1995
                        .BRANCH   17,EDL.SETLEVELDAC_P
                        CALL      EDL.SETLEVELDAC_P
                        .LINE     1996
                        LDI       _ACCA, 003h
_CSE0063:                         
                        STS       EDL.SUBCH, _ACCA
                        .LINE     1981
                        .LINE     1997
                        .BRANCH   17,EDL.PARSEGETPARAM
                        CALL      EDL.PARSEGETPARAM
                        .LINE     1982
                        .LINE     1998
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 0C8h
                        LDI       _ACCAHI, 042h
                        STS       EDL.DCOHM, _ACCB
                        STS       EDL.DCOHM+1, _ACCA
                        STS       EDL.DCOHM+2, _ACCALO
                        STS       EDL.DCOHM+3, _ACCAHI
                        .ENDBLOCK 1999
                        .ENDBLOCK 2001
                        .BRANCH   20,EDL._L1427
                        RJMP      EDL._L1427
EDL._L1429:
                        .LINE     2002
                        CPI       _ACCA, 1
                        .BRANCH   3,EDL._L1458
                        BREQ      EDL._L1458
                        .BRANCH   20,EDL._L1457
                        RJMP      EDL._L1457
EDL._L1458:
                        .BLOCK    2003
                        .LINE     2003
                        LDS       _ACCA, 003E5h
                        CBR       _ACCA, 010h
                        STS       003E5h, _ACCA
                        .LINE     2004
                        LDI       _ACCA, 0FFh
                        STS       EDL.OUTPUTENABLE, _ACCA
                        .LINE     2005
                        LDS       _ACCB, EDL.DCVolt
                        LDS       _ACCA, EDL.DCVolt+1
                        LDS       _ACCALO, EDL.DCVolt+2
                        LDS       _ACCAHI, EDL.DCVolt+3
                        STS       EDL.PARAM, _ACCB
                        STS       EDL.PARAM+1, _ACCA
                        STS       EDL.PARAM+2, _ACCALO
                        STS       EDL.PARAM+3, _ACCAHI
                        .LINE     2006
                        LDS       _ACCA, EDL.FirstTurn
                        TST       _ACCA
                        .BRANCH   3, EDL._L1459
                        BREQ      EDL._L1459
                        .BLOCK    2006
                        .LINE     2007
                        .BRANCH   17,EDL.INCFACV
                        CALL      EDL.INCFACV
                        .LINE     2008
                        .BRANCH   17,EDL.ROUNDINCPARAM
                        CALL      EDL.ROUNDINCPARAM
                        .LINE     2009
                        LDI       _ACCA, 004h
                        STS       EDL.BUTTONNUMBER, _ACCA
                        .LINE     2010
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.SERPROMPT
                        CALL      EDL.SERPROMPT
                        ADIW      _FRAMEPTR, 3
                        .ENDBLOCK 2011
EDL._L1459:
                        .LINE     2012
                        .BRANCH   17,EDL.SETACCPARAM
                        CALL      EDL.SETACCPARAM
                        .LINE     2013
                        LDS       _ACCB, EDL.Param
                        LDS       _ACCA, EDL.Param+1
                        LDS       _ACCALO, EDL.Param+2
                        LDS       _ACCAHI, EDL.Param+3
                        STS       EDL.DCVOLT, _ACCB
                        STS       EDL.DCVOLT+1, _ACCA
                        STS       EDL.DCVOLT+2, _ACCALO
                        STS       EDL.DCVOLT+3, _ACCAHI
                        .LINE     2014
                        .BRANCH   17,EDL.CHECKLIMITS
                        CALL      EDL.CHECKLIMITS
                        .LINE     2015
                        LDI       _ACCA, 004h
                        .BRANCH   20, _CSE0064
                        RJMP      _CSE0064
                        .ENDBLOCK 2017
EDL._L1457:
                        .LINE     2019
                        CPI       _ACCA, 2
                        .BRANCH   3,EDL._L1464
                        BREQ      EDL._L1464
                        .BRANCH   20,EDL._L1463
                        RJMP      EDL._L1463
EDL._L1464:
                        .BLOCK    2020
                        .LINE     2020
                        LDS       _ACCB, EDL.ModeSelect
                        LDS       _ACCA, EDL.IncrDiffByte
                        ADD       _ACCA, _ACCB
                        STS       EDL.MODESELECT, _ACCA
                        .LINE     2021
                        .BRANCH   17,EDL.CHECKLIMITS
                        CALL      EDL.CHECKLIMITS
                        .LINE     2022
                        .BRANCH   17,EDL.INITSCALES
                        CALL      EDL.INITSCALES
                        ADIW      _FRAMEPTR, 18
                        .LINE     2023
                        LDS       _ACCA, EDL.FirstTurn
                        TST       _ACCA
                        .BRANCH   3, EDL._L1465
                        BREQ      EDL._L1465
                        .BLOCK    2023
                        .LINE     2024
                        LDI       _ACCA, 004h
                        STS       EDL.BUTTONNUMBER, _ACCA
                        .LINE     2025
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.SERPROMPT
                        CALL      EDL.SERPROMPT
                        ADIW      _FRAMEPTR, 3
                        .ENDBLOCK 2026
EDL._L1465:
                        .LINE     2027
                        LDS       _ACCA, EDL.ModeSelect
                        .LINE     2028
                        CPI       _ACCA, 0
                        .BRANCH   4, EDL._L1470
                        BRNE      EDL._L1470
                        .BLOCK    2030
                        .LINE     2030
                        LDI       _ACCA, 000h
                        STS       EDL.RMODEON, _ACCA
                        .LINE     2031
                        STS       EDL.IMODEON, _ACCA
                        .LINE     2032
                        STS       EDL.PMODEON, _ACCA
                        .LINE     2034
                        .BRANCH   20, _CSE0066
                        RJMP      _CSE0066
                        .ENDBLOCK 2036
EDL._L1470:
                        .LINE     2037
                        CPI       _ACCA, 1
                        .BRANCH   3,EDL._L1472
                        BREQ      EDL._L1472
                        CPI       _ACCA, 2
                        .BRANCH   4, EDL._L1475
                        BRNE      EDL._L1475
EDL._L1472:
                        .BLOCK    2039
                        .LINE     2039
                        LDI       _ACCA, 000h
                        STS       EDL.RMODEON, _ACCA
                        .LINE     2040
                        LDI       _ACCA, 0FFh
                        STS       EDL.IMODEON, _ACCA
                        .LINE     2041
                        LDI       _ACCA, 000h
                        STS       EDL.PMODEON, _ACCA
                        .LINE     2043
                        LDI       _ACCA, 0FFh
_CSE0066:                         
                        STS       EDL.OUTPUTENABLE, _ACCA
                        .LINE     2035
                        .LINE     2044
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,EDL.SETLEVELDAC_I
                        CALL      EDL.SETLEVELDAC_I
_CSE0065:                         
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 2045
                        .BRANCH   20,EDL._L1468
                        RJMP      EDL._L1468
EDL._L1475:
                        .LINE     2046
                        CPI       _ACCA, 3
                        .BRANCH   3,EDL._L1477
                        BREQ      EDL._L1477
                        CPI       _ACCA, 4
                        .BRANCH   4, EDL._L1480
                        BRNE      EDL._L1480
EDL._L1477:
                        .BLOCK    2048
                        .LINE     2048
                        LDI       _ACCA, 0FFh
                        STS       EDL.RMODEON, _ACCA
                        .LINE     2049
                        LDI       _ACCA, 000h
                        STS       EDL.IMODEON, _ACCA
                        .LINE     2050
                        STS       EDL.PMODEON, _ACCA
                        .LINE     2052
                        LDI       _ACCA, 0FFh
                        STS       EDL.OUTPUTENABLE, _ACCA
                        .LINE     2053
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,EDL.SETLEVELDAC_R
                        CALL      EDL.SETLEVELDAC_R
                        .BRANCH   20, _CSE0065
                        RJMP      _CSE0065
                        .ENDBLOCK 2054
EDL._L1480:
                        .LINE     2056
                        CPI       _ACCA, 5
                        .BRANCH   3,EDL._L1482
                        BREQ      EDL._L1482
                        CPI       _ACCA, 6
                        .BRANCH   4, EDL._L1485
                        BRNE      EDL._L1485
EDL._L1482:
                        .BLOCK    2057
                        .LINE     2057
                        LDI       _ACCA, 0FFh
                        STS       EDL.PMODEON, _ACCA
                        .LINE     2058
                        LDI       _ACCA, 000h
                        STS       EDL.IMODEON, _ACCA
                        .LINE     2059
                        STS       EDL.RMODEON, _ACCA
                        .LINE     2060
                        LDI       _ACCA, 0FFh
                        STS       EDL.OUTPUTENABLE, _ACCA
                        .LINE     2061
                        .BRANCH   17,EDL.SETLEVELDAC_P
                        CALL      EDL.SETLEVELDAC_P
                        .ENDBLOCK 2062
EDL._L1485:
EDL._L1468:
                        .LINE     2065
                        LDI       _ACCA, 013h
                        .BRANCH   20, _CSE0064
                        RJMP      _CSE0064
                        .ENDBLOCK 2067
EDL._L1463:
                        .LINE     2068
                        CPI       _ACCA, 3
                        .BRANCH   3,EDL._L1489
                        BREQ      EDL._L1489
                        .BRANCH   20,EDL._L1488
                        RJMP      EDL._L1488
EDL._L1489:
                        .BLOCK    2069
                        .LINE     2069
                        LDS       _ACCA, EDL.FirstTurn
                        TST       _ACCA
                        .BRANCH   3, EDL._L1490
                        BREQ      EDL._L1490
                        .BLOCK    2069
                        .LINE     2070
                        LDI       _ACCA, 004h
                        STS       EDL.BUTTONNUMBER, _ACCA
                        .LINE     2071
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.SERPROMPT
                        CALL      EDL.SERPROMPT
                        ADIW      _FRAMEPTR, 3
                        .LINE     2072
                        LDI       _ACCA, 000h
                        STS       EDL.FIRSTTURN, _ACCA
                        .ENDBLOCK 2073
EDL._L1490:
                        .LINE     2074
                        LDS       _ACCB, EDL.PWonTime
                        LDS       _ACCA, EDL.PWonTime+1
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        CPI       _ACCA, 080h
                        BRNE      EDL._L1493
                        CPI       _ACCB, 064h
EDL._L1493:
                        .BRANCH   1, EDL._L1495
                        BRLO      EDL._L1495
                        .BLOCK    2074
                        .LINE     2075
                        LDS       _ACCA, EDL.FirstTurn
                        TST       _ACCA
                        .BRANCH   3, EDL._L1498
                        BREQ      EDL._L1498
                        .BLOCK    2075
                        .LINE     2076
                        LDS       _ACCBLO, EDL.PWonTime
                        LDS       _ACCBHI, EDL.PWonTime+1
                        LDI       _ACCALO, 0000Ah AND 0FFh
                        LDI       _ACCAHI, 0000Ah SHRB 8
                        SET
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.DIV16_R
                        STS       EDL.PWONTIME, _ACCB
                        STS       EDL.PWONTIME+1, _ACCA
                        .LINE     2077
                        LDI       _ACCBLO, 0000Ah AND 0FFh
                        LDI       _ACCBHI, 0000Ah SHRB 8
                        SET
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.MUL16
                        STS       EDL.PWONTIME, _ACCB
                        STS       EDL.PWONTIME+1, _ACCA
                        .LINE     2078
                        LDI       _ACCA, 000h
                        STS       EDL.FIRSTTURN, _ACCA
                        .ENDBLOCK 2079
EDL._L1498:
                        .LINE     2080
                        LDS       _ACCB, EDL.PWonTime
                        LDS       _ACCA, EDL.PWonTime+1
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDS       _ACCB, EDL.IncrAccInt10
                        LDS       _ACCA, EDL.IncrAccInt10+1
                        .BRANCH   20, _CSE0067
                        RJMP      _CSE0067
                        .ENDBLOCK 2081
EDL._L1495:
                        .BLOCK    2081
                        .LINE     2082
                        LDS       _ACCB, EDL.PWonTime
                        LDS       _ACCA, EDL.PWonTime+1
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDS       _ACCB, EDL.IncrDiff
                        LDS       _ACCA, EDL.IncrDiff+1
_CSE0067:                         
                        POP       _ACCAHI
                        POP       _ACCALO
                        ADD       _ACCB, _ACCALO
                        ADC       _ACCA, _ACCAHI
                        STS       EDL.PWONTIME, _ACCB
                        STS       EDL.PWONTIME+1, _ACCA
                        .ENDBLOCK 2083
                        .LINE     2084
                        .BRANCH   17,EDL.CHECKLIMITS
                        CALL      EDL.CHECKLIMITS
                        .LINE     2085
                        LDI       _ACCA, 01Bh
                        .BRANCH   20, _CSE0064
                        RJMP      _CSE0064
                        .ENDBLOCK 2087
EDL._L1488:
                        .LINE     2088
                        CPI       _ACCA, 4
                        .BRANCH   3,EDL._L1503
                        BREQ      EDL._L1503
                        .BRANCH   20,EDL._L1502
                        RJMP      EDL._L1502
EDL._L1503:
                        .BLOCK    2089
                        .LINE     2089
                        LDS       _ACCA, EDL.FirstTurn
                        TST       _ACCA
                        .BRANCH   3, EDL._L1504
                        BREQ      EDL._L1504
                        .BLOCK    2089
                        .LINE     2090
                        LDI       _ACCA, 004h
                        STS       EDL.BUTTONNUMBER, _ACCA
                        .LINE     2091
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.SERPROMPT
                        CALL      EDL.SERPROMPT
                        ADIW      _FRAMEPTR, 3
                        .LINE     2092
                        LDI       _ACCA, 000h
                        STS       EDL.FIRSTTURN, _ACCA
                        .ENDBLOCK 2093
EDL._L1504:
                        .LINE     2094
                        LDS       _ACCB, EDL.PWoffTime
                        LDS       _ACCA, EDL.PWoffTime+1
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        CPI       _ACCA, 080h
                        BRNE      EDL._L1507
                        CPI       _ACCB, 064h
EDL._L1507:
                        .BRANCH   1, EDL._L1509
                        BRLO      EDL._L1509
                        .BLOCK    2094
                        .LINE     2095
                        LDS       _ACCA, EDL.FirstTurn
                        TST       _ACCA
                        .BRANCH   3, EDL._L1512
                        BREQ      EDL._L1512
                        .BLOCK    2095
                        .LINE     2096
                        LDS       _ACCBLO, EDL.PWoffTime
                        LDS       _ACCBHI, EDL.PWoffTime+1
                        LDI       _ACCALO, 0000Ah AND 0FFh
                        LDI       _ACCAHI, 0000Ah SHRB 8
                        SET
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.DIV16_R
                        STS       EDL.PWOFFTIME, _ACCB
                        STS       EDL.PWOFFTIME+1, _ACCA
                        .LINE     2097
                        LDI       _ACCBLO, 0000Ah AND 0FFh
                        LDI       _ACCBHI, 0000Ah SHRB 8
                        SET
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.MUL16
                        STS       EDL.PWOFFTIME, _ACCB
                        STS       EDL.PWOFFTIME+1, _ACCA
                        .LINE     2098
                        LDI       _ACCA, 000h
                        STS       EDL.FIRSTTURN, _ACCA
                        .ENDBLOCK 2099
EDL._L1512:
                        .LINE     2100
                        LDS       _ACCB, EDL.PWoffTime
                        LDS       _ACCA, EDL.PWoffTime+1
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDS       _ACCB, EDL.IncrAccInt10
                        LDS       _ACCA, EDL.IncrAccInt10+1
                        .BRANCH   20, _CSE0068
                        RJMP      _CSE0068
                        .ENDBLOCK 2101
EDL._L1509:
                        .BLOCK    2101
                        .LINE     2102
                        LDS       _ACCB, EDL.PWoffTime
                        LDS       _ACCA, EDL.PWoffTime+1
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDS       _ACCB, EDL.IncrDiff
                        LDS       _ACCA, EDL.IncrDiff+1
_CSE0068:                         
                        POP       _ACCAHI
                        POP       _ACCALO
                        ADD       _ACCB, _ACCALO
                        ADC       _ACCA, _ACCAHI
                        STS       EDL.PWOFFTIME, _ACCB
                        STS       EDL.PWOFFTIME+1, _ACCA
                        .ENDBLOCK 2103
                        .LINE     2104
                        .BRANCH   17,EDL.CHECKLIMITS
                        CALL      EDL.CHECKLIMITS
                        .LINE     2105
                        LDI       _ACCA, 01Ch
                        .BRANCH   20, _CSE0064
                        RJMP      _CSE0064
                        .ENDBLOCK 2107
EDL._L1502:
                        .LINE     2108
                        CPI       _ACCA, 5
                        .BRANCH   4, EDL._L1516
                        BRNE      EDL._L1516
                        .BLOCK    2109
                        .LINE     2109
                        LDS       _ACCA, EDL.FirstTurn
                        TST       _ACCA
                        .BRANCH   3, EDL._L1518
                        BREQ      EDL._L1518
                        .BLOCK    2109
                        .LINE     2110
                        LDI       _ACCA, 004h
                        STS       EDL.BUTTONNUMBER, _ACCA
                        .LINE     2111
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.SERPROMPT
                        CALL      EDL.SERPROMPT
                        ADIW      _FRAMEPTR, 3
                        .LINE     2112
                        LDI       _ACCA, 000h
                        STS       EDL.FIRSTTURN, _ACCA
                        .ENDBLOCK 2113
EDL._L1518:
                        .LINE     2114
                        LDS       _ACCALO, EDL.Ipercent
                        LDS       _ACCAHI, EDL.Ipercent+1
                        LDS       _ACCB, EDL.IncrDiff
                        LDS       _ACCA, EDL.IncrDiff+1
                        ADD       _ACCB, _ACCALO
                        ADC       _ACCA, _ACCAHI
                        STS       EDL.IPERCENT, _ACCB
                        STS       EDL.IPERCENT+1, _ACCA
                        .LINE     2115
                        .BRANCH   17,EDL.CHECKLIMITS
                        CALL      EDL.CHECKLIMITS
                        .LINE     2116
                        LDS       _ACCA, EDL.ModeSelect
                        CPI       _ACCA, 001h
                        .BRANCH   3,EDL._L1521
                        BREQ      EDL._L1521
                        CPI       _ACCA, 002h
                        .BRANCH   3,EDL._L1521
                        BREQ      EDL._L1521
EDL._L1521:
                        .BRANCH   4, EDL._L1523
                        BRNE      EDL._L1523
                        .BLOCK    2116
                        .LINE     2117
                        .BRANCH   17,EDL.SETLEVELDAC_I
                        CALL      EDL.SETLEVELDAC_I
                        ADIW      _FRAMEPTR, 10
                        .ENDBLOCK 2118
EDL._L1523:
                        .LINE     2119
                        LDI       _ACCA, 01Dh
_CSE0064:                         
                        STS       EDL.SUBCH, _ACCA
                        .LINE     2066
                        .LINE     2086
                        .LINE     2106
                        .LINE     2016
                        .LINE     2120
                        .BRANCH   17,EDL.PARSEGETPARAM
                        CALL      EDL.PARSEGETPARAM
                        .ENDBLOCK 2121
EDL._L1516:
EDL._L1427:
                        .LINE     2123
                        LDI       _ACCA, 000h
                        STS       EDL.TOGGLETIMER, _ACCA
                        .LINE     2124
                        .BRANCH   17,EDL.WERTEONLCD
                        CALL      EDL.WERTEONLCD
                        .LINE     2125
                        LDI       _ACCA, 00000h SHRB 8
                        LDI       _ACCB, 00000h AND 0FFh
                        STS       EDL.INCRDIFF, _ACCB
                        STS       EDL.INCRDIFF+1, _ACCA
                        .ENDBLOCK 2126
EDL._L1417:
                        .ENDBLOCK 2127
EDL._L1410:
                        .LINE     2128
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.CHECKDELAY
                        RCALL     EDL.CHECKDELAY
                        ADIW      _FRAMEPTR, 2
                        .LINE     2129
                        LDI       _ACCA, 000h
                        .FRAME  0
                        RCALL     SYSTEM.LCDPORTINP_M
                        ORI       _ACCA, 0C7h
                        STS       EDL.BUTTONTEMP, _ACCA
                        .LINE     2130
                        CPI       _ACCA, 0FFh
                        .BRANCH   4, EDL._L1529
                        BRNE      EDL._L1529
                        .BRANCH   20,EDL._L1527
                        RJMP      EDL._L1527
EDL._L1529:
                        .BLOCK    2130
                        .LINE     2131
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.CHECKDELAY
                        RCALL     EDL.CHECKDELAY
                        ADIW      _FRAMEPTR, 2
                        .LINE     2132
                        LDI       _ACCA, 000h
                        .FRAME  0
                        RCALL     SYSTEM.LCDPORTINP_M
                        ORI       _ACCA, 0C7h
                        STS       EDL.BUTTONTEMP, _ACCA
                        .LINE     2133
                        CPI       _ACCA, 0FFh
                        .BRANCH   4, EDL._L1533
                        BRNE      EDL._L1533
                        .BRANCH   20,EDL._L1531
                        RJMP      EDL._L1531
EDL._L1533:
                        .BLOCK    2133
                        .LINE     2134
                        LDI       _ACCA, 003E8h SHRB 8
                        LDI       _ACCB, 003E8h AND 0FFh
                        LDI       _ACCCLO, EDL.DisplayTimer AND 0FFh
                        LDI       _ACCCHI, EDL.DisplayTimer SHRB 8
                        LDI       _ACCBHI, 001h
                        CALL      SYSTEM.SetSysTimer
                        .LINE     2135
                        LDS       _ACCB, 00276h
                        SBRC      _ACCB, 003h
                        .BRANCH   20,EDL._L1534
                        RJMP      EDL._L1534
                        .BLOCK    2135
                        .LINE     2136
                        LDI       _ACCA, 0FFh
                        STS       EDL.OUTPUTENABLE, _ACCA
                        .LINE     2137
                        LDS       _ACCA, EDL.IncrFine
                        COM       _ACCA
                        STS       EDL.INCRFINE, _ACCA
                        .LINE     2138
                        LDI       _ACCA, 005DCh SHRB 8
                        LDI       _ACCB, 005DCh AND 0FFh
                        LDI       _ACCCLO, EDL.DisplayTimer AND 0FFh
                        LDI       _ACCCHI, EDL.DisplayTimer SHRB 8
                        LDI       _ACCBHI, 001h
                        CALL      SYSTEM.SetSysTimer
                        .LINE     2139
                        LDI       _ACCA, 003h
                        STS       EDL.BUTTONNUMBER, _ACCA
                        .LINE     2140
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.SERPROMPT
                        CALL      EDL.SERPROMPT
                        ADIW      _FRAMEPTR, 3
                        .LINE     2142
                        LDS       _ACCA, EDL.modify
                        CPI       _ACCA, 008h
                        .BRANCH   4, EDL._L1538
                        BRNE      EDL._L1538
                        .BLOCK    2142
                        .LINE     2143
                        LDS       _ACCB, 003E5h
                        SBRS      _ACCB, 004h
                        .BRANCH   20,EDL._L1541
                        RJMP      EDL._L1541
                        .BLOCK    2143
                        .LINE     2144
                        LDS       _ACCA, 003E5h
                        CBR       _ACCA, 010h
                        STS       003E5h, _ACCA
                        .LINE     2145
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 000h
                        STS       EDL.DCVOLT, _ACCB
                        STS       EDL.DCVOLT+1, _ACCA
                        STS       EDL.DCVOLT+2, _ACCALO
                        STS       EDL.DCVOLT+3, _ACCAHI
                        .ENDBLOCK 2146
EDL._L1541:
                        .LINE     2147
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 000h
                        STS       EDL.AH, _ACCB
                        STS       EDL.AH+1, _ACCA
                        STS       EDL.AH+2, _ACCALO
                        STS       EDL.AH+3, _ACCAHI
                        .LINE     2148
                        STS       EDL.WH, _ACCB
                        STS       EDL.WH+1, _ACCA
                        STS       EDL.WH+2, _ACCALO
                        STS       EDL.WH+3, _ACCAHI
                        .ENDBLOCK 2149
EDL._L1538:
                        .ENDBLOCK 2151
EDL._L1534:
                        .LINE     2152
                        LDS       _ACCB, 00276h
                        SBRC      _ACCB, 005h
                        .BRANCH   20,EDL._L1544
                        RJMP      EDL._L1544
                        .BLOCK    2152
                        .LINE     2153
                        LDI       _ACCA, 001h
                        STS       EDL.BUTTONNUMBER, _ACCA
                        .LINE     2154
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.SERPROMPT
                        CALL      EDL.SERPROMPT
                        ADIW      _FRAMEPTR, 3
                        .LINE     2156
                        LDS       _ACCA, EDL.modify
                        CPI       _ACCA, 000h
                        .BRANCH   4, EDL._L1548
                        BRNE      EDL._L1548
                        .BLOCK    2156
                        .LINE     2157
                        LDI       _ACCA, 009h
                        .BRANCH   20, EDL._L1551
                        RJMP      EDL._L1551
                        .ENDBLOCK 2158
EDL._L1548:
                        .BLOCK    2158
                        .LINE     2159
                        LDS       _ACCA, EDL.modify
                        DEC       _ACCA
                        BRPL      EDL._L1551
                        LDI       _ACCA, 9
EDL._L1551:
                        STS       EDL.modify, _ACCA
                        .ENDBLOCK 2161
                        .ENDBLOCK 2162
EDL._L1544:
                        .LINE     2163
                        LDS       _ACCB, 00276h
                        SBRC      _ACCB, 004h
                        .BRANCH   20,EDL._L1552
                        RJMP      EDL._L1552
                        .BLOCK    2163
                        .LINE     2164
                        LDI       _ACCA, 002h
                        STS       EDL.BUTTONNUMBER, _ACCA
                        .LINE     2165
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.SERPROMPT
                        CALL      EDL.SERPROMPT
                        ADIW      _FRAMEPTR, 3
                        .LINE     2167
                        LDS       _ACCA, EDL.modify
                        CPI       _ACCA, 009h
                        .BRANCH   4, EDL._L1556
                        BRNE      EDL._L1556
                        .BLOCK    2167
                        .LINE     2168
                        LDI       _ACCA, 000h
                        .BRANCH   20, EDL._L1559
                        RJMP      EDL._L1559
                        .ENDBLOCK 2169
EDL._L1556:
                        .BLOCK    2169
                        .LINE     2170
                        LDS       _ACCA, EDL.modify
                        INC       _ACCA
                        CPI       _ACCA, 10
                        BRCS      EDL._L1559
                        CLR       _ACCA
EDL._L1559:
                        STS       EDL.modify, _ACCA
                        .ENDBLOCK 2172
                        .ENDBLOCK 2173
EDL._L1552:
                        .LINE     2174
                        .BRANCH   17,EDL.WERTEONLCD
                        CALL      EDL.WERTEONLCD
                        .LINE     2175
                        LDI       _ACCA, 050h
                        STS       EDL.SUBCH, _ACCA
                        .LINE     2176
                        .BRANCH   17,EDL.PARSEGETPARAM
                        CALL      EDL.PARSEGETPARAM
                        .LINE     2177
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 080h
                        LDI       _ACCAHI, 03Fh
                        STS       EDL.DCAMPMOD, _ACCB
                        STS       EDL.DCAMPMOD+1, _ACCA
                        STS       EDL.DCAMPMOD+2, _ACCALO
                        STS       EDL.DCAMPMOD+3, _ACCAHI
                        .LINE     2178
                        LDI       _ACCA, 004h
                        STS       EDL.SHUNTRANGE, _ACCA
EDL._L1560:
                        .BLOCK    2179
                        .LINE     2180
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.CHECKDELAY
                        RCALL     EDL.CHECKDELAY
                        ADIW      _FRAMEPTR, 2
                        .LINE     2181
                        LDI       _ACCA, 000h
                        .FRAME  0
                        RCALL     SYSTEM.LCDPORTINP_M
                        ORI       _ACCA, 0C7h
                        STS       EDL.BUTTONTEMP, _ACCA
                        .LINE     2182
                        LDS       _ACCA, EDL.Autorepeat
                        INC       _ACCA
                        STS       EDL.Autorepeat, _ACCA
                        .ENDBLOCK 2183
                        .LINE     2183
                        LDS       _ACCA, EDL.ButtonTemp
                        CPI       _ACCA, 0FFh
                        LDI       _ACCA, 0h
                        BRNE      EDL._L1563
                        SER       _ACCA
EDL._L1563:
                        PUSH      _ACCA
                        LDS       _ACCA, EDL.AutoRepeat
                        CPI       _ACCA, 014h
                        LDI       _ACCA, 0h
                        BREQ      EDL._L1564
                        BRLO      EDL._L1564
                        SER       _ACCA
EDL._L1564:
                        POP       _ACCB
                        OR        _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   3, EDL._L1560
                        BREQ      EDL._L1560
                        .LINE     2184
                        LDS       _ACCA, EDL.ButtonTemp
                        CPI       _ACCA, 0FFh
                        .BRANCH   4, EDL._L1567
                        BRNE      EDL._L1567
                        .BLOCK    2184
                        .LINE     2185
                        LDI       _ACCA, 000h
                        .BRANCH   20, _CSE0069
                        RJMP      _CSE0069
                        .ENDBLOCK 2186
EDL._L1567:
                        .BLOCK    2186
                        .LINE     2187
                        LDI       _ACCA, 00Ah
_CSE0069:                         
                        STS       EDL.AUTOREPEAT, _ACCA
                        .ENDBLOCK 2188
                        .LINE     2189
                        LDI       _ACCA, 000h
                        STS       EDL.BUTTONNUMBER, _ACCA
                        .LINE     2190
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.SERPROMPT
                        CALL      EDL.SERPROMPT
                        ADIW      _FRAMEPTR, 3
                        .ENDBLOCK 2191
EDL._L1531:
                        .LINE     2192
                        LDI       _ACCA, 000h
                        STS       EDL.TOGGLETIMER, _ACCA
                        .ENDBLOCK 2193
EDL._L1527:
                        .ENDBLOCK 2194
EDL._L1405:
                        .LINE     2195
                        SER       _ACCA
                        LDS       _ACCB, EDL.IncrTimer
                        TST       _ACCB
                        BREQ      EDL._L1570
                        COM       _ACCA
EDL._L1570:
                        MOV       _ACCB, _ACCA
                        LDS       _ACCA, EDL.LCDpresent
                        AND       _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   3, EDL._L1571
                        BREQ      EDL._L1571
                        .BLOCK    2195
                        .LINE     2196
                        LDI       _ACCA, 032h
                        STS       EDL.IncrTimer, _ACCA
                        .LINE     2197
                        LDS       _ACCA, EDL.FirstTurn
                        COM       _ACCA
                        TST       _ACCA
                        .BRANCH   3, EDL._L1574
                        BREQ      EDL._L1574
                        .BLOCK    2197
                        .LINE     2198
                        LDS       _ACCA, 003E4h
                        CBR       _ACCA, 080h
                        STS       003E4h, _ACCA
                        .LINE     2199
                        LDI       _ACCA, 000h
                        STS       EDL.BUTTONNUMBER, _ACCA
                        .LINE     2200
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,EDL.SERPROMPT
                        CALL      EDL.SERPROMPT
                        ADIW      _FRAMEPTR, 3
                        .ENDBLOCK 2201
EDL._L1574:
                        .LINE     2202
                        LDI       _ACCA, 0FFh
                        STS       EDL.FIRSTTURN, _ACCA
                        .ENDBLOCK 2203
EDL._L1571:
                        .LINE     2204
                        CLR       _ACCA
                        MOV       _ACCB, _SYSTFLAGS
                        ANDI      _ACCB, 001h
                        BRNE      EDL._L1577
                        COM       _ACCA
EDL._L1577:
                        MOV       _ACCB, _ACCA
                        LDS       _ACCA, EDL.LCDpresent
                        AND       _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   3, EDL._L1578
                        BREQ      EDL._L1578
                        .BLOCK    2204
                        .LINE     2205
                        .BRANCH   17,EDL.WERTEONLCD
                        CALL      EDL.WERTEONLCD
                        .LINE     2206
                        LDS       _ACCB, EDL.ToggleTimer
                        LDI       _ACCEHI, 010h
                        CP        _ACCB, _ACCEHI
                        BRCC      EDL._L1581
                        INC       _ACCB
                        STS       EDL.ToggleTimer, _ACCB
EDL._L1581:
                        .LINE     2207
                        LDI       _ACCA, 000C8h SHRB 8
                        LDI       _ACCB, 000C8h AND 0FFh
                        LDI       _ACCCLO, EDL.DisplayTimer AND 0FFh
                        LDI       _ACCCHI, EDL.DisplayTimer SHRB 8
                        LDI       _ACCBHI, 001h
                        CALL      SYSTEM.SetSysTimer
                        .LINE     2208
                        STS       EDL.INCRFINE, _ACCA
                        .LINE     2209
                        STS       EDL.CHANGEDFLAG, _ACCA
                        .LINE     2210
                        LDS       _ACCA, 003E4h
                        CBR       _ACCA, 080h
                        STS       003E4h, _ACCA
                        .ENDBLOCK 2211
EDL._L1578:
                        .ENDBLOCK 2212
                        .LINE     2212
                        .BRANCH   20,EDL._L1394
                        RJMP      EDL._L1394
                        .ENDBLOCK 2213



                        .ENDFUNC  2213

SYSTEM.$Main_stk        .EQU    00403h          ; var iData  Process stack area
SYSTEM.$Main_stk_e      .EQU    00482h          ; var iData  Process stack area
SYSTEM.$Main_reg        .EQU    00483h          ; var iData  Process register area
SYSTEM.$Main_reg_e      .EQU    00495h          ; var iData  Process register area
SYSTEM.$Main_Frame      .EQU    00496h          ; var iData  Process stack area
SYSTEM.$Main_Frame_e    .EQU    00595h          ; var iData  Process stack area

                        ; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                        ; Initialisation and Library Routines
                        ; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

                        .ENTRY
SYSTEM.RESET:
                        CLI
                        ; >> Stack Init [main process only] <<
                        LDI       _ACCA, 004h
                        LDI       _ACCB, 082h
                        OUT       sph, _ACCA
                        OUT       spl, _ACCB


                        ; >> Memory Init <<
                        CLR       _ACCA
                        LDI       _ACCCLO, 16
                        LDI       _ACCCHI, 0
                        LDI       _ACCBLO, 0
                        LDI       _ACCBHI, 0
                        ADIW      _ACCCLO, 1
SYSTEM._L1582:
                        SBIW      _ACCCLO, 001h
                        BREQ      SYSTEM._L1584
                        ST        X+, _ACCA
                        RJMP      SYSTEM._L1582
SYSTEM._L1584:
                        LDI       _ACCBLO, 00060h AND 0FFh
                        LDI       _ACCBHI, 00060h SHRB 8
                        LDI       _ACCCLO, 00800h AND 0FFh
                        LDI       _ACCCHI, 00800h SHRB 8
                        ADIW      _ACCCLO, 1
SYSTEM._L1585:
                        SBIW      _ACCCLO, 001h
                        BREQ      SYSTEM._L1587
                        ST        X+, _ACCA
                        RJMP      SYSTEM._L1585
SYSTEM._L1587:
                        LDI       _FRAMEPTR, 00595h AND 0FFh
                        LDI       _FPTRHI, 00595h SHRB 8

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
                        RJMP      EDL.$_Main

                        ; ============ Interrupt Service ============

SYSTEM.$INTERRUPT_TIMER0:
                        .DEB      SYSTICKENTRY
                        RCALL     SYSTEM.SaveAllRegs
                        LDS       _ACCA, SysTickTime
                        IN        _ACCB, tcnt0
                        ADD       _ACCA, _ACCB
                        OUT       tcnt0, _ACCA
                        LDI       _ACCA, 0FEH ROLB IntFlag
                        AND       Flags, _ACCA
                        CALL      EDL.onSysTick
                        LDS       _ACCB, _TWI_TO
                        TST       _ACCB
                        BREQ      SYSTEM._L1588
                        DEC       _ACCB
                        STS       _TWI_TO, _ACCB
SYSTEM._L1588:
                        LDS       _ACCA, _RXTIMEOUT
                        TST       _ACCA
                        BREQ      SYSTEM._L1589
                        DEC       _ACCA
                        STS       _RXTIMEOUT, _ACCA
SYSTEM._L1589:
                        LDS       _ACCCLO, EDL.DisplayTimer
                        LDS       _ACCCHI, EDL.DisplayTimer+1
                        TST       _ACCCHI
                        BRNE      SYSTEM._L1590
                        TST       _ACCCLO
                        BREQ      SYSTEM._L1591
SYSTEM._L1590:
                        SBIW      _ACCCLO, 1
                        STS       EDL.DisplayTimer, _ACCCLO
                        STS       EDL.DisplayTimer+1, _ACCCHI
                        RJMP      SYSTEM._L1592
SYSTEM._L1591:
                        MOV       _ACCA, _SYSTFLAGS
                        ANDI      _ACCA, 0FEh
                        MOV       _SYSTFLAGS, _ACCA
SYSTEM._L1592:
                        LDS       _ACCA, EDL.ActivityTimer
                        TST       _ACCA
                        BREQ      SYSTEM._L1593
                        SUBI      _ACCA, 1
                        STS       EDL.ActivityTimer, _ACCA
SYSTEM._L1593:
                        LDS       _ACCA, EDL.IncrTimer
                        TST       _ACCA
                        BREQ      SYSTEM._L1594
                        SUBI      _ACCA, 1
                        STS       EDL.IncrTimer, _ACCA
SYSTEM._L1594:
                        LDS       _ACCA, EDL.IntegrateTimer
                        TST       _ACCA
                        BREQ      SYSTEM._L1595
                        SUBI      _ACCA, 1
                        STS       EDL.IntegrateTimer, _ACCA
SYSTEM._L1595:
                        LDI       _ACCA, 1 SHLB IntFlag
                        OR        Flags, _ACCA
                        RCALL     SYSTEM.RestoreAllRegs
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
                        RJMP      SYSTEM._L1601

SYSTEM._L1596:
                        MOV       _ACCB, _ACCA
                        LSR       _ACCA
                        LSR       _ACCA
                        ANDI      _ACCB, 3
                        BREQ      SYSTEM._L1597
                        CPI       _ACCB, 3
                        BRNE      SYSTEM._L1598
SYSTEM._L1597:
                        ADIW      _ACCCLO, 4
                        RET
SYSTEM._L1598:
                        LDD       _ACCALO, Z+0
                        LDD       _ACCAHI, Z+1
                        LDD       _ACCDLO, Z+2
                        LDD       _ACCDHI, Z+3
                        CPI       _ACCB, 1
                        BREQ      SYSTEM._L1599
                        SUBI      _ACCALO, 0FFh
                        SBCI      _ACCAHI, 0FFh
                        SBCI      _ACCDLO, 0FFh
                        SBCI      _ACCDHI, 0FFh
                        RJMP      SYSTEM._L1600
SYSTEM._L1599:
                        SUBI      _ACCALO, 1
                        SBCI      _ACCAHI, 0
                        SBCI      _ACCDLO, 0
                        SBCI      _ACCDHI, 0
SYSTEM._L1600:
                        ST        Z+, _ACCALO
                        ST        Z+, _ACCAHI
                        ST        Z+, _ACCDLO
                        ST        Z+, _ACCDHI
                        RET

SYSTEM._L1601:
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
                        BREQ      SYSTEM._L1602
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
                        RCALL     SYSTEM._L1596
SYSTEM._L1602:
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
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        PUSH      _ACCB
                        PUSH      _ACCA
                        IN        _ACCA, SREG
                        PUSH      _ACCA
                        LDS       _ACCA, _TXCOUNT
                        TST       _ACCA
                        BRNE      SYSTEM._L1603
                        CBI       ucr1, 5
                        RJMP      SYSTEM._L1605
SYSTEM._L1603:
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
                        BRNE      SYSTEM._L1606
                        CBI       ucr1, 5
SYSTEM._L1606:
                        INC       _ACCB
                        CPI       _ACCB, 255
                        BRNE      SYSTEM._L1604
                        CLR       _ACCB
SYSTEM._L1604:
                        STS       _TXOUTP, _ACCB
SYSTEM._L1605:
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
SYSTEM._L1613:
                        LDS       _ACCA, _RXCOUNT
                        CPI       _ACCA, 255
                        BRNE      SYSTEM._L1608
                        IN        _ACCB, UDR1
                        RJMP      SYSTEM._L1610
SYSTEM._L1608:
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
                        BRNE      SYSTEM._L1609
                        CLR       _ACCB
SYSTEM._L1609:
                        STS       _RXINP, _ACCB
                        SBIC      usr1, 7
                        RJMP      SYSTEM._L1613
SYSTEM._L1610:
                        POP       _ACCA
                        OUT       SREG, _ACCA
                        POP       _ACCA
                        POP       _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        RETI

SYSTEM.$INTERRUPT_TIMER1COMPA:
                        RCALL     SYSTEM.SaveAllRegs
                        CALL      EDL.onTickTimer
                        RCALL     SYSTEM.RestoreAllRegs
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
                        RCALL     SYSTEM.TWIout
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
                        RCALL     SYSTEM.TWIout
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
                        RCALL     SYSTEM.TWIout
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
                        RCALL     SYSTEM.TWIout
                        LDS       _ACCDLO, _LCDM_PORT
                        ORI       _ACCDLO, 20h
                        LDI       _ACCBLO, 00001h AND 0FFh
                        LDI       _ACCBHI, 00001h SHRB 8
                        LDI       _ACCAHI, 003h
                        LDI       _ACCCLO, _ACCELO AND 0FFh
                        LDI       _ACCCHI, _ACCELO SHRB 8
                        LDI       _ACCELO, 000h
                        LDI       _ACCDHI, 000h
                        RCALL     SYSTEM.TWIout
                        RET

SYSTEM._LCDM_START_RW:
                        PUSH      _ACCELO
                        MOV       _ACCALO, _ACCA
                        LDI       _ACCELO, 000h
                        RCALL     SYSTEM._LCDM_CLOSE
                        POP       _ACCELO
                        PUSH      _ACCELO
                        ANDI      _ACCELO, 2
                        BREQ       SYSTEM._L1616
                        LDS       _ACCDLO, _LCDM_PORT
                        ORI       _ACCDLO, 20h
                        LDI       _ACCBLO, 00001h AND 0FFh
                        LDI       _ACCBHI, 00001h SHRB 8
                        LDI       _ACCAHI, 006h
                        LDI       _ACCCLO, _ACCELO AND 0FFh
                        LDI       _ACCCHI, _ACCELO SHRB 8
                        LDI       _ACCELO, 0FFh
                        LDI       _ACCDHI, 000h
                        RCALL     SYSTEM.TWIout
                        RJMP      SYSTEM._L1617
SYSTEM._L1616:
                        LDS       _ACCDLO, _LCDM_PORT
                        ORI       _ACCDLO, 20h
                        LDI       _ACCBLO, 00001h AND 0FFh
                        LDI       _ACCBHI, 00001h SHRB 8
                        LDI       _ACCAHI, 006h
                        LDI       _ACCCLO, _ACCELO AND 0FFh
                        LDI       _ACCCHI, _ACCELO SHRB 8
                        LDI       _ACCELO, 000h
                        LDI       _ACCDHI, 000h
                        RCALL     SYSTEM.TWIout
                        LDS       _ACCDLO, _LCDM_PORT
                        ORI       _ACCDLO, 20h
                        LDI       _ACCBLO, 00001h AND 0FFh
                        LDI       _ACCBHI, 00001h SHRB 8
                        LDI       _ACCAHI, 006h
                        LDI       _ACCCLO, _ACCELO AND 0FFh
                        LDI       _ACCCHI, _ACCELO SHRB 8
                        MOV       _ACCELO, _ACCALO
                        LDI       _ACCDHI, 000h
                        RCALL     SYSTEM.TWIout
SYSTEM._L1617:
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
                        RCALL     SYSTEM.TWIout
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
                        RCALL     SYSTEM.TWIout
                        POP       _ACCELO
                        ANDI      _ACCELO, 2
                        BREQ       SYSTEM._L1618
                        LDS       _ACCDLO, _LCDM_PORT
                        ORI       _ACCDLO, 20h
                        LDI       _ACCBLO, 00000h AND 0FFh
                        LDI       _ACCBHI, 00000h SHRB 8
                        LDI       _ACCAHI, 000h
                        LDI       _ACCDHI, 000h
                        RCALL     SYSTEM.TWIout
SYSTEM._L1618:
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
                        RCALL     SYSTEM.TWIinp
                        PUSH      _ACCELO
                        LDI       _ACCELO, 002h
                        RCALL     SYSTEM._LCDM_CLOSE
                        POP       _ACCA
                        .DEB      LCDBUSY_RD
                        RET

SYSTEM._LCDWAIT_M:
                        LDI       _ACCCLO, 00280h AND 0FFh
                        LDI       _ACCCHI, 00280h SHRB 8
SYSTEM._L1619:
                        RCALL     SYSTEM._LCDM_Busy_Rd
                        TST       _ACCA
                        BRPL       SYSTEM._L1620
                        SBIW      _ACCCLO, 1
                        BRNE      SYSTEM._L1619
                        CLR       _ACCB
                        CLR       _ACCA
                        RET
SYSTEM._L1620:
                        MOV       _ACCB, _ACCA
                        SER       _ACCA
                        RET

SYSTEM._LCDM_Ctrl_Wr:
                        PUSH      _ACCA
                        RCALL     SYSTEM._LCDWAIT_M
                        TST       _ACCA
                        BRNE      SYSTEM._L1621
                        POP       _ACCB
                        RET
SYSTEM._L1621:
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

                        .DEB      LCDINP_M

SYSTEM.LCDSETUP_M:
                        STS       _LCDM_PORT, _ACCA
                        ORI       _ACCA, 20h
                        RCALL     SYSTEM.TWIstat
                        .DEB      I2CSTAT_M
                        TST       _ACCA
                        BRNE       SYSTEM._L1622
                        RET
SYSTEM._L1622:
                        RCALL     SYSTEM._LCDM_ini
                        LDI       _ACCB, 16
                        CLR       _ACCA
                        RCALL     SYSTEM.MDELAY
                        LDI       _ACCA, 30h
                        RCALL     SYSTEM._LCDM_Ctrl_Wr_NW
                        LDI       _ACCB, 5
                        CLR       _ACCA
                        RCALL     SYSTEM.MDELAY
                        LDI       _ACCA, 30h
                        RCALL     SYSTEM._LCDM_Ctrl_Wr_NW
                        LDI       _ACCB, 1
                        CLR       _ACCA
                        RCALL     SYSTEM.MDELAY
                        LDI       _ACCA, 30h
                        RCALL     SYSTEM._LCDM_Ctrl_Wr_NW
                        LDI       _ACCB, 1
                        CLR       _ACCA
                        RCALL     SYSTEM.MDELAY
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






SYSTEM.LCDCURSOR_M:
                        LDD       _ACCA, Y+002h
                        STS       _LCDM_PORT, _ACCA
                        LDD       _ACCA, Y+000h
                        LDD       _ACCB, Y+001h
                        TST       _ACCA
                        BRNE       SYSTEM._L1624
                        LDI       _ACCA, 0Ch
                        RJMP      SYSTEM._L1625

SYSTEM._L1624:
                        LDI       _ACCA, 0Dh
SYSTEM._L1625:
                        TST       _ACCB
                        BREQ       SYSTEM._L1626
                        ORI       _ACCA, 2
SYSTEM._L1626:
                        RJMP      SYSTEM._LCDM_Ctrl_Wr

SYSTEM.LCDXY_M:
                        LDD       _ACCA, Y+002h
                        STS       _LCDM_PORT, _ACCA
                        LDD       _ACCA, Y+000h
                        LDD       _ACCB, Y+001h
                        CPI       _ACCA, 0
                        BRNE       SYSTEM._L1627
                        LDI       _ACCA, 080h
                        RJMP      SYSTEM._L1631

SYSTEM._L1627:
                        CPI       _ACCA, 1
                        BRNE       SYSTEM._L1628
                        LDI       _ACCA, 0C0h
                        RJMP      SYSTEM._L1631

SYSTEM._L1628:
                        CPI       _ACCA, 2
                        BRNE       SYSTEM._L1629
                        LDI       _ACCA, 088h
                        RJMP      SYSTEM._L1631

SYSTEM._L1629:
                        CPI       _ACCA, 3
                        BRNE       SYSTEM._L1630
                        LDI       _ACCA, 0C8h
                        RJMP      SYSTEM._L1631

SYSTEM._L1630:
                        LDI       _ACCA, 080h
SYSTEM._L1631:
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
SYSTEM._L1632:
                        PUSH      _ACCB
                        LDI       _ACCA, 20h
                        RCALL     SYSTEM._LCDM_Data_Wr
                        POP       _ACCB
                        DEC       _ACCB
                        BRNE       SYSTEM._L1632
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
                        RCALL     SYSTEM.TWIout
                        POP       _ACCDLO
                        LDI       _ACCBLO, 00001h AND 0FFh
                        LDI       _ACCBHI, 00001h SHRB 8
                        LDI       _ACCCLO, _ACCELO AND 0FFh
                        LDI       _ACCCHI, _ACCELO SHRB 8
                        RCALL     SYSTEM.TWIinp
                        MOV       _ACCA, _ACCELO
                        ANDI      _ACCA, 0F8h
                        RET

SYSTEM.TWISTARTB:
                        LDI       _ACCA, 0
                        STS       TWI_DevLock, _ACCA
                        IN        _ACCA, TWSR
                        ANDI      _ACCA, 0FCh
                        CPI       _ACCA, 000h
                        BRNE      SYSTEM._L1644
                        LDI       _ACCA, 090h
                        OUT       TWCR, _ACCA
SYSTEM._L1644:
                        LDI       _ACCA, 0A4h
                        OUT       TWCR, _ACCA
                        LDI       _ACCA, 100
                        STS       _TWI_TO, _ACCA
SYSTEM._L1642:
                        IN        _ACCA, TWCR
                        ANDI      _ACCA, 080h
                        BRNE      SYSTEM._L1645
                        LDS       _ACCA, _TWI_TO
                        TST       _ACCA
                        BRNE      SYSTEM._L1642
                        OUT       TWCR, _ACCA
                        RJMP      SYSTEM.TWI_ERROR
SYSTEM._L1645:
                        IN        _ACCA, TWSR
                        ANDI      _ACCA, 0FCh
                        CPI       _ACCA, 008h
                        .BRANCH   4, SYSTEM.TWI_OK
                        BRNE      SYSTEM.TWI_OK
                        RJMP      SYSTEM.TWI_ERROR

SYSTEM.TWISTOPB:
SYSTEM._L1650:
                        IN        _ACCA, TWSR
                        ANDI      _ACCA, 0FCh
                        CPI       _ACCA, 0F8h
                        BREQ      SYSTEM._L1650
                        CPI       _ACCA, 000h
                        BRNE      SYSTEM._L1651
                        LDI       _ACCA, 090h
                        OUT       TWCR, _ACCA
                        NOP
SYSTEM._L1651:
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
SYSTEM._L1653:
                        IN        _ACCA, TWCR
                        ANDI      _ACCA, 080h
                        BRNE      SYSTEM._L1654
                        LDS       _ACCA, _TWI_TO
                        TST       _ACCA
                        BRNE      SYSTEM._L1653
                        RJMP      SYSTEM.TWI_ERROR
SYSTEM._L1654:
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
                        BRNE      SYSTEM._L1655
                        LDI       _ACCA, 084h
SYSTEM._L1655:
                        OUT       TWCR, _ACCA
SYSTEM._L1656:
                        IN        _ACCA, TWCR
                        SBRS      _ACCA, 7
                        RJMP      SYSTEM._L1656
                        IN        _ACCA, TWSR
                        ANDI      _ACCA, 0FCh
                        CPI       _ACCA, 058h
                        BREQ      SYSTEM._L1658
                        CPI       _ACCA, 050h
                        BRNE      SYSTEM.TWI_ERROR
SYSTEM._L1658:
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
                        BRNE      SYSTEM._L1657
                        LDI       _ACCA, 090h
                        OUT       TWCR, _ACCA
SYSTEM._L1657:
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
                        BREQ      SYSTEM._L1660
                        RCALL     SYSTEM.TWIRECVBYTE
                        TST       _ACCA
                        .BRANCH   4, SYSTEM.TWI_OK
                        BRNE      SYSTEM.TWI_OK
SYSTEM._L1660:
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
                        BREQ      SYSTEM._L1666
                        MOV       _ACCDLO, _ACCAHI
                        RCALL     SYSTEM.TWISENDBYTE
                        TST       _ACCA
                        BREQ      SYSTEM._L1666
                        BST       Flags, _I2C2BYTE
                        BRTC      SYSTEM._L1665
                        MOV       _ACCDLO, _ACCALO
SYSTEM._L1663:
                        RCALL     SYSTEM.TWISENDBYTE
                        TST       _ACCA
                        BREQ      SYSTEM._L1666
SYSTEM._L1665:
                        TST       _ACCBLO
                        BRNE       SYSTEM._L1670
                        TST       _ACCBHI
                        BREQ       SYSTEM._L1664
SYSTEM._L1670:
                        TST       _ACCDHI
                        BRNE      SYSTEM._L1667
                        LD        _ACCDLO, Z+
                        RJMP      SYSTEM._L1669
SYSTEM._L1667:
                        CPI       _ACCDHI, 1
                        BRNE      SYSTEM._L1668
                        LPM       _ACCDLO, Z+
                        RJMP      SYSTEM._L1669
SYSTEM._L1668:
                        RCALL     SYSTEM.ReadEEp8D
                        ADIW      _ACCCLO, 01h
SYSTEM._L1669:
                        SBIW      _ACCBLO, 1
                        RJMP      SYSTEM._L1663
SYSTEM._L1664:
                        RCALL     SYSTEM.TWISTOPB
                        RJMP      SYSTEM.TWI_OK
SYSTEM._L1666:
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
                        RJMP      SYSTEM._L1672

SYSTEM._L1671:
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
                        BRCC      SYSTEM._L1672
                        LSR       _ACCAHI
                        ROR       _ACCALO
                        ROR       _ACCA
                        ROR       _ACCB
SYSTEM._L1672:
                        TST       _ACCALO
                        BRNE      SYSTEM._L1671
                        TST       _ACCAHI
                        BRNE      SYSTEM._L1671
                        MOV       _ACCDHI, _ACCA
                        CPI       _ACCDLO, 6
                        BRCC     SYSTEM._L1673
                        LDI       _ACCA, 0FFh
                        RET
SYSTEM._L1673:
                        LDI       _ACCA, 0
                        RET
SYSTEM.TickTimerTime:
                        RCALL     SYSTEM.TickTimerStop
                        RCALL     SYSTEM.TickTimerCalc
                        TST       _ACCA
                        BRNE      SYSTEM._L1674
                        RET
SYSTEM._L1674:
                        MOV       _ACCA, _ACCDHI
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
SYSTEM._L1675:
                        RCALL     SYSTEM.SERSTAT
                        TST       _ACCA
                        BRNE      SYSTEM._L1676
                        LDS       _ACCA, _RXTIMEOUT
                        TST       _ACCA
                        BRNE      SYSTEM._L1675
                        RET
SYSTEM._L1676:
                        RCALL     SYSTEM.SERINP
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        ST        Z+, _ACCA
                        STD       Y+002h, _ACCCHI
                        STD       Y+001h, _ACCCLO
                        SER       _ACCA
                        RET

SYSTEM.SERINP:
SYSTEM._L1677:
                        LDS       _ACCA, _RXCOUNT
                        TST       _ACCA
                        BREQ      SYSTEM._L1677
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
                        BRNE      SYSTEM._L1678
                        CLR       _ACCB
SYSTEM._L1678:
                        STS       _RXOUTP, _ACCB
                        RET

SYSTEM.SERSTAT:
                        CLR       _ACCA
                        LDS       _ACCB, _RXCOUNT
                        TST       _ACCB
                        BREQ      SYSTEM._L1683
                        COM       _ACCA
SYSTEM._L1683:
                        RET

SYSTEM.SEROUT:
SYSTEM._L1687:
                        LDS       _ACCB, _TXCOUNT
                        CPI       _ACCB, 255
                        BREQ      SYSTEM._L1687
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
                        BRNE      SYSTEM._L1688
                        CLR       _ACCB
SYSTEM._L1688:
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
                        BRCS      SYSTEM._L1692
                        LDI       _ACCB, 0
                        LDI       _ACCA, 0
                        LDI       _ACCALO, 0
                        LDI       _ACCAHI, 0
                        RET
SYSTEM._L1692:
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
                        BRCS      SYSTEM._L1693
                        RET
SYSTEM._L1693:
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
                        BREQ      SYSTEM._L1698
                        OUT       eedr, _ACCA
                        SBI       eecr, 2
                        SBI       eecr, 1
SYSTEM._L1698:
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
                        RCALL     SYSTEM.ReadEEp8
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
                        BREQ      SYSTEM._L1699
SYSTEM._L1699:
                        LD        _ACCA, X
                        INC       _ACCA

                        MOV       _ACCFLO, _ACCFHI
                        ANDI      _ACCFLO, 3
                        TST       _ACCFLO
                        BREQ      SYSTEM._L1700
                        LSR       _ACCFLO
                        BRNE      SYSTEM._L1702
                        PUSH      _ACCA
                        RCALL     SYSTEM.ReadEEp8
                        MOV       _ACCAHI, _ACCA
                        POP       _ACCA
                        ADIW      _ACCCLO, 01h
                        RJMP      SYSTEM._L1701
SYSTEM._L1702:
                        LPM       _ACCAHI, Z+
                        RJMP      SYSTEM._L1701
SYSTEM._L1700:
                        LD        _ACCAHI, Z+
SYSTEM._L1701:
                        TST       _ACCAHI
                        BREQ      SYSTEM._L1709
                        MOV       _ACCFLO, _ACCFHI
                        ANDI      _ACCFLO, 10h
                        BREQ      SYSTEM._L1704
SYSTEM._L1704:
                        LD        _ACCALO, X
                        CP        _ACCB, _ACCA
                        BRCC      SYSTEM._L1708
SYSTEM._L1709:
                        RET
SYSTEM._L1708:
                        MOV       _ACCDLO, _ACCB
                        SUB       _ACCDLO, _ACCA
                        MOV       _ACCDHI, _ACCDLO
                        SUB       _ACCDLO, _ACCAHI
                        BRCS      SYSTEM._L1714
                        CP        _ACCALO, _ACCA
                        BRCC      SYSTEM._L1711
                        MOV       _ACCELO, _ACCAHI
                        ADD       _ACCELO, _ACCALO
                        CP        _ACCB, _ACCELO
                        .BRANCH   1, SYSTEM._L1714
                        BRCS      SYSTEM._L1714
                        MOV       _ACCB, _ACCELO
                        RJMP      SYSTEM._L1714
SYSTEM._L1711:
                        PUSH      _ACCBLO
                        PUSH      _ACCBHI
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        MOV       _ACCDHI, _ACCALO
                        SUB       _ACCDHI, _ACCA
                        CP        _ACCDHI, _ACCDLO
                        BRCC      SYSTEM._L1712
                        MOV       _ACCDLO, _ACCDHI
SYSTEM._L1712:
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
                        BREQ      SYSTEM._L1713
SYSTEM._L1713:
                        LD        _ACCGLO, -X
                        ST        -Z, _ACCGLO
                        DEC       _ACCDHI
                        BRNE     SYSTEM._L1713
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        MOV       _ACCB, _ACCA
                        ADD       _ACCB, _ACCAHI
                        ADD       _ACCB, _ACCDLO
                        BRNE     SYSTEM._L1718
SYSTEM._L1714:
                        ADD       _ACCAHI, _ACCDLO
                        INC       _ACCAHI
SYSTEM._L1718:
                        MOV       _ACCFLO, _ACCFHI
                        ANDI      _ACCFLO, 10h
                        BREQ      SYSTEM._L1721
SYSTEM._L1721:
                        ST        X, _ACCB
                        CLR       _ACCALO
                        ADD       _ACCBLO, _ACCA
                        ADC       _ACCBHI, _ACCALO
SYSTEM._L1719:
                        MOV       _ACCFLO, _ACCFHI
                        ANDI      _ACCFLO, 3
                        TST       _ACCFLO
                        BREQ      SYSTEM._L1722
                        LSR       _ACCFLO
                        BRNE      SYSTEM._L1724
                        RCALL     SYSTEM.ReadEEp8
                        MOV       _ACCGLO, _ACCA
                        ADIW      _ACCCLO, 01h
                        RJMP      SYSTEM._L1723
SYSTEM._L1724:
                        LPM       _ACCGLO, Z+
                        RJMP      SYSTEM._L1723
SYSTEM._L1722:
                        LD        _ACCGLO, Z+
SYSTEM._L1723:
                        MOV       _ACCFLO, _ACCFHI
                        ANDI      _ACCFLO, 10h
                        BREQ      SYSTEM._L1725
SYSTEM._L1725:
                        ST        X+, _ACCGLO
                        DEC       _ACCAHI
                        BRNE     SYSTEM._L1719
                        RET

SYSTEM.Str2Int:
                        CLR       _ACCAHI
                        CLR       _ACCALO
                        CLR       _ACCBHI
                        CLR       _ACCBLO
                        BST       Flags, _EEPROM
                        BRTC      SYSTEM._L1731
                        RCALL     SYSTEM.ReadEEp8
                        ADIW      _ACCCLO, 01h
                        RJMP     SYSTEM._L1732
SYSTEM._L1731:
                        LD        _ACCA, Z+
SYSTEM._L1732:
                        TST       _ACCA
                        BRNE      SYSTEM._L1728
SYSTEM._L1727:
                        CLR       _ACCA
                        CLR       _ACCB
                        RET

SYSTEM._L1728:
                        MOV       _ACCDHI, _ACCA
                        TST       _ACCB
                        BREQ      SYSTEM._L1733
                        INC       _ACCDHI
                        RJMP      SYSTEM.Hex2Int
SYSTEM._L1733:
                        BST       Flags, _EEPROM
                        BRTC      SYSTEM._L1734
                        RCALL     SYSTEM.ReadEEp8
                        ADIW      _ACCCLO, 01h
                        RJMP     SYSTEM._L1735
SYSTEM._L1734:
                        LD        _ACCA, Z+
SYSTEM._L1735:
                        CLT
                        BLD       Flags, _NEGATIVE
                        CPI       _ACCA, 02Dh
                        BRNE      SYSTEM._L1729
                        DEC       _ACCDHI
                        BREQ      SYSTEM._L1727
                        SET
                        BLD       Flags, _NEGATIVE
                        BST       Flags, _EEPROM
                        BRTC      SYSTEM._L1736
                        RCALL     SYSTEM.ReadEEp8
                        ADIW      _ACCCLO, 01h
                        RJMP      SYSTEM.Dec2Int
SYSTEM._L1736:
                        LD        _ACCA, Z+
                        RJMP      SYSTEM.Dec2Int
SYSTEM._L1729:
                        CPI       _ACCA, 02Bh
                        BRNE      SYSTEM._L1730
                        DEC       _ACCDHI
                        BREQ      SYSTEM._L1727
                        CLT
                        BLD       Flags, _NEGATIVE
                        BST       Flags, _EEPROM
                        BRTC      SYSTEM._L1738
                        RCALL     SYSTEM.ReadEEp8
                        ADIW      _ACCCLO, 01h
                        RJMP      SYSTEM.Dec2Int
SYSTEM._L1738:
                        LD        _ACCA, Z+
                        RJMP      SYSTEM.Dec2Int
SYSTEM._L1730:
                        CPI       _ACCA, 024h
                        BRNE      SYSTEM.Dec2Int
                        RJMP      SYSTEM.Hex2Int
SYSTEM.Dec2Int:
                        MOV       _ACCB, _ACCDHI
                        DEC       _ACCB
                        BRMI      SYSTEM._L1727
                        CLR       _ACCDHI
                        CLR       _ACCEHI
                        CLR       _ACCFHI
                        CLR       _ACCFLO
                        PUSH      _ACCB
                        RJMP      SYSTEM.Dec2Int1
SYSTEM._L1740:
                        PUSH      _ACCB
                        BST       Flags, _EEPROM
                        BRTC      SYSTEM._L1743
                        RCALL     SYSTEM.ReadEEp8
                        ADIW      _ACCCLO, 01h
                        RJMP     SYSTEM._L1744
SYSTEM._L1743:
                        LD        _ACCA, Z+
SYSTEM._L1744:
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
                        RJMP      SYSTEM._L1740
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
                        BRTC      SYSTEM._L1745
                        SUBI      _ACCB, 01h
                        SBCI      _ACCA, 00h
                        SBCI      _ACCALO, 00h
                        SBCI      _ACCAHI, 00h
                        COM       _ACCALO
                        COM       _ACCAHI
                        COM       _ACCA
                        COM       _ACCB
SYSTEM._L1745:
                        RET

SYSTEM.Hex2Int:
                        CLT
                        BLD       Flags, _NEGATIVE
                        DEC       _ACCDHI
                        BREQ      SYSTEM._L1745
                        CPI       _ACCDHI, 009h
                        BRSH      SYSTEM.Str2Ierr
SYSTEM._L1746:
                        BST       Flags, _EEPROM
                        BRTC      SYSTEM._L1750
                        RCALL     SYSTEM.ReadEEp8
                        ADIW      _ACCCLO, 01h
                        RJMP     SYSTEM._L1751
SYSTEM._L1750:
                        LD        _ACCA, Z+
SYSTEM._L1751:
                        CPI       _ACCA, 061h
                        BRLO      SYSTEM._L1747
                        SUBI      _ACCA, 020h
SYSTEM._L1747:
                        CPI       _ACCA, 030h
                        BRLO      SYSTEM.Str2Ierr
                        CPI       _ACCA, 03Ah
                        BRLO      SYSTEM._L1748
                        CPI       _ACCA, 041h
                        BRLO      SYSTEM.Str2Ierr
                        CPI       _ACCA, 047h
                        BRSH      SYSTEM.Str2Ierr
                        SUBI      _ACCA, -9 AND 0FFh
SYSTEM._L1748:
                        ANDI      _ACCA, 00Fh
                        LDI       _ACCB, 4
SYSTEM._L1749:
                        LSL       _ACCBLO
                        ROL       _ACCBHI
                        ROL       _ACCALO
                        ROL       _ACCAHI
                        DEC       _ACCB
                        BRNE      SYSTEM._L1749
                        OR        _ACCBLO, _ACCA
                        DEC       _ACCDHI
                        BRNE      SYSTEM._L1746
                        RJMP      SYSTEM.Str2Iex
SYSTEM.PosChInVarStr:
                        CLR       _ACCA
                        LD        _ACCBHI, Z
                        TST       _ACCBHI
                        BREQ      SYSTEM._L1753
                        TST       _ACCELO
                        BRNE      SYSTEM._L1752
                        INC       _ACCELO
SYSTEM._L1752:
                        CP        _ACCBHI, _ACCELO
                        BRCS      SYSTEM._L1753
                        ADD       _ACCCLO, _ACCELO
                        ADC       _ACCCHI, _ACCA
                        DEC       _ACCELO
                        SUB       _ACCBHI, _ACCELO
                        MOV       _ACCA, _ACCELO
SYSTEM._L1754:
                        INC       _ACCA
                        LD        _ACCBLO, Z+
                        CP        _ACCB, _ACCBLO
                        BREQ      SYSTEM._L1753
                        DEC       _ACCBHI
                        BRNE      SYSTEM._L1754
                        CLR       _ACCA
SYSTEM._L1753:
                        RET


SYSTEM.UpperCaseStr:
                        LD        _ACCA, Z+
                        TST       _ACCA
                        BREQ      SYSTEM._L1756
                        MOV       _ACCBHI, _ACCA
SYSTEM._L1755:
                        LD        _ACCA, Z+
                        CPI       _ACCA, 061h
                        BRCS      SYSTEM._L1757
                        CPI       _ACCA, 07Bh
                        BRCC      SYSTEM._L1757
                        ANDI      _ACCA, 0DFh
SYSTEM._L1757:
                        RCALL     SYSTEM.Char2Str
                        DEC       _ACCBHI
                        BRNE      SYSTEM._L1755
SYSTEM._L1756:
                        RET


SYSTEM.StrCopyV:
                        TST       _ACCA
                        BREQ      SYSTEM._L1760
                        LD        _ACCBHI, Z
                        TST       _ACCBHI
                        BREQ      SYSTEM._L1760
                        SUB       _ACCBHI, _ACCB
                        BRCS      SYSTEM._L1760
                        INC       _ACCBHI
                        CLR       _ACCBLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCBLO
                        CP        _ACCBHI, _ACCA
                        BRCS      SYSTEM._L1759
                        MOV       _ACCBHI, _ACCA
SYSTEM._L1759:
                        LD        _ACCA, Z+
                        RCALL     SYSTEM.Char2Str
                        DEC       _ACCBHI
                        BRNE      SYSTEM._L1759
SYSTEM._L1760:
                        RET


SYSTEM.StrConst2Str:
                        LPM       _ACCBHI, Z+
                        TST       _ACCBHI
                        BREQ      SYSTEM._L1762
SYSTEM._L1761:
                        LPM      _ACCA, Z+
                        RCALL     SYSTEM.Char2Str
                        DEC       _ACCBHI
                        BRNE      SYSTEM._L1761
SYSTEM._L1762:
                        RET


SYSTEM.StrVar2Str:
                        LD        _ACCA, Z+
                        TST       _ACCA
                        BREQ      SYSTEM._L1764
                        MOV       _ACCBHI, _ACCA
SYSTEM._L1763:
                        LD        _ACCA, Z+
                        RCALL     SYSTEM.Char2Str
                        DEC       _ACCBHI
                        BRNE      SYSTEM._L1763
SYSTEM._L1764:
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
                        RCALL     SYSTEM.Char2Str
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
                        RCALL     SYSTEM.Char2Str
                        CLR       _ACCFLO
                        INC       _ACCALO
SYSTEM._B2STR_PNTG4:
                        ADDI      _ACCALO, 2
                        LDI       _ACCA, 30h
                        RCALL     SYSTEM.Char2Str
                        LDI       _ACCA, 2Eh
                        RCALL     SYSTEM.Char2Str
                        LDI       _ACCA, 30h
SYSTEM._B2STR_PNTG5:
                        TST       _ACCEHI
                        BREQ       SYSTEM._B2STR_WR
                        RCALL     SYSTEM.Char2Str
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
                        RCALL     SYSTEM.Char2Str
                        DEC       _ACCB
                        BRNE       SYSTEM._B2STR_F1
SYSTEM._B2STR_WR:
                        TST       _ACCFLO
                        BREQ       SYSTEM._B2STR_WR0
                        MOV       _ACCA, _ACCFLO
                        RCALL     SYSTEM.Char2Str
SYSTEM._B2STR_WR0:
                        LD        _ACCA, -X
                        TST       _ACCA
                        BREQ       SYSTEM._B2STR_WR1
                        RCALL     SYSTEM.Char2Str
SYSTEM._B2STR_WR1:
                        LD        _ACCA, -X
                        ORI       _ACCA, 30h
                        RCALL     SYSTEM.Char2Str
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
                        RJMP      SYSTEM._L1765
                        LD        _ACCGLO, Z+
                        RJMP      SYSTEM._L1766
SYSTEM._L1765:
                        LPM       _ACCGLO, Z+
SYSTEM._L1766:
                        CP        _ACCB, _ACCGLO
                        BREQ      SYSTEM._L1767
                        CLZ
                        RET
SYSTEM._L1767:
                        TST       _ACCB
                        BRNE      SYSTEM._L1768
                        SEZ
                        RET
SYSTEM._L1768:
                        DEC       _ACCB
                        LD        _ACCA, X+
                        SBRC      FLAGS, _STRCONST
                        RJMP      SYSTEM._L1769
                        LD        _ACCGLO, Z+
                        RJMP      SYSTEM._L1770
SYSTEM._L1769:
                        LPM       _ACCGLO, Z+
SYSTEM._L1770:
                        CP        _ACCA, _ACCGLO
                        BREQ      SYSTEM._L1767
                        CLZ
                        RET


SYSTEM.Char2Str:
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        BST       Flags, _DEVICE
                        BRTS      SYSTEM._L1774
                        PUSH      _ACCA
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LDD       _ACCA, Y+000h
                        TST       _ACCA
                        BRNE      SYSTEM._L1771
                        POP       _ACCA
                        SET
                        BLD       Flags, _ERRFLAG
                        POP       _ACCCHI
                        POP       _ACCCLO
                        RET
SYSTEM._L1771:
                        DEC       _ACCA
                        STD       Y+000h, _ACCA
                        POP       _ACCA
                        BST       Flags, _EEPROM
                        BRTS      SYSTEM._L1772
                        ST        Z+, _ACCA
                        RJMP      SYSTEM._L1773
SYSTEM._L1772:
                        RCALL     SYSTEM.WriteEEp8
                        ADIW      _ACCCLO, 01h
SYSTEM._L1773:
                        STD       Y+002h, _ACCCHI
                        STD       Y+001h, _ACCCLO
                        POP       _ACCCHI
                        POP       _ACCCLO
                        RET
SYSTEM._L1774:
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
                        MOVW      _ACCELO, _ACCALO
                        ROL       _ACCELO
                        ROL       _ACCEHI
                        SUBI      _ACCEHI, 127
                        BRCC      SYSTEM._L1775
                        POP       _ACCEHI
                        POP       _ACCELO
                        CLR       _ACCA
                        CLR       _ACCB
                        CLR       _ACCAHI
                        CLR       _ACCALO
                        RET
SYSTEM._L1775:
                        ORI       _ACCALO, 080h
                        MOV       _ACCELO, _ACCAHI
                        CLR       _ACCAHI
                        CPI       _ACCEHI, 24
                        BRSH      SYSTEM._L1777
                        SUBI      _ACCEHI, 23
                        NEG       _ACCEHI
SYSTEM._L1776:
                        BREQ      SYSTEM._L1779
                        LSR       _ACCAHI
                        ROR       _ACCALO
                        ROR       _ACCA
                        ROR       _ACCB
                        DEC       _ACCEHI
                        RJMP      SYSTEM._L1776
SYSTEM._L1777:
                        SUBI      _ACCEHI, 23
SYSTEM._L1778:
                        BREQ      SYSTEM._L1779
                        LSL       _ACCB
                        ROL       _ACCA
                        ROL       _ACCALO
                        ROL       _ACCAHI
                        DEC       _ACCEHI
                        RJMP      SYSTEM._L1778
SYSTEM._L1779:
                        SBRS      _ACCELO, 7
                        RJMP      SYSTEM._L1780
                        SUBI      _ACCB, 01h
                        SBCI      _ACCA, 00h
                        SBCI      _ACCALO, 00h
                        SBCI      _ACCAHI, 00h
                        COM       _ACCB
                        COM       _ACCA
                        COM       _ACCAHI
                        COM       _ACCALO
SYSTEM._L1780:
                        POP       _ACCEHI
                        POP       _ACCELO
                        RET


SYSTEM.FloatToLInt:
                        MOV       _ACCDHI, _ACCAHI
                        MOVW      _ACCBLO, _ACCALO
                        CLR       _ACCAHI
                        ORI       _ACCALO, 080h
                        ANDI      _ACCBHI, 07Fh
                        ANDI      _ACCBLO, 080h
                        ROL       _ACCBLO
                        ROL       _ACCBHI
                        SUBI      _ACCBHI, 07Fh
                        BRPL      SYSTEM._L1784
                        CLR       _ACCAHI
                        CLR       _ACCALO
                        CLR       _ACCA
                        CLR       _ACCB
                        RET
SYSTEM._L1784:
                        CPI       _ACCBHI, 23
                        BRCC      SYSTEM._L1786
                        LDI       _ACCBLO, 23
                        SUB       _ACCBLO, _ACCBHI
                        BREQ      SYSTEM._L1788
SYSTEM._L1785:
                        LSR       _ACCAHI
                        ROR       _ACCALO
                        ROR       _ACCA
                        ROR       _ACCB
                        DEC       _ACCBLO
                        BRNE      SYSTEM._L1785
                        RJMP      SYSTEM._L1788
SYSTEM._L1786:
                        SUBI      _ACCBHI, 23
                        BREQ      SYSTEM._L1788
                        MOV       _ACCBLO, _ACCBHI
SYSTEM._L1787:
                        LSL       _ACCB
                        ROL       _ACCA
                        ROL       _ACCALO
                        ROL       _ACCAHI
                        BRCC      SYSTEM._L1789
                        SET
                        BLD       Flags, _ERRFLAG
SYSTEM._L1789:
                        DEC       _ACCBLO
                        BRNE      SYSTEM._L1787
SYSTEM._L1788:
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
                        RJMP      SYSTEM._L1790
                        CBR       _ACCAHI, 080h
                        SBRS      _ACCDLO, 7
                        RJMP      SYSTEM._L1792
SYSTEM._L1790:
                        SBRS      _ACCCHI, 7
                        RJMP      SYSTEM._L1791
                        CBR       _ACCCHI, 080h
                        SBRS      _ACCDLO, 7
                        RJMP      SYSTEM._L1793
SYSTEM._L1791:
                        CP        _ACCAHI, _ACCCHI
                        BRLO      SYSTEM._L1792
                        BRNE      SYSTEM._L1793
                        CP        _ACCALO, _ACCCLO
                        BRLO      SYSTEM._L1792
                        BRNE      SYSTEM._L1793
                        CP        _ACCA, _ACCBHI
                        BRLO      SYSTEM._L1792
                        BRNE      SYSTEM._L1793
                        CP        _ACCB, _ACCBLO
                        BRLO      SYSTEM._L1792
                        BRNE      SYSTEM._L1793
                        RJMP      SYSTEM._L1797
SYSTEM._L1792:
                        SBRC      _ACCDLO, 7
                        RJMP      SYSTEM._L1795
SYSTEM._L1794:
                        BST       Flags, _NEGATIVE
                        BRTS      SYSTEM._L1796
                        MOVW      _ACCB, _ACCBLO
                        MOVW      _ACCALO, _ACCCLO
SYSTEM._L1796:
                        INC       _ACCDHI
                        RJMP      SYSTEM._L1797
SYSTEM._L1793:
                        SBRC      _ACCDLO, 7
                        RJMP      SYSTEM._L1794
SYSTEM._L1795:
                        DEC       _ACCDHI
SYSTEM._L1797:
                        OR        _ACCAHI, _ACCDLO
                        RET

SYSTEM.LIntToFloat:
                        TST       _ACCAHI
                        BRNE      SYSTEM._L1798
                        TST       _ACCALO
                        BRNE      SYSTEM._L1798
                        TST       _ACCA
                        BRNE      SYSTEM._L1798
                        TST       _ACCB
                        BRNE      SYSTEM._L1798
                        RET
SYSTEM._L1798:
                        CLR       _ACCBLO
                        SBRS      Flags, _SIGN
                        RJMP      SYSTEM._L1799
                        MOV       _ACCBLO, _ACCAHI
                        ANDI      _ACCBLO, 080h
                        TST       _ACCAHI
                        BRPL      SYSTEM._L1804
                        SUBI      _ACCB, 01h
                        SBCI      _ACCA, 00h
                        SBCI      _ACCALO, 00h
                        SBCI      _ACCAHI, 00h
                        COM       _ACCALO
                        COM       _ACCAHI
                        COM       _ACCA
                        COM       _ACCB
SYSTEM._L1804:
SYSTEM._L1799:
                        LDI       _ACCBHI, 150
SYSTEM._L1800:
                        TST       _ACCAHI
                        BREQ      SYSTEM._L1801
                        LSR       _ACCAHI
                        ROR       _ACCALO
                        ROR       _ACCA
                        ROR       _ACCB
                        INC       _ACCBHI
                        RJMP      SYSTEM._L1800
SYSTEM._L1801:
                        SBRC      _ACCALO, 7
                        RJMP      SYSTEM._L1802
                        LSL       _ACCB
                        ROL       _ACCA
                        ROL       _ACCALO
                        ROL       _ACCAHI
                        DEC       _ACCBHI
                        RJMP      SYSTEM._L1801
SYSTEM._L1802:
                        ANDI      _ACCALO, 07Fh
                        MOV       _ACCAHI, _ACCBHI
                        LSR       _ACCAHI
                        BRCC      SYSTEM._L1803
                        ORI       _ACCALO, 080h
SYSTEM._L1803:
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
                        BREQ      SYSTEM._L1805
                        TST       _ACCEHI
                        BRNE      SYSTEM._L1806
SYSTEM._L1805:
                        CLR       _ACCB
                        CLR       _ACCA
                        CLR       _ACCALO
                        CLR       _ACCAHI
                        RET
SYSTEM._L1806:
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
                        BRNE      SYSTEM._L1807
                        CPI       _ACCCHI, 0FFh
                        BRLO      SYSTEM._L1808
SYSTEM._L1807:
                        SET
                        BLD       Flags, _ERRFLAG
                        ANDI      _ACCAHI, 080h
                        ORI       _ACCAHI, 07Eh
                        LDI       _ACCALO, 0FFh
                        LDI       _ACCB, 0FFh
                        LDI       _ACCA, 0FFh
                        RET
SYSTEM._L1808:
                        CPI       _ACCCHI, 01h
                        BRSH      SYSTEM._L1809
                        CLR       _ACCAHI
                        CLR       _ACCALO
                        CLR       _ACCB
                        CLR       _ACCA
                        SET
                        BLD       Flags, _ERRFLAG
                        RET
SYSTEM._L1809:
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
SYSTEM._L1810:
                        BRCC      SYSTEM._L1811
                        ADD       _ACCFLO, _ACCBLO
                        ADC       _ACCFHI, _ACCBHI
                        ADC       _ACCGLO, _ACCCLO
                        ADC       _ACCGHI, _ACCCHI
SYSTEM._L1811:
                        ROR       _ACCGHI
                        ROR       _ACCGLO
                        ROR       _ACCFHI
                        ROR       _ACCFLO
                        ROR       _ACCEHI
                        ROR       _ACCELO
                        ROR       _ACCDHI
                        ROR       _ACCDLO
                        DEC       _ACCA
                        BRNE      SYSTEM._L1810
                        LDI       _ACCALO, 23
SYSTEM._L1812:
                        LSR       _ACCGHI
                        ROR       _ACCGLO
                        ROR       _ACCFHI
                        ROR       _ACCFLO
                        ROR       _ACCEHI
                        ROR       _ACCELO
                        ROR       _ACCDHI
                        ROR       _ACCDLO
                        DEC       _ACCALO
                        BRNE      SYSTEM._L1812
                        MOVW      _ACCB, _ACCDLO
                        MOVW      _ACCALO, _ACCELO
                        POP       _ACCBHI
                        POP       _ACCGLO
                        TST       _ACCAHI
                        BREQ      SYSTEM._L1813
                        LSR       _ACCAHI
                        ROR       _ACCALO
                        ROR       _ACCA
                        ROR       _ACCB
                        INC       _ACCBHI
SYSTEM._L1813:
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
                        BRNE      SYSTEM._L1815
                        SET
                        BLD       Flags, _ERRFLAG
                        ANDI      _ACCAHI, 080h
                        ORI       _ACCAHI, 07Eh
                        LDI       _ACCALO, 0FFh
                        LDI       _ACCA, 0FFh
                        LDI       _ACCB, 0FFh
                        RET
SYSTEM._L1815:
                        ROL       _ACCCLO
                        ROL       _ACCCHI
                        SEC
                        ROR       _ACCCLO
                        ROL       _ACCELO
                        ROL       _ACCEHI
                        SEC
                        ROR       _ACCELO
                        TST       _ACCEHI
                        BRNE      SYSTEM._L1817
                        CLR       _ACCAHI
                        CLR       _ACCALO
                        CLR       _ACCA
                        CLR       _ACCB
                        RET
SYSTEM._L1817:
                        CLR       _ACCA
                        SUB       _ACCEHI, _ACCCHI
                        SBCI      _ACCA, 00h
                        MOV       _ACCCHI, _ACCEHI
                        LDI       _ACCB, 7Eh
                        ADD       _ACCCHI, _ACCB
                        CLR       _ACCB
                        ADC       _ACCA, _ACCB
                        TST      _ACCA
                        BRNE     SYSTEM._L1819
                        CPI       _ACCCHI, 0FFh
                        BRNE      SYSTEM._L1818
SYSTEM._L1819:
                        SET
                        BLD       Flags, _ERRFLAG
                        ANDI      _ACCAHI, 080h
                        ORI       _ACCAHI, 07Eh
                        LDI       _ACCALO, 0FFh
                        LDI       _ACCB, 0FFh
                        LDI       _ACCA, 0FFh
                        RET
SYSTEM._L1818:
                        TST       _ACCCHI
                        BRNE      SYSTEM._L1816
                        SET
                        BLD       Flags, _ERRFLAG
                        CLR       _ACCAHI
                        CLR       _ACCALO
                        CLR       _ACCB
                        CLR       _ACCA
                        RET
SYSTEM._L1816:
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
SYSTEM._L1820:
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
                        BRCC      SYSTEM._L1821
                        CLR       _ACCB
                        SUB       _ACCALO, _ACCBLO
                        SBC       _ACCAHI, _ACCBHI
                        SBC       _ACCGLO, _ACCCLO
                        SBC       _ACCGHI, _ACCCHI
                        SBC       _ACCHLO, _ACCB
                        SBC       _ACCHHI, _ACCB
                        SEC
                        RJMP      SYSTEM._L1823
SYSTEM._L1821:
                        CLR       _ACCB
                        CP        _ACCHHI, _ACCB
                        BRLO      SYSTEM._L1823
                        BRNE      SYSTEM._L1822
                        CP        _ACCHLO, _ACCB
                        BRLO      SYSTEM._L1823
                        BRNE      SYSTEM._L1822
                        CP        _ACCGHI, _ACCCHI
                        BRLO      SYSTEM._L1823
                        BRNE      SYSTEM._L1822
                        CP        _ACCGLO, _ACCCLO
                        BRLO      SYSTEM._L1823
                        BRNE      SYSTEM._L1822
                        CP        _ACCAHI, _ACCBHI
                        BRLO      SYSTEM._L1823
                        BRNE      SYSTEM._L1822
                        CP        _ACCALO, _ACCBLO
                        BRLO      SYSTEM._L1823
SYSTEM._L1822:
                        CLR       _ACCB
                        SUB       _ACCALO, _ACCBLO
                        SBC       _ACCAHI, _ACCBHI
                        SBC       _ACCGLO, _ACCCLO
                        SBC       _ACCGHI, _ACCCHI
                        SBC       _ACCHLO, _ACCB
                        SBC       _ACCHHI, _ACCB
SYSTEM._L1823:
                        DEC       _ACCA
                        BRCS      SYSTEM._L1824
                        SEC
                        RJMP      SYSTEM._L1825
SYSTEM._L1824:
                        CLC
SYSTEM._L1825:
                        BRNE      SYSTEM._L1820
                        ROL       _ACCFLO
                        ROL       _ACCFHI
                        ROL       _ACCDLO
                        ROL       _ACCDHI
                        ROL       _ACCELO
                        ROL       _ACCEHI
                        MOVW      _ACCB, _ACCFLO
                        MOVW      _ACCALO, _ACCDLO
                        POP       _ACCBHI
                        TST       _ACCAHI
                        BREQ      SYSTEM._L1826
                        LSR       _ACCAHI
                        ROR       _ACCALO
                        ROR       _ACCA
                        ROR       _ACCB
                        INC       _ACCBHI
SYSTEM._L1826:
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
                        RCALL     SYSTEM.AddFloat1
                        RJMP      SYSTEM.FTRUNCX

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
                        BRCS      SYSTEM._L1827
                        BRNE      SYSTEM._L1828
                        CP        _ACCELO, _ACCCLO
                        BRCS      SYSTEM._L1827
                        BRNE      SYSTEM._L1828
                        CP        _ACCDHI, _ACCBHI
                        BRCS      SYSTEM._L1827
                        BRNE      SYSTEM._L1828
                        CP        _ACCDLO, _ACCBLO
                        BRCS      SYSTEM._L1827
SYSTEM._L1828:
                        MOVW      _ACCB, _ACCDLO
                        MOVW      _ACCALO, _ACCELO
                        MOVW      _ACCDLO, _ACCBLO
                        MOVW      _ACCELO, _ACCCLO
                        MOVW      _ACCBLO, _ACCB
                        MOVW      _ACCCLO, _ACCALO
                        RJMP      SYSTEM._L1837
SYSTEM._L1827:
                        MOVW      _ACCB, _ACCBLO
                        MOVW      _ACCALO, _ACCCLO
SYSTEM._L1837:
                        ANDI      _ACCALO, 07Fh
                        ORI       _ACCALO, 080h
                        CLR       _ACCAHI
                        SBRS      _ACCCHI, 7
                        RJMP      SYSTEM._L1829
                        SUBI      _ACCB, 01h
                        SBCI      _ACCA, 00h
                        SBCI      _ACCALO, 00h
                        SBCI      _ACCAHI, 00h
                        COM       _ACCALO
                        COM       _ACCAHI
                        COM       _ACCA
                        COM       _ACCB
SYSTEM._L1829:
                        PUSH      _ACCA
                        MOVW      _ACCFLO, _ACCCLO
                        ROL       _ACCFLO
                        ROL       _ACCFHI
                        MOV       _ACCFLO, _ACCEHI
                        MOV       _ACCGLO, _ACCELO
                        ROL       _ACCGLO
                        ROL       _ACCFLO
                        MOVW      _ACCGLO, _ACCDLO
                        MOV       _ACCHLO, _ACCELO
                        LDI       _ACCA, 080h
                        OR        _ACCHLO, _ACCA
                        CLR       _ACCHHI
                        MOV       _ACCA, _ACCFHI
                        SUB       _ACCA, _ACCFLO
                        TST       _ACCA
SYSTEM._L1830:
                        BREQ      SYSTEM._L1831
                        LSR       _ACCHLO
                        ROR       _ACCGHI
                        ROR       _ACCGLO
                        DEC       _ACCA
                        RJMP      SYSTEM._L1830
SYSTEM._L1831:
                        MOV       _ACCA, _ACCEHI
                        MOVW      _ACCDLO, _ACCGLO
                        MOVW      _ACCELO, _ACCHLO
                        SBRS      _ACCA, 7
                        RJMP      SYSTEM._L1832
                        SUBI      _ACCDLO, 01h
                        SBCI      _ACCDHI, 00h
                        SBCI      _ACCELO, 00h
                        SBCI      _ACCEHI, 00h
                        COM       _ACCDLO
                        COM       _ACCDHI
                        COM       _ACCEHI
                        COM       _ACCELO
SYSTEM._L1832:
                        POP       _ACCA
                        ADD       _ACCB, _ACCDLO
                        ADC       _ACCA, _ACCDHI
                        ADC       _ACCALO, _ACCELO
                        ADC       _ACCAHI, _ACCEHI
                        SBRS      _ACCAHI, 7
                        RJMP      SYSTEM._L1833
                        ORI       _ACCCHI, 080h
                        SUBI      _ACCB, 01h
                        SBCI      _ACCA, 00h
                        SBCI      _ACCALO, 00h
                        SBCI      _ACCAHI, 00h
                        COM       _ACCALO
                        COM       _ACCAHI
                        COM       _ACCA
                        COM       _ACCB
                        RJMP      SYSTEM._L1834
SYSTEM._L1833:
                        ANDI      _ACCCHI, 07Fh
SYSTEM._L1834:
                        MOV       _ACCFLO, _ACCAHI
                        ANDI      _ACCFLO, 07Fh
                        BREQ      SYSTEM._L1835
                        LSR       _ACCAHI
                        ROR       _ACCALO
                        ROR       _ACCA
                        ROR       _ACCB
                        INC       _ACCFHI
                        BRNE      SYSTEM._L1835
                        LDI       _ACCA, 0FFh
                        LDI       _ACCB, 0FFh
                        LDI       _ACCALO, 0FFh
                        LDI       _ACCAHI, 07Fh
                        SBRC      _ACCCHI, 7
                        ORI       _ACCAHI, 080h
                        SET
                        BLD       Flags, _ERRFLAG
                        RET
SYSTEM._L1835:
                        SBRC      _ACCALO, 7
                        RJMP      SYSTEM._L1836
                        TST       _ACCFHI
                        BREQ      SYSTEM._L1836
                        LSL       _ACCB
                        ROL       _ACCA
                        ROL       _ACCALO
                        ROL       _ACCAHI
                        DEC       _ACCFHI
                        RJMP      SYSTEM._L1835
SYSTEM._L1836:
                        MOV       _ACCAHI, _ACCFHI
                        CLR       _ACCFHI
                        LSR       _ACCAHI
                        TST       _ACCAHI
                        BREQ      SYSTEM._L1838
                        ROR       _ACCFHI
                        ANDI      _ACCALO, 07Fh
                        OR        _ACCALO, _ACCFHI
                        SBRC      _ACCCHI, 7
                        ORI       _ACCAHI, 080h
                        RET
SYSTEM._L1838:
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
                        MOVW      _ACCELO, _ACCB
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
                        MOVW      _ACCB, _ACCELO
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
                        RCALL     SYSTEM.LIntToFloat
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
                        MOVW      _ACCDLO, _ACCB
                        MOVW      _ACCELO, _ACCALO
                        CLT
                        BLD       Flags, _ERRFLAG
                        RCALL     SYSTEM.MulFloat_R
                        DEC       _ACCHHI
                        BRNE      SYSTEM.ACFIN1
SYSTEM.ACFIN3:
                        RET

SYSTEM.ACSkipSpace:
                        TST       _ACCBLO
                        BRNE      SYSTEM._L1839
                        RET
SYSTEM._L1839:
                        RCALL     SYSTEM.Str2FltRdChr
                        CPI       _ACCDLO, 020h
                        BRNE      SYSTEM._L1840
                        ADIW      _ACCCLO, 1
                        DEC       _ACCBLO
                        RJMP      SYSTEM.ACSkipSpace
SYSTEM._L1840:
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
                        BRTC      SYSTEM._L1841
                        RCALL     SYSTEM.ReadEEp8D
                        RET
SYSTEM._L1841:
                        LD        _ACCDLO, Z
                        RET
SYSTEM.Float2Str_C:
                        PUSH      _ACCDHI
SYSTEM._L1843:
                        MOVW      _ACCELO, _ACCB
                        MOVW      _ACCFLO, _ACCALO
                        LDI       _ACCBLO, 07Fh
                        LDI       _ACCBHI, 096h
                        LDI       _ACCCLO, 018h
                        LDI       _ACCCHI, 04Bh
                        SET
                        BLD       Flags, _NEGATIVE
                        CLR       _ACCDHI
                        RCALL     SYSTEM.HighF
                        MOVW      _ACCB, _ACCELO
                        MOVW      _ACCALO, _ACCFLO
                        TST       _ACCDHI
                        BRMI      SYSTEM._L1845
                        BREQ      SYSTEM._L1845
                        LDI       _ACCBLO, 000h
                        LDI       _ACCBHI, 024h
                        LDI       _ACCCLO, 074h
                        LDI       _ACCCHI, 049h
                        CLR       _ACCDHI
                        RCALL     SYSTEM.HighF
                        TST       _ACCDHI
                        BRMI      SYSTEM._L1846
                        BREQ      SYSTEM._L1846
                        POP       _ACCDHI
                        DEC       _ACCDHI
                        PUSH      _ACCDHI
                        LDI       _ACCBLO, 000h
                        LDI       _ACCBHI, 000h
                        LDI       _ACCCLO, 020h
                        LDI       _ACCCHI, 041h
SYSTEM._L1844:
                        MOVW      _ACCDLO, _ACCELO
                        MOVW      _ACCELO, _ACCFLO
                        CLT
                        BLD       Flags, _ERRFLAG
                        RCALL     SYSTEM.MulFloat_R
                        RJMP      SYSTEM._L1843
SYSTEM._L1845:
                        POP       _ACCDHI
                        INC       _ACCDHI
                        PUSH      _ACCDHI
                        LDI       _ACCBLO, 0CDh
                        LDI       _ACCBHI, 0CCh
                        LDI       _ACCCLO, 0CCh
                        LDI       _ACCCHI, 03Dh
                        RJMP      SYSTEM._L1844
SYSTEM._L1846:
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
SYSTEM._L1842:
                        ST        -Y, _ACCELO
                        DEC       _ACCEHI
                        BRNE      SYSTEM._L1842
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
                        BRNE      SYSTEM._L1853
                        LDD       _ACCA, Y+15
                        LDI       _ACCB, DECIMALSEP
                        CPI       _ACCA, 45h
                        BRNE      SYSTEM._L1854
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
SYSTEM._L1854:
                        LDI       _ACCA, 30h
                        RCALL     SYSTEM.Float2Str_P
                        LDI       _ACCA, DECIMALSEP
                        RCALL     SYSTEM.Float2Str_P
                        LDI       _ACCA, 30h
                        RCALL     SYSTEM.Float2Str_P
                        RCALL     SYSTEM.Float2Str_R
                        RJMP      SYSTEM.Float2Str_F
SYSTEM._L1853:
                        LDD       _ACCCHI, Y+15
                        CPI       _ACCCHI, 45h
                        BREQ      SYSTEM._L1855
                        CP        _ACCBLO, _ACCBHI
                        BRCS      SYSTEM._L1855
                        MOV       _ACCBHI, _ACCBLO
                        INC       _ACCBHI
                        STD       Y+14, _ACCBHI
SYSTEM._L1855:
                        CLR       _ACCDHI
                        TST       _ACCAHI
                        BRPL      SYSTEM._L1852
                        ANDI      _ACCAHI, 07Fh
                        PUSH      _ACCA
                        LDI       _ACCA, 2Dh
                        RCALL     SYSTEM.Float2Str_P
                        POP       _ACCA
SYSTEM._L1852:
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
                        BRGE      SYSTEM._L1858
                        CPI       _ACCDHI, -5 AND 0FFh
                        BRLT      SYSTEM._L1858
                        CPI       _ACCDLO, 45h
                        BREQ      SYSTEM._L1858
                        TST       _ACCBLO
                        BRNE      SYSTEM._L1856
                        SUB       _ACCDLO, _ACCDHI
SYSTEM._L1856:
                        MOV       _ACCBLO, _ACCDHI
                        LDI       _ACCDHI, 9
                        SUB       _ACCDHI, _ACCDLO
                        SUB       _ACCDHI, _ACCBLO
                        BRMI      SYSTEM._L1859
                        BRNE      SYSTEM._L1857
                        COM       _ACCDHI
                        STD       Y+15, _ACCDHI
                        RJMP      SYSTEM._L1858
SYSTEM._L1857:
                        DEC       _ACCDHI
                        BREQ      SYSTEM._L1858
                        PUSH      _ACCDHI
                        MOVW      _ACCDLO, _ACCB
                        MOVW      _ACCELO, _ACCALO
                        LDI       _ACCBLO, 000h
                        LDI       _ACCBHI, 000h
                        LDI       _ACCCLO, 020h
                        LDI       _ACCCHI, 041h
                        CLT
                        BLD       Flags, _ERRFLAG
                        RCALL     SYSTEM.MulFloat_R
                        POP       _ACCDHI
                        RJMP      SYSTEM._L1857
SYSTEM._L1859:
SYSTEM._L1858:
                        CLT
                        BLD       Flags, _ERRFLAG
                        RCALL     SYSTEM.AddFloat
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
                        RJMP      SYSTEM._L1848
SYSTEM._L1847:
                        LSR       _ACCFLO
                        ROR       _ACCEHI
                        ROR       _ACCELO
                        DEC       _ACCAHI
SYSTEM._L1848:
                        BRNE      SYSTEM._L1847
                        POP       _ACCBHI
                        LDI       _ACCBLO, 1
                        LDD       _ACCDLO, Y+15
                        CPI       _ACCDLO, 45h
                        BRNE      SYSTEM._L1860
                        SUBI      _ACCBHI, -8 AND 0FFh
                        MOV       _ACCALO, _ACCBHI
                        .BRANCH   6, SYSTEM._L1849
                        BRPL      SYSTEM._L1849
                        NEG       _ACCALO
                        RJMP      SYSTEM._L1849
SYSTEM._L1860:
                        LDI       _ACCALO, 7
                        SUBI      _ACCBHI, -8 AND 0FFh
                        CPI       _ACCBHI, 8
                        BRGE      SYSTEM._L1849
                        CPI       _ACCBHI, -5 AND 0FFh
                        BRLT      SYSTEM._L1849
                        DEC       _ACCBHI
                        MOV       _ACCBLO, _ACCBHI
                        LDI       _ACCBHI, 2
SYSTEM._L1849:
                        SUBI      _ACCBHI, 2
                        TST       _ACCBLO
                        BREQ      SYSTEM._L1863
                        BRPL      SYSTEM._L1850
SYSTEM._L1863:
                        LDI       _ACCA, 30h
                        RCALL     SYSTEM.Float2Str_P
                        LDI       _ACCA, DECIMALSEP
                        RCALL     SYSTEM.Float2Str_P
                        TST       _ACCBLO
                        BREQ      SYSTEM._L1850
SYSTEM._L1862:
                        LDI       _ACCA, 30h
                        RCALL     SYSTEM.Float2Str_P
                        DEC       _ACCALO
                        INC       _ACCBLO
                        BRNE      SYSTEM._L1862
SYSTEM._L1850:
                        LDI       _ACCCLO, SYSTEM.DECDIG AND 0FFh
                        LDI       _ACCCHI, SYSTEM.DECDIG SHRB 8
SYSTEM._L1851:
                        CLR       _ACCAHI
                        LPM       _ACCB, Z+
                        LPM       _ACCA, Z
                        ADIW      _ACCCLO, 1
                        LPM
                        ADIW      _ACCCLO, 02h
SYSTEM._L1869:
                        SUB       _ACCELO, _ACCB
                        SBC       _ACCEHI, _ACCA
                        SBC       _ACCFLO, _ACCGLO
                        BRCS      SYSTEM._L1865
                        INC       _ACCAHI
                        RJMP      SYSTEM._L1869
SYSTEM._L1865:
                        ADD       _ACCELO, _ACCB
                        ADC       _ACCEHI, _ACCA
                        ADC       _ACCFLO, _ACCGLO
                        CPI       _ACCAHI, 10
                        BRLT      SYSTEM._L1870
                        LDI       _ACCAHI, 1
                        INC       _ACCBHI
SYSTEM._L1870:
                        LDI       _ACCA, 30h
                        ADD       _ACCA, _ACCAHI
                        RCALL     SYSTEM.Float2Str_P
                        DEC       _ACCBLO
                        BRNE      SYSTEM._L1866
                        LDI       _ACCA, DECIMALSEP
                        RCALL     SYSTEM.Float2Str_P
SYSTEM._L1866:
                        DEC       _ACCALO
                        BRMI      SYSTEM._L1867
                        BRNE      SYSTEM._L1851
SYSTEM._L1867:
                        RCALL     SYSTEM.Float2Str_R
                        TST       _ACCBHI
                        BREQ      SYSTEM.Float2Str_F
                        LDI       _ACCA, 0FFh
                        STD       Y+15, _ACCA
                        LDI       _ACCA, 45h
                        RCALL     SYSTEM.Float2Str_P
                        TST       _ACCBHI
                        BRPL      SYSTEM._L1868
                        NEG       _ACCBHI
                        LDI       _ACCA, 2Dh
                        RCALL     SYSTEM.Float2Str_P
SYSTEM._L1868:
                        LDI       _ACCB, 10
                        MOV       _ACCA, _ACCBHI
                        RCALL     SYSTEM.DIV8_R
                        TST       _ACCA
                        BREQ      SYSTEM._L1872
                        ORI       _ACCA, 30h
                        RCALL     SYSTEM.Float2Str_P
SYSTEM._L1872:
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
                        BREQ      SYSTEM._L1874
                        TST       _ACCAHI
                        BREQ      SYSTEM._L1874
                        TST       _ACCALO
                        BRNE      SYSTEM._L1873
                        RCALL     SYSTEM.Float2Str_D
                        ST        X, _ACCDHI
                        RJMP      SYSTEM._L1874
SYSTEM._L1873:
                        RCALL     SYSTEM.Float2Str_D
                        LD        _ACCDLO, X
                        SUB       _ACCAHI, _ACCALO
                        DEC       _ACCAHI
                        SUB       _ACCAHI, _ACCDHI
                        BREQ      SYSTEM._L1879
                        BRCS      SYSTEM._L1879
                        LDD       _ACCA, Y+16+3
SYSTEM._L1877:
                        RCALL     SYSTEM.Char2Str
                        DEC       _ACCAHI
                        BRNE      SYSTEM._L1877
SYSTEM._L1879:
                        ST        X, _ACCDHI
                        RCALL     SYSTEM.Float2Str_W
                        LDI       _ACCA, DECIMALSEP
                        RCALL     SYSTEM.Char2Str
                        ADIW      _ACCBLO, 1
                        SUB       _ACCDLO, _ACCDHI
SYSTEM._L1881:
                        DEC       _ACCDLO
                        BREQ      SYSTEM._L1880
                        LD        _ACCA, X+
                        RCALL     SYSTEM.Char2Str
                        DEC       _ACCALO
                        BREQ      SYSTEM._L1878
                        RJMP      SYSTEM._L1881
SYSTEM._L1880:
                        LDI       _ACCA, 030h
                        RCALL     SYSTEM.Char2Str
                        DEC       _ACCALO
                        BRNE      SYSTEM._L1880
                        RJMP      SYSTEM._L1878
SYSTEM._L1874:
                        LD        _ACCB, X
                        SUB       _ACCAHI, _ACCB
                        BREQ      SYSTEM._L1876
                        BRCS      SYSTEM._L1876
                        LDD       _ACCA, Y+16+3
SYSTEM._L1875:
                        RCALL     SYSTEM.Char2Str
                        DEC       _ACCAHI
                        BRNE      SYSTEM._L1875
SYSTEM._L1876:
                        RCALL     SYSTEM.Float2Str_W
SYSTEM._L1878:
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
SYSTEM._L1882:
                        LD        _ACCA, X+
                        RCALL     SYSTEM.Char2Str
                        DEC       _ACCB
                        BRNE      SYSTEM._L1882
                        RET

SYSTEM.Float2Str_D:
                        PUSH      _ACCBLO
                        PUSH      _ACCBHI
                        CLR       _ACCDHI
                        LD        _ACCB, X+
SYSTEM._L1883:
                        LD        _ACCA, X+
                        CPI       _ACCA, DECIMALSEP
                        BREQ      SYSTEM._L1884
                        INC       _ACCDHI
                        DEC       _ACCB
                        BRNE      SYSTEM._L1883
SYSTEM._L1884:
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
SYSTEM._L1885:
                        DEC       _ACCA
                        LD        _ACCB, -Z
                        CPI       _ACCB, 030h
                        BREQ      SYSTEM._L1885
                        CPI       _ACCB, DECIMALSEP
                        BREQ      SYSTEM._L1886
                        INC       _ACCA
SYSTEM._L1886:
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


SYSTEM.SHR8_R:
                        TST       _ACCALO
                        BREQ      SYSTEM._L1888
                        CPI       _ACCALO, 08h
                        BRCS      SYSTEM._L1887
                        CLR       _ACCA
                        RET
SYSTEM._L1887:
                        LSR       _ACCA
                        DEC       _ACCALO
                        BRNE      SYSTEM._L1887
SYSTEM._L1888:
                        RET


SYSTEM.DIV8_R:
                        CLR       _ACCAHI
                        LDI       _ACCALO, 9
SYSTEM._L1889:
                        ROL       _ACCA
                        DEC       _ACCALO
                        BRNE      SYSTEM._L1890
                        MOV       _ACCB, _ACCAHI
                        RET
SYSTEM._L1890:
                        ROL       _ACCAHI
                        SUB       _ACCAHI, _ACCB
                        BRCC      SYSTEM._L1891
                        ADD       _ACCAHI, _ACCB
                        CLC
                        RJMP      SYSTEM._L1889
SYSTEM._L1891:
                        SEC
                        RJMP      SYSTEM._L1889


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
                        BRTC      SYSTEM._L1893
                        MOV       _ACCDHI, _ACCBHI
                        MOV       _ACCDLO, _ACCAHI
                        EOR       _ACCDLO, _ACCBHI
                        CLT
                        SBRS      _ACCDLO, 7
                        BLD       Flags, _SIGN
                        SBRS      _ACCAHI, 7
                        RJMP      SYSTEM._L1895
                        NEG       _ACCALO
                        BRNE      SYSTEM._L1896
                        DEC       _ACCAHI
SYSTEM._L1896:
                        COM       _ACCAHI
SYSTEM._L1895:
                        SBRS      _ACCBHI, 7
                        RJMP      SYSTEM._L1893
                        NEG       _ACCBLO
                        BRNE      SYSTEM._L1897
                        DEC       _ACCBHI
SYSTEM._L1897:
                        COM       _ACCBHI
SYSTEM._L1893:
                        CLR       _ACCCLO
                        SUB       _ACCCHI, _ACCCHI
                        LDI       _ACCA, 17
SYSTEM._L1898:
                        ROL       _ACCBLO
                        ROL       _ACCBHI
                        DEC       _ACCA
                        BRNE      SYSTEM._L1899
                        MOVW      _ACCB, _ACCBLO
                        BST       Flags, _SIGN
                        BRTC      SYSTEM._L1894
                        NEG       _ACCB
                        BRNE      SYSTEM._L1901
                        DEC       _ACCA
SYSTEM._L1901:
                        COM       _ACCA
SYSTEM._L1894:
                        RET
SYSTEM._L1899:
                        ROL       _ACCCLO
                        ROL       _ACCCHI
                        SUB       _ACCCLO, _ACCALO
                        SBC       _ACCCHI, _ACCAHI
                        BRCC      SYSTEM._L1900
                        ADD       _ACCCLO, _ACCALO
                        ADC       _ACCCHI, _ACCAHI
                        CLC
                        RJMP      SYSTEM._L1898
SYSTEM._L1900:
                        SEC
                        RJMP      SYSTEM._L1898


SYSTEM.MUL32_R:
                        MOVW      _ACCBLO, _ACCB
                        MOVW      _ACCCLO, _ACCALO
                        BST       Flags, _SIGN
                        BRTC      SYSTEM._L1903
                        MOV       _ACCFLO, _ACCCHI
                        EOR       _ACCFLO, _ACCEHI
                        CLT
                        SBRS      _ACCFLO, 7
                        BLD       Flags, _SIGN
                        SBRS      _ACCCHI, 7
                        RJMP      SYSTEM._L1905
                        COM       _ACCBLO
                        COM       _ACCBHI
                        COM       _ACCCLO
                        COM       _ACCCHI
                        SUBI      _ACCBLO, 0FFh
                        SBCI      _ACCBHI, 0FFh
                        SBCI      _ACCCLO, 0FFh
                        SBCI      _ACCCHI, 0FFh
SYSTEM._L1905:
                        SBRS      _ACCEHI, 7
                        RJMP      SYSTEM._L1903
                        COM       _ACCDLO
                        COM       _ACCDHI
                        COM       _ACCELO
                        COM       _ACCEHI
                        SUBI      _ACCDLO, 0FFh
                        SBCI      _ACCDHI, 0FFh
                        SBCI      _ACCELO, 0FFh
                        SBCI      _ACCEHI, 0FFh
SYSTEM._L1903:
                        CLR       _ACCFHI
                        CLR       _ACCFLO
                        CLR       _ACCGHI
                        CLR       _ACCGLO
                        LDI       _ACCA, 32
                        LSR       _ACCEHI
                        ROR       _ACCELO
                        ROR       _ACCDHI
                        ROR       _ACCDLO
SYSTEM._L1907:
                        BRCC      SYSTEM._L1906
                        ADD       _ACCFLO, _ACCBLO
                        ADC       _ACCFHI, _ACCBHI
                        ADC       _ACCGLO, _ACCCLO
                        ADC       _ACCGHI, _ACCCHI
SYSTEM._L1906:
                        ROR       _ACCGHI
                        ROR       _ACCGLO
                        ROR       _ACCFHI
                        ROR       _ACCFLO
                        ROR       _ACCEHI
                        ROR       _ACCELO
                        ROR       _ACCDHI
                        ROR       _ACCDLO
                        DEC       _ACCA
                        BRNE      SYSTEM._L1907
                        MOVW      _ACCB, _ACCDLO
                        MOVW      _ACCALO, _ACCELO
                        BST       Flags, _SIGN
                        BRTC      SYSTEM._L1904
                        SUBI      _ACCB, 01h
                        SBCI      _ACCA, 00h
                        SBCI      _ACCALO, 00h
                        SBCI      _ACCAHI, 00h
                        COM       _ACCALO
                        COM       _ACCAHI
                        COM       _ACCA
                        COM       _ACCB
SYSTEM._L1904:
                        RET



SYSTEM.SHR16:
                        TST       _ACCALO
                        BREQ      SYSTEM._L1909
                        CPI       _ACCALO, 10h
                        BRCS      SYSTEM._L1908
                        CLR       _ACCA
                        CLR       _ACCB
                        RET
SYSTEM._L1908:
                        LSR       _ACCA
                        ROR       _ACCB
                        DEC       _ACCALO
                        BRNE      SYSTEM._L1908
SYSTEM._L1909:
                        RET


SYSTEM.SHL16:
                        TST       _ACCALO
                        BREQ      SYSTEM._L1911
                        CPI       _ACCALO, 10h
                        BRCS      SYSTEM._L1910
                        CLR       _ACCA
                        CLR       _ACCB
                        RET
SYSTEM._L1910:
                        LSL       _ACCB
                        ROL       _ACCA
                        DEC       _ACCALO
                        BRNE      SYSTEM._L1910
SYSTEM._L1911:
                        RET

SYSTEM.SetSysTimer:
                        CLI
                        ST        Z+, _ACCB
                        ST        Z+, _ACCA
                        MOV       _ACCBLO, _SYSTFLAGS
                        TST       _ACCA
                        BRNE       SYSTEM._L1912
                        TST       _ACCB
                        BRNE       SYSTEM._L1912
                        COM       _ACCBHI
                        AND       _ACCBLO, _ACCBHI
                        MOV       _SYSTFLAGS, _ACCBLO
                        SBRC      Flags, IntFlag
                        SEI
                        RET
SYSTEM._L1912:
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
                        .Byte     001h
                        .Byte     000h
                        .Byte     000h
                        .Byte     000h

                        ; ============ String-constant tables ============
                        .SYM      EDL.Vers1Str
EDL.Vers1Str:
                        .BYTE     29
                        .ASCII    "1.784 [EDL by CM/c't 09/2008]"

                        .SYM      EDL.Vers3Str
EDL.Vers3Str:
                        .BYTE     8
                        .ASCII    "EDL 1.78"

                        .SYM      EDL.AdrStr
EDL.AdrStr:
                        .BYTE     4
                        .ASCII    "Adr "

                        .SYM      EDL.EEnotProgrammedStr
EDL.EEnotProgrammedStr:
                        .BYTE     14
                        .ASCII    "EEPROM EMPTY! "

                        .SYM      EDL.AdjustStr
EDL.AdjustStr:
                        .BYTE     8
                        .ASCII    "Adj R44 "

$St_String6:
                        .BYTE     5
                        .ASCII    "0.000"

$St_String7:
                        .BYTE     2
                        .ASCII    " W"

$St_String8:
                        .BYTE     2
                        .ASCII    "Ah"

$St_String9:
                        .BYTE     3
                        .ASCII    "mAh"

$St_String10:
                        .BYTE     3
                        .ASCII    "Wh "

$St_String11:
                        .BYTE     4
                        .ASCII    "mWh "

$St_String12:
                        .BYTE     5
                        .ASCII    "inval"

$St_String13:
                        .BYTE     8
                        .ASCII    "OVRTEMP "

$St_String14:
                        .BYTE     8
                        .ASCII    "OVRVOLT "

$St_String15:
                        .BYTE     8
                        .ASCII    "OVRPOWER"

$St_String16:
                        .BYTE     8
                        .ASCII    "LOWVOLT "

$St_String17:
                        .BYTE     0


                        ; ============ array-constant tables ============
                        .SYM      EDL.FaultStrArr
EDL.FaultStrArr:
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

                        .BYTE     9
                        .ASCII    "[LOWVOLT]"
                        .BYTE     00h


                        .SYM      EDL.ErrStrArr
EDL.ErrStrArr:
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


                        .SYM      EDL.MenuStrArr
EDL.MenuStrArr:
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
                        .ASCII    "Mode    "

                        .BYTE     8
                        .ASCII    "T on  ms"

                        .BYTE     8
                        .ASCII    "T off ms"

                        .BYTE     8
                        .ASCII    "I off % "

                        .BYTE     8
                        .ASCII    "Temp C  "

                        .BYTE     8
                        .ASCII    "IntRes  "

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
                        .ASCII    "Pwr/Curr"


                        .SYM      EDL.ModeStrArr
EDL.ModeStrArr:
                        .BYTE     3
                        .ASCII    "off"
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h

                        .BYTE     7
                        .ASCII    "I HiV  "
                        .BYTE     00h

                        .BYTE     7
                        .ASCII    "I LoV  "
                        .BYTE     00h

                        .BYTE     7
                        .ASCII    "R HiV  "
                        .BYTE     00h

                        .BYTE     7
                        .ASCII    "R LoV  "
                        .BYTE     00h

                        .BYTE     7
                        .ASCII    "P HiV  "
                        .BYTE     00h

                        .BYTE     7
                        .ASCII    "P LoV  "
                        .BYTE     00h


                        .SYM      EDL.CmdStrArr
EDL.CmdStrArr:
                        .BYTE     3
                        .ASCII    "STR"

                        .BYTE     3
                        .ASCII    "IDN"

                        .BYTE     3
                        .ASCII    "CHN"

                        .BYTE     3
                        .ASCII    "VAL"

                        .BYTE     3
                        .ASCII    "ENA"

                        .BYTE     3
                        .ASCII    "DCA"

                        .BYTE     3
                        .ASCII    "DCP"

                        .BYTE     3
                        .ASCII    "DCV"

                        .BYTE     3
                        .ASCII    "DCR"

                        .BYTE     3
                        .ASCII    "MAH"

                        .BYTE     3
                        .ASCII    "MWH"

                        .BYTE     3
                        .ASCII    "MSV"

                        .BYTE     3
                        .ASCII    "MSA"

                        .BYTE     3
                        .ASCII    "RNG"

                        .BYTE     3
                        .ASCII    "MSW"

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
                        .ASCII    "ALL"

                        .BYTE     3
                        .ASCII    "OFS"

                        .BYTE     3
                        .ASCII    "SCL"

                        .BYTE     3
                        .ASCII    "OPT"

                        .BYTE     3
                        .ASCII    "TMP"

                        .BYTE     3
                        .ASCII    "TRM"

                        .BYTE     3
                        .ASCII    "WEN"

                        .BYTE     3
                        .ASCII    "ERC"

                        .BYTE     3
                        .ASCII    "SBD"

                        .BYTE     3
                        .ASCII    "NOP"


                        .SYM      EDL.Cmd2SubChArr
EDL.Cmd2SubChArr:
                        .BYTE     0FFh
                        .BYTE     0FEh
                        .BYTE     0FDh
                        .BYTE     000h
                        .BYTE     000h
                        .BYTE     001h
                        .BYTE     003h
                        .BYTE     004h
                        .BYTE     005h
                        .BYTE     007h
                        .BYTE     008h
                        .BYTE     00Ah
                        .BYTE     00Bh
                        .BYTE     013h
                        .BYTE     012h
                        .BYTE     015h
                        .BYTE     01Bh
                        .BYTE     01Ch
                        .BYTE     01Dh
                        .BYTE     032h
                        .BYTE     050h
                        .BYTE     063h
                        .BYTE     064h
                        .BYTE     0C8h
                        .BYTE     096h
                        .BYTE     0E9h
                        .BYTE     0F0h
                        .BYTE     0FAh
                        .BYTE     0FBh
                        .BYTE     0FCh
                        .BYTE     000h

                        .SYM      EDL.IncrAccArray
EDL.IncrAccArray:
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
                        .WORD     02710h
                        .WORD     02710h


                        ; ============ Fixed addr String-constant tables ============

                        ; ============ fixed addr array-constant tables ============

                        ; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                        ; Reset and Interrupt vectors
                        ; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


                        .ENDCODE
                        .ORG       000000h, VECTTAB
                        .VECTTAB
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

                        .END

                        ; ============ End of Program ============


                        ; System uses registers
                        ; from bottom     = 00000h
                        ; upto            = 00008h
                        ; and
                        ; from            = 00010h
                        ; upto            = 0001Fh
                        ;
                        ; Stackframe at   = ...00482h


                        ; ===== Current top of User Vars in Data is 0000Ch =====

                        ; ===== Current top of User Vars in IData is 00595h =====

                        ; ===== Current top of User Vars in EEprom is 000B1h =====


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

                        ; Pascal Statements : 1536
                        ; Assembler Lines   : 47348
                        ; Optimizer removed : 882 lines = 1764Bytes

                        ; >> real SysTick (exact): 1.000 msec <<

;  Linker removed the following functions and procedures
;
;  Module/Unit             Function/Procedure
;  ------------------------------------------
;
                                  
                        ; Merlin Optimiser Version 3.0.3.17 saved 8390 bytes.
                        ; Original size was 37546 so % saved = 22%
                        ; Elapsed Time (hh:mm:ss) : 00:00:04
