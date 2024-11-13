-----1-----
SELECT  DISTINCT(c.nombre_cliente)
    FROM cliente c, pago p
WHERE c.codigo_cliente = p.codigo_cliente
    AND EXTRACT(year FROM p.fecha_pago) = 2007;
-----2-----
SELECT codigo_empleado, nombre, codigo_jefe
    FROM empleado
WHERE codigo_jefe IN (SELECT codigo_jefe
                            FROM empleado
                        WHERE codigo_empleado = 8)
    AND codigo_empleado != 8;
-----3-----
SELECT *
    FROM producto
WHERE proveedor IN (SELECT proveedor
                        FROM producto
                    WHERE codigo_producto = 'FR-11')
    AND codigo_producto != 'FR-11';
-----4-----
SELECT *
    FROM cliente
WHERE codigo_empleado_rep_ventas IN (SELECT codigo_empleado_rep_ventas
                                        FROM cliente
                                    WHERE codigo_cliente = 11)
    AND codigo_cliente != 11;
-----5-----
SELECT *
    FROM producto
WHERE precio_venta < (SELECT precio_venta
                            FROM producto
                        WHERE codigo_producto = 'OR-134');
-----6-----
SELECT *
    FROM detalle_pedido
WHERE codigo_producto IN (SELECT codigo_producto
                                FROM producto
                            WHERE precio_venta = (SELECT MAX(precio_venta)
                                                        FROM producto
                                                    WHERE LOWER(gama) = 'frutales'));
-----7-----
SELECT *
    FROM producto
WHERE codigo_producto IN (SELECT codigo_producto
                                FROM detalle_pedido
                            WHERE cantidad IN (SELECT cantidad
                                                    FROM detalle_pedido
                                                WHERE LOWER(codigo_producto) = 'fr-17'));
-----8-----
SELECT *
    FROM empleado
WHERE codigo_oficina NOT IN (SELECT codigo_oficina
                                        FROM empleado
                                    WHERE codigo_empleado = 17);
-----9-----
SELECT c.codigo_cliente, COUNT(p.codigo_pedido) AS total_pedidos
    FROM cliente c, pedido p
WHERE c.codigo_cliente = p.codigo_cliente
GROUP BY c.codigo_cliente
HAVING COUNT(p.codigo_pedido) > (SELECT COUNT(codigo_pedido)
                                    FROM Pedido
                                WHERE codigo_cliente = 35);
-----10-----
SELECT  DISTINCT pe.*
    FROM pedido pe, detalle_pedido d, producto pr
WHERE pe.codigo_pedido = d.codigo_pedido
    AND d.codigo_producto = pr.codigo_producto
    AND pr.gama IN (SELECT gama
                        FROM producto
                    WHERE codigo_producto = '11679')
ORDER BY pe.codigo_pedido;
-----11-----