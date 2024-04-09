-- Consulta la cantidad de veces que ha sido comprada una categoria en especifico el ultimo mes
SELECT categoria, COUNT(idCompras) AS compras
FROM Compras
JOIN Peliculas ON Compras.idPelicula = Peliculas.id
JOIN Versiones ON Peliculas.id = Versiones.idPelicula
WHERE EXTRACT(MONTH FROM fechaCompra) = EXTRACT(MONTH FROM SYSDATE)
GROUP BY categoria
ORDER BY COUNT(idCompras) DESC;