-----1-----
INSERT INTO profesores VALUES (45, 123, 'Quiroga Mart�n', 'INFORM�TICA');
-----2-----
INSERT INTO profesores VALUES (22, 0, 'Seco Jimenez', 'LENGUA');
-----3-----
INSERT INTO profesores VALUES (22, 23444800, 'Gonz�lez Sevilla', '  HISTORIA');
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
INSERT INTO emple VALUES (1111, 'GARC�A', 'LIMPIADOR', 7698, SYSDATE, 130000, 11000, (SELECT MAX(dept_no)
                                                                                                  FROM emple));
-----8-----
INSERT INTO emple
    SELECT 1112, 'QUIROGA', oficio, dir, SYSDATE, salario, comision, dept_no
        FROM emple
    WHERE emp_no = 7788;
-----9-----
UPDATE centros
    SET direccion = 'C/ Pil�n 13',
        num_plazas = 295
WHERE cod_centro = 22;
-----10-----
UPDATE centros
    SET direccion = 'C/ Pil�n 13',
        num_plazas = 295; -----sin el WHERE (como es l�gico) se cambian todas las filas
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
                        FROM emple) ------sin terminar
-----13-----
