-- XPermisos
REVOKE INSERT ON Cuentas FROM ClienteEZFlix;
REVOKE INSERT ON MetodosDePago FROM ClienteEZFlix;
REVOKE INSERT ON Bibliotecas FROM ClienteEZFlix;
REVOKE INSERT ON Operaciones FROM ClienteEZFlix;
REVOKE SELECT ON Peliculas FROM ClienteEZFlix;
REVOKE SELECT ON Series FROM ClienteEZFlix;
REVOKE EXECUTE ON PA_Cliente FROM ClienteEZFlix;

REVOKE SELECT ON Episodios FROM GerenteEZFlix;
REVOKE SELECT ON Versiones FROM GerenteEZFlix;
REVOKE SELECT ON ContenidosAdicionales FROM GerenteEZFlix;
REVOKE SELECT ON ActoresPeliculas FROM GerenteEZFlix;
REVOKE SELECT ON ActoresSeries FROM GerenteEZFlix;
REVOKE SELECT ON BibliotecasPeliculas FROM GerenteEZFlix;
REVOKE SELECT ON BibliotecasSeries FROM GerenteEZFlix;
REVOKE SELECT ON Bibliotecas FROM GerenteEZFlix;
REVOKE SELECT ON Compras FROM GerenteEZFlix;
REVOKE SELECT ON Rentas FROM GerenteEZFlix;
REVOKE SELECT ON Auditorias FROM GerenteEZFlix;
REVOKE SELECT ON MetodosDePago FROM GerenteEZFlix;
REVOKE SELECT ON Operaciones FROM GerenteEZFlix;
REVOKE SELECT ON Peliculas FROM GerenteEZFlix;
REVOKE SELECT ON Series FROM GerenteEZFlix;
REVOKE SELECT ON Distribuidores FROM GerenteEZFlix;
REVOKE SELECT ON Cuentas FROM GerenteEZFlix;
REVOKE EXECUTE ON PA_Gerente FROM GerenteEZFlix;

REVOKE SELECT ON Auditorias FROM AuditorEZFlix;
REVOKE EXECUTE ON PA_Auditor FROM AuditorEZFlix;

REVOKE ALL PRIVILEGES ON Cuentas FROM SoporteEZFlix;
REVOKE ALL PRIVILEGES ON MetodosDePago FROM SoporteEZFlix;
REVOKE ALL PRIVILEGES ON Bibliotecas FROM SoporteEZFlix;
REVOKE INSERT, UPDATE, DELETE ON Operaciones FROM SoporteEZFlix;
REVOKE EXECUTE ON PA_Soporte FROM SoporteEZFlix;

REVOKE ALL PRIVILEGES ON Peliculas FROM AdministradorEZFlix;
REVOKE ALL PRIVILEGES ON ActoresPeliculas FROM AdministradorEZFlix;
REVOKE ALL PRIVILEGES ON Series FROM AdministradorEZFlix;
REVOKE ALL PRIVILEGES ON Episodios FROM AdministradorEZFlix;
REVOKE ALL PRIVILEGES ON ActoresSeries FROM AdministradorEZFlix;
REVOKE ALL PRIVILEGES ON Versiones FROM AdministradorEZFlix;
REVOKE ALL PRIVILEGES ON Distribuidores FROM AdministradorEZFlix;
REVOKE SELECT ON Operaciones FROM AdministradorEZFlix;
REVOKE SELECT ON ContenidosAdicionales FROM AdministradorEZFlix;
REVOKE SELECT ON BibliotecasPeliculas FROM AdministradorEZFlix;
REVOKE SELECT ON BibliotecasSeries FROM AdministradorEZFlix;
REVOKE SELECT ON Bibliotecas FROM AdministradorEZFlix;
REVOKE SELECT ON Compras FROM AdministradorEZFlix;
REVOKE SELECT ON Rentas FROM AdministradorEZFlix;
REVOKE SELECT ON Auditorias FROM AdministradorEZFlix;
REVOKE SELECT ON MetodosDePago FROM AdministradorEZFlix;
REVOKE SELECT ON Cuentas FROM AdministradorEZFlix;
REVOKE EXECUTE ON PA_Administrador FROM AdministradorEZFlix;

-- XRoles
DROP ROLE ClienteEZFlix;
DROP ROLE SoporteEZFlix;
DROP ROLE AuditorEZFlix;
DROP ROLE AdministradorEZFlix;
DROP ROLE GerenteEZFlix;

-- XActores
DROP PACKAGE PA_Cliente;
DROP PACKAGE PA_Gerente;
DROP PACKAGE PA_Auditor;
DROP PACKAGE PA_Soporte;
DROP PACKAGE PA_Administrador;