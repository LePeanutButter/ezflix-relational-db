ALTER TABLE GroupWatch ADD CONSTRAINT UK_GroupWatch_perfilSincronizado UNIQUE (perfilSincronizado);
ALTER TABLE Perfiles ADD CONSTRAINT UK_Perfiles_nombre UNIQUE (nombre);
ALTER TABLE Cuentas ADD CONSTRAINT UK_Cuentas UNIQUE (nombre, correo);