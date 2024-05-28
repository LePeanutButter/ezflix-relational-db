BEGIN
    PC_Distribuidores.Adicionar('Warner');
    PC_Distribuidores.Adicionar('Fox');
    PC_Distribuidores.Adicionar('Entertainment One');
    PC_Distribuidores.Adicionar('Paramount');
END;


BEGIN
    PC_Peliculas_Version.Adicionar('Toro Salvaje', 'Pelicula acerca de un luchador', 'Drama', 18, 'Espanol','Martin Scorsese',TO_DATE('24/03/2023', 'DD/MM/YYYY'), 'Kertzmann-Kub', 10000, 10000, '01:52:02','Warner');
    PC_Peliculas_Version.Adicionar('El Rey De La Comedia', 'Pelicula acerca de un comediante', 'Drama', 18, 'Espanol','Martin Scorsese', TO_DATE('18/02/1983', 'DD/MM/YYYY'), 'Arnon Milchan', 200000, 10000, '01:49:00', 'Fox');
    PC_Peliculas_Version.Adicionar('Buenos Muchachos', 'Pelicula acerca de mafia', 'Drama', 18, 'Espanol','Martin Scorsese', TO_DATE('19/09/1990', 'DD/MM/YYYY'), 'Arnon Milchan', 200000, 10000, '02:26:00', 'Warner');
    PC_Peliculas_Version.Adicionar('Memento', 'Pelicula acerca de un policia', 'Drama', 15, 'English','Christopher Nolan', TO_DATE('17/05/2002', 'DD/MM/YYYY'), 'Arnon Milchan', 200000, 10000, '01:53:00','Entertainment One');
    PC_Peliculas_Version.Adicionar('El Gran Truco', 'Pelicula acerca de magia', 'Drama', 15, 'Espanol','Christopher Nolan', TO_DATE('20/10/2006', 'DD/MM/YYYY'), 'Arnon Milchan', 200000, 10000, '02:10:00', 'Warner');
    PC_Peliculas_Version.Adicionar('Insomnia', 'Pelicula acerca de un policia', 'Drama', 15, 'English','Christopher Nolan', TO_DATE('08/09/2002', 'DD/MM/YYYY'), 'Arnon Milchan', 200000, 10000, '01:58:00', 'Warner');
    PC_Peliculas_Version.Adicionar('ChinaTown', 'Pelicula acerca de un policia', 'Drama', 15, 'Espanol','Roman Polanski', TO_DATE('20/06/1974', 'DD/MM/YYYY'), 'Arnon Milchan', 200000, 10000, '02:11:00', 'Paramount');
    PC_Peliculas_Version.Adicionar('La Naranja Mecanica', 'Pelicula acerca de un psicopata', 'Drama', 18, 'Espanol','Stanley Kubrick', TO_DATE('13/01/1972', 'DD/MM/YYYY'), 'Arnon Milchan', 200000, 10000, '02:16:00', 'Warner');
    PC_Peliculas_Version.Adicionar('Tarde De Perros', 'Pelicula acerca de un delincuente', 'Drama', 18, 'Espanol','Sidney Lumet', TO_DATE('21/09/1975', 'DD/MM/YYYY'), 'Arnon Milchan', 200000, 10000, '02:04:00', 'Warner');
    PC_Peliculas_Version.Adicionar('Annie Hall', 'Pelicula acerca de un comediante', 'Drama', 18, 'Espanol','Woody Allen', TO_DATE('23/11/1977', 'DD/MM/YYYY'), 'Arnon Milchan', 200000, 10000, '01:33:00', 'Warner');
    PC_Peliculas_Version.Adicionar('Aakrosh', 'dolor vel est donec odio', 'Drama', 13, 'English', 'Zack', SYSDATE, 'Carmina', 30000, 15000, '02:04:00', 'Fox');
    PC_Peliculas_Version.Adicionar('Con, The', 'pretium quis lectus suspendisse potenti in eleifend', 'Comedia', 13, 'Espanol', 'Mikol', SYSDATE, 'Emmery', 30000, 5000, '01:50:00', 'Warner');
    PC_Peliculas_Version.Adicionar('Three Way', 'ultrices aliquet maecenas leo odio condimentum id', 'Documental', 13, 'Espanol', 'Ringo', SYSDATE, 'Agneta', 10000, 5000, '01:00:00', 'Paramount');
    PC_Peliculas_Version.Adicionar('Girl', 'nulla ni', 'Documental', 13, 'Portugues', 'Germain', SYSDATE, 'Ivonne', 30000, 5000, '01:00:00', 'Fox');
    PC_Peliculas_Version.Adicionar('Days and Hours', 'congue diam id ornare imperdiet sapien', 'Drama', 15, 'Portugues', 'Taddeusz', SYSDATE, 'Danny', 20000, 5000, '01:50:00', 'Fox');
    PC_Peliculas_Version.Adicionar('Hangi Homeboys', 'lacinia aenean sit amet justo morbi ut', 'Documental', 18, 'Francais', 'Angeli', SYSDATE, 'Justino', 30000, 10000, '01:00:00', 'Paramount');
    PC_Peliculas_Version.Adicionar('Firsta Girl', 'accumsan odio curabitur convallis duis', 'Aventura', 15, 'Francais', 'Jaime', SYSDATE, 'Dugald', 10000, 5000, '02:00:00', 'Warner');
    PC_Peliculas_Version.Adicionar('Depted, The', 'lorem integer tincidunt ante vel ipsum praesent blandit', 'Aventura', 18, 'Portugues', 'Brooks', SYSDATE, 'Jerry', 20000, 5000, '01:00:00', 'Warner');
    PC_Peliculas_Version.Adicionar('Poble Worlds', 'augue quam sollicitudin vitae consectetuer eget rutrum', 'Documental', 15, 'Espanol', 'Mikkel', SYSDATE, 'Angelo', 10000, 10000, '01:00:00', 'Warner');
    PC_Peliculas_Version.Adicionar('Lov Come Back', 'nibh in hac habitasse platea dictumst aliquam augue', 'Comedia', 13, 'Espanol', 'Gabby', SYSDATE, 'Kipper', 10000, 15000, '01:50:00', 'Warner');
    PC_Peliculas_Version.Adicionar('Orstra Wives', 'volutpat dui maecenas tristique est', 'Documental', 15, 'Espanol', 'Hart', SYSDATE, 'Cecil', 20000, 10000, '02:00:00', 'Warner');
    PC_Peliculas_Version.Adicionar('Germany ', 'felis eu sapien cursus vestibulum proin', 'Documental', 18, 'Portugues', 'Hunfredo', SYSDATE, 'Anton', 20000, 10000, '02:00:00', 'Warner');
    PC_Peliculas_Version.Adicionar('Sunwner', 'varius nulla lit nec nisi vulputate', 'Aventura', 15, 'Espanol', 'Saxon', SYSDATE, 'Mycah', 10000, 5000, '01:00:00', 'Fox'); 
    PC_Peliculas_Version.Adicionar('Pretty Sweet', 'nulla pede ullamcorper augue a suscipit', 'Aventura', 18, 'Francais', 'Hinze', SYSDATE, 'Benedict', 30000, 5000, '02:00:00', 'Warner');
    PC_Peliculas_Version.Adicionar('xXx', 'vestibulum ante ipsum primis in faucibus orci', 'Documental', 18, 'English', 'Quill', SYSDATE, 'Osmond', 10000, 15000, '01:00:00', 'Paramount');
    PC_Peliculas_Version.Adicionar('Blinty Blank', 'in sapien iaculis congue vivamus metus arcu adipiscing molestie', 'Aventura', 18, 'Espanol', 'Krispin', SYSDATE, 'Tedi', 30000, 15000, '02:00:00', 'Fox');
    PC_Peliculas_Version.Adicionar('Quest for a Heart ', 'orci mauris lacinia sapien quis libero nullam sit', 'Documental', 18, 'Francais', 'Cody', SYSDATE, 'Caddric', 30000, 5000, '02:04:00', 'Paramount');
    PC_Peliculas_Version.Adicionar('Im King Kong!', 'quis justo maecenas rhoncus aliquam lacus morbi', 'Comedia', 13, 'Portugues', 'Ralph', SYSDATE, 'Jodie', 20000, 10000, '01:50:00', 'Fox');
    PC_Peliculas_Version.Adicionar('Behd the Sun', 'tincidunt eu felis fusce posuere felis sed lacus morbi', 'Comedia', 15, 'Portugues', 'Flemming', SYSDATE, 'Cosme', 10000, 5000, '02:00:00', 'Paramount');
    PC_Peliculas_Version.Adicionar('Hannah Arendt', 'ac enim s nec euismod scelerisque', 'Documental', 13, 'English', 'Sargent', SYSDATE, 'Corabel', 30000, 15000, '01:50:00', 'Fox');
    PC_Peliculas_Version.Adicionar('Young Black ', 'quisque arcu ac lobortis vel', 'Drama', 18, 'Francais', 'Stanfield', SYSDATE, 'Allyn', 30000, 5000, '01:50:00', 'Paramount');
    PC_Peliculas_Version.Adicionar('Doomsday', 'nulla elit aced vel enim sit amet', 'Comedia', 18, 'English', 'Boonie', SYSDATE, 'Wynny', 20000, 10000, '02:00:00', 'Fox');
    PC_Peliculas_Version.Adicionar('Pretty Sweet', 'nulla pede ullamcorper augue a suscipit', 'Aventura', 18, 'Francais', 'Hinze', SYSDATE, 'Benedict', 30000, 5000, '02:00:00', 'Warner');
    PC_Peliculas_Version.Adicionar('xXx', 'vestibulum ante ipsum primis in faucibus orci', 'Documental', 18, 'English', 'Quill', SYSDATE, 'Osmond', 10000, 15000, '01:00:00', 'Paramount');
    PC_Peliculas_Version.Adicionar('Hangi Homeboys', 'lacinia aenean sit amet justo morbi ut', 'Documental', 18, 'Francais', 'Angeli', SYSDATE, 'Justino', 30000, 10000, '01:00:00', 'Paramount');
    PC_Peliculas_Version.Adicionar('Firsta Girl', 'accumsan odio curabitur convallis duis', 'Aventura', 15, 'Francais', 'Jaime', SYSDATE, 'Dugald', 10000, 5000, '02:00:00', 'Warner');
    PC_Peliculas_Version.Adicionar('Depted, The', 'lorem integer tincidunt ante vel ipsum praesent blandit', 'Aventura', 18, 'Portugues', 'Brooks', SYSDATE, 'Jerry', 20000, 5000, '01:00:00', 'Warner');
    PC_Peliculas_Version.Adicionar('Poble Worlds', 'augue quam sollicitudin vitae consectetuer eget rutrum', 'Documental', 15, 'Espanol', 'Mikkel', SYSDATE, 'Angelo', 10000, 10000, '01:00:00', 'Warner');
    PC_Peliculas_Version.Adicionar('Lov Come Back', 'nibh in hac habitasse platea dictumst aliquam augue', 'Comedia', 13, 'Espanol', 'Gabby', SYSDATE, 'Kipper', 10000, 15000, '01:50:00', 'Warner');
    PC_Peliculas_Version.Adicionar('Orstra Wives', 'volutpat dui maecenas tristique est', 'Documental', 15, 'Espanol', 'Hart', SYSDATE, 'Cecil', 20000, 10000, '02:00:00', 'Warner');
    PC_Peliculas_Version.Adicionar('Germany ', 'felis eu sapien cursus vestibulum proin', 'Documental', 18, 'Portugues', 'Hunfredo', SYSDATE, 'Anton', 20000, 10000, '02:00:00', 'Warner');
    PC_Peliculas_Version.Adicionar('Sunwner', 'varius nulla lit nec nisi vulputate', 'Aventura', 15, 'Espanol', 'Saxon', SYSDATE, 'Mycah', 10000, 5000, '01:00:00', 'Fox'); 
    PC_Peliculas_Version.Adicionar('Pretty Sweet', 'nulla pede ullamcorper augue a suscipit', 'Aventura', 18, 'Francais', 'Hinze', SYSDATE, 'Benedict', 30000, 5000, '02:00:00', 'Warner');
    PC_Peliculas_Version.Adicionar('xXx', 'vestibulum ante ipsum primis in faucibus orci', 'Documental', 18, 'English', 'Quill', SYSDATE, 'Osmond', 10000, 15000, '01:00:00', 'Paramount');
    PC_Peliculas_Version.Adicionar('Blinty Blank', 'in sapien iaculis congue vivamus metus arcu adipiscing molestie', 'Aventura', 18, 'Espanol', 'Krispin', SYSDATE, 'Tedi', 30000, 15000, '02:00:00', 'Fox');
    PC_Peliculas_Version.Adicionar('Quest for a Heart ', 'orci mauris lacinia sapien quis libero nullam sit', 'Documental', 18, 'Francais', 'Cody', SYSDATE, 'Caddric', 30000, 5000, '02:04:00', 'Paramount');
    PC_Peliculas_Version.Adicionar('Im King Kong!', 'quis justo maecenas rhoncus aliquam lacus morbi', 'Comedia', 13, 'Portugues', 'Ralph', SYSDATE, 'Jodie', 20000, 10000, '01:50:00', 'Fox');
    PC_Peliculas_Version.Adicionar('Behd the Sun', 'tincidunt eu felis fusce posuere felis sed lacus morbi', 'Comedia', 15, 'Portugues', 'Flemming', SYSDATE, 'Cosme', 10000, 5000, '02:00:00', 'Paramount');
    PC_Peliculas_Version.Adicionar('Hannah Arendt', 'ac enim s nec euismod scelerisque', 'Documental', 13, 'English', 'Sargent', SYSDATE, 'Corabel', 30000, 15000, '01:50:00', 'Fox');
    PC_Peliculas_Version.Adicionar('Young Black ', 'quisque arcu ac lobortis vel', 'Drama', 18, 'Francais', 'Stanfield', SYSDATE, 'Allyn', 30000, 5000, '01:50:00', 'Paramount');
    PC_Peliculas_Version.Adicionar('Doomsday', 'nulla elit aced vel enim sit amet', 'Comedia', 18, 'English', 'Boonie', SYSDATE, 'Wynny', 20000, 10000, '02:00:00', 'Fox');
    PC_Peliculas_Version.Adicionar('Pretty Sweet', 'nulla pede ullamcorper augue a suscipit', 'Aventura', 18, 'Francais', 'Hinze', SYSDATE, 'Benedict', 30000, 5000, '02:00:00', 'Warner');
    PC_Peliculas_Version.Adicionar('xXx', 'vestibulum ante ipsum primis in faucibus orci', 'Documental', 18, 'English', 'Quill', SYSDATE, 'Osmond', 10000, 15000, '01:00:00', 'Paramount');
END;

SELECT * FROM versiones;

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

---Camilo quiere crear una cuenta en EZFlix
BEGIN
    PC_Cuentas.Adicionar('camiloo','megusta@disqus.com','superman','+573155334687');
    
END;
--Lastimosamente camilo escribio una contraseña que podria olvidar por lo que quiere cambiarla

BEGIN
    PC_Cuentas.Modificar('camiloo','megusta@disqus.com','batman','+573155334687');
    
END;

--Ya registrado en la plataforma, Camilo quiere comprobar si es verdad lo que le dijo su amigo acerca del contenido de esta.

SELECT * FROM versiones;

--Hay demasidas peliculas asi que realiza una mejor consulta

SELECT * FROM versiones WHERE nombre = 'ChinaTown';

--Por primera vez Camilo ve esta pelicla disponible en una pagina oficial, ahora le gustaria saber el precio

SELECT nombre, descripcion, precioCompra, PrecioRenta FROM versiones FULL JOIN peliculas ON (idPelicula = id) WHERE versiones.nombre= 'ChinaTown';

--A Camilo le gustaria comprar esa pelicula ya que le parece que tiene un buen precio
--Camilo sabe que para comprar la pelicla debe agregar un metodo de pago
BEGIN
    pc_metodopago.Adicionar('camiloo',3537605219871229, 'CamiloHernandez',345, SYSDATE);
END;

SELECT * FROM metodosdepago WHERE nombre = 'CamiloHernandez';
---Camilo se dió cuenta de que escribio mal su cvv, por lo que necesita hacer una moificacion
BEGIN
    pc_metodopago.modificar('camiloo',3537605219871229, 'CamiloHernandez',355, SYSDATE);
END;
SELECT * FROM metodosdepago WHERE nombre = 'CamiloHernandez';
--Ahora Camilo ya puede comprar su pelicula
BEGIN
    PC_Operacion_Compra.Adicionar('camiloo', 'ChinaTown', 200000); 
END;

SELECT versiones.nombre, fechaCompra FROM compras FULL JOIN Versiones ON (Compras.idPelicula = versiones.idPelicula) WHERe versiones.nombre = 'ChinaTown';
/*
Camilo se emocina mucho porque ya obtuvo la pelicula que queria de manera facil
Al parecer Camilo quiere comprar más películas, pero no sabe cual. Su mejor amigo le recomendó ver buenos muchachos, ya que le encantó el trabajo del director
Camilo quisiera saber si esa pelicula está disponible en EZFlix
*/

SELECT nombre, descripcion, precioCompra, PrecioRenta FROM versiones FULL JOIN peliculas ON (idPelicula = id) WHERE versiones.nombre= 'Buenos Muchachos';
--Efectivamente EZFlix la tiene en su catalogo y camilo considera que está a un buen precio
BEGIN
    PC_Operacion_Compra.Adicionar('camiloo', 'Buenos Muchachos', 200000); 
END;
SELECT versiones.nombre, fechaCompra FROM compras FULL JOIN Versiones ON (Compras.idPelicula = versiones.idPelicula) WHERE fechaCompra IS NOT NULL;
/*
Camilo está muy pero muy feliz, es dueño 100% de las peliculas de le gustan. Tambien ha empezado a mirar qué otros serivicios
ofrece la plataforma.
*/
BEGIN
    PC_Bibliotecas.Adicionar('camiloo', 'Mis Peliculas'); 
END;
SELECT * FROM Bibliotecas;
/* 
Para el futuro Camilo tiene planeado comprar más Peliculas ya que, en este momento, siente que ha encontrado el mejor lugar para 
hacer sus compras. Ademas vio que hay muchas peliculas de sus directores favoritos
*/
SELECT versiones.nombre, peliculas.director, precioCompra FROM VERSIONES FULL JOIN PELICULAS ON (idPelicula = id) WHERE peliculas.director = 'Martin Scorsese';
/*
A Camilo le encantaria seguir comprando más peliculas, lamentablemente ya no tiene mucho dinero
Pero espera que el siguente mes puede comprar todas sus peliculas favoritas
*/
