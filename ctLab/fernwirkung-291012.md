# Fernwirkung

Source: [https://www.heise.de/ratgeber/Fernwirkung-291012.html](https://www.heise.de/ratgeber/Fernwirkung-291012.html)
Print view: [https://www.heise.de/ratgeber/Fernwirkung-291012.html?seite=all&view=print](https://www.heise.de/ratgeber/Fernwirkung-291012.html?seite=all&view=print)
Author: Carsten Meyer
Series references: c't 10/07, S. 124

> Mess- und Steuerelektronik zum Anschluss an den PC ist entweder horrend teuer oder von begrenztem Gebrauchswert. Wer mehr verlangt als eine Relaiskarte zum Anschluss an den Druckerport, lässt für industrielle Lösungen schnell einige Monatsgehälter beim Händler. Für unsere leistungsfähigen Mess- und Steuerungsmodule zum Selbstbau lohnt es durchaus, den Lötkolben noch einmal anzuheizen.

Der kreative Umgang mit elektronischen Bauteilen gerät leider immer mehr in Vergessenheit - es gibt ja auch fast nichts mehr, was Fernost nicht deutlich unter dem hiesigen Selbstkostenpreis einzeln gekaufter Bauelemente herstellen kann. Bei Nischenprodukten sieht die Sache noch etwas anders aus. Wer heutzutage noch den Lötkolben schwingt, bastelt an retro-schicken Röhrenverstärkern, restauriert als vergeltende Antwort auf die hyperschnellen Produktzyklen heutiger Konsumelektronik historische Radios oder bringt elektronische Musikinstrumente aus der Nachkriegszeit wieder auf Vordermann, auf dass sie noch mal 50 Jahre halten.

Auch der Themenbereich Messen, Steuern, Regeln oder kurz MSR fällt eigentlich in die Sparte der Nischenprodukte. Stückzahlen sind überschaubar, die industrielle Klientel zahlungskräftig und die Technik mitunter so speziell, dass sie außerhalb der Interessenlage der Großseriengewinnler liegt. Nicht umsonst können Unternehmen wie Agilent, Tektronix, National Instruments oder Rohde & Schwarz hochwertiges Mess-Equipment immer noch erfolgreich im Westen entwickeln und produzieren.

Wohlgemerkt: Wir sprechen hier nicht vom Digitalvoltmeter in Baumarktqualität, sondern von laborgeeigneten Messgeräten, die manchmal über zehn Jahre und länger unverändert gebaut werden - für die Konsumelektronik- und Computerindustrie ein unvorstellbar langer Zeitraum. Dementsprechend gering ist der Wertverfall hochwertiger Messgeräte: Wenn Sie vor 15 Jahren beispielsweise ein HP-Digitalvoltmeter 3458 erworben haben, bekommen Sie heute noch mindestens 3000 Euro dafür - nicht nur, weil es immer noch (inzwischen vom HP-Ableger Agilent) gebaut wird, sondern weil es unerreicht genau, kalibrierbar, schnell und für automatisierte Messaufgaben mit einem PC verbunden werden kann. Womit wir in zweierlei Hinsicht bei unserem Selbstbauprojekt wären: Zum einen ist das Preisniveau bei hochwertiger MSR-Elektronik - auch gebraucht - immens hoch, sodass sich der Selbstbau tatsächlich lohnt, und zum anderen ist unser Projekt natürlich an PC oder Mac anschließbar.

## Was es ist

Fangen wir lieber damit an, was es nicht ist: Das c't-Lab stellt weder eine Konkurrenz zu einem 10-Euro-Multimeter noch zu einer Relaiskarte am PC-Druckerport dar. Es ist auch keineswegs an einem Wochenende zu wuppen und setzt gewisse Fertigkeiten voraus, sowohl elektronischer als auch feinmechanischer Natur. Im Vollausbau verschlingt es ein-, zweihundert Euro nur für die Bauteile und möglicherweise ebenso viele Stunden für Aufbau, Abgleich und die PC-seitige Programmierung, zumal, wenn Sie mehr damit anfangen wollen als mit den mitgelieferten Demo-Programmen zu spielen. Oszilloskop und HF-Pegelsender kann es auch nicht ersetzen, obwohl einige der Module den Labortisch deutlich bereichern.

Industrielle Steuerungen für Großprojekte sind ebenfalls eine andere Leistungsklasse, aber eine überschaubare Prozess- oder Ablaufsteuerung lässt sich mit unserem Projekt sehr wohl verwirklichen, ebenso wie das rechnergesteuerte Fernabfragen von Messstellen aller Art. Ein weites Einsatzfeld stellt die Heimautomatisierung dar - dank der Netzanbindung sogar mit Web-Interface. Die Umsetzung der Mess- und Steuergrößen besorgen die vorgestellten Module, für die visuelle Aufbereitung oder die Regelvorgänge ist dann der Rechner zuständig.

Das System ist in allen Belangen modular und skalierbar, das heißt, Sie müssen nur das aufbauen, was Sie wirklich für eine gegebene Mess-, Steuer- oder Regelaufgabe benötigen. Es ist didaktisch wertvoll, weil die zugrunde liegenden Treiber und Firmware-Programme offenliegen und gut dokumentiert sind. Es orientiert sich eher an den Belangen (und dem Geldbeutel) nichtkommerzieller Anwender, auch im edukativen Bereich. Und es verlangt nicht nach einem bestimmten Betriebssystem oder einer bestimmten Rechner-Marke - mit USB, RS-232 und Ethernet-Port findet es so gut wie überall Anschluss.

Voraussetzung für seinen Einsatz in der Regelungstechnik ist, dass sich die Messgrößen per Messaufnehmer oder Sensor in eine analoge Spannung wandeln lassen - sei es Druck oder Dehnung, pH-Wert oder Beleuchtungsstärke, Temperatur oder schlicht der Zustand eines Schalters, und dass man die ausgegebenen analogen Spannungen per Relais oder Servo-Motor, Phasenanschnitt-Steuerung oder Leistungsendstufe wieder in Stellgrößen umsetzen kann. Die Messtechnik beschränkt sich auf ersteren Teil, die Steuerungstechnik auf letzteren. Ein weites Einsatzfeld findet sich im Elektronik-Labor - hier entfällt (zum großen Teil) die Umsetzung der Mess- und Steuerungsgrößen, denn Spannungen und Ströme lassen sich einfacher messen und steuern als der Pegelstand eines Säuretanks oder die Bakterientätigkeit in einem Klärbecken.

![[fernwirkung-291012-01.jpeg]]

*Voll ausgebautes c't-Lab-System im 19"-Rack. Einige der Platinen besitzen einen Anschluss für ein Bedien-Panel, hier bei DCG-, DIV- und DDS-Modul. Links erkennt man die drei Interfaces USB, TP-Ethernet und RS-232.*

Unser MSR-Labor kann aus bis zu acht adressierbaren Modulen bestehen, die da wären: I/O-Karte mit haufenweise I/O- und A/D-D/A-Leitungen, Digitalvoltmeter mit AC- und DC-Messbereichen, programmierbares Netzteil, NF-Funktionsgenerator und schließlich ein Timer-/Zähler-Modul. Jede Karte kann im System auch mehrmals vorhanden sein, man muss ihr nur (per Jumper) eine eigene Adresse zuteilen. Besonderer Clou ist die Potenzialtrennung der Karten untereinander und zum steuernden Rechner: Masseschleifen sind deshalb kein Thema, außerdem ermöglicht das Konzept ein potenzialfreies Messen. Es ist zum Beispiel ohne Weiteres statthaft, Funktionsgeneratoren und Netzteile in Reihe zu schalten oder mit dem Digitalvoltmeter-Modul die Spannung an einem Bauteil mitten in einer Schaltung zu messen.

Zu den Karten im Einzelnen: Besonders universell ist die I/O-Karte ADA. Sie kann nach Belieben mit bis zu 64 rein digitalen (will heißen: Ein/Aus) Ports bestückt werden, aber auch mit mehrkanaligen A/D- und D/A-Bausteinen. Die I/O-Ports liefern beziehungsweise akzeptieren TTL-Pegel (0V/5V) und können bitweise in der Richtung als Ein- oder Ausgang konfiguriert werden. Der A/D-Wandler besitzt acht Kanäle mit je 16 Bit Auflösung bei einem Eingangsspannungsbereich von ±1 oder ±10 Volt. In die andere Richtung hat man die Wahl zwischen einer preiswerten Ausführung mit 12 Bit Auflösung oder einer besonders genauen mit 16 Bit (Ausgangsspannung ebenfalls entweder ±1 oder ±10 Volt). Auch beim D/A-Wandler stehen acht Kanäle zur Verfügung. Werden mehr benötigt, können einfach weitere I/O-Karten hinzugefügt werden. Für die A/D-Kanäle wird es noch einen Vorverstärker geben, der die Signale „niederpegeliger“ Messwertaufnehmer konditioniert; er ermöglichst ferner Gleichstrommessungen ohne Spannungsabfall. Dabei kann - wie bei den anderen Karten auch - jeder Messkanal per Software kalibriert werden, das Fummeln an einer Batterie Mehrgang-Potis entfällt (größtenteils). Softwaremäßig einstellbar sind sowohl Offsetspannung als auch Skalenfaktor.

## Messen und Schätzen

Die Digitalvoltmeter-Karte DIV bietet nur einen Messkanal, aber der ist ferngesteuert umschaltbar von 100 mV bis 1000 V „Vollausschlag“, sowohl für Gleich- als auch für Wechselspannung bis 100 kHz. Die Wandlerauflösung beträgt hier 10 Bit (bei 1000 Messungen/s) oder umschaltbar 24 Bit, von denen etwa 20 Bit effektiv nutzbar sind (bei fünf Messungen/s). Das mag sich im Vergleich zu modernen Audiokarten, die ebenfalls mit 24 Bit Auflösung arbeiten, bescheiden anhören, hier muss man aber deutlich zwischen Auflösung und Genauigkeit unterscheiden. Die unteren der 24 Bits fluktuieren im empfindlichsten Messbereich schon, wenn man die Karte oder das Messkabel nur im Erdmagnetfeld bewegt (Induktion) oder die eine Messspitze etwas wärmer ist als die andere (Thermospannung)!

Spannungen mit 24 Bit Genauigkeit kann nur die PTB (mit erheblichem Aufwand, z.B. supraleitenden Josephson-Kontakten und Kelvin-Varley-Teilerketten im temperierten Ölbad) reproduzierbar darstellen, schon Abweichungen unter 10 ppm (10 Millionstel = 0,001 %) gelten gemeinhin als Magie. Verständlich, dass das eingangs erwähnte, auf 4 ppm genaue HP 3458 so teuer ist - und dass wir uns mit der Vorstellung dieser Karte noch etwas Zeit lassen, Aufbau und Abgleich sind nicht ohne.

![[fernwirkung-291012-02.jpeg]]

*DCG ist mehr als nur ein programmierbares Nertzteil - man kann damit auch den Widerstand von Temperatursensoren messen oder eine 20-mA-Stromschleife für industrielle Sensoren aufbauen.*

Einfacher aufzubauen ist die Netzteilkarte DCG (DC-Generator), aber ihr Gebrauchswert ist nicht minder groß. Sie liefert in zwei Spannungs- und vier Strombereichen Spannungen zwischen 0 und 20 Volt sowie Ströme zwischen 2µA und 2A, in jedem Bereich mit vollen 12 Bit Auflösung (4096 Stufen). Sie kann durch eingebaute A/D-Wandler den jeweiligen Ist-Wert zurückliefern, etwa den Strom, der tatsächlich durch den Verbraucher fließt oder die Spannung, die bei voreingestelltem Strom daran anliegt. Ohne weitere Hilfsmittel kann man damit beispielsweise die Kennlinie einer Diode oder die Ladekurve eines Akkumulators aufnehmen, eine 20mA-Stromschleife für industrielle Sensoren aufbauen oder ganz profan eine Bastelschaltung mit Strom versorgen. Zusammen mit einem D/A-Kanal des I/O-Moduls ADA als Steuerspannungsquelle lassen sich sogar Kennlinienfelder von Transistoren ermitteln.

## Schnell wechselnd

Nicht nur Audiofreunde werden am Funktionsgenerator-Modul DDS gefallen finden, das Frequenzen zwischen 0,1 Hz und 250 kHz erzeugen kann - mit den Wellenformen Sinus, Dreieck und Rechteck. Es arbeitet mit einem modernen Direct-Digital-Synthesis-Chip (daher der Name), die Ausgangsfrequenz ist quarzgenau und auf 0,1 Hz genau einstellbar. Die Ausgangsspannung kann mit einem Gleichspannungs-Offset von ±10 Volt beaufschlagt werden, Offset und Pegel werden mit 12 Bit Auflösung auf weniger als 0,02 dB genau eingestellt. Der Klirrfaktor beträgt um 0,05 %, was für Audio-Messungen an High-End-Verstärkern nicht ganz ausreichen wird, wohl aber für Messungen an Spulen, Kondensatoren und Niederfrequenz-Vierpolen.

Das Messlabor komplettiert später noch ein Zähler-/Timer-Modul, dessen Pflichtenheft derzeit aber noch für Ideen offen ist. Zumindest wird es wie alle genannten Module mit eigener Intelligenz (sprich einem eigenen Mikrocontroller) ausgerüstet, der die Ansteuerung der Hardware und das Auslesen der Messwerte erledigt. Durch das Auslagern der hardwarenahen Routinen auf die jeweilige Karte wird der modulare Aufbau erst möglich: Jede Karte erhält eine eigene Adresse, vergleichbar vielleicht mit einem MIDI-Kanal, unter der sie für den Anwender (oder seinem Programm) erreichbar ist. Die Ähnlichkeit mit der Musikinstrumenten-Schnittstelle wird auch an anderer Stelle deutlich, nämlich bei der Potenzialtrennung durch Optokoppler am jeweiligen Dateneingang. Wie bei MIDI reicht eine Karte Messwerte und Befehle über ihre serielle Schnittstelle an die nächste weiter, bis die Daten schließlich zum Rechner gelangen. Im Unterschied zu MIDI erfolgt die Kommunikation aber mit höherer Geschwindigkeit, namentlich 115 oder 38,9 kBit/s.

![[fernwirkung-291012-03.jpeg]]

*Die Daten der Messmodule werden über ein Flachbandkabel von Modul zu Modul weitergereicht (im Bild: DIV, ADA-I/O und DDS). So erreicht man eine deutlich höhere Flexibilität als mit einem Backplane-Bussystem. Vorn links auf jeder Karte erkennt man den Anschluss für die Netzplatine.*

Zur Kommunikation mit dem Rechner dient ein Interface, dem wir drei verschiedene Schnittstellen spendiert haben: USB, RS-232 und TP-Ethernet. Den im industriellen Bereich gern verwendeten GPIB (vormals HP-IB oder IEEE-488) haben wir außen vor gelassen, weil er als Standard-Schnittstellenausrüstung am PC eher selten anzutreffen ist, ebenso wenig wie VXI- oder CAN-Bussysteme. Das Interface verhält sich protokollmäßig völlig passiv und transparent, es greift selbst nicht in den seriellen Datenstrom ein, sondern wandelt die Signalformen nur in ein den Karten genehmes Format - im Prinzip eine 5-mA-Stromschleife.

## Fernwirken

Die Ethernet-Schnittstelle nutzt den aus einigen c't-Projekten bekannten XPort-Baustein von Lantronix, ein Mini-Web-Server, der neben einer COM-Port-Emulation auch die direkte Hardware-„Ansprache“ über einen IP-Port erlaubt. In das Flash-ROM des Bausteins lässt sich eine Java-Applikation nebst Webseiten-Gerüst laden, die sich direkt mit den c't-Lab-Karten unterhält und auch für die Aufbereitung der Messergebnisse sorgt. Der Messklotz ist damit nicht mehr ortsgebunden, man kann ihn im Prinzip von jedem Internetzugang steuern und abfragen. Die Befehls-Syntax bleibt dabei die gleiche wie die unter Benutzung der RS-232-Schnittstelle. Als USB-Interface fungiert der FT232 von FTDI, ein USB-zu-Seriell-Umsetzer.

Die USB- und Ethernet-Portbausteine emulieren in der Grundeinstellung eine serielle Schnittstelle (Virtual COM Port), womit sich die Anwendungs-programmierung enorm vereinfacht. Die Kommunikation mit den Messmodulen erfolgt nämlich im ASCII-Klartext - jede Programmierumgebung, die an eine serielle Schnittstelle Zeichen senden und von dieser entgegennehmen kann, ist zur Steuerung geeignet, im einfachsten Fall reicht sogar ein Terminal-Programm, bei dem man die Befehle von Hand eintippt.

![[fernwirkung-291012-04.jpeg]]

*Die ADA-I/O-Karte bietet neben 8 A/D- und 8 D/A-Kanälen mit 16 Bit Auflösung (hier das Demo-Programm) auch bis zu 64 Portleitungen vom Schalten zum Relais oder zur Zustandsabfrage.*

Kleines Beispiel: Der Befehl „3:VAL 0?“ veranlasst die Karte mit der eingestellten Adresse 3, etwa die Digitalvoltmeter-Platine, ihren aktuellen Messwert vom Messwert-Kanal 0 herauszurücken, sie antwortet also mit „#3:0=1.23456“, wenn an ihrem Eingang 1,23456 Volt anliegen. Analog stellt der Befehl „4:FRQ=1000.0!“ die Frequenz der Funktionsgenerator-Karte mit der Adresse 4 auf 1000 Hz ein. Die anschließende Abfrage „4:FRQ?“ würde übrigens „#4:0=1000.0“ ergeben: Die gelieferten Werte müssen nicht unbedingt einer Messung entspringen, sie können ebenso gut ein Parameter sein, den man irgendwann dem Modul übermittelt, aber in der Zwischenzeit wieder vergessen hat. Grundeinstellungen, also beispielsweise Skalenfaktoren und Offsets zur Kalibrierung oder die Datenrichtung bei den Portleitungen des ADA-I/O-Moduls bleiben übrigens im Flash-Speicher der Messmodule dauerhaft gespeichert.

## Mnemonische Entwirrung

Schon an diesen einfachen Beispielen wird das Protokoll deutlich: Von den Karten gelieferte Messwerte oder Parameter beginnen immer mit einem „#“, es folgt die Adresse der Karte (0 bis 7) und nach dem Doppelpunkt die Messkanalnummer. Einstellungsbefehle beinhalten immer ein „=“ und enden mit einem Ausrufezeichen, Abfragebefehle schließen bezeichnenderweise mit einem „?“ ab. Die vorangestellte Kartenadresse muss nur beim ersten Befehl an eine Karte angegeben werden, ansonsten bezieht sie alle weiteren Befehle (ohne Adresse und Doppelpunkt) auf sich - damit lässt sich das Übertragungsvolumen deutlich reduzieren. Bei der Adressangabe ist übrigens auch der Wildcard-„*“ zulässig: Auf „*:IDN?“ identifizieren sich alle angeschlossenen Karten mit ihrem Namen und ihrer Versionsnummer, bei „*.VAL 1?“ rücken sie gemeinsam die Messwerte vom Eingangskanal 1 (so vorhanden) heraus. Die Mnemonics sind einfach zu merkende 3-Buchstabenkürzel, von denen viele für sämtliche Karten gleich lauten. Die Module behandeln die verschiedenen Mnemonics übrigens intern als unterschiedliche Subkanäle, deshalb lautet die obige Kartenantwort auf die Frequenzabfrage auch„#4:0=1000.0“ und nicht „#4:FRQ=1000.0“. Die Pegel-Abfrage an die DDS-Karte mit „4:LVL?“ würde beispielsweise „#4:1=775.0“ (in mV RMS, Subkanal 1 = Pegel) als Antwort hervorbringen.

Der Umkehrschluss ist hier zutreffend: Statt mit „4:FRQ=1234.5!“ kann man den Funktionsgenerator auch mit „4:0=1234.5!“ zum Wechseln der Frequenz oder mit „4:1=500!“ zum Einstellen des Ausgangspegels bewegen - das erleichtert die PC-seitige Programmierung, denn Zahlen lassen sich (beispielsweise als Index für eine Ergebnistabelle) bequemer handeln als Strings. Die Zuordnung von Mnemonic zu Sub-Adresse variiert von Karte zu Karte, orientiert sich aber an einem übergeordneten Schema. Angemerkt sei, dass wir die Mnemonics nur für die „eigenhändige“ Kommunikation (etwa per Terminal-Programm) eingeführt haben - der schon leicht angejahrte Autor hatte die Subkanal-Zahlenzuordnung bei der Entwicklung immer wieder vergessen ...

![[fernwirkung-291012-05.jpeg]]

*Mit DDS- und DIV-Modul aufgebauter Audio-Sweep-Generator zum Messen von Frequenzgängen. Start- und Endfrequenz stellt man mit den „Schiebereglern“ unten links ein.*

Wer sich mit modernen Messgeräten bereits intensiver beschäftigt hat, dem wird hier eine gewisse Ähnlichkeit zum SCPI (Standard Commands for Programmable Instruments) auffallen. Ohne uns über die zweifellos tragenden Errungenschaften des SCPI-Konsortiums hinwegsetzen zu wollen, haben wir von einer 1:1-Implementierung des Standards recht bald abgesehen - der nötige Parser hätte den kleinen Mikrocontroller jedes Moduls (ein Atmel ATmega168) schon zur Hälfte gefüllt, und das „Daisy-Chainen“ (Hintereinanderhängen) der Karten durch Weiterreichen von Befehlen und Messwerten wäre damit auch nicht ohne Weiteres möglich gewesen. SCPI verlässt sich in mancher Hinsicht auf eine Stern-Topologie wie beim GPIB und auf ein busseitig vorgegebenes Adressierungsschema, was im vorliegenden Fall weitere Intelligenz auf der Interface-Karte (in Form eines Dispatchers) erforderlich gemacht hätte.

## Messwerte zum Anfassen

Den Gebrauchswert des Systems haben wir durch optional anschließbare Bedienpanels beträchtlich gesteigert. An Digitalvoltmeter-, Funktionsgenerator- und Netzteilmodul kann man eine kleine Zusatzplatine anschließen, auf der sich zwei Taster, ein Inkremental-Drehgeber und ein LC-Display befinden. Damit lassen sich die genannten Module auch grundbedienen, ohne dass man dafür den Rechner hochfahren müsste - mehr noch: Die Module werden dadurch zu eigenständigen, autarken Geräten. Nebenbei zeigen die Panels auch die Remote-Aktivitäten an - das hilft beim Debuggen des Steuerungsprogramms.

![[fernwirkung-291012-06.jpeg]]

*So sieht ein typisches Lab-View-Programm (hier für das komfortable Auslesen des DIV-Moduls) aus: Bedienungselemente und Hardware-Treiber finden sich als Funkionsblöcke (VIs) wieder, die nur noch richtig „verdrahtet“ werden müssen.*

Der Drehgeber ist vor allem hilfreich, wenn wie beim Netzteil oder dem Funktionsgenerator ein großer Wertebereich vorhanden ist - den kann man wie mit einem „endlosen“ Potenziometer schnell durchkurbeln. Mit einem zusätzlichen Druck auf den Drehknopf erhält man sogar eine Millivolt- oder Zehntelhertz-genaue Feineinstellung. Die Module liefern übrigens die manuell eingestellten Werte an den Rechner zurück, der seinerseits darauf reagieren kann und beispielsweise die Skala eines virtuellen Messwerks entsprechend der Einstellung umschaltet.

## Visualisiert

Der De-facto-Standard für rechnergesteuerte Mess- und Regelaufgaben und deren Visualisierung ist die Programmierumgebung Labview von National Instruments. Wer bei „Programmierumgebung“ an kryptische C++-Befehle und einen langwierigen Lernprozess denkt, liegt bei Labview falsch: Das System arbeitet mit einer Art Schaltplan als Ablaufsteuerung, auf dem man die Abfolge der Befehle wie in einem Flussdiagramm durch Ziehen von Verbindungen zwischen den Funktionsblöcken (VI oder Virtual Instrument genannt) und Bedien- oder Anzeigeelementen vorgibt. Seine Stärken spielt die Entwicklungsumgebung aus, wenn es darum geht, die Messergebnisse ansehnlich darzustellen. Die Bedienungselemente lehnen sich an solche aus der realen Welt an: Es gibt Zeiger-, Thermometer- und Digitalanzeigen, Drehknöpfe und Taster, Oszillogramme und Zeitschriebe - allesamt auf den jeweiligen Anzeigezweck konfigurier- und anpassbar (siehe Screenshots). Labview gibt es für Windows- Linux- und Mac-OS-Systeme.

![[fernwirkung-291012-07.jpeg]]

*An einige der Messmodule kann ein Bedien-Panel mit Display und Tastern oder Drehgeber angeschlossen werden. Die Module werden dadurch auch unabhängig vom Rechner nutzbar.*

Für gelernte Programmierer ist die Art der Quellcode-Eingabe zwar anfangs gewöhnungsbedürftig, man erkennt die Kontrollstrukturen aber sehr schnell (wieder) und wird von raschen Erfolgen belohnt, zumal das System mit einer sehr mächtigen Bibliothek von vorgefertigten VIs geliefert wird. Das System wurde eigentlich für Techniker konzipiert, die mit dem Programmieren im herkömmlichen Sinn nichts am Hut haben und eher in Verdrahtungsplänen oder Ablaufsteuerungen denken.

Für etliche Messgeräte findet man bei National Instruments geeignete Treiber (ebenfalls VI-Funktionsblöcke), natürlich auch für die professionellen Hardware-Komponenten des Herstellers selbst. Die PC-Standardschnittstellen (Drucker- und COM-Ports, Soundkarte) bedient die Software aus einem Fundus eingebauter Routinen und Treiber. Da unsere „Messklötze“ (direkt oder emuliert) über eine RS-232-Schnittstelle mit dem Rechner kommunizieren, ist die LabView-Anbindung des Projekts eine recht einfache Sache. Wir erwähnen die Entwicklungsumgebung auch deshalb so ausführlich, weil die abgebildeten Demo-Programme damit entwickelt wurden - und weil die nächste Heft-DVD (c't 11/2007) die Labview-Vollversion 6.1 enthält. Die ist zwar nicht allerletzten Datums, aber für den Einsatzzweck mehr als ausreichend, und sie läuft stabil auf allen Systemen - sogar auf einem Windows-98-Rechner mit nur 233 MHz ist sie durchaus brauchbar, sodass sich ein „Dachbodenfund“ sinnvoll recyceln lässt. Den ersten Teil unserer Projektserie finden Sie in [**c't 10/07 auf Seite 130 [1]**](https://www.heise.de/ratgeber/Leitungsschau-291014.html).

***"Messen, steuern, regeln"***

*Artikel zum Thema "Messen, steuern, regeln" finden Sie in der c't 10/2007:*

*Die Bausteine des c't-Lab*

*S. 124*

*Teil 1: PC-Interface und Stromversorgung*

*S. 130*

RSPEAK_STOP
([**cm [2]**](mailto:cm@ct.de))
RSPEAK_START

**URL dieses Artikels:**

`https://www.heise.de/-291012`

**Links in diesem Artikel:**

1. https://www.heise.de/ratgeber/Leitungsschau-291014.html
2. mailto:cm@ct.de

*Copyright © 2007 Heise Medien*
