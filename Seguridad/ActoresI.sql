CREATE OR REPLACE PACKAGE BODY PA_Cliente AS
    PROCEDURE adicionarCuenta(p_nombre IN VARCHAR2, p_correo IN VARCHAR2, p_contrasena IN VARCHAR2, p_telefono IN NUMBER) AS
    BEGIN
        IF p_nombre IS NOT NULL AND p_correo IS NOT NULL AND p_contrasena IS NOT NULL AND p_telefono IS NOT NULL THEN
            INSERT INTO Cuentas (nombre, correo, contrasena, telefono) VALUES (p_nombre, p_correo, p_contrasena, p_telefono);
            COMMIT;
        ELSE
            RAISE_APPLICATION_ERROR(-20001, 'Los datos no son del tipo esperado.');
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
    END adicionarCuenta;
    
    PROCEDURE adicionarMetodosDePago(nombreCuenta IN VARCHAR2, p_numero IN NUMBER, p_nombre IN VARCHAR2, p_cvv IN NUMBER, p_fechaExpiracion IN DATE) AS
        p_idCuenta Cuentas.id%TYPE;
    BEGIN
        SELECT id INTO p_idCuenta FROM Cuentas WHERE nombre = nombreCuenta;
        
        IF p_idCuenta IS NOT NULL AND p_numero IS NOT NULL AND p_nombre IS NOT NULL AND p_cvv IS NOT NULL AND p_fechaExpiracion IS NOT NULL THEN
            INSERT INTO MetodosDePago (idCuenta, numero, nombre, cvv, fechaExpiracion) VALUES (p_idCuenta, p_numero, p_nombre, p_cvv, p_fechaExpiracion);
            COMMIT;
        ELSE
            RAISE_APPLICATION_ERROR(-20001, 'Los datos no son del tipo esperado.');
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
    END adicionarMetodosDePago;

    PROCEDURE adicionarBibliotecas(p_nombre IN VARCHAR2, nombreCuenta IN VARCHAR2) AS
        p_idCuenta Cuentas.id%TYPE;
    BEGIN
        SELECT id INTO p_idCuenta FROM Cuentas WHERE nombre = nombreCuenta;
        
        IF p_idCuenta IS NOT NULL AND p_nombre IS NOT NULL THEN
            INSERT INTO Bibliotecas (idCuenta, nombre) VALUES (p_idCuenta, p_nombre);
            COMMIT;
        ELSE
            RAISE_APPLICATION_ERROR(-20001, 'Los datos no son del tipo esperado.');
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
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
            COMMIT;
        ELSE
            RAISE_APPLICATION_ERROR(-20001, 'Los datos no son del tipo esperado.');
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
    END adicionarOperacion;

    PROCEDURE consultarPeliculas AS
        v_id Peliculas.id%TYPE;
        v_director Peliculas.director%TYPE;
        v_fechaLanzamiento Peliculas.fechaLanzamiento%TYPE;
        v_productora Peliculas.productora%TYPE;
        v_precioCompra Peliculas.precioCompra%TYPE;
        v_precioRenta Peliculas.precioRenta%TYPE;
        v_duracion Peliculas.duracion%TYPE;
        v_distribuidor Peliculas.distribuidor%TYPE;
    BEGIN
        SELECT id, director, fechaLanzamiento, productora, precioCompra, precioRenta, duracion, distribuidor INTO v_id, v_director, v_fechaLanzamiento, v_productora, v_precioCompra, v_precioRenta, v_duracion, v_distribuidor FROM Peliculas;
    END consultarPeliculas;

    PROCEDURE consultarSeries AS
        v_id Peliculas.id%TYPE;
        v_director Peliculas.director%TYPE;
        v_fechaLanzamiento Peliculas.fechaLanzamiento%TYPE;
        v_productora Peliculas.productora%TYPE;
        v_precioCompra Peliculas.precioCompra%TYPE;
        v_precioRenta Peliculas.precioRenta%TYPE;
        v_distribuidor Peliculas.distribuidor%TYPE;
    BEGIN
        SELECT id, director, fechaLanzamiento, productora, precioCompra, precioRenta, distribuidor INTO v_id, v_director, v_fechaLanzamiento, v_productora, v_precioCompra, v_precioRenta, v_distribuidor FROM Series;
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
        v_idOperacion Auditorias.idOperacion%TYPE;
        v_operacion Auditorias.operacion%TYPE;
        v_fechaOperacion Auditorias.fechaOperacion%TYPE;
    BEGIN
        SELECT idOperacion, operacion, fechaOperacion INTO v_idOperacion, v_operacion, v_fechaOperacion FROM Auditorias;
    END consultarAuditoria;
END PA_Auditor;
/

CREATE OR REPLACE PACKAGE BODY PA_Soporte AS
    PROCEDURE adicionarCuenta(p_nombre IN VARCHAR2, p_correo IN VARCHAR2, p_contrasena IN VARCHAR2, p_telefono IN NUMBER) AS
    BEGIN
        IF p_nombre IS NOT NULL AND p_correo IS NOT NULL AND p_contrasena IS NOT NULL AND p_telefono IS NOT NULL THEN
            INSERT INTO Cuentas (nombre, correo, contrasena, telefono) VALUES (p_nombre, p_correo, p_contrasena, p_telefono);
            COMMIT;
        ELSE
            RAISE_APPLICATION_ERROR(-20001, 'Los datos no son del tipo esperado.');
        END IF;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
    END adicionarCuenta;

    PROCEDURE consultarCuenta AS
    v_id Cuentas.id%TYPE;
    v_nombre Cuentas.nombre%TYPE;
    v_correo Cuentas.correo%TYPE;
    v_contrasena Cuentas.contrasena%TYPE;
    v_telefono Cuentas.telefono%TYPE;
    v_fechaCreacion Cuentas.fechaCreacion%TYPE;
    BEGIN
        SELECT id, nombre, correo, contrasena, telefono, fechaCreacion INTO v_id, v_nombre, v_correo, v_contrasena, v_telefono, v_fechaCreacion FROM Cuentas;
    END consultarCuenta;

    PROCEDURE modificarCuenta(p_nombre IN VARCHAR2, p_correo IN VARCHAR2, p_contrasena IN VARCHAR2, p_telefono IN NUMBER) AS
    BEGIN
        IF p_nombre IS NOT NULL AND p_correo IS NOT NULL THEN
            IF contrasena IS NOT NULL THEN
                UPDATE Cuentas SET contrasena = cifrado(p_contrasena) WHERE nombre = p_nombre AND correo = p_correo;
            ELSIF p_telefono IS NOT NULL THEN
                UPDATE Cuentas SET telefono = p_telefono WHERE nombre = p_nombre AND correo = p_correo;
            ELSIF p_contrasena IS NOT NULL AND p_telefono IS NOT NULL THEN
                UPDATE Cuentas SET contrasena = cifrado(p_contrasena), telefono = p_telefono WHERE nombre = p_nombre AND correo = p_correo;
            END IF;
            COMMIT;
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
    END modificarCuenta;

    PROCEDURE eliminarCuenta(p_nombre IN VARCHAR2, p_correo IN VARCHAR2) AS
    BEGIN
        DELETE FROM Cuentas WHERE nombre = p_nombre AND correo = p_correo;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
    END eliminarCuenta;

    PROCEDURE adicionarMetodosDePago(nombreCuenta IN VARCHAR2, p_numero IN NUMBER, p_nombre IN VARCHAR2, p_cvv IN NUMBER, p_fechaExpiracion IN DATE) AS
        p_idCuenta Cuentas.id%TYPE;
    BEGIN
        SELECT id INTO p_idCuenta FROM Cuentas WHERE nombre = nombreCuenta;
        IF p_idCuenta IS NOT NULL AND p_numero IS NOT NULL AND p_nombre IS NOT NULL AND p_cvv IS NOT NULL AND p_fechaExpiracion IS NOT NULL THEN
            INSERT INTO MetodosDePago (idCuenta, numero, nombre, cvv, fechaExpiracion) VALUES (p_idCuenta, p_numero, p_nombre, p_cvv, p_fechaExpiracion);
            COMMIT;
        ELSE
            RAISE_APPLICATION_ERROR(-20001, 'Los datos no son del tipo esperado.');
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
    END adicionarMetodosDePago;

    PROCEDURE consultarMetodosDePago AS
    BEGIN
        SELECT * FROM MetodosDePago;
    END consultarMetodosDePago;

    PROCEDURE modificarMetodosDePago(nombreCuenta IN VARCHAR2, p_numero IN NUMBER, p_nombre IN VARCHAR2, p_cvv IN NUMBER, p_fechaExpiracion IN DATE) AS
        p_idCuenta Cuentas.id%TYPE;
    BEGIN
        SELECT id INTO p_idCuenta FROM Cuentas WHERE nombre = nombreCuenta;
        IF p_idCuenta IS NOT NULL AND p_numero IS NOT NULL AND (p_nombre IS NOT NULL OR p_cvv IS NOT NULL OR p_fechaExpiracion IS NOT NULL) THEN
            UPDATE MetodosDePago SET nombre = COALESCE(p_nombre, nombre), cvv = COALESCE(p_cvv, cvv), fechaExpiracion = COALESCE(p_fechaExpiracion, fechaExpiracion) WHERE idCuenta = p_idCuenta AND numero = p_numero;
            COMMIT;
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
    END modificarMetodosDePago;

    PROCEDURE eliminarMetodosDePago(nombreCuenta IN VARCHAR2, p_numero IN NUMBER) AS
        p_idCuenta Cuentas.id%TYPE;
    BEGIN
        SELECT id INTO p_idCuenta FROM Cuentas WHERE nombre = nombreCuenta;
        DELETE FROM MetodosDePago WHERE idCuenta = p_idCuenta AND numero = p_numero;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
    END eliminarMetodosDePago;

    PROCEDURE adicionarBiblioteca(p_nombre IN VARCHAR2, nombreCuenta IN VARCHAR2) AS
        p_idCuenta Cuentas.id%TYPE;
    BEGIN
        SELECT id INTO p_idCuenta FROM Cuentas WHERE nombre = nombreCuenta;
        
        IF p_idCuenta IS NOT NULL AND p_nombre IS NOT NULL THEN
            INSERT INTO Bibliotecas (idCuenta, nombre) VALUES (p_idCuenta, p_nombre);
            COMMIT;
        ELSE
            RAISE_APPLICATION_ERROR(-20001, 'Los datos no son del tipo esperado.');
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
    END adicionarBiblioteca;

    PROCEDURE consultarBiblioteca AS
    BEGIN
        SELECT * FROM Bibliotecas;
    END consultarBiblioteca;

    PROCEDURE modificarBiblioteca(p_nombre IN VARCHAR2, nombreCuenta IN VARCHAR2, biblioteca IN VARCHAR2) AS
        p_idCuenta Cuentas.id%TYPE;
    BEGIN
        SELECT id INTO p_idCuenta FROM Cuentas WHERE nombre = nombreCuenta;
        IF p_nombre IS NOT NULL AND p_idCuenta IS NOT NULL THEN
            UPDATE Bibliotecas SET nombre = p_nombre WHERE idCuenta = p_idCuenta AND nombre = biblioteca;
        END IF;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
    END modificarBiblioteca;

    PROCEDURE eliminarBiblioteca(nombreCuenta IN VARCHAR2, p_nombre IN NUMBER) AS
        p_idCuenta Cuentas.id%TYPE;
    BEGIN
        SELECT id INTO p_idCuenta FROM Cuentas WHERE nombre = nombreCuenta;
        DELETE FROM Bibliotecas WHERE idCuenta = p_idCuenta AND nombre = p_nombre;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
    END eliminarBiblioteca;

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
            COMMIT;
        ELSE
            RAISE_APPLICATION_ERROR(-20001, 'Los datos no son del tipo esperado.');
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
    END adicionarOperacion;

    PROCEDURE eliminarOperacion(nombreCuenta IN VARCHAR2, nombreContenido IN VARCHAR2, tipoOperacion IN VARCHAR2) AS
        p_idPelicula Versiones.idPelicula%TYPE;
        p_idSerie Versiones.idSerie%TYPE;
        p_idCuenta Cuentas.id%TYPE;
    BEGIN
        SELECT idPelicula, idSerie INTO p_idPelicula, p_idSerie FROM Versiones WHERE nombreContenido = nombreContenido;
        SELECT id INTO p_idCuenta FROM Cuentas WHERE nombre = nombreCuenta;
        IF tipoOperacion = "Compra" THEN
            IF p_idPelicula IS NOT NULL THEN
                DELETE FROM Operaciones WHERE idCuenta = p_idCuenta AND id = (SELECT idOperacion FROM Compras JOIN Operaciones ON (Compras.idOperacion = Operaciones.id) WHERE Operaciones.idCuenta = p_idCuenta AND Compras.idPelicula = p_idPelicula);
            ELSIF p_idSerie IS NOT NULL THEN
                DELETE FROM Operaciones WHERE idCuenta = p_idCuenta AND id = (SELECT idOperacion FROM Compras JOIN Operaciones ON (Compras.idOperacion = Operaciones.id) WHERE Operaciones.idCuenta = p_idCuenta AND Compras.idSerie = p_idSerie);
            END IF;
        ELSIF tipoOperacion = "Renta" THEN
            IF p_idPelicula IS NOT NULL THEN
                DELETE FROM Operaciones WHERE idCuenta = p_idCuenta AND id = (SELECT idOperacion FROM Rentas JOIN Operaciones ON (Rentas.idOperacion = Operaciones.id) WHERE Operaciones.idCuenta = p_idCuenta AND Rentas.idPelicula = p_idPelicula);
            ELSIF p_idSerie IS NOT NULL THEN
                DELETE FROM Operaciones WHERE idCuenta = p_idCuenta AND id = (SELECT idOperacion FROM Rentas JOIN Operaciones ON (Rentas.idOperacion = Operaciones.id) WHERE Operaciones.idCuenta = p_idCuenta AND Rentas.idSerie = p_idSerie);
            END IF;
        END IF;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;    
    END eliminarOperacion;
END PA_Soporte;
/