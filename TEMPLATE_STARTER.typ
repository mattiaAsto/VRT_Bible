#import "layout/0_lib.typ": *

// Annexes : déclarées ici, mais affichées SEULEMENT si elles sont citées dans le texte
// (ex : @ann:reference1). Même principe que les acronymes.
#show: rapport-brouillon(annexes-contenu: [
  #pdf("exemple.pdf", "Exemple 1", debut: 2, fin: 3, etiquette: <ann:reference1>)
  #pdf("exemple.pdf", "Exemple 2", debut: 1, fin: 1, etiquette: <ann:reference2>)
])




#if  config.langue != "en" and config.langue != "de"  [
  
  //EDITION
  = Introduction

  Ce modèle démontre les principales fonctionnalités disponibles pour créer un rapport de laboratoire professionnel avec HES-SO.

  == Objectif

  L'objectif est d'étudier le comportement des composants électriques en régime alternatif et de valider les résultats avec les théories établies.

  == Méthodologie

  Nous avons utilisé une approche expérimentale, réalisée à la @hei dans le cadre de la @hesso, combinée à une simulation pour validation théorique.

  // 2. BOÎTES UTILITAIRES

  #pagebreak()
  = Contenu technique

  == Équations numérotées
   On peut activer et désactiver la numérotation des équations dans le main.
   
  La réactance inductive est donnée par :
  $ X_L = 2 pi f L $ <eq:reactance>

  On peut également exprimer l'impédance totale comme :
  $ Z = sqrt(R^2 + X_L^2) $ <eq:impedance>

  D'après l'équation @eq:reactance, on constate que la réactance varie linéairement avec la fréquence. En utilisant l'équation @eq:impedance, on peut calculer l'impédance totale du circuit.

  *Alignement des équations*
  $ s = S_d $

  $
    f(x) &= (x + 1)^2 \
         &= x^2 + 2x + 1 \
         &= "Résultat final"
  $

  $
    & f(x) = x + 2 \
    & g(x) = x^2 + 5x + 6 \
    & "Résultat" = 42
  $

  == Tables et figures

  #figure(
    table(
      columns: (auto, 20%, 1fr, 25%),
      inset: 8pt,
      align: horizon,
      stroke: 0.5pt + luma(150),
      fill: (x, y) => {
        if y == 0 { green.lighten(80%) } else if x == 0 { blue.lighten(80%) } else { none }
      },
      [*Fréquence*], [*Intensité (mA)*], [*Réactance (Ω)*], [*Inductance (mH)*],
      [1 kHz], [267.33], [13.96], [2.2],
      [1.5 kHz], [178.02], [21.46], [2.2],
      [2 kHz], [133.65], [28.92], [2.2],
    ),
    caption: [Mesures de l'inductance de la bobine en fonction de la fréquence],
  )

  La fréquence de coupure vaut @ca 1 kHz.

  #pagebreak()
  == Graphiques

  Les graphiques permettent de visualiser l'évolution des données expérimentales.

  #info-box[Les graphiques sont créés avec la librairie *lilaq*, qui offre une flexibilité maximale pour créer des courbes et des diagrammes scientifiques.]

  Voici un exemple de graphique montrant l'évolution de la réactance inductive en fonction de la fréquence :

  #show lq.selector(lq.diagram): set text(.9em)
  #show: lq.set-tick(outset: 3pt, inset: 0pt)
  #show: lq.set-diagram(
    xaxis: (mirror: (ticks: false)),
    yaxis: (mirror: (ticks: false)),
  )

  #figure(
    lq.diagram(
      lq.plot(
        (1, 1.5, 2),
        (13.96, 21.46, 28.92),
        yerr: 0,
        mark: "o",
        stroke: (dash: "dashed"),
        label: [Réactance],
      ),
      height: 4cm,
      xlabel: [Fréquence (kHz)],
      xlim: (0.5, 2.5),
      ylabel: [Réactance [Ω]],
      ylim: (13, 30),
    ),
    caption: [Réactance inductive en fonction de la fréquence],
  ) <fig:reactance>

  Comme le montre la figure @fig:reactance, l'évolution de la réactance inductive est linéaire et proportionnelle à la fréquence, conformément à l'équation @eq:reactance.

  #pagebreak()
  == Photo avec légende

  #danger-box[Attention à la qualité des images, si le fichier est trop volumineux lorsque l'on va convertir le code Typst en PDF, cela va créer un fichier PDF ultra lourd. Il est possible de passer après par #link("https://www.ilovepdf.com/fr/compresser_pdf", "I-love PDF") pour réduire la taille du fichier.]

  #figure(
    image("assets/picture/picture_template/logo_photo.png", width: 20%),
    caption: [nom image],
  ) <fig:cursor_schema1>
  
  #figure(
    grid(
      columns: (1fr, 1fr),
      gutter: 10pt,

      // Image de gauche
      image("assets/picture/picture_template/logo_photo.png", width: 30%),

      // Image de droite
      image("assets/picture/picture_template/logo_photo.png", width: 30%),
    ),
    caption: [comment intégrer 2 images],
  ) <fig:double_image1>

  la fonction \photo permet d'intégrer provisoirement une autre image
  #photo(largeur: 50pt, nom: "le nom ")

  #pagebreak()
  == Code source

  La section ici explique comment importer directement du code en faisant :

  *Contrôle + C Contrôle V* ou en important seulement des lignes de code
  
#code([Mon code tapé à la main], ```python
def verifier_moteur():
    vitesse = 100
    if vitesse > 50:
      print("Attention")
      return True
```
)<code:code_c_>

#code-fichier("/assets/code/exemple.py", [Extrait de mon fichier], debut: 7, fin: 11, lang: "python")<fig:mon_code>

#code-fichier("/assets/code/exemple.py", [Extrait de mon fichier], debut:1 , fin: 11, lang: "python")<fig:mon_code1>

  #pagebreak()
  = Exemples de boîtes utilitaires & stabilo

  Ce texte contient des éléments #stabilo(couleur: yellow)[surbrillances en jaune], #stabilo(couleur: rgb("FF6B6B"), opacite: 70%)[en rouge], et #stabilo(couleur: green, opacite: 50%)[en vert].

  Les boîtes utilitaires vous permettent de mettre en avant des informations importantes.

  == Boîte d'information
  #info-box[Ceci est une boîte d'information. Elle contient des détails importants et des conseils pratiques.]

  == Boîte d'attention
  #danger-box[ Attention ! Cette zone contient un risque identifié. Respectez les consignes de sécurité.]

  == Boîte de validation
  #valid-box[La validation des résultats a réussi avec une précision de 98%.]

  == Boîte d'erreur
  #feu-box[Erreur critique détectée dans le circuit à 14h30. Calibrer les instruments.]

  == Boîte d'idée
  #idea-box[Suggestion : utiliser une meilleure source de signal pour améliorer la précision des mesures.]

  == Boîte TODO
  #todo-box[
    - Collecter les données finales
    - Vérifier les calculs
    - Rédiger la conclusion
  ]

  // 4. ACRONYMES, ABRÉVIATIONS ET ANNEXES

  #pagebreak()
  = Acronymes et abréviations

  Les acronymes se déclarent dans *settings/acronymes.typ* et les abréviations dans *settings/abreviations.typ*. Il suffit ensuite d'écrire leur clé dans le texte, par exemple @pwm : à la première citation la forme longue est affichée avec la forme courte entre parenthèses, ensuite seule la forme courte apparaît (la @hei, par exemple).

  Chaque table est créée automatiquement à la fin du document, mais *uniquement si au moins une de ses entrées est citée*. Sans acronyme cité, la « Table des acronymes » n'existe pas ; sans abréviation citée, la « Table des abréviations » n'existe pas. Pour plus de détails, @cf la section « Bibliographie » ci-dessous.

  = Annexes

  Les annexes se déclarent avec `#pdf(...)` (voir le haut de ce fichier) en leur donnant une étiquette. *Une annexe n'est affichée que si elle est citée dans le texte*, comme un acronyme : l'annexe @ann:reference1 est citée ici, elle apparaît donc après la bibliographie. L'annexe `ann:reference2` n'est citée nulle part : elle est ignorée. Pour l'afficher, il suffit d'écrire sa référence dans le texte.

  Si aucune annexe n'est citée, ni la page « Annexes » ni la « Table des annexes » ne sont créées. Les lettres (A, B, C...) ne sont attribuées qu'aux annexes affichées.

  = Bibliographie

  La bibliographie permet d'inclure une référence @Aut1 à un auteur spécifique ou même à un livre. Il faut regarder : *settings/refs.bib*
  L'auteur est ensuite affiché en fond de document avec la description incluse.

  // 5. CONCLUSION

  #pagebreak()
  = Conclusion

  Ce rapport a démontré l'utilisation complète du modèle HES-SO pour Typst, incluant :

  ✅ Mise en page professionnelle et automatisée \
  ✅ Boîtes utilitaires colorées et personnalisables \
  ✅ Tableaux et figures avec légendes \
  ✅ Code source numéroté \
  ✅ Équations numérotées avec références \
  ✅ Tables d'acronymes et d'abréviations (affichées seulement si utilisées) \
  ✅ Annexes affichées seulement si elles sont citées \
  ✅ Gestion complète des auteurs et professeurs \
  ✅ Pages de signature automatiques

  Le modèle est entièrement personnalisable via le fichier `settings/name.typ`.

] else if config.langue == "en" [

  // EDITION
  = Introduction

  This template demonstrates the main features available for creating a professional laboratory report with HES-SO.

  == Objective

  The objective is to study the behavior of electrical components in alternating current and to validate the results with established theories.

  == Methodology

  We used an experimental approach, carried out at @hei as part of @hesso, combined with a simulation for theoretical validation.

  // 2. UTILITY BOXES

  #pagebreak()
  = Technical content

  == Numbered equations
   You can enable and disable equation numbering in the main file.
   
  The inductive reactance is given by:
  $ X_L = 2 pi f L $ <eq:reactance>

  Total impedance can also be expressed as:
  $ Z = sqrt(R^2 + X_L^2) $ <eq:impedance>

  According to equation @eq:reactance, we can see that reactance varies linearly with frequency. Using equation @eq:impedance, we can calculate the total impedance of the circuit.

  *Equation alignment*
  $ s = S_d $

  $
    f(x) &= (x + 1)^2 \
         &= x^2 + 2x + 1 \
         &= "Final result"
  $

  $
    & f(x) = x + 2 \
    & g(x) = x^2 + 5x + 6 \
    & "Result" = 42
  $

  == Tables and figures

  #figure(
    table(
      columns: (auto, 20%, 1fr, 25%),
      inset: 8pt,
      align: horizon,
      stroke: 0.5pt + luma(150),
      fill: (x, y) => {
        if y == 0 { green.lighten(80%) } else if x == 0 { blue.lighten(80%) } else { none }
      },
      [*Frequency*], [*Current (mA)*], [*Reactance (Ω)*], [*Inductance (mH)*],
      [1 kHz], [267.33], [13.96], [2.2],
      [1.5 kHz], [178.02], [21.46], [2.2],
      [2 kHz], [133.65], [28.92], [2.2],
    ),
    caption: [Coil inductance measurements as a function of frequency],
  )

  The cutoff frequency is @ca 1 kHz.

  #pagebreak()
  == Charts

  Charts allow you to visualize the evolution of experimental data.

  #info-box[Charts are created with the *lilaq* library, which offers maximum flexibility for creating scientific curves and diagrams.]

  Here is an example of a chart showing the evolution of inductive reactance as a function of frequency:

  #show lq.selector(lq.diagram): set text(.9em)
  #show: lq.set-tick(outset: 3pt, inset: 0pt)
  #show: lq.set-diagram(
    xaxis: (mirror: (ticks: false)),
    yaxis: (mirror: (ticks: false)),
  )

  #figure(
    lq.diagram(
      lq.plot(
        (1, 1.5, 2),
        (13.96, 21.46, 28.92),
        yerr: 0,
        mark: "o",
        stroke: (dash: "dashed"),
        label: [Reactance],
      ),
      height: 4cm,
      xlabel: [Frequency (kHz)],
      xlim: (0.5, 2.5),
      ylabel: [Reactance [Ω]],
      ylim: (13, 30),
    ),
    caption: [Inductive reactance as a function of frequency],
  ) <fig:reactance>

  As shown in figure @fig:reactance, the evolution of inductive reactance is linear and proportional to the frequency, in accordance with equation @eq:reactance.

  #pagebreak()
  == Photo with caption

  #danger-box[Beware of image quality; if the files are too large, converting the Typst code to PDF will create a very heavy PDF file. It is possible to subsequently use #link("https://www.ilovepdf.com/fr/compresser_pdf", "I-love PDF") to reduce the file size.]

  #figure(
    image("assets/picture/picture_template/logo_photo.png", width: 20%),
    caption: [image name],
  ) <fig:cursor_schema1>
  
  #figure(
    grid(
      columns: (1fr, 1fr),
      gutter: 10pt,

      // Left image
      image("assets/picture/picture_template/logo_photo.png", width: 30%),

      // Right image
      image("assets/picture/picture_template/logo_photo.png", width: 30%),
    ),
    caption: [how to integrate 2 images],
  ) <fig:double_image1>

  the \photo function allows you to temporarily integrate another image
  #photo(largeur: 50pt, nom: "the name ")

  #pagebreak()
  == Source code

  This section explains how to directly import code by doing:

  *Control + C Control V* or by importing only lines of code

  #code([Python code], ```python
def verifier_moteur():
    vitesse = 100
    if vitesse > 50:
      print("Attention")
      return True
```
)<code:code_c_>

#code-fichier("/assets/code/exemple.py", [Python file excerpt], debut: 7, fin: 11, lang: "python")<fig:mon_code>

#code-fichier("/assets/code/exemple.py", [Python file excerpt], debut:1 , fin: 11, lang: "python")<fig:mon_code1>

  #pagebreak()
  = Examples of utility boxes & highlighter

  This text contains elements #stabilo(couleur: yellow)[highlighted in yellow], #stabilo(couleur: rgb("FF6B6B"), opacite: 70%)[in red], and #stabilo(couleur: green, opacite: 50%)[in green].

  Utility boxes allow you to highlight important information.

  == Information box
  #info-box[This is an information box. It contains important details and practical advice.]

  == Warning box
  #danger-box[Warning! This area contains an identified risk. Follow the safety instructions.]

  == Validation box
  #valid-box[Result validation was successful with 98% accuracy.]

  == Error box
  #feu-box[Critical error detected in the circuit at 14:30. Calibrate the instruments.]

  == Idea box
  #idea-box[Suggestion: use a better signal source to improve measurement accuracy.]

  == TODO box
  #todo-box[
    - Collect final data
    - Verify calculations
    - Write the conclusion
  ]

  // 4. ACRONYMS, ABBREVIATIONS AND APPENDICES

  #pagebreak()
  = Acronyms and abbreviations

  Acronyms are declared in *settings/acronymes.typ* and abbreviations in *settings/abreviations.typ*. Then just write their key in the text, for example @pwm: on first use the long form is displayed with the short form in brackets, afterwards only the short form appears (@hei, for example).

  Each list is created automatically at the end of the document, but *only if at least one of its entries is cited*. With no acronym cited, the "List of Acronyms" does not exist; with no abbreviation cited, the "List of Abbreviations" does not exist. For more details, @cf the "Bibliography" section below.

  = Appendices

  Appendices are declared with `#pdf(...)` (see the top of this file) and given a label. *An appendix is only displayed if it is cited in the text*, just like an acronym: appendix @ann:reference1 is cited here, so it appears after the bibliography. Appendix `ann:reference2` is cited nowhere: it is ignored. To display it, simply write its reference in the text.

  If no appendix is cited, neither the "Appendices" page nor the "List of Appendices" is created. Letters (A, B, C...) are only given to displayed appendices.

  = Bibliography

  The bibliography allows you to include a reference @Aut1 to a specific author or even a book. You should look at: *settings/refs.bib*
  The author is then displayed at the end of the document with the included descriptions.

  // 5. CONCLUSION

  #pagebreak()
  = Conclusion

  This report has demonstrated the complete use of the HES-SO template for Typst, including:

  ✅ Professional and automated layout \
  ✅ Colorful and customizable utility boxes \
  ✅ Tables and figures with captions \
  ✅ Numbered source code \
  ✅ Numbered equations with references \
  ✅ Lists of acronyms and abbreviations (only shown if used) \
  ✅ Appendices only shown if cited \
  ✅ Complete management of authors and professors \
  ✅ Automatic signature pages

  The template is fully customizable via the settings/name.typ file.

] else if config.langue == "de" [
  //EDITION
  = Einleitung

  Dieses Modell demonstriert die wichtigsten Funktionen, die für die Erstellung eines professionellen Laborberichts mit HES-SO zur Verfügung stehen.

  == Ziel

  Das Ziel ist es, das Verhalten elektrischer Bauteile bei Wechselstrom zu untersuchen und die Ergebnisse mit etablierten Theorien zu validieren.

  == Methodik

  Wir haben einen experimentellen Ansatz, durchgeführt an der @hei im Rahmen der @hesso, mit einer Simulation zur theoretischen Validierung kombiniert.

  // 2. HILFSBOXEN

  #pagebreak()
  = Technischer Inhalt

  == Nummerierte Gleichungen
   Man kann die Nummerierung von Gleichungen im Main aktivieren und deaktivieren.
   
  Die induktive Reaktanz ist gegeben durch:
  $ X_L = 2 pi f L $ <eq:reactance>

  Man kann die Gesamtimpedanz auch ausdrücken als:
  $ Z = sqrt(R^2 + X_L^2) $ <eq:impedance>

  Nach Gleichung @eq:reactance stellen wir fest, dass die Reaktanz linear mit der Frequenz variiert. Mit Gleichung @eq:impedance kann die Gesamtimpedanz des Schaltkreises berechnet werden.

  *Ausrichtung der Gleichungen*
  $ s = S_d $

  $
    f(x) &= (x + 1)^2 \
         &= x^2 + 2x + 1 \
         &= "Endergebnis"
  $

  $
    & f(x) = x + 2 \
    & g(x) = x^2 + 5x + 6 \
    & "Ergebnis" = 42
  $

  == Tabellen und Abbildungen

  #figure(
    table(
      columns: (auto, 20%, 1fr, 25%),
      inset: 8pt,
      align: horizon,
      stroke: 0.5pt + luma(150),
      fill: (x, y) => {
        if y == 0 { green.lighten(80%) } else if x == 0 { blue.lighten(80%) } else { none }
      },
      [*Frequenz*], [*Stromstärke (mA)*], [*Reaktanz (Ω)*], [*Induktivität (mH)*],
      [1 kHz], [267.33], [13.96], [2.2],
      [1.5 kHz], [178.02], [21.46], [2.2],
      [2 kHz], [133.65], [28.92], [2.2],
    ),
    caption: [Messungen der Spuleninduktivität in Abhängigkeit von der Frequenz],
  )

  Die Grenzfrequenz beträgt @ca 1 kHz.

  #pagebreak()
  == Diagramme

  Diagramme ermöglichen die Visualisierung der Entwicklung experimenteller Daten.

  #info-box[Die Diagramme werden mit der Bibliothek *lilaq* erstellt, die maximale Flexibilität zur Erstellung wissenschaftlicher Kurven und Diagramme bietet.]

  Hier ist ein Beispiel für ein Diagramm, das die Entwicklung der induktiven Reaktanz in Abhängigkeit von der Frequenz zeigt:

  #show lq.selector(lq.diagram): set text(.9em)
  #show: lq.set-tick(outset: 3pt, inset: 0pt)
  #show: lq.set-diagram(
    xaxis: (mirror: (ticks: false)),
    yaxis: (mirror: (ticks: false)),
  )

  #figure(
    lq.diagram(
      lq.plot(
        (1, 1.5, 2),
        (13.96, 21.46, 28.92),
        yerr: 0,
        mark: "o",
        stroke: (dash: "dashed"),
        label: [Reaktanz],
      ),
      height: 4cm,
      xlabel: [Frequenz (kHz)],
      xlim: (0.5, 2.5),
      ylabel: [Reaktanz [Ω]],
      ylim: (13, 30),
    ),
    caption: [Induktive Reaktanz in Abhängigkeit von der Frequenz],
  ) <fig:reactance>

  Wie in Abbildung @fig:reactance gezeigt, ist die Entwicklung der induktiven Reaktanz linear und proportional zur Frequenz, in Übereinstimmung mit Gleichung @eq:reactance.

  #pagebreak()
  == Foto mit Legende

  #danger-box[Achten Sie auf die Bildqualität. Wenn die Dateien zu groß sind, führt die Konvertierung des Typst-Codes in eine PDF-Datei zu einer extrem großen PDF-Datei. Es ist möglich, danach #link("https://www.ilovepdf.com/fr/compresser_pdf", "I-love PDF") zu verwenden, um die Dateigröße zu reduzieren.]

  #figure(
    image("assets/picture/picture_template/logo_photo.png", width: 20%),
    caption: [Bildname],
  ) <fig:cursor_schema1>
  
  #figure(
    grid(
      columns: (1fr, 1fr),
      gutter: 10pt,

      // Linkes Bild
      image("assets/picture/picture_template/logo_photo.png", width: 30%),

      // Rechtes Bild
      image("assets/picture/picture_template/logo_photo.png", width: 30%),
    ),
    caption: [Wie man 2 Bilder integriert],
  ) <fig:double_image1>

  Die Funktion \photo ermöglicht es, vorübergehend ein anderes Bild zu integrieren
  #photo(largeur: 50pt, nom: "der Name ")

  #pagebreak()
  == Quellcode

  Dieser Abschnitt erklärt, wie man Code direkt importiert, indem man Folgendes tut:

  *Strg + C Strg + V* oder indem nur Codezeilen importiert werden
  #code([Beispiel in Python], ```python
def verifier_moteur():
    vitesse = 100
    if vitesse > 50:
      print("Attention")
      return True
```
)<code:code_c_>

#code-fichier("/assets/code/exemple.py", [Dateiauszug], debut: 7, fin: 11, lang: "python")<fig:mon_code>

#code-fichier("/assets/code/exemple.py", [Dateiauszug], debut:1 , fin: 11, lang: "python")<fig:mon_code1>


  #pagebreak()
  = Beispiele für Hilfsboxen & Textmarker

  Dieser Text enthält Elemente #stabilo(couleur: yellow)[gelb hervorgehoben], #stabilo(couleur: rgb("FF6B6B"), opacite: 70%)[in rot] und #stabilo(couleur: green, opacite: 50%)[in grün].

  Hilfsboxen ermöglichen es Ihnen, wichtige Informationen hervorzuheben.

  == Informationsbox
  #info-box[Dies ist eine Informationsbox. Sie enthält wichtige Details und praktische Ratschläge.]

  == Achtung-Box
  #danger-box[Achtung! Dieser Bereich enthält ein identifiziertes Risiko. Befolgen Sie die Sicherheitsanweisungen.]

  == Bestätigungsbox
  #valid-box[Die Validierung der Ergebnisse war mit einer Genauigkeit von 98% erfolgreich.]

  == Fehlerbox
  #feu-box[Kritischer Fehler im Schaltkreis um 14:30 Uhr erkannt. Instrumente kalibrieren.]

  == Ideenbox
  #idea-box[Vorschlag: Verwenden Sie eine bessere Signalquelle, um die Messgenauigkeit zu verbessern.]

  == TODO-Box
  #todo-box[
    - Endgültige Daten sammeln
    - Berechnungen überprüfen
    - Fazit schreiben
  ]

  // 4. AKRONYME, ABKÜRZUNGEN UND ANHÄNGE

  #pagebreak()
  = Akronyme und Abkürzungen

  Akronyme werden in *settings/acronymes.typ* und Abkürzungen in *settings/abreviations.typ* deklariert. Anschließend genügt es, den Schlüssel im Text zu schreiben, zum Beispiel @pwm: Beim ersten Vorkommen wird die Langform mit der Kurzform in Klammern angezeigt, danach erscheint nur noch die Kurzform (z. B. @hei).

  Jedes Verzeichnis wird am Ende des Dokuments automatisch erstellt, aber *nur wenn mindestens einer seiner Einträge zitiert wird*. Ohne zitiertes Akronym gibt es kein Akronymverzeichnis, ohne zitierte Abkürzung kein Abkürzungsverzeichnis. Weitere Details: @cf Abschnitt „Literaturverzeichnis“ unten.

  = Anhänge

  Anhänge werden mit `#pdf(...)` deklariert (siehe Anfang dieser Datei) und erhalten ein Etikett. *Ein Anhang wird nur angezeigt, wenn er im Text zitiert wird*, wie ein Akronym: Der Anhang @ann:reference1 wird hier zitiert und erscheint daher nach dem Literaturverzeichnis. Der Anhang `ann:reference2` wird nirgends zitiert und daher ignoriert. Um ihn anzuzeigen, genügt es, seine Referenz im Text zu schreiben.

  Wird kein Anhang zitiert, werden weder die Seite „Anhänge“ noch das „Anhangsverzeichnis“ erstellt. Die Buchstaben (A, B, C...) werden nur an angezeigte Anhänge vergeben.

  = Literaturverzeichnis

  Das Literaturverzeichnis ermöglicht es, eine Referenz @Aut1 auf einen bestimmten Autor oder sogar auf ein Buch einzufügen. Sie sollten sich *settings/refs.bib* ansehen.
  Der Autor wird dann am Ende des Dokuments mit den enthaltenen Beschreibungen angezeigt.

  // 5. FAZIT

  #pagebreak()
  = Fazit

  Dieser Bericht hat die vollständige Verwendung der HES-SO-Vorlage für Typst demonstriert, einschließlich:

  ✅ Professionelles und automatisiertes Layout \
  ✅ Farbige und anpassbare Hilfsboxen \
  ✅ Tabellen und Abbildungen mit Legenden \
  ✅ Nummerierter Quellcode \
  ✅ Nummerierte Gleichungen mit Referenzen \
  ✅ Akronym- und Abkürzungsverzeichnis (nur angezeigt, wenn verwendet) \
  ✅ Anhänge nur angezeigt, wenn zitiert \
  ✅ Vollständige Verwaltung von Autoren und Professoren \
  ✅ Automatische Unterschriftenseiten

  Die Vorlage ist vollständig über die Datei `settings/name.typ` anpassbar.
]