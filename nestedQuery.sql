SELECT 
  e.ISBN, 
  e.titre, 
  b.nom AS bibliotheque_nom
FROM 
  EDITION e
JOIN 
  BIBLIOTHEQUE b ON e.id_biblio = b.id_biblio
WHERE 
  e.disponibilite = 'disponible'
  AND e.id NOT IN (
    SELECT 
      em.id_edition
    FROM 
      EMPRUNT em
    WHERE 
      em.date_emprunt > CURRENT_DATE - INTERVAL '6 months'
  );