/*Quels événements sont programmés dans une bibliothèque et quels abonnés ont déjà
participé à des événements similaires ?*/
/*
Calcule la durée moyenne des transferts en soustrayant la date de début (date_debut) de la date de fin (date_fin).
On regroupe les données par ISBN et titre du livre afin de compter les transferts et calculer la durée moyenne par ouvrage.
Tri par nombre de transferts décroissant : Les ouvrages les plus fréquemment transférés apparaîtront en premier.
*/
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