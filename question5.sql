/*Quels événements sont programmés dans une bibliothèque et quels abonnés ont déjà
participé à des événements similaires ?*/
SELECT 
  e.ISBN, 
  e.titre, 
  COUNT(*) AS transfer_count, 
  AVG(t.date_fin- t.date_debut) AS moyenne_temps_transfer
FROM 
  TRANSFERT t
JOIN 
  EDITION e USING (id_edition)
GROUP BY 
  e.ISBN, 
  e.titre
ORDER BY 
  transfer_count DESC;