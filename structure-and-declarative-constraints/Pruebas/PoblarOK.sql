-- Ciclo Uno
INSERT INTO Distribuidores (nombre, fechaAsociacion) VALUES ('Bartell, Kiehn', TO_DATE('24/03/2020', 'DD/MM/YYYY'));
INSERT INTO Distribuidores (nombre, fechaAsociacion) VALUES ('Lindgren-Spinka', TO_DATE('24/03/2020', 'DD/MM/YYYY'));
INSERT INTO Distribuidores (nombre, fechaAsociacion) VALUES ('Bergnaum-', TO_DATE('24/03/2020', 'DD/MM/YYYY'));
INSERT INTO Distribuidores (nombre, fechaAsociacion) VALUES ('Gibson and Sons', TO_DATE('24/03/2020', 'DD/MM/YYYY'));
INSERT INTO Distribuidores (nombre, fechaAsociacion) VALUES ('Quitzon', TO_DATE('24/03/2020', 'DD/MM/YYYY'));
INSERT INTO Distribuidores (nombre, fechaAsociacion) VALUES ('Boyle Group', TO_DATE('24/03/2020', 'DD/MM/YYYY'));

INSERT INTO Peliculas (id,  director, fechaLanzamiento, productora, precioCompra, precioRenta, duracion, distribuidor) VALUES ('100000000000000000', 'Boris', TO_DATE('24/03/2023', 'DD/MM/YYYY'), 'Kertzmann-Kub', 10000, 10000, '01:52:02', 'Bartell, Kiehn');
INSERT INTO Peliculas (id,  director, fechaLanzamiento, productora, precioCompra, precioRenta, duracion, distribuidor) VALUES ('200000000000000000', 'Elmo', TO_DATE('24/03/2022', 'DD/MM/YYYY'), 'Hintz, Watsic', 2000, 2000, '01:52:02', 'Lindgren-Spinka');
INSERT INTO Peliculas (id,  director, fechaLanzamiento, productora, precioCompra, precioRenta, duracion, distribuidor) VALUES ('300000000000000000', 'Ava', TO_DATE('24/03/2021', 'DD/MM/YYYY'), 'Schmidt, Kreiger', 3000, 3000, '01:52:02', 'Bergnaum-');

INSERT INTO Series (id,  director, fechaLanzamiento, productora, precioCompra, precioRenta, distribuidor) VALUES ('300000000000000001', 'Wolfgang', TO_DATE('24/03/2023', 'DD/MM/YYYY'), 'Hoeger, Gerhold ', 10000, 10000, 'Gibson and Sons');
INSERT INTO Series (id,  director, fechaLanzamiento, productora, precioCompra, precioRenta, distribuidor) VALUES ('300000000000000002', 'Anya', TO_DATE('24/03/2023', 'DD/MM/YYYY'), 'Pfannerstill LLC', 2000, 2000, 'Quitzon');
INSERT INTO Series (id,  director, fechaLanzamiento, productora, precioCompra, precioRenta, distribuidor) VALUES ('300000000000000003', 'Dena', TO_DATE('24/03/2023', 'DD/MM/YYYY'), 'Macejkovic and Sons', 3000, 3000, 'Boyle Group');

INSERT INTO Episodios (idSerie, numeroTemporada, nombreEpisodio, numeroEpisodio, duracion) VALUES ('300000000000000001', 1, 'Asoka', 1, '40:20:02');
INSERT INTO Episodios (idSerie, numeroTemporada, nombreEpisodio, numeroEpisodio, duracion) VALUES ('300000000000000002', 2, 'Andalax', 2, '40:20:02');
INSERT INTO Episodios (idSerie, numeroTemporada, nombreEpisodio, numeroEpisodio, duracion) VALUES ('300000000000000003', 3, 'Bytecard', 3, '40:20:02');

INSERT INTO Versiones (idVersion,idPelicula, nombre, descripcion, categoria, edad,idioma) VALUES ('900000','100000000000000000', 'Return to Me', 'ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam', 'Musical', 18, 'English');
INSERT INTO Versiones (idVersion,idPelicula, nombre, descripcion, categoria, edad,idioma) VALUES ('900001','200000000000000000', 'Home Movie', 'in quam fringilla rhoncus mauris enim', 'Accion', 13, 'English');
INSERT INTO Versiones (idVersion,idPelicula, nombre, descripcion, categoria, edad,idioma) VALUES ('900002','300000000000000000', 'Crocodile Dundee II', 'in libero ut massa volutpat convallis morbi', 'Fantasia',7, 'English');
INSERT INTO Versiones (idVersion,idSerie, nombre, descripcion, categoria, edad,idioma) VALUES ('900003','300000000000000001', 'Spawn', 'sit amet turpis elementum ligula vehicula consequat morbi a ipsum', 'Suspenso', 15, 'English');
INSERT INTO Versiones (idVersion,idSerie, nombre, descripcion, categoria, edad,idioma) VALUES ('900004','300000000000000002', 'Head Over Heels', 'quam pharetra magna ac consequat', 'Suspenso', 15, 'English');
INSERT INTO Versiones (idVersion,idSerie, nombre, descripcion, categoria, edad,idioma) VALUES ('900005','300000000000000003', 'The Last Mimzy', 'ullamcorper augue a suscipit nulla', 'Fantasia', 13, 'English');

INSERT INTO ContenidosAdicionales (id, idSerie, nombre) VALUES ('10000000000000000', '300000000000000001', 'Doughboys');
INSERT INTO ContenidosAdicionales (id, idPelicula, nombre) VALUES ('100000000000000005', '200000000000000000', 'The Last Diamond');
INSERT INTO ContenidosAdicionales (id, idSerie, nombre) VALUES ('100000000000000006', '300000000000000003', 'All Things to All');

INSERT INTO ActoresPeliculas (idPelicula, nombre) VALUES ('100000000000000000', 'Lennie');
INSERT INTO ActoresPeliculas (idPelicula, nombre) VALUES ('100000000000000000', 'Brannon');
INSERT INTO ActoresPeliculas (idPelicula, nombre) VALUES ('100000000000000000', 'Gregoire');

INSERT INTO ActoresSeries (idSerie, nombre) VALUES ('300000000000000001', 'Brooke');
INSERT INTO ActoresSeries (idSerie, nombre) VALUES ('300000000000000001', 'Marrilee');
INSERT INTO ActoresSeries (idSerie, nombre) VALUES ('300000000000000003', 'Tammi');

INSERT INTO Cuentas (id, nombre, correo, contrasena, telefono, fechaCreacion) VALUES ('400000000000000001', 'Sindee', 'scawthera0@foxnews.com','pepsi', '+573001234567', TO_DATE('24/03/2022', 'DD/MM/YYYY'));
INSERT INTO Cuentas (id, nombre, correo, contrasena, telefono, fechaCreacion) VALUES ('400000000000000002', 'Moselle', 'maizikovitz1@disqus.com', 'cocacola','+573215524667', TO_DATE('24/03/2022', 'DD/MM/YYYY'));
INSERT INTO Cuentas (id, nombre, correo, contrasena, telefono, fechaCreacion) VALUES ('400000000000000003', 'Jilli', 'jlaffoleylane2@delicious.com', 'superman','+573155334607', TO_DATE('24/03/2022', 'DD/MM/YYYY'));


INSERT INTO Bibliotecas (idCuenta, nombre, id, fechaCreacion) VALUES ('400000000000000001', 'Charmine', '500000000000000001', TO_DATE('24/03/2013', 'DD/MM/YYYY'));
INSERT INTO Bibliotecas (idCuenta, nombre, id, fechaCreacion) VALUES ('400000000000000002', 'Sheff', '500000000000000002', TO_DATE('24/03/2013', 'DD/MM/YYYY'));
INSERT INTO Bibliotecas (idCuenta, nombre, id, fechaCreacion) VALUES ('400000000000000003', 'Winna', '500000000000000003', TO_DATE('24/03/2013', 'DD/MM/YYYY'));

INSERT INTO  BibliotecasPeliculas (idBiblioteca, idPelicula) VALUES ('500000000000000001', '100000000000000000');
INSERT INTO  BibliotecasPeliculas (idBiblioteca, idPelicula) VALUES ('500000000000000002', '200000000000000000');
INSERT INTO  BibliotecasPeliculas (idBiblioteca, idPelicula) VALUES ('500000000000000003', '300000000000000000');

INSERT INTO BibliotecasSeries (idBiblioteca, idSerie) VALUES ('500000000000000003', '300000000000000001');

INSERT INTO  operaciones (id, idCuenta) VALUES ('400000000000','400000000000000001');
INSERT INTO  operaciones (id, idCuenta) VALUES ('400000000001','400000000000000002');
INSERT INTO  operaciones (id, idCuenta) VALUES ('400000000002','400000000000000003');
INSERT INTO  operaciones (id, idCuenta) VALUES ('400000000004','400000000000000003');


INSERT INTO Compras (idOperacion, idPelicula, pago, fechaCompra) VALUES ('400000000000', '100000000000000000','20000', TO_DATE('25/03/2022', 'DD/MM/YYYY'));
INSERT INTO Compras (idOperacion, idPelicula, pago, fechaCompra) VALUES ('400000000001', '200000000000000000', '20000',TO_DATE('24/03/2022', 'DD/MM/YYYY'));
INSERT INTO Compras (idOperacion, idPelicula, pago, fechaCompra) VALUES ('400000000002', '300000000000000000', '20000',TO_DATE('24/03/2022', 'DD/MM/YYYY'));

INSERT INTO Rentas (idOperacion, idSerie, pago, dias, fechaRenta, fechaExpiracion) VALUES ('400000000004', '300000000000000001',20000, 30, TO_DATE('25/03/2022', 'DD/MM/YYYY'), TO_DATE('25/04/2022', 'DD/MM/YYYY'));

INSERt INTO auditorias(idOperacion,operacion, fechaOperacion)VALUES ('400000000000','create', TO_DATE('25/03/2028', 'DD/MM/YYYY'));
INSERt INTO auditorias(idOperacion,operacion, fechaOperacion)VALUES ('400000000001','delete', TO_DATE('25/03/2028', 'DD/MM/YYYY'));
INSERt INTO auditorias(idOperacion,operacion, fechaOperacion)VALUES ('400000000002','update', TO_DATE('25/03/2028', 'DD/MM/YYYY'));

INSERT INTO MetodosDePago (idCuenta, numero, nombre, cvv, fechaExpiracion) VALUES ('400000000000000001', 9999999999999984, 'Ricardo', 100, TO_DATE('25/03/2028', 'DD/MM/YYYY'));
INSERT INTO MetodosDePago (idCuenta, numero, nombre, cvv, fechaExpiracion) VALUES ('400000000000000002', 3537605219871229, 'Miguel', 200, TO_DATE('25/03/2028', 'DD/MM/YYYY'));
INSERT INTO MetodosDePago (idCuenta, numero, nombre, cvv, fechaExpiracion) VALUES ('400000000000000003', 3579093062740021, 'Sofia', 300, TO_DATE('25/03/2028', 'DD/MM/YYYY'));

-- Ciclo Dos
INSERT INTO GestoresDeAvisos(id, idRenta, tipoAviso, fechaCreacion, mensaje, estadoAviso, estadoAlerta ,destinatario) VALUES ('IASJ12890', 'alerta', TO_DATE('12/02/2005','DD/MM/YYYY'),'lorem ipsum', 'enviada', 'activas', 'administrador');