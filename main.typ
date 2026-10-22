// Configuration
#import "template.typ": *

#show: doc => template(
  doc,
  title: [Pixie],
  subtitle: "",
  author: "N. Tillier, P. Chaudagne",
)


#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *
#import "@preview/ornamentalyst:0.1.0": *
#show: codly-init.with()

#codly(
  radius: 0pt,
  zebra-fill: none,
  languages: codly-languages,
)

// Importation des entrées
#include "items/algebre.typ"
#include "items/graphes.typ"
#include "items/langages.typ"
#include "items/redirections.typ"
#include "items/programmation.typ"
#include "items/logique.typ"
#include "items/jeux.typ"
#include "items/structures.typ"
#include "items/bdd.typ"
#include "items/autre.typ"


// Page d'accueil
#align(center + horizon)[

  #text(size: 34pt, weight: "bold", font: "Exo 2")[
    #cap[P]'tit #cap[I]nde#cap[X] d'#cap[I]nformatiqu#cap[E]
  ]

  #v(1em)

  #context text(size: 12pt)[
    #context entries-count.final() entrées à la date du 
    #let day(str) = datetime.today().display(str)
    #convert_days(day("[weekday]")) #day("[day]") #convert_months(int(day("[month]"))) #day("[year]")
  ]

  #v(1em)

  #text(size: 12pt)[
    11 verres de sirop, 
    4 cookies, 
    // 0 tasses de chocolat, 
    52h heures de travail
  ]
]

#align(bottom + right)[
  #text(size: 12pt)[#context{document.author.join(", ")}] 
]

// Intro
#pagebreak()

#align(top + right)[

  // https://www.gutenberg.org/cache/epub/8226/pg8226-images.html
  "The Pixies, or the Devonshire fairies, are just like the northern elves. The popular idea of them is that they are small creatures—pigmies—dressed in green, and are fond of dancing. Some of them live in the mines, where they show the miners the richest veins of metal just like the German dwarfs; others live on the moors, or under the shelter of rocks; others take up their abode in houses, and, like the Danish and Swedish elves, are very cross if the maids do not keep the places clean and tidy others, like the will-o'-the-wisps, lead travellers astray, and then laugh at them." \ John Thackray Bunce, _Fairy tales, their origin and meaning_

  #v(1em)

  // https://fr.wikisource.org/wiki/La_Vie_litt%C3%A9raire/2/Lexique
  "À bien prendre les choses, le dictionnaire est le livre par excellence : tous les autres livres sont dedans, il ne s'agit plus que de les en tirer."\
  Anatole France, _La Vie littéraire, 2e série_

  #v(1em)

  // https://web.mit.edu/6.001/6.037/sicp.pdf
  "Programs must be written for people to read, and only incidentally for machines to execute."\
  H. Abelson, G. Sussman, J. Sussman,  _Structure and Interpretation of Computer Programs_

  #v(1em)

  // https://gallica.bnf.fr/ark:/12148/bpt6k5443790t/f124.image.r=aveugle#
  /*"Des pensées sans contenu sont vides, des intuitions sans concepts, aveugles" \ Emmanuel Kant, _Critique de la raison pure_ (traduction de 1905)

  #v(1em)*/
   
  "An algorithm must be seen to be believed."\
  Donald Knuth, _The Art of Computer Programming, Volume 1_

  #v(1em)

  
  
]

#align(center + bottom)[
  #table(columns: (0.6fr, 1fr, 0.6fr), stroke: 0pt)[][
    Afin d'améliorer ce document n'hésitez pas à nous transmettre les éventuelles critiques, remarques ou corrections qui vous viendraient à l’esprit à sa lecture, à l'adresse : 

    #{"contact@paulch.fr ou nathanti@crans.org"}

    #v(1em)

    #align(center)[
      #ornament(60, symmetry: "", width: 258pt)
    ]
  ]
]


#pagebreak()

#place[#hide[#heading(level: 1)[Avant-propos]]]

#set par(first-line-indent: (amount: 1.5em, all:true))

Nous avons réalisé ce dictionnaire comme une synthèse des notions abordées au cours des deux années de classe préparatoire MP2I puis MPI. Sans prétendre à une exhaustivité complète, nous espérons qu'il représente un condensé de ce à quoi vous serez confrontés, avec des explications simples et des exemples afin de vous aider à rapidement appréhender les différentes définitions.


Ce projet tire son inspiration du _Petit Dico de Maths_ de M. Appel. Le contenu s'inspire quant à lui des cours d'informatique et exercices de M. Rebout et M. Bianquis. Nous souhaitons les remercier pour cette inspiration ainsi que pour leurs enseignements des années passées.

_Ce dictionnaire est encore en cours de rédaction._

#align(bottom + center)[
  #image("figures/pixies.png", width: 60%)
  Illustration par John Dickson Batten pour _More English Fairy Tales_, Joseph Jacobs
]

// Dictionnaire
#set par(first-line-indent: 0em)
#set page(columns: 2)
#set table(align: center)

#render-entries()

// Index
#pagebreak()

#set page(columns: 1)

= Table des matières

== Liste des figures
#outline(
  title: none,
  target: figure.where(kind: image)
)

== Liste des algorithmes
#outline(
  title: none,
  target: figure.where(kind: "algorithm")
)

// == Liste des entrées

// #context entries.final().map((it) => upper(it.slug.at(0))).dedup().join(", ")
// #context entries.final().map(it => link(label(it.slug))[#it.word]).join(", ")