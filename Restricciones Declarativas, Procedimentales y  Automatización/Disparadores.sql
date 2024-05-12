CREATE OR REPLACE TRIGGER TG_Peliculas_BI
BEFORE INSERT ON Peliculas
FOR EACH ROW
DECLARE
    maximo VARCHAR2(20);
    existencia NUMBER;
BEGIN
    LOOP
        maximo := 'P' || TRUNC(DBMS_RANDOM.value(1000000000000000000, 9999999999999999999));
        SELECT COUNT(*) INTO existencia FROM Peliculas WHERE id = maximo;
        EXIT WHEN existencia = 0;
    END LOOP;
    :NEW.id := maximo;
END;
/

CREATE OR REPLACE TRIGGER TG_Series_BI
BEFORE INSERT ON Series
FOR EACH ROW
DECLARE
    maximo VARCHAR2(20);
    existencia NUMBER;    
BEGIN
    LOOP
        maximo := 'S' || TRUNC(DBMS_RANDOM.value(1000000000000000000, 9999999999999999999));
        SELECT COUNT(*) INTO existencia FROM Series WHERE id = maximo;
        EXIT WHEN existencia = 0;
    END LOOP;
    :NEW.id := maximo;
END;
/

CREATE OR REPLACE TRIGGER TG_Versiones_BI
BEFORE INSERT ON Versiones
FOR EACH ROW
DECLARE
    maximo VARCHAR2(20);
    existencia NUMBER;    
BEGIN
    LOOP
        maximo := 'V' || TRUNC(DBMS_RANDOM.value(1000000000000000000, 9999999999999999999));
        SELECT COUNT(*) INTO existencia FROM Versiones WHERE idVersion = maximo;
        EXIT WHEN existencia = 0;
    END LOOP;
    :NEW.idVersion := maximo;
END;
/

CREATE OR REPLACE TRIGGER TG_ContenidosAdicionales_BI
BEFORE INSERT ON ContenidosAdicionales
FOR EACH ROW
DECLARE
    maximo VARCHAR2(20);
    existencia NUMBER;  
BEGIN
    LOOP
        maximo := 'A' || TRUNC(DBMS_RANDOM.value(1000000000000000000, 9999999999999999999));
        SELECT COUNT(*) INTO existencia FROM ContenidosAdicionales WHERE id = maximo;
        EXIT WHEN existencia = 0;
    END LOOP;
    :NEW.id := maximo;
END;
/

CREATE OR REPLACE TRIGGER TG_Bibliotecas_BI
BEFORE INSERT ON Bibliotecas
FOR EACH ROW
DECLARE
    maximo VARCHAR2(20);
    existencia NUMBER;  
BEGIN
    LOOP
        maximo := 'B' || TRUNC(DBMS_RANDOM.value(1000000000000000000, 9999999999999999999));
        SELECT COUNT(*) INTO existencia FROM ContenidosAdicionales WHERE id = maximo;
        EXIT WHEN existencia = 0;
    END LOOP;
    :NEW.id := maximo;
    :NEW.fechaCreacion := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER TG_Cuentas_BI
BEFORE INSERT ON Cuentas
FOR EACH ROW
DECLARE
    maximo VARCHAR2(20);
    existencia NUMBER;  
BEGIN
    LOOP
        maximo := 'C' || TRUNC(DBMS_RANDOM.value(1000000000000000000, 9999999999999999999));
        SELECT COUNT(*) INTO existencia FROM ContenidosAdicionales WHERE id = maximo;
        EXIT WHEN existencia = 0;
    END LOOP;
    :NEW.id := maximo;
    :NEW.fechaCreacion := SYSDATE;
    :NEW.contraseña := cifrado(:NEW.contraseña);
END;
/

CREATE OR REPLACE TRIGGER TG_Operaciones_BI
BEFORE INSERT ON Operaciones 
FOR EACH ROW
DECLARE
    maximo VARCHAR2(20);
    existencia NUMBER;  
BEGIN
    LOOP
        maximo := 'O' || TRUNC(DBMS_RANDOM.value(1000000000000000000, 9999999999999999999));
        SELECT COUNT(*) INTO existencia FROM Operaciones WHERE id = maximo;
        EXIT WHEN existencia = 0;
    END LOOP;
    :NEW.id := maximo;
END;
/

CREATE OR REPLACE TRIGGER TG_Operaciones_AI
AFTER INSERT ON Operaciones
FOR EACH ROW
BEGIN
    INSERT INTO Auditorias(idOperacion, operacion, fechaOperacion) VALUES (:NEW.id, 'CREATE', SYSDATE);
END;
/

CREATE OR REPLACE TRIGGER TG_Operaciones_AU
AFTER UPDATE ON Operaciones
FOR EACH ROW
BEGIN
    INSERT INTO Auditorias(idOperacion, operacion, fechaOperacion) VALUES (:NEW.id, 'UPDATE', SYSDATE);
END;
/

CREATE OR REPLACE TRIGGER TG_Operaciones_AD
AFTER DELETE ON Operaciones
FOR EACH ROW
BEGIN
    INSERT INTO Auditorias(idOperacion, operacion, fechaOperacion) VALUES (:OLD.id, 'DELETE', SYSDATE);
END;
/

CREATE OR REPLACE TRIGGER TG_Compras_BI
BEFORE INSERT ON Compras
DECLARE
    cantidad NUMBER;
    precioPago NUMBER;
BEGIN
    IF :NEW.idPelicula IS NOT NULL THEN
        SELECT COUNT(idPelicula) INTO cantidad FROM Compras WHERE :NEW.idCuenta = idCuenta AND :NEW.idPelicula = idPelicula;
        SELECT precioCompra INTO precioPago FROM Peliculas WHERE :NEW.idPelicula = id;
        IF cantidad < 1 THEN
            :NEW.fechaCompra := SYSDATE;
            :NEW.pago := precioPago;
        ELSE
            RAISE_APPLICATION_ERROR(-20002, 'Esta pelicula ya se encuentra en su catalogo.');
        END IF;
    ELSIF :NEW.idSerie IS NOT NULL THEN
        SELECT COUNT(idSerie) INTO cantidad FROM Compras WHERE :NEW.idCuenta = idCuenta AND :NEW.idSerie = idSerie;
        SELECT precioCompra INTO precioPago FROM Series WHERE :NEW.idSerie = id;
        IF cantidad < 1 THEN
            :NEW.fechaCompra := SYSDATE;
            :NEW.pago := precioPago;
        ELSE
            RAISE_APPLICATION_ERROR(-20002, 'Esta serie ya se encuentra en su catalogo.');
        END IF;
    ELSE
        RAISE_APPLICATION_ERROR(-20003, 'No se ha proporcionado ni idPelicula ni idSerie.');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TG_Rentas_BI
BEFORE INSERT ON Rentas
DECLARE
    cantidad NUMBER;
    fecha DATE;
    precioPago NUMBER;
BEGIN
    IF :NEW.idSerie IS NOT NULL THEN
        SELECT COUNT(idSerie) INTO cantidad FROM Rentas WHERE :NEW.idCuenta = idCuenta AND :NEW.idSerie = idSerie;
        SELECT fechaExpiracion INTO fecha FROM (SELECT * FROM Rentas WHERE :NEW.idCuenta = idCuenta AND :NEW.idSerie = idSerie ORDER BY fechaExpiracion DESC) WHERE ROWNUM = 1;
        SELECT precioCompra INTO precioPago FROM Series WHERE :NEW.idSerie = id;
        IF cantidad < 1 AND fecha < SYSDATE THEN
            :NEW.fechaRenta := SYSDATE;
            :NEW.fechaExpiracion := ADD_MONTHS(SYSDATE, 1);
            :NEW.pago := precioPago;
        ELSE
            RAISE_APPLICATION_ERROR(-20002, 'Esta serie ya se encuentra en su catálogo o la renta no ha expirado.');
        END IF;
    ELSIF :NEW.idPelicula IS NOT NULL THEN
        SELECT COUNT(idPelicula) INTO cantidad FROM Rentas WHERE :NEW.idCuenta = idCuenta AND :NEW.idPelicula = idPelicula;
        SELECT fechaExpiracion INTO fecha FROM (SELECT * FROM Rentas WHERE :NEW.idCuenta = idCuenta AND :NEW.idPelicula = idPelicula ORDER BY fechaExpiracion DESC) WHERE ROWNUM = 1;
        SELECT precioCompra INTO precioPago FROM Peliculas WHERE :NEW.idPelicula = id;
        IF cantidad < 1 AND fecha < SYSDATE THEN
            :NEW.fechaRenta := SYSDATE;
            :NEW.fechaExpiracion := ADD_MONTHS(SYSDATE, 1);
            :NEW.pago := precioPago;
        ELSE
            RAISE_APPLICATION_ERROR(-20002, 'Esta película ya se encuentra en su catálogo o la renta no ha expirado.');
        END IF;
    ELSE
        RAISE_APPLICATION_ERROR(-20003, 'No se ha proporcionado ni idSerie ni idPelicula.');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TG_Distribuidores_BI
BEFORE INSERT ON Distribuidores
BEGIN
    :NEW.fechaAsociacion := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER TG_BibliotecasPeliculas_BI
BEFORE INSERT ON BibliotecasPeliculas
DECLARE
    v_pelicula CHAR(20);
    fecha DATE;
BEGIN
    SELECT idPelicula INTO v_pelicula FROM Compras WHERE :NEW.idPelicula = Compras.idPelicula AND :NEW.idCuenta = Compras.idCuenta;
    IF v_pelicula IS NOT NULL THEN
        :NEW.idPelicula := v_pelicula;
    ELSE
        SELECT idPelicula INTO v_pelicula FROM (SELECT * FROM Rentas WHERE :NEW.idPelicula = Rentas.idPelicula AND :NEW.idCuenta = Rentas.idCuenta ORDER BY fechaExpiracion DESC) WHERE ROWNUM = 1;
        SELECT fechaExpiracion INTO fecha FROM (SELECT * FROM Rentas WHERE :NEW.idCuenta = idCuenta AND :NEW.idPelicula = idPelicula ORDER BY fechaExpiracion DESC) WHERE ROWNUM = 1;
        IF v_pelicula IS NOT NULL AND fecha > SYSDATE THEN
            :NEW.idPelicula := v_pelicula;
        ELSE
            RAISE_APPLICATION_ERROR (-20001, 'Esta película no está en su catálogo o ya ha pasado la fecha de expiración.');
        END IF;
    END IF;
END;
/


CREATE OR REPLACE TRIGGER TG_BibliotecasSeries_BI
BEFORE INSERT ON BibliotecasSeries
DECLARE
    v_serie CHAR(20);
    fecha DATE;
BEGIN
    SELECT idSerie INTO v_serie FROM Compras WHERE :NEW.idSerie = Compras.idSerie AND :NEW.idCuenta = Compras.idCuenta;
    IF v_serie IS NOT NULL THEN
        :NEW.idSerie := v_serie;
    ELSE
        SELECT idSerie INTO v_serie FROM (SELECT * FROM Rentas WHERE :NEW.idSerie = Rentas.idSerie AND :NEW.idCuenta = Rentas.idCuenta ORDER BY fechaExpiracion DESC) WHERE ROWNUM = 1;
        SELECT fechaExpiracion INTO fecha FROM (SELECT * FROM Rentas WHERE :NEW.idCuenta = idCuenta AND :NEW.idSerie = idSerie ORDER BY fechaExpiracion DESC) WHERE ROWNUM = 1;
        IF v_serie IS NOT NULL AND fecha > SYSDATE THEN
            :NEW.idSerie := v_serie;
        ELSE
            RAISE_APPLICATION_ERROR (-20001, 'Esta serie no está en su catálogo o ya ha pasado la fecha de expiración.');
        END IF;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TG_BibliotecasPeliculas_AUI
AFTER INSERT OR UPDATE ON Rentas
FOR EACH ROW
BEGIN
    IF :NEW.fechaExpiracion < SYSDATE THEN
        IF EXISTS (SELECT 1 FROM BibliotecasPeliculas WHERE idPelicula = :NEW.idPelicula) THEN
            DELETE FROM BibliotecasPeliculas WHERE idPelicula = :NEW.idPelicula;
        END IF;
    END IF;
END;
/


CREATE OR REPLACE TRIGGER TG_BibliotecasSeries_AUI
AFTER INSERT OR UPDATE ON Rentas
FOR EACH ROW
BEGIN
    IF :NEW.fechaExpiracion < SYSDATE THEN
        IF EXISTS (SELECT 1 FROM BibliotecasSeries WHERE idSerie = :NEW.idSerie) THEN
            DELETE FROM BibliotecasSeries WHERE idSerie = :NEW.idSerie;
        END IF;
    END IF;
END;
/