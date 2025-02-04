/*
Crée une vue qui affiche les livres les plus empruntés par bibliothèque et région.
sql
*/

CREATE VIEW MostBorrowedBooks AS
SELECT 
  b.code_postal, 
  b.nom AS bibliotheque_nom, 
  e.ISBN, 
  e.titre, 
  COUNT(b.id_biblio) AS borrow_count
FROM EMPRUNT em
JOIN EDITION e USING (id_edition)
JOIN POSSEDE p USING (id_edition)
JOIN BIBLIOTHEQUE b USING (id_biblio)
GROUP BY 
  b.code_postal, 
  b.nom, 
  e.ISBN, 
  e.titre;

/*
Sélectionne les résultats en classant les livres les plus empruntés.
*/
SELECT * FROM MostBorrowedBooks ORDER BY borrow_count DESC;