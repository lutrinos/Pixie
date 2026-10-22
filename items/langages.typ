#import "../template.typ": *

#item("Alphabet")[
  Ensemble fini $Sigma$ dont les éléments sont appelées lettres, symboles ou caractères.

  #exemple[
    $Sigma = {a, b}$ est un alphabet.
  ]
]

#item("Mot")[
  Le mot vide $epsilon$ ou une suite finie $m_1...m_n$ d'éléments de $Sigma$ pour $n >= 1$.

  On note $Sigma^*$ l'ensemble des mots sur $Sigma$.

  #exemple[$a b b a$ est un mot de $Sigma = {a, b}$.]
]

#item("Longueur d'un mot")[
  Nombre de lettres dans ce mot :
  $ cases(
    abs(epsilon) = 0,
    abs(m_1...m_n) = n
  ) $
]

#item("Concaténation de mots")[
  La concaténation de $u$ et $v$ deux mots sur un même alphabet $Sigma$ correspond au fait de mettre bout à bout deux chaînes de caractères.

  On note une telle opération $u dot v$, ou encore $u v$, définie par :
  - $epsilon dot v = v$
  - $u dot epsilon = u$
  - $(u_1...u_n) dot (v_1...v_m) = u_1...u_n v_1...v_m$

  #remarque[
    En OCaml, l'opérateur `^` permet de concaténer deux chaînes de caractères (`String.concat` est plus rapide).
  ]
]

#item("Concaténation de langages")[
  Soient $X, Y$ deux langages sur $Sigma$. On note $X dot Y$ ou $X Y$ la concaténation de $X$ et $Y$ le langage $ X dot Y = { u dot v ; u in X "et" v in Y } $
  Cette opération est associative.

  #exemple[
    $ cal(L)(a^*) dot cal(L)(b^*) = cal(L)(a^* b^*) $
  ]
]

#item("Puissance d'un mot")[
  Pour $u in Sigma^*$ et $n >= 0$, on définit $u^n$ par :
  $ cases(
    u^0 = epsilon,
    u^(n + 1) = u dot u^n
  ) $

  #exemple[
    $(a b)^3 = a b a b a b$.
  ]
]

#item("Langage")[
  Un langage est une partie de $Sigma^*$.

  #remarque[
    On note $Sigma^n$ le langage des mots de longueur $n$.
  ]

  #exemple[
    $cal(L) = {a^n thick | thick n >= 0}$ pour $Sigma = {a, b}$.
  ]
]

#item("Langage rationnel")[
  Langage décrit par une expression régulière : il existe une expression régulière $e$ telle que $ X = cal(L)(e) $

  #remarque[
    Les langages rationnels sont stables par concaténation, union, passage au complémentaire et étoile de Kleene.
  ]

  #exemple[
    ${a^n thick | thick n >=0 } = cal(L)(a^*)$ est rationnel.
  ]
]

#item("Langage algébrique")[
  Langage engendré par une grammaire sans contexte.

    #remarque[
    Les langages rationnels sont stables par concaténation, union et étoile de Kleene.
  ]

  #exemple[
    ${a^n b^n thick | thick n >= 0}$ est algébrique, dont la grammaire est
    $ V &= {S} \ Sigma &= {a,b} \ R &= { S -> epsilon, S -> a S b } $
  ]
]

#item("Langage reconnaissable")[
  Un langage $L$ est reconnaissable s'il existe un automate fini $A$ d'alphabet $Sigma$ tel que $ cal(L)(A) = L $

  #remarque[
    - Todo stabilité
    - Pour montrer qu'un langage n'est pas reconnaissable, on peut montrer qu'on aurait besoin d'une infinité d'états, ou utiliser le lemme de l'étoile pour trouver une contradiction.
  ]

  #exemple[
    ${ a^n b^n , n in NN }$ n'est pas reconnaissable, mais ${ a^n , n in NN }$ l'est.
  ]
]

#item("Huffman (codage de)")[
  Todo
]

#item("Notation infixe")[
  Todo
]

#item("Notation postfixe")[
  Todo
]

#item("Shunting-Yard (algorithme de)")[
  Todo
  Passage notation infixe vers postfixe.
]

#item("Palindrome")[
  Mot étant égal à son miroir, si $u = u_1...u_n$ est un palindrome :
  $ forall i in bracket.l.stroked 1; n bracket.r.stroked quad u_i = u_(n + 1 - i) $

  #exemple[
    _bob_ et _kayak_ sont des palindromes, contrairement à _bloubiboulga_.
  ]

  #remarque[
    Vérifier qu'un mot est un palindrome se fait aisément en temps linéaire.

    ```C
    bool est_palindrome(char* str) {
      int n = strlen(str);
      
      for (int i = 0; i < n / 2; i++) {
        if (str[i] != str[n - 1 - i]) {
          return false;
        }
      }
      
      return true;
    }
    ```
  ]
]

#item("Distance (texte)")[
  Todo
]

#item("Levenshtein (distance de)")[
  Todo
]

#item("Boyer-Moore (algorithme de)")[
  Todo
]

#item("Lempel-Ziv-Welsh (algorithme de)")[
  Todo
]

#item("Préfixe")[
  Si $u$ et $v$ sont deux mots définis sur un même alphabet $Sigma$, $u$ est un préfixe de $v$ s'il existe $w in Sigma^*$ tel que $ v = u dot w $
]

#item("Suffixe")[
  Si $u$ et $v$ sont deux mots définis sur un même alphabet $Sigma$, $u$ est un suffixe de $v$ s'il existe $w in Sigma^*$ tel que $v = w dot u$.
]

#item("Facteur")[
  Si $u$ et $v$ sont deux mots définis sur un même alphabet $Sigma$, $u$ est un facteur de $v$ s'il existe $w, z in Sigma^*$ tel que $ v = w dot u dot z $
]

#item("Sous-mot")[
  Soit $u, v in Sigma^*$, avec $ u = u_1 ... u_n  "où" n = abs(u) $
  On dit que $u$ est un sous-mot de $v$ s'il existe des mots $t_0 , ..., t_n$ tels que $ v = t_0 dot u_1 dot t_1 dot u_2 dot dot dot t_(n-1) dot u_n dot t_n $
  Autrement dit $u$ est composé des lettres de $v$ en conservant leur ordre.
]

#item("Levi (lemme de)")[
  Soient $u, v, x, y in Sigma^*$ tels que $u dot v = x dot y$. Il existe un unique mot $t$ tel que :
  - soit $u = x dot t$ et $y = t dot v$
  - soit $x = u dot t$ et $v = t dot y$.

  Todo schéma
]

#item("Étoile de Kleene")[
  Si $X$ est un langage sur $Sigma$, l'étoile de Kleene de $X$ est $ X^* = union.big_(n >= 0) X^n $
]

#item("Puissance d'un langage")[
  Un langage $X$ à la puissance $n$ est le langage contenant exactement les mots formés de la concaténation de $n$ mots de $X$.
  $ X^n = X dot X dot dot dot X $
]

#item("Expression régulière")[
  Todo
]

#item("Automate")[
  Todo
]

#item("Clôture")[
  Todo
]

#item("Pompage (lemme de)")[
  Todo
]

#item("Myhill-Nerode (théorème de)")[
  Todo
]

#item("Chomsky (forme normale de)")[
  Todo
]

#item("Analyse syntaxique")[
  Todo (top-down, bottom up)
]

#item("Arden (lemme de)")[
  Todo
]

#item("Kleene (théorème de)")[
  Todo
]

#item("Automate émondé")[
  Todo
]

#item("État accessible")[
  Todo
]

#item("État initial")[
  Todo
]

#item("État acceptant")[
  Todo
]

#item("État co-accessible")[
  Todo
]

#item("État")[
  Todo
]

#item("Automate des parties")[
  Todo
]

#item("Automate déterministe")[
  Todo (+ non déterministe)
]

#item("Automate complet")[
  Todo
]

#item("Epsilon fermeture")[
  Todo
]

#item("Transition")[
  Todo
]

#item("Epsilon transition")[
  Todo
]

#item("Fonction de transition")[
  Todo
]

#item("Expression régulière linéaire")[
  Todo
]

#item("Langage local")[
  Todo
]

#item("McCluskey et Brzozowski (méthode de)")[
  Todo (élimination des états)
]

#item("Grammaire ambiguë")[
  Todo
]

#item("Dérivation immédiate")[
  Pour $alpha, beta in (Sigma union V)^*$, on dit qu'il existe une dérivation immédiate de $alpha$ en $beta$, noté $alpha => beta$ s'il existe une règle $X -> gamma$ telle que
  $ alpha = alpha_1 X alpha_2 "et" beta = alpha_1 gamma alpha_2 $
  où $alpha_1, alpha_2 in (Sigma union V)^*$.
]

#item("Dérivation de longueur n")[
  Pour $alpha, beta in (Sigma union V)^*$, on dit qu'il existe une dérivation de longueur $n >= 0$ de $alpha$ en $beta$, noté $alpha scripts(=>)_n beta$, s'il existe des mots $ gamma_0 = alpha, gamma_1, ..., gamma_n = beta $ tels que $ gamma_0 => gamma_1 => ... => gamma_n $
]

#item("Dérivation")[
  Dans une grammaire sans contexte, pour $alpha, beta in (Sigma union V)^*$, on dit qu'il existe une dérivation de $alpha$ en $beta$, noté $alpha scripts(=>)^* beta$, s'il existe $n >= 0$ tel que $ alpha scripts(=>)_n beta $
]

#item("Dérivation immédiate gauche")[
  Dérivation de la forme $u X alpha => u beta alpha$ où $u in Sigma^*$, $alpha in (Sigma union V)^*$ et $X -> beta$ est une règle de production de la grammaire.
]

#item("Dérivation immédiate droite")[
  Dérivation de la forme $alpha X u => alpha beta u$ où $u in Sigma^*$, $alpha in (Sigma union V)^*$ et $X -> beta$ est une règle de production de la grammaire.
]

#item("Dérivation gauche")[
  Dérivation constituée uniquement de dérivations immédiates gauches.
]

#item("Dérivation droite")[
  Dérivation constituée uniquement de dérivations immédiates droites.
]

#item("Thompson (automate de)")[
  Todo
]

#item("Rice (théorème de)")[
  Todo
]

#item("Mot généré")[
  Une grammaire engendre un mot $w in Sigma^*$ si $S scripts(=>)^* w$.
]

#item("Langage engendré par une grammaire", related: "Langage algébrique")[
  Le langage engendré par la grammaire $G = (Sigma, V, R, S)$ est $ cal(L)(G) = {w in Sigma^* tq S scripts(=>)^* w} $
]


#item("Racine carrée d'un langage")[
  La racine carrée d'un langage $L$ est le langage des mots dont le carré est dans $L$ :
  $ sqrt(L) = {u tq u u in L} $
  Todo inclusions
]

#item("Équivalence faible")[
  Deux grammaires $G$ et $G'$ sont faiblement équivalentes si $ cal(L)(G) = cal(L)(G') $
]

#item("Grammaire hors contexte")[
  Une grammaire hors contexte (aussi appelé grammaire sans contexte) est un quadruplet $(Sigma, V, R, S)$ où :
  - $Sigma$ est un alphabet fini dont les éléments sont appelés symboles terminaux.
  - $V$ est un alphabet fini disjoint de $Sigma$, ses éléments sont appelées symboles non terminaux ou variables.
  - $R$ est un ensemble fini de règles de production de la forme $X -> alpha$ où $X in V$ et $alpha in (V union Sigma)^*$.
  - $S$ est un élément de $V$ appelé symbole initial.
]

#item("Myhill-Nerode (relation de)")[
  Todo
]

#item("Mots inséparables")[
  Todo
]

#item("Résiduel")[
  Todo
]

#item("Code binaire")[
  Un code binaire sur l'alphabet $Sigma$ est une application injective $ f : Sigma -> {0, 1}^* without {epsilon} $
  Elle code un caractère par une suite finie non vide de $0$ et de $1$. On lui associe son extension $ tilde(f) : Sigma^* &->& {0,1}^* \ a_1 ... a_n &mapsto& f(a_1) ... f(a_n) $
]

#item("Code préfixe")[
  Code binaire $f$ sur $Sigma^*$ dont le code d'aucun caractère n'a pour préfixe le code d'un autre caractère : il n'existe pas de couple $(a, b) in Sigma^2$ tels que $ a != b "et" f(a) "préfixe de" f(b) $
  Il est dit sans préfixe sinon.

  #exemple[
    Le code binaire $f$ sur ${a, b, c,d}$ défini par $ f(a) = 00 \ f(b) = 01 \ f(c) = 10 \ f(d) = 11 $ est un code préfixe.
  ]
]

#item("Code uniquement déchiffrable")[
  Un code binaire est uniquement déchiffrable si son extension est injective. Il est ambigu sinon.

  #exemple[
    Le code binaire $f$ sur ${a,b}$ défini par $ f(a) = 0 "et" f(b) = 1 $ est uniquement déchiffrable.
  ]
]

#item("Code ambigu")[
  Un code binaire est ambigu s'il n'est pas uniquement déchiffrable : il existe deux mots différents donnant le même code.

  #exemple[
    Le code binaire $f$ sur ${a, b, c}$ défini par $ f(a) &= 1 \ f(b)  &= 0 \ f(c) &= 10 $ est ambigu. Notamment $ f(a b) = f(c) $
  ]
]

#item("Code à longueur fixe")[
  Un code binaire $f$ est à longueur fixe s'il existe $n in NN^*$ tel que $f$ soit à valeur dans ${0,1}^n$. \ Autrement dit tous les $f(a)$ ou $a in Sigma$ sont de même longueur. Il est dit à longueur variable sinon.
]

#item("Automate local")[
  Todo
]

#item("Automate produit")[
  Todo
]

#item("Compression sans perte")[
  Todo
]

#item("Glushkov (automate de)")[
  Todo
]

#item("Berry-Sethi (algorithme de)")[
  Todo
]