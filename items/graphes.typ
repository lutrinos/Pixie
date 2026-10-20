#import "../template.typ": *
#import fletcher.shapes: diamond

#item("Graphe")[
  Un graphe $G$ est un couple $(V, E)$ où
  - $V$ est un ensemble non vide dont les éléments sont appelés sommets du graphe
  - $E$ est un ensemble de paires ${x, y}$ où $x$ et $y$ sont des éléments de $V$ avec $x != y$. Ces paires sont les arêtes du graphe.

  //Exemple de fletcher
  #let nodes = ("A", "B", "C", "D", "E", "F", "G")
  #let edges = (
  	(3, 2),
  	(4, 1),
  	(0, 4),
  	(3, 0),
  	(5, 6),
  )
  
  #figure(
    diagram({
      	for (i, n) in nodes.enumerate() {
      		let θ = 90deg - i*360deg/nodes.len()
      		node((θ, 14mm), n, stroke: 0.5pt, name: str(i))
      	}
      	for (from, to) in edges {
      		let bend = if (to, from) in edges { 10deg } else { 0deg }
      		// refer to nodes by label, e.g., <1>
      		edge(label(str(from)), label(str(to)), "-", bend: bend)
      	}
    }),
    caption: [Exemple de graphe]
  )

  #remarque[
    - Intuitivement, une arête ${x,y}$ permet de passer de $x$ à $y$, et de $y$ à $x$.
    - On peut autoriser l'existence d'arête n'étant pas une paire mais un singleton, qu'on appelle alors boucle.
    - On notera souvent $x y$ au lieu de ${x, y}$ (on a alors $x y = y x$).
    - Deux sommets $x$ et $y$ reliés pas une arête $e = {x, y}$ sont dits adjacents. On dit alors que $e$ est incidente à $x$ et $y$.
    - Ceci est la définition d'un graphe non orienté. Pour un graphe orienté, on ne considère plus des paires mais des 2-uplets, où l'ordre a une importance et l'on parle alors d'arcs. Quand on parle d'un graphe tout court, on sous-entend souvent qu'il est non-orienté.
  ]

  #exemple[
    Le graphe d'une carte ferroviaire a un sommet pour chaque gare, et une arête pour chaque voie ferrée reliant deux gares. Si toutes ces voies peuvent s'emprunter dans les deux sens, alors ce graphe est non-orienté. Dans le cas contraire, il est orienté.
  ]
]

#item("Graphe orienté")[
  Un graphe orienté $G$ est un couple $(V, E)$ où
  - $V$ est un ensemble non vide dont les éléments sont appelés sommets du graphe
  - $E$ est un ensemble de couples $(x, y)$ où $x$ et $y$ sont des éléments de $V$ avec éventuellement $x != y$. Ces couples sont les arcs (parfois appelées arêtes) du graphe.

  #remarque[
    - Intuitivement, un arc $(x, y)$ permet de passer de $x$ à $y$, et non de $y$ à $x$. On écrira souvent $x arrow y$.
    - On peut considérer les graphes non orientés comme des cas particuliers de graphes orientés, vérifiant $ forall (x, y) in E, (y, x) in E $
    - S'il y a un arc $x arrow y$, on dira que $x$ est un prédécesseur de $y$, et que $y$ est un successeur de $x$.
  ]
]

#item("Graphe complet")[
  Le graphe complet $K_n$ possède $n$ sommets avec une arête entre chaque paire de sommets.

  #figure(caption: [Quelques graphes complets])[
    #grid(
      columns: 6, 
      rows: 2, 
      column-gutter: 30pt, 
      row-gutter: 10pt,
      align: center + bottom,
      ..range(1, 7).map(n => {
        diagram({
          // Noeuds
          for i in range(1, n + 1) {
            let theta = (if n == 2 {0deg} else if n == 4 {45deg} else {90deg}) - i * 360deg / n
            node((theta, 6mm), "", stroke: 0.5pt, name: str(i + 10 * n), radius: 1.5pt, fill: black)
          }
  
          // Arêtes
          for i in range(1, n + 1) {
            for j in range(1, i) {
              edge(label(str(i + 10 * n)), label(str(j + 10 * n)))
            }
          }
        })
      }),
      ..range(1, 7).map(n => $K_#n$)
    )
  ]

  #remarque[
    Pour $n >= 5$, $K_n$n'est pas planaire.
  ]
]


#item("Graphe chemin")[
  Le graphe chemin $P_n$ possède $n$ sommets numérotés $0$, ..., $n-1$ et une arête entre les sommets $i$ et $j$ si et seulement si $i = j + 1$.

  #figure(
    grid(
      columns: 4, 
      rows: 2, 
      column-gutter: 30pt, 
      row-gutter: 10pt,
      align: center + bottom,
      ..range(1, 5).map(n => {
        diagram({
          for i in range(1, n  + 1) {
            node(
              (i * 1.5 / n, 0),
              radius: 1.5pt,
              fill: black
            )

            if i < n {
              edge("-")
            }
          }
        })
      }),
      ..range(1, 5).map(n => $P_#n$)
    ),
    caption: [Quelques graphes chemins]
  )
]

#item("Graphe cycle")[
  Le graphe cycle $C_n$, avec $n >= 3$, possède $n$ sommets numérotés $0$, ..., $n-1$ et une arête entre $i$ et $j$ si et seulement si $i = j + 1 mod n$.

  #figure(caption: [Quelques graphes cycles])[
    #grid(
      columns: 4, 
      rows: 2, 
      column-gutter: 30pt, 
      row-gutter: 10pt,
      align: center + bottom,
      ..range(3, 7).map(n => {
        diagram({
          // Noeuds
          for i in range(1, n + 1) {
            let theta = (if n == 2 {0deg} else if n == 4 {45deg} else {90deg}) - i * 360deg / n
            node((theta, 6mm), "", stroke: 0.5pt, name: str(i + 10 * n), radius: 1.5pt, fill: black)
          }
  
          // Arêtes
          for i in range(1, n) {
            edge(label(str(i + 10 * n)), label(str(i + 1 + 10 * n)))
          }
          edge(label(str(11 * n)), label(str(1 + 10 * n)))
        })
      }),
      ..range(3, 7).map(n => $C_#n$)
    )
  ]
]

#item("Graphe biparti complet")[
  Le graphe biparti complet $K_(n,p)$ possède $n + p$ sommets, dont $n$ noirs et $p$ blancs, et une arête entre chacun des sommets noirs et chacun des sommets blancs.
  
  #figure(caption: [Quelques graphes bipartis complets])[
    #let bipartis = ((2, 2), (2, 3), (3, 3))
    #grid(
      columns: 3, 
      rows: 2, 
      column-gutter: 35pt, 
      row-gutter: 10pt,
      align: center + bottom,
      ..bipartis.map(biparti => {
        diagram({
          let n = biparti.at(0)
          let k = biparti.at(1)
  
          let draw-line(n, y, len, id, col) = { // n >= 2
            let start = - len / 2
            let step = (len) / (n - 1)
  
            for i in range(n) {
              node((start + i * step, y), "", radius: 4pt,stroke: 1pt, fill: col, name: str(i + 10 * id))
            }
          }
          
          draw-line(n, 0cm, n * 0.7cm, 0, white)
          draw-line(k, -1cm, k * 0.7cm, 1, black)

          for i in range(n) {
            for j in range(k) {
              edge(label(str(i)), label(str(j + 10)), stroke: 0.5pt)
            }
          }
        })
      }),
      // bipartis.map(n => {
      //   diagram({
      //     // Noeuds
      //     for i in range(1, n + 1) {
      //       let theta = (if n == 2 {0deg} else if n == 4 {45deg} else {90deg}) - i * 360deg / n
      //       node((theta, 6mm), "", stroke: 0.5pt, name: str(i + 10 * n), radius: 1.5pt, fill: black)
      //     }
  
      //     // Arêtes
      //     for i in range(1, n) {
      //       edge(label(str(i + 10 * n)), label(str(i + 1 + 10 * n)))
      //     }
      //     edge(label(str(11 * n)), label(str(1 + 10 * n)))
      //   })
      // }),
      ..bipartis.map(biparti => $K_(#biparti.at(0), #biparti.at(1))$),
      
    )
  ]
]

#item("Graphe de flot de contrôle")[
  Graphe représentant les chemins pouvant être suivi par un programme durant son exécution.\
  On l'abrège parfois par CFG pour _control flow graph_.

  #exemple[    
    ```C
    int i = 0;
    while (i <= 10) {
      printf("Étape %d\n", i);
      if (i <= 5) {
        i += 2; 
      } else {
        i++;
      }
    }
    printf("Enfin terminé \n");
    ```

    Le programme écrit ci-dessus en C donne le graphe de flot de contrôle ci-desous.

    #figure(
      diagram(
        spacing: (14pt, 16pt),
        node-stroke: 1pt,
        node((0,0), [`int i = 0;`], corner-radius: 2pt),
        edge("-|>"),
        node((0,1), align(center)[
         `if (i <= 10)`
       ], shape: diamond),
        edge("d", "-|>", [Oui]),
       edge("r,b,b,b,b,b,l", "-|>", [Non], label-pos: 0.1),
       node((0, 6), [`printf("Enfin terminé \n");`], corner-radius: 2pt),
       node((0, 2), [`printf("Étape %d\n", i);`], corner-radius: 2pt),
        edge("-|>"),
       node((0, 3), align(center)[
         `if (i <= 5)`
       ], shape: diamond),
        edge("d", "-|>", [Oui]),
       edge("l", "-|>", [Non]),
       node((-1, 3), [`i++;`], corner-radius: 2pt),
       edge("l,u,u,r,r", "-|>"),
       node((0, 4), [`i += 2;`], corner-radius: 2pt),
       edge("d,l,l,u,u", "-")
      ),
      caption: [Exemple de graphe de flot de contrôle]
    )
  ]
]

#item("Graphe intervalle")[
  Todo.
]

#item("Chemin simple")[
  Chemin n'utilisant pas deux fois la même arête. $x_0, ..., x_n$ est un tel chemin si les ${x_i, x_(i+1)}$ sont distincts.
]

#item("Chemin élémentaire")[
  Chemin n'utilisant pas deux fois le même sommet. $x_0, ..., x_n$ est un tel chemin si les $x_i$ sont distincts.
]

#item("Cycle")[
  Chemin simple non réduit à un sommet, dont le premier et le dernier sommet sont confondus.
]

#item("Acyclique")[
  Un graphe $G = (V, E)$ est dit acyclique s'il ne contient aucun cycle.
]

// Todo
//  - condition d'acyclicité (parcours, pas de sommet ouvert)

#item("Arbre", related: ("Graphe",))[
  - Graphe acyclique et connexe. #figure(
    diagram({
      let edges = (
      	(0, 2),
       (2, 3),
       (2, 1),
       (0, 5),
       (5, 4),
       (5, 6),
       (6, 7),
       (0, 10),
       (10, 11),
       (10, 9),
       (10, 8)
      )

      	for i in range(0, 12) {
      		let θ = 90deg - i*360deg/11
          let radius = if i == 0 { 0mm } else { 14mm }
      		node((θ, radius), "", fill: black, radius: 2pt, stroke: 0.5pt, name: str(i))
      	}
       
      	for (from, to) in edges {
      		let bend = if (to, from) in edges { 10deg } else { 0deg }
      		// refer to nodes by label, e.g., <1>
      		edge(label(str(from)), label(str(to)), "-", bend: bend)
      	}
    }),
    caption: [Arbre]
  )
  - Structure de données informatique, ensemble de nœuds qui ont chacun tout au plus un seul ancêtre chacun et un nombre quelconque de descendants.
  - Ensemble fini $A$ muni d'une relation binaire $->$ telle que
    - il existe un unique élément $r$ (la racine) vérifiant $ forall x in A, x arrow.not r $
    - pour tout élément $x$ de $A$, il existe un unique père : $ forall x in A without {r}, exists ! y in A, y -> x $
    - tout élément $x in A without {r}$ est relié à la racine : $ forall x in A without {r}, exists n in NN, x_1, ..., x_n in A, r -> x_1 -> ... -> x $
  - Végétal haut de plus de 7 mètres, dont la tige, appelée fût ou tronc, ne se garnit de branches et de feuilles qu’à une certaine hauteur. La partie constituée par les branches et les feuilles s’appelle houppier. #figure(
    image("../figures/arbre-nature.jpg", height: 80pt),
    caption: [Arbre dans la nature]
  )
  
]

#item("Forêt")[
  Graphe acyclique. Un graphe est une forêt si et seulement si chacune de ses composantes connexes est un arbre.
]

#item("Arbre couvrant", related: ("Kruskal (algorithme de)"))[
  Soit $G = (V, E)$ un graphe. Un arbre couvrant de $G$ est un sous-graphe $H = (V_H, E_H)$ de $G$ tel que :
  - $H$ est un arbre
  - $V_H = V$

  #remarque[
    Tout graphe connexe possède un arbre couvrant.

    #code("Construction d'un arbre couvrant")[
      - *Entrées :* un graphe connexe $G = (V, E)$
      - *Sorties :* un arbre couvrant $T$ de $G$
        - $T <- (V, E)$
        - *pour* $x y in E$ *faire*
          - *si* $T - x y$ est connexe *alors*
            - $T <- T - x y$
        - *renvoyer* $T$
    ]

    Ceci est une des algorithmes possibles, voir l'algorithme de Kruskal pour une autre proposition.
  ]
]

#item("Arbre couvrant minimal", related: ("Kruskal (algorithme de)",))[
  Soit $H$ un sous-graphe de $G$. $H$ est un arbre couvrant minimal de $G$ si $rho(H)$ est minimal parmi les poids des arbres couvrants de $G$.  
]


#item("Kruskal (algorithme de)", related: ("Composante connexe",))[
  Algorithme calculant un arbre couvrant minimal d'un graphe connexe.
  
  #code("Algorithme de Kruskal")[
    - *Entrées :* un graphe connexe $G = (V, E)$
    - *Sorties :* un arbre couvrant $T$ de $G$
      - $T <- (V, emptyset)$
      - *pour* $x y in E$, dans l'ordre *faire*
        - *si* $C_T(x) != C_T(y)$ *alors*
          - $T <- T + x y$
      - *renvoyer* $T$
  ]

  #remarque[
    Pour prouver la correction de cet algorithme, montrer que peu importe les choix faits lors des $i$ premiers tours de boucle, le graphe acyclique obtenu peut être complété de manière à obtenir un arbre couvrant minimal.
  ]
]

#item("Matrice d'adjacence")[
  La matrice d'adjacence d'un graphe $G = (V, E)$ où $V = { x_1, ..., x_n }$ est la matrice $M = (m_(i,j)) in cal(M)_n$  définie par
  $ m_(i,j) = cases(1 "si il y a une arête de" x_i "vers" x_j, 0 "sinon") $

  #figure(
    caption: [Matrice d'adjacence d'un graphe orienté],
  )[
    #grid(
      columns: 2,
      column-gutter: 40pt,
      align: center + horizon
    )[
      #let nodes = (1, 2, 3, 4)
      #let edges = (
        (1, 2), (1, 4),
        (2, 1),
        (3, 1), (3, 4),
      )

      #diagram({
        for i in nodes {
          let theta = 225deg - i * 360deg / nodes.len()
          node((theta, 9mm), str(i), stroke: 0.5pt, name: str(i), radius: 8pt)
        }

        for (from, to) in edges {
          let bend = if (to, from) in edges {15deg} else {0deg}
          edge(label(str(from)), label(str(to)), "-|>", bend: bend)
        }
      })
    ][
      $
      mat(
        0, 1, 0, 1;
        1, 0, 0, 0;
        1, 0, 0, 1;
        0, 0, 0, 0
      )
      $
    ]
  ]

  #figure(
    caption: [Matrice d'adjacence d'un graphe non orienté],
  )[
    #grid(
      columns: 2,
      column-gutter: 40pt,
      align: center + horizon
    )[
      #let nodes = (1, 2, 3, 4, 5)
      #let edges = ((1, 2), (2, 4), (5, 2), (4, 3))

      #diagram({
        for i in nodes {
          let theta = 225deg - i * 360deg / nodes.len()
          node((theta, 9mm), str(i), stroke: 0.5pt, name: str(i), radius: 8pt)
        }

        for (from, to) in edges {
          edge(label(str(from)), label(str(to)))
        }
      })
    ][
      $
      mat(
        0, 1, 0, 0, 0;
        1, 0, 0, 1, 1;
        0, 0, 0, 1, 0;
        0, 1, 1, 0, 0;
        0, 1, 0, 0, 0
      )
      $
    ]
  ]

  #remarque[
    - $M$ est symétrique si et seulement si le graphe est non orienté.
    - Si on interdit les boucles, il n'y a que des zéros sur la diagonale.
  ]
]

#item("Degré d'un nœud")[
  Dans un graphe non orienté, le degré d'un sommet $x$ noté $"deg"(x)$ est le nombre d'arêtes incidentes à $x$ (de la forme ${x, y}$). \
  Dans un graphe orienté, on distingue
  - le degré entrant noté $d_- (x)$ le nombre d'arcs où $x$ est le successeur (de la forme $(y, x)$)
  - le degré sortant noté $d_+ (x)$ le nombre d'arcs où $x$ est le prédécesseur (de la forme $(x, y)$)
  - le degré total noté $"deg"(x)$ la somme de son degré entrant et de son degré sortant

  #remarque[
    - Dans un graphe non orienté sans boucle, le degré d'un nœud est son nombre de voisins.
    - Le degré sortant d’un sommet s’obtient en sommant la ligne correspondante de la matrice d’adjacence, le degré entrant en sommant la colonne.
    - Dans un graphe orienté $G = (V, E)$, on a $ |E| <= |V| dot (|V|-1) $
    - Dans un graphe non orienté, $ |E| <= (|V| dot (|V|-1))/2 $
  ]

  #exemple[
    Dans un graphe cycle, le degré de tous les sommets vaut deux. \ Dans un graphe complet $K_n$, le degré de tous les sommets vaut $n - 1$.
  ]
]

#item("Graphe creux", related: ("Degré d'un nœud",))[
  Graphe dans lequel le nombre d'arêtes est faible, c'est-à-dire vérifie $ (|E|) / (|V|^2) << 1 $
]

#item("Graphe dense", related: ("Degré d'un nœud",))[
  Graphe dans lequel le nombre d'arêtes est grand, avec par exemple
  $(|E|)/(|V|^2)$ proche de $1/2$ ou $1$ selon que le graphe soit orienté ou non orienté respectivement. \
  C'est-à-dire que le nombre d'arêtes s'approche du nombre maximal d'arêtes (voir #link(label("degre-d-un-nœud"))[Degré d'un nœud]).
]

#item("Sous-graphe", related: ("Graphe",))[
  Un sous-graphe d'un graphe $G = (V, E)$ est le graphe $G' = (V', E')$ défini par
  - $V' subset V$
  - $E' subset E$, et également $E' subset V'^2$ (définition d'un graphe)

  #remarque[
    Intuitivement, un sous-graphe de G est un sous-ensemble des sommets de $G$ et une partie des arêtes reliant ces sommets entre eux.
  ]
]

#item("Sous-graphe induit")[
  Un sous-graphe induit de $G = (V, E)$ est un sous-graphe $G' = (V', E')$ de $G$ tel que $E'$ est exactement l'ensemble des arêtes de $G$ reliant deux sommets de $V'$.

  #remarque[
    Intuitivement, un sous-graphe induit de G est un sous-ensemble des sommets de $G$ et toutes les arêtes reliant ces sommets entre eux.
  ]
]

#item("Poids d'un sous-graphe")[
  Si $H$ est un sous-graphe de $G$, le poids de $H$, noté $rho(H)$, est la somme des poids des arêtes de $H$.
]

#item("Composante connexe")[
  - Une composante connexe d'un graphe non orienté est un sous-graphe connexe ne faisant partie d'aucun sous-graphe connexe plus grand.
  - Dans un graphe non orienté, la relation $tilde$ définie par $ x tilde y <=> "il existe un chemin entre" x "et" y $ est une relation d'équivalence, et les composantes connexes sont les sous-graphes induit par les classes d'équivalence de la relation $tilde$.

  #remarque[
    Intuitivement, une composante connexe d'un graphe $G$ peut être représentée par un des sommets $x$ de $G$, et regroupe alors tous les sommets $y$ de $G$ pour lesquels il existe un chemin allant de $x$ vers $y$. \ Un simple parcours du graphe permet d'obtenir ses composantes connexes.

    #code("Calcul des composantes connexes")[
      - *Entrée :* un graphe $G = (V, E)$
      - *Sortie :* une liste de composantes $C_1, ..., C_k$
        - $"vus" <- emptyset$
        - $"composantes" <- ()$
        - *fonction* Ajouter$(x, C)$
          - *si* $x in.not "vus"$ *alors*
            - $"vus" <- "vus" union {x}$
            - *pour* $y$ voisin de $x$ *faire*
              - Ajouter$(y, C)$
            - $C <- C, x$
        - *pour* $x in V$ *faire*
          - *si* $x in.not "vus"$ *faire*
            - $C <- ()$
            - Ajouter$(x,C)$
            - $"composantes" <- C, "composantes"$
        - *retourner* $"composantes"$
    ]
  ]
]

#item("Composante fortement connexe", related: ("Kosaraju (algorithme de)"))[
  La relation $tilde$ définie sur les sommets d'un graphe orienté $G$ par $ x tilde y <=> (x "accessible depuis" y "et" y "accessible depuis" x) $ est une relation d'équivalence. 
  Les graphes induits par ses classes d'équivalence sont appelées les composantes fortement connexe de $G$.

  #remarque[
    On utilise l'abréviation CFC pour _composante fortement connexe_, éventuellement SCC pour _strongly connected component_.
  ]
]

#item("Kosaraju (algorithme de)")[
  Algorithme calculant les composantes fortement connexes d'un graphe orienté.
  // Todo
]

#item("Ordre topologique")[
  Un ordre topologique sur un graphe orienté $G$ est un ordre total sur les sommets de $G$ tel que, s'il y a un arc de $u$ vers $v$, alors $u prec v$ (au sens strict).
]

#item("Graphe connexe")[
  Un graphe non orienté $G$ est dit connexe si pour tous sommets $u$ et $v$ de $G$, il existe un chemin entre $u$ et $v$.
]

#item("Graphe fortement connexe", related: ("Composante fortement connexe"))[
  Un graphe orienté $G$ est dit fortement connexe si, pour tout couple de sommets  $(u, v)$ de $G$, il existe un chemin de $u$ vers $v$.
]

#item("Arête")[
  - Dans un graphe non orienté, paire de deux sommets ${x, y}$ avec $x != y$ si on n'autorise pas la présence de boucle.
  - Dans un graphe orienté, 2-uplet de deux sommets $(x,y)$ avec $x!= y$ si on n'autorise pas la présence de boucle.
]

#item("Incident")[
  Une arête est incidente à deux sommets si elle relie ces deux sommets.
]

#item("Nœud")[
  Dans un arbre, un nœud est un sommet.
]

#item("Nœud interne")[
  Nœud n'étant pas une feuille, d'arité non nulle.
]

#item("Sommet")[
  Dans un graphe $G = (V, E)$, un sommet est un élément de $V$.
]

#item("Étiquette")[
  Donnée associée au nœud d'un arbre.
]

#item("Arité")[
  L'arité d'un nœud d'un arbre est son nombre de fils.
]

#item("Feuille")[
  Dans un arbre, nœud d'arité nulle, c'est-à-dire n'ayant pas d'enfant.
]

#item("Racine")[
  Dans un arbre, nœud initial n'ayant pas de père.
]

#item("Ancêtres d'un nœud")[
  Dans un arbre, tous les nœuds hiérarchiquement supérieur à ce nœud.
]

#item("Frères")[
  Enfants d'un même père.
]

#item("Profondeur d'un nœud")[
  Longueur du chemin reliant la racine à ce nœud. Cela revient à compter le nombre d'ancêtres de ce nœud.
]

#item("Hauteur d'un arbre")[
  Profondeur maximale d'une feuille de l'arbre.
]

#item("Taille d'un arbre")[
  Nombre total de nœuds de cet arbre.
]

#item("Arbre binaire")[
  Arbre dans lequel chaque nœud a au plus deux fils. \
  On le définit inductivement par
  - arbre vide + N(x, g, d) Todo

  #exemple[
    En OCaml son type est le suivant.
    ```ocaml
    type 'a arbre =
      | V
      | N of 'a * 'a arbre * 'a arbre
    ```
    En C définit le type comme ci-dessous.
    ```C
    struct arbre {
      int etiquette;
      struct arbre* g;
      struct arbre* d;
    }
    typedef struct arbre arbre;
    ```
  ]
]

#item("Arbre binaire strict")[
  Arbre dont tous les nœuds possèdent zéro ou deux fils.

  #remarque[
    - Un arbre binaire strict de hauteur $h$ a au moins $2h+1$ nœud (cas particulier d'un peigne). 
  ]
]

#item("Arbre binaire parfait")[
  Arbre binaire strict dans lequel toutes les feuilles sont à la même distance de la racine. \
  Autrement dit, c'est un arbre qui est
  - soit une feuille
  - soit de la forme $N(x, g, d)$ où $g$ et $d$ sont des arbres binaires parfaits de même hauteur
]

#item("Arbre binaire complet")[
  Todo
]

#item("Arbre binaire de recherche")[
  Aussi appelé ABR. Todo
]

#item("Arbre rouge-noir")[
  Aussi appelé arbre bicolor. Todo
]

#item("Rotation droite (arbre rouge-noir)")[
  Todo
]

#item("Bascule (arbre rouge-noir)")[
  Todo
]

#item("Insertion (arbre rouge-noir)")[
  Todo
]

#item("Arbre 2-3")[
  Todo
]

#item("Parcours de graphe")[
  Todo
]

#item("Parcours préfixe")[
  Todo
]

#item("Parcours infixe")[
  Todo
]

#item("Parcours suffixe")[
  Todo
]

#item("Parcours en largeur")[
  Todo
]

#item("Parcours en profondeur")[
  Todo
]

#item("Arbre de décision")[
  Todo
]

#item("Graphe eulérien")[
  Graphe dans lequel il existe un cycle eulérien.
]

#item("Graphe semi-eulérien")[
  Graphe dans lequel il existe un chemin eulérien.
]

#item("Graphe hamiltonien")[
  Todo
]

#item("Graphe semi-hamiltonien")[
  Todo
]

#item("Ordre d'un graphe")[
  Nombre de sommets de ce graphe.
]

#item("Graphe pondéré")[
  Un graphe pondéré est un couple $G = (V, E, rho)$ tel que
  - $(V, E)$  soit un graphe, orienté ou non
  - $rho : E -> RR$ associe à chaque arête ou arc un poids

  $rho$ représente souvent une distance ou un temps, auquel cas $rho$ est à valeurs positives.
]

#item("Graphes isomorphes")[
  Todo
]

#item("Distance (graphe)")[
  Dans un graphe, la distance entre deux sommets $a$ et $b$ est la plus petite des longueurs des chemins reliant $a$ et $b$. \
  Par convention, cette distance vaut $infinity$ si $a$ et $b$ ne sont reliés par aucun chemin.

  #remarque[
    La longueur d'un chemin est
    - son nombre d'arêtes si le graphe est non pondéré
    - la somme des poids des arêtes du chemin si le graphe est pondéré
  ]
]

#item("Arbre enraciné")[
  Todo
]

#item("Graphe orienté acyclique")[
  Todo
]

#item("Tri topologique")[
  Todo
]

#item("Floyd-Warshall (algorithme de)")[
  Todo
]

#item("Dijkstra (algorithme de)")[
  Todo
]

#item("Clique")[
  Sous-graphe complet.
  Todo
]

#item("Sommet source")[
  Todo (ou racine)
]

#item("Sommet puits")[
  Todo (ou feuille)
]

#item("Couplage")[
  Todo
]

#item("Chemin alternant")[
  Soit $G = (V, E)$ un graphe non orienté et $C$ un couplage  de $G$. Un chemin alternant pour $C$ est un chemin élémentaire dont les arêtes sont alternativement dans $C$ et dans $E without C$
]

#item("Chemin augmentant")[
  Soit $G = (V, E)$ un graphe non orienté et $C$ un couplage  de $G$. Un chemin augmentant pour $C$ est un chemin alternant dont les deux extrémités sont libres pour $C$.
]

#item("Arbre associé à un code préfixe")[
  Todo
]

#item("A* (algorithme de)")[
  Todo
]

#item("Berge (lemme de)")[
  Todo
]

#item("Arbre syntaxique")[
  Todo
]

#item("Notation à plat")[
  Todo
]

#item("Arbre binaire LCRS")[
  Todo
]

#item("Arbre tournoi")[
  Todo
]

#item("Graphe planaire")[
  Todo
]

#item("Bellman-Ford (algorithme de)")[
  Algorithme de recherche d'un plus court chemin dans un graphe pondéré.

  #code("Algorithme de Bellman-Ford")[
    - *Entrée :* un graphe $G = (V, E)$
    - *Sortie :* 
  ]
]