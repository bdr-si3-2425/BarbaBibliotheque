/*Quels ouvrages sont disponibles dans le réseau et peuvent être transférés à une bibliothèque
donnée pour un abonné spécifique ?*/
SELECT 
  e.ISBN, 
  e.titre, 
  e.format, 
  e.nb_page, 
  e.disponibilite, 
  b.nom AS bibliotheque_nom, 
  b.ville AS bibliotheque_ville
FROM 
  EDITION e
JOIN 
    POSSEDE p ON e.id_edition = p.id_edition
JOIN
    BIBLIOTHEQUE b ON p.id_biblio = b.id_biblio
WHERE 
  e.disponibilite = 'Disponible'
  AND b.id_biblio != 'BIB011'
  AND EXISTS (
    SELECT 1 
    FROM ABONNE a 
    WHERE a.id_abonne = 'AB017'
  );