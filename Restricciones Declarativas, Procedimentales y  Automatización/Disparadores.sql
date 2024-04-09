CREATE OR REPLACE TRIGGER TG_Peliculas_idPelicula
BEFORE INSERT ON Peliculas
FOR EACH ROW
DECLARE
    maximo VARCHAR2(20);
BEGIN
    SELECT MAX(SUBSTR(id, 2)) INTO maximo FROM Peliculas;
    IF maximo IS NULL THEN
        maximo := 'P0000000000000000000';
    ELSE
        maximo := 'P' || TO_CHAR(TO_NUMBER(maximo) + 1);
    END IF;
    :NEW.id := maximo;
END;