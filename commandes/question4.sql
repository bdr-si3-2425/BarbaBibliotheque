/*Quels abonnés n'ont pas respecté leur délai, et combien de fois ?*/
/*
Sélectionne les abonnés ayant retourné leurs livres après la date prévue.
Compte le nombre d’infractions par abonné.
Trie les résultats par nombre d’infractions décroissant.
*/
SELECT
    a.id_abonne,
    a.nom,
    a.prenom,
    COUNT(e.id_edition) AS nb_infractions
FROM EMPRUNT e
JOIN ABONNE a ON e.id_abonne = a.id_abonne
WHERE e.date_retour > e.date_prevu
GROUP BY a.id_abonne, a.nom, a.prenom
ORDER BY nb_infractions DESC;