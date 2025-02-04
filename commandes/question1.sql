/*Quels ouvrages sont disponibles dans le réseau et peuvent être transférés à une bibliothèque
donnée pour un abonné spécifique ?*/

/*
Sélectionne les ouvrages disponibles dans d’autres bibliothèques que celle donné ie BIB011.
Vérifie qu’un abonné spécifique (ie AB017) existe avant de proposer un transfert.
*/


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