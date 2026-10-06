// Configuration centralisée du rapport
// Modifiez uniquement ces 2 structures pour tout configurer ⬇️

// 1️⃣ CONFIGURATION PRINCIPALE
#let config = (
  cours: "nom_du_cours",
  titre: "titre",
  sous-titre: "sous-titre",
  filiere: "Système industriel",
  version: "1.1",
  date: datetime.today().display("date"),// si tu enlèves "date", la date se met automatiquement à jour
  logo: "logo_hes.svg",
  cover-image: "", // mettre le nom de l'image de couverture  :exemple.png
  size-image: 140pt,
  titre-image: "titre",
  
  numbering: false,
  page_garde: true, // si false : pas de page de garde et pas de table des matières 

  langue: "fr",// mettre soit  "de" soit en soit "en"
)

// 2️⃣ AUTEURS (active: true/false pour ajouter/enlever)
#let auteurs = (
  (
    active: true,
    prenom: "Amaury",
    nom: "Wailliez",
    abreviation: "Amaury Wailliez",
    email: "amaury.wailliez@hes-so.ch",
    signature: "signature_wailliez.png",
  ),
  (
    active: true,
    prenom: "Deuxième",
    nom: "Auteur",
    abreviation: "D.A",
    email: "exemple@hes-so.ch",
    signature: "",
  ),
  // possibilé de rajouter plusieurs élèves
)

// 3️⃣ PROFESSEURS (active: true/false pour ajouter/enlever)
#let professeurs = (
  (
    active: true,
    prenom: "Prénom",
    nom: "Nom",
    email: "exemple@hes-so.ch",
  ),
  //possibilité de mettre plusieurs professeurs
)


  
 // Langue
#let langue = if config.langue == "fr" {
  (
    auteur: "Auteur",
    auteur-pl: "Auteurs",
    professeur: "Professeur",
    professeur-pl: "Professeurs",
    cours: "Cours",
    filiere: "Filière",
    version: "Version",
    date: "Date",
    date-text: "Réalisé le: ",
    page: "Page",
    table-matiere: "Table des matières",
    table-biblio: "Bibliographie",
    table-gloss: "Glossaire",
    table-acronymes: "Table des acronymes",
    table-abreviations: "Table des abréviations",
    figure: "Figure",
    table-annexes: "Table des annexes",
    table-figure: "Table des illustrations",
    table-table: "Table des tableaux",
    annexe: "Annexe",
    annexe-pl: "Annexes"
  )
} else if config.langue == "en" {
  (
    auteur: "Author",
    auteur-pl: "Authors",
    professeur: "Professor",
    professeur-pl: "Professors",
    cours: "Course",
    filiere: "Degree program",
    version: "Version",
    date: "Date",
    date-text: "Created on: ",
    page: "Page",
    table-matiere: "Table of Contents",
    table-biblio: "Bibliography",
    table-gloss: "Glossary",
    table-acronymes: "List of Acronyms",
    table-abreviations: "List of Abbreviations",
    figure: "Figure",
    table-annexes: "List of Appendices",
    table-figure: "List of Figures",
    table-table: "List of Tables",
    annexe: "Appendix",
    annexe-pl: "Appendices"
  )
} else if config.langue == "de" {
  (
    auteur: "Autor",
    auteur-pl: "Autoren",
    professeur: "Professor",
    professeur-pl: "Professoren",
    cours: "Kurs",
    filiere: "Studiengang",
    version: "Version",
    date: "Datum",
    date-text: "Erstellt am: ",
    page: "Seite",
    table-matiere: "Inhaltsverzeichnis",
    table-biblio: "Literaturverzeichnis",
    table-gloss: "Glossar",
    table-acronymes: "Akronymverzeichnis",
    table-abreviations: "Abkürzungsverzeichnis",
    figure: "Abbildung",
    table-annexes: "Anhangsverzeichnis",
    table-figure: "Abbildungsverzeichnis",
    table-table: "Tabellenverzeichnis",
    annexe: "Anhang",
    annexe-pl: "Anhänge"
  )
} else {
  (
    auteur: "-",
    auteur-pl: "-",
    professeur: "-",
    professeur-pl: "-",
    cours: "-",
    filiere: "-",
    version: "-",
    date: "-",
    date-text: "-",
    page: "-",
    table-matiere: "-",
    table-biblio: "-",
    table-gloss: "-",
    table-acronymes: "-",
    table-abreviations: "-",
    figure: "-",
    table-annexes: "-",
    table-figure: "-",
    table-table: "-",
    annexe: "-",
    annexe-pl: "-"
  )
}
