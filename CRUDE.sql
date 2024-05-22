--CRUDE
CREATE OR REPLACE PACKAGE PC_Cuentas AS
    PROCEDURE Adicionar(
        p_nombre IN VARCHAR2,
        p_correo IN VARCHAR2,
        p_contrasena IN VARCHAR2,
        p_telefono IN CHAR
    );
    
    PROCEDURE Modificar(
        p_nombre IN VARCHAR2,
        p_correo IN VARCHAR2,
        p_contrasena IN VARCHAR2,
        p_telefono IN CHAR
    );
    
    PROCEDURE Eliminar(
        p_nombre IN VARCHAR2,
        p_correo IN VARCHAR2,
        p_contrasena IN VARCHAR2
    );
    
    PROCEDURE Consultar(
        p_nombre IN VARCHAR2,
        p_correo IN VARCHAR2,
        resultado OUT SYS_REFCURSOR
    );
END PC_Cuentas;
/



--CRUDI
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
    END Modificar;
    
    PROCEDURE Eliminar(
        p_nombre IN VARCHAR2,
        p_correo IN VARCHAR2,
        p_contrasena IN VARCHAR2
    ) IS
    BEGIN
        DELETE FROM cuentas WHERE nombre = p_nombre AND correo = p_correo AND contrasena = p_contrasena;
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
    END Consultar;
END PC_Cuentas;
/




--CRUDE
CREATE OR REPLACE PACKAGE PC_Distribuidores AS
    PROCEDURE Adicionar(
        nombre IN VARCHAR2
    );
    
    PROCEDURE Eliminar(
        p_nombre IN VARCHAR2
    );
    PROCEDURE Consultar(
        nombre IN VARCHAR2,
        resultado OUT SYS_REFCURSOR
    );
END PC_Distribuidores;
/
--CRUDI
CREATE OR REPLACE PACKAGE BODY PC_Distribuidores AS
    PROCEDURE Adicionar(
        nombre IN VARCHAR2
    )IS
    BEGIN
        INSERT INTO Distribuidores (nombre)
        VALUES (nombre);
    END Adicionar;
    

    PROCEDURE Eliminar(
        p_nombre IN VARCHAR2
    ) IS
    BEGIN
        DELETE FROM Distribuidores WHERE nombre = p_nombre;
    END Eliminar;
    
    PROCEDURE Consultar(
        nombre IN VARCHAR2,
        resultado OUT SYS_REFCURSOR
    ) IS
    BEGIN 
        OPEN resultado FOR
        SELECT * FROM distribuidores WHERE nombre = nombre;
    END Consultar;
    
END PC_distribuidores;
/



--CRUDE
CREATE OR REPLACE PACKAGE PC_Peliculas AS
    PROCEDURE Adicionar(
        director IN VARCHAR2,
        fechaLanzamiento IN DATE,
        productora IN VARCHAR2,
        precioCompra IN NUMBER,
        precioRenta IN NUMBER,
        duracion IN VARCHAR2,
        distribuidor IN VARCHAR2
    );
    
    PROCEDURE Modificar(
        p_director IN VARCHAR2,
        p_fechaLanzamiento IN DATE,
        p_productora IN VARCHAR2,
        p_precioCompra IN NUMBER,
        p_precioRenta IN NUMBER,
        p_duracion IN VARCHAR2,
        p_distribuidor IN VARCHAR2,
        p_id IN VARCHAR2
    );
    
    PROCEDURE Eliminar(
        p_id IN VARCHAR2
    );
    
    PROCEDURE Consultar(
        p_id IN VARCHAR2,
        resultado OUT SYS_REFCURSOR
    );
END PC_Peliculas;
/
--CRUDI
CREATE OR REPLACE PACKAGE BODY PC_Peliculas AS
    PROCEDURE Adicionar(
        director IN VARCHAR2,
        fechaLanzamiento IN DATE,
        productora IN VARCHAR2,
        precioCompra IN NUMBER,
        precioRenta IN NUMBER,
        duracion IN VARCHAR2,
        distribuidor IN VARCHAR2
    ) IS
    BEGIN 
        INSERT INTO Peliculas (director, fechaLanzamiento, productora, precioCompra, PrecioRenta, duracion, distribuidor)
        VALUES (director, fechaLanzamiento, productora, precioCompra, PrecioRenta, duracion, distribuidor);
    END Adicionar;
    
    PROCEDURE Modificar(
        p_director IN VARCHAR2,
        p_fechaLanzamiento IN DATE,
        p_productora IN VARCHAR2,
        p_precioCompra IN NUMBER,
        p_precioRenta IN NUMBER,
        p_duracion IN VARCHAR2,
        p_distribuidor IN VARCHAR2,
        p_id IN VARCHAR2
    )IS
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
    END Modificar;
    
    PROCEDURE Eliminar(
       p_id IN VARCHAR2
    )IS 
    BEGIN
        DELETE FROM Peliculas WHERE id = p_id;
    END Eliminar;
    
    PROCEDURE Consultar(
        p_id IN VARCHAR2,
        resultado OUT SYS_REFCURSOR
    ) IS
    BEGIN 
        OPEN resultado FOR
        SELECT * FROM peliculas WHERE id = p_id;
    END Consultar;

END PC_Peliculas;
/




--CRUDE
CREATE OR REPLACE PACKAGE PC_Series AS
    PROCEDURE Adicionar(
        p_director IN VARCHAR2,
        p_fechaLanzamiento IN DATE,
        p_productora IN VARCHAR2,
        p_precioCompra IN NUMBER,
        p_precioRenta IN NUMBER,
        p_distribuidor IN VARCHAR2 
    );
     PROCEDURE Modificar(
        p_id IN VARCHAR2,
        p_director IN VARCHAR2,
        p_fechaLanzamiento IN DATE,
        p_productora IN VARCHAR2,
        p_precioCompra IN NUMBER,
        p_precioRenta IN NUMBER,
        p_distribuidor IN VARCHAR2   
    );
     PROCEDURE Eliminar(
        p_id IN VARCHAR2
    );
    
     PROCEDURE Consultar(
        p_id IN VARCHAR2,
        resultado OUT SYS_REFCURSOR
    );
    
END PC_Series;
/   
--CRUDI
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
    END Modificar;
    
    PROCEDURE Eliminar(
       p_id IN VARCHAR2
    )IS 
    BEGIN
        DELETE FROM series WHERE id = p_id;
    END Eliminar;
    
    PROCEDURE Consultar(
        p_id IN VARCHAR2,
        resultado OUT SYS_REFCURSOR
    ) IS
    BEGIN 
        OPEN resultado FOR
        SELECT * FROM series WHERE id = p_id;
    END Consultar;

END PC_Series;
/
    
 
 
 
--CRUDE 
CREATE OR REPLACE PACKAGE PC_Bibliotecas AS
    PROCEDURE Adicionar(
        p_idCuenta IN VARCHAR2,
        p_nombre IN VARCHAR2
    );
    PROCEDURE Modificar(
        p_id IN VARCHAR2,
        p_nombre IN VARCHAR2
    );
    PROCEDURE Eliminar(
        p_id IN VARCHAR2
    );
    PROCEDURE Consultar(
        p_nombre IN VARCHAR2,
        resultado OUT SYS_REFCURSOR      
    );
END PC_Bibliotecas;
/
--CRUDI
CREATE OR REPLACE PACKAGE BODY PC_Bibliotecas AS
    PROCEDURE Adicionar(
        p_idCuenta IN VARCHAR2,
        p_nombre IN VARCHAR2
    )IS
    BEGIN 
        INSERT INTO Bibliotecas(idCuenta, nombre)
        VALUES (p_idCuenta, p_nombre);
    END Adicionar;
    
    PROCEDURE Modificar(
        p_id IN VARCHAR2,
        p_nombre IN VARCHAR2
    )IS
    BEGIN 
        UPDATE Bibliotecas 
        SET nombre = p_nombre 
        WHERE id = p_id;
    END Modificar;
    
    PROCEDURE Eliminar(
        p_id IN VARCHAR2
    )IS
    BEGIN 
        DELETE FROM Bibliotecas WHERE id = p_id;
    END Eliminar;
    
    PROCEDURE Consultar(
        p_nombre IN VARCHAR2,
        resultado OUT SYS_REFCURSOR      
    )IS
    BEGIN 
        OPEN resultado FOR
        SELECT * FROM bibliotecas WHERE id = p_nombre;
    END Consultar;
    
END PC_Bibliotecas;
/


--CRUDE
/*
CREATE OR REPLACE PACKAGE PC_Operaciones
--CRUDI
*/

--CRUDE
CREATE OR REPLACE PACKAGE PC_Compras AS
    PROCEDURE Adicionar(
        p_idOperacion IN CHAR,
        p_idPelicula IN CHAR,
        p_idSerie IN CHAR,
        p_pago IN NUMBER
    );
    PROCEDURE Modificar(
        p_IdOperacion IN CHAR,
        p_pago IN NUMBER
    );
    
    PROCEDURE Eliminar(
        p_idOperacion IN CHAR
    );
    
    PROCEDURE Consultar(
        p_idOperacion IN CHAR,
        resultado OUT SYS_REFCURSOR      
    );
    
END PC_Compras;
/
--CRUDI
CREATE OR REPLACE PACKAGE BODY PC_Compras AS
    PROCEDURE Adicionar(
            p_idOperacion IN CHAR,
            p_idPelicula IN CHAR,
            p_idSerie IN CHAR,
            p_pago IN NUMBER
    )IS
    BEGIN
        INSERT INTO Compras(idOperacion,idPelicula,idSerie,pago)
        VALUES (p_idOperacion,p_idPelicula,p_idSerie,p_pago);
    END Adicionar;
    
     PROCEDURE Modificar(
        p_idOperacion IN CHAR,
        p_pago IN NUMBER
    )IS
    BEGIN
        UPDATE compras 
        SET pago = p_pago
        WHERE idOperacion = p_idOperacion;
    END Modificar;
    
    PROCEDURE Eliminar(
        p_idOperacion IN CHAR
    )IS
    BEGIN
        DELETE FROM Compras WHERE idOperacion = p_idOperacion;
    END Eliminar;
    
    PROCEDURE Consultar(
        p_idOperacion IN CHAR,
        resultado OUT SYS_REFCURSOR      
    )IS
     BEGIN 
        OPEN resultado FOR
        SELECT * FROM compras WHERE idOperacion = p_idOperacion;
    END Consultar;
    
END PC_Compras;
/
    
    
    
   
    

    
    
    
    

    
