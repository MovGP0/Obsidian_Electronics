---
title: IFP (Interface and Power-Supply)
---
# Leitungsschau

Source: [https://www.heise.de/ratgeber/Leitungsschau-291014.html](https://www.heise.de/ratgeber/Leitungsschau-291014.html)
Print view: [https://www.heise.de/ratgeber/Leitungsschau-291014.html?seite=all&view=print](https://www.heise.de/ratgeber/Leitungsschau-291014.html?seite=all&view=print)
Author: Carsten Meyer
Series references: c't 10/07, S. 130

> [!note] Segor
> Passende Segor-Seite: [Baugruppe c't-Lab/IFP & Netzwerk](https://www.segor.de/INFO/ct-lab/baugruppe-ifp.shtml)

> Einst boten sich Drucker-Port und ISA-Slot als bevorzugte Pforten für unaufwendige PC-Hardware-Anbindungen an - proprietär natürlich, weil auf bestimmte Plattformen beschränkt, und inzwischen alles andere als zeitgemäß. Unser c't-Lab öffnet gleich drei Tore zum PC: RS-232, USB und Ethernet. Den COM-Port kennt selbst Windows Vista noch - womit sich der Installations- und Programmieraufwand auf ein Minimum beschränkt.

Eigentlich ist auf der ersten c't-Lab-Platine IFP sogar noch eine vierte „Schnittstelle“ vorhanden - nämlich die zum Lichtnetz (darum heißt sie auch IFP wie Interface/Power Supply). Die Stromversorgung auf der Interface-Karte beliefert nicht nur die eigene Elektronik, sie gibt auch noch genügend Saft für ein weiteres Messmodul ab. In praxi werden Sie die Interface-Platine bei einem Vollausbau mehrmals benötigen, und zwar ausschließlich wegen der darauf enthaltenen Netzteil-Elektronik; die Interface-Logik wird nur einmal gebraucht. Damit sparten wir uns ein separates Netzteil-Layout, was nebenbei gesagt auch dem Platinenpreis entgegenkommt.

Das Thema Stromversorgung wollen wir etwas prominenter als oft üblich und deshalb gleich eingangs behandeln. Jedes Messmodul benötigt wegen der Potentialtrennung ein eigenes Netzteil, wobei die Anforderungen an saubere Versorgungsspannungen recht hochgesteckt sind: Die analogen Schaltungsteile verlangen nach symmetrischen ±15V-Spannungen, der Mikrocontroller auf jeder Karte will zusätzlich TTL-übliche +5 V sehen, ebenso wie das möglicherweise angeschlossene Bedien-Panel mit seinem alphanumerischen LCD.

![[leitungsschau-291014-01.jpeg]]

*Ein c't-Lab-Minimalsystem besteht nur aus IFP und einem Messmodul, hier die ADA-I/O-Modulkarte. Weitere Messmodule werden einfach an das jeweils letzte in der Kette angehängt.*

Analog- und Digitalteil werden aus je einem Print-Transformator versorgt, die Stabilisierung erfolgt mit den seit Jahrzehnten bewährten Dreibein-Spannungsreglern. Besonderes Augenmerk haben wir auf eine einwandfreie Masse-Leitungsführung in Sternform gelegt, weshalb die Leiterbahnen auf den ersten Blick etwas verworren zu einem gemeinsamen Massepunkt führen. Doch schon ein einziger an der falschen Stelle platzierter Siebelko oder eine allzu sorglos verlegte Leiterbahn zum Gleichrichter würde zu einem erheblichen „Brumm“ auf der Versorgungsspannung führen und jegliche Bemühungen der Spannungsregler zunichte machen.

Aus dem gleichen Grund wurden die Masseleitungen des Analog- und des Digitalteils strikt nach Aufgabenbereichen getrennt. Wenn sich eine arbeitsreiche Routine des Mikrocontrollers als millivoltgroßer Spannungsabfall auf einer analogen Masseleitung manifestieren würde, wäre es aus mit der angedachten Genauigkeit: Bei ±10 Volt „Vollausschlag“ steht das letztwertige Bit eines 16-Bit-Wandlers für eine Spannung von nur rund 300 µV. Fehler- und Brummspannungen durch ungeschickt verlegte Massen summieren sich dagegen schnell auf einige 10 mV. Analog- und Digitalmasse sind nur an einem Punkt miteinander verbunden, nämlich in Form einer Drahtbrücke auf dem jeweiligen Messmodul. Das verhindert, dass der Betriebsstrom des Controllers oder des Displays über eine analoge Masseleitung fließt und dort Schaden anrichtet, sprich das Messergebnis verfälscht. Wir empfehlen aus genannten Gründen dringend die Verwendung der IFP-Platine; Spezialisten in anorganischer Chemie können sich auch zutrauen, das einseitige Layout (als PDF unter dem Soft-Link) selbst in Kupfer zu ätzen.

## Reinheitsgebot

Der verwendete Print-Trafo für die 5-V-Versorgung besitzt zwei Sekundärwicklungen, eine davon versorgt exklusiv die Interface-Elektronik. Hier arbeiten sogar zwei Spannungsregler am Reinheitsgebot, da der Ethernet-Baustein XPort mit 3,3 V betrieben werden muss. Die Versorgungsspannungen liegen an einem 14-poligen Pfostenverbinder an, jeweils zwei nebeneinanderliegende Pins sind miteinander verbunden. Als vierte Spannung führt der Steckverbinder die ungeregelte Eingangsspannung des 5-V-Reglers von rund 13 V, die bei einigen c't-Lab-Modulen zum Schalten von Relais benötigt wird. Bezugspotential ist hier wiederum die Digital-Masse (DGnd).

![[leitungsschau-291014-02.jpeg]]

*Topologie des c't-Labs: Das IFP ist Bindeglied zwischen Rechner und Mess-Modulen. Befehle und Messergebnisse werden als serielle Datenpakete in der Kette weitergereicht, bis sie wieder zum IFP-Board und von dort zum Rechner gelangen. Der Übersichtlichkeit halber nicht eingezeichnet sind die Stromversorgungen der einzelnen Module, im Prinzip auch IFP-Karten, nur ohne Interface-Elektronik.*

Ein besonders platzsparender Aufbau ergibt sich mit den etwas teureren Flachtransformatoren. Der oben abgebildete Prototyp wurde noch mit Trafos von Era bestückt; nachdem der Hersteller aber vor einigen Wochen von einer US-Firma aufgekauft wurde und seine Lieferungen für den deutschen Markt eingestellt hat, musste das Layout in letzter Minute auf die Printtrafos von Block umgestellt werden. Leider weisen die Block-Modelle ein anderes Pinout auf, sie sind nicht mit den Era-Trafos austauschbar. Die bei eMedia lieferbare IFP-Platine ist für die Block-Trafos gedacht, bitte achten Sie beim Bauteile-Einkauf auf die richtige Ausführung. Statt der Flachtrafos lassen sich bei großzügigeren Platzverhältnissen auch normale Print-Trafos einsetzen, auf der Platine sind Bohrlöcher für Transformatoren mit EI38-Kern vorhanden (siehe Stückliste).

## Bits im Gänsemarsch

Die drei Schnittstellen der IFP-Platine dürfen nicht gleichzeitig benutzt werden, weil es sonst zu Kollisionen im Datenverkehr kommt. Ferner können Sie natürlich auch die Schnittstelle(n) weglassen, die Sie gar nicht benötigen. Wer nicht vorhat, das System fernwirkend weit abseits vom Rechner aufzustellen, kann getrost auf den Ethernet-Anschluss und die recht kostspielige Beschaffung des zugehörigen XPort-Bausteins verzichten.

![[leitungsschau-291014-03.jpeg]]

*Mit FTDIs „MProg“ kann man einen neu angeschlossenen USB-auf-Seriell-Konverter „personalisieren“, falls man ihn über die FTDI-DLL und nicht den virtuellen COM-Port ansprechen will.*

Ausgesprochen simpel gibt sich die serielle RS-232-Schnittstelle, da sie auf sämtliche Handshake-Leitungen (die bei diesem historischen Standard schon immer mehr verwirrten denn nützten) verzichtet; folglich sind an der 9-poligen D-Sub-Buchse (ein Weibchen, da „Endgerät“) nur drei Pins beschaltet. Ein MAX232, ebenfalls ein Elektronik-Klassiker, wandelt die bipolaren RS-232-Pegel auf TTL-Niveau und zurück. Ein einfaches 9-poliges D-Sub-Kabel (ohne Nullmodem-Kreuzung!) verbindet das c't-Lab dann mit dem Rechner.

![[leitungsschau-291014-04.jpeg]]

*Auf der Konfigurationsseite des XPort erreicht man die Einstellungen des internen seriellen Schnittstelle. „Packing“: mit $OD, $OA als „Match“ kann die Übertragungsrate deutlich erhöhen.*

Die Beschreibung des USB-Interface würde ohne hochintegrierte Chips wie dem FT232 von FTDI die nächsten vier Druckseiten füllen, so aber kommen wir mit wenigen Absätzen aus. Der FT232 beinhaltet Bustreiber/Receiver, Taktgenerator, eine State Machine (Ablaufsteuerung), ein kleines Flash-ROM mit Seriennummer und Kennung sowie allerlei USB-typischen Kleinkram. Der Baustein kennt zwei Betriebsarten, je nachdem, welchen Treiber der Rechner beim Erkennen des USB-Devices vorfindet: als „Virtual COM Port“ (VCP) oder „DLL Direct“ (D2XX). Bei ersterer meldet er sich einfach als zusätzliche serielle Schnittstelle, was für den Anwender besonders bequem ist, bei letzterer kann er nur über eine spezielle Runtime-Bibliothek von FTDI angesprochen werden. Das kann bei dediziert geschriebenen Anwendungen sinnvoll sein, um einen (von ggf. mehreren am USB vorhandenen) FT232 gezielt mit seiner Seriennummer anzusprechen und nicht über die von Windows willkürlich vergebene COM-Port-Aufzählung.

![[leitungsschau-291014-05.jpeg]]

*Lantronix' „Device Installer“ sucht auch nach „jungfräulichen“ XPort-Devices und teilt ihnen eine IP-Adresse zu, außerdem dient es zum Hochladen der eigenen Webseiten und Java-Applets*

Üblicherweise wird man die problemlose VCP-Betriebsart wählen, die funktioniert auch bei Apple-Rechnern (als „Network Port“ ab Mac OS 10.4), Linux und allen Windows-Versionen ab 98 einschließlich Vista und CE. Die virtuelle serielle Schnittstelle verhält sich dann tatsächlich wie eine „echte“, einschließlich der Baudraten-, Paritäts- und Stoppbit-Einstellung. Konfigurationsprogramme, Treiber und detaillierte Installationshinweise finden Sie auf der Hersteller-Website [1]. Einziger Nachteil des Chips ist seine zierliche Bauform (SMD-Gehäuse). Es ist zwar auch im fortgeschrittenen Alter möglich, den Baustein im SSOP-Gehäuse aufzulöten, wie der Musteraufbau des Autors beweist, vorsichtshalber wird eMedia die IFP-Leerplatine aber auch mit bereits aufgelötetem FT232 anbieten.

## Paketweise

Der XPort-Baustein von Lantronix, im Schaltbild etwas unscheinbar links zu finden, bildet den mit Abstand intelligentesten Teil des IFP-Moduls, wenn nicht des ganzen Systems. In einer etwas überdimensionierten Twisted-Pair-Buchse hat der Hersteller einen kompletten Web-Server untergebracht. Der einige hundert KByte große Flash-Bereich lässt sich mittels des Lantronix-Dienstprogramms „DeviceInstaller“ mit eigenen Webseiten und Java-Applets befüllen. Die Java-Applets haben dabei über eine Lantronix-Library und eine reservierte IP-Portadresse direkten Zugriff auf die serielle Schnittstelle des Bausteins, die in unserem Fall das Bindeglied zu den c't-Lab-Modulen darstellt. Einfacher geht es mit einem Lantronix-Treiber, der auf dem PC eine virtuelle serielle Schnittstelle installiert. Die spielt ähnlich wie beim USB-Chip auch mit Programmen zusammen, die eigentlich nur auf einen COM-Port zugreifen können. Auf der Lantronix-Website finden sich Treiber, Java-Beispiele sowie Bedienungsanleitungen und Installationshinweise.

![[leitungsschau-291014-06.jpeg]]

*Die blau unterlegten Kästen kennzeichnen die Interface-Optionen; eine davon ist mindestens notwendig. Die Jumper JP1 bis JP3 dienen zum expliziten Abschalten der Schnittstellen, üblicherweise können alle drei gesteckt werden. V3 und V4 benötigen einen kleinen Kühlkörper.*

Alle drei Interface-Bausteine werden wie angesprochen aus einem getrennten Netzteil-Zweig versorgt. Das wäre beim XPort eigentlich nicht nötig gewesen, beinhaltet die TP-Ethernet-Anbindung doch implizit eine Potentialtrennung, aber so ersparen wir uns Jumper-Wälder und unübersichtliche Bestückungsoptionen. Die gibt es nur beim Weglassen der einen oder anderen Interface-Variante, im Schaltbild sind die zu den drei Interfaces zugehörigen Bauteile deshalb farblich hervorgehoben.
Alle drei Interfaces erhalten die Daten des letzten Moduls (das ja auch die ihm überreichten Messwerte der Kette weiterleitet) über einen schnellen Optokoppler zugespielt. Die Dateneingänge jedes Messmoduls besitzen ebenfalls Optokoppler, womit sich die im Überblick-Artikel bereits gelobte vollständige Potentialtrennung ergibt. Ein grundsätzliches Problem dieser kollisionsfreien Ring-Topologie sei hier nicht verschwiegen: Durch das wiederholte Empfangen und Senden eines Messwerte-Telegramms entstehen gewisse Latenzen. Bei 38400 Bit/s, der Default-Übertragungsrate innerhalb des c't-Labs, benötigt das Messergebnis „#0:17=1.23456“ (plus CR/LF als Zeilenabschluss) etwa 4 ms von Messmodul zu Messmodul. Fünf Module in Reihe ergeben also eine Latenz von mindestens 20 ms, gegebenenfalls plus der eigentlichen Messzeit für den A/D-Wandler. Letztere beträgt zwischen etwa 10 ms (16-Bit-Wandler gemultiplext auf 8 Kanäle) und 160 ms (24-Bit-Wandler im DIV-Modul). Messwert-Telegramme werden übrigens innerhalb der Module mit hoher Priorität behandelt, das heißt gleich nach vollständigem Eintreffen weitergereicht, auch wenn die eigene Messung noch nicht ganz abgeschlossen ist.

## Verodert

Die drei Interfaces können empfangsseitig einzeln per Jumper (oder Kippschalter) zu- und abgeschaltet werden, senden aber immer gleichzeitig. Die drei Empfangsleitungen sind in der Schaltung über Dioden „verodert“, es ist deshalb auch zulässig, alle Schnittstellen eingeschaltet zu lassen, wenn sichergestellt ist, dass an die nicht benutzten (von PC-Seite) auch nichts gesendet wird. Zumindest der XPort sollte aber abschaltbar sein, und zwar aus folgendem Grund: Mit den Fortgeschrittenen-Tools von Lantronix ist es möglich, Programme auch direkt vom XPort-Prozessor abarbeiten zu lassen. Wenn der dann ab und an selbst nach Messwerten fragt, entsteht eine gewisse Uneinigkeit auf der gemeinsamen seriellen Leitung. Die ist als Stromschleife ausgeführt, ähnlich wie bei der MIDI-Schnittstelle elektronischer Musikinstrumente bedeutet ein fließender Strom von 5 mA Low-Pegel, kein Strom High-Pegel. Der Strom knipst auf der empfangenden Seite die Leuchtdiode im Optokoppler an und aus.

Sende- und Empfangsstromschleife liegen gemeinsam an einem 10-poligen Pfostenverbinder an; hier beginnt und endet der Weg der Daten durch die Messmodule. Von den zehn Pins sind übrigens nur vier belegt, die Bauform haben wir mehr aus Bequemlichkeit und der Nachbausicherheit halber gewählt. Durch die fest vorgegebene Kontaktreihenfolge gibt es keine Verwechslungsgefahr bei Datenrichtung und Signalpolarität. Es ist lediglich nötig, auf dem letzten Messmodul in der Kette zwei Jumper zu setzen, damit die Daten auch wieder den Weg zurück zum Interface finden.

Das Konzept ermöglicht es auf einfache Weise, Module aus dem gemeinsamen Rack auszulagern oder das Modul-Rack zu erweitern - es ist ja nur eine vierpolige Verbindungsleitung zum jeweils letzen Modul (oder zu den letzten Modulen) einer Kette nötig, abgesehen von der Stromversorgung. Da die Module auch diesbezüglich autark arbeiten, ergibt sich ein besonders übersichtlicher Aufbau.

## Erdnah

Achten Sie vor allem auf eine VDE-gerechte Ausführung auf Lichtnetz-Seite. Das Konzept erfordert leider den Umgang mit 230V-Netzspannung, und der sollte nicht allzu sorglos geschehen. Aufgespleißte Drahtenden oder lockere Verbindungen können tödliche Folgen haben - nicht nur für die Elektronik! Die IFP-Platine ist so ausgelegt, dass zwischen Netz- und Niederspannungsseite immer eine „lichte Weite“ von deutlich mehr als fünf Millimeter gewahrt bleibt; daran sollten Sie sich auch bei der Verdrahtung halten. Auf 230V-Seite ist Litze mit 0,75 mm2 zu verwenden. Für den Anschluss an die Steckdose eignen sich besonders die kombinierten Kaltgeräte-Buchsen mit eingebautem Netzfilter, Netzsicherung und Schalter. Selbst bei einem voll ausgebauten System ist eine 500-mA-Sicherung ausreichend. Der Wert an sich ist nicht kritisch, da die verwendeten Trafos und Spannungsregler kurzschlussfest sind.

![[leitungsschau-291014-07.jpeg]]

*Bei der Bestückung der IFP-Platine werden die niedrigen Bauteile zuerst eingelötet (Widerstände, vier Drahtbrücken). U5 gehört als SMD-Bauteil natürlich auf die Lötseite (neben USB-Buchse PL4), Pin 1 weist in Richtung A6. Achten sie auch auf die richtige Polarität der Elkos (quadratisches Lötauge = Pluspol)*

Natürlich ist ein Metallgehäuse oder 19"-Rack mit dem grüngelben Schutzleiter zu verbinden. Die Platine ist so ausgelegt, dass RS-232- und USB-Buchse sowie die TP-Abschirmung über die Frontplatte ebenfalls mit Gehäuse-Masse verbunden sind, der Rest des c't-Labs ist wegen der gewünschten Potentialtrennung „schwebend“.

Der Test der fertig aufgebauten Platine kann auch außerhalb des c't-Lab-Systems geschehen, wenn man die nötige Vorsicht beim Anschluss der Netzspannung walten lässt - ein Trenntrafo ist hier sehr von Vorteil. Gegen unbeabsichtigte Berührung der lichtnetzseitigen Leiterbahnen und Lötpunkte hilft eine dicke Lage Heißkleber oder besser Epoxydharz. Messen Sie zunächst die Spannung an C14 oder am Eingang von Spannungsregler U8, sie sollte 5 V betragen. Am Ausgang von U8 sollten 3,3 V für den XPort-Baustein zu messen sein. Setzen Sie an Position R1 eine Drahtbrücke ein, diese bildet für die folgenden Messungen das Masse-Bezugspotential: An Pin 5 und 6 von PL1 sollten +15 V anliegen, an Pin 9 und 10 -15 V. Pin 13 und 14 führen +5 V, Pin 1 und 2 rund 15 V (unstabilisiert, Werte von 11 bis 17 V sind zulässig). Sind die Messungen zur Zufriedenheit ausgefallen, verbinden Sie Pin 1 und 7 sowie Pin 3 und 9 von PL2 mittels zweier kurzer Kabelenden. Die serielle Schnittstelle sollte nun ein „Echo“ der eingehenden Zeichen ausführen (mit Terminal-Programm überprüfen).

Anschließend müssen Sie die Drahtbrücke an Position R1 wieder entfernen, sonst gibt es später eine unschöne Masseschleife. Damit auch Ethernet- und USB-Anschluss vom Rechner erkannt werden, sind die Treiber von FTDI und Lantronix bereitzuhalten. Das USB-Device sollte sich unter Windows nach erfolgreicher Installation als „USB Serial Port (COMx)“ melden, die LED des XPort-Bausteins beim Anschluss eines netzverbundenen Patch-Kabels lebhaft blinken (grün bei 10-MBit-Netzen, orange bei 100 MBit). Wenn auch das funktioniert, haben Sie die erste Hürde zum c't-Lab bereits geschafft. Die nächste folgt in c't 11/07 mit der Vorstellung des ADA-Boards und der LabView-Entwicklungsumgebung.

Literatur

[1] FTDI Hersteller-Website, [**ftdichip.com [1]**](https://ftdichip.com/) , [**ftdichip.com/utilities/ [2]**](https://ftdichip.com/utilities/)

[2] Lantronix Hersteller-Website, [**www.lantronix.com/products/xport/ [3]**](https://www.lantronix.com/products/xport/)

[3] DLPdesign Hersteller-Website, [**www.dlpdesign.com/usb/usb232.shtml [4]**](https://www.dlpdesign.com/usb/usb232.shtml)

[**Forum zu c't-Lab [5]**](https://ctlabforum.thoralt.de/phpbb/index.php)

***[**Soft-Link [6]**](https://www.heise.de/select/ct/2007/10/softlinks/130)***

## Stückliste

### Halbleiter

| ID         | Type                |
| ---------- | ------------------- |
| U1         | 7815                |
| U2         | 7915                |
| U3, U4     | 7805                |
| U5         | FT232RL (FTDI)      |
| U6         | 6N137               |
| U8         | LF33                |
| U9         | MAX232              |
| U10        | XPort-01 (Lantronix) |
| D1, D3, D4 | 1N4148              |
| D2         | 1N4004              |
| RB1..RB3   | B80C1500            |

### Widerstände

| ID | Type |
| -- | ---- |
| R1 | 0R (nur zum Test bestücken) |
| R2 | 220R |
| R3 | 220R |
| R4 | 2k7  |
| R5 | 2k2  |
| R7 | 4k7  |
| R8 | 10k  |

### Kondensatoren

| ID                      | Type          |
| ----------------------- | ------------- |
| C1..C8, C14, C19, C22..C24 | 100n ker. RMS |
| C9..C12                 | 470µ 35V      |
| C13, C15                | 47µ 6V3       |
| C16..C18, C21           | 11µ 50V       |
| C20                     | 4µ7 35V       |

### Sonstiges

| ID      | Type                              |
| ------- | --------------------------------- |
| L1      | 10µH axial                        |
| JP1..JP3 | Jumper (Steckbrücken)            |
| PL1     | Pfosten 14-pol.                   |
| PL2     | Pfosten 10-pol.                   |
| PL3     | Schraubklemme RM 7,5              |
| PL4     | USB-B Printbuchse                 |
| RS1     | D-Sub 9-pol. F                    |
| TR1     | Flachtrafo 2 x 15 V, 6 VA (Block) |
| TR2     | Flachtrafo 2 x 9 V, 6 VA (Block)  |
|         | Kühlschellen TO-220 für U3, U4    |
|         | Platine c't-Lab IFP (eMedia)      |

RSPEAK_STOP
(cm)
RSPEAK_START

**URL dieses Artikels:**

`https://www.heise.de/-291014`

**Links in diesem Artikel:**

1. https://ftdichip.com/
2. https://ftdichip.com/utilities/
3. https://www.lantronix.com/products/xport/
4. https://www.dlpdesign.com/usb/usb232.shtml
5. https://ctlabforum.thoralt.de/phpbb/index.php
6. https://www.heise.de/select/ct/2007/10/softlinks/130

*Copyright © 2007 Heise Medien*
