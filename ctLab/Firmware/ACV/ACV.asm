
                        .FILE     H:\PROJAVR\ADA-C ACV\ACV.pas

                        ; Compiled by E-LAB AVRco PASCAL Compiler Rev 4.89.00
                        ; Version     : Profi
                        ;
                        ; Licenced to : Redaktion CT
                        ;
                        ; (c)E-LAB Computers, Grombacherstr. 27  e-mail info@e-lab.de
                        ; D-74906 Bad Rappenau  Tel. 07268/9124-0 Fax. 07268/9124-24
                        ; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                        ; Source File : ACV.pas
                        ; Compiled    : 06. Mai 2010  12:14:58
                        ; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

                        .MEDIUM
                        .ROMEND         03FFFh;

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
COMPILEDAY              .EQU    006h            ; const 
COMPILEHOUR             .EQU    00Ch            ; const 
COMPILEMINUTE           .EQU    00Eh            ; const 
PROJECTBUILD            .EQU    071h            ; const 
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
FLAGS                   .EQU    002h            ; var Data   byte
FLAGS2                  .EQU    003h            ; var Data   byte
_SYSTFLAGS              .EQU    004h            ; var Data   byte
SYSTICK                 .EQU    00Ah            ; const 
PROCCLOCK               .EQU    0F42400h        ; const 
DECIMALSEP              .EQU    02Eh            ; const 
CPU_ID                  .EQU    1E9406h         ; const 
ROMconstPage            .EQU    0FFFFFFFFFFFFFFFFh          ; const 
STACKSIZE               .EQU    080h            ; const 
FRAMESIZE               .EQU    080h            ; const 
SERPORT                 .EQU    9600h           ; const 
_ADCBUFF                .EQU    189h            ; var iData  word
UDR1                    .EQU    0C6h            ; var iData  byte
UBRR1H                  .EQU    0C5h            ; var iData  byte
UBRRH                   .EQU    0C5h            ; var iData  byte
UBRR1                   .EQU    0C4h            ; var iData  byte
UBRRL                   .EQU    0C4h            ; var iData  byte
UCSRC                   .EQU    0C2h            ; var iData  byte
UCSR0C                  .EQU    0C2h            ; var iData  byte
UCR1                    .EQU    0C1h            ; var iData  byte
UCSRB                   .EQU    0C1h            ; var iData  byte
USR1                    .EQU    0C0h            ; var iData  byte
UCSRA                   .EQU    0C0h            ; var iData  byte
TWAMR                   .EQU    0BDh            ; var iData  byte
TWCR                    .EQU    0BCh            ; var iData  byte
TWDR                    .EQU    0BBh            ; var iData  byte
TWAR                    .EQU    0BAh            ; var iData  byte
TWSR                    .EQU    0B9h            ; var iData  byte
TWBR                    .EQU    0B8h            ; var iData  byte
ASSR                    .EQU    0B6h            ; var iData  byte
OCR2B                   .EQU    0B4h            ; var iData  byte
OCR2A                   .EQU    0B3h            ; var iData  byte
OCR2                    .EQU    0B3h            ; var iData  byte
TCNT2                   .EQU    0B2h            ; var iData  byte
TCCR2B                  .EQU    0B1h            ; var iData  byte
TCCR2A                  .EQU    0B0h            ; var iData  byte
TCCR2                   .EQU    0B1h            ; var iData  byte
OCR1BH                  .EQU    08Bh            ; var iData  byte
OCR1BL                  .EQU    08Ah            ; var iData  byte
OCR1AH                  .EQU    089h            ; var iData  byte
OCR1AL                  .EQU    088h            ; var iData  byte
ICR1H                   .EQU    087h            ; var iData  byte
ICR1L                   .EQU    086h            ; var iData  byte
TCNT1H                  .EQU    085h            ; var iData  byte
TCNT1L                  .EQU    084h            ; var iData  byte
TCCR1C                  .EQU    082h            ; var iData  byte
TCCR1B                  .EQU    081h            ; var iData  byte
TCCR1A                  .EQU    080h            ; var iData  byte
DIDR1                   .EQU    07Fh            ; var iData  byte
DIDR0                   .EQU    07Eh            ; var iData  byte
ADMUX                   .EQU    07Ch            ; var iData  byte
ADCSR                   .EQU    07Ah            ; var iData  byte
ADCSRB                  .EQU    07Bh            ; var iData  byte
ADCSRA                  .EQU    07Ah            ; var iData  byte
ADCH                    .EQU    079h            ; var iData  byte
ADCL                    .EQU    078h            ; var iData  byte
TIMSK2                  .EQU    070h            ; var iData  byte
TIMSK1                  .EQU    06Fh            ; var iData  byte
TIMSK0                  .EQU    06Eh            ; var iData  byte
PCMSK2                  .EQU    06Dh            ; var iData  byte
PCMSK1                  .EQU    06Ch            ; var iData  byte
PCMSK0                  .EQU    06Bh            ; var iData  byte
EICRA                   .EQU    069h            ; var iData  byte
PCICR                   .EQU    068h            ; var iData  byte
OSCCAL                  .EQU    066h            ; var iData  byte
PRR                     .EQU    064h            ; var iData  byte
CLKPR                   .EQU    061h            ; var iData  byte
WDTCR                   .EQU    060h            ; var iData  byte
SREG                    .EQU    05Fh            ; var pData  byte
SPH                     .EQU    05Eh            ; var pData  byte
SPL                     .EQU    05Dh            ; var pData  byte
SPMCR                   .EQU    057h            ; var pData  byte
SPMCSR                  .EQU    057h            ; var pData  byte
MCUCR                   .EQU    055h            ; var pData  byte
MCUCSR                  .EQU    054h            ; var pData  byte
MCUSR                   .EQU    054h            ; var pData  byte
SMCR                    .EQU    053h            ; var pData  byte
MONDR                   .EQU    051h            ; var pData  byte
ACSR                    .EQU    050h            ; var pData  byte
SPDR                    .EQU    04Eh            ; var pData  byte
SPSR                    .EQU    04Dh            ; var pData  byte
SPCR                    .EQU    04Ch            ; var pData  byte
GPIOR2                  .EQU    04Bh            ; var pData  byte
GPIOR1                  .EQU    04Ah            ; var pData  byte
OCR0B                   .EQU    048h            ; var pData  byte
OCR0A                   .EQU    047h            ; var pData  byte
TCNT0                   .EQU    046h            ; var pData  byte
TCCR0B                  .EQU    045h            ; var pData  byte
TCCR0A                  .EQU    044h            ; var pData  byte
TCCR0                   .EQU    045h            ; var pData  byte
GTCCR                   .EQU    043h            ; var pData  byte
EEARH                   .EQU    042h            ; var pData  byte
EEARL                   .EQU    041h            ; var pData  byte
EEDR                    .EQU    040h            ; var pData  byte
EECR                    .EQU    03Fh            ; var pData  byte
GPIOR0                  .EQU    03Eh            ; var pData  byte
GIMSK                   .EQU    03Dh            ; var pData  byte
EIMSK                   .EQU    03Dh            ; var pData  byte
GIFR                    .EQU    03Ch            ; var pData  byte
EIFR                    .EQU    03Ch            ; var pData  byte
PCIFR                   .EQU    03Bh            ; var pData  byte
TIFR2                   .EQU    037h            ; var pData  byte
TIFR1                   .EQU    036h            ; var pData  byte
TIFR0                   .EQU    035h            ; var pData  byte
PORTD                   .EQU    02Bh            ; var pData  byte
DDRD                    .EQU    02Ah            ; var pData  byte
PIND                    .EQU    029h            ; var pData  byte
PORTC                   .EQU    028h            ; var pData  byte
DDRC                    .EQU    027h            ; var pData  byte
PINC                    .EQU    026h            ; var pData  byte
PORTB                   .EQU    025h            ; var pData  byte
DDRB                    .EQU    024h            ; var pData  byte
PINB                    .EQU    023h            ; var pData  byte
OCR1B                   .EQU    08Ah            ; var iData  word
OCR1A                   .EQU    088h            ; var iData  word
ICR1                    .EQU    086h            ; var iData  word
TCNT1                   .EQU    084h            ; var iData  word
ADC                     .EQU    078h            ; var iData  word
EEAR                    .EQU    041h            ; var pData  word
_iDataStart             .EQU    100h            ; const 
_iDataEnd               .EQU    4FFh            ; const 
_EEpromStart            .EQU    000h            ; const 
_EEpromEnd              .EQU    1FFh            ; const 
_FlashStart             .EQU    000h            ; const 
_FlashEnd               .EQU    3FFFh           ; const 
parNone                 .EQU    000h            ; const 
parEven                 .EQU    001h            ; const 
parOdd                  .EQU    002h            ; const 
DataBit5                .EQU    000h            ; const 
DataBit6                .EQU    001h            ; const 
DataBit7                .EQU    002h            ; const 
DataBit8                .EQU    003h            ; const 
StopBit1                .EQU    000h            ; const 
StopBit2                .EQU    001h            ; const 
_RXTIMEOUT              .EQU    102h            ; var iData  byte
_RXINP                  .EQU    103h            ; var iData  byte
_RXOUTP                 .EQU    104h            ; var iData  byte
_RXCOUNT                .EQU    105h            ; var iData  byte
_RXBUFF                 .EQU    106h            ; var iData  byte
_TXINP                  .EQU    146h            ; var iData  byte
_TXOUTP                 .EQU    147h            ; var iData  byte
_TXCOUNT                .EQU    148h            ; var iData  byte
_TXBUFF                 .EQU    149h            ; var iData  byte
LCD_m1                  .EQU    000h            ; const 
LCD_m2                  .EQU    001h            ; const 
LCD_m3                  .EQU    002h            ; const 
LCD_m4                  .EQU    003h            ; const 
LCD_m5                  .EQU    004h            ; const 
LCD_m6                  .EQU    005h            ; const 
LCD_m7                  .EQU    006h            ; const 
LCD_m8                  .EQU    007h            ; const 
_LCDM_PORT              .EQU    100h            ; var iData  byte
TWI_BR100               .EQU    048h            ; const 
TWI_BR400               .EQU    00Ch            ; const 
SysTickTime             .EQU    101h            ; var iData  byte
bgmGraph                .EQU    000h            ; const 
bgmPointer              .EQU    001h            ; const 
_bgPosA1                .EQU    18Eh            ; var iData  byte
_bgLen1                 .EQU    18Fh            ; var iData  byte
_bgLenx5_1              .EQU    190h            ; var iData  byte
_bgScal1                .EQU    191h            ; var iData  byte
_bgLine1                .EQU    192h            ; var iData  byte
BarGraphMode1           .EQU    193h            ; var iData  enum
_bgPosA2                .EQU    194h            ; var iData  byte
_bgLen2                 .EQU    195h            ; var iData  byte
_bgLenx5_2              .EQU    196h            ; var iData  byte
_bgScal2                .EQU    197h            ; var iData  byte
_bgLine2                .EQU    198h            ; var iData  byte
BarGraphMode2           .EQU    199h            ; var iData  enum
_INCRSTATE4             .EQU    19Ah            ; var iData  byte
_INCRCOUNT4_0           .EQU    19Bh            ; var iData  integer
_INCRCOUNT4_D0          .EQU    19Dh            ; var iData  integer
_TWI_TO                 .EQU    19Fh            ; var iData  byte
TWI_DevLock             .EQU    1A0h            ; var iData  DeviceLock
EEPROM                  .EQU    000h            ; var EEprom array



                        .RESET     000000h
                        .ORG       000000h, CODE_START
                        .STARTCODE 000068h

                        .UNIT     ACV

                        .XDATASTART -1


                        ; ============ user definitions module: ACV ============

ACV.DDRBinit            .EQU    01Fh            ; const byte     31
ACV.PortBinit           .EQU    010h            ; const byte     16
ACV.DDRCinit            .EQU    0F0h            ; const byte     240
ACV.PortCinit           .EQU    0F3h            ; const byte     243
ACV.DDRDinit            .EQU    004h            ; const byte     4
ACV.PortDinit           .EQU    0FCh            ; const byte     252
ACV.BtnInPortReg        .EQU    029h            ; const byte     41
ACV.LEDOutPort          .EQU    02Bh            ; const byte     43
ACV.ControlBitPort      .EQU    025h            ; const byte     37
ACV.ExtensionPort       .EQU    025h            ; const byte     37
ACV.b_SerAux            .EQU    004h            ; const byte     4
;Vers1Str                .EQU    '1.07 [ACV by CM/'; const String
;Vers3Str                .EQU    'ACV 1.07'; const String
;ErrStrArr               .EQU    ; const Array
;EEnotProgrammedStr      .EQU    'EEPROM EMPTY! '; const String
;AdrStr                  .EQU    'Adr '; const String
;dBStr                   .EQU    ' dB '; const String
;mVStr                   .EQU    ' mV '; const String
;GainSelStr              .EQU    'InpGain '; const String
;AuxCmdSelStr            .EQU    'Cmd'; const String
;AuxCmdStr               .EQU    'AuxFunct'; const String
;MemorizedStr            .EQU    'Memorizd'; const String
;OverloadStr             .EQU    ' OVERLD '; const String
;RateSelStr              .EQU    'SmplRate'; const String
;RateStrArr              .EQU    ; const Array
ACV.ErrSubCh            .EQU    0FFh            ; const byte     255
;CmdStrArr               .EQU    ; const Array
;Cmd2SubChArr            .EQU    ; const Array
ACV.high                .EQU    0FFh            ; const boolean  true
ACV.low                 .EQU    000h            ; const boolean  false
;SwitchArr               .EQU    ; const Array
;ADCrangeScalesDiv       .EQU    ; const Array
ACV.dummy               .EQU    00000h          ; var EEprom word
                        .SYM      dummy, 00000h, 0400Eh, 3
ACV.EEinitialised       .EQU    00002h          ; var EEprom word
                        .SYM      EEinitialised, 00002h, 0400Eh, 3
ACV.InitIncRast         .EQU    00004h          ; var EEprom integer
                        .SYM      InitIncRast, 00004h, 04004h, 3
ACV.InitGain            .EQU    00006h          ; var EEprom byte
                        .SYM      InitGain, 00006h, 0400Dh, 3
ACV.InitRate            .EQU    00007h          ; var EEprom enum
                        .SYM      InitRate, 00007h, 0400Ah, 3
ACV.InitAuxCmd          .EQU    00008h          ; var EEprom byte
                        .SYM      InitAuxCmd, 00008h, 0400Dh, 3
ACV.EESerBaudReg        .EQU    00009h          ; var EEprom byte
                        .SYM      EESerBaudReg, 00009h, 0400Dh, 3
ACV.ADCscalesL          .EQU    0000Ah          ; var EEprom array
                        .SYM      ADCscalesL, 0000Ah, 0403Eh, 3
ACV.ADCscalesR          .EQU    0001Ah          ; var EEprom array
                        .SYM      ADCscalesR, 0001Ah, 0403Eh, 3
ACV.InitLRswap          .EQU    0002Ah          ; var EEprom boolean
                        .SYM      InitLRswap, 0002Ah, 04003h, 3
                        .SYM      i, 00005h, 0000Dh, 3
ACV.i                   .EQU    005h            ; var Data   byte
                        .SYM      k, 00006h, 0000Dh, 3
ACV.k                   .EQU    006h            ; var Data   byte
                        .SYM      m, 00007h, 0000Dh, 3
ACV.m                   .EQU    007h            ; var Data   byte
                        .SYM      SlaveCh, 001A1h, 0000Dh, 3
ACV.SlaveCh             .EQU    1A1h            ; var iData  byte
                        .SYM      SwitchState, 001A2h, 0000Dh, 3
ACV.SwitchState         .EQU    1A2h            ; var iData  byte
                        .SYM      ADCconfig, 00381h, 00000h, 3
ACV.ADCconfig           .EQU    381h            ; var I2Cexp byte
                        .SYM      ADCDDR, 00383h, 00000h, 3
ACV.ADCDDR              .EQU    383h            ; var I2Cexp byte
                        .SYM      ButtonTemp, 001A3h, 0000Dh, 3
ACV.ButtonTemp          .EQU    1A3h            ; var iData  byte
                        .SYM      AuxCmd, 001A4h, 0000Dh, 3
ACV.AuxCmd              .EQU    1A4h            ; var iData  byte
                        .SYM      SPDIFrate, 001A5h, 0000Ah, 3
ACV.SPDIFrate           .EQU    1A5h            ; var iData  enum
ACV.ActivityTimer       .EQU    1A6h            ; var iData  byte
                        .SYM      ActivityTimer, 001A6h, 0000Dh, 3
ACV.DisplayTimer        .EQU    1A7h            ; var iData  byte
                        .SYM      DisplayTimer, 001A7h, 0000Dh, 3
ACV.BarGraphDelayTimer  .EQU    1A8h            ; var iData  byte
                        .SYM      BarGraphDelayTimer, 001A8h, 0000Dh, 3
ACV.IncrTimer           .EQU    1A9h            ; var iData  byte
                        .SYM      IncrTimer, 001A9h, 0000Dh, 3
                        .SYM      Gain, 001AAh, 0000Dh, 3
ACV.Gain                .EQU    1AAh            ; var iData  byte
                        .SYM      OldGain, 001ABh, 0000Dh, 3
ACV.OldGain             .EQU    1ABh            ; var iData  byte
                        .SYM      LeftLevel, 001ACh, 0000Eh, 3
ACV.LeftLevel           .EQU    1ACh            ; var iData  word
                        .SYM      RightLevel, 001AEh, 0000Eh, 3
ACV.RightLevel          .EQU    1AEh            ; var iData  word
                        .SYM      LeftLevelScaled, 001B0h, 00004h, 3
ACV.LeftLevelScaled     .EQU    1B0h            ; var iData  integer
                        .SYM      RightLevelScaled, 001B2h, 00004h, 3
ACV.RightLevelScaled    .EQU    1B2h            ; var iData  integer
                        .SYM      LeftLevelByte, 001B4h, 0000Dh, 3
ACV.LeftLevelByte       .EQU    1B4h            ; var iData  byte
                        .SYM      RightLevelByte, 001B5h, 0000Dh, 3
ACV.RightLevelByte      .EQU    1B5h            ; var iData  byte
ACV.GainStr             .EQU    1B6h            ; var iData  string
                        .SYM      GainStr, 001B6h, 0303Ch, 3
                        .SYM      ScaleMult, 001BFh, 0000Eh, 3
ACV.ScaleMult           .EQU    1BFh            ; var iData  word
                        .SYM      ScaleDiv, 001C1h, 0000Eh, 3
ACV.ScaleDiv            .EQU    1C1h            ; var iData  word
                        .SYM      CmdWhich, 001C3h, 0000Ah, 3
ACV.CmdWhich            .EQU    1C3h            ; var iData  enum
ACV.CmdStr              .EQU    1C4h            ; var iData  string
                        .SYM      CmdStr, 001C4h, 0303Ch, 3
                        .SYM      SubCh, 001C8h, 0000Dh, 3
ACV.SubCh               .EQU    1C8h            ; var iData  byte
                        .SYM      CurrentCh, 001C9h, 0000Dh, 3
ACV.CurrentCh           .EQU    1C9h            ; var iData  byte
                        .SYM      OmniFlag, 001CAh, 00003h, 3
ACV.OmniFlag            .EQU    1CAh            ; var iData  boolean
                        .SYM      verbose, 001CBh, 00003h, 3
ACV.verbose             .EQU    1CBh            ; var iData  boolean
                        .SYM      ParamInt, 001CCh, 00004h, 3
ACV.ParamInt            .EQU    1CCh            ; var iData  integer
                        .SYM      ParamByte, 001CEh, 0000Dh, 3
ACV.ParamByte           .EQU    1CEh            ; var iData  byte
ACV.SerInpStr           .EQU    1CFh            ; var iData  string
                        .SYM      SerInpStr, 001CFh, 0303Ch, 3
                        .SYM      SerInpPtr, 0020Fh, 0000Dh, 3
ACV.SerInpPtr           .EQU    20Fh            ; var iData  byte
                        .SYM      LCDpresent, 00210h, 00003h, 3
ACV.LCDpresent          .EQU    210h            ; var iData  boolean
                        .SYM      Modify, 00211h, 0000Ah, 3
ACV.Modify              .EQU    211h            ; var iData  enum
                        .SYM      IncrValue, 00212h, 00004h, 3
ACV.IncrValue           .EQU    212h            ; var iData  integer
                        .SYM      OldIncrValue, 00214h, 00004h, 3
ACV.OldIncrValue        .EQU    214h            ; var iData  integer
                        .SYM      IncrEnter, 00216h, 00003h, 3
ACV.IncrEnter           .EQU    216h            ; var iData  boolean
                        .SYM      FirstTurn, 00217h, 00003h, 3
ACV.FirstTurn           .EQU    217h            ; var iData  boolean
                        .SYM      IncrDiff, 00218h, 00004h, 3
ACV.IncrDiff            .EQU    218h            ; var iData  integer
                        .SYM      IncrAccInt10, 0021Ah, 00004h, 3
ACV.IncrAccInt10        .EQU    21Ah            ; var iData  integer
                        .SYM      IncRast, 0021Ch, 00004h, 3
ACV.IncRast             .EQU    21Ch            ; var iData  integer
                        .SYM      IncrDiffByte, 0021Eh, 0000Dh, 3
ACV.IncrDiffByte        .EQU    21Eh            ; var iData  byte
                        .SYM      digits, 0021Fh, 0000Dh, 3
ACV.digits              .EQU    21Fh            ; var iData  byte
                        .SYM      nachkomma, 00220h, 0000Dh, 3
ACV.nachkomma           .EQU    220h            ; var iData  byte
                        .SYM      ChangedFlag, 00221h, 00003h, 3
ACV.ChangedFlag         .EQU    221h            ; var iData  boolean
ACV.ParamStr            .EQU    222h            ; var iData  string
                        .SYM      ParamStr, 00222h, 0303Ch, 3
                        .SYM      isInteger, 0024Bh, 00003h, 3
ACV.isInteger           .EQU    24Bh            ; var iData  boolean
                        .SYM      Request, 0024Ch, 00003h, 3
ACV.Request             .EQU    24Ch            ; var iData  boolean
                        .SYM      I2Ccmd, 0024Dh, 0000Eh, 3
ACV.I2Ccmd              .EQU    24Dh            ; var iData  word
                        .SYM      Status, 0024Fh, 0000Dh, 3
ACV.Status              .EQU    24Fh            ; var iData  byte
                        .SYM      ErrCount, 00250h, 00004h, 3
ACV.ErrCount            .EQU    250h            ; var iData  integer
                        .SYM      ErrFlag, 00252h, 00003h, 3
ACV.ErrFlag             .EQU    252h            ; var iData  boolean
                        .SYM      UpperChannel, 00253h, 0000Ch, 3
ACV.UpperChannel        .EQU    253h            ; var iData  char
                        .SYM      LowerChannel, 00254h, 0000Ch, 3
ACV.LowerChannel        .EQU    254h            ; var iData  char
                        .SYM      LeftOverload, 00255h, 00003h, 3
ACV.LeftOverload        .EQU    255h            ; var iData  boolean
                        .SYM      RightOverload, 00256h, 00003h, 3
ACV.RightOverload       .EQU    256h            ; var iData  boolean
                        .FUNC     SerAux, 000FDh, 00020h
ACV.SerAux:
                        .RETURNS   0
                        .BLOCK    255
                        .LINE     256
                        LDD       _ACCA, Y+000h
                        MOV       _ACCDHI, _ACCA
                        .ASM
                        .LINE     258
                        ldi  _ACCDLO, 8
                        .LINE     259
                        cbi  ACV.ExtensionPort, ACV.b_SerAux ; Startbit
                        .LINE     260
                        ldi       _ACCA, 5
                        .LINE     261
                        call      SYSTEM.UDELAY
                        ACV.SerAuxloop1:    ; Byte rausschieben
                        .LINE     263
                        lsr  _ACCDHI          ; Bit 0 zuerst
                        .LINE     264
                        brcs ACV.SerAuxdatahigh
                        .LINE     265
                        cbi  ACV.ExtensionPort, ACV.b_SerAux
                        .LINE     266
                        rjmp ACV.SerAuxdataset
                        ACV.SerAuxdatahigh:
                        .LINE     268
                        sbi  ACV.ExtensionPort, ACV.b_SerAux
                        ACV.SerAuxdataset:
                        .LINE     270
                        ldi       _ACCA, 5
                        .LINE     271
                        call      SYSTEM.UDELAY
                        .LINE     272
                        dec _ACCDLO
                        .LINE     273
                        brne ACV.SerAuxloop1
                        .LINE     274
                        sbi  ACV.ExtensionPort, ACV.b_SerAux
                        .LINE     275
                        ldi       _ACCA, 10
                        .LINE     276
                        call      SYSTEM.UDELAY
                        .endasm
                        .ENDBLOCK 278
ACV.SerAux_X:
                        .LINE     278
                        .BRANCH   19
                        RET
                        .ENDFUNC  278

                        .FUNC     GetLevels, 00118h, 00020h
ACV.GetLevels:
                        .RETURNS   0
                        .BLOCK    282
                        .LINE     283
                        LDI       _ACCA, 000h
                        STS       ACV.RIGHTOVERLOAD, _ACCA
                        .LINE     284
                        LDI       _ACCA, 000h
                        STS       ACV.LEFTOVERLOAD, _ACCA
                        .LINE     285
                        LDI       _ACCA, 004h
                        .FRAME  0
                        CALL       SYSTEM.GETADC
                        STS       ACV.RIGHTLEVEL, _ACCB
                        STS       ACV.RIGHTLEVEL+1, _ACCA
                        .LINE     286
                        LDI       _ACCA, 003h
                        .FRAME  0
                        CALL       SYSTEM.GETADC
                        STS       ACV.LEFTLEVEL, _ACCB
                        STS       ACV.LEFTLEVEL+1, _ACCA
                        .LINE     287
                        LDS       _ACCB, ACV.LeftLevel
                        LDS       _ACCA, ACV.LeftLevel+1
                        LSR       _ACCA
                        ROR       _ACCB
                        LSR       _ACCA
                        ROR       _ACCB
                        MOV       _ACCA, _ACCB
                        STS       ACV.LEFTLEVELBYTE, _ACCA
                        .LINE     288
                        LDI       _ACCCLO, ACV.ADCrangeScalesDiv AND 0FFh
                        LDI       _ACCCHI, ACV.ADCrangeScalesDiv SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, ACV.Gain
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
                        STS       ACV.SCALEDIV, _ACCB
                        STS       ACV.SCALEDIV+1, _ACCA
                        .LINE     289
                        LDS       _ACCB, ACV.RightLevel
                        LDS       _ACCA, ACV.RightLevel+1
                        CPI       _ACCA, 003h
                        BRNE      ACV._L0000
                        CPI       _ACCB, 0FBh
ACV._L0000:
                        LDI       _ACCA, 0h
                        BREQ      ACV._L0001
                        BRLO      ACV._L0001
                        SER       _ACCA
ACV._L0001:
                        TST       _ACCA
                        .BRANCH   4,ACV._L0004
                        BRNE      ACV._L0004
                        .BRANCH   20,ACV._L0002
                        JMP       ACV._L0002
ACV._L0004:
                        .BLOCK    289
                        .LINE     290
                        LDI       _ACCA, 0FFh
                        STS       ACV.RIGHTOVERLOAD, _ACCA
                        .LINE     291
                        LDI       _ACCA, 0FFh
                        STS       ACV.RIGHTLEVELBYTE, _ACCA
                        .LINE     292
                        LDI       _ACCA, 00000h SHRB 8
                        LDI       _ACCB, 00000h AND 0FFh
                        STS       ACV.RIGHTLEVELSCALED, _ACCB
                        STS       ACV.RIGHTLEVELSCALED+1, _ACCA
                        .ENDBLOCK 293
                        .BRANCH   20,ACV._L0003
                        JMP       ACV._L0003
ACV._L0002:
                        .BLOCK    293
                        .LINE     294
                        LDS       _ACCB, ACV.RightLevel
                        LDS       _ACCA, ACV.RightLevel+1
                        LSR       _ACCA
                        ROR       _ACCB
                        LSR       _ACCA
                        ROR       _ACCB
                        MOV       _ACCA, _ACCB
                        STS       ACV.RIGHTLEVELBYTE, _ACCA
                        .LINE     295
                        LDI       _ACCCLO, ACV.ADCscalesR AND 0FFh
                        LDI       _ACCCHI, ACV.ADCscalesR SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, ACV.Gain
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        CALL      SYSTEM._ReadEEp16
                        STS       ACV.SCALEMULT, _ACCB
                        STS       ACV.SCALEMULT+1, _ACCA
                        .LINE     296
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCB, ACV.RightLevel
                        LDS       _ACCA, ACV.RightLevel+1
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDS       _ACCB, ACV.ScaleMult
                        LDS       _ACCA, ACV.ScaleMult+1
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  4
                        LDS       _ACCB, ACV.ScaleDiv
                        LDS       _ACCA, ACV.ScaleDiv+1
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        LDI       _ACCA, 000h
                        CALL      SYSTEM._MulDivInt
                        .FRAME  0
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        STS       ACV.RIGHTLEVELSCALED, _ACCB
                        STS       ACV.RIGHTLEVELSCALED+1, _ACCA
                        .ENDBLOCK 297
ACV._L0003:
                        .LINE     298
                        LDS       _ACCB, ACV.LeftLevel
                        LDS       _ACCA, ACV.LeftLevel+1
                        CPI       _ACCA, 003h
                        BRNE      ACV._L0005
                        CPI       _ACCB, 0FBh
ACV._L0005:
                        LDI       _ACCA, 0h
                        BREQ      ACV._L0006
                        BRLO      ACV._L0006
                        SER       _ACCA
ACV._L0006:
                        TST       _ACCA
                        .BRANCH   4,ACV._L0009
                        BRNE      ACV._L0009
                        .BRANCH   20,ACV._L0007
                        JMP       ACV._L0007
ACV._L0009:
                        .BLOCK    298
                        .LINE     299
                        LDI       _ACCA, 0FFh
                        STS       ACV.LEFTOVERLOAD, _ACCA
                        .LINE     300
                        LDI       _ACCA, 0FFh
                        STS       ACV.LEFTLEVELBYTE, _ACCA
                        .LINE     301
                        LDI       _ACCA, 00000h SHRB 8
                        LDI       _ACCB, 00000h AND 0FFh
                        STS       ACV.LEFTLEVELSCALED, _ACCB
                        STS       ACV.LEFTLEVELSCALED+1, _ACCA
                        .ENDBLOCK 302
                        .BRANCH   20,ACV._L0008
                        JMP       ACV._L0008
ACV._L0007:
                        .BLOCK    302
                        .LINE     303
                        LDS       _ACCB, ACV.LeftLevel
                        LDS       _ACCA, ACV.LeftLevel+1
                        LSR       _ACCA
                        ROR       _ACCB
                        LSR       _ACCA
                        ROR       _ACCB
                        MOV       _ACCA, _ACCB
                        STS       ACV.LEFTLEVELBYTE, _ACCA
                        .LINE     304
                        LDI       _ACCCLO, ACV.ADCscalesL AND 0FFh
                        LDI       _ACCCHI, ACV.ADCscalesL SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, ACV.Gain
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        CALL      SYSTEM._ReadEEp16
                        STS       ACV.SCALEMULT, _ACCB
                        STS       ACV.SCALEMULT+1, _ACCA
                        .LINE     305
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCB, ACV.LeftLevel
                        LDS       _ACCA, ACV.LeftLevel+1
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDS       _ACCB, ACV.ScaleMult
                        LDS       _ACCA, ACV.ScaleMult+1
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  4
                        LDS       _ACCB, ACV.ScaleDiv
                        LDS       _ACCA, ACV.ScaleDiv+1
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        LDI       _ACCA, 000h
                        CALL      SYSTEM._MulDivInt
                        .FRAME  0
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        STS       ACV.LEFTLEVELSCALED, _ACCB
                        STS       ACV.LEFTLEVELSCALED+1, _ACCA
                        .ENDBLOCK 306
ACV._L0008:
                        .ENDBLOCK 307
ACV.GetLevels_X:
                        .LINE     307
                        .BRANCH   19
                        RET
                        .ENDFUNC  307

                        .FUNC     PatchCopyFromEE, 0013Bh, 00020h
ACV.PatchCopyFromEE:
                        .RETURNS   0
                        .BLOCK    317
                        .LINE     318
                        LDI       _ACCCLO, ACV.InitIncRast AND 0FFh
                        LDI       _ACCCHI, ACV.InitIncRast SHRB 8
                        CALL      SYSTEM._ReadEEp16
                        STS       ACV.INCRAST, _ACCB
                        STS       ACV.INCRAST+1, _ACCA
                        .LINE     319
                        LDI       _ACCCLO, ACV.InitGain AND 0FFh
                        LDI       _ACCCHI, ACV.InitGain SHRB 8
                        CALL      SYSTEM.ReadEEp8
                        STS       ACV.GAIN, _ACCA
                        .LINE     320
                        LDI       _ACCCLO, ACV.InitRate AND 0FFh
                        LDI       _ACCCHI, ACV.InitRate SHRB 8
                        CALL      SYSTEM.ReadEEp8
                        STS       ACV.SPDIFRATE, _ACCA
                        .ENDBLOCK 321
ACV.PatchCopyFromEE_X:
                        .LINE     321
                        .BRANCH   19
                        RET
                        .ENDFUNC  321

                        .FUNC     SerCRLF, 00147h, 00020h
ACV.SerCRLF:
                        .RETURNS   0
                        .BLOCK    328
                        .LINE     329
                        LDI       _ACCA, 00Dh
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .LINE     330
                        LDI       _ACCA, 00Ah
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .ENDBLOCK 331
ACV.SerCRLF_X:
                        .LINE     331
                        .BRANCH   19
                        RET
                        .ENDFUNC  331

                        .FUNC     WriteChPrefix, 0014Dh, 00020h
ACV.WriteChPrefix:
                        .RETURNS   0
                        .BLOCK    334
                        .LINE     335
                        LDI       _ACCA, 023h
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .LINE     336
                        LDS       _ACCA, ACV.SlaveCh
                        SUBI      _ACCA, -030h AND 0FFh
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .LINE     337
                        LDI       _ACCA, 03Ah
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .LINE     338
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.Serout SHRB 1
                        LDI       _ACCA, SYSTEM.Serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDS       _ACCA, ACV.SubCh
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
                        .LINE     339
                        LDI       _ACCA, 03Dh
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .ENDBLOCK 340
ACV.WriteChPrefix_X:
                        .LINE     340
                        .BRANCH   19
                        RET
                        .ENDFUNC  340

                        .FUNC     WriteSerInp, 00156h, 00020h
ACV.WriteSerInp:
                        .RETURNS   0
                        .BLOCK    343
                        .LINE     344
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.Serout SHRB 1
                        LDI       _ACCA, SYSTEM.Serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, ACV.SerInpStr AND 0FFh
                        LDI       _ACCCHI, ACV.SerInpStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     345
                        .BRANCH   17,ACV.SERCRLF
                        CALL      ACV.SERCRLF
                        .ENDBLOCK 346
ACV.WriteSerInp_X:
                        .LINE     346
                        .BRANCH   19
                        RET
                        .ENDFUNC  346

                        .FUNC     SerPrompt, 0015Ch, 00020h
ACV.SerPrompt:
                        .RETURNS   0
                        .BLOCK    351
                        .LINE     352
                        LDS       _ACCA, ACV.verbose
                        PUSH      _ACCA
                        LDD       _ACCA, Y+001h
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      ACV._L0010
                        SER       _ACCA
ACV._L0010:
                        POP       _ACCB
                        OR        _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   4,ACV._L0013
                        BRNE      ACV._L0013
                        .BRANCH   20,ACV._L0011
                        JMP       ACV._L0011
ACV._L0013:
                        .BLOCK    352
                        .LINE     353
                        LDI       _ACCA, 0FFh
                        STS       ACV.SUBCH, _ACCA
                        .LINE     354
                        .BRANCH   17,ACV.WRITECHPREFIX
                        CALL      ACV.WRITECHPREFIX
                        .LINE     355
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
                        .LINE     356
                        LDI       _ACCA, 020h
                        .FRAME  0
                        CALL      SYSTEM.SEROUT
                        .LINE     357
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.serout SHRB 1
                        LDI       _ACCA, SYSTEM.serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, ACV.ErrStrArr AND 0FFh
                        LDI       _ACCCHI, ACV.ErrStrArr SHRB 8
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
ACV._L0014:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     358
                        .BRANCH   17,ACV.SERCRLF
                        CALL      ACV.SERCRLF
                        .ENDBLOCK 359
ACV._L0011:
ACV._L0012:
                        .LINE     360
                        LDD       _ACCA, Y+001h
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      ACV._L0015
                        SER       _ACCA
ACV._L0015:
                        TST       _ACCA
                        .BRANCH   4,ACV._L0018
                        BRNE      ACV._L0018
                        .BRANCH   20,ACV._L0016
                        JMP       ACV._L0016
ACV._L0018:
                        .BLOCK    360
                        .LINE     361
                        LDS       _ACCBLO, ACV.ErrCount
                        LDS       _ACCBHI, ACV.ErrCount+1
                        ADIW      _ACCBLO, 1
                        STS       ACV.ErrCount, _ACCBLO
                        STS       ACV.ErrCount+1, _ACCBHI
                        .LINE     362
                        LDI       _ACCA, 0FFh
                        STS       ACV.ERRFLAG, _ACCA
                        .ENDBLOCK 363
ACV._L0016:
ACV._L0017:
                        .ENDBLOCK 364
ACV.SerPrompt_X:
                        .LINE     364
                        .BRANCH   19
                        RET
                        .ENDFUNC  364

                        .FUNC     I2CoutAdr10, 0016Fh, 00020h
ACV.I2CoutAdr10:
                        .RETURNS   0
                        .BLOCK    369
                        .LINE     370
                        LDD       _ACCA, Y+001h
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        STS       ACV.I2CCMD, _ACCB
                        STS       ACV.I2CCMD+1, _ACCA
                        .LINE     371
                        LDS       _ACCB, ACV.I2Ccmd
                        LDS       _ACCA, ACV.I2Ccmd+1
                        LDI       _ACCALO, 008h
                        CALL      SYSTEM.SHL16
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDD       _ACCA, Y+000h
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        POP       _ACCAHI
                        POP       _ACCALO
                        ADD       _ACCB, _ACCALO
                        ADC       _ACCA, _ACCAHI
                        STS       ACV.I2CCMD, _ACCB
                        STS       ACV.I2CCMD+1, _ACCA
                        .LINE     372
                        LDI       _ACCA, 010h
                        PUSH      _ACCA
                        LDS       _ACCB, ACV.I2Ccmd
                        LDS       _ACCA, ACV.I2Ccmd+1
                        MOVW      _ACCALO, _ACCB
                        SET
                        BLD       Flags, _I2C2BYTE
                        POP       _ACCDLO
                        LDI       _ACCBLO, 00000h AND 0FFh
                        LDI       _ACCBHI, 00000h SHRB 8
                        LDI       _ACCDHI, 000h
                        CALL       SYSTEM.TWIOut
                        .ENDBLOCK 373
ACV.I2CoutAdr10_X:
                        .LINE     373
                        .BRANCH   19
                        RET
                        .ENDFUNC  373

                        .FUNC     I2CinAdr10, 00177h, 00020h
ACV.I2CinAdr10:
                        .RETURNS   1
                        .BLOCK    377
                        .LINE     378
                        LDI       _ACCA, 010h
                        PUSH      _ACCA
                        LDD       _ACCA, Y+000h
                        MOV       _ACCAHI, _ACCA
                        CLT
                        BLD       Flags, _I2C2BYTE
                        POP       _ACCDLO
                        LDI       _ACCBLO, 00000h AND 0FFh
                        LDI       _ACCBHI, 00000h SHRB 8
                        LDI       _ACCDHI, 000h
                        CALL       SYSTEM.TWIOut
                        .LINE     379
                        LDI       _ACCA, 010h
                        PUSH      _ACCA
                        LDI       _ACCCLO, ACV.m AND 0FFh
                        LDI       _ACCCHI, ACV.m SHRB 8
                        LDI       _ACCBLO, 00001h AND 0FFh
                        LDI       _ACCBHI, 00001h SHRB 8
                        POP       _ACCDLO
                        CALL       SYSTEM.TWIInp
                        .LINE     380
                        MOV       _ACCA, ACV.m
                        .ENDBLOCK 381
ACV.I2CinAdr10_X:
                        .LINE     381
                        .BRANCH   19
                        RET
                        .ENDFUNC  381

                        .FUNC     initSPDIF, 0017Fh, 00020h
ACV.initSPDIF:
                        .RETURNS   0
                        .BLOCK    384
                        .LINE     385
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 004h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ACV.I2COUTADR10
                        CALL      ACV.I2COUTADR10
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     386
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ACV.I2COUTADR10
                        CALL      ACV.I2COUTADR10
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     387
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 012h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ACV.I2COUTADR10
                        CALL      ACV.I2COUTADR10
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     388
                        LDS       _ACCA, ACV.SPDIFrate
                        .LINE     390
                        CPI       _ACCA, 1
                        .BRANCH   3,ACV._L0022
                        BREQ      ACV._L0022
                        .BRANCH   20,ACV._L0021
                        JMP       ACV._L0021
ACV._L0022:
                        .BRANCH   20,ACV._L0020
                        JMP       ACV._L0020
ACV._L0021:
                        CPI       _ACCA, 4
                        .BRANCH   3,ACV._L0024
                        BREQ      ACV._L0024
                        .BRANCH   20,ACV._L0023
                        JMP       ACV._L0023
ACV._L0024:
ACV._L0020:
                        .BLOCK    391
                        .LINE     391
                        LDI       _ACCA, 045h
                        LDI       _ACCDLO, 038h
                        LDI       _ACCAHI, 001h
                        CALL      SYSTEM.I2CEXPOUT
                        .LINE     392
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 004h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 040h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ACV.I2COUTADR10
                        CALL      ACV.I2COUTADR10
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 393
                        .BRANCH   20,ACV._L0019
                        JMP       ACV._L0019
ACV._L0023:
                        .LINE     394
                        CPI       _ACCA, 2
                        .BRANCH   3,ACV._L0027
                        BREQ      ACV._L0027
                        .BRANCH   20,ACV._L0026
                        JMP       ACV._L0026
ACV._L0027:
                        .BRANCH   20,ACV._L0025
                        JMP       ACV._L0025
ACV._L0026:
                        CPI       _ACCA, 5
                        .BRANCH   3,ACV._L0029
                        BREQ      ACV._L0029
                        .BRANCH   20,ACV._L0028
                        JMP       ACV._L0028
ACV._L0029:
ACV._L0025:
                        .BLOCK    395
                        .LINE     395
                        LDI       _ACCA, 046h
                        LDI       _ACCDLO, 038h
                        LDI       _ACCAHI, 001h
                        CALL      SYSTEM.I2CEXPOUT
                        .LINE     396
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 004h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 070h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ACV.I2COUTADR10
                        CALL      ACV.I2COUTADR10
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 397
                        .BRANCH   20,ACV._L0019
                        JMP       ACV._L0019
ACV._L0028:
                        .BLOCK    398
                        .LINE     399
                        LDI       _ACCA, 044h
                        LDI       _ACCDLO, 038h
                        LDI       _ACCAHI, 001h
                        CALL      SYSTEM.I2CEXPOUT
                        .LINE     400
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 004h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 060h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ACV.I2COUTADR10
                        CALL      ACV.I2COUTADR10
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 401
ACV._L0019:
                        .LINE     402
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 005h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 005h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ACV.I2COUTADR10
                        CALL      ACV.I2COUTADR10
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     406
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 020h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 020h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ACV.I2COUTADR10
                        CALL      ACV.I2COUTADR10
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     407
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 021h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 041h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ACV.I2COUTADR10
                        CALL      ACV.I2COUTADR10
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     408
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 022h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ACV.I2COUTADR10
                        CALL      ACV.I2COUTADR10
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     409
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 023h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 048h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ACV.I2COUTADR10
                        CALL      ACV.I2COUTADR10
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     410
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 024h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 0C6h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ACV.I2COUTADR10
                        CALL      ACV.I2COUTADR10
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     411
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 025h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 0B6h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ACV.I2COUTADR10
                        CALL      ACV.I2COUTADR10
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     412
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 026h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 0F4h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ACV.I2COUTADR10
                        CALL      ACV.I2COUTADR10
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     413
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 027h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 0C6h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ACV.I2COUTADR10
                        CALL      ACV.I2COUTADR10
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     414
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 028h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 0E4h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ACV.I2COUTADR10
                        CALL      ACV.I2COUTADR10
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     415
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 029h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 02Eh
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ACV.I2COUTADR10
                        CALL      ACV.I2COUTADR10
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 416
ACV.initSPDIF_X:
                        .LINE     416
                        .BRANCH   19
                        RET
                        .ENDFUNC  416

                        .FUNC     SwitchGain, 001A2h, 00020h
ACV.SwitchGain:
                        .RETURNS   0
                        .BLOCK    420
                        .LINE     421
                        LDS       _ACCA, ACV.Gain
                        PUSH      _ACCA
                        LDS       _ACCA, ACV.OldGain
                        POP       _ACCB
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0h
                        BRNE      ACV._L0030
                        SER       _ACCA
ACV._L0030:
                        TST       _ACCA
                        .BRANCH   4,ACV._L0033
                        BRNE      ACV._L0033
                        .BRANCH   20,ACV._L0031
                        JMP       ACV._L0031
ACV._L0033:
                        .BLOCK    421
                        .LINE     422
                        .BRANCH   20,ACV.SwitchGain_X
                        JMP       ACV.SwitchGain_X
                        .ENDBLOCK 423
ACV._L0031:
ACV._L0032:
                        .LINE     424
                        LDS       _ACCA, ACV.Gain
                        STS       ACV.OLDGAIN, _ACCA
                        .LINE     425
                        LDI       _ACCCLO, ACV.SwitchArr AND 0FFh
                        LDI       _ACCCHI, ACV.SwitchArr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, ACV.Gain
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LPM       _ACCA, Z
                        ORI       _ACCA, 010h
                        OUT       PORTB, _ACCA
                        .ENDBLOCK 426
ACV.SwitchGain_X:
                        .LINE     426
                        .BRANCH   19
                        RET
                        .ENDFUNC  426

                        .FUNC     WriteParamStrSer, 001AFh, 00020h
ACV.WriteParamStrSer:
                        .RETURNS   0
                        .BLOCK    432
                        .LINE     433
                        .BRANCH   17,ACV.WRITECHPREFIX
                        CALL      ACV.WRITECHPREFIX
                        .LINE     434
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.Serout SHRB 1
                        LDI       _ACCA, SYSTEM.Serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, ACV.ParamStr AND 0FFh
                        LDI       _ACCCHI, ACV.ParamStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     435
                        .BRANCH   17,ACV.SERCRLF
                        CALL      ACV.SERCRLF
                        .ENDBLOCK 436
ACV.WriteParamStrSer_X:
                        .LINE     436
                        .BRANCH   19
                        RET
                        .ENDFUNC  436

                        .FUNC     ParamToStr, 001B6h, 00020h
ACV.ParamToStr:
                        .RETURNS   0
                        .BLOCK    439
                        .LINE     440
                        LDI       _ACCCLO, ACV.ParamStr AND 0FFh
                        LDI       _ACCCHI, ACV.ParamStr SHRB 8
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
                        LDS       _ACCB, ACV.ParamInt
                        LDS       _ACCA, ACV.ParamInt+1
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
                        .ENDBLOCK 441
ACV.ParamToStr_X:
                        .LINE     441
                        .BRANCH   19
                        RET
                        .ENDFUNC  441

                        .FUNC     ParamToStrScaled, 001BBh, 00020h
ACV.ParamToStrScaled:
                        .RETURNS   0
                        .BLOCK    444
                        .LINE     445
                        LDS       _ACCA, ACV.Gain
                        CPI       _ACCA, 004h
                        LDI       _ACCA, 0h
                        BREQ      ACV._L0034
                        BRLO      ACV._L0034
                        SER       _ACCA
ACV._L0034:
                        TST       _ACCA
                        .BRANCH   4,ACV._L0037
                        BRNE      ACV._L0037
                        .BRANCH   20,ACV._L0035
                        JMP       ACV._L0035
ACV._L0037:
                        .BLOCK    445
                        .LINE     446
                        LDI       _ACCCLO, ACV.ParamStr AND 0FFh
                        LDI       _ACCCHI, ACV.ParamStr SHRB 8
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
                        LDS       _ACCB, ACV.ParamInt
                        LDS       _ACCA, ACV.ParamInt+1
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  5
                        LDI       _ACCA, 003h
                        ST        -Y, _ACCA
                        .FRAME  6
                        LDI       _ACCB, 000h
                        ST        -Y, _ACCB
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
                        .LINE     447
                        LDI       _ACCCLO, $St_String13 AND 0FFh
                        LDI       _ACCCHI, $St_String13 SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCCLO, ACV.ParamStr AND 0FFh
                        LDI       _ACCCHI, ACV.ParamStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCA, 028h
                        PUSH      _ACCA
                        LDI       _ACCA, 003h
                        LDI       _ACCFHI, 002h
                        CALL      SYSTEM.StringInsert
                        .ENDBLOCK 448
                        .BRANCH   20,ACV._L0036
                        JMP       ACV._L0036
ACV._L0035:
                        .BLOCK    448
                        .LINE     449
                        LDI       _ACCCLO, ACV.ParamStr AND 0FFh
                        LDI       _ACCCHI, ACV.ParamStr SHRB 8
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
                        LDS       _ACCB, ACV.ParamInt
                        LDS       _ACCA, ACV.ParamInt+1
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  5
                        LDI       _ACCA, 004h
                        ST        -Y, _ACCA
                        .FRAME  6
                        LDI       _ACCB, 000h
                        ST        -Y, _ACCB
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
                        .ENDBLOCK 450
ACV._L0036:
                        .ENDBLOCK 451
ACV.ParamToStrScaled_X:
                        .LINE     451
                        .BRANCH   19
                        RET
                        .ENDFUNC  451

                        .FUNC     WriteParamSer, 001C5h, 00020h
ACV.WriteParamSer:
                        .RETURNS   0
                        .BLOCK    454
                        .LINE     455
                        .BRANCH   17,ACV.PARAMTOSTR
                        CALL      ACV.PARAMTOSTR
                        .LINE     456
                        .BRANCH   17,ACV.WRITEPARAMSTRSER
                        CALL      ACV.WRITEPARAMSTRSER
                        .ENDBLOCK 457
ACV.WriteParamSer_X:
                        .LINE     457
                        .BRANCH   19
                        RET
                        .ENDFUNC  457

                        .FUNC     WriteParamByteSer, 001CBh, 00020h
ACV.WriteParamByteSer:
                        .RETURNS   0
                        .BLOCK    460
                        .LINE     461
                        LDI       _ACCCLO, ACV.ParamStr AND 0FFh
                        LDI       _ACCCHI, ACV.ParamStr SHRB 8
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
                        LDS       _ACCA, ACV.ParamByte
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
                        .LINE     462
                        .BRANCH   17,ACV.WRITEPARAMSTRSER
                        CALL      ACV.WRITEPARAMSTRSER
                        .ENDBLOCK 463
ACV.WriteParamByteSer_X:
                        .LINE     463
                        .BRANCH   19
                        RET
                        .ENDFUNC  463

                        .FUNC     SollWerteOnLCD, 001D1h, 00020h
ACV.SollWerteOnLCD:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 3
                        .BLOCK    467
                        .LINE     468
                        LDI       _ACCA, 002h
                        STS       ACV.DIGITS, _ACCA
                        .LINE     469
                        LDI       _ACCA, 001h
                        STS       ACV.NACHKOMMA, _ACCA
                        .LINE     470
                        LDS       _ACCA, ACV.Modify
                        STD       Y+000h, _ACCA
                        .LINE     471
                        SER       _ACCA
                        LDS       _ACCB, ACV.BarGraphDelayTimer
                        TST       _ACCB
                        BREQ      ACV._L0038
                        COM       _ACCA
ACV._L0038:
                        COM       _ACCA
                        TST       _ACCA
                        .BRANCH   4,ACV._L0041
                        BRNE      ACV._L0041
                        .BRANCH   20,ACV._L0039
                        JMP       ACV._L0039
ACV._L0041:
                        .BLOCK    471
                        .LINE     472
                        LDS       _ACCA, ACV.Modify
                        CPI       _ACCA, 003h
                        .BRANCH   3,ACV._L0042
                        BREQ      ACV._L0042
                        CPI       _ACCA, 004h
                        .BRANCH   3,ACV._L0042
                        BREQ      ACV._L0042
ACV._L0042:
                        LDI       _ACCA, 0h
                        BRNE      ACV._L0043
                        SER       _ACCA
ACV._L0043:
                        TST       _ACCA
                        .BRANCH   4,ACV._L0046
                        BRNE      ACV._L0046
                        .BRANCH   20,ACV._L0044
                        JMP       ACV._L0044
ACV._L0046:
                        .BLOCK    472
                        .LINE     473
                        LDI       _ACCA, 002h
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 474
ACV._L0044:
ACV._L0045:
                        .ENDBLOCK 475
ACV._L0039:
ACV._L0040:
                        .LINE     476
                        LDD       _ACCA, Y+000h
                        .LINE     477
                        CPI       _ACCA, 4
                        .BRANCH   3,ACV._L0050
                        BREQ      ACV._L0050
                        .BRANCH   20,ACV._L0049
                        JMP       ACV._L0049
ACV._L0050:
ACV._L0048:
                        .BLOCK    478
                        .LINE     478
                        LDS       _ACCA, ACV.IncrEnter
                        TST       _ACCA
                        .BRANCH   4,ACV._L0053
                        BRNE      ACV._L0053
                        .BRANCH   20,ACV._L0051
                        JMP       ACV._L0051
ACV._L0053:
                        .BLOCK    478
                        .LINE     479
                        LDS       _ACCA, ACV.Gain
                        LDI       _ACCCLO, ACV.INITGAIN AND 0FFh
                        LDI       _ACCCHI, ACV.INITGAIN SHRB 8
                        CALL      SYSTEM.WriteEEp8
                        ADIW      _ACCCLO, 01h
                        .ENDBLOCK 480
ACV._L0051:
ACV._L0052:
                        .LINE     481
                        .BRANCH   17,ACV.GETLEVELS
                        CALL      ACV.GETLEVELS
                        .LINE     482
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
                        .LINE     483
                        LDS       _ACCA, ACV.UpperChannel
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .LINE     484
                        LDS       _ACCA, ACV.LeftLevelByte
                        CPI       _ACCA, 0FDh
                        LDI       _ACCA, 0h
                        BREQ      ACV._L0054
                        BRLO      ACV._L0054
                        SER       _ACCA
ACV._L0054:
                        TST       _ACCA
                        .BRANCH   4,ACV._L0057
                        BRNE      ACV._L0057
                        .BRANCH   20,ACV._L0055
                        JMP       ACV._L0055
ACV._L0057:
                        .BLOCK    484
                        .LINE     485
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, ACV.OverloadStr AND 0FFh
                        LDI       _ACCCHI, ACV.OverloadStr SHRB 8
                        CALL      SYSTEM.StrConst2Str
ACV._L0058:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .ENDBLOCK 486
                        .BRANCH   20,ACV._L0056
                        JMP       ACV._L0056
ACV._L0055:
                        .BLOCK    486
                        .LINE     487
                        LDS       _ACCB, ACV.LeftLevelScaled
                        LDS       _ACCA, ACV.LeftLevelScaled+1
                        STS       ACV.PARAMINT, _ACCB
                        STS       ACV.PARAMINT+1, _ACCA
                        .LINE     488
                        .BRANCH   17,ACV.PARAMTOSTRSCALED
                        CALL      ACV.PARAMTOSTRSCALED
                        .LINE     489
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, ACV.ParamStr AND 0FFh
                        LDI       _ACCCHI, ACV.ParamStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     490
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, ACV.mVStr AND 0FFh
                        LDI       _ACCCHI, ACV.mVStr SHRB 8
                        CALL      SYSTEM.StrConst2Str
ACV._L0059:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .ENDBLOCK 491
ACV._L0056:
                        .LINE     493
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
                        .LINE     494
                        LDS       _ACCA, ACV.LowerChannel
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .LINE     495
                        LDS       _ACCA, ACV.RightLevelByte
                        CPI       _ACCA, 0FDh
                        LDI       _ACCA, 0h
                        BREQ      ACV._L0060
                        BRLO      ACV._L0060
                        SER       _ACCA
ACV._L0060:
                        TST       _ACCA
                        .BRANCH   4,ACV._L0063
                        BRNE      ACV._L0063
                        .BRANCH   20,ACV._L0061
                        JMP       ACV._L0061
ACV._L0063:
                        .BLOCK    495
                        .LINE     496
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, ACV.OverloadStr AND 0FFh
                        LDI       _ACCCHI, ACV.OverloadStr SHRB 8
                        CALL      SYSTEM.StrConst2Str
ACV._L0064:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .ENDBLOCK 497
                        .BRANCH   20,ACV._L0062
                        JMP       ACV._L0062
ACV._L0061:
                        .BLOCK    497
                        .LINE     498
                        LDS       _ACCB, ACV.RightLevelScaled
                        LDS       _ACCA, ACV.RightLevelScaled+1
                        STS       ACV.PARAMINT, _ACCB
                        STS       ACV.PARAMINT+1, _ACCA
                        .LINE     499
                        .BRANCH   17,ACV.PARAMTOSTRSCALED
                        CALL      ACV.PARAMTOSTRSCALED
                        .LINE     500
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, ACV.ParamStr AND 0FFh
                        LDI       _ACCCHI, ACV.ParamStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     501
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, ACV.mVStr AND 0FFh
                        LDI       _ACCCHI, ACV.mVStr SHRB 8
                        CALL      SYSTEM.StrConst2Str
ACV._L0065:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .ENDBLOCK 502
ACV._L0062:
                        .ENDBLOCK 503
                        .BRANCH   20,ACV._L0047
                        JMP       ACV._L0047
ACV._L0049:
                        .LINE     504
                        CPI       _ACCA, 3
                        .BRANCH   3,ACV._L0068
                        BREQ      ACV._L0068
                        .BRANCH   20,ACV._L0067
                        JMP       ACV._L0067
ACV._L0068:
ACV._L0066:
                        .BLOCK    505
                        .LINE     505
                        LDS       _ACCA, ACV.IncrEnter
                        TST       _ACCA
                        .BRANCH   4,ACV._L0071
                        BRNE      ACV._L0071
                        .BRANCH   20,ACV._L0069
                        JMP       ACV._L0069
ACV._L0071:
                        .BLOCK    505
                        .LINE     506
                        LDS       _ACCA, ACV.Gain
                        LDI       _ACCCLO, ACV.INITGAIN AND 0FFh
                        LDI       _ACCCHI, ACV.INITGAIN SHRB 8
                        CALL      SYSTEM.WriteEEp8
                        ADIW      _ACCCLO, 01h
                        .ENDBLOCK 507
ACV._L0069:
ACV._L0070:
                        .LINE     508
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
                        .LINE     509
                        LDS       _ACCA, ACV.UpperChannel
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .LINE     510
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
                        .LINE     511
                        LDS       _ACCA, ACV.LowerChannel
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .LINE     512
                        .BRANCH   17,ACV.GETLEVELS
                        CALL      ACV.GETLEVELS
                        .LINE     513
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCA, ACV.LeftLevelByte
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        CALL      SYSTEM.LCDBAROUT1
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     514
                        LDS       _ACCA, ACV.LeftLevelByte
                        CPI       _ACCA, 060h
                        LDI       _ACCA, 0FFh
                        BRLO      ACV._L0072
                        CLR       _ACCA
ACV._L0072:
                        TST       _ACCA
                        .BRANCH   4,ACV._L0075
                        BRNE      ACV._L0075
                        .BRANCH   20,ACV._L0073
                        JMP       ACV._L0073
ACV._L0075:
                        .BLOCK    514
                        .LINE     515
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 006h
                        ST        -Y, _ACCA
                        .FRAME  2
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  3
                        .FRAME  0
                        CALL      SYSTEM.LCDXY_M
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     516
                        LDI       _ACCA, 007h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .ENDBLOCK 517
ACV._L0073:
ACV._L0074:
                        .LINE     518
                        LDS       _ACCA, ACV.LeftLevelByte
                        CPI       _ACCA, 0B4h
                        LDI       _ACCA, 0h
                        BREQ      ACV._L0076
                        BRLO      ACV._L0076
                        SER       _ACCA
ACV._L0076:
                        TST       _ACCA
                        .BRANCH   4,ACV._L0079
                        BRNE      ACV._L0079
                        .BRANCH   20,ACV._L0077
                        JMP       ACV._L0077
ACV._L0079:
                        .BLOCK    518
                        .LINE     519
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
                        .LINE     520
                        LDI       _ACCA, 006h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .ENDBLOCK 521
ACV._L0077:
ACV._L0078:
                        .LINE     522
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCA, ACV.RightLevelByte
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        CALL      SYSTEM.LCDBAROUT2
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     523
                        LDS       _ACCA, ACV.RightLevelByte
                        CPI       _ACCA, 060h
                        LDI       _ACCA, 0FFh
                        BRLO      ACV._L0080
                        CLR       _ACCA
ACV._L0080:
                        TST       _ACCA
                        .BRANCH   4,ACV._L0083
                        BRNE      ACV._L0083
                        .BRANCH   20,ACV._L0081
                        JMP       ACV._L0081
ACV._L0083:
                        .BLOCK    523
                        .LINE     524
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 006h
                        ST        -Y, _ACCA
                        .FRAME  2
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  3
                        .FRAME  0
                        CALL      SYSTEM.LCDXY_M
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     525
                        LDI       _ACCA, 007h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .ENDBLOCK 526
ACV._L0081:
ACV._L0082:
                        .LINE     527
                        LDS       _ACCA, ACV.RightLevelByte
                        CPI       _ACCA, 0B4h
                        LDI       _ACCA, 0h
                        BREQ      ACV._L0084
                        BRLO      ACV._L0084
                        SER       _ACCA
ACV._L0084:
                        TST       _ACCA
                        .BRANCH   4,ACV._L0087
                        BRNE      ACV._L0087
                        .BRANCH   20,ACV._L0085
                        JMP       ACV._L0085
ACV._L0087:
                        .BLOCK    527
                        .LINE     528
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
                        .LINE     529
                        LDI       _ACCA, 006h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .ENDBLOCK 530
ACV._L0085:
ACV._L0086:
                        .ENDBLOCK 531
                        .BRANCH   20,ACV._L0047
                        JMP       ACV._L0047
ACV._L0067:
                        .LINE     532
                        CPI       _ACCA, 2
                        .BRANCH   3,ACV._L0090
                        BREQ      ACV._L0090
                        .BRANCH   20,ACV._L0089
                        JMP       ACV._L0089
ACV._L0090:
ACV._L0088:
                        .BLOCK    533
                        .LINE     533
                        LDS       _ACCA, ACV.IncrEnter
                        TST       _ACCA
                        .BRANCH   4,ACV._L0093
                        BRNE      ACV._L0093
                        .BRANCH   20,ACV._L0091
                        JMP       ACV._L0091
ACV._L0093:
                        .BLOCK    533
                        .LINE     534
                        LDS       _ACCA, ACV.Gain
                        LDI       _ACCCLO, ACV.INITGAIN AND 0FFh
                        LDI       _ACCCHI, ACV.INITGAIN SHRB 8
                        CALL      SYSTEM.WriteEEp8
                        ADIW      _ACCCLO, 01h
                        .ENDBLOCK 535
ACV._L0091:
ACV._L0092:
                        .LINE     536
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
                        .LINE     537
                        LDS       _ACCA, ACV.Gain
                        LDI       _ACCB, 00Ah
                        CALL      SYSTEM.MUL8
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        SUBI      _ACCB, 00014h AND 0FFh
                        SBCI      _ACCA, 00014h SHRB 8
                        STD       Y+002h, _ACCA
                        STD       Y+001h, _ACCB
                        .LINE     538
                        LDI       _ACCCLO, ACV.GainStr AND 0FFh
                        LDI       _ACCCHI, ACV.GainStr SHRB 8
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
                        LDD       _ACCB, Y+004h
                        LDD       _ACCA, Y+005h
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  5
                        LDI       _ACCA, 003h
                        ST        -Y, _ACCA
                        .FRAME  6
                        LDI       _ACCB, 000h
                        ST        -Y, _ACCB
                        LDI       _ACCA, 020h
                        ST        -Y, _ACCA
                        .FRAME  8
                        SET
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.Int2Str
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
                        .LINE     539
                        LDD       _ACCB, Y+001h
                        LDD       _ACCA, Y+002h
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        CPI       _ACCA, 080h
                        BRNE      ACV._L0094
                        CPI       _ACCB, 000h
ACV._L0094:
                        LDI       _ACCA, 0
                        BRLO      ACV._L0095
                        LDI       _ACCA, 0FFh
ACV._L0095:
                        TST       _ACCA
                        .BRANCH   4,ACV._L0098
                        BRNE      ACV._L0098
                        .BRANCH   20,ACV._L0096
                        JMP       ACV._L0096
ACV._L0098:
                        .BLOCK    539
                        .LINE     540
                        LDI       _ACCCLO, ACV.GainStr AND 0FFh
                        LDI       _ACCCHI, ACV.GainStr SHRB 8
                        ADIW      _ACCCLO, 00001h
                        LDI       _ACCA, 02Bh
                        ST        Z+, _ACCA
                        .ENDBLOCK 541
ACV._L0096:
ACV._L0097:
                        .LINE     542
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, ACV.GainStr AND 0FFh
                        LDI       _ACCCHI, ACV.GainStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     543
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, ACV.dBStr AND 0FFh
                        LDI       _ACCCHI, ACV.dBStr SHRB 8
                        CALL      SYSTEM.StrConst2Str
ACV._L0099:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     544
                        LDI       _ACCA, 005h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .LINE     545
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
                        .LINE     546
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, ACV.GainSelStr AND 0FFh
                        LDI       _ACCCHI, ACV.GainSelStr SHRB 8
                        CALL      SYSTEM.StrConst2Str
ACV._L0100:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .ENDBLOCK 547
                        .BRANCH   20,ACV._L0047
                        JMP       ACV._L0047
ACV._L0089:
                        .LINE     548
                        CPI       _ACCA, 0
                        .BRANCH   3,ACV._L0103
                        BREQ      ACV._L0103
                        .BRANCH   20,ACV._L0102
                        JMP       ACV._L0102
ACV._L0103:
ACV._L0101:
                        .BLOCK    549
                        .LINE     549
                        LDS       _ACCA, ACV.IncrEnter
                        TST       _ACCA
                        .BRANCH   4,ACV._L0106
                        BRNE      ACV._L0106
                        .BRANCH   20,ACV._L0104
                        JMP       ACV._L0104
ACV._L0106:
                        .BLOCK    549
                        .LINE     550
                        LDS       _ACCA, ACV.AuxCmd
                        LDI       _ACCCLO, ACV.INITAUXCMD AND 0FFh
                        LDI       _ACCCHI, ACV.INITAUXCMD SHRB 8
                        CALL      SYSTEM.WriteEEp8
                        ADIW      _ACCCLO, 01h
                        .ENDBLOCK 551
ACV._L0104:
ACV._L0105:
                        .LINE     552
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
                        .LINE     553
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, ACV.AuxCmdSelStr AND 0FFh
                        LDI       _ACCCHI, ACV.AuxCmdSelStr SHRB 8
                        CALL      SYSTEM.StrConst2Str
ACV._L0107:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     554
                        LDI       _ACCA, 020h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .LINE     555
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDS       _ACCA, ACV.AuxCmd
                        MOV       _ACCDLO, _ACCA
                        CALL      SYSTEM.Hex2Str8
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     556
                        LDI       _ACCA, 020h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .LINE     557
                        LDI       _ACCA, 005h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .LINE     558
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
                        .LINE     559
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, ACV.AuxCmdStr AND 0FFh
                        LDI       _ACCCHI, ACV.AuxCmdStr SHRB 8
                        CALL      SYSTEM.StrConst2Str
ACV._L0108:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .ENDBLOCK 560
                        .BRANCH   20,ACV._L0047
                        JMP       ACV._L0047
ACV._L0102:
                        .LINE     561
                        CPI       _ACCA, 1
                        .BRANCH   3,ACV._L0111
                        BREQ      ACV._L0111
                        .BRANCH   20,ACV._L0110
                        JMP       ACV._L0110
ACV._L0111:
ACV._L0109:
                        .BLOCK    562
                        .LINE     562
                        LDS       _ACCA, ACV.IncrEnter
                        TST       _ACCA
                        .BRANCH   4,ACV._L0114
                        BRNE      ACV._L0114
                        .BRANCH   20,ACV._L0112
                        JMP       ACV._L0112
ACV._L0114:
                        .BLOCK    562
                        .LINE     563
                        LDS       _ACCA, ACV.SPDIFrate
                        LDI       _ACCCLO, ACV.INITRATE AND 0FFh
                        LDI       _ACCCHI, ACV.INITRATE SHRB 8
                        CALL      SYSTEM.WriteEEp8
                        ADIW      _ACCCLO, 01h
                        .ENDBLOCK 564
ACV._L0112:
ACV._L0113:
                        .LINE     565
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
                        .LINE     566
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, ACV.RateStrArr AND 0FFh
                        LDI       _ACCCHI, ACV.RateStrArr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, ACV.SPDIFrate
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LDI       _ACCBLO, 00008h AND 0FFh
                        LDI       _ACCBHI, 00008h SHRB 8
                        CLT
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.MUL16
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        CALL      SYSTEM.StrConst2Str
ACV._L0115:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     567
                        LDI       _ACCA, 005h
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .LINE     568
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
                        .LINE     569
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, ACV.RateSelStr AND 0FFh
                        LDI       _ACCCHI, ACV.RateSelStr SHRB 8
                        CALL      SYSTEM.StrConst2Str
ACV._L0116:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .ENDBLOCK 570
                        .BRANCH   20,ACV._L0047
                        JMP       ACV._L0047
ACV._L0110:
ACV._L0047:
                        .LINE     572
                        LDS       _ACCA, ACV.IncrEnter
                        TST       _ACCA
                        .BRANCH   4,ACV._L0119
                        BRNE      ACV._L0119
                        .BRANCH   20,ACV._L0117
                        JMP       ACV._L0117
ACV._L0119:
                        .BLOCK    572
                        .LINE     573
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
                        .LINE     574
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, ACV.MemorizedStr AND 0FFh
                        LDI       _ACCCHI, ACV.MemorizedStr SHRB 8
                        CALL      SYSTEM.StrConst2Str
ACV._L0120:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     575
                        LDI       _ACCA, 064h
                        STS       ACV.DisplayTimer, _ACCA
                        .ENDBLOCK 576
ACV._L0117:
ACV._L0118:
                        .LINE     577
                        LDI       _ACCA, 000h
                        STS       ACV.INCRENTER, _ACCA
                        .ENDBLOCK 578
ACV.SollWerteOnLCD_X:
                        .LINE     578
                        .BRANCH   19
                        RET
                        .ENDFUNC  578

                        .FUNC     Checklimits, 00244h, 00020h
ACV.Checklimits:
                        .RETURNS   1
                        SBIW      _FRAMEPTR, 1
                        .BLOCK    583
                        .LINE     584
                        LDI       _ACCA, 000h
                        STD       Y+000h, _ACCA
                        .LINE     585
                        LDS       _ACCA, ACV.Gain
                        CPI       _ACCA, 07Fh
                        LDI       _ACCA, 0h
                        BREQ      ACV._L0121
                        BRLO      ACV._L0121
                        SER       _ACCA
ACV._L0121:
                        TST       _ACCA
                        .BRANCH   4,ACV._L0124
                        BRNE      ACV._L0124
                        .BRANCH   20,ACV._L0122
                        JMP       ACV._L0122
ACV._L0124:
                        .BLOCK    586
                        .LINE     586
                        LDI       _ACCA, 000h
                        STS       ACV.GAIN, _ACCA
                        .LINE     587
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 588
ACV._L0122:
ACV._L0123:
                        .LINE     589
                        LDS       _ACCA, ACV.Gain
                        CPI       _ACCA, 007h
                        LDI       _ACCA, 0h
                        BREQ      ACV._L0125
                        BRLO      ACV._L0125
                        SER       _ACCA
ACV._L0125:
                        TST       _ACCA
                        .BRANCH   4,ACV._L0128
                        BRNE      ACV._L0128
                        .BRANCH   20,ACV._L0126
                        JMP       ACV._L0126
ACV._L0128:
                        .BLOCK    590
                        .LINE     590
                        LDI       _ACCA, 007h
                        STS       ACV.GAIN, _ACCA
                        .LINE     591
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 592
ACV._L0126:
ACV._L0127:
                        .LINE     593
                        LDS       _ACCA, ACV.SPDIFrate
                        CPI       _ACCA, 07Fh
                        LDI       _ACCA, 0h
                        BREQ      ACV._L0129
                        BRLO      ACV._L0129
                        SER       _ACCA
ACV._L0129:
                        TST       _ACCA
                        .BRANCH   4,ACV._L0132
                        BRNE      ACV._L0132
                        .BRANCH   20,ACV._L0130
                        JMP       ACV._L0130
ACV._L0132:
                        .BLOCK    594
                        .LINE     594
                        LDI       _ACCA, 000h
                        STS       ACV.SPDIFRATE, _ACCA
                        .LINE     595
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 596
ACV._L0130:
ACV._L0131:
                        .LINE     597
                        LDS       _ACCA, ACV.SPDIFrate
                        CPI       _ACCA, 005h
                        LDI       _ACCA, 0h
                        BREQ      ACV._L0133
                        BRLO      ACV._L0133
                        SER       _ACCA
ACV._L0133:
                        TST       _ACCA
                        .BRANCH   4,ACV._L0136
                        BRNE      ACV._L0136
                        .BRANCH   20,ACV._L0134
                        JMP       ACV._L0134
ACV._L0136:
                        .BLOCK    598
                        .LINE     598
                        LDI       _ACCA, 005h
                        STS       ACV.SPDIFRATE, _ACCA
                        .LINE     599
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 600
ACV._L0134:
ACV._L0135:
                        .LINE     601
                        LDD       _ACCA, Y+000h
                        .ENDBLOCK 602
ACV.Checklimits_X:
                        .LINE     602
                        .BRANCH   19
                        RET
                        .ENDFUNC  602

                        .FUNC     ParseGetParam, 00260h, 00020h
ACV.ParseGetParam:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 1
                        .BLOCK    610
                        .LINE     611
                        LDS       _ACCA, ACV.SubCh
                        LDI       _ACCB, 00Ah
                        CALL      SYSTEM.DIV8_R
                        MOV       _ACCA, _ACCB
                        STD       Y+000h, _ACCA
                        .LINE     612
                        LDI       _ACCA, 002h
                        STS       ACV.DIGITS, _ACCA
                        .LINE     613
                        LDI       _ACCA, 001h
                        STS       ACV.NACHKOMMA, _ACCA
                        .LINE     614
                        LDS       _ACCA, ACV.SubCh
                        .LINE     615
                        CPI       _ACCA, 8
                        .BRANCH   3,ACV._L0140
                        BREQ      ACV._L0140
                        .BRANCH   20,ACV._L0139
                        JMP       ACV._L0139
ACV._L0140:
ACV._L0138:
                        .BLOCK    616
                        .LINE     616
                        LDS       _ACCA, ACV.SPDIFrate
                        STS       ACV.PARAMBYTE, _ACCA
                        .LINE     617
                        .BRANCH   17,ACV.WRITEPARAMBYTESER
                        CALL      ACV.WRITEPARAMBYTESER
                        .LINE     618
                        .BRANCH   20,ACV.ParseGetParam_X
                        JMP       ACV.ParseGetParam_X
                        .ENDBLOCK 619
                        .BRANCH   20,ACV._L0137
                        JMP       ACV._L0137
ACV._L0139:
                        .LINE     620
                        CPI       _ACCA, 10
                        .BRANCH   3,ACV._L0143
                        BREQ      ACV._L0143
                        .BRANCH   20,ACV._L0142
                        JMP       ACV._L0142
ACV._L0143:
ACV._L0141:
                        .BLOCK    621
                        .LINE     621
                        .BRANCH   17,ACV.GETLEVELS
                        CALL      ACV.GETLEVELS
                        .LINE     622
                        LDS       _ACCB, ACV.LeftLevelScaled
                        LDS       _ACCA, ACV.LeftLevelScaled+1
                        STS       ACV.PARAMINT, _ACCB
                        STS       ACV.PARAMINT+1, _ACCA
                        .LINE     623
                        LDS       _ACCA, ACV.LeftOverload
                        TST       _ACCA
                        .BRANCH   4,ACV._L0146
                        BRNE      ACV._L0146
                        .BRANCH   20,ACV._L0144
                        JMP       ACV._L0144
ACV._L0146:
                        .BLOCK    623
                        .LINE     624
                        LDI       _ACCCLO, ACV.ParamStr AND 0FFh
                        LDI       _ACCCHI, ACV.ParamStr SHRB 8
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
ACV._L0147:
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
                        .ENDBLOCK 625
                        .BRANCH   20,ACV._L0145
                        JMP       ACV._L0145
ACV._L0144:
                        .BLOCK    625
                        .LINE     626
                        .BRANCH   17,ACV.PARAMTOSTRSCALED
                        CALL      ACV.PARAMTOSTRSCALED
                        .ENDBLOCK 627
ACV._L0145:
                        .LINE     628
                        .BRANCH   17,ACV.WRITEPARAMSTRSER
                        CALL      ACV.WRITEPARAMSTRSER
                        .LINE     629
                        .BRANCH   20,ACV.ParseGetParam_X
                        JMP       ACV.ParseGetParam_X
                        .ENDBLOCK 630
                        .BRANCH   20,ACV._L0137
                        JMP       ACV._L0137
ACV._L0142:
                        .LINE     631
                        CPI       _ACCA, 11
                        .BRANCH   3,ACV._L0150
                        BREQ      ACV._L0150
                        .BRANCH   20,ACV._L0149
                        JMP       ACV._L0149
ACV._L0150:
ACV._L0148:
                        .BLOCK    632
                        .LINE     632
                        .BRANCH   17,ACV.GETLEVELS
                        CALL      ACV.GETLEVELS
                        .LINE     633
                        LDS       _ACCB, ACV.RightLevelScaled
                        LDS       _ACCA, ACV.RightLevelScaled+1
                        STS       ACV.PARAMINT, _ACCB
                        STS       ACV.PARAMINT+1, _ACCA
                        .LINE     634
                        LDS       _ACCA, ACV.RightOverload
                        TST       _ACCA
                        .BRANCH   4,ACV._L0153
                        BRNE      ACV._L0153
                        .BRANCH   20,ACV._L0151
                        JMP       ACV._L0151
ACV._L0153:
                        .BLOCK    634
                        .LINE     635
                        LDI       _ACCCLO, ACV.ParamStr AND 0FFh
                        LDI       _ACCCHI, ACV.ParamStr SHRB 8
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
ACV._L0154:
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
                        .ENDBLOCK 636
                        .BRANCH   20,ACV._L0152
                        JMP       ACV._L0152
ACV._L0151:
                        .BLOCK    636
                        .LINE     637
                        .BRANCH   17,ACV.PARAMTOSTRSCALED
                        CALL      ACV.PARAMTOSTRSCALED
                        .ENDBLOCK 638
ACV._L0152:
                        .LINE     639
                        .BRANCH   17,ACV.WRITEPARAMSTRSER
                        CALL      ACV.WRITEPARAMSTRSER
                        .LINE     640
                        .BRANCH   20,ACV.ParseGetParam_X
                        JMP       ACV.ParseGetParam_X
                        .ENDBLOCK 641
                        .BRANCH   20,ACV._L0137
                        JMP       ACV._L0137
ACV._L0149:
                        .LINE     642
                        CPI       _ACCA, 19
                        .BRANCH   3,ACV._L0157
                        BREQ      ACV._L0157
                        .BRANCH   20,ACV._L0156
                        JMP       ACV._L0156
ACV._L0157:
ACV._L0155:
                        .BLOCK    643
                        .LINE     643
                        LDS       _ACCA, ACV.Gain
                        STS       ACV.PARAMBYTE, _ACCA
                        .LINE     644
                        .BRANCH   17,ACV.WRITEPARAMBYTESER
                        CALL      ACV.WRITEPARAMBYTESER
                        .LINE     645
                        .BRANCH   20,ACV.ParseGetParam_X
                        JMP       ACV.ParseGetParam_X
                        .ENDBLOCK 646
                        .BRANCH   20,ACV._L0137
                        JMP       ACV._L0137
ACV._L0156:
                        .LINE     647
                        CPI       _ACCA, 50
                        .BRANCH   3,ACV._L0160
                        BREQ      ACV._L0160
                        .BRANCH   20,ACV._L0159
                        JMP       ACV._L0159
ACV._L0160:
ACV._L0158:
                        .BLOCK    648
                        .LINE     648
                        .BRANCH   17,ACV.GETLEVELS
                        CALL      ACV.GETLEVELS
                        .LINE     649
                        LDS       _ACCB, ACV.LeftLevel
                        LDS       _ACCA, ACV.LeftLevel+1
                        STS       ACV.PARAMINT, _ACCB
                        STS       ACV.PARAMINT+1, _ACCA
                        .ENDBLOCK 650
                        .BRANCH   20,ACV._L0137
                        JMP       ACV._L0137
ACV._L0159:
                        .LINE     651
                        CPI       _ACCA, 51
                        .BRANCH   3,ACV._L0163
                        BREQ      ACV._L0163
                        .BRANCH   20,ACV._L0162
                        JMP       ACV._L0162
ACV._L0163:
ACV._L0161:
                        .BLOCK    652
                        .LINE     652
                        .BRANCH   17,ACV.GETLEVELS
                        CALL      ACV.GETLEVELS
                        .LINE     653
                        LDS       _ACCB, ACV.RightLevel
                        LDS       _ACCA, ACV.RightLevel+1
                        STS       ACV.PARAMINT, _ACCB
                        STS       ACV.PARAMINT+1, _ACCA
                        .ENDBLOCK 654
                        .BRANCH   20,ACV._L0137
                        JMP       ACV._L0137
ACV._L0162:
                        .LINE     655
                        CPI       _ACCA, 80
                        .BRANCH   3,ACV._L0166
                        BREQ      ACV._L0166
                        .BRANCH   20,ACV._L0165
                        JMP       ACV._L0165
ACV._L0166:
ACV._L0164:
                        .BLOCK    656
                        .LINE     656
                        LDS       _ACCA, ACV.Modify
                        STS       ACV.PARAMBYTE, _ACCA
                        .LINE     657
                        .BRANCH   17,ACV.WRITEPARAMBYTESER
                        CALL      ACV.WRITEPARAMBYTESER
                        .LINE     658
                        .BRANCH   20,ACV.ParseGetParam_X
                        JMP       ACV.ParseGetParam_X
                        .ENDBLOCK 659
                        .BRANCH   20,ACV._L0137
                        JMP       ACV._L0137
ACV._L0165:
                        .LINE     660
                        CPI       _ACCA, 89
                        .BRANCH   3,ACV._L0169
                        BREQ      ACV._L0169
                        .BRANCH   20,ACV._L0168
                        JMP       ACV._L0168
ACV._L0169:
ACV._L0167:
                        .BLOCK    661
                        .LINE     661
                        LDS       _ACCB, ACV.IncRast
                        LDS       _ACCA, ACV.IncRast+1
                        MOV       _ACCA, _ACCB
                        STS       ACV.PARAMBYTE, _ACCA
                        .LINE     662
                        .BRANCH   17,ACV.WRITEPARAMBYTESER
                        CALL      ACV.WRITEPARAMBYTESER
                        .LINE     663
                        .BRANCH   20,ACV.ParseGetParam_X
                        JMP       ACV.ParseGetParam_X
                        .ENDBLOCK 664
                        .BRANCH   20,ACV._L0137
                        JMP       ACV._L0137
ACV._L0168:
                        .LINE     665
                        CPI       _ACCA, 99
                        .BRANCH   3,ACV._L0172
                        BREQ      ACV._L0172
                        .BRANCH   20,ACV._L0171
                        JMP       ACV._L0171
ACV._L0172:
ACV._L0170:
                        .BLOCK    666
                        .LINE     666
                        .BRANCH   17,ACV.GETLEVELS
                        CALL      ACV.GETLEVELS
                        .LINE     667
                        LDS       _ACCB, ACV.LeftLevelScaled
                        LDS       _ACCA, ACV.LeftLevelScaled+1
                        STS       ACV.PARAMINT, _ACCB
                        STS       ACV.PARAMINT+1, _ACCA
                        .LINE     668
                        LDS       _ACCA, ACV.LeftLevelByte
                        CPI       _ACCA, 0FDh
                        LDI       _ACCA, 0h
                        BREQ      ACV._L0173
                        BRLO      ACV._L0173
                        SER       _ACCA
ACV._L0173:
                        TST       _ACCA
                        .BRANCH   4,ACV._L0176
                        BRNE      ACV._L0176
                        .BRANCH   20,ACV._L0174
                        JMP       ACV._L0174
ACV._L0176:
                        .BLOCK    668
                        .LINE     669
                        LDI       _ACCCLO, ACV.ParamStr AND 0FFh
                        LDI       _ACCCHI, ACV.ParamStr SHRB 8
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
ACV._L0177:
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
                        .ENDBLOCK 670
                        .BRANCH   20,ACV._L0175
                        JMP       ACV._L0175
ACV._L0174:
                        .BLOCK    670
                        .LINE     671
                        .BRANCH   17,ACV.PARAMTOSTRSCALED
                        CALL      ACV.PARAMTOSTRSCALED
                        .ENDBLOCK 672
ACV._L0175:
                        .LINE     673
                        LDI       _ACCA, 00Ah
                        STS       ACV.SUBCH, _ACCA
                        .LINE     674
                        .BRANCH   17,ACV.WRITEPARAMSTRSER
                        CALL      ACV.WRITEPARAMSTRSER
                        .LINE     676
                        LDS       _ACCB, ACV.RightLevelScaled
                        LDS       _ACCA, ACV.RightLevelScaled+1
                        STS       ACV.PARAMINT, _ACCB
                        STS       ACV.PARAMINT+1, _ACCA
                        .LINE     677
                        LDS       _ACCA, ACV.RightLevelByte
                        CPI       _ACCA, 0FDh
                        LDI       _ACCA, 0h
                        BREQ      ACV._L0178
                        BRLO      ACV._L0178
                        SER       _ACCA
ACV._L0178:
                        TST       _ACCA
                        .BRANCH   4,ACV._L0181
                        BRNE      ACV._L0181
                        .BRANCH   20,ACV._L0179
                        JMP       ACV._L0179
ACV._L0181:
                        .BLOCK    677
                        .LINE     678
                        LDI       _ACCCLO, ACV.ParamStr AND 0FFh
                        LDI       _ACCCHI, ACV.ParamStr SHRB 8
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
ACV._L0182:
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
                        .ENDBLOCK 679
                        .BRANCH   20,ACV._L0180
                        JMP       ACV._L0180
ACV._L0179:
                        .BLOCK    679
                        .LINE     680
                        .BRANCH   17,ACV.PARAMTOSTRSCALED
                        CALL      ACV.PARAMTOSTRSCALED
                        .ENDBLOCK 681
ACV._L0180:
                        .LINE     682
                        LDI       _ACCA, 00Bh
                        STS       ACV.SUBCH, _ACCA
                        .LINE     683
                        .BRANCH   17,ACV.WRITEPARAMSTRSER
                        CALL      ACV.WRITEPARAMSTRSER
                        .LINE     684
                        .BRANCH   20,ACV.ParseGetParam_X
                        JMP       ACV.ParseGetParam_X
                        .ENDBLOCK 685
                        .BRANCH   20,ACV._L0137
                        JMP       ACV._L0137
ACV._L0171:
                        .LINE     686
                        CPI       _ACCA, 150
                        .BRANCH   3,ACV._L0185
                        BREQ      ACV._L0185
                        .BRANCH   20,ACV._L0184
                        JMP       ACV._L0184
ACV._L0185:
ACV._L0183:
                        .BLOCK    687
                        .LINE     687
                        LDI       _ACCCLO, ACV.InitGain AND 0FFh
                        LDI       _ACCCHI, ACV.InitGain SHRB 8
                        CALL      SYSTEM.ReadEEp8
                        STS       ACV.PARAMBYTE, _ACCA
                        .LINE     688
                        .BRANCH   17,ACV.WRITEPARAMBYTESER
                        CALL      ACV.WRITEPARAMBYTESER
                        .LINE     689
                        .BRANCH   20,ACV.ParseGetParam_X
                        JMP       ACV.ParseGetParam_X
                        .ENDBLOCK 690
                        .BRANCH   20,ACV._L0137
                        JMP       ACV._L0137
ACV._L0184:
                        .LINE     691
                        CPI       _ACCA, 151
                        .BRANCH   3,ACV._L0188
                        BREQ      ACV._L0188
                        .BRANCH   20,ACV._L0187
                        JMP       ACV._L0187
ACV._L0188:
ACV._L0186:
                        .BLOCK    692
                        .LINE     692
                        LDI       _ACCCLO, ACV.InitRate AND 0FFh
                        LDI       _ACCCHI, ACV.InitRate SHRB 8
                        CALL      SYSTEM.ReadEEp8
                        STS       ACV.PARAMBYTE, _ACCA
                        .LINE     693
                        .BRANCH   17,ACV.WRITEPARAMBYTESER
                        CALL      ACV.WRITEPARAMBYTESER
                        .LINE     694
                        .BRANCH   20,ACV.ParseGetParam_X
                        JMP       ACV.ParseGetParam_X
                        .ENDBLOCK 695
                        .BRANCH   20,ACV._L0137
                        JMP       ACV._L0137
ACV._L0187:
                        .LINE     696
                        CPI       _ACCA, 152
                        .BRANCH   3,ACV._L0191
                        BREQ      ACV._L0191
                        .BRANCH   20,ACV._L0190
                        JMP       ACV._L0190
ACV._L0191:
ACV._L0189:
                        .BLOCK    697
                        .LINE     697
                        LDI       _ACCCLO, ACV.InitLRswap AND 0FFh
                        LDI       _ACCCHI, ACV.InitLRswap SHRB 8
                        CALL      SYSTEM.ReadEEp8
                        STS       ACV.PARAMBYTE, _ACCA
                        .LINE     698
                        .BRANCH   17,ACV.WRITEPARAMBYTESER
                        CALL      ACV.WRITEPARAMBYTESER
                        .LINE     699
                        .BRANCH   20,ACV.ParseGetParam_X
                        JMP       ACV.ParseGetParam_X
                        .ENDBLOCK 700
                        .BRANCH   20,ACV._L0137
                        JMP       ACV._L0137
ACV._L0190:
                        .LINE     701
                        CPI       _ACCA, 200
                        .BRANCH   2,ACV._L0194
                        BRCC      ACV._L0194
                        .BRANCH   20,ACV._L0193
                        JMP       ACV._L0193
ACV._L0194:
                        CPI       _ACCA, 207
                        .BRANCH   3,ACV._L0195
                        BREQ      ACV._L0195
                        .BRANCH   1,ACV._L0193
                        BRCS      ACV._L0195
                        .BRANCH   20,ACV._L0193
                        JMP       ACV._L0193
ACV._L0195:
ACV._L0192:
                        .BLOCK    702
                        .LINE     702
                        LDI       _ACCCLO, ACV.ADCscalesL AND 0FFh
                        LDI       _ACCCHI, ACV.ADCscalesL SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCA, Y+000h
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        CALL      SYSTEM._ReadEEp16
                        STS       ACV.PARAMINT, _ACCB
                        STS       ACV.PARAMINT+1, _ACCA
                        .ENDBLOCK 703
                        .BRANCH   20,ACV._L0137
                        JMP       ACV._L0137
ACV._L0193:
                        .LINE     704
                        CPI       _ACCA, 210
                        .BRANCH   2,ACV._L0198
                        BRCC      ACV._L0198
                        .BRANCH   20,ACV._L0197
                        JMP       ACV._L0197
ACV._L0198:
                        CPI       _ACCA, 217
                        .BRANCH   3,ACV._L0199
                        BREQ      ACV._L0199
                        .BRANCH   1,ACV._L0197
                        BRCS      ACV._L0199
                        .BRANCH   20,ACV._L0197
                        JMP       ACV._L0197
ACV._L0199:
ACV._L0196:
                        .BLOCK    705
                        .LINE     705
                        LDI       _ACCCLO, ACV.ADCscalesR AND 0FFh
                        LDI       _ACCCHI, ACV.ADCscalesR SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCA, Y+000h
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        CALL      SYSTEM._ReadEEp16
                        STS       ACV.PARAMINT, _ACCB
                        STS       ACV.PARAMINT+1, _ACCA
                        .ENDBLOCK 706
                        .BRANCH   20,ACV._L0137
                        JMP       ACV._L0137
ACV._L0197:
                        .LINE     707
                        CPI       _ACCA, 230
                        .BRANCH   3,ACV._L0202
                        BREQ      ACV._L0202
                        .BRANCH   20,ACV._L0201
                        JMP       ACV._L0201
ACV._L0202:
ACV._L0200:
                        .BLOCK    708
                        .LINE     708
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 07Fh
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,ACV.I2CINADR10
                        CALL       ACV.I2CINADR10
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        STS       ACV.PARAMBYTE, _ACCA
                        .LINE     709
                        .BRANCH   17,ACV.WRITEPARAMBYTESER
                        CALL      ACV.WRITEPARAMBYTESER
                        .LINE     710
                        .BRANCH   20,ACV.ParseGetParam_X
                        JMP       ACV.ParseGetParam_X
                        .ENDBLOCK 711
                        .BRANCH   20,ACV._L0137
                        JMP       ACV._L0137
ACV._L0201:
                        .LINE     712
                        CPI       _ACCA, 251
                        .BRANCH   3,ACV._L0205
                        BREQ      ACV._L0205
                        .BRANCH   20,ACV._L0204
                        JMP       ACV._L0204
ACV._L0205:
ACV._L0203:
                        .BLOCK    713
                        .LINE     713
                        LDS       _ACCB, ACV.Errcount
                        LDS       _ACCA, ACV.Errcount+1
                        STS       ACV.PARAMINT, _ACCB
                        STS       ACV.PARAMINT+1, _ACCA
                        .ENDBLOCK 714
                        .BRANCH   20,ACV._L0137
                        JMP       ACV._L0137
ACV._L0204:
                        .LINE     715
                        CPI       _ACCA, 252
                        .BRANCH   3,ACV._L0208
                        BREQ      ACV._L0208
                        .BRANCH   20,ACV._L0207
                        JMP       ACV._L0207
ACV._L0208:
ACV._L0206:
                        .BLOCK    716
                        .LINE     716
                        LDI       _ACCCLO, ACV.EESerBaudReg AND 0FFh
                        LDI       _ACCCHI, ACV.EESerBaudReg SHRB 8
                        CALL      SYSTEM.ReadEEp8
                        STS       ACV.PARAMBYTE, _ACCA
                        .LINE     717
                        .BRANCH   17,ACV.WRITEPARAMBYTESER
                        CALL      ACV.WRITEPARAMBYTESER
                        .LINE     718
                        .BRANCH   20,ACV.ParseGetParam_X
                        JMP       ACV.ParseGetParam_X
                        .ENDBLOCK 719
                        .BRANCH   20,ACV._L0137
                        JMP       ACV._L0137
ACV._L0207:
                        .LINE     720
                        CPI       _ACCA, 253
                        .BRANCH   3,ACV._L0211
                        BREQ      ACV._L0211
                        .BRANCH   20,ACV._L0210
                        JMP       ACV._L0210
ACV._L0211:
ACV._L0209:
                        .BLOCK    721
                        .LINE     721
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.Serout SHRB 1
                        LDI       _ACCA, SYSTEM.Serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, ACV.SerInpStr AND 0FFh
                        LDI       _ACCCHI, ACV.SerInpStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     722
                        .BRANCH   17,ACV.SERCRLF
                        CALL      ACV.SERCRLF
                        .LINE     723
                        .BRANCH   20,ACV.ParseGetParam_X
                        JMP       ACV.ParseGetParam_X
                        .ENDBLOCK 724
                        .BRANCH   20,ACV._L0137
                        JMP       ACV._L0137
ACV._L0210:
                        .LINE     725
                        CPI       _ACCA, 254
                        .BRANCH   3,ACV._L0214
                        BREQ      ACV._L0214
                        .BRANCH   20,ACV._L0213
                        JMP       ACV._L0213
ACV._L0214:
ACV._L0212:
                        .BLOCK    726
                        .LINE     726
                        .BRANCH   17,ACV.WRITECHPREFIX
                        CALL      ACV.WRITECHPREFIX
                        .LINE     727
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.serout SHRB 1
                        LDI       _ACCA, SYSTEM.serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, ACV.Vers1Str AND 0FFh
                        LDI       _ACCCHI, ACV.Vers1Str SHRB 8
                        CALL      SYSTEM.StrConst2Str
ACV._L0215:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     728
                        .BRANCH   17,ACV.SERCRLF
                        CALL      ACV.SERCRLF
                        .LINE     729
                        .BRANCH   20,ACV.ParseGetParam_X
                        JMP       ACV.ParseGetParam_X
                        .ENDBLOCK 730
                        .BRANCH   20,ACV._L0137
                        JMP       ACV._L0137
ACV._L0213:
                        .LINE     731
                        CPI       _ACCA, 250
                        .BRANCH   3,ACV._L0218
                        BREQ      ACV._L0218
                        .BRANCH   20,ACV._L0217
                        JMP       ACV._L0217
ACV._L0218:
                        .BRANCH   20,ACV._L0216
                        JMP       ACV._L0216
ACV._L0217:
                        CPI       _ACCA, 255
                        .BRANCH   3,ACV._L0220
                        BREQ      ACV._L0220
                        .BRANCH   20,ACV._L0219
                        JMP       ACV._L0219
ACV._L0220:
ACV._L0216:
                        .BLOCK    732
                        .LINE     732
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDS       _ACCA, ACV.Status
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ACV.SERPROMPT
                        CALL      ACV.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     733
                        .BRANCH   20,ACV.ParseGetParam_X
                        JMP       ACV.ParseGetParam_X
                        .ENDBLOCK 734
                        .BRANCH   20,ACV._L0137
                        JMP       ACV._L0137
ACV._L0219:
                        .BLOCK    735
                        .LINE     736
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 005h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ACV.SERPROMPT
                        CALL      ACV.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     737
                        .BRANCH   20,ACV.ParseGetParam_X
                        JMP       ACV.ParseGetParam_X
                        .ENDBLOCK 738
ACV._L0137:
                        .LINE     739
                        .BRANCH   17,ACV.WRITEPARAMSER
                        CALL      ACV.WRITEPARAMSER
                        .ENDBLOCK 740
ACV.ParseGetParam_X:
                        .LINE     740
                        .BRANCH   19
                        RET
                        .ENDFUNC  740

                        .FUNC     ParseSetParam, 002E6h, 00020h
ACV.ParseSetParam:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 1
                        .BLOCK    744
                        .LINE     745
                        LDS       _ACCA, ACV.SubCh
                        LDI       _ACCB, 00Ah
                        CALL      SYSTEM.DIV8_R
                        MOV       _ACCA, _ACCB
                        STD       Y+000h, _ACCA
                        .LINE     746
                        LDS       _ACCB, 0024Fh
                        CLR       _ACCA
                        SBRC      _ACCB, 007h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,ACV._L0223
                        BRNE      ACV._L0223
                        .BRANCH   20,ACV._L0221
                        JMP       ACV._L0221
ACV._L0223:
                        .BLOCK    746
                        .LINE     747
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 002h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ACV.SERPROMPT
                        CALL      ACV.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     748
                        .BRANCH   20,ACV.ParseSetParam_X
                        JMP       ACV.ParseSetParam_X
                        .ENDBLOCK 749
ACV._L0221:
ACV._L0222:
                        .LINE     750
                        LDI       _ACCA, 0FFh
                        STS       ACV.CHANGEDFLAG, _ACCA
                        .LINE     751
                        LDS       _ACCA, ACV.SubCh
                        .LINE     752
                        CPI       _ACCA, 8
                        .BRANCH   3,ACV._L0227
                        BREQ      ACV._L0227
                        .BRANCH   20,ACV._L0226
                        JMP       ACV._L0226
ACV._L0227:
ACV._L0225:
                        .BLOCK    753
                        .LINE     753
                        LDS       _ACCA, ACV.ParamByte
                        STS       ACV.SPDIFRATE, _ACCA
                        .LINE     754
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,ACV.CHECKLIMITS
                        CALL       ACV.CHECKLIMITS
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     755
                        .BRANCH   17,ACV.INITSPDIF
                        CALL      ACV.INITSPDIF
                        .ENDBLOCK 756
                        .BRANCH   20,ACV._L0224
                        JMP       ACV._L0224
ACV._L0226:
                        .LINE     757
                        CPI       _ACCA, 9
                        .BRANCH   3,ACV._L0230
                        BREQ      ACV._L0230
                        .BRANCH   20,ACV._L0229
                        JMP       ACV._L0229
ACV._L0230:
ACV._L0228:
                        .BLOCK    758
                        .LINE     758
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCA, ACV.ParamByte
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,ACV.SERAUX
                        CALL      ACV.SERAUX
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 759
                        .BRANCH   20,ACV._L0224
                        JMP       ACV._L0224
ACV._L0229:
                        .LINE     760
                        CPI       _ACCA, 19
                        .BRANCH   3,ACV._L0233
                        BREQ      ACV._L0233
                        .BRANCH   20,ACV._L0232
                        JMP       ACV._L0232
ACV._L0233:
ACV._L0231:
                        .BLOCK    761
                        .LINE     761
                        LDS       _ACCA, ACV.ParamByte
                        STS       ACV.GAIN, _ACCA
                        .LINE     762
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,ACV.CHECKLIMITS
                        CALL       ACV.CHECKLIMITS
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 763
                        .BRANCH   20,ACV._L0224
                        JMP       ACV._L0224
ACV._L0232:
                        .LINE     764
                        CPI       _ACCA, 20
                        .BRANCH   3,ACV._L0236
                        BREQ      ACV._L0236
                        .BRANCH   20,ACV._L0235
                        JMP       ACV._L0235
ACV._L0236:
ACV._L0234:
                        .BRANCH   20,ACV._L0224
                        JMP       ACV._L0224
ACV._L0235:
                        .LINE     766
                        CPI       _ACCA, 80
                        .BRANCH   3,ACV._L0239
                        BREQ      ACV._L0239
                        .BRANCH   20,ACV._L0238
                        JMP       ACV._L0238
ACV._L0239:
ACV._L0237:
                        .BLOCK    767
                        .LINE     767
                        LDS       _ACCA, ACV.ParamByte
                        CPI       _ACCA, 003h
                        LDI       _ACCA, 0h
                        BREQ      ACV._L0240
                        BRLO      ACV._L0240
                        SER       _ACCA
ACV._L0240:
                        TST       _ACCA
                        .BRANCH   4,ACV._L0243
                        BRNE      ACV._L0243
                        .BRANCH   20,ACV._L0241
                        JMP       ACV._L0241
ACV._L0243:
                        .BLOCK    767
                        .LINE     768
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 005h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ACV.SERPROMPT
                        CALL      ACV.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     769
                        .BRANCH   20,ACV.ParseSetParam_X
                        JMP       ACV.ParseSetParam_X
                        .ENDBLOCK 770
ACV._L0241:
ACV._L0242:
                        .LINE     771
                        LDS       _ACCA, ACV.ParamByte
                        STS       ACV.MODIFY, _ACCA
                        .ENDBLOCK 772
                        .BRANCH   20,ACV._L0224
                        JMP       ACV._L0224
ACV._L0238:
                        .LINE     773
                        CPI       _ACCA, 89
                        .BRANCH   3,ACV._L0246
                        BREQ      ACV._L0246
                        .BRANCH   20,ACV._L0245
                        JMP       ACV._L0245
ACV._L0246:
ACV._L0244:
                        .BLOCK    774
                        .LINE     774
                        LDS       _ACCB, 0024Fh
                        CLR       _ACCA
                        SBRC      _ACCB, 004h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,ACV._L0249
                        BRNE      ACV._L0249
                        .BRANCH   20,ACV._L0247
                        JMP       ACV._L0247
ACV._L0249:
                        .BLOCK    774
                        .LINE     775
                        LDS       _ACCB, ACV.ParamInt
                        LDS       _ACCA, ACV.ParamInt+1
                        STS       ACV.INCRAST, _ACCB
                        STS       ACV.INCRAST+1, _ACCA
                        .LINE     776
                        LDS       _ACCB, ACV.IncRast
                        LDS       _ACCA, ACV.IncRast+1
                        LDI       _ACCCLO, ACV.INITINCRAST AND 0FFh
                        LDI       _ACCCHI, ACV.INITINCRAST SHRB 8
                        MOVW      _ACCALO, _ACCB
                        CALL      SYSTEM._WriteEEp16
                        ADIW      _ACCCLO, 01h
                        .ENDBLOCK 777
                        .BRANCH   20,ACV._L0248
                        JMP       ACV._L0248
ACV._L0247:
                        .BLOCK    777
                        .LINE     778
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 006h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ACV.SERPROMPT
                        CALL      ACV.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     779
                        .BRANCH   20,ACV.ParseSetParam_X
                        JMP       ACV.ParseSetParam_X
                        .ENDBLOCK 780
ACV._L0248:
                        .ENDBLOCK 781
                        .BRANCH   20,ACV._L0224
                        JMP       ACV._L0224
ACV._L0245:
                        .LINE     782
                        CPI       _ACCA, 150
                        .BRANCH   2,ACV._L0252
                        BRCC      ACV._L0252
                        .BRANCH   20,ACV._L0251
                        JMP       ACV._L0251
ACV._L0252:
                        CPI       _ACCA, 152
                        .BRANCH   3,ACV._L0253
                        BREQ      ACV._L0253
                        .BRANCH   1,ACV._L0251
                        BRCS      ACV._L0253
                        .BRANCH   20,ACV._L0251
                        JMP       ACV._L0251
ACV._L0253:
                        .BRANCH   20,ACV._L0250
                        JMP       ACV._L0250
ACV._L0251:
                        CPI       _ACCA, 200
                        .BRANCH   2,ACV._L0255
                        BRCC      ACV._L0255
                        .BRANCH   20,ACV._L0254
                        JMP       ACV._L0254
ACV._L0255:
                        CPI       _ACCA, 217
                        .BRANCH   3,ACV._L0256
                        BREQ      ACV._L0256
                        .BRANCH   1,ACV._L0254
                        BRCS      ACV._L0256
                        .BRANCH   20,ACV._L0254
                        JMP       ACV._L0254
ACV._L0256:
ACV._L0250:
                        .BLOCK    783
                        .LINE     783
                        LDS       _ACCB, 0024Fh
                        CLR       _ACCA
                        SBRC      _ACCB, 004h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,ACV._L0259
                        BRNE      ACV._L0259
                        .BRANCH   20,ACV._L0257
                        JMP       ACV._L0257
ACV._L0259:
                        .BLOCK    783
                        .LINE     784
                        LDS       _ACCA, ACV.SubCh
                        .LINE     785
                        CPI       _ACCA, 150
                        .BRANCH   3,ACV._L0263
                        BREQ      ACV._L0263
                        .BRANCH   20,ACV._L0262
                        JMP       ACV._L0262
ACV._L0263:
ACV._L0261:
                        .BLOCK    786
                        .LINE     786
                        LDS       _ACCA, ACV.ParamByte
                        LDI       _ACCCLO, ACV.INITGAIN AND 0FFh
                        LDI       _ACCCHI, ACV.INITGAIN SHRB 8
                        CALL      SYSTEM.WriteEEp8
                        ADIW      _ACCCLO, 01h
                        .ENDBLOCK 787
                        .BRANCH   20,ACV._L0260
                        JMP       ACV._L0260
ACV._L0262:
                        .LINE     788
                        CPI       _ACCA, 151
                        .BRANCH   3,ACV._L0266
                        BREQ      ACV._L0266
                        .BRANCH   20,ACV._L0265
                        JMP       ACV._L0265
ACV._L0266:
ACV._L0264:
                        .BLOCK    789
                        .LINE     789
                        LDS       _ACCA, ACV.ParamByte
                        LDI       _ACCCLO, ACV.INITRATE AND 0FFh
                        LDI       _ACCCHI, ACV.INITRATE SHRB 8
                        CALL      SYSTEM.WriteEEp8
                        ADIW      _ACCCLO, 01h
                        .ENDBLOCK 790
                        .BRANCH   20,ACV._L0260
                        JMP       ACV._L0260
ACV._L0265:
                        .LINE     791
                        CPI       _ACCA, 152
                        .BRANCH   3,ACV._L0269
                        BREQ      ACV._L0269
                        .BRANCH   20,ACV._L0268
                        JMP       ACV._L0268
ACV._L0269:
ACV._L0267:
                        .BLOCK    792
                        .LINE     792
                        LDS       _ACCA, ACV.ParamByte
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      ACV._L0270
                        SER       _ACCA
ACV._L0270:
                        LDI       _ACCCLO, ACV.INITLRSWAP AND 0FFh
                        LDI       _ACCCHI, ACV.INITLRSWAP SHRB 8
                        CALL      SYSTEM.WriteEEp8
                        ADIW      _ACCCLO, 01h
                        .ENDBLOCK 793
                        .BRANCH   20,ACV._L0260
                        JMP       ACV._L0260
ACV._L0268:
                        .LINE     794
                        CPI       _ACCA, 200
                        .BRANCH   2,ACV._L0273
                        BRCC      ACV._L0273
                        .BRANCH   20,ACV._L0272
                        JMP       ACV._L0272
ACV._L0273:
                        CPI       _ACCA, 207
                        .BRANCH   3,ACV._L0274
                        BREQ      ACV._L0274
                        .BRANCH   1,ACV._L0272
                        BRCS      ACV._L0274
                        .BRANCH   20,ACV._L0272
                        JMP       ACV._L0272
ACV._L0274:
ACV._L0271:
                        .BLOCK    795
                        .LINE     795
                        LDI       _ACCCLO, ACV.ADCscalesL AND 0FFh
                        LDI       _ACCCHI, ACV.ADCscalesL SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCA, Y+000h
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LDS       _ACCB, ACV.ParamInt
                        LDS       _ACCA, ACV.ParamInt+1
                        MOVW      _ACCALO, _ACCB
                        CALL      SYSTEM._WriteEEp16
                        .ENDBLOCK 796
                        .BRANCH   20,ACV._L0260
                        JMP       ACV._L0260
ACV._L0272:
                        .LINE     797
                        CPI       _ACCA, 210
                        .BRANCH   2,ACV._L0277
                        BRCC      ACV._L0277
                        .BRANCH   20,ACV._L0276
                        JMP       ACV._L0276
ACV._L0277:
                        CPI       _ACCA, 217
                        .BRANCH   3,ACV._L0278
                        BREQ      ACV._L0278
                        .BRANCH   1,ACV._L0276
                        BRCS      ACV._L0278
                        .BRANCH   20,ACV._L0276
                        JMP       ACV._L0276
ACV._L0278:
ACV._L0275:
                        .BLOCK    798
                        .LINE     798
                        LDI       _ACCCLO, ACV.ADCscalesL AND 0FFh
                        LDI       _ACCCHI, ACV.ADCscalesL SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCA, Y+000h
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LDS       _ACCB, ACV.ParamInt
                        LDS       _ACCA, ACV.ParamInt+1
                        MOVW      _ACCALO, _ACCB
                        CALL      SYSTEM._WriteEEp16
                        .ENDBLOCK 799
                        .BRANCH   20,ACV._L0260
                        JMP       ACV._L0260
ACV._L0276:
ACV._L0260:
                        .ENDBLOCK 801
                        .BRANCH   20,ACV._L0258
                        JMP       ACV._L0258
ACV._L0257:
                        .BLOCK    801
                        .LINE     802
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 006h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ACV.SERPROMPT
                        CALL      ACV.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     803
                        .BRANCH   20,ACV.ParseSetParam_X
                        JMP       ACV.ParseSetParam_X
                        .ENDBLOCK 804
ACV._L0258:
                        .ENDBLOCK 805
                        .BRANCH   20,ACV._L0224
                        JMP       ACV._L0224
ACV._L0254:
                        .LINE     806
                        CPI       _ACCA, 251
                        .BRANCH   3,ACV._L0281
                        BREQ      ACV._L0281
                        .BRANCH   20,ACV._L0280
                        JMP       ACV._L0280
ACV._L0281:
ACV._L0279:
                        .BLOCK    807
                        .LINE     807
                        LDS       _ACCB, ACV.ParamInt
                        LDS       _ACCA, ACV.ParamInt+1
                        STS       ACV.ERRCOUNT, _ACCB
                        STS       ACV.ERRCOUNT+1, _ACCA
                        .ENDBLOCK 808
                        .BRANCH   20,ACV._L0224
                        JMP       ACV._L0224
ACV._L0280:
                        .LINE     809
                        CPI       _ACCA, 252
                        .BRANCH   3,ACV._L0284
                        BREQ      ACV._L0284
                        .BRANCH   20,ACV._L0283
                        JMP       ACV._L0283
ACV._L0284:
ACV._L0282:
                        .BLOCK    810
                        .LINE     810
                        LDS       _ACCB, 0024Fh
                        CLR       _ACCA
                        SBRC      _ACCB, 004h
                        SER       _ACCA
                        TST       _ACCA
                        .BRANCH   4,ACV._L0287
                        BRNE      ACV._L0287
                        .BRANCH   20,ACV._L0285
                        JMP       ACV._L0285
ACV._L0287:
                        .BLOCK    810
                        .LINE     811
                        LDS       _ACCA, ACV.ParamByte
                        LDI       _ACCCLO, ACV.EESERBAUDREG AND 0FFh
                        LDI       _ACCCHI, ACV.EESERBAUDREG SHRB 8
                        CALL      SYSTEM.WriteEEp8
                        ADIW      _ACCCLO, 01h
                        .ENDBLOCK 812
                        .BRANCH   20,ACV._L0286
                        JMP       ACV._L0286
ACV._L0285:
                        .BLOCK    812
                        .LINE     813
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 006h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ACV.SERPROMPT
                        CALL      ACV.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     814
                        .BRANCH   20,ACV.ParseSetParam_X
                        JMP       ACV.ParseSetParam_X
                        .ENDBLOCK 815
ACV._L0286:
                        .ENDBLOCK 816
                        .BRANCH   20,ACV._L0224
                        JMP       ACV._L0224
ACV._L0283:
                        .LINE     817
                        CPI       _ACCA, 250
                        .BRANCH   3,ACV._L0290
                        BREQ      ACV._L0290
                        .BRANCH   20,ACV._L0289
                        JMP       ACV._L0289
ACV._L0290:
ACV._L0288:
                        .BRANCH   20,ACV._L0224
                        JMP       ACV._L0224
ACV._L0289:
                        .BLOCK    819
                        .LINE     820
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 005h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ACV.SERPROMPT
                        CALL      ACV.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     821
                        .BRANCH   20,ACV.ParseSetParam_X
                        JMP       ACV.ParseSetParam_X
                        .ENDBLOCK 822
ACV._L0224:
                        .LINE     823
                        LDS       _ACCA, 0024Fh
                        CBR       _ACCA, 010h
                        STS       0024Fh, _ACCA
                        .LINE     824
                        LDS       _ACCA, ACV.SubCh
                        CPI       _ACCA, 0FAh
                        LDI       _ACCA, 0h
                        BRNE      ACV._L0291
                        SER       _ACCA
ACV._L0291:
                        TST       _ACCA
                        .BRANCH   4,ACV._L0294
                        BRNE      ACV._L0294
                        .BRANCH   20,ACV._L0292
                        JMP       ACV._L0292
ACV._L0294:
                        .BLOCK    825
                        .LINE     825
                        LDS       _ACCA, 0024Fh
                        SBR       _ACCA, 010h
                        STS       0024Fh, _ACCA
                        .ENDBLOCK 826
ACV._L0292:
ACV._L0293:
                        .LINE     828
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,ACV.CHECKLIMITS
                        CALL       ACV.CHECKLIMITS
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        TST       _ACCA
                        .BRANCH   4,ACV._L0297
                        BRNE      ACV._L0297
                        .BRANCH   20,ACV._L0295
                        JMP       ACV._L0295
ACV._L0297:
                        .BLOCK    828
                        .LINE     829
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 005h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDS       _ACCA, ACV.Status
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ACV.SERPROMPT
                        CALL      ACV.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 830
                        .BRANCH   20,ACV._L0296
                        JMP       ACV._L0296
ACV._L0295:
                        .BLOCK    830
                        .LINE     831
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDS       _ACCA, ACV.Status
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ACV.SERPROMPT
                        CALL      ACV.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 832
ACV._L0296:
                        .LINE     833
                        .BRANCH   17,ACV.SWITCHGAIN
                        CALL      ACV.SWITCHGAIN
                        .ENDBLOCK 834
ACV.ParseSetParam_X:
                        .LINE     834
                        .BRANCH   19
                        RET
                        .ENDFUNC  834

                        .FUNC     Cmd2Index, 00348h, 00020h
ACV.Cmd2Index:
                        .RETURNS   1
                        SBIW      _FRAMEPTR, 1
                        .BLOCK    843
                        .LINE     844
                        LDI       _ACCCLO, ACV.ParamStr AND 0FFh
                        LDI       _ACCCHI, ACV.ParamStr SHRB 8
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
                        LDI       _ACCCLO, ACV.ParamStr AND 0FFh
                        LDI       _ACCCHI, ACV.ParamStr SHRB 8
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
                        .LINE     845
                        .LOOP
                        MOVW      _ACCCLO, _FRAMEPTR
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 000h
                        ST        Z, _ACCA
                        LDI       _ACCA, 010h
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
ACV._L0300:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      ACV._L0301
                        CLR       _ACCA
ACV._L0301:
                        TST       _ACCA
                        .BRANCH   3,ACV._L0302
                        BREQ      ACV._L0302
                        .BRANCH   20,ACV._L0299
                        JMP       ACV._L0299
ACV._L0302:
                        .BLOCK    846
                        .LINE     846
                        LDI       _ACCCLO, ACV.ParamStr AND 0FFh
                        LDI       _ACCCHI, ACV.ParamStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCCLO, ACV.CmdStrArr AND 0FFh
                        LDI       _ACCCHI, ACV.CmdStrArr SHRB 8
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
                        BRNE      ACV._L0303
                        SER       _ACCA
ACV._L0303:
                        TST       _ACCA
                        .BRANCH   4,ACV._L0306
                        BRNE      ACV._L0306
                        .BRANCH   20,ACV._L0304
                        JMP       ACV._L0304
ACV._L0306:
                        .BLOCK    846
                        .LINE     847
                        LDD       _ACCA, Y+003h
                        ADIW      _FRAMEPTR, 3
                        .BRANCH   20,ACV.Cmd2Index_X
                        JMP       ACV.Cmd2Index_X
                        .ENDBLOCK 848
ACV._L0304:
ACV._L0305:
                        .ENDBLOCK 849
ACV._L0298:
                        .LINE     849
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,ACV._L0299
                        BREQ      ACV._L0299
                        .BRANCH   20,ACV._L0300
                        JMP       ACV._L0300
ACV._L0299:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .LINE     850
                        LDI       _ACCA, 011h
                        .ENDBLOCK 851
ACV.Cmd2Index_X:
                        .LINE     851
                        .BRANCH   19
                        RET
                        .ENDFUNC  851

                        .FUNC     ParseExtract, 00357h, 00020h
ACV.ParseExtract:
                        .RETURNS   1
                        SBIW      _FRAMEPTR, 2
                        .BLOCK    860
                        .LINE     861
                        LDI       _ACCCLO, ACV.ParamStr AND 0FFh
                        LDI       _ACCCHI, ACV.ParamStr SHRB 8
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
                        .LINE     862
                        LDI       _ACCA, 000h
                        STD       Y+000h, _ACCA
                        .LINE     863
ACV._L0307:
                        LDI       _ACCCLO, ACV.SerInpStr AND 0FFh
                        LDI       _ACCCHI, ACV.SerInpStr SHRB 8
                        LDS       _ACCA, ACV.SerInpPtr
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCA, Z+
                        CPI       _ACCA, 020h
                        LDI       _ACCA, 0h
                        BRNE      ACV._L0309
                        SER       _ACCA
ACV._L0309:
                        TST       _ACCA
                        .BRANCH   4,ACV._L0310
                        BRNE      ACV._L0310
                        .BRANCH   20,ACV._L0308
                        JMP       ACV._L0308
ACV._L0310:
                        .BLOCK    864
                        .LINE     864
                        LDS       _ACCA, ACV.serInpPtr
                        INC       _ACCA
                        STS       ACV.serInpPtr, _ACCA
                        .ENDBLOCK 865
                        .LINE     865
                        .BRANCH   20,ACV._L0307
                        JMP       ACV._L0307
ACV._L0308:
                        .LINE     866
                        LDI       _ACCCLO, ACV.SerInpStr AND 0FFh
                        LDI       _ACCCHI, ACV.SerInpStr SHRB 8
                        LDS       _ACCA, ACV.SerInpPtr
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCA, Z+
                        CPI       _ACCA, 039h
                        .BRANCH   3,ACV._L0311
                        BREQ      ACV._L0311
                        .BRANCH   1,ACV._L0312
                        BRSH      ACV._L0312
                        CPI       _ACCA, 02Ah
                        .BRANCH   1,ACV._L0312
                        BRLO      ACV._L0312
                        LDI       _ACCDLO, 0
                        SEZ
                        .BRANCH   20,ACV._L0311
                        RJMP      ACV._L0311
ACV._L0312:
                        LDI       _ACCDLO, 001h
ACV._L0311:
                        LDI       _ACCA, 0h
                        BRNE      ACV._L0313
                        SER       _ACCA
ACV._L0313:
                        TST       _ACCA
                        .BRANCH   4,ACV._L0316
                        BRNE      ACV._L0316
                        .BRANCH   20,ACV._L0314
                        JMP       ACV._L0314
ACV._L0316:
                        .BLOCK    867
                        .LINE     867
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .LINE     868
                        .LOOP
                        LDI       _ACCCLO, ACV.i AND 0FFh
                        LDI       _ACCCHI, ACV.i SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDS       _ACCA, ACV.SerInpPtr
                        ST        Z, _ACCA
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCCLO, ACV.SerInpStr AND 0FFh
                        LDI       _ACCCHI, ACV.SerInpStr SHRB 8
                        LD        _ACCA, Z
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
ACV._L0319:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      ACV._L0320
                        CLR       _ACCA
ACV._L0320:
                        TST       _ACCA
                        .BRANCH   3,ACV._L0321
                        BREQ      ACV._L0321
                        .BRANCH   20,ACV._L0318
                        JMP       ACV._L0318
ACV._L0321:
                        .BLOCK    869
                        .LINE     869
                        LDI       _ACCCLO, ACV.SerInpStr AND 0FFh
                        LDI       _ACCCHI, ACV.SerInpStr SHRB 8
                        MOV       _ACCA, ACV.i
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCA, Z+
                        STD       Y+004h, _ACCA
                        .LINE     870
                        LDD       _ACCA, Y+004h
                        CPI       _ACCA, 039h
                        .BRANCH   3,ACV._L0322
                        BREQ      ACV._L0322
                        .BRANCH   1,ACV._L0323
                        BRSH      ACV._L0323
                        CPI       _ACCA, 030h
                        .BRANCH   1,ACV._L0323
                        BRLO      ACV._L0323
                        LDI       _ACCDLO, 0
                        SEZ
                        .BRANCH   20,ACV._L0322
                        RJMP      ACV._L0322
ACV._L0323:
                        LDI       _ACCDLO, 001h
ACV._L0322:
                        LDI       _ACCA, 0h
                        BRNE      ACV._L0324
                        SER       _ACCA
ACV._L0324:
                        TST       _ACCA
                        .BRANCH   4,ACV._L0327
                        BRNE      ACV._L0327
                        .BRANCH   20,ACV._L0325
                        JMP       ACV._L0325
ACV._L0327:
                        .BLOCK    871
                        .LINE     871
                        LDD       _ACCA, Y+004h
                        MOV       _ACCEHI, _ACCA
                        LDI       _ACCELO, 001h
                        LDI       _ACCA, _ACCELO SHRB 8
                        LDI       _ACCB, _ACCELO AND 0FFh
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDI       _ACCCLO, ACV.ParamStr AND 0FFh
                        LDI       _ACCCHI, ACV.ParamStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCA, 028h
                        PUSH      _ACCA
                        LDI       _ACCFHI, 000h
                        CALL      SYSTEM.StringAppend
                        .ENDBLOCK 873
                        .BRANCH   20,ACV._L0326
                        JMP       ACV._L0326
ACV._L0325:
                        .BLOCK    873
                        .LINE     873
                        MOV       _ACCA, ACV.i
                        STS       ACV.SERINPPTR, _ACCA
                        .LINE     874
                        LDD       _ACCA, Y+003h
                        ADIW      _FRAMEPTR, 3
                        .BRANCH   20,ACV.ParseExtract_X
                        JMP       ACV.ParseExtract_X
                        .ENDBLOCK 875
ACV._L0326:
                        .ENDBLOCK 876
ACV._L0317:
                        .LINE     876
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,ACV._L0318
                        BREQ      ACV._L0318
                        .BRANCH   20,ACV._L0319
                        JMP       ACV._L0319
ACV._L0318:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .ENDBLOCK 877
                        .BRANCH   20,ACV._L0315
                        JMP       ACV._L0315
ACV._L0314:
                        .BLOCK    877
                        .LINE     878
                        .LOOP
                        LDI       _ACCCLO, ACV.i AND 0FFh
                        LDI       _ACCCHI, ACV.i SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDS       _ACCA, ACV.SerInpPtr
                        ST        Z, _ACCA
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCCLO, ACV.SerInpStr AND 0FFh
                        LDI       _ACCCHI, ACV.SerInpStr SHRB 8
                        LD        _ACCA, Z
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
ACV._L0330:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      ACV._L0331
                        CLR       _ACCA
ACV._L0331:
                        TST       _ACCA
                        .BRANCH   3,ACV._L0332
                        BREQ      ACV._L0332
                        .BRANCH   20,ACV._L0329
                        JMP       ACV._L0329
ACV._L0332:
                        .BLOCK    879
                        .LINE     879
                        LDI       _ACCCLO, ACV.SerInpStr AND 0FFh
                        LDI       _ACCCHI, ACV.SerInpStr SHRB 8
                        MOV       _ACCA, ACV.i
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCA, Z+
                        STD       Y+004h, _ACCA
                        .LINE     880
                        LDD       _ACCA, Y+004h
                        CPI       _ACCA, 041h
                        LDI       _ACCA, 0
                        BRLO      ACV._L0333
                        LDI       _ACCA, 0FFh
ACV._L0333:
                        TST       _ACCA
                        .BRANCH   4,ACV._L0336
                        BRNE      ACV._L0336
                        .BRANCH   20,ACV._L0334
                        JMP       ACV._L0334
ACV._L0336:
                        .BLOCK    880
                        .LINE     881
                        LDD       _ACCA, Y+004h
                        MOV       _ACCEHI, _ACCA
                        LDI       _ACCELO, 001h
                        LDI       _ACCA, _ACCELO SHRB 8
                        LDI       _ACCB, _ACCELO AND 0FFh
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDI       _ACCCLO, ACV.ParamStr AND 0FFh
                        LDI       _ACCCHI, ACV.ParamStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCA, 028h
                        PUSH      _ACCA
                        LDI       _ACCFHI, 000h
                        CALL      SYSTEM.StringAppend
                        .ENDBLOCK 883
                        .BRANCH   20,ACV._L0335
                        JMP       ACV._L0335
ACV._L0334:
                        .BLOCK    883
                        .LINE     883
                        MOV       _ACCA, ACV.i
                        STS       ACV.SERINPPTR, _ACCA
                        .LINE     884
                        LDD       _ACCA, Y+003h
                        ADIW      _FRAMEPTR, 3
                        .BRANCH   20,ACV.ParseExtract_X
                        JMP       ACV.ParseExtract_X
                        .ENDBLOCK 885
ACV._L0335:
                        .ENDBLOCK 886
ACV._L0328:
                        .LINE     886
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,ACV._L0329
                        BREQ      ACV._L0329
                        .BRANCH   20,ACV._L0330
                        JMP       ACV._L0330
ACV._L0329:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .ENDBLOCK 887
ACV._L0315:
                        .LINE     888
                        LDD       _ACCA, Y+000h
                        .ENDBLOCK 889
ACV.ParseExtract_X:
                        .LINE     889
                        .BRANCH   19
                        RET
                        .ENDFUNC  889

                        .FUNC     ParseSubCh, 0037Bh, 00020h
ACV.ParseSubCh:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 12
                        .BLOCK    902
                        .LINE     903
                        LDI       _ACCCLO, ACV.SerInpStr AND 0FFh
                        LDI       _ACCCHI, ACV.SerInpStr SHRB 8
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
                        BRNE      ACV._L0337
                        SER       _ACCA
ACV._L0337:
                        TST       _ACCA
                        .BRANCH   4,ACV._L0340
                        BRNE      ACV._L0340
                        .BRANCH   20,ACV._L0338
                        JMP       ACV._L0338
ACV._L0340:
                        .BLOCK    903
                        .LINE     904
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ACV.SERPROMPT
                        CALL      ACV.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     905
                        .BRANCH   20,ACV.ParseSubCh_X
                        JMP       ACV.ParseSubCh_X
                        .ENDBLOCK 906
ACV._L0338:
ACV._L0339:
                        .LINE     907
                        LDI       _ACCA, 03Ah
                        PUSH      _ACCA
                        LDI       _ACCCLO, ACV.SerInpStr AND 0FFh
                        LDI       _ACCCHI, ACV.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCELO, 001h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCB
                        CALL      SYSTEM.PosChInVarStr
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      ACV._L0341
                        BRLO      ACV._L0341
                        SER       _ACCA
ACV._L0341:
                        STD       Y+005h, _ACCA
                        .LINE     908
                        LDI       _ACCA, 03Dh
                        PUSH      _ACCA
                        LDI       _ACCCLO, ACV.SerInpStr AND 0FFh
                        LDI       _ACCCHI, ACV.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCELO, 001h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCB
                        CALL      SYSTEM.PosChInVarStr
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      ACV._L0342
                        BRLO      ACV._L0342
                        SER       _ACCA
ACV._L0342:
                        COM       _ACCA
                        STD       Y+001h, _ACCA
                        .LINE     909
                        LDI       _ACCCLO, ACV.SerInpStr AND 0FFh
                        LDI       _ACCCHI, ACV.SerInpStr SHRB 8
                        ADIW      _ACCCLO, 00001h
                        LD        _ACCA, Z+
                        STD       Y+006h, _ACCA
                        .LINE     910
                        LDD       _ACCA, Y+006h
                        CPI       _ACCA, 02Ah
                        LDI       _ACCA, 0h
                        BRNE      ACV._L0343
                        SER       _ACCA
ACV._L0343:
                        STD       Y+002h, _ACCA
                        .LINE     911
                        LDD       _ACCA, Y+006h
                        CPI       _ACCA, 023h
                        LDI       _ACCA, 0h
                        BRNE      ACV._L0344
                        SER       _ACCA
ACV._L0344:
                        STD       Y+003h, _ACCA
                        .LINE     912
                        LDD       _ACCA, Y+003h
                        TST       _ACCA
                        .BRANCH   4,ACV._L0347
                        BRNE      ACV._L0347
                        .BRANCH   20,ACV._L0345
                        JMP       ACV._L0345
ACV._L0347:
                        .BLOCK    912
                        .LINE     913
                        .BRANCH   17,ACV.WRITESERINP
                        CALL      ACV.WRITESERINP
                        .LINE     914
                        .BRANCH   20,ACV.ParseSubCh_X
                        JMP       ACV.ParseSubCh_X
                        .ENDBLOCK 915
ACV._L0345:
ACV._L0346:
                        .LINE     916
                        LDI       _ACCA, 001h
                        STS       ACV.SERINPPTR, _ACCA
                        .LINE     917
                        LDD       _ACCA, Y+005h
                        TST       _ACCA
                        .BRANCH   4,ACV._L0350
                        BRNE      ACV._L0350
                        .BRANCH   20,ACV._L0348
                        JMP       ACV._L0348
ACV._L0350:
                        .BLOCK    917
                        .LINE     918
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,ACV.PARSEEXTRACT
                        CALL       ACV.PARSEEXTRACT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        STD       Y+000h, _ACCA
                        .LINE     919
                        LDS       _ACCA, ACV.SerInpPtr
                        INC       _ACCA
                        STS       ACV.SerInpPtr, _ACCA
                        .LINE     920
                        LDD       _ACCA, Y+002h
                        TST       _ACCA
                        .BRANCH   4,ACV._L0353
                        BRNE      ACV._L0353
                        .BRANCH   20,ACV._L0351
                        JMP       ACV._L0351
ACV._L0353:
                        .BLOCK    921
                        .LINE     921
                        .BRANCH   17,ACV.WRITESERINP
                        CALL      ACV.WRITESERINP
                        .ENDBLOCK 922
                        .BRANCH   20,ACV._L0352
                        JMP       ACV._L0352
ACV._L0351:
                        .BLOCK    922
                        .LINE     923
                        LDI       _ACCCLO, ACV.ParamStr AND 0FFh
                        LDI       _ACCCHI, ACV.ParamStr SHRB 8
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        CLT
                        BLD       Flags, _ERRFLAG
                        LDI       _ACCB, 000h
                        CALL      SYSTEM.Str2Int
                        MOV       _ACCA, _ACCB
                        STS       ACV.CURRENTCH, _ACCA
                        .ENDBLOCK 924
ACV._L0352:
                        .ENDBLOCK 925
ACV._L0348:
ACV._L0349:
                        .LINE     926
                        LDD       _ACCA, Y+002h
                        COM       _ACCA
                        PUSH      _ACCA
                        LDS       _ACCA, ACV.CurrentCh
                        PUSH      _ACCA
                        LDS       _ACCA, ACV.SlaveCh
                        POP       _ACCB
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0h
                        BREQ      ACV._L0354
                        SER       _ACCA
ACV._L0354:
                        POP       _ACCB
                        AND       _ACCA, _ACCB
                        PUSH      _ACCA
                        LDD       _ACCA, Y+005h
                        POP       _ACCB
                        AND       _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   4,ACV._L0357
                        BRNE      ACV._L0357
                        .BRANCH   20,ACV._L0355
                        JMP       ACV._L0355
ACV._L0357:
                        .BLOCK    927
                        .LINE     927
                        .BRANCH   17,ACV.WRITESERINP
                        CALL      ACV.WRITESERINP
                        .LINE     928
                        .BRANCH   20,ACV.ParseSubCh_X
                        JMP       ACV.ParseSubCh_X
                        .ENDBLOCK 929
ACV._L0355:
ACV._L0356:
                        .LINE     933
                        LDI       _ACCA, 021h
                        PUSH      _ACCA
                        LDI       _ACCCLO, ACV.SerInpStr AND 0FFh
                        LDI       _ACCCHI, ACV.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCELO, 001h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCB
                        CALL      SYSTEM.PosChInVarStr
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      ACV._L0358
                        BRLO      ACV._L0358
                        SER       _ACCA
ACV._L0358:
                        PUSH      _ACCA
                        LDI       _ACCA, 03Fh
                        PUSH      _ACCA
                        LDI       _ACCCLO, ACV.SerInpStr AND 0FFh
                        LDI       _ACCCHI, ACV.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCELO, 001h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCB
                        CALL      SYSTEM.PosChInVarStr
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      ACV._L0359
                        BRLO      ACV._L0359
                        SER       _ACCA
ACV._L0359:
                        POP       _ACCB
                        OR        _ACCA, _ACCB
                        STS       ACV.VERBOSE, _ACCA
                        .LINE     934
                        LDI       _ACCA, 024h
                        PUSH      _ACCA
                        LDI       _ACCCLO, ACV.SerInpStr AND 0FFh
                        LDI       _ACCCHI, ACV.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCELO, 001h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCB
                        CALL      SYSTEM.PosChInVarStr
                        STD       Y+00Ah, _ACCA
                        .LINE     935
                        LDD       _ACCA, Y+00Ah
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      ACV._L0360
                        BRLO      ACV._L0360
                        SER       _ACCA
ACV._L0360:
                        STD       Y+004h, _ACCA
                        .LINE     936
                        LDD       _ACCA, Y+004h
                        TST       _ACCA
                        .BRANCH   4,ACV._L0363
                        BRNE      ACV._L0363
                        .BRANCH   20,ACV._L0361
                        JMP       ACV._L0361
ACV._L0363:
                        .BLOCK    936
                        .LINE     937
                        LDI       _ACCCLO, ACV.ParamStr AND 0FFh
                        LDI       _ACCCHI, ACV.ParamStr SHRB 8
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
                        LDI       _ACCCLO, ACV.SerInpStr AND 0FFh
                        LDI       _ACCCHI, ACV.SerInpStr SHRB 8
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
                        .LINE     938
                        LDI       _ACCCLO, ACV.ParamStr AND 0FFh
                        LDI       _ACCCHI, ACV.ParamStr SHRB 8
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        CLT
                        BLD       Flags, _ERRFLAG
                        LDI       _ACCB, 0FFh
                        CALL      SYSTEM.Str2Int
                        MOV       _ACCA, _ACCB
                        STD       Y+008h, _ACCA
                        .LINE     939
                        LDI       _ACCA, 000h
                        STD       Y+009h, _ACCA
                        .LINE     940
                        .LOOP
                        LDI       _ACCCLO, ACV.i AND 0FFh
                        LDI       _ACCCHI, ACV.i SHRB 8
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
ACV._L0366:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      ACV._L0367
                        CLR       _ACCA
ACV._L0367:
                        TST       _ACCA
                        .BRANCH   3,ACV._L0368
                        BREQ      ACV._L0368
                        .BRANCH   20,ACV._L0365
                        JMP       ACV._L0365
ACV._L0368:
                        .BLOCK    941
                        .LINE     941
                        LDI       _ACCCLO, ACV.SerInpStr AND 0FFh
                        LDI       _ACCCHI, ACV.SerInpStr SHRB 8
                        MOV       _ACCA, ACV.i
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCA, Z+
                        STD       Y+009h, _ACCA
                        .LINE     942
                        LDD       _ACCA, Y+00Ch
                        PUSH      _ACCA
                        LDD       _ACCA, Y+009h
                        POP       _ACCB
                        EOR       _ACCA, _ACCB
                        STD       Y+00Ch, _ACCA
                        .ENDBLOCK 943
ACV._L0364:
                        .LINE     943
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,ACV._L0365
                        BREQ      ACV._L0365
                        .BRANCH   20,ACV._L0366
                        JMP       ACV._L0366
ACV._L0365:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .LINE     944
                        LDD       _ACCA, Y+009h
                        PUSH      _ACCA
                        LDD       _ACCA, Y+008h
                        POP       _ACCB
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0h
                        BREQ      ACV._L0369
                        SER       _ACCA
ACV._L0369:
                        TST       _ACCA
                        .BRANCH   4,ACV._L0372
                        BRNE      ACV._L0372
                        .BRANCH   20,ACV._L0370
                        JMP       ACV._L0370
ACV._L0372:
                        .BLOCK    944
                        .LINE     945
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 007h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ACV.SERPROMPT
                        CALL      ACV.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     946
                        .BRANCH   20,ACV.ParseSubCh_X
                        JMP       ACV.ParseSubCh_X
                        .ENDBLOCK 947
ACV._L0370:
ACV._L0371:
                        .ENDBLOCK 948
ACV._L0361:
ACV._L0362:
                        .LINE     950
                        LDI       _ACCA, 019h
                        STS       ACV.ActivityTimer, _ACCA
                        .LINE     951
                        CBI       0002Bh, 002h
                        .LINE     955
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,ACV.PARSEEXTRACT
                        CALL       ACV.PARSEEXTRACT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        TST       _ACCA
                        .BRANCH   4,ACV._L0375
                        BRNE      ACV._L0375
                        .BRANCH   20,ACV._L0373
                        JMP       ACV._L0373
ACV._L0375:
                        .BLOCK    955
                        .LINE     956
                        LDI       _ACCA, 000h
                        STD       Y+007h, _ACCA
                        .ENDBLOCK 957
                        .BRANCH   20,ACV._L0374
                        JMP       ACV._L0374
ACV._L0373:
                        .BLOCK    957
                        .LINE     958
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,ACV.CMD2INDEX
                        CALL       ACV.CMD2INDEX
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        STS       ACV.CMDWHICH, _ACCA
                        .LINE     959
                        LDS       _ACCA, ACV.CmdWhich
                        CPI       _ACCA, 011h
                        LDI       _ACCA, 0h
                        BRNE      ACV._L0376
                        SER       _ACCA
ACV._L0376:
                        TST       _ACCA
                        .BRANCH   4,ACV._L0379
                        BRNE      ACV._L0379
                        .BRANCH   20,ACV._L0377
                        JMP       ACV._L0377
ACV._L0379:
                        .BLOCK    959
                        .LINE     960
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 004h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ACV.SERPROMPT
                        CALL      ACV.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     961
                        .BRANCH   20,ACV.ParseSubCh_X
                        JMP       ACV.ParseSubCh_X
                        .ENDBLOCK 962
ACV._L0377:
ACV._L0378:
                        .LINE     963
                        LDI       _ACCCLO, ACV.Cmd2SubChArr AND 0FFh
                        LDI       _ACCCHI, ACV.Cmd2SubChArr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, ACV.CmdWhich
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LPM       _ACCA, Z
                        STD       Y+007h, _ACCA
                        .LINE     964
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,ACV.PARSEEXTRACT
                        CALL       ACV.PARSEEXTRACT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        STD       Y+000h, _ACCA
                        .ENDBLOCK 965
ACV._L0374:
                        .LINE     966
                        LDI       _ACCCLO, ACV.ParamStr AND 0FFh
                        LDI       _ACCCHI, ACV.ParamStr SHRB 8
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
                        STS       ACV.SUBCH, _ACCA
                        .LINE     968
                        LDD       _ACCA, Y+001h
                        TST       _ACCA
                        .BRANCH   4,ACV._L0382
                        BRNE      ACV._L0382
                        .BRANCH   20,ACV._L0380
                        JMP       ACV._L0380
ACV._L0382:
                        .BLOCK    968
                        .LINE     969
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,ACV.PARSEGETPARAM
                        CALL      ACV.PARSEGETPARAM
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 970
                        .BRANCH   20,ACV._L0381
                        JMP       ACV._L0381
ACV._L0380:
                        .BLOCK    970
                        .LINE     971
                        LDI       _ACCA, 03Dh
                        PUSH      _ACCA
                        LDI       _ACCCLO, ACV.SerInpStr AND 0FFh
                        LDI       _ACCCHI, ACV.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCELO, 001h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCB
                        CALL      SYSTEM.PosChInVarStr
                        SUBI      _ACCA, -001h AND 0FFh
                        STS       ACV.SERINPPTR, _ACCA
                        .LINE     972
                        LDS       _ACCA, ACV.SerInpPtr
                        CPI       _ACCA, 001h
                        LDI       _ACCA, 0h
                        BREQ      ACV._L0383
                        BRLO      ACV._L0383
                        SER       _ACCA
ACV._L0383:
                        PUSH      _ACCA
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,ACV.PARSEEXTRACT
                        CALL       ACV.PARSEEXTRACT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        POP       _ACCB
                        AND       _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   4,ACV._L0386
                        BRNE      ACV._L0386
                        .BRANCH   20,ACV._L0384
                        JMP       ACV._L0384
ACV._L0386:
                        .BLOCK    972
                        .LINE     973
                        LDI       _ACCCLO, ACV.ParamStr AND 0FFh
                        LDI       _ACCCHI, ACV.ParamStr SHRB 8
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        CLT
                        BLD       Flags, _ERRFLAG
                        LDI       _ACCB, 000h
                        CALL      SYSTEM.Str2Int
                        STS       ACV.PARAMINT, _ACCB
                        STS       ACV.PARAMINT+1, _ACCA
                        .LINE     974
                        LDS       _ACCB, ACV.ParamInt
                        LDS       _ACCA, ACV.ParamInt+1
                        MOV       _ACCA, _ACCB
                        STS       ACV.PARAMBYTE, _ACCA
                        .ENDBLOCK 975
                        .BRANCH   20,ACV._L0385
                        JMP       ACV._L0385
ACV._L0384:
                        .BLOCK    975
                        .LINE     976
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 005h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ACV.SERPROMPT
                        CALL      ACV.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     977
                        .BRANCH   20,ACV.ParseSubCh_X
                        JMP       ACV.ParseSubCh_X
                        .ENDBLOCK 978
ACV._L0385:
                        .LINE     979
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,ACV.PARSESETPARAM
                        CALL      ACV.PARSESETPARAM
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 980
ACV._L0381:
                        .ENDBLOCK 981
ACV.ParseSubCh_X:
                        .LINE     981
                        .BRANCH   19
                        RET
                        .ENDFUNC  981

                        .FUNC     Chores, 003DAh, 00020h
ACV.Chores:
                        .RETURNS   0
                        .BLOCK    988
                        .ENDBLOCK 989
ACV.Chores_X:
                        .LINE     989
                        .BRANCH   19
                        RET
                        .ENDFUNC  989

                        .FUNC     CheckSer, 003DFh, 00020h
ACV.CheckSer:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 1
                        .BLOCK    994
                        .LINE     995
ACV._L0387:
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
                        .BRANCH   4,ACV._L0389
                        BRNE      ACV._L0389
                        .BRANCH   20,ACV._L0388
                        JMP       ACV._L0388
ACV._L0389:
                        .BLOCK    997
                        .LINE     997
                        LDD       _ACCA, Y+000h
                        CPI       _ACCA, 07Fh
                        .BRANCH   3,ACV._L0390
                        BREQ      ACV._L0390
                        .BRANCH   1,ACV._L0391
                        BRSH      ACV._L0391
                        CPI       _ACCA, 020h
                        .BRANCH   1,ACV._L0391
                        BRLO      ACV._L0391
                        LDI       _ACCDLO, 0
                        SEZ
                        .BRANCH   20,ACV._L0390
                        RJMP      ACV._L0390
ACV._L0391:
                        LDI       _ACCDLO, 001h
ACV._L0390:
                        LDI       _ACCA, 0h
                        BRNE      ACV._L0392
                        SER       _ACCA
ACV._L0392:
                        TST       _ACCA
                        .BRANCH   4,ACV._L0395
                        BRNE      ACV._L0395
                        .BRANCH   20,ACV._L0393
                        JMP       ACV._L0393
ACV._L0395:
                        .BLOCK    998
                        .LINE     998
                        LDD       _ACCA, Y+000h
                        MOV       _ACCEHI, _ACCA
                        LDI       _ACCELO, 001h
                        LDI       _ACCA, _ACCELO SHRB 8
                        LDI       _ACCB, _ACCELO AND 0FFh
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDI       _ACCCLO, ACV.SerInpStr AND 0FFh
                        LDI       _ACCCHI, ACV.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCA, 03Fh
                        PUSH      _ACCA
                        LDI       _ACCFHI, 000h
                        CALL      SYSTEM.StringAppend
                        .ENDBLOCK 999
ACV._L0393:
ACV._L0394:
                        .LINE     1000
                        LDD       _ACCA, Y+000h
                        CPI       _ACCA, 008h
                        LDI       _ACCA, 0h
                        BRNE      ACV._L0396
                        SER       _ACCA
ACV._L0396:
                        TST       _ACCA
                        .BRANCH   4,ACV._L0399
                        BRNE      ACV._L0399
                        .BRANCH   20,ACV._L0397
                        JMP       ACV._L0397
ACV._L0399:
                        .BLOCK    1001
                        .LINE     1001
                        LDI       _ACCCLO, ACV.SerInpStr AND 0FFh
                        LDI       _ACCCHI, ACV.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCCLO, ACV.SerInpStr AND 0FFh
                        LDI       _ACCCHI, ACV.SerInpStr SHRB 8
                        LD        _ACCA, Z
                        SUBI      _ACCA, 001h AND 0FFh
                        POP       _ACCCHI
                        POP       _ACCCLO
                        CPI       _ACCA, 63
                        BRCS      ACV._L0400
                        LDI       _ACCA, 63
ACV._L0400:
                        ST        Z+, _ACCA
                        .ENDBLOCK 1002
ACV._L0397:
ACV._L0398:
                        .LINE     1003
                        LDD       _ACCA, Y+000h
                        CPI       _ACCA, 00Dh
                        LDI       _ACCA, 0h
                        BRNE      ACV._L0401
                        SER       _ACCA
ACV._L0401:
                        TST       _ACCA
                        .BRANCH   4,ACV._L0404
                        BRNE      ACV._L0404
                        .BRANCH   20,ACV._L0402
                        JMP       ACV._L0402
ACV._L0404:
                        .BLOCK    1003
                        .LINE     1004
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,ACV.PARSESUBCH
                        CALL      ACV.PARSESUBCH
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1005
                        LDI       _ACCCLO, ACV.SerInpStr AND 0FFh
                        LDI       _ACCCHI, ACV.SerInpStr SHRB 8
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
                        .ENDBLOCK 1006
ACV._L0402:
ACV._L0403:
                        .ENDBLOCK 1007
                        .LINE     1007
                        .BRANCH   20,ACV._L0387
                        JMP       ACV._L0387
ACV._L0388:
                        .ENDBLOCK 1009
ACV.CheckSer_X:
                        .LINE     1009
                        .BRANCH   19
                        RET
                        .ENDFUNC  1009

                        .FUNC     CheckDelay, 003F3h, 00020h
ACV.CheckDelay:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 1
                        .BLOCK    1014
                        .LINE     1015
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
ACV._L0407:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      ACV._L0408
                        CLR       _ACCA
ACV._L0408:
                        TST       _ACCA
                        .BRANCH   3,ACV._L0409
                        BREQ      ACV._L0409
                        .BRANCH   20,ACV._L0406
                        JMP       ACV._L0406
ACV._L0409:
                        .BLOCK    1016
                        .LINE     1016
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,ACV.CHECKSER
                        CALL      ACV.CHECKSER
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 1017
ACV._L0405:
                        .LINE     1017
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,ACV._L0406
                        BREQ      ACV._L0406
                        .BRANCH   20,ACV._L0407
                        JMP       ACV._L0407
ACV._L0406:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .ENDBLOCK 1018
ACV.CheckDelay_X:
                        .LINE     1018
                        .BRANCH   19
                        RET
                        .ENDFUNC  1018

                        .FUNC     initall, 003FFh, 00020h
ACV.initall:
                        .RETURNS   0
                        .BLOCK    1025
                        .LINE     1026
                        LDI       _ACCA, 01Fh
                        OUT       DDRB, _ACCA
                        .LINE     1027
                        LDI       _ACCA, 010h
                        OUT       PORTB, _ACCA
                        .LINE     1028
                        LDI       _ACCA, 0F0h
                        OUT       DDRC, _ACCA
                        .LINE     1029
                        LDI       _ACCA, 0F3h
                        OUT       PORTC, _ACCA
                        .LINE     1030
                        LDI       _ACCA, 004h
                        OUT       DDRD, _ACCA
                        .LINE     1031
                        LDI       _ACCA, 0FCh
                        OUT       PORTD, _ACCA
                        .LINE     1032
                        LDI       _ACCA, 0FFh
                        COM       _ACCA
                        LDI       _ACCDLO, 038h
                        LDI       _ACCAHI, 003h
                        CALL      SYSTEM.I2CEXPOUT
                        .LINE     1033
                        LDI       _ACCCLO, ACV.EESerBaudReg AND 0FFh
                        LDI       _ACCCHI, ACV.EESerBaudReg SHRB 8
                        CALL      SYSTEM.ReadEEp8
                        MOV       ACV.I, _ACCA
                        .LINE     1034
                        MOV       _ACCA, ACV.i
                        CPI       _ACCA, 0EFh
                        .BRANCH   3,ACV._L0410
                        BREQ      ACV._L0410
                        .BRANCH   1,ACV._L0411
                        BRSH      ACV._L0411
                        CPI       _ACCA, 009h
                        .BRANCH   1,ACV._L0411
                        BRLO      ACV._L0411
                        LDI       _ACCDLO, 0
                        SEZ
                        .BRANCH   20,ACV._L0410
                        RJMP      ACV._L0410
ACV._L0411:
                        LDI       _ACCDLO, 001h
ACV._L0410:
                        LDI       _ACCA, 0h
                        BRNE      ACV._L0412
                        SER       _ACCA
ACV._L0412:
                        COM       _ACCA
                        TST       _ACCA
                        .BRANCH   4,ACV._L0415
                        BRNE      ACV._L0415
                        .BRANCH   20,ACV._L0413
                        JMP       ACV._L0413
ACV._L0415:
                        .BLOCK    1034
                        .LINE     1035
                        LDI       _ACCA, 033h
                        LDI       _ACCCLO, ACV.EESERBAUDREG AND 0FFh
                        LDI       _ACCCHI, ACV.EESERBAUDREG SHRB 8
                        CALL      SYSTEM.WriteEEp8
                        ADIW      _ACCCLO, 01h
                        .LINE     1036
                        LDI       _ACCA, 033h
                        MOV       ACV.I, _ACCA
                        .ENDBLOCK 1037
ACV._L0413:
ACV._L0414:
                        .LINE     1038
                        MOV       _ACCA, ACV.i
                        STS       UBRR1, _ACCA
                        .LINE     1039
                        LDS       _ACCA, UCSRA
                        ORI       _ACCA, 002h
                        STS       UCSRA, _ACCA
                        .LINE     1042
                        LDS       _ACCA, ADMUX
                        ORI       _ACCA, 0C0h
                        STS       ADMUX, _ACCA
                        .LINE     1044
                        .BRANCH   17,ACV.PATCHCOPYFROMEE
                        CALL      ACV.PATCHCOPYFROMEE
                        .LINE     1046
                        LDI       _ACCA, 000h
                        LDI       _ACCDLO, 038h
                        LDI       _ACCAHI, 001h
                        CALL      SYSTEM.I2CEXPOUT
                        .LINE     1047
                        LDI       _ACCA, 001h
                        .FRAME  0
                        CALL      SYSTEM.UDELAY
                        .LINE     1048
                        IN        _ACCA, PinD
                        COM       _ACCA
                        LDI       _ACCALO, 005h
                        CALL      SYSTEM.SHR8_R
                        STS       ACV.SLAVECH, _ACCA
                        .LINE     1049
                        CBI       0002Bh, 002h
                        .LINE     1051
                        LDI       _ACCA, 000h
                        .FRAME  0
                        CALL       SYSTEM.LCDSETUP_M
                        TST       _ACCA
                        .BRANCH   4,ACV._L0418
                        BRNE      ACV._L0418
                        .BRANCH   20,ACV._L0416
                        JMP       ACV._L0416
ACV._L0418:
                        .BLOCK    1051
                        .LINE     1052
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
                        .LINE     1053
                        CALL      SYSTEM.LCDBARINIT_M
                        .LINE     1054
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  2
                        LDI       _ACCA, 007h
                        ST        -Y, _ACCA
                        .FRAME  3
                        LDI       _ACCA, 07Fh
                        ST        -Y, _ACCA
                        .FRAME  4
                        .FRAME  0
                        CALL      SYSTEM.LCDBARSET1
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1055
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  2
                        LDI       _ACCA, 007h
                        ST        -Y, _ACCA
                        .FRAME  3
                        LDI       _ACCA, 07Fh
                        ST        -Y, _ACCA
                        .FRAME  4
                        .FRAME  0
                        CALL      SYSTEM.LCDBARSET2
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1056
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 005h
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
                        .LINE     1057
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 006h
                        ST        -Y, _ACCA
                        .FRAME  2
                        LDI       _ACCA, 015h
                        ST        -Y, _ACCA
                        .FRAME  3
                        LDI       _ACCA, 00Ah
                        ST        -Y, _ACCA
                        .FRAME  4
                        LDI       _ACCA, 015h
                        ST        -Y, _ACCA
                        .FRAME  5
                        LDI       _ACCA, 00Ah
                        ST        -Y, _ACCA
                        .FRAME  6
                        LDI       _ACCA, 015h
                        ST        -Y, _ACCA
                        .FRAME  7
                        LDI       _ACCA, 00Ah
                        ST        -Y, _ACCA
                        .FRAME  8
                        LDI       _ACCA, 015h
                        ST        -Y, _ACCA
                        .FRAME  9
                        LDI       _ACCA, 00Ah
                        ST        -Y, _ACCA
                        .FRAME  10
                        .FRAME  0
                        CALL      SYSTEM.LCDCHARSET_M
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1058
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDI       _ACCA, 007h
                        ST        -Y, _ACCA
                        .FRAME  2
                        LDI       _ACCA, 010h
                        ST        -Y, _ACCA
                        .FRAME  3
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  4
                        LDI       _ACCA, 010h
                        ST        -Y, _ACCA
                        .FRAME  5
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  6
                        LDI       _ACCA, 010h
                        ST        -Y, _ACCA
                        .FRAME  7
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  8
                        LDI       _ACCA, 010h
                        ST        -Y, _ACCA
                        .FRAME  9
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  10
                        .FRAME  0
                        CALL      SYSTEM.LCDCHARSET_M
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1060
                        LDI       _ACCA, 0FFh
                        STS       ACV.LCDPRESENT, _ACCA
                        .LINE     1061
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, ACV.Vers3Str AND 0FFh
                        LDI       _ACCCHI, ACV.Vers3Str SHRB 8
                        CALL      SYSTEM.StrConst2Str
ACV._L0419:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     1062
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
                        .LINE     1063
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.lcdout_m SHRB 1
                        LDI       _ACCA, SYSTEM.lcdout_m SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, ACV.AdrStr AND 0FFh
                        LDI       _ACCCHI, ACV.AdrStr SHRB 8
                        CALL      SYSTEM.StrConst2Str
ACV._L0420:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     1064
                        LDS       _ACCA, ACV.SlaveCh
                        SUBI      _ACCA, -030h AND 0FFh
                        .FRAME  0
                        CALL      SYSTEM.LCDOUT_M
                        .ENDBLOCK 1065
ACV._L0416:
ACV._L0417:
                        .LINE     1067
                        LDI       _ACCCLO, ACV.EEinitialised AND 0FFh
                        LDI       _ACCCHI, ACV.EEinitialised SHRB 8
                        CALL      SYSTEM._ReadEEp16
                        CPI       _ACCA, 0AAh
                        BRNE      ACV._L0421
                        CPI       _ACCB, 055h
ACV._L0421:
                        LDI       _ACCA, 0h
                        BREQ      ACV._L0422
                        SER       _ACCA
ACV._L0422:
                        TST       _ACCA
                        .BRANCH   4,ACV._L0425
                        BRNE      ACV._L0425
                        .BRANCH   20,ACV._L0423
                        JMP       ACV._L0423
ACV._L0425:
                        .BLOCK    1067
                        .LINE     1068
                        LDI       _ACCA, 00004h SHRB 8
                        LDI       _ACCB, 00004h AND 0FFh
                        LDI       _ACCCLO, ACV.INITINCRAST AND 0FFh
                        LDI       _ACCCHI, ACV.INITINCRAST SHRB 8
                        MOVW      _ACCALO, _ACCB
                        CALL      SYSTEM._WriteEEp16
                        ADIW      _ACCCLO, 01h
                        .LINE     1069
                        LDI       _ACCA, 002h
                        LDI       _ACCCLO, ACV.INITGAIN AND 0FFh
                        LDI       _ACCCHI, ACV.INITGAIN SHRB 8
                        CALL      SYSTEM.WriteEEp8
                        ADIW      _ACCCLO, 01h
                        .LINE     1070
                        LDI       _ACCA, 000h
                        LDI       _ACCCLO, ACV.INITRATE AND 0FFh
                        LDI       _ACCCHI, ACV.INITRATE SHRB 8
                        CALL      SYSTEM.WriteEEp8
                        ADIW      _ACCCLO, 01h
                        .LINE     1071
                        LDI       _ACCA, 007h
                        LDI       _ACCCLO, ACV.INITAUXCMD AND 0FFh
                        LDI       _ACCCHI, ACV.INITAUXCMD SHRB 8
                        CALL      SYSTEM.WriteEEp8
                        ADIW      _ACCCLO, 01h
                        .LINE     1072
                        LDI       _ACCA, 033h
                        LDI       _ACCCLO, ACV.EESERBAUDREG AND 0FFh
                        LDI       _ACCCHI, ACV.EESERBAUDREG SHRB 8
                        CALL      SYSTEM.WriteEEp8
                        ADIW      _ACCCLO, 01h
                        .LINE     1073
                        LDI       _ACCA, 0AA55h SHRB 8
                        LDI       _ACCB, 0AA55h AND 0FFh
                        LDI       _ACCCLO, ACV.EEINITIALISED AND 0FFh
                        LDI       _ACCCHI, ACV.EEINITIALISED SHRB 8
                        MOVW      _ACCALO, _ACCB
                        CALL      SYSTEM._WriteEEp16
                        ADIW      _ACCCLO, 01h
                        .LINE     1074
                        .BRANCH   17,ACV.PATCHCOPYFROMEE
                        CALL      ACV.PATCHCOPYFROMEE
                        .ENDBLOCK 1075
ACV._L0423:
ACV._L0424:
                        .LINE     1076
                        .BRANCH   17,ACV.SWITCHGAIN
                        CALL      ACV.SWITCHGAIN
                        .LINE     1078
                        LDI       _ACCA, 003E8h SHRB 8
                        LDI       _ACCB, 003E8h AND 0FFh
                        .FRAME  0
                        CALL      SYSTEM.MDELAY
                        .LINE     1079
                        LDS       _ACCA, ACV.SlaveCh
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      ACV._L0426
                        BRLO      ACV._L0426
                        SER       _ACCA
ACV._L0426:
                        TST       _ACCA
                        .BRANCH   4,ACV._L0429
                        BRNE      ACV._L0429
                        .BRANCH   20,ACV._L0427
                        JMP       ACV._L0427
ACV._L0429:
                        .BLOCK    1079
                        .LINE     1080
                        .LOOP
                        LDI       _ACCCLO, ACV.i AND 0FFh
                        LDI       _ACCCHI, ACV.i SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 000h
                        ST        Z, _ACCA
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, ACV.SlaveCh
                        SUBI      _ACCA, 001h AND 0FFh
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
ACV._L0432:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      ACV._L0433
                        CLR       _ACCA
ACV._L0433:
                        TST       _ACCA
                        .BRANCH   3,ACV._L0434
                        BREQ      ACV._L0434
                        .BRANCH   20,ACV._L0431
                        JMP       ACV._L0431
ACV._L0434:
                        .BLOCK    1081
                        .LINE     1081
                        LDI      _ACCB, 004h
                        OUT       029h, _ACCB
                        .LINE     1082
                        LDI       _ACCA, 00096h SHRB 8
                        LDI       _ACCB, 00096h AND 0FFh
                        .FRAME  3
                        CALL      SYSTEM.MDELAY
                        .LINE     1083
                        LDI      _ACCB, 004h
                        OUT       029h, _ACCB
                        .LINE     1084
                        LDI       _ACCA, 00096h SHRB 8
                        LDI       _ACCB, 00096h AND 0FFh
                        .FRAME  3
                        CALL      SYSTEM.MDELAY
                        .ENDBLOCK 1085
ACV._L0430:
                        .LINE     1085
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,ACV._L0431
                        BREQ      ACV._L0431
                        .BRANCH   20,ACV._L0432
                        JMP       ACV._L0432
ACV._L0431:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .ENDBLOCK 1086
ACV._L0427:
ACV._L0428:
                        .LINE     1087
                        SBI       0002Bh, 002h
                        .LINE     1089
                        LDI       _ACCA, 000h
                        STS       ACV.STATUS, _ACCA
                        .LINE     1090
                        LDI       _ACCA, 1 SHLB IntFlag
                        OR        Flags, _ACCA
                        SEI
                        .LINE     1091
ACV._L0435:
                        CALL       SYSTEM.SERSTAT
                        TST       _ACCA
                        .BRANCH   4,ACV._L0437
                        BRNE      ACV._L0437
                        .BRANCH   20,ACV._L0436
                        JMP       ACV._L0436
ACV._L0437:
                        .BLOCK    1091
                        .LINE     1092
                        CALL       SYSTEM.SERINP
                        MOV       ACV.I, _ACCA
                        .ENDBLOCK 1093
                        .LINE     1093
                        .BRANCH   20,ACV._L0435
                        JMP       ACV._L0435
ACV._L0436:
                        .LINE     1094
                        CALL      SYSTEM.INCRCOUNT4START
                        .LINE     1095
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
                        .LINE     1096
                        LDI       _ACCA, 000h
                        .FRAME  0
                        CALL       SYSTEM.GETINCRVAL4
                        STS       ACV.INCRVALUE, _ACCB
                        STS       ACV.INCRVALUE+1, _ACCA
                        .LINE     1097
                        LDS       _ACCB, ACV.IncrValue
                        LDS       _ACCA, ACV.IncrValue+1
                        STS       ACV.OLDINCRVALUE, _ACCB
                        STS       ACV.OLDINCRVALUE+1, _ACCA
                        .LINE     1098
                        LDI       _ACCA, 00000h SHRB 8
                        LDI       _ACCB, 00000h AND 0FFh
                        STS       ACV.INCRDIFF, _ACCB
                        STS       ACV.INCRDIFF+1, _ACCA
                        .LINE     1099
                        LDI       _ACCA, 000h
                        STS       ACV.INCRENTER, _ACCA
                        .LINE     1100
                        LDI       _ACCA, 002h
                        STS       ACV.MODIFY, _ACCA
                        .LINE     1101
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,ACV.SOLLWERTEONLCD
                        CALL      ACV.SOLLWERTEONLCD
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1102
                        LDI       _ACCA, 003E8h SHRB 8
                        LDI       _ACCB, 003E8h AND 0FFh
                        .FRAME  0
                        CALL      SYSTEM.MDELAY
                        .LINE     1103
                        LDI       _ACCA, 003h
                        STS       ACV.MODIFY, _ACCA
                        .LINE     1104
                        LDI       _ACCA, 0FFh
                        STS       ACV.FIRSTTURN, _ACCA
                        .LINE     1105
                        LDI       _ACCA, 0FEh
                        STS       ACV.SUBCH, _ACCA
                        .LINE     1106
                        .BRANCH   17,ACV.WRITECHPREFIX
                        CALL      ACV.WRITECHPREFIX
                        .LINE     1107
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.serout SHRB 1
                        LDI       _ACCA, SYSTEM.serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, ACV.Vers1Str AND 0FFh
                        LDI       _ACCCHI, ACV.Vers1Str SHRB 8
                        CALL      SYSTEM.StrConst2Str
ACV._L0438:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     1108
                        LDI       _ACCCLO, ACV.EEinitialised AND 0FFh
                        LDI       _ACCCHI, ACV.EEinitialised SHRB 8
                        CALL      SYSTEM._ReadEEp16
                        CPI       _ACCA, 0AAh
                        BRNE      ACV._L0439
                        CPI       _ACCB, 055h
ACV._L0439:
                        LDI       _ACCA, 0h
                        BREQ      ACV._L0440
                        SER       _ACCA
ACV._L0440:
                        TST       _ACCA
                        .BRANCH   4,ACV._L0443
                        BRNE      ACV._L0443
                        .BRANCH   20,ACV._L0441
                        JMP       ACV._L0441
ACV._L0443:
                        .BLOCK    1108
                        .LINE     1109
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.Serout SHRB 1
                        LDI       _ACCA, SYSTEM.Serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, ACV.EEnotProgrammedStr AND 0FFh
                        LDI       _ACCCHI, ACV.EEnotProgrammedStr SHRB 8
                        CALL      SYSTEM.StrConst2Str
ACV._L0444:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .ENDBLOCK 1110
ACV._L0441:
ACV._L0442:
                        .LINE     1111
                        .BRANCH   17,ACV.SERCRLF
                        CALL      ACV.SERCRLF
                        .LINE     1112
                        LDI       _ACCA, 0FFh
                        STS       ACV.CURRENTCH, _ACCA
                        .LINE     1113
                        LDI       _ACCA, 00000h SHRB 8
                        LDI       _ACCB, 00000h AND 0FFh
                        STS       ACV.ERRCOUNT, _ACCB
                        STS       ACV.ERRCOUNT+1, _ACCA
                        .LINE     1114
                        LDI       _ACCA, 0FFh
                        STS       ACV.CHANGEDFLAG, _ACCA
                        .LINE     1115
                        LDI       _ACCA, 096h
                        STS       ACV.BarGraphDelayTimer, _ACCA
                        .LINE     1116
                        LDI       _ACCCLO, ACV.InitAuxCmd AND 0FFh
                        LDI       _ACCCHI, ACV.InitAuxCmd SHRB 8
                        CALL      SYSTEM.ReadEEp8
                        STS       ACV.AUXCMD, _ACCA
                        .LINE     1117
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCA, ACV.AuxCmd
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,ACV.SERAUX
                        CALL      ACV.SERAUX
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1118
                        LDI       _ACCA, 040h
                        LDI       _ACCDLO, 038h
                        LDI       _ACCAHI, 001h
                        CALL      SYSTEM.I2CEXPOUT
                        .LINE     1119
                        .BRANCH   17,ACV.INITSPDIF
                        CALL      ACV.INITSPDIF
                        .LINE     1120
                        LDI       _ACCCLO, ACV.InitLRswap AND 0FFh
                        LDI       _ACCCHI, ACV.InitLRswap SHRB 8
                        CALL      SYSTEM.ReadEEp8
                        TST       _ACCA
                        .BRANCH   4,ACV._L0447
                        BRNE      ACV._L0447
                        .BRANCH   20,ACV._L0445
                        JMP       ACV._L0445
ACV._L0447:
                        .BLOCK    1120
                        .LINE     1121
                        LDI       _ACCA, 052h
                        STS       ACV.UPPERCHANNEL, _ACCA
                        .LINE     1122
                        LDI       _ACCA, 04Ch
                        STS       ACV.LOWERCHANNEL, _ACCA
                        .ENDBLOCK 1123
                        .BRANCH   20,ACV._L0446
                        JMP       ACV._L0446
ACV._L0445:
                        .BLOCK    1123
                        .LINE     1124
                        LDI       _ACCA, 04Ch
                        STS       ACV.UPPERCHANNEL, _ACCA
                        .LINE     1125
                        LDI       _ACCA, 052h
                        STS       ACV.LOWERCHANNEL, _ACCA
                        .ENDBLOCK 1126
ACV._L0446:
                        .ENDBLOCK 1127
ACV.initall_X:
                        .LINE     1127
                        .BRANCH   19
                        RET
                        .ENDFUNC  1127



                        ; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                        ; Program body
                        ; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

                        .FUNC     $_Main, 0046Bh, 00020h
                        .ENTRYMAIN $
ACV.$_Main:

                        .BLOCK    1131
                        .LINE     1132
                        .BRANCH   17,ACV.INITALL
                        CALL      ACV.INITALL
ACV._L0448:
                        .BLOCK    1134
                        .LINE     1135
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,ACV.CHECKSER
                        CALL      ACV.CHECKSER
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1136
                        SER       _ACCA
                        LDS       _ACCB, ACV.ActivityTimer
                        TST       _ACCB
                        BREQ      ACV._L0450
                        COM       _ACCA
ACV._L0450:
                        TST       _ACCA
                        .BRANCH   4,ACV._L0453
                        BRNE      ACV._L0453
                        .BRANCH   20,ACV._L0451
                        JMP       ACV._L0451
ACV._L0453:
                        .BLOCK    1136
                        .LINE     1137
                        SBI       0002Bh, 002h
                        .ENDBLOCK 1138
ACV._L0451:
ACV._L0452:
                        .LINE     1139
                        LDS       _ACCA, ACV.LCDpresent
                        PUSH      _ACCA
                        CALL       SYSTEM.SERSTAT
                        COM       _ACCA
                        POP       _ACCB
                        AND       _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   4,ACV._L0456
                        BRNE      ACV._L0456
                        .BRANCH   20,ACV._L0454
                        JMP       ACV._L0454
ACV._L0456:
                        .BLOCK    1139
                        .LINE     1140
                        LDI       _ACCA, 000h
                        .FRAME  0
                        CALL       SYSTEM.GETINCRVAL4
                        STS       ACV.INCRVALUE, _ACCB
                        STS       ACV.INCRVALUE+1, _ACCA
                        .LINE     1142
                        LDS       _ACCB, ACV.IncrValue
                        LDS       _ACCA, ACV.IncrValue+1
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDS       _ACCB, ACV.OldIncrValue
                        LDS       _ACCA, ACV.OldIncrValue+1
                        MOVW      _ACCALO, _ACCB
                        POP       _ACCA
                        POP       _ACCB
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        EOR       _ACCAHI, _ACCBLO
                        CP        _ACCA, _ACCAHI
                        BRNE      ACV._L0457
                        CP        _ACCB, _ACCALO
ACV._L0457:
                        LDI       _ACCA, 0h
                        BREQ      ACV._L0458
                        SER       _ACCA
ACV._L0458:
                        TST       _ACCA
                        .BRANCH   4,ACV._L0461
                        BRNE      ACV._L0461
                        .BRANCH   20,ACV._L0459
                        JMP       ACV._L0459
ACV._L0461:
                        .BLOCK    1142
                        .LINE     1143
                        LDI       _ACCA, 019h
                        STS       ACV.ActivityTimer, _ACCA
                        .LINE     1144
                        CBI       0002Bh, 002h
                        .LINE     1145
                        LDS       _ACCB, ACV.IncrDiff
                        LDS       _ACCA, ACV.IncrDiff+1
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDS       _ACCB, ACV.IncrValue
                        LDS       _ACCA, ACV.IncrValue+1
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDS       _ACCB, ACV.OldIncrValue
                        LDS       _ACCA, ACV.OldIncrValue+1
                        NEG       _ACCB
                        BRNE      ACV._L0462
                        DEC       _ACCA
ACV._L0462:
                        COM       _ACCA
                        POP       _ACCAHI
                        POP       _ACCALO
                        ADD       _ACCB, _ACCALO
                        ADC       _ACCA, _ACCAHI
                        POP       _ACCAHI
                        POP       _ACCALO
                        ADD       _ACCB, _ACCALO
                        ADC       _ACCA, _ACCAHI
                        STS       ACV.INCRDIFF, _ACCB
                        STS       ACV.INCRDIFF+1, _ACCA
                        .LINE     1146
                        LDS       _ACCB, ACV.IncrValue
                        LDS       _ACCA, ACV.IncrValue+1
                        STS       ACV.OLDINCRVALUE, _ACCB
                        STS       ACV.OLDINCRVALUE+1, _ACCA
                        .LINE     1147
                        LDI       _ACCA, 014h
                        STS       ACV.IncrTimer, _ACCA
                        .LINE     1148
                        LDS       _ACCB, ACV.IncrDiff
                        LDS       _ACCA, ACV.IncrDiff+1
                        TST       _ACCA
                        BRPL      ACV._L0463
                        NEG       _ACCB
                        BRNE      ACV._L0464
                        DEC       _ACCA
ACV._L0464:
                        COM       _ACCA
ACV._L0463:
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDS       _ACCB, ACV.IncRast
                        LDS       _ACCA, ACV.IncRast+1
                        MOVW      _ACCALO, _ACCB
                        POP       _ACCA
                        POP       _ACCB
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        EOR       _ACCAHI, _ACCBLO
                        CP        _ACCA, _ACCAHI
                        BRNE      ACV._L0465
                        CP        _ACCB, _ACCALO
ACV._L0465:
                        LDI       _ACCA, 0
                        BRLO      ACV._L0466
                        LDI       _ACCA, 0FFh
ACV._L0466:
                        TST       _ACCA
                        .BRANCH   4,ACV._L0469
                        BRNE      ACV._L0469
                        .BRANCH   20,ACV._L0467
                        JMP       ACV._L0467
ACV._L0469:
                        .BLOCK    1149
                        .LINE     1149
                        LDI       _ACCA, 0FFh
                        STS       ACV.CHANGEDFLAG, _ACCA
                        .LINE     1150
                        LDS       _ACCA, 0024Fh
                        SBR       _ACCA, 080h
                        STS       0024Fh, _ACCA
                        .LINE     1151
                        LDS       _ACCB, ACV.IncrDiff
                        LDS       _ACCA, ACV.IncrDiff+1
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDS       _ACCB, ACV.IncRast
                        LDS       _ACCA, ACV.IncRast+1
                        SET
                        BLD       Flags, _SIGN
                        POP       _ACCBHI
                        POP       _ACCBLO
                        CALL      SYSTEM.DIV16
                        STS       ACV.INCRDIFF, _ACCB
                        STS       ACV.INCRDIFF+1, _ACCA
                        .LINE     1152
                        LDS       _ACCB, ACV.IncrDiff
                        LDS       _ACCA, ACV.IncrDiff+1
                        MOV       _ACCA, _ACCB
                        STS       ACV.INCRDIFFBYTE, _ACCA
                        .LINE     1153
                        LDS       _ACCB, ACV.IncrDiff
                        LDS       _ACCA, ACV.IncrDiff+1
                        TST       _ACCA
                        BRPL      ACV._L0470
                        NEG       _ACCB
                        BRNE      ACV._L0471
                        DEC       _ACCA
ACV._L0471:
                        COM       _ACCA
ACV._L0470:
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        CPI       _ACCA, 080h
                        BRNE      ACV._L0472
                        CPI       _ACCB, 001h
ACV._L0472:
                        LDI       _ACCA, 0h
                        BREQ      ACV._L0473
                        BRLO      ACV._L0473
                        SER       _ACCA
ACV._L0473:
                        TST       _ACCA
                        .BRANCH   4,ACV._L0476
                        BRNE      ACV._L0476
                        .BRANCH   20,ACV._L0474
                        JMP       ACV._L0474
ACV._L0476:
                        .BLOCK    1154
                        .LINE     1154
                        LDS       _ACCB, ACV.IncrDiff
                        LDS       _ACCA, ACV.IncrDiff+1
                        PUSH      _ACCB
                        PUSH      _ACCA
                        POP       _ACCAHI
                        POP       _ACCALO
                        ADD       _ACCB, _ACCALO
                        ADC       _ACCA, _ACCAHI
                        STS       ACV.INCRDIFF, _ACCB
                        STS       ACV.INCRDIFF+1, _ACCA
                        .ENDBLOCK 1155
ACV._L0474:
ACV._L0475:
                        .LINE     1156
                        LDS       _ACCB, ACV.IncrDiff
                        LDS       _ACCA, ACV.IncrDiff+1
                        TST       _ACCA
                        BRPL      ACV._L0477
                        NEG       _ACCB
                        BRNE      ACV._L0478
                        DEC       _ACCA
ACV._L0478:
                        COM       _ACCA
ACV._L0477:
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        CPI       _ACCA, 080h
                        BRNE      ACV._L0479
                        CPI       _ACCB, 002h
ACV._L0479:
                        LDI       _ACCA, 0h
                        BREQ      ACV._L0480
                        BRLO      ACV._L0480
                        SER       _ACCA
ACV._L0480:
                        TST       _ACCA
                        .BRANCH   4,ACV._L0483
                        BRNE      ACV._L0483
                        .BRANCH   20,ACV._L0481
                        JMP       ACV._L0481
ACV._L0483:
                        .BLOCK    1157
                        .LINE     1157
                        LDS       _ACCB, ACV.IncrDiff
                        LDS       _ACCA, ACV.IncrDiff+1
                        PUSH      _ACCB
                        PUSH      _ACCA
                        POP       _ACCAHI
                        POP       _ACCALO
                        ADD       _ACCB, _ACCALO
                        ADC       _ACCA, _ACCAHI
                        STS       ACV.INCRDIFF, _ACCB
                        STS       ACV.INCRDIFF+1, _ACCA
                        .ENDBLOCK 1158
ACV._L0481:
ACV._L0482:
                        .LINE     1159
                        LDS       _ACCB, ACV.IncrDiff
                        LDS       _ACCA, ACV.IncrDiff+1
                        LDI       _ACCBLO, 0000Ah AND 0FFh
                        LDI       _ACCBHI, 0000Ah SHRB 8
                        SET
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.MUL16
                        STS       ACV.INCRACCINT10, _ACCB
                        STS       ACV.INCRACCINT10+1, _ACCA
                        .LINE     1160
                        LDI       _ACCA, 00Ah
                        STS       ACV.DisplayTimer, _ACCA
                        .LINE     1161
                        LDS       _ACCA, ACV.FirstTurn
                        TST       _ACCA
                        .BRANCH   4,ACV._L0486
                        BRNE      ACV._L0486
                        .BRANCH   20,ACV._L0484
                        JMP       ACV._L0484
ACV._L0486:
                        .BLOCK    1161
                        .LINE     1162
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDS       _ACCA, ACV.Status
                        SUBI      _ACCA, -043h AND 0FFh
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ACV.SERPROMPT
                        CALL      ACV.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 1163
ACV._L0484:
ACV._L0485:
                        .LINE     1164
                        LDS       _ACCA, ACV.Modify
                        .LINE     1165
                        CPI       _ACCA, 0
                        .BRANCH   3,ACV._L0490
                        BREQ      ACV._L0490
                        .BRANCH   20,ACV._L0489
                        JMP       ACV._L0489
ACV._L0490:
ACV._L0488:
                        .BLOCK    1166
                        .LINE     1166
                        LDS       _ACCA, ACV.AuxCmd
                        PUSH      _ACCA
                        LDS       _ACCB, ACV.IncrDiff
                        LDS       _ACCA, ACV.IncrDiff+1
                        MOV       _ACCA, _ACCB
                        POP       _ACCB
                        ADD       _ACCA, _ACCB
                        STS       ACV.AUXCMD, _ACCA
                        .LINE     1168
                        LDI       _ACCA, 009h
                        STS       ACV.SUBCH, _ACCA
                        .LINE     1169
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,ACV.PARSEGETPARAM
                        CALL      ACV.PARSEGETPARAM
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1170
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCA, ACV.AuxCmd
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,ACV.SERAUX
                        CALL      ACV.SERAUX
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 1171
                        .BRANCH   20,ACV._L0487
                        JMP       ACV._L0487
ACV._L0489:
                        .LINE     1172
                        CPI       _ACCA, 1
                        .BRANCH   3,ACV._L0493
                        BREQ      ACV._L0493
                        .BRANCH   20,ACV._L0492
                        JMP       ACV._L0492
ACV._L0493:
ACV._L0491:
                        .BLOCK    1173
                        .LINE     1173
                        LDS       _ACCA, ACV.SPDIFrate
                        MOV       ACV.I, _ACCA
                        .LINE     1174
                        MOV       _ACCA, ACV.i
                        PUSH      _ACCA
                        LDS       _ACCA, ACV.IncrDiffByte
                        POP       _ACCB
                        ADD       _ACCA, _ACCB
                        MOV       ACV.I, _ACCA
                        .LINE     1175
                        MOV       _ACCA, ACV.i
                        STS       ACV.SPDIFRATE, _ACCA
                        .LINE     1176
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,ACV.CHECKLIMITS
                        CALL       ACV.CHECKLIMITS
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1177
                        .BRANCH   17,ACV.INITSPDIF
                        CALL      ACV.INITSPDIF
                        .ENDBLOCK 1180
                        .BRANCH   20,ACV._L0487
                        JMP       ACV._L0487
ACV._L0492:
                        .LINE     1181
                        CPI       _ACCA, 2
                        .BRANCH   3,ACV._L0496
                        BREQ      ACV._L0496
                        .BRANCH   20,ACV._L0495
                        JMP       ACV._L0495
ACV._L0496:
                        .BRANCH   20,ACV._L0494
                        JMP       ACV._L0494
ACV._L0495:
                        CPI       _ACCA, 4
                        .BRANCH   3,ACV._L0498
                        BREQ      ACV._L0498
                        .BRANCH   20,ACV._L0497
                        JMP       ACV._L0497
ACV._L0498:
                        .BRANCH   20,ACV._L0494
                        JMP       ACV._L0494
ACV._L0497:
                        CPI       _ACCA, 3
                        .BRANCH   3,ACV._L0500
                        BREQ      ACV._L0500
                        .BRANCH   20,ACV._L0499
                        JMP       ACV._L0499
ACV._L0500:
ACV._L0494:
                        .BLOCK    1182
                        .LINE     1182
                        LDI       _ACCA, 00Ah
                        STS       ACV.DisplayTimer, _ACCA
                        .LINE     1183
                        LDI       _ACCA, 04Bh
                        STS       ACV.BarGraphDelayTimer, _ACCA
                        .LINE     1184
                        LDS       _ACCA, ACV.Gain
                        PUSH      _ACCA
                        LDS       _ACCA, ACV.IncrDiffByte
                        POP       _ACCB
                        ADD       _ACCA, _ACCB
                        STS       ACV.GAIN, _ACCA
                        .LINE     1185
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,ACV.CHECKLIMITS
                        CALL       ACV.CHECKLIMITS
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1186
                        .BRANCH   17,ACV.SWITCHGAIN
                        CALL      ACV.SWITCHGAIN
                        .LINE     1187
                        LDI       _ACCA, 013h
                        STS       ACV.SUBCH, _ACCA
                        .LINE     1188
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,ACV.PARSEGETPARAM
                        CALL      ACV.PARSEGETPARAM
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 1189
                        .BRANCH   20,ACV._L0487
                        JMP       ACV._L0487
ACV._L0499:
ACV._L0487:
                        .LINE     1191
                        LDI       _ACCA, 00000h SHRB 8
                        LDI       _ACCB, 00000h AND 0FFh
                        STS       ACV.INCRDIFF, _ACCB
                        STS       ACV.INCRDIFF+1, _ACCA
                        .LINE     1192
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,ACV.CHECKLIMITS
                        CALL       ACV.CHECKLIMITS
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1193
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,ACV.SOLLWERTEONLCD
                        CALL      ACV.SOLLWERTEONLCD
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1194
                        LDI       _ACCA, 000h
                        STS       ACV.FIRSTTURN, _ACCA
                        .ENDBLOCK 1195
ACV._L0467:
ACV._L0468:
                        .ENDBLOCK 1196
ACV._L0459:
ACV._L0460:
                        .LINE     1197
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,ACV.CHECKDELAY
                        CALL      ACV.CHECKDELAY
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1198
                        LDI       _ACCA, 000h
                        .FRAME  0
                        CALL       SYSTEM.LCDPORTINP_M
                        ORI       _ACCA, 0C7h
                        STS       ACV.BUTTONTEMP, _ACCA
                        .LINE     1199
                        LDS       _ACCA, ACV.ButtonTemp
                        CPI       _ACCA, 0FFh
                        LDI       _ACCA, 0h
                        BREQ      ACV._L0501
                        SER       _ACCA
ACV._L0501:
                        TST       _ACCA
                        .BRANCH   4,ACV._L0504
                        BRNE      ACV._L0504
                        .BRANCH   20,ACV._L0502
                        JMP       ACV._L0502
ACV._L0504:
                        .BLOCK    1199
                        .LINE     1200
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,ACV.CHECKDELAY
                        CALL      ACV.CHECKDELAY
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1201
                        LDI       _ACCA, 000h
                        .FRAME  0
                        CALL       SYSTEM.LCDPORTINP_M
                        ORI       _ACCA, 0C7h
                        STS       ACV.BUTTONTEMP, _ACCA
                        .LINE     1202
                        LDS       _ACCA, ACV.ButtonTemp
                        CPI       _ACCA, 0FFh
                        LDI       _ACCA, 0h
                        BREQ      ACV._L0505
                        SER       _ACCA
ACV._L0505:
                        TST       _ACCA
                        .BRANCH   4,ACV._L0508
                        BRNE      ACV._L0508
                        .BRANCH   20,ACV._L0506
                        JMP       ACV._L0506
ACV._L0508:
                        .BLOCK    1202
                        .LINE     1203
                        LDI       _ACCA, 0FFh
                        STS       ACV.CHANGEDFLAG, _ACCA
                        .LINE     1204
                        LDS       _ACCA, 0024Fh
                        SBR       _ACCA, 080h
                        STS       0024Fh, _ACCA
                        .LINE     1205
                        LDS       _ACCB, 001A3h
                        CLR       _ACCA
                        SBRC      _ACCB, 003h
                        SER       _ACCA
                        COM       _ACCA
                        TST       _ACCA
                        .BRANCH   4,ACV._L0511
                        BRNE      ACV._L0511
                        .BRANCH   20,ACV._L0509
                        JMP       ACV._L0509
ACV._L0511:
                        .BLOCK    1205
                        .LINE     1206
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDS       _ACCA, ACV.Status
                        SUBI      _ACCA, -043h AND 0FFh
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ACV.SERPROMPT
                        CALL      ACV.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1207
                        LDI       _ACCA, 0FFh
                        STS       ACV.INCRENTER, _ACCA
                        .ENDBLOCK 1208
ACV._L0509:
ACV._L0510:
                        .LINE     1209
                        LDS       _ACCB, 001A3h
                        CLR       _ACCA
                        SBRC      _ACCB, 005h
                        SER       _ACCA
                        COM       _ACCA
                        TST       _ACCA
                        .BRANCH   4,ACV._L0514
                        BRNE      ACV._L0514
                        .BRANCH   20,ACV._L0512
                        JMP       ACV._L0512
ACV._L0514:
                        .BLOCK    1209
                        .LINE     1210
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDS       _ACCA, ACV.Status
                        SUBI      _ACCA, -041h AND 0FFh
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ACV.SERPROMPT
                        CALL      ACV.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1211
                        LDS       _ACCA, ACV.Modify
                        INC       _ACCA
                        CPI       _ACCA, 5
                        BRCS      ACV._L0515
                        CLR       _ACCA
ACV._L0515:
                        STS       ACV.Modify, _ACCA
                        .ENDBLOCK 1212
ACV._L0512:
ACV._L0513:
                        .LINE     1213
                        LDS       _ACCB, 001A3h
                        CLR       _ACCA
                        SBRC      _ACCB, 004h
                        SER       _ACCA
                        COM       _ACCA
                        TST       _ACCA
                        .BRANCH   4,ACV._L0518
                        BRNE      ACV._L0518
                        .BRANCH   20,ACV._L0516
                        JMP       ACV._L0516
ACV._L0518:
                        .BLOCK    1213
                        .LINE     1214
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDS       _ACCA, ACV.Status
                        SUBI      _ACCA, -042h AND 0FFh
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ACV.SERPROMPT
                        CALL      ACV.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1215
                        LDS       _ACCA, ACV.Modify
                        DEC       _ACCA
                        BRPL      ACV._L0519
                        LDI       _ACCA, 4
ACV._L0519:
                        STS       ACV.Modify, _ACCA
                        .ENDBLOCK 1216
ACV._L0516:
ACV._L0517:
                        .LINE     1217
                        LDI       _ACCA, 00Ah
                        STS       ACV.DisplayTimer, _ACCA
                        .LINE     1218
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,ACV.SOLLWERTEONLCD
                        CALL      ACV.SOLLWERTEONLCD
                        POP       _FPTRHI
                        POP       _FRAMEPTR
ACV._L0520:
                        .BLOCK    1219
                        .LINE     1220
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 001h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,ACV.CHECKDELAY
                        CALL      ACV.CHECKDELAY
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1221
                        LDI       _ACCA, 000h
                        .FRAME  0
                        CALL       SYSTEM.LCDPORTINP_M
                        ORI       _ACCA, 0C7h
                        STS       ACV.BUTTONTEMP, _ACCA
                        .ENDBLOCK 1222
                        .LINE     1222
ACV._L0521:
                        LDS       _ACCA, ACV.ButtonTemp
                        CPI       _ACCA, 0FFh
                        LDI       _ACCA, 0h
                        BRNE      ACV._L0523
                        SER       _ACCA
ACV._L0523:
                        TST       _ACCA
                        .BRANCH   4,ACV._L0524
                        BRNE      ACV._L0524
                        .BRANCH   20,ACV._L0520
                        JMP       ACV._L0520
ACV._L0524:
ACV._L0522:
                        .LINE     1223
                        LDI       _ACCA, 000h
                        STS       ACV.FIRSTTURN, _ACCA
                        .ENDBLOCK 1224
ACV._L0506:
ACV._L0507:
                        .ENDBLOCK 1225
ACV._L0502:
ACV._L0503:
                        .ENDBLOCK 1226
ACV._L0454:
ACV._L0455:
                        .LINE     1227
                        SER       _ACCA
                        LDS       _ACCB, ACV.IncrTimer
                        TST       _ACCB
                        BREQ      ACV._L0525
                        COM       _ACCA
ACV._L0525:
                        TST       _ACCA
                        .BRANCH   4,ACV._L0528
                        BRNE      ACV._L0528
                        .BRANCH   20,ACV._L0526
                        JMP       ACV._L0526
ACV._L0528:
                        .BLOCK    1227
                        .LINE     1228
                        LDI       _ACCA, 014h
                        STS       ACV.IncrTimer, _ACCA
                        .LINE     1229
                        LDS       _ACCA, ACV.FirstTurn
                        COM       _ACCA
                        TST       _ACCA
                        .BRANCH   4,ACV._L0531
                        BRNE      ACV._L0531
                        .BRANCH   20,ACV._L0529
                        JMP       ACV._L0529
ACV._L0531:
                        .BLOCK    1229
                        .LINE     1230
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        LDS       _ACCA, ACV.Status
                        SUBI      _ACCA, -040h AND 0FFh
                        ST        -Y, _ACCA
                        .FRAME  2
                        .FRAME  0
                        .BRANCH   17,ACV.SERPROMPT
                        CALL      ACV.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .ENDBLOCK 1231
ACV._L0529:
ACV._L0530:
                        .LINE     1232
                        LDI       _ACCA, 0FFh
                        STS       ACV.FIRSTTURN, _ACCA
                        .ENDBLOCK 1233
ACV._L0526:
ACV._L0527:
                        .LINE     1235
                        SER       _ACCA
                        LDS       _ACCB, ACV.DisplayTimer
                        TST       _ACCB
                        BREQ      ACV._L0532
                        COM       _ACCA
ACV._L0532:
                        PUSH      _ACCA
                        LDS       _ACCA, ACV.LCDpresent
                        POP       _ACCB
                        AND       _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   4,ACV._L0535
                        BRNE      ACV._L0535
                        .BRANCH   20,ACV._L0533
                        JMP       ACV._L0533
ACV._L0535:
                        .BLOCK    1235
                        .LINE     1236
                        LDI       _ACCA, 00Ah
                        STS       ACV.DisplayTimer, _ACCA
                        .LINE     1237
                        LDS       _ACCA, 0024Fh
                        CBR       _ACCA, 080h
                        STS       0024Fh, _ACCA
                        .LINE     1238
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,ACV.SOLLWERTEONLCD
                        CALL      ACV.SOLLWERTEONLCD
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .LINE     1239
                        LDI       _ACCA, 000h
                        STS       ACV.CHANGEDFLAG, _ACCA
                        .ENDBLOCK 1240
ACV._L0533:
ACV._L0534:
                        .ENDBLOCK 1241
                        .LINE     1241
                        .BRANCH   20,ACV._L0448
                        JMP       ACV._L0448
ACV._L0449:
                        .ENDBLOCK 1242

ACV.$_MAINEX:
                        .LINE     1242
                        NOP
                        .LINE     1242
                        .BRANCH   20,ACV.$_MAINEX
                        RJMP      ACV.$_MAINEX


                        .ENDFUNC  1242

SYSTEM.$Main_stk        .EQU    00257h          ; var iData  Process stack area
SYSTEM.$Main_stk_e      .EQU    002D6h          ; var iData  Process stack area
SYSTEM.$Main_Frame      .EQU    002D7h          ; var iData  Process stack area
SYSTEM.$Main_Frame_e    .EQU    00356h          ; var iData  Process stack area

                        ; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                        ; Initialisation and Library Routines
                        ; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

                        .ENTRY
SYSTEM.RESET:
                        CLI
                        ; >> Stack Init [main process only] <<
                        LDI       _ACCA, 002h
                        LDI       _ACCB, 0D6h
                        OUT       sph, _ACCA
                        OUT       spl, _ACCB


                        ; >> Memory Init <<
                        CLR       _ACCA
                        LDI       _ACCCLO, 16
                        LDI       _ACCCHI, 0
                        LDI       _ACCBLO, 0
                        LDI       _ACCBHI, 0
                        ADIW      _ACCCLO, 1
SYSTEM._L0536:
                        SBIW      _ACCCLO, 001h
                        BREQ      SYSTEM._L0538
SYSTEM._L0537:
                        ST        X+, _ACCA
                        RJMP      SYSTEM._L0536
SYSTEM._L0538:
                        LDI       _ACCBLO, 00100h AND 0FFh
                        LDI       _ACCBHI, 00100h SHRB 8
                        LDI       _ACCCLO, 00400h AND 0FFh
                        LDI       _ACCCHI, 00400h SHRB 8
                        ADIW      _ACCCLO, 1
SYSTEM._L0539:
                        SBIW      _ACCCLO, 001h
                        BREQ      SYSTEM._L0541
SYSTEM._L0540:
                        ST        X+, _ACCA
                        RJMP      SYSTEM._L0539
SYSTEM._L0541:
                        LDI       _FRAMEPTR, 00356h AND 0FFh
                        LDI       _FPTRHI, 00356h SHRB 8

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
                        STS       timsk0, _ACCA

                        ; >> ADC Init <<
                        LDI       _ACCA, 002h
                        STS       admux, _ACCA
                        LDI       _ACCA ,0C6h
                        STS       adcsr, _ACCA

                        ; >> SERPORT Init <<
                        ; >> Baudrate 38400Baud <<
                        
                        ; percent Baudrate error : >> 0.160% <<
                        LDI       _ACCA, 018h
                        STS       ucr1, _ACCA
                        LDI       _ACCA, 019h
                        STS       ubrr1, _ACCA
                        LDI       _ACCA, 000h
                        STS       ubrrh, _ACCA
                        LDI       _ACCA, 0
                        STS       _RXINP, _ACCA
                        STS       _RXOUTP, _ACCA
                        STS       _RXCOUNT, _ACCA
                        LDS       _ACCA, ucr1
                        SBR       _ACCA, 80h
                        STS       ucr1, _ACCA
                        LDI       _ACCA, 0
                        STS       _TXINP, _ACCA
                        STS       _TXOUTP, _ACCA
                        STS       _TXCOUNT, _ACCA
                        LDI       _ACCA, 006h
                        STS       ucsrc, _ACCA
                        LDS       _ACCA, UDR1

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
                        STS       TWBR, _ACCA
                        LDI       _ACCA, 0FFh
                        STS       TWI_DevLock, _ACCA

                        CLR       Flags
                        CLR       Flags2

                        ; ============ Start User Main Program ============

                        .DEB      MAINENTRY
                        JMP       ACV.$_Main

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
                        LDS       _ACCB, adcl
                        LDS       _ACCA, adch
                        PUSH      _ACCBLO
                        PUSH      _ACCBHI
                        LDS       _ACCCHI, admux
                        ANDI      _ACCCHI, 7
                        LDI       _ACCCLO, 002h
                        CP        _ACCCLO, _ACCCHI
                        BRNE      SYSTEM._L0542
                        LDS       _ACCBLO, _ADCBUFF
                        LDS       _ACCBHI, _ADCBUFF+1
                        ADD       _ACCB, _ACCBLO;
                        ADC       _ACCA, _ACCBHI;
                        LSR       _ACCA
                        ROR       _ACCB
                        STS       _ADCBUFF, _ACCB
                        STS       _ADCBUFF+1, _ACCA
                        LDI       _ACCCLO, 003h
                        RJMP      SYSTEM._L0543
SYSTEM._L0542:
                        LDS       _ACCBLO, _ADCBUFF+2
                        LDS       _ACCBHI, _ADCBUFF+3
                        ADD       _ACCB, _ACCBLO;
                        ADC       _ACCA, _ACCBHI;
                        LSR       _ACCA
                        ROR       _ACCB
                        STS       _ADCBUFF+2, _ACCB
                        STS       _ADCBUFF+3, _ACCA
SYSTEM._L0543:
                        LDS       _ACCA, _ADCBUFF+4
                        ANDI      _ACCA, 1
                        BRNE      SYSTEM._L0544
                        LDS       _ACCCHI, admux
                        CBR       _ACCCHI, 7
                        OR        _ACCCLO, _ACCCHI
                        STS       admux, _ACCCLO
SYSTEM._L0544:
                        POP       _ACCBHI
                        POP       _ACCBLO
                        ;
                        LDS       _ACCB, _TWI_TO
                        TST       _ACCB
                        BREQ      SYSTEM._L0545
                        DEC       _ACCB
                        STS       _TWI_TO, _ACCB
SYSTEM._L0545:
                        LDS       _ACCA, _RXTIMEOUT
                        TST       _ACCA
                        BREQ      SYSTEM._L0546
                        DEC       _ACCA
                        STS       _RXTIMEOUT, _ACCA
SYSTEM._L0546:
                        LDS       _ACCA, ACV.ActivityTimer
                        TST       _ACCA
                        BREQ      SYSTEM._L0547
                        SUBI      _ACCA, 1
                        STS       ACV.ActivityTimer, _ACCA
SYSTEM._L0547:
                        LDS       _ACCA, ACV.DisplayTimer
                        TST       _ACCA
                        BREQ      SYSTEM._L0548
                        SUBI      _ACCA, 1
                        STS       ACV.DisplayTimer, _ACCA
SYSTEM._L0548:
                        LDS       _ACCA, ACV.BarGraphDelayTimer
                        TST       _ACCA
                        BREQ      SYSTEM._L0549
                        SUBI      _ACCA, 1
                        STS       ACV.BarGraphDelayTimer, _ACCA
SYSTEM._L0549:
                        LDS       _ACCA, ACV.IncrTimer
                        TST       _ACCA
                        BREQ      SYSTEM._L0550
                        SUBI      _ACCA, 1
                        STS       ACV.IncrTimer, _ACCA
SYSTEM._L0550:
                        LDI       _ACCA, 1 SHLB IntFlag
                        OR        Flags, _ACCA
                        LDS       _ACCA, adcsr
                        SBR       _ACCA, 40h
                        STS       adcsr, _ACCA
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
                        BRNE      SYSTEM._L0551
SYSTEM._L0555:
                        LDS       _ACCA, ucr1
                        CBR       _ACCA, 20h
                        STS       ucr1, _ACCA
                        RJMP      SYSTEM._L0553
SYSTEM._L0551:
                        LDS       _ACCB, _TXOUTP
                        CLR       _ACCA
                        LDI       _ACCCLO, _TXBUFF AND 0FFh
                        LDI       _ACCCHI, _TXBUFF SHRB 8
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCA, Z
                        STS       UDR1, _ACCA
                        LDS       _ACCA, _TXCOUNT
                        DEC       _ACCA
                        STS       _TXCOUNT, _ACCA
                        BRNE      SYSTEM._L0554
                        LDS       _ACCA, ucr1
                        CBR       _ACCA, 20h
                        STS       ucr1, _ACCA
SYSTEM._L0554:
                        INC       _ACCB
                        CPI       _ACCB, 64
                        BRNE      SYSTEM._L0552
                        CLR       _ACCB
SYSTEM._L0552:
                        STS       _TXOUTP, _ACCB
SYSTEM._L0553:
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
SYSTEM._L0561:
                        LDS       _ACCA, _RXCOUNT
                        CPI       _ACCA, 64
                        BRNE      SYSTEM._L0556
                        LDS       _ACCB, UDR1
                        RJMP      SYSTEM._L0558
SYSTEM._L0556:
                        LDS       _ACCA, UDR1
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
                        CPI       _ACCB, 64
                        BRNE      SYSTEM._L0557
                        CLR       _ACCB
SYSTEM._L0557:
                        STS       _RXINP, _ACCB
                        LDS       _ACCB, usr1
                        SBRC      _ACCB, 7
                        RJMP      SYSTEM._L0561
SYSTEM._L0558:
SYSTEM._L0563:
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
                        RJMP      SYSTEM._L0569

SYSTEM._L0564:
                        MOV       _ACCB, _ACCA
                        LSR       _ACCA
                        LSR       _ACCA
                        ANDI      _ACCB, 3
                        BREQ      SYSTEM._L0565
                        CPI       _ACCB, 3
                        BRNE      SYSTEM._L0566
SYSTEM._L0565:
                        ADIW      _ACCCLO, 2
                        RET
SYSTEM._L0566:
                        LDD       _ACCALO, Z+0
                        LDD       _ACCAHI, Z+1
                        CPI       _ACCB, 1
                        BREQ      SYSTEM._L0567
                        SUBI      _ACCALO, 0FFh
                        SBCI      _ACCAHI, 0FFh
                        RJMP      SYSTEM._L0568
SYSTEM._L0567:
                        SUBI      _ACCALO, 1
                        SBCI      _ACCAHI, 0
SYSTEM._L0568:
                        ST        Z+, _ACCALO
                        ST        Z+, _ACCAHI
                        RET

SYSTEM._L0569:
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        PUSH      _ACCDLO
                        PUSH      _ACCDHI
                        IN        _ACCA, PINC
                        .DEB      Incr4Int
                        ANDI      _ACCA, 03h;
                        LDI       _ACCCLO, _INCRSTATE4 AND 0FFh
                        LDI       _ACCCHI, _INCRSTATE4 SHRB 8
                        LDD       _ACCB, Z+0
                        STD       Z+0, _ACCA
                        MOV       _ACCALO, _ACCB;
                        EOR       _ACCALO, _ACCA;
                        BREQ      SYSTEM._L0570
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
                        RCALL     SYSTEM._L0564
SYSTEM._L0570:
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

SYSTEM._LCDbarCalc:
                        LDD       _ACCA, Y+000h
                        LDD        _ACCB, Z+2
                        CALL      SYSTEM.MUL8
                        MOV       _ACCBHI, _ACCB
                        MOV       _ACCBLO, _ACCA
                        LDD       _ACCALO, Z+3
                        LDI       _ACCAHI, 00h
                        CLT
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.DIV16_R
                        MOV       _ACCA, _ACCB
                        LDI       _ACCB, 5
                        CALL      SYSTEM.DIV8_R
                        MOV       _ACCBHI, _ACCB
                        MOV       _ACCBLO, _ACCA
                        RET

SYSTEM.LCDbarSet1:
                        LDD       _ACCA, Y+000h
                        STS       _bgScal1, _ACCA
                        LDD       _ACCA, Y+001h
                        STS       _bgLen1, _ACCA
                        LDI       _ACCB, 05h
                        CALL      SYSTEM.MUL8
                        STS       _bgLenx5_1, _ACCA
                        LDD       _ACCA, Y+002h
                        STS       _bgPosA1, _ACCA
                        LDD       _ACCA, Y+003h
                        STS       _bgLine1, _ACCA
                        RET

SYSTEM.LCDbarOut1:
                        LDI       _ACCCLO, _bgPosA1 AND 0FFh
                        LDI       _ACCCHI, _bgPosA1 SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, _LCDM_PORT
                        ST        -Y, _ACCA
                        LDD       _ACCA, Z+0
                        ST        -Y, _ACCA
                        LDD       _ACCA, Z+4
                        ST        -Y, _ACCA
                        CALL      SYSTEM.LCDxy_M
                        ADIW      _FRAMEPTR, 3
                        POP       _ACCCHI
                        POP       _ACCCLO
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        RCALL     SYSTEM._LCDbarCalc
                        POP       _ACCCHI
                        POP       _ACCCLO
                        CLR       _ACCALO
                        LDD       _ACCA, Z+1
                        CP        _ACCBLO, _ACCA
                        BRCC      SYSTEM._L0574
                        TST       _ACCBLO
                        BREQ      SYSTEM._L0572
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
SYSTEM._L0571:
                        PUSH      _ACCBLO
                        PUSH      _ACCBHI
                        PUSH      _ACCALO
                        LDI       _ACCA, 4
                        CALL      SYSTEM.LCDout_M
                        POP       _ACCALO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        INC       _ACCALO
                        CP        _ACCALO, _ACCBLO
                        BRCS      SYSTEM._L0571
                        POP       _ACCCHI
                        POP       _ACCCLO
SYSTEM._L0572:
                        TST       _ACCBHI
                        BREQ      SYSTEM._L0573
                        PUSH      _ACCALO
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        DEC       _ACCBHI
                        MOV       _ACCA, _ACCBHI
                        CALL      SYSTEM.LCDout_M
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCALO
                        INC       _ACCALO
SYSTEM._L0573:
                        LDD       _ACCB, Z+1
SYSTEM._L0576:
                        CP        _ACCALO, _ACCB
                        BRCC      SYSTEM._L0577
                        PUSH      _ACCB
                        PUSH      _ACCALO
                        LDI       _ACCA, 20h
                        CALL      SYSTEM.LCDout_M
                        POP       _ACCALO
                        POP       _ACCB
                        INC       _ACCALO
                        RJMP      SYSTEM._L0576
SYSTEM._L0574:
                        LDD       _ACCB, Z+1
SYSTEM._L0575:
                        PUSH      _ACCB
                        PUSH      _ACCALO
                        LDI       _ACCA, 4
                        CALL      SYSTEM.LCDout_M
                        POP       _ACCALO
                        POP       _ACCB
                        INC       _ACCALO
                        CP        _ACCALO, _ACCB
                        BRCS      SYSTEM._L0575
SYSTEM._L0577:
                        RET

SYSTEM.LCDbarSet2:
                        LDD       _ACCA, Y+000h
                        STS       _bgScal2, _ACCA
                        LDD       _ACCA, Y+001h
                        STS       _bgLen2, _ACCA
                        LDI       _ACCB, 05h
                        CALL      SYSTEM.MUL8
                        STS       _bgLenx5_2, _ACCA
                        LDD       _ACCA, Y+002h
                        STS       _bgPosA2, _ACCA
                        LDD       _ACCA, Y+003h
                        STS       _bgLine2, _ACCA
                        RET

SYSTEM.LCDbarOut2:
                        LDI       _ACCCLO, _bgPosA2 AND 0FFh
                        LDI       _ACCCHI, _bgPosA2 SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, _LCDM_PORT
                        ST        -Y, _ACCA
                        LDD       _ACCA, Z+0
                        ST        -Y, _ACCA
                        LDD       _ACCA, Z+4
                        ST        -Y, _ACCA
                        CALL      SYSTEM.LCDxy_M
                        ADIW      _FRAMEPTR, 3
                        POP       _ACCCHI
                        POP       _ACCCLO
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        RCALL     SYSTEM._LCDbarCalc
                        POP       _ACCCHI
                        POP       _ACCCLO
                        CLR       _ACCALO
                        LDD       _ACCA, Z+1
                        CP        _ACCBLO, _ACCA
                        BRCC      SYSTEM._L0582
                        TST       _ACCBLO
                        BREQ      SYSTEM._L0580
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
SYSTEM._L0579:
                        PUSH      _ACCBLO
                        PUSH      _ACCBHI
                        PUSH      _ACCALO
                        LDI       _ACCA, 4
                        CALL      SYSTEM.LCDout_M
                        POP       _ACCALO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        INC       _ACCALO
                        CP        _ACCALO, _ACCBLO
                        BRCS      SYSTEM._L0579
                        POP       _ACCCHI
                        POP       _ACCCLO
SYSTEM._L0580:
                        TST       _ACCBHI
                        BREQ      SYSTEM._L0581
                        PUSH      _ACCALO
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        DEC       _ACCBHI
                        MOV       _ACCA, _ACCBHI
                        CALL      SYSTEM.LCDout_M
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCALO
                        INC       _ACCALO
SYSTEM._L0581:
                        LDD       _ACCB, Z+1
SYSTEM._L0584:
                        CP        _ACCALO, _ACCB
                        BRCC      SYSTEM._L0585
                        PUSH      _ACCB
                        PUSH      _ACCALO
                        LDI       _ACCA, 20h
                        CALL      SYSTEM.LCDout_M
                        POP       _ACCALO
                        POP       _ACCB
                        INC       _ACCALO
                        RJMP      SYSTEM._L0584
SYSTEM._L0582:
                        LDD       _ACCB, Z+1
SYSTEM._L0583:
                        PUSH      _ACCB
                        PUSH      _ACCALO
                        LDI       _ACCA, 4
                        CALL      SYSTEM.LCDout_M
                        POP       _ACCALO
                        POP       _ACCB
                        INC       _ACCALO
                        CP        _ACCALO, _ACCB
                        BRCS      SYSTEM._L0583
SYSTEM._L0585:
                        RET

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
                        BREQ       SYSTEM._L0587
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
                        RJMP      SYSTEM._L0588
SYSTEM._L0587:
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
SYSTEM._L0588:
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
                        BREQ       SYSTEM._L0589
                        LDS       _ACCDLO, _LCDM_PORT
                        ORI       _ACCDLO, 20h
                        LDI       _ACCBLO, 00000h AND 0FFh
                        LDI       _ACCBHI, 00000h SHRB 8
                        LDI       _ACCAHI, 000h
                        LDI       _ACCDHI, 000h
                        CALL      SYSTEM.TWIout
SYSTEM._L0589:
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
SYSTEM._L0590:
                        RCALL     SYSTEM._LCDM_Busy_Rd
                        TST       _ACCA
                        BRPL       SYSTEM._L0591
                        SBIW      _ACCCLO, 1
                        BRNE      SYSTEM._L0590
                        CLR       _ACCB
                        CLR       _ACCA
                        RET
SYSTEM._L0591:
                        MOV       _ACCB, _ACCA
                        SER       _ACCA
                        RET

SYSTEM._LCDM_Ctrl_Wr:
                        PUSH      _ACCA
                        RCALL     SYSTEM._LCDWAIT_M
                        TST       _ACCA
                        BRNE      SYSTEM._L0592
                        POP       _ACCB
                        RET
SYSTEM._L0592:
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
                        BRNE       SYSTEM._L0593
                        RET
SYSTEM._L0593:
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
                        RJMP      SYSTEM._L0594
SYSTEM.LCDCURSOR_M:
                        LDD       _ACCA, Y+002h
                        STS       _LCDM_PORT, _ACCA
                        LDD       _ACCA, Y+000h
                        LDD       _ACCB, Y+001h
SYSTEM._L0594:
                        TST       _ACCA
                        BRNE       SYSTEM._L0595
                        LDI       _ACCA, 0Ch
                        RJMP      SYSTEM._L0596

SYSTEM._L0595:
                        LDI       _ACCA, 0Dh
SYSTEM._L0596:
                        TST       _ACCB
                        BREQ       SYSTEM._L0597
                        ORI       _ACCA, 2
SYSTEM._L0597:
                        RJMP      SYSTEM._LCDM_Ctrl_Wr

SYSTEM.LCDXY_M:
                        LDD       _ACCA, Y+002h
                        STS       _LCDM_PORT, _ACCA
                        LDD       _ACCA, Y+000h
                        LDD       _ACCB, Y+001h
                        CPI       _ACCA, 0
                        BRNE       SYSTEM._L0598
                        LDI       _ACCA, 080h
                        RJMP      SYSTEM._L0602

SYSTEM._L0598:
                        CPI       _ACCA, 1
                        BRNE       SYSTEM._L0599
                        LDI       _ACCA, 0C0h
                        RJMP      SYSTEM._L0602

SYSTEM._L0599:
                        CPI       _ACCA, 2
                        BRNE       SYSTEM._L0600
                        LDI       _ACCA, 088h
                        RJMP      SYSTEM._L0602

SYSTEM._L0600:
                        CPI       _ACCA, 3
                        BRNE       SYSTEM._L0601
                        LDI       _ACCA, 0C8h
                        RJMP      SYSTEM._L0602

SYSTEM._L0601:
                        LDI       _ACCA, 080h
SYSTEM._L0602:
                        ADD       _ACCA, _ACCB
                        RJMP      SYSTEM._LCDM_Ctrl_Wr_NW

SYSTEM._LCDBARSET_M:
                        RCALL     SYSTEM._LCDM_Ctrl_Wr
                        MOV       _ACCA, _ACCFLO
                        RCALL     SYSTEM._LCDM_Data_Wr
                        MOV       _ACCA, _ACCFLO
                        RCALL     SYSTEM._LCDM_Data_Wr
                        MOV       _ACCA, _ACCFLO
                        RCALL     SYSTEM._LCDM_Data_Wr
                        MOV       _ACCA, _ACCFLO
                        RCALL     SYSTEM._LCDM_Data_Wr
                        MOV       _ACCA, _ACCFLO
                        RCALL     SYSTEM._LCDM_Data_Wr
                        MOV       _ACCA, _ACCFLO
                        RCALL     SYSTEM._LCDM_Data_Wr
                        MOV       _ACCA, _ACCFLO
                        RCALL     SYSTEM._LCDM_Data_Wr
                        MOV       _ACCA, _ACCFLO
                        RCALL     SYSTEM._LCDM_Data_Wr
                        RET

SYSTEM.LCDbarInit_M:
                        LDI       _ACCA, $40
                        LDI       _ACCFLO, 10h
                        RCALL     SYSTEM._LCDBARSET_M
                        LDI       _ACCA, $48
                        LDI       _ACCFLO, 18h
                        RCALL     SYSTEM._LCDBARSET_M
                        LDI       _ACCA, $50
                        LDI       _ACCFLO, 1Ch
                        RCALL     SYSTEM._LCDBARSET_M
                        LDI       _ACCA, $58
                        LDI       _ACCFLO, 1Eh
                        RCALL     SYSTEM._LCDBARSET_M
                        LDI       _ACCA, $60
                        LDI       _ACCFLO, 1Fh
                        RCALL     SYSTEM._LCDBARSET_M
                        RET

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

SYSTEM.TWISTARTB:
                        LDI       _ACCA, 0
                        STS       TWI_DevLock, _ACCA
                        LDS       _ACCA, TWSR
                        ANDI      _ACCA, 0FCh
                        CPI       _ACCA, 000h
                        BRNE      SYSTEM._L0608
                        LDI       _ACCA, 090h
                        STS       TWCR, _ACCA
SYSTEM._L0608:
                        LDI       _ACCA, 0A4h
                        STS       TWCR, _ACCA
                        LDI       _ACCA, 10
                        STS       _TWI_TO, _ACCA
SYSTEM._L0606:
                        LDS       _ACCA, TWCR
                        ANDI      _ACCA, 080h
                        BRNE      SYSTEM._L0609
                        LDS       _ACCA, _TWI_TO
                        TST       _ACCA
                        BRNE      SYSTEM._L0606
                        STS       TWCR, _ACCA
                        RJMP      SYSTEM.TWI_ERROR
SYSTEM._L0609:
                        LDS       _ACCA, TWSR
                        ANDI      _ACCA, 0FCh
                        CPI       _ACCA, 008h
                        BRNE      SYSTEM._L0613
                        RJMP      SYSTEM.TWI_ERROR
SYSTEM._L0613:
                        RJMP      SYSTEM.TWI_OK

SYSTEM.TWISTOPB:
SYSTEM._L0614:
                        LDS       _ACCA, TWSR
                        ANDI      _ACCA, 0FCh
                        CPI       _ACCA, 0F8h
                        BREQ      SYSTEM._L0614
                        CPI       _ACCA, 000h
                        BRNE      SYSTEM._L0615
                        LDI       _ACCA, 090h
                        STS       TWCR, _ACCA
                        NOP
SYSTEM._L0615:
                        LDI       _ACCB, 094h
                        STS       TWCR, _ACCB
                        SER       _ACCA
                        STS       TWI_DevLock, _ACCA
                        RET

SYSTEM.TWISENDBYTE:
                        STS       TWDR, _ACCDLO
                        LDI       _ACCA, 084h
                        STS       TWCR, _ACCA
                        LDI       _ACCA, 10
                        STS       _TWI_TO, _ACCA
SYSTEM._L0617:
                        LDS       _ACCA, TWCR
                        ANDI      _ACCA, 080h
                        BRNE      SYSTEM._L0618
                        LDS       _ACCA, _TWI_TO
                        TST       _ACCA
                        BRNE      SYSTEM._L0617
                        RJMP      SYSTEM.TWI_ERROR
SYSTEM._L0618:
                        LDS       _ACCA, TWSR
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
                        STS       TWCR, _ACCA
                        SBIW      _ACCBLO, 1
                        BRMI      SYSTEM.TWISTOPB
                        BRNE      SYSTEM._L0619
                        LDI       _ACCA, 084h
SYSTEM._L0619:
                        STS       TWCR, _ACCA
SYSTEM._L0620:
                        LDS       _ACCA, TWCR
                        SBRS      _ACCA, 7
                        RJMP      SYSTEM._L0620
                        LDS       _ACCA, TWSR
                        ANDI      _ACCA, 0FCh
                        CPI       _ACCA, 058h
                        BREQ      SYSTEM._L0622
                        CPI       _ACCA, 050h
                        BRNE      SYSTEM.TWI_ERROR
SYSTEM._L0622:
                        LDS       _ACCA, TWDR
                        ST        Z+, _ACCA
                        RJMP      SYSTEM.TWIRECVBYTE
SYSTEM.TWI_OK:
                        LDI       _ACCA, true
                        RET
SYSTEM.TWI_ERROR:
                        LDS       _ACCA, TWSR
                        ANDI      _ACCA, 0FCh
                        CPI       _ACCA, 000h
                        BRNE      SYSTEM._L0621
                        LDI       _ACCA, 090h
                        STS       TWCR, _ACCA
SYSTEM._L0621:
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
                        BREQ      SYSTEM._L0624
                        RCALL     SYSTEM.TWIRECVBYTE
                        TST       _ACCA
                        BREQ      SYSTEM._L0624
                        RJMP      SYSTEM.TWI_OK
SYSTEM._L0624:
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
                        BREQ      SYSTEM._L0630
SYSTEM._L0625:
                        MOV       _ACCDLO, _ACCAHI
                        RCALL     SYSTEM.TWISENDBYTE
                        TST       _ACCA
                        BREQ      SYSTEM._L0630
                        BST       Flags, _I2C2BYTE
                        BRTC      SYSTEM._L0629
                        MOV       _ACCDLO, _ACCALO
SYSTEM._L0627:
                        RCALL     SYSTEM.TWISENDBYTE
                        TST       _ACCA
                        BREQ      SYSTEM._L0630
SYSTEM._L0629:
                        TST       _ACCBLO
                        BRNE       SYSTEM._L0634
                        TST       _ACCBHI
                        BREQ       SYSTEM._L0628
SYSTEM._L0634:
                        TST       _ACCDHI
                        BRNE      SYSTEM._L0631
                        LD        _ACCDLO, Z+
                        RJMP      SYSTEM._L0633
SYSTEM._L0631:
                        CPI       _ACCDHI, 1
                        BRNE      SYSTEM._L0632
                        LPM       _ACCDLO, Z+
                        RJMP      SYSTEM._L0633
SYSTEM._L0632:
                        CALL      SYSTEM.ReadEEp8D
                        ADIW      _ACCCLO, 01h
SYSTEM._L0633:
                        SBIW      _ACCBLO, 1
                        RJMP      SYSTEM._L0627
SYSTEM._L0628:
                        RCALL     SYSTEM.TWISTOPB
                        RJMP      SYSTEM.TWI_OK
SYSTEM._L0630:
                        RCALL     SYSTEM.TWI_ERROR
                        SER       _ACCB
                        STS       TWI_DevLock, _ACCB
                        CLR       _ACCA
                        RET

SYSTEM.SERINP_TO:
                        LDD       _ACCA, Y+000h
                        STS       _RXTIMEOUT, _ACCA
SYSTEM._L0635:
                        RCALL     SYSTEM.SERSTAT
                        TST       _ACCA
                        BRNE      SYSTEM._L0636
                        LDS       _ACCA, _RXTIMEOUT
                        TST       _ACCA
                        BRNE      SYSTEM._L0635
                        RET
SYSTEM._L0636:
                        RCALL     SYSTEM.SERINP
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        ST        Z+, _ACCA
                        STD       Y+002h, _ACCCHI
                        STD       Y+001h, _ACCCLO
                        SER       _ACCA
                        RET

SYSTEM.SERINP:
SYSTEM._L0637:
                        LDS       _ACCA, _RXCOUNT
                        TST       _ACCA
                        BREQ      SYSTEM._L0637
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
                        CPI       _ACCB, 64
                        BRNE      SYSTEM._L0638
                        CLR       _ACCB
SYSTEM._L0638:
                        STS       _RXOUTP, _ACCB
                        RET

SYSTEM.SERSTAT:
                        CLR       _ACCA
                        LDS       _ACCB, _RXCOUNT
                        TST       _ACCB
                        BREQ      SYSTEM._L0643
                        COM       _ACCA
SYSTEM._L0643:
                        RET

SYSTEM.SEROUT:
SYSTEM._L0647:
                        LDS       _ACCB, _TXCOUNT
                        CPI       _ACCB, 64
                        BREQ      SYSTEM._L0647
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
                        CPI       _ACCB, 64
                        BRNE      SYSTEM._L0648
                        CLR       _ACCB
SYSTEM._L0648:
                        STS       _TXINP, _ACCB
                        LDS       _ACCB, ucr1
                        SBR       _ACCB, 20h
                        STS       ucr1, _ACCB
                        SBRC      Flags, IntFlag
                        SEI
                        RET

SYSTEM.IncrCount4start:
                        CLI
                        LDS       _ACCA, TIMSK1
                        ORI       _ACCA, 002h
                        STS       TIMSK1, _ACCA
                        SBRC      Flags, IntFlag
                        SEI
                        RET

SYSTEM.GetIncrVal4:
                        LDI       _ACCCLO, _INCRCOUNT4_0 AND 0FFh
                        LDI       _ACCCHI, _INCRCOUNT4_0 SHRB 8
                        CPI       _ACCA, 1
                        BRCS      SYSTEM._L0652
                        LDI       _ACCB, 0
                        LDI       _ACCA, 0
                        RET
SYSTEM._L0652:
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
                        BRCS      SYSTEM._L0653
                        RET
SYSTEM._L0653:
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

SYSTEM._MulDivInt:
                        TST       _ACCA
                        BRNE      SYSTEM._L0654
                        CLT
                        BLD       Flags, _SIGN
                        RJMP      SYSTEM._L0655
SYSTEM._L0654:
                        SET
                        BLD       Flags, _SIGN
SYSTEM._L0655:
                        LDD       _ACCB, Y+004h
                        LDD       _ACCA, Y+005h
                        LDD       _ACCBLO, Y+002h
                        LDD       _ACCBHI, Y+003h
                        CALL      SYSTEM.MUL16
                        MOVW      _ACCDLO, _ACCB
                        MOVW      _ACCELO, _ACCCLO
                        LDD       _ACCBLO, Y+000h
                        LDD       _ACCBHI, Y+001h
                        CALL      SYSTEM.DIV32_16
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
SYSTEM._L0656:
                        SUBI      _ACCALO, 001h
                        SBCI      _ACCAHI, 000h
                        BRCS      SYSTEM._L0657
                        LD        _ACCA, Z+
                        ST        X+, _ACCA
                        RJMP      SYSTEM._L0656
SYSTEM._L0657:
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
                        BREQ      SYSTEM._L0658
                        OUT       eedr, _ACCA
                        SBI       eecr, 2
                        SBI       eecr, 1
SYSTEM._L0658:
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
                        BREQ      SYSTEM._L0659
SYSTEM._L0659:
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
                        BREQ      SYSTEM._L0660
                        LSR       _ACCFLO
                        BRNE      SYSTEM._L0662
                        PUSH      _ACCA
                        CALL      SYSTEM.ReadEEp8
                        MOV       _ACCAHI, _ACCA
                        POP       _ACCA
                        ADIW      _ACCCLO, 01h
                        RJMP      SYSTEM._L0661
SYSTEM._L0662:
                        LPM       _ACCAHI, Z+
                        RJMP      SYSTEM._L0661
SYSTEM._L0660:
                        LD        _ACCAHI, Z+
SYSTEM._L0661:
                        TST       _ACCAHI
                        BREQ      SYSTEM._L0669
                        MOV       _ACCFLO, _ACCFHI
                        ANDI      _ACCFLO, 10h
                        BREQ      SYSTEM._L0664
SYSTEM._L0664:
                        LD        _ACCALO, X
SYSTEM._L0666:
                        CP        _ACCB, _ACCA
                        BRCC      SYSTEM._L0668
SYSTEM._L0669:
                        RET
SYSTEM._L0668:
                        MOV       _ACCDLO, _ACCB
                        SUB       _ACCDLO, _ACCA
                        MOV       _ACCDHI, _ACCDLO
                        SUB       _ACCDLO, _ACCAHI
                        BRCS      SYSTEM._L0674
                        CP        _ACCALO, _ACCA
                        BRCC      SYSTEM._L0671
                        MOV       _ACCELO, _ACCAHI
                        ADD       _ACCELO, _ACCALO
                        CP        _ACCB, _ACCELO
                        BRCS      SYSTEM._L0670
                        MOV       _ACCB, _ACCELO
SYSTEM._L0670:
                        RJMP      SYSTEM._L0674
SYSTEM._L0671:
                        PUSH      _ACCBLO
                        PUSH      _ACCBHI
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        MOV       _ACCDHI, _ACCALO
                        SUB       _ACCDHI, _ACCA
                        CP        _ACCDHI, _ACCDLO
                        BRCC      SYSTEM._L0672
                        MOV       _ACCDLO, _ACCDHI
SYSTEM._L0672:
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
                        BREQ      SYSTEM._L0673
SYSTEM._L0673:
                        LD        _ACCGLO, -X
                        ST        -Z, _ACCGLO
                        DEC       _ACCDHI
                        BRNE     SYSTEM._L0673
SYSTEM._L0667:
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        MOV       _ACCB, _ACCA
                        ADD       _ACCB, _ACCAHI
                        ADD       _ACCB, _ACCDLO
                        BRNE     SYSTEM._L0678
SYSTEM._L0674:
                        ADD       _ACCAHI, _ACCDLO
                        INC       _ACCAHI
SYSTEM._L0678:
                        MOV       _ACCFLO, _ACCFHI
                        ANDI      _ACCFLO, 10h
                        BREQ      SYSTEM._L0681
SYSTEM._L0681:
                        ST        X, _ACCB
SYSTEM._L0680:
                        CLR       _ACCALO
                        ADD       _ACCBLO, _ACCA
                        ADC       _ACCBHI, _ACCALO
SYSTEM._L0679:
                        MOV       _ACCFLO, _ACCFHI
                        ANDI      _ACCFLO, 3
                        TST       _ACCFLO
                        BREQ      SYSTEM._L0682
                        LSR       _ACCFLO
                        BRNE      SYSTEM._L0684
                        CALL      SYSTEM.ReadEEp8
                        MOV       _ACCGLO, _ACCA
                        ADIW      _ACCCLO, 01h
                        RJMP      SYSTEM._L0683
SYSTEM._L0684:
                        LPM       _ACCGLO, Z+
                        RJMP      SYSTEM._L0683
SYSTEM._L0682:
                        LD        _ACCGLO, Z+
SYSTEM._L0683:
                        MOV       _ACCFLO, _ACCFHI
                        ANDI      _ACCFLO, 10h
                        BREQ      SYSTEM._L0685
SYSTEM._L0685:
                        ST        X+, _ACCGLO
SYSTEM._L0686:
                        DEC       _ACCAHI
                        BRNE     SYSTEM._L0679
SYSTEM._L0677:
                        RET

SYSTEM.Str2Int:
                        CLR       _ACCAHI
                        CLR       _ACCALO
                        CLR       _ACCBHI
                        CLR       _ACCBLO
                        BST       Flags, _EEPROM
                        BRTC      SYSTEM._L0691
                        CALL      SYSTEM.ReadEEp8
                        ADIW      _ACCCLO, 01h
                        RJMP     SYSTEM._L0692
SYSTEM._L0691:
                        LD        _ACCA, Z+
SYSTEM._L0692:
                        TST       _ACCA
                        BRNE      SYSTEM._L0688
SYSTEM._L0687:
                        CLR       _ACCA
                        CLR       _ACCB
                        RET

SYSTEM._L0688:
                        MOV       _ACCDHI, _ACCA
                        TST       _ACCB
                        BREQ      SYSTEM._L0693
                        INC       _ACCDHI
                        RJMP      SYSTEM.Hex2Int
SYSTEM._L0693:
                        BST       Flags, _EEPROM
                        BRTC      SYSTEM._L0694
                        CALL      SYSTEM.ReadEEp8
                        ADIW      _ACCCLO, 01h
                        RJMP     SYSTEM._L0695
SYSTEM._L0694:
                        LD        _ACCA, Z+
SYSTEM._L0695:
                        CLT
                        BLD       Flags, _NEGATIVE
                        CPI       _ACCA, 02Dh
                        BRNE      SYSTEM._L0689
                        DEC       _ACCDHI
                        BREQ      SYSTEM._L0687
                        SET
                        BLD       Flags, _NEGATIVE
                        BST       Flags, _EEPROM
                        BRTC      SYSTEM._L0696
                        CALL      SYSTEM.ReadEEp8
                        ADIW      _ACCCLO, 01h
                        RJMP     SYSTEM._L0697
SYSTEM._L0696:
                        LD        _ACCA, Z+
SYSTEM._L0697:
                        RJMP      SYSTEM.Dec2Int
SYSTEM._L0689:
                        CPI       _ACCA, 02Bh
                        BRNE      SYSTEM._L0690
                        DEC       _ACCDHI
                        BREQ      SYSTEM._L0687
                        CLT
                        BLD       Flags, _NEGATIVE
                        BST       Flags, _EEPROM
                        BRTC      SYSTEM._L0698
                        CALL      SYSTEM.ReadEEp8
                        ADIW      _ACCCLO, 01h
                        RJMP     SYSTEM._L0699
SYSTEM._L0698:
                        LD        _ACCA, Z+
SYSTEM._L0699:
                        RJMP      SYSTEM.Dec2Int
SYSTEM._L0690:
                        CPI       _ACCA, 024h
                        BRNE      SYSTEM.Dec2Int
                        RJMP      SYSTEM.Hex2Int
SYSTEM.Dec2Int:
                        MOV       _ACCB, _ACCDHI
                        DEC       _ACCB
                        BRMI      SYSTEM._L0687
                        CLR       _ACCDHI
                        CLR       _ACCEHI
                        CLR       _ACCFHI
                        CLR       _ACCFLO
                        PUSH      _ACCB
                        RJMP      SYSTEM.Dec2Int1
SYSTEM._L0700:
                        PUSH      _ACCB
                        BST       Flags, _EEPROM
                        BRTC      SYSTEM._L0703
                        CALL      SYSTEM.ReadEEp8
                        ADIW      _ACCCLO, 01h
                        RJMP     SYSTEM._L0704
SYSTEM._L0703:
                        LD        _ACCA, Z+
SYSTEM._L0704:
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
                        RJMP      SYSTEM._L0700
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
                        BRTC      SYSTEM._L0705
                        SUBI      _ACCB, 01h
                        SBCI      _ACCA, 00h
                        SBCI      _ACCALO, 00h
                        SBCI      _ACCAHI, 00h
                        COM       _ACCALO
                        COM       _ACCAHI
                        COM       _ACCA
                        COM       _ACCB
SYSTEM._L0705:
                        RET

SYSTEM.Hex2Int:
                        CLT
                        BLD       Flags, _NEGATIVE
                        DEC       _ACCDHI
                        BREQ      SYSTEM._L0705
                        CPI       _ACCDHI, 009h
                        BRSH      SYSTEM.Str2Ierr
SYSTEM._L0706:
                        BST       Flags, _EEPROM
                        BRTC      SYSTEM._L0710
                        CALL      SYSTEM.ReadEEp8
                        ADIW      _ACCCLO, 01h
                        RJMP     SYSTEM._L0711
SYSTEM._L0710:
                        LD        _ACCA, Z+
SYSTEM._L0711:
                        CPI       _ACCA, 061h
                        BRLO      SYSTEM._L0707
                        SUBI      _ACCA, 020h
SYSTEM._L0707:
                        CPI       _ACCA, 030h
                        BRLO      SYSTEM.Str2Ierr
                        CPI       _ACCA, 03Ah
                        BRLO      SYSTEM._L0708
                        CPI       _ACCA, 041h
                        BRLO      SYSTEM.Str2Ierr
                        CPI       _ACCA, 047h
                        BRSH      SYSTEM.Str2Ierr
                        SUBI      _ACCA, -9 AND 0FFh
SYSTEM._L0708:
                        ANDI      _ACCA, 00Fh
                        LDI       _ACCB, 4
SYSTEM._L0709:
                        LSL       _ACCBLO
                        ROL       _ACCBHI
                        ROL       _ACCALO
                        ROL       _ACCAHI
                        DEC       _ACCB
                        BRNE      SYSTEM._L0709
                        OR        _ACCBLO, _ACCA
                        DEC       _ACCDHI
                        BRNE      SYSTEM._L0706
                        RJMP      SYSTEM.Str2Iex
SYSTEM.PosChInVarStr:
                        CLR       _ACCA
                        LD        _ACCBHI, Z
                        TST       _ACCBHI
                        BREQ      SYSTEM._L0713
                        TST       _ACCELO
                        BRNE      SYSTEM._L0712
                        INC       _ACCELO
SYSTEM._L0712:
                        CP        _ACCBHI, _ACCELO
                        BRCS      SYSTEM._L0713
                        ADD       _ACCCLO, _ACCELO
                        ADC       _ACCCHI, _ACCA
                        DEC       _ACCELO
                        SUB       _ACCBHI, _ACCELO
                        MOV       _ACCA, _ACCELO
SYSTEM._L0714:
                        INC       _ACCA
                        LD        _ACCBLO, Z+
                        CP        _ACCB, _ACCBLO
                        BREQ      SYSTEM._L0713
                        DEC       _ACCBHI
                        BRNE      SYSTEM._L0714
                        CLR       _ACCA
SYSTEM._L0713:
                        RET


SYSTEM.UpperCaseStr:
                        LD        _ACCA, Z+
                        TST       _ACCA
                        BREQ      SYSTEM._L0716
                        MOV       _ACCBHI, _ACCA
SYSTEM._L0715:
                        LD        _ACCA, Z+
                        CPI       _ACCA, 061h
                        BRCS      SYSTEM._L0717
                        CPI       _ACCA, 07Bh
                        BRCC      SYSTEM._L0717
                        ANDI      _ACCA, 0DFh
SYSTEM._L0717:
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCBHI
                        BRNE      SYSTEM._L0715
SYSTEM._L0716:
                        RET


SYSTEM.StrCopyV:
                        TST       _ACCA
                        BREQ      SYSTEM._L0720
                        LD        _ACCBHI, Z
                        TST       _ACCBHI
                        BREQ      SYSTEM._L0720
                        SUB       _ACCBHI, _ACCB
                        BRCS      SYSTEM._L0720
                        INC       _ACCBHI
                        CLR       _ACCBLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCBLO
                        CP        _ACCBHI, _ACCA
                        BRCS      SYSTEM._L0719
                        MOV       _ACCBHI, _ACCA
SYSTEM._L0719:
                        LD        _ACCA, Z+
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCBHI
                        BRNE      SYSTEM._L0719
SYSTEM._L0720:
                        RET


SYSTEM.StrConst2Str:
                        LPM       _ACCBHI, Z+
                        TST       _ACCBHI
                        BREQ      SYSTEM._L0722
SYSTEM.StrConst2StrPart:
SYSTEM._L0721:
                        LPM      _ACCA, Z+
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCBHI
                        BRNE      SYSTEM._L0721
SYSTEM._L0722:
                        RET


SYSTEM.StrVar2Str:
                        LD        _ACCA, Z+
                        TST       _ACCA
                        BREQ      SYSTEM._L0724
                        MOV       _ACCBHI, _ACCA
SYSTEM._L0723:
                        LD        _ACCA, Z+
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCBHI
                        BRNE      SYSTEM._L0723
SYSTEM._L0724:
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
                        RJMP      SYSTEM._L0725
                        LD        _ACCGLO, Z+
                        RJMP      SYSTEM._L0726
SYSTEM._L0725:
                        LPM       _ACCGLO, Z+
SYSTEM._L0726:
                        CP        _ACCB, _ACCGLO
                        BREQ      SYSTEM._L0727
                        CLZ
                        RET
SYSTEM._L0727:
                        TST       _ACCB
                        BRNE      SYSTEM._L0728
                        SEZ
                        RET
SYSTEM._L0728:
                        DEC       _ACCB
                        LD        _ACCA, X+
                        SBRC      FLAGS, _STRCONST
                        RJMP      SYSTEM._L0729
                        LD        _ACCGLO, Z+
                        RJMP      SYSTEM._L0730
SYSTEM._L0729:
                        LPM       _ACCGLO, Z+
SYSTEM._L0730:
                        CP        _ACCA, _ACCGLO
                        BREQ      SYSTEM._L0727
                        CLZ
                        RET


SYSTEM.Hex2Str8:
                        LDI       _ACCBHI, 2
SYSTEM._L0731:
                        SWAP      _ACCDLO
                        MOV       _ACCA, _ACCDLO
                        ANDI      _ACCA, 0Fh
                        CPI       _ACCA, 010
                        BRCS      SYSTEM._L0732
                        ADDI      _ACCA, 7
SYSTEM._L0732:
                        ADDI      _ACCA, 30h
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCBHI
                        BRNE      SYSTEM._L0731
                        RET


SYSTEM.Char2Str:
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        BST       Flags, _DEVICE
                        BRTS      SYSTEM._L0737
                        PUSH      _ACCA
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LDD       _ACCA, Y+000h
                        TST       _ACCA
                        BRNE      SYSTEM._L0734
                        POP       _ACCA
                        SET
                        BLD       Flags, _ERRFLAG
                        POP       _ACCCHI
                        POP       _ACCCLO
                        RET
SYSTEM._L0734:
                        DEC       _ACCA
                        STD       Y+000h, _ACCA
                        POP       _ACCA
                        BST       Flags, _EEPROM
                        BRTS      SYSTEM._L0735
                        ST        Z+, _ACCA
                        RJMP      SYSTEM._L0736
SYSTEM._L0735:
                        CALL      SYSTEM.WriteEEp8
                        ADIW      _ACCCLO, 01h
SYSTEM._L0736:
                        STD       Y+002h, _ACCCHI
                        STD       Y+001h, _ACCCLO
                        POP       _ACCCHI
                        POP       _ACCCLO
                        RET
SYSTEM._L0737:
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


SYSTEM.SHR8:
                        MOV       _ACCALO, _ACCA
                        MOV       _ACCA, _ACCB
SYSTEM.SHR8_R:
                        TST       _ACCALO
                        BREQ      SYSTEM._L0739
                        CPI       _ACCALO, 08h
                        BRCS      SYSTEM._L0738
                        CLR       _ACCA
                        RET
SYSTEM._L0738:
                        LSR       _ACCA
                        DEC       _ACCALO
                        BRNE      SYSTEM._L0738
SYSTEM._L0739:
                        RET


SYSTEM.MUL8:
                        MUL       _ACCA, _ACCB
                        MOV       _ACCA, _ACCGLO
                        MOV       _ACCB, _ACCGHI
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
SYSTEM._L0740:
                        ROL       _ACCA
                        DEC       _ACCALO
                        BRNE      SYSTEM._L0741
                        MOV       _ACCB, _ACCAHI
                        RET
SYSTEM._L0741:
                        ROL       _ACCAHI
                        SUB       _ACCAHI, _ACCB
                        BRCC      SYSTEM._L0742
                        ADD       _ACCAHI, _ACCB
                        CLC
                        RJMP      SYSTEM._L0740
SYSTEM._L0742:
                        SEC
                        RJMP      SYSTEM._L0740


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
                        BRTC      SYSTEM._L0744
                        MOV       _ACCDHI, _ACCBHI
                        MOV       _ACCDLO, _ACCAHI
                        EOR       _ACCDLO, _ACCBHI
                        CLT
                        SBRS      _ACCDLO, 7
                        BLD       Flags, _SIGN
                        SBRS      _ACCAHI, 7
                        RJMP      SYSTEM._L0746
                        NEG       _ACCALO
                        BRNE      SYSTEM._L0747
                        DEC       _ACCAHI
SYSTEM._L0747:
                        COM       _ACCAHI
SYSTEM._L0746:
                        SBRS      _ACCBHI, 7
                        RJMP      SYSTEM._L0744
                        NEG       _ACCBLO
                        BRNE      SYSTEM._L0748
                        DEC       _ACCBHI
SYSTEM._L0748:
                        COM       _ACCBHI
SYSTEM._L0744:
                        CLR       _ACCCLO
                        SUB       _ACCCHI, _ACCCHI
                        LDI       _ACCA, 17
SYSTEM._L0749:
                        ROL       _ACCBLO
                        ROL       _ACCBHI
                        DEC       _ACCA
                        BRNE      SYSTEM._L0750
                        MOVW      _ACCB, _ACCBLO
                        BST       Flags, _SIGN
                        BRTC      SYSTEM._L0745
                        NEG       _ACCB
                        BRNE      SYSTEM._L0752
                        DEC       _ACCA
SYSTEM._L0752:
                        COM       _ACCA
SYSTEM._L0745:
                        RET
SYSTEM._L0750:
                        ROL       _ACCCLO
                        ROL       _ACCCHI
                        SUB       _ACCCLO, _ACCALO
                        SBC       _ACCCHI, _ACCAHI
                        BRCC      SYSTEM._L0751
                        ADD       _ACCCLO, _ACCALO
                        ADC       _ACCCHI, _ACCAHI
                        CLC
                        RJMP      SYSTEM._L0749
SYSTEM._L0751:
                        SEC
                        RJMP      SYSTEM._L0749


SYSTEM.DIV32_16:
                        BST       Flags, _SIGN
                        BRTS      SYSTEM.DIV32_16S
                        LDI       _ACCCLO, 00000h AND 0FFh
                        LDI       _ACCCHI, 00000h SHRB 8
                        RJMP      SYSTEM.DIV32_16U
SYSTEM.DIV32_16S:
                        TST       _ACCBHI
                        BRPL      SYSTEM._L0753
                        LDI       _ACCCLO, 0FFFFh AND 0FFh
                        LDI       _ACCCHI, 0FFFFh SHRB 8
                        RJMP      SYSTEM._L0754
SYSTEM._L0753:
                        LDI       _ACCCLO, 00000h AND 0FFh
                        LDI       _ACCCHI, 00000h SHRB 8
SYSTEM._L0754:
                        MOV       _ACCA, _ACCEHI
                        MOV       _ACCFLO, _ACCCHI
                        EOR       _ACCFLO, _ACCEHI
                        CLT
                        SBRS      _ACCFLO, 7
                        BLD       Flags, _SIGN
                        SBRS      _ACCCHI, 7
                        RJMP      SYSTEM._L0755
                        COM       _ACCBLO
                        COM       _ACCBHI
                        COM       _ACCCLO
                        COM       _ACCCHI
                        SUBI      _ACCBLO, 0FFh
                        SBCI      _ACCBHI, 0FFh
                        SBCI      _ACCCLO, 0FFh
                        SBCI      _ACCCHI, 0FFh
SYSTEM._L0755:
                        SBRS      _ACCEHI, 7
                        RJMP      SYSTEM.DIV32_16U
                        COM       _ACCDLO
                        COM       _ACCDHI
                        COM       _ACCELO
                        COM       _ACCEHI
                        SUBI      _ACCDLO, 0FFh
                        SBCI      _ACCDHI, 0FFh
                        SBCI      _ACCELO, 0FFh
                        SBCI      _ACCEHI, 0FFh
SYSTEM.DIV32_16U:
                        PUSH      _ACCA
                        CLR       _ACCFLO
                        CLR       _ACCFHI
                        CLR       _ACCGLO
                        CLR       _ACCB
                        LDI       _ACCA, 33
SYSTEM._L0757:
                        ROL       _ACCDLO
                        ROL       _ACCDHI
                        ROL       _ACCELO
                        ROL       _ACCEHI
                        DEC       _ACCA
                        BRNE      SYSTEM._L0756
                        MOVW      _ACCB, _ACCDLO
                        MOVW      _ACCALO, _ACCELO
                        BST       Flags, _SIGN
                        BRTC      SYSTEM._L0759
                        SUBI      _ACCB, 01h
                        SBCI      _ACCA, 00h
                        SBCI      _ACCALO, 00h
                        SBCI      _ACCAHI, 00h
                        COM       _ACCALO
                        COM       _ACCAHI
                        COM       _ACCA
                        COM       _ACCB
SYSTEM._L0759:
                        POP       _ACCDHI
                        RET
SYSTEM._L0756:
                        ROL       _ACCFLO
                        ROL       _ACCFHI
                        ROL       _ACCGLO
                        ROL       _ACCB
                        SUB       _ACCFLO, _ACCBLO
                        SBC       _ACCFHI, _ACCBHI
                        SBC       _ACCGLO, _ACCCLO
                        SBC       _ACCB, _ACCCHI
                        BRCC      SYSTEM._L0758
                        ADD       _ACCFLO, _ACCBLO
                        ADC       _ACCFHI, _ACCBHI
                        ADC       _ACCGLO, _ACCCLO
                        ADC       _ACCB, _ACCCHI
                        CLC
                        RJMP      SYSTEM._L0757
SYSTEM._L0758:
                        SEC
                        RJMP      SYSTEM._L0757


SYSTEM.SHL16:
                        TST       _ACCALO
                        BREQ      SYSTEM._L0761
                        CPI       _ACCALO, 10h
                        BRCS      SYSTEM._L0760
                        CLR       _ACCA
                        CLR       _ACCB
                        RET
SYSTEM._L0760:
                        LSL       _ACCB
                        ROL       _ACCA
                        DEC       _ACCALO
                        BRNE      SYSTEM._L0760
SYSTEM._L0761:
                        RET

SYSTEM.GETADC:
                        CLI
                        CPI       _ACCA, 003h
                        BRNE      SYSTEM._L0762
                        LDS       _ACCB, _ADCBUFF
                        LDS       _ACCA, _ADCBUFF +1
                        RJMP      SYSTEM._L0763
SYSTEM._L0762:
                        LDS       _ACCB, _ADCBUFF +2
                        LDS       _ACCA, _ADCBUFF +3
SYSTEM._L0763:
                        SBRC      Flags, IntFlag
                        SEI
                        RET

SYSTEM.SETADCFIXED:
                        CLI
                        LDS       _ACCB, _ADCBUFF +4
                        LDD       _ACCA, Y+001h
                        TST       _ACCA
                        BRNE      SYSTEM._L0764
                        ANDI      _ACCB, 0FEh
                        RJMP      SYSTEM._L0765
                        ORI       _ACCB, 01h
                        LDD       _ACCA, Y+000h
                        CPI       _ACCA, 003h
                        BREQ      SYSTEM._L0764
                        LDI       _ACCA, 004h
SYSTEM._L0764:
                        DEC       _ACCA
                        LDS       _ACCCHI, admux
                        CBR       _ACCCHI, 7
                        OR        _ACCA, _ACCCHI
                        STS       admux, _ACCA
SYSTEM._L0765:
                        STS       _ADCBUFF +4, _ACCB
                        SBRC      Flags, IntFlag
                        SEI
                        RET

SYSTEM.DefIntErr:
                        RETI


                        .ROMCONST $

                        ; ============ String-constant tables ============
                        .SYM      ACV.Vers1Str
ACV.Vers1Str:
                        .BYTE     28
                        .ASCII    "1.07 [ACV by CM/c't 03/2007]"

                        .SYM      ACV.Vers3Str
ACV.Vers3Str:
                        .BYTE     8
                        .ASCII    "ACV 1.07"

                        .SYM      ACV.EEnotProgrammedStr
ACV.EEnotProgrammedStr:
                        .BYTE     14
                        .ASCII    "EEPROM EMPTY! "

                        .SYM      ACV.AdrStr
ACV.AdrStr:
                        .BYTE     4
                        .ASCII    "Adr "

                        .SYM      ACV.dBStr
ACV.dBStr:
                        .BYTE     4
                        .ASCII    " dB "

                        .SYM      ACV.mVStr
ACV.mVStr:
                        .BYTE     4
                        .ASCII    " mV "

                        .SYM      ACV.GainSelStr
ACV.GainSelStr:
                        .BYTE     8
                        .ASCII    "InpGain "

                        .SYM      ACV.AuxCmdSelStr
ACV.AuxCmdSelStr:
                        .BYTE     3
                        .ASCII    "Cmd"

                        .SYM      ACV.AuxCmdStr
ACV.AuxCmdStr:
                        .BYTE     8
                        .ASCII    "AuxFunct"

                        .SYM      ACV.MemorizedStr
ACV.MemorizedStr:
                        .BYTE     8
                        .ASCII    "Memorizd"

                        .SYM      ACV.OverloadStr
ACV.OverloadStr:
                        .BYTE     8
                        .ASCII    " OVERLD "

                        .SYM      ACV.RateSelStr
ACV.RateSelStr:
                        .BYTE     8
                        .ASCII    "SmplRate"

$St_String13:
                        .BYTE     1
                        .ASCII    "."

$St_String14:
                        .BYTE     14
                        .ASCII    "-9999 [OVERLD]"

$St_String15:
                        .BYTE     0


                        ; ============ array-constant tables ============
                        .SYM      ACV.ErrStrArr
ACV.ErrStrArr:
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


                        .SYM      ACV.RateStrArr
ACV.RateStrArr:
                        .BYTE     7
                        .ASCII    "C 48kHz"

                        .BYTE     7
                        .ASCII    "C 96kHz"

                        .BYTE     7
                        .ASCII    "C192kHz"

                        .BYTE     7
                        .ASCII    "P 48kHz"

                        .BYTE     7
                        .ASCII    "P 96kHz"

                        .BYTE     7
                        .ASCII    "P192kHz"


                        .SYM      ACV.CmdStrArr
ACV.CmdStrArr:
                        .BYTE     3
                        .ASCII    "STR"

                        .BYTE     3
                        .ASCII    "IDN"

                        .BYTE     3
                        .ASCII    "VAL"

                        .BYTE     3
                        .ASCII    "SMP"

                        .BYTE     3
                        .ASCII    "INL"

                        .BYTE     3
                        .ASCII    "RNG"

                        .BYTE     3
                        .ASCII    "DSP"

                        .BYTE     3
                        .ASCII    "ALL"

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


                        .SYM      ACV.Cmd2SubChArr
ACV.Cmd2SubChArr:
                        .BYTE     0FFh
                        .BYTE     0FEh
                        .BYTE     000h
                        .BYTE     008h
                        .BYTE     00Ah
                        .BYTE     013h
                        .BYTE     050h
                        .BYTE     063h
                        .BYTE     0C8h
                        .BYTE     0FAh
                        .BYTE     0FBh
                        .BYTE     0FCh
                        .BYTE     000h

                        .SYM      ACV.SwitchArr
ACV.SwitchArr:
                        .BYTE     008h
                        .BYTE     009h
                        .BYTE     000h
                        .BYTE     001h
                        .BYTE     004h
                        .BYTE     005h
                        .BYTE     006h
                        .BYTE     007h

                        .SYM      ACV.ADCrangeScalesDiv
ACV.ADCrangeScalesDiv:
                        .WORD     00064h
                        .WORD     00064h
                        .WORD     003E8h
                        .WORD     003E8h
                        .WORD     02710h
                        .WORD     003E8h
                        .WORD     02710h
                        .WORD     02710h


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
                        JMP       SYSTEM.DefIntErr
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
                        ; upto            = 00004h
                        ; and
                        ; from            = 00010h
                        ; upto            = 0001Fh
                        ;
                        ; Stackframe at   = ...002D6h


                        ; ===== Current top of User Vars in Data is 00007h =====

                        ; ===== Current top of User Vars in IData is 00356h =====

                        ; ===== Current top of User Vars in EEprom is 0002Ah =====


                        ; ===== Imported Library Routines =====

                        ; Shift  right byte SHR8
                        ; Multiply     byte MUL8
                        ; Divide       byte DIV8
                        ; Multiply     word MUL16
                        ; Divide       word DIV16
                        ; Shift  left  word SHL16
                        ; Convert to hex string HexStr
                        ; Convert byte to string
                        ; Convert int to string
                        ; Convert string to int
                        ; String compare
                        ; Copy partial String
                        ; EEprom read
                        ; EEprom write

                        ; Pascal Statements : 575
                        ; Assembler Lines   : 20908
                        ; Optimizer removed : 370 lines = 740Bytes

                        ; >> real SysTick (exact): 9.984 msec <<

;  Linker removed the following functions and procedures
;
;  Module/Unit             Function/Procedure
;  ------------------------------------------
;
