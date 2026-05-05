---
title: EDL (steuerbare elektronische Last)
---
# Stromabnehmer

Source: [https://www.heise.de/ratgeber/Stromabnehmer-291588.html](https://www.heise.de/ratgeber/Stromabnehmer-291588.html)
Author: Carsten Meyer, Heinrich Willecke
Series references: c't 12/08, S. 176

> Was eine elektronische, programmierbare Last so spannend macht, offenbart sich erst auf den zweiten Blick – oder bei Lektüre der technischen Daten unseres neuen c't-Lab-Moduls EDL: Wenn Sie beispielsweise den Innenwiderstand eines Netzteils bestimmen, die Entladekurve eines Akkus aufnehmen oder die Leistung eines Solarpanels messen wollen, erleichtert eine programmierbare Stromsenke enorm die Arbeit – vor allem, wenn sie wie unser Modul Messwerte über die gerade anliegende Spannung und den dabei fließenden Strom in hoher Genauigkeit an den steuernden Rechner liefert.

Das Modul EDL (für „Electronic Dummy Load“) ergänzt ideal das im Jahr zuvor im Rahmen des c't-Lab-Projekts vorgestellte programmierbare Netzteil DCG, obwohl es natürlich auch „stand alone“ als universelle elektronische (Gleichspannungs-)Last einsetzbar ist. In Verbindung mit dem PM8-Bedienpanel kommt es für „ad hoc“-Messungen sogar ganz ohne Rechner-Unterstützung aus. EDL lässt sich auf konstante Stromaufnahme (d. h. es fließt unabhängig von der angelegten Spannung immer der gleichen Strom) oder Widerstandskennlinie (der aufgenommene Strom steigt linear mit der angelegten Spannung) umschalten. Die dabei aufgenommene Leistung wird schlicht in Wärme umgesetzt.

EDL bietet vier dekadische Strombereiche von 2mA bis 2A bei einer Eingangsspannung von bis zu 25 V, bei niedriger Spannung oder mit einer separaten Leistungsendstufe ist auch deutlich mehr Strom möglich. In der Grundausstattung (Leistungsendstufe auf der Modul-Platine) können rund 50W verbraten werden – das sind bei 5 V Quellenspannung immerhin schon 10A. Die Firmware ist so flexibel gestaltet, dass die Leistungsendstufe durch Ändern einiger OPT-Parameter (siehe c't-Lab-Syntax) praktisch uneingeschränkt „skaliert“ werden kann. Gute Kenntnisse in der Elektrotechnik sind dafür allerdings die Voraussetzung, die Programmierarbeit haben wir Ihnen – zumindest auf Modulseite – vollständig abgenommen. Da die Firmware-Sourcen offenliegen, steht eigenen Implementationen nichts im Wege (auch wenn der verwendete Pascal-Compiler kostenpflichtig ist); zu einigen c't-Lab-Modulen existieren bereits vollständige Firmware-Neuauflagen in C, die unsere Leser erstellt haben.

Der Strom ist in jedem der vier Bereiche mit einer Auflösung von 12 Bit (4096 Stufen) einstellbar; optional lassen sich auch 16-Bit-Wandler einsetzen, falls eine höhere Auflösung gewünscht wird. Doch auch mit 12-Bit-D/A-Wandlern erhält man durch die Bereichsteilung schon eine Genauigkeit, die einem guten Multimeter ebenbürtig ist. Im 2-mA-Bereich beispielsweise lässt sich der Strom in 500-nA-Schritten einstellen, im 2A-Bereich sind die Schritte 500 µA groß. Mit dem 16-Bit-Wandler in der Luxus-Version sind die Schritte dann theoretisch nochmals um den Divisor 16 kleiner. Theoretisch deshalb, weil man hier schon bedenklich in die Nähe des Rauschens der in der Schaltung verwendeten Operationsverstärker kommt.

## Ergometer

Für dynamische Messungen (zum Beispiel beim Test von PC-Netzteilen) besonders interessant ist die Fähigkeit des EDL-Moduls, den Strom periodisch auf zwei verschiedene Werte (von denen einer auch 0 sein darf) zu schalten – und das mit (fast) beliebig einstellbarer Dauer beider Werte (2 ms bis 30 s). Das Tolle daran: EDL misst auch ohne Rechner-Unterstützung Strom und Spannung in beiden Zuständen und kann deshalb beispielsweise den Innenwiderstand einer Spannungsquelle direkt anzeigen. Die Messung erfolgt über einen dedizierten schnellen A/D-Wandler mit 16 Bit Auflösung. Auf dem wie bei allen c't-Lab-Modulen optionalen, aber sehr sinnvollen Bedienpanel werden im „Lastwechsel“-Betrieb die Spannungs-Messwerte (im R-Betrieb auch der Strom) alternierend angezeigt.

Durch die konsequente Istwert-Überwachung ist EDL in der Lage, die aufgenommene Leistung jederzeit exakt zu berechnen – was die Firmware dazu nutzt, die Leistungstransistoren in der Laststufe aktiv zu schützen: Bei zu hohem Spannungs-Strom-Produkt wird der Strom begrenzt und eine Warnung ausgegeben. Andererseits kann das Modul dadurch bei kleinen Spannungen relativ große Ströme aufnehmen, ohne dass die Laststufe Schaden nimmt. Natürlich kann die aufgenommene Leistung auch als Messwert ausgegeben oder auf dem Panel zur Anzeige gebracht werden. Zwei Spannungsbereiche erlauben Messungen der Klemmenspannung von 0 bis 6,25 (Low V) oder bis 25 V (High V).

## Warmgelaufen

Wie beim DCG-Modul haben wir der Laststufe ein elektronisches Thermometer mitsamt Lüftersteuerung spendiert – der moduleigene Prozessor überwacht auch die Kühlkörper-Temperatur. Wird es dem Modul zu warm, weil jemand seine Feierabendlektüre auf die Lüftungsschlitze des Gehäuses gelegt hat, schaltet der Controller das Modul ab. Die Temperatur lässt sich natürlich auch hier fernabfragen, was bei unbeaufsichtigtem Betrieb sinnvoll sein kann. Für automatisierte Messungen ist auch ein Trigger-Eingang vorhanden, zum Beispiel für einen Schaltkontakt: Bei aktivem (Low-)Pegel schaltet das Modul auf den alternativen Stromwert.

Andererseits steht bei interner Taktung mit den erwähnten frei einstellbaren Zeiten ein Trigger-Ausgang zur Verfügung, der beispielsweise zur Synchronisierung eines parallel zum EDL angeschlossenen Oszilloskops dienen kann. Damit lassen sich dann auch Spannungseinbrüche aufzeichnen, denen der interne EDL-Wandler nicht folgen kann. Der misst grundsätzlich im (von Seiten der EDL-Schaltung) ausgeregelten Zustand, minimal knapp eine Millisekunde nach erfolgter Stromumschaltung.

EDL kann nur (gegenüber Bezugspotenzial) positive Spannungen verarbeiten. Durch die im c't-Lab durchgängige Potenzialtrennung ist das nicht weiter schlimm, dann bildet gegebenenfalls halt die negative Spannung das Bezugspotenzial. Wechselgrößen, etwa die Ausgangsspannung eines Netztransformators, lassen sich dagegen nur mit Hilfsmitteln und Einschränkungen verarbeiten, hier beispielsweise durch Vorschalten eines Brückengleichrichters. Zu beachten ist dabei, dass der Spannungsabfall an den Gleichrichterdioden (etwa 1,4 V bei Graetz-Schaltung) zu einem „Leerlauf“ in der Nähe des Nulldurchgangs der Wechselspannung führt; außerdem kann der moduleigene A/D-Wandler der Wechselspannung nicht uneingeschränkt folgen. Die Messung einer Trafo-Klemmenspannung sollte dann mit einem DIV-Modul im Wechselspannungsbereich erfolgen.

Der Spannungsabfall am EDL beträgt in der hier vorgeschlagenen Dimensionierung etwa 300 mV, wenn der Ist-Strom unterhalb des Soll-Stroms liegt; das ist zwar recht wenig, aber halt nicht ideal null. Bei Eingangsspannungen unterhalb dieses Wertes wird der eingestellte Soll-Strom demzufolge nicht erreicht und die Schaltung stark nichtlinear – was in der Praxis aber kaum stören sollte. In den unteren beiden Strombereichen verfälscht zudem der endlich große Eingangswiderstand des Spannungs-Messverstärkers (1 MOhm) den eingestellten Strom: Stellt man bei 10 V Spannung 1 mA ein, fließen über den Eingangsspannungsteiler zusätzliche 10 µA ab – was einem Einstellfehler von 1 Prozent entspricht. Der Fehler wird bei höheren Eingangsspannungen und noch kleineren Sollströmen proportional größer.

## Abfall vermeiden

Letztendlich bedeutet dies auch, dass der Innenwiderstand unserer „Stromsenke“ nicht (wie wünschenswert) unendlich groß ist, sondern rund 1 MOhm beträgt. Auch im R-Betrieb muss man sich den 1-MOhm-Eingangswiderstand parallelgeschaltet denken. Hier wäre es zwar möglich, den Fehler in der Firmware herausrechnen zu lassen, der derzeitige Versionsstand tut dies aber noch nicht. Da man in der Praxis eher im unteren Ohm-Bereich arbeiten wird, dürfte der Einstellfehler hier in der Sub-Promille-Gegend anzusiedeln sein.

Gewichtiger stellen sich die durch die endlich schnelle Arbeitsweise der Messverstärker gegebenen Verfälschungen bei dynamischen Messungen dar. Die Schaltung kann Spannungsänderungen am Eingang nur innerhalb einiger Mikrosekunden folgen; diese sogenannte „Slew Rate“ ist zudem abhängig vom eingestellten Strom im jeweiligen Bereich: Nach oben hin folgt die Regelung schneller. Die Dimensionierung letzterer ist mithin ein Kompromiss aus hinreichend schneller Regelung bei kleinen und ausreichender Unterdrückung der Schwingneigung bei größeren Sollströmen.

## Geregeltes Leben

Das Verständnis der Schaltung ist zwar nicht essentiell für einen erfolgreichen Aufbau, wohl aber für eigene Änderungen. Wie oben erwähnt kennt die Schaltung zwei Betriebsarten: den Konstantstrom- und den R-Betrieb. Im leichter zu durchschauenden Konstantstrom-Betrieb liefert der mit U3 und U4 aufgebaute D/A-Wandler eine einstellbare Gleichspannung von 0 bis 2,5 V an den Vergleicher U10. Der versucht, die mit den MOSFETs Q3 bis Q7 aufgebaute und mit U7 je nach Strombereich umgeschaltete Leistungsstufe so weit aufzusteuern, dass sich am Ausgang des Strom-Messverstärkers U13 die exakt gleiche Spannung ergibt. Da U13 zehnfach verstärkt, reicht an den Stromfühler-Widerständen (Shunts) R63, R64, R66 oder R68 ein Spannungsabfall von maximal 250 mV. Mit einem Shunt von 0,1 Ohm für R66 ergibt sich also ein „Vollausschlag“ von 2,5A (= 0,25 V/0,1 Ohm).

Der bei einem gegebenen Shunt Rs maximal einstellbare Strom beträgt also 25 x Rs, bedingt durch die zehnfache Verstärkung des Stromsensor-Operationsverstärkers und die maximale Wandler-Ausgangsspannung von 2,5 V (genau genommen 4095/4096 davon, da die Null bei den 4096 Schritten eines 12-Bit-Wandlers mitzählt). Mit einem Shunt von 10 mOhm wären also 25 A möglich, die aber den Leiterbahnen der Platine und den Transistoren nur für Sekundenbruchteile zuzumuten sind.

Die an den Eingangsklemmen liegende Ist-Spannung wird mit R53, R58 und R52 auf für den Messwandler U6 (ADC mit 16 Bit Auflösung) ungefährliche Werte heruntergeteilt und mit U12 gepuffert. Der Teilfaktor kann mit Q1 zwischen 0,1 und 0,4 umgeschaltet werden, damit auch kleinere Eingangsspannungen genau gemessen werden können (maximale Eingangsspannung im High-Bereich 25, im Low-Bereich 6,25 V). U9 liefert eine hochgenaue Referenzspannung von 2,5 V für den Messwandler und den Strom-Einstell-DAC U4. Der ADC U6 misst alternierend (über Multiplexer U11) die Eingangsspannung und den tatsächlich fließenden Strom. Die Aufbereitung der Messdaten, die Steuerung des Sollstrom-DACs und die Umschaltung der Multiplexer sowie die Kommunikation im seriellen c't-Lab-Protokoll erledigt schließlich der Mikrocontroller U2 in bekannter Manier – hier unterscheidet sich die Schaltung nicht von der in den anderen Modulen. Erwähnt sei noch der Temperaturfühler U14, der dem Controller die aktuelle Kühlkörper-Temperatur mitteilt.

## Im Widerstand tätig

Im R-Betrieb ist die Sache etwas komplizierter: Um eine (idealerweise schnurgerade) Widerstandskennlinie zu erreichen, muss der durch die Laststufe fließende Strom mit der angelegten Spannung proportional steigen. Dafür wird U4 als multiplizierender D/A-Wandler geschaltet: Er erhält nun keine feste Referenzspannung wie im Konstantstrom-Betrieb, sondern über U8 umgeschaltet die heruntergeteilte Eingangsspannung von U12. Damit ist die Vergleichsspannung für U10 abhängig von der Eingangsspannung und dem eingestellten Digitalwert.

Zwei Rechenbeispiele sollen die Arbeitsweise verdeutlichen (und gegebenenfalls Hilfestellung bei einer Umdimensionierung leisten): Es sei ein simulierter Widerstand von 15 Ohm gefordert, der maximal 40 Watt aufnehmen können soll, gleichbedeutend mit einer Spannung von 24,5 V bei einem Strom von 1,633 A. Bei diesem Strom fallen am 0,1-Ohm-Shunt R66 0,1633 V ab, die U13 zehnfach verstärkt (also 1,633 V) an den Vergleicher U10 weitergibt. Dessen Vergleichsspannung muss im ausgeregelten Zustand ebenfalls 1,633 V betragen. Da die Eingangsspannung im High-V-Bereich auf ein Zehntel heruntergeteilt wird, beträgt die Referenzspannung des D/A-Wandlers nun 2,45 V. Um auf 1,633 V zu kommen, muss die Firmware also einen 12-Bit-Digitalwert von 4095 x (1,633/2,45) = 2729 einstellen (diese recht umständliche Berechnung erfolgt natürlich innerhalb der Firmware, der Anwender muss nur den gewünschten Widerstandswert übermitteln).

Zweites Beispiel, andersherum und diesmal mit eingeschaltetem Low-Spannungsbereich (bis 6,25 V, Vorteilung durch 2,5 statt 10): Am D/A-Wandler wurde ein Digitalwert von 2048 eingestellt, womit der multiplizierende 12-Bit-Wandler genau die Hälfte seiner Eingangsspannung liefert (Faktor 0,5). Liegen 5 V an den Eingangsklemmen, beträgt die D/A-Ausgangsspannung also 0,5 x (5/2,5) = 1 V, die der Vergleicher U10 bekommt. Der wiederum stellt die Laststufe so ein, dass am 0,1-Ohm-Shunt R66 0,1 V abfallen (die durch U13 ja auf 1 V zehnfach verstärkt werden), gleichbedeutend mit einem Strom von 1 A. Es ergibt sich ein simulierter Widerstand von 5 Ohm.

Der bei einem gegebenen Shunt Rs minimal einstellbare simulierte Widerstand beträgt also im High-V-Bereich (bis 25 V) 100 x Rs, im Low-V-Bereich (bis 6,25 V) 25 x Rs (exakter: jeweils 4096/4095 davon, mit der angegebenen Dimensionierung also 2,5006 Ohm im Low- und 10,002 Ohm im High-Bereich).

Ein paar Randbedingungen sind bei einer Umdimensionierung zugunsten höherer Sollströme oder kleinerer simulierter Widerstände zu beachten, auch wenn der Firmware geänderte Vorteiler-Faktoren und Shunt-Werte bequem per OPT-Parameter (siehe c't-Lab-Syntax auf [**Dokumentation [1]**](https://www.sn7400.de/ctlab/?dir=Dokumentation)) nahegebracht werden können: Die maximale Eingangsspannung des Istwert-Wandlers darf (nach Vorteilung) 2,5 V nicht überschreiten, der multiplizierende D/A-Wandler im R-Betrieb maximal 5 V erhalten. Die Leiterbahnen der Platine sind kurzzeitig bis 10 A belastbar, und die Shunts und Leistungstransistoren müssen die für jeden Strombereich gewählten Maximalströme natürlich auch verkraften können. Bei den Transistoren ist nicht die Verlustleistung oder der maximale Drain-Strom maßgeblich, sondern die „Safe Operating Area“: Bei höheren Spannungen sinkt die umsetzbare Leistung drastisch.

## Leistungsträger

Für sehr hohe Leistungen kann statt (!) Q3 und Q4 eine externe Leistungsstufe auf einem großzügigen Kühlkörper vorgesehen werden, der nicht den platzmäßigen Beschränkungen der Modulplatine unterliegt; dafür sind auf der Platine Anschlüsse vorhanden (die ansonsten natürlich frei bleiben). Gegebenenfalls ist dann die Regelungsgeschwindigkeit durch Vergrößern von C21 zu verlangsamen, damit die Schaltung nicht ins Schwingen gerät. Für stabile Betriebszustände sorgen auch L2/R67 und R69/C24 – diese Kombination erinnert nicht von ungefähr an hochwertige Audio-Leistungsendstufen.

![[stromabnehmer-291588-01.jpeg]]

*Für den DAC U4 kann ein LTC8043 im DIL- oder SO8-Gehäuse eingesetzt werden, für beide Versionen sind Lötpads vorhanden. Der MAX543 passt nur auf die DIL-Pads, seine SMD-Version ist nicht mit der Platine kompatibel.*

Der Schaltungsbeschreibung fehlen nur noch ein paar Kleinigkeiten: Einige Zenerdioden schützen Wandler und Transistoren vor gefährlichen Betriebszuständen, außerdem wurde mit Q2 eine Schnellabschaltung vorgesehen, die bei rund dreifachem Nennstrom greift. Bis eine Transienten-Regelung über U10 einsetzt, vergehen nämlich einige Mikrosekunden, und die überbrückt im Ernstfall Q2 durch Drosseln der Endstufe. Zu erwähnen ist noch ein kleiner Trick, um die Leckströme durch die mit U7 abgeschalteten und nicht an der Regelung beteiligten MOSFET-Laststufen zu verringern: Die bekommen über R23/R24 eine leicht negative Spannung ans Gate, was auch den hier verwendeten Transistoren vom selbstsperrenden Anreicherungstyp gut bekommt.

## Baukasten

Beim Aufbau machen einem diesmal weniger fummelige SMD-Bauteile (nur eine Hand voll – gezählt, nicht geschüttet!) als die Vielzahl unterschiedlicher Metallfilm-Widerstände zu schaffen – Fehlbestückungen der oft schlecht lesbaren Werte sind hier besonders kritisch. Beginnen Sie wie immer mit dem „Hühnerfutter“, also den SMD-Bauteilen U4, U14, C13 und C14. U4 und U5 im Schaltplan meinen das gleiche Bauteil, nur einmal im SMD- und einmal im DIL-Gehäuse, sodass verschiedene Ausführungen je nach Lieferbarkeit einsetzbar sind. Für U4 eignen sich die Typen MAX543 (Maxim, nur DIL-Gehäuse!) und LTC8043 (linear, SMD oder DIL). Andere DAC-Typen, auch solche mit 16 Bit Auflösung, können ebenfalls eingesetzt werden, wenn man einen der Adapter am Platinenrand aussägt (der Platinenstreifen mit den Adaptern ist durch eine Ritzung leicht abzuknicken und kann bei Nichtgebrauch entsorgt werden). Beachten Sie, dass der MAX543 im SMD-Gehäuse eine andere Anschlussbelegung als im DIL-Gehäuse aufweist, die SMD-Version des MAX543 benötigt zwingend den passenden Adapter.

![[stromabnehmer-291588-02.jpeg]]

*Der EDL-Controller-Teil entspricht weitgehend dem des DCG-Moduls, allerdings mit etwas anderer Belegung der Portleitungen. Hinzugekommen ist der Temperaturfühler U14.*

Soll ein Adapter zum Einsatz kommen, wird auf der Platine nur eine 8-polige IC-Fassung an Stelle von U4 eingesetzt, die Verbindung zum Adapter erledigen dann sogenannte IC-Stiftleisten (siehe hierzu auch den Abschnitt „DCG-Bugfix“ auf [**c't-Lab-Forum [2]**](https://ctlabforum.thoralt.de/phpbb/viewtopic.php?t=368)). Das Auflöten des nur im TSSOP- und im beinchenlosen SON-Gehäuse (kleiner als eine Blattwanze) lieferbaren 16-Bit-Wandlers DAC8811 dürfen sich aber nur erfahrene Löter zutrauen. Wir empfehlen, zunächst immer die abgedruckte Grundversion mit 12-Bit-DAC aufzubauen und erst nach erfolgreicher Inbetriebnahme eigene Änderungswünsche (mehr Strom, mehr Bits) einzupflegen.

Die drei Trimmpotis R39, R44 und R48 besitzen seitliche Einstellschrauben und sind so einzulöten, dass diese in Richtung Prozessor U2 weisen; das erleichtert Abgleicharbeiten nach erfolgter Montage des Kühlkörpers. Der verdeckt später ein Drittel der Platine, unter anderem auch die Trimmer. Der Temperaturfühler U14 (LM75) kommt unter dem Winkelkühlkörper (Typ SK451 von Fischer) zu liegen, muss also möglichst plan aufgelötet werden. Drei M3-Unterlegscheiben auf jeder der Kühlkörper-Befestigungsschrauben (M3 x 8) sorgen für den nötigen Abstand von rund 1,5 mm. Ein Klecks weiße Wärmeleitpaste auf U14 verbessert die thermische Kopplung.

![[stromabnehmer-291588-03.jpeg]]

*So haben wir uns die Kühlkörper-Montage (hier unser nicht ganz finaler Prototyp) gedacht: Es entsteht eine kompakte Einheit, die mit Lüfter gut 50 W umsetzen kann.*

Etwas davon sollte auch bei der Montage der Leistungstransistoren zur Anwendung kommen. Da der Kühlkörper isoliert montiert ist und die Transistoren vom Drain-Anschluss her parallelgeschaltet sind, benötigen letztere keine Glimmerscheiben und Isoliernippel, nur ein paar Zahnscheiben unter den Befestigungsschrauben (M3 x 6). Bitte die Schrauben nicht allzu sehr „anknallen“, das nehmen die Gewindeschlitze im Kühlkörper übel. Über die Source-Anschlüsse (bei lesbarer Beschriftung das rechte Bein) von Q3 und Q4 sollten Ferritperlen gestreift werden. Ohne die neigt die MOSFET-Endstufe unter hoher Last zu hochfrequenten Schwingungen, die leicht bis in den oberen Kurzwellenbereich reichen können. Auch die Gate-Widerstände von 47 Ohm dienen der Dämpfung; bei externen Leistungsstufen sind sie ebenfalls vorzusehen, möglichst nahe am jeweiligen Transistor.

Wildes Schwingen soll ebenso L2 verhindern, eine Stabkerndrossel mit 2 bis 5 µH, wie man sie oft im Niederspannungszweig von Schaltnetzteilen findet; unser Muster arbeitet vorbildlich mit einer Gebraucht-Drossel aus einem ausgeschlachteten PC-Netzteil. Die Spule wird von einem parallelen 1-Ohm-Widerstand stark bedämpft und hat die Aufgabe, (parasitäre) Induktivitäten im Lastkreis von der Endstufe zu „isolieren“. Geeignet sind nur Drosseln, die auch kräftige Ströme (in der vorliegenden Dimensionierung mindestens 2 A) vertragen.

Ein an PL10 angeschlossener 12-V-Lüfter, etwa von einem obsoleten Prozessorkühler, kann direkt auf dem Kühlkörper befestigt werden, am einfachsten mit 2,8-mm-Blechschrauben, die man in die Alu-Lamellen dreht. Als Lüfter eignet sich zum Beispiel der Typ 412 FM von Papst (40 x 40 mm). Seine Betriebsspannung erhält der Lüfter über Steckverbinder PL1 aus der ungeregelten Spannung für den 5-V-Zweig einer c't-Lab-IFP- oder PS3-2-Platine. Hier sollte möglichst ein 9-V-Trafo zum Einsatz kommen, bei 6-V-Trafos (in Kombination mit Low-Drop-Spannungsreglern) erreicht der Lüfter nur eine unzureichende Drehzahl.

## Selbstgedreht

Apropos Drehen: Grundlegende Einstellarbeiten können Sie schon vor der Kühlkörpermontage ausführen – die Trimmer sind dann deutlich einfacher zu erreichen. Nach Aufspielen der Firmware (im „Browse Source“-Bereich auf [**Firmware-Mirror [3]**](https://www.sn7400.de/ctlab/Firmware?dir=EDL) zu finden) geht selbige in einen Einstell-Zustand, der für den Hardware-Abgleich ausreicht. Achtung: Der Kalibriermodus, erkennbar an einer im Sekundenrhythmus blinkenden LED1, wird nach einem erneuten Reset (oder Ein- und Ausschalten) wieder verlassen, ist also nur direkt nach dem „Flashen“ zugänglich.

Schließen Sie die Eingangsklemmen In- und In+ kurz, die Sense-Eingänge bleiben offen. Stellen Sie nun R44 so ein, dass die Spannung an TP1 bei leuchtender und „außer“ LED gleich ist (im Idealfall 0 V, Multimeter mit mV-Bereich verwenden). Wichtig: Beide gemessenen Werte (Offset-Spannung des Istspannungsteiler-OpAmps) sollen möglichst gleich sein, während einige mV Abweichung von 0 V durchaus zulässig sind. Als Bezugspotenzial dient bei allen Messungen die Drahtbrücke auf Position R8 (Schaltungs-Masse).

Mit R48 stellen Sie den Offset des Stromverstärkers U13 auf möglichst nahe 0 mV an TP2 ein. Entfernen Sie nun den Kurzschluss an den Eingangsklemmen und schließen Sie hier eine Spannungsquelle von 12 V an (Polung beachten, am besten mit einer Strombegrenzung auf 100 mA), der ein Multimeter im Strombereich in Reihe geschaltet ist. Verstellen Sie R48 so, dass ein Strom von zwei, drei mA fließt. Nun R48 in der Gegenrichtung so lange verstellen, bis der Strom gerade auf etwa 12 µA zurückgeht, aber nicht weiter – ein paar µA mehr sind nicht kritisch.

Damit wäre der Hardware-Abgleich beendet – die restliche Kalibrierung erfolgt ausschließlich per Software durch Setzen der jedem Strombereich eigenen SCL- und OFS-Parameter. Wie beim DCG-Modul gibt es zu jedem der vier Strombereiche einen Skalierungs- und einen Offset-Wert für den DAC. An den Offset-Parametern müssen Sie nur „schrauben“, wenn der Ist-Strom bei auf 0 gestelltem Stromwert deutlich von 0 abweicht; dies sollte nach gutem Hardware-Abgleich eigentlich nicht der Fall sein. Der Skalierungsfaktor dürfte dagegen in jedem Strombereich ein Feintuning nötig haben; Hochlastwiderstände sind selten sehr genau, hinzu kommen die parasitären Widerstände der Leiterbahnen und Lötstellen, die den Idealwert verfälschen. Mit den DAC-Skalierungswerten bringt man den tatsächlich fließenden Nennstrom in jedem Bereich (2 A, 200 mA, 20 mA, 2 mA) auf den eingestellten (Maximal-) Wert. Die R-Betriebsart benötigt keinen Abgleich, da die Digitalwerte des DACs hier lediglich aus den vorhandenen Parametern errechnet werden.

![[stromabnehmer-291588-04.jpeg]]

*Etwas mehr als ein simpler Transistor: Durch den umschaltbaren Konstantstrom- und R-Betrieb sowie die konsequente Istwert-Überwachung geriet der EDL-Regelungsteil recht komplex. Der fehlende Baustein U5 ist lediglich Platzhalter für eine andere Gehäuseversion des Regelungs-DACs U4, natürlich darf nur eine der Varianten eingesetzt werden.*

Dem A/D-Wandler für die vom Modul gemessenen Istwerte sind ebenfalls vier Offset-/Skalierungspaare zugeordnet. Die Offsets sind mit recht hohen Werten vorbesetzt, um die mit R36 absichtlich um einige mV angehobene ADC-Spannung (um einen möglichen toten Bereich des ADCs um 0 V zu meiden) wieder auszugleichen. Der Offset-Abgleich des ADCs ist recht simpel: Bei offenem Eingang muss der gelieferte Iststrom-Messwert für jeden Bereich 0 betragen – oder sehr nahe dran sein. Die Skalierungen werden wiederum so eingestellt, dass der gemessene Nennstrom in jedem Bereich mit den tatsächlich fließenden Strömen übereinstimmt. Eine Spannungsquelle mit fein einstellbaren Strombereichen (etwa unser DCG-Modul) ist bei all diesen Kalibrierungen sehr hilfreich.

Der ADC kennt zwei weitere Offset-/Skalierungspaare, nämlich für die gemessene Klemmenspannung (Istwert). Hier gleicht man mit kurzgeschlossenen Eingängen die Offset-Parameter und mit 5 V (Low-V-Bereich) beziehungsweise 20 V (High-V-Bereich) die Skalierungsparameter ab. Wie beim DCG-Modul ist ein LabVIEW-Programm als Kalibrier-Tool in Planung.

## Sehen und tasten

Die Bedienungsmenüs über das Panel PM8 sind ebenfalls an das DCG-Modul angelehnt; eine Spannungseinstellung gibt es bei EDL natürlich nicht, dafür Menüs zur Auswahl des Istwert-Spannungsbereiches und des Betriebsmodus (High-V, Low-V, jeweils für Konstantstrom- und R-Betrieb) und zum Einstellen der On-Off-Zeiten. Durch die Menüs klickt man sich wie üblich mit den beiden Up-/Down-Tasten, der Drehgeber verändert den angezeigten Wert – sofern er nicht gerade ein reiner Messwert (Temperatur, Leistung, Innenwiderstand) ist.

![[stromabnehmer-291588-05.jpeg]]

![[stromabnehmer-291588-06.jpeg]]

![[stromabnehmer-291588-07.jpeg]]

![[stromabnehmer-291588-08.jpeg]]

*Einige der EDL-Menüpunkte bei Einsatz des Bedienpanels PM8: Durch die (eine) Menüebene steppt man mit den Panel-Tasten, die Anzeigewerte wurden praxisgerecht zusammengefasst. Die rote LED oben rechts zeigt an, dass EDL den Strom regelt.*

Den Strom für die Off-Zeit gibt man als Prozentwert vom eingestellten Sollstrom ein: 25 Prozent von 1,5 A ergibt 375 mA. Sobald eine Off-Zeit größer 0 (Angabe in Millisekunden) und ein Prozentwert kleiner 100 eingestellt ist, aktiviert sich die automatische On-Off-Umschaltung mit den eingegebenen Zeiten und die selbsttätige Innenwiderstandsmessung. Die wird natürlich erst mit kleineren Prozentwerten genau, zwischen 99 und 100 Prozent Nennstrom wird sich kein großer Spannungsunterschied einstellen. Die aufgenommene Leistung wird sogar mit der Gewichtung von On- und Off-Zeit sowie des Off-Prozentwertes gemittelt.

Nach erfolgter Einstellung des Sollstromes geht das Display in den Istwert-Anzeigemodus von Strom (obere Zeile) und Klemmenspannung (untere Zeile), kenntlich gemacht durch einen „hohlen“ Cursor-Pfeil (während einer Einstellung ist er schwarz ausgefüllt oder bei Feineinstellung – wie üblich durch kurzen Druck auf den Drehgeber – schraffiert). Bei der dynamischen On-Off-Messung wird alternierend der On- und der Off-Wert im Sekundenrhythmus angezeigt; ein Kreis in der unteren Displayzeile zeigt den jeweili-gen Zustand (hohl = Off-Wert, schwarz ausgefüllt = On-Wert). Wichtig: Der Anzeige-Rhythmus ist von den eingestellten On-Off-Zeiten unabhängig – bei im Millisekunden-Takt wechselnden Werten würde man auch nichts erkennen.

In der Widerstands-Betriebsart sind Prozentwert und Timing ohne Belang, hier erfolgt bei der vorliegenden Firmware-Version keine Umschaltung auf einen Off-Wert. Kühlkörper-Temperatur und die aufgenommene Leistung lassen sich dagegen immer abrufen. Alle Parameter stehen natürlich auch befehlsgesteuert (siehe Syntax-Tabelle auf [**Dokumentation [4]**](https://www.sn7400.de/ctlab/?dir=Dokumentation)) zur Verfügung.

Das Kabel zu den Laborbuchsen auf der Frontplatte sollte recht kräftig gewählt werden, um Spannungsabfälle zu vermeiden. Bei Leitungslängen über zehn Zentimeter kommen die Sense-Anschlüsse zum Einsatz, von denen zusätzliche Litzen zu den zwei Laborbuchsen am Frontpanel geführt werden; ansonsten werden sie mit den zugehörigen In-Pins kurzgeschlossen.

## Stückliste

### Halbleiter

| ID      | Type                                           |
| ------- | ---------------------------------------------- |
| U1      | 6N137                                          |
| U2      | ATmega32 DIL                                   |
| U3      | OPA2277 DIL                                    |
| U4      | LTC8043 DIL oder MAX543 DIL, alternativ LTC8043 SO8 |
| U6      | LTC1864 SO8                                    |
| U7      | DG409 o. DG509 DIL                             |
| U8, U11 | DG419 DIL                                      |
| U9      | LT1019-2,5 DIL                                 |
| U10, U13 | OP-27 DIL                                     |
| U12     | LF411 DIL                                      |
| U14     | LM75 SO8                                       |
| Q1, Q7  | BS170                                          |
| Q2      | BC547B                                         |
| Q3,Q4   | IRFZ44                                         |
| Q5,Q6   | IRF540                                         |
| Q8      | BC337                                          |
| D1, 2, 4 | 1N4148                                        |
| D3      | 1N5401                                         |
| Z1, Z3  | Z-Diode 5V1 400 mW                             |
| Z2      | Z-Diode 8V2 400 mW                             |
| LED1    | LED 3 mm rot                                   |

### Passive Bauteile

| ID                           | Type                    |
| ---------------------------- | ----------------------- |
| C14                          | 1n SMD 0805             |
| C13                          | 220n SMD 1206           |
| C1, 2, 10                    | 22p RM2,5               |
| C3, C5...8, 16, 20, 22, 23   | 100n ker. RM5           |
| C15                          | 1n RM5                  |
| C17                          | 10n RM5                 |
| C21                          | 2n2 RM5                 |
| C24                          | 330n ker. RM5           |
| C4                           | 10µ 35V Ta.             |
| C11                          | 47µ 16V                 |
| C12, C18                     | 4µ7 35V Ta.             |
| C9, C19                      | 10µ 35V Ta.             |
| R8                           | 0R (Drahtbrücke)        |
| R52                          | 100k                    |
| R63                          | 100R                    |
| R10, 20, 32, 34              | 10k                     |
| R5, 12, 59, 64, 69, 56       | 10R                     |
| R37                          | 18k                     |
| R24, 30, 31, 35, 42          | 1k                      |
| R36, R53                     | 220k                    |
| R2, R3, R4, R11, R14...R18   | 220R                    |
| R60                          | 2k                      |
| R25, 26, 46                  | 2k2                     |
| R7, 9, 13, 19, 55            | 2k7                     |
| R33                          | 30k                     |
| R1, 28, 45, 49, 51           | 470R                    |
| R29, 54, 57, 61, R62, 65     | 47R                     |
| R29, 54, 57, 61, R41, 43, 47, 50 | 4k7                 |
| R58                          | 680k                    |
| R27                          | R-Array 22kx4           |
| R39, 44, 48                  | 2k2 Präz.-Trim. 67X 90° |
| R66                          | 0R1 5W                  |
| R67                          | 1R 2W                   |
| R68                          | 1R 2W                   |
| XTAL1                        | Quarz 16 MHz HC49U      |
| L1                           | 10µH axial              |
| L2                           | 5µH Stabkerndrossel 3A  |

### Sonstiges

| ID             | Type |
| -------------- | ---- |
| PL1            | Wannen-Pfostenverb. 14-pol. |
| PL2, PL3, PL4, PL5 | Wannen-Pfostenverb. 10-pol. |
| JP1…JP5        | Jumper 2-pol. |
| PL6, PL7, PL10 | Platinen-Steckverb. 2-pol. |
| PL8            | Platinen-Steckverb. 5-pol. |
| PL9            | Anschlussklemme 3-pol. RM5 oder Lötpins |
| PL11           | Anschlussklemme 4-pol. RM5 oder Lötpins |
|                | Schrauben M3 x 8, M3 x 6, Unterlegscheiben |
|                | Platine c't-Lab EDL (eMedia, Segor) |

RSPEAK_STOP
(cm)
RSPEAK_START

**URL dieses Artikels:**

`https://www.heise.de/-291588`

**Links in diesem Artikel:**

1. https://www.sn7400.de/ctlab/?dir=Dokumentation
2. https://ctlabforum.thoralt.de/phpbb/viewtopic.php?t=368
3. https://www.sn7400.de/ctlab/Firmware?dir=EDL
4. https://www.sn7400.de/ctlab/?dir=Dokumentation

*Copyright © 2008 Heise Medien*
