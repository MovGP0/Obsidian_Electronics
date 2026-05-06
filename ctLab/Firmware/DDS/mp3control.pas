{###########################################################################}
//MP3-Fernbedienungs-Routinen

const
  yi3_stop = $F0;
  yi3_reset = $F7;
  yi3_pause = $F8;
  yi3_loop = $F4;
  yi3_noloop = $F1;
  yi3_midvolume = $A8;
  yi3_mute = $80;

procedure SerAux(mybyte:byte);
//Sende Byte in "mychar" mit 19200 Bd an PB5 für MP3-Player
begin
  _ACCDHI:=mybyte;
  asm;
    ldi  _ACCDLO, 8
    cbi  SoftDDS.DDSOutPort, SoftDDS.b_SerAux ; Startbit
    ldi       _ACCA, 5
    call      SYSTEM.UDELAY
  SoftDDS.SerAuxloop1:    ; Byte rausschieben
    lsr  _ACCDHI          ; Bit 0 zuerst
    brcs SoftDDS.SerAuxdatahigh
    cbi  SoftDDS.DDSOutPort, SoftDDS.b_SerAux
    rjmp SoftDDS.SerAuxdataset
  SoftDDS.SerAuxdatahigh:
    sbi  SoftDDS.DDSOutPort, SoftDDS.b_SerAux
  SoftDDS.SerAuxdataset:
    ldi       _ACCA, 5
    call      SYSTEM.UDELAY
    dec _ACCDLO
    brne  SoftDDS.SerAuxloop1
    sbi  SoftDDS.DDSOutPort, SoftDDS.b_SerAux
    ldi       _ACCA, 10
    call      SYSTEM.UDELAY
  endasm;
end;


procedure MP3setVol;
//Player einschalten, Vol. max, erstes Stück spielen
begin
  mdelay(20);
  SerAux(yi3_midVolume+MP3dBkorr);
end;

procedure MP3gotoTrack;
//gehe zu Track in Variable MP3Track
begin
  SerAux(MP3Track);
  MP3currenttrack:=MP3Track;
  MP3setVol;
end;


procedure MP3on;
//Player einschalten, Vol. max, erstes Stück spielen
begin
  SerAux(yi3_noloop);  //Repeat machen wir selbst
  SerAux(yi3_midVolume+MP3dBkorr);
  SerAux(yi3_stop);
  mdelay(100);
  MP3currenttrack:=0;
  MP3isOn:= true;
  SendSR;
end;


procedure MP3off;
//Player ausschalten
begin
  SerAux(yi3_noloop);
  SerAux(yi3_mute);
  SerAux(yi3_stop);
  MP3isOn:= false;
  MP3currenttrack:=0;
  SendSR;
end;


