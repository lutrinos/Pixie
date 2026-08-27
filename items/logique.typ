#import "../template.typ": *

#item("Conjonction")[
  #remarque[
    En C et OCaml, la conjonction logique est symbolisée par `&&`.
    ```C
    if (a && b) {}
    ```
    ```ocaml
    if a && b then ()
    ```
  ]
]

#item("Disjonction")[
  #remarque[
    En C et OCaml, la disjonction logique est symbolisée par `||`.
    ```C
    if (a || b) {}
    ```
    ```ocaml
    if a || b then ()
    ```
  ]
]

#item("Négation")[
  #remarque[
    En C, la disjonction logique est symbolisée par `!`, en OCaml on utilise le mot-clé `not`.
    ```C
    if (!a) {}
    ```
    ```ocaml
    if not a then ()
    ```
  ]
]

#item("Séquent")[
  Couple $(Gamma, A)$ où $Gamma$ est un ensemble de formules propositionnelles et $A$ une formule propositionnelle, notée $ Gamma tack A $
  On l’interprète comme "à partir des hypothèse $Gamma$ on en déduit $A$".
]

#item("Formule propositionnelle")[
  Une formule propositionnelle est un élément de l'ensemble $cal(P)$ des formules propositionnelles défini de manière inductive par :
  - $bot, top in cal(P)$
  - $cal(V) subset cal(P)$ où $cal(V)$ est un ensemble infini dénombrable dont les éléments sont les variables propositionnelles
  - si $P, Q in cal(P)$, alors les arbres suivants sont dans $cal(P)$

  #let diagram1 = diagram(
    node-shape: fletcher.shapes.circle,
    node-fill: white,
    node-stroke: black, // + .2pt,
    edge-stroke: black, // + .2pt,
    label-size: 500pt,
    spacing: (14pt, 20pt),
    
    node((0, 0), [#math.not]),
    node((0, 1), [P], shape: fletcher.shapes.rect),
    edge((0,0), (0,1)),
  
    node((3, 0), [#math.and]),
    node((2, 1), [P], shape: fletcher.shapes.rect),
    node((4, 1), [Q], shape: fletcher.shapes.rect),
    edge((3, 0), (2, 1)),
    edge((3, 0), (4, 1)),
    
    node((6, 0), [#math.or]),
    node((5, 1), [P], shape: fletcher.shapes.rect),
    node((7, 1), [Q], shape: fletcher.shapes.rect),
    edge((6, 0), (5, 1)),
    edge((6, 0), (7, 1)),
  )
  
  #set text(size: 15pt)
  #box(scale(70%)[#diagram1])
  #set text(size: 11pt)
  
  // $ { not P , space not Q, space P and Q, space P or Q } subset cal(P) $

  #remarque[
    La hauteur et la taille d'une formule propositionnelle correspondent respectivement à la hauteur et la taille de l'arbre correspondant.
  ]

  #exemple[
    Le type d'un formule propositionnelle en OCaml, avec $cal(V) = ZZ$ est
    ```ocaml
    type prop =
      | Const of bool
      | Var of int
      | Non of prop
      | Et of prop * prop
      | Ou of prop * prop
    ```
  ]
]

#item("Valuation")[
  Avec $cal(V)$ l'ensemble des variables propositionnelles, une valuation est une application $ v : cal(V) -> cal(B) $
  Où $ cal(B) = {0,1} "ou" cal(B) = {F,V} $

  #implementation[
    Souvent, les variables seront notées $x_i$ où $i$ est un entier positif. Une valuation sera alors un tableau $v$ où $v[i]$ vaut la valuation associée à la variable $x_i$.
  ]
]

#item("Table de vérité")[
  La table de vérité d'une proposition $P$ est un tableau représentant les valeurs prises par $P$ selon les valuations des variables propositionnelles intervenant dans $P$.

  #exemple[
    La table de vérité de la proposition $P = (x and not y) or (not x and y)$ est
    #table(
      columns: (40pt, 40pt, 1fr),
      [*x*], [*y*], [$(x and not y) or (not x and y)$],
      [0], [0], [0],
      [0], [1], [1],
      [1], [0], [1],
      [1], [1], [0]
      
    )
  ]
]

#item("Sheffer (connecteur de)")[
  Todo
]

#item("Littéral")[
  Formule constituée uniquement d'une variable ou de la négation d'une variable : $ x "ou" not x $
]

#item("Terme")[
  Arbre construit à partir de variables et symboles de constantes pour les feuilles, et de symboles de fonction pour les nœuds internes. \ Todo synonyme devariable propositionnelle ?
]

#item("Min-terme")[
  Conjonctions de littéraux dans laquelle chacune des variables apparaît une fois.

  #exemple[
    $x and (not y) and z$ est un min-terme, mais $a and (b or c)$ n'est pas un min-terme.
  ]
]

#item("Max-terme")[
  Disjonction de littéraux dans laquelle chacune des variables apparaît une fois.

  #exemple[
    $ x or y or not z $ est un max-terme. $ a or (b and c) $ n'est pas un max-terme.
  ]
]

#item("Clause", related: ("Min-terme", "Max-terme"))[
  Min-terme ou max-terme. Todo ?
]

#item("Forme normale conjonctive")[
  Une forme normale conjonctive, abrégée FNC, est une conjonction de max-termes. \
  Toute formule propositionnelle $P$ admet une unique forme normale conjonctive (à l'ordre près), et cette forme est dite canonique si chacun des max-termes contient toutes les variables de $P$.
]

#item("Formule atomique")[
  Todo
]

#item("Forme normale disjonctive")[
  Une forme normale disjonctive, abrégée FND, est une disjonction de min-termes. \
  Toute formule propositionnelle $P$ admet une unique forme normale disjonctive (à l'ordre près), et cette forme est dite canonique si chacun des min-termes contient toutes les variables de $P$.
]

// #item("Forme normale")[
//   Todolater
// ]

#item("SAT")[
  Todo (avec 3-sat)
]

#item("Satisfiable")[
  Une formule propositionnelle $P$ est dite satisfiable s'il existe une valuation $v$ telle que $ tilde(v)(P) = V $
  On note $"Mod"(P)$ l'ensemble des valuations qui satisfont $P$.
]

#item("Quine (algorithme de)")[
  Todo
]

#item("Complétude")[
  Todo
]

#item("Déduction naturelle")[
  Todo
]

#item("Système déductif")[
  Todo
]

#item("Système cohérent")[
  Todo
]

#item("Système correct")[
  Todo
]

#item("Axiome")[
  Todo
]

#item("Règle d'inférence")[
  Todo
]

#item("Satisfiabilité")[
  Todo
]

#item("Tautologie")[
  Formule propositionnelle $P$ telle que toute valuation la satisfait : $ "Mod"(P) = cal(B)^cal(V) $
]

#item("Antilogie")[
  Formule propositionnelle $P$ telle qu'aucune valuation la satisfait : $ "Mod"(P) = emptyset $
]

#item("Variable libre")[
  Todo
]

#item("Variable liée")[
  Todo
]

#item("Logique du premier ordre")[
  Todo
]

#item("Morgan (lois de)")[
  Todo
]

#item("Signature d'une théorie")[
  Todo
]

#item("Presburger (arithmétique de)")[
  Todo
]

#item("Logique minimale")[
  Todo
]

#item("Logique intuitionniste")[
  Todo
]

#item("Logique classique")[
  Todo
]

#item("Tiers-exclu")[
  Todo
]

#item("Réduction à l'absurde")[
  Todo
]

#item("Substitution")[
  Todo
]

#item("Conséquence logique")[
  Todo
]

#item("Équivalence logique")[
  Todo
]

#item("Structure d'interprétation")[
  Todo
]

#item("Modèle (logique)")[
  Todo
]