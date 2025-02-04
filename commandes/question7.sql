/*Comment optimiser les transferts d’ouvrages pour minimiser les coûts logistiques ?*/
/*
Analyse les transferts d’ouvrages entre bibliothèques.
Compte le nombre total de transferts et calcule le coût moyen de chaque itinéraire.
Trie par nombre de transferts décroissant et par coût moyen croissant pour optimiser les trajets.
*/SELECT 
  t.id_biblio_source,
  t.id_biblio_dest,
  COUNT(*) AS total_transfers, 
  AVG(t.cout) AS avg_cost
FROM 
  TRANSFERT t
GROUP BY 
  t.id_biblio_source,
  t.id_biblio_dest
ORDER BY 
  total_transfers DESC, 
  avg_cost ASC;