---
title: Optoschaltstufe
---
# Schalter satt

Source: [https://www.heise.de/ratgeber/Schalter-satt-291054.html](https://www.heise.de/ratgeber/Schalter-satt-291054.html)
Print view: [https://www.heise.de/ratgeber/Schalter-satt-291054.html?view=print](https://www.heise.de/ratgeber/Schalter-satt-291054.html?view=print)
Author: Carsten Meyer, Peter Röbke-Doerr
Series references: c't 12/07, S. 194

> Aus den lichten Höhen der Mnemonics im letzten Heft geht es auf diesen beiden Seiten in die Niederungen ordinärer Schalter - die Brot-und-Butter-Technik beim Messen, Steuern und Regeln. Auf zwei Steckkarten haben wir je acht Schalter für Gleichspannung und 230-V-Netzspannung untergebracht.

Ein elektrischer Schaltkontakt ist im einfachsten Fall natürlich ein Relais, und da es sich um einen mechanischen Kontakt handelt, ist es ihm egal, ob er Gleich- oder Wechselstrom weiterleitet. In der Regel sind diese Bauteile aber groß und teuer und benötigen außerdem eine hohe Ansteuerleistung. Halbleiterbauelemente zum Schalten dagegen sind kleiner, billiger und begnügen sich mit dem Steuerstrom aus einem Optokoppler, den eine Fotodiode oder ein Fototransistor zur Verfügung stellt. Nachteilig ist, dass nicht jeder Halbleiterschalter auch 230 V Wechselspannung verträgt. Aus diesem Grund haben wir verschiedene Platinen mit unterschiedlichen Schaltstufen entwickelt.

![[schalter-satt-291054-01.jpeg]]

*Selbst ungeübte Löter dürften mit diesem Aufbau keine Probleme haben.*

Beiden gemeinsam ist die Ansteuerung über eine LED zur optischen Kontrolle des Eingangssignals und der nachfolgende Optokoppler zur galvanischen Trennung zwischen Steuerschaltung und geschalteter Last. Brummen und Stromverkopplung braucht man damit nicht zu befürchten.

![[schalter-satt-291054-02.jpeg]]

*In der Optoschaltstufe trennt ein Optokoppler Steuer- und Lastkreis. Dadurch wird die Schaltung unempfindlich gegen Brummstörungen.*

## Stückliste Optoschaltstufe

### Halbleiter

| ID         | Type       |
| ---------- | ---------- |
| LED1...LED8 | rot       |
| U1, U2     | TIL 196    |
| Q1...Q8    | BDX53 o.Ä. |
| D1...D8    | 1N4007     |

### Widerstände

| ID      | Type |
| ------- | ---- |
| R1...R8 | 10k  |
| R9...R16 | 120R |

### Sonstiges

| ID | Type |
| -- | ---- |
|    | Platine |
|    | Pfostenleiste |
|    | Flachbandkabel |
|    | Klemmleiste |
|    | vorhanden |

Bei der Optoschaltstufe reicht das Signal des Fototransistors zum Durchschalten des nachfolgenden Darlington-Transistors; dessen Typ ist unkritisch, ab den Grenzdaten 4 A/60 V kann man nehmen, was sich gerade in der Bastelkiste findet. Verwendet haben wir den BDX53, der in dieser Applikation allerdings etwas überdimensioniert ist. Nachteilig ist der etwas hohe Spannungsabfall von 1,5 V über der Schaltstrecke. Die Diode parallel zu den Ausgangskontakten dient zum Schutz des Darlingtons beim Abschalten induktiver Lasten vor den dabei auftretenden Spannungsspitzen.

![[schalter-satt-291054-03.jpeg]]

*Die Auswahl des Darlington-Transistors Q ist weitgehend unkritisch; die Grenzwerte sollten aber nicht unterhalb 4 A/60 V liegen.*

![[schalter-satt-291054-04.jpeg]]

*Die Netz-Optoschaltstufe verwendet als eigentliches Schaltelement das SSR (Solid State Relais) U1...U8 von Sharp; man kann zwie unterschiedliche Typen einsetzen.*

## Stückliste Optoschaltstufe

### Halbleiter

| ID         | Type                |
| ---------- | ------------------- |
| LED1...LED8 | rot                |
| U1...U8    | S202S02, S216S02    |

### Widerstände

| ID      | Type |
| ------- | ---- |
| R1...R8 | 100R |

### Sonstiges

| ID | Type |
| -- | ---- |
|    | Platine |
|    | Pfostenleiste |
|    | Flachbandkabel |
|    | Klemmleiste |
|    | vorhanden |

Die Netz-Optoschaltstufe ist noch einfacher aufgebaut: Der Opto-Triac bildet mit der integrierten Leuchtdiode zusammen einen Optokoppler. Dieses Bauteil von Sharp schaltet die Netzspannung direkt. Mit dem Typ S202S02 lassen sich 8 A, mit dem S216S02 16 A schalten; beide dürfen aber ungekühlt nicht mit mehr als 500 W belastet werden. Sobald die Platine bestückt ist, muss man mit einem Streifen Klebeband oder einem geeigneten Lack den 230-V-Bereich auf der Unterseite der Platine gegen unbeabsichtigte Berührung abdecken: Hier besteht nämlich im Betrieb **Lebensgefahr**.

![[schalter-satt-291054-05.jpeg]]

*Beim Hantieren mit Netzspannung ist immer Vorsicht angebracht; es sollten auf jeden Fall Schraubklemmen benutzt werden.*

Wenn man beide Schaltertypen benötigt, kann man zwei Platinen mit einem Flachbandkabel anschließen, darf dabei aber jedes Bit nur einmal bestücken.

[**Forum zu c't-Lab [1]**](https://ctlabforum.thoralt.de/phpbb/index.php)
RSPEAK_STOP
(roe)
RSPEAK_START

**URL dieses Artikels:**

`https://heise.de/-291054`

**Links in diesem Artikel:**

1. https://ctlabforum.thoralt.de/phpbb/index.php

*Copyright © 2007 Heise Medien*
