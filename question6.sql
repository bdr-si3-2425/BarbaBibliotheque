SELECT e.ISBN, e.titre, COUNT(*) AS emprunt_count
FROM EDITION e
JOIN EMPRUNT em ON e.id = em.id_edition
JOIN ABONNE a ON em.id_abonne = a.id
WHERE a.region = "alpes-maritimes"
GROUP BY e.ISBN, e.titre
ORDER BY emprunt_count DESC;