CREATE OR REPLACE PACKAGE BODY PC_Cuentas AS
    PROCEDURE Adicionar(
        p_nombre IN VARCHAR2,
        p_correo IN VARCHAR2,
        p_contrasena IN VARCHAR2,
        p_telefono IN CHAR
    ) IS
    BEGIN
        INSERT INTO cuentas (nombre, correo, contrasena, telefono) 
        VALUES (p_nombre, p_correo, p_contrasena, p_telefono);
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE;
    END Adicionar;
    
    PROCEDURE Modificar(
        p_nombre IN VARCHAR2,
        p_correo IN VARCHAR2,
        p_contrasena IN VARCHAR2,
        p_telefono IN CHAR
    ) IS
    BEGIN 
        UPDATE cuentas 
        SET correo = p_correo,
            contrasena = p_contrasena,
            telefono = p_telefono
        WHERE nombre = p_nombre;
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE;
    END Modificar;
    
    PROCEDURE Eliminar(
        p_nombre IN VARCHAR2,
        p_correo IN VARCHAR2,
        p_contrasena IN VARCHAR2
    ) IS
    BEGIN
        DELETE FROM cuentas WHERE nombre = p_nombre AND correo = p_correo AND contrasena = p_contrasena;
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE;
    END Eliminar;
    
    
    PROCEDURE Consultar(
        p_nombre IN VARCHAR2,
        p_correo IN VARCHAR2,
        resultado OUT SYS_REFCURSOR
    ) IS 
    BEGIN 
        OPEN resultado FOR
        SELECT * FROM cuentas
        WHERE nombre = p_nombre AND correo = p_correo;
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE;
    END Consultar;
END PC_Cuentas;
/

CREATE OR REPLACE PACKAGE BODY PC_Distribuidores AS
    PROCEDURE Adicionar(
        nombre IN VARCHAR2
    )IS
    BEGIN
        INSERT INTO Distribuidores (nombre)
        VALUES (nombre);
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE;
    END Adicionar;
    

    PROCEDURE Eliminar(
        p_nombre IN VARCHAR2
    ) IS
    BEGIN
        DELETE FROM Distribuidores WHERE nombre = p_nombre;
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE;
    END Eliminar;
    
    
    PROCEDURE Consultar(
        nombre IN VARCHAR2,
        resultado OUT SYS_REFCURSOR
    ) IS
    BEGIN 
        OPEN resultado FOR
        SELECT * FROM distribuidores WHERE nombre = nombre;
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE;
    END Consultar;
    
END PC_distribuidores;
/


CREATE OR REPLACE PACKAGE BODY PC_Series AS
    PROCEDURE Adicionar(
        p_director IN VARCHAR2,
        p_fechaLanzamiento IN DATE,
        p_productora IN VARCHAR2,
        p_precioCompra IN NUMBER,
        p_precioRenta IN NUMBER,
        p_distribuidor IN VARCHAR2 
    )IS
    BEGIN
        INSERT INTO Series (director, fechaLanzamiento, productora, precioCompra, precioRenta, distribuidor)
        VALUES (p_director, p_fechaLanzamiento, p_productora, p_precioCompra, p_precioRenta, p_distribuidor);
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE;
    END Adicionar;
    
    PROCEDURE Modificar(
        p_id IN VARCHAR2,
        p_director IN VARCHAR2,
        p_fechaLanzamiento IN DATE,
        p_productora IN VARCHAR2,
        p_precioCompra IN NUMBER,
        p_precioRenta IN NUMBER,
        p_distribuidor IN VARCHAR2 
    )IS
    BEGIN 
        UPDATE Series 
        SET director = p_director,
            fechaLanzamiento = p_fechaLanzamiento,
            productora = p_productora,
            precioCompra = p_precioCompra,
            precioRenta = p_precioRenta,
            distribuidor = p_distribuidor
            WHERE id = p_id;
            COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE;
    END Modificar;
    
    PROCEDURE Eliminar(
       p_id IN VARCHAR2
    )IS 
    BEGIN
        DELETE FROM series WHERE id = p_id;
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE;
    END Eliminar;
    
    PROCEDURE Consultar(
        p_id IN VARCHAR2,
        resultado OUT SYS_REFCURSOR
    ) IS
    BEGIN 
        OPEN resultado FOR
        SELECT * FROM series WHERE id = p_id;
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE;
    END Consultar;

END PC_Series;
/


CREATE OR REPLACE PACKAGE BODY PC_Bibliotecas AS
    PROCEDURE Adicionar(
        p_nombreCuenta IN VARCHAR2,
        p_nombre IN VARCHAR2
    ) AS
        p_idCuenta Cuentas.id%TYPE;
    BEGIN 
        SELECT id INTO p_idCuenta FROM Cuentas WHERE nombre = p_nombreCuenta;
        INSERT INTO Bibliotecas(idCuenta, nombre)
        VALUES (p_idCuenta, p_nombre);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END Adicionar;
    
    PROCEDURE Modificar(
        p_nombreCuenta IN VARCHAR2,
        p_nombre IN VARCHAR2
    ) AS
        p_idCuenta Cuentas.id%TYPE;
    BEGIN 
        SELECT id INTO p_idCuenta FROM Cuentas WHERE nombre = p_nombreCuenta;
        UPDATE Bibliotecas 
        SET nombre = p_nombre 
        WHERE idCuenta = p_idCuenta;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END Modificar;
    
    PROCEDURE Eliminar(
        p_nombre IN VARCHAR2
    ) AS
        p_id Bibliotecas.id%TYPE;
    BEGIN 
        SELECT id INTO p_id FROM Bibliotecas WHERE nombre = p_nombre;
        DELETE FROM Bibliotecas WHERE id = p_id;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END Eliminar;
    
    PROCEDURE Consultar(
        p_nombre IN VARCHAR2,
        resultado OUT SYS_REFCURSOR      
    ) IS
    BEGIN 
        OPEN resultado FOR
        SELECT * FROM bibliotecas WHERE nombre = p_nombre;
    EXCEPTION
        WHEN OTHERS THEN
            RAISE;
    END Consultar;
    
END PC_Bibliotecas;
/


CREATE OR REPLACE PACKAGE BODY PC_Peliculas_Version AS
    PROCEDURE Adicionar(
        p_nombre IN VARCHAR2,
        p_descripcion IN VARCHAR2,
        p_categoria IN VARCHAR2,
        p_edad IN NUMBER,
        p_idioma IN VARCHAR2,
        p_director IN VARCHAR2,
        p_fechaLanzamiento IN DATE,
        p_productora IN VARCHAR2,
        p_precioCompra IN NUMBER,
        p_precioRenta IN NUMBER,
        p_duracion IN VARCHAR2,
        p_distribuidor IN VARCHAR2    
    ) AS 
        p_idPelicula Peliculas.id%TYPE;
    BEGIN
        INSERT INTO Peliculas (director, fechaLanzamiento, productora, precioCompra, precioRenta,duracion, distribuidor) 
        VALUES (p_director, p_fechaLanzamiento, p_productora, p_precioCompra, p_precioRenta, p_duracion,p_distribuidor) 
        RETURNING id INTO p_idPelicula;

        INSERT INTO Versiones (idPelicula, nombre, idioma, categoria, descripcion, edad) 
        VALUES (p_idPelicula, p_nombre, p_idioma, p_categoria, p_descripcion, p_edad);

        COMMIT;

    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END Adicionar;

    PROCEDURE Modificar(
        p_nombre IN VARCHAR2,
        p_descripcion IN VARCHAR2,
        p_categoria IN VARCHAR2,
        p_edad IN NUMBER,
        p_idioma IN VARCHAR2,
        p_director IN VARCHAR2,
        p_fechaLanzamiento IN DATE,
        p_productora IN VARCHAR2,
        p_precioCompra IN NUMBER,
        p_precioRenta IN NUMBER,
        p_duracion IN VARCHAR2,
        p_distribuidor IN VARCHAR2,
        p_id IN VARCHAR2
    ) IS
    BEGIN 
        UPDATE Peliculas 
        SET director = p_director,
            fechaLanzamiento = p_fechaLanzamiento,
            productora = p_productora,
            precioCompra = p_precioCompra,
            precioRenta = p_precioRenta,
            duracion = p_duracion,
            distribuidor = p_distribuidor
        WHERE id = p_id;

        UPDATE Versiones
        SET nombre = p_nombre,
            descripcion = p_descripcion,
            categoria = p_categoria,
            edad = p_edad,
            idioma = p_idioma
        WHERE idPelicula = p_id;

        COMMIT;

    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END Modificar;

    PROCEDURE Eliminar(
       p_idVersion IN VARCHAR2,
       p_id IN VARCHAR2
    ) IS 
    BEGIN
        
        DELETE FROM versiones WHERE idVersion = p_idVersion;
        DELETE FROM peliculas WHERE id = p_id;
        COMMIT;

    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END Eliminar;

    PROCEDURE Consultar(
        p_id IN VARCHAR2,
        resultado OUT SYS_REFCURSOR
    ) IS
    BEGIN 
        OPEN resultado FOR
        SELECT p.*, v.*
        FROM Peliculas p
        JOIN Versiones v ON p.id = v.idPelicula
        WHERE p.id = p_id;
    END Consultar;

END PC_Peliculas_Version;
/


CREATE OR REPLACE PACKAGE BODY PC_Operacion_Compra AS
    PROCEDURE Adicionar(
        p_nombreCuenta IN VARCHAR2,
        p_nombrePelicula IN VARCHAR2,
        p_pago IN NUMBER
    ) AS
        p_idOperacion Operaciones.id%TYPE;
        p_idPelicula Versiones.idPelicula%TYPE;
        p_idCuenta Cuentas.id%TYPE;
    BEGIN
        SELECT id INTO p_idCuenta FROM Cuentas WHERE nombre = p_nombreCuenta;
        
        SELECT idPelicula INTO p_idPelicula FROM Versiones WHERE nombre = p_nombrePelicula;
        
        INSERT INTO operaciones(idCuenta) VALUES (p_idCuenta) RETURNING id INTO p_idOperacion;
     
        INSERT INTO Compras(idOperacion, idPelicula, pago)
        VALUES (p_idOperacion, p_idPelicula, p_pago);
        
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20001, 'Error al agregar operación de compra');
    END Adicionar;
    

    PROCEDURE Modificar(
        p_idOperacion IN CHAR,
        p_pago IN NUMBER
    ) IS
    BEGIN
        UPDATE Compras
        SET pago = p_pago
        WHERE idOperacion = p_idOperacion;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20002, 'Error al modificar operación de compra');
    END Modificar;
    
    PROCEDURE Eliminar(
        p_idOperacion IN CHAR
    ) IS
    BEGIN
        DELETE FROM Compras WHERE idOperacion = p_idOperacion;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20003, 'Error al eliminar operación de compra');
    END Eliminar;
    
    PROCEDURE Consultar(
        p_idOperacion IN CHAR,
        resultado OUT SYS_REFCURSOR      
    ) IS
    BEGIN 
        OPEN resultado FOR
        SELECT * FROM Compras WHERE idOperacion = p_idOperacion;
    EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20004, 'Error al consultar operación de compra');
    END Consultar;
    
END PC_Operacion_Compra;
/


CREATE OR REPLACE PACKAGE BODY PC_MetodoPago AS
    PROCEDURE Adicionar(
        p_nombreCuenta IN VARCHAR2,
        p_numero IN NUMBER,
        p_nombre IN VARCHAR2,
        p_cvv IN NUMBER,
        p_fechaExpiracion IN DATE
    )AS p_idCuenta Cuentas.id%TYPE;
    BEGIN
        SELECT id INTO p_idCuenta FROM Cuentas WHERE nombre = p_nombreCuenta;
        
        INSERT INTO MetodosDePago(idCuenta, numero, nombre, cvv, fechaExpiracion)
        VALUES (p_idCuenta, p_numero, p_nombre, p_cvv, p_fechaExpiracion);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20001, 'Error al agregar metodo de pago');
    END Adicionar; 
    
    PROCEDURE Modificar(
        p_nombreCuenta IN VARCHAR2,
        p_numero IN NUMBER,
        p_nombre IN VARCHAR2,
        p_cvv IN NUMBER,
        p_fechaExpiracion IN DATE
    )AS  p_idCuenta Cuentas.id%TYPE;
    
    BEGIN
        SELECT id INTO p_idCuenta FROM Cuentas WHERE nombre = p_nombreCuenta;
        UPDATE MetodosDePago
        SET nombre=p_nombre, cvv = p_cvv, fechaExpiracion = p_fechaExpiracion
        WHERE idCuenta = p_idCuenta;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20002, 'Error al modificar Metodo de pago');
    END Modificar;
    
    PROCEDURE Eliminar(
        p_nombreCuenta IN CHAR,
        p_numero IN NUMBER
    )AS p_idCuenta Cuentas.id%TYPE;
    BEGIN
        SELECT id INTO p_idCuenta FROM Cuentas WHERE nombre = p_nombreCuenta;
        DELETE FROM MetodosDePago WHERE idCuenta = p_idCuenta AND numero = p_numero;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20003, 'Error al eliminar Metodo de pago');
    END Eliminar;
    
    PROCEDURE Consultar(
        p_numero IN NUMBER,
        resultado OUT SYS_REFCURSOR      
    )IS
    BEGIN 
        OPEN resultado FOR
        SELECT * FROM MetodosDePago WHERE numero = p_numero;
    EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20004, 'Error al consultar Metodo de pago');
    END Consultar;
    
END PC_MetodoPago;
/


CREATE OR REPLACE PACKAGE BODY PC_BibliotecasPeliculas AS
    PROCEDURE Adicionar(
        p_nombreBiblioteca IN VARCHAR2,
        p_nombrePelicula IN VARCHAR2
    ) AS
        p_idPelicula Versiones.idPelicula%TYPE;
        p_idBiblioteca Bibliotecas.id%TYPE;
    BEGIN 
        SELECT id INTO p_idBiblioteca FROM Bibliotecas WHERE nombre = p_nombreBiblioteca;
        SELECT idPelicula INTO p_idPelicula FROM Versiones WHERE nombre = p_nombrePelicula;
        INSERT INTO BibliotecasPeliculas(idBiblioteca, idPelicula) VALUES (p_idBiblioteca, p_idPelicula);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20001, 'Error al agregar Pelicula a Biblioteca');
    END Adicionar; 
    
    PROCEDURE Eliminar(
        p_nombreBiblioteca IN VARCHAR2,
        p_nombrePelicula IN VARCHAR2
    ) AS
        p_idPelicula Versiones.idPelicula%TYPE;
        p_idBiblioteca Bibliotecas.id%TYPE;
    BEGIN 
        SELECT id INTO p_idBiblioteca FROM Bibliotecas WHERE nombre = p_nombreBiblioteca;
        SELECT idPelicula INTO p_idPelicula FROM Versiones WHERE nombre = p_nombrePelicula;
        DELETE FROM BibliotecasPeliculas WHERE idBiblioteca = p_idBiblioteca AND idPelicula = p_idPelicula;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20003, 'Error al eliminar');
    END Eliminar;
    
    PROCEDURE Consultar(
        p_nombreBiblioteca IN VARCHAR2,
        resultado OUT SYS_REFCURSOR
    ) AS
        p_idBiblioteca Bibliotecas.id%TYPE;
    BEGIN 
        SELECT id INTO p_idBiblioteca FROM Bibliotecas WHERE nombre = p_nombreBiblioteca;
        OPEN resultado FOR
        SELECT * FROM BibliotecasPeliculas WHERE idBiblioteca = p_idBiblioteca;
    EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20004, 'Error al consultar');
    END Consultar;
    
END PC_BibliotecasPeliculas;
/


CREATE OR REPLACE PACKAGE BODY PC_GestoresDeAvisos AS
    PROCEDURE Adicionar(
        p_idRenta IN VARCHAR2,
        p_tipoAviso IN VARCHAR2,
        p_fechaCreacion IN DATE,
        p_mensaje IN VARCHAR2,
        p_estadoAviso IN VARCHAR2,
        p_estadoAlerta IN VARCHAR2,
        p_destinatario IN VARCHAR2
    ) IS
    BEGIN 
        INSERT INTO GestoresDeAvisos(idRenta, tipoAviso, fechaCreacion, mensaje, estadoAviso, estadoAlerta, destinatario) 
        VALUES (p_idRenta, p_tipoAviso, p_fechaCreacion, p_mensaje, p_estadoAviso, p_estadoAlerta, p_destinatario);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20001, 'Error al agregar aviso');
    END Adicionar;
    
    PROCEDURE Modificar(
        p_id IN VARCHAR2,
        p_estadoAviso IN VARCHAR2,
        p_estadoAlerta IN VARCHAR2
    ) IS
    BEGIN 
        UPDATE GestoresDeAvisos
        SET estadoAviso = p_estadoAviso, estadoAlerta = p_estadoAlerta
        WHERE id = p_id;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20002, 'Error al modificar aviso');
    END Modificar;
    
    PROCEDURE Eliminar(
        p_id IN VARCHAR2
    ) IS
    BEGIN 
        DELETE FROM GestoresDeAvisos WHERE id = p_id;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20003, 'Error al eliminar aviso');
    END Eliminar;
END PC_GestoresDeAvisos;
/

        
    
         


