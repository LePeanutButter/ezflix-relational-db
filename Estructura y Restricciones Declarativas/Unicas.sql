ALTER TABLE Cuentas ADD CONSTRAINT UK_Cuentas_nombre_correo UNIQUE (nombre);
ALTER TABLE Cuentas ADD CONSTRAINT UK_Cuentas_correo_contraseña UNIQUE (correo, contraseña);