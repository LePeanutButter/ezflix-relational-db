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

CREATE OR REPLACE FUNCTION cifrado(input VARCHAR2)
RETURN VARCHAR2 IS
  permuted VARCHAR2(20);
  len NUMBER := LENGTH(input);
  i NUMBER := 1;
BEGIN
  permuted := input;
  WHILE i < len LOOP
    permuted    := SUBSTR(permuted, 1, i - 1) || 
                    SUBSTR(permuted, i + 1, 1) || 
                    SUBSTR(permuted, i, 1) || 
                    SUBSTR(permuted, i + 2);
    i := i + 2;
  END LOOP;
  RETURN permuted;
END cifrado;
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
    :NEW.contrasena := cifrado(:NEW.contrasena);
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
FOR EACH ROW
DECLARE
    cantidad NUMBER;
    precioPago NUMBER;
    v_idCuenta VARCHAR2(20);
BEGIN
    SELECT idCuenta INTO v_idCuenta FROM Operaciones WHERE id = :NEW.idOperacion;
    IF :NEW.idPelicula IS NOT NULL AND v_idCuenta IS NOT NULL THEN
        SELECT COUNT(idPelicula) INTO cantidad FROM Compras JOIN Operaciones ON (Compras.idOperacion = Operaciones.id) WHERE Operaciones.idCuenta = v_idCuenta AND :NEW.idPelicula = idPelicula;
        SELECT precioCompra INTO precioPago FROM Peliculas WHERE :NEW.idPelicula = id;
        IF cantidad < 1 THEN
            :NEW.fechaCompra := SYSDATE;
            :NEW.pago := precioPago;
        ELSE
            RAISE_APPLICATION_ERROR(-20002, 'Esta pelicula ya se encuentra en su catalogo.');
        END IF;
    ELSIF :NEW.idSerie IS NOT NULL AND v_idCuenta IS NOT NULL THEN
        SELECT COUNT(idSerie) INTO cantidad FROM Compras JOIN Operaciones ON (Compras.idOperacion = Operaciones.id) WHERE Operaciones.idCuenta = v_idCuenta AND :NEW.idSerie = idSerie;
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
FOR EACH ROW
DECLARE
    cantidad NUMBER;
    fecha DATE;
    precioPago NUMBER;
    v_idCuenta VARCHAR2(20);
BEGIN
    SELECT idCuenta INTO v_idCuenta FROM Operaciones WHERE id = :NEW.idOperacion;
    IF :NEW.idSerie IS NOT NULL AND v_idCuenta IS NOT NULL THEN
        SELECT COUNT(idSerie) INTO cantidad FROM Rentas JOIN Operaciones ON (Rentas.idOperacion = Operaciones.id) WHERE Operaciones.idCuenta = v_idCuenta AND :NEW.idSerie = idSerie;
        SELECT fechaExpiracion INTO fecha FROM (SELECT * FROM Rentas JOIN Operaciones ON (Rentas.idOperacion = Operaciones.id) WHERE Operaciones.idCuenta = v_idCuenta AND :NEW.idSerie = idSerie ORDER BY fechaExpiracion DESC) WHERE ROWNUM = 1;
        SELECT precioCompra INTO precioPago FROM Series WHERE :NEW.idSerie = id;
        IF cantidad < 1 AND fecha < SYSDATE THEN
            :NEW.fechaRenta := SYSDATE;
            :NEW.dias := 30;
            :NEW.fechaExpiracion := ADD_MONTHS(SYSDATE, 1);
            :NEW.pago := precioPago;
        ELSE
            RAISE_APPLICATION_ERROR(-20002, 'Esta serie ya se encuentra en su catálogo o la renta no ha expirado.');
        END IF;
    ELSIF :NEW.idPelicula IS NOT NULL AND v_idCuenta IS NOT NULL THEN
        SELECT COUNT(idPelicula) INTO cantidad FROM Rentas JOIN Operaciones ON (Rentas.idOperacion = Operaciones.id) WHERE Operaciones.idCuenta = v_idCuenta AND :NEW.idPelicula = idPelicula;
        SELECT fechaExpiracion INTO fecha FROM (SELECT * FROM Rentas JOIN Operaciones ON (Rentas.idOperacion = Operaciones.id) WHERE Operaciones.idCuenta = v_idCuenta AND :NEW.idPelicula = idPelicula ORDER BY fechaExpiracion DESC) WHERE ROWNUM = 1;
        SELECT precioCompra INTO precioPago FROM Peliculas WHERE :NEW.idPelicula = id;
        IF cantidad < 1 AND fecha < SYSDATE THEN
            :NEW.fechaRenta := SYSDATE;
            :NEW.dias := 30;
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
FOR EACH ROW
BEGIN
    :NEW.fechaAsociacion := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER TG_BibliotecasPeliculas_BI
BEFORE INSERT ON BibliotecasPeliculas
FOR EACH ROW
DECLARE
    v_pelicula CHAR(20);
    fecha DATE;
    v_idCuenta VARCHAR2(20);
BEGIN
    SELECT idCuenta INTO v_idCuenta FROM Bibliotecas WHERE :NEW.idBiblioteca = Bibliotecas.id;
    SELECT idPelicula INTO v_pelicula FROM Compras JOIN Operaciones ON (Operaciones.id = Compras.idOperacion) WHERE :NEW.idPelicula = Compras.idPelicula AND Operaciones.idCuenta = v_idCuenta;
    IF v_pelicula IS NOT NULL THEN
        :NEW.idPelicula := v_pelicula;
    ELSE
        SELECT idPelicula, fechaExpiracion INTO v_pelicula, fecha FROM (SELECT * FROM Rentas JOIN Operaciones ON (Operaciones.id = Rentas.idOperacion) WHERE :NEW.idPelicula = Rentas.idPelicula AND Operaciones.idCuenta = v_idCuenta ORDER BY fechaExpiracion DESC) WHERE ROWNUM = 1;
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
FOR EACH ROW
DECLARE
    v_serie CHAR(20);
    fecha DATE;
    v_idCuenta VARCHAR2(20);
BEGIN
    SELECT idCuenta INTO v_idCuenta FROM Bibliotecas WHERE :NEW.idBiblioteca = Bibliotecas.id;
    SELECT idSerie INTO v_serie FROM Compras JOIN Operaciones ON (Operaciones.id = Compras.idOperacion) WHERE :NEW.idSerie = Compras.idSerie AND Operaciones.idCuenta = v_idCuenta;
    IF v_serie IS NOT NULL THEN
        :NEW.idSerie := v_serie;
    ELSE
        SELECT idSerie, fechaExpiracion INTO v_serie, fecha FROM (SELECT * FROM Rentas JOIN Operaciones ON (Operaciones.id = Rentas.idOperacion) WHERE :NEW.idSerie = Rentas.idSerie AND Operaciones.idCuenta = v_idCuenta ORDER BY fechaExpiracion DESC) WHERE ROWNUM = 1;
        IF v_serie IS NOT NULL AND fecha > SYSDATE THEN
            :NEW.idSerie := v_serie;
        ELSE
            RAISE_APPLICATION_ERROR (-20001, 'Esta serie no está en su catálogo o ya ha pasado la fecha de expiración.');
        END IF;
    END IF;
END;
/


-- Los siguientes Triggers no se pueden probar debido a que TG_Rentas_BI automatiza la fecha de renta, por ende TG_BibliotecasPeliculas_AUI y TG_BibliotecasSeries_AUI no hacen nada
CREATE OR REPLACE TRIGGER TG_BibliotecasPeliculas_AUI
AFTER INSERT OR UPDATE ON Rentas
FOR EACH ROW
BEGIN
    DELETE FROM BibliotecasPeliculas
    WHERE idPelicula = :NEW.idPelicula
    AND idBiblioteca IN (
        SELECT Bibliotecas.id
        FROM Bibliotecas
        JOIN Cuentas ON Bibliotecas.idCuenta = Cuentas.id
        JOIN Operaciones ON Cuentas.id = Operaciones.idCuenta
        WHERE Operaciones.id = :NEW.idOperacion
    )
    AND :NEW.fechaExpiracion < SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER TG_BibliotecasSeries_AUI
AFTER INSERT OR UPDATE ON Rentas
FOR EACH ROW
BEGIN
    DELETE FROM BibliotecasSeries 
    WHERE idSerie = :NEW.idSerie
    AND idBiblioteca IN (
        SELECT Bibliotecas.id
        FROM Bibliotecas
        JOIN Cuentas ON Bibliotecas.idCuenta = Cuentas.id
        JOIN Operaciones ON Cuentas.id = Operaciones.idCuenta
        WHERE Operaciones.id = :NEW.idOperacion
    )
    AND :NEW.fechaExpiracion < SYSDATE;
END;
/