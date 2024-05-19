CREATE OR REPLACE PACKAGE BODY PA_Cliente AS
    PROCEDURE adicionarCuenta(p_nombre IN VARCHAR2, p_correo IN VARCHAR2, p_contrasena IN VARCHAR2, p_telefono IN NUMBER) AS
    BEGIN
        IF p_nombre IS NOT NULL AND p_correo IS NOT NULL AND p_contrasena IS NOT NULL AND p_telefono IS NOT NULL THEN
            INSERT INTO Cuentas (nombre, correo, contrasena, telefono) VALUES (p_nombre, p_correo, p_contrasena, p_telefono);
        ELSE
            RAISE_APPLICATION_ERROR(-20001, 'Los datos no son del tipo esperado.');
        END IF;
    END adicionarCuenta;
    
    PROCEDURE adicionarMetodosDePago(nombreCuenta IN VARCHAR2, p_numero IN NUMBER, p_nombre IN VARCHAR2, p_cvv IN NUMBER, p_fechaExpiracion IN DATE) AS
        p_idCuenta Cuentas.id%TYPE;
    BEGIN
        SELECT id INTO p_idCuenta FROM Cuentas WHERE nombre = nombreCuenta;
        
        IF p_idCuenta IS NOT NULL AND p_numero IS NOT NULL AND p_nombre IS NOT NULL AND p_cvv IS NOT NULL AND p_fechaExpiracion IS NOT NULL THEN
            INSERT INTO MetodosDePago (idCuenta, numero, nombre, cvv, fechaExpiracion) VALUES (p_idCuenta, p_numero, p_nombre, p_cvv, p_fechaExpiracion);
        ELSE
            RAISE_APPLICATION_ERROR(-20001, 'Los datos no son del tipo esperado.');
        END IF;
    END adicionarMetodosDePago;

    PROCEDURE adicionarBibliotecas(p_nombre IN VARCHAR2, nombreCuenta IN VARCHAR2) AS
        p_idCuenta Cuentas.id%TYPE;
    BEGIN
        SELECT id INTO p_idCuenta FROM Cuentas WHERE nombre = nombreCuenta;
        
        IF p_idCuenta IS NOT NULL AND p_nombre IS NOT NULL THEN
            INSERT INTO Bibliotecas (idCuenta, nombre) VALUES (p_idCuenta, p_nombre);
        ELSE
            RAISE_APPLICATION_ERROR(-20001, 'Los datos no son del tipo esperado.');
        END IF;
    END adicionarBibliotecas;

    PROCEDURE adicionarOperacion(nombreCuenta IN VARCHAR2, nombreContenido IN VARCHAR2, tipoOperacion IN VARCHAR2) AS
        p_idPelicula Versiones.idPelicula%TYPE;
        p_idSerie Versiones.idSerie%TYPE;
        p_idCuenta Cuentas.id%TYPE;
        p_idOperacion Operaciones.id%TYPE;
    BEGIN
        SELECT idPelicula, idSerie INTO p_idPelicula, p_idSerie FROM Versiones WHERE nombreContenido = nombreContenido;
        SELECT id INTO p_idCuenta FROM Cuentas WHERE nombre = nombreCuenta;
        
        IF p_idPelicula IS NOT NULL AND p_idCuenta IS NOT NULL THEN
            INSERT INTO Operaciones(idCuenta) VALUES (p_idCuenta) RETURNING id INTO p_idOperacion;
            
            IF tipoOperacion = 'Compra' THEN
                IF p_idPelicula IS NOT NULL THEN
                    INSERT INTO Compras(idOperacion, idPelicula) VALUES (p_idOperacion, p_idPelicula);
                ELSE
                    INSERT INTO Compras(idOperacion, idSerie) VALUES (p_idOperacion, p_idSerie);
                END IF;
            ELSIF tipoOperacion = 'Renta' THEN
                IF p_idPelicula IS NOT NULL THEN
                    INSERT INTO Rentas(idOperacion, idPelicula) VALUES (p_idOperacion, p_idPelicula);
                ELSE
                    INSERT INTO Rentas(idOperacion, idSerie) VALUES (p_idOperacion, p_idSerie);
                END IF;
            ELSE
                RAISE_APPLICATION_ERROR(-20002, 'Tipo de operación no válido.');
            END IF;
        ELSE
            RAISE_APPLICATION_ERROR(-20001, 'Los datos no son del tipo esperado.');
        END IF;
    END adicionarOperacion;

    PROCEDURE consultarPeliculas AS
        BEGIN
            SELECT * FROM Peliculas;
        END consultarPeliculas;

    PROCEDURE consultarSeries
        BEGIN
            SELECT * FROM Series;
        END consultarSeries;
END PA_Cliente;
/

CREATE OR REPLACE PACKAGE BODY PA_Gerente AS
    PROCEDURE consultarBase(p_tabla IN VARCHAR2) AS
        instruccion VARCHAR2(1000);
    BEGIN
        instruccion := 'SELECT * FROM ' || p_tabla;
        EXECUTE IMMEDIATE instruccion;
    END consultarBase;
END PA_Gerente;
/

CREATE OR REPLACE PACKAGE BODY PA_Auditor AS
    PROCEDURE consultarAuditoria AS
    BEGIN
        SELECT * FROM Auditorias;
    END consultarAuditoria;
END PA_Auditor;
/