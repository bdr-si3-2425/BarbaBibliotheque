/*Comment gérer l’intégration d’une nouvelle bibliothèque au réseau et l’attribution de ses
ressources ?*/
INSERT INTO BIBLIOTHEQUE (id_biblio, ville, adresse, code_postal, nom, capacite) VALUES
('BIB021', 'Biot', '123 Rue de la plage', '75001', 'Bibliothèque Municipale de Biot', '3000');

INSERT INTO EDITION (id_edition, ISBN, titre, date_publi, format, nb_page, disponibilite, id_oeuvre, id_editeur) VALUES
('EDT11', '978-2-07-036822-2', 'Les Misérables', '1862-04-03', 'Virtuel', 1488, 'Disponible', 'O1', 'ED1');

INSERT INTO POSSEDE (id_edition, id_biblio, quantite) VALUES
('EDT11', 'BIB021', '5');