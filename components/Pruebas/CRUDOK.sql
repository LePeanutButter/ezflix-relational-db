--CRUDOK
--PC_Cuentas
BEGIN
    PC_Cuentas.Adicionar('Miguel Paramo','megxxxsta@disqus.com','superman','+573155334687');
    PC_Cuentas.Adicionar('Pedro Paramo','jlaffoleylane2@disqus.com','superman','+573155394687');
END;

SELECT * FROM cuentas;

BEGIN 
    PC_Cuentas.Modificar('Miguel Paramo', 'megusta@disqus.com','Batman' ,'+573155334687');
END;

BEGIN 
    PC_Cuentas.Eliminar('Miguel Paramo','megusta@disqus.com','Batman');
END;

--PC_Distribuidores
BEGIN
    PC_Distribuidores.Adicionar('Warner');
    PC_Distribuidores.Adicionar('Fox');
    
END;

BEGIN
    PC_Distribuidores.eliminar('Warner');
END;


SELECT * FROM distribuidores;

--PC_Peliculas
BEGIN
    PC_Peliculas_Version.Adicionar('Toro', 'Pelicula acerca de un luchador', 'Drama', 18, 'Espanol','Marin Scorsese',TO_DATE('24/03/2023', 'DD/MM/YYYY'), 'Kertzmann-Kub', 10000, 10000, '01:52:02','Fox');
END;

BEGIN
    PC_Peliculas_Version.Eliminar('P4137628589195133902');
END;

SELECT * FROM peliculas;
SELECT * FROM versiones;


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
    PC_Bibliotecas.Adicionar('Pedro Paramo','El cartero');
END;

SELECT * FROM bibliotecas;

BEGIN
    PC_Bibliotecas.Modificar('Pedro Paramo','Sin nombre');
END;


--PC_Compras

BEGIN
    PC_Operacion_Compra.Adicionar('Pedro Paramo','Toro Salvaje',10000);
END;

SELECT * FROM compras;


--PC_metodoDePago
BEGIN
    pc_metodopago.Adicionar('Pedro Paramo',3537605219871229, 'pedrito',345, SYSDATE);
END;

BEGIN
    pc_metodopago.modificar('Pedro Paramo',3537605219871229, 'pedrito',395, SYSDATE);
END;


BEGIN
    pc_metodopago.eliminar('Pedro Paramo',3537605219871229);
END;
--PC_BibliotecasPeliculas

BEGIN
    PC_BibliotecasPeliculas.Adicionar('Sin nombre','Toro Salvaje');
END;
SELECT * FROM bibliotecaspeliculas;
BEGIN
    PC_BibliotecasPeliculas.eliminar('Sin nombre','Toro Salvaje');
END;
