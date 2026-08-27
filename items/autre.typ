#import "../template.typ": *

#item("Redondant")[
  Qui se répète.
]

#item("Catalan (nombres de)")[
  Suite intervenant dans des problèmes combinatoires, définie récursivement par :
  $ c_0 = 1 "et" c_(n+1) = sum_(k=0)^n c_k c_(n-k) $
  On peut montrer que $ c_(n+1) = (2(2n+1))/(n+2) c_n $
  Et $ c_n = 1/(n+1) binom(2n, n) $

  #exemple[
    Il y a $c_n$ arbres binaires stricts avec $n$ nœuds internes.
  ]
]

#item("Induction structurelle")[
  Todo
]

// #item("Prédicat")[
//   Todo
// ]

#item("Hamming (nombre de)")[
  Todo
]

#item("Séquence")[
  Collection d'éléments dans laquelle l'ordre et le nombre d'occurences des éléments compte. \
  On notera
  - la séquence $s = (s_0, ..., s_(n-1))$
  - $abs(s) = n$ la longueur de la séquence
  - $abs(s)_x$ le nombre d’occurrences de $x$ dans $s$
  - $s[d:f] = (s_d, ..., s_(f-1))$ les éléments de la séquence de l'indice de début $d$ inclus à l'indice de fin $f$ exclus, avec $0 <= d <= f <= n$.
  - $s[:f] = s[0:f]$ les éléments de la séquence strictement avant l'indice $f$
  - $s[d:] = s[d:n]$ les éléments de la séquence après l'indice $d$
]

#item("Master theorem")[
  Todo :(
]

#item("Karatsuba (algorithme de)")[
  Todo
]

#item("Sac à dos (problème du)")[
  Problème classique NP-complet, consistant à optimiser le remplissage d'un sac à dos.

  On dispose d'un sac à dos dont la charge utile est limitée à $p_"max"$, ainsi que de $n$ objets $a_1, ..., a_n$. Chaque objet est caractérisé par un poids $p_i$ et une valeur $v_i$ positive, le but est de maximiser la valeur contenue dans le sac.

  On peut le résoudre avec de la programmation dynamique ou un algorithme glouton.

  #exemple[
    Calculons la valeur maximale $v_"max"$ par programmation dynamique.\
    Si on pose $f(k, p)$ la valeur optimale obtenue pour les objets $a_1, ..., a_k$ avec un poids $p$, on a:
    - si $k = 0$ on ne peut prendre aucun objet et $ f(0, p) = 0 $
    - si $k > 0$, alors on considère le $k$-ième objet et
      - si $p_k > p$ on ne peut pas le prendre donc $ f(k,p) = f(k-1,p) $
      - si $p_k <= p$, on a le choix de le prendre donc $ f(k, p) = max(f(k-1, p), v_k + f(k-1, p-p_k)) $
    
  On peut donc calculer de cette manière $ v_"max" = f(n, p_"max") $
    
    ```ocaml
    let rec sac_a_dos p v pmax =
      match p, v with
      | [], [] -> 0
      | p_k::p', v_k::v' ->
        if p_k > pmax then sac_a_dos p' v' pmax
        else max
          (sac_a_dos p' v' pmax)
          (v_k + sac_a_dos p' v' (pmax - p_k))
      | _, _ -> failwith "Listes de taille différente"
    ```
  ]
]

#item("Principe d'optimalité")[
  Principe stipulant que dans une suite optimale de décisions ou de choix, tout sous-suite doit aussi être optimale.
]

#item("Euler-Hierholzer (théorème de)")[
  Un graphe connexe non orienté admet
  - un chemin eulérien si et seulement si ses sommets sont tous de degré pair sauf éventuellement un ou deux d'entre eux.
  - un cycle eulérien si et seulement si tous ses sommets sont de degré pair.

  L'algorithme d'Hierholzer permet de trouver un tel chemin.

  /*// Algorithme p683
  // Pas encore prêt
  #code("Algorithme d'Hierholzer")[
    - *Entrée :* un graphe $G = (V, E)$
    - *Sortie :* un chemin eulérien s'il existe
      - *si* $G$ ne possède pas de chemin eulérien *alors*
        - *renvoyer* $()$
      - $"chemin" <- "creer_pile"()$
      - $"pile" <- "creer_pile"()$
      - $"empiler"("pile", "sommet quelconque")$
      - *tant que* $"pile"$ non vide *faire*
        - 
  ]*/
  
]

#item("Fibonacci (suite de)")[
  Suite définie par $ F_(n+2) = F_(n+1) + F_n "où" cases(F_0 = 0, F_1 = 1) $

  #remarque[
    On peut la calculer de manière itérative.
    ```C
    int fibonacci(int n) {
      int* v = malloc((n+1) * sizeof(int));
      v[0] = 0;
      v[1] = 1;

      for (int i = 2; i <= n; i++) {
        v[i] = v[i-1] + v[i-2];
      }

      return v[n];
    }
    ```
  ]
]

#item("Algorithme")[
  Programme fini prenant en entrée une quantité finie (non nécessairement bornée) de données. \
  On considérera que les algorithmes s'exécutent sur un ordinateur idéal disposant d'une quantité illimitée de mémoire, et que la pile d'appel ne déborde jamais. \
  Un algorithme peut
  - renvoyer un résultat en temps fini
  - diverger, c'est-à-dire ne pas renvoyer de résultat quand le programme plante ou ne pas terminer

  #exemple[
    Cet algorithme ne termine pas :
    #code("Algorithme long")[
      - *Entrée : * un entier $n$
      - *Sortie :* $42$ ?
        - $i <- 0$
        - *tant que* $i < 861$ *faire*
          - $i <- (i + n) mod 861$
        - *retourner* 42
      
    ]
  ]
]

#item("Calculable", related: ("Castor affairé"))[
  Fonction $f$ telle qu'il existe un algorithme $A$ terminant en temps fini pour toute entrée valide $x$, en renvoyant $f(x)$. \ On dit que $A$ réalise $f$.

  #remarque[
    Il existe des fonctions $f : NN -> NN$ non calculables. En effet, $NN^NN$ n'est pas dénombrable, tandis que l'ensemble des algorithmes est dénombrable.
  ]
]

#item("Castor affairé")[
  Désigne
  - un programme dont l'exécution termine, calculant une valeur la plus grande possible parmi tous les programmes de même taille. \
  - le problème de décision indécidable défini par
    - *Instance :* le code source d'un programme OCaml (par exemple) $P$
    - *Question :* $P$ est-il un castor affairé ?

  #remarque[
    Vous avez un excellent exercice à ce sujet.
  ]
    
]

#item("Problème de l'arrêt")[
  Problème de décision suivant. \
  - *Instance :* le code source d'un programme $f$ et la description d'un argument $x$ pour ce programme
  - *Question :* est-ce que le programme $f$ s'arrête en temps fini sur l'argument $x$ ?

  #remarque[
    Ce problème est indécidable. On peut considérer la terminaison de ce programme `paradoxe.ml` pour le montrer.
    ```ocaml
    let arret f x = ... (* code source de la fonction arret *)
    let lire_fichier x = ... (* code lisant un fichier *)

    let () =
      let code_source = lire_fichier "paradoxe.ml" in
      if arret code_source "" then (while true do () done)
    ```
  ]
]

#item("Problème décidable", related: ("Problème de l'arrêt"))[
  Un problème de décision est décidable s'il existe un algorithme qui
  - prend en entrée une instant $x$ du problème
  - répond "Oui" en temps fini si $x$ est une instance positive
  - répond "Non" en temps fini si $x$ est une instance négative
  Sinon, le problème est dit indécidable.

  #exemple[
    - Le problème $"SAT"$ est décidable.
    - Le problème de l'arrêt est indécidable.
  ]
]

// #item("Machine de Turing")[
//   Todo
// ]

// #item("Machine universelle")[
//   Todo
// ]

#item("Sémantique")[
  La sémantique d'un algorithme $A$ est la fonction partielle $f : "string" -> "string"$ définie sur les $x$ pour lesquels $A(x)$ termine et alors $ f(x) = A(x) $
]

#item("k-moyennes")[
  Todo
]

#item("Apprentissage non supervisé")[
  Todo
]

#item("Clustering")[
  Todo
]

#item("Lloyd (algorithme de)")[
  Todo
]

#item("Church-Turing (thèse de)")[
  Todo
]

#item("Turing-complétude")[
  Todo
]

// #item("Lambda calcul")[
//   Todo
// ]

#item("Clustering hiérarchique ascendant")[
  Technique d'apprentissage non supervisé, regroupant les objets en classe de manière arborescente.

  #code("Clusterin hiérarchique ascendant")[
    - *Entrée :* un ensemble de $N$ échantillons $x_1 , ..., x_N$ non étiquetés
    - *Sortie :* bonne question
      - créer $N$ classes ${x_1}, ..., {x_N}$
      - *tant que* nécessaire *faire*
        - déterminer $C_i$ et $C_j$ les deux classes les plus proches
        - remplacer $C_i$ et $C_j$ par $"Fusion"(C_i , C_j)$
  ]

  Pour calculer la distance entre deux classes à partir d'une distance $d$ entre les échantillons, on peut utiliser plusieurs liaisons.

  #table(
    columns: (auto, 1fr),
    [*Nom*], [*$ "Distance" delta(C, C') $*],
    [Liaison simple], [$ min(d(x, y), (x, y) in C times C') $],
    [Liaison complète], [$ max(d(x,y), (x, y) in C times C') $],
    [Liaison Hausdorff], [$ max_(x in C union C') min_(y in C union C') d(x, y) $],
    [Liaison moyenne], [$ 1/(abs(C) dot abs(C')) sum_(x in C, y in C') d(x, y) $],
    [Liaison barycentrique], [$ d(x_C, x_(C')) \ "où" x_C, x_(C') "isobarycentres" $]
  )

  On appelle dendrogramme le diagramme représentant les regroupements hiérarchiques successifs effectués.

  // à faire dendrogramme
]

#item("Hausdorff (liaison)")[
  Todo
]

#item("Matrice de confusion")[
  Todo
]

#item("Problème de coloriage")[
  Todo
]

#item("Nombre chromatique")[
  Le nombre chromatique d'un graphe $G$ est l'entier $k$ le plus petit tel que $G$ soit $k$-coloriable.
]

#item("ID3")[
  Todo
]

#item("Shannon (entropie de)")[
  Todo
]

#item("Apprentissage")[
  Todo
]

#item("Manhattan (distance de)")[
  Todo
]

#item("k plus proches voisins")[
  Todo
]

#item("Classification")[
  Todo
]

#item("Régression")[
  Todo
]

#item("Modèle de calcul non déterministe")[
  Todo
]

#item("Carmichael (nombre de)")[
  Todo
]

#item("Barrière d'abstraction")[
  Todo
]

#item("Chaîne eulérienne")[
  Chemin d'un graphe parcourant chaque arête du graphe une unique fois.
]

#item("Cycle eulérien")[
  Cycle d'un graphe parcourant chaque arête du graphe exactement une fois.
]