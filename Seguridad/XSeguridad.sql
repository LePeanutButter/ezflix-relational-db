-- XPermisos
-- Cliente
REVOKE INSERT ON Cuenta TO Cliente;
REVOKE INSERT ON MetodosDePago TO Cliente;
REVOKE INSERT ON Bibliotecas TO Cliente;
REVOKE INSERT ON Operaciones TO Cliente;
REVOKE SELECT ON Peliculas TO Cliente;
REVOKE SELECT ON Series TO Cliente;
REVOKE EXECUTE ON PA_Cliente TO Cliente;

-- Gerente
REVOKE SELECT ON Episodios TO Gerente;
REVOKE SELECT ON Versiones TO Gerente;
REVOKE SELECT ON ContenidosAdicionales TO Gerente;
REVOKE SELECT ON ActoresPeliculas TO Gerente;
REVOKE SELECT ON ActoresSeries TO Gerente;
REVOKE SELECT ON BibliotecasPeliculas TO Gerente;
REVOKE SELECT ON BibliotecasSeries TO Gerente;
REVOKE SELECT ON Bibliotecas TO Gerente;
REVOKE SELECT ON Compras TO Gerente;
REVOKE SELECT ON Rentas TO Gerente;
REVOKE SELECT ON Auditorias TO Gerente;
REVOKE SELECT ON MetodosDePago TO Gerente;
REVOKE SELECT ON Operaciones TO Gerente;
REVOKE SELECT ON Peliculas TO Gerente;
REVOKE SELECT ON Series TO Gerente;
REVOKE SELECT ON Distribuidores TO Gerente;
REVOKE SELECT ON Cuentas TO Gerente;
REVOKE EXECUTE ON PA_Gerente TO Gerente;

-- Auditor
REVOKE SELECT ON Auditorias TO Auditor;
REVOKE EXECUTE ON PA_Auditor TO Auditor;

-- Soporte
REVOKE ALL PRIVILEGES Cuentas TO Soporte;
REVOKE ALL PRIVILEGES MetodosDePago TO Soporte;
REVOKE ALL PRIVILEGES ON Bibliotecas TO Soporte;
REVOKE INSERT, UPDATE, DELETE ON Operaciones TO Soporte;
REVOKE EXECUTE ON PA_Soporte TO Soporte;

-- Administrador
REVOKE ALL PRIVILEGES ON Peliculas TO Administrador;
REVOKE ALL PRIVILEGES ON Series TO Administrador;
REVOKE ALL PRIVILEGES ON Distribuidores TO Administrador;
REVOKE SELECT ON Operaciones TO Administrador;
REVOKE SELECT ON Episodios TO Administrador;
REVOKE SELECT ON Versiones TO Administrador;
REVOKE SELECT ON ContenidosAdicionales TO Administrador;
REVOKE SELECT ON ActoresPeliculas TO Administrador;
REVOKE SELECT ON ActoresSeries TO Administrador;
REVOKE SELECT ON BibliotecasPeliculas TO Administrador;
REVOKE SELECT ON BibliotecasSeries TO Administrador;
REVOKE SELECT ON Bibliotecas TO Administrador;
REVOKE SELECT ON Compras TO Administrador;
REVOKE SELECT ON Rentas TO Administrador;
REVOKE SELECT ON Auditorias TO Administrador;
REVOKE SELECT ON MetodosDePago TO Administrador;
REVOKE SELECT ON Cuentas TO Administrador;
REVOKE EXECUTE ON PA_Administrador TO Administrador;

-- XRoles
DROP ROLE Cliente;
DROP ROLE Soporte;
DROP ROLE Auditor;
DROP ROLE Administrador;
DROP ROLE Gerente;

-- XActores
DROP PACKAGE PA_Cliente;
DROP PACKAGE PA_Gerente;
DROP PACKAGE PA_Auditor;
DROP PACKAGE PA_Soporte;
DROP PACKAGE PA_Administrador;