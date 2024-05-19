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