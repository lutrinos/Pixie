#import "../template.typ": *

#item("UnionFind")[
  Structure de données représentant une partition finie $X = X_1 union.sq ... union.sq X_(k)$ où l'on peut :
  - Créer une nouvelle partition en singleton ($bracket.l.stroked 0; n - 1bracket.r.stroked = {0} union.sq ... union.sq {n - 1}$).
  - Trouver à quelle classe appartient un élément $x$ de $X$.
  - Fusionner deux classes en une seule au sein de la partition.

  On note $X(x)$ la classe contenant $x$.

  #implementation[
    On utilise une forêt pour représenter la partition, chaque élément est un nœud et l'on crée un arbre par classe. On représente cela par un tableau des parents de chaque nœud.

    #figure(caption: [UnionFind et le tableau parent associé])[~#cetz.canvas(length: 0.5cm, {
      import cetz.draw: *
      import cetz.tree: *

      draw-tree1(
        (
          [0], 
            (
              [1]
            ), (
              [2], (
                [3]
              ), [4]
            )
        )
      )

      translate((6, 0))
      
      draw-tree1((
          [5], ([6])
      ))
      
      translate((3, 0))
      
      draw-tree1(([7]))

      translate((-12.5, -7))

      for i in range(8) {
        rect((2 * i, -1), (2 * i + 2, 1))
        content((2 * i + 1, 1.6), $#i$)
      }

      content(( 1, 0), $0$)
      content(( 3, 0), $0$)
      content(( 5, 0), $0$)
      content(( 7, 0), $2$)
      content(( 9, 0), $4$)
      content((11, 0), $5$)
      content((13, 0), $5$)
      content((15, 0), $7$)
    })]
    
    Pour connaître la classe d'un élément $x$, on accède à l'indice $x$ du tableau et on remonte jusqu'à la racine, que l'on identifie puisqu'elle est son propre parent.

    Pour fusionner deux classes, la racine de l'un des arbres devient un fils de la racine de l'autre.
  ]
]

#item("Union par hauteur", related: ("UnionFind"))[
  Lors d'une opération Merge, on doit choisir quel arbre greffer sur lequel. L'union par hauteur revient à greffer l'ordre le moins haut sur l'arbre le plus haut afin de garder nos arbres les plus "plats" possible.

  Afin d'accomplir cela, on stocke également un second tableau pour les hauteurs, que l'on garde à jour : 

  #figure(caption: [UnionFind et le tableau hauteur associé])[#cetz.canvas(length: 0.5cm, {
    import cetz.draw: * 
    
    draw-tree1(
        (
          [0], 
            (
              [1]
            ), (
              [2], (
                [3]
              ), [4]
            )
        )
      )

      translate((6, 0))
      
      draw-tree1((
          [5], ([6])
      ))

      translate((-10.2, -7))

      for i in range(7) {
        rect((2 * i, -1), (2 * i + 2, 1))
        content((2 * i + 1, 1.6), $#i$)
      }

      content(( 1, 0), $2$)
      content(( 3, 0), $1$)
      content(( 5, 0), $1$)
      content(( 7, 0), $0$)
      content(( 9, 0), $0$)
      content((11, 0), $1$)
      content((13, 0), $0$)
  })]

  On greffe donc l'arbre de racine $5$ sur celui de racine $0$ :

  #figure(caption: [Exemple d'union par hauteur])[#cetz.canvas(length: 0.5cm, {
    import cetz.draw: * 
    import cetz.tree: *
    
    tree(direction: "bottom",
      draw-node: (node) => {
        circle((), radius: .15, fill: black, stroke: none)
        content(() + (-0.6, 0.2), text(black, [#node.content]))
      },
      draw-edge: (parent, child) => {
        let (a, b) = (parent.group-name, child.group-name)
        line((a, 0, b), (b, 0, a))
      }, 
      (
        [0], 
        (
          [1]
        ), (
          [2], (
            [3]
          ), [4]
        ), (
          [5], [6]
        )
      )
    )
      
    translate((-4, -7))

    for i in range(7) {
      rect((2 * i, -1), (2 * i + 2, 1))
      content((2 * i + 1, 1.6), $#i$)
    }

    content(( 1, 0), $2$)
    content(( 3, 0), $1$)
    content(( 5, 0), $1$)
    content(( 7, 0), $0$)
    content(( 9, 0), $0$)
    content((11, 0), $1$)
    content((13, 0), $0$)
  })]
]

#item("Compression de chemin", related: ("UnionFind"))[
  Lors d'une opération Find sur une structure UnionFind, on doit remonter la classe de l'élément jusqu'à sa racine pour pouvoir l'identifier et la renvoyer. On peut en profiter pour faire remonter tous les nœuds visités sans changer la complexité. 

  #figure(caption: [Compression de chemin])[
    #grid(
      columns: (1fr, 1fr, 1fr),
      align: center + horizon,
      cetz.canvas(length: 0.5cm, {
        import cetz.draw: *
        import cetz.tree: *
    
        draw-tree1(
          (
            [0], 
              (
                [1]
              ), (
                [2], (
                  [3], [4]
                ), [5]
              )
            )
          )
      }),
      [$ -->^("Find"(4)) $],
      cetz.canvas(length: 0.5cm, {
        import cetz.draw: *
        import cetz.tree: *
    
        draw-tree1(
          (
            [0], 
              (
                [1]
              ), (
                [2], [5]
              ),
              [3],
              [4]
            )
          )
      }),
    )
  ]
]

#item("Pile (Booléen)")[
  Structure de données LIFO, analogue à une pile d'assiettes. Il s'agit d'une séquence $x_0, x_1, ..., x_(n - 1)$ de valeurs du même type, munie de deux opérations :
  - Retirer un élément au sommet de la pile (dépiler ou pop)
  - Ajouter un élément au sommet de la pile (empiler ou push).

  #figure(caption: [Représentation d'une pile])[#cetz.canvas(length: 0.5cm, {
    import cetz.draw: *

    rect((-1, -3), (1, -1))
    rect((-1, -1), (1, 1))
    rect((-1, 1), (1, 3), stroke: (dash: "dashed"))
    rect((-1, 3), (1, 5))

    content((0, 4), $x_(n - 1)$)
    content((0, 2), "...")
    content((0, 0), $x_1$)
    content((0, -2), $x_0$)

    line((-1, 7), (-1, 5.2), mark: (end: ")>", fill: black))
    line((1, 5.2), (1, 7), mark: (end: ")>", fill: black))

    content((-2.2, 6.2), "Push")
    content((2.2, 6.2), "Pop")

    content((4.5, 4), "Sommet de la pile")
    content((-7.5, 0), " ")
  })]

  #implementation[
    - En OCaml, on utilise simplement une liste chaînée. La complexité est en $O(1)$ et la capacité de la pile est a priori non bornée.

    - En C, on utilise un tableau ainsi qu'une variable pour la taille de la pile. La complexité est en $O(1)$ et la capacité de la pile est fixée à la création. 

      #figure(caption: [Pile en C])[#cetz.canvas(length: 0.5cm, {
        import cetz.draw: *

        for i in (0, 1, 2, 3, 4, 5, 6) {
          rect((2 * i, -1), (2 * i + 2, 1))
          if (i > 3) {
            content((2 * i + 1, 0), "?")
          } else {
            content((2 * i + 1, 0), $x_#i$)
          }
        }

        draw-arrow((9, 3), (9, 1.2))
        content((9, 3.8), $"taille" = 4$)
      })]
  ]
]

#item("File")[
  Structure de données FIFO, analogue à une file d'attente. Il s'agit d'une séquence $x_(n-1),...,x_1, x_0$ de valeurs du même type, munie de deux opérations :
  - Retirer un élément à droite de la file (défiler ou pop)
  - Ajouter un élément à gauche de la file (enfiler ou push).

  #figure(caption: [Représentation d'une file])[#cetz.canvas(length: 0.5cm, {
    import cetz.draw: *

    rect((-4, -1), (-2, 1))
    rect((-2, -1), (0, 1), stroke: (dash: "dashed"))
    rect((0, -1), (2, 1))
    rect((2, -1), (4, 1))

    content((-3, 0), $x_(n - 1)$)
    content((-1, 0), "...")
    content((1, 0), $x_(1)$)
    content((3, 0), $x_(0)$)

    line((-6, 0), (-4, 0), mark: (end: ")>", fill: black))
    line((4, 0), (6, 0), mark: (end: ")>", fill: black))

    content((-5, 0.7), "push")
    content((5, 0.7), "pop")
  })]

  #implementation[
    - En OCaml, on utilise deux listes, une appelée $e$ pour entrée et une appelée $s$ pour sortie. On enfile dans $e$ et défile dans $s$, si $s$ est vide on renverse $e$ dans $s$. La complexité est en $O(1)$ amortie et la capacité de la file est a priori non bornée.

      #figure(caption: [File en OCaml],cetz.canvas(length: 0.5cm, {
        import cetz.draw: *

        for i in (0, 1) {
          line((i * 4, 0), (i * 4, 4))
          line((i * 4 + 2, 0), (i * 4 + 2, 4))
          line((i * 4, 0), (i * 4 + 2, 0))
        }

        content((1, -0.6), $e$)
        content((5, -0.6), $s$)
        
        arc-through((-1, 5), (0.5, 4.5), (1, 3), mark: (end: ")>", fill: black))
        arc-through((7, 5), (5.5, 4.5), (5, 3), mark: (start: ")>", fill: black))
        arc-through((2, -0.5), (3, -1), (4, -0.5), mark: (end: ")>", fill: black))

        content((-2.5, 5), "Push")
        content((8.5, 5), "Pop")
        content((3, -1.8), [Renversement de $e$ dans $s$])
      }))
      
    - En C, on utilise un tableau circulaire, une variable pour la sortie des données dans le tableau et une pour la taille de la file. La complexité est en $O(1)$ et la capacité de la pile est fixée à la création.

      #figure(caption: [File en C])[#cetz.canvas(length: 0.5cm, {
        import cetz.draw: *
        import cetz.decorations: brace

        for i in (0, 1, 2, 3, 4, 5, 6) {
          rect((2 * i, -1), (2 * i + 2, 1))

          if (i <= 2 or i >= 6) {
            content((2 * i + 1, 0), "?")
          } else {
            content((2 * i + 1, 0), $x_(#(i - 3))$)
          }
        }
        
        line((7, 2.5), (7, 1.1), mark: (end: ")>", fill: black))
        content((7, 3), $"sortie" = 3$)

        brace((6, -1.3), (12, -1.3), flip: true, stroke: (thickness: 1pt))
        content((9, -2.2), $"longueur" = 3$)
      })]
  ]
]

#item("Liste")[
  Todo
]

#item("Liste simplement chaînée")[
  Structure de données composées de nœuds, chacun muni d'une étiquette et d'un accès à son successeur s'il existe.
  
  #figure(caption: "Liste simplement chaînée correspondant à [1; 2; 3]",
    diagram(
      node((0, 0), grid(columns: 2, inset: 10pt, stroke: 1pt+black)[2][ ]),
      node((1, 0), grid(columns: 2, inset: 10pt, stroke: 1pt+black)[3][ ]),
      node((2, 0), grid(columns: 2, inset: 10pt, stroke: 1pt+black)[1][ ]),

      edge((0.14, 0), (0.72, 0), "-|>", stroke: 1pt + black, snap-to: none),
      edge((1.14, 0), (1.72, 0), "-|>", stroke: 1pt + black, snap-to: none),

      node((2.2, 0), radius: 2pt, fill: black),
    )
  )

  C'est exactement le type `list` de OCaml.
]

#item("Liste doublement chaînée")[
  Structure de données composées de nœuds, chacun muni d'une étiquette et d'un accès à son successeur et à son prédécesseur s'ils existent.
  
  #figure(caption: "Liste doublement  chaînée correspondant à [1; 2; 3]",
    diagram(
      node((0, 0), grid(columns: 3, inset: 8pt, stroke: 1pt+black)[ ][8][ ]),
      node((0.9, 0), grid(columns: 3, inset: 8pt, stroke: 1pt+black)[ ][6][ ]),
      node((1.8, 0), grid(columns: 3, inset: 8pt, stroke: 1pt+black)[ ][1][ ]),

      edge((0.2, 0), (0.60, 0), "-|>", stroke: 1pt + black, snap-to: none, bend: 30deg),
      edge((1.1, 0), (1.48, 0), "-|>", stroke: 1pt + black, snap-to: none, bend: 30deg),
      edge((0.7, 0), (0.3, 0), "-|>", stroke: 1pt + black, snap-to: none, bend: 30deg),
      edge((1.58, 0), (1.22, 0), "-|>", stroke: 1pt + black, snap-to: none, bend: 30deg),

      node((2.02, 0), radius: 2pt, fill: black),
      node((-0.285, 0), radius: 2pt, fill: black),
    )
  )
]

#item("Array")[
  Todo
]

#item("FIFO")[
  First in first out : les éléments ajoutés en premier sont les premiers à être retirés.
]

#item("LIFO")[
  Last in first out : les éléments ajoutés en dernier sont les permiers à être retirés.
]

#item("Bloom (filtre de)")[
  Todo
]

#item("Dictionnaire")[
  Todo
  - lien ABR
]

#item("Clé")[
  Todo (dans dico)
]

#item("Table de hachage")[
  Todo (chaînée ?)
]

#item("Sondage quadratique")[
  Todo (dans table de hachage)
]

#item("Addressage ouvert")[
  Todo
]

#item("Tableau")[
  Zone contiguë de mémoire permettant de stocker plusieurs valeurs du même type, chacune repérée par son indice.
]

#item("Tableau statique")[
  Tableau de taille fixée à la création.

  - en C, on écrit ```C
  int t[6];
  ``` On peut initialiser chaque cellule avec ```C
  t[1] = 4;``` Ou à la création avec la syntaxe ```C
  double t[3] = {0.1, 0.2, 0.3}``` On peut omettre la taille avec cette syntaxe. Si elle s'avère plus grande que le nombre d'éléments renseignés, C complète automatiquement avec la valeur nulle.

  - en Ocaml, on utilise le module `Array` en écrivant ```ocaml
  let t = Array.make n x
  ``` Où `n` est la taille du tableau et `x` la valeur initiale de toutes les cases. \ On accède ou modifie la valeur d'un élément en écrivant ```ocaml
  let t = Array.make 3 0
  t.(0) (* 0 *)
  t.(1) <- 2
  t.(1) (* 2 *)
  ```
  
]

#item("Tableau bidimensionel statique")[
  Todo (en C)
]

#item("Tableau dynamique")[
  Todo
]

#item("Percolation")[
  Todo
]

#item("Arbre tas")[
  Todo
]

#item("Tas binaire")[
  Todo
]

#item("Arbre 2-3")[
  Structure de données arborescente où chaque nœud interne a soit deux enfants et une étiquette ($2$-nœud), soit trois enfants et deux étiquettes ($3$-nœud). Les feuilles de l'arbre n'ont pas d'enfants et une ou deux étiquettes.

  #figure(caption: [Un $2$-nœud et un $3$-nœud], diagram(
      node((6.8, 1), grid(stroke: 1pt + black, columns: 1, inset: (left: 8pt, top: 8pt, bottom: 8pt, right: 8pt))[a]),
      node((6.4, 2), grid(stroke: 0pt + black, columns: 1, inset: (left: 8pt, top: 8pt, bottom: 8pt, right: 8pt))[q], shape: circle, radius: 12pt, stroke: 1pt+black),
      node((7.2, 2), grid(stroke: 0pt + black, columns: 1, inset: (left: 8pt, top: 8pt, bottom: 8pt, right: 8pt))[r], shape: circle, radius: 12pt, stroke: 1pt+black),
      node((9.2, 1), grid(stroke: 1pt + black, columns: 2, inset: (left: 18pt, top: 8pt, bottom: 8pt, right: 18pt))[a][b]),
      node((8.6, 2), grid(stroke: 0pt + black, columns: 1, inset: (left: 8pt, top: 8pt, bottom: 8pt, right: 8pt))[p], shape: circle, radius:12pt, stroke:1pt+black),
      node((9.2, 2), grid(stroke: 0pt + black, columns: 1, inset: (left: 8pt, top: 8pt, bottom: 8pt, right: 8pt))[q], shape: circle, stroke: 1pt+ black, radius:12pt),
      node((9.8, 2), grid(stroke: 0pt + black, columns: 1, inset: (left: 8pt, top: 8pt, bottom: 8pt, right: 8pt))[r], shape: circle, radius: 12pt, stroke: 1pt+black),
      edge((6.9, 1.1), (7.2, 1.75), "-|>"),
      edge((6.7, 1.1), (6.4, 1.75), "-|>"),
      edge((8.75, 1.1), (8.6, 1.75), "-|>"),
      edge((9.2, 1.1), (9.2, 1.75), "-|>"),
      edge((9.6, 1.1), (9.8, 1.75), "-|>"),
    )
  )

  Les arbres $2$-$3$ doivent être équilibrés, c'est-à-dire que toutes les feuilles doivent être à la même profondeur. Cela implique que chaque sous-arbre gauche, du milieu et droit d'un nœud contiennent des quantités proches de données.

  #figure(caption: "Un exemple d'arbre 2-3",
    diagram(
      node((6, 0), grid(stroke: 1pt + black, columns: 1, inset: (left: 8pt, top: 8pt, bottom: 8pt, right: 8pt))[0]),
      node((5.2, 1), grid(stroke: 1pt + black, columns: 2, inset: (left: 18pt, top: 8pt, bottom: 8pt, right: 18pt))[1][2]),
      node((4.6, 2), grid(stroke: 0pt + black, columns: 1, inset: (left: 8pt, top: 8pt, bottom: 8pt, right: 8pt))[4], shape: circle, radius:12pt, stroke:1pt+black),
      node((5.2, 2), grid(stroke: 0pt + black, columns: 1, inset: (left: 8pt, top: 8pt, bottom: 8pt, right: 8pt))[5], shape: circle, stroke: 1pt+ black, radius:12pt),
      node((6.8, 1), grid(stroke: 1pt + black, columns: 1, inset: (left: 8pt, top: 8pt, bottom: 8pt, right: 8pt))[3]),
      node((5.8, 2), grid(stroke: 0pt + black, columns: 1, inset: (left: 8pt, top: 8pt, bottom: 8pt, right: 8pt))[6], shape: circle, radius: 12pt, stroke: 1pt+black),
      node((6.4, 2), grid(stroke: 0pt + black, columns: 1, inset: (left: 8pt, top: 8pt, bottom: 8pt, right: 8pt))[7], shape: circle, radius: 12pt, stroke: 1pt+black),
      node((7.2, 2), grid(stroke: 0pt + black, columns: 1, inset: (left: 8pt, top: 8pt, bottom: 8pt, right: 8pt))[8], shape: circle, radius: 12pt, stroke: 1pt+black),
      edge((6, 0.1), (5.05, 0.78), "-|>"),
      edge((6, 0.1), (6.85, 0.78), "-|>"),
      edge((4.75, 1.1), (4.6, 1.75), "-|>"),
      edge((5.2, 1.1), (5.2, 1.75), "-|>"),
      edge((5.6, 1.1), (5.8, 1.75), "-|>"),
      edge((6.9, 1.1), (7.2, 1.75), "-|>"),
      edge((6.7, 1.1), (6.4, 1.75), "-|>"),
    )
  )

  On dira que $T$ est un arbre $2$–$3$ si et seulement si l'une des affirmations suivantes est vraie :
    - $T$ est vide. C'est-à-dire que $T$ n'a aucun nœud.
    - $T$ est un $2$-nœud d'étiquette $a$ , de fils gauche $p$ et de fils droit $q$ alors
        - $p$ et $q$ sont des arbres $2$-$3$ de même hauteur.
        - $a$ est plus grand que tout élément de $p$.
        - $a$ est plus petit que tout élément de $q$.
    - $T$ est un $3$-nœud d'étiquettes $a$ et $b$ où $a < b$, de fils gauche $p$, de fils du milieu $q$ et de fils droit $r$, alors
        - $p$, $q$ et $r$ sont des arbres $2$-$3$ de même hauteur.
        - $a$ est plus grand que tout élément de $p$ et plus petit que tout élément de $q$.
        - $b$ est plus grand que tout élément de $q$ et plus petit que tout élément de $r$.
]

#item("Arbre rouge-noir")[
  Todo
]
