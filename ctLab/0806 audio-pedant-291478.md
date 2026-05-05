---
title: ADC192 (A/D-Wandler mit Digital-Audio-Ausgang)
sources: 
- "[Audio-Pedant](https://www.heise.de/ratgeber/Audio-Pedant-291478.html)"
- "[Audio-Pedant](https://www.heise.de/-291478)"
- c't 06/08, S. 222
- "[AN22: Overview of Digital Audio Interface Data Structures](https://statics.cirrus.com/pubs/appNote/an22.pdf)"
authors:
- Heinrich Willecke
- Carsten Meyer
Copyright: 2008 Heise Medien
---
# Audio-Pedant

> Als Ergänzung für das Audio-Vorverstärkermodul des c't-Lab drängt sich ein A/D-Wandler mit Digital-Audio-Ausgang geradezu auf. Damit erhält man unabhängig vom Wohlwollen der PC-Soundkarte reproduzierbar gute Messergebnisse bei der Analyse von NF-Signalen. Nebenbei kann er natürlich auch als „amtlicher“ Audio-Wandler für Recording-Zwecke herhalten – mit 24 Bit Auflösung und maximal 192 kHz Sample-Rate.

Selbst mit guten Audio-Karten für den PC stößt man beim Einsatz für Messzwecke irgendwann auf Probleme – sei es, dass Störsignale aus dem hochfrequent regen PC-Inneren dort einkoppeln oder Brummschleifen durch die Schutzerdung des PC-Netzteils entstehen. Oft genug weiß man auch nicht so recht, was der Audio-Treiber oder die eingangsseitige Analog-Elektronik mit den Signalen so alles zur vermeintlichen Klangverbesserung anstellen – Messungen geraten so zum Glücksspiel.

Besonders hartnäckig halten sich Brummeinstreuungen, die durch eine doppelte Masseführung (Messobjekt und PC-Netzteil gleichzeitig geerdet) und Masse-Ausgleichsstöme auf dem Schutzleiter oder gar einer Antennenleitung (TV-Karte, Tuner) entstehen. Davon Geplagte behelfen sich gern mit einem Audio-Trennübertrager und gegebenenfalls einem Antennen-Mantelstromfilter. Audio-Trennübertrager im Signalweg sind für Messzwecke aber nicht das Gelbe vom Ei: Ihre untere Grenzfrequenz liegt kaum unter 20 Hz, und der Amplituden-/Phasenfrequenzgang ist je nach Qualität mitunter bucklig wie eine Skipiste an einem sonnigen Nachmittag.

Brummeinstreuungen und Störungen lassen sich vollständig eliminieren, wenn man die Audio-Signale über SPDIF per Koax-Kabel oder noch besser per Lichtwellenleiter in den PC einspeist. Voraussetzung dafür ist natürlich, dass das PC-Mainboard oder die Audio-Karte einen Digital-Audio-Eingang besitzt – und man selbst einen externen A/D-Wandler von guter Qualität. Trotz eifriger technischer Fortschritte sind derlei Geräte keine preiswerte Angelegenheit, außerdem müllt damit ein weiteres Kästchen den chronisch überbelegten Labortisch zu.

## Autarke Lösung

Wir haben uns daher entschlossen, der ACV-Platine einen eigenen Wandler zu spendieren; ein Erweiterungsanschluss wurde ja dafür schon vorausschauend vorgesehen. Das ADC192 getaufte Konstrukt kommt huckepack auf das ACV-Modul, ähnlich wie schon der TRMSC-Messgleichrichter auf DIV oder DDS, und wird von diesem mit Strom und Steuersignalen versorgt. Initialisierung und Einstellung des Wandlers übernimmt der ACV-eigene Mikrocontroller, sodass keine weitere „Intelligenz“ nötig ist. So kann man am ACV-Bedienpanel bequem die Sampling-Rate und das Audio-Format (Consumer/Professional) der Wandler-Platine wählen, ebenso gut natürlich auch per c't-Lab-Befehl.

Dank hochintegrierter Bausteine ist der Selbstbau eines Audio-A/D-Wandlers mit hervorragenden Qualitäten keine Geheimwissenschaft mehr. Einer der leistungsfähigsten ADCs am Markt ist der hier verwendete CS5381 von Cirrus Logic (ehemals Crystal Semiconductor): Der Hersteller verspricht eine Dynamik von 117 dB und einen Klirr-/Störabstand (THD+N) von mindestens 104 dB – das alles bei Sampling-Raten von 48, 96 oder 192 kHz und 24 Bit Wandler-Auflösung. Unsere Wahl fiel auch deshalb auf diesen Baustein, weil es ihn im selbstlötfreundlichen SO24-Gehäuse gibt. Die keineswegs triviale SPDIF-Kodierung des Digital-Audio-Signals – in den Biphase-kodierten Datenstrom sind zeitlich verschachtelte Status-Bits einzufügen – erledigt ebenfalls ein Cirrus-IC, der SPDIF-Transmitter CS8406. Im Unterschied zum früher gern verwendeten [1] CS8402 beherrscht er auch höhere Bitraten, wie sie für eine 96- oder 192-kHz-Übertragung nötig sind.

## Bus an Bus

Im umseitigen – recht übersichtlichen – Schaltbild finden Sie neben den erwähnten Chips nur wenige Support-Bauteile. Eine nicht allzu kritische Aufgabe besteht darin, das vom ACV-Modul kommende Eingangssignal für den CS5381 zu filtern und zu symmetrieren, was zwei Doppel-OpAmps vom altehrwürdigen Typ NE5532 erledigen. Dank Delta-Sigma-Technik mit einem Modulator 5. Ordnung kommt der CS5381 mit einem simplen Aliasing-Filter aus, wir verwenden hier ein Multi-Tap-Design nach Sallen/Key mit einer oberen Grenzfrequenz von rund 40 kHz. Den Master-Takt für Wandler und SPDIF-Transmitter liefert ein Quarzoszillator mit 24,576 MHz (= 128 x 192 kHz). Wandler und Transmitter sind über eine I2S-Schnittstelle (Inter-IC Sound Interface, eine Philips-Erfindung) seriell miteinander verbunden; den Takt gibt der CS5381 auf den Leitungen SCLK (Schiebetakt) und LRCK (Links/Rechts-Frame) vor, die rohen Audio-Daten überträgt SDATA.

![[audio-pedant-291478-01.jpg]]

*Die ADC192-Tochterplatine wird mit 20-mm-Abstandsbolzen huckepack auf dem ACV-Modul montiert. Die Toslink-Verbindung zur Frontplatte erfolgt mit einigen Zentimetern Lichtwellenleiterkabel und einer Toslink-Kupplung. Soll die SPDIF-Koaxbuchse ebenfalls dort montiert werden, ist eine isolierte Ausführung zu wählen.*

Der ACV-Controller programmiert den SPDIF-Transmitter über einen I2C-Bus auf das gewünschte Ausgabe-Format, womit sich Änderungen sehr leicht im Source-Code des ACV-Moduls verwirklichen lassen. Damit dies auch für den Wandler gilt, der keine I2C-Schnittstelle besitzt, spendierten wir ihm einen eigenen I2C-Portbaustein, den c't-Lab-Nachbauer schon von der IO8-32-Steckkarte kennen. Wer selbst Hand an die Firmware anlegen will, findet im Datenblatt des CS5381 Hinweise zu dessen Betriebsarten.

Die Digital-Audio-Ausgabe erfolgt wie eingangs erwähnt gleichzeitig auf einer optischen Toslink-Schnittstelle mit dem Opto-Sender TOTX178 und auf einem asymmetrischen Anschluss für Koax-Kabel mit 75 Ohm (Consumer-Mode). Ein Impulsübertrager am Ausgang sorgt auch hier für eine galvanische Trennung. In diesem Zusammenhang sei noch auf den unscheinbaren Kondensator C21 hingewiesen, der die Abschirmung des SPDIF-Kabels hochfrequenzmäßig an Masse legt. Wenn am SPDIF-Eingang der Audio-Karte kein Trennübertrager vorhanden ist, kann man ihn auch weglassen, der Störabstand wird dann – unter „schlechten“ Umständen – marginal besser. Messen Sie einfach mit einem Ohmmeter, ob die Abschirmung des SPDIF-Eingangs mit der PC-Masse verbunden ist – wenn ja, kann der Kondensator entfallen. Apropos: Billigste SPDIF-Kabel weisen oft nicht den spezifizierten Wellenwiderstand von 75 Ohm auf, was bei längeren Strippen zu Übertragungsfehlern führen kann. Ganz hervorragend eignet sich übrigens einfaches Antennenkabel für diesen Zweck, etwas teurer, aber flexibler ist RG-59/U- oder (dezenter, weil dünner) RG-179/U-Material.

Diese Sorge hat man nicht, wenn das Digital-Audio-Signal, etwa im Zusammenspiel mit Studio-Equipment, im Professional-Modus gesendet werden soll. Die Pegel-Spezifikationen sehen hierfür ganz anders aus: symmetrische Übertragung, Leitungsimpedanz 110 Ohm statt 75 Ohm, Pegel 10 Vss statt 0,5 Vss, XLR- statt Cinch-Buchse. Statt JP2 ist dann JP3 zu stecken, was den SPDIF-Pegel entsprechend anhebt. Sample-Raten von 96 oder gar 192 kHz sind in diesem Format unüblich.

Das gilt im Consumer-Mode auch noch heute für die 192-kHz-Rate, die selten zu etwas anderem verwendet wird als zur kodierten Mehrkanal-Übertragung. Im vorliegenden Fall haben wir es aber mit einem Stereo-Signal zu tun, und da ist in den meisten Fällen bei 96 kHz Schluss. Aber auch diese Frequenz ist eigentlich in der SPDIF-Norm nicht spezifiziert, was schon daran zu erkennen ist, dass dafür keine Status-Bitkombinationen zur Kennung existieren. Man umgeht das Problem, indem man die Statusbits des Transmitters bei höheren Sample-Raten als 48 kHz auf einen ungültigen Code setzt. Die meisten SPDIF-Empfänger verwerfen die Sample-Statusbits sowieso, denn im Grunde werden sie gar nicht gebraucht: Um etwa festzustellen, dass die Statusbits eine 48-kHz-Übertragung anzeigen, muss der Empfänger ja schon mit 48 kHz laufen …

Einige der Statusbits sind trotzdem von Interesse, etwa das Gültigkeits- und Kopierschutzbit oder die Bitkombination, die den Ursprung des Datenstroms (CD, DAT, Broadcast, A/D-Wandler, Synthesizer usw.) anzeigt. Unsere ACV-Firmware-Implementierung enthält bereits einen richtig formatierten Statusblock, jeweils separat für den Professional- und Consumer-Modus. Eine ausführliche Abhandlung über die SPDIF-Statusbits enthält die Application Note AN22 von Cirrus [2], die für den Nachbauer aber nur dann von Belang ist, wenn er den ACV-Controller an eigene Bedürfnisse anpassen will.

## Handarbeit

Aus Platzgründen, aber auch der kurzen, induktionsarmen Leiterbahnen wegen finden sich im Platinenlayout deutlich mehr SMD-Bauteile als im sonstigen c't-Lab-Projekt. Der CS5381 möchte auch „kurz und knackig“ angebunden sein, damit er seine volle Leistung entfalten kann. Bestücken sie also zuallererst das „Hühnerfutter“, also die winzigen SMD-Widerstände und -Keramik-Kondensatoren. Zum Auflöten der ICs braucht es nur eine ruhige Hand und eine feine Lötspitze. Wenn Sie zunächst nur einen Pin anlöten, können Sie das IC-Gehäuse noch bequem Pad-mittig ausrichten. Die beiden Operationsverstärker sollten Fassungen bekommen – das erleichtert das spätere Selektieren nach Rauscharmut und Klirrfaktor, falls erforderlich. Die Verbindung zum ACV-Modul erfolgt über ein dreipoliges, abgeschirmtes Kabel (die Masse liegt an beiden mittleren Pins des Steckverbinders an). Sie können beispielsweise jenes verwenden, das Ihrem neuen DVD-Laufwerk als Audio-Verbindung zum Motherboard beilag.

![[audio-pedant-291478-02.jpg]]

*Mehr SMD als üblich: Der Wandler benötigt kurze Leitungswege, um sein Potenzial voll ausschöpfen zu können. Sparsame Zeitgenossen können den SPDIF-Impulsübertrager auch selbst auf einen 5-mm-Ringkern (Kennfarbe rot) wickeln – jede Wicklung besteht aus sechs Windungen CuL-Draht (0,4 mm).*

Die beiden Spindeltrimmer R22 und R23 nahe der Eingangsbuchse PL2 dienen zum Abgleich auf „Vollausschlag“, getrennt für den linken und rechten Kanal. In der vorliegenden Dimensionierung ist das der –6-dB-Punkt vom digitalen Endwert (absolute Übersteuerungsgrenze, $00 0000, $FF FFFF). Da die digitale Übertragung bei Erreichen der Endwerte schlagartig in die Übersteuerung geht, ist ein gewisser „Headroom“ immer notwendig, auch bei Messanwendungen. 0 dB Eingangsspannung bei 0 dB Verstärkung ergeben also digitale –6 dB – diese Korrektur ist bei der Messung natürlich zu berücksichtigen. Falls gewünscht, kann durch Anpassen von R19 und R21 auch ein größerer Abstand zur digitalen Übersteuerung erzwungen werden, was beim Recording-Einsatz vorteilhaft ist – hier wählt man gern 10, 12 oder noch mehr dB „roter Bereich“.

## Gut geschirmt

Wie schon bei der Beschreibung des ACV-Moduls angesprochen, ist eine Abschirmung der Platinen unbedingt notwendig. Wenn die Schaltung im c't-Lab-Rack zum Einsatz kommen soll, empfiehlt sich ein 19"-Kassettengehäuse aus Aluminium mit 20 Teileinheiten Breite; die Frontplatte nimmt dann neben den Eingangsbuchsen und den Pegelstellern praktischerweise auch noch das PM8-Bedienpanel auf – das wir hier schon wegen der hilfreichen Pegel- und Übersteuerungsanzeige unbedingt empfehlen. Sämtliche Metallteile der Einschubkassette sind sorgfältig untereinander und schließlich mit der ACV-Schaltungsmasse zu verbinden, sonst kann es zu Knister- und Brummstörungen kommen. Da das metallene c't-Lab-Rack nach VDE-Bestimmungen schutzgeerdet sein muss, ist der ACV-Eingang dann natürlich nicht massefrei – was bei Messungen an Geräten, die nicht schutzgeerdet sind oder an einem Trenntrafo betrieben werden, kaum stören sollte. Der Vorteil eines potenzialfrei angekoppelten externen A/D-Wandlers wäre damit aber dahin.

![[audio-pedant-291478-03.jpg]]

*Die 30-stufige (lineare) ACV-Pegelanzeige bei Anschluss eines PM8-Panels reicht von –20 bis +6 dB. Der 0-dB-Punkt ist durch eine gestrichelte Linie gekennzeichnet, er entspricht –6 dB der digitalen Vollaussteuerung. Bei Übersteuerung wird das rechte Kästchen schraffiert.*

Alternativ wäre folgende Vorgehensweise möglich, falls hier wiederum Brummschleifen drohen: Das c't-Lab-Gehäuse bleibt schutzgeerdet, die ACV-Masse wird aber über einen niederohmigen Widerstand mit dem Kassettengehäuse verbunden. Gute Erfahrungen haben wir mit einem Wert von 1 kOhm/1 W gemacht – der geht bei Masse-Fehlerspannungen nicht gleich in Rauch auf und ist klein genug, um statische Störfelder zuverlässig abzuleiten. Beachten Sie, dass auch die SPDIF-Ausgangsbuchse isoliert montiert werden muss – wir empfehlen hier eine BNC-Buchse, bei Bedarf mit Cinch-Adapter.

![[audio-pedant-291478-04.jpeg]]

*Dank hochintegrierter Bausteine bleibt die Schaltung des Audio-A/D-Wandlers recht übersichtlich. Eine eigene Stabilisierungsschaltung hält die Versorgungsspannungen sauber.*

Der optische Transmitter kann gegebenenfalls dort eingebaut werden, wo er gebraucht wird; man schließt ihn dann über ein dreipoliges Kabel an seine Anschlüsse auf der ADC192-Platine an. Eleganter ist es aber, eine optische Toslink-Kupplung an zugänglicher Stelle (z. B. auch auf der Frontplatte) einzusetzen und nur die optische Strecke zu verlängern. Bausatz-Lieferant Segor führt beispielsweise die Lichtwellenleiter-Kupplung POF-709 im Programm, die mit einem runden Loch in der Frontplatte auskommt und dort einfach eingeklebt wird. Bei der Frontplattenmontage des TOTX178 muss man dagegen zur Schlüsselfeile greifen.

## Dessert zum Menü

Im Panel-Menü des ACV-Moduls dient der Eintrag „SmplRate“ zur Einstellung von Modus und Sampling-Frequenz. Der Consumer-Mode ist durch ein der Sampling-Rate vorangestelltes „C“ zu erkennen, analog bedeutet „P“ Professional. Durch kurzen Druck auf den Drehgeber-Knopf wird die aktuelle Einstellung im EEPROM des Controllers dauerhaft gespeichert und beim nächsten Einschalten automatisch aufgerufen. Die Befehls-Entsprechung des Menüs findet sich im VAL-Wert 8: Mit VAL 8=1! stellt man 96 kHz Sampling-Rate im Consumer-Modus ein (siehe dazu auch die c't-Lab-Syntax im Artikel [**Modulbaukasten**](https://www.heise.de/ratgeber/Modulbaukasten-291034.html)). Wählen Sie den Professional-Modus aber nur, wenn auch tatsächlich Studio-Geräte angeschlossen sind; HiFi-Komponenten könnte diese Einstellung verwirren.

Literatur

[1] Klangwerkstatt, Audio-DSP und AD/DA-Wandler, c't 5/96, S. 334 und c't 6/96, S. 302

[2] [**Digital Audio Data Structures [2]**](https://statics.cirrus.com/pubs/appNote/an22.pdf)

## Audio-Fehler

Sich über hörbare Symptome verschiedener Fehlerquellen bei Audio-Hardware sinnvoll zu verständigen, ist aufgrund des Mangels an allgemein gebräuchlichen und genügend differenzierenden Verben in diesem Bereich fast unmöglich. In unserer fast ausschließlich visuell orientierten Sprachlandschaft tut die Erweiterung des Sprachschatzes in Richtung audiophiler Wortstämme also not. Darum hier ein kleines Vokabular, das wir bereits mit Veröffentlichung unseres Klangwerkstatt-Projektes [1] zusammengestellt hatten, das aber in der Zwischenzeit möglicherweise wieder in Vergessenheit geraten ist.

**Frinzeln:** (winziges Fritzeln) Hochfrequentes, körniges Zischen, hervorgerufen durch schwache Quantisierungsfehler beziehungsweise schwache digitale Störsignaleinstreuungen, beleidigt das empfindliche Ohr, fürs Normalohr noch im Toleranzbereich.

**Piepsen:** Klar erkennbare Einzeltöne (>400 Hz), hervorgerufen durch Aliasing-Produkte (Motoren, unterschiedliche Taktraten in einem System). Tritt gerne neben dem Frinzeln/Fritzeln auf.

**Fritzeln:** Verschärftes unschönes und deutlich vernehmbares körniges Zischen im oberen Frequenzbereich.

**Fauchen:** Durch das ungeditherte Abschneiden der letzten Bits erzeugtes, mit dem Nutzsignal moduliertes Fritzeln oder Frinzeln.

**Britzeln:** Kurze Signalaussetzer, zum Beispiel durch Wackelkontakte ausgelöst.

**Knistern:** Breitbandige, vereinzelt auftretende, impulsartige Störsignale, zurückzuführen auf Bit-Fehler bei der Übertragung.

**Frunzeln:** Tiefe Frequenzen (Obertöne des Netzbrumms) mischen sich ins Fritzeln.

**Flattern:** Das Nutzsignal wird mit tiefen Frequenzen moduliert. Oft durch Rückkopplungen oder Übersteuerungen hervorgerufen.

**Rauschen:** Breitbandiges, gleichförmiges Signal, von analogen oder gut geditherten digitalen Schaltungen erzeugt. Früher neben dem Testbild das Nachtprogramm der Öffentlich-Rechtlichen.

**Brummen:** Stetiger obertonarmer, tieffrequenter Ton (50/100 Hz), der über die Versorgungsspannung übertragen wird oder durch doppelte Masseführung (Brummschleifen) entsteht.

**Wummern:** Nutzsignal wird im Bassbereich zunehmend undifferenzierbar, hervorgerufen durch Systemresonanzen im unteren Frequenzbereich.

**Brunzeln:** (Frunzeln + Brummen) Ein knarrendes Netzbrummen ist deutlichst vernehmbar und lässt sich nicht mehr wegdiskutieren.

**Brazzeln:** Breitbandiges Störsignal, hervorgerufen durch offene Masse, Nutzsignal ist nur noch schwach kapazitiv angekoppelt, sprich nur noch schwach vernehmbar.

**Brutzeln:** Stark obertonhaltiger, typischer Sound eines abgerauchten Verstärkers (100-Hz-Sägezahn).

## Stückliste

### Halbleiter

| ID   | Type                            |
| ---- | ------------------------------- |
| U1   | 78L05                           |
| U2   | Quarzsoszillator 24,576 MHz DIL |
| U3   | PCA9554A                        |
| U4   | CS5381-KSZ                      |
| U5   | CS8406-CSZ                      |
| U6,7 | NE5532 DIL                      |
| U8   | TOTX177 oder 178                |
| ZD1  | Zener 3V3 400mW                 |

### Passive Bauteile

| ID                              | Type                |
| ------------------------------- | ------------------- |
| C1                              | 10µ 50V             |
| C10, 12, 22, 24                 | 2n2 100V FKP RM5    |
| C15                             | 470µ 16V            |
| C17                             | 00n ker. RM5        |
| C2, 5, 7, 9, 11, 13, 14, 16, 18 | 100n SMD1206        |
| C21                             | 1n ker. RM5         |
| C23, 25                         | 560p RM5            |
| C3, 6, 8, 19, 20                | 10µ 25V Ta          |
| C4                              | 100µ 16V            |
| R1, 2, 19, 21                   | 2k7                 |
| R14                             | 1k                  |
| R15                             | 130R                |
| R16                             | 91R                 |
| R17, 20                         | 2k2                 |
| R18                             | 4k7                 |
| R22, 23                         | 5k Präz-Trimmer W64 |
| R3                              | 10k                 |
| R4                              | 470R                |
| R5...8                          | 100R SMD0805        |
| R9...13                         | 4k7                 |

### Sonstiges

| ID    | Type                                                  |
| ----- | ----------------------------------------------------- |
| TR1   | Murata DA101C oder Pulse Engineering T6074 oder T6075 |
| JP1   | entfällt                                              |
| JP2,3 | Jumper, 3-pol. Stiftleiste                            |
| PL1   | Wannen-Pfostenverbinder 16-pol.                       |
| PL2   | Platinen-Steckverbinder 4-pol.                        |
| PL3   | Platinen-Steckverbinder 2-pol.                        |
|       | Platine ADC192 (eMedia, Segor)                        |
|       | 2 M3-Abstandsbolzen 20 mm                             |
|       | 4 Schrauben M3 x 8                                    |
