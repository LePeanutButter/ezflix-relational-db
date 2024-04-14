---DisparadoresOK
---TG_Distribuidores_fechaAsociacion
INSERT INTO Distribuidores(nombre) VALUES ('Warner');
---TG_Peliculas_idPelicula
INSERT INTO Peliculas (director, fecha, productora, precioCompra, precioRenta, duracion, distribuidor) VALUES ('Director 1', TO_DATE('2024-04-13', 'YYYY-MM-DD'), 'Productora 1', 50000, 70000, '02:30:00', 'Warner');
---TG_Series_idSeries
INSERT INTO Series (director, fecha, productora, precioCompra, precioRenta, distribuidor) VALUES ('Director 1', TO_DATE('2024-04-13', 'YYYY-MM-DD'), 'Productora 1', 10000, 50000, 'Warner');
---TG_ContenidoAdicional_idContenido
INSERT INTO ContenidoAdicional (nombre,idPelicula) VALUES ('Contenido 1','P0000000000000000000');
---TG_Cuentas_id y TG_Cuentas_fechaCreacion
INSERT INTO Cuentas(nombre,correo,telefono) VALUES ('Miguel', 'correo@gmail.com','+573114621465');
