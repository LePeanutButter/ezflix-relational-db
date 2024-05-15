ALTER TABLE Peliculas ADD CONSTRAINT FK_Peliculas_distribuidor FOREIGN KEY (distribuidor) REFERENCES Distribuidores(nombre) ON DELETE SET NULL;/
ALTER TABLE Series ADD CONSTRAINT FK_Series_distribuidor FOREIGN KEY (distribuidor) REFERENCES Distribuidores(nombre)ON DELETE SET NULL;/
ALTER TABLE Episodios ADD CONSTRAINT FK_Episodios_idSerie FOREIGN KEY (idSerie) REFERENCES Series(id)ON DELETE CASCADE;/
ALTER TABLE Versiones ADD CONSTRAINT FK_Versiones_idPelicula FOREIGN KEY (idPelicula) REFERENCES Peliculas(id)ON DELETE CASCADE;/
ALTER TABLE Versiones ADD CONSTRAINT FK_Versiones_idSeries FOREIGN KEY (idSerie) REFERENCES Series(id) ON DELETE CASCADE;/
ALTER TABLE ContenidosAdicionales ADD CONSTRAINT FK_ContenidoAdicional_idPelicula FOREIGN KEY (idPelicula) REFERENCES Peliculas(id) ON DELETE CASCADE;/
ALTER TABLE ContenidosAdicionales ADD CONSTRAINT FK_ContenidoAdicional_idSeries FOREIGN KEY (idSerie) REFERENCES Series(id) ON DELETE CASCADE ;/
ALTER TABLE ActoresPeliculas ADD CONSTRAINT FK_ActoresPeliculas_idPelicula FOREIGN KEY (idPelicula) REFERENCES Peliculas(id) ON DELETE CASCADE ;/
ALTER TABLE ActoresSeries ADD CONSTRAINT FK_ActoresSeries_idSeries FOREIGN KEY (idSerie) REFERENCES Series(id) ON DELETE CASCADE ;/
ALTER TABLE Bibliotecas ADD CONSTRAINT FK_Bibliotecas_idCuenta FOREIGN KEY (idCuenta) REFERENCES Cuentas(id) ON DELETE CASCADE;/
ALTER TABLE BibliotecasPeliculas ADD CONSTRAINT FK_BibliotecasPeliculas_idBiblioteca FOREIGN KEY (idBiblioteca) REFERENCES Bibliotecas(id) ON DELETE CASCADE;/
ALTER TABLE BibliotecasPeliculas ADD CONSTRAINT FK_BibliotecasPeliculas_idPelicula FOREIGN KEY (idPelicula) REFERENCES Peliculas(id) ON DELETE CASCADE;/
ALTER TABLE BibliotecasSeries ADD CONSTRAINT FK_BibliotecasSeries_idBiblioteca FOREIGN KEY (idBiblioteca) REFERENCES Bibliotecas(id) ON DELETE CASCADE;/
ALTER TABLE BibliotecasSeries ADD CONSTRAINT FK_BibliotecasSeries_idSerie FOREIGN KEY (idSerie) REFERENCES Series(id) ON DELETE CASCADE;/
ALTER TABLE Operaciones ADD CONSTRAINT FK_Operaciones_idCuenta FOREIGN KEY (idCuenta) REFERENCES Cuentas(id) ON DELETE SET NULL;/
ALTER TABLE Compras ADD CONSTRAINT FK_Compras_idOperacion FOREIGN KEY (idOperacion) REFERENCES Operaciones(id) ON DELETE CASCADE ;/
ALTER TABLE Compras ADD CONSTRAINT FK_Compras_idPelicula FOREIGN KEY (idPelicula) REFERENCES Peliculas(id)ON DELETE SET NULL;/
ALTER TABLE Compras ADD CONSTRAINT FK_Compras_idSerie FOREIGN KEY (idSerie) REFERENCES Series(id)ON DELETE SET NULL;/
ALTER TABLE Rentas ADD CONSTRAINT FK_Rentas_idOperacion FOREIGN KEY (idOperacion) REFERENCES Operaciones(id)ON DELETE CASCADE;/
ALTER TABLE Rentas ADD CONSTRAINT FK_Rentas_idPelicula FOREIGN KEY (idPelicula) REFERENCES Peliculas(id)ON DELETE SET NULL;/
ALTER TABLE Rentas ADD CONSTRAINT FK_Rentas_idSerie FOREIGN KEY (idSerie) REFERENCES Series(id)ON DELETE SET NULL;/
ALTER TABLE Auditorias ADD CONSTRAINT FK_Auditorias_idOperacion FOREIGN KEY (idOperacion) REFERENCES Operaciones(id) ON DELETE CASCADE;/
ALTER TABLE MetodosDePago ADD CONSTRAINT FK_MetodosDePago_idCuenta FOREIGN KEY (idCuenta) REFERENCES Cuentas(id) ON DELETE CASCADE;/
