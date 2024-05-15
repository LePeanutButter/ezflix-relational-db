
--El precio es muy bajo
INSERT INTO Series (id,  director, fechaLanzamiento, productora, precioCompra, precioRenta, distribuidor) VALUES ('300000000000000003', 'Dena', TO_DATE('24/03/2023', 'DD/MM/YYYY'), 'Macejkovic and Sons', 300, 3000, 'Boyle Group');
--No contiene ':'
INSERT INTO Episodios (idSerie, numeroTemporada, nombreEpisodio, numeroEpisodio, duracion) VALUES ('300000000000000003', 3, 'Bytecard', 3, '402002');
--La edad no corresponde a las propuestas
INSERT INTO Versiones (idVersion,idPelicula, nombre, descripcion, categoria, edad,idioma) VALUES ('900000','100000000000000000', 'Return to Me', 'ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam', 'Musical', 19, 'English');
--No existe esa categoria
INSERT INTO Versiones (idVersion,idPelicula, nombre, descripcion, categoria, edad,idioma) VALUES ('900001','200000000000000000', 'Home Movie', 'in quam fringilla rhoncus mauris enim', 'Belico', 13, 'English');
--Falta numeros en el telefo
INSERT INTO Cuentas (id, nombre, correo, contrasena, telefono, fechaCreacion) VALUES ('400000000000000001', 'Sindee', 'scawthera0@foxnews.com','pepsi', '+57300123456', TO_DATE('24/03/2022', 'DD/MM/YYYY'));
--Falta el '+'
INSERT INTO Cuentas (id, nombre, correo, contrasena, telefono, fechaCreacion) VALUES ('400000000000000003', 'Jilli', 'jlaffoleylane2@delicious.com', 'superman','573155334607', TO_DATE('24/03/2022', 'DD/MM/YYYY'));
--No existe FK
INSERt INTO auditorias(idOperacion,operacion, fechaOperacion)VALUES ('400000000009','update', TO_DATE('25/03/2028', 'DD/MM/YYYY'));
--Pasa el limite del varchar
INSERT INTO MetodosDePago (idCuenta, numero, nombre, cvv, fechaExpiracion) VALUES ('400000000000000001', 99999999999999000, 'Ricardo','100', TO_DATE('25/03/2028', 'DD/MM/YYYY'));




