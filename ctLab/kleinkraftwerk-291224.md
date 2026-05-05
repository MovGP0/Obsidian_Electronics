# Kleinkraftwerk

Source: [https://www.heise.de/ratgeber/Kleinkraftwerk-291224.html](https://www.heise.de/ratgeber/Kleinkraftwerk-291224.html)
Print view: [https://www.heise.de/ratgeber/Kleinkraftwerk-291224.html?seite=all&view=print](https://www.heise.de/ratgeber/Kleinkraftwerk-291224.html?seite=all&view=print)
Author: Carsten Meyer
Series references: c't 19/07, S. 212

> In der Wichtigkeitsrangfolge der Elektroniklabor-Bestandteile folgt das einstellbare, stabilisierte Netzteil gleich hinter Kaffeepott, Lötkolben und Schraubendreher - ohne verlässliche Stromversorgung geht rein gar nichts. Wenn wir den Nachbau des DCG-Moduls empfehlen, auch wenn Sie bestimmt schon ein Labornetzteil besitzen, liegt das natürlich an den überragenden technischen Daten unseres Elaborats, aber auch an seiner weitreichenden Programmierbarkeit: Welches Industrieprodukt erlaubt es schon, die Ist-Werte mit 16 Bit Auflösung zu erfassen und liefert dabei Spannungen und Ströme in Referenzqualität?

Keine Frage, dass für dieses Vorhaben mehr nötig ist als der legendäre „Zwo-N“ (gemeint ist der 2N3055, der Traktor unter den Leistungstransistoren) nebst Zenerdiode, Klingeltrafo und Poti. Unsere Netzteil-Baugruppe für das c't-Lab eignet sich natürlich zum Stromversorgen von Laboraufbauten, ist damit aber eigentlich total unterfordert: Schließlich kann das DCG-Modul durch die eingebauten A/D-Wandler den jeweiligen Ist-Wert zurückliefern, also den Strom, der tatsächlich durch den Verbraucher fließt oder die Spannung, die bei voreingestelltem Strom daran anliegt. Durch eben diese Möglichkeit und die Programmierbarkeit in zwei Spannungs- und vier Strombereichen kann man damit beispielsweise die Kennlinien nicht linearer Bauteile (Dioden, LEDs, VDRs, NTCs, PTCs, Motoren) aufnehmen, den Innenwiderstand und die Ladekurve eines Akkumulators erforschen, eine 20-mA-Stromschleife für industrielle Sensoren aufbauen oder gar Digitalmultimeter kalibrieren. Zusammen mit einem D/A-Kanal des I/O-Moduls ADA als Steuerspannungsquelle lassen sich sogar Kennlinienfelder von Transistoren, MOSFETs und dergleichen ermitteln. Die optional verwendbaren Sense-Eingänge gleichen dabei Spannungsabfälle an den Laborstrippen aus.

Gegenüber der Ankündigung in [**c't 10/07 [1]**](https://www.heise.de/ratgeber/Leitungsschau-291014.html) konnten wir die technischen Daten noch um einiges verbessern: Die Auflösung in allen Strom- und Spannungsbereichen beträgt nun 16 Bit, und zwar in beide Richtungen - also auch bei der Erfassung der Ist-Werte durch den moduleigenen A/D-Wandler. Es ist aber auch eine billigere Bestückungsvariante mit 12 Bit Auflösung möglich. Die maximale Ausgangsspannung wurde auf 30 V angehoben, womit noch nicht das Ende der Fahnenstange erreicht ist; wer sich des Bauteile-Dimensionierens mächtig fühlt, wird auch 50 V herauskitzeln können. Ein Schaltungstrick ermöglicht es, dass die maximale Ausgangsspannung praktisch nur von der unstabilisierten Eingangsspannung vorgegeben wird - dazu später in der Schaltungsbeschreibung mehr. Hinzugekommen ist auch eine nützliche Tracking-Funktion, mit der man zwei DCG-Module als Doppelnetzteil von nur einem PM8-Panel ([**c't 16/07 [2]**](https://www.heise.de/ratgeber/Schalt-und-Waltstelle-291146.html)) bedienen kann.

Apropos: Das Bedienpanel empfehlen wir bei diesem Modul besonders, weil falsche Parametrierungsbefehle ohne Kontrollmöglichkeit schnell das Aus für empfindliche Messobjekte und Verbraucher bedeuten können. Nebenbei gesagt ist die Einstellmöglichkeit mit dem Panel-Drehgeber so bequem und genau, dass Sie Ihr altes Labornetzteil schnell vergessen werden.

## Messteil

Durch den Einsatz des schon von der DA12-8-Karte bekannten 16-Bit-Wandlers LTC1655 statt des ursprünglich vorgesehenen LTC1257 und die Aufteilung in zwei (automatisch umgeschaltete) Spannungsbereiche beträgt die Einstellungsauflösung nun 200 µV im 10-V- und 600 µV im 30-V-Bereich - das liegt schon fast in der Größenordnung der Thermospannungen an billigen Labor-Steckverbindern. Auch die Strom-Bereiche gewinnen durch den 16-Bit-Wandler merklich. Das Modul unterstützt vier dekadische Bereiche von 2 mA bis 2 A „Vollausschlag“, im 2-mA-Bereich lässt sich der Strom also auf sage und schreibe 30nA (0,00000003 A) genau einstellen, im 2-A-Bereich beträgt die Auflösung immerhin noch 30 µA. „Im Mittel“ sei an dieser Stelle hinzugefügt, denn in der Praxis liegt der überlagerte Rauschstrom bedingt durch die leider nicht idealen Regel-OpAmps höher.

Hervorzuheben sind noch die vorbildlichen Regeleigenschaften: Laständerungen gleicht die Schaltung innerhalb von 100 µs aus, und die Temperaturdrift der Ausgangsspannung dürfte in der Größenordnung von 50 ppm/°C liegen. Vergleichbare Fertiggeräte kosten gern 1000 Euro und mehr, die gut 100 Euro für Bauteile und Platinen sind also gut investiert. Wie bei den c't-Lab-Modulen üblich, sind alle Parameter, Skalierungen und Offsets Software-kalibrierbar, der Hardwareabgleich beschränkt sich auf die Nullspannungseinstellung an zwei Trimmpotis.

Damit kontinuierliche Spannungs- und Stromeinstellungen ohne „Umschaltknacks“ möglich sind, haben wir bei der DCG-Syntax sogenannte Prozent-Parameter eingeführt, die den Ausgangsstrom oder die Ausgangsspannung innerhalb des (normalerweise automatisch zugewiesenen) Bereiches beliebig nach unten (null) oder oben (Bereichsgrenze) verschieben können, ohne dass eine automatische Umschaltung vorgenommen wird. Angenommen, Sie wollen eine Spannungsrampe von 10 bis 15 V softwaregesteuert erzeugen: Beim Sprung vom unteren in den oberen Spannungsbereich (Firmware-Default bei 12,1 V) würde am Umschaltpunkt der Regelschleife ein leichter „Knacks“ (kurzer Spannungseinbruch) auftreten. Um das zu verhindern, geben Sie die Sollspannung mit „2:DCV=15!“ vor, was den oberen Spannungsbereich erzwingt, und „modulieren“ diese mit „PCV=66.667!“ auf die gewünschte Anfangsspannung (66,667 Prozent von 15 V = 10 V). Die Rampe kann man dann allein durch Ändern des Prozent-Parameters erzeugen, für den natürlich auch Werte über 100 zulässig sind, solange das Endergebnis innerhalb des Bereiches bleibt. Das gilt analog ebenso für die Strombereiche 2 mA, 20 mA, 200 mA und 2 A mit dem PCA-Parameter. Die Auflösung ist immer nur so groß wie die des gewählten Bereiches.

## Heizlüfter

Moderne Stromversorgungen sind in der Regel als energiesparende Schaltnetzteile ausgeführt. Den unbestreitbaren Vorteilen - niedriges Gewicht, kleine Bauform, hoher Wirkungsgrad - stehen beim Einsatz als Messgerät gravierende Nachteile gegenüber: die langsame und wenig genaue Regelung, die Störstrahlung, die hohe Restwelligkeit und nicht zuletzt die dicken Siebkondensatoren am Ausgang, die dynamische Messungen erschweren und eine schnelle Strombegrenzung unmöglich machen. Wir haben das DCG-Modul deshalb in der bewährten Längsreglertechnik aufgebaut. Die verbrät zwar ungenutzte Leistung in Wärme, doch das lässt sich bei einem Laborgerät durchaus verschmerzen. Ohnehin hilft eine zweistufig umgeschaltete Eingangsspannung, die Bilanz der Stadtwerke nicht allzu sehr nach oben zu puschen.

![[kleinkraftwerk-291224-01.jpeg]]

*Für höhere Ausgangsströme als 1A benötigt das DCG-Modul die DCP-Leistungsstufe (hinten, hier ein Prototyp).*

Das DCG-Modul besteht - vom Bedienpanel abgesehen - eigentlich aus zwei Platinen: der DCG-Steuerungs- und einem DCP genannten Leistungsteil. „Eigentlich“ deshalb, weil das Leistungsteil nur bei maximalen Ausgangsströmen über 1 A notwendig ist; es enthält die Leistungsstufe in verstärkter Ausführung samt Kühlkörper, eine Lüftersteuerung mit programmierbarem I2C-Thermostat, Gleichrichter mit Siebelkos, Umschaltrelais für die Trafo-Wechselspannungen sowie die Transformatoren und Spannungsregler für die Hilfsspannungen. Die DCP-Stufe beschreiben wir voraussichtlich in der nächsten c't.

![[kleinkraftwerk-291224-02.jpeg]]

*DCG mit PM8: die obere Taste wählt die Spannungseinstellung, die untere die für den Soll-Strom. Ein Druck auf den Drehgeber wechselt zur Feineinstellung. Nach erfolgter Einstellung zeigt das Display die Ist-Werte.*

Wenn Sie beispielsweise ein fertiges Festspannungs-Schaltnetzteilmodul statt eines gewichtigen Trafos für die Gewinnung der Eingangsspannung heranziehen wollen, benötigen Sie das Leistungsteil nicht, die Hilfsspannungen (also die Versorgungsspannungen für den Controller und die Regelschaltung) können ebenso gut von der IFP- oder PS3-2-Platine in Ihrem c't-Lab bezogen werden. Schaltnetzteilbaugruppen gibt es in guter Qualität recht preiswert im Fachhandel, wir haben mit Erfolg das Meanwell RS-25-24 ausprobiert, das 24 V bei 1,1 A liefert - genug für eine geregelte Ausgangsspannung von maximal 20 V bei 1 A Laststrom (ein Teil der Eingangsspannung geht an den Regeltransistoren und den Strombegrenzungswiderständen des DCG-Moduls verloren).

## Regelschleifen

Womit wir schon fast bei der Schaltungsbeschreibung wären - die angesichts des Schaltbild-Umfangs und einiger erwähnenswerter Kniffe diesmal etwas ausführlicher gerät. Wer hätte das auch vermutet: Ausgerechnet die Netzteilschaltung ist die komplizierteste des Projekts und auch die, in die am meisten Gehirnschmalz geflossen ist - es brauchte allein vier Versionen der teuren Platinenprototypen, bis alles anstandslos lief ...

![[kleinkraftwerk-291224-03.jpeg]]

*Nichts für höhere Dioptrienzahlen: Eine PDF-Version des Schaltbilds können Sie downloaden. Bemerkenswert ist der schaltungstechnische Aufwand für die Stromeinstellung - aber er lohnt sich. Für die 12-Bit-Variante kommt ein LTC1257 statt des teuren 1655 zum Einsatz, außerdem entfallen der LT1019 und der LTC1864 (siehe Stückliste). Die LEDs 2 und 3 dienen auch der Funktionskontrolle direkt auf der Platine.*

Sollten Sie beim Verstehen des Schaltplans irgendwann ins Stocken geraten: Macht nichts, für die Ansteuerung ist die Firmware des Controllers verantwortlich, und eine einwandfrei bestückte Platine wird auf Anhieb funktionieren. Allerdings ist es beim Aufspüren von Bestückungsfehlern oder defekten Bauteilen hilfreich, wenn man weiß, was warum in der Schaltung passiert.

![[kleinkraftwerk-291224-04.jpeg]]

*Praktischer Aufbau des c't-Lab-Racks (von oben gesehen) mit den Modulen IFP, ADA mit IO-Karten, PS3-2, DIV (noch nicht vorgestellt), DDS mit TRMSC, DCG und DCP. Den dicken DCP-Trafo mit M84-Kern haben wir auf die Rückseite verfrachtet.*

Der Mikrocontroller ATmega32 (U2) besorgt die Kommunikation mit dem c't-Lab-OptoBus, er versteht die schon vom ADA-IO- und DDS-Modul bekannte [**c't-Lab-Syntax [3]**](http://www.ct-lab.de) und steuert die D/A-Wandler-Kanäle, Multiplexer und Umschalter, kümmert sich um Bedieneingaben am PM8-Panel und liest die Ist-Werte der A/D-Kanäle aus. Auf dem Leistungsteil DCP schaltet er je nach gewünschter Ausgangsspannung die Eingangsspannungsrelais um und liefert auf Anfrage sogar die Temperatur des Kühlkörpers. Wie üblich berücksichtigt er die an den Jumpern JP1 bis JP3 eingestellte Moduladresse und ignoriert Befehle, die nicht an ihn gerichtet sind.

Mit der Referenzspannungsquelle steht und fällt die Stabilität und Drift der Schaltung, denn die Ausgangsspannung des D/A-Wandlers kann nicht stabiler sein als die ihm zugeführte Referenzspannung. Hier kommt der anerkannt gute LT1019 von Linear Technologies zum Einsatz, ein gleichwertiger und pinkompatibler Ersatz wäre der REF-43 von Analog Devices. Auf eine Hardwaretrimmung der Referenz konnten wir verzichten, da die Kalibrierung ausschließlich per Software erfolgt; der Absolutwert der Referenzspannung (nominal 2,500V) ist deshalb nicht kritisch, wohl aber ihre geringe Drift - und die ist bei den genannten Bauteilen tadellos.

Der mit rund 20 Euro recht teure D/A-Wandler LTC1655 wird doppelt genutzt: über einen Multiplexer mit nachfolgenden Sample&Hold-Stufen steuert er abwechselnd den Soll-Strom und die Sollspannung, die Ausgabe erfolgt im 1-ms-Interrupt des Controllers, nach zwei Millisekunden sind also beide aktualisiert. Trotzdem dauert es durch die recht üppig bemessenen Zeitkonstanten R26/C20 und R19/C13 etwa 10 ms, bis die Ausgangsspannung den programmierten Wert erreicht hat. Verkleinert man R26 und R19, schlägt aber irgendwann die „Charge Injection“ der Multiplexer auf die Ausgangsspannung durch; die am Ausgang entstehende Störspannung mit Interrupt-Frequenz kann durchaus einige Millivolt betragen. Der Sollwert der Ausgangsspannung gelangt direkt zum Regel-OpAmp U6, der diese mit der Ist-Spannung am Modulausgang vergleicht. Der Schalttransistor Q2 stellt die Regelstufe je nach gewünschter Ausgangsspannung auf ein- oder dreifache Verstärkung ein.

## Historisch wertvoll

Der Regelstufe folgt ein Spannungsumsetzer um Transistor Q4, der den für die gewünschte maximale Ausgangsspannung erforderlichen Spannungshub erzeugt. Etwas ungewöhnlich ist die Beschaltung: Q4 arbeitet in (rückgekoppelter) Basisschaltung. Die ist bei vielen Elektronikern längst in Vergessenheit geraten; früher nutzte man sie gern in UHF-Eingangsstufen, ansonsten führte sie eher ein Schattendasein. Hier kommt sie zu neuen Ehren, weil sie ungemein schnell ist und weil ihre Ein- und Ausgangsspannungen dieselbe Phasenlage aufweisen. Da der „Level-Shifter“ im Regelkreis liegt, sind der Absolutwert der Verstärkung und die der Basisschaltung innewohnenden Nichtlinearitäten ohne Belang.

Der Level-Shifter wird von einer Konstantstromquelle bestehend aus Q5 und LED3 gespeist, die der Controller über den Transistor Q3 explizit aktivieren muss. Damit ist sichergestellt, dass die Ausgangsspannung des Moduls beim Einschalten nicht zerstörerische Werte annehmen kann - erst, wenn der Wandler-Interrupt läuft und die Sollspannungen vorgegeben sind, wird die Stufe aktiv geschaltet.

Eher konservativ ist dagegen die Leistungsstufe mit Q6 und Q12 ausgelegt, die nur noch für eine gehörige Stromverstärkung sorgt. Trotz der einstellbaren Strombegrenzung haben wir noch eine „Notbremse“ in Form von Q7 vorgesehen, die schnelle Überstromimpulse noch vor der (endlich schnellen) Stromregelung abfängt. Steigt die Spannung über dem Widerstand R56 über 1,5 V (gleichbedeutend mit einem Strom von rund 3 A), zieht Q7 die Ausgangsspannung nach unten.

Der mit U5 aufgebaute Differenzverstärker ermittelt den exakten Wert an den Ausgangsspannungsklemmen, teilt ihn durch drei und führt das Ergebnis der Regelschleife zu. Liegt beispielsweise an den Klemmen eine Spannung von 30 V an, sind an Pin 1 von U5 genau 10 V zu messen. Die Teilung ist deshalb nötig, weil die Regelschleife nur innerhalb ihrer Betriebsspannung arbeiten kann, und die beträgt hier ±15 V - sehr viel mehr vertragen die OpAmps auch nicht. Wer die Schaltung für höhere Ausgangsspannungen modifizieren möchte, greift am besten hier ein: Je größer die Abschwächung, desto höher wird die Ausgangsspannung bei gegebenem D/A-Wert. Die Vergleichsspannung im Regelkreis (d. h. am Ausgang von U6) sollte unter 12 V liegen, damit die OpAmps nicht in die Begrenzung fahren. Um die Abschwächung beispielsweise auf den Faktor vier zu vergrößern, sind R20 und R23 mit 7,5 kOhm zu dimensionieren, als maximale Ausgangsspannung sind dann 12 x 4 = 48 V drin.

Sämtliche Verstärkungsfaktoren sind wie die Offset- und Skalierungskorrekturwerte der einzelnen Bereiche im EEPROM-Bereich des Controllers abgelegt und können mit dem (neuen) OPT-Befehl an die modifizierte Schaltung angepasst werden. Selbst die Widerstandswerte der Shunts sind hier eingetragen, sodass man mit einem kräftigeren Leistungsteil und anderen Widerständen auch höhere Ströme erzielen kann.

Der Differenzverstärker sorgt in der Hauptsache dafür, dass der Spannungsabfall an den Stromfühler-Widerständen R53 bis R55 und R57 bei der analogen Regelung der Ausgangsspannung keinen Einfluss hat; nebenbei stellt er auch die „Sense“-Eingänge, die den Spannungsabfall an den Laborleitungen kompensieren, falls gewünscht. Werden die Sense-Eingänge nicht benötigt, schließt man sie einfach mit den korrespondierenden Ausgängen kurz, möglichst erst an den Ausgangsbuchsen: SenseOut+ an Out+, SenseOut- an Out-.

## Aufgeschwungen

Am Ausgang findet sich nicht der sonst obligatorische Abblockkondensator, sondern ein Boucherot-Glied aus C30 und R58. Wir haben es vermieden, hier einen dicken Elko vorzusehen, weil der seinen Inhalt impulsartig über eine plötzlich angeschlossene Last ausschüttet, ohne dass die Strombegrenzung eingreifen kann. Sie können deshalb bei einem auf 20 mA eingestellten Sollstrom ohne Weiteres die Spannung auf 15 V hochdrehen und erst dann eine LED anschließen: Die bekommt dann über R58 nur die relativ kleine Ladung aus C30 ab und bleibt intakt. Selbst in besseren Industriegeräten findet man an dieser Stelle Elkos von 100 µF und mehr, und die wären dergestalt für so manches Bauteil tödlich.

An dieser Stelle noch ein Hinweis zum Boucherot-Glied (oft auch als Snubber oder Zobel-Glied bezeichnet, wobei letzteres aufgrund der Assoziationsnähe zum Fortpflanzungsorgan des gleichnamigen Pelztieres weniger gebräuchlich ist): Die enorm hohe Ausgangsimpedanz im Strombegrenzungsbetrieb entdämpft den aus Lastkapazität und Leitungsinduktivität entstehenden Schwingkreis, was zu einer Schwingneigung führt. R58 reduziert die Güte des Kreises auf ein ungefährliches Maß. Soll die Schaltung nur Ströme im Bereich einiger hundert mA liefern, können Sie den Wert von C30 verkleinern und den von R58 erhöhen, etwa in der Kombination 47nF und 10 Ohm. Das Impulsverhalten der Schaltung verbessert sich dadurch, wenn auch nur im Bereich sehr kleiner Ströme.

Die Strombegrenzung arbeitet mit vier umschaltbaren Shunts, die außerhalb des Spannungsregelkreises liegen. Die Umschaltung besorgt Multiplexer U12, der auch den jeweils benutzten Widerstand an den Strom-Fehlerverstärker U10 und über U11 an den Istwert-A/D-Wandler legt. Als Leistungsschalter dienen vier MOSFET-Transistoren. Die haben den unbestreitbaren Vorteil einer leistungslosen Steuerung: Kein Gate-Strom fließt in die Messwiderstände und verfälscht das Messergebnis.

Die Spannung am ausgewählten Shunt gelangt an OpAmp U10, der bei Überschreiten der vom D/A-Wandler vorgegebenen Spannung den Ausgang herunterregelt, bis der Sollstrom erreicht ist - realisiert durch eine Dioden-VerODERrung (D1, D4) am Level-Shifter Q4. Der im Regelkreis liegende Optokoppler U13 meldet die einsetzende Strombegrenzung an den Prozessor, der daraufhin die rote „I“-LED auf dem Bedienpanel anknipst und das „Overload“-Flag für die Statusmeldung setzt.

![[kleinkraftwerk-291224-05.jpeg]]

*So wird das PM8-Panel an der DCG-Platine befestigt: Der Metallwinkel wurde leicht abgefeilt, um Kurzschlüsse der PM8-Leiterbahnen zu vermeiden. Eine Nylon-Unterlegscheibe täte es aber auch.*

U11 verstärkt die Shunt-Spannung um den Faktor zwei, am Istwert-A/D-Wandler kommen also knapp 2 V an, wenn ein Strom von 2 A durch R57 (0,47 Ohm) fließt. Der A/D-Wandler besteht aus dem 16-Bit-Chip LTC1684 und dem aus U8b und U8d gebildeten Multiplexer, der im Interrupt-Takt mal den Iststrom-, mal den Istspannungswert an dessen Eingang legt. Alle 2 ms liegt also ein neuer Istwert für beide Größen vor, den der Controller entsprechend seiner Firmware-Vorgaben skaliert und zur Abholung (oder Anzeige) bereithält. Da der A/D-Wandler im Bereich von 0 V Eingangsspannung und möglicherweise auch die Fehlerverstärker einen geringen (gegebenenfalls negativen) Offset aufweisen können, wird „absichtlich“ über R14 eine leicht positive Offset-Spannung zugegeben, die die Firmware später subtrahiert. So ist sichergestellt, dass die Wandlung auch im Bereich 0 V oder 0 mA einwandfrei arbeitet.

Für Ströme jenseits der Ein-Ampere-Schwelle empfehlen wir den Aufbau des oben erwähnten Leistungsteils DCP, das Sie aber erst in Angriff nehmen sollten, wenn die DCG-Platine einwandfrei mit der Ein-Ampere-Endstufe funktioniert; die kann später rückstandsfrei entfernt werden, sie besteht ja nur aus Q12.

## Wo das Lötzinn fließt

Der Aufbau der DCG-Platine verlangt zwar nur durchschnittliche Lötkünste, aber die Komplexität der Schaltung fordert etwas Disziplin bei der Bestückung - schnell liegt man bei den oft mit „unleserlichen“ Farbringen gekennzeichneten blauen Metallfilm-Widerständen eine Zehnerpotenz daneben, weil orange und rot kaum zu unterscheiden sind. Im Zweifelsfall also lieber nachmessen. Die leichter identifizierbaren Kohleschichtwiderstände haben auf der DCG-Platine nichts zu suchen, sie sind zu ungenau und driften viel zu stark.

Beginnen Sie mit den SMD-Bauteilen um U3 (nicht nötig bei der 12-Bit-Version); bei den Segor-Teilesätzen ist der vielbeinige Prozessor U2 ja schon vorbestückt. C9 ist der kleinere der drei Chip-Kondensatoren. Hier empfiehlt sich eine Leuchtlupe und eine Dornenpinzette aus Edelstahl, wie man sie manchmal auf dem Flohmarkt aus medizinischen Beständen für wenig Geld erstehen kann. Die Baumarkt-China-Qualität lässt sich schon in der Blisterverpackung verbiegen - Schrott ist dafür eine recht wohlwollende Bezeichnung.

![[kleinkraftwerk-291224-06.jpeg]]

*So wird Q12 montiert, wenn ein Ausgangsstrom von 1 A ausreicht. 10-mm-Abstandsröllchen sorgen für gute Luftzirkulation auf der Rückseite.*

Dann sind die niederen Bauteile an der Reihe; vergessen Sie die Drahtbrücke R7 nicht. Bei den Hochlastwiderständen R56 und R57 sollten Sie fünf Millimeter Abstand zur Platine einhalten, die werden bei Volllast heiß. Die Schalter-MOSFETs BS170 sind recht empfindlich, was statische Aufladungen angeht; bei der DDS-Platine gab es bereits einige Leser, die damit Probleme hatten: Das Bauteil öffnet dann nicht mehr richtig oder wird ganz und gar niederohmig. Also bis zum Einlöten in Antistatikschaum aufbewahren. Q6 erhält einen kleinen Kühlkörper und wird mit einer M3-Schraube, Mutter und Zahnscheibe mit der Platine verschraubt; erst danach verlöten!

Bei der 1-A-Version ohne DCP-Teil bestückt man Q12, in diesem Fall ein BD243 oder MJE3055, von der Platinenrückseite (Polung beachten - Kühlfahne zeigt zur Platinenmitte, blanke Seite nach außen) und verpasst ihm dann einen großzügigen Kühlkörper (Wärmeleitpaste, Glimmerscheibe und Isoliernippel nicht vergessen). Besonders geeignet fanden wir den SK105 von Fischer, ein zehn Millimeter flacher Kühlkörper im Euro-Karten-Format, den man nur noch mit vier M3-Befestigungslöchern (außen auf der Platine, kann als Schablone verwendet werden) versehen muss. Elegant wirken eingeschnittene M3-Gewinde, notfalls kann man den Kühlkörper auch mit dünnen Blechschrauben oder zusätzlichen Muttern befestigen. Die Kühlkörper-Montage sollte aber erst nach Abschluss des nachstehend beschriebenen Tests erfolgen, sonst kommen Sie an die Lötstellen bei Fehlbestückungen nicht mehr so ohne Weiteres heran.

## Einstand

Zum Abgleich müssen Sie die Platine probeweise am IFP in Betrieb nehmen und auch von dort mit Strom versorgen (IFP/PL1 an DCG/PL1). Nach dem Flashen der Firmware (EEPROM-Datei nicht vergessen!) bringt das DCG-Modul seine Begrüßungsmeldung (auf Panel und Schnittstelle) und stellt die Default-Werte 5 V/20 mA ein. Die 5 V sollten jetzt auch an den Ausgangsklemmen Out- und Out+ zu messen sein, weil sich die Ausgangsspannung aus dem +15-V-Zweig über die Basis-Emitter-Diode von Q6 aufbaut. Natürlich ist sie nur mit ein, zwei mA belastbar, aber zum Abgleich reicht das. Stellen Sie nun am Panel oder mit dem Befehl „2:DCV=0!“ (gilt für Moduladresse 2, also JP2 gesteckt) eine Ausgangsspannung von 0 V ein; die Ausgangsspannung sollte auf wenige mV zurückgehen. Schalten Sie Ihr Multimeter nun in den 200-mV-Bereich und gleichen Sie mit R28 die Restspannung auf einen Wert möglichst nahe null ab.

Nun einen Widerstand mit 10 kOhm an die Ausgangsklemmen Out- und Out+ anschließen, die Spannung mit „2:DCV=5!“ wieder auf 5 V und dafür den Ausgangsstrom mit „2:DCA=0!“ auf Null setzen. Die Spannung am Widerstand sollte merklich zusammenbrechen oder leicht negativ werden. Dann mit R36 auf nahe 0 V Ausgangsspannung abgleichen. Die Einstellung ist dann in Ordnung, wenn die Spannung gerade im Begriff ist, in den negativen Bereich zu kippen. Damit ist der Hardwareabgleich auch schon gelaufen. Kontrollieren Sie, ob der Istwert-A/D-Wandler richtig arbeitet; „2:MSV?“ sollte ein Ergebnis um 5 (Volt) bringen, wenn Sie die Sollwerte auf 5 V/20 mA gesetzt haben. „2:MSA?“ muss dann auch funktionieren und mit dem 10-k-Widerstand einen Strom von rund 500 µA anzeigen.

Etwas aufwendiger gestaltet sich die Firmware-Feinabstimmung: Für die zwei Strom- und vier Spannungsbereiche stehen eigene Offset- und Skalierungswerte jeweils für den A/D-Wandler (Istwerte) wie auch für den D/A-Wandler (Sollwerte) zur Verfügung, insgesamt also 24 Parameter (!). Man erreicht sie wie beim c't-Lab üblich mit den Befehlen SCL und OFS. Der Syntax-Tabelle können Sie entnehmen, welcher Parameter für den jeweiligen Mess- oder Einstellbereich zuständig ist. Im EEPROM-File der Firmware sind Default-Werte eingetragen, die schon brauchbare Ausgangspunkte für die Feinabstimmung liefern sollten; abhängig von den Bauteiletoleranzen sind Abweichungen von ein bis zwei Prozent möglich, die sich mit etwas Sorgfalt auf unter 0,1 Promille drücken lassen.

## Tuning

Für den Feinabgleich ist natürlich die Leistungsstufe in Betrieb zu nehmen: Q12 auf Kühlkörper montieren und mit der DCG-Platine von der Bestückungsseite verlöten; natürlich können Sie Q12 auch mit nicht allzu langen Litzen (max. 30 cm) anschließen, wenn der Kühlkörper getrennt montiert werden soll. Dann das 24-Volt-Festspannungsnetzteil (oder eine andere, auch unstabilisierte Gleichspannungsquelle bis 35V) an Pin 1 (Pluspol) und Pin 4 (Minuspol) von PL6 anschließen, die anderen PL6-Pins bleiben offen.

![[kleinkraftwerk-291224-07.jpeg]]

*Ein Minimal-DCG benötigt nur noch eine (nicht unbedingt stabilisierte) Gleichspannungsquelle, hier ein Kompakt-Festspannungsnetzteil von Meanwell, und einen Kühlkörper mit 3 K/W oder besser.*

Sie benötigen zum Abgleich ein Digitalmultimeter, möglichst ein genaues Tischmodell aus gutem Hause (HP/Agilent, Fluke, Keithley); billige Handmultimeter sind vor allem in den Strombereichen oft sehr ungenau. Am einfachsten ist die Kalibrierung, wenn Sie das LabVIEW-Programm DCG-Abgleich.vi verwenden, das Sie auf [**www.ct-lab.de [4]**](http://www.ct-lab.de) unter „Downloads“ finden. Beginnen Sie immer mit den Offset-Werten. OFS 0 ist der Offset-Wert für den unteren Spannungsbereich bis 12 V: Der sollte auf dem Default-Wert von zehn DAC-Zählerpunkten bleiben, weil der oben beschriebene Hardwareabgleich den Offset hier bereits neutralisiert hat. Erzwingen Sie nun mit „DCV=15!“ den oberen Spannungsbereich, den Sie aber mit dem Prozent-Parameter „PCV = 0!“ auf eine Ausgangsspannung von 0 V bringen. Stellen Sie nun den OFS-1-Parameter so ein, dass sich eine minimale Ausgangsspannung ergibt; hier sollte nur eine minimale Korrektur nötig sein.

Die Offset-Parameter 10 und 11 sind für die A/D-Wandlung der Ist-Spannung zuständig. Auch diese müssen Sie so einstellen, dass sich eine Anzeige (auf dem PM8-Display) oder ein Messergebnis (mit der Abfrage „MSV?“ von möglichst genau 0 V ergibt. Die Einstellung der Offset-Parameter für die Strombereiche (OFS 2 bis 5 für die Soll-Ströme und OFS 12 bis 15 für die vom DCG gemessenen Ist-Ströme) erfolgt genauso, hier müssen Sie aber zunächst die Ausgangsspannung wieder auf 5 V setzen, damit auch ein Strom fließen kann. Die Soll-Ströme der vier Bereiche (z. B. „DCA=0.001“ für die Mitte des 2-mA-Bereiches) sind dann mit „PCA=0!“ abzuwürgen, worauf man mit dem zuständigen Offset-Parameter den am Multimeter abgelesenen Reststrom auf null bringt. Für die Offset-Null-Einstellung der Strom-Istwerte (OFS 12 bis 15, siehe auch Syntax-Tabelle) bleiben die DCG-Ausgangsklemmen einfach offen.

Nach dem zugegebenermaßen etwas umständlichen, aber unbedingt notwendigen Offset-Abgleich - den das DCG-Abgleich-VI zwar nicht automatisiert, aber doch sehr vereinfacht, weil es die zuständigen Parameter auswendig kennt und den Write-Enable-Befehl automatisch voranstellt - bleibt der Skalierungsabgleich. Das Procedere kennen Sie ja bereits von den AD16-8- und DA12-8-Karten für ADA-IO: Skalierungsfaktoren so anpassen, dass sich der „Vollausschlag“ von Soll- und Ist-Werten (ebenfalls 12 Parameter) mit den am Multimeter abgelesenen Werten deckt.

[**Forum zu c't-Lab [5]**](http://www.heise.de/ct/foren/S-c-t-10-2007-S-124-Fernwirkung/forum-116199/list/)

![[kleinkraftwerk-291224-08.jpeg]]

*Der Leistungstransistor Q12 wird entweder auf der Rückseite der DCG-Platine montiert oder mit kurzen Litzenstücken angeschlossen. Für den Ausgang können Schraubklemmen oder Lötstifte vorgesehen werden.*

## Stückliste

### Halbleiter

| ID            | Type                    |
| ------------- | ----------------------- |
| U1            | 6N137                   |
| U10           | LF411                   |
| U11           | OP07                    |
| U12           | DG409, DG509            |
| U13           | CNY17-2, 4N25           |
| U2            | ATmega32AU16 (QFP)      |
| U3            | LTC18641/entfällt2      |
| U4            | LT10191/entfällt2       |
| U5            | NE5532                  |
| U6            | LF411                   |
| U7            | LTC16551/LTC12572       |
| U8            | DG413                   |
| U9            | LF412A                  |
| Q1, 2, 10, 11 | BS170                   |
| Q12           | BD243C, MJE3055         |
| Q3, 4, 7      | BC546                   |
| Q5            | BC556                   |
| Q6            | BD677                   |
| Q8, 9         | IRF540                  |
| D1...D4       | 1N4148                  |
| D5, 6         | 1N4007                  |
| D7            | 1N5407                  |
| ZD1           | ZPD 9V1 400mW           |
| LED1          | LED 3mm rot             |
| LED2          | LED 3mm gelb            |
| LED3          | LED 3mm grün            |

### Passive Bauteile

| ID                                       | Type                    |
| ---------------------------------------- | ----------------------- |
| XTAL1                                    | 16 MHz HC-49U           |
| L1                                       | 10 µH axial             |
| C1, 4, 5, 8, 11,14, 15, 17, 18, 25, 28, 31 | 100n ker. RM5        |
| C2, 3                                    | 22pF RM2,5              |
| C6                                       | 220n SMD12061/entfällt2 |
| C7                                       | 220n SMD12061/entfällt2 |
| C9                                       | 2n2 SMD08051/entfällt2  |
| C10                                      | 4µ7 50V                 |
| C12                                      | 2n2 RM5                 |
| C13, 20                                  | 100n 63V MKT            |
| C16, 21, 26                              | 10µ 50V                 |
| C19, 22                                  | 4µ7 25V Ta              |
| C23, 29                                  | 100µ 63V                |
| C24                                      | 220p RM5                |
| C27                                      | 470p RM5                |
| C30                                      | 330n ker. RM5           |
| R1, 5, 3, 29, 52                         | 2k2                     |
| R2, 4, 51                                | 220R                    |
| R6, 38                                   | 10R                     |
| R7                                       | 0R                      |
| R8, 55                                   | 470R                    |
| R9, 46, 48                               | 4k7                     |
| R10, 11, 13, 15                          | 470R SMD08051/entfällt2 |
| R12                                      | 30k1/entfällt2          |
| R24                                      | 30k                     |
| R14                                      | 100k SMD08051/entfällt2 |
| R16                                      | 7k5                     |
| R17                                      | 20k1/30k2               |
| R18                                      | 10k1/7k52               |
| R19, 20, 23, 26, 31, 37, 42, 43, 44, 47, 50, 61 | 10k          |
| R21, 22                                  | 30k                     |
| R25, 32, 40, 49                          | 1k                      |
| R27                                      | 39k                     |
| R28, 36                                  | 10k Präz.-Trimmer W64   |
| R30                                      | 12k                     |
| R33                                      | 1k1/3k2                 |
| R34                                      | 3k                      |
| R35                                      | 6k8                     |
| R39                                      | 330R                    |
| R41                                      | 1k8                     |
| R45                                      | 22k                     |
| R53                                      | 4R7 2W                  |
| R54                                      | 47R                     |
| R56                                      | 0R47 5W                 |
| R57                                      | 0R47 5W                 |
| R58                                      | 2R2                     |
| R59, 60                                  | 100R                    |
| R62                                      | 180k                    |

### Sonstiges

| ID      | Type                         |
| ------- | ---------------------------- |
| JP1...5 | Jumper-Steckbrücken          |
| PL1     | Wannen-Pfostenverbinder 14-pol. |
| PL2..PL5 | Wannen-Pfostenverbinder 10-pol. |
| PL6     | MiniFit Jr. 8-pol. 180°      |
| PL7     | Schraubklemme 4-pol.         |

### Mechanische Bauteile

| ID | Type |
| -- | ---- |
|    | Kühlkörper SK105, Platine c't-Lab DCG, Abstandsröllchen, Befestigungsmaterial |

1 16-Bit-Version

2 12-Bit-Version

RSPEAK_STOP
([**cm [6]**](mailto:cm@ct.de))
RSPEAK_START

**URL dieses Artikels:**

`https://www.heise.de/-291224`

**Links in diesem Artikel:**

1. https://www.heise.de/ratgeber/Leitungsschau-291014.html
2. https://www.heise.de/ratgeber/Schalt-und-Waltstelle-291146.html
3. http://www.ct-lab.de
4. http://www.ct-lab.de
5. http://www.heise.de/ct/foren/S-c-t-10-2007-S-124-Fernwirkung/forum-116199/list/
6. mailto:cm@ct.de

*Copyright © 2007 Heise Medien*
