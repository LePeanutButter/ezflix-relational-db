---Ejecutar esto primero
INSERT INTO Cuentas (nombre, correo, contrasena, telefono) VALUES ('mmmm', 'saddssd2@icious.com', 'superman','+573155334607');
SELECT * FROM CUENTAS;

INSERT INTO  operaciones (idCuenta) VALUES ('C8752125873332395919');
INSERT INTO  operaciones (idCuenta) VALUES ('C8752125873332395919');
INSERT INTO  operaciones (idCuenta) VALUES ('C8752125873332395919');
SELECT * FROM operaciones;

INSERT INTO Distribuidores(nombre) VALUES ('Warner');
INSERT INTO Peliculas (director, fechaLanzamiento, productora, precioCompra, precioRenta, duracion, distribuidor) VALUES ('Ava', TO_DATE('24/03/2021', 'DD/MM/YYYY'), 'Schmidt, Kreiger', 3000, 3000, '01:52:02', 'Warner');
SELECT * FROM Peliculas;

INSERT INTO Series ( director, fechaLanzamiento, productora, precioCompra, precioRenta, distribuidor) VALUES ('Wolfgang', TO_DATE('24/03/2023', 'DD/MM/YYYY'), 'Hoeger, Gerhold ', 10000, 10000, 'Warner');
SELECT * FROM Series;


INSERT INTO Compras (idOperacion, idPelicula) VALUES ('O7015952250875736750', 'P2980740264277016479');
INSERT INTO Compras (idOperacion, idSerie) VALUES ('O9531870670360760665', 'S5608977749744361924');

---TG_Compras_BI, no se puede comprar la pelicula mas de una vez.
INSERT INTO Compras (idOperacion, idPelicula) VALUES ('O7015952250875736750', 'P2980740264277016479');
INSERT INTO Compras (idOperacion, idSerie) VALUES ('O9531870670360760665', 'S5608977749744361924');
---TG_Compras_BI, No se ha proporcionado ni idPelicula ni idSerie.
INSERT INTO Compras (idOperacion) VALUES ('O8343906284161081911');
