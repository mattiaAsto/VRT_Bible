// Configuration: settings/name.typ
#import "layout/0_lib.typ": *
#import "layout/2_layout.typ": *

#rapport[
  
#include "0_introduction.typ"
// mettre ici les autre fichiers
// Acronymes (settings/acronymes.typ) et abréviations (settings/abreviations.typ) :
//   écrivez @hei, @ca... dans votre texte.
//   -> chaque table ("Table des acronymes", "Table des abréviations") n'apparaît que si au moins une de ses entrées est citée.




#pagebreak()
#include "conclusion.typ"

]


// Annexes : déclarez-les ci-dessous avec #pdf(...) et donnez-leur une étiquette (etiquette: <ann:nom>).
//   -> une annexe n'est affichée QUE si vous la citez dans le texte avec @ann:nom
//      (exactement comme un acronyme). Les lettres A, B, C... ne vont qu'aux annexes affichées.
//   -> aucune annexe citée : ni page "Annexes", ni "Table des annexes". Rien à désactiver.
#annexes[
  
    #pdf("exemple.pdf", "exemple ", debut: 2, fin: 3, etiquette: <ann:reference1>)
      
    
    #pdf("exemple.pdf", "exemple 2 ", debut: 1, fin: 1, etiquette: <ann:reference2>, flipped: true)
    
    
    
]










