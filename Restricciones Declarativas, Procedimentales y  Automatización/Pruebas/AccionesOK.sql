INSERT INTO Distribuidores (nombre, fechaAsociacion) VALUES ('Bartell, Kiehn', TO_DATE('24/03/2020', 'DD/MM/YYYY'));
INSERT INTO Peliculas (id,  director, fechaLanzamiento, productora, precioCompra, precioRenta, duracion, distribuidor) VALUES ('100000000000000000', 'Boris', TO_DATE('24/03/2023', 'DD/MM/YYYY'), 'Kertzmann-Kub', 10000, 10000, '01:52:02', 'Bartell, Kiehn');
INSERT INTO Distribuidores (nombre, fechaAsociacion) VALUES ('Boyle Group', TO_DATE('24/03/2020', 'DD/MM/YYYY'));
INSERT INTO Series (id,  director, fechaLanzamiento, productora, precioCompra, precioRenta, distribuidor) VALUES ('300000000000000003', 'Dena', TO_DATE('24/03/2023', 'DD/MM/YYYY'), 'Macejkovic and Sons', 3000, 3000, 'Boyle Group');
INSERT INTO Episodios (idSerie, numeroTemporada, nombreEpisodio, numeroEpisodio, duracion) VALUES ('300000000000000003', 3, 'Bytecard', 3, '40:20:02');
INSERT INTO Peliculas (id,  director, fechaLanzamiento, productora, precioCompra, precioRenta, duracion, distribuidor) VALUES ('100000000000000009', 'Boris', TO_DATE('24/03/2023', 'DD/MM/YYYY'), 'Kertzmann-Kub', 10000, 10000, '01:52:02', 'Boyle Group');
INSERT INTO Versiones (idVersion,idPelicula, nombre, descripcion, categoria, edad,idioma) VALUES ('900000','100000000000000009', 'Return to Me', 'ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam', 'Musical', 18, 'English');
INSERT INTO Peliculas (id,  director, fechaLanzamiento, productora, precioCompra, precioRenta, duracion, distribuidor) VALUES ('300000000000000009', 'Ava', TO_DATE('24/03/2021', 'DD/MM/YYYY'), 'Schmidt, Kreiger', 3000, 3000, '01:52:02', 'Boyle Group');
INSERT INTO ContenidosAdicionales (id, idPelicula, nombre) VALUES ('10000000000000000', '300000000000000009', 'Doughboys');
INSERT INTO Peliculas (id,  director, fechaLanzamiento, productora, precioCompra, precioRenta, duracion, distribuidor) VALUES ('300000000000000019', 'Ava', TO_DATE('24/03/2021', 'DD/MM/YYYY'), 'Schmidt, Kreiger', 3000, 3000, '01:52:02', 'Boyle Group');
INSERT INTO ActoresPeliculas (idPelicula, nombre) VALUES ('300000000000000019', 'Lennie');
INSERT INTO Cuentas (id, nombre, correo, contrasena, telefono, fechaCreacion) VALUES ('400000000000000001', 'Sindee', 'scawthera0@foxnews.com','pepsi', '+573001234567', TO_DATE('24/03/2022', 'DD/MM/YYYY'));
INSERT INTO Bibliotecas (idCuenta, nombre, id, fechaCreacion) VALUES ('400000000000000001', 'Charmine', '500000000000000001', TO_DATE('24/03/2013', 'DD/MM/YYYY'));
INSERT INTO Cuentas (id, nombre, correo, contrasena, telefono, fechaCreacion) VALUES ('400000000000000002', 'Jilli', 'jlaffoleylane2@delicious.com', 'superman','+573155334607', TO_DATE('24/03/2022', 'DD/MM/YYYY'));
INSERT INTO Bibliotecas (idCuenta, nombre, id, fechaCreacion) VALUES ('400000000000000002', 'Charmi', '500000000000000002', TO_DATE('24/03/2013', 'DD/MM/YYYY'));
INSERT INTO Peliculas (id,  director, fechaLanzamiento, productora, precioCompra, precioRenta, duracion, distribuidor) VALUES ('200000000000000019', 'Ava', TO_DATE('24/03/2021', 'DD/MM/YYYY'), 'Schmidt, Kreiger', 3000, 3000, '01:52:02', 'Boyle Group');
INSERT INTO BibliotecasPeliculas (idBiblioteca, idPelicula) VALUES ('500000000000000002', '200000000000000019');
INSERT INTO operaciones (id, idCuenta) VALUES ('400000000000','400000000000000002');
INSERT INTO Compras (idOperacion, idPelicula, pago, fechaCompra) VALUES ('400000000000', '200000000000000019','20000', TO_DATE('25/03/2022', 'DD/MM/YYYY'));
INSERT INTO operaciones (id, idCuenta) VALUES ('400000000001','400000000000000002');
INSERT INTO Rentas (idOperacion, idPelicula, pago, dias, fechaRenta, fechaExpiracion) VALUES ('400000000001', '200000000000000019',20000, 30, TO_DATE('25/03/2022', 'DD/MM/YYYY'), TO_DATE('25/04/2022', 'DD/MM/YYYY'));


--Prueba de inserccion
SELECT * FROM peliculas;

SELECT * FROM Episodios;

SELECT * FROM Versiones;

SELECT * FROM ContenidosAdicionales;

SELECT * FROM ActoresPeliculas;

SELECT * FROM Bibliotecas;

SELECT * FROM BibliotecasPeliculas;

SELECT * FROM operaciones;

SELECT * FROM Compras;

SELECT * FROM Rentas;


---AccionOK
DELETE FROM Peliculas WHERE id = '100000000000000009';
SELECT * FROM Versiones;

DELETE FROM Peliculas WHERE id = '300000000000000009';
SELECT * FROM ContenidosAdicionales;

DELETE FROM Peliculas WHERE id = '300000000000000019';
SELECT * FROM ActoresPeliculas;

DELETE FROM cuentas WHERE id = '400000000000000001';
SELECT * FROM Bibliotecas;

DELETE FROM Bibliotecas WHERE id = '500000000000000002';
SELECT * FROM BibliotecasPeliculas;

DELETE FROM operaciones WHERE id = '400000000000';
SELECT * FROM Compras;

DELETE FROM operaciones WHERE id = '400000000001';
SELECT * FROM Rentas;
