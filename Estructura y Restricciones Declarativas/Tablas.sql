CREATE TABLE Peliculas(
    id CHAR(20) NOT NULL,
    director VARCHAR2(20) NOT NULL,
    fechaLanzamiento DATE NOT NULL,
    productora VARCHAR2(20) NOT NULL,
    precioCompra NUMBER(6) NOT NULL,
    precioRenta NUMBER(6) NOT NULL,
    duracion VARCHAR2(8) NOT NULL,
    distribuidor VARCHAR2(20) NOT NULL
);

CREATE TABLE Series(
    id CHAR(20) NOT NULL,
    director VARCHAR2(20) NOT NULL,
    fechaLanzamiento DATE NOT NULL,
    productora VARCHAR2(20) NOT NULL,
    precioCompra NUMBER(6) NOT NULL,
    precioRenta NUMBER(6) NOT NULL,
    distribuidor VARCHAR2(20) NOT NULL
);

CREATE TABLE Episodios(
    idSerie CHAR(20) NOT NULL,
    numeroTemporada NUMBER(2) NOT NULL,
    numeroEpisodio NUMBER(2) NOT NULL,
    nombreEpisodio VARCHAR2(20) NOT NULL,   
    duracion VARCHAR2(8) NOT NULL
);

CREATE TABLE Versiones(
    idVersion CHAR(20) NOT NULL,
    idPelicula CHAR(20),
    idSerie CHAR(20),
    nombre VARCHAR2(20) NOT NULL,  
    descripcion VARCHAR2(100) NOT NULL,
    categoria VARCHAR2(20) NOT NULL,
    edad NUMBER(2) NOT NULL,
    idioma VARCHAR2(20) NOT NULL
);

CREATE TABLE Distribuidores(
    nombre VARCHAR2(20) NOT NULL,   
    fechaAsociacion DATE NOT NULL
);

CREATE TABLE ContenidosAdicionales(
    id CHAR(20) NOT NULL,
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
    id CHAR(20) NOT NULL,
    idCuenta CHAR(20) NOT NULL,
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
    contrasena VARCHAR2(20) NOT NULL,
    telefono CHAR(13) NOT NULL,
    fechaCreacion DATE NOT NULL
);

CREATE TABLE Operaciones(
    id CHAR(20) NOT NULL,
    idCuenta CHAR(20) NOT NULL
);

CREATE TABLE Compras(
    idOperacion CHAR(20) NOT NULL,
    idPelicula CHAR(20),
    idSerie CHAR(20),
    pago NUMBER(6) NOT NULL,
    fechaCompra DATE NOT NULL
);

CREATE TABLE Rentas(
    idOperacion CHAR(20) NOT NULL,
    idPelicula CHAR(20),
    idSerie CHAR(20),
    pago NUMBER(6) NOT NULL,
    dias NUMBER(3) NOT NULL,
    fechaRenta DATE NOT NULL,
    fechaExpiracion DATE NOT NULL
);

CREATE TABLE Auditorias(
    idOperacion CHAR(20) NOT NULL,
    operacion CHAR(6) NOT NULL,
    fechaOperacion DATE NOT NULL
);

CREATE TABLE MetodosDePago(
    idCuenta CHAR(20) NOT NULL,
    numero VARCHAR2(16) NOT NULL,
    nombre VARCHAR2(20) NOT NULL,
    cvv NUMBER(3) NOT NULL,
    fechaExpiracion DATE NOT NULL
);