INSERT INTO BLACKLIST (id_abonne, date_deb, date_fin) VALUES ('AB010', '2025-03-01', '2025-06-01'),  -- Starts in the future

INSERT INTO POSSEDE (id_edition, id_biblio, quantite) VALUES('EDT8', 'BIB002', '-5'), -- Multiple libraries own this edition

INSERT INTO TRANSFERT (id_biblio_source, id_biblio_dest, id_edition, date_debut, date_fin, description, cout) VALUES('BIB007', 'BIB018', 'EDT2', '2024-04-01', '2024-04-15', 'Transfert dessai philosophique', '85'); --end date before start date: edge case problem