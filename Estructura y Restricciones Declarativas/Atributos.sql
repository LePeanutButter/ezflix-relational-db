ALTER TABLE Peliculas ADD CONSTRAINT CK_Peliculas_precioCompra CHECK ((precioCompra > 1000) AND (MOD(precioCompra, 500) = 0));
ALTER TABLE Peliculas ADD CONSTRAINT CK_Peliculas_precioRenta CHECK ((precioRenta > 1000) AND (MOD(precioRenta, 500) = 0));
ALTER TABLE Peliculas ADD CONSTRAINT CK_Peliculas_duracion CHECK (duracion LIKE '__:__:__');
ALTER TABLE Series ADD CONSTRAINT CK_Series_precioCompra CHECK ((precioCompra > 1000) AND (MOD(precioCompra, 500) = 0));
ALTER TABLE Series ADD CONSTRAINT CK_Series_precioRenta CHECK ((precioRenta > 1000) AND (MOD(precioRenta, 500) = 0));
ALTER TABLE Episodios ADD CONSTRAINT CK_Episodios_numeroTemporada_numeroEpisodio CHECK (numeroEpisodio > 0 AND numeroTemporada > 0);
ALTER TABLE Episodios ADD CONSTRAINT CK_Episodios_duracion CHECK (duracion LIKE '__:__:__');
ALTER TABLE Versiones ADD CONSTRAINT CK_Versiones_categoria CHECK (categoria IN ('Acción', 'Aventura', 'Ciencia Ficción', 'Comedia', 'Documental', 'Drama', 'Fantasia', 'Musical', 'Suspenso', 'Terror'));
ALTER TABLE Versiones ADD CONSTRAINT CK_Versiones_edad CHECK (edad IN ('E', 'T', 'M', 'A', 'RP')) -- Las edades estan definidas segun la ESRB
ALTER TABLE Versiones ADD CONSTRAINT CK_Versiones_idioma CHECK (idioma IN ('Español', 'English', 'Français', 'Português', '简体中文', 'हिंदी'));
ALTER TABLE Cuentas ADD CONSTRAINT CK_Cuentas_correo CHECK (correo LIKE '%@%.com');
ALTER TABLE Cuentas ADD CONSTRAINT CK_Cuentas_telefono CHECK (SUBSTR(telefono, 1, 3) = '+57' AND TO_NUMBER(SUBSTR(telefono, 4)) BETWEEN 3000000000 AND 3500000000);
ALTER TABLE Perfiles ADD CONSTRAINT CK_Perfiles_actividad CHECK (actividad IN ('A', 'N'));
ALTER TABLE Rentas ADD CONSTRAINT CK_Rentas_dias CHECK (dias IN (30, 90, 365))