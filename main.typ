// Configuration: src/settings/name.typ
#import "layout/0_lib.typ": *
#import "layout/2_layout.typ": *

#rapport[
  
#include "0_introduction.typ"
// mettre ici les autre fichiers
#todo-box[Attention pensez à désactivez les annexes si vous ne les utilisé pas]




#pagebreak()
#include "conclusion.typ"

]


// inclure des annexes ici 
#annexes[
  
    #pdf("exemple.pdf", "exemple ", debut: 2, fin: 3, etiquette: <ann:reference1>)
      
    
    #pdf("exemple.pdf", "exemple 2 ", debut: 1, fin: 1, etiquette: <ann:reference2>, flipped: true)
    
    
    
]










