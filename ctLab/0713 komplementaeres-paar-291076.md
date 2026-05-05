---
title: DA12-8 (Digital-Analog Converter)
---
# Komplementäres Paar

Source: [https://www.heise.de/ratgeber/Komplementaeres-Paar-291076.html](https://www.heise.de/ratgeber/Komplementaeres-Paar-291076.html)
Print view: [https://www.heise.de/ratgeber/Komplementaeres-Paar-291076.html?seite=all&view=print](https://www.heise.de/ratgeber/Komplementaeres-Paar-291076.html?seite=all&view=print)
Author: Carsten Meyer
Series references: c't 13/07, S. 202; c't 15/07, S. 188

> [!note] Segor
> Passende Segor-Seiten:
> - [Baugruppe c't-Lab/AD16-8](https://www.segor.de/INFO/ct-lab/baugruppe-ad16-8.shtml)
> - [Baugruppe c't-Lab/DA12-8 (12 und 16 Bit Version)](https://www.segor.de/INFO/ct-lab/baugruppe-da12-8.shtml)

> Zwei Steckkarten mit hochwertigen A/D- und D/A-Wandlern komplettieren das erste Messmodul der c't-Lab-Reihe. Jede der beiden Wandlerkarten besitzt mit (bis zu) 16 Bit Auflösung und acht Kanälen genug Potenzial, um auch anspruchsvollere Mess- und Steuerungsaufgaben zu bewältigen - 0,01 % Genauigkeit sprechen für sich.

Viereinhalb Dezimalstellen Genauigkeit bei hundert Messungen pro Sekunde an gleichzeitig acht Eingangskanälen - so die Eckdaten der A/D-Wandlerkarte AD16-8. Zum Vergleich: Übliche Handmultimeter bieten nur dreieinhalb Dezimalstellen bei kaum mehr als drei Messungen pro Sekunde - und natürlich nur einen einzigen Wandlerkanal. In die andere Richtung geht es nicht minder genau: Die D/A-Wandlerkarte DA12-8 kann man wahlweise mit einem 12- oder 16-Bit-Wandler bestücken, sie besitzt ebenfalls acht Kanäle. Beide Karten akzeptieren beziehungsweise liefern Spannungen zwischen -10 und +10 V, was in der Mess- und Steuerungstechnik eine Art Industriestandard darstellt. Der Trigger-Eingang erleichtert bei der AD-16-8 automatisierte Messungen: Eine Impulsflanke löst bei entsprechender Softwarekonfiguration die Messung aus, und das ADA-IO-Modul liefert die gewünschten Messwerte dann auch automatisch.

Nicht verschwiegen sei an dieser Stelle, dass die beiden Module an Basteltalent und Geldbörse erhöhte Anforderungen stellen. Gute Wandler-ICs haben ihren Preis - im vorliegenden Fall zehn bis 25 Euro - und sind nicht an jeder Ecke erhältlich, auch der Abgleich erfordert Fingerspitzengefühl und hochwertiges Messequipment. Dafür erhält man Wandler, die keinen Vergleich mit kommerziellen Produkten für viele hundert Euro zu scheuen brauchen.

## Analog-Hardcore

Für viele Anwendungen, etwa beim automatisierten Abgleich in der industriellen Fertigung, reichen Auflösung und Genauigkeit der internen A/D-Wandler des ATmega32, wie sie der simple Analogteil der IO8-32-Karte aus der vorletzten c't verwendet, nicht aus. Will man die gegebene 10-Bit-Auflösung gar bipolar nutzen, also für positive und negative Eingangsspannungen gleichermaßen, bleiben pro „Quadrant“ nur mehr 9 Bit übrig, weil ein Bit für das Vorzeichen draufgeht - das sind umgerechnet weniger als drei Dezimalstellen. Ein zusätzlicher externer A/D-Wandler sollte schon deutlich mehr können, damit sich der Aufwand rechnet.

Unsere AD16-8-Schaltung verwendet einen Sampling-ADC mit der klassischen sukzessiven Approximation, den LTC1864 von Linear Technologies. Der liegt in seinem gesamten Wertebereich um maximal drei LSB-Counts daneben, und seine dynamische Linearität ist durchweg besser als ein LSB (Least Significant Bit). Durch seine hohe mögliche Sampling-Frequenz kann man pro Messung mehrere Samples ziehen und mitteln, was den Störabstand merklich erhöht. Die früher bei A/D-Wandlern nötige Sample&Hold-Stufe ist beim LTC1864 bereits eingebaut (genauer gesagt: systemimmanent durch das Wandlerregister aus geschalteten Kondensatoren - siehe Datenblatt).

![[komplementaeres-paar-291076-01.jpeg]]

*Den Kern unserer A/D-Wandlerkarte bildet der LTC1864, ein schneller 16-Bit-ADC. Der eingangsseitige Multiplexer schaltet einen von acht Eingangskanälen auf den Wandler.*

Ein A/D-Wandler kann nicht besser sein als seine Referenzspannung, die das Approximationsregister zum Vergleich mit der Eingangsspannung benötigt - vergleichbar mit dem Pariser Ur-Meter, an dem sich jeder Zollstock zu orientieren hat. Der LTC1864 besitzt keine eingebaute Referenzquelle, wir haben ihm deshalb einen LT1019-2,5 zur Seite gestellt, im Prinzip eine Zenerdiode mit äußerst geringem Temperaturkoeffizienten (typisch <5 ppm/°C) und niedriger Langzeit-Drift. R13 dient gegebenenfalls zum Feinabgleich, an „TP Ref“ stellt man genau +2,56000V gegenüber der Karten-Masse ein. Über JP2 kann man die Referenzspannung auch anderen Karten oder dem internen Wandler des ATmega32-Controllers auf dem ADA-IO-Motherboard zur Verfügung stellen. Der LT1019-2,5 arbeitet um einiges besser als die interne Referenzquelle des ADA-IO-Controllers, die man übrigens mit dem Befehl <"REF=1!"> explizit ein- und mit <"REF=0!"> abschalten kann. Wird JP2 gesteckt, muss natürlich die interne Referenz des Controllers abgeschaltet sein, sonst herrscht eine gewisse Uneinigkeit auf der Leitung.

## Multiuser-Wandler

Schon der Preis des LTC1864 von rund 15 Euro verbietet es, für jeden Eingangskanal einen eigenen ADC (Analog-Digital-Converter) vorzusehen. Wir betreiben den Baustein deshalb sozusagen im Multiuser-Betrieb: Die acht Eingänge gelangen zunächst in einen Analogmultiplexer, der jeweils einen Kanal zur Messung auswählt und auf den Eingangsverstärker schaltet. Das erledigt eine Interrupt-Routine in der ADA-IO-Firmware, die ständig die Eingangskanäle abklappert und die Messwerte in einem Array speichert. Jeder der im Tausendstel-Sekunden-Raster ermittelten Messwerte besteht wiederum aus vier Samples, die wie oben erwähnt zur Störspannungsreduktion gemittelt werden. Ein Messzyklus dauert somit 8 ms - diese Zeit muss das abfragende PC-Programm in etwa einkalkulieren, bis ein angeforderter Messwert vorliegt.

![[komplementaeres-paar-291076-02.jpeg]]

*Einige Bauteile, unter anderem der ADC, werden als SMD-Bauteile auf der Lötseite der Platine montiert. Bei der käuflichen Version sorgt eine große Kupferfläche auf der Bestückungsseite für eine gute Masse.*

Der Eingangsverstärker besteht aus einem hochwertigen Doppel-FET-OpAmp vom Typ OPA2107, der die Signale für den ADC aufbereitet und einen (fast) unendlich hohen Eingangswiderstand aufweist. Ein hochpräziser Spannungsteiler nach dem ersten OpAmp setzt die Eingangsspannung so um, dass der ADC quasi-bipolar wandelt; bei 0V Eingangsspannung „sieht“ er die Hälfte der Referenzspannung an seinem Eingang (den entstehenden Roh-Offset von 32768 zieht die ADA-IO-Firmware automatisch ab). Die Verstärkung des OpAmps lässt sich mit Jumper JP1 so einstellen, dass entweder 1V (gezogener Jumper, für spezielle Anwendungsfälle) oder 10 V Eingangsspannung (gesteckter Jumper, Default) zum „Vollausschlag“ des Wandlers führen. Die Wahl des Eingangsspannungsbereichs gilt für alle Kanäle gemeinsam.

![[komplementaeres-paar-291076-03.jpeg]]

*Mit dem LTC1257 im DIL-Gehäuse dürfte die Bestückung unseres D/A-Wandlers keine Probleme bereiten. Für alle Fälle haben wir auf der Fertig-Platine noch Lötpads für die SMD-Version des DACs vorgesehen.*

Der schnelle LTC1864 reagiert leider äußerst mimosenhaft auf Overshoots an seinen SPI-Pins, die die vorgeschalteten Widerstände R1, R4 und R16 wirksam dämpfen. Spikes am Analog-Eingang, die unmittelbar auf das Wandlungsergebnis durchschlagen würden, unterdrücken C4 und C9; die gewählte Zeitkonstante hat keinerlei Einfluss auf die Wandlungsgenauigkeit. Entsprechend sorgfältig wurde das Platinen-Layout ausgeführt: Jeder Millimeter zusätzliche Leiterbahn zum Masse-Pin 4 oder zum Entkopplungskondensator C3 würde das Messergebnis verfälschen. Aus gutem Grund ist der LTC1864 auch nicht im DIL-Gehäuse erhältlich, dessen vergleichsweise lange Zuleitungs-Pins hier absolut indiskutabel wären. Die Bypass-Kondensatoren C3, C4 und die Dämpfungswiderstände sind ebenfalls als SMD-Bauteile ausgeführt. Die verwendete SO8-Version des LTC1864 mit 1,27 mm Beinchen-Abstand lässt sich bei gezügeltem Koffeingenuss noch gut von Hand löten.

## Spannungsschürend

Bislang kam in den c't-Lab-Artikeln nur die Messwerterfassung zum Zuge, nun geht es in die andere Richtung: Zum Steuern analoger Vorgänge benötigt man einen D/A-Wandler, beim ADA-IO-Modul ist dies die DA12-8-Karte. Sie lässt sich wahlweise mit einem 12- oder 16-Bit-DAC bestücken, in beiden Fällen stehen acht Ausgangskanäle zur Verfügung. Wie bei der AD16-8-Karte beträgt der nutzbare Spannungsbereich -10 V bis +10 V. Kommt die zu steuernde Schaltung mit weniger aus, reicht ein simpler Spannungsteiler am Ausgang.

![[komplementaeres-paar-291076-04.jpeg]]

*Der D/A-Wandler kann alternativ mit einem 12- oder 16-Bit-DAC bestückt werden, wobei letzterer hochqualitative Bauteile in seiner Peripherie erfordert.*

Die Wandlung besorgt ein LTC1257 (12 Bit) oder LTC1655 (16 Bit), wobei letzterer mit deutlich über 20 Euro eines der teuersten Bauteile des Projektes ist. Dass Industrie-DACs bei gleicher Bitzahl durchweg um einiges teurer sind als ADCs, hat einen einfachen Grund: Die aktuellen Sampling-ADCs arbeiten mit abgestuften Kondensatoren im Approximationswandler, die sich recht einfach mit ausreichend genauen Werten integrieren lassen. Die statisch arbeitenden DACs müssen jedoch Widerstandsteilerketten bemühen, und die fressen Silizium-Platz und sind abgleichintensiv: Jeder gute statische DAC wird im Halbleiterwerk per Laser abgeglichen. Die billigen Delta-Sigma-DACs kommen zwar ohne Teilerketten und Abgleich aus, arbeiten aber nur dynamisch - optimal für Wechselgrößen, weshalb man sie vornehmlich im Audiobereich findet.

Der DAC-Baustein auf unserer DA12-8 erhält seine Datenworte über eine SPI-Schnittstelle, einen schnellen seriellen Bus, wie er auch beim ADC LTC1864 verwendet wird. Auf ATmega-Seite haben wir den SPI „zu Fuߓ implementiert (einige Bits von Port B). Der Controller besitzt zwar einen Hardware-SPI-Bus, der aber nur einen einzigen Baustein steuern könnte. Mit der steigenden Flanke auf STRDAC (PB3) übernimmt der DAC das eingeschobene Datum in sein Ausgangsregister, worauf die Ausgangsspannung den eingestellten Wert annimmt. Die ist bei den verwendeten LTC-Bausteinen allerdings unipolar und mit 0 bis rund 2 V (bzw. 0 bis 4 V beim LTC1655) auch zu gering für den angepeilten Zweck. Deshalb entfernt eine „Bipolarisierschaltung“ mit einem Doppel-OpAmp den Gleichspannungs-Offset (halbe Referenzspannung) und hebt auch gleichzeitig den Spannungshub auf ± 10 V an. Sollten Sie der Versuchung erliegen, eigene Treiber für die Schaltung programmieren zu wollen: Der Verstärker arbeitet invertierend, ein Datum von „0“ erzeugt also die volle positive, ein „$FFFF“ die volle negative Ausgangsspannung. Die ADA-IO-Firmware trägt diesem Umstand natürlich Rechnung und bereitet die Ausgabewerte entsprechend auf, passend für den jeweils eingesetzten Wandlertyp.

## Firmware-Plug&Play

Da der Controller nicht ohne Weiteres feststellen kann, ob und welcher der beiden möglichen D/A-Wandler seinen Dienst versehen soll, haben wir mit der „Sense“-Leitung auf PB7 eine einfache „Plug&Play“-Mimik implementiert. Stellt die Firmware beim Rütteln an der Datenleitung PB1 fest, dass die Diode D1 die Sense-Leitung auf logisch Null zieht, vermerkt er das Vorhandensein eines 12-Bit-Wandlers in seiner Treiber-Liste. Ist zusätzlich D2 eingelötet, wird stattdessen der 16-Bit-Treiber eingebunden. Ein ähnlicher Mechanismus findet sich übrigens auch auf der AD16-8-Karte. PC-programmseitig ist es deshalb völlig egal, ob der Wandler 12 oder 16 Bit auflöst, es kommt immer die richtige Ausgangsspannung heraus.

Geizig wie wir sind, haben wir auch der DA12-8-Karte einen (De-) Multiplexer spendiert und damit sieben DAC-Bausteine eingespart; den Software-Overhead steckt der Atmel-RISC-Controller locker weg. Die DAC-Ausgabe läuft wie die ADC-Routine im gleichen Ein-Millisekunden-Interrupt der Firmware, nach spätestens 8 ms sind alle acht Ausgänge aktualisiert. Dem auch als Sample-Stufe genutzten Multiplexer folgen acht Hold-Stufen aus Kondensator und Spannungsfolger-OpAmp, die den Spannungswert für sieben Millisekunden zwischenspeichern und für eine knackig-niedrige Ausgangsimpedanz sorgen. Letztere wird zwar durch die Widerstände R12 bis R19 etwas enthärtet, aber ohne ebendiese neigen die OpAmps zum Schwingen, wenn die Lastkapazität (z. B. Kabel) einen gewissen Wert überschreitet. Bei kurzen Verbindungen und rein ohmscher Last können Sie diese Widerstände auch durch Drahtbrücken ersetzen.

Die 16-Bit-Version des Wandlers stellt an die Operationsverstärker erhöhte Anforderungen bezüglich Offsetspannung und Drift; das niederwertigste Bit ist hier ja nur noch rund 300 µV klein, während die Offset-Fehlerspannung bei FET-OpAmps durchaus im zweistelligen Millivolt-Bereich liegen kann. Zwar lässt sich der Offset-Fehler jedes einzelnen Ausgangs mit dem OFS-Parameter des ADA-IO-Moduls ausgleichen, die Temperatur-Drift kann der Softwaregegenangriff jedoch nicht kompensieren. Für U1 sollten Sie dann statt des TL072 den weit besseren OPA2107 oder den AD712 verwenden, für U4 und U5 statt der TL074ACN/LF444 je einen AD713. Gegen einige (zig) Mikrovolt Offset-Fehler kann man ohnehin nichts unternehmen, die entstehen schon durch Thermospannungen an unterschiedlich warmen Lötverbindungen und Steckkontakten.

Ist Jumper JP2 vorhanden, erhält der D/A-Wandler eine externe Referenzspannung zugeführt, etwa die hochstabile der AD16-8-Karte, wenn dort der Referenzspannungs-Jumper ebenfalls steckt. Die interne Referenz des ATmega32 muss dann natür-lich abgeschaltet werden (mit „REF=0!“), da sie an der gleichen Leitung hängt. Die externe Referenzspannung muss höher sein als die interne der DACs (bei beiden 2,048 V, siehe hierzu auch die Datenblätter). R6 und R4 bestimmen die Verstärkung und damit die maximale Ausgangsspannung, bei externer Referenzspannung muss man sie den neuen Gegebenheiten anpassen (R6 bei Uref=2,56 V auf 1k2 erhöhen).

## Aufzucht und Pflege

Für beide Karten gibt es bei eMedia und segor professionell gefertigte Leerplatinen, mit dem einseitigen Layout (veröffentlicht auf der c't-Lab-Projekt-Seite) sollten aber auch Selbst-Ätzer gut klarkommen; unter dem Soft-Link finden Sie gut nachvollziehbare Anleitungen. Die Fertigplatinen haben allerdings den Vorteil, dass die eingezeichneten Drahtbrücken entfallen können, weil sie doppelseitig kaschiert und durchkontaktiert ausgeführt sind. Zudem bietet ihre großflächige Masseführung auf der Bestückungsseite bei den doch recht kritischen Schaltungen deutliche Vorteile. Wer bei seinem Händler nur die SMD-Version des LTC1257 oder LTC1655 bekommt, muss ohnehin auf die doppelseitige Version der DA12-8-Platine zurückgreifen, da nur hier alternative SMD-Lötpads auf der Bestückungsseite vorgesehen sind. Trotz alledem: Unser Musteraufbau funktionierte auch mit einseitigen Ätzungen aus Mutters Auflaufform gut.

![[komplementaeres-paar-291076-05.jpeg]]

*Schon weitgehend der Serie entspricht dieses Wandlerpärchen. Die bei eMedia erhältlichen Fertigplatinen sind allerdings doppelseitig durchkontaktiert ausgeführt, sodass die Drahtbrücken entfallen können und sich eine bessere Masse-Führung ergibt.*

Beachten Sie auf der DA12-8-Karte die bei LTC1257 und LTC1655 unterschiedliche Widerstandsbestückung: Mit dem LTC1257 ist für R7 eine Drahtbrücke einzusetzen, R8 entfällt. Beim LTC1655 bestückt man R7 und R8 mit je 10k 0,1 %. Grund ist der unterschiedliche Ausgangsspannungsbereich, der beim LTC1257 0V bis 2,048 V und beim LTC1655 0V bis 4,096 V beträgt. Die Hold-Kondensatoren C6 bis C15 sind mit 100n bemessen, weil die „Charge Injektion“-Ladung des Multiplexers sonst die Ausgangsspannung beim Umschalten der Kanäle zu sehr verschieben würde. Verwenden Sie hier nur hochwertige Folienkondensatoren, keramische sind für diesen Zweck weniger geeignet.

Es versteht sich von selbst, das billige 5%-Kohleschichtwiderstände auf den vorgestellten Platinen nichts zu suchen haben. Bei den 16-Bit-Wandlern sind sogar die handelsüblichen 1%-Metallfilmwiderstände überfordert, die mit ihrem Temperaturkoeffizienten von bis zu 200ppm/°C (TK200) alle Genauigkeits-Bemühungen der Wandler zunichte machen. Verwenden Sie hier wie in den Stücklisten angegeben die 0,1%-Ausführungen mit TK50 oder besser. Diese Widerstände kosten zwar rund einen Euro das Stück, was bei der begrenzten Anzahl aber zu verschmerzen ist. Der 12-Bit-Wandler kommt dagegen durchweg mit 1%-Widerständen aus.

Die weitere Bestückung ist bis auf die SMD-Bauteile auf der AD16-8-Karte unkritisch. Nach dem Einschalten sollte ADA-IO auf einem Terminal-Programm (z. B. HyperTerm, eingestellt auf 38400/8n1, lokales Echo eingeschaltet) die übliche Begrüßungsmeldung zeigen, nun allerdings mit einer Aufzählung der eingesetzten I/O- und Wandlerkarten.

## Henne und Ei

Die Messmittel zum Abgleich sollten immer eine Dekade besser sein als das zu kalibrierende Objekt. Für die A/D-Wandlerkalibrierung mit Prüfsiegel und Zertifikat benötigen Sie - aus offizieller Sicht - ein PTB-rückführbares Spannungsnormal, also eines, dessen Kalibrierkette bei der PTB in Braunschweig endet. Die verleiht ihr Super-Volt nämlich nur ungern, und zum Abgleich bräuchten Sie sogar zehn davon.

![[komplementaeres-paar-291076-06.jpeg]]

*Das AD-Abgleichprogramm kann nur einen der acht Eingangskanäle gleichzeitig bearbeiten. Die aktuelle Kanalnummer stellt man mit dem Schieber links ein. Der ausgelesene Rohwert des ADCs wird integriert, damit sich eine ruhigere Anzeige zur Offset-Kompensation ergibt.*

Es geht aber auch einfacher. Wenn es Ihnen nur auf relative Genauigkeit ankommt, genügt auch ein Voltmeter vom Elektronikversandhaus, ergänzt mit einer auf 10 V einstellbaren, stabilen Spannungsquelle. Besser ist natürlich ein möglichst frisch kalibriertes Digitalvoltmeter mit mindestens fünf Stellen Genauigkeit, etwa ein Fluke 45 oder ein Agilent 34401A - die sind teuer, deshalb gegebenenfalls ausleihen. Für den 12-Bit-Wandler oder den Vorabgleich tut es auch ein gutes Handmultimeter. Wenn Sie den LT1019-2,5 auf der AD16-8-Karte mit R13 einmalig auf genau 2,56000 V Ausgangsspannung abgleichen (Pluspol an TP Ref, Minus an Masse direkt auf der AD16-8-Karte, vorher mindestens 20 Minuten warmlaufen lassen, ebenso das Messmittel), haben Sie schon einmal eine gute Referenz für spätere Kalibrierarbeiten.

Die ADA-IO-Subkanäle für die AD16-8-Karte reichen von 10 bis 17. Wenn Sie nun mit „0:VAL 10?“ den ersten AD-Kanal abfragen, sollte ADA-IO mit einem Messwert ungleich Null antworten, da sich am „floatenden“ Analog-Eingang irgendeine Spannung zwischen -10 und +10 V einstellen wird - aber bestimmt nicht exakt 0V. Wenn Sie AD16-8/PL2 Pin 1 mit Pin 10 kurzschließen, wird sich auf Anfrage ein Messwert in grober Nähe zu 0 ergeben. Der verbleibende Offset-Fehler wird später per OFS-Parameter korrigiert, ebenso der Skalenfaktor.

An allen Ausgängen DA12-8/PL1 (Aout0 bis Aout7, Pin 1 bis 8) sollten nach dem Einschalten rund 0 Volt zu messen sein. Wählen Sie den 200-mV-Bereich ihres Multimeters und gleichen Sie die Spannung an DA12-8/PL1 Pin 1 (Minuspol an Pin 10) mittels R5 auf Minimum (0V) ab. Stellen Sie nun mit „0:VAL 20=10!“ eine Soll-Ausgangsspannung von +10 V an DA12-8/PL1 Pin 1 ein. Mit DA12-8/R4 bringen Sie nun den Ist-Wert auf die gewünschten +10 V. Dieser Vorgang sollte so lange wiederholt werden, bis beide Werte stimmen.

## Massen-Demo

Für beide Karten haben wir größtenteils selbsterklärende Abgleichprogramme unter LabView erstellt (siehe Bild), die die Kalibrierarbeiten stark vereinfachen. Kontrollieren Sie nach dem Start, ob als „Ressource“ auch die gewählte COM-Schnittstelle erscheint; gegebenenfalls müssen Sie diese im „Measurement & Automation Explorer“ (MAX) neu zuweisen. Bei einwandfreier Kommunikation blinkt das „Valid Response“-Feld rhythmisch auf. Mit den Buttons „Read“ und „Write“ können Sie die Offset- und Skalenfaktor-Werte jedes Kanals auslesen und neu beschreiben, die nötige vorherige Schreibfreigabe erledigt das Programm selbst. Beim DA12-8-Abgleich sollten sich die Korrekturen auf die gegebenenfalls leicht unterschiedlichen Offset-Spannungen der restlichen Ausgangs-OpAmps beschränken, da Ausgang Aout1 ja bereits durch den Hardwareabgleich genullt wurde. Ein Offset-Wert von +1 entspricht beim 12-Bit-Wandler einer Spannung von +5 mV, beim 16-Bit-Wandler von etwa +300 µV. Stellen Sie den Offset jedes Kanals so ein, dass sich eine möglichst geringe (<5 mV) Ausgangsspannung ergibt. Der große Spannungs-Wahlschalter rechts steht für diesen Abgleichpunkt natürlich auf „0V“.

Bei der AD16-8-Karte müssen Sie sowohl Offset-Spannung als auch Skalenfaktor Software-kalibrieren, um Exemplarstreuungen des Spannungsteilers auszugleichen; wegen der sehr feinen „Körnung“ des 16-Bit-Wandlers haben wir auf eine Hardwareabgleichmöglichkeit (bis auf die Referenzspannungseinstellung) verzichtet. Schließen Sie zunächst sämtliche Analogeingänge (Ain0 bis Ain7) mit Masse (PL2 Pin 9 und 10) kurz - am besten mit einem selbstgefertigten Kurzschlussstecker, längere Kabel sind unbedingt zu vermeiden - und beobachten Sie die Ausgangsspannungsanzeige.

Die Zoom-Taste bewirkt eine Anzeige-Dehnung um den Faktor 1000. Der Zeiger des virtuellen Messwerks sollte nun gleichmäßig um den Nullpunkt herum hüpfen, wenn der Offset-Wert stimmt. Auf dem Oszillogramm sehen Sie nun das Eigenrauschen des Wandlers, das laut Datenblatt etwa 4 LSB-Zählerpunkte betragen darf; einen gewissen Beitrag zum Rauschen leisten auch die vorgeschalteten OpAmps. Die aufgezeichnete Linie liegt bei korrektem Offset-Abgleich genau in der Mitte. Das Feld „Raw“ zeigt den naturbelassenen Roh-Integerwert des Wandlers an, mit dem blauen Button kann man diesen Wert negiert in das Offset-Feld kopieren und den eingestellten Kanal damit nullen („Write“ nicht vergessen).

Etwas kritischer gestaltet sich der Skalenfaktor-Abgleich, da hierfür eine hochstabile +10-V-Quelle benötigt wird. Ein Labornetzteil aus der Amateurliga eignet sich dafür in der Regel nicht, da es viel zu stark driftet. Ersatzweise könnte die eigene Referenzspannung der AD16-8-Karte dafür herhalten - natürlich nur, wenn sie hochpräzise abgeglichen wurde; leider beträgt sie nicht 10 V, sondern nur 2,56 V. Wir schlagen daher vor, dass Sie erst den DA12-8-Abgleich durchführen und deren Ausgangsspannung (mit dem Wahlschalter auf +10 V einstellen) als Kalibrierspannung für die AD16-8-Karte verwenden. Ein parallel angeschlossenes Digitalvoltmeter dient dabei zur Kontrolle. Stellen Sie den jeweiligen AD-Skalenfaktor einfach so ein, dass die Anzeige mit dem abgelesenen Wert auf dem Digitalvoltmeter übereinstimmt. Der Ein- und Ausgangsspannungsbereich der c't-Lab-Karten über alles endet übrigens nicht bei exakt 10 V, sondern bei 10,23 V, sodass immer etwas Abgleichreserve bleibt.

Beide LabView-Programme können auch gleichzeitig laufen. Wenn Sie den Analog-Ausgang der DA12-8-Karte mit dem AD16-8-Eingang über ein 10-poliges Flachbandkabel verbinden, sollten Sie die eingestellte Ausgangsspannung jedes DA-Kanals gleichzeitig am AD-Eingang messen können. Stimmen die Werte aller Kanäle überein, ist das Wandlerpärchen einsatzbereit.

## Völlig ausgelöst

Den möglicherweise mit jeder Firmware-Revision aktualisierten oder erweiterten Befehlssatz können Sie als Tabelle auf unserer Projektseite (siehe Soft-Link) einsehen. Gegenüber der in c't 11/2007 abgedruckten Fassung sind inzwischen Befehle zur externen Triggerung (Logik-Signal an PL1 von AD16-8) hinzugekommen, die einer näheren Erläuterung bedürfen.

Viele Messaufgaben lassen sich mit dem Trigger-Eingang vereinfachen oder automatisieren. Im normalen Polling-Betrieb liefert ADA-IO nur auf explizite Messwertabfrage ein Messergebnis, das jeweils aktuell ermittelt wird. Mit der Trigger-Funktion kann man dafür sorgen, dass ADA-IO die Messwerte automatisch und ohne Abfrage ausspuckt. Zu jedem Analogport und auch zu den Digital-I/Os existiert eine sogenannte Trigger-Maske, in der die einzelnen Bits den jeweiligen Messkanal beziehungsweise I/O-Port repräsentieren. Ist ein Bit gesetzt, liefert ein Trigger-Impuls an AD16-6/PL1 die Messergebnisse zu dem entsprechenden Kanal automatisch. Beispiel: Setzt man mit „TRM **1**=15!“ die ersten vier Bits (15 = 00001111 binär) in der Trigger-Maske für die AD16-8-Karte (Subkanäle **1**0 bis **1**7), liefert ein Trigger-Impuls auch die Messergebnisse der ersten vier A/D-Subkanäle (10 bis 13, Ain0 bis Ain3). Mit dem „TRL“-Parameter (Trigger-Level) legt man fest, ob die Triggerung auf der positiven (TRL=1!) oder negativen (TRL=0!, Default) Flanke des Logik-Signals erfolgen soll. Auf der AD16-8-Karte zieht Pullup-Widerstand R2 das Trigger-Signal nach +5 V, sodass ein einfacher Schaltkontakt nach Masse reicht, um den Messvorgang auszulösen.

Mit dem Trigger-Timing-Parameter „TRT“ kann man eine periodische Triggerung erzwingen: „TRT=1000!“ zum Beispiel liefert eine Messwertausgabe anhand der gesetzten Trigger-Masken-Bits einmal pro Sekunde (1000ms), auch wenn kein Trigger-Impuls anliegt. Mit „TRT=0!“ schaltet man die periodische Ausgabe wieder ab (Default). Werte unter 10 ms sind wegen des internen 8-ms-Messzyklus nicht sinnvoll und auch nicht zulässig, die Trigger-Maske für den Analogausgang (TRM 2) wird ignoriert. Ein gesetztes Masken-Bit für die I/O-Ports gilt für den gesamten 8-Bit-Port: „TRM 3=31!“ beispielsweise liefert bei Triggerung die Bytewerte für die IO8-32-Ports 1 bis 5. Alle Trigger-Parameter bleiben im EEPROM-Bereich des ATmega-Controllers dauerhaft gespeichert, Änderungen verlangen immer eine vorherige Schreibfreigabe mit „WEN=1!“, wie in c't 11/2007 beschrieben.

Das ADA-IO-Modul ist mit den hier vorgestellten Wandler-Boards vorerst vollständig; der bei voller Bestückung noch frei bleibende Slot kann für eigene Erweiterungen, etwa Sensorvorverstärker, dienen. Zu einem späteren Zeitpunkt der Serie wird noch eine Timer/Counter-Karte nachgereicht, die Impulse und Frequenzen zählen kann. Der nächste c't-Lab-Beitrag stellt erst einmal das versprochene Funktionsgeneratormodul DDS samt Bedien-Panel vor.

***[**Soft-Link [1]**](https://www.heise.de/hintergrund/c-t-Lab-Bausteine-zum-Messen-Steuern-und-Regeln-284113.html)***

[**Forum zu c't-Lab [2]**](https://ctlabforum.thoralt.de/phpbb/index.php)

## Stückliste AD16-8

### Halbleiter

| ID | Type |
| -- | ---- |
| D1 | 1N4148 |
| U1 | AD712 oder OPA2107A DIL |
| U2 | LT1019-2,5 oder REF-43 DIL |
| U3 | DG508 od. DG408 DIL |
| U4 | LTC1864 SO8 |

### Passive Bauteile

| ID          | Type                                |
| ----------- | ----------------------------------- |
| C1, C2, C5  | 4µ7 35V Ta.                         |
| C3          | 220n SMD1206                        |
| C9          | 2n2 SMD0805                         |
| C4          | 1n ker.                             |
| C6          | 100n 63V MKT                        |
| C7,C8       | 100n ker.                           |
| L1          | 10µH axial                          |
| R1, R4, R16 | 470R SMD0805                        |
| R15         | 10k SMD0805                         |
| R2          | 4k7                                 |
| R3          | 2k2                                 |
| R5          | 10k 0,1%                            |
| R6          | 2k67 0,1%                           |
| R7          | 75k 0,1%                            |
| R8          | 100R                                |
| R9          | 15k 0,1%                            |
| R10         | 8k06 0,1%                           |
| R11         | 2k 0,1%                             |
| R12         | 1k 0,1%                             |
| R14         | 10k 0,1%                            |
| R17,R18     | 10R                                 |
| R13         | 2k Präz.-Trimmer stehend, inline    |
| PL1         | 2pol. Platinen-Steckverbinder mit Kabel |
| PL2         | Pfostenverb. 10pol.                 |
| JP1, JP2    | Jumper (siehe Text)                 |
| CONN1       | VG-Messerleiste 64pol, 90° a/b, Platine AD16-8 |

## Stückliste DA12-8

### Halbleiter

| ID     | Type                      |
| ------ | ------------------------- |
| D1     | 1N4148                    |
| D2     | entfällt                  |
| U1     | TL072                     |
| U2     | LTC1257 DIL               |
| U4, U5 | TL074ACN oder LF444 DIL   |
| U3     | DG508 od. DG408 DIL       |

### Passive Bauteile

| ID                        | Type                                   |
| ------------------------- | -------------------------------------- |
| C1, C6...C9, C12...C15    | 100n 63V MKT                           |
| C4, C10, C11             | 100n ker.                              |
| C2, C5                   | 47µ 25V                                |
| C3                       | 4µ7 35V Ta.                            |
| L1                       | 10µH axial                             |
| R1...R3, R9             | 10k 0,1%                               |
| R6                       | 953R 0,1%                              |
| R7                       | 0R (Drahtbrücke)                       |
| R8                       | entfällt                               |
| R10                      | 10k                                    |
| R11...R19                | 100R                                   |
| R20, R21                 | 10R                                    |
| R4                       | 100R Präz.-Trimmer stehend, inline     |
| R5                       | 200R Präz.-Trimmer stehend, inline     |
| PL1                      | Pfostenverb. 10pol.                    |
| JP1                      | Jumper (siehe Text)                    |
| CONN1                    | VG-Messerleiste 64pol, 90° a/b, Platine DA12-8 |

### Bestückungsvariante 16 Bit

| ID     | Type                  |
| ------ | --------------------- |
| D2     | 1N4148                |
| U1     | AD712 oder OPA2107    |
| U2     | LTC1655 DIL oder SO8  |
| U4, U5 | AD713 DIL             |
| R7, R8 | 10k 0,1%              |

RSPEAK_STOP
(cm)
RSPEAK_START

**URL dieses Artikels:**

`https://www.heise.de/-291076`

**Links in diesem Artikel:**

1. https://www.heise.de/hintergrund/c-t-Lab-Bausteine-zum-Messen-Steuern-und-Regeln-284113.html
2. https://ctlabforum.thoralt.de/phpbb/index.php

*Copyright © 2007 Heise Medien*
