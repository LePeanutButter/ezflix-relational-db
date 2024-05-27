-- Ciclo Uno
-- Consultar las operaciones mensuales
SELECT SUM(pago) AS Ingresos
    FROM (
        SELECT pago 
        FROM Compras
        WHERE EXTRACT(MONTH FROM fechaCompra) = EXTRACT(MONTH FROM SYSDATE)
        UNION ALL
        SELECT pago
        FROM Rentas
        WHERE EXTRACT(MONTH FROM fechaRenta) = EXTRACT(MONTH FROM SYSDATE)
    );
    
-- Consultar registros de auditoria
SELECT *
FROM Auditoria;

-- Ciclo Dos
-- Conocer los avisos generados por alertas que estan en estado "Activa", incluyendo los detalles del usuario destinatario y los datos afectados. Ordene los resultados por fecha de registro de las alertas de la mas reciente a la mas antigua.
SELECT id, destinatario, fechaCreacion
FROM GestoresDeAvisos
WHERE estadoAlerta = "activa"
ORDER BY fechaCreacion DESC;