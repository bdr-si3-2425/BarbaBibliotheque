/*Quels ouvrages ou collections sont les plus populaires selon les abonnés d’une région
spécifique ?*/

/*
Sélectionne les ouvrages les plus empruntés dans la région Alpes-Maritimes.
Associe les emprunts avec les abonnés pour filtrer ceux de cette région.
Groupe les résultats par ISBN et titre et les classe par nombre d'emprunts décroissant
*/
SELECT e.ISBN, e.titre, COUNT(*) AS emprunt_count
FROM EDITION e
JOIN EMPRUNT em ON e.id = em.id_edition
JOIN ABONNE a ON em.id_abonne = a.id
WHERE a.region = "alpes-maritimes"
GROUP BY e.ISBN, e.titre
ORDER BY emprunt_count DESC;