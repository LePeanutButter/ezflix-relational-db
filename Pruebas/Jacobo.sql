INSERT INTO Distribuidores (nombre) VALUES ('Warner');
INSERT INTO Distribuidores (nombre) VALUES ('Fox');
INSERT INTO Distribuidores (nombre) VALUES ('Entertainment One');
INSERT INTO Distribuidores (nombre) VALUES ('Paramount');

INSERT INTO Peliculas (director, fechaLanzamiento, productora, precioCompra, precioRenta, duracion, distribuidor) VALUES ( 'Marin Scorsese', TO_DATE('19/12/1980', 'DD/MM/YYYY'), 'Irwin Winkler', 200000, 10000, '02:09:00', 'Warner');
INSERT INTO Peliculas (director, fechaLanzamiento, productora, precioCompra, precioRenta, duracion, distribuidor) VALUES ( 'Marin Scorsese', TO_DATE('18/02/1983', 'DD/MM/YYYY'), 'Arnon Milchan', 200000, 10000, '01:49:00', 'Fox');
INSERT INTO Peliculas (director, fechaLanzamiento, productora, precioCompra, precioRenta, duracion, distribuidor) VALUES ( 'Marin Scorsese', TO_DATE('19/09/1990', 'DD/MM/YYYY'), 'Arnon Milchan', 200000, 10000, '02:26:00', 'Warner');
INSERT INTO Peliculas (director, fechaLanzamiento, productora, precioCompra, precioRenta, duracion, distribuidor) VALUES ( 'Christopher Nolan', TO_DATE('17/05/2002', 'DD/MM/YYYY'), 'Arnon Milchan', 200000, 10000, '01:53:00','Entertainment One');
INSERT INTO Peliculas (director, fechaLanzamiento, productora, precioCompra, precioRenta, duracion, distribuidor) VALUES ( 'Christopher Nolan', TO_DATE('20/10/2006', 'DD/MM/YYYY'), 'Arnon Milchan', 200000, 10000, '02:10:00', 'Warner');
INSERT INTO Peliculas (director, fechaLanzamiento, productora, precioCompra, precioRenta, duracion, distribuidor) VALUES ( 'Christopher Nolan', TO_DATE('08/09/2002', 'DD/MM/YYYY'), 'Arnon Milchan', 200000, 10000, '01:58:00', 'Warner');
INSERT INTO Peliculas (director, fechaLanzamiento, productora, precioCompra, precioRenta, duracion, distribuidor) VALUES ( 'Roman Polanski', TO_DATE('20/06/1974', 'DD/MM/YYYY'), 'Arnon Milchan', 200000, 10000, '02:11:00', 'Paramount');
INSERT INTO Peliculas (director, fechaLanzamiento, productora, precioCompra, precioRenta, duracion, distribuidor) VALUES ( 'Stanley Kubrick', TO_DATE('13/01/1972', 'DD/MM/YYYY'), 'Arnon Milchan', 200000, 10000, '02:16:00', 'Warner');
INSERT INTO Peliculas (director, fechaLanzamiento, productora, precioCompra, precioRenta, duracion, distribuidor) VALUES ( 'Luchino Visconti', TO_DATE('01/01/1971', 'DD/MM/YYYY'), 'Arnon Milchan', 200000, 10000, '02:10:00', 'Warner');
INSERT INTO Peliculas (director, fechaLanzamiento, productora, precioCompra, precioRenta, duracion, distribuidor) VALUES ( 'Sidney Lumet', TO_DATE('21/09/1975', 'DD/MM/YYYY'), 'Arnon Milchan', 200000, 10000, '02:04:00', 'Warner');
INSERT INTO Peliculas (director, fechaLanzamiento, productora, precioCompra, precioRenta, duracion, distribuidor) VALUES ( 'Woody Allen', TO_DATE('23/11/1977', 'DD/MM/YYYY'), 'Arnon Milchan', 200000, 10000, '01:33:00', 'Warner');


INSERT INTO Versiones (idPelicula, nombre, descripcion, categoria, edad,idioma) VALUES ('P8887347113921352179', 'Toro Salvaje', 'Pelicula acerca de un luchador', 'Drama', 18, 'Espanol');
INSERT INTO Versiones (idPelicula, nombre, descripcion, categoria, edad,idioma) VALUES ('P9179430977756575100', 'El Rey De La Comedia', 'Pelicula acerca de un comediante', 'Drama', 18, 'Espanol');
INSERT INTO Versiones (idPelicula, nombre, descripcion, categoria, edad,idioma) VALUES ('P4583052426687328837', 'Buenos Muchachos', 'Pelicula acerca de mafia', 'Drama', 18, 'Espanol');
INSERT INTO Versiones (idPelicula, nombre, descripcion, categoria, edad,idioma) VALUES ('P9102902983422853849', 'Memento', 'Pelicula acerca de un policia', 'Drama', 15, 'English');
INSERT INTO Versiones (idPelicula, nombre, descripcion, categoria, edad,idioma) VALUES ('P7663501222535784656', 'El Gran Truco', 'Pelicula acerca de magia', 'Drama', 15, 'Espanol');
INSERT INTO Versiones (idPelicula, nombre, descripcion, categoria, edad,idioma) VALUES ('P7714740050181527957', 'Insomnia', 'Pelicula acerca de un policia', 'Drama', 15, 'English');
INSERT INTO Versiones (idPelicula, nombre, descripcion, categoria, edad,idioma) VALUES ('P1823579675430418191', 'ChinaTown', 'Pelicula acerca de un policia', 'Drama', 15, 'Espanol');
INSERT INTO Versiones (idPelicula, nombre, descripcion, categoria, edad,idioma) VALUES ('P4486648135040334365', 'La Naranja Mecanica', 'Pelicula acerca de un psicopata', 'Drama', 18, 'Espanol');
INSERT INTO Versiones (idPelicula, nombre, descripcion, categoria, edad,idioma) VALUES ('P3482712413769968326', 'Tarde De Perros', 'Pelicula acerca de un delincuente', 'Drama', 18, 'Espanol');
INSERT INTO Versiones (idPelicula, nombre, descripcion, categoria, edad,idioma) VALUES ('P7638147933600406032', 'Annie Hall', 'Pelicula acerca de un comediante', 'Drama', 18, 'Espanol');
INSERT INTO Versiones (idPelicula, nombre, descripcion, categoria, edad,idioma) VALUES ('P1426781309526882387', 'Muerte en Venecia ', 'Pelicula acerca de un niño', 'Drama', 18, 'Espanol');


/* 
Esta es la historia de Camilo, un chico de 20 años quien ama el contenido audivisual sobretodo las peliculas. Camilo ama
el cine de la decada de los 70, de los 90 y está interesado en peliculas nuevas dirigidas por Edgar Wright, Christopher Nolan, 
Denis Villeneuve, entre otros. Lastimosamente cada dia le es mas dificil encontrar su tipo de peliculas en plataformas de streaming,
debido a que sus peliculas favoritas estan distrubidas por cada una de estas. Camilo esta harto de tener que pagar un mes una plataforma
y darse cuenta de que su titulo favorito sera removido en los sigueintes dias. Camilo sabe que el podria encontrar cualquier pelicula 
a travez de una pagina pirata de internet. Pero la ultima vez que lo hizo, su computador quedo arruinado, quedo lleno de virus. Camilo
no quiero volver a pasar por lo mismo...

Un dia, su mejor amigo le hablo de una servicio llamado EZFlix, asi que decidió crearse una cuenta alli ya que su amigo le juro que todos 
sus problemas seran solucionados con esta plataforma.
*/

