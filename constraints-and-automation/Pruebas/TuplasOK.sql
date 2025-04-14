--1
INSERT INTO Distribuidores (nombre, fechaAsociacion) VALUES ('Bartell, Kiehn', TO_DATE('24/03/2020', 'DD/MM/YYYY'));
INSERT INTO Peliculas (id,  director, fechaLanzamiento, productora, precioCompra, precioRenta, duracion, distribuidor) VALUES ('100000000000000000', 'Boris', TO_DATE('24/03/2023', 'DD/MM/YYYY'), 'Kertzmann-Kub', 10000, 10000, '01:52:02', 'Bartell, Kiehn');
INSERT INTO Series (id,  director, fechaLanzamiento, productora, precioCompra, precioRenta, distribuidor) VALUES ('300000000000000001', 'Wolfgang', TO_DATE('24/03/2023', 'DD/MM/YYYY'), 'Hoeger, Gerhold ', 10000, 10000, 'Bartell, Kiehn');
INSERT INTO Versiones (idVersion,idPelicula, nombre, descripcion, categoria, edad,idioma) VALUES ('900000','100000000000000000', 'Return to Me', 'ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam', 'Musical', 18, 'English');
--2
INSERT INTO Cuentas (id, nombre, correo, contrasena, telefono, fechaCreacion) VALUES ('400000000000000001', 'Sindee', 'scawthera0@foxnews.com','pepsi', '+573001234567', TO_DATE('24/03/2022', 'DD/MM/YYYY'));
INSERT INTO Operaciones (id, idCuenta) VALUES ('400000000000','400000000000000001');
INSERT INTO Compras (idOperacion, idPelicula, pago, fechaCompra) VALUES ('400000000000', '100000000000000000','20000', TO_DATE('25/03/2022', 'DD/MM/YYYY'));
--3
INSERT INTO Rentas (idOperacion, idSerie, pago, dias, fechaRenta, fechaExpiracion) VALUES ('400000000000', '300000000000000001',20000, 30, TO_DATE('25/03/2022', 'DD/MM/YYYY'), TO_DATE('25/04/2022', 'DD/MM/YYYY'));
--4
INSERT INTO ContenidosAdicionales (id, idSerie, nombre) VALUES ('10000000000000000', '300000000000000001', 'Doughboys');



