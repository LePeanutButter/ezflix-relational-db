CREATE TABLE Peliculas(
    id CHAR(20) NOT NULL,
    director VARCHAR2(20) NOT NULL,
    fecha DATE NOT NULL,
    productora VARCHAR2(20) NOT NULL,
    precioCompra NUMBER(6) NOT NULL,
    precioRenta NUMBER(6) NOT NULL,
    duracion VARCHAR2(8) NOT NULL,
    distribuidor VARCHAR2(20) NOT NULL
);

CREATE TABLE Series(
    id CHAR(20) NOT NULL,
    director VARCHAR2(20) NOT NULL,
    fecha DATE NOT NULL,
    productora VARCHAR2(20) NOT NULL,
    precioCompra NUMBER(6) NOT NULL,
    precioRenta NUMBER(6) NOT NULL,
    distribuidor VARCHAR2(20) NOT NULL
);

CREATE TABLE Episodios(
    idSerie CHAR(20) NOT NULL,
    numeroTemporada NUMBER(2) NOT NULL,
    nombreEpisodio VARCHAR2(20) NOT NULL,   
    numeroEpisodio NUMBER(2) NOT NULL,
    duracion VARCHAR2(8) NOT NULL
);

CREATE TABLE Versiones(
    idVersion CHAR(20) NOT NULL,
    idPelicula CHAR(20),
    idSerie CHAR(20),
    nombre VARCHAR2(20) NOT NULL,  
    descripcion VARCHAR2(100) NOT NULL,
    categoria VARCHAR2(20) NOT NULL,
    edad VARCHAR2(2) NOT NULL,
    idioma VARCHAR2(20) NOT NULL
);

CREATE TABLE Distribuidores(
    nombre VARCHAR2(20) NOT NULL,   
    fechaAsociacion DATE NOT NULL
);

CREATE TABLE ContenidoAdicional(
    idContenido CHAR(20) NOT NULL,
    idPelicula CHAR(20),
    idSerie CHAR(20),
    nombre VARCHAR2(20) NOT NULL
);

CREATE TABLE ActoresPeliculas(
    idPelicula CHAR(20) NOT NULL,
    nombre VARCHAR2(20) NOT NULL
);

CREATE TABLE ActoresSeries(
    idSerie CHAR(20) NOT NULL,
    nombre VARCHAR2(20) NOT NULL
);

CREATE TABLE Bibliotecas(
    idCuenta CHAR(20) NOT NULL,
    nombrePerfil VARCHAR2(20) NOT NULL,
    idBiblioteca CHAR(20) NOT NULL,
    nombre VARCHAR2(100) NOT NULL,
    fechaCreacion DATE NOT NULL
);

CREATE TABLE BibliotecasPeliculas(
    idBiblioteca CHAR(20) NOT NULL,
    idPelicula CHAR(20) NOT NULL
);

CREATE TABLE BibliotecasSeries(
    idBiblioteca CHAR(20) NOT NULL,
    idSerie CHAR(20) NOT NULL
);

CREATE TABLE Cuentas(
    id CHAR(20) NOT NULL,
    nombre VARCHAR2(20) NOT NULL,
    correo VARCHAR2(100) NOT NULL,
    telefono CHAR(13) NOT NULL,
    fechaCreacion DATE NOT NULL
);

CREATE TABLE Perfiles(
    idCuenta CHAR(20) NOT NULL,
    nombre VARCHAR2(20) NOT NULL,
    actividad CHAR(1) NOT NULL
);

CREATE TABLE Compras(
    idCuenta CHAR(20) NOT NULL,
    idPelicula CHAR(20),
    idSerie CHAR(20),
    fechaCompra DATE NOT NULL
);

CREATE TABLE Rentas(
    idCuenta CHAR(20) NOT NULL,
    idPelicula CHAR(20),
    idSerie CHAR(20),
    dias NUMBER(3) NOT NULL,
    fechaRenta DATE NOT NULL,
    fechaExpiracion DATE NOT NULL
);


CREATE TABLE MetodosDePago(
    idCuenta CHAR(20) NOT NULL,
    numero VARCHAR2(16) NOT NULL,
    cvv NUMBER(3) NOT NULL,
    fechaExpiracion DATE NOT NULL
);