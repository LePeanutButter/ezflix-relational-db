CREATE OR REPLACE PACKAGE PA_Cliente AS
    PROCEDURE adicionarCuenta(p_nombre IN VARCHAR2, p_correo IN VARCHAR2, p_contraseña IN VARCHAR2, p_telefono IN NUMBER);
    PROCEDURE adicionarMetodosDePago();
    PROCEDURE adicionarBibliotecas();
    PROCEDURE adicionarOperacion();
    FUNCTION consultarPeliculas();
    FUNCTION consultarSeries();
END PA_Cliente;
/

CREATE OR REPLACE PACKAGE BODY PA_Gerente AS
    PROCEDURE consultarBase(p_tabla IN VARCHAR2);
END PA_Gerente;
/