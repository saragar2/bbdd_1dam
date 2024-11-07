-----1-----
SELECT  DISTINCT(c.nombre_cliente)
    FROM cliente c, pago p
WHERE c.codigo_cliente = p.codigo_cliente
    AND EXTRACT(year FROM p.fecha_pago) = 2007;
-----2-----
SELECT 