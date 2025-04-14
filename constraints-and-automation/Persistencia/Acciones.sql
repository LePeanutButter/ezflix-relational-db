-- xForaneas
ALTER TABLE Episodios DROP CONSTRAINT FK_Episodios_idSerie;
ALTER TABLE Versiones DROP CONSTRAINT FK_Versiones_idPelicula;
ALTER TABLE Versiones DROP CONSTRAINT FK_Versiones_idSeries;
ALTER TABLE ContenidosAdicionales DROP CONSTRAINT FK_ContenidoAdicional_idPelicula;
ALTER TABLE ContenidosAdicionales DROP CONSTRAINT FK_ContenidoAdicional_idSeries;
ALTER TABLE ActoresPeliculas DROP CONSTRAINT FK_ActoresPeliculas_idPelicula;
ALTER TABLE ActoresSeries DROP CONSTRAINT FK_ActoresSeries_idSeries;
ALTER TABLE Bibliotecas DROP CONSTRAINT FK_Bibliotecas_idCuenta;
ALTER TABLE BibliotecasPeliculas DROP CONSTRAINT FK_BibliotecasPeliculas_idBiblioteca;
ALTER TABLE BibliotecasPeliculas DROP CONSTRAINT FK_BibliotecasPeliculas_idPelicula;
ALTER TABLE BibliotecasSeries DROP CONSTRAINT FK_BibliotecasSeries_idBiblioteca;
ALTER TABLE BibliotecasSeries DROP CONSTRAINT FK_BibliotecasSeries_idSerie;
ALTER TABLE Compras DROP CONSTRAINT FK_Compras_idOperacion;
ALTER TABLE Compras DROP CONSTRAINT FK_Compras_idPelicula;
ALTER TABLE Compras DROP CONSTRAINT FK_Compras_idSerie;
ALTER TABLE Rentas DROP CONSTRAINT FK_Rentas_idOperacion;
ALTER TABLE Rentas DROP CONSTRAINT FK_Rentas_idPelicula;
ALTER TABLE Rentas DROP CONSTRAINT FK_Rentas_idSerie;
ALTER TABLE MetodosDePago DROP CONSTRAINT FK_MetodosDePago_idCuenta;

-- Acciones
ALTER TABLE Episodios
ADD CONSTRAINT FK_Episodios_idSerie FOREIGN KEY (idSerie)
REFERENCES Series(id)
ON DELETE CASCADE;
/

ALTER TABLE Versiones
ADD CONSTRAINT FK_Versiones_idPelicula FOREIGN KEY (idPelicula)
REFERENCES Peliculas(id)
ON DELETE CASCADE;
/

ALTER TABLE Versiones
ADD CONSTRAINT FK_Versiones_idSeries FOREIGN KEY (idSerie)
REFERENCES Series(id)
ON DELETE CASCADE;
/

ALTER TABLE ContenidosAdicionales
ADD CONSTRAINT FK_ContenidoAdicional_idPelicula FOREIGN KEY (idPelicula)
REFERENCES Peliculas(id)
ON DELETE CASCADE;
/

ALTER TABLE ContenidosAdicionales
ADD CONSTRAINT FK_ContenidoAdicional_idSeries FOREIGN KEY (idSerie)
REFERENCES Series(id)
ON DELETE CASCADE;
/

ALTER TABLE ActoresPeliculas
ADD CONSTRAINT FK_ActoresPeliculas_idPelicula FOREIGN KEY (idPelicula)
REFERENCES Peliculas(id)
ON DELETE CASCADE;
/

ALTER TABLE ActoresSeries
ADD CONSTRAINT FK_ActoresSeries_idSeries FOREIGN KEY (idSerie)
REFERENCES Series(id)
ON DELETE CASCADE;
/

ALTER TABLE Bibliotecas
ADD CONSTRAINT FK_Bibliotecas_idCuenta FOREIGN KEY (idCuenta)
REFERENCES Cuentas(id)
ON DELETE CASCADE;
/

ALTER TABLE BibliotecasPeliculas
ADD CONSTRAINT FK_BibliotecasPeliculas_idBiblioteca FOREIGN KEY (idBiblioteca)
REFERENCES Bibliotecas(id)
ON DELETE CASCADE;
/

ALTER TABLE BibliotecasPeliculas
ADD CONSTRAINT FK_BibliotecasPeliculas_idPelicula FOREIGN KEY (idPelicula)
REFERENCES Peliculas(id)
ON DELETE CASCADE;
/

ALTER TABLE BibliotecasSeries
ADD CONSTRAINT FK_BibliotecasSeries_idBiblioteca FOREIGN KEY (idBiblioteca)
REFERENCES Bibliotecas(id)
ON DELETE CASCADE;
/

ALTER TABLE BibliotecasSeries
ADD CONSTRAINT FK_BibliotecasSeries_idSerie FOREIGN KEY (idSerie)
REFERENCES Series(id)
ON DELETE CASCADE;
/

ALTER TABLE Compras
ADD CONSTRAINT FK_Compras_idOperacion FOREIGN KEY (idOperacion)
REFERENCES Operaciones(id)
ON DELETE CASCADE;
/

ALTER TABLE Compras
ADD CONSTRAINT FK_Compras_idPelicula FOREIGN KEY (idPelicula)
REFERENCES Peliculas(id)
ON DELETE SET NULL;
/

ALTER TABLE Compras
ADD CONSTRAINT FK_Compras_idSerie FOREIGN KEY (idSerie)
REFERENCES Series(id)
ON DELETE SET NULL;
/

ALTER TABLE Rentas
ADD CONSTRAINT FK_Rentas_idOperacion FOREIGN KEY (idOperacion)
REFERENCES Operaciones(id)
ON DELETE CASCADE;
/

ALTER TABLE Rentas
ADD CONSTRAINT FK_Rentas_idPelicula FOREIGN KEY (idPelicula)
REFERENCES Peliculas(id)
ON DELETE SET NULL;
/

ALTER TABLE Rentas
ADD CONSTRAINT FK_Rentas_idSerie FOREIGN KEY (idSerie)
REFERENCES Series(id)
ON DELETE SET NULL;
/

ALTER TABLE MetodosDePago
ADD CONSTRAINT FK_MetodosDePago_idCuenta FOREIGN KEY (idCuenta)
REFERENCES Cuentas(id)
ON DELETE CASCADE;
/