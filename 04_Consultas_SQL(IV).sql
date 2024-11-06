-----1-----
SELECT apellido
    FROM emple
WHERE (oficio, salario) = (SELECT oficio, salario
                                FROM emple
                            WHERE apellido = 'GIL');
-----2-----
SELECT apellido, oficio
    FROM emple
WHERE dept_no = 20
    AND oficio IN (SELECT DISTINCT(e.oficio)
                        FROM emple e, depart d
                 WHERE e.dept_no = d.dept_no
                        AND LOWER(d.dnombre) = 'ventas');
-----3-----
SELECT apenom
    FROM alumnos
WHERE dni IN (SELECT n.dni
                    FROM notas n, asignaturas a
                WHERE n.cod = a.cod
                    AND LOWER(a.nombre) = 'fol');
-----4-----
SELECT apellido, oficio, salario
    FROM emple
WHERE (dept_no, salario) IN (SELECT dept_no, salario
                                    FROM emple
                            WHERE LOWER(apellido) = 'fernández');
-----5-----
SELECT apellido, oficio
    FROM emple
WHERE oficio IN (SELECT oficio
                        FROM emple
                WHERE LOWER(apellido) = 'jiménez');
-----6-----
SELECT DISTINCT(tema)
    FROM libreria
WHERE ejemplares < (SELECT ejemplares
                        FROM libreria
                    WHERE LOWER(tema) = 'medicina');
-----7-----
SELECT apenom
    FROM alumnos
WHERE dni IN (SELECT al.dni
                    FROM alumnos al, asignaturas a, notas n
                WHERE al.dni = n.dni
                    AND n.cod = a. cod
                    AND LOWER(a.nombre) = 'fol'
                    AND n.nota BETWEEN 7 AND 8);
-----8-----
SELECT DISTINCT(a.nombre)
    FROM asignaturas a, notas n
WHERE a.cod = n.cod
    AND a.cod IN (SELECT cod
                    FROM notas
                GROUP BY cod
                HAVING MIN(nota) >= 5);
-----9-----
SELECT DISTINCT(al.apenom)
    FROM alumnos al, notas n
WHERE al.dni = n.dni
    AND al.dni IN (SELECT dni
                        FROM notas
                    GROUP BY dni
                    HAVING MIN(nota) < 5);
-----10-----
SELECT salario, apellido
    FROM emple
WHERE apellido IN (SELECT MAX(apellido)
                        FROM emple);
-----11-----
SELECT apellido
    FROM emple
WHERE salario IN (SELECT MAX(salario)
                        FROM emple);
-----12-----
SELECT apellido
    FROM emple
WHERE salario IN (SELECT MIN(salario)
                        FROM emple);
-----13-----
SELECT apellido, salario, dept_no
    FROM emple
WHERE (dept_no, salario) IN (SELECT dept_no, MAX(salario)
                                FROM emple
                            GROUP BY dept_no); ----------------------mal?????
-----14-----
SELECT apellido, salario, dept_no
    FROM emple
WHERE (salario, dept_no) IN (SELECT salario, AVG(dept_no)
                                FROM emple
                            GROUP BY dept_no); -----------------------mal
-----15-----
