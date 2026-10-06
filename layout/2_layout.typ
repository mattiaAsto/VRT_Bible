#import "@preview/glossarium:0.5.4": make-glossary, print-glossary, register-glossary
#show: make-glossary
#import "../settings/glossaire.typ": mes-acronymes
#import "../settings/name.typ": *


// PDF 
#let pdf(nom_fichier, titre, debut: 1, fin: 1, etiquette: none, flipped: false) = {
  let chemin = "/assets/PDF/" + nom_fichier
  let fig = figure(
    image(chemin, page: debut, width: 100%, height: 100%, fit: "contain"),
    caption: titre,
    kind: "annexe",
    supplement: [Annexe],
    numbering: "A",
    outlined: true,
  )
  
  // On passe directement le paramètre flipped à la fonction page originale
  page(margin: 0cm, header: none, footer: none, flipped: flipped)[
    #show figure.where(kind: "annexe"): it => it.body
    #if etiquette != none [
      #fig #etiquette
    ] else [
      #fig
    ]
  ]
  
  if fin > debut {
    for p in range(debut + 1, fin + 1) {
      // On applique aussi le flipped sur les pages suivantes du PDF si nécessaire
      page(margin: 0cm, header: none, footer: none, flipped: flipped)[
        #image(chemin, page: p, width: 100%, height: 100%, fit: "contain")
      ]
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

// GLOSSAIRE

#context {

  let glossaire= state("rapport-glossaire-utilise", false).final()

 
  if glossaire{
    heading(level: 1, numbering: none)[#langue.table-gloss]
    set figure(outlined: false)
    print-glossary(mes-acronymes)
  }
}

// TABLE DES ANNEXES

#context {
  
  
  let annexes = query(figure.where(kind: "annexe"))
  
    if annexes.len() > 0 {
      heading(level: 1, numbering: none)[#langue.table-annexes]
      outline(title: none, target: figure.where(kind: "annexe"), indent: auto)
    }
  
}

#let annexes(corps) = {
  if(config.page_garde){
    context {
      let n = query(figure.where(kind: "annexe")).len()
      
      // On ne fait le saut de page ET la page de garde QUE s'il y a de vraies annexes
      if n > 0 {
        pagebreak(to: "even") // Ou "odd" selon votre besoin de mise en page
        
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
}

