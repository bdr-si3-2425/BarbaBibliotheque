SELECT 
  e.ISBN, 
  e.titre, 
  COUNT(*) AS transfer_count, 
  AVG(DATEDIFF(t.date_arrivee, t.date_depart)) AS moyenne_retard_jours
FROM 
  TRANSFERT t
JOIN 
  EDITION e ON t.id_edition = e.id
GROUP BY 
  e.ISBN, 
  e.titre
ORDER BY 
  transfer_count DESC;