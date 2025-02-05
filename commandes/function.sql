--fonction qui calcule le nombre total de livre emprunté par un abonné
CREATE OR REPLACE FUNCTION total_books_borrowed(p_id_abonne VARCHAR(42))
RETURNS INT AS $$
DECLARE
  total_borrowed INT;
BEGIN
  -- Calculate the total number of books borrowed by the subscriber
  SELECT COUNT(*)
  INTO total_borrowed
  FROM EMPRUNT
  WHERE id_abonne = p_id_abonne;

  -- Return the total number of books borrowed
  RETURN total_borrowed;
END;
$$ LANGUAGE plpgsql;

-- Verify the function's existence
SELECT proname
FROM pg_proc
WHERE proname = 'total_books_borrowed';