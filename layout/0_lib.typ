// Modèle de rapport de laboratoire HES-SO
// Exportation principale des fonctions du template

#import "@preview/glossarium:0.5.4": make-glossary, print-glossary, register-glossary
#import "@preview/lilaq:0.5.0" as lq
#import "../settings/name.typ": *
#import "../settings/glossaire.typ": mes-acronymes
#import "1_layout.typ": *
#import "2_layout.typ": *
#import "3_box_layout.typ": *
#import "4_cover_page_layout.typ": page-garde

// Règle de sécurité globale pour que les clés @ soient reconnues partout sans erreur
#show bibliography: none

#let boite-annexes = state("mes-annexes", none)

#let etat-glossaire = state("rapport-glossaire-utilise", false)

#let rapport(doc) = {
  // 1. Initialisation standard
  set text(size: 11pt, lang: config.langue)

  if(config.page_garde){
  page-garde()
  
  counter(page).update(1)
  
  show: make-glossary
  register-glossary(mes-acronymes)
  show: mis-en-page
  set math.equation(numbering: if config.numbering { "(1)" } else { none })
  
  
  heading(level: 1, numbering: none, outlined: false)[#langue.table-matiere]
  
  outline(title: none, indent: auto) 
  pagebreak()
  
    let cles = mes-acronymes.map(e => str(e.at("key", default: e.at("name", default: ""))))
  show ref: it => {
    if str(it.target) in cles {
      etat-glossaire.update(true)
    }
    it
  }
  
  }
   show: mis-en-page
 


  // 3. Contenu principal
  doc
  
  

  // 4. Sections automatiques de fin
  include "5_signature.typ"

    pagebreak(weak: true)
    include "2_layout.typ"
    
    bibliography("../settings/refs.bib",title: none)
    
    
    if boite-annexes!= none {
    context {
      let contenu = boite-annexes.final()
      contenu
    }
  }

}

#let rapport-brouillon() = doc => {
  set text(size: 11pt, lang: config.langue)  
  counter(page).update(1)
  
  show: make-glossary
  register-glossary(mes-acronymes)
  show: mis-en-page
  set math.equation(numbering: "(1)" )
  



  let cles = mes-acronymes.map(e => str(e.at("key", default: e.at("name", default: ""))))
  show ref: it => {
    if str(it.target) in cles {
      etat-glossaire.update(true)
    }
    it
  }

  // 3. Contenu principal
  doc
  
  

  // 4. Sections automatiques de fin
  include "5_signature.typ"
  pagebreak(weak: true)
  include "2_layout.typ"
  
  bibliography("../settings/refs.bib",title: none)
  
  
  show: make-glossary
  register-glossary(mes-acronymes)

  
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
