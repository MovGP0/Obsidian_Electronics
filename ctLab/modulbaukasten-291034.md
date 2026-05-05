# Modulbaukasten

Source: [https://www.heise.de/ratgeber/Modulbaukasten-291034.html](https://www.heise.de/ratgeber/Modulbaukasten-291034.html)
Print view: [https://www.heise.de/ratgeber/Modulbaukasten-291034.html?seite=all&view=print](https://www.heise.de/ratgeber/Modulbaukasten-291034.html?seite=all&view=print)
Author: Carsten Meyer
Series references: c't 11/07, S. 212

> Eine tragende Rolle wird dem ADA-IO-Modul des c't-Lab zuteil, und das gleich in zweifacher Hinsicht: Es ist besonders vielseitig einsetzbar und es dient physikalisch als Baugruppenträger für bis zu fünf I/O-Karten. Nach dem Vorgeplänkel in der letzten c't wird es jetzt ernst, denn der mehr oder weniger nur passiven Interface-Elektronik folgt nunmehr das erste intelligente Messmodul.

Gedacht ist ADA-IO als frei konfigurierbares Messwert-Erfassungs- und Ausgabemodul, das je nach Bedarf mit I/O-Leitungen und Wandlerkanälen bestückt werden kann. Der eingebaute Mikrocontroller steuert bis zu 64 digitale I/O-Portleitungen, acht A/D-Kanäle mit 10 und acht mit 16 Bit sowie acht A/D-Kanäle mit 12 oder 16 Bit Auflösung an. Zusätzlich können an seinen I2C-Bus Sensoren mit I2C-Schnittstelle angeschlossen werden, etwa Temperaturfühler oder lichtempfindliche Sonden. Dazu kommen wir aber erst zu einem späteren Zeitpunkt der Serie.

Zunächst zur Karten-Hardware selbst: Der eingebaute Mikrocontroller, ein mit 16 MHz getakteter AVR ATmega32, beinhaltet die Hardware-Treiber für die verschiedenen Portbausteine sowie den I2C-Bus und einen Befehls-Parser für die c't-Lab-Syntax. Er kommuniziert über seine integrierten seriellen Leitungen mit der Außenwelt, sprich der IFP-Interface-Karte aus der letzten c't (oder mit weiteren Messmodulen, so vorhanden) und letztendlich dem steuernden oder auswertenden Rechner. Der Controller empfängt seine Befehle über einen potenzialtrennenden Optokoppler, der ähnlich wie bei der Musikinstrumenten-Schnittstelle MIDI in eine 5-mA-Stromschleife eingefügt ist. Dadurch darf die Entfernung von einem Modul zum nächsten oder zur Interface-Karte IFP sehr lang werden - mehrere Meter sind kein Problem. Für dieses serielle Bus-System verwenden wir im Folgenden die Bezeichnung „Opto-Bus“.

## Licht als Brücke

Per Default liegt die Opto-Bus-Baudrate bei 38400 Bit/s, sowohl für den Receiver als auch den Transmitter. Letzterer besteht im Prinzip nur aus der im Controller integrierten seriellen Schnittstelle und einem profanen 220-Ohm-Widerstand, der die Optokoppler-Leuchtdiode auf Empfängerseite treibt. Wie bei MIDI reicht es aus, lediglich die Empfänger optoelektronisch zu isolieren, beim Daten-Kreisverkehr innerhalb des c't-Lab ergibt sich trotzdem eine vollständige Potenzialtrennung der Messmodule untereinander.
Innerhalb des c't-Lab bestehen die Opto-Bus-Verbindungen der Einfachheit halber aus 10-poligem Flachbandkabel mit entsprechenden Steckverbindern - die sind billig und schnell montiert, und die Tatsache, dass davon nur vier Leitungen (zwei hin, zwei zurück) in Gebrauch sind, stört wenig - immerhin haben wir zur Erhöhung der Kontaktsicherheit jeweils zwei nebeneinanderliegende Pins parallel geschaltet. Auf dem letzten Modul in der Kette sorgen zwei gesteckte Jumper dafür, dass sich der Datenkreis schließt - die Rückführung zum IFP-Interface erfolgt wieder über das gleiche Kabel, wenn auch über andere Adern (7/9 und 8/10).
Es ist daher ohne Weiteres statthaft, einzelne Module bei Bedarf „auszugliedern“ und etwas abseits vom c't-Lab zu betreiben. Praktischerweise wird man zur Ankopplung das letzte von gegebenenfalls mehreren Messmodulen wählen (hier ist „Opto-Bus Out“ - PL2 bei ADA-IO - ja frei) und hier zu einer anderen Steckverbindung greifen als dem Flachkabel-Pfostenverbinder: Für die vierpolige Leitung reicht schon der gute, alte Diodenstecker (der übrigens so heißt, weil er bei historischen Radios das Audio-Signal gleich hinter der Demodulator-Diode auskoppelte) in der fünfpoligen Ausführung. Zum Ankoppeln externer Module eignet sich das wie der DIN-41524-Stecker etwas aus der Mode gekommene „Tonband-Überspielkabel“ gut, die ansonsten nicht genutzte Abschirmung (der mittige Pin 2 des Steckers) gehört auf einer (und zwar nur auf einer!) Seite an die Gehäusemasse. Wenn gerade kein externes Modul angeschlossen ist, kann ein Kippschalter die zwei Jumper auf dem letzten Messmodul überbrücken.

## Draußen vor dem Port

Das ADA-IO-Modul besitzt fünf Slots in Form von simplen VG-Leisten nach DIN 41 612 - die sind leicht beschaffbar und bieten eine ausreichende Stabilität und Steckkraft, sodass die I/O-Steckkarten nicht separat befestigt werden müssen. Die hierfür vorgesehenen Steckkarten stellen natürlich keine eigenständigen c't-Lab-Module dar, sie funktionieren nur mit dem ADA-IO-Modul als Träger und Treiber und sie sind - schon wegen der Vielzahl der benötigten Signale - nicht untereinander opto-isoliert. An den 32 Polen der „Slots“ (je zwei gegenüberliegende der eigentlich 64-poligen Steckverbinder sind wegen des geringeren Übergangswiderstandes parallel geschaltet) liegen die fast vollständig versammelten ATmega-Ports A bis C an, darunter auch sein I2C-Bus, außerdem die diversen Betriebsspannungen und die getrennten Digital- und Analogmassen.

Der ATmega32 beinhaltet einen A/D-Wandler mit 10 Bit Auflösung ebenso eine auf dem Chip integrierte Referenzspannungsquelle, die rund 2,56 V liefert - per Default für den eingebauten Wandler. Besonders hohe Ansprüche darf man an Wandler-Linearität und Referenz-Genauigkeit nicht stellen; die Referenzspannung wandert merklich mit der Chip-Temperatur, was das Datenblatt leider unerwähnt lässt. Unsere Firmware nutzt die acht Analogeingänge auf Port A trotzdem, für viele Anwendungsfälle reicht die Genauigkeit aus. Außerdem spart man sich bei Verwendung des eingebauten Wandlers zusätzliche Hardware, im Prinzip reichen ein Vorwiderstand und ein Filterkondensator pro Eingang; die weiter unten beschriebene I/O-Steckkarte IO8-32 macht davon Gebrauch. Die vorliegende Firmware-Version beinhaltet ferner Treiber für die oben angesprochenen A/D- und D/A-Wandler-Karten, die im Lauf der c't-Lab-Serie noch folgen werden. Die Firmware bindet die Treiber automatisch ein, sobald sie die entsprechenden Karten in den Slots vorfindet. Die Befehlssyntax bleibt dabei gleich, egal, ob Sie beispielsweise einen 12- oder 16-Bit-D/A-Wandler einsetzen.

Der Aufbau der recht übersichtlichen ADA-IO-Grundplatine gestaltet sich einfach, auch wenn das Einlöten der fünf VG-Federleisten eine rechte Fleißarbeit ist. Achten Sie hier auf die richtige Ausrichtung, erkennbar an den dann bündigen M2,6-Befestigungslöchern. PL1 bis PL6 sind Pfostenleisten zum Anschluss von Flachbandkabeln, wobei PL5 und PL6 für Erweiterungen vorgesehen sind und derzeit noch nicht benutzt werden. PL1 führt zum Netzteil-Ausgang PL1 der IFP-Platine; eine Verpolung ist mit hoher Wahrscheinlichkeit tödlich für Prozessor und die Bauteile auf den Steckkarten (Pin 1 ist bei den Flachkabel-Verbindern durch ein Quadrat um den Pin gekennzeichnet). Wenn später die analogen Erweiterungskarten eingesteckt sind, dürfen Sie das Modul auch keinesfalls durch Einstecken von PL1 bei bereits anliegender Spannung in Betrieb nehmen. Die verwendeten Operationsverstärker und Wandler mögen das gar nicht und gehen in einen „Latch Up“ genannten Zustand, einhergehend mit starker Erwärmung und letztendlicher Zerstörung.

![[modulbaukasten-291034-01.jpeg]]

*Im einfachsten Fall wird die ADA-IO-Platine nur mit einer IO8-32-Steckkarte (vorn) bestückt, sie bietet dann die 32 Portleitungen und 8 A/D-Kanäle mit 10 Bit Auflösung.*

Wir empfehlen, die Firmware (siehe Soft-Link) des ATmega32 „in circuit“ zu flashen, also in der fertig aufgebauten und mit einem unprogrammierten ATmega32 bestückte ADA-IO-Platine. Die Programmdaten erhält der ATmega32 über die ISP-Schnittstelle PL4, die in der Pinbelegung übrigens dem (weitverbreiteten) ISP-Anschluss der Entwicklungssysteme STK200/300/500 von Atmel gleicht und die auch beim c't-Bot oder beim c't-Klangcomputer Verwendung fand. Die Daten landen im prozessorinternen Flash-Speicher, der sich bis zu 10 000-mal neu „bespielen“ lässt. Es gibt dafür verschiedene PC-Tools, wir haben mit dem kostenlosen Programm PonyProg von Claudio Lanconelli, das es in Linux- und Windows-Varianten gibt, gute Erfahrungen gesammelt. Der Mac bleibt hier leider außen vor.

## Weichbrennerei

Das Ganze ist einfacher, als es sich zunächst anhört: Sie benötigen zum Flashen der Firmware neben PonyProg (bitte die Hinweise auf der Webseite des Autors beachten) nur noch einen sehr einfachen ISP-Programmieradapter für den PC-Druckerport, der sich in wenigen Minuten mit Bauteilen aus der Bastelkiste aufbauen lässt. Sie können beispielsweise den erstmalig zum BlueMP3-Projekt in c't 9/04, Seite 202 vorgestellten ISP-Adapter verwenden, für den es unter der Bestellnummer 0410203 für vier Euro bei eMedia eine Leerplatine und bei Segor in Berlin einen Bausatz gibt. Beide sind mit der ISP-Schnittstelle des ADA-IO-Moduls pinkompatibel und arbeiten prima mit PonyProg zusammen. Bastler mit einer Abneigung gegen SMD-Bauteile erhalten zum Beispiel bei P. Rohlfing Elektronik ([**www.e-lab.de/programmer/isp.html [1]**](https://www.e-lab.de/programmer/isp.html)) kompatible, fertig aufgebaute ISP-Programmieradapter.

Zur Firmware-Programmierung muss die ADA-IO-Platine mit Strom versorgt werden, es genügt hierfür die 5-V-Versorgung, wenn Sie nicht gleich das IFP-Interface dazu heranziehen möchten. Der ISP-Programmieradapter wird mit Steckverbinder PL4 (ISP) der Platine über ein 10-poliges Flachbandkabel 1:1 verbunden. Stellen Sie nach dem Start von PonyProg unter „Setup“ zunächst die richtige Schnittstelle ein. Unter Win2000/XP wählt man „Parallel“ und „AVR ISP I/O“. Mit einem Klick auf „Probe“ kann die richtige Funktion des Druckerports und des ISP-Adapters überprüft werden. Stellen Sie nach Drücken von OK unter „Device“ den Typ AVR micro/ATmega32 ein.

![[modulbaukasten-291034-02.jpeg]]

*Mit etwas Fingerspitzengefühl gelingt das Auflöten der SMD-Portbausteine. Unser IO8-32-Prototyp war noch selbst geätzt, die im Handel erhältliche Platine besitzt natürlich Lötstopplack und Bestückungsdruck.*

Neu ausgelieferte Atmel-Controller werden ab Werk mit einigen gesetzten Konfigurations-Bits ausgeliefert, die vor der ersten Inbetriebnahme unbedingt gelöscht werden müssen, sonst funktioniert die Firmware nicht einwandfrei. Wählen Sie hierfür in PonyProg den Menüpunkt „Security and Configuration Bits...“ (Ctrl-S); von den Konfigurations-Bits sollte lediglich SPIEN, BODEN und BODLEVEL (Brown-Out-Detection, Unterspannungs-Reset) angekreuzt sein. Dann „Write“ klicken, um die Bits auch im ATmega32 zu setzen. Firmware („Program Flash“, P) und die EEPROM-Daten („Data“, D) müssen getrennt geladen und programmiert werden (dauert nur einige Sekunden), dabei Endung .HEX (eigentliche ADA-IO-Firmware) beziehungsweise .EEP (zugehörige EEPROM-Defaults, -Skalierungen, -Offsets) beachten. ADA-IO sollte jetzt die Arbeit aufnehmen, erkennbar an kurzem Blinken der Leuchtdiode - einmal lang und gegebenenfalls einige Male kurz, wenn über die Adress-Jumper JP3 bis JP5 eine andere Adresse als 0 eingestellt ist (z. B. siebenmal kurz blinken = Modul-Adresse 7).

## Zinnwüste

Ist der Aufbau so weit fortgeschritten, können Sie sich an das Bestücken der IO8-32-Steckkarte machen. Diese enthält für die vier I/O-Ports (0 bis 3) vier I2C-Portbausteine vom Typ PCA9554A mit jeweils acht I/O-Pins. Die ICs belegen die I2C-Adressen $38 bis $3B beziehungsweise $3C bis $3F bei gestecktem I2C-Adress-Jumper JP1 - was zu beachten ist, wenn mögliche Konflikte durch extern angeschlossene I2C-Sensorchips drohen. Durch die Adresswahl mit JP1 sind zwei IO8-32-Karten in einem ADA-IO-Modul einsetzbar, eine davon erhält auf JP1 dann eine Steckbrücke und somit die Ports 4 bis 7 zugewiesen.

![[modulbaukasten-291034-03.jpeg]]

*Wenig Überraschendes bietet die ADA-IO-Schaltung - sie besteht eigentlich nur aus ATmega32-Mikrocontroller und einem Bussystem, an dem drei seiner Ports fast komplett anliegen. Der Übersichtlichkeit halber sind nur zwei der fünf parallel geschalteten Slots eingezeichnet.*

Die I/O-Karte enthält neben den rein digitalen Portbausteinen Vorteiler und RC-Filter für den internen A/D-Wandler des ATmega32. Die acht A/D-Leitungen liegen über den Vorteiler an PL5 an, bei der angegebenen Dimensionierung 300 kΩ/100 kΩ ergibt sich ein Eingangsspannungsbereich von 0 bis 10 V bei einem Eingangswiderstand von 400 kΩ. Trotz der beschränkten Genauigkeit des internen Wandlers sollten Sie für die Spannungsteiler einprozentige Metallfilmwiderstände einsetzen.

Bei einer zweiten gleichzeitig eingesetzten IO8-32-Karte dürfen die Spannungsteiler-Widerstände R4 bis R19, die Kondensatoren C2 bis C9 und Pfostenleiste PL5 nicht bestückt werden, Port A des ATmega32 ist ja nur einmal vorhanden. Über PL7 ist der I2C-Bus zugänglich, die Pinbelegung des sechspoligen Steckverbinders ist mit den I2C-Modulen der Firma E-Lab ([**www.e-lab.de [2]**](https://www.e-lab.de/)) kompatibel. Wegen der höheren Geschwindigkeit wurde die 400-kHz-Variante des I2C-Protokolls gewählt, ältere Bausteine sind unter Umständen nicht dazu kompatibel.

Die PCA9554A (wichtig ist das A im Suffix, sonst kommen sich die Port-Adressen mit anderen, zukünftig verwendeten Bausteinen ins Gehege) sind in einem noch gut von Hand lötbaren SO16-Gehäuse im Handel, das einen Beinchen-Abstand (Pitch) von 1,27 mm aufweist; für diese wurde auch die Platine (einseitig) layoutet. Die anderen Varianten sind Uhrmachern und Nanotechnikern vorbehalten. Als SMD-Bauteile gehören sie auf die Lötseite der Platine - Selberätzer wissen das zu schätzen, sparen sie sich doch die 64 Bohrlöcher für DIL-Gehäuse. Vorteil gegenüber dem älteren PCF8574 ist der wesentlich höhere mögliche Ausgangsstrom (der PCA9554A kann kleine Reed-Relais oder LEDs direkt ansteuern), die für jede I/O-Leitung frei bestimmbare Datenrichtung und die einzeln über Register ansprechbaren Portbits - obwohl letzteres natürlich nur den Entwickler der Firmware freut(e), damit haben Sie als Anwender wenig zu tun.

![[modulbaukasten-291034-04.jpeg]]

*Achten Sie bei der Bestückung auf die Ausrichtung der VG-Federleisten und natürlich auf die Polung der Elektrolytkondensatoren und Halbleiter.*

Trauen Sie sich ruhig, die PCA9554A selbst aufzulöten - Sie benötigen nur eine bleistiftfeine Lötspitze und 0,5-mm-Lötzinn (das bleifreie eignet sich zum Handlöten nicht so gut). Etwas (will meinen: eine hauchdünne Spur) Flussmittel aus der Spritze (z. B. Edsyn FL-22) auf die Lötinseln auftragen, ein Eck-Lötpad verzinnen und den Baustein damit fixieren. Dann den gegenüberliegenden Pin anlöten, dabei den Baustein leicht auf die Platine drücken und schließlich den Rest verlöten - ein, zwei Millimeter des 0,5er-Lötdrahtes sollten pro Pin reichen.

## Plug & Play

Für einen ersten Test verbinden Sie das IFP mit der seriellen Schnittstelle Ihres Rechners und starten dort ein Terminal-Programm (HyperTerm oder Ähnliches reicht völlig), das Sie auf die Parameter 38400/8n1 und den verwendeten COM-Port einstellen. Alternativ ginge auch der USB-Port, doch dafür müssen Sie wie im letzten Teil beschrieben erst einmal die FTDI-Treiber installieren. Verbinden Sie den IFP/PL2 mit ADA-IO/PL3, IFP/PL1 mit ADA-IO/PL1 über Flachbandkabel (Polung/Richtung beachten) und stecken Sie die Jumper IFP/JP1 sowie ADA-IO/JP1 und JP2, die Adress-Einsteller JP3 bis JP5 bleiben offen. Nach dem Einschalten wird LED1 auf der ADA-IO-Platine aufblinken. Auf ein paar getippte „Returns“ sollte ADA-IO mit „#0:255=0 [OK]“ antworten, auf „0:IDN?“ mit Name und Anschrift, sprich „#0:254=1.28 [ADA by CM/c't 04/2007; Modules: IO]“. Die Versionsnummer ist natürlich nur beispielhaft und spiegelt den Stand zum Zeitpunkt des Artikelschreibens wider. Die (vorerst) komplette Befehlsübersicht finden Sie unten.

„0:VAL 0?“, die Abfrage vom ATmega32-internen A/D-Kanal 0, sollte demzufolge „#0:0=0“ hervorbringen, da an IO8-32/PL3 ja keine Spannung anliegt. Wenn Sie Pin 1 vom Analog-Port IO8-32/PL3 mit +5 V verbinden (die liegen beispielsweise nebenan bei IO8-32/PL1 Pin 10 an), ergibt sich als Antwort im Idealfall „#0:0=5.00“ - in der Praxis wird der Wert wegen der angesprochenen Bauteile- und Referenz-Toleranzen knapp danebenliegen. Auf diese Weise können Sie auch die restlichen Analog-Eingänge (mit „VAL 1?“ bis „VAL 7?“, die Adress-„0“ darf nach der ersten Abfrage weggelassen werden) prüfen. Der Eingangsspannungsbereich reicht hier von 0 V bis 10,23 V, etwas darüber oder darunter schadet nicht, wird aber nicht mehr erfasst.

![[modulbaukasten-291034-05.jpeg]]

*Die IO8-32-Steckkarte enthält vier I2C-Portbausteine und Vorteiler/Filter für den internen A/D-Wandler des ATmega32.*

![[modulbaukasten-291034-06.jpeg]]

*15 Drahtbrücken sind der Preis für ein einseitiges Layout (auch als PDF unter dem Soft-Link). Die SMD-Portbausteine gehören natürlich auf die Lötseite, Pin 1 ist jeweils gekennzeichnet.*

Zur Prüfung der digitalen I/O-Ports lesen Sie diese zunächst mit „PIO 0?“ bis „PIO 3?“ (bzw. bis 7, wenn eine zweite IO8-32-Platine steckt) aus, was stets 255 ergeben sollte (offene Eingänge zieht der PCA9554A sachte nach „high“). Um einen I/O-Port als Ausgang zu konfigurieren, müssen Sie zunächst die EEPROM-Schreibsperre mit „WEN=1!“ temporär außer Gefecht setzen; die Aufhebung gilt nur einen Schreibbefehl lang. ADA-IO antwortet mit der Statusmeldung „#0:255=16 [OK]“, das gesetzte Bit in der Antwort „16“ (binär 0001 0000) bedeutet „EEPROM-Schreiben erlaubt“ (siehe Tabelle). Als nächster Befehl kann dann etwa ein „DIR 0=255!“ folgen, was Port 0 komplett als Ausgang konfiguriert (gesetzte Einsen sind Ausgänge). Die Datenrichtung jedes einzelnen I/O-Ports wird im EEPROM hinterlegt und bleibt deshalb beim Ausschalten erhalten. Wenn Sie dann mit „PIO 0=85!“ ein hübsches Bitmuster in den Port schreiben, müssen an den Portleitungen (in diesem Fall IO8-32/PL1 Pin 1 bis 8, Masse = Pin 9) abwechselnd 0 und etwa 5 V zu messen sein.

Bis zum nächsten Teil haben Sie genug Zeit, sich mit der c't-Lab-Syntax vertraut zu machen, die LabView-Demo-Programme (Beschreibung der LabView-Entwicklungsumgebung siehe c't 11/07, S. 182) auszuprobieren und ein wenig mit den IO8-32-Ports zu spielen. Bitte beachten Sie, dass die Ports maximal 20 mA liefern können; dauerhafte Kurzschlüsse an mehreren Pins sind zu vermeiden.

*[**Forum zu c't-Lab [3]**](https://ctlabforum.thoralt.de/phpbb/index.php)*

***[**Soft-Link [4]**](https://www.heise.de/select/ct/2007/11/softlinks/212)***

## Stückliste ADA-IO

### Halbleiter

| ID   | Type           |
| ---- | -------------- |
| U1   | ATmega32-1 DIL |
| U2   | 6N137          |
| LED1 | LED 3 mm rot   |

### Kondensatoren

| ID      | Type           |
| ------- | -------------- |
| C1      | 4µ7 25V Ta.    |
| C2...C5 | 100n ker. RM 5 |
| C6, C7  | 22p RM2,5      |

### Widerstände

| ID     | Type             |
| ------ | ---------------- |
| R1, R2 | 220R             |
| R3     | 0R (Drahtbrücke) |
| R4, R5 | 2k2              |
| R6     | 4k7              |
| R7     | 470R             |
| R8     | 2k7              |

### Sonstiges

| ID        | Type                            |
| --------- | ------------------------------- |
| JP1...JP5 | Jumper 2-pol.                   |
| L1        | 10µH axial RM10                 |
| PL1       | Pfostenleiste 14-pol.           |
| PL2...6   | Pfostenleiste 10-pol.           |
| XTAL1     | uartz 16 MHz HC49U              |
| CONN1...5 | VG-Federleisten 64-pol. a/b Platine ADA-IO |

## Stückliste IO8-32

### Halbleiter

| ID      | Type            |
| ------- | --------------- |
| U1...U4 | PCA9554AD SO16  |

### Kondensatoren

| ID       | Type            |
| -------- | --------------- |
| C1, C2   | 100n ker. RM 5  |
| C3...C10 | 2n2 100V RM5    |

### Widerstände

| ID        | Type     |
| --------- | -------- |
| R1        | 10k      |
| R2...R9   | 300k 1%  |
| R10, R11  | 4k7      |
| R12...R19 | 100k 1%  |

### Sonstiges

| ID      | Type                                               |
| ------- | -------------------------------------------------- |
| JP1     | Jumper 2-pol.                                      |
| PL1...6 | Pfostenleiste 10-pol.                              |
| CONN1   | VG-Messerleisten 64-pol. a/b 90° Platine IO8-32 (eMedia, Segor) |

## **Mit den Modulen sprechen**

Die c't-Lab-Syntax folgt einem einfachen Schema: Eine *Abfrage*, zum Beispiel eines Messwerts, besteht aus Modul-Adresse (per Jumper auf dem jeweiligen Modul eingestellt), Doppelpunkt als Trennzeichen, einem Mnemonic und einem Argument, gefolgt von einem Fragezeichen und einem Zeilenrücklauf (CR oder CR/LF) als Abschluss. Die Mnemonics sind einfach zu merkende 3-Buchstaben-Kürzel, von denen einige für alle c't-Lab-Module gelten. Beispiel: Der Befehl „0:VAL 5?“ veranlasst das ADA-IO-Modul mit der eingestellten Adresse 0, den aktuellen Messwert vom Messwert-Kanal 5 (hier der interne A/D-Eingang 5) herauszurücken, sie antwortet mit „#0:0=1.23“, wenn an ihrem Eingang 1,23 Volt anliegen. Die gelieferten Werte müssen nicht unbedingt einer Messung entspringen, sie können ebensogut ein Parameter sein, den man irgendwann dem Modul übermittelt, aber in der Zwischenzeit wieder vergessen hat.

ADA-IO Befehlssyntax

Cmd

Argument

SubCh

Beispiel-Befehl

Beispiel-Antwort

Beschreibung

VAL

0...27

0...27

0:VAL20=5.0!, VAL10?, 0:10?

#0:20=5.0000,#0:2=0.0

allg. Form, Messwert-Spannung in Volt,
VAL kann auch weggelassen werden

VAL

0...7

0...7

VAL 0?, 0:7?

#0:2=0.0

Atmega-interner ADC 10 Bit, unipolar 0...10V

VAL

10...17

10...17

10?

#0:10=10.002

AD16-8, 16-Bit-Wandler, 8 Kanäle, -10...+10V

VAL

20...27

20...27

0:VAL20=5.0!,24=1.2345!

#0:20=5.0000

Ausgabewerte DA12-8 oder DA16-8, 8 Kanäle

OFS1

0...27

100...127

0:OFS20=37!, OFS10?

#0:255=0 [OK],

#0:110=302

Wandler-Offset in Raw-Digits (Integer-Wert)

SCL1

0...27

200...227

0:SCL20=1.0!, SCL10?

#0:255=0 [OK],

#0:210=1.00013

Skalierung Messwert/DA-Wert

RAW2

0...17

50...67

RAW 17?

#0:67=31548

Rohdaten direkt vom Wandler ohne
Skalierung und Offset

PIO

0...7

30...37

0:PIO 0?30?,0:31=255!

#0:30=123

IO-Port 0...7 Datenbyte

DIR1

0...7

40...47

DIR 0=255!,40=255!

#0:40=255

IO-Port 0...7 Richtung, Bit auf 1 = Ausgang

ALL2

0...4

95...99

ALL 4?,0:95?

(Liste mit Messwerten)

0=VAL 0...7 (AD10), 1=VAL 10...17 (AD16),
3=VAL 30...37 (Ports), 4=Alle verfügbaren

STR2

-

255

STR?

#0:255=0 [OK]

Status-Request

WEN

-

250

WEN=1!,0:250=1!

#0:255=16 [OK]

EEPROM-Write-Enable-Bit, vor dem
Beschreiben von OFS, SCL, DIR auf 1 setzen,
wird danach wieder automatisch auf 0 gesetzt

IDN2

-

254

*:IDN?

(Adresse und Versionsnr.)

Modul-Identifikation

Ein *Befehl*, etwa zum Einstellen eines Ports oder eines D/A-Wandler-Kanals, beginnt wiederum mit der Modul-Adresse, einem Doppelpunkt und dem Mnemonic, der einzustellende Wert folgt dann aber hinter einem „=“-Zeichen. Abgeschlossen wird ein Befehl mit einem Ausrufezeichen: „0:VAL 21=5.0!“ stellt den D/A-Kanal 1 auf einer ADA-IO-Steckkarte (21 - 20 = 1) auf eine Ausgangsspannung von 5 Volt ein. Fließkommazahlen werden ganz international mit einem Punkt („Floating Point“) geschrieben.

Von den Modulen gelieferte Messwerte oder Parameter beginnen immer mit einem „#“, es folgt die Adresse der Karte (0 bis 7) und nach dem Doppelpunkt die Messkanal-Nummer. Die Mnemonics setzt der Controller intern auf eine eindeutige Subkanal-Nummer („SubCh“ in der Tabelle) um, die er bei den Abfrage-Ergebnissen mitliefert. Die Kartenantwort auf die Skalierungsabfrage von Messkanal 10 lautet also beispielsweise „#0:210=1.000“ und nicht „#0:SCL=1.000“.

Anstelle der Mnemonics dürfen bei Befehlen und Abfragen auch einfach die Subkanal-Nummern verwendet werden: Statt mit „0:SCL 10=0.99975!“ kann man die Skalierung des A/D-Wandlers auf Messkanal 10 auch mit „0:210=0.99975!“ kalibrieren - das erleichtert die PC-seitige Programmierung, denn Zahlen lassen sich bequemer handeln als Strings. Die Zuordnung von Mnemonic zu Sub-Adresse variiert von Modul zu Modul leicht, orientiert sich aber an einem übergeordneten Schema.

Die vorangestellte Kartenadresse muss nur beim ersten Befehl an eine Karte angegeben werden, ansonsten bezieht sie alle weiteren Befehle (ohne Adresse und Doppelpunkt) auf sich - damit lässt sich das Übertragungsvolumen deutlich reduzieren. Bei der Adress-Angabe ist übrigens auch die Wildcard-„*“ zulässig: Auf „*:IDN?“ identifizieren sich alle angeschlossenen Karten mit ihrem Namen und ihrer Versionsnummer, bei „*.VAL 1?“ rücken sie gemeinsam die Messwerte vom Eingangskanal 1 (so vorhanden) heraus.

ADA-IO-Latenzen

Subkanal

Belegung

bis Antwort

bis Reaktion

0...7

A/D 10 bit intern

1 ms

-

10...17

A/D 16 Bit, Steckkarte

2...9 ms

-

20...27

D/A 12 oder 16 Bit, Steckk.

1 ms

2...9 ms

30...37

I/O-Ports, Steckkarte

400...700 µs

400...800 µs

Die Offset- und Skalierungswerte (OFS, SCL) zur Kalibrierung der Analogkanäle sowie die Datenrichtungsregister (DIR) für die I/O-Ports bleiben dauerhaft im EEPROM-Bereich des Controllers gespeichert. Zum Schutz gegen versehentliches Überschreiben seitens ei-nes „wildgewordenen“ PC-Programms muss man das Beschreiben mit „WEN=1!“ (oder „0:250=1!“) explizit erlauben, die Freigabe gilt nur für den nächstfolgenden Schreibbefehl und wird danach automatisch zurückgenommen.

Für die Skalierungen sind prinzipiell beliebige Fließkomma-Werte zulässig, per Default ist hier „1.0“ als Kalibrier-Wert eingestellt. Eine Einheiten-Umrechnung kann man mit entsprechenden Skalierungen gleich vom Messmodul erledigen lassen. Die Offset-Werte gleichen Ungenauigkeiten der Wandler im Bereich des Nullpunkts aus; hier ist ein Integer-Wert (Wandler-Rohdaten vor der Skalierung) zu übergeben. Den Offset-Fehler eines A/D-Wandler-Kanals bei einer Eingangsspannung von 0 V kann man mit RAW bestimmen, diese Funktion liefert die Wandler-Rohdaten vor der Skalierung. Der ausgegebene Wert (VAL 0...17) folgt der Formel VAL=(RAW+OFS) · SCL bei den A/D-Kanälen beziehungsweise RAW=(VAL · SCL)+OFS bei den D/A-Kanälen (20...27).

Jeder Befehl hat eine Statusmeldung zur Folge, die sich auch explizit mit „STR?“ abrufen lässt. Der ausgegebene Statuswert schlüsselt sich wie folgt auf:

STR-Status-Bits

7

6

5

4

3

2

1

0

-

-

-

-

-

F

F

F

BSY

SRQ

OVL

WEN

F=Fehlernummer, 0=OK

BSY = Busy-Flag, Modul ist mit Messung beschäftigt
SRQ = Service-Request-Flag, Bedienelement betätigt
OVL = Overload-Flag, Messbereichsüberschreitung
WEN = Write Enable, Schreibfreigabe für EEPROM

Schreibschutz-, Syntax- oder Parameter-Fehler werden immer auch in Klartext (in eckigen Klammern hinter dem Status-/Fehler-Nummer) ausgegeben, also etwa „#0:255=6 [LOCKED]“ beim Schreibversuch auf den EEPROM-Bereich. Um den Flash-Programmspeicher nicht übermäßig zu strapazieren, ist die Parameter- und Syntax-Prüfung relativ lasch ausgefallen; beispielsweise kann man unsinnige Werte bei den Parametern angeben. Der ADA-IO-Controller begrenzt dann den Wertebereich entsprechend den Möglichkeiten der I/O-Hardware.

Messaufgaben benötigen unter Umständen eine gewisse Zeit, bis das Ergebnis vorliegt. Nebenstehende Tabelle gibt eine Übersicht über die zu erwartenden Latenzzeiten, gerechnet vom Ende des letzten Befehls-Bytes bis zum Beginn der Antwort beziehungsweise zur Reaktion an den D/A-Ausgängen oder Port-Bits.

RSPEAK_STOP
(cm)
RSPEAK_START

**URL dieses Artikels:**

`https://www.heise.de/ratgeber/Modulbaukasten-291034.html`

**Links in diesem Artikel:**

1. https://www.e-lab.de/programmer/isp.html
2. https://www.e-lab.de/
3. https://ctlabforum.thoralt.de/phpbb/index.php
4. https://www.heise.de/select/ct/2007/11/softlinks/212

*Copyright © 2007 Heise Medien*
