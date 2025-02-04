/*Quels abonnés n'ont pas respecté leur délai, et combien de fois ?*/


/*
Sélectionne les abonnés ayant retourné leurs livres après la date prévue.
Compte le nombre d’infractions par abonné.
Trie les résultats par nombre d’infractions décroissant.
*/
SELECT
    abonne.id,
    abonne.nom,
    abonne.prenom,
    COUNT(EMPRUNT.id) AS nb_infractions
FROM EMPRUNT
JOIN ABONNE ON EMPRUNT.id_abonne = ABONNE.id_abonne
WHERE EMPRUNT.date_retour > EMPRUNT.date_prevu
GROUP BY abonne.id, abonne.nom, abonne.prenom
ORDER BY nb_infractions DESC;
