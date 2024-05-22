--CRUDE
CREATE OR REPLACE PACKAGE PC_Cuentas AS
    PROCEDURE Adicionar(
        nombre IN VARCHAR2,
        correo IN VARCHAR2,
        contrasena IN VARCHAR2,
        telefono IN CHAR
        );
    PROCEDURE Modificar(
        nombre IN VARCHAR2,
        correo IN VARCHAR2,
        contrasena IN VARCHAR2,
        telefono IN CHAR
        );
    PROCEDURE Eliminar(
        nombre IN VARCHAR2,
        correo IN VARCHAR2,
        contrasena IN VARCHAR2
        );
    PROCEDURE consultar(
        nombre IN VARCHAR2,
        correo IN VARCHAR2,
        resultado OUT SYS_REFCURSOR
        );
END PC_Cuentas;
/
--CRUDI
 CREATE OR REPLACE PACKAGE BODY PC_Cuentas AS
    PROCEDURE Adicionar(
        nombre IN VARCHAR2,
        correo IN VARCHAR2,
        contrasena IN VARCHAR2,
        telefono IN CHAR
    ) IS
    BEGIN
        INSERT INTO cuentas (nombre, correo, contrasena, telefono) 
        VALUES (nombre, correo, contrasena, telefono);
    END Adicionar;
    
    PROCEDURE Modificar(
        nombre IN VARCHAR2,
        correo IN VARCHAR2,
        contrasena IN VARCHAR2,
        telefono IN CHAR
    ) IS
    BEGIN 
        UPDATE cuentas 
        SET correo = correo,
            contrasena = contrasena,
            telefono = telefono
        WHERE nombre = nombre;
    END Modificar;
    
    PROCEDURE Eliminar(
        nombre IN VARCHAR2,
        correo IN VARCHAR2,
        contrasena IN VARCHAR2
    ) IS
    BEGIN
        DELETE FROM cuentas WHERE nombre = nombre AND correo = correo AND contrasena = contrasena;
    END Eliminar;
    
    PROCEDURE Consultar(
        nombre IN VARCHAR2,
        correo IN VARCHAR2,
        resultado OUT SYS_REFCURSOR
    ) IS 
    BEGIN 
        OPEN resultado FOR
        SELECT * FROM cuentas
        WHERE nombre = nombre AND correo = correo;
    END consultar;
END PC_Cuentas;
/

--CRUDE
CREATE OR REPLACE PACKAGE PC_Distribuidores AS
    PROCEDURE Adicionar(
        nombre IN VARCHAR2
    );
    PROCEDURE Modificar(
        nombre IN VARCHAR2,
        id IN VARCHAR2
    );
    PROCEDURE Eliminar(
        nombre IN VARCHAR2,
        id IN VARCHAR2
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
    
    PROCEDURE Modificar(
        nombre IN VARCHAR2,
        id IN VARCHAR2
    ) IS
    BEGIN
        UPDATE Distribuidores 
        SET nombre = nombre
        WHERE id = id;
    END Modificar;
    
    PROCEDURE Eliminar(
        nombre IN VARCHAR2,
        id IN VARCHAR2
    ) IS
    BEGIN
        DELETE FROM Distribuidores WHERE id = id;
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
    
    
