#import "@preview/glossarium:0.5.4": make-glossary, print-glossary, register-glossary, there-are-refs
#show: make-glossary
#import "../settings/acronymes.typ": mes-acronymes
#import "../settings/abreviations.typ": mes-abreviations
#import "../settings/name.typ": *


// Quand aucune entrée d'une table n'est citée, la table n'est pas affichée.
// Mais glossarium ne crée les cibles des @cle que via print-glossary : on le
// génère donc quand même, de façon invisible (place + hide : aucune place,
// aucune page en plus). Appelée par rapport() juste après la signature, sur
// une page déjà remplie.
#let glossaire-cache() = context {
  for liste in (mes-acronymes, mes-abreviations) {
    if not there-are-refs(entry-list: liste) {
      place(hide(print-glossary(liste)))
    }
  }
}

// PDF (annexes)
// Une annexe n'est affichée que si elle est citée dans le texte avec @etiquette
// (ex : etiquette: <ann:schema>  ->  @ann:schema). Sans étiquette, elle n'est
// jamais affichée. Les lettres A, B, C... ne sont attribuées qu'aux annexes
// affichées, dans l'ordre où elles sont écrites dans le bloc #annexes[...].
#let pdf(nom_fichier, titre, debut: 1, fin: 1, etiquette: none, flipped: false) = context {
  let referencee = etiquette != none and query(ref).any(r => r.target == etiquette)

  if referencee {
    let chemin = "/assets/PDF/" + nom_fichier
    let fig = figure(
      image(chemin, page: debut, width: 100%, height: 100%, fit: "contain"),
      caption: titre,
      kind: "annexe",
      supplement: [#langue.annexe],
      numbering: "A",
      outlined: true,
    )

    page(margin: 0cm, header: none, footer: none, flipped: flipped)[
      #show figure.where(kind: "annexe"): it => it.body
      #fig #etiquette
    ]

    if fin > debut {
      for p in range(debut + 1, fin + 1) {
        page(margin: 0cm, header: none, footer: none, flipped: flipped)[
          #image(chemin, page: p, width: 100%, height: 100%, fit: "contain")
        ]
      }
    }
  }
}

#label("fin_rapport")


// VÉRIFICATION GLOBALE DES PAGES ET TABLE DES ILLUSTRATIONS
#context {
  let images = query(figure.where(kind: image))
  let tableaux = query(figure.where(kind: table))



  if images.len() > 0 {
    heading(level: 1, outlined: false, numbering: none)[#langue.table-figure]
    outline(title: none, target: figure.where(kind: image), indent: auto)
  
  }
}

// TABLE DES TABLEAUX
#context {
  
  let tableaux = query(figure.where(kind: table))
  if tableaux.len() > 0 {
    heading(level: 1, outlined: false, numbering: none)[#langue.table-table]
    outline(title: none, target: figure.where(kind: table), indent: auto)
    
  }
}

// BIBLIOGRAPHIE AUTONOME
#context {
  if query(cite).len() > 0 {
    set bibliography(title: [#langue.table-biblio])
    bibliography("../settings/refs.bib")
  }
}

// TABLE DES ACRONYMES et TABLE DES ABRÉVIATIONS
// Chaque table n'est affichée que si au moins une de ses entrées est citée
// (@hei, #gls("hei"), ...). Sinon rien n'est visible (voir glossaire-cache).
#let table-entrees(titre, liste) = context {
  if there-are-refs(entry-list: liste) {
    heading(level: 1, numbering: none)[#titre]
    set figure(outlined: false)
    print-glossary(liste)
  }
}

#table-entrees(langue.table-acronymes, mes-acronymes)
#table-entrees(langue.table-abreviations, mes-abreviations)

// TABLE DES ANNEXES

#context {
  
  
  let annexes = query(figure.where(kind: "annexe"))
  
    if annexes.len() > 0 {
      heading(level: 1, numbering: none)[#langue.table-annexes]
      outline(title: none, target: figure.where(kind: "annexe"), indent: auto)
    }
  
}

// Bloc à placer après #rapport[...] dans main.typ. N'affiche la page
// "Annexes" que si au moins une annexe est citée dans le texte.
#let annexes(corps) = {
  context {
    let n = query(figure.where(kind: "annexe")).len()

    // Saut de page + page de garde "Annexes" uniquement s'il y a des annexes citées
    if n > 0 {
      pagebreak(to: "even")

      page(header: none, footer: none, margin: 2mm)[
        #align(center + horizon)[
          #text(size: 40pt, weight: "bold")[
            #if n > 1 [#langue.annexe-pl] else [#langue.annexe]
          ]
        ]
      ]
    }
  }

  set page(header: none, footer: none)
  corps
}
