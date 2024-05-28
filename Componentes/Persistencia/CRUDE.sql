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

CREATE OR REPLACE PACKAGE PC_Peliculas_Version AS
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
    );
    
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
    );
    
    PROCEDURE Eliminar(
        p_idVersion IN VARCHAR2,
        p_id IN VARCHAR2
    );
    
    PROCEDURE Consultar(
        p_id IN VARCHAR2,
        resultado OUT SYS_REFCURSOR
    );
END PC_Peliculas_Version;
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
    
END PC_Series;
/

CREATE OR REPLACE PACKAGE PC_Bibliotecas AS
    PROCEDURE Adicionar(
        p_nombreCuenta IN VARCHAR2,
        p_nombre IN VARCHAR2
    );
    PROCEDURE Modificar(
        p_nombreCuenta IN VARCHAR2,
        p_nombre IN VARCHAR2
    );
    PROCEDURE Eliminar(
        p_nombre IN VARCHAR2
    );
    PROCEDURE Consultar(
        p_nombre IN VARCHAR2,
        resultado OUT SYS_REFCURSOR      
    );
END PC_Bibliotecas;
/

CREATE OR REPLACE PACKAGE PC_Operacion_Compra AS
    PROCEDURE Adicionar(
        p_nombreCuenta IN VARCHAR2,
        p_nombrePelicula IN VARCHAR2,
        p_pago IN NUMBER
    );
    PROCEDURE Modificar(
        p_idOperacion IN CHAR,
        p_pago IN NUMBER
    );
    
    PROCEDURE Eliminar(
        p_idOperacion IN CHAR
    );
    
    PROCEDURE Consultar(
        p_idOperacion IN CHAR,
        resultado OUT SYS_REFCURSOR      
    );
    
END PC_Operacion_Compra;
/

CREATE OR REPLACE PACKAGE PC_MetodoPago AS
    PROCEDURE Adicionar(
        p_nombreCuenta IN VARCHAR2,
        p_numero IN NUMBER,
        p_nombre IN VARCHAR2,
        p_cvv IN NUMBER,
        p_fechaExpiracion IN DATE
    );
    PROCEDURE Modificar(
        p_nombreCuenta IN VARCHAR2,
        p_numero IN NUMBER,
        p_nombre IN VARCHAR2,
        p_cvv IN NUMBER,
        p_fechaExpiracion IN DATE
    );
    
    PROCEDURE Eliminar(
        p_nombreCuenta IN CHAR,
        p_numero IN NUMBER
    );
    
    PROCEDURE Consultar(
        p_numero IN NUMBER,
        resultado OUT SYS_REFCURSOR      
    );
    
END PC_MetodoPago;
/
CREATE OR REPLACE PACKAGE PC_BibliotecasPeliculas AS
    PROCEDURE Adicionar(
        p_nombreBiblioteca IN VARCHAR2,
        p_nombrePelicula IN VARCHAR2
    );
    
    PROCEDURE Eliminar(
        p_nombreBiblioteca IN VARCHAR2,
        p_nombrePelicula IN VARCHAR2
    );
    
    PROCEDURE Consultar(
        p_nombreBiblioteca IN VARCHAR2,
        resultado OUT SYS_REFCURSOR  
    );
END PC_BibliotecasPeliculas;
/

CREATE OR REPLACE PACKAGE PC_GestoresDeAvisos AS
    PROCEDURE Adicionar(
        p_idRenta IN VARCHAR2,
        P_tipoAviso IN VARCHAR2,
        p_fechaCreacion IN DATE,
        p_mensaje IN VARCHAR2,
        p_estadoAviso IN VARCHAR2,
        p_estadoAlerta IN VARCHAR2,
        p_destinatario IN VARCHAR2
    );
    PROCEDURE Modificar(
        p_id IN VARCHAR2,
        p_estadoAviso IN VARCHAR2,
        p_estadoAlerta IN VARCHAR2
    );
    PROCEDURE Eliminar(
        p_id IN VARCHAR2
    );
END PC_GestoresDeAvisos;
/



