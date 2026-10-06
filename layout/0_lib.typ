// Modèle de rapport de laboratoire HES-SO
// Exportation principale des fonctions du template

#import "@preview/glossarium:0.5.4": make-glossary, print-glossary, register-glossary
#import "@preview/lilaq:0.5.0" as lq
#import "../settings/name.typ": *
#import "../settings/acronymes.typ": mes-acronymes
#import "../settings/abreviations.typ": mes-abreviations
#import "1_layout.typ": *
#import "2_layout.typ": *
#import "3_box_layout.typ": *
#import "4_cover_page_layout.typ": page-garde

// Une même clé ne peut pas être à la fois un acronyme et une abréviation
#assert(
  mes-acronymes.map(e => e.key).filter(k => k in mes-abreviations.map(e => e.key)).len() == 0,
  message: "Une clé existe à la fois dans settings/acronymes.typ et settings/abreviations.typ",
)

// Toutes les entrées enregistrées dans glossarium (2 tables affichées séparément)
#let toutes-entrees = mes-acronymes + mes-abreviations

// Règle de sécurité globale pour que les clés @ soient reconnues partout sans erreur
#show bibliography: none

// ---------------------------------------------------------------------------
// ACRONYMES / ABRÉVIATIONS
// Toutes les entrées sont TOUJOURS enregistrées (sinon @hei plante). Chaque
// table (acronymes, abréviations) n'est affichée à la fin (voir 2_layout.typ)
// que si au moins une de ses entrées est citée dans le document.
// ANNEXES
// Une annexe n'est affichée que si elle est citée dans le texte (@ann:...).
// Sans annexe citée : ni page "Annexes", ni "Table des annexes".
// ---------------------------------------------------------------------------

#let rapport(doc) = {
  // 1. Initialisation standard
  set text(size: 11pt, lang: config.langue)

  show: make-glossary
  register-glossary(toutes-entrees)

  // 2. Page de garde + table des matières (si activées)
  if config.page_garde {
    page-garde()

    counter(page).update(1)

    show: mis-en-page
    heading(level: 1, numbering: none, outlined: false)[#langue.table-matiere]

    outline(title: none, indent: auto)
    pagebreak()
  }

  show: mis-en-page
  set math.equation(numbering: if config.numbering { "(1)" } else { none })

  // 3. Contenu principal
  doc

  // 4. Sections automatiques de fin
  include "5_signature.typ"
  glossaire-cache()

  pagebreak(weak: true)
  include "2_layout.typ"

  bibliography("../settings/refs.bib", title: none)
}

// annexes-contenu : (optionnel) bloc d'annexes, ex : [ #pdf("exemple.pdf", "Titre", etiquette: <ann:a1>) ]
#let rapport-brouillon(annexes-contenu: none) = doc => {
  set text(size: 11pt, lang: config.langue)
  counter(page).update(1)

  show: make-glossary
  register-glossary(toutes-entrees)
  show: mis-en-page
  set math.equation(numbering: "(1)")

  // Contenu principal
  doc

  // Sections automatiques de fin
  include "5_signature.typ"
  glossaire-cache()
  pagebreak(weak: true)
  include "2_layout.typ"

  bibliography("../settings/refs.bib", title: none)

  if annexes-contenu != none {
    annexes(annexes-contenu)
  }
}

// Exports des boîtes utilitaires
#let info-box = info-box
#let danger-box = danger-box
#let valid-box = valid-box
#let feu-box = feu-box
#let idea-box = idea-box
#let todo-box = todo-box
#let stabilo = stabilo
#let code = code
#let code-fichier = code-fichier
#let photo = photo
#let pdf-annexe = pdf
