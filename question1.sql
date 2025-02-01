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
  BIBLIOTHEQUE b ON e.id_2 = b.id_2
WHERE 
  e.disponibilite = 'disponible'
  AND b.id_2 != 'Bibliothèque Louis Nucéra'
  AND EXISTS (
    SELECT 1 
    FROM ABONNE a 
    WHERE a.id = '5'
    
  );