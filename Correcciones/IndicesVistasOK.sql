INSERT INTO Distribuidores (nombre) VALUES ('Quitzon');
INSERT INTO Peliculas (director, fechaLanzamiento, productora, precioCompra, precioRenta, duracion, distribuidor) VALUES ('Ava', TO_DATE('24/03/2021', 'DD/MM/YYYY'), 'Schmidt, Kreiger', 3000, 3000, '01:52:02', 'Quitzon' );
INSERT INTO Cuentas (id, nombre, correo, contrasena, telefono, fechaCreacion) VALUES ('400000000000000001', 'Sindee', 'scawthera0@foxnews.com','pepsi', '+573001234567', TO_DATE('24/03/2022', 'DD/MM/YYYY'));
INSERT INTO Cuentas (id, nombre, correo, contrasena, telefono, fechaCreacion) VALUES ('400000000000000002', 'mama', 'foxxx@foxnews.com','pepsi', '+573001234567', TO_DATE('24/03/2022', 'DD/MM/YYYY'));
INSERT INTO operaciones (idCuenta) VALUES ('400000000000000001');
INSERT INTO operaciones (idCuenta) VALUES ('400000000000000002');
INSERT INTO Compras (idOperacion, idPelicula, pago) VALUES ('O3293051916540022154', 'P3540293464036095599');
INSERT INTO Compras (idOperacion, idPelicula, pago) VALUES ('O4279199931184627311', 'P3540293464036095599');
INSERT INTO Compras (idOperacion, idPelicula, pago) VALUES ('O1894349833897719801', 'P5891818105573397563');
INSERT INTO Compras (idOperacion, idPelicula, pago) VALUES ('O7472681562994915551', 'P6009303392020803239');



SELECT * FROM Ingresos;
