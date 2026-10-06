
#import "../settings/name.typ": *


#let code(contenu) = {
  // Création du bloc gris conteneur
  block(
    fill: rgb("#f4f4f4"), // Fond gris clair
    stroke: 0.5pt + luma(180), // Bordure grise fine
    radius: 4pt, // Coins arrondis
    inset: 10pt, // Marge intérieure
    width: 100%, // Largeur max

    // Grille : Colonne 1 (Numéros) | Colonne 2 (Code)
    grid(
      columns: (auto, 1fr),
      gutter: 10pt,

      // Colonne des numéros de ligne (alignée à droite, en gris)
      align(right, text(fill: luma(150), size: 0.8em, font: "New Computer Modern")[
        #let n = contenu.text.split("\n").len()
        #for i in range(n) [
          #(i + 1) \
        ]
      ]),

      // Colonne du code (alignée à gauche)
      align(left, contenu),
    ),
  )
}

#let code(titre, contenu) = {
  figure(
    caption: titre,
    supplement: "Figure",
    kind: image, 
    block(
      fill: rgb("#f4f4f4"),
      stroke: 0.5pt + luma(180),
      radius: 4pt,
      inset: 10pt,
      width: 100%,
      grid(
        columns: (auto, 1fr),
        gutter: 10pt,
        // Colonne numéros
        align(right, text(fill: luma(150), size: 0.8em, font: "New Computer Modern")[
          #let n = contenu.text.split("\n").len()
          #for i in range(n) [
            #(i + 1) \
          ]
        ]),
        // Colonne code
        align(left, contenu),
      ),
    )
  )
}

// Affiche un extrait de code depuis un fichier
#let code-fichier(
  chemin,
  titre,
  debut: 1,
  fin: none,
  lang: "python",
) = {
  let texte-brut = read(chemin)
  let lignes = texte-brut.split("\n")
  let total = lignes.len()

  let fin-index = if fin == none { total } else { calc.min(fin, total) }
  let debut-index = calc.max(1, debut) - 1

  let lignes-extraites = if debut-index < fin-index {
    lignes.slice(debut-index, fin-index)
  } else {
    () 
  }

  let code-extrait = lignes-extraites.join("\n")

  figure(
    caption: titre,
    supplement: "Figure",
    kind: image, // Pour qu'il apparaisse dans la table des illustrations
    block(
      fill: rgb("#f4f4f4"),
      stroke: 0.5pt + luma(180),
      radius: 4pt,
      inset: 10pt,
      width: 100%,
      grid(
        columns: (auto, 1fr),
        gutter: 10pt,
        
        // Colonne des numéros
        align(right, text(fill: luma(150), size: 0.8em, font: "New Computer Modern")[
          #for i in range(lignes-extraites.len()) [
            #(debut + i) \
          ]
        ]),
        
        // Colonne du code
        align(left, raw(code-extrait, lang: lang, block: true)),
      ),
    )
  )
}




// Box

#let bulle(couleur, icone, contenu) = block(
  fill: couleur.lighten(90%),
  stroke: (left: 4pt + couleur),
  radius: 2pt,
  inset: 12pt,
  width: 100%,

  grid(
    columns: (auto, 1fr),
    gutter: 15pt,
    align: horizon,
    text(size: 16pt, icone), contenu,
  ),
)

// --- LES RACCOURCIS À UTILISER DANS VOS DOCUMENTS ---

// Boîte Bleue (Information)
#let info-box(body) = bulle(rgb("#0074D9"), "ℹ️", body)

// Boîte Orange (Attention/Danger)
#let danger-box(body) = bulle(rgb("#FF851B"), "⚠️", body)

// Boîte Verte (Validation/Succès)
#let valid-box(body) = bulle(rgb("#2ECC40"), "✅", body)

// Boîte Rouge (Erreur critique/Feu)
#let feu-box(body) = bulle(rgb("#FF4136"), "🔥", body)

// Boîte Violette (Idée/Astuce)
#let idea-box(body) = bulle(rgb("#B10DC9"), "💡", body)



// Box Todo


#let todo-box(body) = {
  let couleur = rgb("#FF5C5C") // La couleur rouge/rosé de ton image

  
  block(width: 100%, above: 1.8em, below: 1em)[
    #block(
      width: 100%,
      fill: couleur.lighten(90%),
      stroke: 1pt + couleur, // Bordure tout autour
      radius: 4pt, // Coins arrondis
      inset: (top: 14pt, bottom: 12pt, left: 12pt, right: 12pt),
    )[
      // L'étiquette flottante "TODO"
      #place(top + left, dy: -23pt, dx: 8pt)[
        #block(
          fill: white,
          stroke: 1pt + couleur,
          radius: 10pt, 
          inset: (x: 8pt, y: 3pt),
        )[
          #text(fill: couleur, weight: "bold")[TODO]
        ]
      ]

      #body
    ]
  ]
}



// bloc stabilo
#let stabilo(corps, couleur: yellow, opacite: 65%) = {
  let couleur-transparente = couleur.transparentize(100% - opacite)
  highlight(fill: couleur-transparente)[#corps]
}

#let photo(largeur: 15%, nom: none) = {
  align(center)[
    #image("../assets/picture/picture_template/logo_photo.png", width: largeur)

    #if nom != none {
      v(-5pt)
      text(fill: luma(0), size: 1em)[#nom]
    }
  ]
}



