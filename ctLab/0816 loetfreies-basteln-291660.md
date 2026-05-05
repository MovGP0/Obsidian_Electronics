---
title: FPGA Platine
---
# Lötfreies Basteln

Source: [https://www.heise.de/ratgeber/Loetfreies-Basteln-291660.html](https://www.heise.de/ratgeber/Loetfreies-Basteln-291660.html)
Print view: [https://www.heise.de/ratgeber/Loetfreies-Basteln-291660.html?seite=all&view=print](https://www.heise.de/ratgeber/Loetfreies-Basteln-291660.html?seite=all&view=print)
Author: Carsten Meyer
Series references: c't 16/08, S. 186

> [!note] Segor
> Passende Segor-Seite: [Baugruppe c't-Lab/FPGA und c't-Lab/JTAG](https://www.segor.de/INFO/ct-lab/baugruppe-fpgajtag.shtml)

> FPGA steht für Field Programmable Gate Array, ein Baustein also, dessen Logikelemente sich wie auf einem Experimentierbrett jederzeit umstecken und neu verdrahten lassen – nur in einem ganz anderen Maßstab: Auf unserem Entwurf sehen 400 000 Gatter einer sinnvollen Beschäftigung entgegen. Mit etwas Kommunikationsperipherie fügt sich ein solcher Baustein perfekt in das c't-Lab-System ein.

FPGA-Bausteine sind wahre Universalgenies, die immer dort eingesetzt werden, wo ein Mikroprozessor zu langsam, eine diskret aufgebaute Gatterschaltung viel zu umfangreich und ein speziell für den jeweiligen Anwendungsfall gefertigter Custom-Chip unrentabel oder zu unflexibel wäre. Was der Baustein mit seinen (in der Regel vielen) Anschlüssen macht, bestimmt einzig seine Konfiguration, die sich jederzeit ändern lässt – einfach durch „Aufspielen“ einer Konfigurationsdatei.

Eigentlich hatten wir Ihnen mit dem Beginn der c't-Lab-Serie im letzten Jahr ja einen Frequenzzähler versprochen – der der Einfachheit halber mit einem FPGA realisiert werden sollte. Letztlich stellten sich die ungeahnten Möglichkeiten, die ein solcher Baustein bietet, aber als so verlockend heraus, dass wir dieses Konzept verwarfen und stattdessen eine universell verwendbare FPGA-Platine konstruierten, die auch Eigenentwicklungen an Hardware und FPGA-Designs aufnehmen kann – auch dann, wenn Sie mit dem restlichen c't-Lab-Projekt gar nichts anfangen können.

## Silizium-Backstube

Hierbei ist der Frequenzzähler nur ein Anwendungsfall unter sehr, sehr vielen: Im Prinzip kann ein FPGA alles steuern, schalten und überwachen, was sich bis in den dreistelligen MHz-Bereich abspielt – fertige Lösungen (wie eben unser Frequenzzähler) sind ebenso denkbar wie postmateriell Selbstentworfenes oder Adaptiertes.

Dazu gehören auch Anwendungen völlig abseits der seriösen Mess- und Regel-Thematik [1], wie das Bild links unten zeigt. In das 400 000-Gatter-Exemplar unseres FPGA-Modul passt übrigens ohne weiteres die Logik mehrerer Heimcomputer – inklusive Z80- oder 6502-Prozessoren, die als „Nachbauten“ sogar um ein Vielfaches schneller arbeiten als die Originale.

Zum verwendeten FPGA aus der Spartan-3-Familie von Xilinx (der XC3S400) existiert eine kostenlose Entwicklungsumgebung [2], mit der man die gewünschte Innenverschaltung des Bausteins als Schaltplan oder in einer Hardware-Beschreibungssprache (unterstützt werden VHDL und Verilog) erstellt. Nach dem sogenannten Synthetisieren, der „Hardware-Kompilierung“, erhält man eine Netzlisten-Datei, die vorgibt, wie und welche Logikelemente im Innern des FPGA verschaltet werden – ein schnödes Binärfile, das beim XC3S400 etwas über 2 MByte lang ist.

Mit diesem muss man dann nur noch das bis dahin völlig untätige FPGA „programmieren“ – beispielsweise mit einem simplen Adapterkabel am PC-Druckerport. Leider sind FPGAs im Unterschied zu den deutlich weniger umfangreichen, aber meist Flash-basierten CPLDs (Complex Programmable Logic Devices) sehr vergesslich: Nach dem Ausschalten ist ihnen wieder alles entfallen, was man ihnen aufgetragen hatte.

Das ist natürlich für eine Stand-alone-Anwendung, die auch ohne Nabelschnur zum Rechner funktionieren soll, eher unpraktisch. Üblicherweise stellt man dem FPGA deshalb einen Flash-Speicherbaustein zur Seite, der ein einziges Mal mit den Konfigurationsdaten programmiert wurde: Nach dem Einschalten holt sich das FPGA die Datei selbsttätig aus dem Flash-Baustein, was nur Sekundenbruchteile dauert, und legt los. Das automatische Konfigurieren aus einem externen Speicherchen ist aber auch das einzige, was ein FPGA von sich aus kann – alles weitere muss man ihm beibringen.

## À la SD-Karte

Auch diese Lösung erschien uns zu unflexibel: In einem solchen Flash-Speicher findet immer nur eine einzige Anwendung Platz, für jede neue muss man den Baustein mehr oder weniger umständlich umprogrammieren. Stattdessen übernimmt bei unserem Modul der ohnehin für die Abwicklung der c't-Lab-Kommunikation vorhandene Atmel-Controller das FPGA-Konfigurieren. Der Clou daran: Dem Controller haben wir als neue Peripherie einen Kartenslot für eine billige SD-Karte spendiert, die als Massenspeicher für die Konfigurationsdateien fungiert. Auf eine Karte mit 128 MByte passen zwar mindestens 50 verschiedene FPGA-Konfigurationen, wegen des knappen Controller-RAMs haben wir uns jedoch auf 32 Dateien beschränken müssen. Die kann man dafür sogar mit dem c't-Lab-Befehl CFG ferngesteuert wechseln, ein Directory-Listing erhält man mit „LST?“.

![[loetfreies-basteln-291660-01.jpg]]

*Unser Musteraufbau des FPGA-Moduls musste noch ohne VGA-Buchse auskommen, entspricht aber sonst weitgehend der Serie. Der Kühlkörper am Spannungsregler erwies sich im Nachhinein als überflüssig.*

Als Dateisystem wird dabei ein normales FAT16 verwendet, sodass man die Konfigurationsdateien bequem mit jedem PC aufspielen kann – einzige Voraussetzung: Die Dateien müssen mit DOS-konformen „8.3“-Dateinamen im Root-Verzeichnis stehen, verschachtelte Ordner würden den Mikrocontroller mit seinen gerade einmal 4 KByte RAM arg überfordern. Als kleines Manko sei noch die Zeit von knapp zwei Sekunden angemerkt, die der AVR-Controller zum Auslesen der Speicherkarte benötigt – da geht das direkte Auslesen eines dedizierten Speicherchips doch merklich fixer. Wenn tatsächlich einmal unmittelbar zwischen zwei FPGA-Anwendungen gewechselt werden muss, bringt man notfalls beide gleichzeitig darauf unter – Sie werden sich wundern, was alles auf ein 400 000-Gatter-FPGA passt …

## Sprich mit mir!

Damit man auch Daten oder Einstellungen an die FPGA-Applikation übergeben oder daraus auslesen kann, haben wir als Kommunikationskanal zwischen Controller und FPGA einen SPI-Mehrdrahtbus vorgesehen, der auch quasi-transparent über den c't-Lab-Optobus zugänglich ist. Theoretisch kann das FPGA hierbei 256 Register mit jeweils 32 Bit Breite erhalten, sogar für Lese- und Schreibvorgänge getrennt: Der c't-Lab-Befehl „VAL 10=12345!“ beispielsweise beschreibt das SPI-Register 10 mit dem Wert 12345, die Abfrage „VAL 0?“ liest aus dem Register mit der Adresse 0. Ausgenommen sind lediglich die beim c't-Lab üblichen System-Adressen 80 bis 89 (Display-Steuerung) und 250 bis 255 (Status-, Fehler- und Baudratenregister) sowie die Subkanäle für den CFG- und LST-Befehl (240, 241), die allesamt vom Controller „abgefangen“ werden und gar nicht erst zum FPGA gelangen.

![[loetfreies-basteln-291660-02.jpg]]

*Beispiel für eine weitgehend zweckfreie, wenngleich höchst amüsante FPGA-Entwicklungsarbeit des Autors: Ein voll funktionstüchtiger „Asteroids“-Spielautomat nach den Originalplänen von 1979 im Spartan-3-FPGA. Das Steampunk-Design gewinnt durch die alte Oszilloskop-Röhre und eine Ablenkschaltung mit ECC83-Trioden.*

Das Ganze funktioniert natürlich nur, wenn Sie in Ihr FPGA-Design unser vorbereitetes SPI-Kommunikationsgerüst aufnehmen; von sich aus würde das FPGA mit den Impulsen vom Controller nichts anzufangen wissen. Es steht Ihnen frei, das rudimentäre, aber einfach zu durchschauende Modell (4 Schreib-Lese-Register 0 bis 3) nach eigenen Wünschen zu erweitern – mit den gerade angeführten Einschränkungen im Adressraum. Die implementierten Register müssen auch nicht allesamt die volle Breite von 32 Bit aufweisen, auch wenn der Controller grundsätzlich 32-Bit-Blöcke (MSB first) sendet und empfängt: Überzählige höherwertige Bits fallen bei kleineren Registern einfach „hinten hinaus“.

![[loetfreies-basteln-291660-03.jpg]]

*Für die Spielpausen ist noch eine Uhr eingebaut – die auf einem eigenen „Mikroprozessor“ im FPGA läuft.*

Im Unterschied zu den bisher erschienenen, eher „schlüsselfertigen“ c't-Lab-Modulen lädt die FPGA-Platine also zum Selbstentwickeln ein – dem sind wir auf Hardware-Seite auch mit drei VG-Slots entgegengekommen, die Eigenkonstruktionen an FPGA-Peripherie (ADCs, DACs, Treiber, Pegelwandler, USB und andere Hochgeschwindigkeitsschnittstellen, RAM-Speicher, Video-Ausgang) aufnehmen können. Steckkarten wie bei ADA-IO sind unsererseits nicht geplant; unter Berücksichtigung gewisser Eigenheiten (dazu später) lassen sich aber die im letzten Jahr vorgestellten ADA-IO-Steckkarten einsetzen, die Pinbelegung des einen Slots ist abwärtskompatibel. Die Ansteuerung der Karten bleibt dann aber Ihrem Synthese-Geschick überlassen.

## Handkurbel

Wie bei allen c't-Lab-Modulen ist auch bei der FPGA-Platine der Anschluss eines optionalen Bedienpanels PM8 vorgesehen. Damit kann man eine von 32 möglichen Konfigurationsdateien auf der SD-Karte von Hand auswählen, die DOS-Dateinamen zeigt es im Klartext an. Ferner hält das Panel eine bescheidene Möglichkeit bereit, die Parameter der (oben erwähnten) SPI-Register 0 bis 3 von Hand zu ändern: Die Anzeige der 32-Bit-Registerinhalte erfolgt hexadezimal (also 8-stellig). Mit einem Druck auf den Drehgeber und anschließendem Drehen wählt man die zu ändernde Stelle, nach nochmaligem Druck kann man den Hex-Wert dieser Stelle korrigieren – übrigens mit Übertrag auf die jeweils höherwertigen Stellen.

Das Panel ist ganz praktisch, um ohne Rechnerunterstützung auf die wichtigsten Register (das sollten also immer die ersten vier sein) zuzugreifen. Die Registeradressen wählt man dagegen mit den Up-/Down-Tastern (4 Schreib- und 4 Lese-Register) aus, mit diesen Bedienelementen erreicht man auch das Directory-Menü mit der zu verwendenden Konfigurationsdatei. Die mit dem Drehgeber ausgewählte wird geladen, wenn man kurz auf den Drehknopf drückt.

## Arbeitsteilung

Trotz der Komplexität der Materie – das Einarbeiten in die Xilinx’sche Entwicklungsumgebung kann einen schon einige Wochenenden beschäftigen – sind Schaltung und Aufbau des FPGA-Moduls vergleichsweise simpel, auch weil keinerlei zeitraubende Abgleicharbeiten das Bastlergemüt strapazieren. Der Controller-Teil entspricht weitgehend der bekannten Schaltung, wie sie in den anderen c't-Lab-Modulen ebenfalls ihren Dienst tut – wenn man vom verwendeten ATmega644 einmal absieht, der bei gleicher Pinbelegung doppelt so viel Flash-ROM und RAM-Zellen bietet wie der sonst eingesetzte ATmega32. Der größere ATmega644 war aufgrund der speicherfressenden FAT16-Routinen für das Auslesen der SD-Speicherkarte notwendig geworden. Der Slot ist übrigens nicht SDHC-kompatibel, was bei maximal 128 sinnvoll einsetzbaren Megabyte aber nicht weiter stört.

![[loetfreies-basteln-291660-04.jpeg]]

*Alte Bekannte: Der Mikrocontroller-Teil weist als einzige relevante Änderung gegenüber unseren anderen Modulen einen ATmega644 als Protagonisten auf. PL5/Debug dient lediglich zum Debuggen mit einem Logikanalysator und wird ansonsten nicht verwendet. Hinzugekommen ist allerdings der SD-Kartenslot.*

Das Interface zum FPGA besteht aus den SPI-Leitungen des Controller-Ports B plus einigen Select-Leitungen, die über Widerstandsnetze an die FPGA-Pins gelangen: Wie andere moderne Bausteine auch möchte das FPGA gern 3,3-V-Logikpegel an seinen Pins sehen. Das „Programmieren“ des FPGA, also das Überspielen der Konfigurationsdaten, geschieht über ein weiteres serielles Interface, das mit einigen Pins des Controller-Ports C aufgebaut ist. Durch trickreiche Firmware-Programmierung steht es in der Geschwindigkeit dem SPI-Port kaum nach, es erreicht deutlich über 1 MByte/s, sodass die Konfigurationsdatei in weniger als zwei Sekunden „im Kasten“ ist.

Bei der Wahl des FPGA mussten wir einen Kompromiss aus Größe und Gehäuse eingehen: Mehr als die 400 000 Gatter gibt es bei Xilinx nur noch im Ball-Grid-Array-Gehäuse, dem natürlichen Feind jeder Lötstation. Der verwendete XC3S400 im TQ-144-Pack ist dagegen für Geübte sogar noch von Hand zu löten. Bei Segor erhalten Sie ihn bereits fertig aufgelötet auf die FPGA-Platine, auch der ATmega644 im SMD-Gehäuse sitzt hier schon an der richtigen Stelle.

![[loetfreies-basteln-291660-05.jpeg]]

*Nur ein aktives Bauteil (von LED-Krümel und Oszillatoren abgesehen) erledigt den Rest: der Spartan XC3S400 von Xilinx. Eingezeichnet sind hier auch die drei Erweiterungssteckplätze.*

Von den über 100 frei belegbaren I/O-Pins des XC3S400 gehen 8 für das serielle Interface zum Controller drauf, ein Pin treibt eine Status-LED, die ein „laufendes“ FPGA-Design anzeigen kann. 48 I/O-Leitungen stehen schließlich dem Anwender an den zwei VG-Leisten zur Verfügung. Damit auch schnelle Designs mit differentiellen Leitungen implementiert werden können, gehen die zusammengehörenden Paare immer an zwei nebeneinanderliegende Pins der VG-Leisten (a/b). Ansonsten dürfen die Leitungen natürlich auch völlig unabhängig voneinander eingesetzt werden, dies entscheidet einzig das FPGA-Design.

Die SPI-Schnittstelle des FPGA ist generell als „Slave“ konfiguriert, was die Implementation stark vereinfacht. Ein Low-Pegel auf F_DS zeigt an, dass 32 Bits an ein Datenregister gehen; das auswählende 8-Bit-Adressregister wird mit Low auf F_RS beschrieben. Die Daten selbst wechseln über F_MOSI und F_MISO den Besitzer. Wenn das FPGA dem Controller etwas Dringendes (etwa ein Register-Update) mitteilen will, muss es nur kurz an der F_INT-Leitung ziehen. Die vorliegende Firmware-Implementierung nutzt diese Möglichkeit allerdings nur begrenzt: Mit einem Low-Impuls an F_INT liest der Controller Register 0 aus und liefert den Wert an den c't-Lab-Optobus (z. B. „#6:0=32768“ bei mit Jumpern 3 bis 5 eingestellter Moduladresse 6).

Auf der Platine sind als Taktquelle zwei Quarzoszillatoren vorgesehen, für den grundsätzlichen Betrieb notwendig ist nur U3. Da sich viele fertige FPGA-Designs auf einen externen Takt von 50 MHz stützen, haben wir hier ebenfalls diese Frequenz genommen; Pflicht ist diese freilich nicht – sie kann so hoch gewählt werden, wie es das Design zulässt (die Maximalfrequenz gibt die Xilinx-Entwicklungsumgebung nach der Synthese aus).

Die dritte VG-Leiste erhält für eine Kompatibilität mit ADA-IO-Steckkarten nur jedes zweite Signal (insgesamt also 24) der anderen beiden Leisten, dafür aber auf beiden a/b-Pins gleichzeitig. Die Nummerierung der Signale im Schaltbild auf Seite 190 folgt einem einfachen Schema: „FP20“ beispielsweise bedeutet „Signal von Pin 20 des FPGA“, das „P“ verdeutlicht dabei, dass es sich um den positiven Part eines differentiellen Signals handelt (oder besser: handeln kann, da die Signale keineswegs differentiell sein müssen). Der negative Part ist folglich auf Pin „FN21“ zu finden.

Die VGA-Ausgangsbuchse mit den drumherum drapierten Widerständen (einfache D/A-Wandler für je acht Farbabstufungen) ist optional, aber für FPGA-Designs mit Video-Interface ganz hilfreich. Wenn ein Video-Interface aufgebaut wird, gehen die daran angeschlossenen I/O-Leitungen für die VG-Leisten natürlich verloren.

Das FPGA benötigt drei Versorgungsspannungen: Eine für die I/O-Treiber (VccoF, hier 3,3 V), eine für die I/O-Elektronik (VccAux, 2,5 V) und eine Kernspannung (1,2 V). Die 3,3 V stellt ein Low-Drop-Regler LF33 aus der 5-V-Schiene bereit, die Durchlassspannung einer simplen Diode macht daraus die benötigten 2,5 V. Ein LM317-Spannungsregler in Minimal-Beschaltung liefert schließlich die Kernspannung.

## Auspacken, bestücken, geht?

Bei den mit den SMD-Bauteilen vorbestückten Segor-Platinen bleibt nur wenig diffizile Lötarbeit: Acht der 100n-Abblockkondensatoren gehören noch auf die Lötseite der Platine. Etwas Fingerfertigkeit verlangt dann das Auflöten des SD-Kartenslots, zwei der Masse-Lötpads befinden sich im Einschubkanal. Das Edelstahl-Gehäuse selbst lässt sich nicht löten. Auf der hinteren linken Ecke des Kartenslots finden sich zwei Pins, die zum Kartenwechsel-Kontakt führen und selbstverständlich mit den Lötpads fluchten müssen. Bei der SMD-LED ist die Kathode (Minuspol) durch eine „angefaste“ Kante zu erkennen (Lupe!) – im Zweifelsfall lieber nachmessen.

Ein Kühlkörper für die Spannungsregler sollte nur in Ausnahmefällen (Hochfrequenz-Designs) nötig sein. Beachten Sie, dass die Kühlfahnen der beiden ICs voneinander isoliert sein müssen. Für die Quarzoszillatoren sieht man praktischerweise Fassungen vor. Eine letzte Fleißarbeit ist dann nur noch das Einlöten der VG-Leisten. Beachten Sie, dass diese gegenüber der ADA-IO-Platine in die andere Richtung zeigen; die M2,5-Befestigungslöcher müssen exakt fluchten!

![[loetfreies-basteln-291660-06.jpeg]]

*Der optionale Platinenteil mit dem JTAG-Adapter (rechts) wird nach dem Bestücken abgetrennt. Verwenden Sie bei Selbstbauten (vor allem solchen mit SMD-Bauteilen) lieber kein Bleifrei-Lötzinn – selbst Profis bekommen damit keine schönen Lötstellen hin. Rot eingezeichnet sind die acht 100n-Kondensatoren C4, C6, C7, C8, C10, C12, C13 und C14, die auf der Lötseite zu bestücken sind.*

Die Bestückung des JTAG-Adapters (siehe auch die [**SEGOR-Baugruppenübersicht**](https://www.segor.de/INFO/ct-lab/baugruppe-fpgajtag.shtml)) – der einem in der Entwurfsphase das Umkopieren der FPGA-Konfiguration auf Speicherkarte erspart – ist optional. Die Schaltung kann von der FPGA-Platine mit Strom versorgt werden, J6 muss dann gesteckt sein.

Wie oben erwähnt verlangt die FPGA-Platine keine Einstellarbeiten. Lediglich die Hilfsspannungen sollten Sie nach dem Anschließen an eine c't-Lab-Stromversorgung (IFP-Modul oder PS2-3-Platine) kontrollieren, am besten direkt an den Ausgängen der Spannungsregler (3,3 V an Pin 3 von U6, 1,2V an Pin 2 von U5) und an der Kathode von D1 (ca. 2,5 V). Die Inbetriebnahme beginnt mit dem Programmieren der Firmware für den ATmega644-Controller. Hier sind unbedingt die Clock-Fuses für einen externen Quarz als Taktquelle zu setzen (siehe auch die [**Heise-FAQ zum Flashen und Setzen der Fuse-Bits**](https://www.heise.de/hintergrund/FAQ-fuer-c-t-Bot-und-c-t-SIM-291940.html?seite=2)) – der 644 ist hier deutlich anspruchsvoller als der (ältere) ATmega32. Das FPGA-Modul muss sich nach erfolgreichem „Flashen“ mit seinem Begrüßungsstring (etwa „#6:254=1.XXX [c't FPGA]“) melden.

Kopieren Sie nun die Demo-Konfiguration „LEDblink.bin“ auf eine leere SD-Karte und setzen diese in den Kartenslot ein. Die LED neben dem Slot sollte nun knapp zwei Sekunden lang aufflackern, danach muss die Status-LED des FPGA blinken – eindeutiges Kennzeichen, dass die Datei einwandfrei „aufgespielt“ wurde und das FPGA arbeitet.

Freilich kann zur direkten FPGA-Konfiguration vom Rechner aus auch der JTAG-Port PL7 verwendet werden; dies ist in der Entwurfsphase bequemer, außerdem gestatten einige Xilinx-Entwicklungstools über JTAG den Zugriff auf FPGA-Interna. Die Pinbelegung entspricht dem „Parallel Cable III“ von Xilinx, ein Druckerport-Adapter, der sich schnell mit ein paar Bauteilen aus der Bastelkiste (siehe Stückliste) aufbauen lässt: Wir haben dafür einen Teil der FPGA-Platine reserviert, der sich abbrechen lässt und dann den Adapter bildet. Ein nicht allzu langes Flachbandkabel (max. 30 cm) stellt dann die Verbindung zwischen JTAG-Adapter und FPGA-Platine her, der Adapter wiederum wird über ein 25-poliges Sub-D-Kabel (voll beschaltet) mit dem Rechner verbunden.

## Und was ist mit ISE?

Während auf SD-Karte kopierte Designs auch ohne Xilinx-Entwicklungsumgebung ausprobiert und eingesetzt werden können, kommt der Einsatz des JTAG-Kabels erst nach erfolgreicher IDE-Installation in Frage. Schon der Umfang des „WebPACK ISE“ genannten Pakets von mehr als 2 GByte lässt ahnen, dass ein erschöpfender Artikel darüber nicht allein diese gesamte c't-Ausgabe, sondern eher ein dickes Buch füllen dürfte.

Wir hätten Ihnen an dieser Stelle aber zumindest gern verraten, wie Sie unser Frequenzzähler-Design oder andere Demos [3] editieren und ergänzen können – wenn nicht Xilinx kurz vor Redaktionsschluss die rundum erneuerte Version 10.1 zum Download freigegeben hätte. Die aber macht wieder so vieles anders, dass auch wir noch etwas Zeit zur Einarbeitung benötigen – mindestens bis zur nächsten c't-Ausgabe.

Literatur

[1] [**Spiele-Klassiker als FPGA-Implementationen**](https://www.fpgaarcade.com/)

[2] [**AMD/Xilinx ISE Archive**](https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vivado-design-tools/archive-ise.html)

[3] [**c't-Lab-Projekte bei SEGOR**](https://www.segor.de/INFO/ct-lab-projekte.shtml)

[4] [**Grundlagen und Tricks zu FPGA-Entwicklungen**](https://www.mikrocontroller.net/articles/Xilinx_ISE)

## Stückliste FPGA-Platine

### Halbleiter

| ID         | Type                                   |
| ---------- | -------------------------------------- |
| U1         | ATmega644, QFP44                       |
| U2         | Oszillator, DIL14 (optional, siehe Text) |
| U3         | Oszillator, 50 MHz, DIL14              |
| U4         | 6N137, DIL8                            |
| U6         | LF33, TO220                            |
| U5         | LM317, TO220                           |
| U7         | Xilinx XC3S400, TQ144                  |
| D1         | 1N4007                                 |
| LED1, LED3 | LED rot 3mm                            |
| LED2       | LED rot SMD0805                        |

### Passive Bauteile

| ID                                    | Type         |
| ------------------------------------- | ------------ |
| C1, C2                                | 22p SMD0805  |
| C3, 4, 5, 7, 8, 9, 10, 11, 12, 13, 14, 15, 17, 19 | 100n SMD1206 |
| C6, 16, 18, 20                        | 22µ 16V Ta.  |
| R1, 16..18, 38, 39                    | 4k7, SMD0805 |
| R2, 30, 31, 33, 36, 41, 44, 47        | 470R, SMD0805 |
| R3, 4, 8                              | 2k7, SMD0805 |
| R5, R6                                | 220R, SMD0805 |
| R7, 14, 15, 34, 35, 37, 40, 43, 46    | 1k, SMD0805  |
| R9..13, 20..25, 32                    | 220R, SMD0805 |
| R19, 42, 45, 48..50                   | 270R, SMD0805 |
| R26..29                               | 100R, SMD0805 |

### Sonstiges

| ID      | Type                               |
| ------- | ---------------------------------- |
| XTAL1   | Quarz 16MHz HC49U                  |
| PL2..6  | Wannen-Pfostenverbind.10-pol.      |
| PL1, PL7 | Wannen-Pfostenverbind.14-pol.     |
| PL8     | SD-Kartenslot FPS009-2700-0        |
| JP1..5  | Jumper 2-pol.                      |
| CONN1..3 | VG-Leiste 64-pol. female a/b      |
| CONN4   | Sub-D 15-pol. HD 90° fem. (VGA)    |
|         | Platine c't-Lab FPGA (eMedia, Segor) |

## Stückliste JTAG-Adapter

### Halbleiter

| ID     | Type                          |
| ------ | ----------------------------- |
| U8, U9 | 74HC125, DIL (kein HCT/LS!)   |
| D2, D3 | BAT48                         |

### Passive Bauteile

| ID                  | Type          |
| ------------------- | ------------- |
| R51, 57, 58, 62     | 100R          |
| R52, 64             | 47R           |
| R53, 55, 56, 60, 61 | 270R          |
| R54                 | 470R          |
| R59                 | 1k            |
| R63                 | 4k7           |
| C21                 | 10n ker. RM5  |
| C22                 | 100n ker. RM5 |

### Sonstiges

| ID    | Type                           |
| ----- | ------------------------------ |
| JP6   | Jumper 2-pol.                  |
| PL9   | Wannen-Pfostenverbind. 14-pol. |
| PL10  | Platinen-Steckverbinder 2-pol. |
| CONN5 | Sub-D 25-pol. 90° male         |

RSPEAK_STOP
(cm)
RSPEAK_START

**URL dieses Artikels:**

`https://www.heise.de/-291660`

**Links in diesem Artikel:**

1. https://www.segor.de/INFO/ct-lab/baugruppe-fpgajtag.shtml
2. https://www.heise.de/hintergrund/FAQ-fuer-c-t-Bot-und-c-t-SIM-291940.html?seite=2
3. https://www.fpgaarcade.com/
4. https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vivado-design-tools/archive-ise.html
5. https://www.segor.de/INFO/ct-lab-projekte.shtml
6. https://www.mikrocontroller.net/articles/Xilinx_ISE

*Copyright © 2008 Heise Medien*
