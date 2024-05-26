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



