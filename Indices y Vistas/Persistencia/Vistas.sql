CREATE OR REPLACE VIEW Ingresos AS
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