#import "../template.typ": *

#item("Basse de données")[
  Todo
]

#item("Système de Gestion de Bases de Données")[
  Todo
]

#item("Atomicité (base de données)")[
  Garantie que chaque opération s'exécute entièrement ou pas du tout. C'est important dans le cas d'une panne.
]

#item("Cohérence (base de données)")[
  Garantie que toutes les copies ou instances d'une base de donnée sont exactes et à jour.
]

#item("Isolation (base de données)")[
  Garantie dans le cas où le système de gestion interagit avec plusieurs clients, que lorsque plusieurs requêtes sont traitées simultanément tout doit se passer comme si elles avaient été traitées successivement.
]

#item("Durabilité (base de données)")[
  Garantie qu'une requête, une fois exécutée, soit stockée de manière permanente.
]

#item("Clé primaire")[
  Dans une table d'une base de données, clé permettant d'identifier de manière unique une ligne.
]

#item("Clé étrangère")[
  Dans une table d'une base de données, clé permettant de référencer la clé primaire d'une autre table. Cela permet de relier différentes tables.
]

#item("Attribut")[
  Todo
]

#item("Table")[
  Dans une base de données relationnelles, il s'agit d'un tableau constitué de colonnes et lignes. Une colonne rassemble des valeurs du même type, tandis qu'une ligne est une suite de valeurs caractérisant un enregistrement.
]

#item("SQL")[
  Langage informatique permettant d'exploiter des bases de données relationnelles. Ce sigle correspond à _Structured Query Language_.
]

#item("Jointure")[
  Todo
]

#item("Requête (base de données)", related: ("SQL"))[
  Réaliser une requête sur une base de données désigne le fait de l'interroger (souvent au travers du langage SQL) pour utiliser ensuite son résultat.

  #exemple[
    Voici un exemple de requête SQL.

    ```SQL
    SELECT nom, code FROM departements;
    ```

    Dont le résultat serait de la forme

    #table(
      columns: (1fr, 1fr),
      [*nom*], [*code*],
      [Finistère], [29],
      [Paris], [75],
      [Rhône], [69]
    )
  ]
]

#item("Association")[
  Todo
]