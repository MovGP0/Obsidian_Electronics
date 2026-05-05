---
title: ACV (Analog-Audio Konverter)
---

# Vermessener Klang

Source: [https://www.heise.de/ratgeber/Vermessener-Klang-291360.html](https://www.heise.de/ratgeber/Vermessener-Klang-291360.html)
Print view: [https://www.heise.de/ratgeber/Vermessener-Klang-291360.html?seite=all&view=print](https://www.heise.de/ratgeber/Vermessener-Klang-291360.html?seite=all&view=print)
Author: Peter Boenik, Carsten Meyer
Series references: c't 26/07, S. 208

> [!note] Segor
> Passende Segor-Seite: [Baugruppe c't-Lab/ACV](https://www.segor.de/INFO/ct-lab/baugruppe-acv.shtml)

> Eigentlich nur einer Nebenbei-Idee zum c't-Lab-Projekt entsprungen, bewährte sich unser programmierbarer Audio-Vorverstärker in der Praxis so gut, dass wir ihm an dieser Stelle eine breitere Bühne bieten: Mit passender PC-Software erhält man gleichzeitig Oszilloskop, Frequenz- und Klirranalysator für den Niederfrequenzbereich. Das Modul ergänzt damit prima den bereits vorgestellten DDS-Funktionsgenerator, ist aber auch genauso gut eigenständig außerhalb des c't-Lab einsetzbar.

Über das, was Nieder- und was Hochfrequenz ist, herrschen durchaus unterschiedliche Meinungen: Für Zentimeterwellen-Funkamateure ist alles, was man noch auf einem Oszilloskop darstellen kann, keine richtige HF, während die Niederfrequenz-Welt eines Energietechnikers spätestens bei 400 Hz endet. Sprechen wir also lieber vom Audio-Frequenzbereich, obwohl der bei Mittvierzigern wie den Autoren mit Glück noch bis 16 kHz reicht - was weit von den Möglichkeiten des ACV (wie AC-Vorverstärker) getauften c't-Lab-Moduls entfernt ist.

ACV versteht sich als Bindeglied zwischen dem Eingang einer PC-Audio-Karte und dem Messobjekt oder Prüfling. Audio-Karten erwarten, sofern sie nicht mit einer Break-Out-Box mit eingebautem Vorverstärker ausgerüstet sind, für digitale Vollaussteuerung (Full Scale, FS) in der Regel Line-Pegel in der Gegend von 0 bis +4 dBm (775 bis 1228 mVeff). Letzterer Wert, zu finden beispielsweise bei der sehr brauchbaren und preiswerten PCI-Karte Audiophile 2496 von M-Audio, entspricht übrigens dem US-Studio-Nennpegel; Consumer-Geräte geben dagegen nur rund -7 dBm ab. Liegt der Eingangspegel niedriger, verschenkt man Auflösung - bei -12 dBm schon den Gegenwert von zwei Bits. Liegt der Pegel dagegen höher, geht der A/D-Wandler schnell in die Begrenzung, und Messungen werden absolut unmöglich. Ein Vorverstärker für Messzwecke muss also auch abschwächen können.

Ein weiterer wichtiger Punkt bei Messungen an „lebenden“ Schaltungen ist die Eingangsimpedanz. Die liegt bei Audio-Karten oft nur in der Größenordnung von 10 bis 50 kΩ, ein rückwirkungsarmes Messen ist deshalb nur an nierderohmigen Schaltungspunkten möglich. Wünschenswert ist der Eingangswiderstand eines Oszilloskops oder Millivoltmeters, der üblicherweise bei 1 MΩ bei einer Parallel-Kapazität von 30 pF liegt, ebenso eine gute Absicherung gegen versehentlich zugeführte (bei Messungen an Endstufen oder Röhren-Schaltungen auch sehr hohe) Gleichspannungen.

## Messen statt hören

Ansonsten verlangt der Einsatz als Messmittel von einem Vorverstärker eine hervorragende Signaltreue, also eine hohe Bandbreite und einen niedrigen Klirrfaktor; schließlich soll er das Signal vom Messobjekt nur verstärken oder abschwächen, aber nicht selbst verzerren. Hochwertige analoge Audio-Elektronik erreicht ohne weiteres Bandbreiten von 50 kHz bei Signal-/Rauschabständen von 95 dB und mehr; das Messmittel noch deutlich besser zu konstruieren, um überhaupt noch etwas messen zu können, ist keine ganz leichte Aufgabe.

Die technischen Daten unseres Vorverstärkers lassen aber selbst Audio-Kenner aufhorchen: Linealglatter Frequenzgang mit den -3-dB-Eckpunkten 1 Hz und 1 MHz, Klirrfaktor bei 1 kHz kleiner 0,0003 Prozent (Auflösungsgrenze unseres R&S-UPL-Audioanalysators), Dynamik >120 dB, Rauschabstand bei 50 dB Verstärkung >85 dB (A-bewertet), bei 10 dB Verstärkung >110 dB. Die Verstärkung/Abschwächung des Moduls lässt sich programmgesteuert oder manuell von -30 bis +50 dB in 10-dB-Stufen einstellen, sodass der Audio-Eingang eines PC unabhängig vom Eingangssignal immer optimal ausgesteuert werden kann - natürlich in Stereo. In der Basis-Version dient ein Drehschalter zum Umschalten der Verstärkung beziehungsweise Abschwächung und damit der Messbereiche. Reed-Relais und CMOS-Analogschalter aus der Messgeräte-Elektronik verhindern, dass Störsignale über den Umschalter in die Schaltung gelangen können und sorgen nebenbei für einen kapazitätsarmen Aufbau ohne lange Leitungswege.

![[vermessener-klang-291360-01.jpg]]

*Fertig aufgebautes ACV-Modul in c't-Lab-Bestückung. Die Abschirm-Platinen sind hier zur besseren Einsicht abgenommen. Die Platine passt übrigens auch prima in ein altes CD-ROM-Laufwerksgehäuse, das auch die Abschirmung erledigt.*

Wer den Vorverstärker in sein c't-Lab integrieren möchte oder den zusätzlichen Komfort einer Aussteuerungs- und Pegelanzeige wünscht, sollte den Controller-Teil gleich mitbestücken. Zwei optionale True-RMS-Messwandler liefern dem Steuer-Rechner oder dem LCD auf einem angeschlossenen Bedien-Panel millivoltgenau die aktuelle Eingangsspannung, beim LCD sogar wählbar als Zahlenwert- oder Balkenanzeige.

Wie alle c't-Lab-Module besitzt auch die ACV-Platine einen eigenen Mikrocontroller, der sich vornehmlich des c't-Lab-eigenen Protokolls über die OptoBus-Schnittstelle annimmt (siehe auch [**c't-Lab-Projekte bei Segor [1]**](https://www.segor.de/INFO/ct-lab-projekte.shtml)), aber auch die Auswertung des Effektiv-Messwerts für beide Stereo-Kanäle erledigt. Und natürlich kann man zur manuellen Bedienung ein Panel PM-8 mit LC-Anzeige und Drehgeber anschließen. Als besonderen Leckerbissen haben wir noch eine Erweiterungsschnittstelle vorgesehen, die einen Audio-ADC auf einer Tochterplatine aufnimmt (wie beim DDS-Modul die TRMSC-Platine).

![[vermessener-klang-291360-02.jpg]]

*Viele Bauteile können entfallen, wenn eine manuelle Bedienung ausreicht. Dann übernimmt ein Stufenschalter an PL8 die Verstärkungseinstellung. Durch den hier verwendeten Spannungswandler genügt eine simple Versorgung mit 5 V/200 mA.*

Der ADC-Tochterplatine soll später ein eigener Artikel gewidmet werden, da ihre technischen Daten eine gewisse Prominenz geradezu herausfordern. Ihre Technik spiegelt das derzeit mit vertretbarem Aufwand Machbare wider: Der 24-Bit-Wandler CS5381 bietet bis zu 192 kHz Abtastrate bei einer Dynamik von 120 dB, Verzerrungen und Rauschen (THD+N) sollen über 110 dB unter dem Nutzsignalpegel liegen. Die Ausgabe des Digital-Audio-Signals mit 48, 96 oder 192 kHz (!) Sampling-Rate erfolgt potentialgetrennt über Glasfaser- (Toslink) oder Koaxkabel im Consumer- oder Professional-Format. Wandlungsraten und Formate lassen sich ferngesteuert oder am Bedienpanel ändern.

## Unter der Haube

Damit sich der Vorverstärker keine Störsignale aus der Umgebung (z. B. das Lichtnetz-Brummen) einfängt, muss sein Eingangsbereich mit einem abschirmenden Gehäuse versehen werden - doch dazu später. Der Analogteil der ACV-Schaltung (siehe Schaltbild) besteht aus drei Teilen, die für Stereo-Betrieb natürlich zweimal vorhanden sind: einem per Relais geschalteten Eingangsabschwächer (0/-20 dB), einer Vorverstärkerstufe mit hohem Eingangswiderstand und umschaltbar 0 dB (einfacher) oder +20 dB (zehnfacher) Verstärkung, einem Stellpoti mit 0- bis -10-dB-Regelbereich und schließlich einer Treiberstufe mit 0 dB, 10 dB, 20 dB oder 30 dB Verstärkung, hier umgeschaltet über einen hochwertigen Analog-Multiplexer. Zwei Folienkondensatoren trennen schließlich eventuelle Gleichspannungsanteile von der Ausgangsspannung ab. Von hier geht das Signal direkt zur ADC-Tochterplatine oder zur Audio-Karte.

Der Vorverstärker inklusive Messbereichsumschaltung ist auch ohne c't-Lab-Anbindung funktionsfähig; er benötigt lediglich eine stabile Stromversorgung mit 5 V/200 mA (z. B. Steckernetzteil) an PL2. Für eine solche Stand-alone-Anwendung brauchen Sie den Controller und die zwei True-RMS-Gleichrichter nicht zu bestücken. An PL8 wird dann ein Stufenschalter (min. acht Positionen) angeschlossen. Bitte beachten: Die 0-dB-Einstellung (alle Relais/Multiplexer in Ruheposition) bleibt offen und erhält keinen Anschlussdraht, deshalb reicht hier ein 8poliger Steckverbinder. Die ±15-V-Versorgung geschieht über den DC/DC-Wandler UA1 aus der 5-V-Schiene. Alternativ wäre auch eine Stromversorgung über eine „halbe“ PS3-2-Netzteilkarte aus dem c't-Lab-Sortiment möglich, dann darf UA1 nicht bestückt werden.

Der Einsatz im c't-Lab benötigt natürlich zwingend einen Mikrocontroller, der ob seiner überschaubaren Aufgaben etwas kleiner ausgefallen ist als bei den übrigen c't-Lab-Modulen. Trotzdem bietet die Schaltung damit den bekannten Komfort: Panel-Anschluss, Fernsteuerbarkeit und Auswertung des effektiven NF-Pegels gehören dazu. Mit dem Drehgeber am Panel stellt man den Messbereich ein, das LCD zeigt den Ausgangspegel als Balkenanzeige oder als mV-Efektivspannung. Wird die Pegel-Anzeige nicht gewünscht, dürfen Sie die relativ teuren True-RMS-Gleichrichter U3 und U4 (SMD-Bauteile!) auch weglassen; natürlich entfällt dann auch die Pegelabfrage über c't-Lab-Befehle (siehe Syntax-Tabelle auf der c't-Lab-Projektseite bei Segor). Wie üblich kann die Moduladresse mit drei Jumpern binär eingestellt werden, hier sind dies JP3 (+4), JP4 (+2) und JP5 (+1).

![[vermessener-klang-291360-03.jpg]]

*Erst lesen, dann c't drehen: Der Analogteil der Schaltung arbeitet mit zwei Verstärkerstufen in Reihe. Die Arbeit im Controller-Teil übernimmt ein ATmega168, der wie bei den anderen c't-Lab-Modulen auch über die ISP-Schnittstelle mit der ihm zugedachten Firmware zu füttern ist. Hinweise zum Programmiervorgang und weitere Projektunterlagen finden Sie heute am ehesten auf der c't-Lab-Projektseite bei Segor.*

Den Controller benötigen Sie auch, wenn später die ADC-Tochterplatine nachgerüstet werden soll, da er deren Wandler und SPDIF-Transmitter über I2C-Bus initialisieren muss. Die Einstellung der Wandler-Rate (48/96/192 kHz) und des Audio-Formats (Consumer/Professional) erfolgt am PM8-Panel oder per c't-Lab-Befehl. Die manuelle Bedienung ist geringfügig anders als bei den übrigen Modulen gestaltet: Ein Druck auf den Drehgeber wechselt nicht zu einer Feineinstellung (die es hier nicht gibt), sondern schreibt den eingestellten Parameter (auch die eingestellte Eingangsempfindlichkeit) als Default-Wert in das EEPROM des Controllers. Mit der ADC-Tochterplatine ist auf jeden Fall eine PS3-2-Platine als Stromversorgung vorzusehen; die Wandler-Elektronik wird dann über PL6 (Extension) versorgt, ähnlich wie beim DDS-Modul die TRMSC-Erweiterung.

## Sorgfaltspflicht

Ein hochwertiger Vorverstärker benötigt auch hochwertige Bauteile. Wegen der Nachbausicherheit werden Operationsverstärker verwendet, ein diskreter Aufbau hätte den Schaltungsumfang mal eben verdreifacht. Es kommen hier für U8 die Typen OP275, OPA2604, OPA2134 und der preiswerte, aber gar nicht mal schlechte LF412 in Frage. Für U6 eignen sich der gute, alte NE5532 oder der geringfügig bessere, aber deutlich teurere S4580. Wer nicht auf den Euro schauen muss, setzt für beide ICs den OPA2134 ein, einen der klirrärmsten OpAmps, die es derzeit gibt. Ein billiger TL072 produziert im Vergleich dazu einen mindestens 50mal höheren Klirrfaktor; zum Test der Schaltung reicht er natürlich trotzdem, wenn man nicht aufgrund eines eventuellen Lötfehlers das Leben der kostbaren OPAs riskieren will.

Ob man die 0,01 Prozent Klirr, die ein TL072 produziert, tatsächlich hört, darüber lässt sich trefflich streiten (siehe hierzu auch S. 215 in c't 26/07); für Messzwecke ist er allerdings keine so gute Wahl, zumal auch sein Rauschen nicht den Stand der Technik widerspiegelt. Überraschend gut schnitt der 5532 bei unseren Klirrfaktor- und Rauschmessungen ab, allerdings ist er wegen seines Bipolar-Eingangs nicht für die hochohmige Eingangsstufe U8 geeignet. Die messtechnisch besten 5532 lieferte uns New Japan Radio Co. (Aufdruck JRC), diese OpAmps können sich ohne weiteres mit weit teureren neuen Designs messen.

Mit guten OpAmps kann das ACV-Modul auch als Mikrofon-Vorverstärker dienen, obwohl es dafür nicht optimiert ist. Mikrofone haben in der Regel eine sehr niedrige Ausgangsimpedanz, wofür es speziell angepasste Schaltkreise (LT1028, SSM2015, INA103) gibt - die aber weder einen Nullkommanichts-Klirrfaktor noch den für Messzwecke unabdingbaren hohen Eingangswiderstand aufweisen.

Die Stückliste ist wegen der Stand-alone-Option in zwei Versionen abgedruckt; ein späteres Nachrüsten sollte keine Probleme bereiten. Wenn allerdings erst einmal der ATmega-Controller U2 seinen Dienst versieht, darf der Stufenschalter an PL8 nicht mehr angeschlossen werden; die manuelle Bedienung kann dann nur noch per PM8-Panel erfolgen. Der schrittweise Test der Schaltung fällt allerdings leichter, wenn der Controller zunächst nicht in seiner Fassung sitzt und man die Eingangsempfindlichkeit manuell am Stufenschalter einstellen kann. Wenn Sie eine stufenlose Regelung nicht benötigen, lassen Sie die beiden Gain-Potis P1 und P2 einfach weg und überbrücken Pin 2 und 3 von PL11 und PL12 mit einem Jumper. An die beiden Steckverbinder können auch externe Gain-Potis angeschlossen werden, wenn die Platzverhältnisse den Einbau von P1 und P2 nicht zulassen (Verbindungen kurz halten!).

Die für die Genauigkeit der Verstärkung/Abschwächung entscheidenden Widerstände sind in der Stückliste gekennzeichnet (Fußnote). Mit nicht selektierten 1-Prozent-Widerständen erreicht man absolute Abweichungen von maximal 0,1 dB, was in der Praxis ausreichend sein sollte. Enger tolerierte Widerstände lohnen nur dann, wenn auch die L/R-Kanal-Differenz der Audio-Karte unter diesem Wert bleibt. Beim Einsatz unter LabVIEW kann man die Messwerte notfalls immer noch nachträglich per Software skalieren - die kann ja jederzeit per Abfrage feststellen, welche Eingangsempfindlichkeit am ACV gewählt wurde.

## Qualitätsentscheider

Wenn wir hier von Audio- und nicht von Soundkarten sprechen, hat dies schon seinen Grund: Soundkarten oder Onboard-Sound-Codecs eignen sich zwar zum Spielen und MP3-Hören, aber kaum für ernsthafte Messungen. Sampling-Raten über 48 kHz sind extrem rar, und oft werden selbst die schon im Treiber grundsätzlich auf 44,1 kHz umgesetzt, um den weiteren Verarbeitungsweg einfacher zu gestalten - zu beobachten bei vielen SoundBlaster-Derivaten. Eine Audio-Karte mit einem guten A/D-Wandler, die dessen Audio-Daten unverschandelt weitergibt, ist für Messaufgaben die bessere Wahl. Während Abtastraten über 48 kHz für Audio-Zwecke von zweifelhaftem Nutzen sind, dürfen es für die anvisierten Messanwendungen ruhig ein paar kHz mehr sein: Bei 96 kHz ist sichergestellt, dass auch im oberen Audio-Bereich genügend Stützstellen zur Auswertung (z. B. für eine Oszilloskop-Anwendung) bereitstehen.

Vorteilhaft ist auf jeden Fall ein Digital-Eingang, der 24-Bit-Daten mit 96 oder gar 192 kHz entgegennehmen kann. Den brauchen Sie nämlich, wenn die ADC-Tochterplatine des ACV-Moduls zum Einsatz kommen soll: Damit erst erhält man die wünschenswerte Potenzialtrennung, die wirksam Brummschleifen verhindert. Übrigens nicht nur mit einer optischen Toslink-Verbindung, sondern auch beim Einsatz eines SPDIF-Koaxkabels: Ein Impulsübertrager auf Sende-Seite sorgt hier für getrennte Massen.

![[vermessener-klang-291360-04.jpeg]]

*Bald in diesem Theater: Sinus-Erweiterungsmodul für DDS (hinten) mit ultrakleinem Klirrfaktor (<0,0003 Prozent) am Analogausgang und zusätzlichem SPDIF-Anschluss zum Prüfen digitaler Audio-Elektronik. Vorn der versprochene A/D-Wandler als ACV-Aufsatz. Die im Bild noch handgedengelten Platinen benötigen nur noch etwas Feintuning.*

Doch selbst mit den besten Audio-Karten müssen Sie sich vom Gedanken verabschieden, auch nur entfernt an die versprochene 24-Bit-Auflösung heranzukommen. Das letztwertige Bit steht hier bei 1 V Vollaussteuerung für eine Spannung von 0,00000006 V (60 nV). Zum Vergleich: Das thermische Eigenrauschen (Johnson-Rauschen) eines idealen 1-kΩ-Widerstandes liegt bei 20 °C und einer Messbandbreite von 20 kHz schon bei 570 nV. Realistischer ist eher eine maximale Auflösung von 18 Bit (entsprechend einer Dynamik von 108 dB), und selbst die ist nur mit sehr viel Sorgfalt zu erreichen: Sobald dem A/D-Wandler auch nur irgendetwas Verstärkendes vorgeschaltet wird, sinkt die Dynamik und damit die Auflösung durch Rauschen weiter ab - über den Daumen um 1 Bit pro 6 dB Verstärkung. Trotzdem haben 24-Bit-Wandler gegenüber den alten 16-Bit-Wandlern Vorteile: Ihr Frinzeln (Digitalisierungsartefakte durch ungedithertes Abschneiden der unteren Bits) liegt immer unterhalb des Rauschteppichs.

## Abschirmdienst

Hochohmige Eingangsstufen und potenzielle Störquellen auf engem Raum vertragen sich nicht. Ohne abschirmende Maßnahmen werden Sie am ACV-Modul wenig Freude haben; schon das allgegenwärtige Wechselfeld des Lichtnetzes sorgt für erhebliche Störungen, wenn der Eingang nicht gerade sehr niederohmig abgeschlossen wird. Als Mindestmaßnahme ist die Lötseite der Platine mit einer kupferkaschierten Euro-Karte (160 x 100 mm2) abzuschirmen; die Kupferfläche (Abstand zur Platine etwa 5 mm) wird mit der Analog-Masse der ACV-Schaltung (AGnd, z. B. an PL13) verbunden. Weiterführende Maßnahmen sind die im Bild gezeigten Abschirmungen aus zusätzlichen, passend zurechtgesägten Platinenabfall-Streifen.

Die beste Lösung ist allerdings, die Platine in ein mit der Schaltungsmasse (AGnd) verbundenes Metallgehäuse einzubauen. Das kann auch eine geschlossene 19"-Einschubkassette sein, womit das ACV-Modul c't-Lab-tauglich bleibt. Wenn das (ansonsten nur mit dem Schutzleiter verbundene) c't-Lab-Gehäuse irgendwo mit einer Schaltungsmasse verbunden wird, dann hier - nirgendwo kommt es mehr auf eine gute Abschirmung und Masseführung an.

Leider widersprechen sich an dieser Stelle die Forderungen nach elektrischer Sicherheit und Störungsarmut: Bei einer direkten Verbindung eines über das c't-Lab-Gehäuse schutzgeerdeten ACV-Moduls mit dem ebenfalls schutzgeerdeten PC wird zwangsläufig eine Brummschleife entstehen. Man kann die induzierte Brummspannung zwar durch Anschließen an eine gemeinsame Steckdosenleiste minimieren, optimal ist aber erst eine potenzialgetrennte Digital-Verbindung über SPDIF, wie sie unser ADC-Zusatz ermöglicht. Alternativ wäre der Einsatz eines Audio-Trennübertragers denkbar, der dann aber von exzellenter Qualität sein muss und von Netztransformatoren und dergleichen fernzuhalten ist.

## Eingestellt

Der Aufbau der Schaltung sollte mit der Fertigplatine nach so vielen c't-Lab-Beiträgen keine Schwierigkeiten mehr bereiten; voraussichtlich wird Segor ([**www.segor.de [2]**](https://www.segor.de/)) aber wieder Bauteilesätze mit aufgelöteten SMD-Chips anbieten.

Vor dem Einbau der (hoffentlich funktionierenden) Schaltung in ein Gehäuse haben die Schaltungsdesigner den Abgleich gesetzt. Pro Kanal gibt es zwei Abgleichpunkte: die Trimmkondensatoren C37 und C38 zur Frequenzkompensation in der -20-dB-Stellung und die Trimmpotis R58 und R59 zum Festlegen des Regelumfangs der Gain-Potis. Die ist deshalb nötig, weil Potentiometer gemeinhin deutlich größere Toleranzen aufweisen als Metallfilm-Festwiderstände. C37 und C38 werden kanalweise mit einer 1-kHz-Rechteckschwingung (z. B. vom DDS-Modul, Pegel ca. 5 Vss) abgeglichen, und zwar so, dass in der -20-dB-Stufe ein möglichst gerades, horizontales „Dach“ am Ausgang erscheint (mit Oszilloskop kontrollieren). R58 und R59 werden so eingestellt, dass sich in der linken Endstellung der Gain-Potentiometer eine Abschwächung von genau -10 dB gegenüber der rechten Endstellung ergibt (Eingangssignal 0 dBm = 775 mV, Verstärkungsstufe 0 dB). Hier empfiehlt sich als Hilfsmittel das LabVIEW-Programm „SC-SpectrumAnalyzer.vi“ (auf [**c't-Lab-Projekte bei Segor [3]**](https://www.segor.de/INFO/ct-lab-projekte.shtml)), das auch eine genaue Pegelanzeige bereithält.

![[vermessener-klang-291360-05.jpeg]]

*Der Bestückungsplan zeigt den Vollausbau des ACV-Moduls mit Controller und True-RMS-Gleichrichter. Letztere sind als SMD-Bauteile - noch dazu als besonders kleine - zuerst zu bestücken, ein Nachrüsten ist durch die umliegenden hohen Bauteile etwas diffizil.*

Bei Verwendung der oben erwähnten Audio-Karte Audiophile 2496 (wie auch bei allen Karten mit US-Studiopegel) ergibt sich bei 0 dBm Ausgangsspannung eine Aussteuerung von -4 dB vom Skalenendwert (Übersteuerungsgrenze). Im LabVIEW-Programm „SC-SpectrumAnalyzer.vi“ kann man dann die Anzeige mit dem „Calibration“-Knopf auf 0 dB bringen, damit verbleiben +4 dB als „Headroom“. Für Recording-Zwecke wäre das äußerst knapp bemessen; hier aber soll der A/D-Wandler der Audio-Karte mit stationären Sinus-Signalen ja möglichst gut ausgesteuert werden, eine Übersteuerungskontrolle kann schließlich jederzeit im Oszillogramm-Fenster erfolgen. Übrigens ist der für Messzwecke ausgelegte True-RMS-Konverter nur bedingt als Aussteuerungsanzeige im Recording-Betrieb zu gebrauchen - kurzzeitige Impulsspitzen, die zu einer Übersteuerung führen, nimmt er nicht wahr. Die Trägheit der Anzeige lässt sich (auf Kosten der Genauigkeit bei tiefen Frequenzen) mindern, wenn man C15 und C16 mit 1µF/35V sowie C8 und C9 mit 100n dimensioniert.

Zum Schluss noch ein gut gemeinter Hinweis: Unser Vorverstärker soll dem gemessenen Signal nichts entnehmen und nichts hinzufügen, klingt aber eigentlich auch nach nichts. Versuchen Sie jedoch niemals, mit einem High-End-Fanatiker über die „Unhörbarkeit“ messtechnisch einwandfreier Elektronik [1] zu diskutieren. Leute dieses Schlages pinseln zur Klangverbesserung feinstofflich wirksame Geigenlacke auf ihre Verstärker-Platinen und geben fröhlich 400 Euro (um mal etwas Konsumkritik zu üben: ein Hartz-IV-Monatssatz oder ein indisches Jahreseinkommen!) für 80 cm SPDIF-Koaxkabel einer japanischen Edelklitsche aus [2], das laut eines „Tests“ besonders seidig klingende Einsen und Nullen überträgt.

Literatur

[1] The Audio Critic, [**The Ten Biggest Lies in Audio [4]**](https://www.theaudioinsights.com/downloads/article_1.pdf)

[2] [**Lüge und Wahrheit [5]**](https://www.hifiaktiv.at/luege-und-wahrheit/)

## Stückliste manuelle Bedienung

### Halbleiter

| ID          | Type                                   |
| ----------- | -------------------------------------- |
| U5          | DG409, DG509                           |
| U6          | NE5532, OP2751, OPA 26041, OPA21341   |
| U7          | DG419                                  |
| U8          | LF412A, OP2751, OPA26041, OPA21341    |
| U9          | DG419                                  |
| D1...D10, D15 | 1N4848                               |
| Q1..5       | BC547B                                 |

### Passive Bauteile

| ID                    | Type                          |
| --------------------- | ----------------------------- |
| C7                    | 10µ 25V Tantal                |
| C13, 18               | 4µ7 25V Tantal                |
| C19, 21               | 1000µ 25V                     |
| C20, 22               | 10µ 63V RM15/22,5/27,5        |
| C23, 25, 29, 30       | 10p RM2,5                     |
| C24, 26               | 2µ2 50V MKT1                  |
| C27, 28, 35, 36       | 100n ker. RM5                 |
| C31, 32               | 470n 250V RM15/22,5           |
| C33, 34               | 220p RM5                      |
| C37, 38               | 2..30p Trimm-C RM5x5          |
| C14, 17               | 220n MKT RM5                  |
| R20, 21, 23, 2        | 4k7                           |
| R10                   | 0R (Drahtbrücke)              |
| R13, 18               | 10R                           |
| R14...17, 42, 43      | 10k                           |
| R22, 25               | 360R1                         |
| R26, 27, 32, 33       | 11k1                          |
| R28, 29, 54, 56       | 10k1                          |
| R30, 31, 52, 53       | 15k1                          |
| R34, 35               | 5k11                          |
| R36, 37, 44, 51       | 75k1                          |
| R38, 39               | 220k                          |
| R40, 41               | 100R                          |
| R45, 50               | 100k1                         |
| R46, 49               | 150k1                         |
| R47, 48               | 750k1                         |
| R55, 57               | 3k9                           |
| R58, 59               | 2k Präz-Trimmer W64           |
| L2                    | 10µH axial                    |
| P1, 2                 | 10k lin. Poti 4mm             |

### Sonstiges

| ID           | Type |
| ------------ | ---- |
| PL2          | Platinen-Steckverbinder 2pol. |
| PL8          | Platinen-Steckverbinder 8pol. |
| PL9          | Platinen-Steckverbinder 4pol. |
| PL10, 11, 12 | Platinen-Steckverbinder 3pol. |
| PL13, 14     | Cinch-Buchsen Print, Mono |
| SW1, 2       | Reed-Relais 1pol. um 5V, Hamlin 721C05, Günther 3565-1231-051 o. ä. |
| UA1          | DC-DC Wandler 5V in, 2x12V out, 2W Inline |
| S1           | Stufenschalter 1x12polig Platine ACV (eMedia, Segor) |

alle Widerstände 1 Prozent Metallfilm

1 siehe Text

## Stückliste c't-Lab-Einsatz

### Halbleiter

| ID      | Type                                   |
| ------- | -------------------------------------- |
| U1      | 6N137                                  |
| U2      | ATmega168-20PU DIL                     |
| U3, 4   | LTC1967 SMD                            |
| U5      | DG409, DG509                           |
| U6      | NE5532, OP2751, OPA 26041, OPA21341   |
| U7      | DG419                                  |
| U8      | LF412A, OP2751, OPA26041, OPA21341    |
| U9      | DG419                                  |
| D11...D15 | 1N4848                               |
| LED1    | LED 3mm rot                            |
| Q1..5   | BC547B                                 |

### Passive Bauteile

| ID                    | Type                          |
| --------------------- | ----------------------------- |
| C1, 4, 11             | 100n ker. RM5                 |
| C10                   | 4µ 25V Tantal                 |
| C15, 16               | 2µ2 35V Tantal                |
| C19, 21               | 1000µ 25V                     |
| C2, 3                 | 22pF RM2,5                    |
| C5, 12                | 100n SMD1206                  |
| C20, 22               | 10µ 63V                       |
| C23, 25, 29, 30       | 10p RM2,5                     |
| C24, 26               | 2µ2 50V MKT RM5               |
| C27, 28, 35, 36       | 100n ker. RM5                 |
| C31, 32               | 470n 250V RM15/22,5           |
| C33, 34               | 220p RM5                      |
| C37, 38               | 2..30p Trimm-C RM5x5          |
| C8, 9, 14, 17         | 220n MKT1 RM5                 |
| R1, 2                 | 220R                          |
| R3                    | 470R                          |
| R4, 19                | 2k7                           |
| R5, 6, 11, 12         | 10k SMD0805                   |
| R7, 8                 | 100k                          |
| R9, 20, 21, 23, 24    | 4k7                           |
| R10                   | 0R (Drahtbrücke)              |
| R14...17, 42, 43      | 10k                           |
| R22, 25               | 360R1                         |
| R26, 27, 32, 33       | 11k1                          |
| R28, 29, 54, 56       | 10k1                          |
| R30, 31, 52, 53       | 15k1                          |
| R34, 35               | 5k11                          |
| R36, 37, 44, 51       | 75k1                          |
| R38, 39               | 220k                          |
| R40, 41               | 100R                          |
| R45, 50               | 100k1                         |
| R46, 49               | 150k1                         |
| R47, 48               | 750k1                         |
| R55, 57               | 3k9                           |
| R58, 59               | 2k Präz-Trimmer W64           |
| L1                    | 100µH axial                   |
| L2                    | 10µH axial                    |
| P1, 2                 | 10k lin. Poti 4mm             |
| XTAL1                 | 16MHz HC-49U                  |

### Sonstiges

| ID           | Type |
| ------------ | ---- |
| JP1...5      | Jumper 2pol. |
| PL1          | Wannen-Pfostenverbinder 14pol. |
| PL2          | Platinen-Steckverbinder 2pol. |
| PL3, 4, 5, 7 | Wannen-Pfostenverbinder 10pol. |
| PL6          | Wannen-Pfostenverbinder 16pol. |
| PL9          | Platinen-Steckverbinder 4pol. |
| PL10, 11, 12 | Platinen-Steckverbinder 3pol. |
| PL13, 14     | Cinch-Buchsen Print, Mono |
| SW1, 2       | Reed-Relais 1pol. um 5V, Hamlin 721C05, Günther 3565-1231-051 o. ä. Platine ACV (eMedia, Segor) |

alle Widerstände 1 Prozent Metallfilm

1siehe Text

RSPEAK_STOP

RSPEAK_START

**URL dieses Artikels:**

`https://www.heise.de/-291360`

**Links in diesem Artikel:**

1. https://www.segor.de/INFO/ct-lab-projekte.shtml
2. https://www.segor.de/
3. https://www.segor.de/INFO/ct-lab-projekte.shtml
4. https://www.theaudioinsights.com/downloads/article_1.pdf
5. https://www.hifiaktiv.at/luege-und-wahrheit/

*Copyright © 2007 Heise Medien*
