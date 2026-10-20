#import "../template.typ": *

#item("Relation")[
  Une relation entre deux ensembles $E$ et $F$ est une partie $Gamma$ de $E times F$. Deux éléments $(x, y) in E times F$ sont en relation si $(x, y)$ appartient à $Gamma$.

  Dans le cas $E = F$, on parle simplement de relation sur $E$.

  #exemple[
    L'égalité modulo 861 est une relation sur $ZZ$, avec $ Gamma = { (a, a + 861k) thick | thick a, k in ZZ } $
  ]
]

#item("Relation transitive")[
  Relation sur $E$ où une suite de relations entre plusieurs éléments aboutie à une relation entre le premier et le dernier élément : 
  $ forall x, y, z in E quad (x cal(R) y) and (y cal(R) z) ==> x cal(R) z $
  C'est-à-dire :
  $ forall x, y, z in E quad (x, y) in E and (y, z) in Gamma ==> (x, z) in Gamma $

  #exemple[
    L'inclusion, et l'inégalité stricte sur $NN$ sont des relations transitives.
  ]
]

#item("Transitif", related: ("Relation transitive",))[
  Se dit d’une relation qui s’appliquant d’un premier élément à un second et du second à un troisième, s’applique également du premier au troisième.
]

#item("Relation réflexive")[
  Relation sur $E$ où tout élément est en relation avec lui-même :
  $ forall x in E quad x cal(R) x $
  Ou encore si :
  $ forall x in E quad (x, x) in Gamma $

  #exemple[
    L'égalité est une relation réflexive.
  ]
]


#item("Relation antisymétrique")[
  Relation sur $E$ où deux éléments en relation l'un avec l'autre sont égaux :
  $ forall x, y in E quad (x cal(R) y) and (y cal(R) x) ==> x = y $
  C'est-à-dire :
  $ forall x, y in E quad (x, y) in Gamma and (y, x) in Gamma ==> x = y $

  #exemple[
    La relation de supériorité sur $NN$ est antisymétrique.
  ]
]

#item("Relation symétrique")[
  Relation sur $E$ où deux éléments sont soit tous deux en relation avec l'autre, soit tout deux non en relation avec l'autre :
  $ forall x, y in E quad x cal(R) y <==> y cal(R) x $
  Cela revient à :
  $ forall x in E quad (x, y) in Gamma <==> (y, x) in Gamma $

  #exemple[
    L'égalité et la différence sont des relations symétriques.
  ]
]

#item("Relation asymétrique")[
  Relation sur $E$ où deux éléments ne peuvent pas être mutuellement en relation :
  $ forall x, y in E quad x cal(R) y ==> not (y cal(R) x) $
  Ou encore :
  $ forall x, y in E quad (x, y) in Gamma ==> (y, x) in.not Gamma $

  #exemple[
    La relation de supériorité stricte sur $NN$ est antisymétrique.
  ]
]

#item("Relation d'équivalence")[
  Relation réflexive, transitive et symétrique.

  #exemple[
    L'égalité est une relation d'équivalence.
  ]
]

#item("Classe d'équivalence")[
  Pour une relation d'équivalence $tilde$, la classe d'équivalence d'un élément $x in E$ est l'ensemble des éléments en relation avec $x$ :
  $ "Cl"(x) = [x] = {y in E thick | thick x tilde y} $

  #exemple[
    Dans un graphe non orienté, pour la relation "être accessible depuis", la classe d'équivalence d'un sommet est sa composante connexe.
  ]
]

#item("Préordre")[
  Relation réflexive et transitive.
]

#item("Relation d'ordre")[
  Relation réflexive, transitive et antisymétrique.
]

#item("Ordre bien fondé")[
  Ordre sur un ensemble $E$ pour lequel toute partie non vide admet un élément minimal.

  Cela équivaut à l’absence de suites infinis strictement décroissantes.

  #exemple[
    La relation d'inclusion sur les parties finies de $NN$ est bien fondée, ce n'est pas le cas de la relation de supériorité sur $NN$.
  ]
]

#item("Bon ordre")[
  Ordre sur un ensemble $E$ pour lequel toute partie non vide admet un minimum.

  #exemple[
    La relation d'infériorité est un bon ordre sur $NN$ et $NN^*$ mais pas sur $ZZ$.
  ]
]

#item("Ordre total")[
  Un ordre $<=$ sur $E$ est total lorsque tous les éléments sont comparables :
  $ forall x, y in E quad (x <= y) or (y <= x) $
]

#item("Ordre partiel")[
  Un ordre $<=$ sur $E$ est partiel lorsqu'il existe au moins une paire d'éléments non comparables : 
  $ exists (x, y) in E quad (x lt.eq.not y) and (y lt.eq.not x) $
]

#item("Minimum")[
  Plus petit élément d'un ensemble préordonné,  $x in E$ est un minimum de $(E, <=)$ si et seulement si :
  $ forall y in E, quad x <= y $
]

#item("Élément minimal")[
  Élément tel qu'aucun élément ne lui est inférieur, $x in E $ est un élément minimal de $(E, <=)$ si et seulement si :
  $ forall y in E, quad y <= x ==> x = y $
]

#item("Ensemble préordonné")[
  Ensemble $E$ muni d'un préordre $<=$, on le note $(E, <=)$.
]

#item("Paire")[
  Ensemble de cardinal égal à deux.

  #exemple[
    ${8,6}$ et ${6, 1}$ sont des paires. ${8, 6, 1}$ n'en est pas une.
  ]
]

#item("Multi-ensemble")[
  Collection d'objet dans lequel l'ordre des éléments n'a pas d'importance mais le nombre d’occurrences compte. \
  On le note $ "ms"(x_1,..., x_n) $
]

#item("Permutation")[
  Todo + comment les générer de manière équiprobable ?
]

#item("Ordre lexicographique")[
  Ordre sur des suites finies d'un produit cartésien d'ensembles ordonnés. Il s'agit en quelque sorte de l'ordre du dictionnaire : avec $(E_1, <), ..., (E_p, <)$ des ensembles ordonnés, l'ordre lexicographique sur $E_1 times dot dot dot times E_p$ est défini par $ (a_1, ..., a_p) < (b_1, ..., b_p) \ <=> \ exists k in [|1, p|], forall i < k, a_i = b_i "et" a_k < b_k $
  
  L'ordre lexicographique sur $E_1 times  dot dot dot times E_p$ est bien fondé.

  #exemple[
    L'ordre lexicographique sur $NN^p$, ou bien sur ${a, b, ..., z}^10$.
  ]

  #remarque[
    On peut l'utiliser pour prouver la terminaison de boucles imbriquées, avec des variants de boucle sur $NN^p$.
  ]
]

// Todo : Ordre strict