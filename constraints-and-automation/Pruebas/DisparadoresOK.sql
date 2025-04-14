---DisparadoresOK
---TG_Distribuidores_BI
INSERT INTO Distribuidores(nombre) VALUES ('Warner');

---TG_Peliculas_BI
INSERT INTO Peliculas (director, fechaLanzamiento, productora, precioCompra, precioRenta, duracion, distribuidor) VALUES ('Ava', TO_DATE('24/03/2021', 'DD/MM/YYYY'), 'Schmidt, Kreiger', 3000, 3000, '01:52:02', 'Warner');
SELECT * FROM Peliculas;

---TG_Series_BI
INSERT INTO Series ( director, fechaLanzamiento, productora, precioCompra, precioRenta, distribuidor) VALUES ('Wolfgang', TO_DATE('24/03/2023', 'DD/MM/YYYY'), 'Hoeger, Gerhold ', 10000, 10000, 'Warner');

SELECT * FROM Series;

---TG_Versiones_BI
INSERT INTO Versiones (idSerie, nombre, descripcion, categoria, edad,idioma) VALUES ('S5723848289217126922', 'Return to Me', 'ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam', 'Musical', 18, 'English');

---TG_ContenidosAdicionales_BI
INSERT INTO ContenidosAdicionales (idSerie, nombre) VALUES ('S5723848289217126922', 'Doughboys');

---TG_Cuentas_BI
INSERT INTO Cuentas (nombre, correo, contrasena, telefono, fechaCreacion) VALUES ('mmmm', 'saddssd2@icious.com', 'superman','+573155334607', TO_DATE('24/03/2022', 'DD/MM/YYYY'));

SELECT * FROM Cuentas;

---TG_Bibliotecas_BI 
INSERT INTO Bibliotecas (idCuenta, nombre) VALUES ('C6757532431191813866', 'Winna');

---TG_Operaciones_BI
INSERT INTO  operaciones (idCuenta) VALUES ('C6757532431191813866');

SELECT * FROM operaciones;

---TG_Operaciones_AI
INSERT INTO auditorias(idOperacion,operacion, fechaOperacion)VALUES ('O3006005202442689021','create', TO_DATE('25/03/2028', 'DD/MM/YYYY'));

UPDATE Auditorias SET operacion = 'DELETE' WHERE idOperacion = 'O3006005202442689021';
SELECT * FROM auditorias WHERE idOperacion = 'O3006005202442689021';

---TG_Compras_BI
INSERT INTO Compras (idOperacion, idPelicula, pago) VALUES ('O3006005202442689021', 'P9980944787055515209', 20000);
INSERT INTO Compras (idOperacion, idSerie, pago) VALUES ('O5216957114232141986', 'S5723848289217126922', 20000);

---TG_Rentas_BI
INSERT INTO Rentas (idOperacion, idPelicula, pago) VALUES ('O9529730725631422668', 'P9980944787055515209', 40000);

---TG_BibliotecasPeliculas_BI
SELECT * FROM Bibliotecas;
INSERT INTO  BibliotecasPeliculas (idBiblioteca, idPelicula) VALUES ('B8421955484555679098', 'P9980944787055515209');

---TG_BibliotecasSeries_BI
INSERT INTO BibliotecasSeries (idBiblioteca, idSerie) VALUES ('B8421955484555679098', 'S5723848289217126922');
