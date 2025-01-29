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
  AND b.id_2 != 'id_biblio'
  AND EXISTS (
    SELECT 1 
    FROM ABONNE a 
    WHERE a.id = 'id_abbone'
  );