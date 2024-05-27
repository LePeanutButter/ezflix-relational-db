BEGIN
    PA_Cliente.adicionarCuenta('Juan Carlos','carlos.mejia@outlook.com','Iguana02','+573028295816');
    PA_Cliente.adicionarMetodosDePago('Juan Carlos', 1279845632846215, 'Juan Carlos', 381, TO_DATE('28/03/2031', 'DD/MM/YYYY'));
    PROCEDURE adicionarBibliotecas(p_nombre IN VARCHAR2, nombreCuenta IN VARCHAR2);
    PROCEDURE adicionarOperacion(nombreCuenta IN VARCHAR2, nombreContenido IN VARCHAR2, tipoOperacion IN VARCHAR2);
    PROCEDURE consultarPeliculas;
    PROCEDURE consultarSeries;
END;

SELECT * FROM Cuentas;