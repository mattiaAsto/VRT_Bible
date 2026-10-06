// ACRONYMES  (ex : HEI = Haute École d'Ingénierie)
// ---------------------------------------------------------------------------
// Utilisation dans le texte :  @hei
//   -> 1re citation : "Haute École d'Ingénierie (HEI)", ensuite : "HEI"
//   -> @hei:pl pour le pluriel
// La "Table des acronymes" n'apparaît à la fin du document que si au moins un
// acronyme de CE fichier est cité dans le texte.
//
// Champs d'une entrée :
//   key         (obligatoire) identifiant unique, sans espace  -> @key
//   short       (obligatoire) forme courte
//   long        (obligatoire) forme longue
//   plural      (optionnel)   forme courte au pluriel
//   description (optionnel)   texte affiché dans la table
//
// Attention : une clé ne doit pas exister aussi dans abreviations.typ.
// ---------------------------------------------------------------------------

#let mes-acronymes = (
  (
    key: "hei",
    short: "HEI",
    long: "Haute École d'Ingénierie",
  ),
  (
    key: "hesso",
    short: "HES-SO",
    long: "Haute école spécialisée de Suisse occidentale",
  ),
  (
    key: "pwm",
    short: "PWM",
    long: "Pulse Width Modulation",
    description: "Technique qui règle la puissance moyenne envoyée à une charge en faisant varier la largeur des impulsions d'un signal périodique.",
  ),
)
