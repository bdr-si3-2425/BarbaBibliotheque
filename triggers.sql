/*
Crée une table pour enregistrer l’historique des emprunts.
Stocke l’action effectuée (BORROW ou RETURN) et la date de l’action.
*/

CREATE TABLE EmpruntHistory (
  id SERIAL PRIMARY KEY,
  id_emprunt VARCHAR(42),
  id_abonne VARCHAR(42),
  id_edition VARCHAR(42),
  id_biblio VARCHAR(42),
  date_emprunt DATE,
  date_retour DATE,
  action VARCHAR(10),
  action_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

/*
Déclare une fonction déclenchée (trigger) qui enregistre chaque nouvel emprunt ou retour.
*/

CREATE FUNCTION log_emprunt_history() RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'INSERT' THEN
    INSERT INTO EmpruntHistory (id_emprunt, id_abonne, id_edition, id_biblio, date_emprunt, action)
    VALUES (NEW.id_emprunt, NEW.id_abonne, NEW.id_edition, NEW.id_biblio, NEW.date_emprunt, 'BORROW');
  ELSIF TG_OP = 'UPDATE' THEN
    INSERT INTO EmpruntHistory (id_emprunt, id_abonne, id_edition, id_biblio, date_retour, action)
    VALUES (NEW.id_emprunt, NEW.id_abonne, NEW.id_edition, NEW.id_biblio, NEW.date_retour, 'RETURN');
  END IF;
  RETURN NEW;
EXCEPTION
WHEN OTHERS THEN
  RAISE NOTICE 'Error logging emprunt history: %', SQLERRM;
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

/*
Active le trigger après chaque ajout ou modification d’un emprunt.
*/

CREATE TRIGGER emprunt_history_trigger
AFTER INSERT OR UPDATE ON EMPRUNT
FOR EACH ROW
EXECUTE FUNCTION log_emprunt_history();