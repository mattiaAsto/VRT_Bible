// ABRÉVIATIONS  (ex : ca. = circa)
// ---------------------------------------------------------------------------
// Utilisation dans le texte :  @ca
//   -> 1re citation : "circa (ca.)", ensuite : "ca."
//   -> @ca:pl pour le pluriel
// La "Table des abréviations" n'apparaît à la fin du document que si au moins
// une abréviation de CE fichier est citée dans le texte.
//
// Champs d'une entrée : voir acronymes.typ (mêmes champs).
//
// Attention : une clé ne doit pas exister aussi dans acronymes.typ.
// ---------------------------------------------------------------------------

#let mes-abreviations = (
  (
    key: "ca",
    short: "ca.",
    long: "circa",
  ),
  (
    key: "cf",
    short: "cf.",
    long: "confer",
  ),
  (
    key: "ie",
    short: "i.e.",
    long: "id est",
  ),
)
