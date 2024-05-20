---DisparadoresOK
---TG_Distribuidores_BI
INSERT INTO Distribuidores(nombre) VALUES ('Warner');

---TG_Peliculas_BI
INSERT INTO Peliculas (director, fechaLanzamiento, productora, precioCompra, precioRenta, duracion, distribuidor) VALUES ('Ava', TO_DATE('24/03/2021', 'DD/MM/YYYY'), 'Schmidt, Kreiger', 3000, 3000, '01:52:02', 'Warner');

---TG_Series_BI
INSERT INTO Series ( director, fechaLanzamiento, productora, precioCompra, precioRenta, distribuidor) VALUES ('Wolfgang', TO_DATE('24/03/2023', 'DD/MM/YYYY'), 'Hoeger, Gerhold ', 10000, 10000, 'Warner');

---TG_Versiones_BI
INSERT INTO Versiones (idSerie, nombre, descripcion, categoria, edad,idioma) VALUES ('S3628689514798662868', 'Return to Me', 'ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam', 'Musical', 18, 'English');

---TG_ContenidosAdicionales_BI
INSERT INTO ContenidosAdicionales (idSerie, nombre) VALUES ('S3628689514798662868', 'Doughboys');

---TG_Cuentas_BI
INSERT INTO Cuentas (id,nombre, correo, contrasena, telefono, fechaCreacion) VALUES ('400000000000000003','mmmm', 'saddssd2@icious.com', 'superman','+573155334607', TO_DATE('24/03/2022', 'DD/MM/YYYY'));

---TG_Bibliotecas_BI 
INSERT INTO Bibliotecas (idCuenta, nombre) VALUES ('400000000000000003', 'Winna');

---TG_Operaciones_BI
INSERT INTO  operaciones (idCuenta) VALUES ('400000000000000003');

---TG_Operaciones_AI
INSERt INTO auditorias(idOperacion,operacion, fechaOperacion)VALUES ('O5464708517924057790','create', TO_DATE('25/03/2028', 'DD/MM/YYYY'));

UPDATE Auditorias SET operacion = 'DELETE' WHERE idOperacion = 'O5464708517924057790';
SELECT * FROM auditorias WHERE idOperacion = 'O5464708517924057790';

---TG_Compras_BI
INSERT INTO Compras (idOperacion, idPelicula, pago) VALUES ('O5464708517924057790', 'P2967681405221897760', '20000');
SELECT * FROM compras;

---TG_BibliotecasPeliculas_BI
INSERT INTO  BibliotecasPeliculas (idBiblioteca, idPelicula) VALUES ('B5362409354233860012', 'P2967681405221897760');

---TG_BibliotecasSeries_BI
INSERT INTO BibliotecasSeries (idBiblioteca, idSerie) VALUES ('B5362409354233860012', '300000000000000001');
