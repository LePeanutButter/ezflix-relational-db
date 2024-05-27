-- Roles
CREATE ROLE ClienteEZFlix;
CREATE ROLE SoporteEZFlix;
CREATE ROLE AuditorEZFlix;
CREATE ROLE AdministradorEZFlix;
CREATE ROLE GerenteEZFlix;

-- Permisos
GRANT INSERT ON Cuentas TO ClienteEZFlix;
GRANT INSERT ON MetodosDePago TO ClienteEZFlix;
GRANT INSERT ON Bibliotecas TO ClienteEZFlix;
GRANT INSERT ON Operaciones TO ClienteEZFlix;
GRANT SELECT ON Peliculas TO ClienteEZFlix;
GRANT SELECT ON Series TO ClienteEZFlix;
GRANT EXECUTE ON PA_Cliente TO ClienteEZFlix;

GRANT SELECT ON Episodios TO GerenteEZFlix;
GRANT SELECT ON Versiones TO GerenteEZFlix;
GRANT SELECT ON ContenidosAdicionales TO GerenteEZFlix;
GRANT SELECT ON ActoresPeliculas TO GerenteEZFlix;
GRANT SELECT ON ActoresSeries TO GerenteEZFlix;
GRANT SELECT ON BibliotecasPeliculas TO GerenteEZFlix;
GRANT SELECT ON BibliotecasSeries TO GerenteEZFlix;
GRANT SELECT ON Bibliotecas TO GerenteEZFlix;
GRANT SELECT ON Compras TO GerenteEZFlix;
GRANT SELECT ON Rentas TO GerenteEZFlix;
GRANT SELECT ON Auditorias TO GerenteEZFlix;
GRANT SELECT ON MetodosDePago TO GerenteEZFlix;
GRANT SELECT ON Operaciones TO GerenteEZFlix;
GRANT SELECT ON Peliculas TO GerenteEZFlix;
GRANT SELECT ON Series TO GerenteEZFlix;
GRANT SELECT ON Distribuidores TO GerenteEZFlix;
GRANT SELECT ON Cuentas TO GerenteEZFlix;
GRANT EXECUTE ON PA_Gerente TO GerenteEZFlix;

GRANT SELECT ON Auditorias TO AuditorEZFlix;
GRANT EXECUTE ON PA_Auditor TO AuditorEZFlix;

GRANT INSERT, SELECT, UPDATE, DELETE ON Cuentas TO SoporteEZFlix;
GRANT INSERT, SELECT, UPDATE, DELETE ON MetodosDePago TO SoporteEZFlix;
GRANT INSERT, SELECT, UPDATE, DELETE ON Bibliotecas TO SoporteEZFlix;
GRANT INSERT, UPDATE, DELETE ON Operaciones TO SoporteEZFlix;
GRANT EXECUTE ON PA_Soporte TO SoporteEZFlix;

GRANT INSERT, SELECT, UPDATE, DELETE ON Peliculas TO AdministradorEZFlix;
GRANT INSERT, SELECT, UPDATE, DELETE ON ActoresPeliculas TO AdministradorEZFlix;
GRANT INSERT, SELECT, UPDATE, DELETE ON Series TO AdministradorEZFlix;
GRANT INSERT, SELECT, UPDATE, DELETE ON Episodios TO AdministradorEZFlix;
GRANT INSERT, SELECT, UPDATE, DELETE ON ActoresSeries TO AdministradorEZFlix;
GRANT INSERT, SELECT, UPDATE, DELETE ON Versiones TO AdministradorEZFlix;
GRANT INSERT, SELECT, UPDATE, DELETE ON Distribuidores TO AdministradorEZFlix;
GRANT SELECT ON Operaciones TO AdministradorEZFlix;
GRANT SELECT ON ContenidosAdicionales TO AdministradorEZFlix;
GRANT SELECT ON BibliotecasPeliculas TO AdministradorEZFlix;
GRANT SELECT ON BibliotecasSeries TO AdministradorEZFlix;
GRANT SELECT ON Bibliotecas TO AdministradorEZFlix;
GRANT SELECT ON Compras TO AdministradorEZFlix;
GRANT SELECT ON Rentas TO AdministradorEZFlix;
GRANT SELECT ON Auditorias TO AdministradorEZFlix;
GRANT SELECT ON MetodosDePago TO AdministradorEZFlix;
GRANT SELECT ON Cuentas TO AdministradorEZFlix;
GRANT EXECUTE ON PA_Administrador TO AdministradorEZFlix;