/*Comment optimiser les transferts d’ouvrages pour minimiser les coûts logistiques ?*/
SELECT 
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