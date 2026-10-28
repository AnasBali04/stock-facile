Q1.6. Tester les contraintes SQLite

a) Prix négatif

La requête est rejetée par la contrainte CHECK (prix >= 0), car le prix ne peut pas être négatif.

Message attendu : CHECK constraint failed: prix >= 0.

b) Catégorie inexistante

Si les clés étrangères sont activées, la requête est rejetée, car la catégorie d'identifiant 99 n'existe pas dans la table categories.

Message attendu : FOREIGN KEY constraint failed.

c) Suppression d'une catégorie contenant des produits

La requête est rejetée par la contrainte ON DELETE RESTRICT, car des produits font référence à la catégorie d'identifiant 1.

Message attendu : FOREIGN KEY constraint failed.

Conclusion : les contraintes CHECK et ON DELETE RESTRICT, ainsi que les clés étrangères, permettent de préserver la cohérence et l'intégrité des données.

Q1.7. Que contient le fichier schema.sql ?

Le fichier schema.sql contient les instructions SQL permettant de recréer la structure de la base de données SQLite. Il définit les tables produits et categories, leurs colonnes, leurs types de données, leurs clés primaires, leurs clés étrangères et leurs contraintes d'intégrité.

Comme l'option « Exporter uniquement le schéma » a été sélectionnée, le fichier contient uniquement la définition de la structure de la base de données, sans les données enregistrées dans les tables.

Ce fichier permet donc de reproduire la structure de la base de données sur un autre ordinateur sans avoir à recréer manuellement les tables.