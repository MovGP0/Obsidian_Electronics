# Schalt- und Waltstelle

Source: [https://www.heise.de/ratgeber/Schalt-und-Waltstelle-291146.html](https://www.heise.de/ratgeber/Schalt-und-Waltstelle-291146.html)
Print view: [https://www.heise.de/ratgeber/Schalt-und-Waltstelle-291146.html?seite=all&view=print](https://www.heise.de/ratgeber/Schalt-und-Waltstelle-291146.html?seite=all&view=print)
Author: Carsten Meyer
Series references: c't 16/07, S. 176

> Wieder so ein nassgrauer, freudloser Tag? Endlich Zeit, einen guten Lötkolben zur Hand zu nehmen und sich in Bastelzimmer oder Werkstatt zurückzuziehen, um die c't-Lab-Module mit Bedienpanel, Messwert-Anzeige und aufgewerteter Stromversorgung auszurüsten.

Ein ominöser Panel-Anschluss tauchte in den c't-Lab-Schaltplänen der vergangenen Ausgaben immer wieder auf - sowohl auf dem DDS-Modul wie auch auf der ADA-IO-Basisplatine. Hier kann man die in diesem Teil vorgestellte Zusatzplatine anschließen, auf der sich zwei Taster, ein Inkremental-Drehgeber und ein zweizeiliges LC-Display befinden. Damit lassen sich die c't-Lab-Module auch nahezu vollständig bedienen, ohne dass man dafür den Rechner hochfahren oder aufsuchen müsste (falls er vom Modul-Rack entfernt steht). Die Module werden dadurch zu eigenständigen, autarken Geräten. Nebenbei zeigen die Panels auch die Remote-Aktivitäten an - das hilft beim Debuggen des Steuerungsprogramms.

Weiterhin stellen wir Ihnen hier eine Doppel-Stromversorgung vor, die auf der Wunschliste vieler Leser stand: Wenn in einem c't-Lab mehrere Module optoisoliert ihren Dienst tun sollen, wäre im Prinzip für jedes Modul eine eigene teilbestückte IFP-Platine (ohne Interface-Elektronik) nötig, was das Platzangebot im Einschub-Gehäuse dramatisch verknappt und nicht gerade ökonomisch mit den Bauteile-Ressourcen umgeht - der für die Interface-Logik zuständige 5V-Zweig der IFP-Platine, zumindest aber eine der 9V-Wicklungen des Trafos, bleibt ungenutzt.

Unsere neue Stromversorgungsplatine PS3-2 (steht für „Power Supply, drei Spannungen, zweimal) kommt für insgesamt sechs Ausgangsspannungen dagegen mit drei Trafos aus, sie übernimmt die unabhängige und potenzialgetrennte Versorgung von zwei c't-Lab-Modulen und ist dabei nicht größer als die IFP-Platine aus dem ersten Teil (die Sie wegen der Interface-Baugruppe natürlich weiterhin benötigen). Die Intelligenz der PS3-2-Platine ist dagegen nicht der Rede wert, die sechs Spannungsregler sind bewährte Designs aus einer Zeit, zu der es c't noch gar nicht gab.

Die Funktionsbeschreibung erschöpft sich deshalb auf einen einzigen Absatz: Drei handelsübliche Print-Trafos mit sechs Wicklungen liefern das Rohmaterial, das von vier Gleichrichtern, sechs Sieb-Elkos und ebenso vielen Spannungsreglern in Form gebracht wird. Das Endergebnis liegt schließlich an zwei 14-poligen Steckverbindern an, die mit den Stromversorgungsanschlüssen der zwei c't-Lab-Module verbunden werden. Die Schaltung ist so bemessen, dass sie auch den Stromhunger der diesbezüglich nicht ganz so zurückhaltenden DDS-Platine samt TRMSC-Messmodul aus der letzten c't stillt. Die beiden Versorgungszweige der PS3-2-Platine sind völlig getrennt, sodass die Potentialtrennung unbedingt gewahrt bleibt.

## Abfall vermeiden

Gegenüber der IFP-Platine gönnten wir dem neuen Netzteil sogenannte Low-Drop-Spannungsregler (mit geringem Spannungsabfall) für die 5-V-Zweige, die bezüglich des Trafos genügsamer sind. Der klassische 7805 benötigt zur Ausregelung eine 7,5-Volt-Transformatorwicklung, wegen der einfacheren Beschaffbarkeit hatten wir seinerzeit sogar zu einem Trafo mit 9-V-Wicklungen gegriffen. Damit geht die Hälfte der vom Trafo mühsam dem Lichtnetz entrungenen Leistung in Form von Wärme verloren. Die modernen L4940-V5 begnügen sich dagegen mit einer nur geringfügig höheren Eingangsspannung, weshalb hier ein 6-V-Trafo völlig ausreicht; außerdem spart man sich so den Kühlkörper, der den Preisvorteil des 7805 ohnehin wieder zunichte macht.

Der Aufbau der Schaltung mit der vorgefertigten Platine (erhältlich wie üblich bei Segor und eMedia, siehe Anzeigenteil) sollte nur eine knappe Stunde in Anspruch nehmen. Sechs M3x8-Schrauben mit Muttern und Zahnscheiben verbinden die Spannungsregler mechanisch mit der Platine.

![[schalt-und-waltstelle-291146-01.jpeg]]

*Alternativ ist beim Doppel-Netzteil eine Bestückung mit Flachtrafos oder den billigeren normalen El-38-Printtrafos möglich, zur Not sogar gemischt. Die beim Muster noch vorhandenen Kühlkörper sind unnötig, die Kupferfläche der Platine reicht zur Kühlung aus.*

Anstelle der etwas umständlichen Drahtbrücken-Lösung zum Testen der IFP-Platine haben wir nun zwei Jumper eingesetzt, die zum Messen der Ausgangsspannungen (und nur dazu!) gesteckt werden müssen. An Pin 5 und 6 von PL1 sollten +15 V anliegen, an Pin 9 und 10 -15 V. Pin 13 und 14 führen +5 V, Pin 1 und 2 rund 10 V (unstabilisiert, Werte von 8 bis 11V sind zulässig). Als Masse-Bezugspotenzial dienen Pin 7 und 8. An PL2 müssen sich die gleichen Werte ergeben. Unbelastete Negativ-Spannungsregler liefern mitunter eine etwas höhere Spannung als angegeben (Sollwert -15V), dies ist normal. Bei Anschluss eines Lastwiderstandes (z. B. 3k3) sollte die Spannung auf ihren Nominalwert zurückgehen. Der Test der fertig aufgebauten Platine kann auch außerhalb des c't-Lab-Systems geschehen, wenn man die nötige Vorsicht beim Anschluss der Netzspannung walten lässt - ein Trenntrafo ist hier durchaus von Vorteil.

## Länger leben

Gegen unbeabsichtigte Berührung der lichtnetzseitigen Leiterbahnen und Lötpunkte schützt eine auf der Lötseite mittels 5-mm-Abstandsröllchen montierte Platte aus Kunststoff oder besser eine Platine aus FR4-Basismaterial in Euro-Größe (160 x 100 mm), erkennbar unterhalb der oben abgebildeten Muster-Platine. Die (einseitig kaschierte, ungeätzte) Kupferseite der Leerplatine gehört natürlich nach außen und sollte mit Schutzerde und der Gehäusemasse verbunden werden; damit ergibt sich auch eine gewisse Abschirmung gegen statische elektrische Felder vom Lichtnetz, die benachbarte Module stören könnten. Als Schutz für das leicht anlaufende blanke Kupfer dient eine Schicht Plastikspray. Praktischerweise schiebt man das Doppelnetzteil dann so in ein 19"-Gehäuse, dass die Träger-Schienen die Schutz- und nicht die Netzteil-Platine halten.

Mit den Flachtrafos ergibt sich eine Gesamthöhe von rund 33 Millimetern, mit normalen EI38-Printtrafos kommen 38 Millimeter zustande. Im 19"-Gehäuse sind also 8 TE (Teilungseinheiten à 5,08 mm) für das Doppelnetzteil zu reservieren, auf der zugehörigen Frontplatte kann man auch den Netzschalter des Gerätes unterbringen. Die Stromversorgungsplatine trägt eine eigene Sicherung in miniaturisierter Rund-Bauform, die dank Plastikmantel gegen zufällige Berührung geschützt ist. Das gilt nur begrenzt für den Schraubklemmen-Netzanschluss, hier liegen die Schrauben an der Luft, wenn auch versenkt.

## Human Interface

Es sei Ihnen freigestellt, ob Sie für Ihre c't-Lab-Module je ein Bedien-Panel PM8 aufbauen oder nicht - schließlich verteuert das Miniatur-Display die Schaltung einschließlich des Drehgebers und der Frontplatte schnell um 30 Euro, außerdem verlangt unsere Konstruktion die Montage in einem 19"-Rahmen. Allerdings ist die Bedieneinheit prima dazu geeignet, manuell in Messungen einzugreifen oder anzuzeigen, was der Rechner gerade mit dem Modul macht.

Der Drehgeber ist ergonomischer als eine Nur-Tasten-Bedienung, wenn man wie beim Netzteil oder beim Funktionsgenerator große Wertebereiche „durchkurbeln“ muss. Die Module liefern übrigens die manuell eingestellten Werte an den Rechner zurück, der seinerseits darauf reagieren kann und beispielsweise die Skala eines virtuellen Messwerks entsprechend der Einstellung umschaltet. Ebenso werden gedrückte (und auch losgelassene) Tasten per Status-Byte an den Rechner gemeldet - davon können Sie sich überzeugen, wenn Sie wie für den Abgleich ein Terminal-Programm starten.

![[schalt-und-waltstelle-291146-02.jpeg]]

*Vier M3-Gewindebolzen samt Zahnscheiben sorgen für den nötigen Abstand von 10,5 Millimetern zwischen PM8-Panel-Platine und 19"-Teilfrontplatine.*

Als Anzeige haben wir ein kompaktes Display mit zweimal acht Zeichen vorgesehen, das ohne zusätzliches Montagematerial auskommt und von der Bauhöhe her genau zwischen Panel-Platine und Frontplatte passt; die konnte mit nur 10 TE Breite (50,8 mm) besonders kompakt gehalten werden. Den unteren Bereich der Platine haben wir für die Anschlussbuchsen freigehalten, weshalb sich die Bauteile alle um das Display und die Taster drängen.

![[schalt-und-waltstelle-291146-03.jpeg]]

*Die Schaltung des Doppel-Netzteils entspricht in etwa der Netzteilsektion der IFP-Platine - natürlich ist alles (bis auf den Trafo für die 5-V-Zweige) zweimal vorhanden.*

Ein I2C-Portbaustein mit 16 Portleitungen (PCA9555D) steuert das LCD, ebenso fragt er die zwei Taster und die Drucktast-Funktion des Inkremental-Drehgebers ab. Die LEDs 2 und 3 hängen dagegen gemeinsam an der Controller-Portleitung PD3, geschaltet als eine Art „Wechselblinker“: Je nach logischem Zustand leuchtet entweder die eine oder die andere. Für das in der letzten c't vorgestellte DDS-Modul entfällt LED3; LED2 mahnt hier zur Vorsicht, wenn der Offset-Ausgang aktiviert ist. Mittig zwischen den Tastern zeigt die Activity-LED1 an, dass das Modul gültige Befehle empfangen hat; diese LED ist mit LED1 auf der Modul-Platine parallel geschaltet. Die Impuls-Ausgänge des Drehgebers gelangen nach sachter Entprellung durch zwei RC-Glieder direkt zu den Controller-Portbits PA0 und PA1. Die Interpretation der Dreh-Impulse übernimmt zuverlässig die Firmware, sodass sich ein sehr überschaubarer Hardware-Aufwand ergibt.

## Bilateral

Trotzdem sollten Sie bei der Bestückung der Platine einige Dinge beachten, damit der mechanische Aufbau passt - für viele Elektroniker ein rotes Tuch. Der 10-polige Wannenstecker zur Flachkabel-Verbindung mit dem Panel-Anschluss des Moduls gehört natürlich auf die Lötseite montiert, mit Pin 1 in Richtung Platinenmitte, und von der Bestückungsseite verlötet (deshalb auch das zweiseitige Layout). Ebenso wird das Kontrast-Einstellpoti auf der Platinen-Rückseite eingesetzt; kürzen Sie dessen Beinchen so, dass kein Kurzschluss mit dem Rahmen des vorderseitigen Displays entsteht. Das beleuchtete Mini-Display mit 2 x 8 Zeichen ist bündig mit der Platine einzusetzen. Als Taster kommen die bekannten runden Digitast-Teile zum Einsatz, die unter der Bezeichnung D6 oder DT6 im Handel sind. Die abgeflachten Seiten der Tastenkörper müssen nach links zeigen, also zur Platinenmitte. Lassen Sie sich nicht davon beirren, dass auf der Position des Drehgebers SW4 eine weitere Taste vorgesehen ist; bei einem der geplanten c't-Lab-Module wird der Drehgeber nicht benötigt.

![[schalt-und-waltstelle-291146-04.jpeg]]

*Die PS3-2-Platine kann alternativ mit Print- oder Flachtrafos bestückt werden.*

Apropos: Auch bei gleicher Bauform gibt es bei den am Markt verfügbaren Dreh-Encodern elektrische Unterschiede zu beachten. Manche haben keinen Druck-Kontakt, den unser Bedienkonzept aber explizit verlangt, andere nur 12 statt 24 oder 30 Rastungen. 12er-Drehgeber liefern zwischen den Rastungen einen zusätzlichen Impuls und sind somit unbrauchbar. Je nach Ausführung kann es erforderlich sein, die Achse um einige Millimeter zu kürzen; eine Metall- oder Puck-Säge sollte Ihrem Werkzeug-Fundus also nicht fehlen.

## Der richtige Dreh

Die grundsätzliche Bedienung ist bei allen c't-Lab-Modulen konsistent: Mit den Tastern wählt man den Parameter an, mit dem Drehknopf ändert man ihn. Ein schwarzer Cursor-Pfeil zeigt zur Verdeutlichung auf den einzustellenden Wert. Mit einem Druck auf den Drehknopf wechselt man in die Feineinstellung, der Cursor-Pfeil ist nun gerastert dargestellt („ausgegraut“). Wie grob oder wie fein die Werte-Änderung jeweils ausfällt, hängt von der Art des Parameters ab; zum Beispiel benötigt die Auswahl der Kurvenform beim DDS-Modul natürlich keine Feineinstellung, während sich Ausgangsspannung und -strom beim kommenden DCG-Netzteilmodul in Millivolt- oder Mikroampere-Schritten justieren lassen. Eine in der Firmware implementierte Dreh-„Beschleunigung“ wie bei der PC-Maus erleichtert dabei größere Änderungen.

![[schalt-und-waltstelle-291146-05.jpeg]]

*Der „große“ SMD-Baustein PCA9555D ist problemlos von Hand zu löten, wie das Trimmpoti und die Wannen-Steckleiste gehört er auf die Lötseite der Platine.*

![[schalt-und-waltstelle-291146-06.jpeg]]

*Das LCD des PM8-Panels verwendet die Signale des Quasi-Industriestandards 44780 von Hitachi, allerdings aufgeteilt auf zwei Pfostenleisten. Der Modul-Prozessor steuert es über den I2C-Bus an.*

Beim DDS-Funktionsgenerator erfolgt die Frequenzeinstellung im Grob-Modus in Terz-Schritten (1000, 1250, 1600, 2000, 2500 Hz usw.), im Feineinstell-Modus hertzweise. Bei der Pegel-Einstellung wählt man grob die dB-Schritte, fein die Millivolts - beim Zurückschalten in den Grobmodus, der übrigens nach knapp zwei Sekunden automatisch erfolgt, aktualisiert sich selbstverständlich auch die dB-Anzeige. Die DDS-Firmware erkennt das Panel automatisch, zeigt beim Einschalten eine Begrüßungsmeldung und geht dann ins Frequenz-Menü. Die Übersicht der Menü-Einträge sparen wir uns hier, zumal sie sich bei Firmware-Updates ändern kann. Sie ist aber in der c't-Lab-Syntax-Übersicht enthalten; einen noch erreichbaren Projektüberblick finden Sie bei heise unter [**c't-Lab - Bausteine zum Messen, Steuern und Regeln [1]**](https://www.heise.de/hintergrund/c-t-Lab-Bausteine-zum-Messen-Steuern-und-Regeln-284113.html). Derzeit noch in später Planungsphase befindet sich die Panel-Implementation für die ADA-IO-Firmware; hier wird es zumindest möglich sein, die A/D-Kanäle als skalierte Messwerte und die Portbits als Binärmuster darzustellen.

[**Forum zu c't-Lab [2]**](https://ctlabforum.thoralt.de/phpbb/index.php)

## Stückliste PM8

### Halbleiter

| ID      | Type                                      |
| ------- | ----------------------------------------- |
| U1      | PCA9555D                                  |
| U2      | LCD alphanum. DIPS082(Electronic Assembly) |
| LED1, 2 | LED 3 mm rot                              |
| LED3    | LED 3 mm grün                             |

### Passive Bauteile

| ID          | Type                                                       |
| ----------- | ---------------------------------------------------------- |
| C2          | 100n ker. RMS                                              |
| C3, 4       | 22n ker. RMS                                               |
| C1          | 4µ7 25V Ta.                                                |
| R1, 2, 6, 7 | 10k                                                        |
| R3, 5, 9    | 560R                                                       |
| R8, 12      | 47k                                                        |
| R10, 11     | 2k7                                                        |
| R4          | 2k2 Trimmer, RM5 (Piher)                                   |
| SW4         | Dreh-Encoder mit Tastfunktion, z. B. Panasonic EVQWTA-S20-15B |
| SW1, 2      | Digitast D6/DT6 Taster grau                                |
| SW3         | Digitast D6/DT6 Taster rot                                 |
| PL1         | Wannen-Pfostensteckverb. 10-pol.                           |
|             | Platine PM8                                                |

## Stückliste PS3-2

### Halbleiter

| ID      | Type                                                         |
| ------- | ------------------------------------------------------------ |
| U3, U4  | LM2940-CT5, L4941 oder L4940-V5(7805 nur mit 2x7,5-V-Trafo) |
| U2, U6  | 7815,7815                                                    |
| U1, U5  | 7915,7915                                                    |
| RB1..4  | Gleichrichter B80C1500 rund                                  |

### Passive Bauteile

| ID                    | Type                                          |
| --------------------- | --------------------------------------------- |
| C1, 2, 4..8, 11..14, 16, 18 | 100n ker. RM5                          |
| C3, 5, 15, 17         | 470µ 35V,CP4,CP4                              |
| C9, 10                | 1000µ 16V,CP4,CP4                             |
| FS1                   | Min.-Sicherung 100mA T, rund RM5              |
| PL1, 2                | Wannen-Steckverbinder 14-pol.                 |
| PL3                   | Print-Schraubklemme RM7,5                     |
| JP1, 2                | Jumper für Test                               |
| TR1/2, 5/6            | 2 x 15 V, Print-Trafo EI38 4,5VA oder Flachtrafo 6VA |
| TR3/4                 | 2 x 6 V, Print-Trafo EI38 4,5VA oder Flachtrafo 6VA |
|                       | Platine PS3-2 (eMedia, Segor)                 |
|                       | Isolierstoff-Platte/Platine 100 x 160 mm      |
|                       | 4 Abstandsröllchen                            |
|                       | 5 mm mit Befestigungsmaterial                 |

RSPEAK_STOP
RSPEAK_START

**URL dieses Artikels:**

`https://www.heise.de/ratgeber/Schalt-und-Waltstelle-291146.html`

**Links in diesem Artikel:**

1. https://www.heise.de/hintergrund/c-t-Lab-Bausteine-zum-Messen-Steuern-und-Regeln-284113.html
2. https://ctlabforum.thoralt.de/phpbb/index.php

*Copyright © 2007 Heise Medien*
