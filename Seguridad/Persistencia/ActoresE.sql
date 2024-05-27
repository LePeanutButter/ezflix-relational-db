CREATE OR REPLACE PACKAGE PA_Cliente AS
    PROCEDURE adicionarCuenta(p_nombre IN VARCHAR2, p_correo IN VARCHAR2, p_contrasena IN VARCHAR2, p_telefono IN NUMBER);
    PROCEDURE adicionarMetodosDePago(nombreCuenta IN VARCHAR2, p_numero IN NUMBER, p_nombre IN VARCHAR2, p_cvv IN NUMBER, p_fechaExpiracion IN DATE);
    PROCEDURE adicionarBibliotecas(p_nombre IN VARCHAR2, nombreCuenta IN VARCHAR2);
    PROCEDURE adicionarOperacion(nombreCuenta IN VARCHAR2, nombreContenido IN VARCHAR2, tipoOperacion IN VARCHAR2);
    PROCEDURE consultarPeliculas;
    PROCEDURE consultarSeries;
END PA_Cliente;
/

CREATE OR REPLACE PACKAGE PA_Gerente AS
    PROCEDURE consultarBase(p_tabla IN VARCHAR2);
END PA_Gerente;
/

CREATE OR REPLACE PACKAGE PA_Auditor AS
    PROCEDURE consultarAuditoria;
END PA_Auditor;
/

CREATE OR REPLACE PACKAGE PA_Soporte AS
    PROCEDURE adicionarCuenta(p_nombre IN VARCHAR2, p_correo IN VARCHAR2, p_contrasena IN VARCHAR2, p_telefono IN NUMBER);
    PROCEDURE consultarCuenta;
    PROCEDURE modificarCuenta(p_nombre IN VARCHAR2, p_correo IN VARCHAR2, p_contrasena IN VARCHAR2, p_telefono IN NUMBER);
    PROCEDURE eliminarCuenta(p_nombre IN VARCHAR2, p_correo IN VARCHAR2);
    PROCEDURE adicionarMetodosDePago(nombreCuenta IN VARCHAR2, p_numero IN NUMBER, p_nombre IN VARCHAR2, p_cvv IN NUMBER, p_fechaExpiracion IN DATE);
    PROCEDURE consultarMetodosDePago;
    PROCEDURE modificarMetodosDePago(nombreCuenta IN VARCHAR2, p_numero IN NUMBER, p_nombre IN VARCHAR2, p_cvv IN NUMBER, p_fechaExpiracion IN DATE);
    PROCEDURE eliminarMetodosDePago(nombreCuenta IN VARCHAR2, p_numero IN NUMBER);
    PROCEDURE adicionarBiblioteca(p_nombre IN VARCHAR2, nombreCuenta IN VARCHAR2);
    PROCEDURE consultarBiblioteca;
    PROCEDURE modificarBiblioteca(p_nombre IN VARCHAR2, nombreCuenta IN VARCHAR2, biblioteca IN VARCHAR2);
    PROCEDURE eliminarBiblioteca(nombreCuenta IN VARCHAR2, p_nombre IN NUMBER);
    PROCEDURE adicionarOperacion(nombreCuenta IN VARCHAR2, nombreContenido IN VARCHAR2, tipoOperacion IN VARCHAR2);
    PROCEDURE eliminarOperacion(nombreCuenta IN VARCHAR2, nombreContenido IN VARCHAR2, tipoOperacion IN VARCHAR2);
END PA_Soporte;
/

CREATE OR REPLACE PACKAGE PA_Administrador AS
    PROCEDURE insertarPelicula(p_nombre IN VARCHAR2, p_idioma IN VARCHAR2, p_categoria IN VARCHAR2, p_descripcion IN VARCHAR2, p_edad IN NUMBER, p_director IN VARCHAR2, p_fechaLanzamiento IN DATE, p_productora IN VARCHAR2, p_precioCompra IN NUMBER, p_precioRenta IN NUMBER, p_duracion IN VARCHAR2, p_distribuidor IN VARCHAR2);
    PROCEDURE modificarPelicula(nombreAntiguo IN VARCHAR2, p_nombre IN VARCHAR2, p_idioma IN VARCHAR2, p_categoria IN VARCHAR2, p_descripcion IN VARCHAR2, p_edad IN NUMBER, p_director IN VARCHAR2, p_fechaLanzamiento IN DATE, p_productora IN VARCHAR2, p_precioCompra IN NUMBER, p_precioRenta IN NUMBER, p_duracion IN VARCHAR2, p_distribuidor IN VARCHAR2);
    PROCEDURE eliminarPelicula(p_nombre IN VARCHAR2);
    PROCEDURE insertarSerie(p_nombre IN VARCHAR2, p_idioma IN VARCHAR2, p_categoria IN VARCHAR2, p_descripcion IN VARCHAR2, p_edad IN NUMBER, p_director IN VARCHAR2, p_fechaLanzamiento IN DATE, p_productora IN VARCHAR2, p_precioCompra IN NUMBER, p_precioRenta IN NUMBER, p_distribuidor IN VARCHAR2);
    PROCEDURE modificarSerie(nombreAntiguo IN VARCHAR2, p_nombre IN VARCHAR2, p_idioma IN VARCHAR2, p_categoria IN VARCHAR2, p_descripcion IN VARCHAR2, p_edad IN NUMBER, p_director IN VARCHAR2, p_fechaLanzamiento IN DATE, p_productora IN VARCHAR2, p_precioCompra IN NUMBER, p_precioRenta IN NUMBER, p_distribuidor IN VARCHAR2);
    PROCEDURE eliminarSerie(p_nombre IN VARCHAR2);
    PROCEDURE insertarDistribuidor(p_nombre IN VARCHAR2);
    PROCEDURE modificarDistribuidor(nombreAntiguo IN VARCHAR2, p_nombre IN VARCHAR2);
    PROCEDURE eliminarDistribuidor(p_nombre IN VARCHAR2);
    FUNCTION consultarOperaciones RETURN NUMBER;
    PROCEDURE consultarBase(p_tabla IN VARCHAR2);
END PA_Administrador;
/