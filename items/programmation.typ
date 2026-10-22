#import "../template.typ": *

#item("C")[
  Le langage C est un langage de programmation impératif inventé au début des années 1970.
]

#item("OCaml")[
  Le langage OCaml est un langage de programmation fonctionnel maintenu par l'Inria.
]

#item("Malloc")[
  En C, la fonction `malloc` permet de réserver un zone mémoire. Elle est déclarée dans l'en-tête `<stdlib.h>`.

  ```C
  void *malloc(size_t nb_octets);
  ```
]

#item("Calloc")[
  En C, la fonction `calloc` permet de réserver une zone mémoire et de mettre tous ses bis à zéro. Elle est déclarée dans l'en-tête `<stdlib.h>`.

  ```C
  void *calloc(size_t nb_octets);
  ```
]

#item("Effet de bord")[
  Pour une fonction, c'est le fait de modifier un état en dehors de son environnement local.
]

#item("Terminaison")[
  Une fonction termine si elle renvoie un résultat en un nombre fini d'état, et ceux quel que soit ses paramètres.
]

#item("Omega")[
  Si $u$ et $v$ sont deux suites à valeurs réelles positives, on dit que $u = Omega(v)$ si $ exists A > 0, n_0 in NN, forall n >= n_0, A dot v_n <= u_n $
  Autrement dit $u$ majore asymptotiquement $v$, à un facteur près.
]

#item("Theta")[
  Si $u$ et $v$ sont deux suites à valeurs réelles positives, on dit que $u = Theta(v)$ si $ u = O(v) "et" u = Omega(v) $
]

#item("Grand O")[
  Si  $u$ et $v$ sont deux suites à valeurs réelles positives, on dit que $u = O(v)$ si $ exists A > 0, n_0 in NN, forall n >= n_0, A dot u_n <= v_n $
  Autrement dit, $u$ est majoré asymptotiquement par $v$, à un facteur près.
]

#item("Complexité spatiale")[
  Quantité maximale de mémoire utilisée par un algorithme à un instant fixé au cours de son exécution.
]

#item("Programmation dynamique")[
  Fait d'échanger de la complexité spatiale contre de la complexité temporelle.
]

#item("Égalité")[
  En C, on utilise le symbole `==` pour tester une égalité. En OCaml, le symbole `=` permet de tester l'égalité, tandis que `==` teste l'égalité physique, c'est-à-dire au niveau de la mémoire.
  ```C
  if (a == b) {}
  ```
  ```ocaml
  if a = b then ()
  ```
  
]

#item("Différence (égalité)")[
  En C, on utilise le symbole `!=` pour tester la différence, tandis qu'en OCaml on utilisera `<>`.
  ```C
  if (a != b)  {}
  ```
  ```ocaml
  if a <> b then ()
  ```
]

#item("Boucle while")[
  Sert à répéter l'exécution d'une séquence d'instructions tant qu'une condition est vérifiée.
  - #[
    En C, on utilise la syntaxe
    ```C
    while (condition) {
      /* code */
    }
    ```
    #remarque[
      - Pour sortir précipitamment de la boucle sans vérifier la condition, on peut utiliser le mot-clé `break`.
      - Pour revenir à la condition en sautant le reste des instructions à l'intérieur de la boucle, on peut utiliser le mot-clé `continue`.
    ]
  ]
  - #[
    En OCaml, on utilise la syntaxe
    ```ocaml
    while condition do
      (* code *)
    done
    ```
    #remarque[
      Contrairement au C, il n'y a pas moyen de sortir arbitrairement de la boucle. On pourra utiliser une référence pour reproduire ce comportement.
    ]
  ]
]

#item("Boucle for")[
  Sert à répéter l'exécution d'un séquence d'instructions. Ces boucles sont surtout utilisée pour parcourir des tableaux.
  - #[
    En C, on utilise la syntaxe
    ```C
    for (int i = 0; i < n; i++) {
      /* code */
    }
    ```
    pour parcourir tous les entiers de $0$ à $n-1$. \
    #remarque[
      - Pour sortir précipitamment de la boucle sans vérifier la condition, on peut utiliser le mot-clé `break`.
      - Pour parcourir ces entiers dans l'ordre décroissant, on pourra commencer à $i = n - 1$ puis décrémenter $i$ tant que $i >= 0$. ```C
        for (int i = n - 1; i >= 0; i--) {
          /* code */
        }
        ```
      - Pour revenir à la condition en sautant le reste des instructions dans la boucle, on peut utiliser le mot-clé `continue`.
    ]
  ]
  
  - #[
    En OCaml, on utilise la syntaxe
    ```ocaml
    for i = 0 to n - 1 do
      (* code *)
    done
    ```
    #remarque[
      - Attention : le dernier indice est inclus.
      - Pour parcourir ces entiers dans l'ordre décroissant, ou pourra utiliser `downto` et intervertir les bornes. ```ocaml
        for i = n - 1 downto 0 do
          (* code *)
        done
        ```
      - Contrairement au C, il n'y a pas moyen de sortir précipitamment de la boucle.
    ]
  ]

  Fondamentalement, en C une boucle `for` n'est rien d'autre qu'une boucle `while` déguisée. Cette boucle `for`
  ```C
  for (initialisation; condition; itération) {
    /* code */
  }
  ```
  Peut se réécrire comme ceci
  ```C
  {
    initialisation
    while (condition) {
      /* code */
      itération
    }
  }
  ```

  Ce point de vue est pratique pour parcourir une chaîne de caractères jusqu'à sa fin, sans utiliser `strlen` (qui est en $O(n)$ où $n$ est la taille de la chaîne de caractères).
  ```C
  char* texte = "Lorem ipsum.";
  for (int i = 0; texte[i] != '\0'; i++) {
    /* code */
  }
  ```
]

#item("Commentaire")[
  Texte écrit à côté du code, afin de le documenter.
  - En C, on l'écrit derrière deux barres obliques `//` jusqu'à la fin de la ligne, ou bien entre les caractères `/*` (ouvrant une section de commentaires) et `*/` (fermant une section de commentaires).
  - En OCaml les écrit entre les caractères `(*` (ouvrant une section de commentaires) et `*)` (fermant une section de commentaires).
]

#item("Compilation", related: "Sanitizer")[
  Action de compiler du code source grâce à un compilateur.
  - En C, on utilise la commande `gcc`, avec
    - `-O1`, `-O2` ou `-O3` pour optimiser le code de manière plus ou moins agressive.
    - `-Wall` et `-Wextra` pour afficher les avertissements
    - `-Werror` pour transformer les avertissements en erreurs
    - `-fsanitize=` pour utiliser le sanitizer
    - `-lm` si l'en-tête `<math.h>` est utilisé
  - En OCaml, ... à faire
]

#item("Sanitizer")[
  Outil de programmation détectant les comportements indéfinis (`undefined behaviour`) et erreurs de mémoire notamment.
  
  En C, on peut le configurer avec le flag `-fsanitize`, dont les arguments classiques sont
  - `address` pour détecter les erreurs de mémoire avec `AddressSanitizer`)
  - `undefined` pour modifier le programme à la compilation pour détecter les `undefined behaviour` à l'exécution
]

#item("Écriture en base b (non signé)")[
  Todo
  - formule
  - nombre de chiffres
  - nombres différents
]

#item("Base", related: ("Écriture en base b (non signé)"))[
  Todo
]

#item("Hexadécimal")[
  En C, 
  ```C
  int n = 0x0000001;
  ```

  (Todo)
]

#item("Octet")[
  Suite de $8$ bits codant une information.
  
  #exemple[
    Sur un octet, on peut stocker un nombre dans
    - $[|0, 255|]$ dans le cas d'un entier non signé.
    - $[|-128, 127|]$ dans le cas d'un entier signé.
  ]
]

#item("Bit")[
  Unité binaire d'information la plus simple, codant un $0$ ou un $1$, ou bien `true` ou `false`.
]

#item("Byte")[
  Aussi appelé multiplet, c'est la plus petite unité logiquement adressable par un programme sur un ordinateur. Sur la plupart des systèmes, ce sont des bytes de 8 bits qui sont utilisés (octet).
]

#item("Dépassement arithmétique")[
  Situation lors de laquelle le résultat d'un calcul d'entiers dépasse l'entier maximal stockable. Le résultat peut alors devenir petit négatif.

  #exemple[
    ```C
    #include <stdio.h>
    int main() {
      short x = 0;
      while (x >= 0) x += 1;
      printf("x = %hi\n", x);
    }
    ```
    Le code ci-dessus donne comme sortie `x = -32768`.
  ]
]

#item("Soupassement arithmétique", related: ("Dépassement arithmétique"))[
  Situation lors de laquelle le résultat d'un calcul d'entiers devient plus petit que l'entier minimum stockable.

  #exemple[
    ```C
    #include <stdio.h>
    int main() {
      short x = 0;
      while (x <= 0) x -= 1;
      printf("x = %hi\n", x);
    }
    ```
    Le code ci-dessus donne comme sortie `x = 32767`.
  ]
]

#item("Boutisme")[
  On le désigne à la fois pour :
  - désigner l'ordre des bits dans la représentation binaire d'un chiffre
  - un entier étant souvent stocké sur plusieurs octets, désigner l'orientation des octets de poids fort et de poids faible pour le représenter
  On distingue
  - le gros-boutisme (_big endian_), avec les bits/octets de poids fort en premier
  - le petit-boutisme (_little endian_), avec les bits/octets de poids faible en premier
]

#item("Complément à deux")[
  Représentation des entiers signés utile pour réaliser des opérations dessus. \
  Étant donné une largeur $omega$ et une suite de bits $(b_(omega-1), ..., b_0)$, sa valeur en complément à deux est $ -b_(omega-1) 2^(omega-1) + sum_(i=0)^(omega-2) b_i 2^i $
  Cela revient à multiplier par $-1$ le bit de poids fort.

  #remarque[
    - Le plus grand entier signé représentable est alors $2^(omega-1) -1$, et le plus petit entier signé représentable $-2^(omega-1)$.
    - L'intérêt de cette représentation, en notant  $v_omega ("b")$ la valeur non signée et $v s_omega ("b")$ la valeur signée de la suite de bits $"b"$, est qu'on peut représenter les entiers non signés de manière usuelle : $ v_omega (b) eq.triple v s_omega (b) mod 2^w $
    - Pour obtenir le complément à deux d'un nombre négatif, on peut inverser les bits de l'écriture en binaire de sa valeur absolue, avant de lui additionner $1$. \ Cela vient du point précédent et du fait que pour tout $x >= 0$, en notant $x_"inv"$ le nombre dont on a inversé les bits dans la représentation en complément à deux, on a $ x + x_"inv" = - 1 $ et donc avec $b$ la représentation de $x$ en complément à deux $ -x &eq.triple 1 + x_"inv" &mod& 2^omega \ &eq.triple  1 + v s_omega (b_"inv") &mod& 2^omega \ &eq.triple 1 + v_omega (b_"inv") &mod& 2^omega $
  ]

  #exemple[
    Avec $omega = 4$, on a $ 7 &=& - 0 dot 2^3 + 1 dot 2^2 + 1 dot 2^1 + 1 dot 2^0 \ -8  &=& - 1 dot 2^3 + 0 dot 2^2 + 0 dot 2^1 + 0 dot 2^0 $ On pose ensuite l'addition $7 + (-8)$ : $
      0111 &\
      + space.fig 1000 &\
      #line(length: 3em) &\
      1111 &\
    $ Or $ -1 dot 2^3 + 1 dot 2^2 + 1 dot 2^1 + 1 dot 2^0 = -1 = 7 - 8 $
  ]
]

#item("Bit de signe")[
  Idée d'implémentation naïve d'entiers signés, consistant à utiliser un bit en plus valant $0$ dans le cas d'un nombre positif, et $1$ dans le cas d'un nombre négatif.
]

#item("Entier")[
  En C, on distingue plusieurs types d'entiers provenant de `<stdint.h>` :
  - les entiers signés `int8_t`, `int16_t`, `int32_t`, `int64_t`
  - les entiers non signés `uint8_t`, `uint16_t`, `uint32_t`, `uint64_t`
]

#item("Booléen")[
  Vrai ou faux. En C comme en OCaml, on les note `true` et `false`. Il faut utiliser l'en-tête `<stdbool.h>` en C pour utiliser le type `bool`.
]

#item("Flottant")[
  Norme d'écriture de nombres proche de la notation scientifique, représentant un nombre par :
  - un signe, entre $1$  et $-1$
  - une mantisse, un entier codant le nombre sans virgule
  - un exposant, codant la puissance de la base utilisée
  Ce nombre est alors $ "signe" times "mantisse" times "base"^"exposant" $
]

#item("Mantisse", related: ("Flottant"))[
  Aussi appelé significande, partie d'un flottant stockant la valeur absolue du nombre multiplié par un facteur (la base à une certaine puissance)
]

#item("Transtypage")[
  Conversion d'une variable d'un type vers un autre. 

  #exemple[
    ```C
    float a = 5.5;
    int b = (int)a;// b vaut 5
    ```
  ]
]

#item("Char")[
  Todo
]

#item("Alias de type")[
  Todo (cast)
]

#item("Main")[
  Todo (fonction main)
]

#item("Exponentiation rapide")[
  Manière de calculer la puissance d'un nombre de manière récursive, en tirant partie des propriétés des puissances. \
  Le calcul se fait en $O(log(abs(n)))$, où $n$ est la puissance.

  #code("Exponentiation rapide")[
    - *Entrée :* un nombre $a$, un entier $n$
    - *Sortie :* $a^n$
    - *fonction* $"exp"(a, n)$
      - *si* $n = 0$ *alors*
        - *retourner* 1
      - *si* $n <0$ *alors*
        - *retourner* $"exp"(1/a, -n)$
      - *si* $n$ est pair *alors*
        - $p <- "exp"(a, n/2)$
        - *retourner* $p^2$
      - *sinon*
        - $p <- "exp"(a, (n-1)/2)$
        - *retourner* $a times p^2$
  ]

  #exemple[
    ```ocaml
    let rec exp a n =
      if n = 0 then 1
      else if n < 0 then exp (1. /. a) (-n)
      else if n mod 2 = 0 then (
        let p = exp a (n/2) in
        p*p
      ) else (
        let p = exp a (n/2) in
        a*p*p
      )
    ```
  ]
]

#item("Fonction récursive terminale")[
  Fonction récursive dont chaque appel fait au plus un appel récursif. Aucun calcul ne doit être fait à partir du résultat de cet appel. \
  Ces fonctions permettent d'économiser de l'espace mémoire par rapport à des fonctions récursives non terminales, car l'état de la fonction appelante n'a pas besoin d'être conservée sur la pile d'exécution.

  #exemple[
    
  ]
]

#item("Fonction récursive")[
  Todo

  #exemple[
    ```ocaml
    let rec factorielle n =
      match n with
      | 0 -> 1
      | _ when n < 0 -> failwith "Non défini"
      | _ -> n * factorielle (n - 1)
    ```
  ]
]

#item("Opérateur adress of")[
  Todo
]

#item("Opérateur de déréférencement")[
  Todo
]

#item("Pointeur")[
  Todo
]

#item("Entrée")[
  Todo (input C)
]

#item("Sortie")[
  Todo (output C)
]

#item("Fonctionnel")[
  Todo
]

#item("Impératif")[
  Todo
]

#item("Ramasse-miette")[
  Système de gestion automatique de la mémoire, recyclant la mémoire allouée mais inutilisée.
]

#item("Tri radix")[
  Todo
]

#item("Tri en place")[
  Todo
]

#item("Tri stable")[
  Tri conservant l'ordre initial entre des éléments égaux. \
  Pour tout $x, y$ de le séquence initiale tel que $"compare"(x,y) = 0$, on a
  $ x "avant" y "dans la séquence triée" \ <=> \ x "avant" y "dans la séquence initiale" $

  #remarque[
    - Le résultat d'un tri stable est défini de manière unique.
    - Les éléments de la séquence ne sont échangés que lorsque c'est nécessaire.
  ]
]

#item("Tri fusion")[
  Aussi appelé _merge sort_, il consiste à séparer la séquence initiale en deux séquences triées récursivement pour ensuite les fusionner. \
  On utilise souvent un tri plus efficace pour les séquences de petite taille.

  #code("Tri fusion")[
    - *Entrée :* une séquence $u$
    - *Sortie :* la séquence $u$ triée
    - *fonction* $"tri"(u)$
      - *si* $abs(u)$ suffisamment petit *alors*
        - *renvoyer* $"tri_bis"(u)$
      - *sinon*
        - $v,w <- u$
        - *renvoyer* $"fusion"("tri"(v), "tri"(w))$
  ]
  
  Sa complexité est $O(n log(n))$.
]

#item("Tri rapide")[
  Todo
]

#item("Tri par insertion")[
  Todo
]

#item("Tri par tas")[
  Todo
]

#item("Tri par comparaison")[
  Todo
]

#item("Type mutable")[
  Todo, sucre syntaxique en OCaml
]

#item("Type option")[
  Todo
]

#item("Collision")[
  Todo, collision par chaînage
]

#item("Fonction de comparaison")[
  Fonction permettant de comparer deux éléments, tel que
  - $"compare"(x, y) < 0$ si $x$ doit être placé avant $y$
  - $"compare"(x, y) > 0$ si $x$ doit être placé après $y$
  Ainsi, pour avoir un tri croissant on utilisera $ (x, y) mapsto x - y $
  Pour avoir un tri décroissant, on utilisera $ (x, y) mapsto y - x $
]

#item("Diviser pour régner")[
  Todo
]

#item("Rabin-Karp (algorithme de)")[
  Todo
]

#item("Valeur élémentaire")[
  Todo
]

#item("Opération élémentaire")[
  Todo
]

#item("Classe de complexité")[
  Todo
]

#item("Classe polynomiale")[
  Todo
]

#item("Problème d'optimisation")[
  Todo
]

#item("Algorithme d'approximation")[
  Todo
]

#item("Branch and Bound")[
  Technique accélérant la résolution d'un problème d'optimisation par backtracking.
]

#item("Backtracking")[
  Le backtracking consiste à effectuer un parcours en profondeur de l'arbre des solutions partielles, en élaguant une branche (abandonnant sa recherche) dès qu'on est sûr qu'elle ne peut contenir aucune solution complète admissible. \
  Dans un problème d'optimisation, on peut également élaguer lorsqu'on est sûr de ne pas avoir de meilleure solution admissible dans la branche que la meilleur solution trouvée à cet instant. On a alors souvent besoin d'une heuristique $h$ prenant en entrée une solution partielle, et vérifiant $ "score"(x) <= h(y) $ si la solution complète $x$ étend la solution partielle $y$.
]

#item("Algorithme probabiliste")[
  Todo
]

#item("Las Vegas (algorithme de)")[
  Todo
]

#item("Monte Carlo (algorithme de)")[
  Todo
]

#item("Bozo-sort")[
  Algorithme de tri consistant à intervertir au hasard deux éléments de la séquence jusqu'à ce qu'elle soit triée. \
  À n'utiliser qu'en dernier recours.
]

#item("Espérance de temps de calcul")[
  Todo
]

#item("McNaughton et Yamada")[
  Todo
]

#item("Complexité amortie")[
  Todo
]

#item("Top-down", related: ("Sac à dos (problème du)"))[
  Approche descendante pour résoudre un problème, consistant à utiliser une relation de récurrence pour résoudre le problème sur des instances plus simples. \
  C'est une solution récursive, permettant d'éviter les calculs inutiles. On peut mémoïser les résultats des instances plus simple pour éviter de les recalculer.
]

#item("Bottom-up", related:("Fibonacci (suite de)"))[
  Approche ascendante pour résoudre un problème, consistant à résoudre des instances de taille de plus en plus grande, jusqu'à résoudre le problème initial. \
  C'est une solution itérative, pouvant réduire la complexité spatiale.
]

#item("Algorithme glouton", related: ("Kruskal (algorithme de)"))[
  Classe d'algorithme pour des problèmes d'optimisation, qui consiste à réaliser des choix localement optimaux afin de potentiellement aboutir à une solution optimale globale. \
  Si l'algorithme donne une solution optimale il sera souvent le meilleur pour le problème. S'il donne une solution pas trop mauvaise sur un problème difficile à résoudre exactement, il peut être utile.

  #exemple[
    L'algorithme de Kruskal est un algorithme glouton.
  ]
]

#item("Machine universelle")[
  Todo
]

#item("Problème de décision")[
  Todo
]

#item("Concurrence")[
  Un programme est concurrent s'il contient plusieurs fils (unités s'exécutant chacune séquentiellement) dont les exécutions peuvent être entrelacées ou simultanées.
]

#item("Sémaphore", related: ("Lamport (algorithme de la boulangerie de)"))[
  Primitive de synchronisation. Un sémaphore est une variable entière positive ou nulle et possèdant deux opérations atomiques :
  - $"POST"$ incrémente la variable
  - $"WAIT"$ tente de décrémenter la variable. Si cela la rendrait strictement négative, le fil ayant effectué l'appel est mis en attente

  #implementation[
    On peut implémenter un sémaphore avec l'algorithme de la boulangerie de Lamport.
  ]

  #remarque[
    - Un sémaphore représente donc typiquement une quantité de ressources disponibles.
    - Il sert à garantir un comportement "premier arrivé, premier servi". 
    - L'attente qu'une ressource soit libérée n'est pas une attente active : le fil est réellement mis en attente pour être réveillé le moment venu.
  ]

  #exemple[
    En OCaml, on peut utiliser le module `Semaphore`, plus particulièrement `Semaphore.Counting`.
  ]
]

#item("NP-difficile")[
  Todo
]

#item("NP-complet")[
  Todo
]

#item("EXP")[
  Todo
]

#item("DTIME")[
  Todo
]

#item("P")[
  Todo
]

#item("NP")[
  Todo
]

#item("FP")[
  Todo
]

#item("PO")[
  Todo
]

#item("Cook-Levin (théorème de)")[
  SATest NP-complet. Todo
]

#item("Course critique")[
  On dit qu'il y a une course critique dans un programme dès que
  -  au moins deux fils peuvent accéder simultanément à un emplacement mémoire
  - au moins l'un de ces accès est une écriture.

  #remarque[En C, l'existence d'une course critique rend le programme UB (Undefined Behaviour, à éviter).
  ]
]

#item("Section critique")[
  Todo
]

#item("Exclusion mutuelle")[
  Se dit d'un verrou qui est toujours tenu par au plus un fil.
]

#item("Heuristique")[
  Todo
]

#item("Réduction")[
  Todo (complexité)
]

#item("Réduction polynomiale")[
  Todo (réduction many-one ?)
]

#item("Oracle")[
  Todo
]

#item("Parallélisme", related: ("Concurrence"))[
  Fait d'exploiter la concurrence et la présence de plusieurs processeurs (unités d'exécution) pour accélérer un calcul ou programme.
]

#item("Problème fonctionnel")[
  Todo
]

#item("Correction")[
  Todo
]

#item("Spécification")[
  Todo
]

#item("Mutex", related: ("Peterson (algorithme de)"))[
  Un mutex $m$, ou verrou, est une primitive de synchronisation dotée au moins de l'interface suivante :
  - une fonction $"CreateLock"()$ renvoyant un nouveau mutex initialement libre
  - une fonction $"Lock"(m)$ ne renvoyant rien, qui permet d'acquérir le verrou. Un appel à cette fonction termine au bout d'un temps indéterminé, éventuellement infini, mais quand l'appel termine le fil ayant effectué l'appel possède le verrou.
  - une fonction $"Unlock"(m)$ ne renvoyant rien, qui permet de libérer le verrou.
  À tout moment, le verrou est tenu par au plus un fil.

  #remarque[
    - Le terme mutex vient de _MUTual EXclusion_.
  ]

  #implementation[
    On peut implémenter un Mutex avec à l'algorithme de Peterson.
  ]
]

#item("Blocage")[
  Todo
]

#item("Absence d'interblocage")[
  Se dit d'un verrou pour lequel, lorsqu'au moins un fil tente d'acquérir ou de relacher le verrou, au moins un fil finit par y parvenir.
]

#item("Famine")[
  Todo
]

#item("Absence de famine")[
  Se dit d'un verrou pour lequel, lorsqu'un certain fil tente d'acquérir ou de relâcher le verrou, ce fil finit par y arriver.
]

#item("Type composé")[
  Todo
]

#item("Erreur de segmentation")[
  Todo
]

#item("Chaîne de caractères")[
  Suite ordonnée de caractères stockant du texte. \ Une chaîne de caractère est de type `char*` en C, et le caractère `\0` marque la fin de la chaîne. En OCaml, on utilise le module `String`.

  #implementation[
    En C, on peut utiliser `strlen` après avoir inclus `<string.h>`.
    ```C
    #include <string.h>
    
    int main() {
      size_t len = strlen("Hello, world!");
    }
    ```
    On peut également l'implémenter soi-même de la fonction suivante
    ```C
    int strlen(char* str) {
      int len = 0;
      while (str[len] != '\0') {
        len += 1;
      }
      return len;
    }
    ```

    En OCaml, il suffit d'utiliser `String.length`.
    ```ocaml
    let length = String.length "Hello, world!"
    ```
  ]
]

#item("Recherche dichotomique")[
  Algorithme de recherche permettant de déterminer la présence d'un élément dans un tableau trié. \
  Il consiste à comparer l'élément recherché au milieu du tableau, puis à poursuivre la recherche dans la moitié droite ou gauche du tableau selon si l'élément recherché est plus petit ou plus grand.

  #implementation[
    Dans le cas d'un tableau trié par ordre croissant, voici un exemple d'implémentation retournant l'indice de la position de la valeur recherchée.
    ```C
    int dichotomie(int* arr, int len, int x) {
      int a = 0;// Borne inférieure inclue
      int b = len - 1;// Borne supérieure inclue

      while (a <= b) {
        int milieu = (a + b)/2;
        int valeur = arr[milieu];

        if (x == valeur) {
          return milieu;
        } else if (x < valeur) {
          b = milieu - 1;
        } else {
          a = milieu + 1;
        }
      }

      return -1;
    }
    ```
  ]
]

#item("Lecture de fichier")[
  Todo
]

#item("Barrière de synchronisation")[
  Todo
]

#item("Peterson (algorithme de)")[
  Implémentation d'un mutex garantissant l'exclusion mutuelle, l'absence d'interblocage et l'absence de famine.

  #code("Algorithme de Peterson")[
    - *fonction* CreateLock$()$
      - *renvoyer* ${ "turn" = 0; "want" = ["false", "false"] }$

    - *fonction* Unlock$(m, t)$
      - $m."want"<-"false"$

    - *fonction* Lock$(m,t)$
      - $m."want"<-"true"$
      - $m."turn"<-1-t$
      - *tant que* $m."turn" = 1-t "et" m."want"[1-t]$ *faire*
        - Rien
  ]

  #remarque[
    - Suivre ce pseudo-code pour implémenter cet algorithme en C ne fonctionne pas car il peut y avoir un interblocage : cela est dû au fait que le processeur peut inverser l'ordre de deux instructions si on ne prend pas de précautions.
    - Dans la pratique n'écrivez pas votre propre mutex, utilisez celui de la bibliothèque standard.
  ]
]

#item("Lamport (algorithme de la boulangerie de)")[
  Todo
]

#item("Variant de boucle")[
  Utilisé pour prouver la terminaison d'un algorithme, un variant de boucle doit être une quantité
  - entière
  - minorée (respectivement majorée)
  - strictement décroissante à chaque itération (respectivement strictement croissante)
]

#item("Invariant de boucle")[
  Utilisé pour prouver la correction d'un programme comportant une boucle, un invariant de boucle doit :
  - être vraie avant la première itération
  - rester vraie à la fin d'une itération si elle est vrai au début de celle-ci
]

#item("Pile d'exécution")[
  Pile servant à stocker les informations des appels de fonction.
]