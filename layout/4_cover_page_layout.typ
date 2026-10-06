#import "../settings/name.typ": *

#let page-garde() = {

  page(
    margin: (top: 3cm, bottom: 2cm, x: 2.5cm),
    header: none,
    footer: none,
    numbering: none,
  )[
    // --- CONTENU DE LA PAGE ---
    #set text(font: "New Computer Modern")
    #set par(justify: false)

    // LOGO
    #place(top + left, dy: -1.5cm)[
      #image("../assets/picture/picture_template/" + config.logo, width: 35%)
    ]

    // TITRES + IMAGE CENTRALE
    #align(center + horizon)[
      #v(-2cm) 

      #text(size: 32pt, weight: "bold", fill: teal.darken(20%))[
        #config.titre
      ]

      #v(1em)

      #text(size: 18pt, weight: "medium")[
        #config.sous-titre
      ]

      #v(2cm)

      // Affiche l'image seulement si le chemin est valide
      #if config.cover-image == ""{
        figure(
        image("../assets/picture/picture_template/logo_photo.png", height: config.size-image, fit: "contain"),
        caption: config.titre-image,
        supplement: none,
        numbering: none,
        kind: "ignore",
        outlined: false,
      )
        
      }else{
        figure(
        image("../assets/picture/" + config.cover-image, height: config.size-image, fit: "contain"),
        caption: config.titre-image,
        supplement: none,
        numbering: none,
        kind: "ignore",
        outlined: false,
      )
        
      }

    ]


    // BLOC INFO BAS DE PAGE

    #set text(size: 12pt, weight: "regular", fill: black)

    // BLOC INFO BAS DE PAGE
    #place(bottom + center)[
      #block(
        stroke: 2pt + black,
        inset: 20pt,
        radius: 15pt,
        fill: white,
      )[
        #set text(size: 12pt, weight: "regular", fill: black)

        #grid(
          columns: (auto, auto),
          column-gutter: 1.5em,
          // Espace entre label et valeur
          row-gutter: 1em,
          // Espace entre chaque ligne (Prof, Cours, etc.)
          align: (right + top, left + top),

          // --- LOGIQUE AUTEURS ---
          ..{
            let names = ()
            for author in auteurs {
              if author.active {
                names.push(author.prenom + " " + author.nom)
              }
            }

            let label = if names.len() > 1 [*#langue.auteur-pl :*] else [*#langue.auteur :*]
            let list_noms = stack(dir: ttb, spacing: 0.5em, ..names)

            (label, list_noms)
          },

          // --- PROFESSEURS ---
          ..{
            let profs = professeurs.filter(p => p.active)
            if profs.len() > 0 {
              let prof-label = if profs.len() > 1 [*#langue.professeur-pl :*] else [*#langue.professeur :*]
              let prof-noms = stack(dir: ttb, spacing: 0.5em, ..profs.map(p => p.prenom + " " + p.nom))
              (prof-label, prof-noms)
            } else {
              ()
            }
          },

          // --- AUTRES LIGNES ---
          [*#langue.cours :*], config.cours,
          [*#langue.filiere :*], config.filiere,
          [*#langue.version :*], config.version,
          [*#langue.date :*], config.date,
        )
      ]
    ]

  ]

  // Fin du bloc page() -> Saut de page automatique ici
}
