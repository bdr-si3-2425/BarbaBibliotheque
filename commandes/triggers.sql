-- Drop the existing EmpruntHistory table
DROP TABLE IF EXISTS EmpruntHistory;

-- Create the new EmpruntHistory table
CREATE TABLE EmpruntHistory (
  id SERIAL PRIMARY KEY,
  id_abonne VARCHAR(42),
  id_edition VARCHAR(42),
  action VARCHAR(10),
  action_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create or replace the log_emprunt_history function
CREATE OR REPLACE FUNCTION log_emprunt_history() RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'INSERT' THEN
    INSERT INTO EmpruntHistory (id_emprunt, id_abonne, id_edition, action)
    VALUES (NEW.id_abonne, NEW.id_edition, 'BORROW');
  ELSIF TG_OP = 'UPDATE' THEN
    INSERT INTO EmpruntHistory (id_emprunt, id_abonne, id_edition, action)
    VALUES (NEW.id_abonne, NEW.id_edition, 'RETURN');
  END IF;
  RETURN NEW;
EXCEPTION
  WHEN OTHERS THEN
    RAISE NOTICE 'Error logging emprunt history: %', SQLERRM;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- Drop the existing trigger if it exists
DROP TRIGGER IF EXISTS emprunt_history_trigger ON EMPRUNT;

-- Create the trigger
CREATE TRIGGER emprunt_history_trigger
AFTER INSERT OR UPDATE ON EMPRUNT
FOR EACH ROW
EXECUTE FUNCTION log_emprunt_history();

-- Insert a new recird into EMPRUNT
INSERT INTO EMPRUNT (id_edition, id_abonne, date_emprunt, date_prevu, etat_init)
 VALUES ('EDT1', 'AB038', '2023-01-01' , '2023-01-18', 'neuf');

-- Update the record in Emprunt
UPDATE EMPRUNT 
SET date_retour = '2023-01-15', etat_retour = 'Bon état' 
WHERE id_edition = 'EDT1' AND id_abonne = 'AB038';

-- Verify the results
SELECT * FROM EmpruntHistory;