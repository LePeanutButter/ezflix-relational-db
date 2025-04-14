-- Ciclo Uno
ALTER TABLE Peliculas ADD CONSTRAINT CK_Peliculas_precioCompra CHECK ((precioCompra > 1000) AND (MOD(precioCompra, 500) = 0));
ALTER TABLE Peliculas ADD CONSTRAINT CK_Peliculas_precioRenta CHECK ((precioRenta > 1000) AND (MOD(precioRenta, 500) = 0));
ALTER TABLE Peliculas ADD CONSTRAINT CK_Peliculas_duracion CHECK (duracion LIKE '__:__:__');
ALTER TABLE Series ADD CONSTRAINT CK_Series_precioCompra CHECK ((precioCompra > 1000) AND (MOD(precioCompra, 500) = 0));
ALTER TABLE Series ADD CONSTRAINT CK_Series_precioRenta CHECK ((precioRenta > 1000) AND (MOD(precioRenta, 500) = 0));
ALTER TABLE Episodios ADD CONSTRAINT CK_Episodios_numeroTemporada_numeroEpisodio CHECK (numeroEpisodio > 0 AND numeroTemporada > 0);
ALTER TABLE Episodios ADD CONSTRAINT CK_Episodios_duracion CHECK (duracion LIKE '__:__:__');
ALTER TABLE Versiones ADD CONSTRAINT CK_Versiones_categoria CHECK (categoria IN ('Accion', 'Aventura', 'Ciencia Ficcion', 'Comedia', 'Documental', 'Drama', 'Fantasia', 'Musical', 'Suspenso', 'Terror'));
ALTER TABLE Versiones ADD CONSTRAINT CK_Versiones_edad CHECK (edad IN (0, 7, 13, 15, 18));
ALTER TABLE Versiones ADD CONSTRAINT CK_Versiones_idioma CHECK (idioma IN ('Espanol', 'English', 'Francais', 'Portugues'));
ALTER TABLE Cuentas ADD CONSTRAINT CK_Cuentas_correo CHECK (correo LIKE '%@%.com');
ALTER TABLE Cuentas ADD CONSTRAINT CK_Cuentas_telefono CHECK (SUBSTR(telefono, 1, 3) = '+57' AND TO_NUMBER(SUBSTR(telefono, 4)) BETWEEN 3000000000 AND 3500000000);
ALTER TABLE Rentas ADD CONSTRAINT CK_Rentas_dias CHECK (dias IN (30, 90, 365));
ALTER TABLE MetodosDePago ADD CONSTRAINT CK_MetodosDePago_cvv CHECK (cvv BETWEEN 100 AND 999);
ALTER TABLE MetodosDePago ADD CONSTRAINT CK_MetodosDePago_numero CHECK (numero BETWEEN 1000000000000000 AND 9999999999999999);

-- Ciclo Dos
ALTER TABLE GestoresDeAvisos ADD CONSTRAINT CK_GestoresDeAvisos_tipoAviso CHECK (tipoAviso IN ('notificacion', 'alerta'));
ALTER TABLE GestoresDeAvisos ADD CONSTRAINT CK_GestoresDeAvisos_estadoAviso CHECK (estadoAviso IN ('enviada', 'pendiente', 'fallida'));
ALTER TABLE GestoresDeAvisos ADD CONSTRAINT CK_GestoresDeAvisos_estadoAlerta CHECK (estadoAlerta IN ('activas', 'inactivas'));
ALTER TABLE GestoresDeAvisos ADD CONSTRAINT CK_GestoresDeAvisos_destinatario CHECK (destinatario IN ('administrador', 'dueno'));