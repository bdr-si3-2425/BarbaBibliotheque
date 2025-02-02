CREATE VIEW MostBorrowedBooks AS
SELECT 
  b.region, 
  b.nom AS bibliotheque_nom, 
  e.ISBN, 
  e.titre, 
  COUNT(em.id_emprunt) AS borrow_count
FROM EMPRUNT em
JOIN 
  EDITION e ON em.id_edition = e.id
JOIN 
  BIBLIOTHEQUE b ON em.id_biblio = b.id_biblio
GROUP BY 
  b.region, 
  b.nom, 
  e.ISBN, 
  e.titre;

SELECT * FROM MostBorrowedBooks ORDER BY borrow_count DESC;