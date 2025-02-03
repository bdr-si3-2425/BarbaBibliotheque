SELECT 
  e.ISBN, 
  e.titre, 
  b.nom AS bibliotheque_nom
FROM 
  EDITION e
JOIN POSSEDE p USING (id_edition)
JOIN BIBLIOTHEQUE b USING (id_biblio)
WHERE 
  e.disponibilite = 'disponible'
  AND e.id_edition NOT IN (
    SELECT 
      em.id_edition
    FROM 
      EMPRUNT em
    WHERE 
      em.date_emprunt > CURRENT_DATE - INTERVAL '6 months'
  );