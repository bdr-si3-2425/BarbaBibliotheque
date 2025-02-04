/*Quels ouvrages ou collections sont les plus populaires selon les abonnés d’une région
spécifique ?*/
SELECT e.ISBN, e.titre, emprunt_count
FROM EDITION e
JOIN (
    SELECT em.id_edition, COUNT(*) AS emprunt_count
    FROM EMPRUNT em
    JOIN ABONNE a USING (id_abonne)
    WHERE a.region LIKE 'Bretagne'
    GROUP BY em.id_edition
) subquery ON e.id_edition = subquery.id_edition
ORDER BY emprunt_count DESC;
