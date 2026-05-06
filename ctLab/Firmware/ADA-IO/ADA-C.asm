
                        .FILE     H:\PROJAVR\ADA-C\ADA-C.pas

                        ; Compiled by E-LAB AVRco PASCAL Compiler Rev 4.89.00
                        ; Version     : Profi
                        ;
                        ; Licenced to : Redaktion CT
                        ;
                        ; (c)E-LAB Computers, Grombacherstr. 27  e-mail info@e-lab.de
                        ; D-74906 Bad Rappenau  Tel. 07268/9124-0 Fax. 07268/9124-24
                        ; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                        ; Source File : ADA-C.pas
                        ; Compiled    : 18. Mai 2010  17:11:31
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
COMPILEDAY              .EQU    012h            ; const 
COMPILEHOUR             .EQU    011h            ; const 
COMPILEMINUTE           .EQU    00Bh            ; const 
PROJECTBUILD            .EQU    085h            ; const 
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
SYSTICK                 .EQU    002h            ; const 
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
LCD_m1                  .EQU    000h            ; const 
LCD_m2                  .EQU    001h            ; const 
LCD_m3                  .EQU    002h            ; const 
LCD_m4                  .EQU    003h            ; const 
LCD_m5                  .EQU    004h            ; const 
LCD_m6                  .EQU    005h            ; const 
LCD_m7                  .EQU    006h            ; const 
LCD_m8                  .EQU    007h            ; const 
_LCDM_PORT              .EQU    060h            ; var iData  byte
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
TWI_BR100               .EQU    048h            ; const 
TWI_BR400               .EQU    00Ch            ; const 
SysTickTime             .EQU    061h            ; var iData  byte
_INCRSTATE4             .EQU    278h            ; var iData  byte
_INCRCOUNT4_0           .EQU    279h            ; var iData  longint
_INCRCOUNT4_D0          .EQU    27Dh            ; var iData  longint
_TWI_TO                 .EQU    281h            ; var iData  byte
TWI_DevLock             .EQU    282h            ; var iData  DeviceLock
EEPROM                  .EQU    000h            ; var EEprom array



                        .RESET     000000h
                        .ORG       000000h, CODE_START
                        .STARTCODE 000054h

                        .UNIT     ADAC

                        .XDATASTART -1


                        ; ============ user definitions module: ADAC ============

ADAC.DDRBinit           .EQU    05Bh            ; const byte     91
ADAC.PortBinit          .EQU    0BFh            ; const byte     191
ADAC.DDRCinit           .EQU    0FCh            ; const byte     252
ADAC.PortCinit          .EQU    003h            ; const byte     3
ADAC.DDRDinit           .EQU    00Ch            ; const byte     12
ADAC.PortDinit          .EQU    0FCh            ; const byte     252
ADAC.LEDOutPort         .EQU    032h            ; const byte     50
ADAC.b_SCLK             .EQU    000h            ; const byte     0
ADAC.b_SDATAOUT         .EQU    001h            ; const byte     1
ADAC.b_TRIG             .EQU    002h            ; const byte     2
ADAC.b_STRDAC           .EQU    003h            ; const byte     3
ADAC.b_STRAD16          .EQU    004h            ; const byte     4
ADAC.b_SDATAIN1         .EQU    005h            ; const byte     5
ADAC.b_STR_SR           .EQU    006h            ; const byte     6
ADAC.b_SENSE            .EQU    007h            ; const byte     7
ADAC.ControlBitPort     .EQU    038h            ; const byte     56
ADAC.ControlBitPin      .EQU    036h            ; const byte     54
ADAC.b_STRDAMUX         .EQU    005h            ; const byte     5
;Vers1Str                .EQU    '1.742 [ADA by CM'; const String
;Vers3Str                .EQU    'ADA 1.74'; const String
;AdrStr                  .EQU    'Adr '; const String
;CardsStr                .EQU    'IO-Cards'; const String
;ValueStr                .EQU    'Value '; const String
;EEnotProgrammedStr      .EQU    'EEPROM EMPTY! '; const String
;ErrStrArr               .EQU    ; const Array
;DAC12str                .EQU    'DA12 '; const String
;DAC16str                .EQU    'DA16 '; const String
;ADC16str                .EQU    'AD16 '; const String
;LCDstr                  .EQU    'LCD '; const String
;IO816str                .EQU    'IO32 '; const String
;EggStr                  .EQU    '28.5 [Michaela, '; const String
ADAC.ErrSubCh           .EQU    0FFh            ; const byte     255
;CmdStrArr               .EQU    ; const Array
;Cmd2SubChArr            .EQU    ; const Array
ADAC.high               .EQU    0FFh            ; const boolean  true
ADAC.low                .EQU    000h            ; const boolean  false
ADAC.OffsetArray        .EQU    00000h          ; var EEprom array
                        .SYM      OffsetArray, 00000h, 04034h, 3
ADAC.ScaleArray         .EQU    00038h          ; var EEprom array
                        .SYM      ScaleArray, 00038h, 04036h, 3
ADAC.DirInitArray       .EQU    000B0h          ; var EEprom array
                        .SYM      DirInitArray, 000B0h, 0403Dh, 3
ADAC.TrigMaskArray      .EQU    000B8h          ; var EEprom array
                        .SYM      TrigMaskArray, 000B8h, 0403Dh, 3
ADAC.TrigLevel          .EQU    000BCh          ; var EEprom byte
                        .SYM      TrigLevel, 000BCh, 0400Dh, 3
ADAC.TrigTimerValue     .EQU    000BDh          ; var EEprom word
                        .SYM      TrigTimerValue, 000BDh, 0400Eh, 3
ADAC.InitIntegrateAD16  .EQU    000BFh          ; var EEprom boolean
                        .SYM      InitIntegrateAD16, 000BFh, 04003h, 3
ADAC.ExtRef             .EQU    000C0h          ; var EEprom byte
                        .SYM      ExtRef, 000C0h, 0400Dh, 3
ADAC.IncRastDef         .EQU    000C1h          ; var EEprom integer
                        .SYM      IncRastDef, 000C1h, 04004h, 3
ADAC.EESerBaudReg       .EQU    000C3h          ; var EEprom byte
                        .SYM      EESerBaudReg, 000C3h, 0400Dh, 3
ADAC.ParamTextArray     .EQU    000C4h          ; var EEprom array
                        .SYM      ParamTextArray, 000C4h, 04030h, 3
ADAC.EEinitialised      .EQU    0021Ah          ; var EEprom word
                        .SYM      EEinitialised, 0021Ah, 0400Eh, 3
ADAC.PortInitArray      .EQU    0021Ch          ; var EEprom array
                        .SYM      PortInitArray, 0021Ch, 0403Dh, 3
                        .SYM      i, 00009h, 0000Dh, 3
ADAC.i                  .EQU    009h            ; var Data   byte
                        .SYM      j, 0000Ah, 0000Dh, 3
ADAC.j                  .EQU    00Ah            ; var Data   byte
                        .SYM      MuxCh, 0000Bh, 0000Dh, 3
ADAC.MuxCh              .EQU    00Bh            ; var Data   byte
                        .SYM      k, 0000Ch, 0000Dh, 3
ADAC.k                  .EQU    00Ch            ; var Data   byte
                        .SYM      aWord, 0000Dh, 0000Eh, 3
ADAC.aWord              .EQU    00Dh            ; var Data   word
                        .SYM      ButtonTemp, 00283h, 0000Dh, 3
ADAC.ButtonTemp         .EQU    283h            ; var iData  byte
                        .SYM      IOPin, 00380h, 00000h, 3
ADAC.IOPin              .EQU    380h            ; var I2Cexp byte
                        .SYM      IOPort, 00381h, 00000h, 3
ADAC.IOPort             .EQU    381h            ; var I2Cexp byte
                        .SYM      IODDR, 00383h, 00000h, 3
ADAC.IODDR              .EQU    383h            ; var I2Cexp byte
                        .SYM      IO0Pin, 00380h, 00000h, 3
ADAC.IO0Pin             .EQU    380h            ; var I2Cexp byte
                        .SYM      IO1Pin, 00390h, 00000h, 3
ADAC.IO1Pin             .EQU    390h            ; var I2Cexp byte
                        .SYM      IO2Pin, 003A0h, 00000h, 3
ADAC.IO2Pin             .EQU    3A0h            ; var I2Cexp byte
                        .SYM      IO3Pin, 003B0h, 00000h, 3
ADAC.IO3Pin             .EQU    3B0h            ; var I2Cexp byte
                        .SYM      IO4Pin, 003C0h, 00000h, 3
ADAC.IO4Pin             .EQU    3C0h            ; var I2Cexp byte
                        .SYM      IO5Pin, 003D0h, 00000h, 3
ADAC.IO5Pin             .EQU    3D0h            ; var I2Cexp byte
                        .SYM      IO6Pin, 003E0h, 00000h, 3
ADAC.IO6Pin             .EQU    3E0h            ; var I2Cexp byte
                        .SYM      IO7Pin, 003F0h, 00000h, 3
ADAC.IO7Pin             .EQU    3F0h            ; var I2Cexp byte
                        .SYM      IO0Port, 00381h, 00000h, 3
ADAC.IO0Port            .EQU    381h            ; var I2Cexp byte
                        .SYM      IO1Port, 00391h, 00000h, 3
ADAC.IO1Port            .EQU    391h            ; var I2Cexp byte
                        .SYM      IO2Port, 003A1h, 00000h, 3
ADAC.IO2Port            .EQU    3A1h            ; var I2Cexp byte
                        .SYM      IO3Port, 003B1h, 00000h, 3
ADAC.IO3Port            .EQU    3B1h            ; var I2Cexp byte
                        .SYM      IO4Port, 003C1h, 00000h, 3
ADAC.IO4Port            .EQU    3C1h            ; var I2Cexp byte
                        .SYM      IO6Port, 003E1h, 00000h, 3
ADAC.IO6Port            .EQU    3E1h            ; var I2Cexp byte
                        .SYM      IO5Port, 003D1h, 00000h, 3
ADAC.IO5Port            .EQU    3D1h            ; var I2Cexp byte
                        .SYM      IO7Port, 003F1h, 00000h, 3
ADAC.IO7Port            .EQU    3F1h            ; var I2Cexp byte
                        .SYM      IO0DDR, 00383h, 00000h, 3
ADAC.IO0DDR             .EQU    383h            ; var I2Cexp byte
                        .SYM      IO1DDR, 00393h, 00000h, 3
ADAC.IO1DDR             .EQU    393h            ; var I2Cexp byte
                        .SYM      IO2DDR, 003A3h, 00000h, 3
ADAC.IO2DDR             .EQU    3A3h            ; var I2Cexp byte
                        .SYM      IO3DDR, 003B3h, 00000h, 3
ADAC.IO3DDR             .EQU    3B3h            ; var I2Cexp byte
                        .SYM      IO4DDR, 003C3h, 00000h, 3
ADAC.IO4DDR             .EQU    3C3h            ; var I2Cexp byte
                        .SYM      IO5DDR, 003D3h, 00000h, 3
ADAC.IO5DDR             .EQU    3D3h            ; var I2Cexp byte
                        .SYM      IO6DDR, 003E3h, 00000h, 3
ADAC.IO6DDR             .EQU    3E3h            ; var I2Cexp byte
                        .SYM      IO7DDR, 003F3h, 00000h, 3
ADAC.IO7DDR             .EQU    3F3h            ; var I2Cexp byte
                        .SYM      PortArray, 00284h, 0003Dh, 3
ADAC.PortArray          .EQU    284h            ; var iData  array
                        .SYM      PortSR0, 00284h, 0000Dh, 3
ADAC.PortSR0            .EQU    284h            ; var iData  byte
                        .SYM      PortSR1, 00285h, 0000Dh, 3
ADAC.PortSR1            .EQU    285h            ; var iData  byte
                        .SYM      PortSR2, 00286h, 0000Dh, 3
ADAC.PortSR2            .EQU    286h            ; var iData  byte
                        .SYM      PortSR3, 00287h, 0000Dh, 3
ADAC.PortSR3            .EQU    287h            ; var iData  byte
                        .SYM      OmniFlag, 0028Ch, 00003h, 3
ADAC.OmniFlag           .EQU    28Ch            ; var iData  boolean
                        .SYM      verbose, 0028Dh, 00003h, 3
ADAC.verbose            .EQU    28Dh            ; var iData  boolean
                        .SYM      AD10flag, 0028Eh, 00003h, 3
ADAC.AD10flag           .EQU    28Eh            ; var iData  boolean
                        .SYM      AD16flag, 0028Fh, 00003h, 3
ADAC.AD16flag           .EQU    28Fh            ; var iData  boolean
                        .SYM      DAC12present, 00290h, 00003h, 3
ADAC.DAC12present       .EQU    290h            ; var iData  boolean
                        .SYM      DAC16present, 00291h, 00003h, 3
ADAC.DAC16present       .EQU    291h            ; var iData  boolean
                        .SYM      DAC714present, 00292h, 00003h, 3
ADAC.DAC714present      .EQU    292h            ; var iData  boolean
                        .SYM      ADC16present, 00293h, 00003h, 3
ADAC.ADC16present       .EQU    293h            ; var iData  boolean
                        .SYM      ADC24_1present, 00294h, 00003h, 3
ADAC.ADC24_1present     .EQU    294h            ; var iData  boolean
                        .SYM      ADC24_2present, 00295h, 00003h, 3
ADAC.ADC24_2present     .EQU    295h            ; var iData  boolean
                        .SYM      LCDpresent, 00296h, 00003h, 3
ADAC.LCDpresent         .EQU    296h            ; var iData  boolean
                        .SYM      IOpresent, 00297h, 00003h, 3
ADAC.IOpresent          .EQU    297h            ; var iData  boolean
                        .SYM      aBool, 00298h, 00003h, 3
ADAC.aBool              .EQU    298h            ; var iData  boolean
                        .SYM      x, 00299h, 0000Dh, 3
ADAC.x                  .EQU    299h            ; var iData  byte
                        .SYM      y, 0029Ah, 0000Dh, 3
ADAC.y                  .EQU    29Ah            ; var iData  byte
                        .SYM      CurrentCh, 0029Bh, 0000Dh, 3
ADAC.CurrentCh          .EQU    29Bh            ; var iData  byte
                        .SYM      DACValueArray, 0029Ch, 00036h, 3
ADAC.DACValueArray      .EQU    29Ch            ; var iData  array
                        .SYM      DACrawArray, 002BCh, 0003Eh, 3
ADAC.DACrawArray        .EQU    2BCh            ; var iData  array
                        .SYM      ADCrawArray, 002CCh, 00034h, 3
ADAC.ADCrawArray        .EQU    2CCh            ; var iData  array
                        .SYM      DACtemp, 002DCh, 0000Eh, 3
ADAC.DACtemp            .EQU    2DCh            ; var iData  word
                        .SYM      ADraw, 002DEh, 00004h, 3
ADAC.ADraw              .EQU    2DEh            ; var iData  integer
                        .SYM      AD16long, 002E0h, 00005h, 3
ADAC.AD16long           .EQU    2E0h            ; var iData  longint
                        .SYM      integrateAD16, 002E4h, 00003h, 3
ADAC.integrateAD16      .EQU    2E4h            ; var iData  boolean
                        .SYM      BaseScaleAD10, 002E5h, 00006h, 3
ADAC.BaseScaleAD10      .EQU    2E5h            ; var iData  Float
                        .SYM      BaseScaleAD16, 002E9h, 00006h, 3
ADAC.BaseScaleAD16      .EQU    2E9h            ; var iData  Float
                        .SYM      BaseScaleDA12, 002EDh, 00006h, 3
ADAC.BaseScaleDA12      .EQU    2EDh            ; var iData  Float
                        .SYM      BaseScaleDA16, 002F1h, 00006h, 3
ADAC.BaseScaleDA16      .EQU    2F1h            ; var iData  Float
                        .SYM      I2CslaveAdr, 002F5h, 0000Dh, 3
ADAC.I2CslaveAdr        .EQU    2F5h            ; var iData  byte
ADAC.TrigTimer          .EQU    2F6h            ; var iData  word
                        .SYM      TrigTimer, 002F6h, 0000Eh, 3
ADAC.DisplayTimer       .EQU    2F8h            ; var iData  word
                        .SYM      DisplayTimer, 002F8h, 0000Eh, 3
ADAC.IncrTimer          .EQU    2FAh            ; var iData  byte
                        .SYM      IncrTimer, 002FAh, 0000Dh, 3
ADAC.ActivityTimer      .EQU    2FBh            ; var iData  byte
                        .SYM      ActivityTimer, 002FBh, 0000Dh, 3
ADAC.TrigLEDtimer       .EQU    2FCh            ; var iData  byte
                        .SYM      TrigLEDtimer, 002FCh, 0000Dh, 3
                        .SYM      Trigger, 002FDh, 00003h, 3
ADAC.Trigger            .EQU    2FDh            ; var iData  boolean
                        .SYM      TrigMask, 002FEh, 0000Dh, 3
ADAC.TrigMask           .EQU    2FEh            ; var iData  byte
ADAC.SerInpStr          .EQU    2FFh            ; var iData  string
                        .SYM      SerInpStr, 002FFh, 0303Ch, 3
                        .SYM      SerInpPtr, 0033Fh, 0000Dh, 3
ADAC.SerInpPtr          .EQU    33Fh            ; var iData  byte
ADAC.ParamStr           .EQU    340h            ; var iData  string
                        .SYM      ParamStr, 00340h, 0303Ch, 3
ADAC.ParamTextStr       .EQU    369h            ; var iData  string
                        .SYM      ParamTextStr, 00369h, 0303Ch, 3
                        .SYM      Param, 00372h, 00006h, 3
ADAC.Param              .EQU    372h            ; var iData  Float
                        .SYM      ParamInt, 00376h, 00004h, 3
ADAC.ParamInt           .EQU    376h            ; var iData  integer
                        .SYM      ParamByte, 00378h, 0000Dh, 3
ADAC.ParamByte          .EQU    378h            ; var iData  byte
                        .SYM      CmdWhich, 00379h, 0000Ah, 3
ADAC.CmdWhich           .EQU    379h            ; var iData  enum
ADAC.CmdStr             .EQU    37Ah            ; var iData  string
                        .SYM      CmdStr, 0037Ah, 0303Ch, 3
                        .SYM      SlaveCh, 0037Eh, 0000Dh, 3
ADAC.SlaveCh            .EQU    37Eh            ; var iData  byte
                        .SYM      SubCh, 0037Fh, 0000Dh, 3
ADAC.SubCh              .EQU    37Fh            ; var iData  byte
                        .SYM      Modify, 00380h, 0000Dh, 3
ADAC.Modify             .EQU    380h            ; var iData  byte
                        .SYM      IncrValue, 00381h, 00005h, 3
ADAC.IncrValue          .EQU    381h            ; var iData  longint
                        .SYM      OldIncrValue, 00385h, 00005h, 3
ADAC.OldIncrValue       .EQU    385h            ; var iData  longint
                        .SYM      IncrFine, 00389h, 00003h, 3
ADAC.IncrFine           .EQU    389h            ; var iData  boolean
                        .SYM      FirstTurn, 0038Ah, 00003h, 3
ADAC.FirstTurn          .EQU    38Ah            ; var iData  boolean
                        .SYM      IncrAccFloat, 0038Bh, 00006h, 3
ADAC.IncrAccFloat       .EQU    38Bh            ; var iData  Float
                        .SYM      IncrDiff, 0038Fh, 00004h, 3
ADAC.IncrDiff           .EQU    38Fh            ; var iData  integer
                        .SYM      IncrAccInt10, 00391h, 00004h, 3
ADAC.IncrAccInt10       .EQU    391h            ; var iData  integer
                        .SYM      IncrDiffByte, 00393h, 0000Dh, 3
ADAC.IncrDiffByte       .EQU    393h            ; var iData  byte
                        .SYM      AutoRepeat, 00394h, 0000Dh, 3
ADAC.AutoRepeat         .EQU    394h            ; var iData  byte
                        .SYM      IncRast, 00395h, 00004h, 3
ADAC.IncRast            .EQU    395h            ; var iData  integer
                        .SYM      digits, 00397h, 0000Dh, 3
ADAC.digits             .EQU    397h            ; var iData  byte
                        .SYM      nachkomma, 00398h, 0000Dh, 3
ADAC.nachkomma          .EQU    398h            ; var iData  byte
                        .SYM      ChangedFlag, 00399h, 00003h, 3
ADAC.ChangedFlag        .EQU    399h            ; var iData  boolean
                        .SYM      Status, 0039Ah, 0000Dh, 3
ADAC.Status             .EQU    39Ah            ; var iData  byte
                        .SYM      ErrCount, 0039Bh, 00004h, 3
ADAC.ErrCount           .EQU    39Bh            ; var iData  integer
                        .SYM      ErrFlag, 0039Dh, 00003h, 3
ADAC.ErrFlag            .EQU    39Dh            ; var iData  boolean

                        .FILE     ADA-C-HW.pas
                        .FUNC     ShiftOut1257, 00003h, 00020h
ADAC.ShiftOut1257:
                        .RETURNS   0
                        .BLOCK    5
                        .ASM
                        .LINE     7
                        cbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
                        .LINE     8
                        cbi  ADAC.ControlBitPort, ADAC.b_SCLK
                        .LINE     9
                        sbi  ADAC.ControlBitPort, ADAC.b_STRDAC
                        .LINE     11
                        LDS _ACCA, ADAC.DACtemp+1 ; MSB linksbündig
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
                        ADAC.1257loop1:
                        .LINE     19
                        sbrc _ACCA,7 // Bit high?
                        .LINE     20
                        sbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
                        .LINE     21
                        sbi  ADAC.ControlBitPort, ADAC.b_SCLK
                        .LINE     22
                        LSL  _ACCA
                        .LINE     23
                        nop
                        .LINE     24
                        cbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
                        .LINE     25
                        cbi  ADAC.ControlBitPort, ADAC.b_SCLK
                        .LINE     26
                        dec _ACCB
                        .LINE     27
                        BRNE  ADAC.1257loop1
                        .LINE     29
                        LDS _ACCA, ADAC.DACtemp         ; LSB Level zuletzt
                        .LINE     30
                        ldi  _ACCB, 7 ; 7 Bits ohne Load
                        ADAC.1257loop2:
                        .LINE     33
                        sbrc _ACCA,7 // Bit high?
                        .LINE     34
                        sbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
                        .LINE     35
                        sbi  ADAC.ControlBitPort, ADAC.b_SCLK
                        .LINE     36
                        LSL  _ACCA
                        .LINE     37
                        nop
                        .LINE     38
                        cbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
                        .LINE     39
                        cbi  ADAC.ControlBitPort, ADAC.b_SCLK
                        .LINE     40
                        dec _ACCB
                        .LINE     41
                        BRNE  ADAC.1257loop2
                        .LINE     43
                        LSL  _ACCA ; LSB mit Load-impuls
                        .LINE     44
                        sbrc _ACCA,7 // Bit high?
                        .LINE     45
                        sbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
                        .LINE     46
                        sbi  ADAC.ControlBitPort, ADAC.b_SCLK
                        .LINE     47
                        cbi  ADAC.ControlBitPort, ADAC.b_STRDAC
                        .LINE     48
                        nop
                        .LINE     49
                        cbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
                        .LINE     50
                        cbi  ADAC.ControlBitPort, ADAC.b_SCLK
                        .LINE     51
                        sbi  ADAC.ControlBitPort, ADAC.b_STRDAC
                        .endasm
                        .ENDBLOCK 53
ADAC.ShiftOut1257_X:
                        .LINE     53
                        .BRANCH   19
                        RET
                        .ENDFUNC  53

                        .FUNC     ShiftOut1655, 00037h, 00020h
ADAC.ShiftOut1655:
                        .RETURNS   0
                        .BLOCK    57
                        .ASM
                        .LINE     59
                        cbi  ADAC.ControlBitPort, ADAC.b_SCLK
                        .LINE     60
                        cbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
                        .LINE     61
                        cbi  ADAC.ControlBitPort, ADAC.b_STRDAC
                        .LINE     63
                        LDS _ACCA, ADAC.DACtemp+1 ; MSB linksbündig
                        .LINE     64
                        ldi  _ACCB, 8 ; 8 Bits ohne Load
                        ADAC.1655loop1:
                        .LINE     67
                        sbrc _ACCA,7 // Bit high?
                        .LINE     68
                        sbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
                        .LINE     69
                        sbi  ADAC.ControlBitPort, ADAC.b_SCLK
                        .LINE     70
                        LSL  _ACCA
                        .LINE     71
                        nop
                        .LINE     72
                        cbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
                        .LINE     73
                        cbi  ADAC.ControlBitPort, ADAC.b_SCLK
                        .LINE     74
                        dec _ACCB
                        .LINE     75
                        BRNE  ADAC.1655loop1
                        .LINE     77
                        LDS _ACCA, ADAC.DACtemp         ; LSB Level zuletzt
                        .LINE     78
                        ldi  _ACCB, 8 ; 8 Bits ohne Load
                        ADAC.1655loop2:
                        .LINE     81
                        sbrc _ACCA,7 // Bit high?
                        .LINE     82
                        sbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
                        .LINE     83
                        sbi  ADAC.ControlBitPort, ADAC.b_SCLK
                        .LINE     84
                        LSL  _ACCA
                        .LINE     85
                        cbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
                        .LINE     86
                        cbi  ADAC.ControlBitPort, ADAC.b_SCLK
                        .LINE     87
                        dec _ACCB
                        .LINE     88
                        BRNE  ADAC.1655loop2
                        .LINE     89
                        sbi  ADAC.ControlBitPort, ADAC.b_STRDAC
                        .endasm
                        .ENDBLOCK 91
ADAC.ShiftOut1655_X:
                        .LINE     91
                        .BRANCH   19
                        RET
                        .ENDFUNC  91

                        .FUNC     ShiftOut714, 0005Dh, 00020h
ADAC.ShiftOut714:
                        .RETURNS   0
                        .BLOCK    95
                        .ASM
                        .LINE     97
                        cbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
                        .LINE     98
                        sbi  ADAC.ControlBitPort, ADAC.b_SCLK
                        .LINE     99
                        sbi  ADAC.ControlBitPort, ADAC.b_STRDAC
                        .LINE     101
                        LDS _ACCA, ADAC.DACtemp+1 ; MSB linksbündig
                        .LINE     102
                        ldi  _ACCB, 8
                        ADAC.714loop1:
                        .LINE     105
                        cbi  ADAC.ControlBitPort, ADAC.b_SCLK
                        .LINE     106
                        sbrc _ACCA,7 // Bit high?
                        .LINE     107
                        sbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
                        .LINE     108
                        LSL  _ACCA
                        .LINE     109
                        nop
                        .LINE     110
                        sbi  ADAC.ControlBitPort, ADAC.b_SCLK
                        .LINE     111
                        cbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
                        .LINE     112
                        dec _ACCB
                        .LINE     113
                        BRNE  ADAC.714loop1
                        .LINE     115
                        LDS _ACCA, ADAC.DACtemp         ; LSB Level zuletzt
                        .LINE     116
                        ldi  _ACCB, 8 ; 7 Bits ohne Load
                        ADAC.714loop2:
                        .LINE     119
                        cbi  ADAC.ControlBitPort, ADAC.b_SCLK
                        .LINE     120
                        sbrc _ACCA,7 // Bit high?
                        .LINE     121
                        sbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
                        .LINE     122
                        LSL  _ACCA
                        .LINE     123
                        nop
                        .LINE     124
                        sbi  ADAC.ControlBitPort, ADAC.b_SCLK
                        .LINE     125
                        cbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
                        .LINE     126
                        dec _ACCB
                        .LINE     127
                        BRNE  ADAC.714loop2
                        .LINE     129
                        cbi  ADAC.ControlBitPort, ADAC.b_SCLK
                        .LINE     130
                        nop;
                        .LINE     131
                        cbi  ADAC.ControlBitPort, ADAC.b_STRDAC
                        .LINE     132
                        nop;
                        .LINE     133
                        sbi  ADAC.ControlBitPort, ADAC.b_SCLK
                        .LINE     134
                        nop;
                        .LINE     135
                        sbi  ADAC.ControlBitPort, ADAC.b_STRDAC
                        .endasm
                        .ENDBLOCK 137
ADAC.ShiftOut714_X:
                        .LINE     137
                        .BRANCH   19
                        RET
                        .ENDFUNC  137

                        .FUNC     ShiftIn1864, 0008Bh, 00020h
ADAC.ShiftIn1864:
                        .RETURNS   0
                        .BLOCK    141
                        .ASM
                        .LINE     143
                        cbi  ADAC.ControlBitPort, ADAC.b_STRAD16
                        .LINE     144
                        cbi  ADAC.ControlBitPort, ADAC.b_SCLK
                        .LINE     145
                        ldi  _ACCB, 8 ; 8 Bits
                        .LINE     146
                        nop
                        .LINE     147
                        nop
                        .LINE     148
                        nop
                        ADAC.1864loop1:
                        .LINE     150
                        clc
                        .LINE     151
                        sbi  ADAC.ControlBitPort, ADAC.b_SCLK
                        .LINE     152
                        sbic ADAC.ControlBitPin, ADAC.b_SDATAIN1 // Bit gesetzt?
                        .LINE     153
                        sec
                        .LINE     154
                        cbi  ADAC.ControlBitPort, ADAC.b_SCLK
                        .LINE     155
                        rol _ACCA  // Carry-Bit einschieben
                        .LINE     156
                        dec _ACCB
                        .LINE     157
                        BRNE  ADAC.1864loop1
                        .LINE     158
                        sts ADAC.ADraw+1,_ACCA; Hi Byte vom Integer
                        .LINE     159
                        ldi  _ACCB, 8 ; 8 Bits
                        ADAC.1864loop2:
                        .LINE     161
                        clc
                        .LINE     162
                        sbi  ADAC.ControlBitPort, ADAC.b_SCLK
                        .LINE     163
                        sbic ADAC.ControlBitPin, ADAC.b_SDATAIN1 // Bit gesetzt?
                        .LINE     164
                        sec
                        .LINE     165
                        cbi  ADAC.ControlBitPort, ADAC.b_SCLK
                        .LINE     166
                        rol _ACCA
                        .LINE     167
                        dec _ACCB
                        .LINE     168
                        BRNE  ADAC.1864loop2
                        .LINE     169
                        sts ADAC.ADraw,_ACCA; Low Byte vom Integer
                        .LINE     170
                        sbi  ADAC.ControlBitPort, ADAC.b_SCLK
                        .LINE     171
                        nop
                        .LINE     172
                        sbi  ADAC.ControlBitPort, ADAC.b_STRAD16
                        .endasm
                        .ENDBLOCK 174
ADAC.ShiftIn1864_X:
                        .LINE     174
                        .BRANCH   19
                        RET
                        .ENDFUNC  174

                        .FUNC     ShiftOutSR, 000B0h, 00020h
ADAC.ShiftOutSR:
                        .RETURNS   0
                        .BLOCK    179
                        .ASM
                        .LINE     181
                        cbi  ADAC.ControlBitPort, ADAC.b_SCLK
                        .LINE     182
                        cbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
                        .LINE     183
                        LDS _ACCA, ADAC.PortSR3;
                        .LINE     184
                        ldi  _ACCB, 8
                        ADAC.srloop1:
                        .LINE     187
                        sbrc _ACCA,7 // Bit high?
                        .LINE     188
                        sbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
                        .LINE     189
                        sbi  ADAC.ControlBitPort, ADAC.b_SCLK
                        .LINE     190
                        LSL  _ACCA
                        .LINE     191
                        cbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
                        .LINE     192
                        cbi  ADAC.ControlBitPort, ADAC.b_SCLK
                        .LINE     193
                        dec _ACCB
                        .LINE     194
                        BRNE  ADAC.srloop1
                        .LINE     196
                        LDS _ACCA, ADAC.PortSR2;
                        .LINE     197
                        ldi  _ACCB, 8
                        ADAC.srloop2:
                        .LINE     200
                        sbrc _ACCA,7 // Bit high?
                        .LINE     201
                        sbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
                        .LINE     202
                        sbi  ADAC.ControlBitPort, ADAC.b_SCLK
                        .LINE     203
                        LSL  _ACCA
                        .LINE     204
                        cbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
                        .LINE     205
                        cbi  ADAC.ControlBitPort, ADAC.b_SCLK
                        .LINE     206
                        dec _ACCB
                        .LINE     207
                        BRNE  ADAC.srloop2
                        .LINE     209
                        LDS _ACCA, ADAC.PortSR1         ; LSB Level zuletzt
                        .LINE     210
                        ldi  _ACCB, 8
                        ADAC.srloop3:
                        .LINE     213
                        sbrc _ACCA,7 // Bit high?
                        .LINE     214
                        sbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
                        .LINE     215
                        sbi  ADAC.ControlBitPort, ADAC.b_SCLK
                        .LINE     216
                        LSL  _ACCA
                        .LINE     217
                        cbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
                        .LINE     218
                        cbi  ADAC.ControlBitPort, ADAC.b_SCLK
                        .LINE     219
                        dec _ACCB
                        .LINE     220
                        BRNE  ADAC.srloop3
                        .LINE     222
                        LDS _ACCA, ADAC.PortSR0         ; LSB Level zuletzt
                        .LINE     223
                        ldi  _ACCB, 8
                        ADAC.srloop4:
                        .LINE     226
                        sbrc _ACCA,7 // Bit high?
                        .LINE     227
                        sbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
                        .LINE     228
                        sbi  ADAC.ControlBitPort, ADAC.b_SCLK
                        .LINE     229
                        LSL  _ACCA
                        .LINE     230
                        cbi  ADAC.ControlBitPort, ADAC.b_SDATAOUT
                        .LINE     231
                        cbi  ADAC.ControlBitPort, ADAC.b_SCLK
                        .LINE     232
                        dec _ACCB
                        .LINE     233
                        BRNE  ADAC.srloop4
                        .LINE     235
                        sbi  ADAC.ControlBitPort, ADAC.b_STR_SR
                        .LINE     236
                        nop
                        .LINE     237
                        nop
                        .LINE     238
                        cbi  ADAC.ControlBitPort, ADAC.b_STR_SR
                        .LINE     239
                        sbi  ADAC.ControlBitPort, ADAC.b_SCLK
                        .endasm
                        .ENDBLOCK 241
ADAC.ShiftOutSR_X:
                        .LINE     241
                        .BRANCH   19
                        RET
                        .ENDFUNC  241

                        .FUNC     OnSysTick, 00112h, 00020h
ADAC.OnSysTick:
                        .RETURNS   0
                        .BLOCK    276
                        .LINE     278
                        SBI       00038h, 000h
                        .LINE     279
                        LDS       _ACCA, ADAC.ADC16present
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0002
                        BRNE      ADAC._L0002
                        .BRANCH   20,ADAC._L0000
                        JMP       ADAC._L0000
ADAC._L0002:
                        .BLOCK    279
                        .LINE     280
                        CBI       00038h, 004h
                        .LINE     281
                        LDI       _ACCB, 000000000h AND 0FFh
                        LDI       _ACCA, 000000000h SHRB 8
                        LDI       _ACCALO, 000000000h SHRB 16
                        LDI       _ACCAHI, 000000000h SHRB 24
                        STS       ADAC.AD16LONG, _ACCB
                        STS       ADAC.AD16LONG+1, _ACCA
                        STS       ADAC.AD16LONG+2, _ACCALO
                        STS       ADAC.AD16LONG+3, _ACCAHI
                        .LINE     282
                        SBI       00038h, 004h
                        .ASM
                        .LINE     284
                        ldi  _ACCB, 15
                        ADAC.ADCsampleLoop1:
                        .LINE     286
                        dec _ACCB
                        .LINE     287
                        BRNE  ADAC.ADCsampleLoop1
                        .endasm
                        .LINE     289
                        .LOOP
                        LDI       _ACCCLO, ADAC.k AND 0FFh
                        LDI       _ACCCHI, ADAC.k SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 000h
                        ST        Z, _ACCA
                        LDI       _ACCA, 003h
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
ADAC._L0005:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      ADAC._L0006
                        CLR       _ACCA
ADAC._L0006:
                        TST       _ACCA
                        .BRANCH   3,ADAC._L0007
                        BREQ      ADAC._L0007
                        .BRANCH   20,ADAC._L0004
                        JMP       ADAC._L0004
ADAC._L0007:
                        .BLOCK    290
                        .LINE     290
                        .BRANCH   17,ADAC.SHIFTIN1864
                        CALL      ADAC.SHIFTIN1864
                        .LINE     291
                        LDS       _ACCB, ADAC.AD16long
                        LDS       _ACCA, ADAC.AD16long+1
                        LDS       _ACCALO, ADAC.AD16long+2
                        LDS       _ACCAHI, ADAC.AD16long+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, ADAC.ADraw
                        LDS       _ACCA, ADAC.ADraw+1
                        SUBI      _ACCB, 08000h AND 0FFh
                        SBCI      _ACCA, 08000h SHRB 8
                        SBRS      _ACCA, 7
                        RJMP      ADAC._L0008
                        LDI       _ACCAHI, 0FFh
                        LDI       _ACCALO, 0FFh
                        RJMP      ADAC._L0009
ADAC._L0008:
                        CLR       _ACCAHI
                        CLR       _ACCALO
ADAC._L0009:
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        ADD       _ACCB, _ACCBLO
                        ADC       _ACCA, _ACCBHI
                        ADC       _ACCALO, _ACCCLO
                        ADC       _ACCAHI, _ACCCHI
                        STS       ADAC.AD16LONG, _ACCB
                        STS       ADAC.AD16LONG+1, _ACCA
                        STS       ADAC.AD16LONG+2, _ACCALO
                        STS       ADAC.AD16LONG+3, _ACCAHI
                        .ENDBLOCK 292
ADAC._L0003:
                        .LINE     292
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,ADAC._L0004
                        BREQ      ADAC._L0004
                        .BRANCH   20,ADAC._L0005
                        JMP       ADAC._L0005
ADAC._L0004:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .ENDBLOCK 293
ADAC._L0000:
ADAC._L0001:
                        .LINE     294
                        MOV       _ACCA, ADAC.MuxCh
                        MOV       ADAC.K, _ACCA
                        .LINE     297
                        CBI       00035h, 005h
                        .LINE     298
                        INC       ADAC.MuxCh
                        .LINE     299
                        MOV       _ACCA, ADAC.MuxCh
                        CPI       _ACCA, 008h
                        LDI       _ACCA, 0
                        BRLO      ADAC._L0010
                        LDI       _ACCA, 0FFh
ADAC._L0010:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0013
                        BRNE      ADAC._L0013
                        .BRANCH   20,ADAC._L0011
                        JMP       ADAC._L0011
ADAC._L0013:
                        .BLOCK    299
                        .LINE     300
                        LDI       _ACCA, 000h
                        MOV       ADAC.MUXCH, _ACCA
                        .ENDBLOCK 301
ADAC._L0011:
ADAC._L0012:
                        .LINE     303
                        MOV       _ACCA, ADAC.MuxCh
                        LSL       _ACCA
                        LSL       _ACCA
                        ORI       _ACCA, 0C3h
                        OUT       PORTC, _ACCA
                        .LINE     305
                        LDI       _ACCCLO, ADAC.DACrawArray AND 0FFh
                        LDI       _ACCCHI, ADAC.DACrawArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        MOV       _ACCA, ADAC.MuxCh
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCB, Z+
                        LD        _ACCA, Z+
                        STS       ADAC.DACTEMP, _ACCB
                        STS       ADAC.DACTEMP+1, _ACCA
                        .LINE     306
                        LDS       _ACCA, ADAC.DAC16present
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0016
                        BRNE      ADAC._L0016
                        .BRANCH   20,ADAC._L0014
                        JMP       ADAC._L0014
ADAC._L0016:
                        .BLOCK    306
                        .LINE     308
                        .BRANCH   17,ADAC.SHIFTOUT1655
                        CALL      ADAC.SHIFTOUT1655
                        .ENDBLOCK 309
ADAC._L0014:
ADAC._L0015:
                        .LINE     310
                        LDS       _ACCA, ADAC.DAC714present
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0019
                        BRNE      ADAC._L0019
                        .BRANCH   20,ADAC._L0017
                        JMP       ADAC._L0017
ADAC._L0019:
                        .BLOCK    310
                        .LINE     312
                        .BRANCH   17,ADAC.SHIFTOUT714
                        CALL      ADAC.SHIFTOUT714
                        .ENDBLOCK 313
ADAC._L0017:
ADAC._L0018:
                        .LINE     314
                        LDS       _ACCA, ADAC.DAC12present
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0022
                        BRNE      ADAC._L0022
                        .BRANCH   20,ADAC._L0020
                        JMP       ADAC._L0020
ADAC._L0022:
                        .BLOCK    314
                        .LINE     316
                        .BRANCH   17,ADAC.SHIFTOUT1257
                        CALL      ADAC.SHIFTOUT1257
                        .ENDBLOCK 317
ADAC._L0020:
ADAC._L0021:
                        .ASM
                        .LINE     320
                        ldi  _ACCB, 4
                        ADAC.DACsettleLoop1:
                        .LINE     322
                        dec _ACCB
                        .LINE     323
                        BRNE  ADAC.DACsettleLoop1
                        .endasm
                        .LINE     326
                        LDS       _ACCB, ADAC.AD16long
                        LDS       _ACCA, ADAC.AD16long+1
                        LDS       _ACCALO, ADAC.AD16long+2
                        LDS       _ACCAHI, ADAC.AD16long+3
                        LDI       _ACCCLO, 002h
                        CALL      SYSTEM.SHR32
                        STS       ADAC.AD16LONG, _ACCB
                        STS       ADAC.AD16LONG+1, _ACCA
                        STS       ADAC.AD16LONG+2, _ACCALO
                        STS       ADAC.AD16LONG+3, _ACCAHI
                        .LINE     327
                        LDS       _ACCA, ADAC.integrateAD16
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0025
                        BRNE      ADAC._L0025
                        .BRANCH   20,ADAC._L0023
                        JMP       ADAC._L0023
ADAC._L0025:
                        .BLOCK    327
                        .LINE     328
                        LDI       _ACCCLO, ADAC.ADCrawArray AND 0FFh
                        LDI       _ACCCHI, ADAC.ADCrawArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        MOV       _ACCA, ADAC.k
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCB, Z+
                        LD        _ACCA, Z+
                        SBRS      _ACCA, 7
                        RJMP      ADAC._L0026
                        LDI       _ACCAHI, 0FFh
                        LDI       _ACCALO, 0FFh
                        RJMP      ADAC._L0027
ADAC._L0026:
                        CLR       _ACCAHI
                        CLR       _ACCALO
ADAC._L0027:
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, ADAC.AD16long
                        LDS       _ACCA, ADAC.AD16long+1
                        LDS       _ACCALO, ADAC.AD16long+2
                        LDS       _ACCAHI, ADAC.AD16long+3
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        ADD       _ACCB, _ACCBLO
                        ADC       _ACCA, _ACCBHI
                        ADC       _ACCALO, _ACCCLO
                        ADC       _ACCAHI, _ACCCHI
                        STS       ADAC.AD16LONG, _ACCB
                        STS       ADAC.AD16LONG+1, _ACCA
                        STS       ADAC.AD16LONG+2, _ACCALO
                        STS       ADAC.AD16LONG+3, _ACCAHI
                        .LINE     329
                        LDI       _ACCCLO, ADAC.ADCrawArray AND 0FFh
                        LDI       _ACCCHI, ADAC.ADCrawArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        MOV       _ACCA, ADAC.k
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCB, ADAC.AD16long
                        LDS       _ACCA, ADAC.AD16long+1
                        LDS       _ACCALO, ADAC.AD16long+2
                        LDS       _ACCAHI, ADAC.AD16long+3
                        LSR       _ACCAHI
                        ROR       _ACCALO
                        ROR       _ACCA
                        ROR       _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z+, _ACCB
                        ST        Z+, _ACCA
                        .ENDBLOCK 330
                        .BRANCH   20,ADAC._L0024
                        JMP       ADAC._L0024
ADAC._L0023:
                        .BLOCK    330
                        .LINE     331
                        LDI       _ACCCLO, ADAC.ADCrawArray AND 0FFh
                        LDI       _ACCCHI, ADAC.ADCrawArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        MOV       _ACCA, ADAC.k
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCB, ADAC.AD16long
                        LDS       _ACCA, ADAC.AD16long+1
                        LDS       _ACCALO, ADAC.AD16long+2
                        LDS       _ACCAHI, ADAC.AD16long+3
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z+, _ACCB
                        ST        Z+, _ACCA
                        .ENDBLOCK 332
ADAC._L0024:
                        .LINE     333
                        SBI       00035h, 005h
                        .ASM
                        ADC10endLoop1:
                        .LINE     337
                        in _ACCB, ADCSRA
                        .LINE     338
                        sbrc _ACCB,6 // auf Bit 6 low warten
                        .LINE     339
                        rjmp ADC10endLoop1
                        .endasm
                        .ENDBLOCK 342
ADAC.OnSysTick_X:
                        .LINE     342
                        .BRANCH   19
                        RET
                        .ENDFUNC  342


                        .FILE     H:\PROJAVR\ADA-C\ADA-C.pas
                        .FUNC     INTERRUPT_Int2, 0015Eh, 00020h
ADAC.INTERRUPT_Int2:
                        CLT
                        BLD       Flags, IntFlag
                        .RETURNS   0
                        .BLOCK    351
                        .LINE     352
                        LDI       _ACCA, 0FFh
                        STS       ADAC.TRIGGER, _ACCA
                        .ENDBLOCK 353
ADAC.INTERRUPT_Int2_X:
                        .LINE     353
                        SET
                        BLD       Flags, IntFlag
                        .BRANCH   19
                        RET
                        .ENDFUNC  353

                        .FUNC     SetBaseScales, 00163h, 00020h
ADAC.SetBaseScales:
                        .RETURNS   0
                        .BLOCK    356
                        .LINE     357
                        LDI       _ACCCLO, ADAC.ScaleArray AND 0FFh
                        LDI       _ACCCHI, ADAC.ScaleArray SHRB 8
                        ADIW      _ACCCLO, 00024h
                        CALL      SYSTEM._ReadEEp32
                        STS       ADAC.BASESCALEAD10, _ACCB
                        STS       ADAC.BASESCALEAD10+1, _ACCA
                        STS       ADAC.BASESCALEAD10+2, _ACCALO
                        STS       ADAC.BASESCALEAD10+3, _ACCAHI
                        .LINE     358
                        LDI       _ACCCLO, ADAC.ScaleArray AND 0FFh
                        LDI       _ACCCHI, ADAC.ScaleArray SHRB 8
                        SUBI      _ACCCLO, -0004Ch AND 0FFh
                        SBCI      _ACCCHI, -0004Ch SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        STS       ADAC.BASESCALEAD16, _ACCB
                        STS       ADAC.BASESCALEAD16+1, _ACCA
                        STS       ADAC.BASESCALEAD16+2, _ACCALO
                        STS       ADAC.BASESCALEAD16+3, _ACCAHI
                        .LINE     359
                        LDI       _ACCCLO, ADAC.ScaleArray AND 0FFh
                        LDI       _ACCCHI, ADAC.ScaleArray SHRB 8
                        SUBI      _ACCCLO, -00070h AND 0FFh
                        SBCI      _ACCCHI, -00070h SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        STS       ADAC.BASESCALEDA12, _ACCB
                        STS       ADAC.BASESCALEDA12+1, _ACCA
                        STS       ADAC.BASESCALEDA12+2, _ACCALO
                        STS       ADAC.BASESCALEDA12+3, _ACCAHI
                        .LINE     360
                        LDI       _ACCCLO, ADAC.ScaleArray AND 0FFh
                        LDI       _ACCCHI, ADAC.ScaleArray SHRB 8
                        SUBI      _ACCCLO, -00074h AND 0FFh
                        SBCI      _ACCCHI, -00074h SHRB 8
                        CALL      SYSTEM._ReadEEp32
                        STS       ADAC.BASESCALEDA16, _ACCB
                        STS       ADAC.BASESCALEDA16+1, _ACCA
                        STS       ADAC.BASESCALEDA16+2, _ACCALO
                        STS       ADAC.BASESCALEDA16+3, _ACCAHI
                        .ENDBLOCK 361
ADAC.SetBaseScales_X:
                        .LINE     361
                        .BRANCH   19
                        RET
                        .ENDFUNC  361

                        .FUNC     SetDAC, 0016Bh, 00020h
ADAC.SetDAC:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 16
                        .BLOCK    368
                        .LINE     369
                        LDD       _ACCA, Y+010h
                        CPI       _ACCA, 01Bh
                        .BRANCH   3,ADAC._L0028
                        BREQ      ADAC._L0028
                        .BRANCH   1,ADAC._L0029
                        BRSH      ADAC._L0029
                        CPI       _ACCA, 014h
                        .BRANCH   1,ADAC._L0029
                        BRLO      ADAC._L0029
                        LDI       _ACCDLO, 0
                        SEZ
                        .BRANCH   20,ADAC._L0028
                        RJMP      ADAC._L0028
ADAC._L0029:
                        LDI       _ACCDLO, 001h
ADAC._L0028:
                        LDI       _ACCA, 0h
                        BRNE      ADAC._L0030
                        SER       _ACCA
ADAC._L0030:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0033
                        BRNE      ADAC._L0033
                        .BRANCH   20,ADAC._L0031
                        JMP       ADAC._L0031
ADAC._L0033:
                        .BLOCK    369
                        .LINE     370
                        LDI       _ACCCLO, ADAC.OffsetArray AND 0FFh
                        LDI       _ACCCHI, ADAC.OffsetArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCA, Y+010h
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        CALL      SYSTEM._ReadEEp16
                        STD       Y+00Fh, _ACCA
                        STD       Y+00Eh, _ACCB
                        .LINE     371
                        LDI       _ACCCLO, ADAC.ScaleArray AND 0FFh
                        LDI       _ACCCHI, ADAC.ScaleArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCA, Y+010h
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
                        STD       Y+007h, _ACCAHI
                        STD       Y+006h, _ACCALO
                        STD       Y+005h, _ACCA
                        STD       Y+004h, _ACCB
                        .LINE     372
                        LDI       _ACCCLO, ADAC.DACValueArray AND 0FFh
                        LDI       _ACCCHI, ADAC.DACValueArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCA, Y+010h
                        SUBI      _ACCA, 014h AND 0FFh
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
                        STD       Y+003h, _ACCAHI
                        STD       Y+002h, _ACCALO
                        STD       Y+001h, _ACCA
                        STD       Y+000h, _ACCB
                        .LINE     373
                        LDS       _ACCA, ADAC.DAC714present
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0036
                        BRNE      ADAC._L0036
                        .BRANCH   20,ADAC._L0034
                        JMP       ADAC._L0034
ADAC._L0036:
                        .BLOCK    373
                        .LINE     376
                        LDS       _ACCB, ADAC.BaseScaleDA16
                        LDS       _ACCA, ADAC.BaseScaleDA16+1
                        LDS       _ACCALO, ADAC.BaseScaleDA16+2
                        LDS       _ACCAHI, ADAC.BaseScaleDA16+3
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
                        LDD       _ACCAHI, Y+007h
                        LDD       _ACCALO, Y+006h
                        LDD       _ACCA, Y+005h
                        LDD       _ACCB, Y+004h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.FloatToLInt
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDD       _ACCB, Y+00Eh
                        LDD       _ACCA, Y+00Fh
                        SBRS      _ACCA, 7
                        RJMP      ADAC._L0037
                        LDI       _ACCAHI, 0FFh
                        LDI       _ACCALO, 0FFh
                        RJMP      ADAC._L0038
ADAC._L0037:
                        CLR       _ACCAHI
                        CLR       _ACCALO
ADAC._L0038:
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        ADD       _ACCB, _ACCBLO
                        ADC       _ACCA, _ACCBHI
                        ADC       _ACCALO, _ACCCLO
                        ADC       _ACCAHI, _ACCCHI
                        STD       Y+00Bh, _ACCAHI
                        STD       Y+00Ah, _ACCALO
                        STD       Y+009h, _ACCA
                        STD       Y+008h, _ACCB
                        .LINE     378
                        LDD       _ACCAHI, Y+00Bh
                        LDD       _ACCALO, Y+00Ah
                        LDD       _ACCA, Y+009h
                        LDD       _ACCB, Y+008h
                        LDI       _ACCDLO, 080h
                        EOR       _ACCAHI, _ACCDLO
                        CPI       _ACCAHI, 07Fh
                        BRNE      ADAC._L0039
                        CPI       _ACCALO, 0FFh
                        BRNE      ADAC._L0039
                        CPI       _ACCA, 080h
                        BRNE      ADAC._L0039
                        CPI       _ACCB, 001h
ADAC._L0039:
                        LDI       _ACCA, 0FFh
                        BRLO      ADAC._L0040
                        CLR       _ACCA
ADAC._L0040:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0043
                        BRNE      ADAC._L0043
                        .BRANCH   20,ADAC._L0041
                        JMP       ADAC._L0041
ADAC._L0043:
                        .BLOCK    378
                        .LINE     379
                        LDI       _ACCB, 0FFFF8001h AND 0FFh
                        LDI       _ACCA, 0FFFF8001h SHRB 8
                        LDI       _ACCALO, 0FFFF8001h SHRB 16
                        LDI       _ACCAHI, 0FFFF8001h SHRB 24
                        STD       Y+00Bh, _ACCAHI
                        STD       Y+00Ah, _ACCALO
                        STD       Y+009h, _ACCA
                        STD       Y+008h, _ACCB
                        .ENDBLOCK 380
ADAC._L0041:
ADAC._L0042:
                        .LINE     381
                        LDD       _ACCAHI, Y+00Bh
                        LDD       _ACCALO, Y+00Ah
                        LDD       _ACCA, Y+009h
                        LDD       _ACCB, Y+008h
                        LDI       _ACCDLO, 080h
                        EOR       _ACCAHI, _ACCDLO
                        CPI       _ACCAHI, 080h
                        BRNE      ADAC._L0044
                        CPI       _ACCALO, 000h
                        BRNE      ADAC._L0044
                        CPI       _ACCA, 07Fh
                        BRNE      ADAC._L0044
                        CPI       _ACCB, 0FFh
ADAC._L0044:
                        LDI       _ACCA, 0h
                        BREQ      ADAC._L0045
                        BRLO      ADAC._L0045
                        SER       _ACCA
ADAC._L0045:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0048
                        BRNE      ADAC._L0048
                        .BRANCH   20,ADAC._L0046
                        JMP       ADAC._L0046
ADAC._L0048:
                        .BLOCK    381
                        .LINE     382
                        LDI       _ACCB, 000007FFFh AND 0FFh
                        LDI       _ACCA, 000007FFFh SHRB 8
                        LDI       _ACCALO, 000007FFFh SHRB 16
                        LDI       _ACCAHI, 000007FFFh SHRB 24
                        STD       Y+00Bh, _ACCAHI
                        STD       Y+00Ah, _ACCALO
                        STD       Y+009h, _ACCA
                        STD       Y+008h, _ACCB
                        .ENDBLOCK 383
ADAC._L0046:
ADAC._L0047:
                        .LINE     385
                        LDI       _ACCCLO, ADAC.DACrawArray AND 0FFh
                        LDI       _ACCCHI, ADAC.DACrawArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCA, Y+010h
                        SUBI      _ACCA, 014h AND 0FFh
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCAHI, Y+00Bh
                        LDD       _ACCALO, Y+00Ah
                        LDD       _ACCA, Y+009h
                        LDD       _ACCB, Y+008h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z+, _ACCB
                        ST        Z+, _ACCA
                        .ENDBLOCK 386
ADAC._L0034:
ADAC._L0035:
                        .LINE     387
                        LDS       _ACCA, ADAC.DAC16present
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0051
                        BRNE      ADAC._L0051
                        .BRANCH   20,ADAC._L0049
                        JMP       ADAC._L0049
ADAC._L0051:
                        .BLOCK    387
                        .LINE     390
                        LDS       _ACCB, ADAC.BaseScaleDA16
                        LDS       _ACCA, ADAC.BaseScaleDA16+1
                        LDS       _ACCALO, ADAC.BaseScaleDA16+2
                        LDS       _ACCAHI, ADAC.BaseScaleDA16+3
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
                        LDD       _ACCAHI, Y+007h
                        LDD       _ACCALO, Y+006h
                        LDD       _ACCA, Y+005h
                        LDD       _ACCB, Y+004h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.FloatToLInt
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDD       _ACCB, Y+00Eh
                        LDD       _ACCA, Y+00Fh
                        SBRS      _ACCA, 7
                        RJMP      ADAC._L0052
                        LDI       _ACCAHI, 0FFh
                        LDI       _ACCALO, 0FFh
                        RJMP      ADAC._L0053
ADAC._L0052:
                        CLR       _ACCAHI
                        CLR       _ACCALO
ADAC._L0053:
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        ADD       _ACCB, _ACCBLO
                        ADC       _ACCA, _ACCBHI
                        ADC       _ACCALO, _ACCCLO
                        ADC       _ACCAHI, _ACCCHI
                        STD       Y+00Bh, _ACCAHI
                        STD       Y+00Ah, _ACCALO
                        STD       Y+009h, _ACCA
                        STD       Y+008h, _ACCB
                        .LINE     391
                        LDD       _ACCAHI, Y+00Bh
                        LDD       _ACCALO, Y+00Ah
                        LDD       _ACCA, Y+009h
                        LDD       _ACCB, Y+008h
                        LDI       _ACCDLO, 080h
                        EOR       _ACCAHI, _ACCDLO
                        CPI       _ACCAHI, 07Fh
                        BRNE      ADAC._L0054
                        CPI       _ACCALO, 0FFh
                        BRNE      ADAC._L0054
                        CPI       _ACCA, 080h
                        BRNE      ADAC._L0054
                        CPI       _ACCB, 001h
ADAC._L0054:
                        LDI       _ACCA, 0FFh
                        BRLO      ADAC._L0055
                        CLR       _ACCA
ADAC._L0055:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0058
                        BRNE      ADAC._L0058
                        .BRANCH   20,ADAC._L0056
                        JMP       ADAC._L0056
ADAC._L0058:
                        .BLOCK    391
                        .LINE     392
                        LDI       _ACCB, 0FFFF8001h AND 0FFh
                        LDI       _ACCA, 0FFFF8001h SHRB 8
                        LDI       _ACCALO, 0FFFF8001h SHRB 16
                        LDI       _ACCAHI, 0FFFF8001h SHRB 24
                        STD       Y+00Bh, _ACCAHI
                        STD       Y+00Ah, _ACCALO
                        STD       Y+009h, _ACCA
                        STD       Y+008h, _ACCB
                        .ENDBLOCK 393
ADAC._L0056:
ADAC._L0057:
                        .LINE     394
                        LDD       _ACCAHI, Y+00Bh
                        LDD       _ACCALO, Y+00Ah
                        LDD       _ACCA, Y+009h
                        LDD       _ACCB, Y+008h
                        LDI       _ACCDLO, 080h
                        EOR       _ACCAHI, _ACCDLO
                        CPI       _ACCAHI, 080h
                        BRNE      ADAC._L0059
                        CPI       _ACCALO, 000h
                        BRNE      ADAC._L0059
                        CPI       _ACCA, 07Fh
                        BRNE      ADAC._L0059
                        CPI       _ACCB, 0FFh
ADAC._L0059:
                        LDI       _ACCA, 0h
                        BREQ      ADAC._L0060
                        BRLO      ADAC._L0060
                        SER       _ACCA
ADAC._L0060:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0063
                        BRNE      ADAC._L0063
                        .BRANCH   20,ADAC._L0061
                        JMP       ADAC._L0061
ADAC._L0063:
                        .BLOCK    394
                        .LINE     395
                        LDI       _ACCB, 000007FFFh AND 0FFh
                        LDI       _ACCA, 000007FFFh SHRB 8
                        LDI       _ACCALO, 000007FFFh SHRB 16
                        LDI       _ACCAHI, 000007FFFh SHRB 24
                        STD       Y+00Bh, _ACCAHI
                        STD       Y+00Ah, _ACCALO
                        STD       Y+009h, _ACCA
                        STD       Y+008h, _ACCB
                        .ENDBLOCK 396
ADAC._L0061:
ADAC._L0062:
                        .LINE     397
                        LDI       _ACCCLO, ADAC.DACrawArray AND 0FFh
                        LDI       _ACCCHI, ADAC.DACrawArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCA, Y+010h
                        SUBI      _ACCA, 014h AND 0FFh
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCAHI, Y+00Bh
                        LDD       _ACCALO, Y+00Ah
                        LDD       _ACCA, Y+009h
                        LDD       _ACCB, Y+008h
                        SUBI      _ACCB, 01h
                        SBCI      _ACCA, 00h
                        SBCI      _ACCALO, 00h
                        SBCI      _ACCAHI, 00h
                        COM       _ACCALO
                        COM       _ACCAHI
                        COM       _ACCA
                        COM       _ACCB
                        SUBI      _ACCB, -000008000h AND 0FFh
                        SBCI      _ACCA, -000008000h SHRB 8
                        SBCI      _ACCALO, -000008000h SHRB 16
                        SBCI      _ACCAHI, -000008000h SHRB 24
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z+, _ACCB
                        ST        Z+, _ACCA
                        .ENDBLOCK 398
ADAC._L0049:
ADAC._L0050:
                        .LINE     399
                        LDS       _ACCA, ADAC.DAC12present
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0066
                        BRNE      ADAC._L0066
                        .BRANCH   20,ADAC._L0064
                        JMP       ADAC._L0064
ADAC._L0066:
                        .BLOCK    399
                        .LINE     402
                        LDS       _ACCB, ADAC.BaseScaleDA12
                        LDS       _ACCA, ADAC.BaseScaleDA12+1
                        LDS       _ACCALO, ADAC.BaseScaleDA12+2
                        LDS       _ACCAHI, ADAC.BaseScaleDA12+3
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
                        LDD       _ACCAHI, Y+007h
                        LDD       _ACCALO, Y+006h
                        LDD       _ACCA, Y+005h
                        LDD       _ACCB, Y+004h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.FloatToLInt
                        SBRC      _ACCAHI, 7
                        RJMP      ADAC._L0067
                        OR        _ACCAHI, _ACCALO
                        BRNE      ADAC._L0068
                        RJMP      ADAC._L0069
ADAC._L0067:
                        CPI       _ACCAHI, 0FFh
                        BRNE      ADAC._L0068
                        CPI       _ACCALO, 0FFh
                        BREQ      ADAC._L0069
ADAC._L0068:
                        SET
                        BLD       Flags, _ERRFLAG
ADAC._L0069:
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDD       _ACCB, Y+00Eh
                        LDD       _ACCA, Y+00Fh
                        POP       _ACCAHI
                        POP       _ACCALO
                        ADD       _ACCB, _ACCALO
                        ADC       _ACCA, _ACCAHI
                        STD       Y+00Dh, _ACCA
                        STD       Y+00Ch, _ACCB
                        .LINE     403
                        LDD       _ACCB, Y+00Ch
                        LDD       _ACCA, Y+00Dh
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        CPI       _ACCA, 087h
                        BRNE      ADAC._L0070
                        CPI       _ACCB, 0FFh
ADAC._L0070:
                        LDI       _ACCA, 0h
                        BREQ      ADAC._L0071
                        BRLO      ADAC._L0071
                        SER       _ACCA
ADAC._L0071:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0074
                        BRNE      ADAC._L0074
                        .BRANCH   20,ADAC._L0072
                        JMP       ADAC._L0072
ADAC._L0074:
                        .BLOCK    403
                        .LINE     404
                        LDI       _ACCA, 007FFh SHRB 8
                        LDI       _ACCB, 007FFh AND 0FFh
                        STD       Y+00Dh, _ACCA
                        STD       Y+00Ch, _ACCB
                        .ENDBLOCK 405
ADAC._L0072:
ADAC._L0073:
                        .LINE     406
                        LDD       _ACCB, Y+00Ch
                        LDD       _ACCA, Y+00Dh
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        CPI       _ACCA, 078h
                        BRNE      ADAC._L0075
                        CPI       _ACCB, 001h
ADAC._L0075:
                        LDI       _ACCA, 0FFh
                        BRLO      ADAC._L0076
                        CLR       _ACCA
ADAC._L0076:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0079
                        BRNE      ADAC._L0079
                        .BRANCH   20,ADAC._L0077
                        JMP       ADAC._L0077
ADAC._L0079:
                        .BLOCK    406
                        .LINE     407
                        LDI       _ACCA, 0F801h SHRB 8
                        LDI       _ACCB, 0F801h AND 0FFh
                        STD       Y+00Dh, _ACCA
                        STD       Y+00Ch, _ACCB
                        .ENDBLOCK 408
ADAC._L0077:
ADAC._L0078:
                        .LINE     409
                        LDI       _ACCCLO, ADAC.DACrawArray AND 0FFh
                        LDI       _ACCCHI, ADAC.DACrawArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCA, Y+010h
                        SUBI      _ACCA, 014h AND 0FFh
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCB, Y+00Ch
                        LDD       _ACCA, Y+00Dh
                        NEG       _ACCB
                        BRNE      ADAC._L0080
                        DEC       _ACCA
ADAC._L0080:
                        COM       _ACCA
                        SUBI      _ACCB, -00800h AND 0FFh
                        SBCI      _ACCA, -00800h SHRB 8
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z+, _ACCB
                        ST        Z+, _ACCA
                        .ENDBLOCK 410
ADAC._L0064:
ADAC._L0065:
                        .ENDBLOCK 411
ADAC._L0031:
ADAC._L0032:
                        .ENDBLOCK 412
ADAC.SetDAC_X:
                        .LINE     412
                        .BRANCH   19
                        RET
                        .ENDFUNC  412

                        .FUNC     GetPort, 0019Eh, 00020h
ADAC.GetPort:
                        .RETURNS   1
                        .BLOCK    415
                        .LINE     416
                        LDS       _ACCA, ADAC.IOpresent
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0083
                        BRNE      ADAC._L0083
                        .BRANCH   20,ADAC._L0081
                        JMP       ADAC._L0081
ADAC._L0083:
                        .BLOCK    416
                        .LINE     417
                        LDD       _ACCA, Y+000h
                        .LINE     418
                        CPI       _ACCA, 0
                        .BRANCH   3,ADAC._L0087
                        BREQ      ADAC._L0087
                        .BRANCH   20,ADAC._L0086
                        JMP       ADAC._L0086
ADAC._L0087:
ADAC._L0085:
                        .BLOCK    419
                        .LINE     419
                        LDI       _ACCDLO, 038h
                        LDI       _ACCAHI, 000h
                        CALL      SYSTEM.I2CEXPINP
                        .BRANCH   20,ADAC.GetPort_X
                        JMP       ADAC.GetPort_X
                        .ENDBLOCK 420
                        .BRANCH   20,ADAC._L0084
                        JMP       ADAC._L0084
ADAC._L0086:
                        .LINE     421
                        CPI       _ACCA, 1
                        .BRANCH   3,ADAC._L0090
                        BREQ      ADAC._L0090
                        .BRANCH   20,ADAC._L0089
                        JMP       ADAC._L0089
ADAC._L0090:
ADAC._L0088:
                        .BLOCK    422
                        .LINE     422
                        LDI       _ACCDLO, 039h
                        LDI       _ACCAHI, 000h
                        CALL      SYSTEM.I2CEXPINP
                        .BRANCH   20,ADAC.GetPort_X
                        JMP       ADAC.GetPort_X
                        .ENDBLOCK 423
                        .BRANCH   20,ADAC._L0084
                        JMP       ADAC._L0084
ADAC._L0089:
                        .LINE     424
                        CPI       _ACCA, 2
                        .BRANCH   3,ADAC._L0093
                        BREQ      ADAC._L0093
                        .BRANCH   20,ADAC._L0092
                        JMP       ADAC._L0092
ADAC._L0093:
ADAC._L0091:
                        .BLOCK    425
                        .LINE     425
                        LDI       _ACCDLO, 03Ah
                        LDI       _ACCAHI, 000h
                        CALL      SYSTEM.I2CEXPINP
                        .BRANCH   20,ADAC.GetPort_X
                        JMP       ADAC.GetPort_X
                        .ENDBLOCK 426
                        .BRANCH   20,ADAC._L0084
                        JMP       ADAC._L0084
ADAC._L0092:
                        .LINE     427
                        CPI       _ACCA, 3
                        .BRANCH   3,ADAC._L0096
                        BREQ      ADAC._L0096
                        .BRANCH   20,ADAC._L0095
                        JMP       ADAC._L0095
ADAC._L0096:
ADAC._L0094:
                        .BLOCK    428
                        .LINE     428
                        LDI       _ACCDLO, 03Bh
                        LDI       _ACCAHI, 000h
                        CALL      SYSTEM.I2CEXPINP
                        .BRANCH   20,ADAC.GetPort_X
                        JMP       ADAC.GetPort_X
                        .ENDBLOCK 429
                        .BRANCH   20,ADAC._L0084
                        JMP       ADAC._L0084
ADAC._L0095:
                        .LINE     430
                        CPI       _ACCA, 4
                        .BRANCH   3,ADAC._L0099
                        BREQ      ADAC._L0099
                        .BRANCH   20,ADAC._L0098
                        JMP       ADAC._L0098
ADAC._L0099:
ADAC._L0097:
                        .BLOCK    431
                        .LINE     431
                        LDI       _ACCDLO, 03Ch
                        LDI       _ACCAHI, 000h
                        CALL      SYSTEM.I2CEXPINP
                        .BRANCH   20,ADAC.GetPort_X
                        JMP       ADAC.GetPort_X
                        .ENDBLOCK 432
                        .BRANCH   20,ADAC._L0084
                        JMP       ADAC._L0084
ADAC._L0098:
                        .LINE     433
                        CPI       _ACCA, 5
                        .BRANCH   3,ADAC._L0102
                        BREQ      ADAC._L0102
                        .BRANCH   20,ADAC._L0101
                        JMP       ADAC._L0101
ADAC._L0102:
ADAC._L0100:
                        .BLOCK    434
                        .LINE     434
                        LDI       _ACCDLO, 03Dh
                        LDI       _ACCAHI, 000h
                        CALL      SYSTEM.I2CEXPINP
                        .BRANCH   20,ADAC.GetPort_X
                        JMP       ADAC.GetPort_X
                        .ENDBLOCK 435
                        .BRANCH   20,ADAC._L0084
                        JMP       ADAC._L0084
ADAC._L0101:
                        .LINE     436
                        CPI       _ACCA, 6
                        .BRANCH   3,ADAC._L0105
                        BREQ      ADAC._L0105
                        .BRANCH   20,ADAC._L0104
                        JMP       ADAC._L0104
ADAC._L0105:
ADAC._L0103:
                        .BLOCK    437
                        .LINE     437
                        LDI       _ACCDLO, 03Eh
                        LDI       _ACCAHI, 000h
                        CALL      SYSTEM.I2CEXPINP
                        .BRANCH   20,ADAC.GetPort_X
                        JMP       ADAC.GetPort_X
                        .ENDBLOCK 438
                        .BRANCH   20,ADAC._L0084
                        JMP       ADAC._L0084
ADAC._L0104:
                        .LINE     439
                        CPI       _ACCA, 7
                        .BRANCH   3,ADAC._L0108
                        BREQ      ADAC._L0108
                        .BRANCH   20,ADAC._L0107
                        JMP       ADAC._L0107
ADAC._L0108:
ADAC._L0106:
                        .BLOCK    440
                        .LINE     440
                        LDI       _ACCDLO, 03Fh
                        LDI       _ACCAHI, 000h
                        CALL      SYSTEM.I2CEXPINP
                        .BRANCH   20,ADAC.GetPort_X
                        JMP       ADAC.GetPort_X
                        .ENDBLOCK 441
                        .BRANCH   20,ADAC._L0084
                        JMP       ADAC._L0084
ADAC._L0107:
ADAC._L0084:
                        .ENDBLOCK 444
                        .BRANCH   20,ADAC._L0082
                        JMP       ADAC._L0082
ADAC._L0081:
                        .BLOCK    444
                        .LINE     444
                        LDI       _ACCCLO, ADAC.PortArray AND 0FFh
                        LDI       _ACCCHI, ADAC.PortArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCA, Y+000h
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCA, Z+
                        .BRANCH   20,ADAC.GetPort_X
                        JMP       ADAC.GetPort_X
                        .ENDBLOCK 445
ADAC._L0082:
                        .ENDBLOCK 446
ADAC.GetPort_X:
                        .LINE     446
                        .BRANCH   19
                        RET
                        .ENDFUNC  446

                        .FUNC     SetPort, 001C0h, 00020h
ADAC.SetPort:
                        .RETURNS   0
                        .BLOCK    449
                        .LINE     450
                        LDI       _ACCCLO, ADAC.PortArray AND 0FFh
                        LDI       _ACCCHI, ADAC.PortArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCA, Y+001h
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCA, Y+000h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z+, _ACCA
                        .LINE     451
                        LDS       _ACCA, ADAC.IOpresent
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0111
                        BRNE      ADAC._L0111
                        .BRANCH   20,ADAC._L0109
                        JMP       ADAC._L0109
ADAC._L0111:
                        .BLOCK    451
                        .LINE     452
                        LDD       _ACCA, Y+001h
                        SUBI      _ACCA, -038h AND 0FFh
                        STS       ADAC.I2CSLAVEADR, _ACCA
                        .LINE     453
                        LDD       _ACCA, Y+000h
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        SUBI      _ACCB, -00100h AND 0FFh
                        SBCI      _ACCA, -00100h SHRB 8
                        STS       ADAC.PARAMINT, _ACCB
                        STS       ADAC.PARAMINT+1, _ACCA
                        .LINE     454
                        LDS       _ACCA, ADAC.I2CslaveAdr
                        PUSH      _ACCA
                        LDS       _ACCB, ADAC.ParamInt
                        LDS       _ACCA, ADAC.ParamInt+1
                        MOVW      _ACCALO, _ACCB
                        SET
                        BLD       Flags, _I2C2BYTE
                        POP       _ACCDLO
                        LDI       _ACCBLO, 00000h AND 0FFh
                        LDI       _ACCBHI, 00000h SHRB 8
                        LDI       _ACCDHI, 000h
                        CALL       SYSTEM.TWIOut
                        .ENDBLOCK 455
                        .BRANCH   20,ADAC._L0110
                        JMP       ADAC._L0110
ADAC._L0109:
                        .BLOCK    455
                        .LINE     456
                        .BRANCH   17,ADAC.SHIFTOUTSR
                        CALL      ADAC.SHIFTOUTSR
                        .ENDBLOCK 457
ADAC._L0110:
                        .ENDBLOCK 458
ADAC.SetPort_X:
                        .LINE     458
                        .BRANCH   19
                        RET
                        .ENDFUNC  458

                        .FUNC     SetDir, 001CCh, 00020h
ADAC.SetDir:
                        .RETURNS   0
                        .BLOCK    461
                        .LINE     462
                        LDS       _ACCA, ADAC.IOpresent
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0114
                        BRNE      ADAC._L0114
                        .BRANCH   20,ADAC._L0112
                        JMP       ADAC._L0112
ADAC._L0114:
                        .BLOCK    462
                        .LINE     463
                        LDD       _ACCA, Y+001h
                        .LINE     464
                        CPI       _ACCA, 0
                        .BRANCH   3,ADAC._L0118
                        BREQ      ADAC._L0118
                        .BRANCH   20,ADAC._L0117
                        JMP       ADAC._L0117
ADAC._L0118:
ADAC._L0116:
                        .BLOCK    465
                        .LINE     465
                        LDD       _ACCA, Y+000h
                        COM       _ACCA
                        LDI       _ACCDLO, 038h
                        LDI       _ACCAHI, 003h
                        CALL      SYSTEM.I2CEXPOUT
                        .ENDBLOCK 466
                        .BRANCH   20,ADAC._L0115
                        JMP       ADAC._L0115
ADAC._L0117:
                        .LINE     467
                        CPI       _ACCA, 1
                        .BRANCH   3,ADAC._L0121
                        BREQ      ADAC._L0121
                        .BRANCH   20,ADAC._L0120
                        JMP       ADAC._L0120
ADAC._L0121:
ADAC._L0119:
                        .BLOCK    468
                        .LINE     468
                        LDD       _ACCA, Y+000h
                        COM       _ACCA
                        LDI       _ACCDLO, 039h
                        LDI       _ACCAHI, 003h
                        CALL      SYSTEM.I2CEXPOUT
                        .ENDBLOCK 469
                        .BRANCH   20,ADAC._L0115
                        JMP       ADAC._L0115
ADAC._L0120:
                        .LINE     470
                        CPI       _ACCA, 2
                        .BRANCH   3,ADAC._L0124
                        BREQ      ADAC._L0124
                        .BRANCH   20,ADAC._L0123
                        JMP       ADAC._L0123
ADAC._L0124:
ADAC._L0122:
                        .BLOCK    471
                        .LINE     471
                        LDD       _ACCA, Y+000h
                        COM       _ACCA
                        LDI       _ACCDLO, 03Ah
                        LDI       _ACCAHI, 003h
                        CALL      SYSTEM.I2CEXPOUT
                        .ENDBLOCK 472
                        .BRANCH   20,ADAC._L0115
                        JMP       ADAC._L0115
ADAC._L0123:
                        .LINE     473
                        CPI       _ACCA, 3
                        .BRANCH   3,ADAC._L0127
                        BREQ      ADAC._L0127
                        .BRANCH   20,ADAC._L0126
                        JMP       ADAC._L0126
ADAC._L0127:
ADAC._L0125:
                        .BLOCK    474
                        .LINE     474
                        LDD       _ACCA, Y+000h
                        COM       _ACCA
                        LDI       _ACCDLO, 03Bh
                        LDI       _ACCAHI, 003h
                        CALL      SYSTEM.I2CEXPOUT
                        .ENDBLOCK 475
                        .BRANCH   20,ADAC._L0115
                        JMP       ADAC._L0115
ADAC._L0126:
                        .LINE     476
                        CPI       _ACCA, 4
                        .BRANCH   3,ADAC._L0130
                        BREQ      ADAC._L0130
                        .BRANCH   20,ADAC._L0129
                        JMP       ADAC._L0129
ADAC._L0130:
ADAC._L0128:
                        .BLOCK    477
                        .LINE     477
                        LDD       _ACCA, Y+000h
                        COM       _ACCA
                        LDI       _ACCDLO, 03Ch
                        LDI       _ACCAHI, 003h
                        CALL      SYSTEM.I2CEXPOUT
                        .ENDBLOCK 478
                        .BRANCH   20,ADAC._L0115
                        JMP       ADAC._L0115
ADAC._L0129:
                        .LINE     479
                        CPI       _ACCA, 5
                        .BRANCH   3,ADAC._L0133
                        BREQ      ADAC._L0133
                        .BRANCH   20,ADAC._L0132
                        JMP       ADAC._L0132
ADAC._L0133:
ADAC._L0131:
                        .BLOCK    480
                        .LINE     480
                        LDD       _ACCA, Y+000h
                        COM       _ACCA
                        LDI       _ACCDLO, 03Dh
                        LDI       _ACCAHI, 003h
                        CALL      SYSTEM.I2CEXPOUT
                        .ENDBLOCK 481
                        .BRANCH   20,ADAC._L0115
                        JMP       ADAC._L0115
ADAC._L0132:
                        .LINE     482
                        CPI       _ACCA, 6
                        .BRANCH   3,ADAC._L0136
                        BREQ      ADAC._L0136
                        .BRANCH   20,ADAC._L0135
                        JMP       ADAC._L0135
ADAC._L0136:
ADAC._L0134:
                        .BLOCK    483
                        .LINE     483
                        LDD       _ACCA, Y+000h
                        COM       _ACCA
                        LDI       _ACCDLO, 03Eh
                        LDI       _ACCAHI, 003h
                        CALL      SYSTEM.I2CEXPOUT
                        .ENDBLOCK 484
                        .BRANCH   20,ADAC._L0115
                        JMP       ADAC._L0115
ADAC._L0135:
                        .LINE     485
                        CPI       _ACCA, 7
                        .BRANCH   3,ADAC._L0139
                        BREQ      ADAC._L0139
                        .BRANCH   20,ADAC._L0138
                        JMP       ADAC._L0138
ADAC._L0139:
ADAC._L0137:
                        .BLOCK    486
                        .LINE     486
                        LDD       _ACCA, Y+000h
                        COM       _ACCA
                        LDI       _ACCDLO, 03Fh
                        LDI       _ACCAHI, 003h
                        CALL      SYSTEM.I2CEXPOUT
                        .ENDBLOCK 487
                        .BRANCH   20,ADAC._L0115
                        JMP       ADAC._L0115
ADAC._L0138:
ADAC._L0115:
                        .ENDBLOCK 489
ADAC._L0112:
ADAC._L0113:
                        .ENDBLOCK 490
ADAC.SetDir_X:
                        .LINE     490
                        .BRANCH   19
                        RET
                        .ENDFUNC  490

                        .FUNC     GetNewValue, 001EDh, 00020h
ADAC.GetNewValue:
                        .RETURNS   1
                        SBIW      _FRAMEPTR, 1
                        .BLOCK    497
                        .LINE     498
                        LDI       _ACCA, 00000h SHRB 8
                        LDI       _ACCB, 00000h AND 0FFh
                        STS       ADAC.PARAMINT, _ACCB
                        STS       ADAC.PARAMINT+1, _ACCA
                        .LINE     499
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 000h
                        STS       ADAC.PARAM, _ACCB
                        STS       ADAC.PARAM+1, _ACCA
                        STS       ADAC.PARAM+2, _ACCALO
                        STS       ADAC.PARAM+3, _ACCAHI
                        .LINE     500
                        LDI       _ACCA, 000h
                        STD       Y+000h, _ACCA
                        .LINE     501
                        LDD       _ACCA, Y+001h
                        .LINE     502
                        CPI       _ACCA, 0
                        .BRANCH   2,ADAC._L0143
                        BRCC      ADAC._L0143
                        .BRANCH   20,ADAC._L0142
                        JMP       ADAC._L0142
ADAC._L0143:
                        CPI       _ACCA, 7
                        .BRANCH   3,ADAC._L0144
                        BREQ      ADAC._L0144
                        .BRANCH   1,ADAC._L0142
                        BRCS      ADAC._L0144
                        .BRANCH   20,ADAC._L0142
                        JMP       ADAC._L0142
ADAC._L0144:
ADAC._L0141:
                        .BLOCK    503
                        .LINE     503
                        LDD       _ACCA, Y+001h
                        SUBI      _ACCA, -001h AND 0FFh
                        .FRAME  0
                        CALL       SYSTEM.GETADC
                        STS       ADAC.PARAMINT, _ACCB
                        STS       ADAC.PARAMINT+1, _ACCA
                        .LINE     504
                        LDS       _ACCB, ADAC.ParamInt
                        LDS       _ACCA, ADAC.ParamInt+1
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDI       _ACCCLO, ADAC.OffsetArray AND 0FFh
                        LDI       _ACCCHI, ADAC.OffsetArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCA, Y+001h
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        CALL      SYSTEM._ReadEEp16
                        POP       _ACCAHI
                        POP       _ACCALO
                        ADD       _ACCB, _ACCALO
                        ADC       _ACCA, _ACCAHI
                        SBRS      _ACCA, 7
                        RJMP      ADAC._L0145
                        LDI       _ACCAHI, 0FFh
                        LDI       _ACCALO, 0FFh
                        RJMP      ADAC._L0146
ADAC._L0145:
                        CLR       _ACCAHI
                        CLR       _ACCALO
ADAC._L0146:
                        SET
                        BLD       Flags, _SIGN
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.LIntToFloat
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, ADAC.ScaleArray AND 0FFh
                        LDI       _ACCCHI, ADAC.ScaleArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCA, Y+001h
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
                        LDS       _ACCB, ADAC.BaseScaleAD10
                        LDS       _ACCA, ADAC.BaseScaleAD10+1
                        LDS       _ACCALO, ADAC.BaseScaleAD10+2
                        LDS       _ACCAHI, ADAC.BaseScaleAD10+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat
                        STS       ADAC.PARAM, _ACCB
                        STS       ADAC.PARAM+1, _ACCA
                        STS       ADAC.PARAM+2, _ACCALO
                        STS       ADAC.PARAM+3, _ACCAHI
                        .ENDBLOCK 505
                        .BRANCH   20,ADAC._L0140
                        JMP       ADAC._L0140
ADAC._L0142:
                        .LINE     506
                        CPI       _ACCA, 10
                        .BRANCH   2,ADAC._L0149
                        BRCC      ADAC._L0149
                        .BRANCH   20,ADAC._L0148
                        JMP       ADAC._L0148
ADAC._L0149:
                        CPI       _ACCA, 17
                        .BRANCH   3,ADAC._L0150
                        BREQ      ADAC._L0150
                        .BRANCH   1,ADAC._L0148
                        BRCS      ADAC._L0150
                        .BRANCH   20,ADAC._L0148
                        JMP       ADAC._L0148
ADAC._L0150:
ADAC._L0147:
                        .BLOCK    507
                        .LINE     507
                        LDI       _ACCCLO, ADAC.ADCrawArray AND 0FFh
                        LDI       _ACCCHI, ADAC.ADCrawArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCA, Y+001h
                        SUBI      _ACCA, 00Ah AND 0FFh
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCB, Z+
                        LD        _ACCA, Z+
                        STS       ADAC.PARAMINT, _ACCB
                        STS       ADAC.PARAMINT+1, _ACCA
                        .LINE     508
                        LDS       _ACCB, ADAC.ParamInt
                        LDS       _ACCA, ADAC.ParamInt+1
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDI       _ACCCLO, ADAC.OffsetArray AND 0FFh
                        LDI       _ACCCHI, ADAC.OffsetArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCA, Y+001h
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        CALL      SYSTEM._ReadEEp16
                        POP       _ACCAHI
                        POP       _ACCALO
                        ADD       _ACCB, _ACCALO
                        ADC       _ACCA, _ACCAHI
                        SBRS      _ACCA, 7
                        RJMP      ADAC._L0151
                        LDI       _ACCAHI, 0FFh
                        LDI       _ACCALO, 0FFh
                        RJMP      ADAC._L0152
ADAC._L0151:
                        CLR       _ACCAHI
                        CLR       _ACCALO
ADAC._L0152:
                        SET
                        BLD       Flags, _SIGN
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.LIntToFloat
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, ADAC.ScaleArray AND 0FFh
                        LDI       _ACCCHI, ADAC.ScaleArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCA, Y+001h
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
                        STS       ADAC.PARAM, _ACCB
                        STS       ADAC.PARAM+1, _ACCA
                        STS       ADAC.PARAM+2, _ACCALO
                        STS       ADAC.PARAM+3, _ACCAHI
                        .LINE     509
                        LDS       _ACCB, ADAC.Param
                        LDS       _ACCA, ADAC.Param+1
                        LDS       _ACCALO, ADAC.Param+2
                        LDS       _ACCAHI, ADAC.Param+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, ADAC.BaseScaleAD16
                        LDS       _ACCA, ADAC.BaseScaleAD16+1
                        LDS       _ACCALO, ADAC.BaseScaleAD16+2
                        LDS       _ACCAHI, ADAC.BaseScaleAD16+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat
                        STS       ADAC.PARAM, _ACCB
                        STS       ADAC.PARAM+1, _ACCA
                        STS       ADAC.PARAM+2, _ACCALO
                        STS       ADAC.PARAM+3, _ACCAHI
                        .ENDBLOCK 510
                        .BRANCH   20,ADAC._L0140
                        JMP       ADAC._L0140
ADAC._L0148:
                        .LINE     511
                        CPI       _ACCA, 20
                        .BRANCH   2,ADAC._L0155
                        BRCC      ADAC._L0155
                        .BRANCH   20,ADAC._L0154
                        JMP       ADAC._L0154
ADAC._L0155:
                        CPI       _ACCA, 27
                        .BRANCH   3,ADAC._L0156
                        BREQ      ADAC._L0156
                        .BRANCH   1,ADAC._L0154
                        BRCS      ADAC._L0156
                        .BRANCH   20,ADAC._L0154
                        JMP       ADAC._L0154
ADAC._L0156:
ADAC._L0153:
                        .BLOCK    512
                        .LINE     512
                        LDI       _ACCCLO, ADAC.DACValueArray AND 0FFh
                        LDI       _ACCCHI, ADAC.DACValueArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCA, Y+001h
                        SUBI      _ACCA, 014h AND 0FFh
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
                        STS       ADAC.PARAM, _ACCB
                        STS       ADAC.PARAM+1, _ACCA
                        STS       ADAC.PARAM+2, _ACCALO
                        STS       ADAC.PARAM+3, _ACCAHI
                        .ENDBLOCK 513
                        .BRANCH   20,ADAC._L0140
                        JMP       ADAC._L0140
ADAC._L0154:
                        .LINE     514
                        CPI       _ACCA, 30
                        .BRANCH   2,ADAC._L0159
                        BRCC      ADAC._L0159
                        .BRANCH   20,ADAC._L0158
                        JMP       ADAC._L0158
ADAC._L0159:
                        CPI       _ACCA, 37
                        .BRANCH   3,ADAC._L0160
                        BREQ      ADAC._L0160
                        .BRANCH   1,ADAC._L0158
                        BRCS      ADAC._L0160
                        .BRANCH   20,ADAC._L0158
                        JMP       ADAC._L0158
ADAC._L0160:
ADAC._L0157:
                        .BLOCK    515
                        .LINE     515
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDD       _ACCA, Y+001h
                        SUBI      _ACCA, 01Eh AND 0FFh
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,ADAC.GETPORT
                        CALL       ADAC.GETPORT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        STS       ADAC.PARAMINT, _ACCB
                        STS       ADAC.PARAMINT+1, _ACCA
                        .LINE     516
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 517
                        .BRANCH   20,ADAC._L0140
                        JMP       ADAC._L0140
ADAC._L0158:
                        .LINE     518
                        CPI       _ACCA, 40
                        .BRANCH   2,ADAC._L0163
                        BRCC      ADAC._L0163
                        .BRANCH   20,ADAC._L0162
                        JMP       ADAC._L0162
ADAC._L0163:
                        CPI       _ACCA, 47
                        .BRANCH   3,ADAC._L0164
                        BREQ      ADAC._L0164
                        .BRANCH   1,ADAC._L0162
                        BRCS      ADAC._L0164
                        .BRANCH   20,ADAC._L0162
                        JMP       ADAC._L0162
ADAC._L0164:
ADAC._L0161:
                        .BLOCK    519
                        .LINE     519
                        LDI       _ACCCLO, ADAC.DirInitArray AND 0FFh
                        LDI       _ACCCHI, ADAC.DirInitArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCA, Y+001h
                        SUBI      _ACCA, 028h AND 0FFh
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        CALL      SYSTEM.ReadEEp8
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        STS       ADAC.PARAMINT, _ACCB
                        STS       ADAC.PARAMINT+1, _ACCA
                        .LINE     520
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 521
                        .BRANCH   20,ADAC._L0140
                        JMP       ADAC._L0140
ADAC._L0162:
ADAC._L0140:
                        .LINE     523
                        LDD       _ACCA, Y+000h
                        .ENDBLOCK 524
ADAC.GetNewValue_X:
                        .LINE     524
                        .BRANCH   19
                        RET
                        .ENDFUNC  524

                        .FUNC     LCD1xy, 00213h, 00020h
ADAC.LCD1xy:
                        .RETURNS   0
                        .BLOCK    532
                        .LINE     533
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDS       _ACCA, ADAC.x
                        ST        -Y, _ACCA
                        .FRAME  2
                        LDS       _ACCA, ADAC.y
                        ST        -Y, _ACCA
                        .FRAME  3
                        .FRAME  0
                        CALL      SYSTEM.LCDXY_M
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 534
ADAC.LCD1xy_X:
                        .LINE     534
                        .BRANCH   19
                        RET
                        .ENDFUNC  534

                        .FUNC     LCD1x0y0, 00218h, 00020h
ADAC.LCD1x0y0:
                        .RETURNS   0
                        .BLOCK    537
                        .LINE     538
                        LDI       _ACCA, 000h
                        STS       ADAC.X, _ACCA
                        .LINE     539
                        LDI       _ACCA, 000h
                        STS       ADAC.Y, _ACCA
                        .LINE     540
                        .BRANCH   17,ADAC.LCD1XY
                        CALL      ADAC.LCD1XY
                        .ENDBLOCK 541
ADAC.LCD1x0y0_X:
                        .LINE     541
                        .BRANCH   19
                        RET
                        .ENDFUNC  541

                        .FUNC     LCD1x0y1, 0021Fh, 00020h
ADAC.LCD1x0y1:
                        .RETURNS   0
                        .BLOCK    544
                        .LINE     545
                        LDI       _ACCA, 000h
                        STS       ADAC.X, _ACCA
                        .LINE     546
                        LDI       _ACCA, 001h
                        STS       ADAC.Y, _ACCA
                        .LINE     547
                        .BRANCH   17,ADAC.LCD1XY
                        CALL      ADAC.LCD1XY
                        .ENDBLOCK 548
ADAC.LCD1x0y1_X:
                        .LINE     548
                        .BRANCH   19
                        RET
                        .ENDFUNC  548

                        .FUNC     SerCRLF, 00228h, 00020h
ADAC.SerCRLF:
                        .RETURNS   0
                        .BLOCK    553
                        .LINE     554
                        LDI       _ACCA, 00Dh
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .LINE     555
                        LDI       _ACCA, 00Ah
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .ENDBLOCK 556
ADAC.SerCRLF_X:
                        .LINE     556
                        .BRANCH   19
                        RET
                        .ENDFUNC  556

                        .FUNC     WriteChPrefix, 0022Eh, 00020h
ADAC.WriteChPrefix:
                        .RETURNS   0
                        .BLOCK    559
                        .LINE     560
                        LDI       _ACCA, 023h
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .LINE     561
                        LDS       _ACCA, ADAC.SlaveCh
                        SUBI      _ACCA, -030h AND 0FFh
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .LINE     562
                        LDI       _ACCA, 03Ah
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .LINE     563
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.Serout SHRB 1
                        LDI       _ACCA, SYSTEM.Serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDS       _ACCA, ADAC.SubCh
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
                        .LINE     564
                        LDI       _ACCA, 03Dh
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .ENDBLOCK 565
ADAC.WriteChPrefix_X:
                        .LINE     565
                        .BRANCH   19
                        RET
                        .ENDFUNC  565

                        .FUNC     WriteSerInp, 00237h, 00020h
ADAC.WriteSerInp:
                        .RETURNS   0
                        .BLOCK    568
                        .LINE     569
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.serout SHRB 1
                        LDI       _ACCA, SYSTEM.serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, ADAC.SerInpStr AND 0FFh
                        LDI       _ACCCHI, ADAC.SerInpStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     570
                        .BRANCH   17,ADAC.SERCRLF
                        CALL      ADAC.SERCRLF
                        .ENDBLOCK 571
ADAC.WriteSerInp_X:
                        .LINE     571
                        .BRANCH   19
                        RET
                        .ENDFUNC  571

                        .FUNC     SerPrompt, 0023Dh, 00020h
ADAC.SerPrompt:
                        .RETURNS   0
                        .BLOCK    576
                        .LINE     577
                        LDS       _ACCA, ADAC.verbose
                        PUSH      _ACCA
                        LDD       _ACCA, Y+001h
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      ADAC._L0165
                        SER       _ACCA
ADAC._L0165:
                        POP       _ACCB
                        OR        _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0168
                        BRNE      ADAC._L0168
                        .BRANCH   20,ADAC._L0166
                        JMP       ADAC._L0166
ADAC._L0168:
                        .BLOCK    577
                        .LINE     578
                        LDI       _ACCA, 0FFh
                        STS       ADAC.SUBCH, _ACCA
                        .LINE     579
                        .BRANCH   17,ADAC.WRITECHPREFIX
                        CALL      ADAC.WRITECHPREFIX
                        .LINE     580
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
                        .LINE     581
                        LDI       _ACCA, 020h
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .LINE     582
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.serout SHRB 1
                        LDI       _ACCA, SYSTEM.serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, ADAC.ErrStrArr AND 0FFh
                        LDI       _ACCCHI, ADAC.ErrStrArr SHRB 8
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
                        CALL      SYSTEM.StrConst2Str
ADAC._L0169:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     583
                        .BRANCH   17,ADAC.SERCRLF
                        CALL      ADAC.SERCRLF
                        .ENDBLOCK 584
ADAC._L0166:
ADAC._L0167:
                        .LINE     585
                        LDD       _ACCA, Y+001h
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      ADAC._L0170
                        SER       _ACCA
ADAC._L0170:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0173
                        BRNE      ADAC._L0173
                        .BRANCH   20,ADAC._L0171
                        JMP       ADAC._L0171
ADAC._L0173:
                        .BLOCK    585
                        .LINE     586
                        LDS       _ACCBLO, ADAC.ErrCount
                        LDS       _ACCBHI, ADAC.ErrCount+1
                        ADIW      _ACCBLO, 1
                        STS       ADAC.ErrCount, _ACCBLO
                        STS       ADAC.ErrCount+1, _ACCBHI
                        .LINE     587
                        LDI       _ACCA, 0FFh
                        STS       ADAC.ERRFLAG, _ACCA
                        .ENDBLOCK 588
ADAC._L0171:
ADAC._L0172:
                        .ENDBLOCK 589
ADAC.SerPrompt_X:
                        .LINE     589
                        .BRANCH   19
                        RET
                        .ENDFUNC  589

                        .FUNC     ParamRound1000, 00251h, 00020h
ADAC.ParamRound1000:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 4
                        .BLOCK    595
                        .LINE     596
                        LDS       _ACCB, ADAC.Param
                        LDS       _ACCA, ADAC.Param+1
                        LDS       _ACCALO, ADAC.Param+2
                        LDS       _ACCAHI, ADAC.Param+3
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
                        CALL      SYSTEM.RoundFloat
                        STD       Y+003h, _ACCAHI
                        STD       Y+002h, _ACCALO
                        STD       Y+001h, _ACCA
                        STD       Y+000h, _ACCB
                        .LINE     597
                        LDD       _ACCAHI, Y+003h
                        LDD       _ACCALO, Y+002h
                        LDD       _ACCA, Y+001h
                        LDD       _ACCB, Y+000h
                        CLT
                        BLD       Flags, _ERRFLAG
                        SET
                        BLD       Flags, _SIGN
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
                        STS       ADAC.PARAM, _ACCB
                        STS       ADAC.PARAM+1, _ACCA
                        STS       ADAC.PARAM+2, _ACCALO
                        STS       ADAC.PARAM+3, _ACCAHI
                        .ENDBLOCK 598
ADAC.ParamRound1000_X:
                        .LINE     598
                        .BRANCH   19
                        RET
                        .ENDFUNC  598

                        .FUNC     ParamToStr, 00258h, 00020h
ADAC.ParamToStr:
                        .RETURNS   0
                        .BLOCK    601
                        .LINE     602
                        LDS       _ACCB, ADAC.Param
                        LDS       _ACCA, ADAC.Param+1
                        LDS       _ACCALO, ADAC.Param+2
                        LDS       _ACCAHI, ADAC.Param+3
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
                        BREQ      ADAC._L0175
                        BRPL      ADAC._L0176
                        BRMI      ADAC._L0174
ADAC._L0176:
                        CLZ
                        CLC
                        RJMP      ADAC._L0175
ADAC._L0174:
                        CLZ
                        SEC
ADAC._L0175:
                        LDI       _ACCA, 0h
                        BRNE      ADAC._L0177
                        SER       _ACCA
ADAC._L0177:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0180
                        BRNE      ADAC._L0180
                        .BRANCH   20,ADAC._L0178
                        JMP       ADAC._L0178
ADAC._L0180:
                        .BLOCK    602
                        .LINE     603
                        LDI       _ACCCLO, ADAC.ParamStr AND 0FFh
                        LDI       _ACCCHI, ADAC.ParamStr SHRB 8
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
ADAC._L0181:
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
                        .ENDBLOCK 604
                        .BRANCH   20,ADAC._L0179
                        JMP       ADAC._L0179
ADAC._L0178:
                        .BLOCK    604
                        .LINE     605
                        LDI       _ACCCLO, ADAC.ParamStr AND 0FFh
                        LDI       _ACCCHI, ADAC.ParamStr SHRB 8
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
                        LDS       _ACCB, ADAC.Param
                        LDS       _ACCA, ADAC.Param+1
                        LDS       _ACCALO, ADAC.Param+2
                        LDS       _ACCAHI, ADAC.Param+3
                        ST        -Y, _ACCAHI
                        ST        -Y, _ACCALO
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  7
                        LDS       _ACCA, ADAC.digits
                        ST        -Y, _ACCA
                        .FRAME  8
                        LDS       _ACCA, ADAC.nachkomma
                        ST        -Y, _ACCA
                        .FRAME  9
                        LDI       _ACCA, 020h
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
                        .ENDBLOCK 606
ADAC._L0179:
                        .ENDBLOCK 607
ADAC.ParamToStr_X:
                        .LINE     607
                        .BRANCH   19
                        RET
                        .ENDFUNC  607

                        .FUNC     ParamToPMStr, 00261h, 00020h
ADAC.ParamToPMStr:
                        .RETURNS   0
                        .BLOCK    610
                        .LINE     611
                        .BRANCH   17,ADAC.PARAMTOSTR
                        CALL      ADAC.PARAMTOSTR
                        .LINE     612
                        LDI       _ACCCLO, ADAC.ParamStr AND 0FFh
                        LDI       _ACCCHI, ADAC.ParamStr SHRB 8
                        ADIW      _ACCCLO, 00001h
                        LD        _ACCA, Z+
                        CPI       _ACCA, 02Dh
                        LDI       _ACCA, 0h
                        BREQ      ADAC._L0182
                        SER       _ACCA
ADAC._L0182:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0185
                        BRNE      ADAC._L0185
                        .BRANCH   20,ADAC._L0183
                        JMP       ADAC._L0183
ADAC._L0185:
                        .BLOCK    612
                        .LINE     613
                        LDI       _ACCCLO, $St_String14 AND 0FFh
                        LDI       _ACCCHI, $St_String14 SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCCLO, ADAC.ParamStr AND 0FFh
                        LDI       _ACCCHI, ADAC.ParamStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCA, 028h
                        PUSH      _ACCA
                        LDI       _ACCA, 001h
                        LDI       _ACCFHI, 002h
                        CALL      SYSTEM.StringInsert
                        .ENDBLOCK 614
ADAC._L0183:
ADAC._L0184:
                        .ENDBLOCK 615
ADAC.ParamToPMStr_X:
                        .LINE     615
                        .BRANCH   19
                        RET
                        .ENDFUNC  615

                        .FUNC     WriteParam, 00269h, 00020h
ADAC.WriteParam:
                        .RETURNS   0
                        .BLOCK    618
                        .LINE     619
                        LDI       _ACCA, 001h
                        STS       ADAC.DIGITS, _ACCA
                        .LINE     620
                        LDI       _ACCA, 004h
                        STS       ADAC.NACHKOMMA, _ACCA
                        .LINE     621
                        LDS       _ACCA, ADAC.SubCh
                        CPI       _ACCA, 01Bh
                        .BRANCH   3,ADAC._L0186
                        BREQ      ADAC._L0186
                        .BRANCH   1,ADAC._L0187
                        BRSH      ADAC._L0187
                        CPI       _ACCA, 008h
                        .BRANCH   1,ADAC._L0187
                        BRLO      ADAC._L0187
                        LDI       _ACCDLO, 0
                        SEZ
                        .BRANCH   20,ADAC._L0186
                        RJMP      ADAC._L0186
ADAC._L0187:
                        LDI       _ACCDLO, 001h
                        CPI       _ACCA, 0E3h
                        .BRANCH   3,ADAC._L0186
                        BREQ      ADAC._L0186
                        .BRANCH   1,ADAC._L0188
                        BRSH      ADAC._L0188
                        CPI       _ACCA, 0C8h
                        .BRANCH   1,ADAC._L0188
                        BRLO      ADAC._L0188
                        LDI       _ACCDLO, 0
                        SEZ
                        .BRANCH   20,ADAC._L0186
                        RJMP      ADAC._L0186
ADAC._L0188:
                        LDI       _ACCDLO, 001h
ADAC._L0186:
                        LDI       _ACCA, 0h
                        BRNE      ADAC._L0189
                        SER       _ACCA
ADAC._L0189:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0192
                        BRNE      ADAC._L0192
                        .BRANCH   20,ADAC._L0190
                        JMP       ADAC._L0190
ADAC._L0192:
                        .BLOCK    621
                        .LINE     622
                        LDI       _ACCA, 006h
                        STS       ADAC.NACHKOMMA, _ACCA
                        .ENDBLOCK 623
ADAC._L0190:
ADAC._L0191:
                        .LINE     624
                        .BRANCH   17,ADAC.PARAMTOSTR
                        CALL      ADAC.PARAMTOSTR
                        .LINE     625
                        .BRANCH   17,ADAC.WRITECHPREFIX
                        CALL      ADAC.WRITECHPREFIX
                        .LINE     626
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.serout SHRB 1
                        LDI       _ACCA, SYSTEM.serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, ADAC.ParamStr AND 0FFh
                        LDI       _ACCCHI, ADAC.ParamStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     627
                        .BRANCH   17,ADAC.SERCRLF
                        CALL      ADAC.SERCRLF
                        .ENDBLOCK 628
ADAC.WriteParam_X:
                        .LINE     628
                        .BRANCH   19
                        RET
                        .ENDFUNC  628

                        .FUNC     WriteParamInt, 00276h, 00020h
ADAC.WriteParamInt:
                        .RETURNS   0
                        .BLOCK    631
                        .LINE     632
                        LDI       _ACCCLO, ADAC.ParamStr AND 0FFh
                        LDI       _ACCCHI, ADAC.ParamStr SHRB 8
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
                        LDS       _ACCB, ADAC.ParamInt
                        LDS       _ACCA, ADAC.ParamInt+1
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
                        .LINE     633
                        LDI       _ACCCLO, ADAC.ParamStr AND 0FFh
                        LDI       _ACCCHI, ADAC.ParamStr SHRB 8
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
                        LDI       _ACCCLO, ADAC.ParamStr AND 0FFh
                        LDI       _ACCCHI, ADAC.ParamStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LD        _ACCB, Z+
                        LDI       _ACCALO, 1
ADAC._L0193:
                        TST       _ACCB
                        BREQ      ADAC._L0194
                        LD        _ACCA, Z+
                        CPI       _ACCA, 20h
                        BRNE      ADAC._L0194
                        INC       _ACCALO
                        DEC       _ACCB
                        RJMP      ADAC._L0193
ADAC._L0194:
                        MOV       _ACCA, _ACCB
                        CLR       _ACCAHI
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCAHI
                        SBIW      _ACCCLO, 02h
ADAC._L0195:
                        TST       _ACCB
                        BREQ      ADAC._L0196
                        LD        _ACCA, Z
                        SBIW      _ACCCLO, 01h
                        CPI       _ACCA, 20h
                        BRNE      ADAC._L0196
                        DEC       _ACCB
                        RJMP      ADAC._L0195
ADAC._L0196:
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
                        .LINE     634
                        .BRANCH   17,ADAC.WRITECHPREFIX
                        CALL      ADAC.WRITECHPREFIX
                        .LINE     635
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.serout SHRB 1
                        LDI       _ACCA, SYSTEM.serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, ADAC.ParamStr AND 0FFh
                        LDI       _ACCCHI, ADAC.ParamStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     636
                        .BRANCH   17,ADAC.SERCRLF
                        CALL      ADAC.SERCRLF
                        .ENDBLOCK 637
ADAC.WriteParamInt_X:
                        .LINE     637
                        .BRANCH   19
                        RET
                        .ENDFUNC  637

                        .FUNC     WriteFeatures, 0027Fh, 00020h
ADAC.WriteFeatures:
                        .RETURNS   0
                        .BLOCK    640
                        .LINE     641
                        LDS       _ACCA, ADAC.DAC12present
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0199
                        BRNE      ADAC._L0199
                        .BRANCH   20,ADAC._L0197
                        JMP       ADAC._L0197
ADAC._L0199:
                        .BLOCK    641
                        .LINE     642
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.serout SHRB 1
                        LDI       _ACCA, SYSTEM.serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, ADAC.DAC12str AND 0FFh
                        LDI       _ACCCHI, ADAC.DAC12str SHRB 8
                        CALL      SYSTEM.StrConst2Str
ADAC._L0200:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .ENDBLOCK 643
ADAC._L0197:
ADAC._L0198:
                        .LINE     644
                        LDS       _ACCA, ADAC.DAC714present
                        PUSH      _ACCA
                        LDS       _ACCA, ADAC.DAC16present
                        POP       _ACCB
                        OR        _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0203
                        BRNE      ADAC._L0203
                        .BRANCH   20,ADAC._L0201
                        JMP       ADAC._L0201
ADAC._L0203:
                        .BLOCK    644
                        .LINE     645
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.serout SHRB 1
                        LDI       _ACCA, SYSTEM.serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, ADAC.DAC16str AND 0FFh
                        LDI       _ACCCHI, ADAC.DAC16str SHRB 8
                        CALL      SYSTEM.StrConst2Str
ADAC._L0204:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .ENDBLOCK 646
ADAC._L0201:
ADAC._L0202:
                        .LINE     647
                        LDS       _ACCA, ADAC.ADC16present
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0207
                        BRNE      ADAC._L0207
                        .BRANCH   20,ADAC._L0205
                        JMP       ADAC._L0205
ADAC._L0207:
                        .BLOCK    647
                        .LINE     648
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.serout SHRB 1
                        LDI       _ACCA, SYSTEM.serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, ADAC.ADC16str AND 0FFh
                        LDI       _ACCCHI, ADAC.ADC16str SHRB 8
                        CALL      SYSTEM.StrConst2Str
ADAC._L0208:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .ENDBLOCK 649
ADAC._L0205:
ADAC._L0206:
                        .LINE     650
                        LDS       _ACCA, ADAC.IOpresent
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0211
                        BRNE      ADAC._L0211
                        .BRANCH   20,ADAC._L0209
                        JMP       ADAC._L0209
ADAC._L0211:
                        .BLOCK    650
                        .LINE     651
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.serout SHRB 1
                        LDI       _ACCA, SYSTEM.serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, ADAC.IO816str AND 0FFh
                        LDI       _ACCCHI, ADAC.IO816str SHRB 8
                        CALL      SYSTEM.StrConst2Str
ADAC._L0212:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .ENDBLOCK 652
ADAC._L0209:
ADAC._L0210:
                        .LINE     653
                        LDS       _ACCA, ADAC.LCDpresent
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0215
                        BRNE      ADAC._L0215
                        .BRANCH   20,ADAC._L0213
                        JMP       ADAC._L0213
ADAC._L0215:
                        .BLOCK    653
                        .LINE     654
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.serout SHRB 1
                        LDI       _ACCA, SYSTEM.serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, ADAC.LCDstr AND 0FFh
                        LDI       _ACCCHI, ADAC.LCDstr SHRB 8
                        CALL      SYSTEM.StrConst2Str
ADAC._L0216:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .ENDBLOCK 655
ADAC._L0213:
ADAC._L0214:
                        .LINE     656
                        LDI       _ACCA, 05Dh
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .ENDBLOCK 657
ADAC.WriteFeatures_X:
                        .LINE     657
                        .BRANCH   19
                        RET
                        .ENDFUNC  657

                        .FUNC     WriteFeaturesLCD, 00293h, 00020h
ADAC.WriteFeaturesLCD:
                        .RETURNS   0
                        .BLOCK    660
                        .LINE     661
                        LDI       _ACCA, 000h
                        STS       ADAC.X, _ACCA
                        .LINE     662
                        .BRANCH   17,ADAC.LCD1XY
                        CALL      ADAC.LCD1XY
                        .LINE     663
                        LDS       _ACCA, ADAC.DAC12present
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0219
                        BRNE      ADAC._L0219
                        .BRANCH   20,ADAC._L0217
                        JMP       ADAC._L0217
ADAC._L0219:
                        .BLOCK    663
                        .LINE     664
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, ADAC.DAC12str AND 0FFh
                        LDI       _ACCCHI, ADAC.DAC12str SHRB 8
                        CALL      SYSTEM.StrConst2Str
ADAC._L0220:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     665
                        LDI       _ACCA, 002EEh SHRB 8
                        LDI       _ACCB, 002EEh AND 0FFh
                        .FRAME  0
                        CALL      SYSTEM.MDELAY
                        .ENDBLOCK 666
ADAC._L0217:
ADAC._L0218:
                        .LINE     667
                        LDI       _ACCA, 000h
                        STS       ADAC.X, _ACCA
                        .LINE     668
                        .BRANCH   17,ADAC.LCD1XY
                        CALL      ADAC.LCD1XY
                        .LINE     669
                        LDS       _ACCA, ADAC.DAC714present
                        PUSH      _ACCA
                        LDS       _ACCA, ADAC.DAC16present
                        POP       _ACCB
                        OR        _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0223
                        BRNE      ADAC._L0223
                        .BRANCH   20,ADAC._L0221
                        JMP       ADAC._L0221
ADAC._L0223:
                        .BLOCK    669
                        .LINE     670
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, ADAC.DAC16str AND 0FFh
                        LDI       _ACCCHI, ADAC.DAC16str SHRB 8
                        CALL      SYSTEM.StrConst2Str
ADAC._L0224:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     671
                        LDI       _ACCA, 002EEh SHRB 8
                        LDI       _ACCB, 002EEh AND 0FFh
                        .FRAME  0
                        CALL      SYSTEM.MDELAY
                        .ENDBLOCK 672
ADAC._L0221:
ADAC._L0222:
                        .LINE     673
                        LDI       _ACCA, 000h
                        STS       ADAC.X, _ACCA
                        .LINE     674
                        .BRANCH   17,ADAC.LCD1XY
                        CALL      ADAC.LCD1XY
                        .LINE     675
                        LDS       _ACCA, ADAC.ADC16present
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0227
                        BRNE      ADAC._L0227
                        .BRANCH   20,ADAC._L0225
                        JMP       ADAC._L0225
ADAC._L0227:
                        .BLOCK    675
                        .LINE     676
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, ADAC.ADC16str AND 0FFh
                        LDI       _ACCCHI, ADAC.ADC16str SHRB 8
                        CALL      SYSTEM.StrConst2Str
ADAC._L0228:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     677
                        LDI       _ACCA, 002EEh SHRB 8
                        LDI       _ACCB, 002EEh AND 0FFh
                        .FRAME  0
                        CALL      SYSTEM.MDELAY
                        .ENDBLOCK 678
ADAC._L0225:
ADAC._L0226:
                        .LINE     679
                        LDI       _ACCA, 000h
                        STS       ADAC.X, _ACCA
                        .LINE     680
                        .BRANCH   17,ADAC.LCD1XY
                        CALL      ADAC.LCD1XY
                        .LINE     681
                        LDS       _ACCA, ADAC.IOpresent
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0231
                        BRNE      ADAC._L0231
                        .BRANCH   20,ADAC._L0229
                        JMP       ADAC._L0229
ADAC._L0231:
                        .BLOCK    681
                        .LINE     682
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, ADAC.IO816str AND 0FFh
                        LDI       _ACCCHI, ADAC.IO816str SHRB 8
                        CALL      SYSTEM.StrConst2Str
ADAC._L0232:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     683
                        LDI       _ACCA, 002EEh SHRB 8
                        LDI       _ACCB, 002EEh AND 0FFh
                        .FRAME  0
                        CALL      SYSTEM.MDELAY
                        .ENDBLOCK 684
ADAC._L0229:
ADAC._L0230:
                        .ENDBLOCK 685
ADAC.WriteFeaturesLCD_X:
                        .LINE     685
                        .BRANCH   19
                        RET
                        .ENDFUNC  685

                        .FUNC     SollWerteOnLCD, 002B2h, 00020h
ADAC.SollWerteOnLCD:
                        .RETURNS   0
                        .BLOCK    691
                        .LINE     692
                        LDS       _ACCA, ADAC.ChangedFlag
                        COM       _ACCA
                        PUSH      _ACCA
                        LDS       _ACCA, ADAC.Modify
                        CPI       _ACCA, 014h
                        LDI       _ACCA, 0
                        BRLO      ADAC._L0233
                        LDI       _ACCA, 0FFh
ADAC._L0233:
                        POP       _ACCB
                        AND       _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0236
                        BRNE      ADAC._L0236
                        .BRANCH   20,ADAC._L0234
                        JMP       ADAC._L0234
ADAC._L0236:
                        .BLOCK    692
                        .LINE     693
                        .BRANCH   20,ADAC.SollWerteOnLCD_X
                        JMP       ADAC.SollWerteOnLCD_X
                        .ENDBLOCK 694
ADAC._L0234:
ADAC._L0235:
                        .LINE     695
                        LDI       _ACCA, 002h
                        STS       ADAC.DIGITS, _ACCA
                        .LINE     696
                        LDI       _ACCA, 004h
                        STS       ADAC.NACHKOMMA, _ACCA
                        .LINE     697
                        LDI       _ACCA, 000h
                        STS       ADAC.X, _ACCA
                        .LINE     698
                        LDI       _ACCA, 000h
                        STS       ADAC.Y, _ACCA
                        .LINE     699
                        .BRANCH   17,ADAC.LCD1XY
                        CALL      ADAC.LCD1XY
                        .LINE     700
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCA, ADAC.Modify
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,ADAC.GETNEWVALUE
                        CALL       ADAC.GETNEWVALUE
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0239
                        BRNE      ADAC._L0239
                        .BRANCH   20,ADAC._L0237
                        JMP       ADAC._L0237
ADAC._L0239:
                        .BLOCK    701
                        .LINE     701
                        LDS       _ACCB, ADAC.ParamInt
                        LDS       _ACCA, ADAC.ParamInt+1
                        MOV       _ACCA, _ACCB
                        STS       ADAC.PARAMBYTE, _ACCA
                        .LINE     702
                        LDS       _ACCA, ADAC.IncrFine
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0242
                        BRNE      ADAC._L0242
                        .BRANCH   20,ADAC._L0240
                        JMP       ADAC._L0240
ADAC._L0242:
                        .BLOCK    702
                        .LINE     703
                        LDI       _ACCCLO, ADAC.ParamStr AND 0FFh
                        LDI       _ACCCHI, ADAC.ParamStr SHRB 8
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
                        LDS       _ACCA, ADAC.ParamByte
                        MOV       _ACCDLO, _ACCA
                        CALL      SYSTEM.Hex2Str8
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
                        .LINE     704
                        LDI       _ACCA, 024h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .ENDBLOCK 705
                        .BRANCH   20,ADAC._L0241
                        JMP       ADAC._L0241
ADAC._L0240:
                        .BLOCK    705
                        .LINE     706
                        LDI       _ACCCLO, ADAC.ParamStr AND 0FFh
                        LDI       _ACCCHI, ADAC.ParamStr SHRB 8
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
                        LDS       _ACCA, ADAC.ParamByte
                        MOV       _ACCDLO, _ACCA
                        CALL      SYSTEM.Bin2Str8
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
                        .ENDBLOCK 707
ADAC._L0241:
                        .ENDBLOCK 708
                        .BRANCH   20,ADAC._L0238
                        JMP       ADAC._L0238
ADAC._L0237:
                        .BLOCK    708
                        .LINE     709
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,ADAC.PARAMROUND1000
                        CALL      ADAC.PARAMROUND1000
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     710
                        .BRANCH   17,ADAC.PARAMTOPMSTR
                        CALL      ADAC.PARAMTOPMSTR
                        .LINE     711
                        LDI       _ACCCLO, ADAC.ParamStr AND 0FFh
                        LDI       _ACCCHI, ADAC.ParamStr SHRB 8
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
                        LDI       _ACCCLO, ADAC.ParamStr AND 0FFh
                        LDI       _ACCCHI, ADAC.ParamStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCA, 001h
                        PUSH      _ACCA
                        LDI       _ACCA, 007h
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
                        .ENDBLOCK 712
ADAC._L0238:
                        .LINE     713
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, ADAC.ParamStr AND 0FFh
                        LDI       _ACCCHI, ADAC.ParamStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     714
                        LDI       _ACCA, 000h
                        .FRAME  0
                        CALL      SYSTEM.LCDCLREOL_M
                        .LINE     715
                        LDI       _ACCA, 007h
                        STS       ADAC.X, _ACCA
                        .LINE     716
                        .BRANCH   17,ADAC.LCD1XY
                        CALL      ADAC.LCD1XY
                        .LINE     717
                        LDS       _ACCA, ADAC.Modify
                        CPI       _ACCA, 014h
                        LDI       _ACCA, 0FFh
                        BRLO      ADAC._L0243
                        CLR       _ACCA
ADAC._L0243:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0246
                        BRNE      ADAC._L0246
                        .BRANCH   20,ADAC._L0244
                        JMP       ADAC._L0244
ADAC._L0246:
                        .BLOCK    717
                        .LINE     718
                        LDI       _ACCA, 001h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .ENDBLOCK 719
                        .BRANCH   20,ADAC._L0245
                        JMP       ADAC._L0245
ADAC._L0244:
                        .BLOCK    719
                        .LINE     720
                        LDS       _ACCA, ADAC.IncrFine
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0249
                        BRNE      ADAC._L0249
                        .BRANCH   20,ADAC._L0247
                        JMP       ADAC._L0247
ADAC._L0249:
                        .BLOCK    720
                        .LINE     721
                        LDI       _ACCA, 002h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .ENDBLOCK 723
                        .BRANCH   20,ADAC._L0248
                        JMP       ADAC._L0248
ADAC._L0247:
                        .BLOCK    723
                        .LINE     723
                        LDS       _ACCA, ADAC.Modify
                        CPI       _ACCA, 01Eh
                        LDI       _ACCA, 0FFh
                        BRLO      ADAC._L0250
                        CLR       _ACCA
ADAC._L0250:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0253
                        BRNE      ADAC._L0253
                        .BRANCH   20,ADAC._L0251
                        JMP       ADAC._L0251
ADAC._L0253:
                        .BLOCK    723
                        .LINE     724
                        LDI       _ACCA, 000h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .ENDBLOCK 725
ADAC._L0251:
ADAC._L0252:
                        .ENDBLOCK 726
ADAC._L0248:
                        .ENDBLOCK 727
ADAC._L0245:
                        .LINE     728
                        LDI       _ACCA, 000h
                        STS       ADAC.X, _ACCA
                        .LINE     729
                        LDI       _ACCA, 001h
                        STS       ADAC.Y, _ACCA
                        .LINE     730
                        .BRANCH   17,ADAC.LCD1XY
                        CALL      ADAC.LCD1XY
                        .LINE     731
                        LDI       _ACCCLO, ADAC.ParamTextStr AND 0FFh
                        LDI       _ACCCHI, ADAC.ParamTextStr SHRB 8
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
                        LDI       _ACCCLO, ADAC.ParamTextArray AND 0FFh
                        LDI       _ACCCHI, ADAC.ParamTextArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, ADAC.Modify
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
                        CALL      SYSTEM.StrEEp2Str
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
                        .LINE     732
                        LDI       _ACCCLO, ADAC.ParamTextStr AND 0FFh
                        LDI       _ACCCHI, ADAC.ParamTextStr SHRB 8
                        LD        _ACCA, Z
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BRNE      ADAC._L0254
                        SER       _ACCA
ADAC._L0254:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0257
                        BRNE      ADAC._L0257
                        .BRANCH   20,ADAC._L0255
                        JMP       ADAC._L0255
ADAC._L0257:
                        .BLOCK    733
                        .LINE     733
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, ADAC.ValueStr AND 0FFh
                        LDI       _ACCCHI, ADAC.ValueStr SHRB 8
                        CALL      SYSTEM.StrConst2Str
ADAC._L0258:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     734
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDS       _ACCA, ADAC.Modify
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        ST        -Y, _ACCA
                        .FRAME  3
                        LDI       _ACCA, 002h
                        ST        -Y, _ACCA
                        .FRAME  4
                        LDI       _ACCB, 000h
                        ST        -Y, _ACCB
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
                        .LINE     735
                        LDI       _ACCA, 020h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .ENDBLOCK 736
                        .BRANCH   20,ADAC._L0256
                        JMP       ADAC._L0256
ADAC._L0255:
                        .BLOCK    736
                        .LINE     737
                        LDI       _ACCCLO, ADAC.ParamTextStr AND 0FFh
                        LDI       _ACCCHI, ADAC.ParamTextStr SHRB 8
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
                        LDI       _ACCCLO, ADAC.ParamTextStr AND 0FFh
                        LDI       _ACCCHI, ADAC.ParamTextStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCA, 008h
                        LDI       _ACCB, 020h
                        ST        -Y, _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCB, Y+001h
                        CP        _ACCA, _ACCB
                        BRCS      ADAC._L0259
                        MOV       _ACCA, _ACCB
ADAC._L0259:
                        LD        _ACCB, Z+
                        POP       _ACCCHI
                        POP       _ACCCLO
                        SUB       _ACCA, _ACCB
                        BRCC      ADAC._L0260
                        CLR       _ACCA
ADAC._L0260:
                        PUSH      _ACCA
                        LD        _ACCA, Y+
                        PUSH      _ACCA
                        MOV       _ACCA, _ACCB
                        LDI       _ACCB, 1
                        CALL      SYSTEM.StrCopyV
                        POP       _ACCA
                        POP       _ACCCLO
                        TST       _ACCCLO
                        BREQ      ADAC._L0262
ADAC._L0261:
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCCLO
                        BRNE      ADAC._L0261
ADAC._L0262:
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
                        .LINE     738
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, ADAC.ParamTextStr AND 0FFh
                        LDI       _ACCCHI, ADAC.ParamTextStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .ENDBLOCK 739
ADAC._L0256:
                        .ENDBLOCK 740
ADAC.SollWerteOnLCD_X:
                        .LINE     740
                        .BRANCH   19
                        RET
                        .ENDFUNC  740


                        .FILE     ADA-C-Parser.pas
                        .FUNC     ParseGetParam, 0001Bh, 00020h
ADAC.ParseGetParam:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 1
                        .BLOCK    29
                        .LINE     30
                        LDI       _ACCA, 000h
                        STD       Y+000h, _ACCA
                        .LINE     32
                        LDS       _ACCA, ADAC.SubCh
                        .LINE     33
                        CPI       _ACCA, 0
                        .BRANCH   2,ADAC._L0266
                        BRCC      ADAC._L0266
                        .BRANCH   20,ADAC._L0265
                        JMP       ADAC._L0265
ADAC._L0266:
                        CPI       _ACCA, 47
                        .BRANCH   3,ADAC._L0267
                        BREQ      ADAC._L0267
                        .BRANCH   1,ADAC._L0265
                        BRCS      ADAC._L0267
                        .BRANCH   20,ADAC._L0265
                        JMP       ADAC._L0265
ADAC._L0267:
ADAC._L0264:
                        .BLOCK    34
                        .LINE     34
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCA, ADAC.SubCh
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,ADAC.GETNEWVALUE
                        CALL       ADAC.GETNEWVALUE
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 35
                        .BRANCH   20,ADAC._L0263
                        JMP       ADAC._L0263
ADAC._L0265:
                        .LINE     36
                        CPI       _ACCA, 50
                        .BRANCH   2,ADAC._L0270
                        BRCC      ADAC._L0270
                        .BRANCH   20,ADAC._L0269
                        JMP       ADAC._L0269
ADAC._L0270:
                        CPI       _ACCA, 67
                        .BRANCH   3,ADAC._L0271
                        BREQ      ADAC._L0271
                        .BRANCH   1,ADAC._L0269
                        BRCS      ADAC._L0271
                        .BRANCH   20,ADAC._L0269
                        JMP       ADAC._L0269
ADAC._L0271:
ADAC._L0268:
                        .BLOCK    37
                        .LINE     37
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCA, ADAC.SubCh
                        SUBI      _ACCA, 032h AND 0FFh
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,ADAC.GETNEWVALUE
                        CALL       ADAC.GETNEWVALUE
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     38
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 39
                        .BRANCH   20,ADAC._L0263
                        JMP       ADAC._L0263
ADAC._L0269:
                        .LINE     40
                        CPI       _ACCA, 70
                        .BRANCH   2,ADAC._L0274
                        BRCC      ADAC._L0274
                        .BRANCH   20,ADAC._L0273
                        JMP       ADAC._L0273
ADAC._L0274:
                        CPI       _ACCA, 77
                        .BRANCH   3,ADAC._L0275
                        BREQ      ADAC._L0275
                        .BRANCH   1,ADAC._L0273
                        BRCS      ADAC._L0275
                        .BRANCH   20,ADAC._L0273
                        JMP       ADAC._L0273
ADAC._L0275:
ADAC._L0272:
                        .BLOCK    41
                        .LINE     41
                        LDI       _ACCCLO, ADAC.DACrawArray AND 0FFh
                        LDI       _ACCCHI, ADAC.DACrawArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, ADAC.SubCh
                        SUBI      _ACCA, 046h AND 0FFh
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCB, Z+
                        LD        _ACCA, Z+
                        STS       ADAC.PARAMINT, _ACCB
                        STS       ADAC.PARAMINT+1, _ACCA
                        .LINE     42
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 43
                        .BRANCH   20,ADAC._L0263
                        JMP       ADAC._L0263
ADAC._L0273:
                        .LINE     44
                        CPI       _ACCA, 80
                        .BRANCH   3,ADAC._L0278
                        BREQ      ADAC._L0278
                        .BRANCH   20,ADAC._L0277
                        JMP       ADAC._L0277
ADAC._L0278:
ADAC._L0276:
                        .BLOCK    45
                        .LINE     45
                        LDS       _ACCA, ADAC.Modify
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        STS       ADAC.PARAMINT, _ACCB
                        STS       ADAC.PARAMINT+1, _ACCA
                        .LINE     46
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 47
                        .BRANCH   20,ADAC._L0263
                        JMP       ADAC._L0263
ADAC._L0277:
                        .LINE     48
                        CPI       _ACCA, 89
                        .BRANCH   3,ADAC._L0281
                        BREQ      ADAC._L0281
                        .BRANCH   20,ADAC._L0280
                        JMP       ADAC._L0280
ADAC._L0281:
                        .BRANCH   20,ADAC._L0279
                        JMP       ADAC._L0279
ADAC._L0280:
                        CPI       _ACCA, 159
                        .BRANCH   3,ADAC._L0283
                        BREQ      ADAC._L0283
                        .BRANCH   20,ADAC._L0282
                        JMP       ADAC._L0282
ADAC._L0283:
ADAC._L0279:
                        .BLOCK    49
                        .LINE     49
                        LDS       _ACCB, ADAC.IncRast
                        LDS       _ACCA, ADAC.IncRast+1
                        STS       ADAC.PARAMINT, _ACCB
                        STS       ADAC.PARAMINT+1, _ACCA
                        .LINE     50
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 51
                        .BRANCH   20,ADAC._L0263
                        JMP       ADAC._L0263
ADAC._L0282:
                        .LINE     52
                        CPI       _ACCA, 95
                        .BRANCH   3,ADAC._L0286
                        BREQ      ADAC._L0286
                        .BRANCH   20,ADAC._L0285
                        JMP       ADAC._L0285
ADAC._L0286:
ADAC._L0284:
                        .BLOCK    53
                        .LINE     53
                        .LOOP
                        LDI       _ACCCLO, ADAC.SubCh AND 0FFh
                        LDI       _ACCCHI, ADAC.SubCh SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 000h
                        ST        Z, _ACCA
                        LDI       _ACCA, 007h
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
ADAC._L0289:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      ADAC._L0290
                        CLR       _ACCA
ADAC._L0290:
                        TST       _ACCA
                        .BRANCH   3,ADAC._L0291
                        BREQ      ADAC._L0291
                        .BRANCH   20,ADAC._L0288
                        JMP       ADAC._L0288
ADAC._L0291:
                        .BLOCK    54
                        .LINE     54
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCA, ADAC.SubCh
                        ST        -Y, _ACCA
                        .FRAME  4
                        .FRAME  3
                        .BRANCH   17,ADAC.GETNEWVALUE
                        CALL       ADAC.GETNEWVALUE
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     55
                        .BRANCH   17,ADAC.WRITEPARAM
                        CALL      ADAC.WRITEPARAM
                        .ENDBLOCK 56
ADAC._L0287:
                        .LINE     56
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,ADAC._L0288
                        BREQ      ADAC._L0288
                        .BRANCH   20,ADAC._L0289
                        JMP       ADAC._L0289
ADAC._L0288:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .LINE     57
                        .BRANCH   20,ADAC.ParseGetParam_X
                        JMP       ADAC.ParseGetParam_X
                        .ENDBLOCK 58
                        .BRANCH   20,ADAC._L0263
                        JMP       ADAC._L0263
ADAC._L0285:
                        .LINE     59
                        CPI       _ACCA, 96
                        .BRANCH   3,ADAC._L0294
                        BREQ      ADAC._L0294
                        .BRANCH   20,ADAC._L0293
                        JMP       ADAC._L0293
ADAC._L0294:
ADAC._L0292:
                        .BLOCK    60
                        .LINE     60
                        .LOOP
                        LDI       _ACCCLO, ADAC.SubCh AND 0FFh
                        LDI       _ACCCHI, ADAC.SubCh SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 00Ah
                        ST        Z, _ACCA
                        LDI       _ACCA, 011h
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
ADAC._L0297:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      ADAC._L0298
                        CLR       _ACCA
ADAC._L0298:
                        TST       _ACCA
                        .BRANCH   3,ADAC._L0299
                        BREQ      ADAC._L0299
                        .BRANCH   20,ADAC._L0296
                        JMP       ADAC._L0296
ADAC._L0299:
                        .BLOCK    61
                        .LINE     61
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCA, ADAC.SubCh
                        ST        -Y, _ACCA
                        .FRAME  4
                        .FRAME  3
                        .BRANCH   17,ADAC.GETNEWVALUE
                        CALL       ADAC.GETNEWVALUE
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     62
                        .BRANCH   17,ADAC.WRITEPARAM
                        CALL      ADAC.WRITEPARAM
                        .ENDBLOCK 63
ADAC._L0295:
                        .LINE     63
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,ADAC._L0296
                        BREQ      ADAC._L0296
                        .BRANCH   20,ADAC._L0297
                        JMP       ADAC._L0297
ADAC._L0296:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .LINE     64
                        .BRANCH   20,ADAC.ParseGetParam_X
                        JMP       ADAC.ParseGetParam_X
                        .ENDBLOCK 65
                        .BRANCH   20,ADAC._L0263
                        JMP       ADAC._L0263
ADAC._L0293:
                        .LINE     66
                        CPI       _ACCA, 98
                        .BRANCH   3,ADAC._L0302
                        BREQ      ADAC._L0302
                        .BRANCH   20,ADAC._L0301
                        JMP       ADAC._L0301
ADAC._L0302:
ADAC._L0300:
                        .BLOCK    67
                        .LINE     67
                        .LOOP
                        LDI       _ACCCLO, ADAC.SubCh AND 0FFh
                        LDI       _ACCCHI, ADAC.SubCh SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 01Eh
                        ST        Z, _ACCA
                        LDI       _ACCA, 025h
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
ADAC._L0305:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      ADAC._L0306
                        CLR       _ACCA
ADAC._L0306:
                        TST       _ACCA
                        .BRANCH   3,ADAC._L0307
                        BREQ      ADAC._L0307
                        .BRANCH   20,ADAC._L0304
                        JMP       ADAC._L0304
ADAC._L0307:
                        .BLOCK    68
                        .LINE     68
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCA, ADAC.SubCh
                        ST        -Y, _ACCA
                        .FRAME  4
                        .FRAME  3
                        .BRANCH   17,ADAC.GETNEWVALUE
                        CALL       ADAC.GETNEWVALUE
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     69
                        .BRANCH   17,ADAC.WRITEPARAMINT
                        CALL      ADAC.WRITEPARAMINT
                        .ENDBLOCK 70
ADAC._L0303:
                        .LINE     70
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,ADAC._L0304
                        BREQ      ADAC._L0304
                        .BRANCH   20,ADAC._L0305
                        JMP       ADAC._L0305
ADAC._L0304:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .LINE     71
                        .BRANCH   20,ADAC.ParseGetParam_X
                        JMP       ADAC.ParseGetParam_X
                        .ENDBLOCK 72
                        .BRANCH   20,ADAC._L0263
                        JMP       ADAC._L0263
ADAC._L0301:
                        .LINE     73
                        CPI       _ACCA, 99
                        .BRANCH   3,ADAC._L0310
                        BREQ      ADAC._L0310
                        .BRANCH   20,ADAC._L0309
                        JMP       ADAC._L0309
ADAC._L0310:
ADAC._L0308:
                        .BLOCK    74
                        .LINE     74
                        .LOOP
                        LDI       _ACCCLO, ADAC.SubCh AND 0FFh
                        LDI       _ACCCHI, ADAC.SubCh SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 000h
                        ST        Z, _ACCA
                        LDI       _ACCA, 007h
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
ADAC._L0313:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      ADAC._L0314
                        CLR       _ACCA
ADAC._L0314:
                        TST       _ACCA
                        .BRANCH   3,ADAC._L0315
                        BREQ      ADAC._L0315
                        .BRANCH   20,ADAC._L0312
                        JMP       ADAC._L0312
ADAC._L0315:
                        .BLOCK    75
                        .LINE     75
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCA, ADAC.SubCh
                        ST        -Y, _ACCA
                        .FRAME  4
                        .FRAME  3
                        .BRANCH   17,ADAC.GETNEWVALUE
                        CALL       ADAC.GETNEWVALUE
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     76
                        .BRANCH   17,ADAC.WRITEPARAM
                        CALL      ADAC.WRITEPARAM
                        .ENDBLOCK 77
ADAC._L0311:
                        .LINE     77
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,ADAC._L0312
                        BREQ      ADAC._L0312
                        .BRANCH   20,ADAC._L0313
                        JMP       ADAC._L0313
ADAC._L0312:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .LINE     78
                        .LOOP
                        LDI       _ACCCLO, ADAC.SubCh AND 0FFh
                        LDI       _ACCCHI, ADAC.SubCh SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 00Ah
                        ST        Z, _ACCA
                        LDI       _ACCA, 011h
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
ADAC._L0318:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      ADAC._L0319
                        CLR       _ACCA
ADAC._L0319:
                        TST       _ACCA
                        .BRANCH   3,ADAC._L0320
                        BREQ      ADAC._L0320
                        .BRANCH   20,ADAC._L0317
                        JMP       ADAC._L0317
ADAC._L0320:
                        .BLOCK    79
                        .LINE     79
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCA, ADAC.SubCh
                        ST        -Y, _ACCA
                        .FRAME  4
                        .FRAME  3
                        .BRANCH   17,ADAC.GETNEWVALUE
                        CALL       ADAC.GETNEWVALUE
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     80
                        .BRANCH   17,ADAC.WRITEPARAM
                        CALL      ADAC.WRITEPARAM
                        .ENDBLOCK 81
ADAC._L0316:
                        .LINE     81
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,ADAC._L0317
                        BREQ      ADAC._L0317
                        .BRANCH   20,ADAC._L0318
                        JMP       ADAC._L0318
ADAC._L0317:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .LINE     82
                        .LOOP
                        LDI       _ACCCLO, ADAC.SubCh AND 0FFh
                        LDI       _ACCCHI, ADAC.SubCh SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 01Eh
                        ST        Z, _ACCA
                        LDI       _ACCA, 025h
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
ADAC._L0323:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      ADAC._L0324
                        CLR       _ACCA
ADAC._L0324:
                        TST       _ACCA
                        .BRANCH   3,ADAC._L0325
                        BREQ      ADAC._L0325
                        .BRANCH   20,ADAC._L0322
                        JMP       ADAC._L0322
ADAC._L0325:
                        .BLOCK    83
                        .LINE     83
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCA, ADAC.SubCh
                        ST        -Y, _ACCA
                        .FRAME  4
                        .FRAME  3
                        .BRANCH   17,ADAC.GETNEWVALUE
                        CALL       ADAC.GETNEWVALUE
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     84
                        .BRANCH   17,ADAC.WRITEPARAMINT
                        CALL      ADAC.WRITEPARAMINT
                        .ENDBLOCK 85
ADAC._L0321:
                        .LINE     85
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,ADAC._L0322
                        BREQ      ADAC._L0322
                        .BRANCH   20,ADAC._L0323
                        JMP       ADAC._L0323
ADAC._L0322:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .LINE     86
                        .BRANCH   20,ADAC.ParseGetParam_X
                        JMP       ADAC.ParseGetParam_X
                        .ENDBLOCK 87
                        .BRANCH   20,ADAC._L0263
                        JMP       ADAC._L0263
ADAC._L0309:
                        .LINE     88
                        CPI       _ACCA, 157
                        .BRANCH   3,ADAC._L0328
                        BREQ      ADAC._L0328
                        .BRANCH   20,ADAC._L0327
                        JMP       ADAC._L0327
ADAC._L0328:
ADAC._L0326:
                        .BLOCK    89
                        .LINE     89
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .LINE     90
                        LDS       _ACCA, ADAC.IntegrateAD16
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0331
                        BRNE      ADAC._L0331
                        .BRANCH   20,ADAC._L0329
                        JMP       ADAC._L0329
ADAC._L0331:
                        .BLOCK    90
                        .LINE     91
                        LDI       _ACCA, 00001h SHRB 8
                        LDI       _ACCB, 00001h AND 0FFh
                        STS       ADAC.PARAMINT, _ACCB
                        STS       ADAC.PARAMINT+1, _ACCA
                        .ENDBLOCK 92
                        .BRANCH   20,ADAC._L0330
                        JMP       ADAC._L0330
ADAC._L0329:
                        .BLOCK    92
                        .LINE     93
                        LDI       _ACCA, 00000h SHRB 8
                        LDI       _ACCB, 00000h AND 0FFh
                        STS       ADAC.PARAMINT, _ACCB
                        STS       ADAC.PARAMINT+1, _ACCA
                        .ENDBLOCK 94
ADAC._L0330:
                        .ENDBLOCK 95
                        .BRANCH   20,ADAC._L0263
                        JMP       ADAC._L0263
ADAC._L0327:
                        .LINE     96
                        CPI       _ACCA, 100
                        .BRANCH   2,ADAC._L0334
                        BRCC      ADAC._L0334
                        .BRANCH   20,ADAC._L0333
                        JMP       ADAC._L0333
ADAC._L0334:
                        CPI       _ACCA, 127
                        .BRANCH   3,ADAC._L0335
                        BREQ      ADAC._L0335
                        .BRANCH   1,ADAC._L0333
                        BRCS      ADAC._L0335
                        .BRANCH   20,ADAC._L0333
                        JMP       ADAC._L0333
ADAC._L0335:
ADAC._L0332:
                        .BLOCK    97
                        .LINE     97
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .LINE     98
                        LDI       _ACCCLO, ADAC.OffsetArray AND 0FFh
                        LDI       _ACCCHI, ADAC.OffsetArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, ADAC.SubCh
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
                        STS       ADAC.PARAMINT, _ACCB
                        STS       ADAC.PARAMINT+1, _ACCA
                        .ENDBLOCK 99
                        .BRANCH   20,ADAC._L0263
                        JMP       ADAC._L0263
ADAC._L0333:
                        .LINE     100
                        CPI       _ACCA, 180
                        .BRANCH   2,ADAC._L0338
                        BRCC      ADAC._L0338
                        .BRANCH   20,ADAC._L0337
                        JMP       ADAC._L0337
ADAC._L0338:
                        CPI       _ACCA, 187
                        .BRANCH   3,ADAC._L0339
                        BREQ      ADAC._L0339
                        .BRANCH   1,ADAC._L0337
                        BRCS      ADAC._L0339
                        .BRANCH   20,ADAC._L0337
                        JMP       ADAC._L0337
ADAC._L0339:
ADAC._L0336:
                        .BLOCK    101
                        .LINE     101
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .LINE     102
                        LDI       _ACCCLO, ADAC.PortInitArray AND 0FFh
                        LDI       _ACCCHI, ADAC.PortInitArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, ADAC.SubCh
                        SUBI      _ACCA, 0B4h AND 0FFh
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        CALL      SYSTEM.ReadEEp8
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        STS       ADAC.PARAMINT, _ACCB
                        STS       ADAC.PARAMINT+1, _ACCA
                        .ENDBLOCK 103
                        .BRANCH   20,ADAC._L0263
                        JMP       ADAC._L0263
ADAC._L0337:
                        .LINE     104
                        CPI       _ACCA, 190
                        .BRANCH   2,ADAC._L0342
                        BRCC      ADAC._L0342
                        .BRANCH   20,ADAC._L0341
                        JMP       ADAC._L0341
ADAC._L0342:
                        CPI       _ACCA, 197
                        .BRANCH   3,ADAC._L0343
                        BREQ      ADAC._L0343
                        .BRANCH   1,ADAC._L0341
                        BRCS      ADAC._L0343
                        .BRANCH   20,ADAC._L0341
                        JMP       ADAC._L0341
ADAC._L0343:
ADAC._L0340:
                        .BLOCK    105
                        .LINE     105
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .LINE     106
                        LDI       _ACCCLO, ADAC.DirInitArray AND 0FFh
                        LDI       _ACCCHI, ADAC.DirInitArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, ADAC.SubCh
                        SUBI      _ACCA, 0BEh AND 0FFh
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        CALL      SYSTEM.ReadEEp8
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        STS       ADAC.PARAMINT, _ACCB
                        STS       ADAC.PARAMINT+1, _ACCA
                        .ENDBLOCK 107
                        .BRANCH   20,ADAC._L0263
                        JMP       ADAC._L0263
ADAC._L0341:
                        .LINE     108
                        CPI       _ACCA, 200
                        .BRANCH   2,ADAC._L0346
                        BRCC      ADAC._L0346
                        .BRANCH   20,ADAC._L0345
                        JMP       ADAC._L0345
ADAC._L0346:
                        CPI       _ACCA, 229
                        .BRANCH   3,ADAC._L0347
                        BREQ      ADAC._L0347
                        .BRANCH   1,ADAC._L0345
                        BRCS      ADAC._L0347
                        .BRANCH   20,ADAC._L0345
                        JMP       ADAC._L0345
ADAC._L0347:
ADAC._L0344:
                        .BLOCK    109
                        .LINE     109
                        LDI       _ACCCLO, ADAC.ScaleArray AND 0FFh
                        LDI       _ACCCHI, ADAC.ScaleArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, ADAC.SubCh
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
                        STS       ADAC.PARAM, _ACCB
                        STS       ADAC.PARAM+1, _ACCA
                        STS       ADAC.PARAM+2, _ACCALO
                        STS       ADAC.PARAM+3, _ACCAHI
                        .ENDBLOCK 110
                        .BRANCH   20,ADAC._L0263
                        JMP       ADAC._L0263
ADAC._L0345:
                        .LINE     111
                        CPI       _ACCA, 230
                        .BRANCH   3,ADAC._L0350
                        BREQ      ADAC._L0350
                        .BRANCH   20,ADAC._L0349
                        JMP       ADAC._L0349
ADAC._L0350:
ADAC._L0348:
                        .BLOCK    112
                        .LINE     112
                        LDS       _ACCA, ADAC.I2CslaveAdr
                        PUSH      _ACCA
                        LDI       _ACCCLO, ADAC.ParamByte AND 0FFh
                        LDI       _ACCCHI, ADAC.ParamByte SHRB 8
                        LDI       _ACCBLO, 00001h AND 0FFh
                        LDI       _ACCBHI, 00001h SHRB 8
                        POP       _ACCDLO
                        CALL       SYSTEM.TWIInp
                        .LINE     113
                        LDS       _ACCA, ADAC.ParamByte
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        STS       ADAC.PARAMINT, _ACCB
                        STS       ADAC.PARAMINT+1, _ACCA
                        .LINE     114
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 115
                        .BRANCH   20,ADAC._L0263
                        JMP       ADAC._L0263
ADAC._L0349:
                        .LINE     116
                        CPI       _ACCA, 231
                        .BRANCH   3,ADAC._L0353
                        BREQ      ADAC._L0353
                        .BRANCH   20,ADAC._L0352
                        JMP       ADAC._L0352
ADAC._L0353:
ADAC._L0351:
                        .BLOCK    117
                        .LINE     117
                        LDS       _ACCA, ADAC.I2CslaveAdr
                        PUSH      _ACCA
                        LDI       _ACCCLO, ADAC.ParamInt AND 0FFh
                        LDI       _ACCCHI, ADAC.ParamInt SHRB 8
                        LDI       _ACCBLO, 00002h AND 0FFh
                        LDI       _ACCBHI, 00002h SHRB 8
                        POP       _ACCDLO
                        CALL       SYSTEM.TWIInp
                        .LINE     118
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 119
                        .BRANCH   20,ADAC._L0263
                        JMP       ADAC._L0263
ADAC._L0352:
                        .LINE     120
                        CPI       _ACCA, 232
                        .BRANCH   3,ADAC._L0356
                        BREQ      ADAC._L0356
                        .BRANCH   20,ADAC._L0355
                        JMP       ADAC._L0355
ADAC._L0356:
ADAC._L0354:
                        .BLOCK    121
                        .LINE     121
                        LDS       _ACCA, ADAC.I2CslaveAdr
                        PUSH      _ACCA
                        LDI       _ACCCLO, ADAC.ParamInt AND 0FFh
                        LDI       _ACCCHI, ADAC.ParamInt SHRB 8
                        LDI       _ACCBLO, 00002h AND 0FFh
                        LDI       _ACCBHI, 00002h SHRB 8
                        POP       _ACCDLO
                        CALL       SYSTEM.TWIInp
                        .LINE     122
                        LDS       _ACCB, ADAC.ParamInt
                        LDS       _ACCA, ADAC.ParamInt+1
                        MOV       _ACCBLO, _ACCA
                        MOV       _ACCA, _ACCB
                        MOV       _ACCB, _ACCBLO
                        STS       ADAC.PARAMINT, _ACCB
                        STS       ADAC.PARAMINT+1, _ACCA
                        .LINE     123
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 124
                        .BRANCH   20,ADAC._L0263
                        JMP       ADAC._L0263
ADAC._L0355:
                        .LINE     125
                        CPI       _ACCA, 233
                        .BRANCH   3,ADAC._L0359
                        BREQ      ADAC._L0359
                        .BRANCH   20,ADAC._L0358
                        JMP       ADAC._L0358
ADAC._L0359:
ADAC._L0357:
                        .BLOCK    126
                        .LINE     126
                        LDS       _ACCA, ADAC.I2CslaveAdr
                        PUSH      _ACCA
                        LDI       _ACCCLO, ADAC.ParamInt AND 0FFh
                        LDI       _ACCCHI, ADAC.ParamInt SHRB 8
                        LDI       _ACCBLO, 00002h AND 0FFh
                        LDI       _ACCBHI, 00002h SHRB 8
                        POP       _ACCDLO
                        CALL       SYSTEM.TWIInp
                        .LINE     127
                        LDS       _ACCB, ADAC.ParamInt
                        LDS       _ACCA, ADAC.ParamInt+1
                        MOV       _ACCBLO, _ACCA
                        MOV       _ACCA, _ACCB
                        MOV       _ACCB, _ACCBLO
                        LDI       _ACCALO, 007h
                        CALL      SYSTEM.SHR16
                        STS       ADAC.PARAMINT, _ACCB
                        STS       ADAC.PARAMINT+1, _ACCA
                        .LINE     128
                        LDS       _ACCB, ADAC.ParamInt
                        LDS       _ACCA, ADAC.ParamInt+1
                        SBRS      _ACCA, 7
                        RJMP      ADAC._L0360
                        LDI       _ACCAHI, 0FFh
                        LDI       _ACCALO, 0FFh
                        RJMP      ADAC._L0361
ADAC._L0360:
                        CLR       _ACCAHI
                        CLR       _ACCALO
ADAC._L0361:
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
                        STS       ADAC.PARAM, _ACCB
                        STS       ADAC.PARAM+1, _ACCA
                        STS       ADAC.PARAM+2, _ACCALO
                        STS       ADAC.PARAM+3, _ACCAHI
                        .ENDBLOCK 129
                        .BRANCH   20,ADAC._L0263
                        JMP       ADAC._L0263
ADAC._L0358:
                        .LINE     130
                        CPI       _ACCA, 234
                        .BRANCH   3,ADAC._L0364
                        BREQ      ADAC._L0364
                        .BRANCH   20,ADAC._L0363
                        JMP       ADAC._L0363
ADAC._L0364:
ADAC._L0362:
                        .BLOCK    131
                        .LINE     131
                        LDS       _ACCA, ADAC.I2CslaveAdr
                        PUSH      _ACCA
                        LDI       _ACCCLO, ADAC.ParamInt AND 0FFh
                        LDI       _ACCCHI, ADAC.ParamInt SHRB 8
                        LDI       _ACCBLO, 00002h AND 0FFh
                        LDI       _ACCBHI, 00002h SHRB 8
                        POP       _ACCDLO
                        CALL       SYSTEM.TWIInp
                        .LINE     132
                        LDS       _ACCB, ADAC.ParamInt
                        LDS       _ACCA, ADAC.ParamInt+1
                        MOV       _ACCBLO, _ACCA
                        MOV       _ACCA, _ACCB
                        MOV       _ACCB, _ACCBLO
                        STS       ADAC.PARAMINT, _ACCB
                        STS       ADAC.PARAMINT+1, _ACCA
                        .LINE     133
                        LDS       _ACCB, ADAC.ParamInt
                        LDS       _ACCA, ADAC.ParamInt+1
                        SBRS      _ACCA, 7
                        RJMP      ADAC._L0365
                        LDI       _ACCAHI, 0FFh
                        LDI       _ACCALO, 0FFh
                        RJMP      ADAC._L0366
ADAC._L0365:
                        CLR       _ACCAHI
                        CLR       _ACCALO
ADAC._L0366:
                        SET
                        BLD       Flags, _SIGN
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.LIntToFloat
                        MOVW      _ACCDLO, _ACCB
                        MOVW      _ACCELO, _ACCALO
                        LDI       _ACCBLO, 000h
                        LDI       _ACCBHI, 000h
                        LDI       _ACCCLO, 080h
                        LDI       _ACCCHI, 043h
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.DivFloat_R
                        STS       ADAC.PARAM, _ACCB
                        STS       ADAC.PARAM+1, _ACCA
                        STS       ADAC.PARAM+2, _ACCALO
                        STS       ADAC.PARAM+3, _ACCAHI
                        .ENDBLOCK 134
                        .BRANCH   20,ADAC._L0263
                        JMP       ADAC._L0263
ADAC._L0363:
                        .LINE     135
                        CPI       _ACCA, 239
                        .BRANCH   3,ADAC._L0369
                        BREQ      ADAC._L0369
                        .BRANCH   20,ADAC._L0368
                        JMP       ADAC._L0368
ADAC._L0369:
ADAC._L0367:
                        .BLOCK    136
                        .LINE     136
                        LDS       _ACCA, ADAC.I2CslaveAdr
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        STS       ADAC.PARAMINT, _ACCB
                        STS       ADAC.PARAMINT+1, _ACCA
                        .LINE     137
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 138
                        .BRANCH   20,ADAC._L0263
                        JMP       ADAC._L0263
ADAC._L0368:
                        .LINE     139
                        CPI       _ACCA, 240
                        .BRANCH   2,ADAC._L0372
                        BRCC      ADAC._L0372
                        .BRANCH   20,ADAC._L0371
                        JMP       ADAC._L0371
ADAC._L0372:
                        CPI       _ACCA, 243
                        .BRANCH   3,ADAC._L0373
                        BREQ      ADAC._L0373
                        .BRANCH   1,ADAC._L0371
                        BRCS      ADAC._L0373
                        .BRANCH   20,ADAC._L0371
                        JMP       ADAC._L0371
ADAC._L0373:
ADAC._L0370:
                        .BLOCK    140
                        .LINE     140
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .LINE     141
                        LDI       _ACCCLO, ADAC.TrigMaskArray AND 0FFh
                        LDI       _ACCCHI, ADAC.TrigMaskArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, ADAC.SubCh
                        SUBI      _ACCA, 0F0h AND 0FFh
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        CALL      SYSTEM.ReadEEp8
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        STS       ADAC.PARAMINT, _ACCB
                        STS       ADAC.PARAMINT+1, _ACCA
                        .ENDBLOCK 142
                        .BRANCH   20,ADAC._L0263
                        JMP       ADAC._L0263
ADAC._L0371:
                        .LINE     143
                        CPI       _ACCA, 156
                        .BRANCH   3,ADAC._L0376
                        BREQ      ADAC._L0376
                        .BRANCH   20,ADAC._L0375
                        JMP       ADAC._L0375
ADAC._L0376:
                        .BRANCH   20,ADAC._L0374
                        JMP       ADAC._L0374
ADAC._L0375:
                        CPI       _ACCA, 246
                        .BRANCH   3,ADAC._L0378
                        BREQ      ADAC._L0378
                        .BRANCH   20,ADAC._L0377
                        JMP       ADAC._L0377
ADAC._L0378:
ADAC._L0374:
                        .BLOCK    144
                        .LINE     144
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .LINE     145
                        LDI       _ACCCLO, ADAC.ExtRef AND 0FFh
                        LDI       _ACCCHI, ADAC.ExtRef SHRB 8
                        CALL      SYSTEM.ReadEEp8
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        STS       ADAC.PARAMINT, _ACCB
                        STS       ADAC.PARAMINT+1, _ACCA
                        .ENDBLOCK 146
                        .BRANCH   20,ADAC._L0263
                        JMP       ADAC._L0263
ADAC._L0377:
                        .LINE     147
                        CPI       _ACCA, 247
                        .BRANCH   3,ADAC._L0381
                        BREQ      ADAC._L0381
                        .BRANCH   20,ADAC._L0380
                        JMP       ADAC._L0380
ADAC._L0381:
ADAC._L0379:
                        .BLOCK    148
                        .LINE     148
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .LINE     149
                        LDI       _ACCCLO, ADAC.TrigTimerValue AND 0FFh
                        LDI       _ACCCHI, ADAC.TrigTimerValue SHRB 8
                        CALL      SYSTEM._ReadEEp16
                        STS       ADAC.PARAMINT, _ACCB
                        STS       ADAC.PARAMINT+1, _ACCA
                        .ENDBLOCK 150
                        .BRANCH   20,ADAC._L0263
                        JMP       ADAC._L0263
ADAC._L0380:
                        .LINE     151
                        CPI       _ACCA, 248
                        .BRANCH   3,ADAC._L0384
                        BREQ      ADAC._L0384
                        .BRANCH   20,ADAC._L0383
                        JMP       ADAC._L0383
ADAC._L0384:
ADAC._L0382:
                        .BLOCK    152
                        .LINE     152
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .LINE     153
                        LDI       _ACCCLO, ADAC.TrigLevel AND 0FFh
                        LDI       _ACCCHI, ADAC.TrigLevel SHRB 8
                        CALL      SYSTEM.ReadEEp8
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        STS       ADAC.PARAMINT, _ACCB
                        STS       ADAC.PARAMINT+1, _ACCA
                        .ENDBLOCK 154
                        .BRANCH   20,ADAC._L0263
                        JMP       ADAC._L0263
ADAC._L0383:
                        .LINE     155
                        CPI       _ACCA, 249
                        .BRANCH   3,ADAC._L0387
                        BREQ      ADAC._L0387
                        .BRANCH   20,ADAC._L0386
                        JMP       ADAC._L0386
ADAC._L0387:
ADAC._L0385:
                        .BLOCK    156
                        .LINE     156
                        LDI       _ACCA, 0FFh
                        STS       ADAC.TRIGGER, _ACCA
                        .LINE     157
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDS       _ACCA, ADAC.Status
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ADAC.SERPROMPT
                        CALL      ADAC.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     158
                        .BRANCH   20,ADAC.ParseGetParam_X
                        JMP       ADAC.ParseGetParam_X
                        .ENDBLOCK 159
                        .BRANCH   20,ADAC._L0263
                        JMP       ADAC._L0263
ADAC._L0386:
                        .LINE     160
                        CPI       _ACCA, 252
                        .BRANCH   3,ADAC._L0390
                        BREQ      ADAC._L0390
                        .BRANCH   20,ADAC._L0389
                        JMP       ADAC._L0389
ADAC._L0390:
ADAC._L0388:
                        .BLOCK    161
                        .LINE     161
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .LINE     162
                        LDI       _ACCCLO, ADAC.EESerBaudReg AND 0FFh
                        LDI       _ACCCHI, ADAC.EESerBaudReg SHRB 8
                        CALL      SYSTEM.ReadEEp8
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        STS       ADAC.PARAMINT, _ACCB
                        STS       ADAC.PARAMINT+1, _ACCA
                        .ENDBLOCK 163
                        .BRANCH   20,ADAC._L0263
                        JMP       ADAC._L0263
ADAC._L0389:
                        .LINE     164
                        CPI       _ACCA, 253
                        .BRANCH   3,ADAC._L0393
                        BREQ      ADAC._L0393
                        .BRANCH   20,ADAC._L0392
                        JMP       ADAC._L0392
ADAC._L0393:
ADAC._L0391:
                        .BLOCK    165
                        .LINE     165
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.Serout SHRB 1
                        LDI       _ACCA, SYSTEM.Serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, ADAC.SerInpStr AND 0FFh
                        LDI       _ACCCHI, ADAC.SerInpStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     166
                        .BRANCH   17,ADAC.SERCRLF
                        CALL      ADAC.SERCRLF
                        .LINE     167
                        .BRANCH   20,ADAC.ParseGetParam_X
                        JMP       ADAC.ParseGetParam_X
                        .ENDBLOCK 168
                        .BRANCH   20,ADAC._L0263
                        JMP       ADAC._L0263
ADAC._L0392:
                        .LINE     169
                        CPI       _ACCA, 254
                        .BRANCH   3,ADAC._L0396
                        BREQ      ADAC._L0396
                        .BRANCH   20,ADAC._L0395
                        JMP       ADAC._L0395
ADAC._L0396:
ADAC._L0394:
                        .BLOCK    170
                        .LINE     170
                        .BRANCH   17,ADAC.WRITECHPREFIX
                        CALL      ADAC.WRITECHPREFIX
                        .LINE     171
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.Serout SHRB 1
                        LDI       _ACCA, SYSTEM.Serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, ADAC.Vers1Str AND 0FFh
                        LDI       _ACCCHI, ADAC.Vers1Str SHRB 8
                        CALL      SYSTEM.StrConst2Str
ADAC._L0397:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     172
                        .BRANCH   17,ADAC.WRITEFEATURES
                        CALL      ADAC.WRITEFEATURES
                        .LINE     173
                        .BRANCH   17,ADAC.SERCRLF
                        CALL      ADAC.SERCRLF
                        .LINE     174
                        .BRANCH   20,ADAC.ParseGetParam_X
                        JMP       ADAC.ParseGetParam_X
                        .ENDBLOCK 175
                        .BRANCH   20,ADAC._L0263
                        JMP       ADAC._L0263
ADAC._L0395:
                        .LINE     176
                        CPI       _ACCA, 85
                        .BRANCH   3,ADAC._L0400
                        BREQ      ADAC._L0400
                        .BRANCH   20,ADAC._L0399
                        JMP       ADAC._L0399
ADAC._L0400:
ADAC._L0398:
                        .BLOCK    177
                        .LINE     177
                        .BRANCH   17,ADAC.WRITECHPREFIX
                        CALL      ADAC.WRITECHPREFIX
                        .LINE     178
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.Serout SHRB 1
                        LDI       _ACCA, SYSTEM.Serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, ADAC.EggStr AND 0FFh
                        LDI       _ACCCHI, ADAC.EggStr SHRB 8
                        CALL      SYSTEM.StrConst2Str
ADAC._L0401:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     179
                        .BRANCH   17,ADAC.SERCRLF
                        CALL      ADAC.SERCRLF
                        .LINE     180
                        .BRANCH   20,ADAC.ParseGetParam_X
                        JMP       ADAC.ParseGetParam_X
                        .ENDBLOCK 181
                        .BRANCH   20,ADAC._L0263
                        JMP       ADAC._L0263
ADAC._L0399:
                        .LINE     182
                        CPI       _ACCA, 251
                        .BRANCH   3,ADAC._L0404
                        BREQ      ADAC._L0404
                        .BRANCH   20,ADAC._L0403
                        JMP       ADAC._L0403
ADAC._L0404:
ADAC._L0402:
                        .BLOCK    183
                        .LINE     183
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .LINE     184
                        LDS       _ACCB, ADAC.Errcount
                        LDS       _ACCA, ADAC.Errcount+1
                        STS       ADAC.PARAMINT, _ACCB
                        STS       ADAC.PARAMINT+1, _ACCA
                        .ENDBLOCK 185
                        .BRANCH   20,ADAC._L0263
                        JMP       ADAC._L0263
ADAC._L0403:
                        .LINE     186
                        CPI       _ACCA, 250
                        .BRANCH   3,ADAC._L0407
                        BREQ      ADAC._L0407
                        .BRANCH   20,ADAC._L0406
                        JMP       ADAC._L0406
ADAC._L0407:
                        .BRANCH   20,ADAC._L0405
                        JMP       ADAC._L0405
ADAC._L0406:
                        CPI       _ACCA, 255
                        .BRANCH   3,ADAC._L0409
                        BREQ      ADAC._L0409
                        .BRANCH   20,ADAC._L0408
                        JMP       ADAC._L0408
ADAC._L0409:
ADAC._L0405:
                        .BLOCK    187
                        .LINE     187
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDS       _ACCA, ADAC.Status
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ADAC.SERPROMPT
                        CALL      ADAC.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     188
                        .BRANCH   20,ADAC.ParseGetParam_X
                        JMP       ADAC.ParseGetParam_X
                        .ENDBLOCK 189
                        .BRANCH   20,ADAC._L0263
                        JMP       ADAC._L0263
ADAC._L0408:
                        .BLOCK    190
                        .LINE     191
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 005h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ADAC.SERPROMPT
                        CALL      ADAC.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     192
                        .BRANCH   20,ADAC.ParseGetParam_X
                        JMP       ADAC.ParseGetParam_X
                        .ENDBLOCK 193
ADAC._L0263:
                        .LINE     194
                        LDD       _ACCA, Y+000h
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0412
                        BRNE      ADAC._L0412
                        .BRANCH   20,ADAC._L0410
                        JMP       ADAC._L0410
ADAC._L0412:
                        .BLOCK    194
                        .LINE     195
                        .BRANCH   17,ADAC.WRITEPARAMINT
                        CALL      ADAC.WRITEPARAMINT
                        .ENDBLOCK 196
                        .BRANCH   20,ADAC._L0411
                        JMP       ADAC._L0411
ADAC._L0410:
                        .BLOCK    196
                        .LINE     197
                        .BRANCH   17,ADAC.WRITEPARAM
                        CALL      ADAC.WRITEPARAM
                        .ENDBLOCK 198
ADAC._L0411:
                        .ENDBLOCK 199
ADAC.ParseGetParam_X:
                        .LINE     199
                        .BRANCH   19
                        RET
                        .ENDFUNC  199

                        .FUNC     ParseSetParam, 000C9h, 00020h
ADAC.ParseSetParam:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 2
                        .BLOCK    204
                        .LINE     204
                        LDI       _ACCA, 0FFh
                        STS       ADAC.CHANGEDFLAG, _ACCA
                        .LINE     205
                        LDS       _ACCA, ADAC.SubCh
                        .LINE     206
                        CPI       _ACCA, 20
                        .BRANCH   2,ADAC._L0416
                        BRCC      ADAC._L0416
                        .BRANCH   20,ADAC._L0415
                        JMP       ADAC._L0415
ADAC._L0416:
                        CPI       _ACCA, 27
                        .BRANCH   3,ADAC._L0417
                        BREQ      ADAC._L0417
                        .BRANCH   1,ADAC._L0415
                        BRCS      ADAC._L0417
                        .BRANCH   20,ADAC._L0415
                        JMP       ADAC._L0415
ADAC._L0417:
ADAC._L0414:
                        .BLOCK    207
                        .LINE     207
                        LDI       _ACCCLO, ADAC.DACValueArray AND 0FFh
                        LDI       _ACCCHI, ADAC.DACValueArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, ADAC.SubCh
                        SUBI      _ACCA, 014h AND 0FFh
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
                        LDS       _ACCB, ADAC.Param
                        LDS       _ACCA, ADAC.Param+1
                        LDS       _ACCALO, ADAC.Param+2
                        LDS       _ACCAHI, ADAC.Param+3
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z+, _ACCB
                        ST        Z+, _ACCA
                        ST        Z+, _ACCALO
                        ST        Z+, _ACCAHI
                        .LINE     208
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCA, ADAC.SubCh
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,ADAC.SETDAC
                        CALL      ADAC.SETDAC
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 209
                        .BRANCH   20,ADAC._L0413
                        JMP       ADAC._L0413
ADAC._L0415:
                        .LINE     210
                        CPI       _ACCA, 30
                        .BRANCH   2,ADAC._L0420
                        BRCC      ADAC._L0420
                        .BRANCH   20,ADAC._L0419
                        JMP       ADAC._L0419
ADAC._L0420:
                        CPI       _ACCA, 37
                        .BRANCH   3,ADAC._L0421
                        BREQ      ADAC._L0421
                        .BRANCH   1,ADAC._L0419
                        BRCS      ADAC._L0421
                        .BRANCH   20,ADAC._L0419
                        JMP       ADAC._L0419
ADAC._L0421:
ADAC._L0418:
                        .BLOCK    211
                        .LINE     211
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCA, ADAC.SubCh
                        SUBI      _ACCA, 01Eh AND 0FFh
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDS       _ACCA, ADAC.Parambyte
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ADAC.SETPORT
                        CALL      ADAC.SETPORT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 212
                        .BRANCH   20,ADAC._L0413
                        JMP       ADAC._L0413
ADAC._L0419:
                        .LINE     213
                        CPI       _ACCA, 40
                        .BRANCH   2,ADAC._L0424
                        BRCC      ADAC._L0424
                        .BRANCH   20,ADAC._L0423
                        JMP       ADAC._L0423
ADAC._L0424:
                        CPI       _ACCA, 47
                        .BRANCH   3,ADAC._L0425
                        BREQ      ADAC._L0425
                        .BRANCH   1,ADAC._L0423
                        BRCS      ADAC._L0425
                        .BRANCH   20,ADAC._L0423
                        JMP       ADAC._L0423
ADAC._L0425:
ADAC._L0422:
                        .BLOCK    214
                        .LINE     214
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCA, ADAC.SubCh
                        SUBI      _ACCA, 028h AND 0FFh
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDS       _ACCA, ADAC.Parambyte
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ADAC.SETDIR
                        CALL      ADAC.SETDIR
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 215
                        .BRANCH   20,ADAC._L0413
                        JMP       ADAC._L0413
ADAC._L0423:
                        .LINE     216
                        CPI       _ACCA, 80
                        .BRANCH   3,ADAC._L0428
                        BREQ      ADAC._L0428
                        .BRANCH   20,ADAC._L0427
                        JMP       ADAC._L0427
ADAC._L0428:
ADAC._L0426:
                        .BLOCK    217
                        .LINE     217
                        LDS       _ACCA, ADAC.ParamByte
                        CPI       _ACCA, 025h
                        LDI       _ACCA, 0h
                        BREQ      ADAC._L0429
                        BRLO      ADAC._L0429
                        SER       _ACCA
ADAC._L0429:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0432
                        BRNE      ADAC._L0432
                        .BRANCH   20,ADAC._L0430
                        JMP       ADAC._L0430
ADAC._L0432:
                        .BLOCK    217
                        .LINE     218
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 005h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ADAC.SERPROMPT
                        CALL      ADAC.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     219
                        .BRANCH   20,ADAC.ParseSetParam_X
                        JMP       ADAC.ParseSetParam_X
                        .ENDBLOCK 220
ADAC._L0430:
ADAC._L0431:
                        .LINE     221
                        LDS       _ACCA, ADAC.ParamByte
                        STS       ADAC.MODIFY, _ACCA
                        .ENDBLOCK 222
                        .BRANCH   20,ADAC._L0413
                        JMP       ADAC._L0413
ADAC._L0427:
                        .LINE     223
                        CPI       _ACCA, 81
                        .BRANCH   3,ADAC._L0435
                        BREQ      ADAC._L0435
                        .BRANCH   20,ADAC._L0434
                        JMP       ADAC._L0434
ADAC._L0435:
ADAC._L0433:
                        .BLOCK    224
                        .LINE     224
                        LDS       _ACCA, ADAC.ParamByte
                        CPI       _ACCA, 025h
                        LDI       _ACCA, 0h
                        BREQ      ADAC._L0436
                        BRLO      ADAC._L0436
                        SER       _ACCA
ADAC._L0436:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0439
                        BRNE      ADAC._L0439
                        .BRANCH   20,ADAC._L0437
                        JMP       ADAC._L0437
ADAC._L0439:
                        .BLOCK    224
                        .LINE     225
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 005h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ADAC.SERPROMPT
                        CALL      ADAC.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     226
                        .BRANCH   20,ADAC.ParseSetParam_X
                        JMP       ADAC.ParseSetParam_X
                        .ENDBLOCK 227
ADAC._L0437:
ADAC._L0438:
                        .LINE     228
                        LDS       _ACCB, 0039Ah
                        CLR       _ACCA
                        SBRC      _ACCB, 004h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0442
                        BRNE      ADAC._L0442
                        .BRANCH   20,ADAC._L0440
                        JMP       ADAC._L0440
ADAC._L0442:
                        .BLOCK    228
                        .LINE     229
                        LDI       _ACCA, 05Bh
                        PUSH      _ACCA
                        LDI       _ACCCLO, ADAC.SerInpStr AND 0FFh
                        LDI       _ACCCHI, ADAC.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCELO, 001h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCB
                        CALL      SYSTEM.PosChInVarStr
                        SUBI      _ACCA, -001h AND 0FFh
                        STD       Y+001h, _ACCA
                        .LINE     230
                        LDI       _ACCA, 05Dh
                        PUSH      _ACCA
                        LDI       _ACCCLO, ADAC.SerInpStr AND 0FFh
                        LDI       _ACCCHI, ADAC.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, ADAC.SerInpPtr
                        MOV       _ACCELO, _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCB
                        CALL      SYSTEM.PosChInVarStr
                        STD       Y+000h, _ACCA
                        .LINE     231
                        LDI       _ACCCLO, ADAC.ParamTextStr AND 0FFh
                        LDI       _ACCCHI, ADAC.ParamTextStr SHRB 8
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
                        LDI       _ACCCLO, ADAC.SerInpStr AND 0FFh
                        LDI       _ACCCHI, ADAC.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCA, Y+004h
                        PUSH      _ACCA
                        LDD       _ACCA, Y+003h
                        PUSH      _ACCA
                        LDD       _ACCA, Y+004h
                        POP       _ACCB
                        SUB       _ACCB, _ACCA
                        MOV       _ACCA, _ACCB
                        POP       _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        CALL      SYSTEM.StrCopyV
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
                        .LINE     232
                        LDI       _ACCCLO, ADAC.ParamTextArray AND 0FFh
                        LDI       _ACCCHI, ADAC.ParamTextArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, ADAC.ParamByte
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
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        ADIW      _ACCCLO, 1
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        LDI       _ACCA, 008h
                        ST        -Y, _ACCA
                        LDI       _ACCA, 0FEH ROLB _DEVICE
                        AND       Flags, _ACCA
                        LDI       _ACCA, 1 SHLB _EEPROM
                        OR        Flags, _ACCA
                        .FRAME  3
                        LDI       _ACCCLO, ADAC.ParamTextStr AND 0FFh
                        LDI       _ACCCHI, ADAC.ParamTextStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        LDI       _ACCA, 008h
                        PUSH      _ACCA
                        LDD       _ACCA, Y+000h
                        POP       _ACCB
                        SUB       _ACCB, _ACCA
                        MOV       _ACCA, _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        CALL      SYSTEM.WriteEEp8
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDBLOCK 233
                        .BRANCH   20,ADAC._L0441
                        JMP       ADAC._L0441
ADAC._L0440:
                        .BLOCK    233
                        .LINE     234
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 006h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ADAC.SERPROMPT
                        CALL      ADAC.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     235
                        .BRANCH   20,ADAC.ParseSetParam_X
                        JMP       ADAC.ParseSetParam_X
                        .ENDBLOCK 236
ADAC._L0441:
                        .ENDBLOCK 237
                        .BRANCH   20,ADAC._L0413
                        JMP       ADAC._L0413
ADAC._L0434:
                        .LINE     238
                        CPI       _ACCA, 89
                        .BRANCH   3,ADAC._L0445
                        BREQ      ADAC._L0445
                        .BRANCH   20,ADAC._L0444
                        JMP       ADAC._L0444
ADAC._L0445:
                        .BRANCH   20,ADAC._L0443
                        JMP       ADAC._L0443
ADAC._L0444:
                        CPI       _ACCA, 159
                        .BRANCH   3,ADAC._L0447
                        BREQ      ADAC._L0447
                        .BRANCH   20,ADAC._L0446
                        JMP       ADAC._L0446
ADAC._L0447:
ADAC._L0443:
                        .BLOCK    239
                        .LINE     239
                        LDS       _ACCB, 0039Ah
                        CLR       _ACCA
                        SBRC      _ACCB, 004h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0450
                        BRNE      ADAC._L0450
                        .BRANCH   20,ADAC._L0448
                        JMP       ADAC._L0448
ADAC._L0450:
                        .BLOCK    239
                        .LINE     240
                        LDS       _ACCB, ADAC.ParamInt
                        LDS       _ACCA, ADAC.ParamInt+1
                        STS       ADAC.INCRAST, _ACCB
                        STS       ADAC.INCRAST+1, _ACCA
                        .LINE     241
                        LDS       _ACCB, ADAC.IncRast
                        LDS       _ACCA, ADAC.IncRast+1
                        LDI       _ACCCLO, ADAC.INCRASTDEF AND 0FFh
                        LDI       _ACCCHI, ADAC.INCRASTDEF SHRB 8
                        MOVW      _ACCALO, _ACCB
                        CALL      SYSTEM._WriteEEp16
                        ADIW      _ACCCLO, 01h
                        .ENDBLOCK 242
                        .BRANCH   20,ADAC._L0449
                        JMP       ADAC._L0449
ADAC._L0448:
                        .BLOCK    242
                        .LINE     243
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 006h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ADAC.SERPROMPT
                        CALL      ADAC.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     244
                        .BRANCH   20,ADAC.ParseSetParam_X
                        JMP       ADAC.ParseSetParam_X
                        .ENDBLOCK 245
ADAC._L0449:
                        .ENDBLOCK 246
                        .BRANCH   20,ADAC._L0413
                        JMP       ADAC._L0413
ADAC._L0446:
                        .LINE     247
                        CPI       _ACCA, 180
                        .BRANCH   2,ADAC._L0453
                        BRCC      ADAC._L0453
                        .BRANCH   20,ADAC._L0452
                        JMP       ADAC._L0452
ADAC._L0453:
                        CPI       _ACCA, 187
                        .BRANCH   3,ADAC._L0454
                        BREQ      ADAC._L0454
                        .BRANCH   1,ADAC._L0452
                        BRCS      ADAC._L0454
                        .BRANCH   20,ADAC._L0452
                        JMP       ADAC._L0452
ADAC._L0454:
ADAC._L0451:
                        .BLOCK    248
                        .LINE     248
                        LDS       _ACCA, ADAC.SubCh
                        SUBI      _ACCA, 0B4h AND 0FFh
                        MOV       ADAC.I, _ACCA
                        .LINE     249
                        LDS       _ACCB, 0039Ah
                        CLR       _ACCA
                        SBRC      _ACCB, 004h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0457
                        BRNE      ADAC._L0457
                        .BRANCH   20,ADAC._L0455
                        JMP       ADAC._L0455
ADAC._L0457:
                        .BLOCK    249
                        .LINE     250
                        LDI       _ACCCLO, ADAC.PortInitArray AND 0FFh
                        LDI       _ACCCHI, ADAC.PortInitArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        MOV       _ACCA, ADAC.i
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LDS       _ACCA, ADAC.Parambyte
                        CALL      SYSTEM.WriteEEp8
                        .LINE     251
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        MOV       _ACCA, ADAC.i
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDS       _ACCA, ADAC.ParamByte
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ADAC.SETPORT
                        CALL      ADAC.SETPORT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 252
                        .BRANCH   20,ADAC._L0456
                        JMP       ADAC._L0456
ADAC._L0455:
                        .BLOCK    252
                        .LINE     253
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 006h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ADAC.SERPROMPT
                        CALL      ADAC.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     254
                        .BRANCH   20,ADAC.ParseSetParam_X
                        JMP       ADAC.ParseSetParam_X
                        .ENDBLOCK 255
ADAC._L0456:
                        .ENDBLOCK 256
                        .BRANCH   20,ADAC._L0413
                        JMP       ADAC._L0413
ADAC._L0452:
                        .LINE     257
                        CPI       _ACCA, 190
                        .BRANCH   2,ADAC._L0460
                        BRCC      ADAC._L0460
                        .BRANCH   20,ADAC._L0459
                        JMP       ADAC._L0459
ADAC._L0460:
                        CPI       _ACCA, 197
                        .BRANCH   3,ADAC._L0461
                        BREQ      ADAC._L0461
                        .BRANCH   1,ADAC._L0459
                        BRCS      ADAC._L0461
                        .BRANCH   20,ADAC._L0459
                        JMP       ADAC._L0459
ADAC._L0461:
ADAC._L0458:
                        .BLOCK    258
                        .LINE     258
                        LDS       _ACCA, ADAC.SubCh
                        SUBI      _ACCA, 0BEh AND 0FFh
                        MOV       ADAC.I, _ACCA
                        .LINE     259
                        LDS       _ACCB, 0039Ah
                        CLR       _ACCA
                        SBRC      _ACCB, 004h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0464
                        BRNE      ADAC._L0464
                        .BRANCH   20,ADAC._L0462
                        JMP       ADAC._L0462
ADAC._L0464:
                        .BLOCK    259
                        .LINE     260
                        LDI       _ACCCLO, ADAC.DirInitArray AND 0FFh
                        LDI       _ACCCHI, ADAC.DirInitArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        MOV       _ACCA, ADAC.i
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LDS       _ACCA, ADAC.Parambyte
                        CALL      SYSTEM.WriteEEp8
                        .LINE     261
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        MOV       _ACCA, ADAC.i
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDS       _ACCA, ADAC.Parambyte
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ADAC.SETDIR
                        CALL      ADAC.SETDIR
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 262
                        .BRANCH   20,ADAC._L0463
                        JMP       ADAC._L0463
ADAC._L0462:
                        .BLOCK    262
                        .LINE     263
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 006h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ADAC.SERPROMPT
                        CALL      ADAC.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     264
                        .BRANCH   20,ADAC.ParseSetParam_X
                        JMP       ADAC.ParseSetParam_X
                        .ENDBLOCK 265
ADAC._L0463:
                        .ENDBLOCK 266
                        .BRANCH   20,ADAC._L0413
                        JMP       ADAC._L0413
ADAC._L0459:
                        .LINE     267
                        CPI       _ACCA, 157
                        .BRANCH   3,ADAC._L0467
                        BREQ      ADAC._L0467
                        .BRANCH   20,ADAC._L0466
                        JMP       ADAC._L0466
ADAC._L0467:
ADAC._L0465:
                        .BLOCK    268
                        .LINE     268
                        LDS       _ACCB, 0039Ah
                        CLR       _ACCA
                        SBRC      _ACCB, 004h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0470
                        BRNE      ADAC._L0470
                        .BRANCH   20,ADAC._L0468
                        JMP       ADAC._L0468
ADAC._L0470:
                        .BLOCK    268
                        .LINE     269
                        LDS       _ACCA, ADAC.Parambyte
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      ADAC._L0471
                        BRLO      ADAC._L0471
                        SER       _ACCA
ADAC._L0471:
                        STS       ADAC.INTEGRATEAD16, _ACCA
                        .LINE     270
                        LDS       _ACCA, ADAC.IntegrateAD16
                        LDI       _ACCCLO, ADAC.INITINTEGRATEAD16 AND 0FFh
                        LDI       _ACCCHI, ADAC.INITINTEGRATEAD16 SHRB 8
                        CALL      SYSTEM.WriteEEp8
                        ADIW      _ACCCLO, 01h
                        .ENDBLOCK 271
                        .BRANCH   20,ADAC._L0469
                        JMP       ADAC._L0469
ADAC._L0468:
                        .BLOCK    271
                        .LINE     272
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 006h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ADAC.SERPROMPT
                        CALL      ADAC.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     273
                        .BRANCH   20,ADAC.ParseSetParam_X
                        JMP       ADAC.ParseSetParam_X
                        .ENDBLOCK 274
ADAC._L0469:
                        .ENDBLOCK 275
                        .BRANCH   20,ADAC._L0413
                        JMP       ADAC._L0413
ADAC._L0466:
                        .LINE     276
                        CPI       _ACCA, 156
                        .BRANCH   3,ADAC._L0474
                        BREQ      ADAC._L0474
                        .BRANCH   20,ADAC._L0473
                        JMP       ADAC._L0473
ADAC._L0474:
                        .BRANCH   20,ADAC._L0472
                        JMP       ADAC._L0472
ADAC._L0473:
                        CPI       _ACCA, 246
                        .BRANCH   3,ADAC._L0476
                        BREQ      ADAC._L0476
                        .BRANCH   20,ADAC._L0475
                        JMP       ADAC._L0475
ADAC._L0476:
ADAC._L0472:
                        .BLOCK    277
                        .LINE     277
                        LDS       _ACCB, 0039Ah
                        CLR       _ACCA
                        SBRC      _ACCB, 004h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0479
                        BRNE      ADAC._L0479
                        .BRANCH   20,ADAC._L0477
                        JMP       ADAC._L0477
ADAC._L0479:
                        .BLOCK    277
                        .LINE     278
                        LDS       _ACCA, ADAC.ParamByte
                        LDI       _ACCCLO, ADAC.EXTREF AND 0FFh
                        LDI       _ACCCHI, ADAC.EXTREF SHRB 8
                        CALL      SYSTEM.WriteEEp8
                        ADIW      _ACCCLO, 01h
                        .LINE     279
                        LDS       _ACCA, ADAC.Parambyte
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BRNE      ADAC._L0480
                        SER       _ACCA
ADAC._L0480:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0483
                        BRNE      ADAC._L0483
                        .BRANCH   20,ADAC._L0481
                        JMP       ADAC._L0481
ADAC._L0483:
                        .BLOCK    279
                        .LINE     280
                        IN        _ACCA, ADMUX
                        ANDI      _ACCA, 03Fh
                        OUT       ADMUX, _ACCA
                        .ENDBLOCK 281
                        .BRANCH   20,ADAC._L0482
                        JMP       ADAC._L0482
ADAC._L0481:
                        .BLOCK    281
                        .LINE     282
                        IN        _ACCA, ADMUX
                        ORI       _ACCA, 0C0h
                        OUT       ADMUX, _ACCA
                        .ENDBLOCK 283
ADAC._L0482:
                        .ENDBLOCK 284
                        .BRANCH   20,ADAC._L0478
                        JMP       ADAC._L0478
ADAC._L0477:
                        .BLOCK    284
                        .LINE     285
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 006h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ADAC.SERPROMPT
                        CALL      ADAC.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     286
                        .BRANCH   20,ADAC.ParseSetParam_X
                        JMP       ADAC.ParseSetParam_X
                        .ENDBLOCK 287
ADAC._L0478:
                        .ENDBLOCK 288
                        .BRANCH   20,ADAC._L0413
                        JMP       ADAC._L0413
ADAC._L0475:
                        .LINE     289
                        CPI       _ACCA, 200
                        .BRANCH   2,ADAC._L0486
                        BRCC      ADAC._L0486
                        .BRANCH   20,ADAC._L0485
                        JMP       ADAC._L0485
ADAC._L0486:
                        CPI       _ACCA, 229
                        .BRANCH   3,ADAC._L0487
                        BREQ      ADAC._L0487
                        .BRANCH   1,ADAC._L0485
                        BRCS      ADAC._L0487
                        .BRANCH   20,ADAC._L0485
                        JMP       ADAC._L0485
ADAC._L0487:
ADAC._L0484:
                        .BLOCK    290
                        .LINE     290
                        LDS       _ACCA, ADAC.SubCh
                        SUBI      _ACCA, 0C8h AND 0FFh
                        MOV       ADAC.I, _ACCA
                        .LINE     291
                        LDS       _ACCB, 0039Ah
                        CLR       _ACCA
                        SBRC      _ACCB, 004h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0490
                        BRNE      ADAC._L0490
                        .BRANCH   20,ADAC._L0488
                        JMP       ADAC._L0488
ADAC._L0490:
                        .BLOCK    291
                        .LINE     292
                        LDI       _ACCCLO, ADAC.ScaleArray AND 0FFh
                        LDI       _ACCCHI, ADAC.ScaleArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        MOV       _ACCA, ADAC.i
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
                        LDS       _ACCB, ADAC.Param
                        LDS       _ACCA, ADAC.Param+1
                        LDS       _ACCALO, ADAC.Param+2
                        LDS       _ACCAHI, ADAC.Param+3
                        POP       _ACCCHI
                        POP       _ACCCLO
                        MOVW      _ACCBLO, _ACCB
                        CALL      SYSTEM._WriteEEp32
                        .LINE     293
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        MOV       _ACCA, ADAC.i
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,ADAC.SETDAC
                        CALL      ADAC.SETDAC
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     294
                        .BRANCH   17,ADAC.SETBASESCALES
                        CALL      ADAC.SETBASESCALES
                        .ENDBLOCK 295
                        .BRANCH   20,ADAC._L0489
                        JMP       ADAC._L0489
ADAC._L0488:
                        .BLOCK    295
                        .LINE     296
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 006h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ADAC.SERPROMPT
                        CALL      ADAC.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     297
                        .BRANCH   20,ADAC.ParseSetParam_X
                        JMP       ADAC.ParseSetParam_X
                        .ENDBLOCK 298
ADAC._L0489:
                        .ENDBLOCK 299
                        .BRANCH   20,ADAC._L0413
                        JMP       ADAC._L0413
ADAC._L0485:
                        .LINE     300
                        CPI       _ACCA, 100
                        .BRANCH   2,ADAC._L0493
                        BRCC      ADAC._L0493
                        .BRANCH   20,ADAC._L0492
                        JMP       ADAC._L0492
ADAC._L0493:
                        CPI       _ACCA, 127
                        .BRANCH   3,ADAC._L0494
                        BREQ      ADAC._L0494
                        .BRANCH   1,ADAC._L0492
                        BRCS      ADAC._L0494
                        .BRANCH   20,ADAC._L0492
                        JMP       ADAC._L0492
ADAC._L0494:
ADAC._L0491:
                        .BLOCK    301
                        .LINE     301
                        LDS       _ACCA, ADAC.SubCh
                        SUBI      _ACCA, 064h AND 0FFh
                        MOV       ADAC.I, _ACCA
                        .LINE     302
                        LDS       _ACCB, 0039Ah
                        CLR       _ACCA
                        SBRC      _ACCB, 004h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0497
                        BRNE      ADAC._L0497
                        .BRANCH   20,ADAC._L0495
                        JMP       ADAC._L0495
ADAC._L0497:
                        .BLOCK    302
                        .LINE     303
                        LDI       _ACCCLO, ADAC.OffsetArray AND 0FFh
                        LDI       _ACCCHI, ADAC.OffsetArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        MOV       _ACCA, ADAC.i
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LDS       _ACCB, ADAC.ParamInt
                        LDS       _ACCA, ADAC.ParamInt+1
                        MOVW      _ACCALO, _ACCB
                        CALL      SYSTEM._WriteEEp16
                        .LINE     304
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        MOV       _ACCA, ADAC.i
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,ADAC.SETDAC
                        CALL      ADAC.SETDAC
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 305
                        .BRANCH   20,ADAC._L0496
                        JMP       ADAC._L0496
ADAC._L0495:
                        .BLOCK    305
                        .LINE     306
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 006h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ADAC.SERPROMPT
                        CALL      ADAC.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     307
                        .BRANCH   20,ADAC.ParseSetParam_X
                        JMP       ADAC.ParseSetParam_X
                        .ENDBLOCK 308
ADAC._L0496:
                        .ENDBLOCK 309
                        .BRANCH   20,ADAC._L0413
                        JMP       ADAC._L0413
ADAC._L0492:
                        .LINE     310
                        CPI       _ACCA, 230
                        .BRANCH   3,ADAC._L0500
                        BREQ      ADAC._L0500
                        .BRANCH   20,ADAC._L0499
                        JMP       ADAC._L0499
ADAC._L0500:
ADAC._L0498:
                        .BLOCK    311
                        .LINE     311
                        LDS       _ACCA, ADAC.I2CslaveAdr
                        PUSH      _ACCA
                        LDS       _ACCA, ADAC.ParamByte
                        MOV       _ACCAHI, _ACCA
                        CLT
                        BLD       Flags, _I2C2BYTE
                        POP       _ACCDLO
                        LDI       _ACCBLO, 00000h AND 0FFh
                        LDI       _ACCBHI, 00000h SHRB 8
                        LDI       _ACCDHI, 000h
                        CALL       SYSTEM.TWIOut
                        .ENDBLOCK 312
                        .BRANCH   20,ADAC._L0413
                        JMP       ADAC._L0413
ADAC._L0499:
                        .LINE     313
                        CPI       _ACCA, 231
                        .BRANCH   3,ADAC._L0503
                        BREQ      ADAC._L0503
                        .BRANCH   20,ADAC._L0502
                        JMP       ADAC._L0502
ADAC._L0503:
ADAC._L0501:
                        .BLOCK    314
                        .LINE     314
                        LDS       _ACCA, ADAC.I2CslaveAdr
                        PUSH      _ACCA
                        LDS       _ACCB, ADAC.ParamInt
                        LDS       _ACCA, ADAC.ParamInt+1
                        MOVW      _ACCALO, _ACCB
                        SET
                        BLD       Flags, _I2C2BYTE
                        POP       _ACCDLO
                        LDI       _ACCBLO, 00000h AND 0FFh
                        LDI       _ACCBHI, 00000h SHRB 8
                        LDI       _ACCDHI, 000h
                        CALL       SYSTEM.TWIOut
                        .ENDBLOCK 315
                        .BRANCH   20,ADAC._L0413
                        JMP       ADAC._L0413
ADAC._L0502:
                        .LINE     316
                        CPI       _ACCA, 232
                        .BRANCH   3,ADAC._L0506
                        BREQ      ADAC._L0506
                        .BRANCH   20,ADAC._L0505
                        JMP       ADAC._L0505
ADAC._L0506:
ADAC._L0504:
                        .BLOCK    317
                        .LINE     317
                        LDS       _ACCB, ADAC.ParamInt
                        LDS       _ACCA, ADAC.ParamInt+1
                        MOV       _ACCBLO, _ACCA
                        MOV       _ACCA, _ACCB
                        MOV       _ACCB, _ACCBLO
                        STS       ADAC.PARAMINT, _ACCB
                        STS       ADAC.PARAMINT+1, _ACCA
                        .LINE     318
                        LDS       _ACCA, ADAC.I2CslaveAdr
                        PUSH      _ACCA
                        LDS       _ACCB, ADAC.ParamInt
                        LDS       _ACCA, ADAC.ParamInt+1
                        MOVW      _ACCALO, _ACCB
                        SET
                        BLD       Flags, _I2C2BYTE
                        POP       _ACCDLO
                        LDI       _ACCBLO, 00000h AND 0FFh
                        LDI       _ACCBHI, 00000h SHRB 8
                        LDI       _ACCDHI, 000h
                        CALL       SYSTEM.TWIOut
                        .ENDBLOCK 319
                        .BRANCH   20,ADAC._L0413
                        JMP       ADAC._L0413
ADAC._L0505:
                        .LINE     320
                        CPI       _ACCA, 239
                        .BRANCH   3,ADAC._L0509
                        BREQ      ADAC._L0509
                        .BRANCH   20,ADAC._L0508
                        JMP       ADAC._L0508
ADAC._L0509:
ADAC._L0507:
                        .BLOCK    321
                        .LINE     321
                        LDS       _ACCA, ADAC.ParamByte
                        STS       ADAC.I2CSLAVEADR, _ACCA
                        .ENDBLOCK 322
                        .BRANCH   20,ADAC._L0413
                        JMP       ADAC._L0413
ADAC._L0508:
                        .LINE     323
                        CPI       _ACCA, 240
                        .BRANCH   2,ADAC._L0512
                        BRCC      ADAC._L0512
                        .BRANCH   20,ADAC._L0511
                        JMP       ADAC._L0511
ADAC._L0512:
                        CPI       _ACCA, 243
                        .BRANCH   3,ADAC._L0513
                        BREQ      ADAC._L0513
                        .BRANCH   1,ADAC._L0511
                        BRCS      ADAC._L0513
                        .BRANCH   20,ADAC._L0511
                        JMP       ADAC._L0511
ADAC._L0513:
ADAC._L0510:
                        .BLOCK    324
                        .LINE     324
                        LDS       _ACCA, ADAC.SubCh
                        SUBI      _ACCA, 0F0h AND 0FFh
                        MOV       ADAC.I, _ACCA
                        .LINE     325
                        LDS       _ACCB, 0039Ah
                        CLR       _ACCA
                        SBRC      _ACCB, 004h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0516
                        BRNE      ADAC._L0516
                        .BRANCH   20,ADAC._L0514
                        JMP       ADAC._L0514
ADAC._L0516:
                        .BLOCK    325
                        .LINE     326
                        LDI       _ACCCLO, ADAC.TrigMaskArray AND 0FFh
                        LDI       _ACCCHI, ADAC.TrigMaskArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        MOV       _ACCA, ADAC.i
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LDS       _ACCA, ADAC.Parambyte
                        CALL      SYSTEM.WriteEEp8
                        .ENDBLOCK 327
                        .BRANCH   20,ADAC._L0515
                        JMP       ADAC._L0515
ADAC._L0514:
                        .BLOCK    327
                        .LINE     328
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 006h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ADAC.SERPROMPT
                        CALL      ADAC.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     329
                        .BRANCH   20,ADAC.ParseSetParam_X
                        JMP       ADAC.ParseSetParam_X
                        .ENDBLOCK 330
ADAC._L0515:
                        .ENDBLOCK 331
                        .BRANCH   20,ADAC._L0413
                        JMP       ADAC._L0413
ADAC._L0511:
                        .LINE     332
                        CPI       _ACCA, 247
                        .BRANCH   3,ADAC._L0519
                        BREQ      ADAC._L0519
                        .BRANCH   20,ADAC._L0518
                        JMP       ADAC._L0518
ADAC._L0519:
ADAC._L0517:
                        .BLOCK    333
                        .LINE     333
                        LDS       _ACCB, 0039Ah
                        CLR       _ACCA
                        SBRC      _ACCB, 004h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0522
                        BRNE      ADAC._L0522
                        .BRANCH   20,ADAC._L0520
                        JMP       ADAC._L0520
ADAC._L0522:
                        .BLOCK    333
                        .LINE     334
                        LDS       _ACCB, ADAC.ParamInt
                        LDS       _ACCA, ADAC.ParamInt+1
                        SET
                        BLD       Flags, _NEGATIVE
                        LDI       _ACCBLO, 00001h AND 0FFh
                        LDI       _ACCBHI, 00001h SHRB 8
                        CLR       _ACCDHI
                        CALL      SYSTEM.High16i
                        TST       _ACCDHI
                        .BRANCH   6,ADAC._L0524
                        BRPL      ADAC._L0524
                        LDI       _ACCBLO, 00009h AND 0FFh
                        LDI       _ACCBHI, 00009h SHRB 8
                        LDI       _ACCDHI, 0
                        SEZ
                        CALL      SYSTEM.High16i
                        TST       _ACCDHI
                        .BRANCH   5,ADAC._L0524
                        BRMI      ADAC._L0524
                        SEZ
                        RJMP      ADAC._L0523
ADAC._L0524:
ADAC._L0523:
                        LDI       _ACCA, 0h
                        BRNE      ADAC._L0525
                        SER       _ACCA
ADAC._L0525:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0528
                        BRNE      ADAC._L0528
                        .BRANCH   20,ADAC._L0526
                        JMP       ADAC._L0526
ADAC._L0528:
                        .BLOCK    334
                        .LINE     335
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 005h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ADAC.SERPROMPT
                        CALL      ADAC.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     336
                        .BRANCH   20,ADAC.ParseSetParam_X
                        JMP       ADAC.ParseSetParam_X
                        .ENDBLOCK 337
                        .BRANCH   20,ADAC._L0527
                        JMP       ADAC._L0527
ADAC._L0526:
                        .BLOCK    337
                        .LINE     338
                        LDS       _ACCB, ADAC.ParamInt
                        LDS       _ACCA, ADAC.ParamInt+1
                        LDI       _ACCCLO, ADAC.TRIGTIMERVALUE AND 0FFh
                        LDI       _ACCCHI, ADAC.TRIGTIMERVALUE SHRB 8
                        MOVW      _ACCALO, _ACCB
                        CALL      SYSTEM._WriteEEp16
                        ADIW      _ACCCLO, 01h
                        .ENDBLOCK 339
ADAC._L0527:
                        .ENDBLOCK 340
                        .BRANCH   20,ADAC._L0521
                        JMP       ADAC._L0521
ADAC._L0520:
                        .BLOCK    340
                        .LINE     341
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 006h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ADAC.SERPROMPT
                        CALL      ADAC.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     342
                        .BRANCH   20,ADAC.ParseSetParam_X
                        JMP       ADAC.ParseSetParam_X
                        .ENDBLOCK 343
ADAC._L0521:
                        .ENDBLOCK 344
                        .BRANCH   20,ADAC._L0413
                        JMP       ADAC._L0413
ADAC._L0518:
                        .LINE     345
                        CPI       _ACCA, 248
                        .BRANCH   3,ADAC._L0531
                        BREQ      ADAC._L0531
                        .BRANCH   20,ADAC._L0530
                        JMP       ADAC._L0530
ADAC._L0531:
ADAC._L0529:
                        .BLOCK    346
                        .LINE     346
                        LDS       _ACCB, 0039Ah
                        CLR       _ACCA
                        SBRC      _ACCB, 004h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0534
                        BRNE      ADAC._L0534
                        .BRANCH   20,ADAC._L0532
                        JMP       ADAC._L0532
ADAC._L0534:
                        .BLOCK    346
                        .LINE     347
                        LDS       _ACCA, ADAC.Parambyte
                        LDI       _ACCCLO, ADAC.TRIGLEVEL AND 0FFh
                        LDI       _ACCCHI, ADAC.TRIGLEVEL SHRB 8
                        CALL      SYSTEM.WriteEEp8
                        ADIW      _ACCCLO, 01h
                        .LINE     348
                        LDS       _ACCA, ADAC.Parambyte
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BRNE      ADAC._L0535
                        SER       _ACCA
ADAC._L0535:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0538
                        BRNE      ADAC._L0538
                        .BRANCH   20,ADAC._L0536
                        JMP       ADAC._L0536
ADAC._L0538:
                        .BLOCK    348
                        .LINE     349
                        IN        _ACCA, MCUCSR
                        ANDI      _ACCA, 0BFh
                        OUT       MCUCSR, _ACCA
                        .ENDBLOCK 350
                        .BRANCH   20,ADAC._L0537
                        JMP       ADAC._L0537
ADAC._L0536:
                        .BLOCK    350
                        .LINE     351
                        IN        _ACCA, MCUCSR
                        ORI       _ACCA, 040h
                        OUT       MCUCSR, _ACCA
                        .ENDBLOCK 352
ADAC._L0537:
                        .ENDBLOCK 353
                        .BRANCH   20,ADAC._L0533
                        JMP       ADAC._L0533
ADAC._L0532:
                        .BLOCK    353
                        .LINE     354
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 006h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ADAC.SERPROMPT
                        CALL      ADAC.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     355
                        .BRANCH   20,ADAC.ParseSetParam_X
                        JMP       ADAC.ParseSetParam_X
                        .ENDBLOCK 356
ADAC._L0533:
                        .ENDBLOCK 357
                        .BRANCH   20,ADAC._L0413
                        JMP       ADAC._L0413
ADAC._L0530:
                        .LINE     358
                        CPI       _ACCA, 249
                        .BRANCH   3,ADAC._L0541
                        BREQ      ADAC._L0541
                        .BRANCH   20,ADAC._L0540
                        JMP       ADAC._L0540
ADAC._L0541:
ADAC._L0539:
                        .BLOCK    359
                        .LINE     359
                        LDI       _ACCA, 0FFh
                        STS       ADAC.TRIGGER, _ACCA
                        .LINE     360
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDS       _ACCA, ADAC.Status
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ADAC.SERPROMPT
                        CALL      ADAC.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     361
                        .BRANCH   20,ADAC.ParseSetParam_X
                        JMP       ADAC.ParseSetParam_X
                        .ENDBLOCK 362
                        .BRANCH   20,ADAC._L0413
                        JMP       ADAC._L0413
ADAC._L0540:
                        .LINE     363
                        CPI       _ACCA, 251
                        .BRANCH   3,ADAC._L0544
                        BREQ      ADAC._L0544
                        .BRANCH   20,ADAC._L0543
                        JMP       ADAC._L0543
ADAC._L0544:
ADAC._L0542:
                        .BLOCK    364
                        .LINE     364
                        LDS       _ACCB, ADAC.ParamInt
                        LDS       _ACCA, ADAC.ParamInt+1
                        STS       ADAC.ERRCOUNT, _ACCB
                        STS       ADAC.ERRCOUNT+1, _ACCA
                        .ENDBLOCK 365
                        .BRANCH   20,ADAC._L0413
                        JMP       ADAC._L0413
ADAC._L0543:
                        .LINE     366
                        CPI       _ACCA, 252
                        .BRANCH   3,ADAC._L0547
                        BREQ      ADAC._L0547
                        .BRANCH   20,ADAC._L0546
                        JMP       ADAC._L0546
ADAC._L0547:
ADAC._L0545:
                        .BLOCK    367
                        .LINE     367
                        LDS       _ACCB, 0039Ah
                        CLR       _ACCA
                        SBRC      _ACCB, 004h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0550
                        BRNE      ADAC._L0550
                        .BRANCH   20,ADAC._L0548
                        JMP       ADAC._L0548
ADAC._L0550:
                        .BLOCK    367
                        .LINE     368
                        LDS       _ACCA, ADAC.ParamByte
                        LDI       _ACCCLO, ADAC.EESERBAUDREG AND 0FFh
                        LDI       _ACCCHI, ADAC.EESERBAUDREG SHRB 8
                        CALL      SYSTEM.WriteEEp8
                        ADIW      _ACCCLO, 01h
                        .ENDBLOCK 369
                        .BRANCH   20,ADAC._L0549
                        JMP       ADAC._L0549
ADAC._L0548:
                        .BLOCK    369
                        .LINE     370
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 006h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ADAC.SERPROMPT
                        CALL      ADAC.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     371
                        .BRANCH   20,ADAC.ParseSetParam_X
                        JMP       ADAC.ParseSetParam_X
                        .ENDBLOCK 372
ADAC._L0549:
                        .ENDBLOCK 373
                        .BRANCH   20,ADAC._L0413
                        JMP       ADAC._L0413
ADAC._L0546:
                        .LINE     374
                        CPI       _ACCA, 250
                        .BRANCH   3,ADAC._L0553
                        BREQ      ADAC._L0553
                        .BRANCH   20,ADAC._L0552
                        JMP       ADAC._L0552
ADAC._L0553:
ADAC._L0551:
                        .BRANCH   20,ADAC._L0413
                        JMP       ADAC._L0413
ADAC._L0552:
                        .BLOCK    376
                        .LINE     377
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 005h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ADAC.SERPROMPT
                        CALL      ADAC.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     378
                        .BRANCH   20,ADAC.ParseSetParam_X
                        JMP       ADAC.ParseSetParam_X
                        .ENDBLOCK 379
ADAC._L0413:
                        .LINE     380
                        LDS       _ACCA, 0039Ah
                        CBR       _ACCA, 010h
                        STS       0039Ah, _ACCA
                        .LINE     381
                        LDS       _ACCA, ADAC.SubCh
                        CPI       _ACCA, 0FAh
                        LDI       _ACCA, 0h
                        BRNE      ADAC._L0554
                        SER       _ACCA
ADAC._L0554:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0557
                        BRNE      ADAC._L0557
                        .BRANCH   20,ADAC._L0555
                        JMP       ADAC._L0555
ADAC._L0557:
                        .BLOCK    382
                        .LINE     382
                        LDS       _ACCA, ADAC.ParamByte
                        CPI       _ACCA, 001h
                        LDI       _ACCA, 0h
                        BRNE      ADAC._L0558
                        SER       _ACCA
ADAC._L0558:
                        CLT
                        TST       _ACCA
                        BREQ      ADAC._L0559
                        SET
ADAC._L0559:
                        LDS       _ACCA, 0039Ah
                        BLD       _ACCA, 004h
                        STS       0039Ah, _ACCA
                        .ENDBLOCK 383
ADAC._L0555:
ADAC._L0556:
                        .LINE     384
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDS       _ACCA, ADAC.Status
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ADAC.SERPROMPT
                        CALL      ADAC.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 385
ADAC.ParseSetParam_X:
                        .LINE     385
                        .BRANCH   19
                        RET
                        .ENDFUNC  385

                        .FUNC     Cmd2Index, 00187h, 00020h
ADAC.Cmd2Index:
                        .RETURNS   1
                        SBIW      _FRAMEPTR, 1
                        .BLOCK    394
                        .LINE     395
                        LDI       _ACCCLO, ADAC.ParamStr AND 0FFh
                        LDI       _ACCCHI, ADAC.ParamStr SHRB 8
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
                        LDI       _ACCCLO, ADAC.ParamStr AND 0FFh
                        LDI       _ACCCHI, ADAC.ParamStr SHRB 8
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
                        .LINE     396
                        .LOOP
                        MOVW      _ACCCLO, _FRAMEPTR
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 000h
                        ST        Z, _ACCA
                        LDI       _ACCA, 018h
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
ADAC._L0562:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      ADAC._L0563
                        CLR       _ACCA
ADAC._L0563:
                        TST       _ACCA
                        .BRANCH   3,ADAC._L0564
                        BREQ      ADAC._L0564
                        .BRANCH   20,ADAC._L0561
                        JMP       ADAC._L0561
ADAC._L0564:
                        .BLOCK    397
                        .LINE     397
                        LDI       _ACCCLO, ADAC.ParamStr AND 0FFh
                        LDI       _ACCCHI, ADAC.ParamStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCCLO, ADAC.CmdStrArr AND 0FFh
                        LDI       _ACCCHI, ADAC.CmdStrArr SHRB 8
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
                        BRNE      ADAC._L0565
                        SER       _ACCA
ADAC._L0565:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0568
                        BRNE      ADAC._L0568
                        .BRANCH   20,ADAC._L0566
                        JMP       ADAC._L0566
ADAC._L0568:
                        .BLOCK    397
                        .LINE     398
                        LDD       _ACCA, Y+003h
                        ADIW      _FRAMEPTR, 3
                        .BRANCH   20,ADAC.Cmd2Index_X
                        JMP       ADAC.Cmd2Index_X
                        .ENDBLOCK 399
ADAC._L0566:
ADAC._L0567:
                        .ENDBLOCK 400
ADAC._L0560:
                        .LINE     400
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,ADAC._L0561
                        BREQ      ADAC._L0561
                        .BRANCH   20,ADAC._L0562
                        JMP       ADAC._L0562
ADAC._L0561:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .LINE     401
                        LDI       _ACCA, 019h
                        .ENDBLOCK 402
ADAC.Cmd2Index_X:
                        .LINE     402
                        .BRANCH   19
                        RET
                        .ENDFUNC  402

                        .FUNC     ParseExtract, 00194h, 00020h
ADAC.ParseExtract:
                        .RETURNS   1
                        SBIW      _FRAMEPTR, 2
                        .BLOCK    408
                        .LINE     409
                        LDI       _ACCCLO, ADAC.ParamStr AND 0FFh
                        LDI       _ACCCHI, ADAC.ParamStr SHRB 8
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
                        .LINE     410
                        LDI       _ACCA, 000h
                        STD       Y+000h, _ACCA
                        .LINE     411
ADAC._L0569:
                        LDI       _ACCCLO, ADAC.SerInpStr AND 0FFh
                        LDI       _ACCCHI, ADAC.SerInpStr SHRB 8
                        LDS       _ACCA, ADAC.SerInpPtr
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCA, Z+
                        CPI       _ACCA, 020h
                        LDI       _ACCA, 0h
                        BRNE      ADAC._L0571
                        SER       _ACCA
ADAC._L0571:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0572
                        BRNE      ADAC._L0572
                        .BRANCH   20,ADAC._L0570
                        JMP       ADAC._L0570
ADAC._L0572:
                        .BLOCK    412
                        .LINE     412
                        LDS       _ACCA, ADAC.serInpPtr
                        INC       _ACCA
                        STS       ADAC.serInpPtr, _ACCA
                        .ENDBLOCK 413
                        .LINE     413
                        .BRANCH   20,ADAC._L0569
                        JMP       ADAC._L0569
ADAC._L0570:
                        .LINE     414
                        LDI       _ACCCLO, ADAC.SerInpStr AND 0FFh
                        LDI       _ACCCHI, ADAC.SerInpStr SHRB 8
                        LDS       _ACCA, ADAC.SerInpPtr
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCA, Z+
                        CPI       _ACCA, 039h
                        .BRANCH   3,ADAC._L0573
                        BREQ      ADAC._L0573
                        .BRANCH   1,ADAC._L0574
                        BRSH      ADAC._L0574
                        CPI       _ACCA, 02Ah
                        .BRANCH   1,ADAC._L0574
                        BRLO      ADAC._L0574
                        LDI       _ACCDLO, 0
                        SEZ
                        .BRANCH   20,ADAC._L0573
                        RJMP      ADAC._L0573
ADAC._L0574:
                        LDI       _ACCDLO, 001h
ADAC._L0573:
                        LDI       _ACCA, 0h
                        BRNE      ADAC._L0575
                        SER       _ACCA
ADAC._L0575:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0578
                        BRNE      ADAC._L0578
                        .BRANCH   20,ADAC._L0576
                        JMP       ADAC._L0576
ADAC._L0578:
                        .BLOCK    415
                        .LINE     415
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .LINE     416
                        .LOOP
                        LDI       _ACCCLO, ADAC.i AND 0FFh
                        LDI       _ACCCHI, ADAC.i SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDS       _ACCA, ADAC.SerInpPtr
                        ST        Z, _ACCA
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCCLO, ADAC.SerInpStr AND 0FFh
                        LDI       _ACCCHI, ADAC.SerInpStr SHRB 8
                        LD        _ACCA, Z
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
ADAC._L0581:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      ADAC._L0582
                        CLR       _ACCA
ADAC._L0582:
                        TST       _ACCA
                        .BRANCH   3,ADAC._L0583
                        BREQ      ADAC._L0583
                        .BRANCH   20,ADAC._L0580
                        JMP       ADAC._L0580
ADAC._L0583:
                        .BLOCK    417
                        .LINE     417
                        LDI       _ACCCLO, ADAC.SerInpStr AND 0FFh
                        LDI       _ACCCHI, ADAC.SerInpStr SHRB 8
                        MOV       _ACCA, ADAC.i
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCA, Z+
                        STD       Y+004h, _ACCA
                        .LINE     418
                        LDD       _ACCA, Y+004h
                        CPI       _ACCA, 039h
                        LDI       _ACCA, 0FFh
                        BRLO      ADAC._L0584
                        BREQ      ADAC._L0584
                        CLR       _ACCA
ADAC._L0584:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0587
                        BRNE      ADAC._L0587
                        .BRANCH   20,ADAC._L0585
                        JMP       ADAC._L0585
ADAC._L0587:
                        .BLOCK    418
                        .LINE     419
                        LDD       _ACCA, Y+004h
                        MOV       _ACCEHI, _ACCA
                        LDI       _ACCELO, 001h
                        LDI       _ACCA, _ACCELO SHRB 8
                        LDI       _ACCB, _ACCELO AND 0FFh
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDI       _ACCCLO, ADAC.ParamStr AND 0FFh
                        LDI       _ACCCHI, ADAC.ParamStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCA, 028h
                        PUSH      _ACCA
                        LDI       _ACCFHI, 000h
                        CALL      SYSTEM.StringAppend
                        .ENDBLOCK 421
                        .BRANCH   20,ADAC._L0586
                        JMP       ADAC._L0586
ADAC._L0585:
                        .BLOCK    421
                        .LINE     421
                        MOV       _ACCA, ADAC.i
                        STS       ADAC.SERINPPTR, _ACCA
                        .LINE     422
                        LDD       _ACCA, Y+003h
                        ADIW      _FRAMEPTR, 3
                        .BRANCH   20,ADAC.ParseExtract_X
                        JMP       ADAC.ParseExtract_X
                        .ENDBLOCK 423
ADAC._L0586:
                        .ENDBLOCK 424
ADAC._L0579:
                        .LINE     424
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,ADAC._L0580
                        BREQ      ADAC._L0580
                        .BRANCH   20,ADAC._L0581
                        JMP       ADAC._L0581
ADAC._L0580:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .ENDBLOCK 425
                        .BRANCH   20,ADAC._L0577
                        JMP       ADAC._L0577
ADAC._L0576:
                        .BLOCK    425
                        .LINE     426
                        .LOOP
                        LDI       _ACCCLO, ADAC.i AND 0FFh
                        LDI       _ACCCHI, ADAC.i SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDS       _ACCA, ADAC.SerInpPtr
                        ST        Z, _ACCA
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCCLO, ADAC.SerInpStr AND 0FFh
                        LDI       _ACCCHI, ADAC.SerInpStr SHRB 8
                        LD        _ACCA, Z
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
ADAC._L0590:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      ADAC._L0591
                        CLR       _ACCA
ADAC._L0591:
                        TST       _ACCA
                        .BRANCH   3,ADAC._L0592
                        BREQ      ADAC._L0592
                        .BRANCH   20,ADAC._L0589
                        JMP       ADAC._L0589
ADAC._L0592:
                        .BLOCK    427
                        .LINE     427
                        LDI       _ACCCLO, ADAC.SerInpStr AND 0FFh
                        LDI       _ACCCHI, ADAC.SerInpStr SHRB 8
                        MOV       _ACCA, ADAC.i
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCA, Z+
                        STD       Y+004h, _ACCA
                        .LINE     428
                        LDD       _ACCA, Y+004h
                        CPI       _ACCA, 041h
                        LDI       _ACCA, 0
                        BRLO      ADAC._L0593
                        LDI       _ACCA, 0FFh
ADAC._L0593:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0596
                        BRNE      ADAC._L0596
                        .BRANCH   20,ADAC._L0594
                        JMP       ADAC._L0594
ADAC._L0596:
                        .BLOCK    428
                        .LINE     429
                        LDD       _ACCA, Y+004h
                        MOV       _ACCEHI, _ACCA
                        LDI       _ACCELO, 001h
                        LDI       _ACCA, _ACCELO SHRB 8
                        LDI       _ACCB, _ACCELO AND 0FFh
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDI       _ACCCLO, ADAC.ParamStr AND 0FFh
                        LDI       _ACCCHI, ADAC.ParamStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCA, 028h
                        PUSH      _ACCA
                        LDI       _ACCFHI, 000h
                        CALL      SYSTEM.StringAppend
                        .ENDBLOCK 431
                        .BRANCH   20,ADAC._L0595
                        JMP       ADAC._L0595
ADAC._L0594:
                        .BLOCK    431
                        .LINE     431
                        MOV       _ACCA, ADAC.i
                        STS       ADAC.SERINPPTR, _ACCA
                        .LINE     432
                        LDD       _ACCA, Y+003h
                        ADIW      _FRAMEPTR, 3
                        .BRANCH   20,ADAC.ParseExtract_X
                        JMP       ADAC.ParseExtract_X
                        .ENDBLOCK 433
ADAC._L0595:
                        .ENDBLOCK 434
ADAC._L0588:
                        .LINE     434
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,ADAC._L0589
                        BREQ      ADAC._L0589
                        .BRANCH   20,ADAC._L0590
                        JMP       ADAC._L0590
ADAC._L0589:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .ENDBLOCK 435
ADAC._L0577:
                        .LINE     436
                        LDD       _ACCA, Y+000h
                        .ENDBLOCK 437
ADAC.ParseExtract_X:
                        .LINE     437
                        .BRANCH   19
                        RET
                        .ENDFUNC  437

                        .FUNC     ParseSubCh, 001B7h, 00020h
ADAC.ParseSubCh:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 12
                        .BLOCK    450
                        .LINE     451
                        LDI       _ACCCLO, ADAC.SerInpStr AND 0FFh
                        LDI       _ACCCHI, ADAC.SerInpStr SHRB 8
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
                        BRNE      ADAC._L0597
                        SER       _ACCA
ADAC._L0597:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0600
                        BRNE      ADAC._L0600
                        .BRANCH   20,ADAC._L0598
                        JMP       ADAC._L0598
ADAC._L0600:
                        .BLOCK    451
                        .LINE     452
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ADAC.SERPROMPT
                        CALL      ADAC.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     453
                        .BRANCH   20,ADAC.ParseSubCh_X
                        JMP       ADAC.ParseSubCh_X
                        .ENDBLOCK 454
ADAC._L0598:
ADAC._L0599:
                        .LINE     455
                        LDI       _ACCA, 03Ah
                        PUSH      _ACCA
                        LDI       _ACCCLO, ADAC.SerInpStr AND 0FFh
                        LDI       _ACCCHI, ADAC.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCELO, 001h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCB
                        CALL      SYSTEM.PosChInVarStr
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      ADAC._L0601
                        BRLO      ADAC._L0601
                        SER       _ACCA
ADAC._L0601:
                        STD       Y+005h, _ACCA
                        .LINE     456
                        LDI       _ACCA, 03Dh
                        PUSH      _ACCA
                        LDI       _ACCCLO, ADAC.SerInpStr AND 0FFh
                        LDI       _ACCCHI, ADAC.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCELO, 001h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCB
                        CALL      SYSTEM.PosChInVarStr
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      ADAC._L0602
                        BRLO      ADAC._L0602
                        SER       _ACCA
ADAC._L0602:
                        COM       _ACCA
                        STD       Y+001h, _ACCA
                        .LINE     457
                        LDI       _ACCCLO, ADAC.SerInpStr AND 0FFh
                        LDI       _ACCCHI, ADAC.SerInpStr SHRB 8
                        ADIW      _ACCCLO, 00001h
                        LD        _ACCA, Z+
                        STD       Y+006h, _ACCA
                        .LINE     458
                        LDD       _ACCA, Y+006h
                        CPI       _ACCA, 02Ah
                        LDI       _ACCA, 0h
                        BRNE      ADAC._L0603
                        SER       _ACCA
ADAC._L0603:
                        STD       Y+002h, _ACCA
                        .LINE     459
                        LDD       _ACCA, Y+006h
                        CPI       _ACCA, 023h
                        LDI       _ACCA, 0h
                        BRNE      ADAC._L0604
                        SER       _ACCA
ADAC._L0604:
                        STD       Y+003h, _ACCA
                        .LINE     460
                        LDD       _ACCA, Y+003h
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0607
                        BRNE      ADAC._L0607
                        .BRANCH   20,ADAC._L0605
                        JMP       ADAC._L0605
ADAC._L0607:
                        .BLOCK    460
                        .LINE     461
                        .BRANCH   17,ADAC.WRITESERINP
                        CALL      ADAC.WRITESERINP
                        .LINE     462
                        .BRANCH   20,ADAC.ParseSubCh_X
                        JMP       ADAC.ParseSubCh_X
                        .ENDBLOCK 463
ADAC._L0605:
ADAC._L0606:
                        .LINE     464
                        LDI       _ACCA, 001h
                        STS       ADAC.SERINPPTR, _ACCA
                        .LINE     465
                        LDD       _ACCA, Y+005h
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0610
                        BRNE      ADAC._L0610
                        .BRANCH   20,ADAC._L0608
                        JMP       ADAC._L0608
ADAC._L0610:
                        .BLOCK    465
                        .LINE     466
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,ADAC.PARSEEXTRACT
                        CALL       ADAC.PARSEEXTRACT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        STD       Y+000h, _ACCA
                        .LINE     467
                        LDS       _ACCA, ADAC.SerInpPtr
                        INC       _ACCA
                        STS       ADAC.SerInpPtr, _ACCA
                        .LINE     468
                        LDD       _ACCA, Y+002h
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0613
                        BRNE      ADAC._L0613
                        .BRANCH   20,ADAC._L0611
                        JMP       ADAC._L0611
ADAC._L0613:
                        .BLOCK    469
                        .LINE     469
                        .BRANCH   17,ADAC.WRITESERINP
                        CALL      ADAC.WRITESERINP
                        .ENDBLOCK 470
                        .BRANCH   20,ADAC._L0612
                        JMP       ADAC._L0612
ADAC._L0611:
                        .BLOCK    470
                        .LINE     471
                        LDI       _ACCCLO, ADAC.ParamStr AND 0FFh
                        LDI       _ACCCHI, ADAC.ParamStr SHRB 8
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        CLT
                        BLD       Flags, _ERRFLAG
                        LDI       _ACCB, 000h
                        CALL      SYSTEM.Str2Int
                        MOV       _ACCA, _ACCB
                        STS       ADAC.CURRENTCH, _ACCA
                        .ENDBLOCK 472
ADAC._L0612:
                        .ENDBLOCK 473
ADAC._L0608:
ADAC._L0609:
                        .LINE     474
                        LDD       _ACCA, Y+002h
                        COM       _ACCA
                        PUSH      _ACCA
                        LDS       _ACCA, ADAC.CurrentCh
                        PUSH      _ACCA
                        LDS       _ACCA, ADAC.SlaveCh
                        POP       _ACCB
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0h
                        BREQ      ADAC._L0614
                        SER       _ACCA
ADAC._L0614:
                        POP       _ACCB
                        AND       _ACCA, _ACCB
                        PUSH      _ACCA
                        LDD       _ACCA, Y+005h
                        POP       _ACCB
                        AND       _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0617
                        BRNE      ADAC._L0617
                        .BRANCH   20,ADAC._L0615
                        JMP       ADAC._L0615
ADAC._L0617:
                        .BLOCK    475
                        .LINE     475
                        .BRANCH   17,ADAC.WRITESERINP
                        CALL      ADAC.WRITESERINP
                        .LINE     476
                        .BRANCH   20,ADAC.ParseSubCh_X
                        JMP       ADAC.ParseSubCh_X
                        .ENDBLOCK 477
ADAC._L0615:
ADAC._L0616:
                        .LINE     481
                        LDI       _ACCA, 021h
                        PUSH      _ACCA
                        LDI       _ACCCLO, ADAC.SerInpStr AND 0FFh
                        LDI       _ACCCHI, ADAC.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCELO, 001h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCB
                        CALL      SYSTEM.PosChInVarStr
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      ADAC._L0618
                        BRLO      ADAC._L0618
                        SER       _ACCA
ADAC._L0618:
                        PUSH      _ACCA
                        LDI       _ACCA, 03Fh
                        PUSH      _ACCA
                        LDI       _ACCCLO, ADAC.SerInpStr AND 0FFh
                        LDI       _ACCCHI, ADAC.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCELO, 001h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCB
                        CALL      SYSTEM.PosChInVarStr
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      ADAC._L0619
                        BRLO      ADAC._L0619
                        SER       _ACCA
ADAC._L0619:
                        POP       _ACCB
                        OR        _ACCA, _ACCB
                        STS       ADAC.VERBOSE, _ACCA
                        .LINE     482
                        LDI       _ACCA, 024h
                        PUSH      _ACCA
                        LDI       _ACCCLO, ADAC.SerInpStr AND 0FFh
                        LDI       _ACCCHI, ADAC.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCELO, 001h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCB
                        CALL      SYSTEM.PosChInVarStr
                        STD       Y+00Ah, _ACCA
                        .LINE     483
                        LDD       _ACCA, Y+00Ah
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      ADAC._L0620
                        BRLO      ADAC._L0620
                        SER       _ACCA
ADAC._L0620:
                        STD       Y+004h, _ACCA
                        .LINE     484
                        LDD       _ACCA, Y+004h
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0623
                        BRNE      ADAC._L0623
                        .BRANCH   20,ADAC._L0621
                        JMP       ADAC._L0621
ADAC._L0623:
                        .BLOCK    484
                        .LINE     485
                        LDI       _ACCCLO, ADAC.ParamStr AND 0FFh
                        LDI       _ACCCHI, ADAC.ParamStr SHRB 8
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
                        LDI       _ACCCLO, ADAC.SerInpStr AND 0FFh
                        LDI       _ACCCHI, ADAC.SerInpStr SHRB 8
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
                        .LINE     486
                        LDI       _ACCCLO, ADAC.ParamStr AND 0FFh
                        LDI       _ACCCHI, ADAC.ParamStr SHRB 8
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        CLT
                        BLD       Flags, _ERRFLAG
                        LDI       _ACCB, 0FFh
                        CALL      SYSTEM.Str2Int
                        MOV       _ACCA, _ACCB
                        STD       Y+008h, _ACCA
                        .LINE     487
                        LDI       _ACCA, 000h
                        STD       Y+009h, _ACCA
                        .LINE     488
                        .LOOP
                        LDI       _ACCCLO, ADAC.i AND 0FFh
                        LDI       _ACCCHI, ADAC.i SHRB 8
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
ADAC._L0626:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      ADAC._L0627
                        CLR       _ACCA
ADAC._L0627:
                        TST       _ACCA
                        .BRANCH   3,ADAC._L0628
                        BREQ      ADAC._L0628
                        .BRANCH   20,ADAC._L0625
                        JMP       ADAC._L0625
ADAC._L0628:
                        .BLOCK    489
                        .LINE     489
                        LDI       _ACCCLO, ADAC.SerInpStr AND 0FFh
                        LDI       _ACCCHI, ADAC.SerInpStr SHRB 8
                        MOV       _ACCA, ADAC.i
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCA, Z+
                        STD       Y+009h, _ACCA
                        .LINE     490
                        LDD       _ACCA, Y+00Ch
                        PUSH      _ACCA
                        LDD       _ACCA, Y+009h
                        POP       _ACCB
                        EOR       _ACCA, _ACCB
                        STD       Y+00Ch, _ACCA
                        .ENDBLOCK 491
ADAC._L0624:
                        .LINE     491
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,ADAC._L0625
                        BREQ      ADAC._L0625
                        .BRANCH   20,ADAC._L0626
                        JMP       ADAC._L0626
ADAC._L0625:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .LINE     492
                        LDD       _ACCA, Y+009h
                        PUSH      _ACCA
                        LDD       _ACCA, Y+008h
                        POP       _ACCB
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0h
                        BREQ      ADAC._L0629
                        SER       _ACCA
ADAC._L0629:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0632
                        BRNE      ADAC._L0632
                        .BRANCH   20,ADAC._L0630
                        JMP       ADAC._L0630
ADAC._L0632:
                        .BLOCK    492
                        .LINE     493
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 007h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ADAC.SERPROMPT
                        CALL      ADAC.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     494
                        .BRANCH   20,ADAC.ParseSubCh_X
                        JMP       ADAC.ParseSubCh_X
                        .ENDBLOCK 495
ADAC._L0630:
ADAC._L0631:
                        .ENDBLOCK 496
ADAC._L0621:
ADAC._L0622:
                        .LINE     498
                        LDI       _ACCA, 07Dh
                        STS       ADAC.ActivityTimer, _ACCA
                        .LINE     499
                        CBI       00032h, 002h
                        .LINE     502
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,ADAC.PARSEEXTRACT
                        CALL       ADAC.PARSEEXTRACT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0635
                        BRNE      ADAC._L0635
                        .BRANCH   20,ADAC._L0633
                        JMP       ADAC._L0633
ADAC._L0635:
                        .BLOCK    502
                        .LINE     503
                        LDI       _ACCA, 000h
                        STD       Y+007h, _ACCA
                        .LINE     504
                        LDI       _ACCA, 004h
                        STS       ADAC.CMDWHICH, _ACCA
                        .ENDBLOCK 505
                        .BRANCH   20,ADAC._L0634
                        JMP       ADAC._L0634
ADAC._L0633:
                        .BLOCK    505
                        .LINE     506
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,ADAC.CMD2INDEX
                        CALL       ADAC.CMD2INDEX
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        STS       ADAC.CMDWHICH, _ACCA
                        .LINE     507
                        LDS       _ACCA, ADAC.CmdWhich
                        CPI       _ACCA, 019h
                        LDI       _ACCA, 0h
                        BRNE      ADAC._L0636
                        SER       _ACCA
ADAC._L0636:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0639
                        BRNE      ADAC._L0639
                        .BRANCH   20,ADAC._L0637
                        JMP       ADAC._L0637
ADAC._L0639:
                        .BLOCK    507
                        .LINE     508
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 004h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ADAC.SERPROMPT
                        CALL      ADAC.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     509
                        .BRANCH   20,ADAC.ParseSubCh_X
                        JMP       ADAC.ParseSubCh_X
                        .ENDBLOCK 510
ADAC._L0637:
ADAC._L0638:
                        .LINE     511
                        LDI       _ACCCLO, ADAC.Cmd2SubChArr AND 0FFh
                        LDI       _ACCCHI, ADAC.Cmd2SubChArr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, ADAC.CmdWhich
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LPM       _ACCA, Z
                        STD       Y+007h, _ACCA
                        .LINE     512
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,ADAC.PARSEEXTRACT
                        CALL       ADAC.PARSEEXTRACT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 513
ADAC._L0634:
                        .LINE     514
                        LDI       _ACCCLO, ADAC.ParamStr AND 0FFh
                        LDI       _ACCCHI, ADAC.ParamStr SHRB 8
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
                        STS       ADAC.SUBCH, _ACCA
                        .LINE     516
                        LDD       _ACCA, Y+001h
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0642
                        BRNE      ADAC._L0642
                        .BRANCH   20,ADAC._L0640
                        JMP       ADAC._L0640
ADAC._L0642:
                        .BLOCK    516
                        .LINE     517
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,ADAC.PARSEGETPARAM
                        CALL      ADAC.PARSEGETPARAM
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 518
                        .BRANCH   20,ADAC._L0641
                        JMP       ADAC._L0641
ADAC._L0640:
                        .BLOCK    518
                        .LINE     519
                        LDI       _ACCA, 03Dh
                        PUSH      _ACCA
                        LDI       _ACCCLO, ADAC.SerInpStr AND 0FFh
                        LDI       _ACCCHI, ADAC.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCELO, 001h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCB
                        CALL      SYSTEM.PosChInVarStr
                        SUBI      _ACCA, -001h AND 0FFh
                        STS       ADAC.SERINPPTR, _ACCA
                        .LINE     520
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,ADAC.PARSEEXTRACT
                        CALL       ADAC.PARSEEXTRACT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0645
                        BRNE      ADAC._L0645
                        .BRANCH   20,ADAC._L0643
                        JMP       ADAC._L0643
ADAC._L0645:
                        .BLOCK    520
                        .LINE     521
                        LDI       _ACCCLO, ADAC.ParamStr AND 0FFh
                        LDI       _ACCCHI, ADAC.ParamStr SHRB 8
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        CALL      SYSTEM.Str2Float
                        STS       ADAC.PARAM, _ACCB
                        STS       ADAC.PARAM+1, _ACCA
                        STS       ADAC.PARAM+2, _ACCALO
                        STS       ADAC.PARAM+3, _ACCAHI
                        .LINE     522
                        LDS       _ACCB, ADAC.Param
                        LDS       _ACCA, ADAC.Param+1
                        LDS       _ACCALO, ADAC.Param+2
                        LDS       _ACCAHI, ADAC.Param+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.FloatToLInt
                        SBRC      _ACCAHI, 7
                        RJMP      ADAC._L0646
                        OR        _ACCAHI, _ACCALO
                        BRNE      ADAC._L0647
                        RJMP      ADAC._L0648
ADAC._L0646:
                        CPI       _ACCAHI, 0FFh
                        BRNE      ADAC._L0647
                        CPI       _ACCALO, 0FFh
                        BREQ      ADAC._L0648
ADAC._L0647:
                        SET
                        BLD       Flags, _ERRFLAG
ADAC._L0648:
                        STS       ADAC.PARAMINT, _ACCB
                        STS       ADAC.PARAMINT+1, _ACCA
                        .LINE     523
                        LDS       _ACCB, ADAC.ParamInt
                        LDS       _ACCA, ADAC.ParamInt+1
                        MOV       _ACCA, _ACCB
                        STS       ADAC.PARAMBYTE, _ACCA
                        .ENDBLOCK 524
                        .BRANCH   20,ADAC._L0644
                        JMP       ADAC._L0644
ADAC._L0643:
                        .BLOCK    524
                        .LINE     525
                        LDS       _ACCA, ADAC.CmdWhich
                        CPI       _ACCA, 004h
                        LDI       _ACCA, 0
                        BRLO      ADAC._L0649
                        LDI       _ACCA, 0FFh
ADAC._L0649:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0652
                        BRNE      ADAC._L0652
                        .BRANCH   20,ADAC._L0650
                        JMP       ADAC._L0650
ADAC._L0652:
                        .BLOCK    526
                        .LINE     526
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 005h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ADAC.SERPROMPT
                        CALL      ADAC.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     527
                        .BRANCH   20,ADAC.ParseSubCh_X
                        JMP       ADAC.ParseSubCh_X
                        .ENDBLOCK 528
ADAC._L0650:
ADAC._L0651:
                        .ENDBLOCK 529
ADAC._L0644:
                        .LINE     530
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,ADAC.PARSESETPARAM
                        CALL      ADAC.PARSESETPARAM
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 531
ADAC._L0641:
                        .ENDBLOCK 532
ADAC.ParseSubCh_X:
                        .LINE     532
                        .BRANCH   19
                        RET
                        .ENDFUNC  532


                        .FILE     H:\PROJAVR\ADA-C\ADA-C.pas
                        .FUNC     Chores, 002ECh, 00020h
ADAC.Chores:
                        .RETURNS   0
                        .BLOCK    750
                        .ENDBLOCK 751
ADAC.Chores_X:
                        .LINE     751
                        .BRANCH   19
                        RET
                        .ENDFUNC  751

                        .FUNC     CheckSer, 002F1h, 00020h
ADAC.CheckSer:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 1
                        .BLOCK    756
                        .LINE     757
ADAC._L0653:
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        MOVW      _ACCCLO, _FRAMEPTR
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 00Ah
                        ST        -Y, _ACCA
                        .FRAME  3
                        .FRAME  0
                        CALL       SYSTEM.SERINP_TO
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0655
                        BRNE      ADAC._L0655
                        .BRANCH   20,ADAC._L0654
                        JMP       ADAC._L0654
ADAC._L0655:
                        .BLOCK    759
                        .LINE     759
                        LDD       _ACCA, Y+000h
                        CPI       _ACCA, 07Fh
                        .BRANCH   3,ADAC._L0656
                        BREQ      ADAC._L0656
                        .BRANCH   1,ADAC._L0657
                        BRSH      ADAC._L0657
                        CPI       _ACCA, 020h
                        .BRANCH   1,ADAC._L0657
                        BRLO      ADAC._L0657
                        LDI       _ACCDLO, 0
                        SEZ
                        .BRANCH   20,ADAC._L0656
                        RJMP      ADAC._L0656
ADAC._L0657:
                        LDI       _ACCDLO, 001h
ADAC._L0656:
                        LDI       _ACCA, 0h
                        BRNE      ADAC._L0658
                        SER       _ACCA
ADAC._L0658:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0661
                        BRNE      ADAC._L0661
                        .BRANCH   20,ADAC._L0659
                        JMP       ADAC._L0659
ADAC._L0661:
                        .BLOCK    760
                        .LINE     760
                        LDD       _ACCA, Y+000h
                        MOV       _ACCEHI, _ACCA
                        LDI       _ACCELO, 001h
                        LDI       _ACCA, _ACCELO SHRB 8
                        LDI       _ACCB, _ACCELO AND 0FFh
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDI       _ACCCLO, ADAC.SerInpStr AND 0FFh
                        LDI       _ACCCHI, ADAC.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCA, 03Fh
                        PUSH      _ACCA
                        LDI       _ACCFHI, 000h
                        CALL      SYSTEM.StringAppend
                        .ENDBLOCK 761
ADAC._L0659:
ADAC._L0660:
                        .LINE     762
                        LDD       _ACCA, Y+000h
                        CPI       _ACCA, 008h
                        LDI       _ACCA, 0h
                        BRNE      ADAC._L0662
                        SER       _ACCA
ADAC._L0662:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0665
                        BRNE      ADAC._L0665
                        .BRANCH   20,ADAC._L0663
                        JMP       ADAC._L0663
ADAC._L0665:
                        .BLOCK    763
                        .LINE     763
                        LDI       _ACCCLO, ADAC.SerInpStr AND 0FFh
                        LDI       _ACCCHI, ADAC.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCCLO, ADAC.SerInpStr AND 0FFh
                        LDI       _ACCCHI, ADAC.SerInpStr SHRB 8
                        LD        _ACCA, Z
                        SUBI      _ACCA, 001h AND 0FFh
                        POP       _ACCCHI
                        POP       _ACCCLO
                        CPI       _ACCA, 63
                        BRCS      ADAC._L0666
                        LDI       _ACCA, 63
ADAC._L0666:
                        ST        Z+, _ACCA
                        .ENDBLOCK 764
ADAC._L0663:
ADAC._L0664:
                        .LINE     765
                        LDD       _ACCA, Y+000h
                        CPI       _ACCA, 00Dh
                        LDI       _ACCA, 0h
                        BRNE      ADAC._L0667
                        SER       _ACCA
ADAC._L0667:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0670
                        BRNE      ADAC._L0670
                        .BRANCH   20,ADAC._L0668
                        JMP       ADAC._L0668
ADAC._L0670:
                        .BLOCK    765
                        .LINE     766
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,ADAC.PARSESUBCH
                        CALL      ADAC.PARSESUBCH
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     776
                        LDI       _ACCCLO, ADAC.SerInpStr AND 0FFh
                        LDI       _ACCCHI, ADAC.SerInpStr SHRB 8
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
                        .ENDBLOCK 777
ADAC._L0668:
ADAC._L0669:
                        .ENDBLOCK 778
                        .LINE     778
                        .BRANCH   20,ADAC._L0653
                        JMP       ADAC._L0653
ADAC._L0654:
                        .ENDBLOCK 780
ADAC.CheckSer_X:
                        .LINE     780
                        .BRANCH   19
                        RET
                        .ENDFUNC  780

                        .FUNC     CheckDelay, 0030Eh, 00020h
ADAC.CheckDelay:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 1
                        .BLOCK    785
                        .LINE     786
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
ADAC._L0673:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      ADAC._L0674
                        CLR       _ACCA
ADAC._L0674:
                        TST       _ACCA
                        .BRANCH   3,ADAC._L0675
                        BREQ      ADAC._L0675
                        .BRANCH   20,ADAC._L0672
                        JMP       ADAC._L0672
ADAC._L0675:
                        .BLOCK    787
                        .LINE     787
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,ADAC.CHECKSER
                        CALL      ADAC.CHECKSER
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 788
ADAC._L0671:
                        .LINE     788
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,ADAC._L0672
                        BREQ      ADAC._L0672
                        .BRANCH   20,ADAC._L0673
                        JMP       ADAC._L0673
ADAC._L0672:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .ENDBLOCK 789
ADAC.CheckDelay_X:
                        .LINE     789
                        .BRANCH   19
                        RET
                        .ENDFUNC  789

                        .FUNC     initall, 00319h, 00020h
ADAC.initall:
                        .RETURNS   0
                        .BLOCK    795
                        .LINE     796
                        LDI       _ACCA, 05Bh
                        OUT       DDRB, _ACCA
                        .LINE     797
                        LDI       _ACCA, 0BFh
                        OUT       PORTB, _ACCA
                        .LINE     798
                        LDI       _ACCA, 0FCh
                        OUT       DDRC, _ACCA
                        .LINE     799
                        LDI       _ACCA, 003h
                        OUT       PORTC, _ACCA
                        .LINE     800
                        LDI       _ACCA, 00Ch
                        OUT       DDRD, _ACCA
                        .LINE     801
                        LDI       _ACCA, 0FCh
                        OUT       PORTD, _ACCA
                        .LINE     803
                        LDI       _ACCA, 038h
                        CALL      SYSTEM.I2CexpStat
                        STS       ADAC.IOPRESENT, _ACCA
                        .LINE     806
                        .LOOP
                        LDI       _ACCCLO, ADAC.i AND 0FFh
                        LDI       _ACCCHI, ADAC.i SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 000h
                        ST        Z, _ACCA
                        LDI       _ACCA, 007h
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
ADAC._L0678:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      ADAC._L0679
                        CLR       _ACCA
ADAC._L0679:
                        TST       _ACCA
                        .BRANCH   3,ADAC._L0680
                        BREQ      ADAC._L0680
                        .BRANCH   20,ADAC._L0677
                        JMP       ADAC._L0677
ADAC._L0680:
                        .BLOCK    807
                        .LINE     807
                        LDI       _ACCCLO, ADAC.DirInitArray AND 0FFh
                        LDI       _ACCCHI, ADAC.DirInitArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        MOV       _ACCA, ADAC.i
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        CALL      SYSTEM.ReadEEp8
                        MOV       ADAC.J, _ACCA
                        .LINE     808
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        MOV       _ACCA, ADAC.i
                        ST        -Y, _ACCA
                        .FRAME  4
                        MOV       _ACCA, ADAC.j
                        ST        -Y, _ACCA
                        .FRAME  5
                        .FRAME  3
                        .BRANCH   17,ADAC.SETDIR
                        CALL      ADAC.SETDIR
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     809
                        LDI       _ACCCLO, ADAC.PortInitArray AND 0FFh
                        LDI       _ACCCHI, ADAC.PortInitArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        MOV       _ACCA, ADAC.i
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        CALL      SYSTEM.ReadEEp8
                        MOV       ADAC.J, _ACCA
                        .LINE     810
                        LDI       _ACCCLO, ADAC.PortArray AND 0FFh
                        LDI       _ACCCHI, ADAC.PortArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        MOV       _ACCA, ADAC.i
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        MOV       _ACCA, ADAC.j
                        ST        Z+, _ACCA
                        .LINE     811
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        MOV       _ACCA, ADAC.i
                        ST        -Y, _ACCA
                        .FRAME  4
                        MOV       _ACCA, ADAC.j
                        ST        -Y, _ACCA
                        .FRAME  5
                        .FRAME  3
                        .BRANCH   17,ADAC.SETPORT
                        CALL      ADAC.SETPORT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     812
                        LDI       _ACCA, 000h
                        MOV       ADAC.J, _ACCA
                        .LINE     815
                        MOV       _ACCA, ADAC.i
                        SUBI      _ACCA, -038h AND 0FFh
                        STS       ADAC.I2CSLAVEADR, _ACCA
                        .LINE     816
                        LDS       _ACCA, ADAC.IOpresent
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0683
                        BRNE      ADAC._L0683
                        .BRANCH   20,ADAC._L0681
                        JMP       ADAC._L0681
ADAC._L0683:
                        .BLOCK    816
                        .LINE     817
                        LDI       _ACCA, 00200h SHRB 8
                        LDI       _ACCB, 00200h AND 0FFh
                        STS       ADAC.PARAMINT, _ACCB
                        STS       ADAC.PARAMINT+1, _ACCA
                        .LINE     818
                        LDS       _ACCA, ADAC.I2CslaveAdr
                        PUSH      _ACCA
                        LDS       _ACCB, ADAC.ParamInt
                        LDS       _ACCA, ADAC.ParamInt+1
                        MOVW      _ACCALO, _ACCB
                        SET
                        BLD       Flags, _I2C2BYTE
                        POP       _ACCDLO
                        LDI       _ACCBLO, 00000h AND 0FFh
                        LDI       _ACCBHI, 00000h SHRB 8
                        LDI       _ACCDHI, 000h
                        CALL       SYSTEM.TWIOut
                        .ENDBLOCK 819
ADAC._L0681:
ADAC._L0682:
                        .ENDBLOCK 820
ADAC._L0676:
                        .LINE     820
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,ADAC._L0677
                        BREQ      ADAC._L0677
                        .BRANCH   20,ADAC._L0678
                        JMP       ADAC._L0678
ADAC._L0677:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .LINE     822
                        LDI       _ACCCLO, ADAC.EESerBaudReg AND 0FFh
                        LDI       _ACCCHI, ADAC.EESerBaudReg SHRB 8
                        CALL      SYSTEM.ReadEEp8
                        MOV       ADAC.I, _ACCA
                        .LINE     823
                        MOV       _ACCA, ADAC.i
                        CPI       _ACCA, 0EFh
                        .BRANCH   3,ADAC._L0684
                        BREQ      ADAC._L0684
                        .BRANCH   1,ADAC._L0685
                        BRSH      ADAC._L0685
                        CPI       _ACCA, 009h
                        .BRANCH   1,ADAC._L0685
                        BRLO      ADAC._L0685
                        LDI       _ACCDLO, 0
                        SEZ
                        .BRANCH   20,ADAC._L0684
                        RJMP      ADAC._L0684
ADAC._L0685:
                        LDI       _ACCDLO, 001h
ADAC._L0684:
                        LDI       _ACCA, 0h
                        BRNE      ADAC._L0686
                        SER       _ACCA
ADAC._L0686:
                        COM       _ACCA
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0689
                        BRNE      ADAC._L0689
                        .BRANCH   20,ADAC._L0687
                        JMP       ADAC._L0687
ADAC._L0689:
                        .BLOCK    823
                        .LINE     824
                        LDI       _ACCA, 033h
                        LDI       _ACCCLO, ADAC.EESERBAUDREG AND 0FFh
                        LDI       _ACCCHI, ADAC.EESERBAUDREG SHRB 8
                        CALL      SYSTEM.WriteEEp8
                        ADIW      _ACCCLO, 01h
                        .LINE     825
                        LDI       _ACCA, 033h
                        MOV       ADAC.I, _ACCA
                        .ENDBLOCK 826
ADAC._L0687:
ADAC._L0688:
                        .LINE     827
                        MOV       _ACCA, ADAC.i
                        OUT       UBRR1, _ACCA
                        .LINE     828
                        IN        _ACCA, UCSRA
                        ORI       _ACCA, 002h
                        OUT       UCSRA, _ACCA
                        .LINE     831
                        LDI       _ACCCLO, ADAC.ExtRef AND 0FFh
                        LDI       _ACCCHI, ADAC.ExtRef SHRB 8
                        CALL      SYSTEM.ReadEEp8
                        CPI       _ACCA, 001h
                        LDI       _ACCA, 0h
                        BRNE      ADAC._L0690
                        SER       _ACCA
ADAC._L0690:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0693
                        BRNE      ADAC._L0693
                        .BRANCH   20,ADAC._L0691
                        JMP       ADAC._L0691
ADAC._L0693:
                        .BLOCK    831
                        .LINE     832
                        IN        _ACCA, ADMUX
                        ORI       _ACCA, 0C0h
                        OUT       ADMUX, _ACCA
                        .ENDBLOCK 833
ADAC._L0691:
ADAC._L0692:
                        .LINE     834
                        LDI       _ACCA, 000h
                        STS       ADAC.LCDPRESENT, _ACCA
                        .LINE     835
                        IN        _ACCA, PinD
                        COM       _ACCA
                        LDI       _ACCALO, 005h
                        CALL      SYSTEM.SHR8_R
                        STS       ADAC.SLAVECH, _ACCA
                        .LINE     836
                        CBI       00032h, 002h
                        .LINE     837
                        LDI       _ACCA, 000h
                        .FRAME  0
                        CALL       SYSTEM.LCDSETUP_M
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0696
                        BRNE      ADAC._L0696
                        .BRANCH   20,ADAC._L0694
                        JMP       ADAC._L0694
ADAC._L0696:
                        .BLOCK    837
                        .LINE     838
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
                        .LINE     839
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
                        .LINE     840
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
                        .LINE     841
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
                        .LINE     842
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
                        .LINE     844
                        LDI       _ACCA, 0FFh
                        STS       ADAC.LCDPRESENT, _ACCA
                        .LINE     845
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, ADAC.Vers3Str AND 0FFh
                        LDI       _ACCCHI, ADAC.Vers3Str SHRB 8
                        CALL      SYSTEM.StrConst2Str
ADAC._L0697:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     846
                        LDI       _ACCA, 000h
                        STS       ADAC.X, _ACCA
                        .LINE     847
                        LDI       _ACCA, 001h
                        STS       ADAC.Y, _ACCA
                        .LINE     848
                        .BRANCH   17,ADAC.LCD1XY
                        CALL      ADAC.LCD1XY
                        .LINE     849
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, ADAC.AdrStr AND 0FFh
                        LDI       _ACCCHI, ADAC.AdrStr SHRB 8
                        CALL      SYSTEM.StrConst2Str
ADAC._L0698:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     850
                        LDS       _ACCA, ADAC.SlaveCh
                        SUBI      _ACCA, -030h AND 0FFh
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .ENDBLOCK 851
ADAC._L0694:
ADAC._L0695:
                        .LINE     853
                        LDI       _ACCA, 003E8h SHRB 8
                        LDI       _ACCB, 003E8h AND 0FFh
                        .FRAME  0
                        CALL      SYSTEM.MDELAY
                        .LINE     854
                        LDS       _ACCA, ADAC.SlaveCh
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      ADAC._L0699
                        BRLO      ADAC._L0699
                        SER       _ACCA
ADAC._L0699:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0702
                        BRNE      ADAC._L0702
                        .BRANCH   20,ADAC._L0700
                        JMP       ADAC._L0700
ADAC._L0702:
                        .BLOCK    854
                        .LINE     855
                        .LOOP
                        LDI       _ACCCLO, ADAC.i AND 0FFh
                        LDI       _ACCCHI, ADAC.i SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 000h
                        ST        Z, _ACCA
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, ADAC.SlaveCh
                        SUBI      _ACCA, 001h AND 0FFh
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
ADAC._L0705:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      ADAC._L0706
                        CLR       _ACCA
ADAC._L0706:
                        TST       _ACCA
                        .BRANCH   3,ADAC._L0707
                        BREQ      ADAC._L0707
                        .BRANCH   20,ADAC._L0704
                        JMP       ADAC._L0704
ADAC._L0707:
                        .BLOCK    856
                        .LINE     856
                        CLR       _ACCA
                        SBIC      032h, 002h
                        SER       _ACCA
                        COM       _ACCA
                        CLT
                        TST       _ACCA
                        BREQ      ADAC._L0708
                        SET
ADAC._L0708:
                        IN        _ACCA, 00032h
                        BLD       _ACCA, 002h
                        OUT       00032h, _ACCA
                        .LINE     857
                        LDI       _ACCA, 00096h SHRB 8
                        LDI       _ACCB, 00096h AND 0FFh
                        .FRAME  3
                        CALL      SYSTEM.MDELAY
                        .LINE     858
                        CLR       _ACCA
                        SBIC      032h, 002h
                        SER       _ACCA
                        COM       _ACCA
                        CLT
                        TST       _ACCA
                        BREQ      ADAC._L0709
                        SET
ADAC._L0709:
                        IN        _ACCA, 00032h
                        BLD       _ACCA, 002h
                        OUT       00032h, _ACCA
                        .LINE     859
                        LDI       _ACCA, 00096h SHRB 8
                        LDI       _ACCB, 00096h AND 0FFh
                        .FRAME  3
                        CALL      SYSTEM.MDELAY
                        .ENDBLOCK 860
ADAC._L0703:
                        .LINE     860
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,ADAC._L0704
                        BREQ      ADAC._L0704
                        .BRANCH   20,ADAC._L0705
                        JMP       ADAC._L0705
ADAC._L0704:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .ENDBLOCK 861
ADAC._L0700:
ADAC._L0701:
                        .LINE     863
                        SBI       00032h, 002h
                        .LINE     867
                        CBI       00038h, 001h
                        .LINE     868
                        LDI       _ACCA, 001h
                        .FRAME  0
                        CALL      SYSTEM.UDELAY
                        .LINE     869
                        CLR       _ACCA
                        SBIC      036h, 007h
                        SER       _ACCA
                        COM       _ACCA
                        STS       ADAC.DAC12PRESENT, _ACCA
                        .LINE     870
                        SBI       00038h, 001h
                        .LINE     871
                        CBI       00038h, 003h
                        .LINE     872
                        LDI       _ACCA, 001h
                        .FRAME  0
                        CALL      SYSTEM.UDELAY
                        .LINE     873
                        CLR       _ACCA
                        SBIC      036h, 007h
                        SER       _ACCA
                        COM       _ACCA
                        STS       ADAC.DAC714PRESENT, _ACCA
                        .LINE     874
                        SBI       00038h, 003h
                        .LINE     875
                        LDS       _ACCA, ADAC.DAC12present
                        PUSH      _ACCA
                        LDS       _ACCA, ADAC.DAC714present
                        POP       _ACCB
                        AND       _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0712
                        BRNE      ADAC._L0712
                        .BRANCH   20,ADAC._L0710
                        JMP       ADAC._L0710
ADAC._L0712:
                        .BLOCK    875
                        .LINE     876
                        LDI       _ACCA, 0FFh
                        STS       ADAC.DAC16PRESENT, _ACCA
                        .LINE     877
                        LDI       _ACCA, 000h
                        STS       ADAC.DAC12PRESENT, _ACCA
                        .LINE     878
                        LDI       _ACCA, 000h
                        STS       ADAC.DAC714PRESENT, _ACCA
                        .ENDBLOCK 879
ADAC._L0710:
ADAC._L0711:
                        .LINE     880
                        CBI       00038h, 004h
                        .LINE     881
                        LDI       _ACCA, 001h
                        .FRAME  0
                        CALL      SYSTEM.UDELAY
                        .LINE     882
                        CLR       _ACCA
                        SBIC      036h, 007h
                        SER       _ACCA
                        COM       _ACCA
                        STS       ADAC.ADC16PRESENT, _ACCA
                        .LINE     883
                        SBI       00038h, 004h
                        .LINE     885
                        LDS       _ACCA, ADAC.LCDpresent
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0715
                        BRNE      ADAC._L0715
                        .BRANCH   20,ADAC._L0713
                        JMP       ADAC._L0713
ADAC._L0715:
                        .BLOCK    885
                        .LINE     886
                        LDI       _ACCA, 000h
                        STS       ADAC.X, _ACCA
                        .LINE     887
                        LDI       _ACCA, 000h
                        STS       ADAC.Y, _ACCA
                        .LINE     888
                        .BRANCH   17,ADAC.LCD1XY
                        CALL      ADAC.LCD1XY
                        .LINE     889
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, ADAC.CardsStr AND 0FFh
                        LDI       _ACCCHI, ADAC.CardsStr SHRB 8
                        CALL      SYSTEM.StrConst2Str
ADAC._L0716:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     890
                        LDI       _ACCA, 001h
                        STS       ADAC.Y, _ACCA
                        .LINE     891
                        .BRANCH   17,ADAC.LCD1XY
                        CALL      ADAC.LCD1XY
                        .LINE     892
                        LDI       _ACCCLO, ADAC.EEinitialised AND 0FFh
                        LDI       _ACCCHI, ADAC.EEinitialised SHRB 8
                        CALL      SYSTEM._ReadEEp16
                        CPI       _ACCA, 0AAh
                        BRNE      ADAC._L0717
                        CPI       _ACCB, 055h
ADAC._L0717:
                        LDI       _ACCA, 0h
                        BREQ      ADAC._L0718
                        SER       _ACCA
ADAC._L0718:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0721
                        BRNE      ADAC._L0721
                        .BRANCH   20,ADAC._L0719
                        JMP       ADAC._L0719
ADAC._L0721:
                        .BLOCK    892
                        .LINE     893
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, ADAC.EEnotProgrammedStr AND 0FFh
                        LDI       _ACCCHI, ADAC.EEnotProgrammedStr SHRB 8
                        CALL      SYSTEM.StrConst2Str
ADAC._L0722:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .ENDBLOCK 894
                        .BRANCH   20,ADAC._L0720
                        JMP       ADAC._L0720
ADAC._L0719:
                        .BLOCK    894
                        .LINE     895
                        .BRANCH   17,ADAC.WRITEFEATURESLCD
                        CALL      ADAC.WRITEFEATURESLCD
                        .ENDBLOCK 896
ADAC._L0720:
                        .ENDBLOCK 897
ADAC._L0713:
ADAC._L0714:
                        .LINE     898
                        LDI       _ACCCLO, ADAC.ParamTextStr AND 0FFh
                        LDI       _ACCCHI, ADAC.ParamTextStr SHRB 8
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
                        .LINE     900
                        .LOOP
                        LDI       _ACCCLO, ADAC.SubCh AND 0FFh
                        LDI       _ACCCHI, ADAC.SubCh SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 014h
                        ST        Z, _ACCA
                        LDI       _ACCA, 01Bh
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
ADAC._L0725:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      ADAC._L0726
                        CLR       _ACCA
ADAC._L0726:
                        TST       _ACCA
                        .BRANCH   3,ADAC._L0727
                        BREQ      ADAC._L0727
                        .BRANCH   20,ADAC._L0724
                        JMP       ADAC._L0724
ADAC._L0727:
                        .BLOCK    901
                        .LINE     901
                        LDI       _ACCCLO, ADAC.DACValueArray AND 0FFh
                        LDI       _ACCCHI, ADAC.DACValueArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, ADAC.SubCh
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
                        LDI       _ACCB, 000h
                        LDI       _ACCA, 000h
                        LDI       _ACCALO, 000h
                        LDI       _ACCAHI, 000h
                        ST        Z+, _ACCB
                        ST        Z+, _ACCA
                        ST        Z+, _ACCALO
                        ST        Z+, _ACCAHI
                        .LINE     902
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCA, ADAC.SubCh
                        ST        -Y, _ACCA
                        .FRAME  4
                        .FRAME  3
                        .BRANCH   17,ADAC.SETDAC
                        CALL      ADAC.SETDAC
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 903
ADAC._L0723:
                        .LINE     903
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,ADAC._L0724
                        BREQ      ADAC._L0724
                        .BRANCH   20,ADAC._L0725
                        JMP       ADAC._L0725
ADAC._L0724:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .LINE     905
                        .BRANCH   17,ADAC.SETBASESCALES
                        CALL      ADAC.SETBASESCALES
                        .LINE     906
                        LDI       _ACCCLO, ADAC.InitIntegrateAD16 AND 0FFh
                        LDI       _ACCCHI, ADAC.InitIntegrateAD16 SHRB 8
                        CALL      SYSTEM.ReadEEp8
                        STS       ADAC.INTEGRATEAD16, _ACCA
                        .LINE     907
                        LDS       _ACCA, ADAC.SlaveCh
                        STS       ADAC.CURRENTCH, _ACCA
                        .LINE     908
                        LDI       _ACCA, 000h
                        STS       ADAC.SUBCH, _ACCA
                        .LINE     909
                        LDI       _ACCA, 000h
                        STS       ADAC.STATUS, _ACCA
                        .LINE     911
                        IN        _ACCA, GICR
                        ORI       _ACCA, 020h
                        OUT       GICR, _ACCA
                        .LINE     912
                        LDI       _ACCCLO, ADAC.TrigLevel AND 0FFh
                        LDI       _ACCCHI, ADAC.TrigLevel SHRB 8
                        CALL      SYSTEM.ReadEEp8
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BRNE      ADAC._L0728
                        SER       _ACCA
ADAC._L0728:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0731
                        BRNE      ADAC._L0731
                        .BRANCH   20,ADAC._L0729
                        JMP       ADAC._L0729
ADAC._L0731:
                        .BLOCK    912
                        .LINE     913
                        IN        _ACCA, MCUCSR
                        ANDI      _ACCA, 0BFh
                        OUT       MCUCSR, _ACCA
                        .ENDBLOCK 914
                        .BRANCH   20,ADAC._L0730
                        JMP       ADAC._L0730
ADAC._L0729:
                        .BLOCK    914
                        .LINE     915
                        IN        _ACCA, MCUCSR
                        ORI       _ACCA, 040h
                        OUT       MCUCSR, _ACCA
                        .ENDBLOCK 916
ADAC._L0730:
                        .LINE     917
                        LDI       _ACCA, 1 SHLB IntFlag
                        OR        Flags, _ACCA
                        SEI
                        .LINE     921
                        LDI       _ACCA, 0FEh
                        STS       ADAC.SUBCH, _ACCA
                        .LINE     922
                        .BRANCH   17,ADAC.WRITECHPREFIX
                        CALL      ADAC.WRITECHPREFIX
                        .LINE     923
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.Serout SHRB 1
                        LDI       _ACCA, SYSTEM.Serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, ADAC.Vers1Str AND 0FFh
                        LDI       _ACCCHI, ADAC.Vers1Str SHRB 8
                        CALL      SYSTEM.StrConst2Str
ADAC._L0732:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     924
                        LDI       _ACCCLO, ADAC.EEinitialised AND 0FFh
                        LDI       _ACCCHI, ADAC.EEinitialised SHRB 8
                        CALL      SYSTEM._ReadEEp16
                        CPI       _ACCA, 0AAh
                        BRNE      ADAC._L0733
                        CPI       _ACCB, 055h
ADAC._L0733:
                        LDI       _ACCA, 0h
                        BREQ      ADAC._L0734
                        SER       _ACCA
ADAC._L0734:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0737
                        BRNE      ADAC._L0737
                        .BRANCH   20,ADAC._L0735
                        JMP       ADAC._L0735
ADAC._L0737:
                        .BLOCK    924
                        .LINE     925
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.Serout SHRB 1
                        LDI       _ACCA, SYSTEM.Serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, ADAC.EEnotProgrammedStr AND 0FFh
                        LDI       _ACCCHI, ADAC.EEnotProgrammedStr SHRB 8
                        CALL      SYSTEM.StrConst2Str
ADAC._L0738:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .ENDBLOCK 926
ADAC._L0735:
ADAC._L0736:
                        .LINE     927
                        .BRANCH   17,ADAC.WRITEFEATURES
                        CALL      ADAC.WRITEFEATURES
                        .LINE     928
                        .BRANCH   17,ADAC.SERCRLF
                        CALL      ADAC.SERCRLF
                        .LINE     929
                        LDI       _ACCCLO, ADAC.SerInpStr AND 0FFh
                        LDI       _ACCCHI, ADAC.SerInpStr SHRB 8
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
                        .LINE     930
                        LDI       _ACCA, 048h
                        STS       ADAC.I2CSLAVEADR, _ACCA
                        .LINE     933
                        CALL      SYSTEM.INCRCOUNT4START
                        .LINE     934
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
                        .LINE     935
                        LDI       _ACCA, 000h
                        .FRAME  0
                        CALL       SYSTEM.GETINCRVAL4
                        STS       ADAC.INCRVALUE, _ACCB
                        STS       ADAC.INCRVALUE+1, _ACCA
                        STS       ADAC.INCRVALUE+2, _ACCALO
                        STS       ADAC.INCRVALUE+3, _ACCAHI
                        .LINE     936
                        LDS       _ACCB, ADAC.IncrValue
                        LDS       _ACCA, ADAC.IncrValue+1
                        LDS       _ACCALO, ADAC.IncrValue+2
                        LDS       _ACCAHI, ADAC.IncrValue+3
                        STS       ADAC.OLDINCRVALUE, _ACCB
                        STS       ADAC.OLDINCRVALUE+1, _ACCA
                        STS       ADAC.OLDINCRVALUE+2, _ACCALO
                        STS       ADAC.OLDINCRVALUE+3, _ACCAHI
                        .LINE     937
                        LDI       _ACCA, 00000h SHRB 8
                        LDI       _ACCB, 00000h AND 0FFh
                        STS       ADAC.INCRDIFF, _ACCB
                        STS       ADAC.INCRDIFF+1, _ACCA
                        .LINE     938
                        LDI       _ACCA, 000h
                        STS       ADAC.INCRFINE, _ACCA
                        .LINE     939
                        LDI       _ACCA, 0FFh
                        STS       ADAC.FIRSTTURN, _ACCA
                        .LINE     940
                        LDI       _ACCCLO, ADAC.IncRastDef AND 0FFh
                        LDI       _ACCCHI, ADAC.IncRastDef SHRB 8
                        CALL      SYSTEM._ReadEEp16
                        STS       ADAC.INCRAST, _ACCB
                        STS       ADAC.INCRAST+1, _ACCA
                        .LINE     942
                        LDI       _ACCA, 014h
                        STS       ADAC.MODIFY, _ACCA
                        .LINE     943
                        LDI       _ACCA, 000h
                        STS       ADAC.AUTOREPEAT, _ACCA
                        .LINE     944
                        LDI       _ACCA, 0FFh
                        STS       ADAC.CURRENTCH, _ACCA
                        .LINE     945
                        LDI       _ACCA, 00000h SHRB 8
                        LDI       _ACCB, 00000h AND 0FFh
                        STS       ADAC.ERRCOUNT, _ACCB
                        STS       ADAC.ERRCOUNT+1, _ACCA
                        .LINE     946
                        LDI       _ACCA, 0FFh
                        STS       ADAC.CHANGEDFLAG, _ACCA
                        .ENDBLOCK 947
ADAC.initall_X:
                        .LINE     947
                        .BRANCH   19
                        RET
                        .ENDFUNC  947



                        ; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                        ; Program body
                        ; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

                        .FUNC     $_Main, 003B7h, 00020h
                        .ENTRYMAIN $
ADAC.$_Main:

                        .BLOCK    951
                        .LINE     952
                        .BRANCH   17,ADAC.INITALL
                        CALL      ADAC.INITALL
ADAC._L0739:
                        .BLOCK    953
                        .LINE     954
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,ADAC.CHECKSER
                        CALL      ADAC.CHECKSER
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     955
                        CLR       _ACCA
                        MOV       _ACCB, _SYSTFLAGS
                        ANDI      _ACCB, 001h
                        BRNE      ADAC._L0741
                        COM       _ACCA
ADAC._L0741:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0744
                        BRNE      ADAC._L0744
                        .BRANCH   20,ADAC._L0742
                        JMP       ADAC._L0742
ADAC._L0744:
                        .BLOCK    956
                        .LINE     956
                        LDI       _ACCCLO, ADAC.TrigTimerValue AND 0FFh
                        LDI       _ACCCHI, ADAC.TrigTimerValue SHRB 8
                        CALL      SYSTEM._ReadEEp16
                        MOV       ADAC.AWORD, _ACCB
                        MOV       ADAC.AWORD+1, _ACCA
                        .LINE     957
                        MOV       _ACCB, ADAC.aWord
                        MOV       _ACCA, ADAC.aWord+1
                        CPI       _ACCA, 000h
                        BRNE      ADAC._L0745
                        CPI       _ACCB, 000h
ADAC._L0745:
                        LDI       _ACCA, 0h
                        BREQ      ADAC._L0746
                        SER       _ACCA
ADAC._L0746:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0749
                        BRNE      ADAC._L0749
                        .BRANCH   20,ADAC._L0747
                        JMP       ADAC._L0747
ADAC._L0749:
                        .BLOCK    957
                        .LINE     958
                        LDI       _ACCA, 0FFh
                        STS       ADAC.TRIGGER, _ACCA
                        .LINE     959
                        MOV       _ACCB, ADAC.aWord
                        MOV       _ACCA, ADAC.aWord+1
                        LSR       _ACCA
                        ROR       _ACCB
                        MOV       ADAC.AWORD, _ACCB
                        MOV       ADAC.AWORD+1, _ACCA
                        .LINE     960
                        MOV       _ACCB, ADAC.aWord
                        MOV       _ACCA, ADAC.aWord+1
                        LDI       _ACCCLO, ADAC.TrigTimer AND 0FFh
                        LDI       _ACCCHI, ADAC.TrigTimer SHRB 8
                        LDI       _ACCBHI, 001h
                        CALL      SYSTEM.SetSysTimer
                        .ENDBLOCK 961
ADAC._L0747:
ADAC._L0748:
                        .ENDBLOCK 962
ADAC._L0742:
ADAC._L0743:
                        .LINE     963
                        LDS       _ACCA, ADAC.Trigger
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0752
                        BRNE      ADAC._L0752
                        .BRANCH   20,ADAC._L0750
                        JMP       ADAC._L0750
ADAC._L0752:
                        .BLOCK    964
                        .LINE     964
                        LDI       _ACCA, 01Eh
                        STS       ADAC.TrigLEDtimer, _ACCA
                        .LINE     965
                        CBI       00032h, 003h
                        .LINE     966
                        LDI       _ACCCLO, ADAC.TrigMaskArray AND 0FFh
                        LDI       _ACCCHI, ADAC.TrigMaskArray SHRB 8
                        CALL      SYSTEM.ReadEEp8
                        STS       ADAC.TRIGMASK, _ACCA
                        .LINE     967
                        LDS       _ACCA, ADAC.TrigMask
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      ADAC._L0753
                        SER       _ACCA
ADAC._L0753:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0756
                        BRNE      ADAC._L0756
                        .BRANCH   20,ADAC._L0754
                        JMP       ADAC._L0754
ADAC._L0756:
                        .BLOCK    967
                        .LINE     968
                        .LOOP
                        LDI       _ACCCLO, ADAC.i AND 0FFh
                        LDI       _ACCCHI, ADAC.i SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 007h
                        ST        Z, _ACCA
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
ADAC._L0759:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0h
                        BREQ      ADAC._L0760
                        BRLO      ADAC._L0760
                        SER       _ACCA
ADAC._L0760:
                        TST       _ACCA
                        .BRANCH   3,ADAC._L0761
                        BREQ      ADAC._L0761
                        .BRANCH   20,ADAC._L0758
                        JMP       ADAC._L0758
ADAC._L0761:
                        .BLOCK    969
                        .LINE     969
                        LDS       _ACCA, ADAC.TrigMask
                        CPI       _ACCA, 07Fh
                        LDI       _ACCA, 0h
                        BREQ      ADAC._L0762
                        BRLO      ADAC._L0762
                        SER       _ACCA
ADAC._L0762:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0765
                        BRNE      ADAC._L0765
                        .BRANCH   20,ADAC._L0763
                        JMP       ADAC._L0763
ADAC._L0765:
                        .BLOCK    969
                        .LINE     970
                        MOV       _ACCA, ADAC.i
                        STS       ADAC.SUBCH, _ACCA
                        .LINE     971
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCA, ADAC.SubCh
                        ST        -Y, _ACCA
                        .FRAME  4
                        .FRAME  3
                        .BRANCH   17,ADAC.GETNEWVALUE
                        CALL       ADAC.GETNEWVALUE
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     972
                        .BRANCH   17,ADAC.WRITEPARAM
                        CALL      ADAC.WRITEPARAM
                        .ENDBLOCK 973
ADAC._L0763:
ADAC._L0764:
                        .LINE     974
                        LDS       _ACCA, ADAC.TrigMask
                        LSL       _ACCA
                        STS       ADAC.TRIGMASK, _ACCA
                        .ENDBLOCK 975
ADAC._L0757:
                        .LINE     975
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        DEC       _ACCA
                        ST        Z, _ACCA
                        CPI       _ACCA, 0FFh
                        .BRANCH   3,ADAC._L0758
                        BREQ      ADAC._L0758
                        .BRANCH   20,ADAC._L0759
                        JMP       ADAC._L0759
ADAC._L0758:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .ENDBLOCK 976
ADAC._L0754:
ADAC._L0755:
                        .LINE     977
                        LDI       _ACCCLO, ADAC.TrigMaskArray AND 0FFh
                        LDI       _ACCCHI, ADAC.TrigMaskArray SHRB 8
                        ADIW      _ACCCLO, 00001h
                        CALL      SYSTEM.ReadEEp8
                        STS       ADAC.TRIGMASK, _ACCA
                        .LINE     978
                        LDS       _ACCA, ADAC.TrigMask
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      ADAC._L0766
                        SER       _ACCA
ADAC._L0766:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0769
                        BRNE      ADAC._L0769
                        .BRANCH   20,ADAC._L0767
                        JMP       ADAC._L0767
ADAC._L0769:
                        .BLOCK    978
                        .LINE     979
                        .LOOP
                        LDI       _ACCCLO, ADAC.i AND 0FFh
                        LDI       _ACCCHI, ADAC.i SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 007h
                        ST        Z, _ACCA
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
ADAC._L0772:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0h
                        BREQ      ADAC._L0773
                        BRLO      ADAC._L0773
                        SER       _ACCA
ADAC._L0773:
                        TST       _ACCA
                        .BRANCH   3,ADAC._L0774
                        BREQ      ADAC._L0774
                        .BRANCH   20,ADAC._L0771
                        JMP       ADAC._L0771
ADAC._L0774:
                        .BLOCK    980
                        .LINE     980
                        LDS       _ACCA, ADAC.TrigMask
                        CPI       _ACCA, 07Fh
                        LDI       _ACCA, 0h
                        BREQ      ADAC._L0775
                        BRLO      ADAC._L0775
                        SER       _ACCA
ADAC._L0775:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0778
                        BRNE      ADAC._L0778
                        .BRANCH   20,ADAC._L0776
                        JMP       ADAC._L0776
ADAC._L0778:
                        .BLOCK    980
                        .LINE     981
                        MOV       _ACCA, ADAC.i
                        SUBI      _ACCA, -00Ah AND 0FFh
                        STS       ADAC.SUBCH, _ACCA
                        .LINE     982
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCA, ADAC.SubCh
                        ST        -Y, _ACCA
                        .FRAME  4
                        .FRAME  3
                        .BRANCH   17,ADAC.GETNEWVALUE
                        CALL       ADAC.GETNEWVALUE
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     983
                        .BRANCH   17,ADAC.WRITEPARAM
                        CALL      ADAC.WRITEPARAM
                        .ENDBLOCK 984
ADAC._L0776:
ADAC._L0777:
                        .LINE     985
                        LDS       _ACCA, ADAC.TrigMask
                        LSL       _ACCA
                        STS       ADAC.TRIGMASK, _ACCA
                        .ENDBLOCK 986
ADAC._L0770:
                        .LINE     986
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        DEC       _ACCA
                        ST        Z, _ACCA
                        CPI       _ACCA, 0FFh
                        .BRANCH   3,ADAC._L0771
                        BREQ      ADAC._L0771
                        .BRANCH   20,ADAC._L0772
                        JMP       ADAC._L0772
ADAC._L0771:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .ENDBLOCK 987
ADAC._L0767:
ADAC._L0768:
                        .LINE     988
                        LDI       _ACCCLO, ADAC.TrigMaskArray AND 0FFh
                        LDI       _ACCCHI, ADAC.TrigMaskArray SHRB 8
                        ADIW      _ACCCLO, 00003h
                        CALL      SYSTEM.ReadEEp8
                        STS       ADAC.TRIGMASK, _ACCA
                        .LINE     989
                        LDS       _ACCA, ADAC.TrigMask
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      ADAC._L0779
                        SER       _ACCA
ADAC._L0779:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0782
                        BRNE      ADAC._L0782
                        .BRANCH   20,ADAC._L0780
                        JMP       ADAC._L0780
ADAC._L0782:
                        .BLOCK    989
                        .LINE     990
                        .LOOP
                        LDI       _ACCCLO, ADAC.i AND 0FFh
                        LDI       _ACCCHI, ADAC.i SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 007h
                        ST        Z, _ACCA
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
ADAC._L0785:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0h
                        BREQ      ADAC._L0786
                        BRLO      ADAC._L0786
                        SER       _ACCA
ADAC._L0786:
                        TST       _ACCA
                        .BRANCH   3,ADAC._L0787
                        BREQ      ADAC._L0787
                        .BRANCH   20,ADAC._L0784
                        JMP       ADAC._L0784
ADAC._L0787:
                        .BLOCK    991
                        .LINE     991
                        LDS       _ACCA, ADAC.TrigMask
                        CPI       _ACCA, 07Fh
                        LDI       _ACCA, 0h
                        BREQ      ADAC._L0788
                        BRLO      ADAC._L0788
                        SER       _ACCA
ADAC._L0788:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0791
                        BRNE      ADAC._L0791
                        .BRANCH   20,ADAC._L0789
                        JMP       ADAC._L0789
ADAC._L0791:
                        .BLOCK    991
                        .LINE     992
                        MOV       _ACCA, ADAC.i
                        SUBI      _ACCA, -01Eh AND 0FFh
                        STS       ADAC.SUBCH, _ACCA
                        .LINE     993
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCA, ADAC.SubCh
                        ST        -Y, _ACCA
                        .FRAME  4
                        .FRAME  3
                        .BRANCH   17,ADAC.GETNEWVALUE
                        CALL       ADAC.GETNEWVALUE
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     994
                        .BRANCH   17,ADAC.WRITEPARAMINT
                        CALL      ADAC.WRITEPARAMINT
                        .ENDBLOCK 995
ADAC._L0789:
ADAC._L0790:
                        .LINE     996
                        LDS       _ACCA, ADAC.TrigMask
                        LSL       _ACCA
                        STS       ADAC.TRIGMASK, _ACCA
                        .ENDBLOCK 997
ADAC._L0783:
                        .LINE     997
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        DEC       _ACCA
                        ST        Z, _ACCA
                        CPI       _ACCA, 0FFh
                        .BRANCH   3,ADAC._L0784
                        BREQ      ADAC._L0784
                        .BRANCH   20,ADAC._L0785
                        JMP       ADAC._L0785
ADAC._L0784:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .ENDBLOCK 998
ADAC._L0780:
ADAC._L0781:
                        .LINE     999
                        LDI       _ACCA, 000h
                        STS       ADAC.TRIGGER, _ACCA
                        .ENDBLOCK 1000
ADAC._L0750:
ADAC._L0751:
                        .LINE     1002
                        SER       _ACCA
                        LDS       _ACCB, ADAC.ActivityTimer
                        TST       _ACCB
                        BREQ      ADAC._L0792
                        COM       _ACCA
ADAC._L0792:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0795
                        BRNE      ADAC._L0795
                        .BRANCH   20,ADAC._L0793
                        JMP       ADAC._L0793
ADAC._L0795:
                        .BLOCK    1002
                        .LINE     1003
                        SBI       00032h, 002h
                        .ENDBLOCK 1004
ADAC._L0793:
ADAC._L0794:
                        .LINE     1006
                        LDS       _ACCA, ADAC.LCDpresent
                        PUSH      _ACCA
                        CALL       SYSTEM.SERSTAT
                        COM       _ACCA
                        POP       _ACCB
                        AND       _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0798
                        BRNE      ADAC._L0798
                        .BRANCH   20,ADAC._L0796
                        JMP       ADAC._L0796
ADAC._L0798:
                        .BLOCK    1006
                        .LINE     1007
                        LDI       _ACCA, 000h
                        .FRAME  0
                        CALL       SYSTEM.GETINCRVAL4
                        STS       ADAC.INCRVALUE, _ACCB
                        STS       ADAC.INCRVALUE+1, _ACCA
                        STS       ADAC.INCRVALUE+2, _ACCALO
                        STS       ADAC.INCRVALUE+3, _ACCAHI
                        .LINE     1009
                        LDS       _ACCB, ADAC.IncrValue
                        LDS       _ACCA, ADAC.IncrValue+1
                        LDS       _ACCALO, ADAC.IncrValue+2
                        LDS       _ACCAHI, ADAC.IncrValue+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, ADAC.OldIncrValue
                        LDS       _ACCA, ADAC.OldIncrValue+1
                        LDS       _ACCALO, ADAC.OldIncrValue+2
                        LDS       _ACCAHI, ADAC.OldIncrValue+3
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
                        BRNE      ADAC._L0799
                        CP        _ACCALO, _ACCCLO
                        BRNE      ADAC._L0799
                        CP        _ACCA, _ACCBHI
                        BRNE      ADAC._L0799
                        CP        _ACCB, _ACCBLO
ADAC._L0799:
                        LDI       _ACCA, 0h
                        BREQ      ADAC._L0800
                        SER       _ACCA
ADAC._L0800:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0803
                        BRNE      ADAC._L0803
                        .BRANCH   20,ADAC._L0801
                        JMP       ADAC._L0801
ADAC._L0803:
                        .BLOCK    1009
                        .LINE     1010
                        LDI       _ACCA, 07Dh
                        STS       ADAC.ActivityTimer, _ACCA
                        .LINE     1011
                        CBI       00032h, 002h
                        .LINE     1012
                        LDS       _ACCB, ADAC.IncrDiff
                        LDS       _ACCA, ADAC.IncrDiff+1
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDS       _ACCB, ADAC.IncrValue
                        LDS       _ACCA, ADAC.IncrValue+1
                        LDS       _ACCALO, ADAC.IncrValue+2
                        LDS       _ACCAHI, ADAC.IncrValue+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, ADAC.OldIncrValue
                        LDS       _ACCA, ADAC.OldIncrValue+1
                        LDS       _ACCALO, ADAC.OldIncrValue+2
                        LDS       _ACCAHI, ADAC.OldIncrValue+3
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
                        STS       ADAC.INCRDIFF, _ACCB
                        STS       ADAC.INCRDIFF+1, _ACCA
                        .LINE     1013
                        LDS       _ACCB, ADAC.IncrValue
                        LDS       _ACCA, ADAC.IncrValue+1
                        LDS       _ACCALO, ADAC.IncrValue+2
                        LDS       _ACCAHI, ADAC.IncrValue+3
                        STS       ADAC.OLDINCRVALUE, _ACCB
                        STS       ADAC.OLDINCRVALUE+1, _ACCA
                        STS       ADAC.OLDINCRVALUE+2, _ACCALO
                        STS       ADAC.OLDINCRVALUE+3, _ACCAHI
                        .LINE     1014
                        LDI       _ACCA, 064h
                        STS       ADAC.IncrTimer, _ACCA
                        .LINE     1015
                        LDS       _ACCB, ADAC.IncrDiff
                        LDS       _ACCA, ADAC.IncrDiff+1
                        TST       _ACCA
                        BRPL      ADAC._L0804
                        NEG       _ACCB
                        BRNE      ADAC._L0805
                        DEC       _ACCA
ADAC._L0805:
                        COM       _ACCA
ADAC._L0804:
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDS       _ACCB, ADAC.IncRast
                        LDS       _ACCA, ADAC.IncRast+1
                        MOVW      _ACCALO, _ACCB
                        POP       _ACCA
                        POP       _ACCB
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        EOR       _ACCAHI, _ACCBLO
                        CP        _ACCA, _ACCAHI
                        BRNE      ADAC._L0806
                        CP        _ACCB, _ACCALO
ADAC._L0806:
                        LDI       _ACCA, 0
                        BRLO      ADAC._L0807
                        LDI       _ACCA, 0FFh
ADAC._L0807:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0810
                        BRNE      ADAC._L0810
                        .BRANCH   20,ADAC._L0808
                        JMP       ADAC._L0808
ADAC._L0810:
                        .BLOCK    1016
                        .LINE     1016
                        LDI       _ACCA, 0FFh
                        STS       ADAC.CHANGEDFLAG, _ACCA
                        .LINE     1017
                        LDS       _ACCB, ADAC.IncrDiff
                        LDS       _ACCA, ADAC.IncrDiff+1
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDS       _ACCB, ADAC.IncRast
                        LDS       _ACCA, ADAC.IncRast+1
                        SET
                        BLD       Flags, _SIGN
                        POP       _ACCBHI
                        POP       _ACCBLO
                        CALL      SYSTEM.DIV16
                        STS       ADAC.INCRDIFF, _ACCB
                        STS       ADAC.INCRDIFF+1, _ACCA
                        .LINE     1018
                        LDS       _ACCB, ADAC.IncrDiff
                        LDS       _ACCA, ADAC.IncrDiff+1
                        MOV       _ACCA, _ACCB
                        STS       ADAC.INCRDIFFBYTE, _ACCA
                        .LINE     1019
                        LDS       _ACCB, ADAC.IncrDiff
                        LDS       _ACCA, ADAC.IncrDiff+1
                        TST       _ACCA
                        BRPL      ADAC._L0811
                        NEG       _ACCB
                        BRNE      ADAC._L0812
                        DEC       _ACCA
ADAC._L0812:
                        COM       _ACCA
ADAC._L0811:
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        CPI       _ACCA, 080h
                        BRNE      ADAC._L0813
                        CPI       _ACCB, 001h
ADAC._L0813:
                        LDI       _ACCA, 0h
                        BREQ      ADAC._L0814
                        BRLO      ADAC._L0814
                        SER       _ACCA
ADAC._L0814:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0817
                        BRNE      ADAC._L0817
                        .BRANCH   20,ADAC._L0815
                        JMP       ADAC._L0815
ADAC._L0817:
                        .BLOCK    1020
                        .LINE     1020
                        LDS       _ACCB, ADAC.IncrDiff
                        LDS       _ACCA, ADAC.IncrDiff+1
                        PUSH      _ACCB
                        PUSH      _ACCA
                        POP       _ACCAHI
                        POP       _ACCALO
                        ADD       _ACCB, _ACCALO
                        ADC       _ACCA, _ACCAHI
                        STS       ADAC.INCRDIFF, _ACCB
                        STS       ADAC.INCRDIFF+1, _ACCA
                        .ENDBLOCK 1021
ADAC._L0815:
ADAC._L0816:
                        .LINE     1022
                        LDS       _ACCB, ADAC.IncrDiff
                        LDS       _ACCA, ADAC.IncrDiff+1
                        TST       _ACCA
                        BRPL      ADAC._L0818
                        NEG       _ACCB
                        BRNE      ADAC._L0819
                        DEC       _ACCA
ADAC._L0819:
                        COM       _ACCA
ADAC._L0818:
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        CPI       _ACCA, 080h
                        BRNE      ADAC._L0820
                        CPI       _ACCB, 002h
ADAC._L0820:
                        LDI       _ACCA, 0h
                        BREQ      ADAC._L0821
                        BRLO      ADAC._L0821
                        SER       _ACCA
ADAC._L0821:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0824
                        BRNE      ADAC._L0824
                        .BRANCH   20,ADAC._L0822
                        JMP       ADAC._L0822
ADAC._L0824:
                        .BLOCK    1023
                        .LINE     1023
                        LDS       _ACCB, ADAC.IncrDiff
                        LDS       _ACCA, ADAC.IncrDiff+1
                        PUSH      _ACCB
                        PUSH      _ACCA
                        POP       _ACCAHI
                        POP       _ACCALO
                        ADD       _ACCB, _ACCALO
                        ADC       _ACCA, _ACCAHI
                        STS       ADAC.INCRDIFF, _ACCB
                        STS       ADAC.INCRDIFF+1, _ACCA
                        .ENDBLOCK 1024
ADAC._L0822:
ADAC._L0823:
                        .LINE     1025
                        LDS       _ACCB, ADAC.IncrDiff
                        LDS       _ACCA, ADAC.IncrDiff+1
                        LDI       _ACCBLO, 0000Ah AND 0FFh
                        LDI       _ACCBHI, 0000Ah SHRB 8
                        SET
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.MUL16
                        STS       ADAC.INCRACCINT10, _ACCB
                        STS       ADAC.INCRACCINT10+1, _ACCA
                        .LINE     1027
                        LDS       _ACCA, ADAC.IncrFine
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0827
                        BRNE      ADAC._L0827
                        .BRANCH   20,ADAC._L0825
                        JMP       ADAC._L0825
ADAC._L0827:
                        .BLOCK    1027
                        .LINE     1028
                        LDS       _ACCB, ADAC.IncrDiff
                        LDS       _ACCA, ADAC.IncrDiff+1
                        SBRS      _ACCA, 7
                        RJMP      ADAC._L0828
                        LDI       _ACCAHI, 0FFh
                        LDI       _ACCALO, 0FFh
                        RJMP      ADAC._L0829
ADAC._L0828:
                        CLR       _ACCAHI
                        CLR       _ACCALO
ADAC._L0829:
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
                        STS       ADAC.INCRACCFLOAT, _ACCB
                        STS       ADAC.INCRACCFLOAT+1, _ACCA
                        STS       ADAC.INCRACCFLOAT+2, _ACCALO
                        STS       ADAC.INCRACCFLOAT+3, _ACCAHI
                        .ENDBLOCK 1029
                        .BRANCH   20,ADAC._L0826
                        JMP       ADAC._L0826
ADAC._L0825:
                        .BLOCK    1029
                        .LINE     1030
                        LDS       _ACCB, ADAC.IncrDiff
                        LDS       _ACCA, ADAC.IncrDiff+1
                        SBRS      _ACCA, 7
                        RJMP      ADAC._L0830
                        LDI       _ACCAHI, 0FFh
                        LDI       _ACCALO, 0FFh
                        RJMP      ADAC._L0831
ADAC._L0830:
                        CLR       _ACCAHI
                        CLR       _ACCALO
ADAC._L0831:
                        SET
                        BLD       Flags, _SIGN
                        CLT
                        BLD       Flags, _ERRFLAG
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
                        STS       ADAC.INCRACCFLOAT, _ACCB
                        STS       ADAC.INCRACCFLOAT+1, _ACCA
                        STS       ADAC.INCRACCFLOAT+2, _ACCALO
                        STS       ADAC.INCRACCFLOAT+3, _ACCAHI
                        .ENDBLOCK 1031
ADAC._L0826:
                        .LINE     1032
                        LDI       _ACCA, 002EEh SHRB 8
                        LDI       _ACCB, 002EEh AND 0FFh
                        LDI       _ACCCLO, ADAC.DisplayTimer AND 0FFh
                        LDI       _ACCCHI, ADAC.DisplayTimer SHRB 8
                        LDI       _ACCBHI, 002h
                        CALL      SYSTEM.SetSysTimer
                        .LINE     1033
                        LDS       _ACCA, ADAC.Modify
                        CPI       _ACCA, 01Bh
                        .BRANCH   3,ADAC._L0832
                        BREQ      ADAC._L0832
                        .BRANCH   1,ADAC._L0833
                        BRSH      ADAC._L0833
                        CPI       _ACCA, 014h
                        .BRANCH   1,ADAC._L0833
                        BRLO      ADAC._L0833
                        LDI       _ACCDLO, 0
                        SEZ
                        .BRANCH   20,ADAC._L0832
                        RJMP      ADAC._L0832
ADAC._L0833:
                        LDI       _ACCDLO, 001h
ADAC._L0832:
                        LDI       _ACCA, 0h
                        BRNE      ADAC._L0834
                        SER       _ACCA
ADAC._L0834:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0837
                        BRNE      ADAC._L0837
                        .BRANCH   20,ADAC._L0835
                        JMP       ADAC._L0835
ADAC._L0837:
                        .BLOCK    1033
                        .LINE     1034
                        LDI       _ACCCLO, ADAC.DACValueArray AND 0FFh
                        LDI       _ACCCHI, ADAC.DACValueArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, ADAC.Modify
                        SUBI      _ACCA, 014h AND 0FFh
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
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, ADAC.IncrAccFloat
                        LDS       _ACCA, ADAC.IncrAccFloat+1
                        LDS       _ACCALO, ADAC.IncrAccFloat+2
                        LDS       _ACCAHI, ADAC.IncrAccFloat+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.AddFloat
                        STS       ADAC.PARAM, _ACCB
                        STS       ADAC.PARAM+1, _ACCA
                        STS       ADAC.PARAM+2, _ACCALO
                        STS       ADAC.PARAM+3, _ACCAHI
                        .LINE     1035
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,ADAC.PARAMROUND1000
                        CALL      ADAC.PARAMROUND1000
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1036
                        LDI       _ACCCLO, ADAC.DACValueArray AND 0FFh
                        LDI       _ACCCHI, ADAC.DACValueArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, ADAC.Modify
                        SUBI      _ACCA, 014h AND 0FFh
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
                        LDS       _ACCB, ADAC.Param
                        LDS       _ACCA, ADAC.Param+1
                        LDS       _ACCALO, ADAC.Param+2
                        LDS       _ACCAHI, ADAC.Param+3
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z+, _ACCB
                        ST        Z+, _ACCA
                        ST        Z+, _ACCALO
                        ST        Z+, _ACCAHI
                        .LINE     1037
                        LDS       _ACCA, ADAC.FirstTurn
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0840
                        BRNE      ADAC._L0840
                        .BRANCH   20,ADAC._L0838
                        JMP       ADAC._L0838
ADAC._L0840:
                        .BLOCK    1037
                        .LINE     1038
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDS       _ACCA, ADAC.Status
                        SUBI      _ACCA, -043h AND 0FFh
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ADAC.SERPROMPT
                        CALL      ADAC.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1039
                        LDI       _ACCA, 000h
                        STS       ADAC.FIRSTTURN, _ACCA
                        .ENDBLOCK 1040
ADAC._L0838:
ADAC._L0839:
                        .LINE     1041
                        LDS       _ACCA, ADAC.Modify
                        STS       ADAC.SUBCH, _ACCA
                        .LINE     1042
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCA, ADAC.SubCh
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,ADAC.SETDAC
                        CALL      ADAC.SETDAC
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1043
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,ADAC.PARSEGETPARAM
                        CALL      ADAC.PARSEGETPARAM
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 1044
ADAC._L0835:
ADAC._L0836:
                        .LINE     1045
                        LDS       _ACCA, ADAC.Modify
                        CPI       _ACCA, 025h
                        .BRANCH   3,ADAC._L0841
                        BREQ      ADAC._L0841
                        .BRANCH   1,ADAC._L0842
                        BRSH      ADAC._L0842
                        CPI       _ACCA, 01Eh
                        .BRANCH   1,ADAC._L0842
                        BRLO      ADAC._L0842
                        LDI       _ACCDLO, 0
                        SEZ
                        .BRANCH   20,ADAC._L0841
                        RJMP      ADAC._L0841
ADAC._L0842:
                        LDI       _ACCDLO, 001h
ADAC._L0841:
                        LDI       _ACCA, 0h
                        BRNE      ADAC._L0843
                        SER       _ACCA
ADAC._L0843:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0846
                        BRNE      ADAC._L0846
                        .BRANCH   20,ADAC._L0844
                        JMP       ADAC._L0844
ADAC._L0846:
                        .BLOCK    1045
                        .LINE     1046
                        LDS       _ACCA, ADAC.Modify
                        STS       ADAC.SUBCH, _ACCA
                        .LINE     1047
                        LDI       _ACCCLO, ADAC.PortArray AND 0FFh
                        LDI       _ACCCHI, ADAC.PortArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, ADAC.SubCh
                        SUBI      _ACCA, 01Eh AND 0FFh
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCA, Z+
                        PUSH      _ACCA
                        LDS       _ACCB, ADAC.IncrDiff
                        LDS       _ACCA, ADAC.IncrDiff+1
                        MOV       _ACCA, _ACCB
                        POP       _ACCB
                        ADD       _ACCA, _ACCB
                        STS       ADAC.PARAMBYTE, _ACCA
                        .LINE     1048
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCA, ADAC.SubCh
                        SUBI      _ACCA, 01Eh AND 0FFh
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDS       _ACCA, ADAC.Parambyte
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ADAC.SETPORT
                        CALL      ADAC.SETPORT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1049
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,ADAC.PARSEGETPARAM
                        CALL      ADAC.PARSEGETPARAM
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 1050
ADAC._L0844:
ADAC._L0845:
                        .LINE     1051
                        LDI       _ACCA, 00000h SHRB 8
                        LDI       _ACCB, 00000h AND 0FFh
                        STS       ADAC.INCRDIFF, _ACCB
                        STS       ADAC.INCRDIFF+1, _ACCA
                        .LINE     1052
                        .BRANCH   17,ADAC.SOLLWERTEONLCD
                        CALL      ADAC.SOLLWERTEONLCD
                        .LINE     1053
                        LDI       _ACCA, 000h
                        STS       ADAC.FIRSTTURN, _ACCA
                        .ENDBLOCK 1054
ADAC._L0808:
ADAC._L0809:
                        .ENDBLOCK 1055
ADAC._L0801:
ADAC._L0802:
                        .LINE     1056
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,ADAC.CHECKDELAY
                        CALL      ADAC.CHECKDELAY
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1057
                        LDI       _ACCA, 000h
                        .FRAME  0
                        CALL       SYSTEM.LCDPORTINP_M
                        ORI       _ACCA, 0C7h
                        STS       ADAC.BUTTONTEMP, _ACCA
                        .LINE     1058
                        LDS       _ACCA, ADAC.ButtonTemp
                        CPI       _ACCA, 0FFh
                        LDI       _ACCA, 0h
                        BREQ      ADAC._L0847
                        SER       _ACCA
ADAC._L0847:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0850
                        BRNE      ADAC._L0850
                        .BRANCH   20,ADAC._L0848
                        JMP       ADAC._L0848
ADAC._L0850:
                        .BLOCK    1058
                        .LINE     1059
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,ADAC.CHECKDELAY
                        CALL      ADAC.CHECKDELAY
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1060
                        LDI       _ACCA, 000h
                        .FRAME  0
                        CALL       SYSTEM.LCDPORTINP_M
                        ORI       _ACCA, 0C7h
                        STS       ADAC.BUTTONTEMP, _ACCA
                        .LINE     1061
                        LDI       _ACCA, 0FFh
                        STS       ADAC.CHANGEDFLAG, _ACCA
                        .LINE     1062
                        LDS       _ACCA, ADAC.ButtonTemp
                        CPI       _ACCA, 0FFh
                        LDI       _ACCA, 0h
                        BREQ      ADAC._L0851
                        SER       _ACCA
ADAC._L0851:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0854
                        BRNE      ADAC._L0854
                        .BRANCH   20,ADAC._L0852
                        JMP       ADAC._L0852
ADAC._L0854:
                        .BLOCK    1062
                        .LINE     1063
                        LDS       _ACCB, 00283h
                        CLR       _ACCA
                        SBRC      _ACCB, 003h
                        SER       _ACCA
                        COM       _ACCA
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0857
                        BRNE      ADAC._L0857
                        .BRANCH   20,ADAC._L0855
                        JMP       ADAC._L0855
ADAC._L0857:
                        .BLOCK    1063
                        .LINE     1064
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDS       _ACCA, ADAC.Status
                        SUBI      _ACCA, -043h AND 0FFh
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ADAC.SERPROMPT
                        CALL      ADAC.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1065
                        LDS       _ACCA, ADAC.IncrFine
                        COM       _ACCA
                        STS       ADAC.INCRFINE, _ACCA
                        .ENDBLOCK 1066
ADAC._L0855:
ADAC._L0856:
                        .LINE     1067
                        LDS       _ACCB, 00283h
                        CLR       _ACCA
                        SBRC      _ACCB, 005h
                        SER       _ACCA
                        COM       _ACCA
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0860
                        BRNE      ADAC._L0860
                        .BRANCH   20,ADAC._L0858
                        JMP       ADAC._L0858
ADAC._L0860:
                        .BLOCK    1067
                        .LINE     1068
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDS       _ACCA, ADAC.Status
                        SUBI      _ACCA, -041h AND 0FFh
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ADAC.SERPROMPT
                        CALL      ADAC.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1069
                        LDS       _ACCA, ADAC.Modify
                        CPI       _ACCA, 00Ah
                        .BRANCH   3,ADAC._L0861
                        BREQ      ADAC._L0861
                        CPI       _ACCA, 014h
                        .BRANCH   3,ADAC._L0861
                        BREQ      ADAC._L0861
                        CPI       _ACCA, 01Eh
                        .BRANCH   3,ADAC._L0861
                        BREQ      ADAC._L0861
ADAC._L0861:
                        LDI       _ACCA, 0h
                        BRNE      ADAC._L0862
                        SER       _ACCA
ADAC._L0862:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0865
                        BRNE      ADAC._L0865
                        .BRANCH   20,ADAC._L0863
                        JMP       ADAC._L0863
ADAC._L0865:
                        .BLOCK    1069
                        .LINE     1070
                        LDS       _ACCA, ADAC.Modify
                        SUBI      _ACCA, 002h AND 0FFh
                        STS       ADAC.MODIFY, _ACCA
                        .ENDBLOCK 1071
ADAC._L0863:
ADAC._L0864:
                        .LINE     1072
                        CLR       _ACCA
                        LDS       _ACCB, ADAC.Modify
                        LDI       _ACCEHI, 000h
                        CP        _ACCEHI, _ACCB
                        BRCC      ADAC._L0866
                        DEC       _ACCB
                        STS       ADAC.Modify, _ACCB
                        SER       _ACCA
ADAC._L0866:
                        .LINE     1073
                        LDI       _ACCA, 050h
                        STS       ADAC.SUBCH, _ACCA
                        .LINE     1074
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,ADAC.PARSEGETPARAM
                        CALL      ADAC.PARSEGETPARAM
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 1075
ADAC._L0858:
ADAC._L0859:
                        .LINE     1076
                        LDS       _ACCB, 00283h
                        CLR       _ACCA
                        SBRC      _ACCB, 004h
                        SER       _ACCA
                        COM       _ACCA
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0869
                        BRNE      ADAC._L0869
                        .BRANCH   20,ADAC._L0867
                        JMP       ADAC._L0867
ADAC._L0869:
                        .BLOCK    1076
                        .LINE     1077
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDS       _ACCA, ADAC.Status
                        SUBI      _ACCA, -042h AND 0FFh
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ADAC.SERPROMPT
                        CALL      ADAC.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1078
                        LDS       _ACCA, ADAC.Modify
                        CPI       _ACCA, 007h
                        .BRANCH   3,ADAC._L0870
                        BREQ      ADAC._L0870
                        CPI       _ACCA, 011h
                        .BRANCH   3,ADAC._L0870
                        BREQ      ADAC._L0870
                        CPI       _ACCA, 01Bh
                        .BRANCH   3,ADAC._L0870
                        BREQ      ADAC._L0870
ADAC._L0870:
                        LDI       _ACCA, 0h
                        BRNE      ADAC._L0871
                        SER       _ACCA
ADAC._L0871:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0874
                        BRNE      ADAC._L0874
                        .BRANCH   20,ADAC._L0872
                        JMP       ADAC._L0872
ADAC._L0874:
                        .BLOCK    1078
                        .LINE     1079
                        LDS       _ACCA, ADAC.Modify
                        SUBI      _ACCA, -002h AND 0FFh
                        STS       ADAC.MODIFY, _ACCA
                        .ENDBLOCK 1080
ADAC._L0872:
ADAC._L0873:
                        .LINE     1081
                        CLR       _ACCA
                        LDS       _ACCB, ADAC.Modify
                        LDI       _ACCEHI, 025h
                        CP        _ACCB, _ACCEHI
                        BRCC      ADAC._L0875
                        INC       _ACCB
                        STS       ADAC.Modify, _ACCB
                        SER       _ACCA
ADAC._L0875:
                        .LINE     1082
                        LDI       _ACCA, 050h
                        STS       ADAC.SUBCH, _ACCA
                        .LINE     1083
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,ADAC.PARSEGETPARAM
                        CALL      ADAC.PARSEGETPARAM
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 1084
ADAC._L0867:
ADAC._L0868:
                        .LINE     1085
                        LDI       _ACCA, 002EEh SHRB 8
                        LDI       _ACCB, 002EEh AND 0FFh
                        LDI       _ACCCLO, ADAC.DisplayTimer AND 0FFh
                        LDI       _ACCCHI, ADAC.DisplayTimer SHRB 8
                        LDI       _ACCBHI, 002h
                        CALL      SYSTEM.SetSysTimer
                        .LINE     1086
                        .BRANCH   17,ADAC.SOLLWERTEONLCD
                        CALL      ADAC.SOLLWERTEONLCD
ADAC._L0876:
                        .BLOCK    1087
                        .LINE     1088
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,ADAC.CHECKDELAY
                        CALL      ADAC.CHECKDELAY
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1089
                        LDI       _ACCA, 000h
                        .FRAME  0
                        CALL       SYSTEM.LCDPORTINP_M
                        ORI       _ACCA, 0C7h
                        STS       ADAC.BUTTONTEMP, _ACCA
                        .LINE     1090
                        LDS       _ACCA, ADAC.Autorepeat
                        INC       _ACCA
                        STS       ADAC.Autorepeat, _ACCA
                        .ENDBLOCK 1091
                        .LINE     1091
ADAC._L0877:
                        LDS       _ACCA, ADAC.ButtonTemp
                        CPI       _ACCA, 0FFh
                        LDI       _ACCA, 0h
                        BRNE      ADAC._L0879
                        SER       _ACCA
ADAC._L0879:
                        PUSH      _ACCA
                        LDS       _ACCA, ADAC.AutoRepeat
                        CPI       _ACCA, 014h
                        LDI       _ACCA, 0h
                        BREQ      ADAC._L0880
                        BRLO      ADAC._L0880
                        SER       _ACCA
ADAC._L0880:
                        POP       _ACCB
                        OR        _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0881
                        BRNE      ADAC._L0881
                        .BRANCH   20,ADAC._L0876
                        JMP       ADAC._L0876
ADAC._L0881:
ADAC._L0878:
                        .LINE     1092
                        LDS       _ACCA, ADAC.ButtonTemp
                        CPI       _ACCA, 0FFh
                        LDI       _ACCA, 0h
                        BRNE      ADAC._L0882
                        SER       _ACCA
ADAC._L0882:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0885
                        BRNE      ADAC._L0885
                        .BRANCH   20,ADAC._L0883
                        JMP       ADAC._L0883
ADAC._L0885:
                        .BLOCK    1092
                        .LINE     1093
                        LDI       _ACCA, 000h
                        STS       ADAC.AUTOREPEAT, _ACCA
                        .ENDBLOCK 1094
                        .BRANCH   20,ADAC._L0884
                        JMP       ADAC._L0884
ADAC._L0883:
                        .BLOCK    1094
                        .LINE     1095
                        LDI       _ACCA, 011h
                        STS       ADAC.AUTOREPEAT, _ACCA
                        .ENDBLOCK 1096
ADAC._L0884:
                        .LINE     1097
                        LDI       _ACCA, 000h
                        STS       ADAC.FIRSTTURN, _ACCA
                        .ENDBLOCK 1098
ADAC._L0852:
ADAC._L0853:
                        .ENDBLOCK 1099
ADAC._L0848:
ADAC._L0849:
                        .ENDBLOCK 1100
ADAC._L0796:
ADAC._L0797:
                        .LINE     1101
                        SER       _ACCA
                        LDS       _ACCB, ADAC.IncrTimer
                        TST       _ACCB
                        BREQ      ADAC._L0886
                        COM       _ACCA
ADAC._L0886:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0889
                        BRNE      ADAC._L0889
                        .BRANCH   20,ADAC._L0887
                        JMP       ADAC._L0887
ADAC._L0889:
                        .BLOCK    1101
                        .LINE     1102
                        LDI       _ACCA, 064h
                        STS       ADAC.IncrTimer, _ACCA
                        .LINE     1103
                        LDS       _ACCA, ADAC.FirstTurn
                        COM       _ACCA
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0892
                        BRNE      ADAC._L0892
                        .BRANCH   20,ADAC._L0890
                        JMP       ADAC._L0890
ADAC._L0892:
                        .BLOCK    1103
                        .LINE     1104
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDS       _ACCA, ADAC.Status
                        SUBI      _ACCA, -040h AND 0FFh
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ADAC.SERPROMPT
                        CALL      ADAC.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 1105
ADAC._L0890:
ADAC._L0891:
                        .LINE     1106
                        LDI       _ACCA, 0FFh
                        STS       ADAC.FIRSTTURN, _ACCA
                        .ENDBLOCK 1107
ADAC._L0887:
ADAC._L0888:
                        .LINE     1109
                        SER       _ACCA
                        LDS       _ACCB, ADAC.TrigLEDtimer
                        TST       _ACCB
                        BREQ      ADAC._L0893
                        COM       _ACCA
ADAC._L0893:
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0896
                        BRNE      ADAC._L0896
                        .BRANCH   20,ADAC._L0894
                        JMP       ADAC._L0894
ADAC._L0896:
                        .BLOCK    1109
                        .LINE     1110
                        SBI       00032h, 003h
                        .ENDBLOCK 1111
ADAC._L0894:
ADAC._L0895:
                        .LINE     1112
                        CLR       _ACCA
                        MOV       _ACCB, _SYSTFLAGS
                        ANDI      _ACCB, 002h
                        BRNE      ADAC._L0897
                        COM       _ACCA
ADAC._L0897:
                        PUSH      _ACCA
                        LDS       _ACCA, ADAC.LCDpresent
                        POP       _ACCB
                        AND       _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   4,ADAC._L0900
                        BRNE      ADAC._L0900
                        .BRANCH   20,ADAC._L0898
                        JMP       ADAC._L0898
ADAC._L0900:
                        .BLOCK    1112
                        .LINE     1113
                        LDI       _ACCA, 0007Dh SHRB 8
                        LDI       _ACCB, 0007Dh AND 0FFh
                        LDI       _ACCCLO, ADAC.DisplayTimer AND 0FFh
                        LDI       _ACCCHI, ADAC.DisplayTimer SHRB 8
                        LDI       _ACCBHI, 002h
                        CALL      SYSTEM.SetSysTimer
                        .LINE     1115
                        LDI       _ACCA, 000h
                        STS       ADAC.INCRFINE, _ACCA
                        .LINE     1116
                        LDS       _ACCA, 0039Ah
                        CBR       _ACCA, 080h
                        STS       0039Ah, _ACCA
                        .LINE     1117
                        .BRANCH   17,ADAC.SOLLWERTEONLCD
                        CALL      ADAC.SOLLWERTEONLCD
                        .LINE     1118
                        LDI       _ACCA, 000h
                        STS       ADAC.CHANGEDFLAG, _ACCA
                        .ENDBLOCK 1120
ADAC._L0898:
ADAC._L0899:
                        .ENDBLOCK 1121
                        .LINE     1121
                        .BRANCH   20,ADAC._L0739
                        JMP       ADAC._L0739
ADAC._L0740:
                        .ENDBLOCK 1122

ADAC.$_MAINEX:
                        .LINE     1122
                        NOP
                        .LINE     1122
                        .BRANCH   20,ADAC.$_MAINEX
                        RJMP      ADAC.$_MAINEX


                        .ENDFUNC  1122

SYSTEM.$Main_stk        .EQU    0039Eh          ; var iData  Process stack area
SYSTEM.$Main_stk_e      .EQU    0041Dh          ; var iData  Process stack area
SYSTEM.$Main_reg        .EQU    0041Eh          ; var iData  Process register area
SYSTEM.$Main_reg_e      .EQU    00430h          ; var iData  Process register area
SYSTEM.$Main_Frame      .EQU    00431h          ; var iData  Process stack area
SYSTEM.$Main_Frame_e    .EQU    00530h          ; var iData  Process stack area

                        ; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                        ; Initialisation and Library Routines
                        ; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

                        .ENTRY
SYSTEM.RESET:
                        CLI
                        ; >> Stack Init [main process only] <<
                        LDI       _ACCA, 004h
                        LDI       _ACCB, 01Dh
                        OUT       sph, _ACCA
                        OUT       spl, _ACCB


                        ; >> Memory Init <<
                        CLR       _ACCA
                        LDI       _ACCCLO, 16
                        LDI       _ACCCHI, 0
                        LDI       _ACCBLO, 0
                        LDI       _ACCBHI, 0
                        ADIW      _ACCCLO, 1
SYSTEM._L0901:
                        SBIW      _ACCCLO, 001h
                        BREQ      SYSTEM._L0903
SYSTEM._L0902:
                        ST        X+, _ACCA
                        RJMP      SYSTEM._L0901
SYSTEM._L0903:
                        LDI       _ACCBLO, 00060h AND 0FFh
                        LDI       _ACCBHI, 00060h SHRB 8
                        LDI       _ACCCLO, 00800h AND 0FFh
                        LDI       _ACCCHI, 00800h SHRB 8
                        ADIW      _ACCCLO, 1
SYSTEM._L0904:
                        SBIW      _ACCCLO, 001h
                        BREQ      SYSTEM._L0906
SYSTEM._L0905:
                        ST        X+, _ACCA
                        RJMP      SYSTEM._L0904
SYSTEM._L0906:
                        LDI       _FRAMEPTR, 00530h AND 0FFh
                        LDI       _FPTRHI, 00530h SHRB 8

                        CLI
                        LDI       _ACCA, 0FEH ROLB IntFlag
                        AND       Flags, _ACCA

                        ; ============ init structured constants ============
                        ; >> Hardware Init <<

                        ; >> SysTick init: 2msec <<
                        ; >> real SysTick (exact): 2.000 msec <<
                        LDI       _ACCA, 083h
                        STS       SysTickTime, _ACCA
                        OUT       tcnt0, _ACCA
                        LDI       _ACCA, 4
                        OUT       tccr0, _ACCA
                        LDI       _ACCA, 001h
                        OUT       timsk, _ACCA

                        ; >> ADC Init <<
                        CLR       _ACCA
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
                        JMP       ADAC.$_Main

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
                        CALL      ADAC.onSysTick
                        IN        _ACCB, adcl
                        IN        _ACCA, adch
                        PUSH      _ACCA
                        IN        _ACCCLO, admux
                        ANDI      _ACCCLO, 7
                        PUSH      _ACCCLO
                        LDS       _ACCCHI, _ADCBUFF+010h
                        ANDI      _ACCCHI, 1
                        BRNE      SYSTEM._L0909
                        INC       _ACCCLO
                        CPI       _ACCCLO, 008h
                        BRLO      SYSTEM._L0907
                        CLR       _ACCCLO
SYSTEM._L0907:
                        IN        _ACCCHI, admux
                        CBR       _ACCCHI, 7
                        OR        _ACCCLO, _ACCCHI
                        OUT       admux, _ACCCLO
SYSTEM._L0909:
                        POP       _ACCA
                        LSL       _ACCA
                        LDI       _ACCCLO, _ADCBUFF AND 0FFh
                        LDI       _ACCCHI, _ADCBUFF SHRB 8
                        ADD       _ACCCLO, _ACCA
                        BRCC      SYSTEM._L0908
                        INC       _ACCCHI
SYSTEM._L0908:
                        POP       _ACCA
                        ST        Z, _ACCB
                        STD       Z+1, _ACCA
                        ;
                        LDS       _ACCB, _TWI_TO
                        TST       _ACCB
                        BREQ      SYSTEM._L0910
                        DEC       _ACCB
                        STS       _TWI_TO, _ACCB
SYSTEM._L0910:
                        LDS       _ACCA, _RXTIMEOUT
                        TST       _ACCA
                        BREQ      SYSTEM._L0911
                        DEC       _ACCA
                        STS       _RXTIMEOUT, _ACCA
SYSTEM._L0911:
                        LDS       _ACCCLO, ADAC.TrigTimer
                        LDS       _ACCCHI, ADAC.TrigTimer+1
                        TST       _ACCCHI
                        BRNE      SYSTEM._L0912
                        TST       _ACCCLO
                        BREQ      SYSTEM._L0913
SYSTEM._L0912:
                        SBIW      _ACCCLO, 1
                        STS       ADAC.TrigTimer, _ACCCLO
                        STS       ADAC.TrigTimer+1, _ACCCHI
                        RJMP      SYSTEM._L0914
SYSTEM._L0913:
                        MOV       _ACCA, _SYSTFLAGS
                        ANDI      _ACCA, 0FEh
                        MOV       _SYSTFLAGS, _ACCA
SYSTEM._L0914:
                        LDS       _ACCCLO, ADAC.DisplayTimer
                        LDS       _ACCCHI, ADAC.DisplayTimer+1
                        TST       _ACCCHI
                        BRNE      SYSTEM._L0915
                        TST       _ACCCLO
                        BREQ      SYSTEM._L0916
SYSTEM._L0915:
                        SBIW      _ACCCLO, 1
                        STS       ADAC.DisplayTimer, _ACCCLO
                        STS       ADAC.DisplayTimer+1, _ACCCHI
                        RJMP      SYSTEM._L0917
SYSTEM._L0916:
                        MOV       _ACCA, _SYSTFLAGS
                        ANDI      _ACCA, 0FDh
                        MOV       _SYSTFLAGS, _ACCA
SYSTEM._L0917:
                        LDS       _ACCA, ADAC.IncrTimer
                        TST       _ACCA
                        BREQ      SYSTEM._L0918
                        SUBI      _ACCA, 1
                        STS       ADAC.IncrTimer, _ACCA
SYSTEM._L0918:
                        LDS       _ACCA, ADAC.ActivityTimer
                        TST       _ACCA
                        BREQ      SYSTEM._L0919
                        SUBI      _ACCA, 1
                        STS       ADAC.ActivityTimer, _ACCA
SYSTEM._L0919:
                        LDS       _ACCA, ADAC.TrigLEDtimer
                        TST       _ACCA
                        BREQ      SYSTEM._L0920
                        SUBI      _ACCA, 1
                        STS       ADAC.TrigLEDtimer, _ACCA
SYSTEM._L0920:
                        LDI       _ACCA, 1 SHLB IntFlag
                        OR        Flags, _ACCA
                        SBI       adcsr, 6
                        ;
                        CALL      SYSTEM.RestoreAllRegs
                        POP       $_SaveRet
                        OUT       SREG, $_SaveRet
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
                        BRNE      SYSTEM._L0921
SYSTEM._L0925:
                        CBI       ucr1, 5
                        RJMP      SYSTEM._L0923
SYSTEM._L0921:
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
                        BRNE      SYSTEM._L0924
                        CBI       ucr1, 5
SYSTEM._L0924:
                        INC       _ACCB
                        CPI       _ACCB, 255
                        BRNE      SYSTEM._L0922
                        CLR       _ACCB
SYSTEM._L0922:
                        STS       _TXOUTP, _ACCB
SYSTEM._L0923:
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
SYSTEM._L0931:
                        LDS       _ACCA, _RXCOUNT
                        CPI       _ACCA, 255
                        BRNE      SYSTEM._L0926
                        IN        _ACCB, UDR1
                        RJMP      SYSTEM._L0928
SYSTEM._L0926:
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
                        BRNE      SYSTEM._L0927
                        CLR       _ACCB
SYSTEM._L0927:
                        STS       _RXINP, _ACCB
                        SBIC      usr1, 7
                        RJMP      SYSTEM._L0931
SYSTEM._L0928:
SYSTEM._L0933:
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
                        RJMP      SYSTEM._L0939

SYSTEM._L0934:
                        MOV       _ACCB, _ACCA
                        LSR       _ACCA
                        LSR       _ACCA
                        ANDI      _ACCB, 3
                        BREQ      SYSTEM._L0935
                        CPI       _ACCB, 3
                        BRNE      SYSTEM._L0936
SYSTEM._L0935:
                        ADIW      _ACCCLO, 4
                        RET
SYSTEM._L0936:
                        LDD       _ACCALO, Z+0
                        LDD       _ACCAHI, Z+1
                        LDD       _ACCDLO, Z+2
                        LDD       _ACCDHI, Z+3
                        CPI       _ACCB, 1
                        BREQ      SYSTEM._L0937
                        SUBI      _ACCALO, 0FFh
                        SBCI      _ACCAHI, 0FFh
                        SBCI      _ACCDLO, 0FFh
                        SBCI      _ACCDHI, 0FFh
                        RJMP      SYSTEM._L0938
SYSTEM._L0937:
                        SUBI      _ACCALO, 1
                        SBCI      _ACCAHI, 0
                        SBCI      _ACCDLO, 0
                        SBCI      _ACCDHI, 0
SYSTEM._L0938:
                        ST        Z+, _ACCALO
                        ST        Z+, _ACCAHI
                        ST        Z+, _ACCDLO
                        ST        Z+, _ACCDHI
                        RET

SYSTEM._L0939:
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
                        BREQ      SYSTEM._L0940
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
                        RCALL     SYSTEM._L0934
SYSTEM._L0940:
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

SYSTEM.$INTERRUPT_INT2:
                        CALL      SYSTEM.SaveAllRegs
                        CALL      ADAC.INTERRUPT_Int2
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
                        BREQ       SYSTEM._L0941
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
                        RJMP      SYSTEM._L0942
SYSTEM._L0941:
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
SYSTEM._L0942:
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
                        BREQ       SYSTEM._L0943
                        LDS       _ACCDLO, _LCDM_PORT
                        ORI       _ACCDLO, 20h
                        LDI       _ACCBLO, 00000h AND 0FFh
                        LDI       _ACCBHI, 00000h SHRB 8
                        LDI       _ACCAHI, 000h
                        LDI       _ACCDHI, 000h
                        CALL      SYSTEM.TWIout
SYSTEM._L0943:
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
SYSTEM._L0944:
                        RCALL     SYSTEM._LCDM_Busy_Rd
                        TST       _ACCA
                        BRPL       SYSTEM._L0945
                        SBIW      _ACCCLO, 1
                        BRNE      SYSTEM._L0944
                        CLR       _ACCB
                        CLR       _ACCA
                        RET
SYSTEM._L0945:
                        MOV       _ACCB, _ACCA
                        SER       _ACCA
                        RET

SYSTEM._LCDM_Ctrl_Wr:
                        PUSH      _ACCA
                        RCALL     SYSTEM._LCDWAIT_M
                        TST       _ACCA
                        BRNE      SYSTEM._L0946
                        POP       _ACCB
                        RET
SYSTEM._L0946:
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
                        BRNE       SYSTEM._L0947
                        RET
SYSTEM._L0947:
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
                        RJMP      SYSTEM._L0948
SYSTEM.LCDCURSOR_M:
                        LDD       _ACCA, Y+002h
                        STS       _LCDM_PORT, _ACCA
                        LDD       _ACCA, Y+000h
                        LDD       _ACCB, Y+001h
SYSTEM._L0948:
                        TST       _ACCA
                        BRNE       SYSTEM._L0949
                        LDI       _ACCA, 0Ch
                        RJMP      SYSTEM._L0950

SYSTEM._L0949:
                        LDI       _ACCA, 0Dh
SYSTEM._L0950:
                        TST       _ACCB
                        BREQ       SYSTEM._L0951
                        ORI       _ACCA, 2
SYSTEM._L0951:
                        RJMP      SYSTEM._LCDM_Ctrl_Wr

SYSTEM.LCDXY_M:
                        LDD       _ACCA, Y+002h
                        STS       _LCDM_PORT, _ACCA
                        LDD       _ACCA, Y+000h
                        LDD       _ACCB, Y+001h
                        CPI       _ACCA, 0
                        BRNE       SYSTEM._L0952
                        LDI       _ACCA, 080h
                        RJMP      SYSTEM._L0956

SYSTEM._L0952:
                        CPI       _ACCA, 1
                        BRNE       SYSTEM._L0953
                        LDI       _ACCA, 0C0h
                        RJMP      SYSTEM._L0956

SYSTEM._L0953:
                        CPI       _ACCA, 2
                        BRNE       SYSTEM._L0954
                        LDI       _ACCA, 088h
                        RJMP      SYSTEM._L0956

SYSTEM._L0954:
                        CPI       _ACCA, 3
                        BRNE       SYSTEM._L0955
                        LDI       _ACCA, 0C8h
                        RJMP      SYSTEM._L0956

SYSTEM._L0955:
                        LDI       _ACCA, 080h
SYSTEM._L0956:
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
SYSTEM._L0957:
                        PUSH      _ACCB
                        LDI       _ACCA, 20h
                        RCALL     SYSTEM._LCDM_Data_Wr
                        POP       _ACCB
                        DEC       _ACCB
                        BRNE       SYSTEM._L0957
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

SYSTEM.I2CexpStat:
                        CALL      SYSTEM.TWIstat
                        .DEB      I2CExpStat
                        RET

SYSTEM.I2CEXPOUT:
                        LDI       _ACCBLO, 00001h AND 0FFh
                        LDI       _ACCBHI, 00001h SHRB 8
                        LDI       _ACCCLO, _ACCELO AND 0FFh
                        LDI       _ACCCHI, _ACCELO SHRB 8
                        MOV       _ACCELO, _ACCA
                        .DEB      I2CExpOutW
                        LDI       _ACCDHI, 000h
                        CALL      SYSTEM.TWIout
                        RET

SYSTEM.I2CEXPINP:
                        PUSH      _ACCDLO
                        LDI       _ACCBLO, 00000h AND 0FFh
                        LDI       _ACCBHI, 00000h SHRB 8
                        .DEB      I2CExpOutR
                        LDI       _ACCDHI, 000h
                        CALL      SYSTEM.TWIout
                        POP       _ACCDLO
                        LDI       _ACCBLO, 00001h AND 0FFh
                        LDI       _ACCBHI, 00001h SHRB 8
                        LDI       _ACCCLO, _ACCELO AND 0FFh
                        LDI       _ACCCHI, _ACCELO SHRB 8
                        .DEB      I2CExpInp1
                        CALL      SYSTEM.TWIinp
                        .DEB      I2CExpInp2
                        MOV       _ACCA, _ACCELO
                        RET

SYSTEM.TWISTARTB:
                        LDI       _ACCA, 0
                        STS       TWI_DevLock, _ACCA
                        IN        _ACCA, TWSR
                        ANDI      _ACCA, 0FCh
                        CPI       _ACCA, 000h
                        BRNE      SYSTEM._L0969
                        LDI       _ACCA, 090h
                        OUT       TWCR, _ACCA
SYSTEM._L0969:
                        LDI       _ACCA, 0A4h
                        OUT       TWCR, _ACCA
                        LDI       _ACCA, 50
                        STS       _TWI_TO, _ACCA
SYSTEM._L0967:
                        IN        _ACCA, TWCR
                        ANDI      _ACCA, 080h
                        BRNE      SYSTEM._L0970
                        LDS       _ACCA, _TWI_TO
                        TST       _ACCA
                        BRNE      SYSTEM._L0967
                        OUT       TWCR, _ACCA
                        RJMP      SYSTEM.TWI_ERROR
SYSTEM._L0970:
                        IN        _ACCA, TWSR
                        ANDI      _ACCA, 0FCh
                        CPI       _ACCA, 008h
                        BRNE      SYSTEM._L0974
                        RJMP      SYSTEM.TWI_ERROR
SYSTEM._L0974:
                        RJMP      SYSTEM.TWI_OK

SYSTEM.TWISTOPB:
SYSTEM._L0975:
                        IN        _ACCA, TWSR
                        ANDI      _ACCA, 0FCh
                        CPI       _ACCA, 0F8h
                        BREQ      SYSTEM._L0975
                        CPI       _ACCA, 000h
                        BRNE      SYSTEM._L0976
                        LDI       _ACCA, 090h
                        OUT       TWCR, _ACCA
                        NOP
SYSTEM._L0976:
                        LDI       _ACCB, 094h
                        OUT       TWCR, _ACCB
                        SER       _ACCA
                        STS       TWI_DevLock, _ACCA
                        RET

SYSTEM.TWISENDBYTE:
                        OUT       TWDR, _ACCDLO
                        LDI       _ACCA, 084h
                        OUT       TWCR, _ACCA
                        LDI       _ACCA, 50
                        STS       _TWI_TO, _ACCA
SYSTEM._L0978:
                        IN        _ACCA, TWCR
                        ANDI      _ACCA, 080h
                        BRNE      SYSTEM._L0979
                        LDS       _ACCA, _TWI_TO
                        TST       _ACCA
                        BRNE      SYSTEM._L0978
                        RJMP      SYSTEM.TWI_ERROR
SYSTEM._L0979:
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
                        BRNE      SYSTEM._L0980
                        LDI       _ACCA, 084h
SYSTEM._L0980:
                        OUT       TWCR, _ACCA
SYSTEM._L0981:
                        IN        _ACCA, TWCR
                        SBRS      _ACCA, 7
                        RJMP      SYSTEM._L0981
                        IN        _ACCA, TWSR
                        ANDI      _ACCA, 0FCh
                        CPI       _ACCA, 058h
                        BREQ      SYSTEM._L0983
                        CPI       _ACCA, 050h
                        BRNE      SYSTEM.TWI_ERROR
SYSTEM._L0983:
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
                        BRNE      SYSTEM._L0982
                        LDI       _ACCA, 090h
                        OUT       TWCR, _ACCA
SYSTEM._L0982:
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
                        BREQ      SYSTEM._L0985
                        RCALL     SYSTEM.TWIRECVBYTE
                        TST       _ACCA
                        BREQ      SYSTEM._L0985
                        RJMP      SYSTEM.TWI_OK
SYSTEM._L0985:
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
                        BREQ      SYSTEM._L0991
SYSTEM._L0986:
                        MOV       _ACCDLO, _ACCAHI
                        RCALL     SYSTEM.TWISENDBYTE
                        TST       _ACCA
                        BREQ      SYSTEM._L0991
                        BST       Flags, _I2C2BYTE
                        BRTC      SYSTEM._L0990
                        MOV       _ACCDLO, _ACCALO
SYSTEM._L0988:
                        RCALL     SYSTEM.TWISENDBYTE
                        TST       _ACCA
                        BREQ      SYSTEM._L0991
SYSTEM._L0990:
                        TST       _ACCBLO
                        BRNE       SYSTEM._L0995
                        TST       _ACCBHI
                        BREQ       SYSTEM._L0989
SYSTEM._L0995:
                        TST       _ACCDHI
                        BRNE      SYSTEM._L0992
                        LD        _ACCDLO, Z+
                        RJMP      SYSTEM._L0994
SYSTEM._L0992:
                        CPI       _ACCDHI, 1
                        BRNE      SYSTEM._L0993
                        LPM       _ACCDLO, Z+
                        RJMP      SYSTEM._L0994
SYSTEM._L0993:
                        CALL      SYSTEM.ReadEEp8D
                        ADIW      _ACCCLO, 01h
SYSTEM._L0994:
                        SBIW      _ACCBLO, 1
                        RJMP      SYSTEM._L0988
SYSTEM._L0989:
                        RCALL     SYSTEM.TWISTOPB
                        RJMP      SYSTEM.TWI_OK
SYSTEM._L0991:
                        RCALL     SYSTEM.TWI_ERROR
                        SER       _ACCB
                        STS       TWI_DevLock, _ACCB
                        CLR       _ACCA
                        RET

SYSTEM.SERINP_TO:
                        LDD       _ACCA, Y+000h
                        STS       _RXTIMEOUT, _ACCA
SYSTEM._L0996:
                        RCALL     SYSTEM.SERSTAT
                        TST       _ACCA
                        BRNE      SYSTEM._L0997
                        LDS       _ACCA, _RXTIMEOUT
                        TST       _ACCA
                        BRNE      SYSTEM._L0996
                        RET
SYSTEM._L0997:
                        RCALL     SYSTEM.SERINP
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        ST        Z+, _ACCA
                        STD       Y+002h, _ACCCHI
                        STD       Y+001h, _ACCCLO
                        SER       _ACCA
                        RET

SYSTEM.SERINP:
SYSTEM._L0998:
                        LDS       _ACCA, _RXCOUNT
                        TST       _ACCA
                        BREQ      SYSTEM._L0998
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
                        BRNE      SYSTEM._L0999
                        CLR       _ACCB
SYSTEM._L0999:
                        STS       _RXOUTP, _ACCB
                        RET

SYSTEM.SERSTAT:
                        CLR       _ACCA
                        LDS       _ACCB, _RXCOUNT
                        TST       _ACCB
                        BREQ      SYSTEM._L1004
                        COM       _ACCA
SYSTEM._L1004:
                        RET

SYSTEM.SEROUT:
SYSTEM._L1008:
                        LDS       _ACCB, _TXCOUNT
                        CPI       _ACCB, 255
                        BREQ      SYSTEM._L1008
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
                        BRNE      SYSTEM._L1009
                        CLR       _ACCB
SYSTEM._L1009:
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
                        BRCS      SYSTEM._L1013
                        LDI       _ACCB, 0
                        LDI       _ACCA, 0
                        LDI       _ACCALO, 0
                        LDI       _ACCAHI, 0
                        RET
SYSTEM._L1013:
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
                        BRCS      SYSTEM._L1014
                        RET
SYSTEM._L1014:
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

SYSTEM.BlockCopyC:
SYSTEM._L1017:
                        SUBI      _ACCALO, 001h
                        SBCI      _ACCAHI, 000h
                        BRCS      SYSTEM._L1018
                        LD        _ACCA, Z+
                        ST        X+, _ACCA
                        RJMP      SYSTEM._L1017
SYSTEM._L1018:
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
                        BREQ      SYSTEM._L1019
                        OUT       eedr, _ACCA
                        SBI       eecr, 2
                        SBI       eecr, 1
SYSTEM._L1019:
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
                        BREQ      SYSTEM._L1020
SYSTEM._L1020:
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
                        BREQ      SYSTEM._L1021
                        LSR       _ACCFLO
                        BRNE      SYSTEM._L1023
                        PUSH      _ACCA
                        CALL      SYSTEM.ReadEEp8
                        MOV       _ACCAHI, _ACCA
                        POP       _ACCA
                        ADIW      _ACCCLO, 01h
                        RJMP      SYSTEM._L1022
SYSTEM._L1023:
                        LPM       _ACCAHI, Z+
                        RJMP      SYSTEM._L1022
SYSTEM._L1021:
                        LD        _ACCAHI, Z+
SYSTEM._L1022:
                        TST       _ACCAHI
                        BREQ      SYSTEM._L1030
                        MOV       _ACCFLO, _ACCFHI
                        ANDI      _ACCFLO, 10h
                        BREQ      SYSTEM._L1025
SYSTEM._L1025:
                        LD        _ACCALO, X
SYSTEM._L1027:
                        CP        _ACCB, _ACCA
                        BRCC      SYSTEM._L1029
SYSTEM._L1030:
                        RET
SYSTEM._L1029:
                        MOV       _ACCDLO, _ACCB
                        SUB       _ACCDLO, _ACCA
                        MOV       _ACCDHI, _ACCDLO
                        SUB       _ACCDLO, _ACCAHI
                        BRCS      SYSTEM._L1035
                        CP        _ACCALO, _ACCA
                        BRCC      SYSTEM._L1032
                        MOV       _ACCELO, _ACCAHI
                        ADD       _ACCELO, _ACCALO
                        CP        _ACCB, _ACCELO
                        BRCS      SYSTEM._L1031
                        MOV       _ACCB, _ACCELO
SYSTEM._L1031:
                        RJMP      SYSTEM._L1035
SYSTEM._L1032:
                        PUSH      _ACCBLO
                        PUSH      _ACCBHI
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        MOV       _ACCDHI, _ACCALO
                        SUB       _ACCDHI, _ACCA
                        CP        _ACCDHI, _ACCDLO
                        BRCC      SYSTEM._L1033
                        MOV       _ACCDLO, _ACCDHI
SYSTEM._L1033:
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
                        BREQ      SYSTEM._L1034
SYSTEM._L1034:
                        LD        _ACCGLO, -X
                        ST        -Z, _ACCGLO
                        DEC       _ACCDHI
                        BRNE     SYSTEM._L1034
SYSTEM._L1028:
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        MOV       _ACCB, _ACCA
                        ADD       _ACCB, _ACCAHI
                        ADD       _ACCB, _ACCDLO
                        BRNE     SYSTEM._L1039
SYSTEM._L1035:
                        ADD       _ACCAHI, _ACCDLO
                        INC       _ACCAHI
SYSTEM._L1039:
                        MOV       _ACCFLO, _ACCFHI
                        ANDI      _ACCFLO, 10h
                        BREQ      SYSTEM._L1042
SYSTEM._L1042:
                        ST        X, _ACCB
SYSTEM._L1041:
                        CLR       _ACCALO
                        ADD       _ACCBLO, _ACCA
                        ADC       _ACCBHI, _ACCALO
SYSTEM._L1040:
                        MOV       _ACCFLO, _ACCFHI
                        ANDI      _ACCFLO, 3
                        TST       _ACCFLO
                        BREQ      SYSTEM._L1043
                        LSR       _ACCFLO
                        BRNE      SYSTEM._L1045
                        CALL      SYSTEM.ReadEEp8
                        MOV       _ACCGLO, _ACCA
                        ADIW      _ACCCLO, 01h
                        RJMP      SYSTEM._L1044
SYSTEM._L1045:
                        LPM       _ACCGLO, Z+
                        RJMP      SYSTEM._L1044
SYSTEM._L1043:
                        LD        _ACCGLO, Z+
SYSTEM._L1044:
                        MOV       _ACCFLO, _ACCFHI
                        ANDI      _ACCFLO, 10h
                        BREQ      SYSTEM._L1046
SYSTEM._L1046:
                        ST        X+, _ACCGLO
SYSTEM._L1047:
                        DEC       _ACCAHI
                        BRNE     SYSTEM._L1040
SYSTEM._L1038:
                        RET

SYSTEM.Str2Int:
                        CLR       _ACCAHI
                        CLR       _ACCALO
                        CLR       _ACCBHI
                        CLR       _ACCBLO
                        BST       Flags, _EEPROM
                        BRTC      SYSTEM._L1052
                        CALL      SYSTEM.ReadEEp8
                        ADIW      _ACCCLO, 01h
                        RJMP     SYSTEM._L1053
SYSTEM._L1052:
                        LD        _ACCA, Z+
SYSTEM._L1053:
                        TST       _ACCA
                        BRNE      SYSTEM._L1049
SYSTEM._L1048:
                        CLR       _ACCA
                        CLR       _ACCB
                        RET

SYSTEM._L1049:
                        MOV       _ACCDHI, _ACCA
                        TST       _ACCB
                        BREQ      SYSTEM._L1054
                        INC       _ACCDHI
                        RJMP      SYSTEM.Hex2Int
SYSTEM._L1054:
                        BST       Flags, _EEPROM
                        BRTC      SYSTEM._L1055
                        CALL      SYSTEM.ReadEEp8
                        ADIW      _ACCCLO, 01h
                        RJMP     SYSTEM._L1056
SYSTEM._L1055:
                        LD        _ACCA, Z+
SYSTEM._L1056:
                        CLT
                        BLD       Flags, _NEGATIVE
                        CPI       _ACCA, 02Dh
                        BRNE      SYSTEM._L1050
                        DEC       _ACCDHI
                        BREQ      SYSTEM._L1048
                        SET
                        BLD       Flags, _NEGATIVE
                        BST       Flags, _EEPROM
                        BRTC      SYSTEM._L1057
                        CALL      SYSTEM.ReadEEp8
                        ADIW      _ACCCLO, 01h
                        RJMP     SYSTEM._L1058
SYSTEM._L1057:
                        LD        _ACCA, Z+
SYSTEM._L1058:
                        RJMP      SYSTEM.Dec2Int
SYSTEM._L1050:
                        CPI       _ACCA, 02Bh
                        BRNE      SYSTEM._L1051
                        DEC       _ACCDHI
                        BREQ      SYSTEM._L1048
                        CLT
                        BLD       Flags, _NEGATIVE
                        BST       Flags, _EEPROM
                        BRTC      SYSTEM._L1059
                        CALL      SYSTEM.ReadEEp8
                        ADIW      _ACCCLO, 01h
                        RJMP     SYSTEM._L1060
SYSTEM._L1059:
                        LD        _ACCA, Z+
SYSTEM._L1060:
                        RJMP      SYSTEM.Dec2Int
SYSTEM._L1051:
                        CPI       _ACCA, 024h
                        BRNE      SYSTEM.Dec2Int
                        RJMP      SYSTEM.Hex2Int
SYSTEM.Dec2Int:
                        MOV       _ACCB, _ACCDHI
                        DEC       _ACCB
                        BRMI      SYSTEM._L1048
                        CLR       _ACCDHI
                        CLR       _ACCEHI
                        CLR       _ACCFHI
                        CLR       _ACCFLO
                        PUSH      _ACCB
                        RJMP      SYSTEM.Dec2Int1
SYSTEM._L1061:
                        PUSH      _ACCB
                        BST       Flags, _EEPROM
                        BRTC      SYSTEM._L1064
                        CALL      SYSTEM.ReadEEp8
                        ADIW      _ACCCLO, 01h
                        RJMP     SYSTEM._L1065
SYSTEM._L1064:
                        LD        _ACCA, Z+
SYSTEM._L1065:
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
                        RJMP      SYSTEM._L1061
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
                        BRTC      SYSTEM._L1066
                        SUBI      _ACCB, 01h
                        SBCI      _ACCA, 00h
                        SBCI      _ACCALO, 00h
                        SBCI      _ACCAHI, 00h
                        COM       _ACCALO
                        COM       _ACCAHI
                        COM       _ACCA
                        COM       _ACCB
SYSTEM._L1066:
                        RET

SYSTEM.Hex2Int:
                        CLT
                        BLD       Flags, _NEGATIVE
                        DEC       _ACCDHI
                        BREQ      SYSTEM._L1066
                        CPI       _ACCDHI, 009h
                        BRSH      SYSTEM.Str2Ierr
SYSTEM._L1067:
                        BST       Flags, _EEPROM
                        BRTC      SYSTEM._L1071
                        CALL      SYSTEM.ReadEEp8
                        ADIW      _ACCCLO, 01h
                        RJMP     SYSTEM._L1072
SYSTEM._L1071:
                        LD        _ACCA, Z+
SYSTEM._L1072:
                        CPI       _ACCA, 061h
                        BRLO      SYSTEM._L1068
                        SUBI      _ACCA, 020h
SYSTEM._L1068:
                        CPI       _ACCA, 030h
                        BRLO      SYSTEM.Str2Ierr
                        CPI       _ACCA, 03Ah
                        BRLO      SYSTEM._L1069
                        CPI       _ACCA, 041h
                        BRLO      SYSTEM.Str2Ierr
                        CPI       _ACCA, 047h
                        BRSH      SYSTEM.Str2Ierr
                        SUBI      _ACCA, -9 AND 0FFh
SYSTEM._L1069:
                        ANDI      _ACCA, 00Fh
                        LDI       _ACCB, 4
SYSTEM._L1070:
                        LSL       _ACCBLO
                        ROL       _ACCBHI
                        ROL       _ACCALO
                        ROL       _ACCAHI
                        DEC       _ACCB
                        BRNE      SYSTEM._L1070
                        OR        _ACCBLO, _ACCA
                        DEC       _ACCDHI
                        BRNE      SYSTEM._L1067
                        RJMP      SYSTEM.Str2Iex
SYSTEM.PosChInVarStr:
                        CLR       _ACCA
                        LD        _ACCBHI, Z
                        TST       _ACCBHI
                        BREQ      SYSTEM._L1074
                        TST       _ACCELO
                        BRNE      SYSTEM._L1073
                        INC       _ACCELO
SYSTEM._L1073:
                        CP        _ACCBHI, _ACCELO
                        BRCS      SYSTEM._L1074
                        ADD       _ACCCLO, _ACCELO
                        ADC       _ACCCHI, _ACCA
                        DEC       _ACCELO
                        SUB       _ACCBHI, _ACCELO
                        MOV       _ACCA, _ACCELO
SYSTEM._L1075:
                        INC       _ACCA
                        LD        _ACCBLO, Z+
                        CP        _ACCB, _ACCBLO
                        BREQ      SYSTEM._L1074
                        DEC       _ACCBHI
                        BRNE      SYSTEM._L1075
                        CLR       _ACCA
SYSTEM._L1074:
                        RET


SYSTEM.UpperCaseStr:
                        LD        _ACCA, Z+
                        TST       _ACCA
                        BREQ      SYSTEM._L1077
                        MOV       _ACCBHI, _ACCA
SYSTEM._L1076:
                        LD        _ACCA, Z+
                        CPI       _ACCA, 061h
                        BRCS      SYSTEM._L1078
                        CPI       _ACCA, 07Bh
                        BRCC      SYSTEM._L1078
                        ANDI      _ACCA, 0DFh
SYSTEM._L1078:
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCBHI
                        BRNE      SYSTEM._L1076
SYSTEM._L1077:
                        RET


SYSTEM.StrCopyV:
                        TST       _ACCA
                        BREQ      SYSTEM._L1081
                        LD        _ACCBHI, Z
                        TST       _ACCBHI
                        BREQ      SYSTEM._L1081
                        SUB       _ACCBHI, _ACCB
                        BRCS      SYSTEM._L1081
                        INC       _ACCBHI
                        CLR       _ACCBLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCBLO
                        CP        _ACCBHI, _ACCA
                        BRCS      SYSTEM._L1080
                        MOV       _ACCBHI, _ACCA
SYSTEM._L1080:
                        LD        _ACCA, Z+
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCBHI
                        BRNE      SYSTEM._L1080
SYSTEM._L1081:
                        RET


SYSTEM.StrConst2Str:
                        LPM       _ACCBHI, Z+
                        TST       _ACCBHI
                        BREQ      SYSTEM._L1083
SYSTEM.StrConst2StrPart:
SYSTEM._L1082:
                        LPM      _ACCA, Z+
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCBHI
                        BRNE      SYSTEM._L1082
SYSTEM._L1083:
                        RET


SYSTEM.StrVar2Str:
                        LD        _ACCA, Z+
                        TST       _ACCA
                        BREQ      SYSTEM._L1085
                        MOV       _ACCBHI, _ACCA
SYSTEM._L1084:
                        LD        _ACCA, Z+
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCBHI
                        BRNE      SYSTEM._L1084
SYSTEM._L1085:
                        RET


SYSTEM.StrEEp2Str:
                        CALL      SYSTEM.ReadEEp8
                        ADIW      _ACCCLO, 01h
                        TST       _ACCA
                        BREQ      SYSTEM._L1087
                        MOV       _ACCBHI, _ACCA
SYSTEM._L1086:
                        CALL      SYSTEM.ReadEEp8
                        ADIW      _ACCCLO, 01h
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCBHI
                        BRNE      SYSTEM._L1086
SYSTEM._L1087:
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
                        RJMP      SYSTEM._L1088
                        LD        _ACCGLO, Z+
                        RJMP      SYSTEM._L1089
SYSTEM._L1088:
                        LPM       _ACCGLO, Z+
SYSTEM._L1089:
                        CP        _ACCB, _ACCGLO
                        BREQ      SYSTEM._L1090
                        CLZ
                        RET
SYSTEM._L1090:
                        TST       _ACCB
                        BRNE      SYSTEM._L1091
                        SEZ
                        RET
SYSTEM._L1091:
                        DEC       _ACCB
                        LD        _ACCA, X+
                        SBRC      FLAGS, _STRCONST
                        RJMP      SYSTEM._L1092
                        LD        _ACCGLO, Z+
                        RJMP      SYSTEM._L1093
SYSTEM._L1092:
                        LPM       _ACCGLO, Z+
SYSTEM._L1093:
                        CP        _ACCA, _ACCGLO
                        BREQ      SYSTEM._L1090
                        CLZ
                        RET


SYSTEM.Hex2Str8:
                        LDI       _ACCBHI, 2
SYSTEM._L1094:
                        SWAP      _ACCDLO
                        MOV       _ACCA, _ACCDLO
                        ANDI      _ACCA, 0Fh
                        CPI       _ACCA, 010
                        BRCS      SYSTEM._L1095
                        ADDI      _ACCA, 7
SYSTEM._L1095:
                        ADDI      _ACCA, 30h
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCBHI
                        BRNE      SYSTEM._L1094
                        RET


SYSTEM.Bin2Str8:
                        LDI       _ACCBHI, 8
SYSTEM._L1097:
                        LDI       _ACCA, 30h
                        LSL       _ACCDLO
                        BRCC      SYSTEM._L1098
                        INC       _ACCA
SYSTEM._L1098:
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCBHI
                        BRNE      SYSTEM._L1097
                        RET


SYSTEM.Char2Str:
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        BST       Flags, _DEVICE
                        BRTS      SYSTEM._L1102
                        PUSH      _ACCA
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LDD       _ACCA, Y+000h
                        TST       _ACCA
                        BRNE      SYSTEM._L1099
                        POP       _ACCA
                        SET
                        BLD       Flags, _ERRFLAG
                        POP       _ACCCHI
                        POP       _ACCCLO
                        RET
SYSTEM._L1099:
                        DEC       _ACCA
                        STD       Y+000h, _ACCA
                        POP       _ACCA
                        BST       Flags, _EEPROM
                        BRTS      SYSTEM._L1100
                        ST        Z+, _ACCA
                        RJMP      SYSTEM._L1101
SYSTEM._L1100:
                        CALL      SYSTEM.WriteEEp8
                        ADIW      _ACCCLO, 01h
SYSTEM._L1101:
                        STD       Y+002h, _ACCCHI
                        STD       Y+001h, _ACCCLO
                        POP       _ACCCHI
                        POP       _ACCCLO
                        RET
SYSTEM._L1102:
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
                        BRCC      SYSTEM._L1103
                        POP       _ACCEHI
                        POP       _ACCELO
                        CLR       _ACCA
                        CLR       _ACCB
                        CLR       _ACCAHI
                        CLR       _ACCALO
                        RET
SYSTEM._L1103:
                        ORI       _ACCALO, 080h
                        MOV       _ACCELO, _ACCAHI
                        CLR       _ACCAHI
                        CPI       _ACCEHI, 24
                        BRSH      SYSTEM._L1105
                        SUBI      _ACCEHI, 23
                        NEG       _ACCEHI
SYSTEM._L1104:
                        BREQ      SYSTEM._L1107
                        LSR       _ACCAHI
                        ROR       _ACCALO
                        ROR       _ACCA
                        ROR       _ACCB
                        DEC       _ACCEHI
                        RJMP      SYSTEM._L1104
SYSTEM._L1105:
                        SUBI      _ACCEHI, 23
SYSTEM._L1106:
                        BREQ      SYSTEM._L1107
                        LSL       _ACCB
                        ROL       _ACCA
                        ROL       _ACCALO
                        ROL       _ACCAHI
                        DEC       _ACCEHI
                        RJMP      SYSTEM._L1106
SYSTEM._L1107:
                        SBRS      _ACCELO, 7
                        RJMP      SYSTEM._L1108
                        SUBI      _ACCB, 01h
                        SBCI      _ACCA, 00h
                        SBCI      _ACCALO, 00h
                        SBCI      _ACCAHI, 00h
                        COM       _ACCB
                        COM       _ACCA
                        COM       _ACCAHI
                        COM       _ACCALO
SYSTEM._L1108:
                        POP       _ACCEHI
                        POP       _ACCELO
                        RET

SYSTEM.FENTIERx:
                        CPI       _ACCAHI, 0CFh
                        BRLO      SYSTEM._L1109
                        LDI       _ACCAHI, 080h
                        CLR       _ACCALO
                        CLR       _ACCA
                        CLR       _ACCB
                        RET
SYSTEM._L1109:
                        SBRC      _ACCAHI, 7
                        RJMP      SYSTEM._L1110
                        CPI       _ACCAHI, 04Fh
                        BRLO      SYSTEM._L1110
                        LDI       _ACCAHI, 07Fh
                        LDI       _ACCALO, 0FFh
                        LDI       _ACCA, 0FFh
                        LDI       _ACCB, 0FFh
                        RET
SYSTEM._L1110:
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
                        BRPL      SYSTEM._L1112
                        CLR       _ACCAHI
                        CLR       _ACCALO
                        CLR       _ACCA
                        CLR       _ACCB
                        RET
SYSTEM._L1112:
                        CPI       _ACCBHI, 23
                        BRCC      SYSTEM._L1114
                        LDI       _ACCBLO, 23
                        SUB       _ACCBLO, _ACCBHI
                        BREQ      SYSTEM._L1116
SYSTEM._L1113:
                        LSR       _ACCAHI
                        ROR       _ACCALO
                        ROR       _ACCA
                        ROR       _ACCB
                        DEC       _ACCBLO
                        BRNE      SYSTEM._L1113
                        RJMP      SYSTEM._L1116
SYSTEM._L1114:
                        SUBI      _ACCBHI, 23
                        BREQ      SYSTEM._L1116
                        MOV       _ACCBLO, _ACCBHI
SYSTEM._L1115:
                        LSL       _ACCB
                        ROL       _ACCA
                        ROL       _ACCALO
                        ROL       _ACCAHI
                        BRCC      SYSTEM._L1117
                        SET
                        BLD       Flags, _ERRFLAG
SYSTEM._L1117:
                        DEC       _ACCBLO
                        BRNE      SYSTEM._L1115
SYSTEM._L1116:
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
                        RJMP      SYSTEM._L1118
                        CBR       _ACCAHI, 080h
                        SBRS      _ACCDLO, 7
                        RJMP      SYSTEM._L1120
SYSTEM._L1118:
                        SBRS      _ACCCHI, 7
                        RJMP      SYSTEM._L1119
                        CBR       _ACCCHI, 080h
                        SBRS      _ACCDLO, 7
                        RJMP      SYSTEM._L1121
SYSTEM._L1119:
                        CP        _ACCAHI, _ACCCHI
                        BRLO      SYSTEM._L1120
                        BRNE      SYSTEM._L1121
                        CP        _ACCALO, _ACCCLO
                        BRLO      SYSTEM._L1120
                        BRNE      SYSTEM._L1121
                        CP        _ACCA, _ACCBHI
                        BRLO      SYSTEM._L1120
                        BRNE      SYSTEM._L1121
                        CP        _ACCB, _ACCBLO
                        BRLO      SYSTEM._L1120
                        BRNE      SYSTEM._L1121
                        RJMP      SYSTEM._L1125
SYSTEM._L1120:
                        SBRC      _ACCDLO, 7
                        RJMP      SYSTEM._L1123
SYSTEM._L1122:
                        BST       Flags, _NEGATIVE
                        BRTS      SYSTEM._L1124
                        MOVW      _ACCB, _ACCBLO
                        MOVW      _ACCALO, _ACCCLO
SYSTEM._L1124:
                        INC       _ACCDHI
                        RJMP      SYSTEM._L1125
SYSTEM._L1121:
                        SBRC      _ACCDLO, 7
                        RJMP      SYSTEM._L1122
SYSTEM._L1123:
                        DEC       _ACCDHI
SYSTEM._L1125:
                        OR        _ACCAHI, _ACCDLO
                        RET

SYSTEM.LIntToFloat:
                        TST       _ACCAHI
                        BRNE      SYSTEM._L1126
                        TST       _ACCALO
                        BRNE      SYSTEM._L1126
                        TST       _ACCA
                        BRNE      SYSTEM._L1126
                        TST       _ACCB
                        BRNE      SYSTEM._L1126
                        RET
SYSTEM._L1126:
                        CLR       _ACCBLO
                        SBRS      Flags, _SIGN
                        RJMP      SYSTEM._L1127
                        MOV       _ACCBLO, _ACCAHI
                        ANDI      _ACCBLO, 080h
                        TST       _ACCAHI
                        BRPL      SYSTEM._L1132
                        SUBI      _ACCB, 01h
                        SBCI      _ACCA, 00h
                        SBCI      _ACCALO, 00h
                        SBCI      _ACCAHI, 00h
                        COM       _ACCALO
                        COM       _ACCAHI
                        COM       _ACCA
                        COM       _ACCB
SYSTEM._L1132:
SYSTEM._L1127:
                        LDI       _ACCBHI, 150
SYSTEM._L1128:
                        TST       _ACCAHI
                        BREQ      SYSTEM._L1129
                        LSR       _ACCAHI
                        ROR       _ACCALO
                        ROR       _ACCA
                        ROR       _ACCB
                        INC       _ACCBHI
                        RJMP      SYSTEM._L1128
SYSTEM._L1129:
                        SBRC      _ACCALO, 7
                        RJMP      SYSTEM._L1130
                        LSL       _ACCB
                        ROL       _ACCA
                        ROL       _ACCALO
                        ROL       _ACCAHI
                        DEC       _ACCBHI
                        RJMP      SYSTEM._L1129
SYSTEM._L1130:
                        ANDI      _ACCALO, 07Fh
                        MOV       _ACCAHI, _ACCBHI
                        LSR       _ACCAHI
                        BRCC      SYSTEM._L1131
                        ORI       _ACCALO, 080h
SYSTEM._L1131:
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
                        BREQ      SYSTEM._L1133
                        TST       _ACCEHI
                        BRNE      SYSTEM._L1134
SYSTEM._L1133:
                        CLR       _ACCB
                        CLR       _ACCA
                        CLR       _ACCALO
                        CLR       _ACCAHI
                        RET
SYSTEM._L1134:
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
                        BRNE      SYSTEM._L1135
                        CPI       _ACCCHI, 0FFh
                        BRLO      SYSTEM._L1136
SYSTEM._L1135:
                        SET
                        BLD       Flags, _ERRFLAG
                        ANDI      _ACCAHI, 080h
                        ORI       _ACCAHI, 07Eh
                        LDI       _ACCALO, 0FFh
                        LDI       _ACCB, 0FFh
                        LDI       _ACCA, 0FFh
                        RET
SYSTEM._L1136:
                        CPI       _ACCCHI, 01h
                        BRSH      SYSTEM._L1137
                        CLR       _ACCAHI
                        CLR       _ACCALO
                        CLR       _ACCB
                        CLR       _ACCA
                        SET
                        BLD       Flags, _ERRFLAG
                        RET
SYSTEM._L1137:
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
SYSTEM._L1138:
                        BRCC      SYSTEM._L1139
                        ADD       _ACCFLO, _ACCBLO
                        ADC       _ACCFHI, _ACCBHI
                        ADC       _ACCGLO, _ACCCLO
                        ADC       _ACCGHI, _ACCCHI
SYSTEM._L1139:
                        ROR       _ACCGHI
                        ROR       _ACCGLO
                        ROR       _ACCFHI
                        ROR       _ACCFLO
                        ROR       _ACCEHI
                        ROR       _ACCELO
                        ROR       _ACCDHI
                        ROR       _ACCDLO
                        DEC       _ACCA
                        BRNE      SYSTEM._L1138
                        LDI       _ACCALO, 23
SYSTEM._L1140:
                        LSR       _ACCGHI
                        ROR       _ACCGLO
                        ROR       _ACCFHI
                        ROR       _ACCFLO
                        ROR       _ACCEHI
                        ROR       _ACCELO
                        ROR       _ACCDHI
                        ROR       _ACCDLO
                        DEC       _ACCALO
                        BRNE      SYSTEM._L1140
                        MOV       _ACCB, _ACCDLO
                        MOV       _ACCA, _ACCDHI
                        MOV       _ACCALO, _ACCELO
                        MOV       _ACCAHI, _ACCEHI
                        POP       _ACCBHI
                        POP       _ACCGLO
                        TST       _ACCAHI
                        BREQ      SYSTEM._L1141
                        LSR       _ACCAHI
                        ROR       _ACCALO
                        ROR       _ACCA
                        ROR       _ACCB
                        INC       _ACCBHI
SYSTEM._L1141:
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
                        BRNE      SYSTEM._L1143
SYSTEM._L1142:
                        SET
                        BLD       Flags, _ERRFLAG
                        ANDI      _ACCAHI, 080h
                        ORI       _ACCAHI, 07Eh
                        LDI       _ACCALO, 0FFh
                        LDI       _ACCA, 0FFh
                        LDI       _ACCB, 0FFh
                        RET
SYSTEM._L1143:
                        ROL       _ACCCLO
                        ROL       _ACCCHI
                        SEC
                        ROR       _ACCCLO
                        ROL       _ACCELO
                        ROL       _ACCEHI
                        SEC
                        ROR       _ACCELO
                        TST       _ACCEHI
                        BRNE      SYSTEM._L1145
                        CLR       _ACCAHI
                        CLR       _ACCALO
                        CLR       _ACCA
                        CLR       _ACCB
                        RET
SYSTEM._L1145:
                        CLR       _ACCA
                        SUB       _ACCEHI, _ACCCHI
                        SBCI      _ACCA, 00h
                        MOV       _ACCCHI, _ACCEHI
                        LDI       _ACCB, 7Eh
                        ADD       _ACCCHI, _ACCB
                        CLR       _ACCB
                        ADC       _ACCA, _ACCB
                        TST      _ACCA
                        BRNE     SYSTEM._L1147
                        CPI       _ACCCHI, 0FFh
                        BRNE      SYSTEM._L1146
SYSTEM._L1147:
                        SET
                        BLD       Flags, _ERRFLAG
                        ANDI      _ACCAHI, 080h
                        ORI       _ACCAHI, 07Eh
                        LDI       _ACCALO, 0FFh
                        LDI       _ACCB, 0FFh
                        LDI       _ACCA, 0FFh
                        RET
SYSTEM._L1146:
                        TST       _ACCCHI
                        BRNE      SYSTEM._L1144
                        SET
                        BLD       Flags, _ERRFLAG
                        CLR       _ACCAHI
                        CLR       _ACCALO
                        CLR       _ACCB
                        CLR       _ACCA
                        RET
SYSTEM._L1144:
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
SYSTEM._L1148:
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
                        BRCC      SYSTEM._L1149
                        CLR       _ACCB
                        SUB       _ACCALO, _ACCBLO
                        SBC       _ACCAHI, _ACCBHI
                        SBC       _ACCGLO, _ACCCLO
                        SBC       _ACCGHI, _ACCCHI
                        SBC       _ACCHLO, _ACCB
                        SBC       _ACCHHI, _ACCB
                        SEC
                        RJMP      SYSTEM._L1151
SYSTEM._L1149:
                        CLR       _ACCB
                        CP        _ACCHHI, _ACCB
                        BRLO      SYSTEM._L1151
                        BRNE      SYSTEM._L1150
                        CP        _ACCHLO, _ACCB
                        BRLO      SYSTEM._L1151
                        BRNE      SYSTEM._L1150
                        CP        _ACCGHI, _ACCCHI
                        BRLO      SYSTEM._L1151
                        BRNE      SYSTEM._L1150
                        CP        _ACCGLO, _ACCCLO
                        BRLO      SYSTEM._L1151
                        BRNE      SYSTEM._L1150
                        CP        _ACCAHI, _ACCBHI
                        BRLO      SYSTEM._L1151
                        BRNE      SYSTEM._L1150
                        CP        _ACCALO, _ACCBLO
                        BRLO      SYSTEM._L1151
SYSTEM._L1150:
                        CLR       _ACCB
                        SUB       _ACCALO, _ACCBLO
                        SBC       _ACCAHI, _ACCBHI
                        SBC       _ACCGLO, _ACCCLO
                        SBC       _ACCGHI, _ACCCHI
                        SBC       _ACCHLO, _ACCB
                        SBC       _ACCHHI, _ACCB
SYSTEM._L1151:
                        DEC       _ACCA
                        BRCS      SYSTEM._L1152
                        SEC
                        RJMP      SYSTEM._L1153
SYSTEM._L1152:
                        CLC
SYSTEM._L1153:
                        BRNE      SYSTEM._L1148
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
                        BREQ      SYSTEM._L1154
                        LSR       _ACCAHI
                        ROR       _ACCALO
                        ROR       _ACCA
                        ROR       _ACCB
                        INC       _ACCBHI
SYSTEM._L1154:
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
                        BRCS      SYSTEM._L1155
                        BRNE      SYSTEM._L1156
                        CP        _ACCELO, _ACCCLO
                        BRCS      SYSTEM._L1155
                        BRNE      SYSTEM._L1156
                        CP        _ACCDHI, _ACCBHI
                        BRCS      SYSTEM._L1155
                        BRNE      SYSTEM._L1156
                        CP        _ACCDLO, _ACCBLO
                        BRCS      SYSTEM._L1155
SYSTEM._L1156:
                        MOVW      _ACCB, _ACCDLO
                        MOVW      _ACCALO, _ACCELO
                        MOV       _ACCDHI, _ACCBHI
                        MOV       _ACCDLO, _ACCBLO
                        MOV       _ACCEHI, _ACCCHI
                        MOV       _ACCELO, _ACCCLO
                        MOVW      _ACCBLO, _ACCB
                        MOVW      _ACCCLO, _ACCALO
                        RJMP      SYSTEM._L1165
SYSTEM._L1155:
                        MOVW      _ACCB, _ACCBLO
                        MOVW      _ACCALO, _ACCCLO
SYSTEM._L1165:
                        ANDI      _ACCALO, 07Fh
                        ORI       _ACCALO, 080h
                        CLR       _ACCAHI
                        SBRS      _ACCCHI, 7
                        RJMP      SYSTEM._L1157
                        SUBI      _ACCB, 01h
                        SBCI      _ACCA, 00h
                        SBCI      _ACCALO, 00h
                        SBCI      _ACCAHI, 00h
                        COM       _ACCALO
                        COM       _ACCAHI
                        COM       _ACCA
                        COM       _ACCB
SYSTEM._L1157:
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
SYSTEM._L1158:
                        BREQ      SYSTEM._L1159
                        LSR       _ACCHLO
                        ROR       _ACCGHI
                        ROR       _ACCGLO
                        DEC       _ACCA
                        RJMP      SYSTEM._L1158
SYSTEM._L1159:
                        MOV       _ACCA, _ACCEHI
                        MOV       _ACCDLO, _ACCGLO
                        MOV       _ACCDHI, _ACCGHI
                        MOV       _ACCELO, _ACCHLO
                        MOV       _ACCEHI, _ACCHHI
                        SBRS      _ACCA, 7
                        RJMP      SYSTEM._L1160
                        SUBI      _ACCDLO, 01h
                        SBCI      _ACCDHI, 00h
                        SBCI      _ACCELO, 00h
                        SBCI      _ACCEHI, 00h
                        COM       _ACCDLO
                        COM       _ACCDHI
                        COM       _ACCEHI
                        COM       _ACCELO
SYSTEM._L1160:
                        POP       _ACCA
                        ADD       _ACCB, _ACCDLO
                        ADC       _ACCA, _ACCDHI
                        ADC       _ACCALO, _ACCELO
                        ADC       _ACCAHI, _ACCEHI
                        SBRS      _ACCAHI, 7
                        RJMP      SYSTEM._L1161
                        ORI       _ACCCHI, 080h
                        SUBI      _ACCB, 01h
                        SBCI      _ACCA, 00h
                        SBCI      _ACCALO, 00h
                        SBCI      _ACCAHI, 00h
                        COM       _ACCALO
                        COM       _ACCAHI
                        COM       _ACCA
                        COM       _ACCB
                        RJMP      SYSTEM._L1162
SYSTEM._L1161:
                        ANDI      _ACCCHI, 07Fh
SYSTEM._L1162:
                        MOV       _ACCFLO, _ACCAHI
                        ANDI      _ACCFLO, 07Fh
                        BREQ      SYSTEM._L1163
                        LSR       _ACCAHI
                        ROR       _ACCALO
                        ROR       _ACCA
                        ROR       _ACCB
                        INC       _ACCFHI
                        BRNE      SYSTEM._L1163
                        LDI       _ACCA, 0FFh
                        LDI       _ACCB, 0FFh
                        LDI       _ACCALO, 0FFh
                        LDI       _ACCAHI, 07Fh
                        SBRC      _ACCCHI, 7
                        ORI       _ACCAHI, 080h
                        SET
                        BLD       Flags, _ERRFLAG
                        RET
SYSTEM._L1163:
                        SBRC      _ACCALO, 7
                        RJMP      SYSTEM._L1164
                        TST       _ACCFHI
                        BREQ      SYSTEM._L1164
                        LSL       _ACCB
                        ROL       _ACCA
                        ROL       _ACCALO
                        ROL       _ACCAHI
                        DEC       _ACCFHI
                        RJMP      SYSTEM._L1163
SYSTEM._L1164:
                        MOV       _ACCAHI, _ACCFHI
                        CLR       _ACCFHI
                        LSR       _ACCAHI
                        TST       _ACCAHI
                        BREQ      SYSTEM._L1166
                        ROR       _ACCFHI
                        ANDI      _ACCALO, 07Fh
                        OR        _ACCALO, _ACCFHI
                        SBRC      _ACCCHI, 7
                        ORI       _ACCAHI, 080h
                        RET
SYSTEM._L1166:
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
                        BRNE      SYSTEM._L1167
                        RET
SYSTEM._L1167:
                        RCALL     SYSTEM.Str2FltRdChr
                        CPI       _ACCDLO, 020h
                        BRNE      SYSTEM._L1168
                        ADIW      _ACCCLO, 1
                        DEC       _ACCBLO
                        RJMP      SYSTEM.ACSkipSpace
SYSTEM._L1168:
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
                        BRTC      SYSTEM._L1169
                        CALL      SYSTEM.ReadEEp8D
                        RET
SYSTEM._L1169:
                        LD        _ACCDLO, Z
                        RET
SYSTEM.Float2Str_C:
                        PUSH      _ACCDHI
SYSTEM._L1171:
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
                        BRMI      SYSTEM._L1173
                        BREQ      SYSTEM._L1173
                        LDI       _ACCBLO, 000h
                        LDI       _ACCBHI, 024h
                        LDI       _ACCCLO, 074h
                        LDI       _ACCCHI, 049h
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BRMI      SYSTEM._L1174
                        BREQ      SYSTEM._L1174
                        POP       _ACCDHI
                        DEC       _ACCDHI
                        PUSH      _ACCDHI
                        LDI       _ACCBLO, 000h
                        LDI       _ACCBHI, 000h
                        LDI       _ACCCLO, 020h
                        LDI       _ACCCHI, 041h
SYSTEM._L1172:
                        MOV       _ACCDLO, _ACCELO
                        MOV       _ACCDHI, _ACCEHI
                        MOV       _ACCELO, _ACCFLO
                        MOV       _ACCEHI, _ACCFHI
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat_R
                        RJMP      SYSTEM._L1171
SYSTEM._L1173:
                        POP       _ACCDHI
                        INC       _ACCDHI
                        PUSH      _ACCDHI
                        LDI       _ACCBLO, 0CDh
                        LDI       _ACCBHI, 0CCh
                        LDI       _ACCCLO, 0CCh
                        LDI       _ACCCHI, 03Dh
                        RJMP      SYSTEM._L1172
SYSTEM._L1174:
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
SYSTEM._L1170:
                        ST        -Y, _ACCELO
                        DEC       _ACCEHI
                        BRNE      SYSTEM._L1170
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
                        BRNE      SYSTEM._L1181
                        LDD       _ACCA, Y+15
                        LDI       _ACCB, DECIMALSEP
                        CPI       _ACCA, 45h
                        BRNE      SYSTEM._L1182
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
SYSTEM._L1182:
                        LDI       _ACCA, 30h
                        RCALL     SYSTEM.Float2Str_P
                        LDI       _ACCA, DECIMALSEP
                        RCALL     SYSTEM.Float2Str_P
                        LDI       _ACCA, 30h
                        RCALL     SYSTEM.Float2Str_P
                        RCALL     SYSTEM.Float2Str_R
                        RJMP      SYSTEM.Float2Str_F
SYSTEM._L1181:
                        LDD       _ACCCHI, Y+15
                        CPI       _ACCCHI, 45h
                        BREQ      SYSTEM._L1183
                        CP        _ACCBLO, _ACCBHI
                        BRCS      SYSTEM._L1183
                        MOV       _ACCBHI, _ACCBLO
                        INC       _ACCBHI
                        STD       Y+14, _ACCBHI
SYSTEM._L1183:
                        CLR       _ACCDHI
                        TST       _ACCAHI
                        BRPL      SYSTEM._L1180
                        ANDI      _ACCAHI, 07Fh
                        PUSH      _ACCA
                        LDI       _ACCA, 2Dh
                        RCALL     SYSTEM.Float2Str_P
                        POP       _ACCA
SYSTEM._L1180:
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
                        BRGE      SYSTEM._L1186
                        CPI       _ACCDHI, -5 AND 0FFh
                        BRLT      SYSTEM._L1186
                        CPI       _ACCDLO, 45h
                        BREQ      SYSTEM._L1186
                        TST       _ACCBLO
                        BRNE      SYSTEM._L1184
                        SUB       _ACCDLO, _ACCDHI
SYSTEM._L1184:
                        MOV       _ACCBLO, _ACCDHI
                        LDI       _ACCDHI, 9
                        SUB       _ACCDHI, _ACCDLO
                        SUB       _ACCDHI, _ACCBLO
                        BRMI      SYSTEM._L1187
                        BRNE      SYSTEM._L1185
                        COM       _ACCDHI
                        STD       Y+15, _ACCDHI
                        RJMP      SYSTEM._L1186
SYSTEM._L1185:
                        DEC       _ACCDHI
                        BREQ      SYSTEM._L1186
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
                        RJMP      SYSTEM._L1185
SYSTEM._L1187:
SYSTEM._L1186:
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
                        RJMP      SYSTEM._L1176
SYSTEM._L1175:
                        LSR       _ACCFLO
                        ROR       _ACCEHI
                        ROR       _ACCELO
                        DEC       _ACCAHI
SYSTEM._L1176:
                        BRNE      SYSTEM._L1175
                        POP       _ACCBHI
                        LDI       _ACCBLO, 1
                        LDD       _ACCDLO, Y+15
                        CPI       _ACCDLO, 45h
                        BRNE      SYSTEM._L1188
                        SUBI      _ACCBHI, -8 AND 0FFh
                        MOV       _ACCALO, _ACCBHI
                        BRPL      SYSTEM._L1189
                        NEG       _ACCALO
SYSTEM._L1189:
                        RJMP      SYSTEM._L1177
SYSTEM._L1188:
                        LDI       _ACCALO, 7
                        SUBI      _ACCBHI, -8 AND 0FFh
                        CPI       _ACCBHI, 8
                        BRGE      SYSTEM._L1177
                        CPI       _ACCBHI, -5 AND 0FFh
                        BRLT      SYSTEM._L1177
                        DEC       _ACCBHI
                        MOV       _ACCBLO, _ACCBHI
                        LDI       _ACCBHI, 2
SYSTEM._L1177:
                        SUBI      _ACCBHI, 2
                        TST       _ACCBLO
                        BREQ      SYSTEM._L1191
                        BRPL      SYSTEM._L1178
SYSTEM._L1191:
                        LDI       _ACCA, 30h
                        RCALL     SYSTEM.Float2Str_P
                        LDI       _ACCA, DECIMALSEP
                        RCALL     SYSTEM.Float2Str_P
                        TST       _ACCBLO
                        BREQ      SYSTEM._L1178
SYSTEM._L1190:
                        LDI       _ACCA, 30h
                        RCALL     SYSTEM.Float2Str_P
                        DEC       _ACCALO
                        INC       _ACCBLO
                        BRNE      SYSTEM._L1190
SYSTEM._L1178:
                        LDI       _ACCCLO, SYSTEM.DECDIG AND 0FFh
                        LDI       _ACCCHI, SYSTEM.DECDIG SHRB 8
SYSTEM._L1179:
                        CLR       _ACCAHI
SYSTEM._L1192:
                        LPM       _ACCB, Z+
                        LPM       _ACCA, Z
                        ADIW      _ACCCLO, 1
                        LPM
                        ADIW      _ACCCLO, 02h
SYSTEM._L1197:
                        SUB       _ACCELO, _ACCB
                        SBC       _ACCEHI, _ACCA
                        SBC       _ACCFLO, _ACCGLO
                        BRCS      SYSTEM._L1193
                        INC       _ACCAHI
                        RJMP      SYSTEM._L1197
SYSTEM._L1193:
                        ADD       _ACCELO, _ACCB
                        ADC       _ACCEHI, _ACCA
                        ADC       _ACCFLO, _ACCGLO
                        CPI       _ACCAHI, 10
                        BRLT      SYSTEM._L1198
                        LDI       _ACCAHI, 1
                        INC       _ACCBHI
SYSTEM._L1198:
                        LDI       _ACCA, 30h
                        ADD       _ACCA, _ACCAHI
                        RCALL     SYSTEM.Float2Str_P
                        DEC       _ACCBLO
                        BRNE      SYSTEM._L1194
                        LDI       _ACCA, DECIMALSEP
                        RCALL     SYSTEM.Float2Str_P
SYSTEM._L1194:
                        DEC       _ACCALO
                        BRMI      SYSTEM._L1195
                        BRNE      SYSTEM._L1179
SYSTEM._L1195:
                        RCALL     SYSTEM.Float2Str_R
                        TST       _ACCBHI
                        BREQ      SYSTEM.Float2Str_F
                        LDI       _ACCA, 0FFh
                        STD       Y+15, _ACCA
                        LDI       _ACCA, 45h
                        RCALL     SYSTEM.Float2Str_P
                        TST       _ACCBHI
                        BRPL      SYSTEM._L1196
                        NEG       _ACCBHI
                        LDI       _ACCA, 2Dh
                        RCALL     SYSTEM.Float2Str_P
SYSTEM._L1196:
                        LDI       _ACCB, 10
                        MOV       _ACCA, _ACCBHI
                        CALL      SYSTEM.DIV8_R
                        TST       _ACCA
                        BREQ      SYSTEM._L1200
                        ORI       _ACCA, 30h
                        RCALL     SYSTEM.Float2Str_P
SYSTEM._L1200:
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
                        BREQ      SYSTEM._L1202
                        TST       _ACCAHI
                        BREQ      SYSTEM._L1202
                        TST       _ACCALO
                        BRNE      SYSTEM._L1201
                        RCALL     SYSTEM.Float2Str_D
                        ST        X, _ACCDHI
                        RJMP      SYSTEM._L1202
SYSTEM._L1201:
                        RCALL     SYSTEM.Float2Str_D
                        LD        _ACCDLO, X
                        SUB       _ACCAHI, _ACCALO
                        DEC       _ACCAHI
                        SUB       _ACCAHI, _ACCDHI
                        BREQ      SYSTEM._L1207
                        BRCS      SYSTEM._L1207
                        LDD       _ACCA, Y+16+3
SYSTEM._L1205:
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCAHI
                        BRNE      SYSTEM._L1205
SYSTEM._L1207:
                        ST        X, _ACCDHI
                        RCALL     SYSTEM.Float2Str_W
                        LDI       _ACCA, DECIMALSEP
                        CALL      SYSTEM.Char2Str
                        ADIW      _ACCBLO, 1
                        SUB       _ACCDLO, _ACCDHI
SYSTEM._L1209:
                        DEC       _ACCDLO
                        BREQ      SYSTEM._L1208
                        LD        _ACCA, X+
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCALO
                        BREQ      SYSTEM._L1206
                        RJMP      SYSTEM._L1209
SYSTEM._L1208:
                        LDI       _ACCA, 030h
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCALO
                        BRNE      SYSTEM._L1208
                        RJMP      SYSTEM._L1206
SYSTEM._L1202:
                        LD        _ACCB, X
                        SUB       _ACCAHI, _ACCB
                        BREQ      SYSTEM._L1204
                        BRCS      SYSTEM._L1204
                        LDD       _ACCA, Y+16+3
SYSTEM._L1203:
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCAHI
                        BRNE      SYSTEM._L1203
SYSTEM._L1204:
                        RCALL     SYSTEM.Float2Str_W
SYSTEM._L1206:
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
SYSTEM._L1210:
                        LD        _ACCA, X+
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCB
                        BRNE      SYSTEM._L1210
                        RET

SYSTEM.Float2Str_D:
                        PUSH      _ACCBLO
                        PUSH      _ACCBHI
                        CLR       _ACCDHI
                        LD        _ACCB, X+
SYSTEM._L1211:
                        LD        _ACCA, X+
                        CPI       _ACCA, DECIMALSEP
                        BREQ      SYSTEM._L1212
                        INC       _ACCDHI
                        DEC       _ACCB
                        BRNE      SYSTEM._L1211
SYSTEM._L1212:
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
SYSTEM._L1213:
                        DEC       _ACCA
                        LD        _ACCB, -Z
                        CPI       _ACCB, 030h
                        BREQ      SYSTEM._L1213
                        CPI       _ACCB, DECIMALSEP
                        BREQ      SYSTEM._L1214
                        INC       _ACCA
SYSTEM._L1214:
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
                        BREQ      SYSTEM._L1216
                        CPI       _ACCALO, 08h
                        BRCS      SYSTEM._L1215
                        CLR       _ACCA
                        RET
SYSTEM._L1215:
                        LSR       _ACCA
                        DEC       _ACCALO
                        BRNE      SYSTEM._L1215
SYSTEM._L1216:
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
SYSTEM._L1217:
                        ROL       _ACCA
                        DEC       _ACCALO
                        BRNE      SYSTEM._L1218
                        MOV       _ACCB, _ACCAHI
                        RET
SYSTEM._L1218:
                        ROL       _ACCAHI
                        SUB       _ACCAHI, _ACCB
                        BRCC      SYSTEM._L1219
                        ADD       _ACCAHI, _ACCB
                        CLC
                        RJMP      SYSTEM._L1217
SYSTEM._L1219:
                        SEC
                        RJMP      SYSTEM._L1217


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
                        BRTC      SYSTEM._L1221
                        MOV       _ACCDHI, _ACCBHI
                        MOV       _ACCDLO, _ACCAHI
                        EOR       _ACCDLO, _ACCBHI
                        CLT
                        SBRS      _ACCDLO, 7
                        BLD       Flags, _SIGN
                        SBRS      _ACCAHI, 7
                        RJMP      SYSTEM._L1223
                        NEG       _ACCALO
                        BRNE      SYSTEM._L1224
                        DEC       _ACCAHI
SYSTEM._L1224:
                        COM       _ACCAHI
SYSTEM._L1223:
                        SBRS      _ACCBHI, 7
                        RJMP      SYSTEM._L1221
                        NEG       _ACCBLO
                        BRNE      SYSTEM._L1225
                        DEC       _ACCBHI
SYSTEM._L1225:
                        COM       _ACCBHI
SYSTEM._L1221:
                        CLR       _ACCCLO
                        SUB       _ACCCHI, _ACCCHI
                        LDI       _ACCA, 17
SYSTEM._L1226:
                        ROL       _ACCBLO
                        ROL       _ACCBHI
                        DEC       _ACCA
                        BRNE      SYSTEM._L1227
                        MOVW      _ACCB, _ACCBLO
                        BST       Flags, _SIGN
                        BRTC      SYSTEM._L1222
                        NEG       _ACCB
                        BRNE      SYSTEM._L1229
                        DEC       _ACCA
SYSTEM._L1229:
                        COM       _ACCA
SYSTEM._L1222:
                        RET
SYSTEM._L1227:
                        ROL       _ACCCLO
                        ROL       _ACCCHI
                        SUB       _ACCCLO, _ACCALO
                        SBC       _ACCCHI, _ACCAHI
                        BRCC      SYSTEM._L1228
                        ADD       _ACCCLO, _ACCALO
                        ADC       _ACCCHI, _ACCAHI
                        CLC
                        RJMP      SYSTEM._L1226
SYSTEM._L1228:
                        SEC
                        RJMP      SYSTEM._L1226


SYSTEM.SHR16:
                        TST       _ACCALO
                        BREQ      SYSTEM._L1231
                        CPI       _ACCALO, 10h
                        BRCS      SYSTEM._L1230
                        CLR       _ACCA
                        CLR       _ACCB
                        RET
SYSTEM._L1230:
                        LSR       _ACCA
                        ROR       _ACCB
                        DEC       _ACCALO
                        BRNE      SYSTEM._L1230
SYSTEM._L1231:
                        RET


SYSTEM.SHR32:
                        TST       _ACCCLO
                        BREQ      SYSTEM._L1233
                        CPI       _ACCCLO, 20h
                        BRCS      SYSTEM._L1232
                        CLR       _ACCA
                        CLR       _ACCB
                        CLR       _ACCALO
                        CLR       _ACCAHI
                        RET
SYSTEM._L1232:
                        LSR       _ACCAHI
                        ROR       _ACCALO
                        ROR       _ACCA
                        ROR       _ACCB
                        DEC       _ACCCLO
                        BRNE      SYSTEM._L1232
SYSTEM._L1233:
                        RET

SYSTEM.SetSysTimer:
                        CLI
                        ST        Z+, _ACCB
                        ST        Z+, _ACCA
                        MOV       _ACCBLO, _SYSTFLAGS
                        TST       _ACCA
                        BRNE       SYSTEM._L1234
                        TST       _ACCB
                        BRNE       SYSTEM._L1234
                        COM       _ACCBHI
                        AND       _ACCBLO, _ACCBHI
                        MOV       _SYSTFLAGS, _ACCBLO
                        SBRC      Flags, IntFlag
                        SEI
                        RET
SYSTEM._L1234:
                        OR        _ACCBLO, _ACCBHI
                        MOV       _SYSTFLAGS, _ACCBLO
                        SBRC      Flags, IntFlag
                        SEI
                        RET


SYSTEM.High16i:
                        CP        _ACCA, _ACCBHI
                        BRLT      SYSTEM._L1235
                        BRNE      SYSTEM._L1236
                        CP        _ACCB, _ACCBLO
                        BRLO      SYSTEM._L1235
                        BRNE      SYSTEM._L1236
                        RJMP      SYSTEM._L1237
SYSTEM._L1235:
                        INC       _ACCDHI
                        BST       Flags, _NEGATIVE
                        BRTS      SYSTEM._L1238
                        MOVW      _ACCB, _ACCBLO
SYSTEM._L1238:
                        RJMP      SYSTEM._L1237
SYSTEM._L1236:
                        DEC       _ACCDHI
SYSTEM._L1237:
                        RET

SYSTEM.GETADC:
                        TST       _ACCA
                        BREQ      SYSTEM._L1239
                        CPI       _ACCA, 008h+1
                        BRSH      SYSTEM._L1239
                        DEC       _ACCA
                        LSL       _ACCA
                        CLR       _ACCB
                        LDI       _ACCCLO, _ADCBUFF AND 0FFh
                        LDI       _ACCCHI, _ADCBUFF SHRB 8
                        ADD       _ACCCLO, _ACCA
                        ADC       _ACCCHI, _ACCB
                        CLI
                        LD        _ACCB, Z+
                        LD        _ACCA, Z
                        SBRC      Flags, IntFlag
                        SEI
                        RET
SYSTEM._L1239:
                        CLR       _ACCB
                        CLR       _ACCA
                        RET

SYSTEM.SETADCFIXED:
                        CLI
                        LDS       _ACCB, _ADCBUFF +010h
                        LDD       _ACCA, Y+001h
                        TST       _ACCA
                        BRNE      SYSTEM._L1240
                        ANDI      _ACCB, 0FEh
                        RJMP      SYSTEM._L1241
SYSTEM._L1240:
                        ORI       _ACCB, 01h
                        LDD       _ACCA, Y+000h
                        TST       _ACCA
                        BREQ      SYSTEM._L1241
                        CPI       _ACCA, 008h+1
                        BRSH      SYSTEM._L1241
                        DEC       _ACCA
                        IN        _ACCCHI, admux
                        CBR       _ACCCHI, 7
                        OR        _ACCA, _ACCCHI
                        OUT       admux, _ACCA
SYSTEM._L1241:
                        STS       _ADCBUFF +010h, _ACCB
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
                        .SYM      ADAC.Vers1Str
ADAC.Vers1Str:
                        .BYTE     30
                        .ASCII    "1.742 [ADA by CM/c't 04/2007; "

                        .SYM      ADAC.Vers3Str
ADAC.Vers3Str:
                        .BYTE     8
                        .ASCII    "ADA 1.74"

                        .SYM      ADAC.AdrStr
ADAC.AdrStr:
                        .BYTE     4
                        .ASCII    "Adr "

                        .SYM      ADAC.CardsStr
ADAC.CardsStr:
                        .BYTE     8
                        .ASCII    "IO-Cards"

                        .SYM      ADAC.ValueStr
ADAC.ValueStr:
                        .BYTE     6
                        .ASCII    "Value "

                        .SYM      ADAC.EEnotProgrammedStr
ADAC.EEnotProgrammedStr:
                        .BYTE     14
                        .ASCII    "EEPROM EMPTY! "

                        .SYM      ADAC.DAC12str
ADAC.DAC12str:
                        .BYTE     5
                        .ASCII    "DA12 "

                        .SYM      ADAC.DAC16str
ADAC.DAC16str:
                        .BYTE     5
                        .ASCII    "DA16 "

                        .SYM      ADAC.ADC16str
ADAC.ADC16str:
                        .BYTE     5
                        .ASCII    "AD16 "

                        .SYM      ADAC.LCDstr
ADAC.LCDstr:
                        .BYTE     4
                        .ASCII    "LCD "

                        .SYM      ADAC.IO816str
ADAC.IO816str:
                        .BYTE     5
                        .ASCII    "IO32 "

                        .SYM      ADAC.EggStr
ADAC.EggStr:
                        .BYTE     32
                        .ASCII    "28.5 [Michaela, ich liebe dich!]"

$St_String13:
                        .BYTE     3
                        .ASCII    "0.0"

$St_String14:
                        .BYTE     1
                        .ASCII    "+"

$St_String15:
                        .BYTE     0


                        ; ============ array-constant tables ============
                        .SYM      ADAC.ErrStrArr
ADAC.ErrStrArr:
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


                        .SYM      ADAC.CmdStrArr
ADAC.CmdStrArr:
                        .BYTE     3
                        .ASCII    "TRG"

                        .BYTE     3
                        .ASCII    "STR"

                        .BYTE     3
                        .ASCII    "IDN"

                        .BYTE     3
                        .ASCII    "VAL"

                        .BYTE     3
                        .ASCII    "OFS"

                        .BYTE     3
                        .ASCII    "SCL"

                        .BYTE     3
                        .ASCII    "RAW"

                        .BYTE     3
                        .ASCII    "PIO"

                        .BYTE     3
                        .ASCII    "DIR"

                        .BYTE     3
                        .ASCII    "DSP"

                        .BYTE     3
                        .ASCII    "ALL"

                        .BYTE     3
                        .ASCII    "OPT"

                        .BYTE     3
                        .ASCII    "TRM"

                        .BYTE     3
                        .ASCII    "TRT"

                        .BYTE     3
                        .ASCII    "TRL"

                        .BYTE     3
                        .ASCII    "ICB"

                        .BYTE     3
                        .ASCII    "ICW"

                        .BYTE     3
                        .ASCII    "ICS"

                        .BYTE     3
                        .ASCII    "ICT"

                        .BYTE     3
                        .ASCII    "ICA"

                        .BYTE     3
                        .ASCII    "REF"

                        .BYTE     3
                        .ASCII    "WEN"

                        .BYTE     3
                        .ASCII    "ERC"

                        .BYTE     3
                        .ASCII    "SBD"

                        .BYTE     3
                        .ASCII    "NOP"


                        .SYM      ADAC.Cmd2SubChArr
ADAC.Cmd2SubChArr:
                        .BYTE     0F9h
                        .BYTE     0FFh
                        .BYTE     0FEh
                        .BYTE     000h
                        .BYTE     064h
                        .BYTE     0C8h
                        .BYTE     032h
                        .BYTE     01Eh
                        .BYTE     028h
                        .BYTE     050h
                        .BYTE     05Fh
                        .BYTE     096h
                        .BYTE     0F0h
                        .BYTE     0F7h
                        .BYTE     0F8h
                        .BYTE     0E6h
                        .BYTE     0E7h
                        .BYTE     0E8h
                        .BYTE     0E9h
                        .BYTE     0EFh
                        .BYTE     0F6h
                        .BYTE     0FAh
                        .BYTE     0FBh
                        .BYTE     0FCh
                        .BYTE     000h


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
                        JMP       SYSTEM.$INTERRUPT_INT2
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
                        ; upto            = 00008h
                        ; and
                        ; from            = 00010h
                        ; upto            = 0001Fh
                        ;
                        ; Stackframe at   = ...0041Dh


                        ; ===== Current top of User Vars in Data is 0000Eh =====

                        ; ===== Current top of User Vars in IData is 00530h =====

                        ; ===== Current top of User Vars in EEprom is 00223h =====


                        ; ===== Imported Library Routines =====

                        ; Shift  right byte SHR8
                        ; Divide       byte DIV8
                        ; Multiply     word MUL16
                        ; Divide       word DIV16
                        ; Shift  right word SHR16
                        ; Higher int
                        ; Higher float
                        ; LongWord and LongInt types
                        ; Shift  right long SHR32
                        ; Convert to hex string HexStr
                        ; Convert byte to string
                        ; Convert int to string
                        ; Convert string to int
                        ; String compare
                        ; Copy partial String
                        ; Floating point type
                        ; float multiply
                        ; float divide
                        ; float add
                        ; float round
                        ; float float to int
                        ; float int to float
                        ; float float to string
                        ; float string to float
                        ; EEprom read
                        ; EEprom write

                        ; Pascal Statements : 967
                        ; Assembler Lines   : 31929
                        ; Optimizer removed : 794 lines = 1588Bytes

                        ; >> real SysTick (exact): 2.000 msec <<

;  Linker removed the following functions and procedures
;
;  Module/Unit             Function/Procedure
;  ------------------------------------------
;
