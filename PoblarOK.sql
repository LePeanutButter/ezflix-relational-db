INSERT INTO Peliculas (id,  director, fecha, productora, precioCompra, precioRenta, duracion, distribuidor) VALUES ('100000000000000000', 'Boris', TO_DATE('24/03/2023', 'DD/MM/YYYY'), 'Kertzmann-Kub', 1000, 1000, '015202', 'Bartell, Kiehn');
INSERT INTO Peliculas (id,  director, fecha, productora, precioCompra, precioRenta, duracion, distribuidor) VALUES ('200000000000000000', 'Elmo', TO_DATE('24/03/2022', 'DD/MM/YYYY'), 'Hintz, Watsic', 2000, 2000, '015202', 'Lindgren-Spinka');
INSERT INTO Peliculas (id,  director, fecha, productora, precioCompra, precioRenta, duracion, distribuidor) VALUES ('300000000000000000', 'Ava', TO_DATE('24/03/2021', 'DD/MM/YYYY'), 'Schmidt, Kreiger', 3000, 3000, '015202', 'Bergnaum-');

INSERT INTO Series (id,  director, fecha, productora, precioCompra, precioRenta, distribuidor) VALUES ('300000000000000001', 'Wolfgang', TO_DATE('24/03/2023', 'DD/MM/YYYY'), 'Hoeger, Gerhold ', 1000, 1000, 'Gibson and Sons');
INSERT INTO Series (id,  director, fecha, productora, precioCompra, precioRenta, distribuidor) VALUES ('300000000000000002', 'Anya', TO_DATE('24/03/2023', 'DD/MM/YYYY'), 'Pfannerstill LLC', 2000, 2000, 'Quitzon');
INSERT INTO Series (id,  director, fecha, productora, precioCompra, precioRenta, distribuidor) VALUES ('300000000000000003', 'Dena', TO_DATE('24/03/2023', 'DD/MM/YYYY'), 'Macejkovic and Sons', 3000, 3000, 'Boyle Group');

INSERT INTO Temporadas (idSerie, numeroTemporada) VALUES ('300000000000000001', 1);
INSERT INTO Temporadas (idSerie, numeroTemporada) VALUES ('300000000000000002', 2);
INSERT INTO Temporadas (idSerie, numeroTemporada) VALUES ('300000000000000003', 3);

INSERT INTO Episodios (idSerie, Temporada, nombreEpisodio, numeroEpisodio, duracion) VALUES ('300000000000000001', 1, 'Asoka', 1, '402002');
INSERT INTO Episodios (idSerie, Temporada, nombreEpisodio, numeroEpisodio, duracion) VALUES ('300000000000000002', 2, 'Andalax', 2, '402002');
INSERT INTO Episodios (idSerie, Temporada, nombreEpisodio, numeroEpisodio, duracion) VALUES ('300000000000000003', 3, 'Bytecard', 3, '402002');

INSERT INTO Versiones (idProducto, nombre, descripcion, categoria, idioma) VALUES ('100000000000000000', 'Return to Me', 'ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam', 'Musical', '40:20:02');
INSERT INTO Versiones (idProducto, nombre, descripcion, categoria, idioma) VALUES ('200000000000000000', 'Home Movie', 'in quam fringilla rhoncus mauris enim', 'Acción', '40:20:02');
INSERT INTO Versiones (idProducto, nombre, descripcion, categoria, idioma) VALUES ('300000000000000000', 'Crocodile Dundee II', 'in libero ut massa volutpat convallis morbi', 'Fantasía', '40:20:02');
INSERT INTO Versiones (idProducto, nombre, descripcion, categoria, idioma) VALUES ('30000000000000001', 'Spawn', 'sit amet turpis elementum ligula vehicula consequat morbi a ipsum', 'Suspenso', '40:20:02');
INSERT INTO Versiones (idProducto, nombre, descripcion, categoria, idioma) VALUES ('300000000000000002', 'Head Over Heels (De Pernas pro Ar)', 'quam pharetra magna ac consequat', 'Suspenso', '40:20:02');
INSERT INTO Versiones (idProducto, nombre, descripcion, categoria, idioma) VALUES ('300000000000000003', 'Last Mimzy, The', 'ullamcorper augue a suscipit nulla', 'Ciencia Ficción', '40:20:02');

INSERT INTO Distribuidores (nombre, fechaAsociacion) VALUES ('Bartell, Kiehn', TO_DATE('24/03/2020', 'DD/MM/YYYY'));
INSERT INTO Distribuidores (nombre, fechaAsociacion) VALUES ('Lindgren-Spinka', TO_DATE('24/03/2020', 'DD/MM/YYYY'));
INSERT INTO Distribuidores (nombre, fechaAsociacion) VALUES ('Bergnaum-', TO_DATE('24/03/2020', 'DD/MM/YYYY'));
INSERT INTO Distribuidores (nombre, fechaAsociacion) VALUES ('Gibson and Sons', TO_DATE('24/03/2020', 'DD/MM/YYYY'));
INSERT INTO Distribuidores (nombre, fechaAsociacion) VALUES ('Quitzon', TO_DATE('24/03/2020', 'DD/MM/YYYY'));
INSERT INTO Distribuidores (nombre, fechaAsociacion) VALUES ('Boyle Group', TO_DATE('24/03/2020', 'DD/MM/YYYY'));

INSERT INTO ContenidoAdicional (idContenido, idProducto, nombre, precioCompra, precioRenta) VALUES ('10000000000000000', '100000000000000000', 'Doughboys', 1000, 1000);
INSERT INTO ContenidoAdicional (idContenido, idProducto, nombre, precioCompra, precioRenta) VALUES ('100000000000000005', '200000000000000000', 'The Last Diamond', 2000, 2000);
INSERT INTO ContenidoAdicional (idContenido, idProducto, nombre, precioCompra, precioRenta) VALUES ('100000000000000006', '300000000000000000', 'All Things to All', 3000, 3000);

INSERT INTO ActoresPeliculas (idPelicula, actor) VALUES ('100000000000000000', 'Lennie');
INSERT INTO ActoresPeliculas (idPelicula, actor) VALUES ('200000000000000000', 'Brannon');
INSERT INTO ActoresPeliculas (idPelicula, actor) VALUES ('300000000000000000', 'Gregoire');

INSERT INTO ActoresSeries (idSerie, actor) VALUES ('300000000000000001', 'Brooke');
INSERT INTO ActoresSeries (idSerie, actor) VALUES ('300000000000000002', 'Marrilee');
INSERT INTO ActoresSeries (idSerie, actor) VALUES ('300000000000000003', 'Tammi');

INSERT INTO Bibliotecas (idCuenta, nombrePerfil, id, nombre, fechaCreacion) VALUES ('400000000000000001', 'Charmine', '500000000000000001', 'TOPIRAMATE', TO_DATE('24/03/2013', 'DD/MM/YYYY'));
INSERT INTO Bibliotecas (idCuenta, nombrePerfil, id, nombre, fechaCreacion) VALUES ('400000000000000002', 'Sheff', '500000000000000002', 'propolis', TO_DATE('24/03/2013', 'DD/MM/YYYY'));
INSERT INTO Bibliotecas (idCuenta, nombrePerfil, id, nombre, fechaCreacion) VALUES ('400000000000000003', 'Winna', '500000000000000003', 'Hydrochlorothiazide', TO_DATE('24/03/2013', 'DD/MM/YYYY'));

INSERT INTO  BibliotecasPeliculas (idBiblioteca, idPelicula) VALUES ('500000000000000001', '100000000000000000');
INSERT INTO  BibliotecasPeliculas (idBiblioteca, idPelicula) VALUES ('500000000000000002', '200000000000000000');
INSERT INTO  BibliotecasPeliculas (idBiblioteca, idPelicula) VALUES ('500000000000000003', '300000000000000000');

INSERT INTO BibliotecasSeries (idBiblioteca, idSerie) VALUES ('500000000000000003', '300000000000000001');

INSERT INTO Cuentas (id, nombre, correo, telefono, fechaCreacion) VALUES ('400000000000000001', 'Sindee', 'scawthera0@foxnews.com', 57311552467, TO_DATE('24/03/2022', 'DD/MM/YYYY'));
INSERT INTO Cuentas (id, nombre, correo, telefono, fechaCreacion) VALUES ('400000000000000002', 'Moselle', 'maizikovitz1@disqus.com', 57321552667, TO_DATE('24/03/2022', 'DD/MM/YYYY'));
INSERT INTO Cuentas (id, nombre, correo, telefono, fechaCreacion) VALUES ('400000000000000003', 'Jilli', 'jlaffoleylane2@delicious.com', 57315533467, TO_DATE('24/03/2022', 'DD/MM/YYYY'));

INSERT INTO Perfiles (idCuenta, nombre, actividad) VALUES ('400000000000000001', 'Myrtle', 'A');
INSERT INTO Perfiles (idCuenta, nombre, actividad) VALUES ('400000000000000002', 'Klarika', 'N');
INSERT INTO Perfiles (idCuenta, nombre, actividad) VALUES ('400000000000000003', 'Nicoline', 'N');

INSERT INTO  Compras (idCompra, idCuenta, idProducto, fechaCompra) VALUES ('600000000000000001', '400000000000000001', '100000000000000000', TO_DATE('25/03/2022', 'DD/MM/YYYY'));
INSERT INTO Compras (idCompra, idCuenta, idProducto, fechaCompra) VALUES ('600000000000000002', '400000000000000002', '200000000000000000', TO_DATE('24/03/2022', 'DD/MM/YYYY'));
INSERT INTO  Compras (idCompra, idCuenta, idProducto, fechaCompra) VALUES ('600000000000000003', '400000000000000003', '300000000000000000', TO_DATE('24/03/2022', 'DD/MM/YYYY'));

INSERT INTO Rentas (idRenta, idCuenta, idProducto, dias, fechaRenta, fechaExpiracion) VALUES ('700000000000000001', '400000000000000001', '300000000000000001', 30, TO_DATE('25/03/2022', 'DD/MM/YYYY'), TO_DATE('25/04/2022', 'DD/MM/YYYY'));
INSERT INTO Rentas (idRenta, idCuenta, idProducto, dias, fechaRenta, fechaExpiracion) VALUES ('700000000000000002', '400000000000000002', '300000000000000002', 30, TO_DATE('24/03/2022', 'DD/MM/YYYY'), TO_DATE('24/05/2022', 'DD/MM/YYYY'));
INSERT INTO Rentas (idRenta, idCuenta, idProducto, dias, fechaRenta, fechaExpiracion) VALUES ('700000000000000003', '400000000000000003', '300000000000000003', 30, TO_DATE('24/03/2022', 'DD/MM/YYYY'), TO_DATE('24/05/2022', 'DD/MM/YYYY'));

INSERT INTO CodigosDeRegalo (codigo, idProducto, idCuenta, estado, tipo) VALUES ('800000000000000001', '100000000000000000', '400000000000000001', 'N', 'P');
INSERT INTO CodigosDeRegalo (codigo, idProducto, idCuenta, estado, tipo) VALUES ('800000000000000002', '200000000000000000', '400000000000000002', 'N', 'P');
INSERT INTO CodigosDeRegalo (codigo, idProducto, idCuenta, estado, tipo) VALUES ('800000000000000003', '300000000000000000', '400000000000000003', 'U', 'S');

INSERT INTO MetodosDePago (idCuenta, numero, cvv, fechaExpiracion) VALUES ('400000000000000001', '5893414540406453', '100', TO_DATE('25/03/2028', 'DD/MM/YYYY'));
INSERT INTO MetodosDePago (idCuenta, numero, cvv, fechaExpiracion) VALUES ('400000000000000002', '3537605219871250', '200', TO_DATE('25/03/2028', 'DD/MM/YYYY'));
INSERT INTO MetodosDePago (idCuenta, numero, cvv, fechaExpiracion) VALUES ('400000000000000003', '3579093062740006', '300', TO_DATE('25/03/2028', 'DD/MM/YYYY'));

INSERT INTO GroupWatch (idGroupWatch, idCuenta, perfil, perfilSincronizado) VALUES ('900000000000000001', '400000000000000001', 'Olivero', 'Ludovika');
INSERT INTO GroupWatch (idGroupWatch, idCuenta, perfil, perfilSincronizado) VALUES ('900000000000000002', '400000000000000002', 'Westley', 'Maritsa');
INSERT INTO GroupWatch (idGroupWatch, idCuenta, perfil, perfilSincronizado) VALUES ('900000000000000003', '400000000000000003', 'Ferdy', 'Mead');

INSERT INTO GroupWatchPeliculas (idGroupWatch, idPelicula) VALUES ('900000000000000002', '200000000000000000');
INSERT INTO GroupWatchPeliculas (idGroupWatch, idPelicula) VALUES ('900000000000000003', '300000000000000000');

INSERT INTO GroupWatchSeries (idGroupWatch, idSerie) VALUES ('900000000000000001', '300000000000000001');

