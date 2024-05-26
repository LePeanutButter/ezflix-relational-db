--CORRER PRIMERO ESTO
INSERT INTO Distribuidores (nombre, fechaAsociacion) VALUES ('Quitzon', TO_DATE('24/03/2020', 'DD/MM/YYYY'));
INSERT INTO Peliculas (id,  director, fechaLanzamiento, productora, precioCompra, precioRenta, duracion, distribuidor) VALUES ('300000000000000000', 'Ava', TO_DATE('24/03/2021', 'DD/MM/YYYY'), 'Schmidt, Kreiger', 3000, 3000, '01:52:02', 'Quitzon');
INSERT INTO Series (id,  director, fechaLanzamiento, productora, precioCompra, precioRenta, distribuidor) VALUES ('300000000000000003', 'Dena', TO_DATE('24/03/2023', 'DD/MM/YYYY'), 'Macejkovic and Sons', 3000, 3000, 'Quitzon');
INSERT INTO Cuentas (id, nombre, correo, contrasena, telefono, fechaCreacion) VALUES ('400000000000000003', 'Jilli', 'jlaffoleylane2@delicious.com', 'superman','+573155334607', TO_DATE('24/03/2022', 'DD/MM/YYYY'));
INSERT INTO  Operaciones (id, idCuenta) VALUES ('400000000004','400000000000000003');


---TuplasNoOK 

INSERT INTO Versiones (idVersion,idPelicula,idSerie, nombre, descripcion, categoria, edad,idioma) VALUES ('900000','300000000000000000', '300000000000000003','Return to Me', 'ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam', 'Musical', 18, 'English');
INSERT INTO Compras (idOperacion, idPelicula,idSerie, pago, fechaCompra) VALUES ('400000000000', '300000000000000000','300000000000000003','20000', TO_DATE('25/03/2022', 'DD/MM/YYYY'));
INSERT INTO Rentas (idOperacion, idSerie,idPelicula, pago, dias, fechaRenta, fechaExpiracion) VALUES ('400000000000', '300000000000000001','300000000000000000',20000, 30, TO_DATE('25/03/2022', 'DD/MM/YYYY'), TO_DATE('25/04/2022', 'DD/MM/YYYY'));
INSERT INTO ContenidosAdicionales (id, idSerie,idPelicula, nombre) VALUES ('10000000000000000', '300000000000000001','300000000000000000' ,'Doughboys');


