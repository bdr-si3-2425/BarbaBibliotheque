INSERT INTO TRANSFERT (id_biblio_source, id_biblio_dest, id_edition, start_date, end_date, description, cout) VALUES
('BIB001', 'BIB002', 'EDT1', '2024-05-01', '2024-05-15', 'Transfert de roman classique', '50'),
('BIB003', 'BIB004', 'EDT2', '2024-06-15', '2024-06-30', 'Transfert dessai philosophique', '30'),
('BIB005', 'BIB006', 'EDT3', '2024-07-20', '2024-07-30', 'Transfert de théâtre classique', '40'),
('BIB007', 'BIB008', 'EDT4', '2024-08-25', '2024-09-05', 'Transfert de nouvelles', '35'),
('BIB009', 'BIB010', 'EDT5', '2024-09-30', '2024-10-10', 'Transfert de roman historique', '45'),
('BIB002', 'BIB001', 'EDT6', '2024-10-05', '2024-10-20', 'Transfert de poésie', '25'),
('BIB011', 'BIB012', 'EDT7', '2024-11-10', '2024-11-25', 'Transfert de thriller', '20'),
('BIB013', 'BIB014', 'EDT8', '2024-12-15', '2024-12-30', 'Transfert de manuel philosophique', '60'),
('BIB015', 'BIB016', 'EDT9', '2025-01-01', '2025-01-15', 'Transfert de biographie', '-10'), -- Negative cost
('BIB017', 'BIB018', 'EDT10', '2025-02-01', '2025-02-15', 'Transfert de roman de science-fiction', '70'),
('BIB001', 'BIB019', 'EDT1', '2025-03-01', '2025-03-15', 'Transfert de roman classique', '100'),
('BIB002', 'BIB020', 'EDT1', '2025-04-01', '2025-04-15', 'Transfert dessai philosophique', '80'),
('BIB005', 'BIB007', 'EDT1', '2023-05-01', '2023-05-15', 'Transfert de roman classique', '90'), -- Multiple editions to the same library
('BIB005', 'BIB007', 'EDT3', '2023-06-01', '2023-06-15', 'Transfert de théâtre classique', '110'), -- Multiple editions to the same library
('BIB006', 'BIB010', 'EDT2', '2023-07-01', '2023-07-15', 'Transfert dessai philosophique', '75'),
('BIB008', 'BIB014', 'EDT4', '2023-08-01', '2023-08-15', 'Transfert de nouvelles', '65'),
('BIB012', 'BIB009', 'EDT5', '2023-09-01', '2023-09-15', 'Transfert de roman historique', '55'),
('BIB014', 'BIB018', 'EDT6', '2023-10-01', '2023-10-15', 'Transfert de poésie', '95'), 
('BIB016', 'BIB013', 'EDT7', '2023-11-01', '2023-11-15', 'Transfert de thriller', '85'),
('BIB018', 'BIB011', 'EDT8', '2023-12-01', '2023-12-15', 'Transfert de manuel philosophique', '105'), -- Future dates
('BIB020', 'BIB015', 'EDT9', '2024-01-01', '2024-01-15', 'Transfert de biographie', '115'), 
('BIB001', 'BIB012', 'EDT10', '2024-02-01', '2024-02-15', 'Transfert de roman de science-fiction', '95'), 
('BIB019', 'BIB014', 'EDT1', '2024-03-01', '2024-03-15', 'Transfert de roman classique', '-20'), -- Negative cost
('BIB007', 'BIB018', 'EDT2', '2024-04-01', '2023-04-15', 'Transfert dessai philosophique', '85'); --end date before start date: edge case problem

