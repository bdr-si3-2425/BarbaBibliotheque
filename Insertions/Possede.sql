INSERT INTO POSSEDE (id_edition, id_biblio, quantite) VALUES
('EDT1', 'BIB001', '5'),
('EDT1', 'BIB002', '3'),
('EDT2', 'BIB003', '2'),
('EDT3', 'BIB004', '4'),
('EDT3', 'BIB005', '1'),
('EDT4', 'BIB006', '6'),
('EDT5', 'BIB007', '3'),
('EDT5', 'BIB008', '4'),
('EDT6', 'BIB009', '2'),
('EDT7', 'BIB010', '3'),
('EDT8', 'BIB001', '5'),
('EDT8', 'BIB011', '3'),
('EDT9', 'BIB012', '2'),
('EDT10', 'BIB013', '4'),
('EDT1', 'BIB020', '1'), -- Multiple libraries own this edition
('EDT3', 'BIB010', '2'), -- Multiple libraries own this edition
('EDT6', 'BIB001', '4'), -- Multiple libraries own this edition
('EDT8', 'BIB002', '-5'), -- Multiple libraries own this edition
('EDT9', 'BIB003', '2'); -- Multiple libraries own this edition
