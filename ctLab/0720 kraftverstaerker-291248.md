---
title: DCP (Hochleistungs-Netzteil)
---
# Kraftverstärker

Source: [https://www.heise.de/ratgeber/Kraftverstaerker-291248.html](https://www.heise.de/ratgeber/Kraftverstaerker-291248.html)
Print view: [https://www.heise.de/ratgeber/Kraftverstaerker-291248.html?seite=all&view=print](https://www.heise.de/ratgeber/Kraftverstaerker-291248.html?seite=all&view=print)
Author: Carsten Meyer
Series references: c't 20/07, S. 196

> Wenn es etwas mehr sein darf: Zum Testen von Leistungselektronik, Endstufen, dicken Akkus und DC-Motoren mit dem c't-Lab reicht der Ausgangsstrom des DCG-Moduls manchmal nicht aus. Dann empfehlen wir die Leistungsstufe DCP als Ergänzung, die locker zwei Ampere macht und mit einer pfiffigen Lüftersteuerung auch in engen Modul-Racks nicht zu heiß wird.

Seit CMOS-Bausteine die stromhungrigen TTL-Serien ersetzt haben, besteht im Labor kaum noch Bedarf für Hochleistungs-Netzteile der 20-kg-Klasse. Trotzdem ist die 1-A-Grenze des in der letzten c't vorgestellten DCG-Moduls schnell erreicht, wenn man etwa die Ladekurve eines RC-Akkus aufzeichnen will oder eine Audio-Endstufe repariert werden soll. Zwar kann man zwei DCG-Module für symmetrische Spannungsversorgungen oder hohe Spannungen problemlos in Reihe schalten, was die eingebaute Tracking-Funktion der Firmware schon vermuten lässt; bei einer Parallelschaltung können sich aber die Regeleigenschaften verschlechtern, weil im Grenzbereich immer ein Modul in den Strombegrenzungsbetrieb wechselt. Da ist die Leistungsstufe DCP die billigere und elegantere Alternative - sozusagen das Netzteil für das Netzteil.

Noch kurz ein Wort zur Tracking-Funktion, die im letzten Beitrag nur am Rande erwähnt wurde: Diese ist ausschließlich der manuellen Bedienung über das PM8-Panel vorbehalten. Bei eingeschaltetem Tracking (Kanal ungleich „Off“) sendet das Modul die hier manuell eingestellten Strom- und Spannungswerte über den OptoBus als regulären c't-Lab-Befehl an das nächste Gerät in der Kette (natürlich nur in Richtung des letzten Moduls) weiter, in der Hoffnung, dass ein zweites DCG-Modul sie aufschnappt. Man kann das Tracking am Panel aktivieren, indem man zweimal kurz hintereinander den Taster „Spannung“ (der obere der Panel-Taster) drückt und dann die Adresse des zu steuernden Moduls mit dem Drehgeber auswählt. Die Einstellung bleibt auch nach dem Ausschalten erhalten.

## Dicke Drähte

Die DCP-Erweiterung, für die Sie bei eMedia und Segor (siehe Anzeigenteil) eine separate Platine bekommen, übernimmt die komplette Versorgung des DCG-Moduls einschließlich der Hilfsspannungen für den Controller und die Steuerungselektronik (5 V, ±15 V) an PL1; deshalb ist keine zusätzliche Modul-Stromversorgung (IFP, PS3-2) nötig. Zusätzlich benötigen Sie noch einen dicken Transformator mit mindestens dem gewünschten Ausgangsstrom, also beispielsweise 2 x 15 V/2,5 A für ein 30 V/2 A-DCG. Statt des Trafos lassen sich auch ein oder zwei (evt. vorhandene) Festspannungs-Schaltnetzteile mit 12 oder 15 V Ausgangsspannung verwenden, die die Eingangsspannung für die DCP-Stufe liefern. Das spart nicht nur Gewicht, sondern auch einige Bauteile auf der DCP-Platine. Bei Gleichspannungsspeisung ist aber zu beachten, dass die Regelung etwa 4 V der „Rohspannung“ schluckt.

Die DCP-Funktionsweise ist im Vergleich zur DCG-Schaltung atemberaubend schnell erklärt: OpAmps und Controller benötigen natürlich ihre üblichen Versorgungsspannungen, hier gewonnen aus zwei Print-Trafos mittels der sattsam bekannten Dreibein-Spannungsregler-Schaltung. Die Pinbelegung des Hilfsspannungs-Versorgungssteckers PL1 ist übrigens bei allen c't-Lab-Modulen identisch. Die unstabilisierte, gleichgerichtete Spannung des 9-V-Trafos dient auch zum Schalten der zwei Wicklungs-Umschaltrelais SW1 und SW2. Bei gewünschten Ausgangsspannungen über 12 V schaltet der Controller die volle Leistungstrafo-Spannung von 30 V auf den Gleichrichter, darunter genügt die 15-V-Mittelanzapfung. Dadurch verhindert er, dass die Verlustleistung in der Regelstufe Q12 allzu sehr ansteigt (bei den sich ergebenden knapp 40 V Gleichspannung im Kurzschlussfall bei 2 A Laststrom wären das rund 80 Watt, so aber „nur“ 40).

![[kraftverstaerker-291248-01.jpeg]]

*So wird Q12 montiert: Kontrollieren Sie vor dem Einlöten, ob Kurzschlüsse zum Kühlkörper die Isolierung - und damit ein Erfolgserlebnis - vereiteln.*

Die Relais werden übrigens leicht zeitverzögert angesteuert, sodass kein kurzschließender Lichtbogen auftreten kann; die Schaltschwelle kann per OPT-Befehl (siehe [**Syntax-Tabelle [1]**](https://www.sn7400.de/ctlab/Dokumentation/syntax.pdf)) geändert werden. Zur Sicherheit schalten beide Relais ab, wenn die Temperatur des Kühlkörpers über 100 °C gestiegen ist oder durch einen Defekt (z. B. Q12 zerstört) die Ausgangsspannung deutlich über der eingestellten Sollspannung liegt. Um all diese Dinge kümmert sich die Firmware auf der DCG-Platine. Die DCP-Platine besitzt eine Primär- und Sekundärsicherung für den Leistungstrafo, sein Primäranschluss ist auf zwei Schraubklemmen geführt („ACprim.“). „PE“ ist der Anschluss für den Schutzleiter des Netzkabels, der selbstverständlich auch sorgfältig mit dem Metallchassis eines 19"-Einbaurahmens zu verbinden ist.

Die Leistungsstufe Q12 darf auf der DCG-Platine natürlich nicht bestückt werden, wenn die DCP-Platine zum Einsatz kommt. Hier ackert ein dicker BD249, der einen Kühlkörper mit Zwangslüftung spendiert bekam. Die ist bei maximalen Verlustleistungen um 40 W auch dringend geboten - trotz der „gestuften“ Eingangsspannung. Die Lüftersteuerung übernimmt ein LM75, den PC-Experten als Prozessor-Temperaturfühler kennen. Er enthält ein über I2C-Bus auslesbares Thermometer mit Thermostat-Funktion. Bei Temperaturen über 50 °C geht der OS-Ausgang auf high, und der Lüfter rauscht los. Kleines Gimmick am Rande: Mit den Befehlen „2:VAL 233?“ oder „2:233?“ kann man die aktuelle Kühlkörpertemperatur erfragen und mit „2:OPT 20=60!“ die Thermostat-Schaltschwelle einstellen (hier mit Moduladresse 2 auf 60 °C, siehe auch Syntax-Tabelle).

## Feinmechanik

Die DCP-Platine erfordert weniger Löt- aus feinmechanisches Geschick; wie immer sind die niedrigen Teile (Widerstände, Dioden, SMD-Bauteile) zuerst einzulöten. Bei der Bestückung sollten Sie zunächst Trafo TR1 weglassen, er versperrt sonst den Zugang zur Befestigungsschraube von U3. Q1 und U3 kommen erst dann auf die Platine, wenn der Kühlkörper, ein Standardmodell von Fischer (SK68-75 oder -94), montiert ist. Kontrollieren Sie die Bestückung rund um den LM75-Temperaturfühler (SMD-Bauteile) lieber dreimal, denn die Bauteile verschwinden gleich darunter.

Verwendet man den 75 Millimeter langen SK68, passt ein kleiner 40-mm-Lüfter noch mit auf die Platine, Befestigungslöcher für kleine Blechwinkel sind vorhanden. Alternativ lässt sich die 94 Millimeter lange Ausführung verwenden, wenn der Lüfter (auch zwei parallel geschaltete würden passen) von oben auf den Kühlkörper geschraubt wird; die Bauhöhe der Platine wächst dann aber auf rund 50 Millimeter an, sodass sie nicht mehr in die c't-Lab-üblichen 10TE-Abteile eines 19"-Baugruppenträgers passt. Der Pluspol des Lüfter-Steckverbinders weist zum Platinenrand; wenn Ihr Lüfter bereits mit einem Steckverbinder geliefert wird, passen Sie die Buchse entsprechend ein, der Platinenaufdruck ist hier nicht maßgeblich.

Der Kühlkörper wird mit je drei M3-Unterlegscheiben auf jeder der vier durchgesteckten M3x16-Schrauben so montiert, dass ein Abstand von 1,5 Millimeter zur Platine entsteht; die Seite mit dem M2,5-Befestigungskanal muss zu den Trafos zeigen. Die Unterlegscheiben lassen Platz für den SMD-Thermostatbaustein, der mit einem Klecks Wärmeleitpaste thermischen Kontakt zum Kühlkörper erhält. Verwenden Sie hier keinesfalls die silberhaltige Paste, die zu Kurzschlüssen führen kann, sondern die weiße. Sitzt der Kühlkörper, können Sie U3 mit einer M2,5x8-Schraube und Federring montieren und einlöten; der 5-V-Regler benötigt keine Isolierung. Q1 muss dagegen isoliert montiert werden, am besten auf die klassische Art mit Wärmeleitpaste, Glimmerscheibe, Isoliernippel, M3x10-Schraube und Federring. Die heute so beliebten Silikon-Pads sind zwar einfacher zu verarbeiten, leiten die Wärme aber nicht so gut ab. Kontrollieren Sie vor dem Verlöten, ob die Transistor-Kühlfahne (Kollektoranschluss) auch tatsächlich vom Kühlkörper isoliert ist. Metallspäne drücken sich gern einmal durch die Glimmerscheibe, und dann ist die Sicherung mit vollem Einsatz gefordert.

Im Prinzip möglich (und thermisch vorteilhaft) wäre auch der umgekehrte Weg: Q12 ohne Isolierung (nur mit etwas Wärmeleitpaste) anschrauben, dafür U3 isolieren. Da der Kühlkörper dann aber die volle ungeregelte Spannung mit ordentlich Dampf aus den Sieb-Elko-Kesseln führt und zu den SMD-Bauteilen nur wenige Zehntelmillimeter Abstand bleiben, können wir diese Alternative nicht so recht empfehlen. Die Gleichrichter der Serie KBU60X sind mit einem Befestigungsloch versehen; schrauben Sie RB3 deshalb auch am Kühlkörper fest (vor dem Verlöten!).

## Elektronik statt Gewicht

Wie oben erwähnt, lassen sich statt des Trafos auch zwei Schaltnetzteil-Module verwenden, der Gleichrichter kann dann durch zwei kurze Drahtbrücken ersetzt werden (jeweils vom Plus- und Minuspol zum danebenliegenden Wechselspannungs-Pin). Das verhindert einen unnötigen Spannungsabfall an den Gleichrichter-Dioden (zwar nur 1,4 V, aber immerhin 3W Verlust bei Vollast). Beide Schaltnetzteile werden in Reihe geschaltet, der Minuspol gehört dann an AC0, der Pluspol an AC2 und die „Mittelanzapfung“ an AC1. Ebenso kann ein Schaltnetzteil-Modul mit symmetrischem Ausgang die Versorgung übernehmen, wenn beide Spannungszweige gleich hoch belastbar sind (das ist bei PC-Schaltnetzteilen leider nicht der Fall).

Für die Hochstrom-Kabelverbindung zwischen DCG und DCP sind die Molex-Steckverbinder MiniFit Jr. prädestiniert, die man von neuzeitlichen PC-Motherboards kennt. Wir verwenden die 8-polige Ausführung mit stehenden Buchsen (180°). Die Stecker werden mit einzelnen Crimp-Kontakten geliefert, ohne Crimp-Zange kann man die Litzen auch ersatzweise an die Kontakte löten. Die Adern der Kontakte 1 bis 4 sollten einen Querschnitt von 0,75 mm2 aufweisen. Ausgemusterte PC-Netzteile sind übrigens eine gute Quelle für verschiedenfarbige Litzen mit ausreichendem Kaliber. Auch der Anschluss des Transformators an PL3 (Primärseite) und PL4 (Sekundärseite mit Mittelanzapfung) verlangt diesen Querschnitt. Eines unserer Muster arbeitet mit einem EL 100/15 von Block, der mit 100 VA gute Reserven hat und im Fachhandel um die 25 Euro kostet.

![[kraftverstaerker-291248-02.jpeg]]

*Der I2C-Baustein LM75 zeigt dem DCG-Controller, ob die Temperatur des Kühlkörpers noch im grünen Bereich liegt. Der Rest der Schaltung ist wenig aufregend - vom dicken Leistungstransistor Q12 einmal abgesehen.*

Die DCP-Platine kann zunächst ohne Verbindung zum DCG getestet werden: Trafo an PL3 (primär 230 V) und PL4 (sekundär 2 x 15 V, Mittelanzapfung an AC1) anschließen und 230 V (möglichst über Trenntrafo) an PL2 zuführen. Die Platine bettet man am besten auf einem Stück Schaumstoff (aber nicht den leitenden Antistatik-Schaum!). Vorsicht ist vor allem im Bereich der Sicherung FS1 geboten, die führt lebensgefährliche Netzspannung. Der Lüfter sollte loslaufen, da der Thermostat U4 nicht initialisiert wurde.

Prüfen Sie zunächst die DCP-Hilfsspannungserzeugung: Minuspol des Messgerätes an die Kühlfahne von U1, an Pin 13/14 von PL1 sollten +5 V und an Pin 5/6 +15 V zu messen sein. Die negative Ausgangsspannung an Pin 9/10 wird ohne Last deutlich unter -15 V liegen, das ist bei den 7915-Spannungsreglern (leider) normal. Nicht normal wäre es dagegen, wenn beim Einschalten eines der Relais mit vernehmbarem Klick angezogen hat - dann stimmt mit den Treibertransistoren Q3 oder Q4 etwas nicht. Auf jeden Fall sollten Sie an den äußeren beiden Klemmen von PL4 nun eine Wechselspannung von deutlich über 30 V messen können. Ist sie nahe null, ist wahrscheinlich eine Wicklung des Trafos verpolt; immerhin sollten dann zwischen dem mittleren und den äußeren PL4-Pins 17 V vorhanden sein. Ist dagegen beim Einschalten die Primärsicherung FS1 abgeraucht, haben Sie versehentlich eine der Sekundärwicklungen kurzgeschlossen.

## Letzte Hand

Zur „richtigen“ Inbetriebnahme müssen Sie die Schaltungen wieder vom Netz trennen. Warten Sie einige Sekunden, bevor Sie DCP/PL1 mit DCG/PL1 verbinden (14-poliges Flachbandkabel - Stecker auch richtig gepolt?). Kontrollieren Sie noch einmal, ob die Pins der beiden MiniFit-Stecker der Hochstrom-Verbindung eins zu eins verbunden sind. Ist das zweifelsfrei der Fall, dürfen Sie auch die MiniFits einstöpseln. Nach dem Einschalten sollte der Lüfter kurz anlaufen, aber gleich darauf verstummen. Eine Sekunde später wird Relais SW2 anziehen; wenn die Sicherung FS2 intakt geblieben ist (wenn nicht: Gleichrichter defekt/falsch gepolt, C15/16 falsch gepolt, Kurzschluss Q12 zum Kühlkörper?) sollten an DCP/PL7 nun rund 20 V zu messen sein und an den Ausgangsklemmen der DCG-Platine die Default-Spannung von 5 V anliegen. Für den nun anstehenden Abgleich verwenden Sie am besten das LabVIEW-Programm [**DCG-Abgleich.vi [2]**](https://www.sn7400.de/ctlab/LabVIEW_VIs/DCG-Abgleich.vi). Folgen Sie der im VI-Panel verewigten Kurzanleitung. Zum Sichern der kalibrierten Parameter dient das Hilfsprogramm ParamBackupRestore.vi, das auch bei Firmware-Updates gute Dienste leistet - wenn man nämlich beim Flashen des Controllers versehentlich die Kalibrierwerte überschrieben hat.

![[kraftverstaerker-291248-03.jpeg]]

*In der Regel ist zur Zwangskühlung ein 40-mm-Lüfter ausreichend, der mit zwei Winkeln so auf der Platine montiert wird, dass er in Richtung Kühlkörper bläst.*

Ganz wichtig: **Bevor** Sie die Schaltungen, etwa zum Ein- oder Ausbau in das Gehäuse, an PL6 trennen oder wieder verbinden, **müssen** Sie die Sieb-Elkos mit einem kurz an PL7 gehaltenen Lastwiderstand (z. B. 10 Ohm, 5 W) entladen, sonst kann die Thermostat-Schaltung oder gar der Prozessor Schaden nehmen. Da PL7 sonst nicht benutzt wird, können Sie hier auch einen Widerstand von 2,2 kOhm/2 W (stehend) fest einlöten, wenn Sie hoch und heilig versprechen, vor dem Trennen von PL6 und natürlich nach Abschalten der Netzspannung mindestens 20 Sekunden zu warten.

Die vorliegenden Schaltungen können für höhere Ausgangsspannungen oder -ströme recht leicht modifiziert werden, wenn man die Optionsparameter der Firmware entsprechend den neuen Gegebenheiten anpasst (etwa kleinere Shunts auf der DCG-Platine, wie im DCG-Beitrag beschrieben). Mehr als 3 A oder 60 W Verlustleistung sollten Sie Q12 keinesfalls zumuten - aber das wissen Sie ja ohnehin, wenn Sie sich eine Modifikation zutrauen.

Abschließend noch eine wichtige Korrektur zur DCG-Schaltung: Die in c't 19/07 abgedruckte Dimensionierung weist zwar ein äußerst schnelles Stromregelverhalten auf, produziert aber beim Übergang vom Strom- in den Spannungsregel-Betrieb unschöne Spikes, vor allem, wenn keinerlei kapazitive Last vorhanden ist. Bitte beachten Sie dazu unbedingt die „Ergänzungen und Berichtigungen”.

![[kraftverstaerker-291248-04.jpeg]]

*Für den Printtrafo TR1 können zwei Modelle verwendet werden - mit EI38- und EI42-Kern. Die EI38-Version darf nur eine Sekundärwicklung aufweisen, während bei EI42-Trafos auch solche mit zwei 9-V-Wicklungen passen. Die bei manchen Fabrikaten vorhandenen Befestigungslaschen sind gegebenenfalls abzuschneiden.*

## Stückliste

### Halbleiter

| ID     | Type                                   |
| ------ | -------------------------------------- |
| U1     | 7815                                   |
| U2     | 7915                                   |
| U3     | 7805                                   |
| U4     | LM75 SO8                               |
| D1..3  | 1N4148                                 |
| RB1, 2 | Gleichrichter rund, B80C1500           |
| RB3    | Gleichrichter PBU605 o. Ä., min. 80V/4A |
| Q12    | BD249C                                 |
| Q2..4  | BC337B                                 |

### Passive Bauteile

| ID        | Type         |
| --------- | ------------ |
| R1        | 10R          |
| R2..4     | 2k7 SMD0805  |
| R5..8     | 2k7          |
| C1        | 4n7 1kV RM5  |
| C2..10, 13 | 100n ker. RM5 |
| C14, 15   | 10n ker. RM5 |
| C11       | 100n SMD1206 |
| C12       | entfällt     |
| C5, 6     | 470µ 35V     |
| C9        | 1000µ 16V    |
| C16, 17   | 2200µ 40V    |

### Sonstiges

| ID     | Type                                   |
| ------ | -------------------------------------- |
| FS1    | Sicherung 630mAT m. Halter RM20        |
| FS2    | Sicherung 3,15AT m. Halter RM20        |
| PL1    | Wannen-Pfostenverbinder 14pol.         |
| PL2, 4 | Schraubklemme 3pol. RM5                |
| PL3, 7 | Schraubklemme 2pol. RM5                |
| PL5    | Platinen-Steckverbinder 2pol. (Lüfter) |
| PL6    | MiniFit Jr. Buchse 8pol. 180°          |
| SW1, 2 | Relais 16A, z.B. Finder 41.61.9.012.0  |
| TR1    | Trafo 1x9V, EI42 5VA oder EI38 4VA     |
| TR2    | Trafo 2x15V EI30 2,3VA                 |
|        | Platine DCP                            |
|        | Kühlkörper SK68-75                     |
|        | Lüfter 12V, 40 mm x 40 mm              |
|        | Schrauben, Unterlegscheiben            |

RSPEAK_STOP
(cm)
RSPEAK_START

**URL dieses Artikels:**

`https://www.heise.de/-291248`

**Links in diesem Artikel:**

1. https://www.sn7400.de/ctlab/Dokumentation/syntax.pdf
2. https://www.sn7400.de/ctlab/LabVIEW_VIs/DCG-Abgleich.vi

*Copyright © 2007 Heise Medien*
