/*Comment optimiser les transferts d’ouvrages pour minimiser les coûts logistiques ?*/
SELECT 
  t.id_biblio_from, 
  t.id_biblio_to, 
  COUNT(*) AS total_transfers, 
  AVG(t.cout) AS avg_cost
FROM 
  TRANSFERT t
GROUP BY 
  t.id_biblio_from, 
  t.id_biblio_to
ORDER BY 
  total_transfers DESC, 
  avg_cost ASC;