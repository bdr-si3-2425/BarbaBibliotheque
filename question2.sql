/*Comment gérer l’intégration d’une nouvelle bibliothèque au réseau et l’attribution de ses
ressources ?*/
/*
Ajoute une nouvelle bibliothèque à la base de données.
Enregistre les éditions disponibles et les événements qui y sont organisés.
*/

INSERT INTO BIBLIOTHEQUE (id_2, id_3, id, ville, adresse, code_postal, nom, capacite, note, nombre_ouvrage, id_4, id_5, id_6, date, description, cout)
VALUES ('new_id_2', 'new_id_3', 'new_id', 'new_ville', 'new_adresse', 'new_code_postal', 'new_nom', 'new_capacite', 'new_note', 'new_nombre_ouvrage', 'new_id_4', 'new_id_5', 'new_id_6', 'new_date', 'new_description', 'new_cout');

INSERT INTO EDITION (id_2, id, ISBN, titre, date_publi, format, nb_page, disponibilite, id_3, id_4, id_5, id_6, rang, id_7, id_8, id_9, id_10, date_emprunt, date_prevu, date_retour, etat_init, etat_retour, id_11)
VALUES ('new_id_2', 'new_id', 'new_ISBN', 'new_titre', 'new_date_publi', 'new_format', 'new_nb_page', 'disponible', 'new_id_3', 'new_id_4', 'new_id_5', 'new_id_6', 'new_rang', 'new_id_7', 'new_id_8', 'new_id_9', 'new_id_10', 'new_date_emprunt', 'new_date_prevu', 'new_date_retour', 'new_etat_init', 'new_etat_retour', 'new_id_11');

INSERT INTO ORGANISE (id_1, id_2, id_3, id_4)
VALUES ('new_id_1', 'new_id_2', 'new_id_3', 'new_id_4');