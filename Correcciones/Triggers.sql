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
/

CREATE OR REPLACE TRIGGER TG_Series_idSeries
BEFORE INSERT ON Series
FOR EACH ROW
DECLARE
    maximo VARCHAR2(20);
BEGIN
    SELECT MAX(SUBSTR(id, 2)) INTO maximo FROM Series;
    IF maximo IS NULL THEN
        maximo := 'S0000000000000000000';
    ELSE
        maximo := 'S' || TO_CHAR(TO_NUMBER(maximo) + 1);
    END IF;
    :NEW.id := maximo;
END;
/

CREATE OR REPLACE TRIGGER TG_ContenidoAdicional_idContenido
BEFORE INSERT ON ContenidoAdicional
FOR EACH ROW
DECLARE
    maximo VARCHAR2(20);
BEGIN
    SELECT MAX(SUBSTR(idContenido, 2)) INTO maximo FROM ContenidoAdicional;
    IF maximo IS NULL THEN
        maximo := 'A0000000000000000000';
    ELSE
        maximo := 'A' || TO_CHAR(TO_NUMBER(maximo) + 1);
    END IF;
    :NEW.idContenido := maximo;
END;
/

CREATE OR REPLACE TRIGGER TG_Bibliotecas_idBiblioteca
BEFORE INSERT ON Bibliotecas
FOR EACH ROW
DECLARE
    maximo VARCHAR2(20);
BEGIN
    SELECT MAX(SUBSTR(idBiblioteca, 2)) INTO maximo FROM Bibliotecas;
    IF maximo IS NULL THEN
        maximo := 'B0000000000000000000';
    ELSE
        maximo := 'B' || TO_CHAR(TO_NUMBER(maximo) + 1);
    END IF;
    :NEW.idBiblioteca := maximo;
END;
/

CREATE OR REPLACE TRIGGER TG_Cuentas_id
BEFORE INSERT ON Cuentas
FOR EACH ROW
DECLARE
    maximo VARCHAR2(20);
BEGIN
    SELECT MAX(SUBSTR(id, 2)) INTO maximo FROM Cuentas;
    IF maximo IS NULL THEN
        maximo := 'C0000000000000000000';
    ELSE
        maximo := 'C' || TO_CHAR(TO_NUMBER(maximo) + 1);
    END IF;
    :NEW.id := maximo;
END;
/

-- Automatizacion fechas
CREATE OR REPLACE TRIGGER TG_Compras_Pelicula_fechaCompra
BEFORE INSERT ON Compras
FOR EACH ROW
DECLARE
    cantidad NUMBER;
BEGIN
    SELECT COUNT(idPelicula) INTO cantidad FROM Compras WHERE :NEW.idCuenta = idCuenta AND :NEW.idPelicula = idPelicula;
    IF cantidad < 1 THEN :NEW.fechaCompra := SYSDATE;
    ELSE RAISE_APPLICATION_ERROR(-20002, 'Esta pelicula ya se encuentra en su catalogo.');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TG_Compras_Serie_fechaCompra
BEFORE INSERT ON Compras
FOR EACH ROW
DECLARE
    cantidad NUMBER;
BEGIN
    SELECT COUNT(idSerie) INTO cantidad FROM Compras WHERE :NEW.idCuenta = idCuenta AND :NEW.idSerie = idSerie;
    IF cantidad < 1 THEN :NEW.fechaCompra := SYSDATE;
    ELSE RAISE_APPLICATION_ERROR(-20002, 'Esta serie ya se encuentra en su catalogo.');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TG_Rentas_fechaRenta_idSerie_fechaExpiracion
BEFORE INSERT ON Rentas
FOR EACH ROW
DECLARE
    cantidad NUMBER;
    fecha DATE;
BEGIN
    SELECT COUNT(idSerie) INTO cantidad FROM Rentas WHERE :NEW.idCuenta = idCuenta AND :NEW.idSerie = idSerie;
    SELECT fechaExpiracion INTO fecha FROM (SELECT * FROM Rentas WHERE :NEW.idCuenta = idCuenta AND :NEW.idSerie = idSerie ORDER BY fechaExpiracion DESC) WHERE ROWNUM = 1;
    IF cantidad < 1 AND fecha < SYSDATE THEN
        :NEW.fechaRenta := SYSDATE;
        :NEW.fechaExpiracion := ADD_MONTHS(SYSDATE, 1);
    ELSE 
        RAISE_APPLICATION_ERROR(-20002, 'Esta serie ya se encuentra en su catálogo o la fecha de expiración de la última renta no ha pasado.');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TG_Rentas_fechaRenta_idPelicula_fechaExpiracion
BEFORE INSERT ON Rentas
FOR EACH ROW
DECLARE
    cantidad NUMBER;
    fecha DATE;
BEGIN
    SELECT COUNT(idPelicula) INTO cantidad FROM Rentas WHERE :NEW.idCuenta = idCuenta AND :NEW.idPelicula = idPelicula;
    SELECT fechaExpiracion INTO fecha FROM (SELECT * FROM Rentas WHERE :NEW.idCuenta = idCuenta AND :NEW.idPelicula = idPelicula ORDER BY fechaExpiracion DESC) WHERE ROWNUM = 1;
    IF cantidad < 1 AND fecha < SYSDATE THEN
        :NEW.fechaRenta := SYSDATE;
        :NEW.fechaExpiracion := ADD_MONTHS(SYSDATE, 1);
    ELSE 
        RAISE_APPLICATION_ERROR(-20002, 'Esta película ya se encuentra en su catálogo o la fecha de expiración de la última renta no ha pasado.');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TG_Distribuidores_fechaAsociacion
BEFORE INSERT ON Distribuidores
FOR EACH ROW
BEGIN
    :NEW.fechaAsociacion := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER TG_Bibliotecas_fechaCreacion
BEFORE INSERT ON Bibliotecas
FOR EACH ROW
BEGIN
    :NEW.fechaCreacion := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER TG_Cuentas_fechaCreacion
BEFORE INSERT ON Cuentas
FOR EACH ROW
BEGIN
    :NEW.fechaCreacion := SYSDATE;
END;
/

-- Consultas
CREATE OR REPLACE TRIGGER TG_BibliotecasPeliculas_Compras_idPelicula
BEFORE INSERT ON BibliotecasPeliculas
FOR EACH ROW
DECLARE
    v_pelicula CHAR(20);
BEGIN
    -- Buscar si la película ha sido comprada previamente
    SELECT idPelicula INTO v_pelicula
    FROM Compras
    WHERE :NEW.idPelicula = idPelicula;

    -- Si se encuentra una coincidencia, asignar el idPelicula correspondiente
    IF v_pelicula IS NOT NULL THEN 
        :NEW.idPelicula := v_pelicula;
    ELSE 
        -- Si no se encuentra ninguna coincidencia, mostrar un mensaje de error
        RAISE_APPLICATION_ERROR (-20001, 'Esta película no está en su catálogo.');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TG_BibliotecasSeries_Compras_idSerie
BEFORE INSERT ON BibliotecasSeries
FOR EACH ROW
DECLARE
    v_serie CHAR(20);
BEGIN
    -- Buscar si la serie ha sido comprada previamente
    SELECT idSerie INTO v_serie
    FROM Compras
    WHERE :NEW.idSerie = idSerie;

    -- Si se encuentra una coincidencia, asignar el idSerie correspondiente
    IF v_serie IS NOT NULL THEN 
        :NEW.idSerie := v_serie;
    ELSE 
        -- Si no se encuentra ninguna coincidencia, mostrar un mensaje de error
        RAISE_APPLICATION_ERROR (-20001, 'Esta serie no está en su catálogo.');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TG_BibliotecasPeliculas_Rentas_idPelicula
BEFORE INSERT ON BibliotecasPeliculas
DECLARE
    v_pelicula CHAR(20);
    fecha DATE;
BEGIN
    SELECT idPelicula INTO v_pelicula FROM (SELECT * FROM Rentas WHERE :NEW.idPelicula = Rentas.idPelicula AND :NEW.idCuenta = Rentas.idCuenta ORDER BY fechaExpiracion DESC) WHERE ROWNUM = 1;
    SELECT fechaExpiracion INTO cantidad FROM (SELECT * FROM Rentas WHERE :NEW.idCuenta = idCuenta AND :NEW.idPelicula = idPelicula ORDER BY fechaExpiracion DESC) WHERE ROWNUM = 1;
    IF v_pelicula IS NOT NULL AND fecha > SYSDATE THEN :NEW.idPelicula = v_pelicula;
    ELSE RAISE_APPLICATION_ERROR (-20001, 'Esta pelicula no esta en su catalogo o ya paso la fecha de expiracion.');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TG_BibliotecasSeries_Rentas_idSeries
BEFORE INSERT ON BibliotecasSeries
DECLARE
    v_serie CHAR(20);
    fecha DATE;
BEGIN
    SELECT idSerie INTO v_serie FROM (SELECT * FROM Rentas WHERE :NEW.idSerie = Rentas.idSerie AND :NEW.idCuenta = Rentas.idCuenta ORDER BY fechaExpiracion DESC) WHERE ROWNUM = 1;
    SELECT fechaExpiracion INTO cantidad FROM (SELECT * FROM Rentas WHERE :NEW.idCuenta = idCuenta AND :NEW.idSerie = idSerie ORDER BY fechaExpiracion DESC) WHERE ROWNUM = 1;
    IF v_serie IS NOT NULL AND fecha > SYSDATE THEN :NEW.idSerie = v_serie;
    ELSE RAISE_APPLICATION_ERROR (-20001, 'Esta serie no esta en su catalogo o ya paso la fecha de expiracion.');
    END IF;
END;
/

-- Borrar renta
CREATE OR REPLACE TRIGGER TG_BibliotecasPeliculas_Rentas_fechaExpiracion
AFTER INSERT OR UPDATE ON Rentas
FOR EACH ROW
BEGIN
    IF :NEW.fechaExpiracion < SYSDATE THEN DELETE FROM BibliotecasPeliculas WHERE idPelicula = :NEW.idPelicula;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TG_BibliotecasSeries_Rentas_fechaExpiracion
AFTER INSERT OR UPDATE ON Rentas
FOR EACH ROW
BEGIN
    IF :NEW.fechaExpiracion < SYSDATE THEN DELETE FROM BibliotecasSeries WHERE idSerie = :NEW.idSerie;
    END IF;
END;
/
