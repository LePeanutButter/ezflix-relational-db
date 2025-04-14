BEGIN
    PA_Administrador.insertarDistribuidor('Warner Bros.');
    PA_Administrador.insertarPelicula('Toro Salvaje', 'Espanol', 'Drama', 'Pelicula acerca de un luchador', 18, 'Marin Scorsese', TO_DATE('24/03/2023', 'DD/MM/YYYY'), 'Kertzmann-Kub', 20000, 10000, '01:52:02', 'Warner Bros.');
END;
/

BEGIN
    PA_Cliente.adicionarCuenta('Juan Carlos','carlos.mejia@outlook.com','Iguana02','+573028295816');
    PA_Cliente.adicionarMetodosDePago('Juan Carlos', 1279845632846215, 'Juan Carlos', 381, TO_DATE('28/03/2031', 'DD/MM/YYYY'));
    PA_Cliente.adicionarBibliotecas('De Todito', 'Juan Carlos');
    PA_Cliente.adicionarOperacion('Juan Carlos', 'Toro Salvaje', 'Compra');
END;
/

BEGIN
    PA_Soporte.adicionarCuenta('Arelys Henao', 'wilfredo1988@yahoo.com', 'MiHistoria', '+573219030634');
    PA_Soporte.modificarCuenta('Arelys Henao', 'JuanMiguel', '+573219030634');
    PA_Soporte.adicionarMetodosDePago('Arelys Henao', 1279845632846215, 'Arelys Henao', 564, TO_DATE('05/10/2026', 'DD/MM/YYYY'));
    PA_Soporte.adicionarBiblioteca('Mis Favoritas', 'Arelys Henao');
    PA_Soporte.adicionarOperacion('Arelys Henao', 'Toro Salvaje', 'Compra');
END;
/

BEGIN
    PA_Administrador.insertarDistribuidor('BayView');
    PA_Administrador.insertarPelicula('Skinamarink', 'English', 'Terror', 'Two children wake up in the middle of the night.', 13, 'Kyle Edward', TO_DATE('13/01/2023', 'DD/MM/YYYY'), 'ERO Picture', 20000, 10000, '01:40:00', 'BayView');
    PA_Administrador.modificarPelicula('Skinamarink', 'Skinamarink', 'English', 'Suspenso', 'Two children wake up in the middle of the night.', 15, 'Kyle Edward Ball', TO_DATE('13/01/2023', 'DD/MM/YYYY'), 'ERO Picture', 20000, 10000, '01:40:00', 'BayView');
    PA_Administrador.insertarSerie('Rick And Morty', 'English', 'Ciencia Ficcion', 'complicated by their inter-dimensional misadventures.', 15, 'Justin Roiland', TO_DATE('2/12/2013', 'DD/MM/YYYY'), 'Adult Swim', 50000, 30000, 'Warner Bros.');
END;
/