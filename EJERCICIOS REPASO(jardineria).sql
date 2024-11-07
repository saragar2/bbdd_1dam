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