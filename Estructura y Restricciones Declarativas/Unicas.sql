ALTER TABLE Cuentas ADD CONSTRAINT UK_Cuentas_nombre_correo UNIQUE (nombre, correo);
ALTER TABLE Perfiles ADD CONSTRAINT UK_Perfiles_nombre UNIQUE (nombre);
ALTER TABLE Episodios ADD CONSTRAINT UK_Episodios_numeroTemporada_numeroEpisodio UNIQUE (numeroTemporada, numeroEpisodio);