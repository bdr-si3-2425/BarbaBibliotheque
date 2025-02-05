/*
Associe chaque édition à la bibliothèque qui la possède en utilisant l'identifiant de bibliothèque (id_biblio).
Seules les éditions qui sont actuellement disponibles sont sélectionnées.
Cette condition exclut les livres qui ont été empruntés au moins une fois au cours des six derniers mois.
La sous-requête extrait l'identifiant des éditions (id_edition) des livres empruntés après la date actuelle moins six mois (CURRENT_DATE - INTERVAL '6 months').
La condition e.id NOT IN (...) s’assure que seuls les livres qui n’apparaissent pas dans cette liste sont sélectionnés.
*/

SELECT 
  e.ISBN, 
  e.titre, 
  b.nom AS bibliotheque_nom
FROM 
  EDITION e
JOIN POSSEDE p USING (id_edition)
JOIN BIBLIOTHEQUE b USING (id_biblio)
WHERE 
  e.disponibilite = 'Disponible'
  AND e.id_edition NOT IN (
    SELECT 
      em.id_edition
    FROM 
      EMPRUNT em
    WHERE 
      em.date_emprunt > CURRENT_DATE - INTERVAL '6 months'
  );