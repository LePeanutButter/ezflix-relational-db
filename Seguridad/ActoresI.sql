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
            IF p_contrasena IS NOT NULL THEN
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
        v_idCuenta MetodosDePago.idCuenta%TYPE;
        v_numero MetodosDePago.numero%TYPE;
        v_nombre MetodosDePago.nombre%TYPE;
        v_cvv MetodosDePago.cvv%TYPE;
        v_fechaExpiracion MetodosDePago.fechaExpiracion%TYPE;
    BEGIN
        SELECT idCuenta, numero, nombre, cvv, fechaExpiracion INTO v_idCuenta, v_numero, v_nombre, v_cvv, v_fechaExpiracion FROM MetodosDePago;
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
        v_id Bibliotecas.id%TYPE;
        v_idCuenta Bibliotecas.idCuenta%TYPE;
        v_nombre Bibliotecas.nombre%TYPE;
        v_fechaCreacion Bibliotecas.fechaCreacion%TYPE;
    BEGIN
        SELECT id, idCuenta, nombre, fechaCreacion INTO v_id, v_idCuenta, v_nombre, v_fechaCreacion FROM Bibliotecas;
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
        SELECT idPelicula, idSerie INTO p_idPelicula, p_idSerie FROM Versiones WHERE nombre = nombreContenido;
        SELECT id INTO p_idCuenta FROM Cuentas WHERE nombre = nombreCuenta;
        IF tipoOperacion = 'Compra' THEN
            IF p_idPelicula IS NOT NULL THEN
                DELETE FROM Operaciones WHERE idCuenta = p_idCuenta AND id IN (SELECT idOperacion FROM Compras WHERE idPelicula = p_idPelicula);
            ELSIF p_idSerie IS NOT NULL THEN
                DELETE FROM Operaciones WHERE idCuenta = p_idCuenta AND id IN (SELECT idOperacion FROM Compras WHERE Compras.idSerie = p_idSerie);
            END IF;
        ELSIF tipoOperacion = 'Renta' THEN
            IF p_idPelicula IS NOT NULL THEN
                DELETE FROM Operaciones WHERE idCuenta = p_idCuenta AND id IN (SELECT idOperacion FROM Rentas WHERE Rentas.idPelicula = p_idPelicula);
            ELSIF p_idSerie IS NOT NULL THEN
                DELETE FROM Operaciones WHERE idCuenta = p_idCuenta AND id IN (SELECT idOperacion FROM Rentas WHERE Rentas.idSerie = p_idSerie);
            END IF;
        ELSE
            RAISE_APPLICATION_ERROR(-20002, 'Tipo de operacion no valida.');
        END IF;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;    
    END eliminarOperacion;
END PA_Soporte;
/

CREATE OR REPLACE PACKAGE BODY PA_Administrador AS
    PROCEDURE insertarPelicula(p_nombre IN VARCHAR2, p_idioma IN VARCHAR2, p_categoria IN VARCHAR2, p_descripcion IN VARCHAR2, p_edad IN NUMBER, p_director IN VARCHAR2, p_fechaLanzamiento IN DATE, p_productora IN VARCHAR2, p_precioCompra IN NUMBER, p_precioRenta IN NUMBER, p_duracion IN VARCHAR2, p_distribuidor IN VARCHAR2) AS
        p_idPelicula Peliculas.id%TYPE;
    BEGIN
        INSERT INTO Peliculas(director, fechaLanzamiento, productora, precioCompra, precioRenta, duracion, distribuidor) VALUES (p_director, p_fechaLanzamiento, p_productora, p_precioCompra, p_precioRenta, p_duracion, p_distribuidor) RETURNING id INTO p_idPelicula;
        INSERT INTO Versiones(idPelicula, nombre, idioma, categoria, descripcion, edad) VALUES (p_idPelicula, p_nombre, p_idioma, p_categoria, p_descripcion, p_edad);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
    END insertarPelicula;
    
    PROCEDURE modificarPelicula(nombreAntiguo IN VARCHAR2, p_nombre IN VARCHAR2, p_idioma IN VARCHAR2, p_categoria IN VARCHAR2, p_descripcion IN VARCHAR2, p_edad IN NUMBER, p_director IN VARCHAR2, p_fechaLanzamiento IN DATE, p_productora IN VARCHAR2, p_precioCompra IN NUMBER, p_precioRenta IN NUMBER, p_duracion IN VARCHAR2, p_distribuidor IN VARCHAR2) AS
        p_idPelicula Versiones.idPelicula%TYPE;
    BEGIN
        SELECT idPelicula INTO p_idPelicula FROM Versiones WHERE nombre = nombreAntiguo;
        UPDATE Peliculas SET director = COALESCE(p_director, director), fechaLanzamiento = COALESCE(p_fechaLanzamiento, fechaLanzamiento), productora = COALESCE(p_productora, productora), precioCompra = COALESCE(p_precioCompra, precioCompra), precioRenta = COALESCE(p_precioRenta, precioRenta), duracion = COALESCE(p_duracion, duracion), distribuidor = COALESCE(p_distribuidor, distribuidor) WHERE id = p_idPelicula;
        UPDATE Versiones SET nombre = COALESCE(p_nombre, nombre), idioma = COALESCE(p_idioma, idioma), categoria = COALESCE(p_categoria, categoria), descripcion = COALESCE(p_descripcion, descripcion), edad = COALESCE(p_edad, edad) WHERE idPelicula = p_idPelicula;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
    END modificarPelicula;

    PROCEDURE eliminarPelicula(p_nombre IN VARCHAR2) AS
        p_idPelicula Versiones.idPelicula%TYPE;
    BEGIN
        SELECT idPelicula INTO p_idPelicula FROM Versiones WHERE nombre = p_nombre;
        DELETE FROM Peliculas WHERE id = p_idPelicula;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
    END eliminarPelicula;

    PROCEDURE insertarSerie(p_nombre IN VARCHAR2, p_idioma IN VARCHAR2, p_categoria IN VARCHAR2, p_descripcion IN VARCHAR2, p_edad IN NUMBER, p_director IN VARCHAR2, p_fechaLanzamiento IN DATE, p_productora IN VARCHAR2, p_precioCompra IN NUMBER, p_precioRenta IN NUMBER, p_distribuidor IN VARCHAR2) AS
        p_idSerie Series.id%TYPE;
    BEGIN
        INSERT INTO Series(director, fechaLanzamiento, productora, precioCompra, precioRenta, distribuidor) VALUES (p_director, p_fechaLanzamiento, p_productora, p_precioCompra, p_precioRenta, p_distribuidor) RETURNING id INTO p_idSerie;
        INSERT INTO Versiones(idSerie, nombre, idioma, categoria, descripcion, edad) VALUES (p_idSerie, p_nombre, p_idioma, p_categoria, p_descripcion, p_edad);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
    END insertarSerie;

    PROCEDURE modificarSerie(nombreAntiguo IN VARCHAR2, p_nombre IN VARCHAR2, p_idioma IN VARCHAR2, p_categoria IN VARCHAR2, p_descripcion IN VARCHAR2, p_edad IN NUMBER, p_director IN VARCHAR2, p_fechaLanzamiento IN DATE, p_productora IN VARCHAR2, p_precioCompra IN NUMBER, p_precioRenta IN NUMBER, p_distribuidor IN VARCHAR2) AS
        p_idSerie Versiones.idSerie%TYPE;
    BEGIN
        SELECT idSerie INTO P_idSerie FROM Versiones WHERE nombre = nombreAntiguo;
        UPDATE Series SET director = COALESCE(p_distribuidor, distribuidor), fechaLanzamiento = COALESCE(p_fechaLanzamiento, fechaLanzamiento), productora = COALESCE(p_productora, productora), precioCompra = COALESCE(p_precioCompra, precioCompra), precioRenta = COALESCE(p_precioRenta, precioRenta), distribuidor = COALESCE(p_distribuidor, distribuidor) WHERE id = p_idSerie;
        UPDATE Versiones SET nombre = COALESCE(p_nombre, nombre), idioma = COALESCE(p_idioma, idioma), categoria = COALESCE(p_categoria, categoria), descripcion = COALESCE(p_descripcion, descripcion), edad = COALESCE(p_edad, edad) WHERE idPelicula = p_idSerie;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
    END modificarSerie;

    PROCEDURE eliminarSerie(p_nombre IN VARCHAR2) AS
        p_idSerie Versiones.idSerie%TYPE;
    BEGIN
        SELECT idSerie INTO p_idSerie FROM Versiones WHERE nombre = p_nombre;
        DELETE FROM Series WHERE id = p_idSerie;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
    END eliminarSerie;

    PROCEDURE insertarDistribuidor(p_nombre IN VARCHAR2) AS
    BEGIN
        INSERT INTO Distribuidores(nombre) VALUES (p_nombre);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
    END insertarDistribuidor;

    PROCEDURE modificarDistribuidor(nombreAntiguo IN VARCHAR2, p_nombre IN VARCHAR2) AS
    BEGIN
        UPDATE Distribuidores SET nombre = p_nombre WHERE nombre = nombreAntiguo;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
    END modificarDistribuidor;

    PROCEDURE eliminarDistribuidor(p_nombre IN VARCHAR2) AS
    BEGIN
        DELETE FROM Distribuidores WHERE nombre = p_nombre;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
    END eliminarDistribuidor;

    FUNCTION consultarOperaciones RETURN NUMBER IS
        v_ingresos NUMBER;
    BEGIN
        SELECT Ingresos INTO v_ingresos FROM Ingresos;
        RETURN v_ingresos;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 0;
        WHEN OTHERS THEN
            ROLLBACK;
    END consultarOperaciones;

    PROCEDURE consultarBase(p_tabla IN VARCHAR2) AS
        instruccion VARCHAR2(1000);
    BEGIN
        instruccion := 'SELECT * FROM ' || p_tabla;
        EXECUTE IMMEDIATE instruccion;
    END consultarBase;
END PA_Administrador;
/