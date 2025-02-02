INSERT INTO EMPRUNT (id_edition, id_abonne, date_emprunt, date_prevu, date_retour, etat_init, etat_retour)
VALUES 
('EDT1', 'AB001', '2025-01-01', '2025-02-01', '2025-01-20', 'Bon état', 'Bon état'), -- Example 1: Regular borrowing
('EDT2', 'AB002', '2025-02-01', '2025-03-01', NULL, 'Neuf', NULL), -- Example 2: Book borrowed and not yet returned
('EDT3', 'AB003', '2025-01-10', '2025-02-10', '2025-02-05', 'Bon état', 'Bon état'),
('EDT3', 'AB004', '2025-02-20', '2025-03-20', NULL, 'Bon état', NULL), -- Example 3: Multiple borrowings by different users
('EDT4', 'AB005', '2025-03-01', '2025-04-01', NULL, 'Neuf', NULL),-- Example 4: Future borrowings
('EDT6', 'AB007', '2025-01-20', '2025-02-20', '2025-02-15', 'Neuf', 'Abîmé'), -- Example 6: Damaged book return
('EDT7', 'AB008', '2025-02-05', '2025-02-10', '2025-02-08', 'Bon état', 'Bon état'), -- Example 7: Short borrow duration
('EDT8', 'AB009', '2025-01-01', '2025-06-01', '2025-05-25', 'Neuf', 'Bon état'), -- Example 8: Long borrow duration
('EDT9', 'AB010', '2025-01-15', '2025-02-15', '2025-02-05', 'Ancien', 'Ancien'),-- Example 9: Borrowing of a very old edition
('EDT10', 'AB001', '2025-02-15', '2025-03-15', NULL, 'Bon état', NULL),
('EDT1', 'AB001', '2025-03-20', '2025-04-20', NULL, 'Neuf', NULL),-- Example 10: Same user borrowing different books
('EDT2', 'AB002', '2025-01-01', '2025-01-31', '2025-02-10', 'Neuf', 'Bon état'),-- Example 11: Book returned late
('EDT3', 'AB003', '2025-03-01', '2025-04-01', '2025-03-10', 'Bon état', 'Bon état'),-- Example 12: Book returned early
('EDT4', 'AB004', '2025-12-24', '2026-01-24', NULL, 'Neuf', NULL),-- Example 13: Borrowing during holidays
('EDT5', 'AB005', '2025-01-10', '2025-02-10', NULL, 'Bon état', NULL),
('EDT6', 'AB005', '2025-01-10', '2025-02-10', NULL, 'Neuf', NULL),-- Example 14: Borrowing multiple books at the same time
('EDT7', 'AB006', '2025-01-01', '2025-01-31', '2025-01-25', 'Bon état', 'Bon état'),
('EDT7', 'AB007', '2025-02-01', '2025-03-01', NULL, 'Bon état', NULL);-- Example 15: Book borrowed by multiple users sequentially

