Q1.3. Structure de la base de données SQLite

1- Comment SQLite stocke-t-il disponible et date_ajout ?

pour disponible: SQLite ne possede pas de type BOOLEAN. on utilise un entier pour representer une valeur booleenne : 0 signifie FALSE et 1 signifie TRUE.

pour date_ajout : SQLite ne possede pas de type DATETIME. La date et l'heure sont stockées sous forme de texte au format.

2- Quel est le rôle de AUTOINCREMENT, UNIQUE et CHECK (prix >= 0) ?

pour AUTOINCREMENT : permet SQLite de generer automatiquement un nouvel identifiant entier pour chaque ligne inseree, sans reutiliser les identifiants precedemment attribues par cette table.

pour UNIQUE sur nom : interdit d'avoir deux lignes avec la meme valeur de nom, ce qui garantit l'unicité des noms.

pour CHECK (prix >= 0) : impose que le prix soit > ou = zéro. Une valeur négative est donc refusée lors de l'insertion ou de la modification.

3- Que signifie ON DELETE RESTRICT ?

ON DELETE RESTRICT empêche la suppression d'un enregistrement lorsqu'il est encore référencé par d'autres enregistrements via une clé étrangère.

Q1.4. Pourquoi écrit-on `'Huile d''olive'` avec deux apostrophes ?

En SQL, une apostrophe (`'`) sert à délimiter une chaîne de caractères. Pour insérer une apostrophe à l'intérieur d'une chaîne, il faut la doubler (`''`).

Ainsi, `'Huile d''olive'` représente le texte **Huile d'olive**.

La première apostrophe ouvre la chaîne, les deux apostrophes au milieu représentent une apostrophe littérale et la dernière apostrophe ferme la chaîne.

Cette syntaxe permet à SQLite d'interpréter correctement le texte sans confondre l'apostrophe du mot avec la fin de la chaîne de caractères.

 Q1.6. Tester les contraintes SQLite

**a Prix négatif**

La requête est rejetée par la contrainte `CHECK (prix >= 0)`, car le prix ne peut pas être négatif.

Message attendu : `CHECK constraint failed: prix >= 0`.

**b Catégorie inexistante**

Si les clés étrangères sont activées, la requête est rejetée, car la catégorie d'identifiant `99` n'existe pas dans la table `categories`.

Message attendu : `FOREIGN KEY constraint failed`.

**c Suppression d'une catégorie contenant des produits**

La requête est rejetée par la contrainte `ON DELETE RESTRICT`, car des produits font référence à la catégorie d'identifiant `1`.

Message attendu : `FOREIGN KEY constraint failed`.

**Conclusion :** les contraintes `CHECK` et `ON DELETE RESTRICT`, ainsi que les clés étrangères, permettent de préserver la cohérence et l'intégrité des données.

 Q1.8. Pourquoi est-il important de fermer la base de données avant qu'un autre programme y accède ?

Il est important de fermer la base de données dans DB Browser for SQLite avant qu'une autre application écrive dans le même fichier, afin d'éviter les conflits d'accès et les problèmes de verrouillage (*database is locked*).

Lorsque plusieurs programmes accèdent simultanément à une base de données, ils peuvent entrer en concurrence pour effectuer des opérations d'écriture. Cela peut empêcher certaines modifications, provoquer des erreurs ou entraîner des incohérences si les accès sont mal gérés.

Fermer la base dans DB Browser libère les ressources et les verrous associés à cette connexion. L'application peut alors accéder plus facilement au fichier et effectuer ses opérations.

Il faut également noter que SQLite permet plusieurs accès simultanés dans certaines conditions, mais qu'il ne permet généralement qu'une seule transaction d'écriture à la fois.