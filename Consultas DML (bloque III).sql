--ROLLBACK--

ROLLBACK;

-----1-----
INSERT INTO profesores VALUES (45, 123, 'Quiroga Martín', 'INFORMÁTICA');
-----2-----
INSERT INTO profesores VALUES (22, 0, 'Seco Jimenez', 'LENGUA');
-----3-----
INSERT INTO profesores VALUES (22, 23444800, 'González Sevilla', '  HISTORIA');
-----4-----
INSERT INTO profesores VALUES (22, 1, 'Franco Bahamonde', 'HISTORIA DEL ANTIGUO EGIPTO'); ---da error porque la especialidad es demasiado larga
-----5-----
INSERT INTO emple30
    SELECT *
        FROM emple
    WHERE dept_no = 30;
-----6-----
INSERT INTO nombres (nombre)
    SELECT apellido
        FROM emple
    WHERE dept_no = 20;
-----7-----
INSERT INTO emple VALUES (1111, 'GARCÍA', 'LIMPIADOR', 7698, SYSDATE, 130000, 11000, (SELECT MAX(dept_no)
                                                                                                  FROM emple));
-----8-----
INSERT INTO emple
    SELECT 1112, 'QUIROGA', oficio, dir, SYSDATE, salario, comision, dept_no
        FROM emple
    WHERE emp_no = 7788;
-----9-----
UPDATE centros
    SET direccion = 'C/ Pilón 13',
        num_plazas = 295
WHERE cod_centro = 22;
-----10-----
UPDATE centros
    SET direccion = 'C/ Pilón 13',
        num_plazas = 295; -----sin el WHERE (como es lógico) se cambian todas las filas
-----11-----
UPDATE centros
    SET direccion = (SELECT direccion
                            FROM centros
                    WHERE cod_centro = 50),
        num_plazas = (SELECT num_plazas
                            FROM centros
                    WHERE cod_centro = 50)
WHERE cod_centro = 10;
-----12-----
UPDATE emple
    SET salario = salario / 2,
        comision = 0
WHERE dept_no IN (SELECT dept_no
                        FROM emple); ------sin terminar
-----13-----
UPDATE emple
    SET salario = 2 *(SELECT salario
                        FROM emple
                    WHERE emp_no = 7369),
        apellido = LOWER(apellido)
WHERE dept_no IN (SELECT dept_no
                        FROM depart
                    WHERE LOWER(dnombre) = 'contabilidad');
-----14-----
DELETE FROM centros
    WHERE cod_centro = 50; -------------da error porque una fk le hace referencia
-----15-----
DELETE FROM centros; -------------------esta tambien
-----16-----
DELETE FROM libreria lib
    WHERE ejemplares <= (SELECT AVG(ejemplares)
                            FROM libreria
                         WHERE lib.estante = libreria.estante); -----repasar, está hehco en clase
-----17-----
DELETE FROM depart
    WHERE (SELECT COUNT(emp_no)
                    FROM emple
                GROUP BY dept_no) < 4; -----está mal
-----18-----
INSERT INTO coches VALUES ('TOYOTA');
INSERT INTO coches VALUES ('BMW');
-----19-----
UPDATE coches
    SET nombre = 'SEAT IBIZA'
WHERE LOWER(nombre) = 'seat';
-----20-----
INSERT INTO alum
    SELECT *
        FROM nuevos; -------------------da error porque en la tabla nuevos hay nombres que ya aparecen
-----21-----
DELETE FROM alum
    WHERE nombre IN (SELECT nombre
                            FROM antiguos);
-----22-----
INSERT INTO emple
    SELECT 200, 'SAAVEDRA', oficio, dir, SYSDATE, salario + (0.20 * salario), comision, dept_no
        FROM emple
    WHERE emp_no = 7521;
-----23-----
UPDATE emple
    SET dept_no = (SELECT dept_no
                        FROM emple
                    HAVING COUNT(emp_no) IN (SELECT MAX(COUNT(emp_no))
                                                    FROM emple
                                                 GROUP BY dept_no))
WHERE LOWER(apellido) = 'saavedra'; ----está mal
-----24-----
DELETE FROM depart
    WHERE dept_no NOT IN (SELECT DISTINCT(dept_no)
                                FROM emple);
-----25-----
UPDATE centros
    SET num_plazas = num_plazas / 2
WHERE cod_centro IN (SELECT cod_centro
                            FROM profesores
                        GROUP BY cod_centro
                        HAVING COUNT(DISTINCT(cod_centro)) < 2);
-----26-----
DELETE FROM centros
    WHERE cod_centro NOT IN (SELECT DISTINCT(cod_centro)
                                 FROM personal);
-----27-----
INSERT INTO profesores VALUES(10, 8790055, 'Clara Salas', 'idiomas');
-----28-----
DELETE FROM personal
    WHERE (SELECT num_plazas
                FROM centros) < 300
            AND (SELECT COUNT(cod_centro)
                     FROM profesores
                 GROUP BY cod_centro) < 2; --------está mal
-----29-----
DELETE FROM profesores
    WHERE dni NOT IN (SELECT dni
                            FROM personal);
-----30-----
INSERT INTO articulos VALUES ('Chocolate', (SELECT cod_fabricante
                                                FROM fabricantes
                                            WHERE LOWER(pais) = 'francia'), 0, 'Primera', 0, 0, 5);
-----31-----
INSERT INTO pedidos
    SELECT DISTINCT '111-A', articulo, cod_fabricante, peso, categoria, SYSDATE, 20
        FROM ventas
    WHERE articulo = (SELECT articulo
                            FROM ventas
                        GROUP BY articulo
                        HAVING SUM(unidades_vendidas) = (SELECT MAX(SUM(unidades_vendidas))
                                                            FROM ventas
                                                         GROUP BY articulo)); ------inserta dos filas y no se por qué
-----32-----