-- Ciclo Uno
ALTER TABLE Peliculas ADD CONSTRAINT PK_Peliculas_id PRIMARY KEY (id);
ALTER TABLE Series ADD CONSTRAINT PK_Series_id PRIMARY KEY(id);
ALTER TABLE Episodios ADD CONSTRAINT PK_Episodios_numeroEpisodio PRIMARY KEY (idSerie, numeroTemporada, numeroEpisodio);
ALTER TABLE Versiones ADD CONSTRAINT PK_Versiones_idProducto PRIMARY KEY (idVersion);
ALTER TABLE Distribuidores ADD CONSTRAINT PK_Distribuidores_nombre PRIMARY KEY (nombre);
ALTER TABLE ContenidosAdicionales ADD CONSTRAINT PK_ContenidosAdicionales_id PRIMARY KEY(id);
ALTER TABLE ActoresPeliculas ADD CONSTRAINT PK_ActoresPeliculas PRIMARY KEY (idPelicula, nombre);
ALTER TABLE ActoresSeries ADD CONSTRAINT PK_ActoresSeries PRIMARY KEY (idSerie, nombre);
ALTER TABLE Bibliotecas ADD CONSTRAINT PK_Bibliotecas_id PRIMARY KEY (id);
ALTER TABLE BibliotecasPeliculas ADD CONSTRAINT PK_BibliotecasPeliculas PRIMARY KEY (idBiblioteca, idPelicula);
ALTER TABLE BibliotecasSeries ADD CONSTRAINT PK_BibliotecasSeries PRIMARY KEY (idBiblioteca, idSerie);
ALTER TABLE Cuentas ADD CONSTRAINT PK_Cuentas_id PRIMARY KEY (id);
ALTER TABLE Operaciones ADD CONSTRAINT PK_Operaciones_id PRIMARY KEY (id);
ALTER TABLE Compras ADD CONSTRAINT PK_Compras_idOperacion PRIMARY KEY (idOperacion);
ALTER TABLE Rentas ADD CONSTRAINT PK_Rentas_idOperacion PRIMARY KEY (idOperacion);
ALTER TABLE Auditorias ADD CONSTRAINT PK_Auditorias PRIMARY KEY (idOperacion, operacion, fechaOperacion);
ALTER TABLE MetodosDePago ADD CONSTRAINT PK_MetodosDePago_numero PRIMARY KEY (numero, idCuenta);

-- Ciclo Dos
ALTER TABLE GestoresDeAvisos ADD CONSTRAINT PK_GestoresDeAvisos_id PRIMARY KEY (id);