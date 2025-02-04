/*Quels ouvrages sont fréquemment transférés entre bibliothèques et quels délais sont associés ?*/
/*
Analyse la fréquence des transferts d’ouvrages entre bibliothèques.
Calcule la durée moyenne des transferts.
Trie par nombre de transferts décroissant.
*/SELECT 
  e.ISBN, 
  e.titre, 
  COUNT(*) AS transfer_count, 
  ROUND(AVG(t.date_fin - t.date_debut)) AS moyenne_retard_jours
FROM 
  TRANSFERT t
JOIN 
  EDITION e ON t.id_edition = e.id_edition
GROUP BY 
  e.ISBN, 
  e.titre
ORDER BY 
  transfer_count DESC;