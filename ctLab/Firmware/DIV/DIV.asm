
                        .FILE     H:\PROJAVR\ADA-C DIV\DIV.pas

                        ; Compiled by E-LAB AVRco PASCAL Compiler Rev 4.67
                        ; Version     : Profi
                        ;
                        ; Licenced to : Demo Version
                        ;
                        ; (c)E-LAB Computers, Grombacherstr. 27  e-mail info@e-lab.de
                        ; D-74906 Bad Rappenau  Tel. 07268/9124-0 Fax. 07268/9124-24
                        ; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                        ; Source File : DIV.pas
                        ; Compiled    : 22. Juni 2008  18:46:11
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
COMPILEMONTH            .EQU    006h            ; const 
COMPILEDAY              .EQU    016h            ; const 
COMPILEHOUR             .EQU    012h            ; const 
COMPILEMINUTE           .EQU    02Eh            ; const 
PROJECTBUILD            .EQU    014h            ; const 
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
SYSTICK                 .EQU    00Ah            ; const 
PROCCLOCK               .EQU    0F42400h        ; const 
DECIMALSEP              .EQU    02Eh            ; const 
CPU_ID                  .EQU    1E9502h         ; const 
ROMconstPage            .EQU    0FFFFFFFFFFFFFFFFh          ; const 
STACKSIZE               .EQU    080h            ; const 
FRAMESIZE               .EQU    120h            ; const 
SERPORT                 .EQU    9600h           ; const 
_ADCBUFF                .EQU    109h            ; var iData  word
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
_TXINP                  .EQU    0E6h            ; var iData  byte
_TXOUTP                 .EQU    0E7h            ; var iData  byte
_TXCOUNT                .EQU    0E8h            ; var iData  byte
_TXBUFF                 .EQU    0E9h            ; var iData  byte
TWI_BR100               .EQU    048h            ; const 
TWI_BR400               .EQU    00Ch            ; const 
SysTickTime             .EQU    061h            ; var iData  byte
_INCRSTATE4             .EQU    110h            ; var iData  byte
_INCRCOUNT4_0           .EQU    111h            ; var iData  integer
_INCRCOUNT4_D0          .EQU    113h            ; var iData  integer
_TWI_TO                 .EQU    115h            ; var iData  byte
TWI_DevLock             .EQU    116h            ; var iData  DeviceLock
EEPROM                  .EQU    000h            ; var EEprom array



                        .RESET     000000h
                        .ORG       0, CODE_START
                        .STARTCODE 000054h

                        .UNIT     DIV

                        .XDATASTART -1


                        ; ============ user definitions module: DIV ============

DIV.DDRAinit            .EQU    0E0h            ; const byte     224
DIV.PortAinit           .EQU    003h            ; const byte     3
DIV.DDRBinit            .EQU    090h            ; const byte     144
DIV.PortBinit           .EQU    091h            ; const byte     145
DIV.DDRCinit            .EQU    0FCh            ; const byte     252
DIV.PortCinit           .EQU    003h            ; const byte     3
DIV.DDRDinit            .EQU    01Ch            ; const byte     28
DIV.PortDinit           .EQU    0FCh            ; const byte     252
DIV.BtnInPortReg        .EQU    030h            ; const byte     48
DIV.LEDOutPort          .EQU    032h            ; const byte     50
DIV.ControlBitPort      .EQU    038h            ; const byte     56
DIV.b_SCLK              .EQU    007h            ; const byte     7
DIV.b_SDATAIN1          .EQU    006h            ; const byte     6
DIV.b_STRAD24           .EQU    004h            ; const byte     4
;Vers1Str                .EQU    '3.10 [DIV by CM/'; const String
;Vers3Str                .EQU    'DIV 3.10'; const String
;EEnotProgrammedStr      .EQU    'EEPROM EMPTY! '; const String
;NoOffsetStr             .EQU    'OFS init '; const String
;MemorizedStr            .EQU    'Memorizd'; const String
;ErrStrArr               .EQU    ; const Array
;FaultStrArr             .EQU    ; const Array
;AdrStr                  .EQU    'Adr '; const String
DIV.ErrSubCh            .EQU    0FFh            ; const byte     255
DIV.DC250mV             .EQU    000h            ; const byte     0
DIV.DC2V5               .EQU    001h            ; const byte     1
DIV.DC25V               .EQU    002h            ; const byte     2
DIV.DC250V              .EQU    003h            ; const byte     3
DIV.AC250mV             .EQU    004h            ; const byte     4
DIV.AC2V5               .EQU    005h            ; const byte     5
DIV.AC25V               .EQU    006h            ; const byte     6
DIV.AC250V              .EQU    007h            ; const byte     7
DIV.DC250uA             .EQU    008h            ; const byte     8
DIV.DC25mA              .EQU    009h            ; const byte     9
DIV.DC2A5               .EQU    00Ah            ; const byte     10
DIV.DC10A               .EQU    00Bh            ; const byte     11
DIV.AC250uA             .EQU    00Ch            ; const byte     12
DIV.AC25mA              .EQU    00Dh            ; const byte     13
DIV.AC2A5               .EQU    00Eh            ; const byte     14
DIV.AC10A               .EQU    00Fh            ; const byte     15
;RangeStrArr             .EQU    ; const Array
;DigitsArr               .EQU    ; const Array
;NachkommaArr            .EQU    ; const Array
;RangeArrPortA           .EQU    ; const Array
;RangeArrPortC           .EQU    ; const Array
;CmdStrArr               .EQU    ; const Array
;Cmd2SubChArr            .EQU    ; const Array
DIV.high                .EQU    0FFh            ; const boolean  true
DIV.low                 .EQU    000h            ; const boolean  false
DIV.dummy               .EQU    00000h          ; var EEprom integer
                        .SYM      dummy, 00000h, 04004h, 3
DIV.RangeArray24        .EQU    00002h          ; var EEprom array
                        .SYM      RangeArray24, 00002h, 04036h, 3
DIV.RangeArray10        .EQU    00042h          ; var EEprom array
                        .SYM      RangeArray10, 00042h, 04036h, 3
DIV.OffsetArray24       .EQU    00082h          ; var EEprom array
                        .SYM      OffsetArray24, 00082h, 04035h, 3
DIV.OffsetArray10       .EQU    000C2h          ; var EEprom array
                        .SYM      OffsetArray10, 000C2h, 04035h, 3
DIV.ScaleArray24        .EQU    00102h          ; var EEprom array
                        .SYM      ScaleArray24, 00102h, 04036h, 3
DIV.ScaleArray10        .EQU    00142h          ; var EEprom array
                        .SYM      ScaleArray10, 00142h, 04036h, 3
DIV.InitIncRast         .EQU    00182h          ; var EEprom integer
                        .SYM      InitIncRast, 00182h, 04004h, 3
DIV.InitLCDintegrate    .EQU    00184h          ; var EEprom byte
                        .SYM      InitLCDintegrate, 00184h, 0400Dh, 3
DIV.InitRange           .EQU    00185h          ; var EEprom byte
                        .SYM      InitRange, 00185h, 0400Dh, 3
DIV.TrigTimerValue      .EQU    00186h          ; var EEprom word
                        .SYM      TrigTimerValue, 00186h, 0400Eh, 3
DIV.TrigMask            .EQU    00188h          ; var EEprom byte
                        .SYM      TrigMask, 00188h, 0400Dh, 3
DIV.TrigLevel           .EQU    00189h          ; var EEprom byte
                        .SYM      TrigLevel, 00189h, 0400Dh, 3
DIV.EEinitialised       .EQU    0018Ah          ; var EEprom word
                        .SYM      EEinitialised, 0018Ah, 0400Eh, 3
DIV.OffsetInitialised   .EQU    0018Ch          ; var EEprom word
                        .SYM      OffsetInitialised, 0018Ch, 0400Eh, 3
                        .SYM      i, 00009h, 0000Dh, 3
DIV.i                   .EQU    009h            ; var Data   byte
                        .SYM      j, 0000Ah, 0000Dh, 3
DIV.j                   .EQU    00Ah            ; var Data   byte
                        .SYM      k, 0000Bh, 0000Dh, 3
DIV.k                   .EQU    00Bh            ; var Data   byte
                        .SYM      m, 0000Ch, 0000Dh, 3
DIV.m                   .EQU    00Ch            ; var Data   byte
                        .SYM      aWord, 00117h, 0000Eh, 3
DIV.aWord               .EQU    117h            ; var iData  word
                        .SYM      SlaveCh, 00119h, 0000Dh, 3
DIV.SlaveCh             .EQU    119h            ; var iData  byte
                        .SYM      ButtonTemp, 0011Ah, 0000Dh, 3
DIV.ButtonTemp          .EQU    11Ah            ; var iData  byte
                        .SYM      CmdWhich, 0011Bh, 0000Ah, 3
DIV.CmdWhich            .EQU    11Bh            ; var iData  enum
                        .SYM      SubCh, 0011Ch, 0000Dh, 3
DIV.SubCh               .EQU    11Ch            ; var iData  byte
                        .SYM      CurrentCh, 0011Dh, 0000Dh, 3
DIV.CurrentCh           .EQU    11Dh            ; var iData  byte
                        .SYM      ChangedFlag, 0011Eh, 00003h, 3
DIV.ChangedFlag         .EQU    11Eh            ; var iData  boolean
                        .SYM      OmniFlag, 0011Fh, 00003h, 3
DIV.OmniFlag            .EQU    11Fh            ; var iData  boolean
                        .SYM      verbose, 00120h, 00003h, 3
DIV.verbose             .EQU    120h            ; var iData  boolean
                        .SYM      Digits, 00121h, 0000Dh, 3
DIV.Digits              .EQU    121h            ; var iData  byte
                        .SYM      Nachkomma, 00122h, 0000Dh, 3
DIV.Nachkomma           .EQU    122h            ; var iData  byte
                        .SYM      Param, 00123h, 00006h, 3
DIV.Param               .EQU    123h            ; var iData  Float
                        .SYM      ParamLongInt, 00127h, 00005h, 3
DIV.ParamLongInt        .EQU    127h            ; var iData  longint
                        .SYM      Parambyte, 00127h, 0000Dh, 3
DIV.Parambyte           .EQU    127h            ; var iData  byte
DIV.SerInpStr           .EQU    12Bh            ; var iData  string
                        .SYM      SerInpStr, 0012Bh, 0303Ch, 3
                        .SYM      SerInpPtr, 0016Bh, 0000Dh, 3
DIV.SerInpPtr           .EQU    16Bh            ; var iData  byte
                        .SYM      AD24, 0016Ch, 00005h, 3
DIV.AD24                .EQU    16Ch            ; var iData  longint
                        .SYM      AD24temp, 00170h, 00005h, 3
DIV.AD24temp            .EQU    170h            ; var iData  longint
                        .SYM      AD24tempSI, 00174h, 00005h, 3
DIV.AD24tempSI          .EQU    174h            ; var iData  longint
                        .SYM      AD24tempFI, 00178h, 00005h, 3
DIV.AD24tempFI          .EQU    178h            ; var iData  longint
                        .SYM      AD24Integrate0, 0017Ch, 00005h, 3
DIV.AD24Integrate0      .EQU    17Ch            ; var iData  longint
                        .SYM      AD24Integrate1, 00180h, 00005h, 3
DIV.AD24Integrate1      .EQU    180h            ; var iData  longint
                        .SYM      AD24Integrate2, 00184h, 00005h, 3
DIV.AD24Integrate2      .EQU    184h            ; var iData  longint
                        .SYM      AD24Integrate3, 00188h, 00005h, 3
DIV.AD24Integrate3      .EQU    188h            ; var iData  longint
                        .SYM      AD24_0, 00170h, 0000Dh, 3
DIV.AD24_0              .EQU    170h            ; var iData  byte
                        .SYM      AD24_1, 00171h, 0000Dh, 3
DIV.AD24_1              .EQU    171h            ; var iData  byte
                        .SYM      AD24_2, 00172h, 0000Dh, 3
DIV.AD24_2              .EQU    172h            ; var iData  byte
                        .SYM      AD24_3, 00173h, 0000Dh, 3
DIV.AD24_3              .EQU    173h            ; var iData  byte
                        .SYM      AD24ready, 0018Ch, 00003h, 3
DIV.AD24ready           .EQU    18Ch            ; var iData  boolean
                        .SYM      AD10ready, 0018Dh, 00003h, 3
DIV.AD10ready           .EQU    18Dh            ; var iData  boolean
                        .SYM      AbortFlag, 0018Eh, 00003h, 3
DIV.AbortFlag           .EQU    18Eh            ; var iData  boolean
                        .SYM      AD10, 0018Fh, 00004h, 3
DIV.AD10                .EQU    18Fh            ; var iData  integer
                        .SYM      Range, 00191h, 0000Dh, 3
DIV.Range               .EQU    191h            ; var iData  byte
                        .SYM      OldRange, 00192h, 0000Dh, 3
DIV.OldRange            .EQU    192h            ; var iData  byte
                        .SYM      RangeTemp, 00193h, 0000Dh, 3
DIV.RangeTemp           .EQU    193h            ; var iData  byte
                        .SYM      AutoRangeMode, 00194h, 00003h, 3
DIV.AutoRangeMode       .EQU    194h            ; var iData  boolean
                        .SYM      OldRangeMode, 00195h, 00003h, 3
DIV.OldRangeMode        .EQU    195h            ; var iData  boolean
DIV.TrigTimer           .EQU    196h            ; var iData  word
                        .SYM      TrigTimer, 00196h, 0000Eh, 3
DIV.ActivityTimer       .EQU    198h            ; var iData  byte
                        .SYM      ActivityTimer, 00198h, 0000Dh, 3
DIV.IncrTimer           .EQU    199h            ; var iData  byte
                        .SYM      IncrTimer, 00199h, 0000Dh, 3
DIV.DisplayTimer        .EQU    19Ah            ; var iData  byte
                        .SYM      DisplayTimer, 0019Ah, 0000Dh, 3
DIV.TrigLEDtimer        .EQU    19Bh            ; var iData  byte
                        .SYM      TrigLEDtimer, 0019Bh, 0000Dh, 3
                        .SYM      LCDpresent, 0019Ch, 00003h, 3
DIV.LCDpresent          .EQU    19Ch            ; var iData  boolean
                        .SYM      LCDintegrate, 0019Dh, 0000Dh, 3
DIV.LCDintegrate        .EQU    19Dh            ; var iData  byte
                        .SYM      Trigger, 0019Eh, 00003h, 3
DIV.Trigger             .EQU    19Eh            ; var iData  boolean
                        .SYM      IncrValue, 0019Fh, 00004h, 3
DIV.IncrValue           .EQU    19Fh            ; var iData  integer
                        .SYM      OldIncrValue, 001A1h, 00004h, 3
DIV.OldIncrValue        .EQU    1A1h            ; var iData  integer
                        .SYM      IncrEnter, 001A3h, 00003h, 3
DIV.IncrEnter           .EQU    1A3h            ; var iData  boolean
                        .SYM      FirstTurn, 001A4h, 00003h, 3
DIV.FirstTurn           .EQU    1A4h            ; var iData  boolean
                        .SYM      IncrDiff, 001A5h, 00004h, 3
DIV.IncrDiff            .EQU    1A5h            ; var iData  integer
                        .SYM      IncRast, 001A7h, 00004h, 3
DIV.IncRast             .EQU    1A7h            ; var iData  integer
                        .SYM      IncrDiffByte, 001A9h, 0000Dh, 3
DIV.IncrDiffByte        .EQU    1A9h            ; var iData  byte
DIV.ParamStr            .EQU    1AAh            ; var iData  string
                        .SYM      ParamStr, 001AAh, 0303Ch, 3
                        .SYM      TrigMaskTemp, 001D3h, 0000Dh, 3
DIV.TrigMaskTemp        .EQU    1D3h            ; var iData  byte
                        .SYM      Status, 001D4h, 0000Dh, 3
DIV.Status              .EQU    1D4h            ; var iData  byte
                        .SYM      FaultFlags, 001D5h, 0000Dh, 3
DIV.FaultFlags          .EQU    1D5h            ; var iData  byte
                        .SYM      ButtonNumber, 001D6h, 0000Dh, 3
DIV.ButtonNumber        .EQU    1D6h            ; var iData  byte
                        .SYM      FaultTimerByte, 001D7h, 0000Dh, 3
DIV.FaultTimerByte      .EQU    1D7h            ; var iData  byte
                        .SYM      ErrCount, 001D8h, 00004h, 3
DIV.ErrCount            .EQU    1D8h            ; var iData  integer
                        .SYM      ErrFlag, 001DAh, 00003h, 3
DIV.ErrFlag             .EQU    1DAh            ; var iData  boolean
                        .SYM      NegativeFlag, 001DBh, 00003h, 3
DIV.NegativeFlag        .EQU    1DBh            ; var iData  boolean
                        .SYM      OverVoltFlag, 001DCh, 00003h, 3
DIV.OverVoltFlag        .EQU    1DCh            ; var iData  boolean
                        .SYM      CheckLimitErr, 001DDh, 0000Ah, 3
DIV.CheckLimitErr       .EQU    1DDh            ; var iData  enum
                        .FUNC     PatchCopyFromEE, 00199h, 00020h
DIV.PatchCopyFromEE:
                        SBIW      _FRAMEPTR, 2
                        .BLOCK    412
                        .LINE     413
                        LDI       _ACCCLO, DIV.InitIncRast AND 0FFh
                        LDI       _ACCCHI, DIV.InitIncRast SHRB 8
                        CALL      SYSTEM._ReadEEp16
                        STS       DIV.INCRAST, _ACCB
                        STS       DIV.INCRAST+1, _ACCA
                        .LINE     414
                        LDI       _ACCCLO, DIV.InitLCDintegrate AND 0FFh
                        LDI       _ACCCHI, DIV.InitLCDintegrate SHRB 8
                        CALL      SYSTEM.ReadEEp8
                        STS       DIV.LCDINTEGRATE, _ACCA
                        .LINE     415
                        LDI       _ACCCLO, DIV.InitRange AND 0FFh
                        LDI       _ACCCHI, DIV.InitRange SHRB 8
                        CALL      SYSTEM.ReadEEp8
                        STS       DIV.RANGE, _ACCA
                        .ENDBLOCK 416
DIV.PatchCopyFromEE_X:
                        .LINE     416
                        .BRANCH   19
                        RET
                        .ENDFUNC  416


                        .FILE     DIV-HW.pas
                        .FUNC     ShiftIn2400, 00002h, 00020h
DIV.ShiftIn2400:
                        .BLOCK    4
                        .LINE     5
                        CBI       00038h, 004h
                        .LINE     6
                        LDI       _ACCA, 000h
                        STS       DIV.AD24_3, _ACCA
                        .LINE     7
                        .LOOP
                        LDI       _ACCCLO, DIV.j AND 0FFh
                        LDI       _ACCCHI, DIV.j SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 000h
                        ST        Z, _ACCA
                        LDI       _ACCA, 003h
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
DIV._L0002:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      DIV._L0003
                        CLR       _ACCA
DIV._L0003:
                        TST       _ACCA
                        .BRANCH   3,DIV._L0004
                        BREQ      DIV._L0004
                        .BRANCH   20,DIV._L0001
                        JMP       DIV._L0001
DIV._L0004:
                        .BLOCK    8
                        .LINE     8
                        SBI       00038h, 007h
                        .LINE     9
                        MOV       _ACCA, DIV.j
                        CPI       _ACCA, 002h
                        LDI       _ACCA, 0h
                        BRNE      DIV._L0005
                        SER       _ACCA
DIV._L0005:
                        TST       _ACCA
                        .BRANCH   4,DIV._L0008
                        BRNE      DIV._L0008
                        .BRANCH   20,DIV._L0006
                        JMP       DIV._L0006
DIV._L0008:
                        .BLOCK    9
                        .LINE     10
                        CLR       _ACCA
                        SBIC      036h, 006h
                        SER       _ACCA
                        COM       _ACCA
                        STS       DIV.NEGATIVEFLAG, _ACCA
                        .ENDBLOCK 11
DIV._L0006:
DIV._L0007:
                        .LINE     12
                        MOV       _ACCA, DIV.j
                        CPI       _ACCA, 003h
                        LDI       _ACCA, 0h
                        BRNE      DIV._L0009
                        SER       _ACCA
DIV._L0009:
                        TST       _ACCA
                        .BRANCH   4,DIV._L0012
                        BRNE      DIV._L0012
                        .BRANCH   20,DIV._L0010
                        JMP       DIV._L0010
DIV._L0012:
                        .BLOCK    12
                        .LINE     13
                        CLR       _ACCA
                        SBIC      036h, 006h
                        SER       _ACCA
                        STS       DIV.OVERVOLTFLAG, _ACCA
                        .ENDBLOCK 14
DIV._L0010:
DIV._L0011:
                        .LINE     15
                        CBI       00038h, 007h
                        .ENDBLOCK 16
DIV._L0000:
                        .LINE     16
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,DIV._L0001
                        BREQ      DIV._L0001
                        .BRANCH   20,DIV._L0002
                        JMP       DIV._L0002
DIV._L0001:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .ASM
                        .LINE     18
                        ldi _ACCA, 01010001b ; SPI Einschaltwert in _ACCA vorladen
                        .LINE     19
                        out SPCR, _ACCA      ; SPI einschalten
                        .LINE     21
                        out SPDR, _ACCA      ; SPI Start mit Schreibvorgang, gleichzeitig MSB lesen
                        SPIWait24_2:
                        .LINE     23
                        in _ACCA, SPSR
                        .LINE     24
                        sbrs _ACCA,7         ; Ende SPIF?
                        .LINE     25
                        rjmp SPIWait24_2     ; auf Ende des SPI-Transfer warten
                        .LINE     26
                        in  _ACCA, SPDR
                        .LINE     27
                        sts DIV.AD24_2, _ACCA
                        .LINE     29
                        out SPDR, _ACCA      ; SPI Start mit Schreibvorgang
                        SPIWait24_1:
                        .LINE     31
                        in _ACCA, SPSR
                        .LINE     32
                        sbrs _ACCA,7         ; SPIF?
                        .LINE     33
                        rjmp SPIWait24_1     ; auf Ende des SPI-Transfer warten
                        .LINE     34
                        in  _ACCA, SPDR
                        .LINE     35
                        sts DIV.AD24_1, _ACCA
                        .LINE     37
                        out SPDR, _ACCA      ; SPI Start mit Schreibvorgang
                        SPIWait24_0:
                        .LINE     39
                        in  _ACCA, SPSR
                        .LINE     40
                        sbrs _ACCA,7         ; SPIF?
                        .LINE     41
                        rjmp SPIWait24_0     ; auf Ende des SPI-Transfer warten
                        .LINE     42
                        in  _ACCA, SPDR
                        .LINE     43
                        sts DIV.AD24_0, _ACCA
                        .LINE     45
                        ldi _ACCA, 0
                        .LINE     46
                        out SPCR, _ACCA      ; SPI ausschalten
                        .LINE     48
                        ldi _ACCB, 4         ; vier restliche Dither-Bits (Dummys)
                        Trailing_AD24:
                        .LINE     50
                        nop
                        .LINE     51
                        sbi DIV.ControlBitPort, DIV.b_SCLK
                        .LINE     52
                        nop
                        .LINE     53
                        dec _ACCB
                        .LINE     54
                        cbi DIV.ControlBitPort, DIV.b_SCLK
                        .LINE     55
                        brne  Trailing_AD24;
                        .endasm
                        .LINE     59
                        LDS       _ACCA, DIV.NegativeFlag
                        TST       _ACCA
                        .BRANCH   4,DIV._L0015
                        BRNE      DIV._L0015
                        .BRANCH   20,DIV._L0013
                        JMP       DIV._L0013
DIV._L0015:
                        .BLOCK    61
                        .LINE     61
                        LDI       _ACCA, 000h
                        STS       DIV.OVERVOLTFLAG, _ACCA
                        .LINE     62
                        LDI       _ACCA, 0FFh
                        STS       DIV.AD24_3, _ACCA
                        .ENDBLOCK 63
                        .BRANCH   20,DIV._L0014
                        JMP       DIV._L0014
DIV._L0013:
                        .BLOCK    63
                        .LINE     64
                        LDI       _ACCA, 000h
                        STS       DIV.AD24_3, _ACCA
                        .ENDBLOCK 65
DIV._L0014:
                        .LINE     66
                        LDS       _ACCA, DIV.OverVoltFlag
                        TST       _ACCA
                        .BRANCH   4,DIV._L0018
                        BRNE      DIV._L0018
                        .BRANCH   20,DIV._L0016
                        JMP       DIV._L0016
DIV._L0018:
                        .BLOCK    67
                        .LINE     67
                        LDI       _ACCB, 000FFFFFFh AND 0FFh
                        LDI       _ACCA, 000FFFFFFh SHRB 8
                        LDI       _ACCALO, 000FFFFFFh SHRB 16
                        LDI       _ACCAHI, 000FFFFFFh SHRB 24
                        STS       DIV.AD24TEMP, _ACCB
                        STS       DIV.AD24TEMP+1, _ACCA
                        STS       DIV.AD24TEMP+2, _ACCALO
                        STS       DIV.AD24TEMP+3, _ACCAHI
                        .ENDBLOCK 68
DIV._L0016:
DIV._L0017:
                        .LINE     69
                        SBI       00038h, 004h
                        .ENDBLOCK 70
DIV.ShiftIn2400_X:
                        .LINE     70
                        .BRANCH   19
                        RET
                        .ENDFUNC  70

                        .FUNC     INTERRUPT_Int2, 00049h, 00020h
DIV.INTERRUPT_Int2:
                        CLT
                        BLD       Flags, IntFlag
                        .BLOCK    74
                        .LINE     75
                        LDI       _ACCA, 0FFh
                        STS       DIV.TRIGGER, _ACCA
                        .ENDBLOCK 76
DIV.INTERRUPT_Int2_X:
                        .LINE     76
                        SET
                        BLD       Flags, IntFlag
                        .BRANCH   19
                        RET
                        .ENDFUNC  76

                        .FUNC     OnSysTick, 0004Eh, 00020h
DIV.OnSysTick:
                        .BLOCK    80
                        .LINE     81
                        CBI       00038h, 007h
                        .LINE     82
                        CBI       00038h, 004h
                        .LINE     83
                        LDS       _ACCA, DIV.AbortFlag
                        TST       _ACCA
                        .BRANCH   4,DIV._L0021
                        BRNE      DIV._L0021
                        .BRANCH   20,DIV._L0019
                        JMP       DIV._L0019
DIV._L0021:
                        .BLOCK    83
                        .LINE     84
                        CBI       00038h, 004h
                        .LINE     85
                        NOP
                        .LINE     86
                        NOP
                        .LINE     87
                        SBI       00038h, 007h
                        .LINE     88
                        NOP
                        .LINE     89
                        NOP
                        .LINE     90
                        CBI       00038h, 007h
                        .LINE     91
                        LDI       _ACCA, 000h
                        STS       DIV.ABORTFLAG, _ACCA
                        .ENDBLOCK 92
                        .BRANCH   20,DIV._L0020
                        JMP       DIV._L0020
DIV._L0019:
                        .BLOCK    92
                        .LINE     93
                        CLR       _ACCA
                        SBIC      036h, 006h
                        SER       _ACCA
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BRNE      DIV._L0022
                        SER       _ACCA
DIV._L0022:
                        TST       _ACCA
                        .BRANCH   4,DIV._L0025
                        BRNE      DIV._L0025
                        .BRANCH   20,DIV._L0023
                        JMP       DIV._L0023
DIV._L0025:
                        .BLOCK    94
                        .LINE     94
                        SBI       00038h, 004h
                        .LINE     95
                        .BRANCH   17,DIV.SHIFTIN2400
                        CALL      DIV.SHIFTIN2400
                        .LINE     97
                        LDS       _ACCB, DIV.AD24temp
                        LDS       _ACCA, DIV.AD24temp+1
                        LDS       _ACCALO, DIV.AD24temp+2
                        LDS       _ACCAHI, DIV.AD24temp+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DIV.AD24Integrate0
                        LDS       _ACCA, DIV.AD24Integrate0+1
                        LDS       _ACCALO, DIV.AD24Integrate0+2
                        LDS       _ACCAHI, DIV.AD24Integrate0+3
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        ADD       _ACCB, _ACCBLO
                        ADC       _ACCA, _ACCBHI
                        ADC       _ACCALO, _ACCCLO
                        ADC       _ACCAHI, _ACCCHI
                        TST       _ACCAHI
                        BRPL      DIV._L0026
                        SUBI      _ACCB, 0FFh
                        SBCI      _ACCA, 0FFh
                        SBCI      _ACCALO, 0FFh
                        SBCI      _ACCAHI, 0FFh
DIV._L0026:
                        ASR       _ACCAHI
                        ROR       _ACCALO
                        ROR       _ACCA
                        ROR       _ACCB
                        STS       DIV.AD24TEMPFI, _ACCB
                        STS       DIV.AD24TEMPFI+1, _ACCA
                        STS       DIV.AD24TEMPFI+2, _ACCALO
                        STS       DIV.AD24TEMPFI+3, _ACCAHI
                        .LINE     98
                        LDS       _ACCB, DIV.AD24tempFI
                        LDS       _ACCA, DIV.AD24tempFI+1
                        LDS       _ACCALO, DIV.AD24tempFI+2
                        LDS       _ACCAHI, DIV.AD24tempFI+3
                        STS       DIV.AD24INTEGRATE0, _ACCB
                        STS       DIV.AD24INTEGRATE0+1, _ACCA
                        STS       DIV.AD24INTEGRATE0+2, _ACCALO
                        STS       DIV.AD24INTEGRATE0+3, _ACCAHI
                        .LINE     100
                        LDS       _ACCB, DIV.AD24temp
                        LDS       _ACCA, DIV.AD24temp+1
                        LDS       _ACCALO, DIV.AD24temp+2
                        LDS       _ACCAHI, DIV.AD24temp+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DIV.AD24Integrate1
                        LDS       _ACCA, DIV.AD24Integrate1+1
                        LDS       _ACCALO, DIV.AD24Integrate1+2
                        LDS       _ACCAHI, DIV.AD24Integrate1+3
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        ADD       _ACCB, _ACCBLO
                        ADC       _ACCA, _ACCBHI
                        ADC       _ACCALO, _ACCCLO
                        ADC       _ACCAHI, _ACCCHI
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DIV.AD24Integrate2
                        LDS       _ACCA, DIV.AD24Integrate2+1
                        LDS       _ACCALO, DIV.AD24Integrate2+2
                        LDS       _ACCAHI, DIV.AD24Integrate2+3
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        ADD       _ACCB, _ACCBLO
                        ADC       _ACCA, _ACCBHI
                        ADC       _ACCALO, _ACCCLO
                        ADC       _ACCAHI, _ACCCHI
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, DIV.AD24Integrate3
                        LDS       _ACCA, DIV.AD24Integrate3+1
                        LDS       _ACCALO, DIV.AD24Integrate3+2
                        LDS       _ACCAHI, DIV.AD24Integrate3+3
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        ADD       _ACCB, _ACCBLO
                        ADC       _ACCA, _ACCBHI
                        ADC       _ACCALO, _ACCCLO
                        ADC       _ACCAHI, _ACCCHI
                        MOVW      _ACCDLO, _ACCB
                        MOVW      _ACCELO, _ACCALO
                        LDI       _ACCBLO, 000000004h AND 0FFh
                        LDI       _ACCBHI, 000000004h SHRB 8
                        LDI       _ACCCLO, 000000004h SHRB 16
                        LDI       _ACCCHI, 000000004h SHRB 24
                        SET
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.DIV32_R
                        STS       DIV.AD24TEMPSI, _ACCB
                        STS       DIV.AD24TEMPSI+1, _ACCA
                        STS       DIV.AD24TEMPSI+2, _ACCALO
                        STS       DIV.AD24TEMPSI+3, _ACCAHI
                        .LINE     101
                        LDS       _ACCB, DIV.AD24Integrate2
                        LDS       _ACCA, DIV.AD24Integrate2+1
                        LDS       _ACCALO, DIV.AD24Integrate2+2
                        LDS       _ACCAHI, DIV.AD24Integrate2+3
                        STS       DIV.AD24INTEGRATE3, _ACCB
                        STS       DIV.AD24INTEGRATE3+1, _ACCA
                        STS       DIV.AD24INTEGRATE3+2, _ACCALO
                        STS       DIV.AD24INTEGRATE3+3, _ACCAHI
                        .LINE     102
                        LDS       _ACCB, DIV.AD24Integrate1
                        LDS       _ACCA, DIV.AD24Integrate1+1
                        LDS       _ACCALO, DIV.AD24Integrate1+2
                        LDS       _ACCAHI, DIV.AD24Integrate1+3
                        STS       DIV.AD24INTEGRATE2, _ACCB
                        STS       DIV.AD24INTEGRATE2+1, _ACCA
                        STS       DIV.AD24INTEGRATE2+2, _ACCALO
                        STS       DIV.AD24INTEGRATE2+3, _ACCAHI
                        .LINE     103
                        LDS       _ACCB, DIV.AD24tempSI
                        LDS       _ACCA, DIV.AD24tempSI+1
                        LDS       _ACCALO, DIV.AD24tempSI+2
                        LDS       _ACCAHI, DIV.AD24tempSI+3
                        STS       DIV.AD24INTEGRATE1, _ACCB
                        STS       DIV.AD24INTEGRATE1+1, _ACCA
                        STS       DIV.AD24INTEGRATE1+2, _ACCALO
                        STS       DIV.AD24INTEGRATE1+3, _ACCAHI
                        .LINE     105
                        LDI       _ACCA, 0FFh
                        STS       DIV.AD24READY, _ACCA
                        .ENDBLOCK 106
DIV._L0023:
DIV._L0024:
                        .ENDBLOCK 107
DIV._L0020:
                        .LINE     108
                        SBI       00038h, 004h
                        .LINE     109
                        LDI       _ACCA, 0FFh
                        STS       DIV.AD10READY, _ACCA
                        .ENDBLOCK 110
DIV.OnSysTick_X:
                        .LINE     110
                        .BRANCH   19
                        RET
                        .ENDFUNC  110


                        .FILE     H:\PROJAVR\ADA-C DIV\DIV.pas
                        .FUNC     isACrange, 001A7h, 00020h
DIV.isACrange:
                        .BLOCK    425
                        .LINE     426
                        LDS       _ACCA, DIV.Range
                        CPI       _ACCA, 007h
                        .BRANCH   3,DIV._L0027
                        BREQ      DIV._L0027
                        .BRANCH   1,DIV._L0028
                        BRSH      DIV._L0028
                        CPI       _ACCA, 004h
                        .BRANCH   1,DIV._L0028
                        BRLO      DIV._L0028
                        CLR       _ACCDLO
                        .BRANCH   20,DIV._L0027
                        RJMP      DIV._L0027
DIV._L0028:
                        LDI       _ACCDLO, 001h
                        CPI       _ACCA, 00Fh
                        .BRANCH   3,DIV._L0027
                        BREQ      DIV._L0027
                        .BRANCH   1,DIV._L0029
                        BRSH      DIV._L0029
                        CPI       _ACCA, 00Ch
                        .BRANCH   1,DIV._L0029
                        BRLO      DIV._L0029
                        CLR       _ACCDLO
                        .BRANCH   20,DIV._L0027
                        RJMP      DIV._L0027
DIV._L0029:
                        LDI       _ACCDLO, 001h
DIV._L0027:
                        LDI       _ACCA, 0h
                        BRNE      DIV._L0030
                        SER       _ACCA
DIV._L0030:
                        TST       _ACCA
                        .BRANCH   4,DIV._L0033
                        BRNE      DIV._L0033
                        .BRANCH   20,DIV._L0031
                        JMP       DIV._L0031
DIV._L0033:
                        .BLOCK    426
                        .LINE     427
                        LDI       _ACCA, 0FFh
                        .BRANCH   20,DIV.isACrange_X
                        JMP       DIV.isACrange_X
                        .ENDBLOCK 428
                        .BRANCH   20,DIV._L0032
                        JMP       DIV._L0032
DIV._L0031:
                        .BLOCK    428
                        .LINE     429
                        LDI       _ACCA, 000h
                        .BRANCH   20,DIV.isACrange_X
                        JMP       DIV.isACrange_X
                        .ENDBLOCK 430
DIV._L0032:
                        .ENDBLOCK 431
DIV.isACrange_X:
                        .LINE     431
                        .BRANCH   19
                        RET
                        .ENDFUNC  431

                        .FUNC     ParamScale10, 001B2h, 00020h
DIV.ParamScale10:
                        .BLOCK    436
                        .LINE     437
                        LDS       _ACCA, DIV.Range
                        MOV       DIV.M, _ACCA
                        .LINE     438
                        LDS       _ACCB, DIV.AD10
                        LDS       _ACCA, DIV.AD10+1
                        SBRS      _ACCA, 7
                        RJMP      DIV._L0034
                        LDI       _ACCAHI, 0FFh
                        LDI       _ACCALO, 0FFh
                        RJMP      DIV._L0035
DIV._L0034:
                        CLR       _ACCAHI
                        CLR       _ACCALO
DIV._L0035:
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, DIV.OffsetArray10 AND 0FFh
                        LDI       _ACCCHI, DIV.OffsetArray10 SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        MOV       _ACCA, DIV.m
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
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        ADD       _ACCB, _ACCBLO
                        ADC       _ACCA, _ACCBHI
                        ADC       _ACCALO, _ACCCLO
                        ADC       _ACCAHI, _ACCCHI
                        CLT
                        BLD       Flags, _ERRFLAG
                        SET
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.LIntToFloat
                        STS       DIV.PARAM, _ACCB
                        STS       DIV.PARAM+1, _ACCA
                        STS       DIV.PARAM+2, _ACCALO
                        STS       DIV.PARAM+3, _ACCAHI
                        .LINE     440
                        LDS       _ACCB, DIV.Param
                        LDS       _ACCA, DIV.Param+1
                        LDS       _ACCALO, DIV.Param+2
                        LDS       _ACCAHI, DIV.Param+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, DIV.RangeArray10 AND 0FFh
                        LDI       _ACCCHI, DIV.RangeArray10 SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        MOV       _ACCA, DIV.m
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
                        LDI       _ACCCLO, DIV.ScaleArray10 AND 0FFh
                        LDI       _ACCCHI, DIV.ScaleArray10 SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        MOV       _ACCA, DIV.m
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
                        STS       DIV.PARAM, _ACCB
                        STS       DIV.PARAM+1, _ACCA
                        STS       DIV.PARAM+2, _ACCALO
                        STS       DIV.PARAM+3, _ACCAHI
                        .LINE     441
                        .BRANCH   17,DIV.ISACRANGE
                        CALL       DIV.ISACRANGE
                        TST       _ACCA
                        .BRANCH   4,DIV._L0038
                        BRNE      DIV._L0038
                        .BRANCH   20,DIV._L0036
                        JMP       DIV._L0036
DIV._L0038:
                        .BLOCK    441
                        .LINE     442
                        LDS       _ACCB, DIV.Param
                        LDS       _ACCA, DIV.Param+1
                        LDS       _ACCALO, DIV.Param+2
                        LDS       _ACCAHI, DIV.Param+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CBR       _ACCAHI, 080h
                        STS       DIV.PARAM, _ACCB
                        STS       DIV.PARAM+1, _ACCA
                        STS       DIV.PARAM+2, _ACCALO
                        STS       DIV.PARAM+3, _ACCAHI
                        .ENDBLOCK 443
DIV._L0036:
DIV._L0037:
                        .ENDBLOCK 444
DIV.ParamScale10_X:
                        .LINE     444
                        .BRANCH   19
                        RET
                        .ENDFUNC  444

                        .FUNC     ParamScale24, 001BEh, 00020h
DIV.ParamScale24:
                        .BLOCK    448
                        .LINE     449
                        LDS       _ACCA, DIV.Range
                        MOV       DIV.M, _ACCA
                        .LINE     450
                        LDS       _ACCB, DIV.AD24
                        LDS       _ACCA, DIV.AD24+1
                        LDS       _ACCALO, DIV.AD24+2
                        LDS       _ACCAHI, DIV.AD24+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, DIV.OffsetArray24 AND 0FFh
                        LDI       _ACCCHI, DIV.OffsetArray24 SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        MOV       _ACCA, DIV.m
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
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        ADD       _ACCB, _ACCBLO
                        ADC       _ACCA, _ACCBHI
                        ADC       _ACCALO, _ACCCLO
                        ADC       _ACCAHI, _ACCCHI
                        CLT
                        BLD       Flags, _ERRFLAG
                        SET
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.LIntToFloat
                        STS       DIV.PARAM, _ACCB
                        STS       DIV.PARAM+1, _ACCA
                        STS       DIV.PARAM+2, _ACCALO
                        STS       DIV.PARAM+3, _ACCAHI
                        .LINE     452
                        LDS       _ACCB, DIV.Param
                        LDS       _ACCA, DIV.Param+1
                        LDS       _ACCALO, DIV.Param+2
                        LDS       _ACCAHI, DIV.Param+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDI       _ACCCLO, DIV.RangeArray24 AND 0FFh
                        LDI       _ACCCHI, DIV.RangeArray24 SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        MOV       _ACCA, DIV.m
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
                        LDI       _ACCCLO, DIV.ScaleArray24 AND 0FFh
                        LDI       _ACCCHI, DIV.ScaleArray24 SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        MOV       _ACCA, DIV.m
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
                        STS       DIV.PARAM, _ACCB
                        STS       DIV.PARAM+1, _ACCA
                        STS       DIV.PARAM+2, _ACCALO
                        STS       DIV.PARAM+3, _ACCAHI
                        .LINE     453
                        .BRANCH   17,DIV.ISACRANGE
                        CALL       DIV.ISACRANGE
                        TST       _ACCA
                        .BRANCH   4,DIV._L0041
                        BRNE      DIV._L0041
                        .BRANCH   20,DIV._L0039
                        JMP       DIV._L0039
DIV._L0041:
                        .BLOCK    453
                        .LINE     454
                        LDS       _ACCB, DIV.Param
                        LDS       _ACCA, DIV.Param+1
                        LDS       _ACCALO, DIV.Param+2
                        LDS       _ACCAHI, DIV.Param+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CBR       _ACCAHI, 080h
                        STS       DIV.PARAM, _ACCB
                        STS       DIV.PARAM+1, _ACCA
                        STS       DIV.PARAM+2, _ACCALO
                        STS       DIV.PARAM+3, _ACCAHI
                        .ENDBLOCK 455
DIV._L0039:
DIV._L0040:
                        .ENDBLOCK 456
DIV.ParamScale24_X:
                        .LINE     456
                        .BRANCH   19
                        RET
                        .ENDFUNC  456

                        .FUNC     GetAD10, 001CAh, 00020h
DIV.GetAD10:
                        SBIW      _FRAMEPTR, 2
                        .BLOCK    460
                        .LINE     461
                        LDS       _ACCA, 001D5h
                        CBR       _ACCA, 002h
                        STS       001D5h, _ACCA
                        .LINE     462
                        LDS       _ACCA, 001D5h
                        CBR       _ACCA, 001h
                        STS       001D5h, _ACCA
                        .LINE     463
                        LDD       _ACCA, Y+002h
                        CPI       _ACCA, 005h
                        LDI       _ACCA, 0h
                        BRNE      DIV._L0042
                        SER       _ACCA
DIV._L0042:
                        TST       _ACCA
                        .BRANCH   4,DIV._L0045
                        BRNE      DIV._L0045
                        .BRANCH   20,DIV._L0043
                        JMP       DIV._L0043
DIV._L0045:
                        .BLOCK    464
                        .LINE     464
                        LDD       _ACCA, Y+002h
                        .FRAME  0
                        CALL       SYSTEM.GETADC
                        STS       DIV.AD10, _ACCB
                        STS       DIV.AD10+1, _ACCA
                        .LINE     465
                        LDS       _ACCB, DIV.AD10
                        LDS       _ACCA, DIV.AD10+1
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        CPI       _ACCA, 083h
                        BRNE      DIV._L0046
                        CPI       _ACCB, 0FEh
DIV._L0046:
                        LDI       _ACCA, 0
                        BRLO      DIV._L0047
                        LDI       _ACCA, 0FFh
DIV._L0047:
                        TST       _ACCA
                        .BRANCH   4,DIV._L0050
                        BRNE      DIV._L0050
                        .BRANCH   20,DIV._L0048
                        JMP       DIV._L0048
DIV._L0050:
                        .BLOCK    465
                        .LINE     466
                        LDS       _ACCA, 001D5h
                        SBR       _ACCA, 002h
                        STS       001D5h, _ACCA
                        .ENDBLOCK 467
DIV._L0048:
DIV._L0049:
                        .LINE     468
                        LDS       _ACCB, DIV.AD10
                        LDS       _ACCA, DIV.AD10+1
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        CPI       _ACCA, 080h
                        BRNE      DIV._L0051
                        CPI       _ACCB, 000h
DIV._L0051:
                        LDI       _ACCA, 0h
                        BRNE      DIV._L0052
                        SER       _ACCA
DIV._L0052:
                        TST       _ACCA
                        .BRANCH   4,DIV._L0055
                        BRNE      DIV._L0055
                        .BRANCH   20,DIV._L0053
                        JMP       DIV._L0053
DIV._L0055:
                        .BLOCK    468
                        .LINE     469
                        LDS       _ACCA, 001D5h
                        SBR       _ACCA, 001h
                        STS       001D5h, _ACCA
                        .ENDBLOCK 470
DIV._L0053:
DIV._L0054:
                        .LINE     471
                        LDS       _ACCB, DIV.AD10
                        LDS       _ACCA, DIV.AD10+1
                        SUBI      _ACCB, 00200h AND 0FFh
                        SBCI      _ACCA, 00200h SHRB 8
                        STS       DIV.AD10, _ACCB
                        STS       DIV.AD10+1, _ACCA
                        .ENDBLOCK 472
                        .BRANCH   20,DIV._L0044
                        JMP       DIV._L0044
DIV._L0043:
                        .BLOCK    472
                        .LINE     473
                        LDD       _ACCA, Y+002h
                        .FRAME  0
                        CALL       SYSTEM.GETADC
                        STS       DIV.AD10, _ACCB
                        STS       DIV.AD10+1, _ACCA
                        .LINE     474
                        LDS       _ACCB, DIV.AD10
                        LDS       _ACCA, DIV.AD10+1
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        CPI       _ACCA, 083h
                        BRNE      DIV._L0056
                        CPI       _ACCB, 0FEh
DIV._L0056:
                        LDI       _ACCA, 0
                        BRLO      DIV._L0057
                        LDI       _ACCA, 0FFh
DIV._L0057:
                        TST       _ACCA
                        .BRANCH   4,DIV._L0060
                        BRNE      DIV._L0060
                        .BRANCH   20,DIV._L0058
                        JMP       DIV._L0058
DIV._L0060:
                        .BLOCK    474
                        .LINE     475
                        LDS       _ACCA, 001D5h
                        SBR       _ACCA, 002h
                        STS       001D5h, _ACCA
                        .ENDBLOCK 476
DIV._L0058:
DIV._L0059:
                        .ENDBLOCK 477
DIV._L0044:
                        .LINE     478
                        LDS       _ACCB, 001D5h
                        CLR       _ACCA
                        SBRC      _ACCB, 001h
                        SER       _ACCA
                        PUSH      _ACCA
                        LDS       _ACCB, 001D5h
                        CLR       _ACCA
                        SBRC      _ACCB, 000h
                        SER       _ACCA
                        POP       _ACCB
                        OR        _ACCA, _ACCB
                        CLT
                        TST       _ACCA
                        BREQ      DIV._L0061
                        SET
DIV._L0061:
                        LDS       _ACCA, 001D4h
                        BLD       _ACCA, 005h
                        STS       001D4h, _ACCA
                        .ENDBLOCK 479
DIV.GetAD10_X:
                        .LINE     479
                        .BRANCH   19
                        RET
                        .ENDFUNC  479

                        .FUNC     GetAD24, 001E1h, 00020h
DIV.GetAD24:
                        SBIW      _FRAMEPTR, 4
                        .BLOCK    484
                        .LINE     485
                        CLI
                        LDI       _ACCA, 0FEH ROLB IntFlag
                        AND       Flags, _ACCA
                        .LINE     486
                        LDS       _ACCA, DIV.OverVoltFlag
                        CLT
                        TST       _ACCA
                        BREQ      DIV._L0062
                        SET
DIV._L0062:
                        LDS       _ACCA, 001D5h
                        BLD       _ACCA, 001h
                        STS       001D5h, _ACCA
                        .LINE     487
                        LDS       _ACCA, DIV.NegativeFlag
                        CLT
                        TST       _ACCA
                        BREQ      DIV._L0063
                        SET
DIV._L0063:
                        LDS       _ACCA, 001D5h
                        BLD       _ACCA, 000h
                        STS       001D5h, _ACCA
                        .LINE     488
                        LDS       _ACCB, 001D5h
                        CLR       _ACCA
                        SBRC      _ACCB, 001h
                        SER       _ACCA
                        PUSH      _ACCA
                        LDS       _ACCB, 001D5h
                        CLR       _ACCA
                        SBRC      _ACCB, 000h
                        SER       _ACCA
                        POP       _ACCB
                        OR        _ACCA, _ACCB
                        CLT
                        TST       _ACCA
                        BREQ      DIV._L0064
                        SET
DIV._L0064:
                        LDS       _ACCA, 001D4h
                        BLD       _ACCA, 005h
                        STS       001D4h, _ACCA
                        .LINE     489
                        LDD       _ACCA, Y+004h
                        .LINE     490
                        CPI       _ACCA, 1
                        .BRANCH   3,DIV._L0068
                        BREQ      DIV._L0068
                        .BRANCH   20,DIV._L0067
                        JMP       DIV._L0067
DIV._L0068:
DIV._L0066:
                        .BLOCK    491
                        .LINE     491
                        LDS       _ACCB, DIV.AD24tempFI
                        LDS       _ACCA, DIV.AD24tempFI+1
                        LDS       _ACCALO, DIV.AD24tempFI+2
                        LDS       _ACCAHI, DIV.AD24tempFI+3
                        STD       Y+003h, _ACCAHI
                        STD       Y+002h, _ACCALO
                        STD       Y+001h, _ACCA
                        STD       Y+000h, _ACCB
                        .ENDBLOCK 492
                        .BRANCH   20,DIV._L0065
                        JMP       DIV._L0065
DIV._L0067:
                        .LINE     493
                        CPI       _ACCA, 2
                        .BRANCH   3,DIV._L0071
                        BREQ      DIV._L0071
                        .BRANCH   20,DIV._L0070
                        JMP       DIV._L0070
DIV._L0071:
DIV._L0069:
                        .BLOCK    494
                        .LINE     494
                        LDS       _ACCB, DIV.AD24tempSI
                        LDS       _ACCA, DIV.AD24tempSI+1
                        LDS       _ACCALO, DIV.AD24tempSI+2
                        LDS       _ACCAHI, DIV.AD24tempSI+3
                        STD       Y+003h, _ACCAHI
                        STD       Y+002h, _ACCALO
                        STD       Y+001h, _ACCA
                        STD       Y+000h, _ACCB
                        .ENDBLOCK 495
                        .BRANCH   20,DIV._L0065
                        JMP       DIV._L0065
DIV._L0070:
                        .BLOCK    496
                        .LINE     497
                        LDS       _ACCB, DIV.AD24temp
                        LDS       _ACCA, DIV.AD24temp+1
                        LDS       _ACCALO, DIV.AD24temp+2
                        LDS       _ACCAHI, DIV.AD24temp+3
                        STD       Y+003h, _ACCAHI
                        STD       Y+002h, _ACCALO
                        STD       Y+001h, _ACCA
                        STD       Y+000h, _ACCB
                        .ENDBLOCK 498
DIV._L0065:
                        .LINE     499
                        LDI       _ACCA, 1 SHLB IntFlag
                        OR        Flags, _ACCA
                        SEI
                        .LINE     500
                        LDD       _ACCAHI, Y+003h
                        LDD       _ACCALO, Y+002h
                        LDD       _ACCA, Y+001h
                        LDD       _ACCB, Y+000h
                        SUBI      _ACCB, 000800000h AND 0FFh
                        SBCI      _ACCA, 000800000h SHRB 8
                        SBCI      _ACCALO, 000800000h SHRB 16
                        SBCI      _ACCAHI, 000800000h SHRB 24
                        STS       DIV.AD24, _ACCB
                        STS       DIV.AD24+1, _ACCA
                        STS       DIV.AD24+2, _ACCALO
                        STS       DIV.AD24+3, _ACCAHI
                        .LINE     501
                        .BRANCH   17,DIV.ISACRANGE
                        CALL       DIV.ISACRANGE
                        PUSH      _ACCA
                        LDS       _ACCB, DIV.AD24
                        LDS       _ACCA, DIV.AD24+1
                        LDS       _ACCALO, DIV.AD24+2
                        LDS       _ACCAHI, DIV.AD24+3
                        LDI       _ACCDLO, 080h
                        EOR       _ACCAHI, _ACCDLO
                        CPI       _ACCAHI, 080h
                        BRNE      DIV._L0072
                        CPI       _ACCALO, 000h
                        BRNE      DIV._L0072
                        CPI       _ACCA, 000h
                        BRNE      DIV._L0072
                        CPI       _ACCB, 000h
DIV._L0072:
                        LDI       _ACCA, 0FFh
                        BRLO      DIV._L0073
                        CLR       _ACCA
DIV._L0073:
                        POP       _ACCB
                        AND       _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   4,DIV._L0076
                        BRNE      DIV._L0076
                        .BRANCH   20,DIV._L0074
                        JMP       DIV._L0074
DIV._L0076:
                        .BLOCK    502
                        .LINE     502
                        LDI       _ACCB, 000000000h AND 0FFh
                        LDI       _ACCA, 000000000h SHRB 8
                        LDI       _ACCALO, 000000000h SHRB 16
                        LDI       _ACCAHI, 000000000h SHRB 24
                        STS       DIV.AD24, _ACCB
                        STS       DIV.AD24+1, _ACCA
                        STS       DIV.AD24+2, _ACCALO
                        STS       DIV.AD24+3, _ACCAHI
                        .ENDBLOCK 503
DIV._L0074:
DIV._L0075:
                        .ENDBLOCK 504
DIV.GetAD24_X:
                        .LINE     504
                        .BRANCH   19
                        RET
                        .ENDFUNC  504

                        .FUNC     WaitAD10, 001FAh, 00020h
DIV.WaitAD10:
                        .BLOCK    507
                        .LINE     508
                        LDI       _ACCA, 000h
                        STS       DIV.AD10READY, _ACCA
DIV._L0077:
                        .BLOCK    509
                        .ENDBLOCK 510
                        .LINE     510
DIV._L0078:
                        LDS       _ACCA, DIV.AD10ready
                        TST       _ACCA
                        .BRANCH   4,DIV._L0080
                        BRNE      DIV._L0080
                        .BRANCH   20,DIV._L0077
                        JMP       DIV._L0077
DIV._L0080:
DIV._L0079:
                        .ENDBLOCK 511
DIV.WaitAD10_X:
                        .LINE     511
                        .BRANCH   19
                        RET
                        .ENDFUNC  511

                        .FUNC     WaitAD24, 00201h, 00020h
DIV.WaitAD24:
                        .BLOCK    514
                        .LINE     515
                        LDI       _ACCA, 000h
                        STS       DIV.AD24READY, _ACCA
DIV._L0081:
                        .BLOCK    516
                        .ENDBLOCK 517
                        .LINE     517
DIV._L0082:
                        LDS       _ACCA, DIV.AD24ready
                        TST       _ACCA
                        .BRANCH   4,DIV._L0084
                        BRNE      DIV._L0084
                        .BRANCH   20,DIV._L0081
                        JMP       DIV._L0081
DIV._L0084:
DIV._L0083:
                        .ENDBLOCK 518
DIV.WaitAD24_X:
                        .LINE     518
                        .BRANCH   19
                        RET
                        .ENDFUNC  518

                        .FUNC     IntegrateReset, 00208h, 00020h
DIV.IntegrateReset:
                        .BLOCK    521
                        .LINE     522
                        CLI
                        LDI       _ACCA, 0FEH ROLB IntFlag
                        AND       Flags, _ACCA
                        .LINE     523
                        LDI       _ACCB, 000800000h AND 0FFh
                        LDI       _ACCA, 000800000h SHRB 8
                        LDI       _ACCALO, 000800000h SHRB 16
                        LDI       _ACCAHI, 000800000h SHRB 24
                        STS       DIV.AD24TEMP, _ACCB
                        STS       DIV.AD24TEMP+1, _ACCA
                        STS       DIV.AD24TEMP+2, _ACCALO
                        STS       DIV.AD24TEMP+3, _ACCAHI
                        .LINE     524
                        LDS       _ACCB, DIV.AD24temp
                        LDS       _ACCA, DIV.AD24temp+1
                        LDS       _ACCALO, DIV.AD24temp+2
                        LDS       _ACCAHI, DIV.AD24temp+3
                        STS       DIV.AD24INTEGRATE0, _ACCB
                        STS       DIV.AD24INTEGRATE0+1, _ACCA
                        STS       DIV.AD24INTEGRATE0+2, _ACCALO
                        STS       DIV.AD24INTEGRATE0+3, _ACCAHI
                        .LINE     525
                        LDS       _ACCB, DIV.AD24temp
                        LDS       _ACCA, DIV.AD24temp+1
                        LDS       _ACCALO, DIV.AD24temp+2
                        LDS       _ACCAHI, DIV.AD24temp+3
                        STS       DIV.AD24INTEGRATE1, _ACCB
                        STS       DIV.AD24INTEGRATE1+1, _ACCA
                        STS       DIV.AD24INTEGRATE1+2, _ACCALO
                        STS       DIV.AD24INTEGRATE1+3, _ACCAHI
                        .LINE     526
                        LDS       _ACCB, DIV.AD24temp
                        LDS       _ACCA, DIV.AD24temp+1
                        LDS       _ACCALO, DIV.AD24temp+2
                        LDS       _ACCAHI, DIV.AD24temp+3
                        STS       DIV.AD24INTEGRATE2, _ACCB
                        STS       DIV.AD24INTEGRATE2+1, _ACCA
                        STS       DIV.AD24INTEGRATE2+2, _ACCALO
                        STS       DIV.AD24INTEGRATE2+3, _ACCAHI
                        .LINE     527
                        LDS       _ACCB, DIV.AD24temp
                        LDS       _ACCA, DIV.AD24temp+1
                        LDS       _ACCALO, DIV.AD24temp+2
                        LDS       _ACCAHI, DIV.AD24temp+3
                        STS       DIV.AD24INTEGRATE3, _ACCB
                        STS       DIV.AD24INTEGRATE3+1, _ACCA
                        STS       DIV.AD24INTEGRATE3+2, _ACCALO
                        STS       DIV.AD24INTEGRATE3+3, _ACCAHI
                        .LINE     528
                        LDI       _ACCA, 1 SHLB IntFlag
                        OR        Flags, _ACCA
                        SEI
                        .ENDBLOCK 529
DIV.IntegrateReset_X:
                        .LINE     529
                        .BRANCH   19
                        RET
                        .ENDFUNC  529

                        .FUNC     SwitchRange, 00214h, 00020h
DIV.SwitchRange:
                        .BLOCK    534
                        .LINE     535
                        LDI       _ACCCLO, DIV.DigitsArr AND 0FFh
                        LDI       _ACCCHI, DIV.DigitsArr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DIV.Range
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LPM       _ACCA, Z
                        STS       DIV.DIGITS, _ACCA
                        .LINE     536
                        LDI       _ACCCLO, DIV.NachkommaArr AND 0FFh
                        LDI       _ACCCHI, DIV.NachkommaArr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DIV.Range
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LPM       _ACCA, Z
                        STS       DIV.NACHKOMMA, _ACCA
                        .LINE     537
                        LDS       _ACCA, DIV.Range
                        PUSH      _ACCA
                        LDS       _ACCA, DIV.OldRange
                        POP       _ACCB
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0h
                        BRNE      DIV._L0085
                        SER       _ACCA
DIV._L0085:
                        TST       _ACCA
                        .BRANCH   4,DIV._L0088
                        BRNE      DIV._L0088
                        .BRANCH   20,DIV._L0086
                        JMP       DIV._L0086
DIV._L0088:
                        .BLOCK    537
                        .LINE     538
                        .BRANCH   20,DIV.SwitchRange_X
                        JMP       DIV.SwitchRange_X
                        .ENDBLOCK 539
DIV._L0086:
DIV._L0087:
                        .LINE     540
                        LDS       _ACCA, DIV.Range
                        STS       DIV.OLDRANGE, _ACCA
                        .LINE     541
                        LDI       _ACCCLO, DIV.RangeArrPortA AND 0FFh
                        LDI       _ACCCHI, DIV.RangeArrPortA SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DIV.Range
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LPM       _ACCA, Z
                        OUT       PORTA, _ACCA
                        .LINE     542
                        LDI       _ACCCLO, DIV.RangeArrPortC AND 0FFh
                        LDI       _ACCCHI, DIV.RangeArrPortC SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DIV.Range
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LPM       _ACCA, Z
                        OUT       PORTC, _ACCA
                        .LINE     543
                        LDS       _ACCA, DIV.Range
                        CPI       _ACCA, 000h
                        .BRANCH   3,DIV._L0089
                        BREQ      DIV._L0089
                        CPI       _ACCA, 00Bh
                        .BRANCH   3,DIV._L0089
                        BREQ      DIV._L0089
                        .BRANCH   1,DIV._L0090
                        BRSH      DIV._L0090
                        CPI       _ACCA, 008h
                        .BRANCH   1,DIV._L0090
                        BRLO      DIV._L0090
                        CLR       _ACCDLO
                        .BRANCH   20,DIV._L0089
                        RJMP      DIV._L0089
DIV._L0090:
                        LDI       _ACCDLO, 001h
DIV._L0089:
                        LDI       _ACCA, 0h
                        BRNE      DIV._L0091
                        SER       _ACCA
DIV._L0091:
                        CLT
                        TST       _ACCA
                        BREQ      DIV._L0092
                        SET
DIV._L0092:
                        IN        _ACCA, 00032h
                        BLD       _ACCA, 004h
                        OUT       00032h, _ACCA
                        .LINE     544
                        .BRANCH   17,DIV.INTEGRATERESET
                        CALL      DIV.INTEGRATERESET
                        .ENDBLOCK 545
DIV.SwitchRange_X:
                        .LINE     545
                        .BRANCH   19
                        RET
                        .ENDFUNC  545

                        .FUNC     SerCRLF, 00227h, 00020h
DIV.SerCRLF:
                        .BLOCK    552
                        .LINE     553
                        LDI       _ACCA, 00Dh
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .LINE     554
                        LDI       _ACCA, 00Ah
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .ENDBLOCK 555
DIV.SerCRLF_X:
                        .LINE     555
                        .BRANCH   19
                        RET
                        .ENDFUNC  555

                        .FUNC     WriteChPrefix, 0022Dh, 00020h
DIV.WriteChPrefix:
                        .BLOCK    558
                        .LINE     559
                        LDI       _ACCA, 023h
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .LINE     560
                        LDS       _ACCA, DIV.SlaveCh
                        SUBI      _ACCA, -030h AND 0FFh
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .LINE     561
                        LDI       _ACCA, 03Ah
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .LINE     562
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.Serout SHRB 1
                        LDI       _ACCA, SYSTEM.Serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDS       _ACCA, DIV.SubCh
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
                        .LINE     563
                        LDI       _ACCA, 03Dh
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .ENDBLOCK 564
DIV.WriteChPrefix_X:
                        .LINE     564
                        .BRANCH   19
                        RET
                        .ENDFUNC  564

                        .FUNC     WriteSerInp, 00236h, 00020h
DIV.WriteSerInp:
                        .BLOCK    567
                        .LINE     568
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.Serout SHRB 1
                        LDI       _ACCA, SYSTEM.Serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, DIV.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DIV.SerInpStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     569
                        .BRANCH   17,DIV.SERCRLF
                        CALL      DIV.SERCRLF
                        .ENDBLOCK 570
DIV.WriteSerInp_X:
                        .LINE     570
                        .BRANCH   19
                        RET
                        .ENDFUNC  570

                        .FUNC     SerPrompt, 0023Ch, 00020h
DIV.SerPrompt:
                        SBIW      _FRAMEPTR, 2
                        .BLOCK    576
                        .LINE     577
                        LDI       _ACCA, 0FFh
                        STS       DIV.SUBCH, _ACCA
                        .LINE     578
                        .BRANCH   17,DIV.WRITECHPREFIX
                        CALL      DIV.WRITECHPREFIX
                        .LINE     579
                        LDD       _ACCA, Y+002h
                        CPI       _ACCA, 001h
                        LDI       _ACCA, 0h
                        BRNE      DIV._L0093
                        SER       _ACCA
DIV._L0093:
                        TST       _ACCA
                        .BRANCH   4,DIV._L0096
                        BRNE      DIV._L0096
                        .BRANCH   20,DIV._L0094
                        JMP       DIV._L0094
DIV._L0096:
                        .BLOCK    579
                        .LINE     580
                        LDS       _ACCA, DIV.Status
                        PUSH      _ACCA
                        LDS       _ACCA, DIV.ButtonNumber
                        POP       _ACCB
                        OR        _ACCA, _ACCB
                        ORI       _ACCA, 040h
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 581
                        .BRANCH   20,DIV._L0095
                        JMP       DIV._L0095
DIV._L0094:
                        .BLOCK    581
                        .LINE     582
                        LDD       _ACCA, Y+002h
                        CPI       _ACCA, 003h
                        LDI       _ACCA, 0h
                        BRNE      DIV._L0097
                        SER       _ACCA
DIV._L0097:
                        TST       _ACCA
                        .BRANCH   4,DIV._L0100
                        BRNE      DIV._L0100
                        .BRANCH   20,DIV._L0098
                        JMP       DIV._L0098
DIV._L0100:
                        .BLOCK    582
                        .LINE     583
                        LDS       _ACCA, DIV.Status
                        PUSH      _ACCA
                        LDS       _ACCA, DIV.FaultFlags
                        POP       _ACCB
                        OR        _ACCA, _ACCB
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 584
                        .BRANCH   20,DIV._L0099
                        JMP       DIV._L0099
DIV._L0098:
                        .BLOCK    584
                        .LINE     585
                        LDS       _ACCA, DIV.Status
                        PUSH      _ACCA
                        LDD       _ACCA, Y+002h
                        POP       _ACCB
                        OR        _ACCA, _ACCB
                        STD       Y+000h, _ACCA
                        .LINE     586
                        LDD       _ACCA, Y+002h
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      DIV._L0101
                        SER       _ACCA
DIV._L0101:
                        TST       _ACCA
                        .BRANCH   4,DIV._L0104
                        BRNE      DIV._L0104
                        .BRANCH   20,DIV._L0102
                        JMP       DIV._L0102
DIV._L0104:
                        .BLOCK    586
                        .LINE     587
                        LDS       _ACCBLO, DIV.ErrCount
                        LDS       _ACCBHI, DIV.ErrCount+1
                        ADIW      _ACCBLO, 1
                        STS       DIV.ErrCount, _ACCBLO
                        STS       DIV.ErrCount+1, _ACCBHI
                        .ENDBLOCK 588
DIV._L0102:
DIV._L0103:
                        .ENDBLOCK 589
DIV._L0099:
                        .ENDBLOCK 590
DIV._L0095:
                        .LINE     591
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
                        .LINE     592
                        LDS       _ACCA, DIV.FaultFlags
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      DIV._L0105
                        SER       _ACCA
DIV._L0105:
                        TST       _ACCA
                        .BRANCH   4,DIV._L0108
                        BRNE      DIV._L0108
                        .BRANCH   20,DIV._L0106
                        JMP       DIV._L0106
DIV._L0108:
                        .BLOCK    592
                        .LINE     593
                        LDS       _ACCA, DIV.FaultFlags
                        STD       Y+001h, _ACCA
                        .LINE     594
                        .LOOP
                        LDI       _ACCCLO, DIV.i AND 0FFh
                        LDI       _ACCCHI, DIV.i SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 000h
                        ST        Z, _ACCA
                        LDI       _ACCA, 003h
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
DIV._L0111:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      DIV._L0112
                        CLR       _ACCA
DIV._L0112:
                        TST       _ACCA
                        .BRANCH   3,DIV._L0113
                        BREQ      DIV._L0113
                        .BRANCH   20,DIV._L0110
                        JMP       DIV._L0110
DIV._L0113:
                        .BLOCK    595
                        .LINE     595
                        LDD       _ACCA, Y+004h
                        ANDI      _ACCA, 001h
                        CPI       _ACCA, 001h
                        LDI       _ACCA, 0h
                        BRNE      DIV._L0114
                        SER       _ACCA
DIV._L0114:
                        TST       _ACCA
                        .BRANCH   4,DIV._L0117
                        BRNE      DIV._L0117
                        .BRANCH   20,DIV._L0115
                        JMP       DIV._L0115
DIV._L0117:
                        .BLOCK    595
                        .LINE     596
                        LDI       _ACCA, 020h
                        .FRAME  3
                        CALL      SYSTEM.SEROUT
                        .LINE     597
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.serout SHRB 1
                        LDI       _ACCA, SYSTEM.serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  5
                        LDI       _ACCCLO, DIV.FaultStrArr AND 0FFh
                        LDI       _ACCCHI, DIV.FaultStrArr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        MOV       _ACCA, DIV.i
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
                        LPM       _ACCBHI, Z+
                        TST       _ACCBHI
                        BREQ      DIV._L0118
                        CALL      SYSTEM.StrConst2Str
DIV._L0118:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  3
                        .ENDBLOCK 598
DIV._L0115:
DIV._L0116:
                        .LINE     599
                        LDD       _ACCA, Y+004h
                        LSR       _ACCA
                        STD       Y+004h, _ACCA
                        .ENDBLOCK 600
DIV._L0109:
                        .LINE     600
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,DIV._L0110
                        BREQ      DIV._L0110
                        .BRANCH   20,DIV._L0111
                        JMP       DIV._L0111
DIV._L0110:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .ENDBLOCK 601
                        .BRANCH   20,DIV._L0107
                        JMP       DIV._L0107
DIV._L0106:
                        .BLOCK    601
                        .LINE     602
                        LDI       _ACCA, 020h
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .LINE     603
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.serout SHRB 1
                        LDI       _ACCA, SYSTEM.serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, DIV.ErrStrArr AND 0FFh
                        LDI       _ACCCHI, DIV.ErrStrArr SHRB 8
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
                        LPM       _ACCBHI, Z+
                        TST       _ACCBHI
                        BREQ      DIV._L0119
                        CALL      SYSTEM.StrConst2Str
DIV._L0119:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .ENDBLOCK 604
DIV._L0107:
                        .LINE     605
                        .BRANCH   17,DIV.SERCRLF
                        CALL      DIV.SERCRLF
                        .ENDBLOCK 606
DIV.SerPrompt_X:
                        .LINE     606
                        .BRANCH   19
                        RET
                        .ENDFUNC  606

                        .FUNC     ParamToStr, 00263h, 00020h
DIV.ParamToStr:
                        SBIW      _FRAMEPTR, 4
                        .BLOCK    614
                        .LINE     615
                        LDI       _ACCA, 007h
                        STS       DIV.DIGITS, _ACCA
                        .LINE     616
                        LDI       _ACCCLO, DIV.nachkommaArr AND 0FFh
                        LDI       _ACCCHI, DIV.nachkommaArr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DIV.Range
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LPM       _ACCA, Z
                        STS       DIV.NACHKOMMA, _ACCA
                        .LINE     617
                        LDS       _ACCB, DIV.Param
                        LDS       _ACCA, DIV.Param+1
                        LDS       _ACCALO, DIV.Param+2
                        LDS       _ACCAHI, DIV.Param+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CBR       _ACCAHI, 080h
                        STD       Y+003h, _ACCAHI
                        STD       Y+002h, _ACCALO
                        STD       Y+001h, _ACCA
                        STD       Y+000h, _ACCB
                        .LINE     618
                        LDD       _ACCA, Y+004h
                        COM       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DIV._L0122
                        BRNE      DIV._L0122
                        .BRANCH   20,DIV._L0120
                        JMP       DIV._L0120
DIV._L0122:
                        .BLOCK    618
                        .LINE     619
                        LDS       _ACCA, DIV.digits
                        SUBI      _ACCA, -002h AND 0FFh
                        STS       DIV.DIGITS, _ACCA
                        .LINE     620
                        LDS       _ACCA, DIV.nachkomma
                        SUBI      _ACCA, -002h AND 0FFh
                        STS       DIV.NACHKOMMA, _ACCA
                        .ENDBLOCK 621
DIV._L0120:
DIV._L0121:
                        .LINE     622
                        LDI       _ACCCLO, DIV.ParamStr AND 0FFh
                        LDI       _ACCCHI, DIV.ParamStr SHRB 8
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
                        LDD       _ACCAHI, Y+006h
                        LDD       _ACCALO, Y+005h
                        LDD       _ACCA, Y+004h
                        LDD       _ACCB, Y+003h
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCA, DIV.digits
                        PUSH      _ACCA
                        LDS       _ACCA, DIV.nachkomma
                        PUSH      _ACCA
                        LDI       _ACCA, 030h
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
                        .LINE     623
                        LDD       _ACCA, Y+004h
                        TST       _ACCA
                        .BRANCH   4,DIV._L0125
                        BRNE      DIV._L0125
                        .BRANCH   20,DIV._L0123
                        JMP       DIV._L0123
DIV._L0125:
                        .BLOCK    623
                        .LINE     624
                        LDS       _ACCB, DIV.Param
                        LDS       _ACCA, DIV.Param+1
                        LDS       _ACCALO, DIV.Param+2
                        LDS       _ACCAHI, DIV.Param+3
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
                        BREQ      DIV._L0127
                        BRPL      DIV._L0128
                        BRMI      DIV._L0126
DIV._L0128:
                        CLZ
                        CLC
                        RJMP      DIV._L0127
DIV._L0126:
                        CLZ
                        SEC
DIV._L0127:
                        LDI       _ACCA, 0FFh
                        BRLO      DIV._L0129
                        CLR       _ACCA
DIV._L0129:
                        TST       _ACCA
                        .BRANCH   4,DIV._L0132
                        BRNE      DIV._L0132
                        .BRANCH   20,DIV._L0130
                        JMP       DIV._L0130
DIV._L0132:
                        .BLOCK    624
                        .LINE     625
                        LDI       _ACCCLO, $St_String7 AND 0FFh
                        LDI       _ACCCHI, $St_String7 SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCCLO, DIV.ParamStr AND 0FFh
                        LDI       _ACCCHI, DIV.ParamStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCA, 028h
                        PUSH      _ACCA
                        LDI       _ACCA, 001h
                        LDI       _ACCFHI, 002h
                        CALL      SYSTEM.StringInsert
                        .ENDBLOCK 626
                        .BRANCH   20,DIV._L0131
                        JMP       DIV._L0131
DIV._L0130:
                        .BLOCK    626
                        .LINE     627
                        .BRANCH   17,DIV.ISACRANGE
                        CALL       DIV.ISACRANGE
                        TST       _ACCA
                        .BRANCH   4,DIV._L0135
                        BRNE      DIV._L0135
                        .BRANCH   20,DIV._L0133
                        JMP       DIV._L0133
DIV._L0135:
                        .BLOCK    627
                        .LINE     628
                        LDI       _ACCCLO, $St_String8 AND 0FFh
                        LDI       _ACCCHI, $St_String8 SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCCLO, DIV.ParamStr AND 0FFh
                        LDI       _ACCCHI, DIV.ParamStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCA, 028h
                        PUSH      _ACCA
                        LDI       _ACCA, 001h
                        LDI       _ACCFHI, 002h
                        CALL      SYSTEM.StringInsert
                        .ENDBLOCK 629
                        .BRANCH   20,DIV._L0134
                        JMP       DIV._L0134
DIV._L0133:
                        .BLOCK    629
                        .LINE     630
                        LDI       _ACCCLO, $St_String9 AND 0FFh
                        LDI       _ACCCHI, $St_String9 SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCCLO, DIV.ParamStr AND 0FFh
                        LDI       _ACCCHI, DIV.ParamStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCA, 028h
                        PUSH      _ACCA
                        LDI       _ACCA, 001h
                        LDI       _ACCFHI, 002h
                        CALL      SYSTEM.StringInsert
                        .ENDBLOCK 631
DIV._L0134:
                        .ENDBLOCK 632
DIV._L0131:
                        .ENDBLOCK 633
                        .BRANCH   20,DIV._L0124
                        JMP       DIV._L0124
DIV._L0123:
                        .BLOCK    633
                        .LINE     634
                        LDS       _ACCB, DIV.Param
                        LDS       _ACCA, DIV.Param+1
                        LDS       _ACCALO, DIV.Param+2
                        LDS       _ACCAHI, DIV.Param+3
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
                        BREQ      DIV._L0137
                        BRPL      DIV._L0138
                        BRMI      DIV._L0136
DIV._L0138:
                        CLZ
                        CLC
                        RJMP      DIV._L0137
DIV._L0136:
                        CLZ
                        SEC
DIV._L0137:
                        LDI       _ACCA, 0FFh
                        BRLO      DIV._L0139
                        CLR       _ACCA
DIV._L0139:
                        TST       _ACCA
                        .BRANCH   4,DIV._L0142
                        BRNE      DIV._L0142
                        .BRANCH   20,DIV._L0140
                        JMP       DIV._L0140
DIV._L0142:
                        .BLOCK    634
                        .LINE     635
                        LDI       _ACCCLO, $St_String7 AND 0FFh
                        LDI       _ACCCHI, $St_String7 SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCCLO, DIV.ParamStr AND 0FFh
                        LDI       _ACCCHI, DIV.ParamStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCA, 028h
                        PUSH      _ACCA
                        LDI       _ACCA, 001h
                        LDI       _ACCFHI, 002h
                        CALL      SYSTEM.StringInsert
                        .ENDBLOCK 636
DIV._L0140:
DIV._L0141:
                        .ENDBLOCK 637
DIV._L0124:
                        .ENDBLOCK 638
DIV.ParamToStr_X:
                        .LINE     638
                        .BRANCH   19
                        RET
                        .ENDFUNC  638

                        .FUNC     ShowRange, 00280h, 00020h
DIV.ShowRange:
                        .BLOCK    641
                        .LINE     643
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
                        .LINE     644
                        LDS       _ACCA, DIV.IncrEnter
                        TST       _ACCA
                        .BRANCH   4,DIV._L0145
                        BRNE      DIV._L0145
                        .BRANCH   20,DIV._L0143
                        JMP       DIV._L0143
DIV._L0145:
                        .BLOCK    644
                        .LINE     645
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, DIV.MemorizedStr AND 0FFh
                        LDI       _ACCCHI, DIV.MemorizedStr SHRB 8
                        LPM       _ACCBHI, Z+
                        TST       _ACCBHI
                        BREQ      DIV._L0146
                        CALL      SYSTEM.StrConst2Str
DIV._L0146:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     646
                        LDI       _ACCA, 064h
                        STS       DIV.DisplayTimer, _ACCA
                        .ENDBLOCK 647
                        .BRANCH   20,DIV._L0144
                        JMP       DIV._L0144
DIV._L0143:
                        .BLOCK    647
                        .LINE     648
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, DIV.RangeStrArr AND 0FFh
                        LDI       _ACCCHI, DIV.RangeStrArr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DIV.Range
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
                        LPM       _ACCBHI, Z+
                        TST       _ACCBHI
                        BREQ      DIV._L0147
                        CALL      SYSTEM.StrConst2Str
DIV._L0147:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .ENDBLOCK 649
DIV._L0144:
                        .LINE     650
                        LDI       _ACCA, 000h
                        STS       DIV.INCRENTER, _ACCA
                        .ENDBLOCK 652
DIV.ShowRange_X:
                        .LINE     652
                        .BRANCH   19
                        RET
                        .ENDFUNC  652

                        .FUNC     WriteParamLCD, 0028Eh, 00020h
DIV.WriteParamLCD:
                        .BLOCK    655
                        .LINE     656
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 0FFh
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DIV.PARAMTOSTR
                        CALL      DIV.PARAMTOSTR
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     657
                        LDI       _ACCCLO, $St_String10 AND 0FFh
                        LDI       _ACCCHI, $St_String10 SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCCLO, DIV.ParamStr AND 0FFh
                        LDI       _ACCCHI, DIV.ParamStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCA, 028h
                        PUSH      _ACCA
                        LDI       _ACCFHI, 002h
                        CALL      SYSTEM.StringAppend
                        .LINE     658
                        LDI       _ACCCLO, DIV.ParamStr AND 0FFh
                        LDI       _ACCCHI, DIV.ParamStr SHRB 8
                        LDI       _ACCA, 008h
                        CPI       _ACCA, 40
                        BRCS      DIV._L0148
                        LDI       _ACCA, 40
DIV._L0148:
                        ST        Z+, _ACCA
                        .LINE     659
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
                        .LINE     660
                        LDS       _ACCB, 001D4h
                        CLR       _ACCA
                        SBRC      _ACCB, 005h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DIV._L0151
                        BRNE      DIV._L0151
                        .BRANCH   20,DIV._L0149
                        JMP       DIV._L0149
DIV._L0151:
                        .BLOCK    660
                        .LINE     661
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, $St_String11 AND 0FFh
                        LDI       _ACCCHI, $St_String11 SHRB 8
                        LPM       _ACCBHI, Z+
                        TST       _ACCBHI
                        BREQ      DIV._L0152
                        CALL      SYSTEM.StrConst2Str
DIV._L0152:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .ENDBLOCK 662
                        .BRANCH   20,DIV._L0150
                        JMP       DIV._L0150
DIV._L0149:
                        .BLOCK    662
                        .LINE     663
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, DIV.ParamStr AND 0FFh
                        LDI       _ACCCHI, DIV.ParamStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .ENDBLOCK 664
DIV._L0150:
                        .ENDBLOCK 665
DIV.WriteParamLCD_X:
                        .LINE     665
                        .BRANCH   19
                        RET
                        .ENDFUNC  665

                        .FUNC     WriteParamSer, 0029Dh, 00020h
DIV.WriteParamSer:
                        .BLOCK    670
                        .LINE     671
                        .BRANCH   17,DIV.WRITECHPREFIX
                        CALL      DIV.WRITECHPREFIX
                        .LINE     672
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DIV.PARAMTOSTR
                        CALL      DIV.PARAMTOSTR
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     673
                        LDD       _ACCA, Y+000h
                        PUSH      _ACCA
                        LDS       _ACCA, DIV.SubCh
                        CPI       _ACCA, 014h
                        LDI       _ACCA, 0FFh
                        BRLO      DIV._L0153
                        CLR       _ACCA
DIV._L0153:
                        POP       _ACCB
                        AND       _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   4,DIV._L0156
                        BRNE      DIV._L0156
                        .BRANCH   20,DIV._L0154
                        JMP       DIV._L0154
DIV._L0156:
                        .BLOCK    673
                        .LINE     674
                        LDI       _ACCCLO, DIV.ParamStr AND 0FFh
                        LDI       _ACCCHI, DIV.ParamStr SHRB 8
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
                        LPM       _ACCBHI, Z+
                        TST       _ACCBHI
                        BREQ      DIV._L0157
                        CALL      SYSTEM.StrConst2Str
DIV._L0157:
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
                        .ENDBLOCK 675
                        .BRANCH   20,DIV._L0155
                        JMP       DIV._L0155
DIV._L0154:
                        .BLOCK    675
                        .LINE     676
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DIV.PARAMTOSTR
                        CALL      DIV.PARAMTOSTR
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 677
DIV._L0155:
                        .LINE     678
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.serout SHRB 1
                        LDI       _ACCA, SYSTEM.serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, DIV.ParamStr AND 0FFh
                        LDI       _ACCCHI, DIV.ParamStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     679
                        LDD       _ACCA, Y+000h
                        COM       _ACCA
                        PUSH      _ACCA
                        LDS       _ACCA, DIV.SubCh
                        CPI       _ACCA, 014h
                        LDI       _ACCA, 0FFh
                        BRLO      DIV._L0158
                        CLR       _ACCA
DIV._L0158:
                        POP       _ACCB
                        AND       _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   4,DIV._L0161
                        BRNE      DIV._L0161
                        .BRANCH   20,DIV._L0159
                        JMP       DIV._L0159
DIV._L0161:
                        .BLOCK    679
                        .LINE     681
                        LDS       _ACCA, DIV.Range
                        .LINE     682
                        CPI       _ACCA, 0
                        .BRANCH   3,DIV._L0165
                        BREQ      DIV._L0165
                        .BRANCH   20,DIV._L0164
                        JMP       DIV._L0164
DIV._L0165:
                        .BRANCH   20,DIV._L0163
                        JMP       DIV._L0163
DIV._L0164:
                        CPI       _ACCA, 4
                        .BRANCH   3,DIV._L0167
                        BREQ      DIV._L0167
                        .BRANCH   20,DIV._L0166
                        JMP       DIV._L0166
DIV._L0167:
                        .BRANCH   20,DIV._L0163
                        JMP       DIV._L0163
DIV._L0166:
                        CPI       _ACCA, 9
                        .BRANCH   3,DIV._L0169
                        BREQ      DIV._L0169
                        .BRANCH   20,DIV._L0168
                        JMP       DIV._L0168
DIV._L0169:
                        .BRANCH   20,DIV._L0163
                        JMP       DIV._L0163
DIV._L0168:
                        CPI       _ACCA, 13
                        .BRANCH   3,DIV._L0171
                        BREQ      DIV._L0171
                        .BRANCH   20,DIV._L0170
                        JMP       DIV._L0170
DIV._L0171:
DIV._L0163:
                        .BLOCK    683
                        .LINE     683
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.serout SHRB 1
                        LDI       _ACCA, SYSTEM.serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, $St_String13 AND 0FFh
                        LDI       _ACCCHI, $St_String13 SHRB 8
                        LPM       _ACCBHI, Z+
                        TST       _ACCBHI
                        BREQ      DIV._L0172
                        CALL      SYSTEM.StrConst2Str
DIV._L0172:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .ENDBLOCK 684
                        .BRANCH   20,DIV._L0162
                        JMP       DIV._L0162
DIV._L0170:
                        .LINE     685
                        CPI       _ACCA, 8
                        .BRANCH   3,DIV._L0175
                        BREQ      DIV._L0175
                        .BRANCH   20,DIV._L0174
                        JMP       DIV._L0174
DIV._L0175:
                        .BRANCH   20,DIV._L0173
                        JMP       DIV._L0173
DIV._L0174:
                        CPI       _ACCA, 12
                        .BRANCH   3,DIV._L0177
                        BREQ      DIV._L0177
                        .BRANCH   20,DIV._L0176
                        JMP       DIV._L0176
DIV._L0177:
DIV._L0173:
                        .BLOCK    686
                        .LINE     686
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.serout SHRB 1
                        LDI       _ACCA, SYSTEM.serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, $St_String14 AND 0FFh
                        LDI       _ACCCHI, $St_String14 SHRB 8
                        LPM       _ACCBHI, Z+
                        TST       _ACCBHI
                        BREQ      DIV._L0178
                        CALL      SYSTEM.StrConst2Str
DIV._L0178:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .ENDBLOCK 687
                        .BRANCH   20,DIV._L0162
                        JMP       DIV._L0162
DIV._L0176:
DIV._L0162:
                        .ENDBLOCK 689
DIV._L0159:
DIV._L0160:
                        .LINE     690
                        .BRANCH   17,DIV.SERCRLF
                        CALL      DIV.SERCRLF
                        .ENDBLOCK 691
DIV.WriteParamSer_X:
                        .LINE     691
                        .BRANCH   19
                        RET
                        .ENDFUNC  691

                        .FUNC     WriteParamLongIntSer, 002B5h, 00020h
DIV.WriteParamLongIntSer:
                        SBIW      _FRAMEPTR, 16
                        .BLOCK    695
                        .LINE     696
                        .BRANCH   17,DIV.WRITECHPREFIX
                        CALL      DIV.WRITECHPREFIX
                        .LINE     697
                        MOVW      _ACCCLO, _FRAMEPTR
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        ADIW      _ACCCLO, 1
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        LDI       _ACCA, 00Fh
                        ST        -Y, _ACCA
                        LDI       _ACCA, 0FEH ROLB _DEVICE
                        AND       Flags, _ACCA
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        .FRAME  3
                        LDS       _ACCB, DIV.ParamLongInt
                        LDS       _ACCA, DIV.ParamLongInt+1
                        LDS       _ACCALO, DIV.ParamLongInt+2
                        LDS       _ACCAHI, DIV.ParamLongInt+3
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        ST        -Y, _ACCAHI
                        ST        -Y, _ACCALO
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  7
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        LDI       _ACCA, 020h
                        ST        -Y, _ACCA
                        .FRAME  10
                        SET
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.Long2Str
                        .FRAME  3
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        LDI       _ACCA, 00Fh
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
                        .LINE     698
                        MOVW      _ACCCLO, _FRAMEPTR
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        ADIW      _ACCCLO, 1
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        LDI       _ACCA, 00Fh
                        ST        -Y, _ACCA
                        LDI       _ACCA, 0FEH ROLB _DEVICE
                        AND       Flags, _ACCA
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        .FRAME  3
                        MOVW      _ACCCLO, _FRAMEPTR
                        ADIW      _ACCCLO, 000003h
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LD        _ACCB, Z+
                        LDI       _ACCALO, 1
DIV._L0179:
                        TST       _ACCB
                        BREQ      DIV._L0180
                        LD        _ACCA, Z+
                        CPI       _ACCA, 20h
                        BRNE      DIV._L0180
                        INC       _ACCALO
                        DEC       _ACCB
                        RJMP      DIV._L0179
DIV._L0180:
                        MOV       _ACCA, _ACCB
                        CLR       _ACCAHI
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCAHI
                        SBIW      _ACCCLO, 02h
DIV._L0181:
                        TST       _ACCB
                        BREQ      DIV._L0182
                        LD        _ACCA, Z
                        SBIW      _ACCCLO, 01h
                        CPI       _ACCA, 20h
                        BRNE      DIV._L0182
                        DEC       _ACCB
                        RJMP      DIV._L0181
DIV._L0182:
                        MOV       _ACCA, _ACCB
                        PUSH      _ACCALO
                        POP       _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        CALL      SYSTEM.StrCopyV
                        LDI       _ACCA, 00Fh
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
                        .LINE     699
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.Serout SHRB 1
                        LDI       _ACCA, SYSTEM.Serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        MOVW      _ACCCLO, _FRAMEPTR
                        ADIW      _ACCCLO, 000002h
                        CALL      SYSTEM.StrVar2Str
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     700
                        .BRANCH   17,DIV.SERCRLF
                        CALL      DIV.SERCRLF
                        .ENDBLOCK 701
DIV.WriteParamLongIntSer_X:
                        .LINE     701
                        .BRANCH   19
                        RET
                        .ENDFUNC  701

                        .FUNC     Checklimits, 002BFh, 00020h
DIV.Checklimits:
                        SBIW      _FRAMEPTR, 1
                        .BLOCK    706
                        .LINE     707
                        LDI       _ACCA, 000h
                        STD       Y+000h, _ACCA
                        .LINE     708
                        LDI       _ACCA, 000h
                        STS       DIV.CHECKLIMITERR, _ACCA
                        .LINE     709
                        LDS       _ACCA, DIV.Range
                        CPI       _ACCA, 07Fh
                        LDI       _ACCA, 0h
                        BREQ      DIV._L0183
                        BRLO      DIV._L0183
                        SER       _ACCA
DIV._L0183:
                        TST       _ACCA
                        .BRANCH   4,DIV._L0186
                        BRNE      DIV._L0186
                        .BRANCH   20,DIV._L0184
                        JMP       DIV._L0184
DIV._L0186:
                        .BLOCK    710
                        .LINE     710
                        LDI       _ACCA, 000h
                        STS       DIV.RANGE, _ACCA
                        .LINE     711
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .LINE     712
                        LDI       _ACCA, 005h
                        STS       DIV.CHECKLIMITERR, _ACCA
                        .ENDBLOCK 713
DIV._L0184:
DIV._L0185:
                        .LINE     714
                        LDS       _ACCA, DIV.Range
                        CPI       _ACCA, 00Fh
                        LDI       _ACCA, 0h
                        BREQ      DIV._L0187
                        BRLO      DIV._L0187
                        SER       _ACCA
DIV._L0187:
                        TST       _ACCA
                        .BRANCH   4,DIV._L0190
                        BRNE      DIV._L0190
                        .BRANCH   20,DIV._L0188
                        JMP       DIV._L0188
DIV._L0190:
                        .BLOCK    715
                        .LINE     715
                        LDI       _ACCA, 00Fh
                        STS       DIV.RANGE, _ACCA
                        .LINE     716
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .LINE     717
                        LDI       _ACCA, 005h
                        STS       DIV.CHECKLIMITERR, _ACCA
                        .ENDBLOCK 718
DIV._L0188:
DIV._L0189:
                        .LINE     719
                        LDD       _ACCA, Y+000h
                        .ENDBLOCK 720
DIV.Checklimits_X:
                        .LINE     720
                        .BRANCH   19
                        RET
                        .ENDFUNC  720


                        .FILE     DIV-Parser.pas
                        .FUNC     ParseGetParam, 00018h, 00020h
DIV.ParseGetParam:
                        SBIW      _FRAMEPTR, 1
                        .BLOCK    26
                        .LINE     27
                        LDI       _ACCA, 000h
                        STD       Y+000h, _ACCA
                        .LINE     28
                        LDS       _ACCA, DIV.SubCh
                        .LINE     29
                        CPI       _ACCA, 0
                        .BRANCH   2,DIV._L0194
                        BRCC      DIV._L0194
                        .BRANCH   20,DIV._L0193
                        JMP       DIV._L0193
DIV._L0194:
                        CPI       _ACCA, 2
                        .BRANCH   3,DIV._L0195
                        BREQ      DIV._L0195
                        .BRANCH   1,DIV._L0193
                        BRCS      DIV._L0195
                        .BRANCH   20,DIV._L0193
                        JMP       DIV._L0193
DIV._L0195:
DIV._L0192:
                        .BLOCK    30
                        .LINE     30
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCA, DIV.SubCh
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DIV.GETAD24
                        CALL      DIV.GETAD24
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     31
                        .BRANCH   17,DIV.PARAMSCALE24
                        CALL      DIV.PARAMSCALE24
                        .ENDBLOCK 32
                        .BRANCH   20,DIV._L0191
                        JMP       DIV._L0191
DIV._L0193:
                        .LINE     33
                        CPI       _ACCA, 3
                        .BRANCH   3,DIV._L0198
                        BREQ      DIV._L0198
                        .BRANCH   20,DIV._L0197
                        JMP       DIV._L0197
DIV._L0198:
DIV._L0196:
                        .BLOCK    34
                        .LINE     34
                        .BRANCH   17,DIV.WAITAD24
                        CALL      DIV.WAITAD24
                        .LINE     35
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DIV.GETAD24
                        CALL      DIV.GETAD24
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     36
                        .BRANCH   17,DIV.PARAMSCALE24
                        CALL      DIV.PARAMSCALE24
                        .ENDBLOCK 37
                        .BRANCH   20,DIV._L0191
                        JMP       DIV._L0191
DIV._L0197:
                        .LINE     38
                        CPI       _ACCA, 19
                        .BRANCH   3,DIV._L0201
                        BREQ      DIV._L0201
                        .BRANCH   20,DIV._L0200
                        JMP       DIV._L0200
DIV._L0201:
DIV._L0199:
                        .BLOCK    39
                        .LINE     39
                        LDS       _ACCA, DIV.Range
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        CLR       _ACCAHI
                        CLR       _ACCALO
                        STS       DIV.PARAMLONGINT, _ACCB
                        STS       DIV.PARAMLONGINT+1, _ACCA
                        STS       DIV.PARAMLONGINT+2, _ACCALO
                        STS       DIV.PARAMLONGINT+3, _ACCAHI
                        .LINE     40
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 41
                        .BRANCH   20,DIV._L0191
                        JMP       DIV._L0191
DIV._L0200:
                        .LINE     42
                        CPI       _ACCA, 10
                        .BRANCH   3,DIV._L0204
                        BREQ      DIV._L0204
                        .BRANCH   20,DIV._L0203
                        JMP       DIV._L0203
DIV._L0204:
DIV._L0202:
                        .BLOCK    43
                        .LINE     43
                        .BRANCH   17,DIV.WAITAD10
                        CALL      DIV.WAITAD10
                        .LINE     44
                        .BRANCH   17,DIV.ISACRANGE
                        CALL       DIV.ISACRANGE
                        TST       _ACCA
                        .BRANCH   4,DIV._L0207
                        BRNE      DIV._L0207
                        .BRANCH   20,DIV._L0205
                        JMP       DIV._L0205
DIV._L0207:
                        .BLOCK    44
                        .LINE     45
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 003h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DIV.GETAD10
                        CALL      DIV.GETAD10
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 46
                        .BRANCH   20,DIV._L0206
                        JMP       DIV._L0206
DIV._L0205:
                        .BLOCK    46
                        .LINE     47
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 005h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DIV.GETAD10
                        CALL      DIV.GETAD10
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 48
DIV._L0206:
                        .LINE     49
                        .BRANCH   17,DIV.PARAMSCALE10
                        CALL      DIV.PARAMSCALE10
                        .ENDBLOCK 50
                        .BRANCH   20,DIV._L0191
                        JMP       DIV._L0191
DIV._L0203:
                        .LINE     51
                        CPI       _ACCA, 11
                        .BRANCH   3,DIV._L0210
                        BREQ      DIV._L0210
                        .BRANCH   20,DIV._L0209
                        JMP       DIV._L0209
DIV._L0210:
DIV._L0208:
                        .BLOCK    52
                        .LINE     52
                        .BRANCH   17,DIV.WAITAD10
                        CALL      DIV.WAITAD10
                        .LINE     53
                        .BRANCH   17,DIV.ISACRANGE
                        CALL       DIV.ISACRANGE
                        TST       _ACCA
                        .BRANCH   4,DIV._L0213
                        BRNE      DIV._L0213
                        .BRANCH   20,DIV._L0211
                        JMP       DIV._L0211
DIV._L0213:
                        .BLOCK    53
                        .LINE     54
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 004h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DIV.GETAD10
                        CALL      DIV.GETAD10
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 55
                        .BRANCH   20,DIV._L0212
                        JMP       DIV._L0212
DIV._L0211:
                        .BLOCK    55
                        .LINE     56
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 005h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DIV.GETAD10
                        CALL      DIV.GETAD10
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 57
DIV._L0212:
                        .LINE     58
                        .BRANCH   17,DIV.PARAMSCALE10
                        CALL      DIV.PARAMSCALE10
                        .ENDBLOCK 59
                        .BRANCH   20,DIV._L0191
                        JMP       DIV._L0191
DIV._L0209:
                        .LINE     60
                        CPI       _ACCA, 50
                        .BRANCH   3,DIV._L0216
                        BREQ      DIV._L0216
                        .BRANCH   20,DIV._L0215
                        JMP       DIV._L0215
DIV._L0216:
DIV._L0214:
                        .BLOCK    61
                        .LINE     61
                        LDS       _ACCB, DIV.AD24temp
                        LDS       _ACCA, DIV.AD24temp+1
                        LDS       _ACCALO, DIV.AD24temp+2
                        LDS       _ACCAHI, DIV.AD24temp+3
                        SUBI      _ACCB, 000800000h AND 0FFh
                        SBCI      _ACCA, 000800000h SHRB 8
                        SBCI      _ACCALO, 000800000h SHRB 16
                        SBCI      _ACCAHI, 000800000h SHRB 24
                        STS       DIV.PARAMLONGINT, _ACCB
                        STS       DIV.PARAMLONGINT+1, _ACCA
                        STS       DIV.PARAMLONGINT+2, _ACCALO
                        STS       DIV.PARAMLONGINT+3, _ACCAHI
                        .LINE     62
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 63
                        .BRANCH   20,DIV._L0191
                        JMP       DIV._L0191
DIV._L0215:
                        .LINE     64
                        CPI       _ACCA, 60
                        .BRANCH   2,DIV._L0219
                        BRCC      DIV._L0219
                        .BRANCH   20,DIV._L0218
                        JMP       DIV._L0218
DIV._L0219:
                        CPI       _ACCA, 62
                        .BRANCH   3,DIV._L0220
                        BREQ      DIV._L0220
                        .BRANCH   1,DIV._L0218
                        BRCS      DIV._L0220
                        .BRANCH   20,DIV._L0218
                        JMP       DIV._L0218
DIV._L0220:
DIV._L0217:
                        .BLOCK    65
                        .LINE     65
                        LDS       _ACCA, DIV.SubCh
                        SUBI      _ACCA, 039h AND 0FFh
                        .FRAME  0
                        CALL       SYSTEM.GETADC
                        CLR       _ACCAHI
                        CLR       _ACCALO
                        STS       DIV.PARAMLONGINT, _ACCB
                        STS       DIV.PARAMLONGINT+1, _ACCA
                        STS       DIV.PARAMLONGINT+2, _ACCALO
                        STS       DIV.PARAMLONGINT+3, _ACCAHI
                        .LINE     66
                        LDS       _ACCA, DIV.SubCh
                        CPI       _ACCA, 03Eh
                        LDI       _ACCA, 0h
                        BRNE      DIV._L0221
                        SER       _ACCA
DIV._L0221:
                        TST       _ACCA
                        .BRANCH   4,DIV._L0224
                        BRNE      DIV._L0224
                        .BRANCH   20,DIV._L0222
                        JMP       DIV._L0222
DIV._L0224:
                        .BLOCK    67
                        .LINE     67
                        LDS       _ACCB, DIV.ParamLongInt
                        LDS       _ACCA, DIV.ParamLongInt+1
                        LDS       _ACCALO, DIV.ParamLongInt+2
                        LDS       _ACCAHI, DIV.ParamLongInt+3
                        SUBI      _ACCB, 000000200h AND 0FFh
                        SBCI      _ACCA, 000000200h SHRB 8
                        SBCI      _ACCALO, 000000200h SHRB 16
                        SBCI      _ACCAHI, 000000200h SHRB 24
                        STS       DIV.PARAMLONGINT, _ACCB
                        STS       DIV.PARAMLONGINT+1, _ACCA
                        STS       DIV.PARAMLONGINT+2, _ACCALO
                        STS       DIV.PARAMLONGINT+3, _ACCAHI
                        .ENDBLOCK 68
DIV._L0222:
DIV._L0223:
                        .LINE     69
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 70
                        .BRANCH   20,DIV._L0191
                        JMP       DIV._L0191
DIV._L0218:
                        .LINE     71
                        CPI       _ACCA, 80
                        .BRANCH   3,DIV._L0227
                        BREQ      DIV._L0227
                        .BRANCH   20,DIV._L0226
                        JMP       DIV._L0226
DIV._L0227:
DIV._L0225:
                        .BLOCK    72
                        .LINE     72
                        LDI       _ACCB, 000000000h AND 0FFh
                        LDI       _ACCA, 000000000h SHRB 8
                        LDI       _ACCALO, 000000000h SHRB 16
                        LDI       _ACCAHI, 000000000h SHRB 24
                        STS       DIV.PARAMLONGINT, _ACCB
                        STS       DIV.PARAMLONGINT+1, _ACCA
                        STS       DIV.PARAMLONGINT+2, _ACCALO
                        STS       DIV.PARAMLONGINT+3, _ACCAHI
                        .LINE     73
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 74
                        .BRANCH   20,DIV._L0191
                        JMP       DIV._L0191
DIV._L0226:
                        .LINE     75
                        CPI       _ACCA, 88
                        .BRANCH   3,DIV._L0230
                        BREQ      DIV._L0230
                        .BRANCH   20,DIV._L0229
                        JMP       DIV._L0229
DIV._L0230:
DIV._L0228:
                        .BLOCK    76
                        .LINE     76
                        LDS       _ACCA, DIV.LCDintegrate
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        CLR       _ACCAHI
                        CLR       _ACCALO
                        STS       DIV.PARAMLONGINT, _ACCB
                        STS       DIV.PARAMLONGINT+1, _ACCA
                        STS       DIV.PARAMLONGINT+2, _ACCALO
                        STS       DIV.PARAMLONGINT+3, _ACCAHI
                        .LINE     77
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 78
                        .BRANCH   20,DIV._L0191
                        JMP       DIV._L0191
DIV._L0229:
                        .LINE     79
                        CPI       _ACCA, 89
                        .BRANCH   3,DIV._L0233
                        BREQ      DIV._L0233
                        .BRANCH   20,DIV._L0232
                        JMP       DIV._L0232
DIV._L0233:
DIV._L0231:
                        .BLOCK    80
                        .LINE     80
                        LDS       _ACCB, DIV.IncRast
                        LDS       _ACCA, DIV.IncRast+1
                        SBRS      _ACCA, 7
                        RJMP      DIV._L0234
                        LDI       _ACCAHI, 0FFh
                        LDI       _ACCALO, 0FFh
                        RJMP      DIV._L0235
DIV._L0234:
                        CLR       _ACCAHI
                        CLR       _ACCALO
DIV._L0235:
                        STS       DIV.PARAMLONGINT, _ACCB
                        STS       DIV.PARAMLONGINT+1, _ACCA
                        STS       DIV.PARAMLONGINT+2, _ACCALO
                        STS       DIV.PARAMLONGINT+3, _ACCAHI
                        .LINE     81
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 82
                        .BRANCH   20,DIV._L0191
                        JMP       DIV._L0191
DIV._L0232:
                        .LINE     83
                        CPI       _ACCA, 99
                        .BRANCH   3,DIV._L0238
                        BREQ      DIV._L0238
                        .BRANCH   20,DIV._L0237
                        JMP       DIV._L0237
DIV._L0238:
DIV._L0236:
                        .BLOCK    84
                        .LINE     84
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DIV.GETAD24
                        CALL      DIV.GETAD24
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     85
                        .BRANCH   17,DIV.PARAMSCALE24
                        CALL      DIV.PARAMSCALE24
                        .LINE     86
                        LDI       _ACCA, 000h
                        STS       DIV.SUBCH, _ACCA
                        .ENDBLOCK 87
                        .BRANCH   20,DIV._L0191
                        JMP       DIV._L0191
DIV._L0237:
                        .LINE     88
                        CPI       _ACCA, 100
                        .BRANCH   2,DIV._L0241
                        BRCC      DIV._L0241
                        .BRANCH   20,DIV._L0240
                        JMP       DIV._L0240
DIV._L0241:
                        CPI       _ACCA, 115
                        .BRANCH   3,DIV._L0242
                        BREQ      DIV._L0242
                        .BRANCH   1,DIV._L0240
                        BRCS      DIV._L0242
                        .BRANCH   20,DIV._L0240
                        JMP       DIV._L0240
DIV._L0242:
DIV._L0239:
                        .BLOCK    89
                        .LINE     89
                        LDI       _ACCCLO, DIV.OffsetArray24 AND 0FFh
                        LDI       _ACCCHI, DIV.OffsetArray24 SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DIV.SubCh
                        SUBI      _ACCA, 064h AND 0FFh
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
                        STS       DIV.PARAMLONGINT, _ACCB
                        STS       DIV.PARAMLONGINT+1, _ACCA
                        STS       DIV.PARAMLONGINT+2, _ACCALO
                        STS       DIV.PARAMLONGINT+3, _ACCAHI
                        .LINE     90
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 91
                        .BRANCH   20,DIV._L0191
                        JMP       DIV._L0191
DIV._L0240:
                        .LINE     92
                        CPI       _ACCA, 120
                        .BRANCH   2,DIV._L0245
                        BRCC      DIV._L0245
                        .BRANCH   20,DIV._L0244
                        JMP       DIV._L0244
DIV._L0245:
                        CPI       _ACCA, 135
                        .BRANCH   3,DIV._L0246
                        BREQ      DIV._L0246
                        .BRANCH   1,DIV._L0244
                        BRCS      DIV._L0246
                        .BRANCH   20,DIV._L0244
                        JMP       DIV._L0244
DIV._L0246:
DIV._L0243:
                        .BLOCK    93
                        .LINE     93
                        LDI       _ACCCLO, DIV.OffsetArray10 AND 0FFh
                        LDI       _ACCCHI, DIV.OffsetArray10 SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DIV.SubCh
                        SUBI      _ACCA, 078h AND 0FFh
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
                        STS       DIV.PARAMLONGINT, _ACCB
                        STS       DIV.PARAMLONGINT+1, _ACCA
                        STS       DIV.PARAMLONGINT+2, _ACCALO
                        STS       DIV.PARAMLONGINT+3, _ACCAHI
                        .LINE     94
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 95
                        .BRANCH   20,DIV._L0191
                        JMP       DIV._L0191
DIV._L0244:
                        .LINE     96
                        CPI       _ACCA, 200
                        .BRANCH   2,DIV._L0249
                        BRCC      DIV._L0249
                        .BRANCH   20,DIV._L0248
                        JMP       DIV._L0248
DIV._L0249:
                        CPI       _ACCA, 215
                        .BRANCH   3,DIV._L0250
                        BREQ      DIV._L0250
                        .BRANCH   1,DIV._L0248
                        BRCS      DIV._L0250
                        .BRANCH   20,DIV._L0248
                        JMP       DIV._L0248
DIV._L0250:
DIV._L0247:
                        .BLOCK    97
                        .LINE     97
                        LDI       _ACCCLO, DIV.ScaleArray24 AND 0FFh
                        LDI       _ACCCHI, DIV.ScaleArray24 SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DIV.SubCh
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
                        STS       DIV.PARAM, _ACCB
                        STS       DIV.PARAM+1, _ACCA
                        STS       DIV.PARAM+2, _ACCALO
                        STS       DIV.PARAM+3, _ACCAHI
                        .ENDBLOCK 98
                        .BRANCH   20,DIV._L0191
                        JMP       DIV._L0191
DIV._L0248:
                        .LINE     99
                        CPI       _ACCA, 220
                        .BRANCH   2,DIV._L0253
                        BRCC      DIV._L0253
                        .BRANCH   20,DIV._L0252
                        JMP       DIV._L0252
DIV._L0253:
                        CPI       _ACCA, 235
                        .BRANCH   3,DIV._L0254
                        BREQ      DIV._L0254
                        .BRANCH   1,DIV._L0252
                        BRCS      DIV._L0254
                        .BRANCH   20,DIV._L0252
                        JMP       DIV._L0252
DIV._L0254:
DIV._L0251:
                        .BLOCK    100
                        .LINE     100
                        LDI       _ACCCLO, DIV.ScaleArray10 AND 0FFh
                        LDI       _ACCCHI, DIV.ScaleArray10 SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DIV.SubCh
                        SUBI      _ACCA, 0DCh AND 0FFh
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
                        STS       DIV.PARAM, _ACCB
                        STS       DIV.PARAM+1, _ACCA
                        STS       DIV.PARAM+2, _ACCALO
                        STS       DIV.PARAM+3, _ACCAHI
                        .ENDBLOCK 101
                        .BRANCH   20,DIV._L0191
                        JMP       DIV._L0191
DIV._L0252:
                        .LINE     102
                        CPI       _ACCA, 240
                        .BRANCH   3,DIV._L0257
                        BREQ      DIV._L0257
                        .BRANCH   20,DIV._L0256
                        JMP       DIV._L0256
DIV._L0257:
DIV._L0255:
                        .BLOCK    103
                        .LINE     103
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .LINE     104
                        LDI       _ACCCLO, DIV.TrigMask AND 0FFh
                        LDI       _ACCCHI, DIV.TrigMask SHRB 8
                        CALL      SYSTEM.ReadEEp8
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        CLR       _ACCAHI
                        CLR       _ACCALO
                        STS       DIV.PARAMLONGINT, _ACCB
                        STS       DIV.PARAMLONGINT+1, _ACCA
                        STS       DIV.PARAMLONGINT+2, _ACCALO
                        STS       DIV.PARAMLONGINT+3, _ACCAHI
                        .ENDBLOCK 105
                        .BRANCH   20,DIV._L0191
                        JMP       DIV._L0191
DIV._L0256:
                        .LINE     106
                        CPI       _ACCA, 247
                        .BRANCH   3,DIV._L0260
                        BREQ      DIV._L0260
                        .BRANCH   20,DIV._L0259
                        JMP       DIV._L0259
DIV._L0260:
DIV._L0258:
                        .BLOCK    107
                        .LINE     107
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .LINE     108
                        LDI       _ACCCLO, DIV.TrigTimerValue AND 0FFh
                        LDI       _ACCCHI, DIV.TrigTimerValue SHRB 8
                        CALL      SYSTEM._ReadEEp16
                        CLR       _ACCAHI
                        CLR       _ACCALO
                        STS       DIV.PARAMLONGINT, _ACCB
                        STS       DIV.PARAMLONGINT+1, _ACCA
                        STS       DIV.PARAMLONGINT+2, _ACCALO
                        STS       DIV.PARAMLONGINT+3, _ACCAHI
                        .ENDBLOCK 109
                        .BRANCH   20,DIV._L0191
                        JMP       DIV._L0191
DIV._L0259:
                        .LINE     110
                        CPI       _ACCA, 249
                        .BRANCH   3,DIV._L0263
                        BREQ      DIV._L0263
                        .BRANCH   20,DIV._L0262
                        JMP       DIV._L0262
DIV._L0263:
DIV._L0261:
                        .BLOCK    111
                        .LINE     111
                        LDI       _ACCA, 0FFh
                        STS       DIV.TRIGGER, _ACCA
                        .LINE     112
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DIV.SERPROMPT
                        CALL      DIV.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     113
                        .BRANCH   20,DIV.ParseGetParam_X
                        JMP       DIV.ParseGetParam_X
                        .ENDBLOCK 114
                        .BRANCH   20,DIV._L0191
                        JMP       DIV._L0191
DIV._L0262:
                        .LINE     115
                        CPI       _ACCA, 251
                        .BRANCH   3,DIV._L0266
                        BREQ      DIV._L0266
                        .BRANCH   20,DIV._L0265
                        JMP       DIV._L0265
DIV._L0266:
DIV._L0264:
                        .BLOCK    116
                        .LINE     116
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .LINE     117
                        LDS       _ACCB, DIV.Errcount
                        LDS       _ACCA, DIV.Errcount+1
                        SBRS      _ACCA, 7
                        RJMP      DIV._L0267
                        LDI       _ACCAHI, 0FFh
                        LDI       _ACCALO, 0FFh
                        RJMP      DIV._L0268
DIV._L0267:
                        CLR       _ACCAHI
                        CLR       _ACCALO
DIV._L0268:
                        STS       DIV.PARAMLONGINT, _ACCB
                        STS       DIV.PARAMLONGINT+1, _ACCA
                        STS       DIV.PARAMLONGINT+2, _ACCALO
                        STS       DIV.PARAMLONGINT+3, _ACCAHI
                        .ENDBLOCK 118
                        .BRANCH   20,DIV._L0191
                        JMP       DIV._L0191
DIV._L0265:
                        .LINE     119
                        CPI       _ACCA, 253
                        .BRANCH   3,DIV._L0271
                        BREQ      DIV._L0271
                        .BRANCH   20,DIV._L0270
                        JMP       DIV._L0270
DIV._L0271:
DIV._L0269:
                        .BLOCK    120
                        .LINE     120
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.Serout SHRB 1
                        LDI       _ACCA, SYSTEM.Serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, DIV.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DIV.SerInpStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     121
                        .BRANCH   17,DIV.SERCRLF
                        CALL      DIV.SERCRLF
                        .LINE     122
                        .BRANCH   20,DIV.ParseGetParam_X
                        JMP       DIV.ParseGetParam_X
                        .ENDBLOCK 123
                        .BRANCH   20,DIV._L0191
                        JMP       DIV._L0191
DIV._L0270:
                        .LINE     124
                        CPI       _ACCA, 254
                        .BRANCH   3,DIV._L0274
                        BREQ      DIV._L0274
                        .BRANCH   20,DIV._L0273
                        JMP       DIV._L0273
DIV._L0274:
DIV._L0272:
                        .BLOCK    125
                        .LINE     125
                        .BRANCH   17,DIV.WRITECHPREFIX
                        CALL      DIV.WRITECHPREFIX
                        .LINE     126
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.Serout SHRB 1
                        LDI       _ACCA, SYSTEM.Serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, DIV.Vers1Str AND 0FFh
                        LDI       _ACCCHI, DIV.Vers1Str SHRB 8
                        LPM       _ACCBHI, Z+
                        TST       _ACCBHI
                        BREQ      DIV._L0275
                        CALL      SYSTEM.StrConst2Str
DIV._L0275:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     127
                        .BRANCH   17,DIV.SERCRLF
                        CALL      DIV.SERCRLF
                        .LINE     128
                        .BRANCH   20,DIV.ParseGetParam_X
                        JMP       DIV.ParseGetParam_X
                        .ENDBLOCK 129
                        .BRANCH   20,DIV._L0191
                        JMP       DIV._L0191
DIV._L0273:
                        .LINE     130
                        CPI       _ACCA, 255
                        .BRANCH   3,DIV._L0278
                        BREQ      DIV._L0278
                        .BRANCH   20,DIV._L0277
                        JMP       DIV._L0277
DIV._L0278:
DIV._L0276:
                        .BLOCK    131
                        .LINE     131
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DIV.SERPROMPT
                        CALL      DIV.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     132
                        .BRANCH   20,DIV.ParseGetParam_X
                        JMP       DIV.ParseGetParam_X
                        .ENDBLOCK 133
                        .BRANCH   20,DIV._L0191
                        JMP       DIV._L0191
DIV._L0277:
                        .BLOCK    134
                        .LINE     135
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 005h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DIV.SERPROMPT
                        CALL      DIV.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     136
                        .BRANCH   20,DIV.ParseGetParam_X
                        JMP       DIV.ParseGetParam_X
                        .ENDBLOCK 137
DIV._L0191:
                        .LINE     138
                        LDD       _ACCA, Y+000h
                        TST       _ACCA
                        .BRANCH   4,DIV._L0281
                        BRNE      DIV._L0281
                        .BRANCH   20,DIV._L0279
                        JMP       DIV._L0279
DIV._L0281:
                        .BLOCK    138
                        .LINE     139
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DIV.WRITEPARAMLONGINTSER
                        CALL      DIV.WRITEPARAMLONGINTSER
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 140
                        .BRANCH   20,DIV._L0280
                        JMP       DIV._L0280
DIV._L0279:
                        .BLOCK    140
                        .LINE     141
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCB, 001D4h
                        CLR       _ACCA
                        SBRC      _ACCB, 005h
                        SER       _ACCA
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DIV.WRITEPARAMSER
                        CALL      DIV.WRITEPARAMSER
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 142
DIV._L0280:
                        .ENDBLOCK 143
DIV.ParseGetParam_X:
                        .LINE     143
                        .BRANCH   19
                        RET
                        .ENDFUNC  143

                        .FUNC     ParseSetParam, 00092h, 00020h
DIV.ParseSetParam:
                        .BLOCK    148
                        .LINE     148
                        LDI       _ACCA, 000h
                        STS       DIV.CHECKLIMITERR, _ACCA
                        .LINE     149
                        LDS       _ACCA, DIV.SubCh
                        .LINE     150
                        CPI       _ACCA, 19
                        .BRANCH   3,DIV._L0285
                        BREQ      DIV._L0285
                        .BRANCH   20,DIV._L0284
                        JMP       DIV._L0284
DIV._L0285:
DIV._L0283:
                        .BLOCK    151
                        .LINE     151
                        LDS       _ACCA, DIV.ParamByte
                        STS       DIV.RANGE, _ACCA
                        .LINE     152
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DIV.CHECKLIMITS
                        CALL       DIV.CHECKLIMITS
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     153
                        .BRANCH   17,DIV.SWITCHRANGE
                        CALL      DIV.SWITCHRANGE
                        .LINE     154
                        .BRANCH   17,DIV.SHOWRANGE
                        CALL      DIV.SHOWRANGE
                        .ENDBLOCK 155
                        .BRANCH   20,DIV._L0282
                        JMP       DIV._L0282
DIV._L0284:
                        .LINE     156
                        CPI       _ACCA, 88
                        .BRANCH   3,DIV._L0288
                        BREQ      DIV._L0288
                        .BRANCH   20,DIV._L0287
                        JMP       DIV._L0287
DIV._L0288:
DIV._L0286:
                        .BLOCK    157
                        .LINE     157
                        LDS       _ACCB, 001D4h
                        CLR       _ACCA
                        SBRC      _ACCB, 004h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DIV._L0291
                        BRNE      DIV._L0291
                        .BRANCH   20,DIV._L0289
                        JMP       DIV._L0289
DIV._L0291:
                        .BLOCK    157
                        .LINE     158
                        LDS       _ACCA, DIV.ParamByte
                        STS       DIV.LCDINTEGRATE, _ACCA
                        .LINE     159
                        LDS       _ACCA, DIV.LCDintegrate
                        LDI       _ACCCLO, DIV.INITLCDINTEGRATE AND 0FFh
                        LDI       _ACCCHI, DIV.INITLCDINTEGRATE SHRB 8
                        CALL      SYSTEM.WriteEEp8
                        ADIW      _ACCCLO, 01h
                        .ENDBLOCK 160
                        .BRANCH   20,DIV._L0290
                        JMP       DIV._L0290
DIV._L0289:
                        .BLOCK    160
                        .LINE     161
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 006h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DIV.SERPROMPT
                        CALL      DIV.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     162
                        .BRANCH   20,DIV.ParseSetParam_X
                        JMP       DIV.ParseSetParam_X
                        .ENDBLOCK 163
DIV._L0290:
                        .ENDBLOCK 164
                        .BRANCH   20,DIV._L0282
                        JMP       DIV._L0282
DIV._L0287:
                        .LINE     165
                        CPI       _ACCA, 89
                        .BRANCH   3,DIV._L0294
                        BREQ      DIV._L0294
                        .BRANCH   20,DIV._L0293
                        JMP       DIV._L0293
DIV._L0294:
DIV._L0292:
                        .BLOCK    166
                        .LINE     166
                        LDS       _ACCB, 001D4h
                        CLR       _ACCA
                        SBRC      _ACCB, 004h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DIV._L0297
                        BRNE      DIV._L0297
                        .BRANCH   20,DIV._L0295
                        JMP       DIV._L0295
DIV._L0297:
                        .BLOCK    166
                        .LINE     167
                        LDS       _ACCB, DIV.ParamLongInt
                        LDS       _ACCA, DIV.ParamLongInt+1
                        LDS       _ACCALO, DIV.ParamLongInt+2
                        LDS       _ACCAHI, DIV.ParamLongInt+3
                        STS       DIV.INCRAST, _ACCB
                        STS       DIV.INCRAST+1, _ACCA
                        .LINE     168
                        LDS       _ACCB, DIV.IncRast
                        LDS       _ACCA, DIV.IncRast+1
                        LDI       _ACCCLO, DIV.INITINCRAST AND 0FFh
                        LDI       _ACCCHI, DIV.INITINCRAST SHRB 8
                        MOVW      _ACCALO, _ACCB
                        CALL      SYSTEM._WriteEEp16
                        ADIW      _ACCCLO, 01h
                        .ENDBLOCK 169
                        .BRANCH   20,DIV._L0296
                        JMP       DIV._L0296
DIV._L0295:
                        .BLOCK    169
                        .LINE     170
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 006h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DIV.SERPROMPT
                        CALL      DIV.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     171
                        .BRANCH   20,DIV.ParseSetParam_X
                        JMP       DIV.ParseSetParam_X
                        .ENDBLOCK 172
DIV._L0296:
                        .ENDBLOCK 173
                        .BRANCH   20,DIV._L0282
                        JMP       DIV._L0282
DIV._L0293:
                        .LINE     174
                        CPI       _ACCA, 100
                        .BRANCH   2,DIV._L0300
                        BRCC      DIV._L0300
                        .BRANCH   20,DIV._L0299
                        JMP       DIV._L0299
DIV._L0300:
                        CPI       _ACCA, 115
                        .BRANCH   3,DIV._L0301
                        BREQ      DIV._L0301
                        .BRANCH   1,DIV._L0299
                        BRCS      DIV._L0301
                        .BRANCH   20,DIV._L0299
                        JMP       DIV._L0299
DIV._L0301:
DIV._L0298:
                        .BLOCK    175
                        .LINE     175
                        LDS       _ACCB, 001D4h
                        CLR       _ACCA
                        SBRC      _ACCB, 004h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DIV._L0304
                        BRNE      DIV._L0304
                        .BRANCH   20,DIV._L0302
                        JMP       DIV._L0302
DIV._L0304:
                        .BLOCK    175
                        .LINE     176
                        LDI       _ACCCLO, DIV.OffsetArray24 AND 0FFh
                        LDI       _ACCCHI, DIV.OffsetArray24 SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DIV.SubCh
                        SUBI      _ACCA, 064h AND 0FFh
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
                        LDS       _ACCB, DIV.ParamLongInt
                        LDS       _ACCA, DIV.ParamLongInt+1
                        LDS       _ACCALO, DIV.ParamLongInt+2
                        LDS       _ACCAHI, DIV.ParamLongInt+3
                        POP       _ACCCHI
                        POP       _ACCCLO
                        MOVW      _ACCBLO, _ACCB
                        CALL      SYSTEM._WriteEEp32
                        .ENDBLOCK 177
                        .BRANCH   20,DIV._L0303
                        JMP       DIV._L0303
DIV._L0302:
                        .BLOCK    177
                        .LINE     178
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 006h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DIV.SERPROMPT
                        CALL      DIV.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     179
                        .BRANCH   20,DIV.ParseSetParam_X
                        JMP       DIV.ParseSetParam_X
                        .ENDBLOCK 180
DIV._L0303:
                        .ENDBLOCK 181
                        .BRANCH   20,DIV._L0282
                        JMP       DIV._L0282
DIV._L0299:
                        .LINE     182
                        CPI       _ACCA, 120
                        .BRANCH   2,DIV._L0307
                        BRCC      DIV._L0307
                        .BRANCH   20,DIV._L0306
                        JMP       DIV._L0306
DIV._L0307:
                        CPI       _ACCA, 135
                        .BRANCH   3,DIV._L0308
                        BREQ      DIV._L0308
                        .BRANCH   1,DIV._L0306
                        BRCS      DIV._L0308
                        .BRANCH   20,DIV._L0306
                        JMP       DIV._L0306
DIV._L0308:
DIV._L0305:
                        .BLOCK    183
                        .LINE     183
                        LDS       _ACCB, 001D4h
                        CLR       _ACCA
                        SBRC      _ACCB, 004h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DIV._L0311
                        BRNE      DIV._L0311
                        .BRANCH   20,DIV._L0309
                        JMP       DIV._L0309
DIV._L0311:
                        .BLOCK    183
                        .LINE     184
                        LDI       _ACCCLO, DIV.OffsetArray10 AND 0FFh
                        LDI       _ACCCHI, DIV.OffsetArray10 SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DIV.SubCh
                        SUBI      _ACCA, 078h AND 0FFh
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
                        LDS       _ACCB, DIV.ParamLongInt
                        LDS       _ACCA, DIV.ParamLongInt+1
                        LDS       _ACCALO, DIV.ParamLongInt+2
                        LDS       _ACCAHI, DIV.ParamLongInt+3
                        POP       _ACCCHI
                        POP       _ACCCLO
                        MOVW      _ACCBLO, _ACCB
                        CALL      SYSTEM._WriteEEp32
                        .ENDBLOCK 185
                        .BRANCH   20,DIV._L0310
                        JMP       DIV._L0310
DIV._L0309:
                        .BLOCK    185
                        .LINE     186
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 006h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DIV.SERPROMPT
                        CALL      DIV.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     187
                        .BRANCH   20,DIV.ParseSetParam_X
                        JMP       DIV.ParseSetParam_X
                        .ENDBLOCK 188
DIV._L0310:
                        .ENDBLOCK 189
                        .BRANCH   20,DIV._L0282
                        JMP       DIV._L0282
DIV._L0306:
                        .LINE     190
                        CPI       _ACCA, 200
                        .BRANCH   2,DIV._L0314
                        BRCC      DIV._L0314
                        .BRANCH   20,DIV._L0313
                        JMP       DIV._L0313
DIV._L0314:
                        CPI       _ACCA, 215
                        .BRANCH   3,DIV._L0315
                        BREQ      DIV._L0315
                        .BRANCH   1,DIV._L0313
                        BRCS      DIV._L0315
                        .BRANCH   20,DIV._L0313
                        JMP       DIV._L0313
DIV._L0315:
DIV._L0312:
                        .BLOCK    191
                        .LINE     191
                        LDS       _ACCB, 001D4h
                        CLR       _ACCA
                        SBRC      _ACCB, 004h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DIV._L0318
                        BRNE      DIV._L0318
                        .BRANCH   20,DIV._L0316
                        JMP       DIV._L0316
DIV._L0318:
                        .BLOCK    191
                        .LINE     192
                        LDI       _ACCCLO, DIV.ScaleArray24 AND 0FFh
                        LDI       _ACCCHI, DIV.ScaleArray24 SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DIV.SubCh
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
                        LDS       _ACCB, DIV.Param
                        LDS       _ACCA, DIV.Param+1
                        LDS       _ACCALO, DIV.Param+2
                        LDS       _ACCAHI, DIV.Param+3
                        POP       _ACCCHI
                        POP       _ACCCLO
                        MOVW      _ACCBLO, _ACCB
                        CALL      SYSTEM._WriteEEp32
                        .ENDBLOCK 193
                        .BRANCH   20,DIV._L0317
                        JMP       DIV._L0317
DIV._L0316:
                        .BLOCK    193
                        .LINE     194
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 006h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DIV.SERPROMPT
                        CALL      DIV.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     195
                        .BRANCH   20,DIV.ParseSetParam_X
                        JMP       DIV.ParseSetParam_X
                        .ENDBLOCK 196
DIV._L0317:
                        .ENDBLOCK 197
                        .BRANCH   20,DIV._L0282
                        JMP       DIV._L0282
DIV._L0313:
                        .LINE     198
                        CPI       _ACCA, 220
                        .BRANCH   2,DIV._L0321
                        BRCC      DIV._L0321
                        .BRANCH   20,DIV._L0320
                        JMP       DIV._L0320
DIV._L0321:
                        CPI       _ACCA, 235
                        .BRANCH   3,DIV._L0322
                        BREQ      DIV._L0322
                        .BRANCH   1,DIV._L0320
                        BRCS      DIV._L0322
                        .BRANCH   20,DIV._L0320
                        JMP       DIV._L0320
DIV._L0322:
DIV._L0319:
                        .BLOCK    199
                        .LINE     199
                        LDS       _ACCB, 001D4h
                        CLR       _ACCA
                        SBRC      _ACCB, 004h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DIV._L0325
                        BRNE      DIV._L0325
                        .BRANCH   20,DIV._L0323
                        JMP       DIV._L0323
DIV._L0325:
                        .BLOCK    199
                        .LINE     200
                        LDI       _ACCCLO, DIV.ScaleArray10 AND 0FFh
                        LDI       _ACCCHI, DIV.ScaleArray10 SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DIV.SubCh
                        SUBI      _ACCA, 0DCh AND 0FFh
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
                        LDS       _ACCB, DIV.Param
                        LDS       _ACCA, DIV.Param+1
                        LDS       _ACCALO, DIV.Param+2
                        LDS       _ACCAHI, DIV.Param+3
                        POP       _ACCCHI
                        POP       _ACCCLO
                        MOVW      _ACCBLO, _ACCB
                        CALL      SYSTEM._WriteEEp32
                        .ENDBLOCK 201
                        .BRANCH   20,DIV._L0324
                        JMP       DIV._L0324
DIV._L0323:
                        .BLOCK    201
                        .LINE     202
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 006h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DIV.SERPROMPT
                        CALL      DIV.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     203
                        .BRANCH   20,DIV.ParseSetParam_X
                        JMP       DIV.ParseSetParam_X
                        .ENDBLOCK 204
DIV._L0324:
                        .ENDBLOCK 205
                        .BRANCH   20,DIV._L0282
                        JMP       DIV._L0282
DIV._L0320:
                        .LINE     206
                        CPI       _ACCA, 240
                        .BRANCH   3,DIV._L0328
                        BREQ      DIV._L0328
                        .BRANCH   20,DIV._L0327
                        JMP       DIV._L0327
DIV._L0328:
DIV._L0326:
                        .BLOCK    207
                        .LINE     207
                        LDS       _ACCB, 001D4h
                        CLR       _ACCA
                        SBRC      _ACCB, 004h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DIV._L0331
                        BRNE      DIV._L0331
                        .BRANCH   20,DIV._L0329
                        JMP       DIV._L0329
DIV._L0331:
                        .BLOCK    207
                        .LINE     208
                        LDS       _ACCA, DIV.ParamByte
                        LDI       _ACCCLO, DIV.TRIGMASK AND 0FFh
                        LDI       _ACCCHI, DIV.TRIGMASK SHRB 8
                        CALL      SYSTEM.WriteEEp8
                        ADIW      _ACCCLO, 01h
                        .ENDBLOCK 209
                        .BRANCH   20,DIV._L0330
                        JMP       DIV._L0330
DIV._L0329:
                        .BLOCK    209
                        .LINE     210
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 006h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DIV.SERPROMPT
                        CALL      DIV.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     211
                        .BRANCH   20,DIV.ParseSetParam_X
                        JMP       DIV.ParseSetParam_X
                        .ENDBLOCK 212
DIV._L0330:
                        .ENDBLOCK 213
                        .BRANCH   20,DIV._L0282
                        JMP       DIV._L0282
DIV._L0327:
                        .LINE     214
                        CPI       _ACCA, 247
                        .BRANCH   3,DIV._L0334
                        BREQ      DIV._L0334
                        .BRANCH   20,DIV._L0333
                        JMP       DIV._L0333
DIV._L0334:
DIV._L0332:
                        .BLOCK    215
                        .LINE     215
                        LDS       _ACCB, 001D4h
                        CLR       _ACCA
                        SBRC      _ACCB, 004h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DIV._L0337
                        BRNE      DIV._L0337
                        .BRANCH   20,DIV._L0335
                        JMP       DIV._L0335
DIV._L0337:
                        .BLOCK    215
                        .LINE     216
                        LDS       _ACCB, DIV.ParamLongInt
                        LDS       _ACCA, DIV.ParamLongInt+1
                        LDS       _ACCALO, DIV.ParamLongInt+2
                        LDS       _ACCAHI, DIV.ParamLongInt+3
                        SET
                        BLD       Flags, _NEGATIVE
                        LDI       _ACCBLO, 000000001h AND 0FFh
                        LDI       _ACCBHI, 000000001h SHRB 8
                        LDI       _ACCCLO, 000000001h SHRB 16
                        LDI       _ACCCHI, 000000001h SHRB 24
                        CLR       _ACCDHI
                        CALL      SYSTEM.High32i
                        TST       _ACCDHI
                        .BRANCH   6,DIV._L0339
                        BRPL      DIV._L0339
                        LDI       _ACCBLO, 000000009h AND 0FFh
                        LDI       _ACCBHI, 000000009h SHRB 8
                        LDI       _ACCCLO, 000000009h SHRB 16
                        LDI       _ACCCHI, 000000009h SHRB 24
                        CLR       _ACCDHI
                        CALL      SYSTEM.High32i
                        TST       _ACCDHI
                        .BRANCH   5,DIV._L0339
                        BRMI      DIV._L0339
                        CLR       _ACCA
                        .BRANCH   20,DIV._L0338
                        RJMP      DIV._L0338
DIV._L0339:
                        LDI       _ACCA, 0FFh
DIV._L0338:
                        LDI       _ACCA, 0h
                        BRNE      DIV._L0340
                        SER       _ACCA
DIV._L0340:
                        TST       _ACCA
                        .BRANCH   4,DIV._L0343
                        BRNE      DIV._L0343
                        .BRANCH   20,DIV._L0341
                        JMP       DIV._L0341
DIV._L0343:
                        .BLOCK    216
                        .LINE     217
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 005h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DIV.SERPROMPT
                        CALL      DIV.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     218
                        .BRANCH   20,DIV.ParseSetParam_X
                        JMP       DIV.ParseSetParam_X
                        .ENDBLOCK 219
                        .BRANCH   20,DIV._L0342
                        JMP       DIV._L0342
DIV._L0341:
                        .BLOCK    219
                        .LINE     220
                        LDS       _ACCB, DIV.ParamLongInt
                        LDS       _ACCA, DIV.ParamLongInt+1
                        LDS       _ACCALO, DIV.ParamLongInt+2
                        LDS       _ACCAHI, DIV.ParamLongInt+3
                        LDI       _ACCCLO, DIV.TRIGTIMERVALUE AND 0FFh
                        LDI       _ACCCHI, DIV.TRIGTIMERVALUE SHRB 8
                        MOVW      _ACCALO, _ACCB
                        CALL      SYSTEM._WriteEEp16
                        ADIW      _ACCCLO, 01h
                        .ENDBLOCK 221
DIV._L0342:
                        .ENDBLOCK 222
                        .BRANCH   20,DIV._L0336
                        JMP       DIV._L0336
DIV._L0335:
                        .BLOCK    222
                        .LINE     223
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 006h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DIV.SERPROMPT
                        CALL      DIV.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     224
                        .BRANCH   20,DIV.ParseSetParam_X
                        JMP       DIV.ParseSetParam_X
                        .ENDBLOCK 225
DIV._L0336:
                        .ENDBLOCK 226
                        .BRANCH   20,DIV._L0282
                        JMP       DIV._L0282
DIV._L0333:
                        .LINE     227
                        CPI       _ACCA, 249
                        .BRANCH   3,DIV._L0346
                        BREQ      DIV._L0346
                        .BRANCH   20,DIV._L0345
                        JMP       DIV._L0345
DIV._L0346:
DIV._L0344:
                        .BLOCK    228
                        .LINE     228
                        LDI       _ACCA, 0FFh
                        STS       DIV.TRIGGER, _ACCA
                        .LINE     229
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DIV.SERPROMPT
                        CALL      DIV.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     230
                        .BRANCH   20,DIV.ParseSetParam_X
                        JMP       DIV.ParseSetParam_X
                        .ENDBLOCK 231
                        .BRANCH   20,DIV._L0282
                        JMP       DIV._L0282
DIV._L0345:
                        .LINE     232
                        CPI       _ACCA, 251
                        .BRANCH   3,DIV._L0349
                        BREQ      DIV._L0349
                        .BRANCH   20,DIV._L0348
                        JMP       DIV._L0348
DIV._L0349:
DIV._L0347:
                        .BLOCK    233
                        .LINE     233
                        LDS       _ACCB, DIV.ParamLongInt
                        LDS       _ACCA, DIV.ParamLongInt+1
                        LDS       _ACCALO, DIV.ParamLongInt+2
                        LDS       _ACCAHI, DIV.ParamLongInt+3
                        STS       DIV.ERRCOUNT, _ACCB
                        STS       DIV.ERRCOUNT+1, _ACCA
                        .ENDBLOCK 234
                        .BRANCH   20,DIV._L0282
                        JMP       DIV._L0282
DIV._L0348:
                        .LINE     235
                        CPI       _ACCA, 250
                        .BRANCH   3,DIV._L0352
                        BREQ      DIV._L0352
                        .BRANCH   20,DIV._L0351
                        JMP       DIV._L0351
DIV._L0352:
DIV._L0350:
                        .BRANCH   20,DIV._L0282
                        JMP       DIV._L0282
DIV._L0351:
                        .BLOCK    237
                        .LINE     238
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 005h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DIV.SERPROMPT
                        CALL      DIV.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     239
                        .BRANCH   20,DIV.ParseSetParam_X
                        JMP       DIV.ParseSetParam_X
                        .ENDBLOCK 240
DIV._L0282:
                        .LINE     241
                        LDS       _ACCA, 001D4h
                        CBR       _ACCA, 010h
                        STS       001D4h, _ACCA
                        .LINE     242
                        LDS       _ACCA, DIV.SubCh
                        CPI       _ACCA, 0FAh
                        LDI       _ACCA, 0h
                        BRNE      DIV._L0353
                        SER       _ACCA
DIV._L0353:
                        TST       _ACCA
                        .BRANCH   4,DIV._L0356
                        BRNE      DIV._L0356
                        .BRANCH   20,DIV._L0354
                        JMP       DIV._L0354
DIV._L0356:
                        .BLOCK    243
                        .LINE     243
                        LDS       _ACCA, 001D4h
                        SBR       _ACCA, 010h
                        STS       001D4h, _ACCA
                        .ENDBLOCK 244
DIV._L0354:
DIV._L0355:
                        .LINE     245
                        LDS       _ACCA, DIV.verbose
                        PUSH      _ACCA
                        LDS       _ACCA, DIV.CheckLimitErr
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      DIV._L0357
                        SER       _ACCA
DIV._L0357:
                        POP       _ACCB
                        OR        _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   4,DIV._L0360
                        BRNE      DIV._L0360
                        .BRANCH   20,DIV._L0358
                        JMP       DIV._L0358
DIV._L0360:
                        .BLOCK    245
                        .LINE     246
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCA, DIV.CheckLimitErr
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DIV.SERPROMPT
                        CALL      DIV.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 247
DIV._L0358:
DIV._L0359:
                        .ENDBLOCK 248
DIV.ParseSetParam_X:
                        .LINE     248
                        .BRANCH   19
                        RET
                        .ENDFUNC  248

                        .FUNC     Cmd2Index, 000FCh, 00020h
DIV.Cmd2Index:
                        SBIW      _FRAMEPTR, 1
                        .BLOCK    255
                        .LINE     256
                        LDI       _ACCCLO, DIV.ParamStr AND 0FFh
                        LDI       _ACCCHI, DIV.ParamStr SHRB 8
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
                        LDI       _ACCCLO, DIV.ParamStr AND 0FFh
                        LDI       _ACCCHI, DIV.ParamStr SHRB 8
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
                        .LINE     257
                        .LOOP
                        MOVW      _ACCCLO, _FRAMEPTR
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 000h
                        ST        Z, _ACCA
                        LDI       _ACCA, 00Fh
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
DIV._L0363:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      DIV._L0364
                        CLR       _ACCA
DIV._L0364:
                        TST       _ACCA
                        .BRANCH   3,DIV._L0365
                        BREQ      DIV._L0365
                        .BRANCH   20,DIV._L0362
                        JMP       DIV._L0362
DIV._L0365:
                        .BLOCK    258
                        .LINE     258
                        LDI       _ACCCLO, DIV.ParamStr AND 0FFh
                        LDI       _ACCCHI, DIV.ParamStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCCLO, DIV.CmdStrArr AND 0FFh
                        LDI       _ACCCHI, DIV.CmdStrArr SHRB 8
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
                        BRNE      DIV._L0366
                        SER       _ACCA
DIV._L0366:
                        TST       _ACCA
                        .BRANCH   4,DIV._L0369
                        BRNE      DIV._L0369
                        .BRANCH   20,DIV._L0367
                        JMP       DIV._L0367
DIV._L0369:
                        .BLOCK    258
                        .LINE     259
                        LDD       _ACCA, Y+003h
                        ADIW      _FRAMEPTR, 3
                        .BRANCH   20,DIV.Cmd2Index_X
                        JMP       DIV.Cmd2Index_X
                        .ENDBLOCK 260
DIV._L0367:
DIV._L0368:
                        .ENDBLOCK 261
DIV._L0361:
                        .LINE     261
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,DIV._L0362
                        BREQ      DIV._L0362
                        .BRANCH   20,DIV._L0363
                        JMP       DIV._L0363
DIV._L0362:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .LINE     262
                        LDI       _ACCA, 010h
                        .ENDBLOCK 263
DIV.Cmd2Index_X:
                        .LINE     263
                        .BRANCH   19
                        RET
                        .ENDFUNC  263

                        .FUNC     ParseExtract, 00109h, 00020h
DIV.ParseExtract:
                        SBIW      _FRAMEPTR, 2
                        .BLOCK    269
                        .LINE     270
                        LDI       _ACCCLO, DIV.ParamStr AND 0FFh
                        LDI       _ACCCHI, DIV.ParamStr SHRB 8
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
                        .LINE     271
                        LDI       _ACCA, 000h
                        STD       Y+000h, _ACCA
                        .LINE     272
DIV._L0370:
                        LDI       _ACCCLO, DIV.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DIV.SerInpStr SHRB 8
                        LDS       _ACCA, DIV.SerInpPtr
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCA, Z+
                        CPI       _ACCA, 020h
                        LDI       _ACCA, 0h
                        BRNE      DIV._L0372
                        SER       _ACCA
DIV._L0372:
                        TST       _ACCA
                        .BRANCH   4,DIV._L0373
                        BRNE      DIV._L0373
                        .BRANCH   20,DIV._L0371
                        JMP       DIV._L0371
DIV._L0373:
                        .BLOCK    273
                        .LINE     273
                        LDS       _ACCA, DIV.SerInpPtr
                        INC       _ACCA
                        STS       DIV.SerInpPtr, _ACCA
                        .ENDBLOCK 274
                        .LINE     274
                        .BRANCH   20,DIV._L0370
                        JMP       DIV._L0370
DIV._L0371:
                        .LINE     275
                        LDI       _ACCCLO, DIV.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DIV.SerInpStr SHRB 8
                        LDS       _ACCA, DIV.SerInpPtr
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCA, Z+
                        CPI       _ACCA, 039h
                        .BRANCH   3,DIV._L0374
                        BREQ      DIV._L0374
                        .BRANCH   1,DIV._L0375
                        BRSH      DIV._L0375
                        CPI       _ACCA, 02Ah
                        .BRANCH   1,DIV._L0375
                        BRLO      DIV._L0375
                        CLR       _ACCDLO
                        .BRANCH   20,DIV._L0374
                        RJMP      DIV._L0374
DIV._L0375:
                        LDI       _ACCDLO, 001h
DIV._L0374:
                        LDI       _ACCA, 0h
                        BRNE      DIV._L0376
                        SER       _ACCA
DIV._L0376:
                        TST       _ACCA
                        .BRANCH   4,DIV._L0379
                        BRNE      DIV._L0379
                        .BRANCH   20,DIV._L0377
                        JMP       DIV._L0377
DIV._L0379:
                        .BLOCK    276
                        .LINE     276
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .LINE     277
                        .LOOP
                        LDI       _ACCCLO, DIV.i AND 0FFh
                        LDI       _ACCCHI, DIV.i SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDS       _ACCA, DIV.SerInpPtr
                        ST        Z, _ACCA
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCCLO, DIV.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DIV.SerInpStr SHRB 8
                        LD        _ACCA, Z
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
DIV._L0382:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      DIV._L0383
                        CLR       _ACCA
DIV._L0383:
                        TST       _ACCA
                        .BRANCH   3,DIV._L0384
                        BREQ      DIV._L0384
                        .BRANCH   20,DIV._L0381
                        JMP       DIV._L0381
DIV._L0384:
                        .BLOCK    278
                        .LINE     278
                        LDI       _ACCCLO, DIV.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DIV.SerInpStr SHRB 8
                        MOV       _ACCA, DIV.i
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCA, Z+
                        STD       Y+004h, _ACCA
                        .LINE     279
                        LDD       _ACCA, Y+004h
                        CPI       _ACCA, 039h
                        LDI       _ACCA, 0FFh
                        BRLO      DIV._L0385
                        BREQ      DIV._L0385
                        CLR       _ACCA
DIV._L0385:
                        TST       _ACCA
                        .BRANCH   4,DIV._L0388
                        BRNE      DIV._L0388
                        .BRANCH   20,DIV._L0386
                        JMP       DIV._L0386
DIV._L0388:
                        .BLOCK    279
                        .LINE     280
                        LDD       _ACCA, Y+004h
                        MOV       _ACCEHI, _ACCA
                        LDI       _ACCELO, 001h
                        LDI       _ACCA, _ACCELO SHRB 8
                        LDI       _ACCB, _ACCELO AND 0FFh
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDI       _ACCCLO, DIV.ParamStr AND 0FFh
                        LDI       _ACCCHI, DIV.ParamStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCA, 028h
                        PUSH      _ACCA
                        LDI       _ACCFHI, 000h
                        CALL      SYSTEM.StringAppend
                        .ENDBLOCK 282
                        .BRANCH   20,DIV._L0387
                        JMP       DIV._L0387
DIV._L0386:
                        .BLOCK    282
                        .LINE     282
                        MOV       _ACCA, DIV.i
                        STS       DIV.SERINPPTR, _ACCA
                        .LINE     283
                        LDD       _ACCA, Y+003h
                        ADIW      _FRAMEPTR, 3
                        .BRANCH   20,DIV.ParseExtract_X
                        JMP       DIV.ParseExtract_X
                        .ENDBLOCK 284
DIV._L0387:
                        .ENDBLOCK 285
DIV._L0380:
                        .LINE     285
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,DIV._L0381
                        BREQ      DIV._L0381
                        .BRANCH   20,DIV._L0382
                        JMP       DIV._L0382
DIV._L0381:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .ENDBLOCK 286
                        .BRANCH   20,DIV._L0378
                        JMP       DIV._L0378
DIV._L0377:
                        .BLOCK    286
                        .LINE     287
                        .LOOP
                        LDI       _ACCCLO, DIV.i AND 0FFh
                        LDI       _ACCCHI, DIV.i SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDS       _ACCA, DIV.SerInpPtr
                        ST        Z, _ACCA
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCCLO, DIV.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DIV.SerInpStr SHRB 8
                        LD        _ACCA, Z
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
DIV._L0391:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      DIV._L0392
                        CLR       _ACCA
DIV._L0392:
                        TST       _ACCA
                        .BRANCH   3,DIV._L0393
                        BREQ      DIV._L0393
                        .BRANCH   20,DIV._L0390
                        JMP       DIV._L0390
DIV._L0393:
                        .BLOCK    288
                        .LINE     288
                        LDI       _ACCCLO, DIV.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DIV.SerInpStr SHRB 8
                        MOV       _ACCA, DIV.i
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCA, Z+
                        STD       Y+004h, _ACCA
                        .LINE     289
                        LDD       _ACCA, Y+004h
                        CPI       _ACCA, 041h
                        LDI       _ACCA, 0
                        BRLO      DIV._L0394
                        LDI       _ACCA, 0FFh
DIV._L0394:
                        TST       _ACCA
                        .BRANCH   4,DIV._L0397
                        BRNE      DIV._L0397
                        .BRANCH   20,DIV._L0395
                        JMP       DIV._L0395
DIV._L0397:
                        .BLOCK    289
                        .LINE     290
                        LDD       _ACCA, Y+004h
                        MOV       _ACCEHI, _ACCA
                        LDI       _ACCELO, 001h
                        LDI       _ACCA, _ACCELO SHRB 8
                        LDI       _ACCB, _ACCELO AND 0FFh
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDI       _ACCCLO, DIV.ParamStr AND 0FFh
                        LDI       _ACCCHI, DIV.ParamStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCA, 028h
                        PUSH      _ACCA
                        LDI       _ACCFHI, 000h
                        CALL      SYSTEM.StringAppend
                        .ENDBLOCK 292
                        .BRANCH   20,DIV._L0396
                        JMP       DIV._L0396
DIV._L0395:
                        .BLOCK    292
                        .LINE     292
                        MOV       _ACCA, DIV.i
                        STS       DIV.SERINPPTR, _ACCA
                        .LINE     293
                        LDD       _ACCA, Y+003h
                        ADIW      _FRAMEPTR, 3
                        .BRANCH   20,DIV.ParseExtract_X
                        JMP       DIV.ParseExtract_X
                        .ENDBLOCK 294
DIV._L0396:
                        .ENDBLOCK 295
DIV._L0389:
                        .LINE     295
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,DIV._L0390
                        BREQ      DIV._L0390
                        .BRANCH   20,DIV._L0391
                        JMP       DIV._L0391
DIV._L0390:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .ENDBLOCK 296
DIV._L0378:
                        .LINE     297
                        LDD       _ACCA, Y+000h
                        .ENDBLOCK 298
DIV.ParseExtract_X:
                        .LINE     298
                        .BRANCH   19
                        RET
                        .ENDFUNC  298

                        .FUNC     ParseSubCh, 0012Ch, 00020h
DIV.ParseSubCh:
                        SBIW      _FRAMEPTR, 12
                        .BLOCK    311
                        .LINE     312
                        LDI       _ACCCLO, DIV.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DIV.SerInpStr SHRB 8
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
                        BRNE      DIV._L0398
                        SER       _ACCA
DIV._L0398:
                        TST       _ACCA
                        .BRANCH   4,DIV._L0401
                        BRNE      DIV._L0401
                        .BRANCH   20,DIV._L0399
                        JMP       DIV._L0399
DIV._L0401:
                        .BLOCK    312
                        .LINE     313
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DIV.SERPROMPT
                        CALL      DIV.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     314
                        .BRANCH   20,DIV.ParseSubCh_X
                        JMP       DIV.ParseSubCh_X
                        .ENDBLOCK 315
DIV._L0399:
DIV._L0400:
                        .LINE     316
                        LDI       _ACCA, 03Ah
                        PUSH      _ACCA
                        LDI       _ACCCLO, DIV.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DIV.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCELO, 001h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCB
                        CALL      SYSTEM.PosChInVarStr
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      DIV._L0402
                        BRLO      DIV._L0402
                        SER       _ACCA
DIV._L0402:
                        STD       Y+005h, _ACCA
                        .LINE     317
                        LDI       _ACCA, 03Dh
                        PUSH      _ACCA
                        LDI       _ACCCLO, DIV.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DIV.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCELO, 001h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCB
                        CALL      SYSTEM.PosChInVarStr
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      DIV._L0403
                        BRLO      DIV._L0403
                        SER       _ACCA
DIV._L0403:
                        COM       _ACCA
                        STD       Y+001h, _ACCA
                        .LINE     318
                        LDI       _ACCCLO, DIV.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DIV.SerInpStr SHRB 8
                        ADIW      _ACCCLO, 00001h
                        LD        _ACCA, Z+
                        STD       Y+006h, _ACCA
                        .LINE     319
                        LDD       _ACCA, Y+006h
                        CPI       _ACCA, 02Ah
                        LDI       _ACCA, 0h
                        BRNE      DIV._L0404
                        SER       _ACCA
DIV._L0404:
                        STD       Y+002h, _ACCA
                        .LINE     320
                        LDD       _ACCA, Y+006h
                        CPI       _ACCA, 023h
                        LDI       _ACCA, 0h
                        BRNE      DIV._L0405
                        SER       _ACCA
DIV._L0405:
                        STD       Y+003h, _ACCA
                        .LINE     321
                        LDD       _ACCA, Y+003h
                        TST       _ACCA
                        .BRANCH   4,DIV._L0408
                        BRNE      DIV._L0408
                        .BRANCH   20,DIV._L0406
                        JMP       DIV._L0406
DIV._L0408:
                        .BLOCK    321
                        .LINE     322
                        .BRANCH   17,DIV.WRITESERINP
                        CALL      DIV.WRITESERINP
                        .LINE     323
                        .BRANCH   20,DIV.ParseSubCh_X
                        JMP       DIV.ParseSubCh_X
                        .ENDBLOCK 324
DIV._L0406:
DIV._L0407:
                        .LINE     325
                        LDI       _ACCA, 001h
                        STS       DIV.SERINPPTR, _ACCA
                        .LINE     326
                        LDD       _ACCA, Y+005h
                        TST       _ACCA
                        .BRANCH   4,DIV._L0411
                        BRNE      DIV._L0411
                        .BRANCH   20,DIV._L0409
                        JMP       DIV._L0409
DIV._L0411:
                        .BLOCK    326
                        .LINE     327
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DIV.PARSEEXTRACT
                        CALL       DIV.PARSEEXTRACT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        STD       Y+000h, _ACCA
                        .LINE     328
                        LDS       _ACCA, DIV.SerInpPtr
                        INC       _ACCA
                        STS       DIV.SerInpPtr, _ACCA
                        .LINE     329
                        LDD       _ACCA, Y+002h
                        TST       _ACCA
                        .BRANCH   4,DIV._L0414
                        BRNE      DIV._L0414
                        .BRANCH   20,DIV._L0412
                        JMP       DIV._L0412
DIV._L0414:
                        .BLOCK    330
                        .LINE     330
                        .BRANCH   17,DIV.WRITESERINP
                        CALL      DIV.WRITESERINP
                        .ENDBLOCK 331
                        .BRANCH   20,DIV._L0413
                        JMP       DIV._L0413
DIV._L0412:
                        .BLOCK    331
                        .LINE     332
                        LDI       _ACCCLO, DIV.ParamStr AND 0FFh
                        LDI       _ACCCHI, DIV.ParamStr SHRB 8
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        CLT
                        BLD       Flags, _ERRFLAG
                        LDI       _ACCB, 000h
                        CALL      SYSTEM.Str2Int
                        MOV       _ACCA, _ACCB
                        STS       DIV.CURRENTCH, _ACCA
                        .ENDBLOCK 333
DIV._L0413:
                        .ENDBLOCK 334
DIV._L0409:
DIV._L0410:
                        .LINE     335
                        LDD       _ACCA, Y+002h
                        COM       _ACCA
                        PUSH      _ACCA
                        LDS       _ACCA, DIV.CurrentCh
                        PUSH      _ACCA
                        LDS       _ACCA, DIV.SlaveCh
                        POP       _ACCB
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0h
                        BREQ      DIV._L0415
                        SER       _ACCA
DIV._L0415:
                        POP       _ACCB
                        AND       _ACCA, _ACCB
                        PUSH      _ACCA
                        LDD       _ACCA, Y+005h
                        POP       _ACCB
                        AND       _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   4,DIV._L0418
                        BRNE      DIV._L0418
                        .BRANCH   20,DIV._L0416
                        JMP       DIV._L0416
DIV._L0418:
                        .BLOCK    336
                        .LINE     336
                        .BRANCH   17,DIV.WRITESERINP
                        CALL      DIV.WRITESERINP
                        .LINE     337
                        .BRANCH   20,DIV.ParseSubCh_X
                        JMP       DIV.ParseSubCh_X
                        .ENDBLOCK 338
DIV._L0416:
DIV._L0417:
                        .LINE     342
                        LDI       _ACCA, 021h
                        PUSH      _ACCA
                        LDI       _ACCCLO, DIV.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DIV.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCELO, 001h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCB
                        CALL      SYSTEM.PosChInVarStr
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      DIV._L0419
                        BRLO      DIV._L0419
                        SER       _ACCA
DIV._L0419:
                        PUSH      _ACCA
                        LDI       _ACCA, 03Fh
                        PUSH      _ACCA
                        LDI       _ACCCLO, DIV.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DIV.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCELO, 001h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCB
                        CALL      SYSTEM.PosChInVarStr
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      DIV._L0420
                        BRLO      DIV._L0420
                        SER       _ACCA
DIV._L0420:
                        POP       _ACCB
                        OR        _ACCA, _ACCB
                        STS       DIV.VERBOSE, _ACCA
                        .LINE     343
                        LDI       _ACCA, 024h
                        PUSH      _ACCA
                        LDI       _ACCCLO, DIV.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DIV.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCELO, 001h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCB
                        CALL      SYSTEM.PosChInVarStr
                        STD       Y+00Ah, _ACCA
                        .LINE     344
                        LDD       _ACCA, Y+00Ah
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      DIV._L0421
                        BRLO      DIV._L0421
                        SER       _ACCA
DIV._L0421:
                        STD       Y+004h, _ACCA
                        .LINE     345
                        LDD       _ACCA, Y+004h
                        TST       _ACCA
                        .BRANCH   4,DIV._L0424
                        BRNE      DIV._L0424
                        .BRANCH   20,DIV._L0422
                        JMP       DIV._L0422
DIV._L0424:
                        .BLOCK    345
                        .LINE     346
                        LDI       _ACCCLO, DIV.ParamStr AND 0FFh
                        LDI       _ACCCHI, DIV.ParamStr SHRB 8
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
                        LDI       _ACCCLO, DIV.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DIV.SerInpStr SHRB 8
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
                        .LINE     347
                        LDI       _ACCCLO, DIV.ParamStr AND 0FFh
                        LDI       _ACCCHI, DIV.ParamStr SHRB 8
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        CLT
                        BLD       Flags, _ERRFLAG
                        LDI       _ACCB, 0FFh
                        CALL      SYSTEM.Str2Int
                        MOV       _ACCA, _ACCB
                        STD       Y+008h, _ACCA
                        .LINE     348
                        LDI       _ACCA, 000h
                        STD       Y+009h, _ACCA
                        .LINE     349
                        .LOOP
                        LDI       _ACCCLO, DIV.i AND 0FFh
                        LDI       _ACCCHI, DIV.i SHRB 8
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
DIV._L0427:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      DIV._L0428
                        CLR       _ACCA
DIV._L0428:
                        TST       _ACCA
                        .BRANCH   3,DIV._L0429
                        BREQ      DIV._L0429
                        .BRANCH   20,DIV._L0426
                        JMP       DIV._L0426
DIV._L0429:
                        .BLOCK    350
                        .LINE     350
                        LDI       _ACCCLO, DIV.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DIV.SerInpStr SHRB 8
                        MOV       _ACCA, DIV.i
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCA, Z+
                        STD       Y+009h, _ACCA
                        .LINE     351
                        LDD       _ACCA, Y+00Ch
                        PUSH      _ACCA
                        LDD       _ACCA, Y+009h
                        POP       _ACCB
                        EOR       _ACCA, _ACCB
                        STD       Y+00Ch, _ACCA
                        .ENDBLOCK 352
DIV._L0425:
                        .LINE     352
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,DIV._L0426
                        BREQ      DIV._L0426
                        .BRANCH   20,DIV._L0427
                        JMP       DIV._L0427
DIV._L0426:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .LINE     353
                        LDD       _ACCA, Y+009h
                        PUSH      _ACCA
                        LDD       _ACCA, Y+008h
                        POP       _ACCB
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0h
                        BREQ      DIV._L0430
                        SER       _ACCA
DIV._L0430:
                        TST       _ACCA
                        .BRANCH   4,DIV._L0433
                        BRNE      DIV._L0433
                        .BRANCH   20,DIV._L0431
                        JMP       DIV._L0431
DIV._L0433:
                        .BLOCK    353
                        .LINE     354
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 007h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DIV.SERPROMPT
                        CALL      DIV.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     355
                        .BRANCH   20,DIV.ParseSubCh_X
                        JMP       DIV.ParseSubCh_X
                        .ENDBLOCK 356
DIV._L0431:
DIV._L0432:
                        .ENDBLOCK 357
DIV._L0422:
DIV._L0423:
                        .LINE     359
                        LDI       _ACCA, 07Dh
                        STS       DIV.ActivityTimer, _ACCA
                        .LINE     360
                        CBI       00032h, 002h
                        .LINE     363
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DIV.PARSEEXTRACT
                        CALL       DIV.PARSEEXTRACT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        TST       _ACCA
                        .BRANCH   4,DIV._L0436
                        BRNE      DIV._L0436
                        .BRANCH   20,DIV._L0434
                        JMP       DIV._L0434
DIV._L0436:
                        .BLOCK    363
                        .LINE     364
                        LDI       _ACCA, 000h
                        STD       Y+007h, _ACCA
                        .LINE     365
                        LDI       _ACCA, 003h
                        STS       DIV.CMDWHICH, _ACCA
                        .ENDBLOCK 366
                        .BRANCH   20,DIV._L0435
                        JMP       DIV._L0435
DIV._L0434:
                        .BLOCK    366
                        .LINE     367
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DIV.CMD2INDEX
                        CALL       DIV.CMD2INDEX
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        STS       DIV.CMDWHICH, _ACCA
                        .LINE     368
                        LDS       _ACCA, DIV.CmdWhich
                        CPI       _ACCA, 010h
                        LDI       _ACCA, 0h
                        BRNE      DIV._L0437
                        SER       _ACCA
DIV._L0437:
                        TST       _ACCA
                        .BRANCH   4,DIV._L0440
                        BRNE      DIV._L0440
                        .BRANCH   20,DIV._L0438
                        JMP       DIV._L0438
DIV._L0440:
                        .BLOCK    368
                        .LINE     369
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 004h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DIV.SERPROMPT
                        CALL      DIV.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     370
                        .BRANCH   20,DIV.ParseSubCh_X
                        JMP       DIV.ParseSubCh_X
                        .ENDBLOCK 371
DIV._L0438:
DIV._L0439:
                        .LINE     372
                        LDI       _ACCCLO, DIV.Cmd2SubChArr AND 0FFh
                        LDI       _ACCCHI, DIV.Cmd2SubChArr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DIV.CmdWhich
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LPM       _ACCA, Z
                        STD       Y+007h, _ACCA
                        .LINE     373
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DIV.PARSEEXTRACT
                        CALL       DIV.PARSEEXTRACT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 374
DIV._L0435:
                        .LINE     375
                        LDI       _ACCCLO, DIV.ParamStr AND 0FFh
                        LDI       _ACCCHI, DIV.ParamStr SHRB 8
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
                        STS       DIV.SUBCH, _ACCA
                        .LINE     377
                        LDD       _ACCA, Y+001h
                        TST       _ACCA
                        .BRANCH   4,DIV._L0443
                        BRNE      DIV._L0443
                        .BRANCH   20,DIV._L0441
                        JMP       DIV._L0441
DIV._L0443:
                        .BLOCK    377
                        .LINE     378
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DIV.PARSEGETPARAM
                        CALL      DIV.PARSEGETPARAM
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 379
                        .BRANCH   20,DIV._L0442
                        JMP       DIV._L0442
DIV._L0441:
                        .BLOCK    379
                        .LINE     380
                        LDI       _ACCA, 03Dh
                        PUSH      _ACCA
                        LDI       _ACCCLO, DIV.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DIV.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCELO, 001h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCB
                        CALL      SYSTEM.PosChInVarStr
                        SUBI      _ACCA, -001h AND 0FFh
                        STS       DIV.SERINPPTR, _ACCA
                        .LINE     381
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DIV.PARSEEXTRACT
                        CALL       DIV.PARSEEXTRACT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        TST       _ACCA
                        .BRANCH   4,DIV._L0446
                        BRNE      DIV._L0446
                        .BRANCH   20,DIV._L0444
                        JMP       DIV._L0444
DIV._L0446:
                        .BLOCK    381
                        .LINE     382
                        LDI       _ACCCLO, DIV.ParamStr AND 0FFh
                        LDI       _ACCCHI, DIV.ParamStr SHRB 8
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        CALL      SYSTEM.Str2Float
                        STS       DIV.PARAM, _ACCB
                        STS       DIV.PARAM+1, _ACCA
                        STS       DIV.PARAM+2, _ACCALO
                        STS       DIV.PARAM+3, _ACCAHI
                        .LINE     383
                        LDS       _ACCB, DIV.Param
                        LDS       _ACCA, DIV.Param+1
                        LDS       _ACCALO, DIV.Param+2
                        LDS       _ACCAHI, DIV.Param+3
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.FloatToLInt
                        STS       DIV.PARAMLONGINT, _ACCB
                        STS       DIV.PARAMLONGINT+1, _ACCA
                        STS       DIV.PARAMLONGINT+2, _ACCALO
                        STS       DIV.PARAMLONGINT+3, _ACCAHI
                        .ENDBLOCK 384
                        .BRANCH   20,DIV._L0445
                        JMP       DIV._L0445
DIV._L0444:
                        .BLOCK    384
                        .LINE     385
                        LDS       _ACCA, DIV.CmdWhich
                        CPI       _ACCA, 003h
                        LDI       _ACCA, 0
                        BRLO      DIV._L0447
                        LDI       _ACCA, 0FFh
DIV._L0447:
                        TST       _ACCA
                        .BRANCH   4,DIV._L0450
                        BRNE      DIV._L0450
                        .BRANCH   20,DIV._L0448
                        JMP       DIV._L0448
DIV._L0450:
                        .BLOCK    386
                        .LINE     386
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 005h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DIV.SERPROMPT
                        CALL      DIV.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     387
                        .BRANCH   20,DIV.ParseSubCh_X
                        JMP       DIV.ParseSubCh_X
                        .ENDBLOCK 388
DIV._L0448:
DIV._L0449:
                        .ENDBLOCK 389
DIV._L0445:
                        .LINE     390
                        .BRANCH   17,DIV.PARSESETPARAM
                        CALL      DIV.PARSESETPARAM
                        .ENDBLOCK 391
DIV._L0442:
                        .ENDBLOCK 392
DIV.ParseSubCh_X:
                        .LINE     392
                        .BRANCH   19
                        RET
                        .ENDFUNC  392


                        .FILE     H:\PROJAVR\ADA-C DIV\DIV.pas
                        .FUNC     CheckSer, 002D5h, 00020h
DIV.CheckSer:
                        SBIW      _FRAMEPTR, 1
                        .BLOCK    728
                        .LINE     729
DIV._L0451:
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
                        .BRANCH   4,DIV._L0453
                        BRNE      DIV._L0453
                        .BRANCH   20,DIV._L0452
                        JMP       DIV._L0452
DIV._L0453:
                        .BLOCK    731
                        .LINE     731
                        LDD       _ACCA, Y+000h
                        CPI       _ACCA, 07Fh
                        .BRANCH   3,DIV._L0454
                        BREQ      DIV._L0454
                        .BRANCH   1,DIV._L0455
                        BRSH      DIV._L0455
                        CPI       _ACCA, 020h
                        .BRANCH   1,DIV._L0455
                        BRLO      DIV._L0455
                        CLR       _ACCDLO
                        .BRANCH   20,DIV._L0454
                        RJMP      DIV._L0454
DIV._L0455:
                        LDI       _ACCDLO, 001h
DIV._L0454:
                        LDI       _ACCA, 0h
                        BRNE      DIV._L0456
                        SER       _ACCA
DIV._L0456:
                        TST       _ACCA
                        .BRANCH   4,DIV._L0459
                        BRNE      DIV._L0459
                        .BRANCH   20,DIV._L0457
                        JMP       DIV._L0457
DIV._L0459:
                        .BLOCK    732
                        .LINE     732
                        LDD       _ACCA, Y+000h
                        MOV       _ACCEHI, _ACCA
                        LDI       _ACCELO, 001h
                        LDI       _ACCA, _ACCELO SHRB 8
                        LDI       _ACCB, _ACCELO AND 0FFh
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDI       _ACCCLO, DIV.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DIV.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCA, 03Fh
                        PUSH      _ACCA
                        LDI       _ACCFHI, 000h
                        CALL      SYSTEM.StringAppend
                        .ENDBLOCK 733
DIV._L0457:
DIV._L0458:
                        .LINE     734
                        LDD       _ACCA, Y+000h
                        CPI       _ACCA, 008h
                        LDI       _ACCA, 0h
                        BRNE      DIV._L0460
                        SER       _ACCA
DIV._L0460:
                        TST       _ACCA
                        .BRANCH   4,DIV._L0463
                        BRNE      DIV._L0463
                        .BRANCH   20,DIV._L0461
                        JMP       DIV._L0461
DIV._L0463:
                        .BLOCK    735
                        .LINE     735
                        LDI       _ACCCLO, DIV.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DIV.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCCLO, DIV.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DIV.SerInpStr SHRB 8
                        LD        _ACCA, Z
                        SUBI      _ACCA, 001h AND 0FFh
                        POP       _ACCCHI
                        POP       _ACCCLO
                        CPI       _ACCA, 63
                        BRCS      DIV._L0464
                        LDI       _ACCA, 63
DIV._L0464:
                        ST        Z+, _ACCA
                        .ENDBLOCK 736
DIV._L0461:
DIV._L0462:
                        .LINE     737
                        LDD       _ACCA, Y+000h
                        CPI       _ACCA, 00Dh
                        LDI       _ACCA, 0h
                        BRNE      DIV._L0465
                        SER       _ACCA
DIV._L0465:
                        TST       _ACCA
                        .BRANCH   4,DIV._L0468
                        BRNE      DIV._L0468
                        .BRANCH   20,DIV._L0466
                        JMP       DIV._L0466
DIV._L0468:
                        .BLOCK    737
                        .LINE     738
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DIV.PARSESUBCH
                        CALL      DIV.PARSESUBCH
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     739
                        LDI       _ACCCLO, DIV.SerInpStr AND 0FFh
                        LDI       _ACCCHI, DIV.SerInpStr SHRB 8
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
                        .ENDBLOCK 740
DIV._L0466:
DIV._L0467:
                        .ENDBLOCK 741
                        .LINE     741
                        .BRANCH   20,DIV._L0451
                        JMP       DIV._L0451
DIV._L0452:
                        .LINE     743
                        LDS       _ACCA, DIV.OverVoltFlag
                        CLT
                        TST       _ACCA
                        BREQ      DIV._L0469
                        SET
DIV._L0469:
                        LDS       _ACCA, 001D5h
                        BLD       _ACCA, 001h
                        STS       001D5h, _ACCA
                        .LINE     744
                        LDS       _ACCA, DIV.NegativeFlag
                        CLT
                        TST       _ACCA
                        BREQ      DIV._L0470
                        SET
DIV._L0470:
                        LDS       _ACCA, 001D5h
                        BLD       _ACCA, 000h
                        STS       001D5h, _ACCA
                        .LINE     745
                        LDS       _ACCB, 001D5h
                        CLR       _ACCA
                        SBRC      _ACCB, 001h
                        SER       _ACCA
                        PUSH      _ACCA
                        LDS       _ACCB, 001D5h
                        CLR       _ACCA
                        SBRC      _ACCB, 000h
                        SER       _ACCA
                        POP       _ACCB
                        OR        _ACCA, _ACCB
                        CLT
                        TST       _ACCA
                        BREQ      DIV._L0471
                        SET
DIV._L0471:
                        LDS       _ACCA, 001D4h
                        BLD       _ACCA, 005h
                        STS       001D4h, _ACCA
                        .LINE     746
                        LDS       _ACCA, DIV.FaultTimerByte
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BRNE      DIV._L0472
                        SER       _ACCA
DIV._L0472:
                        TST       _ACCA
                        .BRANCH   4,DIV._L0475
                        BRNE      DIV._L0475
                        .BRANCH   20,DIV._L0473
                        JMP       DIV._L0473
DIV._L0475:
                        .BLOCK    747
                        .LINE     747
                        LDS       _ACCA, DIV.FaultFlags
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      DIV._L0476
                        SER       _ACCA
DIV._L0476:
                        TST       _ACCA
                        .BRANCH   4,DIV._L0479
                        BRNE      DIV._L0479
                        .BRANCH   20,DIV._L0477
                        JMP       DIV._L0477
DIV._L0479:
                        .BLOCK    747
                        .LINE     748
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 003h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DIV.SERPROMPT
                        CALL      DIV.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 749
DIV._L0477:
DIV._L0478:
                        .LINE     750
                        LDI       _ACCA, 014h
                        STS       DIV.FAULTTIMERBYTE, _ACCA
                        .ENDBLOCK 751
DIV._L0473:
DIV._L0474:
                        .LINE     752
                        LDS       _ACCA, DIV.FaultTimerByte
                        DEC       _ACCA
                        STS       DIV.FaultTimerByte, _ACCA
                        .ENDBLOCK 753
DIV.CheckSer_X:
                        .LINE     753
                        .BRANCH   19
                        RET
                        .ENDFUNC  753

                        .FUNC     CheckDelay, 002F3h, 00020h
DIV.CheckDelay:
                        SBIW      _FRAMEPTR, 1
                        .BLOCK    758
                        .LINE     759
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
DIV._L0482:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      DIV._L0483
                        CLR       _ACCA
DIV._L0483:
                        TST       _ACCA
                        .BRANCH   3,DIV._L0484
                        BREQ      DIV._L0484
                        .BRANCH   20,DIV._L0481
                        JMP       DIV._L0481
DIV._L0484:
                        .BLOCK    760
                        .LINE     760
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DIV.CHECKSER
                        CALL      DIV.CHECKSER
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 761
DIV._L0480:
                        .LINE     761
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,DIV._L0481
                        BREQ      DIV._L0481
                        .BRANCH   20,DIV._L0482
                        JMP       DIV._L0482
DIV._L0481:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .ENDBLOCK 762
DIV.CheckDelay_X:
                        .LINE     762
                        .BRANCH   19
                        RET
                        .ENDFUNC  762

                        .FUNC     BlinkDelay, 002FCh, 00020h
DIV.BlinkDelay:
                        SBIW      _FRAMEPTR, 1
                        .BLOCK    767
                        .LINE     768
                        .LOOP
                        MOVW      _ACCCLO, _FRAMEPTR
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 000h
                        ST        Z, _ACCA
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCA, Y+003h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
DIV._L0487:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      DIV._L0488
                        CLR       _ACCA
DIV._L0488:
                        TST       _ACCA
                        .BRANCH   3,DIV._L0489
                        BREQ      DIV._L0489
                        .BRANCH   20,DIV._L0486
                        JMP       DIV._L0486
DIV._L0489:
                        .BLOCK    769
                        .LINE     769
                        LDI       _ACCA, 00064h SHRB 8
                        LDI       _ACCB, 00064h AND 0FFh
                        .FRAME  3
                        CALL      SYSTEM.MDELAY
                        .LINE     770
                        CLR       _ACCA
                        SBIC      032h, 002h
                        SER       _ACCA
                        COM       _ACCA
                        CLT
                        TST       _ACCA
                        BREQ      DIV._L0490
                        SET
DIV._L0490:
                        IN        _ACCA, 00032h
                        BLD       _ACCA, 002h
                        OUT       00032h, _ACCA
                        .ENDBLOCK 771
DIV._L0485:
                        .LINE     771
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,DIV._L0486
                        BREQ      DIV._L0486
                        .BRANCH   20,DIV._L0487
                        JMP       DIV._L0487
DIV._L0486:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .ENDBLOCK 772
DIV.BlinkDelay_X:
                        .LINE     772
                        .BRANCH   19
                        RET
                        .ENDFUNC  772

                        .FUNC     initall, 00308h, 00020h
DIV.initall:
                        .BLOCK    778
                        .LINE     779
                        LDI       _ACCA, 0E0h
                        OUT       DDRA, _ACCA
                        .LINE     780
                        LDI       _ACCA, 003h
                        OUT       PORTA, _ACCA
                        .LINE     781
                        LDI       _ACCA, 090h
                        OUT       DDRB, _ACCA
                        .LINE     782
                        LDI       _ACCA, 091h
                        OUT       PORTB, _ACCA
                        .LINE     783
                        LDI       _ACCA, 0FCh
                        OUT       DDRC, _ACCA
                        .LINE     784
                        LDI       _ACCA, 003h
                        OUT       PORTC, _ACCA
                        .LINE     785
                        LDI       _ACCA, 01Ch
                        OUT       DDRD, _ACCA
                        .LINE     786
                        LDI       _ACCA, 0FCh
                        OUT       PORTD, _ACCA
                        .LINE     790
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DIV.PATCHCOPYFROMEE
                        CALL      DIV.PATCHCOPYFROMEE
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     792
                        IN        _ACCA, PinD
                        COM       _ACCA
                        LDI       _ACCALO, 005h
                        CALL      SYSTEM.SHR8_R
                        STS       DIV.SLAVECH, _ACCA
                        .LINE     793
                        CBI       00032h, 002h
                        .LINE     794
                        LDI       _ACCA, 000h
                        .FRAME  0
                        CALL       SYSTEM.LCDSETUP_M
                        TST       _ACCA
                        .BRANCH   4,DIV._L0493
                        BRNE      DIV._L0493
                        .BRANCH   20,DIV._L0491
                        JMP       DIV._L0491
DIV._L0493:
                        .BLOCK    794
                        .LINE     795
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
                        .LINE     796
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
                        .LINE     797
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
                        .LINE     798
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
                        .LINE     799
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 003h
                        ST        -Y, _ACCA
                        .FRAME  2
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  3
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  4
                        LDI       _ACCA, 008h
                        ST        -Y, _ACCA
                        .FRAME  5
                        LDI       _ACCA, 015h
                        ST        -Y, _ACCA
                        .FRAME  6
                        LDI       _ACCA, 002h
                        ST        -Y, _ACCA
                        .FRAME  7
                        LDI       _ACCA, 000h
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
                        .LINE     801
                        LDI       _ACCA, 0FFh
                        STS       DIV.LCDPRESENT, _ACCA
                        .LINE     802
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, DIV.Vers3Str AND 0FFh
                        LDI       _ACCCHI, DIV.Vers3Str SHRB 8
                        LPM       _ACCBHI, Z+
                        TST       _ACCBHI
                        BREQ      DIV._L0494
                        CALL      SYSTEM.StrConst2Str
DIV._L0494:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     803
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
                        .LINE     804
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, DIV.AdrStr AND 0FFh
                        LDI       _ACCCHI, DIV.AdrStr SHRB 8
                        LPM       _ACCBHI, Z+
                        TST       _ACCBHI
                        BREQ      DIV._L0495
                        CALL      SYSTEM.StrConst2Str
DIV._L0495:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     805
                        LDS       _ACCA, DIV.SlaveCh
                        SUBI      _ACCA, -030h AND 0FFh
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .ENDBLOCK 806
DIV._L0491:
DIV._L0492:
                        .LINE     807
                        LDI       _ACCA, 003E8h SHRB 8
                        LDI       _ACCB, 003E8h AND 0FFh
                        .FRAME  0
                        CALL      SYSTEM.MDELAY
                        .LINE     808
                        LDS       _ACCA, DIV.SlaveCh
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      DIV._L0496
                        BRLO      DIV._L0496
                        SER       _ACCA
DIV._L0496:
                        TST       _ACCA
                        .BRANCH   4,DIV._L0499
                        BRNE      DIV._L0499
                        .BRANCH   20,DIV._L0497
                        JMP       DIV._L0497
DIV._L0499:
                        .BLOCK    808
                        .LINE     809
                        .LOOP
                        LDI       _ACCCLO, DIV.i AND 0FFh
                        LDI       _ACCCHI, DIV.i SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 000h
                        ST        Z, _ACCA
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DIV.SlaveCh
                        SUBI      _ACCA, 001h AND 0FFh
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
DIV._L0502:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      DIV._L0503
                        CLR       _ACCA
DIV._L0503:
                        TST       _ACCA
                        .BRANCH   3,DIV._L0504
                        BREQ      DIV._L0504
                        .BRANCH   20,DIV._L0501
                        JMP       DIV._L0501
DIV._L0504:
                        .BLOCK    810
                        .LINE     810
                        CLR       _ACCA
                        SBIC      032h, 002h
                        SER       _ACCA
                        COM       _ACCA
                        CLT
                        TST       _ACCA
                        BREQ      DIV._L0505
                        SET
DIV._L0505:
                        IN        _ACCA, 00032h
                        BLD       _ACCA, 002h
                        OUT       00032h, _ACCA
                        .LINE     811
                        LDI       _ACCA, 00096h SHRB 8
                        LDI       _ACCB, 00096h AND 0FFh
                        .FRAME  3
                        CALL      SYSTEM.MDELAY
                        .LINE     812
                        CLR       _ACCA
                        SBIC      032h, 002h
                        SER       _ACCA
                        COM       _ACCA
                        CLT
                        TST       _ACCA
                        BREQ      DIV._L0506
                        SET
DIV._L0506:
                        IN        _ACCA, 00032h
                        BLD       _ACCA, 002h
                        OUT       00032h, _ACCA
                        .LINE     813
                        LDI       _ACCA, 00096h SHRB 8
                        LDI       _ACCB, 00096h AND 0FFh
                        .FRAME  3
                        CALL      SYSTEM.MDELAY
                        .ENDBLOCK 814
DIV._L0500:
                        .LINE     814
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,DIV._L0501
                        BREQ      DIV._L0501
                        .BRANCH   20,DIV._L0502
                        JMP       DIV._L0502
DIV._L0501:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .ENDBLOCK 815
DIV._L0497:
DIV._L0498:
                        .LINE     816
                        SBI       00032h, 002h
                        .LINE     818
                        IN        _ACCA, GICR
                        ORI       _ACCA, 020h
                        OUT       GICR, _ACCA
                        .LINE     819
                        LDI       _ACCCLO, DIV.TrigLevel AND 0FFh
                        LDI       _ACCCHI, DIV.TrigLevel SHRB 8
                        CALL      SYSTEM.ReadEEp8
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BRNE      DIV._L0507
                        SER       _ACCA
DIV._L0507:
                        TST       _ACCA
                        .BRANCH   4,DIV._L0510
                        BRNE      DIV._L0510
                        .BRANCH   20,DIV._L0508
                        JMP       DIV._L0508
DIV._L0510:
                        .BLOCK    819
                        .LINE     820
                        IN        _ACCA, MCUCSR
                        ANDI      _ACCA, 0BFh
                        OUT       MCUCSR, _ACCA
                        .ENDBLOCK 821
                        .BRANCH   20,DIV._L0509
                        JMP       DIV._L0509
DIV._L0508:
                        .BLOCK    821
                        .LINE     822
                        IN        _ACCA, MCUCSR
                        ORI       _ACCA, 040h
                        OUT       MCUCSR, _ACCA
                        .ENDBLOCK 823
DIV._L0509:
                        .LINE     825
                        LDI       _ACCA, 1 SHLB IntFlag
                        OR        Flags, _ACCA
                        SEI
                        .LINE     827
                        LDI       _ACCA, 0FEh
                        STS       DIV.SUBCH, _ACCA
                        .LINE     828
                        .BRANCH   17,DIV.WRITECHPREFIX
                        CALL      DIV.WRITECHPREFIX
                        .LINE     829
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.Serout SHRB 1
                        LDI       _ACCA, SYSTEM.Serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, DIV.Vers1Str AND 0FFh
                        LDI       _ACCCHI, DIV.Vers1Str SHRB 8
                        LPM       _ACCBHI, Z+
                        TST       _ACCBHI
                        BREQ      DIV._L0511
                        CALL      SYSTEM.StrConst2Str
DIV._L0511:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     830
                        LDI       _ACCCLO, DIV.EEinitialised AND 0FFh
                        LDI       _ACCCHI, DIV.EEinitialised SHRB 8
                        CALL      SYSTEM._ReadEEp16
                        CPI       _ACCA, 0AAh
                        BRNE      DIV._L0512
                        CPI       _ACCB, 055h
DIV._L0512:
                        LDI       _ACCA, 0h
                        BREQ      DIV._L0513
                        SER       _ACCA
DIV._L0513:
                        TST       _ACCA
                        .BRANCH   4,DIV._L0516
                        BRNE      DIV._L0516
                        .BRANCH   20,DIV._L0514
                        JMP       DIV._L0514
DIV._L0516:
                        .BLOCK    830
                        .LINE     831
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.Serout SHRB 1
                        LDI       _ACCA, SYSTEM.Serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, DIV.EEnotProgrammedStr AND 0FFh
                        LDI       _ACCCHI, DIV.EEnotProgrammedStr SHRB 8
                        LPM       _ACCBHI, Z+
                        TST       _ACCBHI
                        BREQ      DIV._L0517
                        CALL      SYSTEM.StrConst2Str
DIV._L0517:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     832
                        LDS       _ACCA, DIV.LCDpresent
                        TST       _ACCA
                        .BRANCH   4,DIV._L0520
                        BRNE      DIV._L0520
                        .BRANCH   20,DIV._L0518
                        JMP       DIV._L0518
DIV._L0520:
                        .BLOCK    832
                        .LINE     833
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
                        .LINE     834
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, DIV.EEnotProgrammedStr AND 0FFh
                        LDI       _ACCCHI, DIV.EEnotProgrammedStr SHRB 8
                        LPM       _ACCBHI, Z+
                        TST       _ACCBHI
                        BREQ      DIV._L0521
                        CALL      SYSTEM.StrConst2Str
DIV._L0521:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .ENDBLOCK 835
DIV._L0518:
DIV._L0519:
                        .ENDBLOCK 836
DIV._L0514:
DIV._L0515:
                        .LINE     837
                        LDI       _ACCCLO, DIV.OffsetInitialised AND 0FFh
                        LDI       _ACCCHI, DIV.OffsetInitialised SHRB 8
                        CALL      SYSTEM._ReadEEp16
                        CPI       _ACCA, 0AAh
                        BRNE      DIV._L0522
                        CPI       _ACCB, 055h
DIV._L0522:
                        LDI       _ACCA, 0h
                        BREQ      DIV._L0523
                        SER       _ACCA
DIV._L0523:
                        TST       _ACCA
                        .BRANCH   4,DIV._L0526
                        BRNE      DIV._L0526
                        .BRANCH   20,DIV._L0524
                        JMP       DIV._L0524
DIV._L0526:
                        .BLOCK    837
                        .LINE     838
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.Serout SHRB 1
                        LDI       _ACCA, SYSTEM.Serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, $St_String16 AND 0FFh
                        LDI       _ACCCHI, $St_String16 SHRB 8
                        LPM       _ACCBHI, Z+
                        TST       _ACCBHI
                        BREQ      DIV._L0527
                        CALL      SYSTEM.StrConst2Str
DIV._L0527:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     839
                        .BRANCH   17,DIV.SERCRLF
                        CALL      DIV.SERCRLF
                        .LINE     840
                        LDS       _ACCA, 001D4h
                        SBR       _ACCA, 080h
                        STS       001D4h, _ACCA
                        .LINE     841
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 002h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DIV.SERPROMPT
                        CALL      DIV.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 842
DIV._L0524:
DIV._L0525:
                        .LINE     843
                        LDI       _ACCA, 010h
                        STS       DIV.OLDRANGE, _ACCA
                        .LINE     844
                        LDI       _ACCA, 000h
                        STS       DIV.AUTORANGEMODE, _ACCA
                        .LINE     845
                        LDI       _ACCA, 0FFh
                        STS       DIV.OLDRANGEMODE, _ACCA
                        .LINE     846
                        .BRANCH   17,DIV.SWITCHRANGE
                        CALL      DIV.SWITCHRANGE
                        .LINE     847
DIV._L0528:
                        CALL       SYSTEM.SERSTAT
                        TST       _ACCA
                        .BRANCH   4,DIV._L0530
                        BRNE      DIV._L0530
                        .BRANCH   20,DIV._L0529
                        JMP       DIV._L0529
DIV._L0530:
                        .BLOCK    847
                        .LINE     848
                        CALL       SYSTEM.SERINP
                        MOV       DIV.I, _ACCA
                        .ENDBLOCK 849
                        .LINE     849
                        .BRANCH   20,DIV._L0528
                        JMP       DIV._L0528
DIV._L0529:
                        .LINE     850
                        CALL      SYSTEM.INCRCOUNT4START
                        .LINE     851
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 00000h SHRB 8
                        LDI       _ACCB, 00000h AND 0FFh
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  3
                        .FRAME  0
                        CALL      SYSTEM.SETINCRVAL4
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     852
                        LDI       _ACCA, 000h
                        .FRAME  0
                        CALL       SYSTEM.GETINCRVAL4
                        STS       DIV.INCRVALUE, _ACCB
                        STS       DIV.INCRVALUE+1, _ACCA
                        .LINE     853
                        LDS       _ACCB, DIV.IncrValue
                        LDS       _ACCA, DIV.IncrValue+1
                        STS       DIV.OLDINCRVALUE, _ACCB
                        STS       DIV.OLDINCRVALUE+1, _ACCA
                        .LINE     854
                        LDI       _ACCA, 00000h SHRB 8
                        LDI       _ACCB, 00000h AND 0FFh
                        STS       DIV.INCRDIFF, _ACCB
                        STS       DIV.INCRDIFF+1, _ACCA
                        .LINE     855
                        LDI       _ACCA, 000h
                        STS       DIV.INCRENTER, _ACCA
                        .LINE     856
                        .BRANCH   17,DIV.INTEGRATERESET
                        CALL      DIV.INTEGRATERESET
                        .LINE     857
                        LDS       _ACCA, DIV.LCDpresent
                        TST       _ACCA
                        .BRANCH   4,DIV._L0533
                        BRNE      DIV._L0533
                        .BRANCH   20,DIV._L0531
                        JMP       DIV._L0531
DIV._L0533:
                        .BLOCK    857
                        .LINE     858
                        LDI       _ACCA, 000h
                        .FRAME  0
                        CALL       SYSTEM.LCDPORTINP_M
                        ORI       _ACCA, 0C7h
                        STS       DIV.BUTTONTEMP, _ACCA
                        .ENDBLOCK 859
                        .BRANCH   20,DIV._L0532
                        JMP       DIV._L0532
DIV._L0531:
                        .BLOCK    859
                        .LINE     860
                        LDI       _ACCA, 0FFh
                        STS       DIV.BUTTONTEMP, _ACCA
                        .ENDBLOCK 861
DIV._L0532:
                        .LINE     862
                        LDS       _ACCB, 0011Ah
                        CLR       _ACCA
                        SBRC      _ACCB, 003h
                        SER       _ACCA
                        COM       _ACCA
                        PUSH      _ACCA
                        LDI       _ACCCLO, DIV.OffsetInitialised AND 0FFh
                        LDI       _ACCCHI, DIV.OffsetInitialised SHRB 8
                        CALL      SYSTEM._ReadEEp16
                        CPI       _ACCA, 0AAh
                        BRNE      DIV._L0534
                        CPI       _ACCB, 055h
DIV._L0534:
                        LDI       _ACCA, 0h
                        BREQ      DIV._L0535
                        SER       _ACCA
DIV._L0535:
                        POP       _ACCB
                        OR        _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   4,DIV._L0538
                        BRNE      DIV._L0538
                        .BRANCH   20,DIV._L0536
                        JMP       DIV._L0536
DIV._L0538:
                        .BLOCK    862
                        .LINE     863
                        LDI       _ACCA, 003h
                        STS       DIV.RANGE, _ACCA
                        .LINE     864
                        .BRANCH   17,DIV.SWITCHRANGE
                        CALL      DIV.SWITCHRANGE
                        .LINE     865
                        SBI       00035h, 007h
                        .LINE     866
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 00Ah
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DIV.BLINKDELAY
                        CALL      DIV.BLINKDELAY
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     867
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
                        .LINE     868
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, DIV.NoOffsetStr AND 0FFh
                        LDI       _ACCCHI, DIV.NoOffsetStr SHRB 8
                        LPM       _ACCBHI, Z+
                        TST       _ACCBHI
                        BREQ      DIV._L0539
                        CALL      SYSTEM.StrConst2Str
DIV._L0539:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     869
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 00Ah
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DIV.BLINKDELAY
                        CALL      DIV.BLINKDELAY
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     870
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
                        .LINE     871
                        LDI       _ACCA, 000h
                        .FRAME  0
                        CALL      SYSTEM.LCDCLREOL_M
                        .LINE     872
                        LDI       _ACCA, 0A5h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .LINE     873
                        .LOOP
                        LDI       _ACCCLO, DIV.Range AND 0FFh
                        LDI       _ACCCHI, DIV.Range SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 003h
                        ST        Z, _ACCA
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
DIV._L0542:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0h
                        BREQ      DIV._L0543
                        BRLO      DIV._L0543
                        SER       _ACCA
DIV._L0543:
                        TST       _ACCA
                        .BRANCH   3,DIV._L0544
                        BREQ      DIV._L0544
                        .BRANCH   20,DIV._L0541
                        JMP       DIV._L0541
DIV._L0544:
                        .BLOCK    874
                        .LINE     874
                        .BRANCH   17,DIV.SWITCHRANGE
                        CALL      DIV.SWITCHRANGE
                        .LINE     875
                        SBI       00035h, 007h
                        .LINE     876
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 01Eh
                        ST        -Y, _ACCA
                        .FRAME  4
                        .FRAME  3
                        .BRANCH   17,DIV.BLINKDELAY
                        CALL      DIV.BLINKDELAY
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     877
                        LDS       _ACCA, DIV.Range
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BRNE      DIV._L0545
                        SER       _ACCA
DIV._L0545:
                        TST       _ACCA
                        .BRANCH   4,DIV._L0548
                        BRNE      DIV._L0548
                        .BRANCH   20,DIV._L0546
                        JMP       DIV._L0546
DIV._L0548:
                        .BLOCK    877
                        .LINE     878
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 014h
                        ST        -Y, _ACCA
                        .FRAME  4
                        .FRAME  3
                        .BRANCH   17,DIV.BLINKDELAY
                        CALL      DIV.BLINKDELAY
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 879
DIV._L0546:
DIV._L0547:
                        .LINE     880
                        LDI       _ACCA, 0A5h
                        .FRAME  3
                        CALL      SYSTEM.LCDOUT_M
                        .LINE     881
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 002h
                        ST        -Y, _ACCA
                        .FRAME  4
                        .FRAME  3
                        .BRANCH   17,DIV.SERPROMPT
                        CALL      DIV.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     882
                        CLI
                        LDI       _ACCA, 0FEH ROLB IntFlag
                        AND       Flags, _ACCA
                        .LINE     883
                        LDI       _ACCCLO, DIV.OffsetArray24 AND 0FFh
                        LDI       _ACCCHI, DIV.OffsetArray24 SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DIV.Range
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
                        LDS       _ACCB, DIV.AD24tempFI
                        LDS       _ACCA, DIV.AD24tempFI+1
                        LDS       _ACCALO, DIV.AD24tempFI+2
                        LDS       _ACCAHI, DIV.AD24tempFI+3
                        SUBI      _ACCB, 01h
                        SBCI      _ACCA, 00h
                        SBCI      _ACCALO, 00h
                        SBCI      _ACCAHI, 00h
                        COM       _ACCALO
                        COM       _ACCAHI
                        COM       _ACCA
                        COM       _ACCB
                        SUBI      _ACCB, -000800000h AND 0FFh
                        SBCI      _ACCA, -000800000h SHRB 8
                        SBCI      _ACCALO, -000800000h SHRB 16
                        SBCI      _ACCAHI, -000800000h SHRB 24
                        POP       _ACCCHI
                        POP       _ACCCLO
                        MOVW      _ACCBLO, _ACCB
                        CALL      SYSTEM._WriteEEp32
                        .LINE     884
                        LDI       _ACCA, 1 SHLB IntFlag
                        OR        Flags, _ACCA
                        SEI
                        .ENDBLOCK 885
DIV._L0540:
                        .LINE     885
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        DEC       _ACCA
                        ST        Z, _ACCA
                        CPI       _ACCA, 0FFh
                        .BRANCH   3,DIV._L0541
                        BREQ      DIV._L0541
                        .BRANCH   20,DIV._L0542
                        JMP       DIV._L0542
DIV._L0541:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .LINE     886
                        LDI       _ACCA, 00Bh
                        STS       DIV.RANGE, _ACCA
                        .LINE     887
                        .BRANCH   17,DIV.SWITCHRANGE
                        CALL      DIV.SWITCHRANGE
                        .LINE     888
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 032h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DIV.BLINKDELAY
                        CALL      DIV.BLINKDELAY
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     889
                        LDI       _ACCA, 0A5h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .LINE     890
                        CLI
                        LDI       _ACCA, 0FEH ROLB IntFlag
                        AND       Flags, _ACCA
                        .LINE     891
                        .LOOP
                        LDI       _ACCCLO, DIV.Range AND 0FFh
                        LDI       _ACCCHI, DIV.Range SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 00Bh
                        ST        Z, _ACCA
                        LDI       _ACCA, 008h
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
DIV._L0551:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0h
                        BREQ      DIV._L0552
                        BRLO      DIV._L0552
                        SER       _ACCA
DIV._L0552:
                        TST       _ACCA
                        .BRANCH   3,DIV._L0553
                        BREQ      DIV._L0553
                        .BRANCH   20,DIV._L0550
                        JMP       DIV._L0550
DIV._L0553:
                        .BLOCK    892
                        .LINE     892
                        LDI       _ACCCLO, DIV.OffsetArray24 AND 0FFh
                        LDI       _ACCCHI, DIV.OffsetArray24 SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DIV.Range
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
                        LDS       _ACCB, DIV.AD24tempFI
                        LDS       _ACCA, DIV.AD24tempFI+1
                        LDS       _ACCALO, DIV.AD24tempFI+2
                        LDS       _ACCAHI, DIV.AD24tempFI+3
                        SUBI      _ACCB, 01h
                        SBCI      _ACCA, 00h
                        SBCI      _ACCALO, 00h
                        SBCI      _ACCAHI, 00h
                        COM       _ACCALO
                        COM       _ACCAHI
                        COM       _ACCA
                        COM       _ACCB
                        SUBI      _ACCB, -000800000h AND 0FFh
                        SBCI      _ACCA, -000800000h SHRB 8
                        SBCI      _ACCALO, -000800000h SHRB 16
                        SBCI      _ACCAHI, -000800000h SHRB 24
                        POP       _ACCCHI
                        POP       _ACCCLO
                        MOVW      _ACCBLO, _ACCB
                        CALL      SYSTEM._WriteEEp32
                        .ENDBLOCK 893
DIV._L0549:
                        .LINE     893
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        DEC       _ACCA
                        ST        Z, _ACCA
                        CPI       _ACCA, 0FFh
                        .BRANCH   3,DIV._L0550
                        BREQ      DIV._L0550
                        .BRANCH   20,DIV._L0551
                        JMP       DIV._L0551
DIV._L0550:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .LINE     894
                        LDI       _ACCA, 1 SHLB IntFlag
                        OR        Flags, _ACCA
                        SEI
                        .LINE     895
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 002h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DIV.SERPROMPT
                        CALL      DIV.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     896
                        LDI       _ACCA, 003h
                        STS       DIV.RANGE, _ACCA
                        .LINE     897
                        .BRANCH   17,DIV.SWITCHRANGE
                        CALL      DIV.SWITCHRANGE
                        .LINE     898
                        SBI       00035h, 007h
                        .LINE     899
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 01Eh
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DIV.BLINKDELAY
                        CALL      DIV.BLINKDELAY
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     900
                        LDI       _ACCA, 0A5h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .LINE     901
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 002h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DIV.SERPROMPT
                        CALL      DIV.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     902
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 01Eh
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DIV.BLINKDELAY
                        CALL      DIV.BLINKDELAY
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     903
                        LDI       _ACCA, 0A5h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .LINE     904
                        CLI
                        LDI       _ACCA, 0FEH ROLB IntFlag
                        AND       Flags, _ACCA
                        .LINE     905
                        .LOOP
                        LDI       _ACCCLO, DIV.Range AND 0FFh
                        LDI       _ACCCHI, DIV.Range SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 00Fh
                        ST        Z, _ACCA
                        LDI       _ACCA, 00Ch
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
DIV._L0556:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0h
                        BREQ      DIV._L0557
                        BRLO      DIV._L0557
                        SER       _ACCA
DIV._L0557:
                        TST       _ACCA
                        .BRANCH   3,DIV._L0558
                        BREQ      DIV._L0558
                        .BRANCH   20,DIV._L0555
                        JMP       DIV._L0555
DIV._L0558:
                        .BLOCK    906
                        .LINE     906
                        LDI       _ACCCLO, DIV.OffsetArray24 AND 0FFh
                        LDI       _ACCCHI, DIV.OffsetArray24 SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DIV.Range
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
                        LDS       _ACCB, DIV.AD24tempFI
                        LDS       _ACCA, DIV.AD24tempFI+1
                        LDS       _ACCALO, DIV.AD24tempFI+2
                        LDS       _ACCAHI, DIV.AD24tempFI+3
                        SUBI      _ACCB, 01h
                        SBCI      _ACCA, 00h
                        SBCI      _ACCALO, 00h
                        SBCI      _ACCAHI, 00h
                        COM       _ACCALO
                        COM       _ACCAHI
                        COM       _ACCA
                        COM       _ACCB
                        SUBI      _ACCB, -000800000h AND 0FFh
                        SBCI      _ACCA, -000800000h SHRB 8
                        SBCI      _ACCALO, -000800000h SHRB 16
                        SBCI      _ACCAHI, -000800000h SHRB 24
                        POP       _ACCCHI
                        POP       _ACCCLO
                        MOVW      _ACCBLO, _ACCB
                        CALL      SYSTEM._WriteEEp32
                        .ENDBLOCK 907
DIV._L0554:
                        .LINE     907
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        DEC       _ACCA
                        ST        Z, _ACCA
                        CPI       _ACCA, 0FFh
                        .BRANCH   3,DIV._L0555
                        BREQ      DIV._L0555
                        .BRANCH   20,DIV._L0556
                        JMP       DIV._L0556
DIV._L0555:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .LINE     908
                        .LOOP
                        LDI       _ACCCLO, DIV.Range AND 0FFh
                        LDI       _ACCCHI, DIV.Range SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 007h
                        ST        Z, _ACCA
                        LDI       _ACCA, 004h
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
DIV._L0561:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0h
                        BREQ      DIV._L0562
                        BRLO      DIV._L0562
                        SER       _ACCA
DIV._L0562:
                        TST       _ACCA
                        .BRANCH   3,DIV._L0563
                        BREQ      DIV._L0563
                        .BRANCH   20,DIV._L0560
                        JMP       DIV._L0560
DIV._L0563:
                        .BLOCK    909
                        .LINE     909
                        LDI       _ACCCLO, DIV.OffsetArray24 AND 0FFh
                        LDI       _ACCCHI, DIV.OffsetArray24 SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, DIV.Range
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
                        LDS       _ACCB, DIV.AD24tempFI
                        LDS       _ACCA, DIV.AD24tempFI+1
                        LDS       _ACCALO, DIV.AD24tempFI+2
                        LDS       _ACCAHI, DIV.AD24tempFI+3
                        SUBI      _ACCB, 01h
                        SBCI      _ACCA, 00h
                        SBCI      _ACCALO, 00h
                        SBCI      _ACCAHI, 00h
                        COM       _ACCALO
                        COM       _ACCAHI
                        COM       _ACCA
                        COM       _ACCB
                        SUBI      _ACCB, -000800000h AND 0FFh
                        SBCI      _ACCA, -000800000h SHRB 8
                        SBCI      _ACCALO, -000800000h SHRB 16
                        SBCI      _ACCAHI, -000800000h SHRB 24
                        POP       _ACCCHI
                        POP       _ACCCLO
                        MOVW      _ACCBLO, _ACCB
                        CALL      SYSTEM._WriteEEp32
                        .ENDBLOCK 910
DIV._L0559:
                        .LINE     910
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        DEC       _ACCA
                        ST        Z, _ACCA
                        CPI       _ACCA, 0FFh
                        .BRANCH   3,DIV._L0560
                        BREQ      DIV._L0560
                        .BRANCH   20,DIV._L0561
                        JMP       DIV._L0561
DIV._L0560:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .LINE     911
                        LDI       _ACCA, 1 SHLB IntFlag
                        OR        Flags, _ACCA
                        SEI
                        .LINE     912
                        LDI       _ACCA, 0AA55h SHRB 8
                        LDI       _ACCB, 0AA55h AND 0FFh
                        LDI       _ACCCLO, DIV.OFFSETINITIALISED AND 0FFh
                        LDI       _ACCCHI, DIV.OFFSETINITIALISED SHRB 8
                        MOVW      _ACCALO, _ACCB
                        CALL      SYSTEM._WriteEEp16
                        ADIW      _ACCCLO, 01h
                        .LINE     913
                        LDS       _ACCA, 001D4h
                        CBR       _ACCA, 080h
                        STS       001D4h, _ACCA
                        .LINE     914
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DIV.SERPROMPT
                        CALL      DIV.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 915
DIV._L0536:
DIV._L0537:
                        .LINE     916
                        SBI       00032h, 002h
                        .LINE     917
                        LDI       _ACCCLO, DIV.InitRange AND 0FFh
                        LDI       _ACCCHI, DIV.InitRange SHRB 8
                        CALL      SYSTEM.ReadEEp8
                        STS       DIV.RANGE, _ACCA
                        .LINE     918
                        .BRANCH   17,DIV.SWITCHRANGE
                        CALL      DIV.SWITCHRANGE
                        .LINE     919
                        LDI       _ACCA, 0FFh
                        STS       DIV.CURRENTCH, _ACCA
                        .LINE     920
                        LDI       _ACCA, 0FFh
                        STS       DIV.FIRSTTURN, _ACCA
                        .ENDBLOCK 921
DIV.initall_X:
                        .LINE     921
                        .BRANCH   19
                        RET
                        .ENDFUNC  921



                        ; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                        ; Program body
                        ; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

                        .FUNC     $_Main, 0039Eh, 00020h
                        .ENTRYMAIN $
DIV.$_Main:

                        .BLOCK    926
                        .LINE     927
                        .BRANCH   17,DIV.INITALL
                        CALL      DIV.INITALL
DIV._L0564:
                        .BLOCK    929
                        .LINE     930
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DIV.CHECKSER
                        CALL      DIV.CHECKSER
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     932
                        SER       _ACCA
                        LDS       _ACCB, DIV.ActivityTimer
                        TST       _ACCB
                        BREQ      DIV._L0566
                        COM       _ACCA
DIV._L0566:
                        TST       _ACCA
                        .BRANCH   4,DIV._L0569
                        BRNE      DIV._L0569
                        .BRANCH   20,DIV._L0567
                        JMP       DIV._L0567
DIV._L0569:
                        .BLOCK    932
                        .LINE     933
                        SBI       00032h, 002h
                        .ENDBLOCK 934
DIV._L0567:
DIV._L0568:
                        .LINE     935
                        CLR       _ACCA
                        MOV       _ACCB, _SYSTFLAGS
                        ANDI      _ACCB, 001h
                        BRNE      DIV._L0570
                        COM       _ACCA
DIV._L0570:
                        TST       _ACCA
                        .BRANCH   4,DIV._L0573
                        BRNE      DIV._L0573
                        .BRANCH   20,DIV._L0571
                        JMP       DIV._L0571
DIV._L0573:
                        .BLOCK    936
                        .LINE     936
                        LDI       _ACCCLO, DIV.TrigTimerValue AND 0FFh
                        LDI       _ACCCHI, DIV.TrigTimerValue SHRB 8
                        CALL      SYSTEM._ReadEEp16
                        STS       DIV.AWORD, _ACCB
                        STS       DIV.AWORD+1, _ACCA
                        .LINE     937
                        LDS       _ACCB, DIV.aWord
                        LDS       _ACCA, DIV.aWord+1
                        CPI       _ACCA, 000h
                        BRNE      DIV._L0574
                        CPI       _ACCB, 000h
DIV._L0574:
                        LDI       _ACCA, 0h
                        BREQ      DIV._L0575
                        SER       _ACCA
DIV._L0575:
                        TST       _ACCA
                        .BRANCH   4,DIV._L0578
                        BRNE      DIV._L0578
                        .BRANCH   20,DIV._L0576
                        JMP       DIV._L0576
DIV._L0578:
                        .BLOCK    937
                        .LINE     938
                        LDI       _ACCA, 0FFh
                        STS       DIV.TRIGGER, _ACCA
                        .LINE     939
                        LDS       _ACCB, DIV.aWord
                        LDS       _ACCA, DIV.aWord+1
                        MOVW      _ACCBLO, _ACCB
                        LDI       _ACCALO, 0000Ah AND 0FFh
                        LDI       _ACCAHI, 0000Ah SHRB 8
                        CLT
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.DIV16_R
                        STS       DIV.AWORD, _ACCB
                        STS       DIV.AWORD+1, _ACCA
                        .LINE     940
                        LDS       _ACCB, DIV.aWord
                        LDS       _ACCA, DIV.aWord+1
                        LDI       _ACCCLO, DIV.TrigTimer AND 0FFh
                        LDI       _ACCCHI, DIV.TrigTimer SHRB 8
                        LDI       _ACCBHI, 001h
                        CALL      SYSTEM.SetSysTimer
                        .ENDBLOCK 941
DIV._L0576:
DIV._L0577:
                        .ENDBLOCK 942
DIV._L0571:
DIV._L0572:
                        .LINE     943
                        LDS       _ACCA, DIV.Trigger
                        TST       _ACCA
                        .BRANCH   4,DIV._L0581
                        BRNE      DIV._L0581
                        .BRANCH   20,DIV._L0579
                        JMP       DIV._L0579
DIV._L0581:
                        .BLOCK    944
                        .LINE     944
                        LDI       _ACCCLO, DIV.TrigMask AND 0FFh
                        LDI       _ACCCHI, DIV.TrigMask SHRB 8
                        CALL      SYSTEM.ReadEEp8
                        STS       DIV.TRIGMASKTEMP, _ACCA
                        .LINE     945
                        LDS       _ACCA, DIV.TrigMaskTemp
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      DIV._L0582
                        SER       _ACCA
DIV._L0582:
                        TST       _ACCA
                        .BRANCH   4,DIV._L0585
                        BRNE      DIV._L0585
                        .BRANCH   20,DIV._L0583
                        JMP       DIV._L0583
DIV._L0585:
                        .BLOCK    945
                        .LINE     946
                        LDI       _ACCA, 00Fh
                        STS       DIV.TrigLEDtimer, _ACCA
                        .LINE     947
                        CBI       00032h, 003h
                        .LINE     948
                        LDS       _ACCB, 001D3h
                        CLR       _ACCA
                        SBRC      _ACCB, 000h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DIV._L0588
                        BRNE      DIV._L0588
                        .BRANCH   20,DIV._L0586
                        JMP       DIV._L0586
DIV._L0588:
                        .BLOCK    948
                        .LINE     949
                        LDI       _ACCA, 000h
                        STS       DIV.SUBCH, _ACCA
                        .LINE     950
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DIV.PARSEGETPARAM
                        CALL      DIV.PARSEGETPARAM
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 951
DIV._L0586:
DIV._L0587:
                        .LINE     952
                        LDS       _ACCB, 001D3h
                        CLR       _ACCA
                        SBRC      _ACCB, 001h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DIV._L0591
                        BRNE      DIV._L0591
                        .BRANCH   20,DIV._L0589
                        JMP       DIV._L0589
DIV._L0591:
                        .BLOCK    952
                        .LINE     953
                        LDI       _ACCA, 00Ah
                        STS       DIV.SUBCH, _ACCA
                        .LINE     954
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DIV.PARSEGETPARAM
                        CALL      DIV.PARSEGETPARAM
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 955
DIV._L0589:
DIV._L0590:
                        .LINE     956
                        LDS       _ACCB, 001D3h
                        CLR       _ACCA
                        SBRC      _ACCB, 002h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DIV._L0594
                        BRNE      DIV._L0594
                        .BRANCH   20,DIV._L0592
                        JMP       DIV._L0592
DIV._L0594:
                        .BLOCK    956
                        .LINE     957
                        LDI       _ACCA, 00Bh
                        STS       DIV.SUBCH, _ACCA
                        .LINE     958
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DIV.PARSEGETPARAM
                        CALL      DIV.PARSEGETPARAM
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 959
DIV._L0592:
DIV._L0593:
                        .ENDBLOCK 960
DIV._L0583:
DIV._L0584:
                        .LINE     961
                        LDI       _ACCA, 000h
                        STS       DIV.TRIGGER, _ACCA
                        .ENDBLOCK 962
DIV._L0579:
DIV._L0580:
                        .LINE     963
                        LDS       _ACCA, DIV.LCDpresent
                        PUSH      _ACCA
                        CALL       SYSTEM.SERSTAT
                        COM       _ACCA
                        POP       _ACCB
                        AND       _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   4,DIV._L0597
                        BRNE      DIV._L0597
                        .BRANCH   20,DIV._L0595
                        JMP       DIV._L0595
DIV._L0597:
                        .BLOCK    963
                        .LINE     964
                        LDI       _ACCA, 000h
                        .FRAME  0
                        CALL       SYSTEM.GETINCRVAL4
                        STS       DIV.INCRVALUE, _ACCB
                        STS       DIV.INCRVALUE+1, _ACCA
                        .LINE     966
                        LDS       _ACCB, DIV.IncrValue
                        LDS       _ACCA, DIV.IncrValue+1
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDS       _ACCB, DIV.OldIncrValue
                        LDS       _ACCA, DIV.OldIncrValue+1
                        MOVW      _ACCALO, _ACCB
                        POP       _ACCA
                        POP       _ACCB
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        EOR       _ACCAHI, _ACCBLO
                        CP        _ACCA, _ACCAHI
                        BRNE      DIV._L0598
                        CP        _ACCB, _ACCALO
DIV._L0598:
                        LDI       _ACCA, 0h
                        BREQ      DIV._L0599
                        SER       _ACCA
DIV._L0599:
                        TST       _ACCA
                        .BRANCH   4,DIV._L0602
                        BRNE      DIV._L0602
                        .BRANCH   20,DIV._L0600
                        JMP       DIV._L0600
DIV._L0602:
                        .BLOCK    966
                        .LINE     967
                        LDI       _ACCA, 019h
                        STS       DIV.ActivityTimer, _ACCA
                        .LINE     968
                        CBI       00032h, 002h
                        .LINE     969
                        LDS       _ACCB, DIV.IncrDiff
                        LDS       _ACCA, DIV.IncrDiff+1
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDS       _ACCB, DIV.IncrValue
                        LDS       _ACCA, DIV.IncrValue+1
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDS       _ACCB, DIV.OldIncrValue
                        LDS       _ACCA, DIV.OldIncrValue+1
                        NEG       _ACCB
                        BRNE      DIV._L0603
                        DEC       _ACCA
DIV._L0603:
                        COM       _ACCA
                        POP       _ACCAHI
                        POP       _ACCALO
                        ADD       _ACCB, _ACCALO
                        ADC       _ACCA, _ACCAHI
                        POP       _ACCAHI
                        POP       _ACCALO
                        ADD       _ACCB, _ACCALO
                        ADC       _ACCA, _ACCAHI
                        STS       DIV.INCRDIFF, _ACCB
                        STS       DIV.INCRDIFF+1, _ACCA
                        .LINE     970
                        LDS       _ACCB, DIV.IncrValue
                        LDS       _ACCA, DIV.IncrValue+1
                        STS       DIV.OLDINCRVALUE, _ACCB
                        STS       DIV.OLDINCRVALUE+1, _ACCA
                        .LINE     971
                        LDI       _ACCA, 014h
                        STS       DIV.IncrTimer, _ACCA
                        .LINE     972
                        LDS       _ACCB, DIV.IncrDiff
                        LDS       _ACCA, DIV.IncrDiff+1
                        TST       _ACCA
                        BRPL      DIV._L0604
                        NEG       _ACCB
                        BRNE      DIV._L0605
                        DEC       _ACCA
DIV._L0605:
                        COM       _ACCA
DIV._L0604:
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDS       _ACCB, DIV.IncRast
                        LDS       _ACCA, DIV.IncRast+1
                        MOVW      _ACCALO, _ACCB
                        POP       _ACCA
                        POP       _ACCB
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        EOR       _ACCAHI, _ACCBLO
                        CP        _ACCA, _ACCAHI
                        BRNE      DIV._L0606
                        CP        _ACCB, _ACCALO
DIV._L0606:
                        LDI       _ACCA, 0
                        BRLO      DIV._L0607
                        LDI       _ACCA, 0FFh
DIV._L0607:
                        TST       _ACCA
                        .BRANCH   4,DIV._L0610
                        BRNE      DIV._L0610
                        .BRANCH   20,DIV._L0608
                        JMP       DIV._L0608
DIV._L0610:
                        .BLOCK    973
                        .LINE     973
                        LDI       _ACCA, 0FFh
                        STS       DIV.CHANGEDFLAG, _ACCA
                        .LINE     974
                        LDS       _ACCA, 001D4h
                        SBR       _ACCA, 080h
                        STS       001D4h, _ACCA
                        .LINE     975
                        LDS       _ACCB, DIV.IncrDiff
                        LDS       _ACCA, DIV.IncrDiff+1
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDS       _ACCB, DIV.IncRast
                        LDS       _ACCA, DIV.IncRast+1
                        SET
                        BLD       Flags, _SIGN
                        POP       _ACCBHI
                        POP       _ACCBLO
                        CALL      SYSTEM.DIV16
                        STS       DIV.INCRDIFF, _ACCB
                        STS       DIV.INCRDIFF+1, _ACCA
                        .LINE     976
                        LDS       _ACCB, DIV.IncrDiff
                        LDS       _ACCA, DIV.IncrDiff+1
                        MOV       _ACCA, _ACCB
                        STS       DIV.INCRDIFFBYTE, _ACCA
                        .LINE     980
                        LDS       _ACCA, DIV.FirstTurn
                        TST       _ACCA
                        .BRANCH   4,DIV._L0613
                        BRNE      DIV._L0613
                        .BRANCH   20,DIV._L0611
                        JMP       DIV._L0611
DIV._L0613:
                        .BLOCK    980
                        .LINE     981
                        LDI       _ACCA, 004h
                        STS       DIV.BUTTONNUMBER, _ACCA
                        .LINE     982
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DIV.SERPROMPT
                        CALL      DIV.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 983
DIV._L0611:
DIV._L0612:
                        .LINE     984
                        LDS       _ACCA, DIV.Range
                        PUSH      _ACCA
                        LDS       _ACCA, DIV.IncrDiffByte
                        POP       _ACCB
                        ADD       _ACCA, _ACCB
                        STS       DIV.RANGE, _ACCA
                        .LINE     985
                        LDI       _ACCA, 00000h SHRB 8
                        LDI       _ACCB, 00000h AND 0FFh
                        STS       DIV.INCRDIFF, _ACCB
                        STS       DIV.INCRDIFF+1, _ACCA
                        .LINE     986
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DIV.CHECKLIMITS
                        CALL       DIV.CHECKLIMITS
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     987
                        LDI       _ACCA, 009h
                        STS       DIV.SUBCH, _ACCA
                        .LINE     988
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DIV.PARSEGETPARAM
                        CALL      DIV.PARSEGETPARAM
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     989
                        .BRANCH   17,DIV.SWITCHRANGE
                        CALL      DIV.SWITCHRANGE
                        .LINE     990
                        .BRANCH   17,DIV.SHOWRANGE
                        CALL      DIV.SHOWRANGE
                        .LINE     991
                        LDI       _ACCA, 000h
                        STS       DIV.FIRSTTURN, _ACCA
                        .ENDBLOCK 992
DIV._L0608:
DIV._L0609:
                        .ENDBLOCK 993
DIV._L0600:
DIV._L0601:
                        .LINE     995
                        LDI       _ACCA, 000h
                        .FRAME  0
                        CALL       SYSTEM.LCDPORTINP_M
                        ORI       _ACCA, 0C7h
                        STS       DIV.BUTTONTEMP, _ACCA
                        .LINE     996
                        LDS       _ACCA, DIV.ButtonTemp
                        CPI       _ACCA, 0FFh
                        LDI       _ACCA, 0h
                        BREQ      DIV._L0614
                        SER       _ACCA
DIV._L0614:
                        TST       _ACCA
                        .BRANCH   4,DIV._L0617
                        BRNE      DIV._L0617
                        .BRANCH   20,DIV._L0615
                        JMP       DIV._L0615
DIV._L0617:
                        .BLOCK    996
                        .LINE     997
                        LDS       _ACCB, 0011Ah
                        CLR       _ACCA
                        SBRC      _ACCB, 003h
                        SER       _ACCA
                        COM       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DIV._L0620
                        BRNE      DIV._L0620
                        .BRANCH   20,DIV._L0618
                        JMP       DIV._L0618
DIV._L0620:
                        .BLOCK    997
                        .LINE     998
                        LDI       _ACCA, 0FFh
                        STS       DIV.INCRENTER, _ACCA
                        .LINE     999
                        LDS       _ACCA, DIV.Range
                        LDI       _ACCCLO, DIV.INITRANGE AND 0FFh
                        LDI       _ACCCHI, DIV.INITRANGE SHRB 8
                        CALL      SYSTEM.WriteEEp8
                        ADIW      _ACCCLO, 01h
                        .LINE     1000
                        LDI       _ACCA, 003h
                        STS       DIV.BUTTONNUMBER, _ACCA
                        .LINE     1001
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DIV.SERPROMPT
                        CALL      DIV.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 1002
                        .BRANCH   20,DIV._L0619
                        JMP       DIV._L0619
DIV._L0618:
                        .BLOCK    1002
                        .LINE     1003
                        LDS       _ACCB, 0011Ah
                        CLR       _ACCA
                        SBRC      _ACCB, 005h
                        SER       _ACCA
                        COM       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DIV._L0623
                        BRNE      DIV._L0623
                        .BRANCH   20,DIV._L0621
                        JMP       DIV._L0621
DIV._L0623:
                        .BLOCK    1003
                        .LINE     1004
                        LDS       _ACCA, DIV.Range
                        DEC       _ACCA
                        STS       DIV.Range, _ACCA
                        .LINE     1005
                        LDI       _ACCA, 000h
                        STS       DIV.AUTORANGEMODE, _ACCA
                        .LINE     1006
                        LDI       _ACCA, 001h
                        STS       DIV.BUTTONNUMBER, _ACCA
                        .LINE     1007
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DIV.SERPROMPT
                        CALL      DIV.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 1008
DIV._L0621:
DIV._L0622:
                        .LINE     1009
                        LDS       _ACCB, 0011Ah
                        CLR       _ACCA
                        SBRC      _ACCB, 004h
                        SER       _ACCA
                        COM       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DIV._L0626
                        BRNE      DIV._L0626
                        .BRANCH   20,DIV._L0624
                        JMP       DIV._L0624
DIV._L0626:
                        .BLOCK    1009
                        .LINE     1010
                        LDI       _ACCA, 002h
                        STS       DIV.BUTTONNUMBER, _ACCA
                        .LINE     1011
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DIV.SERPROMPT
                        CALL      DIV.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1012
                        LDS       _ACCA, DIV.Range
                        INC       _ACCA
                        STS       DIV.Range, _ACCA
                        .LINE     1013
                        LDI       _ACCA, 000h
                        STS       DIV.AUTORANGEMODE, _ACCA
                        .ENDBLOCK 1014
DIV._L0624:
DIV._L0625:
                        .LINE     1015
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DIV.CHECKLIMITS
                        CALL       DIV.CHECKLIMITS
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 1016
DIV._L0619:
                        .LINE     1017
                        LDI       _ACCA, 013h
                        STS       DIV.SUBCH, _ACCA
                        .LINE     1018
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,DIV.PARSEGETPARAM
                        CALL      DIV.PARSEGETPARAM
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1019
                        .BRANCH   17,DIV.SWITCHRANGE
                        CALL      DIV.SWITCHRANGE
                        .LINE     1020
                        .BRANCH   17,DIV.SHOWRANGE
                        CALL      DIV.SHOWRANGE
DIV._L0627:
                        .BLOCK    1021
                        .LINE     1022
                        LDI       _ACCA, 000h
                        .FRAME  0
                        CALL       SYSTEM.LCDPORTINP_M
                        ORI       _ACCA, 0C7h
                        STS       DIV.BUTTONTEMP, _ACCA
                        .LINE     1023
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DIV.CHECKDELAY
                        CALL      DIV.CHECKDELAY
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 1024
                        .LINE     1024
DIV._L0628:
                        LDS       _ACCA, DIV.ButtonTemp
                        CPI       _ACCA, 0FFh
                        LDI       _ACCA, 0h
                        BRNE      DIV._L0630
                        SER       _ACCA
DIV._L0630:
                        TST       _ACCA
                        .BRANCH   4,DIV._L0631
                        BRNE      DIV._L0631
                        .BRANCH   20,DIV._L0627
                        JMP       DIV._L0627
DIV._L0631:
DIV._L0629:
                        .LINE     1025
                        LDI       _ACCA, 000h
                        STS       DIV.BUTTONNUMBER, _ACCA
                        .LINE     1026
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DIV.SERPROMPT
                        CALL      DIV.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 1027
DIV._L0615:
DIV._L0616:
                        .ENDBLOCK 1028
DIV._L0595:
DIV._L0596:
                        .LINE     1029
                        SER       _ACCA
                        LDS       _ACCB, DIV.TrigLEDtimer
                        TST       _ACCB
                        BREQ      DIV._L0632
                        COM       _ACCA
DIV._L0632:
                        TST       _ACCA
                        .BRANCH   4,DIV._L0635
                        BRNE      DIV._L0635
                        .BRANCH   20,DIV._L0633
                        JMP       DIV._L0633
DIV._L0635:
                        .BLOCK    1029
                        .LINE     1030
                        SBI       00032h, 003h
                        .ENDBLOCK 1031
DIV._L0633:
DIV._L0634:
                        .LINE     1032
                        SER       _ACCA
                        LDS       _ACCB, DIV.DisplayTimer
                        TST       _ACCB
                        BREQ      DIV._L0636
                        COM       _ACCA
DIV._L0636:
                        TST       _ACCA
                        .BRANCH   4,DIV._L0639
                        BRNE      DIV._L0639
                        .BRANCH   20,DIV._L0637
                        JMP       DIV._L0637
DIV._L0639:
                        .BLOCK    1032
                        .LINE     1033
                        LDS       _ACCA, DIV.FirstTurn
                        COM       _ACCA
                        TST       _ACCA
                        .BRANCH   4,DIV._L0642
                        BRNE      DIV._L0642
                        .BRANCH   20,DIV._L0640
                        JMP       DIV._L0640
DIV._L0642:
                        .BLOCK    1033
                        .LINE     1034
                        LDI       _ACCA, 000h
                        STS       DIV.BUTTONNUMBER, _ACCA
                        .LINE     1035
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DIV.SERPROMPT
                        CALL      DIV.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 1036
DIV._L0640:
DIV._L0641:
                        .LINE     1037
                        LDI       _ACCA, 0FFh
                        STS       DIV.FIRSTTURN, _ACCA
                        .LINE     1038
                        LDS       _ACCA, 001D4h
                        CBR       _ACCA, 080h
                        STS       001D4h, _ACCA
                        .LINE     1039
                        LDI       _ACCA, 019h
                        STS       DIV.DisplayTimer, _ACCA
                        .LINE     1040
                        LDS       _ACCA, DIV.LCDpresent
                        TST       _ACCA
                        .BRANCH   4,DIV._L0645
                        BRNE      DIV._L0645
                        .BRANCH   20,DIV._L0643
                        JMP       DIV._L0643
DIV._L0645:
                        .BLOCK    1040
                        .LINE     1041
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCA, DIV.LCDintegrate
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,DIV.GETAD24
                        CALL      DIV.GETAD24
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1042
                        .BRANCH   17,DIV.PARAMSCALE24
                        CALL      DIV.PARAMSCALE24
                        .LINE     1043
                        .BRANCH   17,DIV.WRITEPARAMLCD
                        CALL      DIV.WRITEPARAMLCD
                        .LINE     1044
                        .BRANCH   17,DIV.SHOWRANGE
                        CALL      DIV.SHOWRANGE
                        .ENDBLOCK 1045
DIV._L0643:
DIV._L0644:
                        .ENDBLOCK 1046
DIV._L0637:
DIV._L0638:
                        .ENDBLOCK 1047
                        .LINE     1047
                        .BRANCH   20,DIV._L0564
                        JMP       DIV._L0564
DIV._L0565:
                        .ENDBLOCK 1048

DIV.$_MAINEX:
                        .LINE     1048
                        NOP
                        .LINE     1048
                        .BRANCH   20,DIV.$_MAINEX
                        RJMP      DIV.$_MAINEX


                        .ENDFUNC  1048

SYSTEM.$Main_stk        .EQU    001DEh          ; var iData  Process stack area
SYSTEM.$Main_stk_e      .EQU    0025Dh          ; var iData  Process stack area
SYSTEM.$Main_reg        .EQU    0025Eh          ; var iData  Process register area
SYSTEM.$Main_reg_e      .EQU    00270h          ; var iData  Process register area
SYSTEM.$Main_Frame      .EQU    00271h          ; var iData  Process stack area
SYSTEM.$Main_Frame_e    .EQU    00390h          ; var iData  Process stack area

                        ; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                        ; Initialisation and Library Routines
                        ; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

                        .ENTRY
SYSTEM.RESET:
                        CLI
                        ; >> Stack Init [main process only] <<
                        LDI       _ACCA, 002h
                        LDI       _ACCB, 05Dh
                        OUT       sph, _ACCA
                        OUT       spl, _ACCB


                        ; >> Memory Init <<
                        CLR       _ACCA
                        LDI       _ACCCLO, 16
                        LDI       _ACCCHI, 0
                        LDI       _ACCBLO, 0
                        LDI       _ACCBHI, 0
                        ADIW      _ACCCLO, 1
SYSTEM._L0646:
                        SBIW      _ACCCLO, 001h
                        BREQ      SYSTEM._L0648
SYSTEM._L0647:
                        ST        X+, _ACCA
                        RJMP      SYSTEM._L0646
SYSTEM._L0648:
                        LDI       _ACCBLO, 00060h AND 0FFh
                        LDI       _ACCBHI, 00060h SHRB 8
                        LDI       _ACCCLO, 00800h AND 0FFh
                        LDI       _ACCCHI, 00800h SHRB 8
                        ADIW      _ACCCLO, 1
SYSTEM._L0649:
                        SBIW      _ACCCLO, 001h
                        BREQ      SYSTEM._L0651
SYSTEM._L0650:
                        ST        X+, _ACCA
                        RJMP      SYSTEM._L0649
SYSTEM._L0651:
                        LDI       _FRAMEPTR, 00390h AND 0FFh
                        LDI       _FPTRHI, 00390h SHRB 8

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
                        JMP       DIV.$_Main

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
                        CALL      DIV.onSysTick
                        IN        _ACCB, adcl
                        IN        _ACCA, adch
                        PUSH      _ACCA
                        IN        _ACCCLO, admux
                        ANDI      _ACCCLO, 7
                        PUSH      _ACCCLO
                        LDS       _ACCCHI, _ADCBUFF+006h
                        ANDI      _ACCCHI, 1
                        BRNE      SYSTEM._L0654
                        INC       _ACCCLO
                        CPI       _ACCCLO, 005h
                        BRLO      SYSTEM._L0652
                        LDI       _ACCCLO, 002h
SYSTEM._L0652:
                        IN        _ACCCHI, admux
                        CBR       _ACCCHI, 7
                        OR        _ACCCLO, _ACCCHI
                        OUT       admux, _ACCCLO
SYSTEM._L0654:
                        POP       _ACCA
                        SUBI      _ACCA, 002h
                        LSL       _ACCA
                        LDI       _ACCCLO, _ADCBUFF AND 0FFh
                        LDI       _ACCCHI, _ADCBUFF SHRB 8
                        ADD       _ACCCLO, _ACCA
                        BRCC      SYSTEM._L0653
                        INC       _ACCCHI
SYSTEM._L0653:
                        POP       _ACCA
                        ST        Z, _ACCB
                        STD       Z+1, _ACCA
                        ;
                        LDS       _ACCB, _TWI_TO
                        TST       _ACCB
                        BREQ      SYSTEM._L0655
                        DEC       _ACCB
                        STS       _TWI_TO, _ACCB
SYSTEM._L0655:
                        LDS       _ACCA, _RXTIMEOUT
                        TST       _ACCA
                        BREQ      SYSTEM._L0656
                        DEC       _ACCA
                        STS       _RXTIMEOUT, _ACCA
SYSTEM._L0656:
                        LDS       _ACCCLO, DIV.TrigTimer
                        LDS       _ACCCHI, DIV.TrigTimer+1
                        TST       _ACCCHI
                        BRNE      SYSTEM._L0657
                        TST       _ACCCLO
                        BREQ      SYSTEM._L0658
SYSTEM._L0657:
                        SBIW      _ACCCLO, 1
                        STS       DIV.TrigTimer, _ACCCLO
                        STS       DIV.TrigTimer+1, _ACCCHI
                        RJMP      SYSTEM._L0659
SYSTEM._L0658:
                        MOV       _ACCA, _SYSTFLAGS
                        ANDI      _ACCA, 0FEh
                        MOV       _SYSTFLAGS, _ACCA
SYSTEM._L0659:
                        LDS       _ACCA, DIV.ActivityTimer
                        TST       _ACCA
                        BREQ      SYSTEM._L0660
                        SUBI      _ACCA, 1
                        STS       DIV.ActivityTimer, _ACCA
SYSTEM._L0660:
                        LDS       _ACCA, DIV.IncrTimer
                        TST       _ACCA
                        BREQ      SYSTEM._L0661
                        SUBI      _ACCA, 1
                        STS       DIV.IncrTimer, _ACCA
SYSTEM._L0661:
                        LDS       _ACCA, DIV.DisplayTimer
                        TST       _ACCA
                        BREQ      SYSTEM._L0662
                        SUBI      _ACCA, 1
                        STS       DIV.DisplayTimer, _ACCA
SYSTEM._L0662:
                        LDS       _ACCA, DIV.TrigLEDtimer
                        TST       _ACCA
                        BREQ      SYSTEM._L0663
                        SUBI      _ACCA, 1
                        STS       DIV.TrigLEDtimer, _ACCA
SYSTEM._L0663:
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
                        BRNE      SYSTEM._L0664
SYSTEM._L0668:
                        CBI       ucr1, 5
                        RJMP      SYSTEM._L0666
SYSTEM._L0664:
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
                        BRNE      SYSTEM._L0667
                        CBI       ucr1, 5
SYSTEM._L0667:
                        INC       _ACCB
                        CPI       _ACCB, 32
                        BRNE      SYSTEM._L0665
                        CLR       _ACCB
SYSTEM._L0665:
                        STS       _TXOUTP, _ACCB
SYSTEM._L0666:
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
SYSTEM._L0674:
                        LDS       _ACCA, _RXCOUNT
                        CPI       _ACCA, 128
                        BRNE      SYSTEM._L0669
                        IN        _ACCB, UDR1
                        RJMP      SYSTEM._L0671
SYSTEM._L0669:
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
                        CPI       _ACCB, 128
                        BRNE      SYSTEM._L0670
                        CLR       _ACCB
SYSTEM._L0670:
                        STS       _RXINP, _ACCB
                        SBIC      usr1, 7
                        RJMP      SYSTEM._L0674
SYSTEM._L0671:
SYSTEM._L0676:
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
                        RJMP      SYSTEM._L0681

SYSTEM._L0677:
                        MOV       _ACCB, _ACCA
                        LSR       _ACCA
                        LSR       _ACCA
                        ANDI      _ACCB, 3
                        BRNE      SYSTEM._L0678
                        ADIW      _ACCCLO, 2
                        RET
SYSTEM._L0678:
                        CPI       _ACCB, 1
                        BREQ      SYSTEM._L0679
                        LDD       _ACCALO, Z+0
                        LDD       _ACCAHI, Z+1
                        SUBI      _ACCALO, 0FFh
                        SBCI      _ACCAHI, 0FFh
                        RJMP      SYSTEM._L0680
SYSTEM._L0679:
                        LDD       _ACCALO, Z+0
                        LDD       _ACCAHI, Z+1
                        SUBI      _ACCALO, 1
                        SBCI      _ACCAHI, 0
SYSTEM._L0680:
                        ST        Z+, _ACCALO
                        ST        Z+, _ACCAHI
                        RET

SYSTEM._L0681:
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
                        BREQ      SYSTEM._L0682
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
                        RCALL     SYSTEM._L0677
SYSTEM._L0682:
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
                        CALL      DIV.INTERRUPT_Int2
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
                        BREQ       SYSTEM._L0683
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
                        RJMP      SYSTEM._L0684
SYSTEM._L0683:
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
SYSTEM._L0684:
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
                        BREQ       SYSTEM._L0685
                        LDS       _ACCDLO, _LCDM_PORT
                        ORI       _ACCDLO, 20h
                        LDI       _ACCBLO, 00000h AND 0FFh
                        LDI       _ACCBHI, 00000h SHRB 8
                        LDI       _ACCAHI, 000h
                        LDI       _ACCDHI, 000h
                        CALL      SYSTEM.TWIout
SYSTEM._L0685:
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
SYSTEM._L0686:
                        RCALL     SYSTEM._LCDM_Busy_Rd
                        TST       _ACCA
                        BRPL       SYSTEM._L0687
                        SBIW      _ACCCLO, 1
                        BRNE      SYSTEM._L0686
                        CLR       _ACCB
                        CLR       _ACCA
                        RET
SYSTEM._L0687:
                        MOV       _ACCB, _ACCA
                        SER       _ACCA
                        RET

SYSTEM._LCDM_Ctrl_Wr:
                        PUSH      _ACCA
                        RCALL     SYSTEM._LCDWAIT_M
                        TST       _ACCA
                        BRNE      SYSTEM._L0688
                        POP       _ACCB
                        RET
SYSTEM._L0688:
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
                        BRNE       SYSTEM._L0689
                        RET
SYSTEM._L0689:
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
                        RJMP      SYSTEM._L0690
SYSTEM.LCDCURSOR_M:
                        LDD       _ACCA, Y+002h
                        STS       _LCDM_PORT, _ACCA
                        LDD       _ACCA, Y+000h
                        LDD       _ACCB, Y+001h
SYSTEM._L0690:
                        TST       _ACCA
                        BRNE       SYSTEM._L0691
                        LDI       _ACCA, 0Ch
                        RJMP      SYSTEM._L0692

SYSTEM._L0691:
                        LDI       _ACCA, 0Dh
SYSTEM._L0692:
                        TST       _ACCB
                        BREQ       SYSTEM._L0693
                        ORI       _ACCA, 2
SYSTEM._L0693:
                        RJMP      SYSTEM._LCDM_Ctrl_Wr

SYSTEM.LCDXY_M:
                        LDD       _ACCA, Y+002h
                        STS       _LCDM_PORT, _ACCA
                        LDD       _ACCA, Y+000h
                        LDD       _ACCB, Y+001h
                        CPI       _ACCA, 0
                        BRNE       SYSTEM._L0694
                        LDI       _ACCA, 080h
                        RJMP      SYSTEM._L0698

SYSTEM._L0694:
                        CPI       _ACCA, 1
                        BRNE       SYSTEM._L0695
                        LDI       _ACCA, 0C0h
                        RJMP      SYSTEM._L0698

SYSTEM._L0695:
                        CPI       _ACCA, 2
                        BRNE       SYSTEM._L0696
                        LDI       _ACCA, 088h
                        RJMP      SYSTEM._L0698

SYSTEM._L0696:
                        CPI       _ACCA, 3
                        BRNE       SYSTEM._L0697
                        LDI       _ACCA, 0C8h
                        RJMP      SYSTEM._L0698

SYSTEM._L0697:
                        LDI       _ACCA, 080h
SYSTEM._L0698:
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
SYSTEM._L0699:
                        PUSH      _ACCB
                        LDI       _ACCA, 20h
                        RCALL     SYSTEM._LCDM_Data_Wr
                        POP       _ACCB
                        DEC       _ACCB
                        BRNE       SYSTEM._L0699
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
                        BRNE      SYSTEM._L0711
                        LDI       _ACCA, 090h
                        OUT       TWCR, _ACCA
SYSTEM._L0711:
                        LDI       _ACCA, 0A4h
                        OUT       TWCR, _ACCA
                        LDI       _ACCA, 10
                        STS       _TWI_TO, _ACCA
SYSTEM._L0709:
                        IN        _ACCA, TWCR
                        ANDI      _ACCA, 080h
                        BRNE      SYSTEM._L0712
                        LDS       _ACCA, _TWI_TO
                        TST       _ACCA
                        BRNE      SYSTEM._L0709
                        OUT       TWCR, _ACCA
                        RJMP      SYSTEM.TWI_ERROR
SYSTEM._L0712:
                        IN        _ACCA, TWSR
                        ANDI      _ACCA, 0FCh
                        CPI       _ACCA, 008h
                        BRNE      SYSTEM._L0716
                        RJMP      SYSTEM.TWI_ERROR
SYSTEM._L0716:
                        RJMP      SYSTEM.TWI_OK

SYSTEM.TWISTOPB:
SYSTEM._L0717:
                        IN        _ACCA, TWSR
                        ANDI      _ACCA, 0FCh
                        CPI       _ACCA, 0F8h
                        BREQ      SYSTEM._L0717
                        CPI       _ACCA, 000h
                        BRNE      SYSTEM._L0718
                        LDI       _ACCA, 090h
                        OUT       TWCR, _ACCA
                        NOP
SYSTEM._L0718:
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
SYSTEM._L0720:
                        IN        _ACCA, TWCR
                        ANDI      _ACCA, 080h
                        BRNE      SYSTEM._L0721
                        LDS       _ACCA, _TWI_TO
                        TST       _ACCA
                        BRNE      SYSTEM._L0720
                        RJMP      SYSTEM.TWI_ERROR
SYSTEM._L0721:
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
                        BRNE      SYSTEM._L0722
                        LDI       _ACCA, 084h
SYSTEM._L0722:
                        OUT       TWCR, _ACCA
SYSTEM._L0723:
                        IN        _ACCA, TWCR
                        SBRS      _ACCA, 7
                        RJMP      SYSTEM._L0723
                        IN        _ACCA, TWSR
                        ANDI      _ACCA, 0FCh
                        CPI       _ACCA, 058h
                        BREQ      SYSTEM._L0725
                        CPI       _ACCA, 050h
                        BRNE      SYSTEM.TWI_ERROR
SYSTEM._L0725:
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
                        BRNE      SYSTEM._L0724
                        LDI       _ACCA, 090h
                        OUT       TWCR, _ACCA
SYSTEM._L0724:
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
                        BREQ      SYSTEM._L0727
                        RCALL     SYSTEM.TWIRECVBYTE
                        TST       _ACCA
                        BREQ      SYSTEM._L0727
                        RJMP      SYSTEM.TWI_OK
SYSTEM._L0727:
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
                        BREQ      SYSTEM._L0733
SYSTEM._L0728:
                        MOV       _ACCDLO, _ACCAHI
                        RCALL     SYSTEM.TWISENDBYTE
                        TST       _ACCA
                        BREQ      SYSTEM._L0733
                        BST       Flags, _I2C2BYTE
                        BRTC      SYSTEM._L0732
                        MOV       _ACCDLO, _ACCALO
SYSTEM._L0730:
                        RCALL     SYSTEM.TWISENDBYTE
                        TST       _ACCA
                        BREQ      SYSTEM._L0733
SYSTEM._L0732:
                        TST       _ACCBLO
                        BRNE       SYSTEM._L0737
                        TST       _ACCBHI
                        BREQ       SYSTEM._L0731
SYSTEM._L0737:
                        TST       _ACCDHI
                        BRNE      SYSTEM._L0734
                        LD        _ACCDLO, Z+
                        RJMP      SYSTEM._L0736
SYSTEM._L0734:
                        CPI       _ACCDHI, 1
                        BRNE      SYSTEM._L0735
                        LPM       _ACCDLO, Z+
                        RJMP      SYSTEM._L0736
SYSTEM._L0735:
                        CALL      SYSTEM.ReadEEp8D
                        ADIW      _ACCCLO, 01h
SYSTEM._L0736:
                        SBIW      _ACCBLO, 1
                        RJMP      SYSTEM._L0730
SYSTEM._L0731:
                        RCALL     SYSTEM.TWISTOPB
                        RJMP      SYSTEM.TWI_OK
SYSTEM._L0733:
                        RCALL     SYSTEM.TWI_ERROR
                        SER       _ACCB
                        STS       TWI_DevLock, _ACCB
                        CLR       _ACCA
                        RET

SYSTEM.SERINP_TO:
                        LDD       _ACCA, Y+000h
                        STS       _RXTIMEOUT, _ACCA
SYSTEM._L0738:
                        RCALL     SYSTEM.SERSTAT
                        TST       _ACCA
                        BRNE      SYSTEM._L0739
                        LDS       _ACCA, _RXTIMEOUT
                        TST       _ACCA
                        BRNE      SYSTEM._L0738
                        RET
SYSTEM._L0739:
                        RCALL     SYSTEM.SERINP
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        ST        Z+, _ACCA
                        STD       Y+002h, _ACCCHI
                        STD       Y+001h, _ACCCLO
                        SER       _ACCA
                        RET

SYSTEM.SERINP:
SYSTEM._L0740:
                        LDS       _ACCA, _RXCOUNT
                        TST       _ACCA
                        BREQ      SYSTEM._L0740
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
                        CPI       _ACCB, 128
                        BRNE      SYSTEM._L0741
                        CLR       _ACCB
SYSTEM._L0741:
                        STS       _RXOUTP, _ACCB
                        RET

SYSTEM.SERSTAT:
                        CLR       _ACCA
                        LDS       _ACCB, _RXCOUNT
                        TST       _ACCB
                        BREQ      SYSTEM._L0743
                        COM       _ACCA
SYSTEM._L0743:
                        RET

SYSTEM.SEROUT:
SYSTEM._L0744:
                        LDS       _ACCB, _TXCOUNT
                        CPI       _ACCB, 32
                        BREQ      SYSTEM._L0744
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
                        CPI       _ACCB, 32
                        BRNE      SYSTEM._L0745
                        CLR       _ACCB
SYSTEM._L0745:
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
                        BRCS      SYSTEM._L0746
                        LDI       _ACCB, 0
                        LDI       _ACCA, 0
                        RET
SYSTEM._L0746:
                        CLR       _ACCB
                        LSL       _ACCA
                        ADD       _ACCCLO, _ACCA
                        ADC       _ACCCHI, _ACCB
                        CLI
                        LD        _ACCB, Z+
                        LD        _ACCA, Z+
                        SBRC      Flags, IntFlag
                        SEI
                        RET

SYSTEM.SetIncrVal4:
                        LDD       _ACCA, Y+002h
                        CPI       _ACCA, 1
                        BRCS      SYSTEM._L0747
                        RET
SYSTEM._L0747:
                        LDI       _ACCCLO, _INCRCOUNT4_0 AND 0FFh
                        LDI       _ACCCHI, _INCRCOUNT4_0 SHRB 8
                        CLR       _ACCB
                        LSL       _ACCA
                        ADD       _ACCCLO, _ACCA
                        ADC       _ACCCHI, _ACCB
                        LDD       _ACCB, Y+000h
                        LDD       _ACCA, Y+001h
                        CLI
                        ST        Z+, _ACCB
                        ST        Z+, _ACCA
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
SYSTEM._L0750:
                        SUBI      _ACCALO, 001h
                        SBCI      _ACCAHI, 000h
                        BRCS      SYSTEM._L0751
                        LD        _ACCA, Z+
                        ST        X+, _ACCA
                        RJMP      SYSTEM._L0750
SYSTEM._L0751:
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
                        BREQ      SYSTEM._L0752
                        OUT       eedr, _ACCA
                        SBI       eecr, 2
                        SBI       eecr, 1
SYSTEM._L0752:
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
                        BREQ      SYSTEM._L0753
SYSTEM._L0753:
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
                        BREQ      SYSTEM._L0754
                        LSR       _ACCFLO
                        BRNE      SYSTEM._L0756
                        PUSH      _ACCA
                        CALL      SYSTEM.ReadEEp8
                        MOV       _ACCAHI, _ACCA
                        POP       _ACCA
                        ADIW      _ACCCLO, 01h
                        RJMP      SYSTEM._L0755
SYSTEM._L0756:
                        LPM       _ACCAHI, Z+
                        RJMP      SYSTEM._L0755
SYSTEM._L0754:
                        LD        _ACCAHI, Z+
SYSTEM._L0755:
                        TST       _ACCAHI
                        BREQ      SYSTEM._L0763
                        MOV       _ACCFLO, _ACCFHI
                        ANDI      _ACCFLO, 10h
                        BREQ      SYSTEM._L0758
SYSTEM._L0758:
                        LD        _ACCALO, X
SYSTEM._L0760:
                        CP        _ACCB, _ACCA
                        BRCC      SYSTEM._L0762
SYSTEM._L0763:
                        RET
SYSTEM._L0762:
                        MOV       _ACCDLO, _ACCB
                        SUB       _ACCDLO, _ACCA
                        MOV       _ACCDHI, _ACCDLO
                        SUB       _ACCDLO, _ACCAHI
                        BRCS      SYSTEM._L0768
                        CP        _ACCALO, _ACCA
                        BRCC      SYSTEM._L0765
                        MOV       _ACCELO, _ACCAHI
                        ADD       _ACCELO, _ACCALO
                        CP        _ACCB, _ACCELO
                        BRCS      SYSTEM._L0764
                        MOV       _ACCB, _ACCELO
SYSTEM._L0764:
                        RJMP      SYSTEM._L0768
SYSTEM._L0765:
                        PUSH      _ACCBLO
                        PUSH      _ACCBHI
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        MOV       _ACCDHI, _ACCALO
                        SUB       _ACCDHI, _ACCA
                        CP        _ACCDHI, _ACCDLO
                        BRCC      SYSTEM._L0766
                        MOV       _ACCDLO, _ACCDHI
SYSTEM._L0766:
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
                        BREQ      SYSTEM._L0767
SYSTEM._L0767:
                        LD        _ACCGLO, -X
                        ST        -Z, _ACCGLO
                        DEC       _ACCDHI
                        BRNE     SYSTEM._L0767
SYSTEM._L0761:
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        MOV       _ACCB, _ACCA
                        ADD       _ACCB, _ACCAHI
                        ADD       _ACCB, _ACCDLO
                        BRNE     SYSTEM._L0772
SYSTEM._L0768:
                        ADD       _ACCAHI, _ACCDLO
                        INC       _ACCAHI
SYSTEM._L0772:
                        MOV       _ACCFLO, _ACCFHI
                        ANDI      _ACCFLO, 10h
                        BREQ      SYSTEM._L0775
SYSTEM._L0775:
                        ST        X, _ACCB
SYSTEM._L0774:
                        CLR       _ACCALO
                        ADD       _ACCBLO, _ACCA
                        ADC       _ACCBHI, _ACCALO
SYSTEM._L0773:
                        MOV       _ACCFLO, _ACCFHI
                        ANDI      _ACCFLO, 3
                        TST       _ACCFLO
                        BREQ      SYSTEM._L0776
                        LSR       _ACCFLO
                        BRNE      SYSTEM._L0778
                        CALL      SYSTEM.ReadEEp8
                        MOV       _ACCGLO, _ACCA
                        ADIW      _ACCCLO, 01h
                        RJMP      SYSTEM._L0777
SYSTEM._L0778:
                        LPM       _ACCGLO, Z+
                        RJMP      SYSTEM._L0777
SYSTEM._L0776:
                        LD        _ACCGLO, Z+
SYSTEM._L0777:
                        MOV       _ACCFLO, _ACCFHI
                        ANDI      _ACCFLO, 10h
                        BREQ      SYSTEM._L0779
SYSTEM._L0779:
                        ST        X+, _ACCGLO
SYSTEM._L0780:
                        DEC       _ACCAHI
                        BRNE     SYSTEM._L0773
SYSTEM._L0771:
                        RET

SYSTEM.Str2Int:
                        CLR       _ACCAHI
                        CLR       _ACCALO
                        CLR       _ACCBHI
                        CLR       _ACCBLO
                        BST       Flags, _EEPROM
                        BRTC      SYSTEM._L0785
                        CALL      SYSTEM.ReadEEp8
                        ADIW      _ACCCLO, 01h
                        RJMP     SYSTEM._L0786
SYSTEM._L0785:
                        LD        _ACCA, Z+
SYSTEM._L0786:
                        TST       _ACCA
                        BRNE      SYSTEM._L0782
SYSTEM._L0781:
                        CLR       _ACCA
                        CLR       _ACCB
                        RET

SYSTEM._L0782:
                        MOV       _ACCDHI, _ACCA
                        TST       _ACCB
                        BREQ      SYSTEM._L0787
                        INC       _ACCDHI
                        RJMP      SYSTEM.Hex2Int
SYSTEM._L0787:
                        BST       Flags, _EEPROM
                        BRTC      SYSTEM._L0788
                        CALL      SYSTEM.ReadEEp8
                        ADIW      _ACCCLO, 01h
                        RJMP     SYSTEM._L0789
SYSTEM._L0788:
                        LD        _ACCA, Z+
SYSTEM._L0789:
                        CLT
                        BLD       Flags, _NEGATIVE
                        CPI       _ACCA, 02Dh
                        BRNE      SYSTEM._L0783
                        DEC       _ACCDHI
                        BREQ      SYSTEM._L0781
                        SET
                        BLD       Flags, _NEGATIVE
                        BST       Flags, _EEPROM
                        BRTC      SYSTEM._L0790
                        CALL      SYSTEM.ReadEEp8
                        ADIW      _ACCCLO, 01h
                        RJMP     SYSTEM._L0791
SYSTEM._L0790:
                        LD        _ACCA, Z+
SYSTEM._L0791:
                        RJMP      SYSTEM.Dec2Int
SYSTEM._L0783:
                        CPI       _ACCA, 02Bh
                        BRNE      SYSTEM._L0784
                        DEC       _ACCDHI
                        BREQ      SYSTEM._L0781
                        CLT
                        BLD       Flags, _NEGATIVE
                        BST       Flags, _EEPROM
                        BRTC      SYSTEM._L0792
                        CALL      SYSTEM.ReadEEp8
                        ADIW      _ACCCLO, 01h
                        RJMP     SYSTEM._L0793
SYSTEM._L0792:
                        LD        _ACCA, Z+
SYSTEM._L0793:
                        RJMP      SYSTEM.Dec2Int
SYSTEM._L0784:
                        CPI       _ACCA, 024h
                        BRNE      SYSTEM.Dec2Int
                        RJMP      SYSTEM.Hex2Int
SYSTEM.Dec2Int:
                        MOV       _ACCB, _ACCDHI
                        DEC       _ACCB
                        BRMI      SYSTEM._L0781
                        CLR       _ACCDHI
                        CLR       _ACCEHI
                        CLR       _ACCFHI
                        CLR       _ACCFLO
                        PUSH      _ACCB
                        RJMP      SYSTEM.Dec2Int1
SYSTEM._L0794:
                        PUSH      _ACCB
                        BST       Flags, _EEPROM
                        BRTC      SYSTEM._L0797
                        CALL      SYSTEM.ReadEEp8
                        ADIW      _ACCCLO, 01h
                        RJMP     SYSTEM._L0798
SYSTEM._L0797:
                        LD        _ACCA, Z+
SYSTEM._L0798:
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
                        RJMP      SYSTEM._L0794
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
                        BRTC      SYSTEM._L0799
                        SUBI      _ACCB, 01h
                        SBCI      _ACCA, 00h
                        SBCI      _ACCALO, 00h
                        SBCI      _ACCAHI, 00h
                        COM       _ACCALO
                        COM       _ACCAHI
                        COM       _ACCA
                        COM       _ACCB
SYSTEM._L0799:
                        RET

SYSTEM.Hex2Int:
                        CLT
                        BLD       Flags, _NEGATIVE
                        DEC       _ACCDHI
                        BREQ      SYSTEM._L0799
                        CPI       _ACCDHI, 009h
                        BRSH      SYSTEM.Str2Ierr
SYSTEM._L0800:
                        BST       Flags, _EEPROM
                        BRTC      SYSTEM._L0804
                        CALL      SYSTEM.ReadEEp8
                        ADIW      _ACCCLO, 01h
                        RJMP     SYSTEM._L0805
SYSTEM._L0804:
                        LD        _ACCA, Z+
SYSTEM._L0805:
                        CPI       _ACCA, 061h
                        BRLO      SYSTEM._L0801
                        SUBI      _ACCA, 020h
SYSTEM._L0801:
                        CPI       _ACCA, 030h
                        BRLO      SYSTEM.Str2Ierr
                        CPI       _ACCA, 03Ah
                        BRLO      SYSTEM._L0802
                        CPI       _ACCA, 041h
                        BRLO      SYSTEM.Str2Ierr
                        CPI       _ACCA, 047h
                        BRSH      SYSTEM.Str2Ierr
                        SUBI      _ACCA, -9 AND 0FFh
SYSTEM._L0802:
                        ANDI      _ACCA, 00Fh
                        LDI       _ACCB, 4
SYSTEM._L0803:
                        LSL       _ACCBLO
                        ROL       _ACCBHI
                        ROL       _ACCALO
                        ROL       _ACCAHI
                        DEC       _ACCB
                        BRNE      SYSTEM._L0803
                        OR        _ACCBLO, _ACCA
                        DEC       _ACCDHI
                        BRNE      SYSTEM._L0800
                        RJMP      SYSTEM.Str2Iex
SYSTEM.PosChInVarStr:
                        CLR       _ACCA
                        LD        _ACCBHI, Z
                        TST       _ACCBHI
                        BREQ      SYSTEM._L0807
                        TST       _ACCELO
                        BRNE      SYSTEM._L0806
                        INC       _ACCELO
SYSTEM._L0806:
                        CP        _ACCBHI, _ACCELO
                        BRCS      SYSTEM._L0807
                        ADD       _ACCCLO, _ACCELO
                        ADC       _ACCCHI, _ACCA
                        DEC       _ACCELO
                        SUB       _ACCBHI, _ACCELO
                        MOV       _ACCA, _ACCELO
SYSTEM._L0808:
                        INC       _ACCA
                        LD        _ACCBLO, Z+
                        CP        _ACCB, _ACCBLO
                        BREQ      SYSTEM._L0807
                        DEC       _ACCBHI
                        BRNE      SYSTEM._L0808
                        CLR       _ACCA
SYSTEM._L0807:
                        RET


SYSTEM.UpperCaseStr:
                        LD        _ACCA, Z+
                        TST       _ACCA
                        BREQ      SYSTEM._L0810
                        MOV       _ACCBHI, _ACCA
SYSTEM._L0809:
                        LD        _ACCA, Z+
                        CPI       _ACCA, 061h
                        BRCS      SYSTEM._L0811
                        CPI       _ACCA, 07Bh
                        BRCC      SYSTEM._L0811
                        ANDI      _ACCA, 0DFh
SYSTEM._L0811:
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCBHI
                        BRNE      SYSTEM._L0809
SYSTEM._L0810:
                        RET


SYSTEM.StrCopyV:
                        TST       _ACCA
                        BREQ      SYSTEM._L0814
                        LD        _ACCBHI, Z
                        TST       _ACCBHI
                        BREQ      SYSTEM._L0814
                        SUB       _ACCBHI, _ACCB
                        BRCS      SYSTEM._L0814
                        INC       _ACCBHI
                        CLR       _ACCBLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCBLO
                        CP        _ACCBHI, _ACCA
                        BRCS      SYSTEM._L0813
                        MOV       _ACCBHI, _ACCA
SYSTEM._L0813:
                        LD        _ACCA, Z+
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCBHI
                        BRNE      SYSTEM._L0813
SYSTEM._L0814:
                        RET


SYSTEM.StrConst2Str:
SYSTEM._L0815:
                        LPM      _ACCA, Z+
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCBHI
                        BRNE      SYSTEM._L0815
                        RET


SYSTEM.StrVar2Str:
                        LD        _ACCA, Z+
                        TST       _ACCA
                        BREQ      SYSTEM._L0817
                        MOV       _ACCBHI, _ACCA
SYSTEM._L0816:
                        LD        _ACCA, Z+
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCBHI
                        BRNE      SYSTEM._L0816
SYSTEM._L0817:
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


SYSTEM.StringComp:
                        LD        _ACCB, X+
                        SBRC      FLAGS, _STRCONST
                        RJMP      SYSTEM._L0818
                        LD        _ACCGLO, Z+
                        RJMP      SYSTEM._L0819
SYSTEM._L0818:
                        LPM       _ACCGLO, Z+
SYSTEM._L0819:
                        CP        _ACCB, _ACCGLO
                        BREQ      SYSTEM._L0820
                        CLZ
                        RET
SYSTEM._L0820:
                        TST       _ACCB
                        BRNE      SYSTEM._L0821
                        SEZ
                        RET
SYSTEM._L0821:
                        DEC       _ACCB
                        LD        _ACCA, X+
                        SBRC      FLAGS, _STRCONST
                        RJMP      SYSTEM._L0822
                        LD        _ACCGLO, Z+
                        RJMP      SYSTEM._L0823
SYSTEM._L0822:
                        LPM       _ACCGLO, Z+
SYSTEM._L0823:
                        CP        _ACCA, _ACCGLO
                        BREQ      SYSTEM._L0820
                        CLZ
                        RET


SYSTEM.Char2Str:
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        BST       Flags, _DEVICE
                        BRTS      SYSTEM._L0827
                        PUSH      _ACCA
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LDD       _ACCA, Y+000h
                        TST       _ACCA
                        BRNE      SYSTEM._L0824
                        POP       _ACCA
                        SET
                        BLD       Flags, _ERRFLAG
                        POP       _ACCCHI
                        POP       _ACCCLO
                        RET
SYSTEM._L0824:
                        DEC       _ACCA
                        STD       Y+000h, _ACCA
                        POP       _ACCA
                        BST       Flags, _EEPROM
                        BRTS      SYSTEM._L0825
                        ST        Z+, _ACCA
                        RJMP      SYSTEM._L0826
SYSTEM._L0825:
                        CALL      SYSTEM.WriteEEp8
                        ADIW      _ACCCLO, 01h
SYSTEM._L0826:
                        STD       Y+002h, _ACCCHI
                        STD       Y+001h, _ACCCLO
                        POP       _ACCCHI
                        POP       _ACCCLO
                        RET
SYSTEM._L0827:
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
                        BRCC      SYSTEM._L0828
                        POP       _ACCEHI
                        POP       _ACCELO
                        CLR       _ACCA
                        CLR       _ACCB
                        CLR       _ACCAHI
                        CLR       _ACCALO
                        RET
SYSTEM._L0828:
                        ORI       _ACCALO, 080h
                        MOV       _ACCELO, _ACCAHI
                        CLR       _ACCAHI
                        CPI       _ACCEHI, 24
                        BRSH      SYSTEM._L0830
                        SUBI      _ACCEHI, 23
                        NEG       _ACCEHI
SYSTEM._L0829:
                        BREQ      SYSTEM._L0832
                        LSR       _ACCAHI
                        ROR       _ACCALO
                        ROR       _ACCA
                        ROR       _ACCB
                        DEC       _ACCEHI
                        RJMP      SYSTEM._L0829
SYSTEM._L0830:
                        SUBI      _ACCEHI, 23
SYSTEM._L0831:
                        BREQ      SYSTEM._L0832
                        LSL       _ACCB
                        ROL       _ACCA
                        ROL       _ACCALO
                        ROL       _ACCAHI
                        DEC       _ACCEHI
                        RJMP      SYSTEM._L0831
SYSTEM._L0832:
                        SBRS      _ACCELO, 7
                        RJMP      SYSTEM._L0833
                        SUBI      _ACCB, 01h
                        SBCI      _ACCA, 00h
                        SBCI      _ACCALO, 00h
                        SBCI      _ACCAHI, 00h
                        COM       _ACCB
                        COM       _ACCA
                        COM       _ACCAHI
                        COM       _ACCALO
SYSTEM._L0833:
                        POP       _ACCEHI
                        POP       _ACCELO
                        RET

SYSTEM.FENTIERx:
                        CPI       _ACCAHI, 0CFh
                        BRLO      SYSTEM._L0834
                        LDI       _ACCAHI, 080h
                        CLR       _ACCALO
                        CLR       _ACCA
                        CLR       _ACCB
                        RET
SYSTEM._L0834:
                        SBRC      _ACCAHI, 7
                        RJMP      SYSTEM._L0835
                        CPI       _ACCAHI, 04Fh
                        BRLO      SYSTEM._L0835
                        LDI       _ACCAHI, 07Fh
                        LDI       _ACCALO, 0FFh
                        LDI       _ACCA, 0FFh
                        LDI       _ACCB, 0FFh
                        RET
SYSTEM._L0835:
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
                        BRPL      SYSTEM._L0837
                        CLR       _ACCAHI
                        CLR       _ACCALO
                        CLR       _ACCA
                        CLR       _ACCB
                        RET
SYSTEM._L0837:
                        CPI       _ACCBHI, 23
                        BRCC      SYSTEM._L0839
                        LDI       _ACCBLO, 23
                        SUB       _ACCBLO, _ACCBHI
                        BREQ      SYSTEM._L0841
SYSTEM._L0838:
                        LSR       _ACCAHI
                        ROR       _ACCALO
                        ROR       _ACCA
                        ROR       _ACCB
                        DEC       _ACCBLO
                        BRNE      SYSTEM._L0838
                        RJMP      SYSTEM._L0841
SYSTEM._L0839:
                        SUBI      _ACCBHI, 23
                        BREQ      SYSTEM._L0841
                        MOV       _ACCBLO, _ACCBHI
SYSTEM._L0840:
                        LSL       _ACCB
                        ROL       _ACCA
                        ROL       _ACCALO
                        ROL       _ACCAHI
                        BRCC      SYSTEM._L0842
                        SET
                        BLD       Flags, _ERRFLAG
SYSTEM._L0842:
                        DEC       _ACCBLO
                        BRNE      SYSTEM._L0840
SYSTEM._L0841:
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
                        RJMP      SYSTEM._L0843
                        CBR       _ACCAHI, 080h
                        SBRS      _ACCDLO, 7
                        RJMP      SYSTEM._L0845
SYSTEM._L0843:
                        SBRS      _ACCCHI, 7
                        RJMP      SYSTEM._L0844
                        CBR       _ACCCHI, 080h
                        SBRS      _ACCDLO, 7
                        RJMP      SYSTEM._L0846
SYSTEM._L0844:
                        CP        _ACCAHI, _ACCCHI
                        BRLO      SYSTEM._L0845
                        BRNE      SYSTEM._L0846
                        CP        _ACCALO, _ACCCLO
                        BRLO      SYSTEM._L0845
                        BRNE      SYSTEM._L0846
                        CP        _ACCA, _ACCBHI
                        BRLO      SYSTEM._L0845
                        BRNE      SYSTEM._L0846
                        CP        _ACCB, _ACCBLO
                        BRLO      SYSTEM._L0845
                        BRNE      SYSTEM._L0846
                        RJMP      SYSTEM._L0850
SYSTEM._L0845:
                        SBRC      _ACCDLO, 7
                        RJMP      SYSTEM._L0848
SYSTEM._L0847:
                        BST       Flags, _NEGATIVE
                        BRTS      SYSTEM._L0849
                        MOVW      _ACCB, _ACCBLO
                        MOVW      _ACCALO, _ACCCLO
SYSTEM._L0849:
                        INC       _ACCDHI
                        RJMP      SYSTEM._L0850
SYSTEM._L0846:
                        SBRC      _ACCDLO, 7
                        RJMP      SYSTEM._L0847
SYSTEM._L0848:
                        DEC       _ACCDHI
SYSTEM._L0850:
                        OR        _ACCAHI, _ACCDLO
                        RET

SYSTEM.LIntToFloat:
                        TST       _ACCAHI
                        BRNE      SYSTEM._L0851
                        TST       _ACCALO
                        BRNE      SYSTEM._L0851
                        TST       _ACCA
                        BRNE      SYSTEM._L0851
                        TST       _ACCB
                        BRNE      SYSTEM._L0851
                        RET
SYSTEM._L0851:
                        CLR       _ACCBLO
                        SBRS      Flags, _SIGN
                        RJMP      SYSTEM._L0852
                        MOV       _ACCBLO, _ACCAHI
                        ANDI      _ACCBLO, 080h
                        TST       _ACCAHI
                        BRPL      SYSTEM._L0857
                        SUBI      _ACCB, 01h
                        SBCI      _ACCA, 00h
                        SBCI      _ACCALO, 00h
                        SBCI      _ACCAHI, 00h
                        COM       _ACCALO
                        COM       _ACCAHI
                        COM       _ACCA
                        COM       _ACCB
SYSTEM._L0857:
SYSTEM._L0852:
                        LDI       _ACCBHI, 150
SYSTEM._L0853:
                        TST       _ACCAHI
                        BREQ      SYSTEM._L0854
                        LSR       _ACCAHI
                        ROR       _ACCALO
                        ROR       _ACCA
                        ROR       _ACCB
                        INC       _ACCBHI
                        RJMP      SYSTEM._L0853
SYSTEM._L0854:
                        SBRC      _ACCALO, 7
                        RJMP      SYSTEM._L0855
                        LSL       _ACCB
                        ROL       _ACCA
                        ROL       _ACCALO
                        ROL       _ACCAHI
                        DEC       _ACCBHI
                        RJMP      SYSTEM._L0854
SYSTEM._L0855:
                        ANDI      _ACCALO, 07Fh
                        MOV       _ACCAHI, _ACCBHI
                        LSR       _ACCAHI
                        BRCC      SYSTEM._L0856
                        ORI       _ACCALO, 080h
SYSTEM._L0856:
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
                        BREQ      SYSTEM._L0858
                        TST       _ACCEHI
                        BRNE      SYSTEM._L0859
SYSTEM._L0858:
                        CLR       _ACCB
                        CLR       _ACCA
                        CLR       _ACCALO
                        CLR       _ACCAHI
                        RET
SYSTEM._L0859:
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
                        BRNE      SYSTEM._L0860
                        CPI       _ACCCHI, 0FFh
                        BRLO      SYSTEM._L0861
SYSTEM._L0860:
                        SET
                        BLD       Flags, _ERRFLAG
                        ANDI      _ACCAHI, 080h
                        ORI       _ACCAHI, 07Eh
                        LDI       _ACCALO, 0FFh
                        LDI       _ACCB, 0FFh
                        LDI       _ACCA, 0FFh
                        RET
SYSTEM._L0861:
                        CPI       _ACCCHI, 01h
                        BRSH      SYSTEM._L0862
                        CLR       _ACCAHI
                        CLR       _ACCALO
                        CLR       _ACCB
                        CLR       _ACCA
                        SET
                        BLD       Flags, _ERRFLAG
                        RET
SYSTEM._L0862:
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
SYSTEM._L0863:
                        BRCC      SYSTEM._L0864
                        ADD       _ACCFLO, _ACCBLO
                        ADC       _ACCFHI, _ACCBHI
                        ADC       _ACCGLO, _ACCCLO
                        ADC       _ACCGHI, _ACCCHI
SYSTEM._L0864:
                        ROR       _ACCGHI
                        ROR       _ACCGLO
                        ROR       _ACCFHI
                        ROR       _ACCFLO
                        ROR       _ACCEHI
                        ROR       _ACCELO
                        ROR       _ACCDHI
                        ROR       _ACCDLO
                        DEC       _ACCA
                        BRNE      SYSTEM._L0863
                        LDI       _ACCALO, 23
SYSTEM._L0865:
                        LSR       _ACCGHI
                        ROR       _ACCGLO
                        ROR       _ACCFHI
                        ROR       _ACCFLO
                        ROR       _ACCEHI
                        ROR       _ACCELO
                        ROR       _ACCDHI
                        ROR       _ACCDLO
                        DEC       _ACCALO
                        BRNE      SYSTEM._L0865
                        MOV       _ACCB, _ACCDLO
                        MOV       _ACCA, _ACCDHI
                        MOV       _ACCALO, _ACCELO
                        MOV       _ACCAHI, _ACCEHI
                        POP       _ACCBHI
                        POP       _ACCGLO
                        TST       _ACCAHI
                        BREQ      SYSTEM._L0866
                        LSR       _ACCAHI
                        ROR       _ACCALO
                        ROR       _ACCA
                        ROR       _ACCB
                        INC       _ACCBHI
SYSTEM._L0866:
                        MOV       _ACCAHI, _ACCGLO
                        ROL       _ACCALO
                        LSR       _ACCBHI
                        ROR       _ACCALO
                        OR        _ACCAHI, _ACCBHI
                        RET

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
                        BRCS      SYSTEM._L0867
                        BRNE      SYSTEM._L0868
                        CP        _ACCELO, _ACCCLO
                        BRCS      SYSTEM._L0867
                        BRNE      SYSTEM._L0868
                        CP        _ACCDHI, _ACCBHI
                        BRCS      SYSTEM._L0867
                        BRNE      SYSTEM._L0868
                        CP        _ACCDLO, _ACCBLO
                        BRCS      SYSTEM._L0867
SYSTEM._L0868:
                        MOVW      _ACCB, _ACCDLO
                        MOVW      _ACCALO, _ACCELO
                        MOV       _ACCDHI, _ACCBHI
                        MOV       _ACCDLO, _ACCBLO
                        MOV       _ACCEHI, _ACCCHI
                        MOV       _ACCELO, _ACCCLO
                        MOVW      _ACCBLO, _ACCB
                        MOVW      _ACCCLO, _ACCALO
                        RJMP      SYSTEM._L0877
SYSTEM._L0867:
                        MOVW      _ACCB, _ACCBLO
                        MOVW      _ACCALO, _ACCCLO
SYSTEM._L0877:
                        ANDI      _ACCALO, 07Fh
                        ORI       _ACCALO, 080h
                        CLR       _ACCAHI
                        SBRS      _ACCCHI, 7
                        RJMP      SYSTEM._L0869
                        SUBI      _ACCB, 01h
                        SBCI      _ACCA, 00h
                        SBCI      _ACCALO, 00h
                        SBCI      _ACCAHI, 00h
                        COM       _ACCALO
                        COM       _ACCAHI
                        COM       _ACCA
                        COM       _ACCB
SYSTEM._L0869:
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
SYSTEM._L0870:
                        BREQ      SYSTEM._L0871
                        LSR       _ACCHLO
                        ROR       _ACCGHI
                        ROR       _ACCGLO
                        DEC       _ACCA
                        RJMP      SYSTEM._L0870
SYSTEM._L0871:
                        MOV       _ACCA, _ACCEHI
                        MOV       _ACCDLO, _ACCGLO
                        MOV       _ACCDHI, _ACCGHI
                        MOV       _ACCELO, _ACCHLO
                        MOV       _ACCEHI, _ACCHHI
                        SBRS      _ACCA, 7
                        RJMP      SYSTEM._L0872
                        SUBI      _ACCDLO, 01h
                        SBCI      _ACCDHI, 00h
                        SBCI      _ACCELO, 00h
                        SBCI      _ACCEHI, 00h
                        COM       _ACCDLO
                        COM       _ACCDHI
                        COM       _ACCEHI
                        COM       _ACCELO
SYSTEM._L0872:
                        POP       _ACCA
                        ADD       _ACCB, _ACCDLO
                        ADC       _ACCA, _ACCDHI
                        ADC       _ACCALO, _ACCELO
                        ADC       _ACCAHI, _ACCEHI
                        SBRS      _ACCAHI, 7
                        RJMP      SYSTEM._L0873
                        ORI       _ACCCHI, 080h
                        SUBI      _ACCB, 01h
                        SBCI      _ACCA, 00h
                        SBCI      _ACCALO, 00h
                        SBCI      _ACCAHI, 00h
                        COM       _ACCALO
                        COM       _ACCAHI
                        COM       _ACCA
                        COM       _ACCB
                        RJMP      SYSTEM._L0874
SYSTEM._L0873:
                        ANDI      _ACCCHI, 07Fh
SYSTEM._L0874:
                        MOV       _ACCFLO, _ACCAHI
                        ANDI      _ACCFLO, 07Fh
                        BREQ      SYSTEM._L0875
                        LSR       _ACCAHI
                        ROR       _ACCALO
                        ROR       _ACCA
                        ROR       _ACCB
                        INC       _ACCFHI
                        BRNE      SYSTEM._L0875
                        LDI       _ACCA, 0FFh
                        LDI       _ACCB, 0FFh
                        LDI       _ACCALO, 0FFh
                        LDI       _ACCAHI, 07Fh
                        SBRC      _ACCCHI, 7
                        ORI       _ACCAHI, 080h
                        SET
                        BLD       Flags, _ERRFLAG
                        RET
SYSTEM._L0875:
                        SBRC      _ACCALO, 7
                        RJMP      SYSTEM._L0876
                        TST       _ACCFHI
                        BREQ      SYSTEM._L0876
                        LSL       _ACCB
                        ROL       _ACCA
                        ROL       _ACCALO
                        ROL       _ACCAHI
                        DEC       _ACCFHI
                        RJMP      SYSTEM._L0875
SYSTEM._L0876:
                        MOV       _ACCAHI, _ACCFHI
                        CLR       _ACCFHI
                        LSR       _ACCAHI
                        TST       _ACCAHI
                        BREQ      SYSTEM._L0878
                        ROR       _ACCFHI
                        ANDI      _ACCALO, 07Fh
                        OR        _ACCALO, _ACCFHI
                        SBRC      _ACCCHI, 7
                        ORI       _ACCAHI, 080h
                        RET
SYSTEM._L0878:
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
                        BRNE      SYSTEM._L0879
                        RET
SYSTEM._L0879:
                        RCALL     SYSTEM.Str2FltRdChr
                        CPI       _ACCDLO, 020h
                        BRNE      SYSTEM._L0880
                        ADIW      _ACCCLO, 1
                        DEC       _ACCBLO
                        RJMP      SYSTEM.ACSkipSpace
SYSTEM._L0880:
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
                        BRTC      SYSTEM._L0881
                        CALL      SYSTEM.ReadEEp8D
                        RET
SYSTEM._L0881:
                        LD        _ACCDLO, Z
                        RET
SYSTEM.Float2Str_C:
                        PUSH      _ACCDHI
SYSTEM._L0883:
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
                        BRMI      SYSTEM._L0885
                        BREQ      SYSTEM._L0885
                        LDI       _ACCBLO, 000h
                        LDI       _ACCBHI, 024h
                        LDI       _ACCCLO, 074h
                        LDI       _ACCCHI, 049h
                        CLR       _ACCDHI
                        CALL      SYSTEM.HighF
                        TST       _ACCDHI
                        BRMI      SYSTEM._L0886
                        BREQ      SYSTEM._L0886
                        POP       _ACCDHI
                        DEC       _ACCDHI
                        PUSH      _ACCDHI
                        LDI       _ACCBLO, 000h
                        LDI       _ACCBHI, 000h
                        LDI       _ACCCLO, 020h
                        LDI       _ACCCHI, 041h
SYSTEM._L0884:
                        MOV       _ACCDLO, _ACCELO
                        MOV       _ACCDHI, _ACCEHI
                        MOV       _ACCELO, _ACCFLO
                        MOV       _ACCEHI, _ACCFHI
                        CLT
                        BLD       Flags, _ERRFLAG
                        CALL      SYSTEM.MulFloat_R
                        RJMP      SYSTEM._L0883
SYSTEM._L0885:
                        POP       _ACCDHI
                        INC       _ACCDHI
                        PUSH      _ACCDHI
                        LDI       _ACCBLO, 0CDh
                        LDI       _ACCBHI, 0CCh
                        LDI       _ACCCLO, 0CCh
                        LDI       _ACCCHI, 03Dh
                        RJMP      SYSTEM._L0884
SYSTEM._L0886:
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
SYSTEM._L0882:
                        ST        -Y, _ACCELO
                        DEC       _ACCEHI
                        BRNE      SYSTEM._L0882
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
                        BRNE      SYSTEM._L0893
                        LDD       _ACCA, Y+15
                        LDI       _ACCB, DECIMALSEP
                        CPI       _ACCA, 45h
                        BRNE      SYSTEM._L0894
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
SYSTEM._L0894:
                        LDI       _ACCA, 30h
                        RCALL     SYSTEM.Float2Str_P
                        LDI       _ACCA, DECIMALSEP
                        RCALL     SYSTEM.Float2Str_P
                        LDI       _ACCA, 30h
                        RCALL     SYSTEM.Float2Str_P
                        RCALL     SYSTEM.Float2Str_R
                        RJMP      SYSTEM.Float2Str_F
SYSTEM._L0893:
                        LDD       _ACCCHI, Y+15
                        CPI       _ACCCHI, 45h
                        BREQ      SYSTEM._L0895
                        CP        _ACCBLO, _ACCBHI
                        BRCS      SYSTEM._L0895
                        MOV       _ACCBHI, _ACCBLO
                        INC       _ACCBHI
                        STD       Y+14, _ACCBHI
SYSTEM._L0895:
                        CLR       _ACCDHI
                        TST       _ACCAHI
                        BRPL      SYSTEM._L0892
                        ANDI      _ACCAHI, 07Fh
                        PUSH      _ACCA
                        LDI       _ACCA, 2Dh
                        RCALL     SYSTEM.Float2Str_P
                        POP       _ACCA
SYSTEM._L0892:
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
                        BRGE      SYSTEM._L0898
                        CPI       _ACCDHI, -5 AND 0FFh
                        BRLT      SYSTEM._L0898
                        CPI       _ACCDLO, 45h
                        BREQ      SYSTEM._L0898
                        TST       _ACCBLO
                        BRNE      SYSTEM._L0896
                        SUB       _ACCDLO, _ACCDHI
SYSTEM._L0896:
                        MOV       _ACCBLO, _ACCDHI
                        LDI       _ACCDHI, 9
                        SUB       _ACCDHI, _ACCDLO
                        SUB       _ACCDHI, _ACCBLO
                        BRMI      SYSTEM._L0899
                        BRNE      SYSTEM._L0897
                        COM       _ACCDHI
                        STD       Y+15, _ACCDHI
                        RJMP      SYSTEM._L0898
SYSTEM._L0897:
                        DEC       _ACCDHI
                        BREQ      SYSTEM._L0898
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
                        RJMP      SYSTEM._L0897
SYSTEM._L0899:
SYSTEM._L0898:
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
                        RJMP      SYSTEM._L0888
SYSTEM._L0887:
                        LSR       _ACCFLO
                        ROR       _ACCEHI
                        ROR       _ACCELO
                        DEC       _ACCAHI
SYSTEM._L0888:
                        BRNE      SYSTEM._L0887
                        POP       _ACCBHI
                        LDI       _ACCBLO, 1
                        LDD       _ACCDLO, Y+15
                        CPI       _ACCDLO, 45h
                        BRNE      SYSTEM._L0900
                        SUBI      _ACCBHI, -8 AND 0FFh
                        MOV       _ACCALO, _ACCBHI
                        BRPL      SYSTEM._L0901
                        NEG       _ACCALO
SYSTEM._L0901:
                        RJMP      SYSTEM._L0889
SYSTEM._L0900:
                        LDI       _ACCALO, 7
                        SUBI      _ACCBHI, -8 AND 0FFh
                        CPI       _ACCBHI, 8
                        BRGE      SYSTEM._L0889
                        CPI       _ACCBHI, -5 AND 0FFh
                        BRLT      SYSTEM._L0889
                        DEC       _ACCBHI
                        MOV       _ACCBLO, _ACCBHI
                        LDI       _ACCBHI, 2
SYSTEM._L0889:
                        SUBI      _ACCBHI, 2
                        TST       _ACCBLO
                        BREQ      SYSTEM._L0903
                        BRPL      SYSTEM._L0890
SYSTEM._L0903:
                        LDI       _ACCA, 30h
                        RCALL     SYSTEM.Float2Str_P
                        LDI       _ACCA, DECIMALSEP
                        RCALL     SYSTEM.Float2Str_P
                        TST       _ACCBLO
                        BREQ      SYSTEM._L0890
SYSTEM._L0902:
                        LDI       _ACCA, 30h
                        RCALL     SYSTEM.Float2Str_P
                        DEC       _ACCALO
                        INC       _ACCBLO
                        BRNE      SYSTEM._L0902
SYSTEM._L0890:
                        LDI       _ACCCLO, SYSTEM.DECDIG AND 0FFh
                        LDI       _ACCCHI, SYSTEM.DECDIG SHRB 8
SYSTEM._L0891:
                        CLR       _ACCAHI
SYSTEM._L0904:
                        LPM       _ACCB, Z+
                        LPM       _ACCA, Z
                        ADIW      _ACCCLO, 1
                        LPM
                        ADIW      _ACCCLO, 02h
SYSTEM._L0909:
                        SUB       _ACCELO, _ACCB
                        SBC       _ACCEHI, _ACCA
                        SBC       _ACCFLO, _ACCGLO
                        BRCS      SYSTEM._L0905
                        INC       _ACCAHI
                        RJMP      SYSTEM._L0909
SYSTEM._L0905:
                        ADD       _ACCELO, _ACCB
                        ADC       _ACCEHI, _ACCA
                        ADC       _ACCFLO, _ACCGLO
                        CPI       _ACCAHI, 10
                        BRLT      SYSTEM._L0910
                        LDI       _ACCAHI, 1
                        INC       _ACCBHI
SYSTEM._L0910:
                        LDI       _ACCA, 30h
                        ADD       _ACCA, _ACCAHI
                        RCALL     SYSTEM.Float2Str_P
                        DEC       _ACCBLO
                        BRNE      SYSTEM._L0906
                        LDI       _ACCA, DECIMALSEP
                        RCALL     SYSTEM.Float2Str_P
SYSTEM._L0906:
                        DEC       _ACCALO
                        BRMI      SYSTEM._L0907
                        BRNE      SYSTEM._L0891
SYSTEM._L0907:
                        RCALL     SYSTEM.Float2Str_R
                        TST       _ACCBHI
                        BREQ      SYSTEM.Float2Str_F
                        LDI       _ACCA, 0FFh
                        STD       Y+15, _ACCA
                        LDI       _ACCA, 45h
                        RCALL     SYSTEM.Float2Str_P
                        TST       _ACCBHI
                        BRPL      SYSTEM._L0908
                        NEG       _ACCBHI
                        LDI       _ACCA, 2Dh
                        RCALL     SYSTEM.Float2Str_P
SYSTEM._L0908:
                        LDI       _ACCB, 10
                        MOV       _ACCA, _ACCBHI
                        CALL      SYSTEM.DIV8_R
                        TST       _ACCA
                        BREQ      SYSTEM._L0912
                        ORI       _ACCA, 30h
                        RCALL     SYSTEM.Float2Str_P
SYSTEM._L0912:
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
                        BREQ      SYSTEM._L0914
                        TST       _ACCAHI
                        BREQ      SYSTEM._L0914
                        TST       _ACCALO
                        BRNE      SYSTEM._L0913
                        RCALL     SYSTEM.Float2Str_D
                        ST        X, _ACCDHI
                        RJMP      SYSTEM._L0914
SYSTEM._L0913:
                        RCALL     SYSTEM.Float2Str_D
                        LD        _ACCDLO, X
                        SUB       _ACCAHI, _ACCALO
                        DEC       _ACCAHI
                        SUB       _ACCAHI, _ACCDHI
                        BREQ      SYSTEM._L0919
                        BRCS      SYSTEM._L0919
                        LDD       _ACCA, Y+16+3
SYSTEM._L0917:
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCAHI
                        BRNE      SYSTEM._L0917
SYSTEM._L0919:
                        ST        X, _ACCDHI
                        RCALL     SYSTEM.Float2Str_W
                        LDI       _ACCA, DECIMALSEP
                        CALL      SYSTEM.Char2Str
                        ADIW      _ACCBLO, 1
                        SUB       _ACCDLO, _ACCDHI
SYSTEM._L0921:
                        DEC       _ACCDLO
                        BREQ      SYSTEM._L0920
                        LD        _ACCA, X+
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCALO
                        BREQ      SYSTEM._L0918
                        RJMP      SYSTEM._L0921
SYSTEM._L0920:
                        LDI       _ACCA, 030h
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCALO
                        BRNE      SYSTEM._L0920
                        RJMP      SYSTEM._L0918
SYSTEM._L0914:
                        LD        _ACCB, X
                        SUB       _ACCAHI, _ACCB
                        BREQ      SYSTEM._L0916
                        BRCS      SYSTEM._L0916
                        LDD       _ACCA, Y+16+3
SYSTEM._L0915:
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCAHI
                        BRNE      SYSTEM._L0915
SYSTEM._L0916:
                        RCALL     SYSTEM.Float2Str_W
SYSTEM._L0918:
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
SYSTEM._L0922:
                        LD        _ACCA, X+
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCB
                        BRNE      SYSTEM._L0922
                        RET

SYSTEM.Float2Str_D:
                        PUSH      _ACCBLO
                        PUSH      _ACCBHI
                        CLR       _ACCDHI
                        LD        _ACCB, X+
SYSTEM._L0923:
                        LD        _ACCA, X+
                        CPI       _ACCA, DECIMALSEP
                        BREQ      SYSTEM._L0924
                        INC       _ACCDHI
                        DEC       _ACCB
                        BRNE      SYSTEM._L0923
SYSTEM._L0924:
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
SYSTEM._L0925:
                        DEC       _ACCA
                        LD        _ACCB, -Z
                        CPI       _ACCB, 030h
                        BREQ      SYSTEM._L0925
                        CPI       _ACCB, DECIMALSEP
                        BREQ      SYSTEM._L0926
                        INC       _ACCA
SYSTEM._L0926:
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
                        BREQ      SYSTEM._L0928
                        CPI       _ACCALO, 08h
                        BRCS      SYSTEM._L0927
                        CLR       _ACCA
                        RET
SYSTEM._L0927:
                        LSR       _ACCA
                        DEC       _ACCALO
                        BRNE      SYSTEM._L0927
SYSTEM._L0928:
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
SYSTEM._L0929:
                        ROL       _ACCA
                        DEC       _ACCALO
                        BRNE      SYSTEM._L0930
                        MOV       _ACCB, _ACCAHI
                        RET
SYSTEM._L0930:
                        ROL       _ACCAHI
                        SUB       _ACCAHI, _ACCB
                        BRCC      SYSTEM._L0931
                        ADD       _ACCAHI, _ACCB
                        CLC
                        RJMP      SYSTEM._L0929
SYSTEM._L0931:
                        SEC
                        RJMP      SYSTEM._L0929


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
                        BRTC      SYSTEM._L0933
                        MOV       _ACCDHI, _ACCBHI
                        MOV       _ACCDLO, _ACCAHI
                        EOR       _ACCDLO, _ACCBHI
                        CLT
                        SBRS      _ACCDLO, 7
                        BLD       Flags, _SIGN
                        SBRS      _ACCAHI, 7
                        RJMP      SYSTEM._L0935
                        NEG       _ACCALO
                        BRNE      SYSTEM._L0936
                        DEC       _ACCAHI
SYSTEM._L0936:
                        COM       _ACCAHI
SYSTEM._L0935:
                        SBRS      _ACCBHI, 7
                        RJMP      SYSTEM._L0933
                        NEG       _ACCBLO
                        BRNE      SYSTEM._L0937
                        DEC       _ACCBHI
SYSTEM._L0937:
                        COM       _ACCBHI
SYSTEM._L0933:
                        CLR       _ACCCLO
                        SUB       _ACCCHI, _ACCCHI
                        LDI       _ACCA, 17
SYSTEM._L0938:
                        ROL       _ACCBLO
                        ROL       _ACCBHI
                        DEC       _ACCA
                        BRNE      SYSTEM._L0939
                        MOVW      _ACCB, _ACCBLO
                        BST       Flags, _SIGN
                        BRTC      SYSTEM._L0934
                        NEG       _ACCB
                        BRNE      SYSTEM._L0941
                        DEC       _ACCA
SYSTEM._L0941:
                        COM       _ACCA
SYSTEM._L0934:
                        RET
SYSTEM._L0939:
                        ROL       _ACCCLO
                        ROL       _ACCCHI
                        SUB       _ACCCLO, _ACCALO
                        SBC       _ACCCHI, _ACCAHI
                        BRCC      SYSTEM._L0940
                        ADD       _ACCCLO, _ACCALO
                        ADC       _ACCCHI, _ACCAHI
                        CLC
                        RJMP      SYSTEM._L0938
SYSTEM._L0940:
                        SEC
                        RJMP      SYSTEM._L0938


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
                        RJMP      SYSTEM._L0942
                        COM       _ACCBLO
                        COM       _ACCBHI
                        COM       _ACCCLO
                        COM       _ACCCHI
                        SUBI      _ACCBLO, 0FFh
                        SBCI      _ACCBHI, 0FFh
                        SBCI      _ACCCLO, 0FFh
                        SBCI      _ACCCHI, 0FFh
SYSTEM._L0942:
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
SYSTEM._L0944:
                        ROL       _ACCDLO
                        ROL       _ACCDHI
                        ROL       _ACCELO
                        ROL       _ACCEHI
                        DEC       _ACCA
                        BRNE      SYSTEM._L0943
                        MOVW      _ACCB, _ACCDLO
                        MOVW      _ACCALO, _ACCELO
                        BST       Flags, _SIGN
                        BRTC      SYSTEM._L0946
                        SUBI      _ACCB, 01h
                        SBCI      _ACCA, 00h
                        SBCI      _ACCALO, 00h
                        SBCI      _ACCAHI, 00h
                        COM       _ACCALO
                        COM       _ACCAHI
                        COM       _ACCA
                        COM       _ACCB
SYSTEM._L0946:
                        POP       _ACCDHI
                        RET
SYSTEM._L0943:
                        ROL       _ACCFLO
                        ROL       _ACCFHI
                        ROL       _ACCGLO
                        ROL       _ACCGHI
                        SUB       _ACCFLO, _ACCBLO
                        SBC       _ACCFHI, _ACCBHI
                        SBC       _ACCGLO, _ACCCLO
                        SBC       _ACCGHI, _ACCCHI
                        BRCC      SYSTEM._L0945
                        ADD       _ACCFLO, _ACCBLO
                        ADC       _ACCFHI, _ACCBHI
                        ADC       _ACCGLO, _ACCCLO
                        ADC       _ACCGHI, _ACCCHI
                        CLC
                        RJMP      SYSTEM._L0944
SYSTEM._L0945:
                        SEC
                        RJMP      SYSTEM._L0944

SYSTEM.SetSysTimer:
                        CLI
                        ST        Z+, _ACCB
                        ST        Z+, _ACCA
                        MOV       _ACCBLO, _SYSTFLAGS
                        TST       _ACCA
                        BRNE       SYSTEM._L0947
                        TST       _ACCB
                        BRNE       SYSTEM._L0947
                        COM       _ACCBHI
                        AND       _ACCBLO, _ACCBHI
                        MOV       _SYSTFLAGS, _ACCBLO
                        SBRC      Flags, IntFlag
                        SEI
                        RET
SYSTEM._L0947:
                        OR        _ACCBLO, _ACCBHI
                        MOV       _SYSTFLAGS, _ACCBLO
                        SBRC      Flags, IntFlag
                        SEI
                        RET


SYSTEM.High32i:
                        CP        _ACCAHI, _ACCCHI
                        BRLT      SYSTEM._L0948
                        BRNE      SYSTEM._L0949
                        CP        _ACCALO, _ACCCLO
                        BRLO      SYSTEM._L0948
                        BRNE      SYSTEM._L0949
                        CP        _ACCA, _ACCBHI
                        BRLO      SYSTEM._L0948
                        BRNE      SYSTEM._L0949
                        CP        _ACCB, _ACCBLO
                        BRLO      SYSTEM._L0948
                        BRNE      SYSTEM._L0949
                        RJMP      SYSTEM._L0950
SYSTEM._L0948:
                        INC       _ACCDHI
                        BST       Flags, _NEGATIVE
                        BRTS      SYSTEM._L0951
                        MOVW      _ACCB, _ACCBLO
                        MOVW      _ACCALO, _ACCCLO
SYSTEM._L0951:
                        RJMP      SYSTEM._L0950
SYSTEM._L0949:
                        DEC       _ACCDHI
SYSTEM._L0950:
                        RET

SYSTEM.GETADC:
                        CPI       _ACCA, 003h
                        BRCS      SYSTEM._L0952
                        CPI       _ACCA, 006h
                        BRCC      SYSTEM._L0952
                        SUBI      _ACCA, 003h
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
SYSTEM._L0952:
                        CLR       _ACCB
                        CLR       _ACCA
                        RET

SYSTEM.SETADCFIXED:
                        LDS       _ACCB, _ADCBUFF +006h
                        LDD       _ACCA, Y+001h
                        TST       _ACCA
                        BRNE      SYSTEM._L0953
                        ANDI      _ACCB, 0FEh
                        RJMP      SYSTEM._L0954
SYSTEM._L0953:
                        ORI       _ACCB, 01h
                        LDD       _ACCA, Y+000h
                        CPI       _ACCA, 003h
                        BRCS      SYSTEM._L0955
                        CPI       _ACCA, 006h
                        BRCC      SYSTEM._L0955
                        DEC       _ACCA
                        CLI
                        IN        _ACCCHI, admux
                        CBR       _ACCCHI, 7
                        OR        _ACCA, _ACCCHI
                        OUT       admux, _ACCA
                        SBRC      Flags, IntFlag
                        SEI
SYSTEM._L0954:
                        STS       _ADCBUFF +006h, _ACCB
SYSTEM._L0955:
                        RET

SYSTEM.GetBitCount8:
                        LDI       _ACCCLO, 8
                        LDI       _ACCCHI, 0
SYSTEM._L0956:
                        LSL       _ACCA
                        BRCC      SYSTEM._L0957
                        INC       _ACCCHI
SYSTEM._L0957:
                        DEC       _ACCCLO
                        BRNE      SYSTEM._L0956
                        MOV       _ACCA, _ACCCHI
                        RET

SYSTEM.GetBitCount16:
                        LDI       _ACCCLO, 16
                        LDI       _ACCCHI, 0
SYSTEM._L0958:
                        LSL       _ACCB
                        ROL       _ACCA
                        BRCC      SYSTEM._L0959
                        INC       _ACCCHI
SYSTEM._L0959:
                        DEC       _ACCCLO
                        BRNE      SYSTEM._L0958
                        MOV       _ACCA, _ACCCHI
                        RET

SYSTEM.GetBitCount32:
                        LDI       _ACCCLO, 32
                        LDI       _ACCCHI, 0
SYSTEM._L0960:
                        LSL       _ACCB
                        ROL       _ACCA
                        ROL       _ACCALO
                        ROL       _ACCAHI
                        BRCC      SYSTEM._L0961
                        INC       _ACCCHI
SYSTEM._L0961:
                        DEC       _ACCCLO
                        BRNE      SYSTEM._L0960
                        MOV       _ACCA, _ACCCHI
                        RET

SYSTEM.GetBitCount64:
                        LDI       _ACCCLO, 64
                        LDI       _ACCCHI, 0
SYSTEM._L0962:
                        LSL       _ACCB
                        ROL       _ACCA
                        ROL       _ACCALO
                        ROL       _ACCAHI
                        ROL       _ACCDLO
                        ROL       _ACCDHI
                        ROL       _ACCELO
                        ROL       _ACCEHI
                        BRCC      SYSTEM._L0963
                        INC       _ACCCHI
SYSTEM._L0963:
                        DEC       _ACCCLO
                        BRNE      SYSTEM._L0962
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
                        .SYM      DIV.Vers1Str
DIV.Vers1Str:
                        .BYTE     29
                        .ASCII    "3.10 [DIV by CM/c't 03/2007] "

                        .SYM      DIV.Vers3Str
DIV.Vers3Str:
                        .BYTE     8
                        .ASCII    "DIV 3.10"

                        .SYM      DIV.EEnotProgrammedStr
DIV.EEnotProgrammedStr:
                        .BYTE     14
                        .ASCII    "EEPROM EMPTY! "

                        .SYM      DIV.NoOffsetStr
DIV.NoOffsetStr:
                        .BYTE     9
                        .ASCII    "OFS init "

                        .SYM      DIV.MemorizedStr
DIV.MemorizedStr:
                        .BYTE     8
                        .ASCII    "Memorizd"

                        .SYM      DIV.AdrStr
DIV.AdrStr:
                        .BYTE     4
                        .ASCII    "Adr "

$St_String7:
                        .BYTE     1
                        .ASCII    "-"

$St_String8:
                        .BYTE     1
                        .BYTE     003h

$St_String9:
                        .BYTE     1
                        .ASCII    "+"

$St_String10:
                        .BYTE     5
                        .ASCII    "00000"

$St_String11:
                        .BYTE     8
                        .ASCII    "OVERLOAD"

$St_String12:
                        .BYTE     14
                        .ASCII    "-9999 [OVERLD]"

$St_String13:
                        .BYTE     3
                        .ASCII    "E-3"

$St_String14:
                        .BYTE     3
                        .ASCII    "E-6"

$St_String15:
                        .BYTE     0

$St_String16:
                        .BYTE     10
                        .ASCII    "[OFS INIT]"


                        ; ============ array-constant tables ============
                        .SYM      DIV.ErrStrArr
DIV.ErrStrArr:
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


                        .SYM      DIV.FaultStrArr
DIV.FaultStrArr:
                        .BYTE     8
                        .ASCII    "[OVRNEG]"
                        .BYTE     00h
                        .BYTE     00h

                        .BYTE     8
                        .ASCII    "[OVRPOS]"
                        .BYTE     00h
                        .BYTE     00h

                        .BYTE     2
                        .ASCII    "[]"
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h

                        .BYTE     2
                        .ASCII    "[]"
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h


                        .SYM      DIV.RangeStrArr
DIV.RangeStrArr:
                        .BYTE     8
                        .ASCII    "DC 250mV"

                        .BYTE     8
                        .ASCII    "DC  2.5V"

                        .BYTE     8
                        .ASCII    "DC   25V"

                        .BYTE     8
                        .ASCII    "DC  250V"

                        .BYTE     8
                        .ASCII    "AC 250mV"

                        .BYTE     8
                        .ASCII    "AC  2.5V"

                        .BYTE     8
                        .ASCII    "AC   25V"

                        .BYTE     8
                        .ASCII    "AC  250V"

                        .BYTE     8
                        .ASCII    "DC 250uA"

                        .BYTE     8
                        .ASCII    "DC  25mA"

                        .BYTE     8
                        .ASCII    "DC  2.5A"

                        .BYTE     8
                        .ASCII    "DC   10A"

                        .BYTE     8
                        .ASCII    "AC 250uA"

                        .BYTE     8
                        .ASCII    "AC  25mA"

                        .BYTE     8
                        .ASCII    "AC  2.5A"

                        .BYTE     8
                        .ASCII    "AC   10A"


                        .SYM      DIV.DigitsArr
DIV.DigitsArr:
                        .BYTE     003h
                        .BYTE     001h
                        .BYTE     002h
                        .BYTE     003h
                        .BYTE     003h
                        .BYTE     001h
                        .BYTE     002h
                        .BYTE     003h
                        .BYTE     003h
                        .BYTE     002h
                        .BYTE     001h
                        .BYTE     001h
                        .BYTE     003h
                        .BYTE     002h
                        .BYTE     001h
                        .BYTE     001h

                        .SYM      DIV.NachkommaArr
DIV.NachkommaArr:
                        .BYTE     003h
                        .BYTE     005h
                        .BYTE     004h
                        .BYTE     003h
                        .BYTE     003h
                        .BYTE     005h
                        .BYTE     004h
                        .BYTE     003h
                        .BYTE     003h
                        .BYTE     004h
                        .BYTE     005h
                        .BYTE     005h
                        .BYTE     003h
                        .BYTE     004h
                        .BYTE     005h
                        .BYTE     005h

                        .SYM      DIV.RangeArrPortA
DIV.RangeArrPortA:
                        .BYTE     003h
                        .BYTE     003h
                        .BYTE     023h
                        .BYTE     023h
                        .BYTE     003h
                        .BYTE     003h
                        .BYTE     003h
                        .BYTE     003h
                        .BYTE     003h
                        .BYTE     043h
                        .BYTE     083h
                        .BYTE     083h
                        .BYTE     003h
                        .BYTE     043h
                        .BYTE     083h
                        .BYTE     083h

                        .SYM      DIV.RangeArrPortC
DIV.RangeArrPortC:
                        .BYTE     003h
                        .BYTE     003h
                        .BYTE     013h
                        .BYTE     023h
                        .BYTE     047h
                        .BYTE     043h
                        .BYTE     04Fh
                        .BYTE     04Bh
                        .BYTE     083h
                        .BYTE     083h
                        .BYTE     083h
                        .BYTE     083h
                        .BYTE     0C7h
                        .BYTE     0C7h
                        .BYTE     0C7h
                        .BYTE     0C7h

                        .SYM      DIV.CmdStrArr
DIV.CmdStrArr:
                        .BYTE     3
                        .ASCII    "STR"

                        .BYTE     3
                        .ASCII    "IDN"

                        .BYTE     3
                        .ASCII    "TRG"

                        .BYTE     3
                        .ASCII    "VAL"

                        .BYTE     3
                        .ASCII    "RNG"

                        .BYTE     3
                        .ASCII    "DSP"

                        .BYTE     3
                        .ASCII    "OFS"

                        .BYTE     3
                        .ASCII    "SCL"

                        .BYTE     3
                        .ASCII    "ALL"

                        .BYTE     3
                        .ASCII    "TRM"

                        .BYTE     3
                        .ASCII    "TRT"

                        .BYTE     3
                        .ASCII    "TRL"

                        .BYTE     3
                        .ASCII    "ERC"

                        .BYTE     3
                        .ASCII    "SBD"

                        .BYTE     3
                        .ASCII    "WEN"

                        .BYTE     3
                        .ASCII    "NOP"


                        .SYM      DIV.Cmd2SubChArr
DIV.Cmd2SubChArr:
                        .BYTE     0FFh
                        .BYTE     0FEh
                        .BYTE     0F9h
                        .BYTE     000h
                        .BYTE     013h
                        .BYTE     050h
                        .BYTE     064h
                        .BYTE     0C8h
                        .BYTE     063h
                        .BYTE     0F0h
                        .BYTE     0F7h
                        .BYTE     0F8h
                        .BYTE     0FBh
                        .BYTE     0FCh
                        .BYTE     0FAh
                        .BYTE     000h


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
                        ; Stackframe at   = ...0025Dh


                        ; ===== Current top of User Vars in Data is 0000Ch =====

                        ; ===== Current top of User Vars in IData is 00390h =====

                        ; ===== Current top of User Vars in EEprom is 0018Dh =====


                        ; ===== Imported Library Routines =====

                        ; Shift  right byte SHR8
                        ; Divide       byte DIV8
                        ; Multiply     word MUL16
                        ; Divide       word DIV16
                        ; Higher long int
                        ; Higher float
                        ; LongWord and LongInt types
                        ; Divide       long DIV32
                        ; Convert byte to string
                        ; Convert long to string
                        ; Convert string to int
                        ; String compare
                        ; Copy partial String
                        ; Floating point type
                        ; float multiply
                        ; float add
                        ; float float to int
                        ; float int to float
                        ; float float to string
                        ; float string to float
                        ; EEprom read
                        ; EEprom write

                        ; Pascal Statements : 652
                        ; Assembler Lines   : 26424
                        ; Optimizer removed : 500 lines = 1000Bytes

                        ; >> real SysTick (exact): 9.984 msec <<

;  Linker removed the following functions and procedures
;
;  Module/Unit             Function/Procedure
;  ------------------------------------------
;
