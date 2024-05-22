--CRUDOK
--PC_Cuentas
BEGIN
    PC_Cuentas.Adicionar('Miguel Paramo','megusta@disqus.com','superman','+573155334687');
    PC_Cuentas.Adicionar('Pedro Paramo','jlaffoleylane2@disqus.com','superman','+573155394687');
END;

SELECT * FROM cuentas;

BEGIN 
    PC_Cuentas.Modificar('Miguel Paramo', 'megusta@disqus.com','Batman' ,'+573155334687');
END;


--PC_Distribuidores
BEGIN
    PC_Distribuidores.Adicionar('Warner');
END;

SELECT * FROM distribuidores;

--PC_Peliculas
BEGIN
    PC_Peliculas.Adicionar('Boris', TO_DATE('24/03/2023', 'DD/MM/YYYY'), 'Kertzmann-Kub', 10000, 10000, '01:52:02','Fox');
END;

BEGIN
    PC_Peliculas.Modificar('Martin', TO_DATE('24/03/2023', 'DD/MM/YYYY'), 'Kertzmann-Kub', 10000, 10000, '01:52:02','Fox','P8613412119617787861');
END;
SELECT * FROM peliculas;

--PC_Series
BEGIN
    PC_Series.Adicionar('Dena', TO_DATE('24/03/2023', 'DD/MM/YYYY'), 'Macejkovic and Sons', 3000, 3000, 'Fox');
END;
SELECT * FROM series;
BEGIN
    PC_Series.Modificar('S6184169361785011360','Michael', TO_DATE('24/03/2023', 'DD/MM/YYYY'), 'Macejkovic and Sons', 3000, 3000, 'Fox');
END;
SELECT * FROM series;


--PC_Biblioteca
BEGIN
    PC_Bibliotecas.Adicionar('C5686158024051638299','El cartero');
END;

SELECT * FROM bibliotecas;

BEGIN
    PC_Bibliotecas.Modificar('B2573031438117822608','Sin nombre');
END;


--PC_Compras



