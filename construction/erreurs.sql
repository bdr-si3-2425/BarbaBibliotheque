INSERT INTO BLACKLIST (id_abonne, date_deb, date_fin) VALUES ('AB010', '2025-03-01', '2025-06-01'),  -- Starts in the future

INSERT INTO POSSEDE (id_edition, id_biblio, quantite) VALUES('EDT8', 'BIB002', '-5'), -- Multiple libraries own this edition

INSERT INTO TRANSFERT (id_biblio_source, id_biblio_dest, id_edition, date_debut, date_fin, description, cout) VALUES('BIB007', 'BIB018', 'EDT2', '2024-04-01', '2024-04-15', 'Transfert dessai philosophique', '85'); --end date before start date: edge case problem

INSERT INTO ABONNE(id_abonne, nom, prenom, email, date_naissance, lieu_naissance, region) VALUES
('AB017', 'Dupuis', 'Emma', 'emma.dupuis@hotmail.com', '1994-05-20', 'Toulon', 'Provence-Alpes-Côte d''Azur'), --l'apostrophe dans l'Azur est échappé par un autre apostrophe

INSERT INTO BIBLIOTHEQUE (id_biblio, ville, adresse, code_postal, nom, capacite) VALUES
('BIB003', 'Marseille', '789 Rue de Marseille', '13001', 'Bibliothèque de l''Alcazar', '30000'), --l'apostrophe dans l'Alcazar est échappé par un autre apostrophe

INSERT INTO BLACKLIST (id_abonne, date_deb, date_fin) VALUES
('AB010', '2025-03-01', '2025-06-01'),  -- Starts in the future

INSERT INTO BLACKLIST (id_abonne, date_deb, date_fin) VALUES
('AB025', '2025-04-15', '2025-07-15'),  -- Starts in the future

INSERT INTO SOUSCRIT (id_abonne, id_biblio, debut_abonnement, fin_abonnement, souscription) VALUES
('AB002', 'BIB004', '2025-02-01', '2025-08-01', 'Semestriel'),  -- Future subscription
('AB010', 'BIB006', '2025-03-01', '2025-09-01', 'Semestriel'),  -- Future subscription
('AB015', 'BIB008', '2025-04-01', '2025-10-01', 'Semestriel'),  -- Future subscription
('AB020', 'BIB010', '2025-05-01', '2026-05-01', 'Annuel'),  -- Future subscription
('AB025', 'BIB012', '2025-06-01', '2026-06-01', 'Annuel'); -- Future subscription

INSERT INTO TRANSFERT (id_biblio_source, id_biblio_dest, id_edition, date_debut, date_fin, description, cout) VALUES
('BIB015', 'BIB016', 'EDT9', '2025-01-01', '2025-01-15', 'Transfert de biographie', '-10'), -- Negative cost
('BIB019', 'BIB014', 'EDT1', '2024-03-01', '2024-03-15', 'Transfert de roman classique', '-20'), -- Negative cost
('BIB007', 'BIB018', 'EDT2', '2024-04-01', '2024-04-15', 'Transfert dessai philosophique', '85'); --end date before start date: edge case problem

INSERT INTO EMPRUNT (id_edition, id_abonne, date_emprunt, date_prevu, date_retour, etat_init, etat_retour) VALUES
 ('EDT10', 'AB001', '2025-01-15', '2025-02-15', NULL, 'Bon état', NULL),
 ('EDT10', 'AB001', '2025-02-01', '2025-02-13', '2025-02-02', 'Bon état', 'Bon état') -- Borrow and already borrowed book
