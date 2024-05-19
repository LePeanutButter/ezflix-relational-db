-- Roles
CREATE OR REPLACE ROLE Cliente;
CREATE OR REPLACE ROLE Soporte;
CREATE OR REPLACE ROLE Auditor;
CREATE OR REPLACE ROLE Administrador;
CREATE OR REPLACE ROLE Gerente;

-- Permisos
-- Cliente
GRANT INSERT ON Cuenta TO Cliente;
GRANT INSERT ON MetodosDePago TO Cliente;
GRANT INSERT ON Bibliotecas TO Cliente;
GRANT INSERT ON Operaciones TO Cliente;
GRANT SELECT ON Peliculas TO Cliente;
GRANT SELECT ON Series TO Cliente;
GRANT EXECUTE ON PA_Cliente TO Cliente;

-- Gerente
GRANT SELECT ON Episodios TO Gerente;
GRANT SELECT ON Versiones TO Gerente;
GRANT SELECT ON ContenidosAdicionales TO Gerente;
GRANT SELECT ON ActoresPeliculas TO Gerente;
GRANT SELECT ON ActoresSeries TO Gerente;
GRANT SELECT ON BibliotecasPeliculas TO Gerente;
GRANT SELECT ON BibliotecasSeries TO Gerente;
GRANT SELECT ON Bibliotecas TO Gerente;
GRANT SELECT ON Compras TO Gerente;
GRANT SELECT ON Rentas TO Gerente;
GRANT SELECT ON Auditorias TO Gerente;
GRANT SELECT ON MetodosDePago TO Gerente;
GRANT SELECT ON Operaciones TO Gerente;
GRANT SELECT ON Peliculas TO Gerente;
GRANT SELECT ON Series TO Gerente;
GRANT SELECT ON Distribuidores TO Gerente;
GRANT SELECT ON Cuentas TO Gerente;
GRANT EXECUTE ON PA_Gerente TO Gerente;

-- Auditor
GRANT SELECT ON Auditorias TO Auditor;
GRANT EXECUTE ON PA_Auditor TO Auditor;

-- Soporte
GRANT INSERT, SELECT, UPDATE, DELETE ON Cuentas TO Soporte;
GRANT INSERT, SELECT, UPDATE, DELETE ON MetodosDePago TO Soporte;
GRANT INSERT, SELECT, UPDATE, DELETE ON Bibliotecas TO Soporte;
GRANT INSERT, UPDATE, DELETE ON Operaciones TO Soporte;
GRANT EXECUTE ON PA_Soporte TO Soporte;

-- Administrador
GRANT INSERT, SELECT, UPDATE, DELETE ON Peliculas TO Administrador;
GRANT INSERT, SELECT, UPDATE, DELETE ON Series TO Administrador;
GRANT INSERT, SELECT, UPDATE, DELETE ON Distribuidores TO Administrador;
GRANT SELECT ON Operaciones TO Administrador;
GRANT SELECT ON Episodios TO Administrador;
GRANT SELECT ON Versiones TO Administrador;
GRANT SELECT ON ContenidosAdicionales TO Administrador;
GRANT SELECT ON ActoresPeliculas TO Administrador;
GRANT SELECT ON ActoresSeries TO Administrador;
GRANT SELECT ON BibliotecasPeliculas TO Administrador;
GRANT SELECT ON BibliotecasSeries TO Administrador;
GRANT SELECT ON Bibliotecas TO Administrador;
GRANT SELECT ON Compras TO Administrador;
GRANT SELECT ON Rentas TO Administrador;
GRANT SELECT ON Auditorias TO Administrador;
GRANT SELECT ON MetodosDePago TO Administrador;
GRANT SELECT ON Cuentas TO Administrador;
GRANT EXECUTE ON PA_Administrador TO Administrador;