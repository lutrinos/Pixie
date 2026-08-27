#import "../template.typ": *

#item("Hanoi (jeu de)")[
  Todo
]

#item("Partie")[
  Une partie d'un jeu est un chemin de l'état initial vers un état terminal dans le graphe du jeu. \
  On parle de partie infinie si le chemin est infini (présence d'un cycle par exemple).
]

#item("Stratégie")[
  Une stratégie pour un joueur $i$ est une application des sommets non terminaux contrôlés par $i$ vers les sommets contrôlés par l'autre joueur (noté ) tel que tous les coups joués soient valides. \
  Dans l'arène $G = (V, E)$, la stratégie $s$ est
  $ s : V_i ' -> V_"autre joueur" $
  Et $s$ vérifie $ forall x in V_i ', space (x, s(x)) in E $
]

#item("Arène")[
  Graphe orienté biparti représentant les états d'un jeu.
]

#item("Complexité arborescente")[
  Todo
]

#item("Complexité d'espace d'états")[
  Todo
]

#item("MinMax")[
  Todo
]

#item("Point fixe")[
  Todo
]

#item("Jeu à deux joueurs", related: ("Chomp (jeu de)"))[
  Un jeu à deux joueurs est un quadruplet $(G, s_0 , T_0 , T_1)$ où
  - $G = (V_0 union.sq V_1 , E)$ est un graphe orienté biparti appelé arène. Les sommets de $V_0$ sont ceux contrôlés par le joueur $0$, ceux de $V_1$ ceux contrôlés par le joueur $1$.
  - $s_0 in V$ est le sommet initial
  - $T_0$ et $T_1$ sont des parties disjointes de $V$ ne contenant que des puits. Les sommets de $T_0$ sont ceux gagnants pour le joueur $0$ et ceux de $T_1$ ceux gagnant pour le joueur $1$.
  On appelle les puits de $V$ états terminaux, et les sommets ni dans $T_0$ ni dans $T_1$ sont appelés les états nuls.

  #exemple[
    Le jeu du tic-tac-toe est un exemple de jeu à deux joueurs, comme les échecs, les dames, le puissance 4, Othello...
    
    #figure(
      image("../figures/jeu-tic-tac-toe.png", width: 120pt),
      caption: [Partie de l'arène du tic-tac-toe]
    )
  ]
]

#item("Jeu")[
  J'ai perdu.
]

#item("État terminal")[
  En théorie des jeux, puits de l'arène du jeu considéré. Une fois dans un état terminal, le jeu est terminé, qu'un des joueurs ait gagné ou non.
]

#item("État nul")[
  En théorie des jeux, état terminal gagnant pour aucun des joueurs. Avec les notations usuelles, il s'agit de $ V without (T_0 union T_1) $
]

#item("Jeu à information parfaite")[
  Todo
]

#item("Élagage alpha-beta")[
  Todo
]

#item("Attracteur")[
  En théorie des jeux, l'attracteur d'un joueur $i$ est l'ensemble des positions gagnantes pour $i$.

  #remarque[
    On peut calculer l'attracteur des deux joueurs en $O(abs(E) + abs(V))$ avec l'algorithme suivant.

    #code("Calcul des attracteurs")[
      - *Entrée :* Un jeu $(G, s_0 , T_0 , T_1)$
      - *Sortie :* les attracteurs des joueurs $0$ et $1$
        - $A_0 <- emptyset$
        - $A_1 <- emptyset$
        - $d <- (d_+ (s) ; s in V)$
        - $G_M <- "miroir"(G)$
        - *fonction* $"Explore"(s, "joueur")$
          - $A_"joueur" <- A_"joueur" union {s}$
          - *pour* $s'$ successeur de $s$ dans $G_M$ tel que $s' in.not A_0 union.sq A_1$ *faire*
            - *si* $s'$ contrôlé par $"joueur"$ *faire*
              - $"Explore"(s', "joueur")$
            - *sinon*
              - $d[s'] <- d[d'] - 1$
              - *si* $d[s'] = 0$ *alors*
                - $"Explore"(s', "joueur")$
        - *pour* $s in T_0$ *faire*
          - $"Explore"(s, 0)$
        - *pour* $s in T_1$ *faire*
          - $"Explore"(s, 1)$
        - *renvoyer* $A_0 , A_1$
    ]

    On part des états gagnants d'un joueur pour remonter aux sommets de son attracteur, que ce soit par un choix de ce joueur ou en forçant la main de son adversaire, dans le cas où ce dernier ne peut qu'aboutir sur une position gagnante pour notre joueur.
  ]
]

#item("Chomp (jeu de)")[
  Todo
]

#item("Negamax")[
  Todo
]