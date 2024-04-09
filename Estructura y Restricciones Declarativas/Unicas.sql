ALTER TABLE GroupWatch ADD CONSTRAINT UK_GroupWatch_perfilSincronizado UNIQUE (perfilSincronizado);
ALTER TABLE Cuentas ADD CONSTRAINT UK_Cuentas_nombre_correo UNIQUE (nombre, correo);