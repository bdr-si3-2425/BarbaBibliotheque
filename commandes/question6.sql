/*Quels ouvrages ou collections sont les plus populaires selon les abonnés d’une région
spécifique ?*/
SELECT e.ISBN, e.titre, COUNT(*) AS emprunt_count
FROM EDITION e
JOIN EMPRUNT em USING (id_edition)
JOIN ABONNE a USING (id_abonne)
WHERE a.region LIKE 'Occitanie'
GROUP BY e.ISBN, e.titre
ORDER BY emprunt_count DESC;