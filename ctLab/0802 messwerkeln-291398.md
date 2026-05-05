---
title: DIV (Multimeter)
---
# Messwerkeln

Source: [https://www.heise.de/ratgeber/Messwerkeln-291398.html](https://www.heise.de/ratgeber/Messwerkeln-291398.html)
Print view: [https://www.heise.de/ratgeber/Messwerkeln-291398.html?seite=all&view=print](https://www.heise.de/ratgeber/Messwerkeln-291398.html?seite=all&view=print)
Author: Heinrich Willecke, Carsten Meyer
Series references: c't 02/08, S. 170

> Nicht nur die höhere Genauigkeit unterscheidet ein labortaugliches Instrument von einem Handmultimeter aus dem Elektronik-Supermarkt: Ersteres muss langzeitstabil, fernsteuer- und kalibrierbar sein, während die „Beweglichkeit“ eher in den Hintergrund tritt. Unser DIV getauftes Modul soll denn auch nicht den Werkzeugkoffer, sondern das c't-Lab-Rack sinnvoll erweitern.

Hundertmal genauer als ein typisches 10-Euro-Multimeter, aber nur zehnmal so teuer - das waren unsere Zielsetzungen beim DIV-Schaltungsdesign. Unser Modul sollte bezüglich seiner Auflösung, Genauigkeit und Konstanz schon an die renommierte Konkurrenz von Fluke, Agilent und Keithley heranreichen, ohne gleich Hunderte oder Tausende von Euro zu kosten. Im Pflichtenheft stand auch, dass es wie die Tischgeräte der erwähnten Hersteller vollständig fernsteuer- und fernabfragbar zu sein hat, hier natürlich mit der einfach erlernbaren und über alle Module konsistenten c't-Lab-Syntax, ebenso sollte die Potentialtrennung aller Module untereinander und zum steuernden Rechner gewährleistet sein.

Das preisliche Limit ließ sich indes nur durch Abspecken auf die wesentlichen Funktionen eines Digitalvoltmeters erreichen: das Messen von Gleich- und Wechselspannungen natürlich. Als einzigen Luxus gönnten wir der Karte sechs Strom-Messbereiche, hier immerhin mit der Möglichkeit, auch sehr kleine Gleich- und Wechselströme im Mikroampere-Bereich bei geringem Spannungsabfall (max. 250 mV) messen zu können. Ein Aufsatz-Modul für Widerstandsmessungen ließe sich nachrüsten, was wir an dieser Stelle aber nicht voreilig versprechen wollen. Schon vorhanden ist auf jeden Fall ein Trigger-Eingang, der bei automatisierten Messungen gute Dienste leistet: Bei einer (einstellbar steigenden oder fallenden) Flanke am Eingang und entsprechend gesetzter Trigger-Maske liefert das DIV-Modul auch ohne explizite Anfrage seine Messwerte an den Rechner.

Wie alle c't-Lab-Module wird das DIV auf einer Euro-Karte aufgebaut. c't-Lab-Kenner werden die typischen internen Anschlüsse gleich wiedererkennen: den Stromversorgungs-Steckverbinder (aufgrund der Potentialtrennung benötigt DIV eine eigene Stromversorgung, etwa ein „halbes“ PS3-2-Netzteilmodul) und die Kommunikationsanschlüsse des optoelektronisch isolierten, seriellen Bussystems. Ganz allein ist das DIV also nicht sinnvoll einsetzbar - es benötigt immer eine (ggf. mit anderen c't-Lab-Modulen gemeinsam genutzte) IFP-Karte zur Kommunikation mit dem PC und einen freien Netzteil-Anschluss im c't-Lab. Trotzdem lässt sich DIV durch ein anschließbares LCD-Panel PM8 auch ohne Rechner-Unterstützung betreiben. Am Panel lassen sich grundlegende Einstellungen (Messbereich) vornehmen, außerdem zeigt es natürlich den aktuellen Messwert sechsstellig an - unabhängig vom Rechner oder einer Triggerung.

## Gesundschrumpfen

Gegenüber der ersten Ankündigung in c't 10/2007 haben sich einige technische Details geändert, was teils auf Sicherheitsbedenken, teils auf die mangelnde Bauteile-Verfügbarkeit und die damit verbundene Nachbausicherheit zurückzuführen ist. Die maximale Eingangsspannung wurde auf 250 V begrenzt, womit teure Hochspannungs-Relais entfallen können; außerdem war uns beim Gedanken, dass Leser 1 kV auf einen „offenen“ Nachbau loslassen könnten, nicht sehr wohl. Durch die Stufung 250 mV, 2,5 V, 25 V und 250 V konnten wir einen teuren programmierbaren Instrumentierungsverstärker (ursprünglich vorgesehen: PGA202) sparen, seine Aufgabe übernimmt jetzt ein einfacher Operationsverstärker mit 1- oder 10-facher Verstärkung.

Der Eingangswiderstand der Gleichspannungsbereiche liegt bei „knapp unendlich“ in den 250-mV- und 2,5-V-Stufen und sonst bei 10 MΩ. In den Wechselspannungsbereichen beträgt die Eingangsimpedanz 1 MΩ/30pF, während die Strombereiche so ausgelegt sind, dass der Spannungsabfall am DIV-Eingang (auch in den Wechselstrombereichen!) maximal 250 mV beträgt. Dass der unterste Spannungsbereich statt 100 mV nun 250 mV für den „Vollausschlag“ benötigt, ist kein wirklicher Nachteil; einerseits ist die Wandler-Auflösung genügend hoch, und andererseits misst man bei so kleinen Spannungen viel „Mist“ mit - will heißen: parasitäre Thermospannungen, die durchaus in der Größenordnung einiger 10 µV liegen können.

Um gleich beim Thema zu bleiben: Die unteren der 24 Bits fluktuieren im empfindlichsten Messbereich schon heftig, wenn man die Karte oder das Messkabel nur im Erdmagnetfeld bewegt (Induktion) oder die eine Messspitze etwas wärmer ist als die andere (Thermospannung). Von den 24 Bit des verwendeten A/D-Wandlers LTC2400 sind demzufolge nur etwa 18 bis 20 Bit effektiv nutzbar. Das letztwertige der 24 Auflösungs-Bits repräsentiert im 2,5-V-Bereich eine Spannung von nur noch 150 nV - ein unglaublich kleiner Spannungsschritt. Zum Vergleich: Wenn Sie Ihre Messspitzen an das Messobjekt halten und jemand schaut Ihnen plötzlich über die Schulter, wird die thermische Strahlung der zweiten Person die parasitäre (und mitgemessene) Thermospannung an den Messspitzen um fast den gleichen Betrag ändern.

## Aufwand und Nutzen

Nicht umsonst betreibt die Physikalisch-technische Bundesanstalt in Braunschweig einen geradezu abenteuerlichen Aufwand (z. B. mit supraleitenden Josephson-Kontakten und Kelvin-Varley-Teilerketten im temperierten Ölbad), wenn es darum geht, Spannungen im Sub-Mikrovolt-Bereich reproduzierbar darzustellen oder gar zu messen. Messgeräte mit ppm-Genauigkeit zu bauen erfordert gemeinhin mehr Erfahrung als technisches Wissen. Viele der in Laborstandards verbauten Techniken, die oft genug an Hexenwerk erinnern, kommen für den Nachbauer auch gar nicht in Frage. Wer will schon Kupferdrähte verschweißen oder mit giftigem Cadmium-legierten Lötzinn arbeiten, damit an den Löt- und Verbindungsstellen keine parasitären Thermospannungen entstehen? Wo bekommt man als Normalsterblicher thermoelektrisch inaktive Steckverbinder her, und wie schirmt man den Laborraum gegen Störfelder ab?

Verabschieden Sie sich also schnell von der Vorstellung, die eher theoretische Auflösung des 24-Bit-Wandlers unbedingt ausnutzen zu wollen (was nebenbei gesagt aus genannten Gründen auch für die gesamte Digital-Audio-Technik gilt). Die fünfeinhalb bis sechs Dezimalstellen Auflösung, die unser DIV liefert, reichen selbst für anspruchsvollere Labor-Anwendungen. Wenn Sie zum Beispiel am einen Ende einer kurzen Leiterbahn 1,99653 V und am anderen Ende 1,99611 V gegenüber Masse-Bezugspotential messen, wissen Sie schon mal, in welche Richtung der Strom zu einem 10-kΩ-Widerstand fließt. Das ist doch auch schon mal etwas.

## Verschiedene Wege

Unsere Schaltung arbeitet, je nachdem ob Gleich- oder Wechselspannungen gemessen werden sollen, mit zwei völlig getrennten Messverstärkern. Strommessungen stellen im Prinzip nur einen Sonderfall der Spannungsmessung dar - gemessen wird dann der Spannungsabfall an einem niederohmigen „Shunt“. Zunächst zu den Gleichspannungs-Messbereichen: Die zu messende Spannung gelangt über eine Feinsicherung und einem nach Masse geschalteten Überspannungsableiter (Spitzenspannung 350 V) zu einem Relais-geschalteten, passiven Vorteiler, der die Eingangsspannung gegebenenfalls auf einen vom Wandler verarbeitbaren Wert (max. 2,5 V) absenkt. In den Bereichen 250 mV und 2,5 V bleibt der Spannungsteiler ausgeschaltet und belastet demnach auch nicht das Messobjekt; der Eingangswiderstand wird hier nur vom folgenden FET-Operationsverstärker U6 bestimmt, er beträgt einige GΩ. Zwei als leckstromarme Dioden geschaltete Transistoren verhindern Überspannungen am Eingang. Im 250-mV-Bereich verstärkt der Operationsverstärker 10-fach, ansonsten ist er als Spannungsfolger geschaltet (1-fache Verstärkung). Die je nach Bereich verstärkte, unbehandelte oder heruntergeteilte Spannung gelangt dann zu einem einfachen Widerstandsnetzwerk, das eine Offsetspannung in Höhe der halben Wandler-Referenzspannung (2,5 V) hinzufügt und die Messspannung nebenbei durch zwei teilt. Der A/D-Wandler kann nämlich nur positive Eingangsspannungen verarbeiten, deshalb muss die Messspannung auf einen virtuellen Nullpunkt in Höhe des halben Aussteuerungsbereichs angehoben werden. Der Nullpunkt-Offset wird später von der Controller-Firmware wieder softwaremäßig abgezogen.

Noch ein Wort zum OpAmp: Einer der besten und genauesten OpAmps am Markt ist der OPA627 von Burr-Brown, der in der Schaltung durchaus eingesetzt werden kann. Seinen teuer erkauften (hier im wahren Wortsinn) größten Trumpf kann der OPA627 allerdings gar nicht so richtig ausspielen, nämlich sein schnelles Einschwingverhalten - was ihn eher für Approxiomationswandler prädestiniert. In unserer Schaltung haben wir auch mit dem LF411 oder dem AD711 ähnlich gute Ergebnisse erzielt; mit dem überall erhältlichen und preiswerten LF411 können Sie nichts falsch machen. Sollte seine Offset-Fehlerspannung am Ausgang (U6 Pin 6) bei 0 V Eingang und 10-facher Verstärkung einige zig mV überschreiten, spendieren Sie ihm den (sonst überflüssigen) Offset-Einsteller R13 (im 2,5-A-Strombereich DC mit offenen Eingängen auf minimale Ausgangsspannung an Pin 6 abgleichen).

Die Relais im Eingangs-Umschalter vertragen keine höheren Ströme als 3 A. Der 2,5-A-Shunt R34 ist deshalb auf zusätzliche Anschlüsse geführt, womit auch Ströme deutlich über 2,5 A möglich werden (zumindest kurzzeitig). Auf jeden Fall haben Sie die Option, R34 durch einen (noch) niedrigeren Wert (z. B. 10 mΩ) zu ersetzen, falls Ströme im zweistelligen Ampere-Bereich zu messen sind; die Skalierungs-Parameter sind hinreichend flexibel, für den externen Eingang steht ein eigener Parameter-Satz zur Verfügung.

Wechselspannungen und -ströme gehen einen völlig anderen Weg: Ein Relais schaltet sie auf den Eingang des (optional montierbaren) True-RMS-Wandlers TRMSC, der schon beim DDS-Modul zum Messen von Audio-Niederfrequenzen zum Einsatz kam (c't 15/07, S. 188), Funktionsbeschreibung siehe dort). Das TRMSC-Modul bietet ebenfalls vier Eingangsspannungsbereiche, arbeitet aber mit einer völlig anders aufgebauten Eingangsstufe, die ohne jedes Relais auskommt. Es verarbeitet Frequenzen im gesamten Audio-Bereich, die spätere Kalibrierung kann deshalb mit 50 Hz genauso gut wie mit 1 kHz erfolgen. Damit das TRMSC-Modul die richtigen Ausgangsspannungen (2,5 Veff AC = 2,5 V DC) liefert, sind gegenüber dem Einsatz auf dem DDS-Modul einige Widerstandswerte zu ändern (siehe [ Zusatz-Stückliste]). Die TRMSC-Originalbestückung liefert bei den DIV-Skalenendwerten zu hohe Gleichspannungen.

Die Gleich- und Wechsel*strom*-Bereiche verwenden dieselben Shunt-Widerstände (R34, 35 und 38). Damit R34 und 35 im Überlastfall nicht in Rauch aufgehen, sind ihnen vier dicke Dioden antiparallel geschaltet, die bei Spannungen über 1,2 V leitend werden. Bei zu hohen Strömen wird schließlich die flinke Feinsicherung durchbrennen (oder die gemessene Schaltung). Bei der niedrigen Messspannung von maximal 250 mV (für Strommessungen werden sowohl AC- als auch DC-Verstärker auf 10-fache Verstärkung geschaltet) an den Shunts stören sie das Messergebnis normalerweise nicht. Wenn impulsartige Wechselströme mit sehr hohem Crest-Faktor gemessen werden sollen, können die Dioden aber doch den Messwert beeinflussen; notfalls können Sie sie ganz weglassen, allerdings mit dem Nachteil eines fehlenden Schutzes für die Shunts. Die Sicherung sollte für die Absicherung von Multimetern ausgelegt sein, solche (nicht ganz billigen) Typen weisen ein hohes Abschaltvermögen und ein schnelles Ansprechverhalten auf.

## Messlatte

Ein Digitalvoltmeter kann nicht besser sein als seine Referenz - stimmt deren Spannung nicht oder ist sie unkonstant, wird auch das Messergebnis entsprechend abweichen. Als Referenzquelle dient unserem DIV entweder der schon von der AD16-8-Karte bekannte LT1019 oder eine etwas aufwendigere, aber driftärmere Schaltung aus einer hochstabilen Zenerdiode mit temperaturgeregelter Selbst-Beheizung (U8, LM399) und nachfolgendem, feinjustierbarem Buffer (U5, OP-27). Pflegeleichter ist die integrierte Lösung mit dem LT1019; nur bei höheren zu erwartenden Temperaturunterschieden im Betrieb ist die „diskrete“ Schaltung mit dem LM399 vorzuziehen. Sie verlangt einen einmaligen Abgleich: Trimmer R17 so einstellen, dass an TP1 (Pin 6 von U5) 2,50 V anliegen. Der genaue Wert ist hier nicht allzu kritisch, da die Kalibrierung der Gesamtschaltung später per Software erfolgt. Aus diesem Grund haben wir auch auf eine Trimmung des LT1019 verzichtet.

Der LM399 weist zwar eine äußerst geringe Temperatur- und Langzeit-Drift auf, seine Ausgangsspannung (rund 7 V) ist aber absolut gesehen wenig genau. Sollte der Einstellbereich von R17 nicht ausreichen, um auf eine Referenzspannung von 2,5 V an TP1 zu kommen, muss R18 einen E24-Schritt kleiner oder größer gewählt werden (910 oder 750 Ω). Die größte Stabilität ergibt sich, wenn man den Wert von R17 nach erfolgter Einstellung ausmisst und R17 dann durch einen Festwiderstand (ggf. kombiniert aus zwei Widerständen in Reihe) ersetzt. Wegen der späteren Software-Kalibrierung sind leichte Abweichungen (möglichst nach oben) nicht kritisch. Natürlich darf nur eine der vorgeschlagenen Varianten bestückt werden (entweder U3 oder U5 plus U8).

## Magie in Silizium

Der A/D-Wandler LTC2400 stellt immer noch ein faszinierendes Stück Technik dar, obwohl er schon über acht Jahre am Markt ist. Er arbeitet mit einem Delta-Sigma-Modulator dritter Ordnung, ähnlich wie die Wandler aus der Digital-Audio-Technik. Das Verfahren bietet für den hiesigen Anwendungsfall gegenüber den früher verwendeten Dual-Slope- oder Approximationswandlern große Vorteile: Es ist schneller und in integrierter Form auch genauer als das über eine Zeitmessung arbeitende Dual-Slope-Verfahren (zum Beispiel im DVM-Klassiker ICL7106), aber fast genauso unempfindlich gegenüber Störungen auf dem Eingangssignal (zum Beispiel Netzbrumm). Und es benötigt keine aufwendige Filter- und Sample/Hold-Schaltungen wie die gegenüber kurzen Störungen sehr anfälligen Approximationswandler.

Der LTC2400 unterdrückt mit seinem Wandlungsprinzip und einem zusätzlich eingebauten digitalen FIR-Filter Netzbrumm und dessen Oberwellen mit über 110 dB, ebenso höhere Frequenzen. Symmetrische Störungen (auch das Rauschen) auf dem Eingangssignal machen sich im Messergebnis deshalb kaum bis gar nicht bemerkbar: Alle Störungen innerhalb einer Messperiode (0,166 Sekunden) werden wie bei einem analogen Instrument praktisch wegintegriert. Das „Frontend“ kann also relativ einfach gehalten werden, wie in der vorliegenden Schaltung.

Trotzdem sind beim Einsatz des LTC2400 einige Dinge zu beachten, denen wir mit dem Layout und dem Schaltungsdesign Rechnung getragen haben. Sein Eingang verträgt zwar durchaus Quellwiderstände von einigen kOhm, ist aber dann sehr empfindlich gegenüber (auch parasitären) Kapazitäten. Grund: Der geschaltete interne Kondensator am Eingang des Bausteins würde eine hier vorhandene Kapazität, die man vielleicht sogar wohlmeinend zur Störunterdrückung vorgesehen hat, während der Wandlungsperiode aufladen - was den Messwert verfälscht. Schon einige pF am Eingang wirken sich negativ auf die Genauigkeit aus, wenn die Quellimpedanz ein paar hundert Ohm überschreitet.

Andererseits mussten wir hier einen Schutzwiderstand vorsehen, damit der Eingang nicht bei versehentlich angelegten zu hohen Spannungen zerstört wird. Im Layout werden Sie den Schutzwiderstand R23 deshalb in kapazitätsarmer SMD-Ausführung wiederfinden, so nah wie möglich am Baustein platziert. Die Abblock-Kondensatoren C12 und C13 sind ebenfalls als SMD-Bauteile ausgeführt, weil sie nur so besonders induktionsarm angekoppelt werden können. Störungen, die Überschwinger auf den Steuerleitungen verursachen könnten, unterdrücken die Serienwiderstände R9 bis R11. Große Masseflächen um und unter dem LTC2400 sorgen für ein stabiles Bezugspotential - schließlich hat der Baustein nur einen gemeinsamen Masseanschluss für seinen Analog- und Digitalteil.

## Zugeschaut und mitgebaut

Der Baustein im SO-8-Gehäuse und die wenigen SMD-Bauteile in seiner Nähe können durchaus von Hand eingelötet werden. Verwenden Sie für alle Beinchen das gleiche Lötzinn, und säubern sie alle Lötstellen (auch drumherum) sorgfältig mit Aceton. Flussmittelreste haben nicht selten merkwürdige elektrische Eigenschaften, die sich im vielstelligen Nachkomma-Bereich schon deutlich auswirken können. Bei sorgfältigem Aufbau erreicht der LTC2400 ohne Weiteres eine Linearität „über alles“ besser 4 ppm (0,0004 Prozent) bei einem „Eigenrauschen“ (Fluktuieren des Messwerts) von weniger als 0,5 ppm - das ergibt rund 20 stabile Bits.

Einige Punkte zum Aufbau haben wir bereits oben gestreift, und wer schon ein c't-Lab-Modul erfolgreich vollendet hat, sollte auch mit der vorliegenden Schaltung wenig Probleme haben. Besonderes Augenmerk verdienen hier allerdings die Lötstellen um den Eingangsspannungsteiler: Sauberkeit ist hier - wie schon beim Wandler selbst - das höchste Gebot. Schon ein Fingerabdruck auf der Platine in der Nähe des Vorteilers kann sich negativ auf die Messgenauigkeit auswirken. Borstenpinsel, Baumwoll-Lappen und etwas Aceton helfen dagegen.

Ist die Platine komplett bestückt, kann nach dem Flashen der [**Firmware**](https://www.heise.de/hintergrund/c-t-Lab-Bausteine-zum-Messen-Steuern-und-Regeln-284113.html) ein erster Funktionstest erfolgen (beides ohne aufgesetztes TRMSC-Modul). Beim allerersten Start führt die DIV-Firmware zunächst eine Offset-Grundkalibrierung durch, die etwa 20 Sekunden dauert - erkennbar am hörbaren Klickern der Relais und der Anzeige „OFS init“, wenn ein PM8-Panel angeschlossen ist. Die Offset-Grundkalibrierung (die eine spätere genaue Einstellung nicht ersetzen soll) kann jederzeit erzwungen werden, wenn man den Drehgeber-Knopf am Bedienpanel beim Einschalten einige Sekunden gedrückt hält.

Als Default-Messbereich ist „2,5 V DC“ eingestellt, mit diesem sollten Sie auch den Abgleich beginnen - aber erst die Schaltung eine Viertelstunde warmlaufen lassen. Wenn Sie den DIV-Eingang mit einer Drahtbrücke kurzschließen, sollte auch die PM8-Anzeige auf einen Wert sehr nahe Null zurückgehen (oder die im LabVIEW-Programm DIV-Abgleich.vi angezeigte Zahl). Mit DIV-Abgleich.vi gestaltet sich der Offset- und Skalenfaktor-Abgleich relativ einfach - analog zum Verfahren, dass wir schon bei der [AD16-8-Steckkarte für ADA-IO](https://www.heise.de/ratgeber/Modulbaukasten-291034.html) beschrieben haben (c't 13/07, S. 202). Möglicherweise stimmen die mit der Offset-Initialisierung gesetzten Offset-Werte der einzelnen DC-Messbereiche schon recht genau und verlangen nur minimale Korrekturen. Einen Anzeige-Wert von exakt Null werden sie wegen der immer auftretenden Thermospannungen und der OpAmp-Drift nicht erreichen, einige µV sind durchaus zulässig.

## Henne und Ei

Der Skalenfaktor-Abgleich ist etwas aufwendiger: Sie benötigen hierfür eigentlich einen Multimeter-Kalibrator, es geht aber auch mit einer hochstabilen, einstellbaren Spannungsquelle (wie das DCG-Modul) zusammen mit einem möglichst frisch kalibrierten Digitalvoltmeter als Vergleichs-Referenz. Zur Not tut es auch ein D/A-Wandlerkanal der DA12-8-Karte, allerdings liefert der ja nur Spannungen bis 10 V. Anzustreben ist aber in jedem Messbereich eine Kalibrierung auf die Bereichs-Obergrenze, kurz bevor DIV ein Overload (OVRLOAD auf der PM8-Anzeige, rote „Warnlampe“ beim DIV-Abgleichprogramm) liefert - etwa bei 240 mV, 2,4 V, 24 V und 240 V. Letztere Spannung lässt sich aber ohne üppige Messlabor-Ausstattung kaum vernünftig darstellen; entweder nehmen Sie hier den gleichen Skalenfaktor wie im 2,5-V-Bereich und verlassen sich auf die Genauigkeit des Eingangs-Spannungsteilers (engere Toleranzen als 0,1 Prozent sind allerdings sehr teuer und schwer zu bekommen) oder Sie kalibrieren hier mit der höchsten Ihnen zur Verfügung stehenden Gleichspannung (z. B. 60 V von zwei in Reihe geschalteten DCG) und verzichten auf das letzte Quäntchen Genauigkeit beim Skalenendwert.

Mit einem DCG als Abgleich-Hilfsmittel sollte auch die Kalibrierung der DC-Strombereiche 250 µA bis 2,5 A rasch gelingen. Die Einstellung im unteren Bereich wird durch Serienschaltung eines Widerstandes (10 kΩ in Serie zum Referenz-Multimeter und zum DIV) erleichtert; man stellt dann die Spannung am DCG oder Labornetzteil so ein, dass sich ein Strom von 240 µA durch die Reihenschaltung ergibt. Wie beim Spannungs-Abgleich ist die absolute Höhe des Wertes nicht entscheidend, sondern die gleiche Anzeige von Referenz-Multimeter und DIV.

![[messwerkeln-291398-01.jpeg]]

*Die DIV-Platine ist recht einfach zu bestücken, beste Ergebnisse werden aber nur mit sorgfältiger Arbeit und peinlicher (Lötstellen-)Sauberkeit erreicht. Beachten Sie die Hinweise im Text zu den Referenzspannungs-Optionen.*

Etwas kniffliger ist allerdings der AC-Abgleich: Spannungen bis 8 Veff kann zwar das DDS-Modul erzeugen, darüber hinaus und für die AC-Strombereiche kommt für die meisten Anwender wohl aber nur ein Netztrafo mit geeigneter oder regelbarer Ausgangsspannung in Frage (z. B. Märklin-Modellbahntrafo) - wobei zu beachten ist, dass die Netzwechselspannung auch kurzfristig recht großen Schwankungen unterliegt, sodass man Referenz-Voltmeter und DIV gleichzeitig im Auge behalten muss. Vor der Software-Kalibrierung ist ein Vorabgleich der TRMSC-Verstärkung notwendig: Am DIV den „AC 2,5 V“-Bereich wählen (mit dem Befehl RNG=5! oder am Panel), dann 2,5 Veff Wechselspannung am DIV-Eingang anlegen, am besten geliefert vom DDS-Modul. Trimmer R6 so einstellen, dass sich an TP4 auf der TRMSC-Platine eine Gleichspannung von 2,500 V gegenüber Masse einstellt, ebenso R4 für die gleiche Spannung an TP5.

Der Messgleichrichter des TRMSC-Aufsatzes liefert unvermeidlicherweise auch ohne Eingangsspannung schon einige mV, abhängig vom Störpotential der Umgebung, seiner Abschirmung und dem Rauschen seines Hardware-Eingangsverstärkers. Dieses Grundrauschen durch Offset-Kompensation wegmogeln zu wollen ist keine so gute Idee, denn dann stimmt die ganze Skala nicht mehr. Die amtliche, recht zeitaufwendige Lösung besteht darin, den Messwert bei knapp „Vollausschlag“ und bei einer Eingangsspannung von etwa einem Zehntel des Messbereiches iterativ zu kalibrieren: Offset-Einstellung (natürlich nicht auf Null, sondern auf den Messwert) bei kleiner Eingangsspannung, Skalierung bei hoher Eingangsspannung innerhalb eines Bereiches, und das Ganze so lange wiederholen, bis beide Werte stimmen. Damit erübrigt sich auch die Hardware-Offset-Einstellung auf der TRMSC-Platine (R5). Beim 250-µA-Bereich greift man wieder zum Trick mit dem Vorwiderstand - hier am besten durch Messen der daran abfallenden Spannung mit dem Referenz-Multimeter (dessen paralleler Eingangswiderstand natürlich in die Stromberechnung über das Ohm’sche Gesetz mit einfließen muss). Abschließend sollten noch die schnellen Messbereiche mit 10 Bit Auflösung auf die gleiche Weise kalibriert werden, wobei man sich hier deutlich schneller an die optimalen Werte herantastet.

## Stunden später ...

Zugegeben ist der Abgleich mit dem TRMSC-Messgleichrichter nicht ganz einfach, aber die Mühe wird belohnt. Als Messkanäle bietet das DIV-Modul nicht nur die präzisen Werte vom 24-Bit-Wandler, sondern auch noch quasi parallel verarbeitete Werte des ATmega-internen Wandlers für überschlägige oder Trend-Messungen (VAL 10? und VAL 11?). Interessant dürfte dabei der AC-Peak-Kanal (VAL 11?, siehe auch Syntax-Tabelle unter „DIV“ sein, der für Audio-Messungen mit dynamischen Signalen (z. B. Aussteuerung) besser geeignet ist als der True-RMS-Kanal - weil er deutlich schneller auf Änderungen anspricht. Das prädestiniert ihn zum Beispiel für Frequenzgang-Messungen an Filtern und dergleichen in Verbindung mit dem DDS-Modul.

![[messwerkeln-291398-02.jpeg]]

*Vergleichsweise wenig Elektronik, aber viele Relais: Die DIV-Schaltung arbeitet mit einem 24-Bit-Wandler in Delta-Sigma-Technik. Der optionale True-RMS-Konverter wird an Steckverbinder M1 angeschlossen. Der 10A-Eingang ist nicht abgesichert und wird auch nicht über Relais geschaltet.*

Für allgemeine Messungen mit dem 24-Bit-Wandler stehen vier Kanäle zur Verfügung: VAL 0? bis VAL 2? stellen unterschiedliche Integrations-Level zur Verfügung (VAL 0? ohne, VAL 1 mit schneller, VAL 2? mit langsamer Messwert-Integration). VAL 3? wartet immer auf das Ende einer neuen Wandlung und benötigt deshalb rund 180 ms zur Ausführung. Auf das gegebenenfalls angeschlossene Panel gelangen immer die (stetig ermittelten) Werte der ersten Integrationsstufe (VAL 1?), womit sich eine ruhige, „analoge“ Anzeige ergibt.

Der Display-Integrationsmodus lässt sich übrigens (wie auch der Default-Messbereich) über eigene Parameter einstellen (nichtflüchtige Speicherung im EEPROM, siehe Syntax-Tabelle); DIV merkt sich den aktuellen Messbereich auch manuell, wenn man kurz auf den Drehgeber-Knopf drückt. Für Diagnose- und Kalibrierungszwecke kann man wie bei ADA-IO auch auf die Wandler-Rohdaten zugreifen, davon macht beispielsweise das DIV-Abgleichprogramm regen Gebrauch.

Noch zu erwähnen ist die Handhabung des Trigger-Eingangs: Hier kann beispielsweise ein Taster oder ein Schaltkontakt angeschlossen werden, der eine Messung auch ohne explizite Anfrage vom Rechner auslöst. Der Eingang ist TTL-kompatibel, die Schaltflanke lässt sich über die Trigger-Parameter (siehe DIV-Syntax) steuern. Mit der Triggermaske legt man fest, welche der Messkanäle bei Triggerung ausgegeben werden sollen, und wie bei ADA-IO gibt es auch einen Trigger-Timer für automatisch wiederholte Mess-Ausgaben in einem festen Zeitraster (TRT-Einstellung in Millisekunden).

## Stückliste DIV

### Halbleiter

| ID     | Type                        |
| ------ | --------------------------- |
| U1     | ATmega32 16MHz DIL         |
| U2     | 6N137                       |
| U3     | LT1019, REF-43 DIL         |
| U4     | LTC2400 SO8                |
| U5     | OP-27 DIL (siehe Text)     |
| U6     | LF411 DIL                  |
| U7     | DG419 DIL                  |
| U8     | LM399 (siehe Text)         |
| U9     | ULN2003 oder ULN2803 DIL   |
| Q1, 2  | BC547B                     |
| D1...D4 | 1N5401                    |
| LED1   | LED 3mm rot                |

### Passive Bauteile

| ID                 | Type                                |
| ------------------ | ----------------------------------- |
| C1, 2              | 22p RM2,5                           |
| C11                | 1n FKP RM5                          |
| C12, 13            | 220n SMD 1206                       |
| C14                | 1µ 63V MKT RM5                      |
| C16                | 10µ 25V Tantal                      |
| C17                | 470p 1000V RM5                      |
| C3, 4, 7, 9, 10    | 100n ker. RM5                       |
| C5, 6              | 4µ7 50V                             |
| C8                 | 47µ 10V Tantal                      |
| R1                 | 470R                                |
| R2, 3, 9, 10, 11   | 220R                                |
| R4, 7              | 4k7                                 |
| R5, 6              | 6R8                                 |
| R8, 21, 22, 31,32  | 10k                                 |
| R12, 14, 16, 24    | 2k7                                 |
| R13                | 10k Präz.-Trimmer W64 (siehe Text)  |
| R15, 28, 33        | 22k                                 |
| R17                | 200R Präz.-Trimmer W64              |
| R18                | 820R (siehe Text)                   |
| R19                | 10k 0,1%                            |
| R20                | 90k 0,1%                            |
| R23                | 4k7 SMD 0806                        |
| R25                | 0R Drahtbrücke                      |
| R26                | 20k 0,1%                            |
| R27                | 7k5                                 |
| R29, 30            | 1k 0,1%                             |
| R34                | 10R 2W 1%                           |
| R35                | 1k                                  |
| R36                | 100k 0,1%                           |
| R37                | 900k 0,1%                           |
| R38                | 0,1R 1%, Isabellenhütte RM20 oder RM27,5 |
| R39                | 9M 0,1%, RM20                       |
| L1                 | 100µH axial                         |

### Sonstiges

| ID      | Type                                                             |
| ------- | ---------------------------------------------------------------- |
| FS1     | Sicherung 2,5A FF mit Halter                                     |
| HV1     | Überspannungsableiter EC350X Epcos / B88069X0810S102             |
| JP1...5 | Jumper-Steckbrücken nach Bedarf                                  |
| M1      | Wannen-Pfostenverbinder 16-pol. (TRMSC-Modul)                    |
| PL1     | Wannen-Pfostenverbinder 14-pol.                                  |
| PL2Ö5   | Wannen-Pfostenverbinder 10-pol.                                  |
| PL6, 7  | Platinen-Steckverbinder 2-pol.                                   |
| PL8, 9  | 2 x Anschlussklemme 2-pol. RM5 oder 1 x 4-pol. oder Lötpins      |
| SW1, 7  | DIL Reedrelais 1-pol. ein, 5V, z. B. Hamlin 721A05               |
| SW2Ö6   | Min.-Relais 2-pol. um 12V, z. B. Omron G5V-2 12VDC oder SDS DS2E-M-DC12V |
| XTAL1   | 16 MHz HC49U                                                     |
|         | Befestigungsmaterial für Frontplatte und Abschirmplatte          |
|         | Platine DIV (eMedia, Segor)                                      |

## Stückliste TRMSC-Änderungen

| ID       | Type                           |
| -------- | ------------------------------ |
| R3       | 27k                            |
| R7       | 10k                            |
| R8       | 82k                            |
| R10      | 8k2                            |
| R11      | 1k                             |
| R20      | 27k                            |
| JP2      | Jumper gesteckt                |
| PL3, 4, 5 | entfällt                      |
| PL2      | abgeschirmte Verbindung zu DIV PL7 |

RSPEAK_STOP
(cm)
RSPEAK_START

**URL dieses Artikels:**

`https://www.heise.de/-291398`

*Copyright © 2008 Heise Medien*
