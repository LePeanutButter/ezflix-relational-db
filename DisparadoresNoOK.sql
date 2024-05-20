---Ejecutar esto primero
INSERT INTO  operaciones (idCuenta) VALUES ('400000000000000003');
INSERT INTO  operaciones (idCuenta) VALUES ('400000000000000003');
INSERT INTO Compras (idOperacion, idPelicula, pago) VALUES ('O2211383302609437571', 'P2967681405221897760', '20000');
INSERT INTO Compras (idOperacion, idSerie, pago) VALUES ('O6861682890734828979', 'S2509139929205025080', '20000');

---TG_Compras_BI, no se puede comprar la pelicula más de una vez.
INSERT INTO Compras (idOperacion, idPelicula, pago) VALUES ('O2211383302609437571', 'P2967681405221897760', '20000');
INSERT INTO Compras (idOperacion, idSerie, pago) VALUES ('O6861682890734828979', 'S2509139929205025080', '20000');
---TG_Compras_BI, No se ha proporcionado ni idPelicula ni idSerie.
INSERT INTO Compras (idOperacion, pago) VALUES ('O5464708517924057790', '20000');


