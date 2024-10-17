-----1-----
SELECT emp_no, apellido, oficio, dept_no
FROM emple
WHERE dept_no = 20
ORDER BY apellido;
-----2-----
SELECT *
FROM emple
WHERE oficio LIKE 'ANALISTA'
ORDER BY emp_no;
-----3-----
SELECT *
FROM emple
WHERE dept_no = 20 AND oficio LIKE 'ANALISTA'
ORDER BY apellido DESC, emp_no DESC;
-----4-----
SELECT apellido
FROM emple
WHERE apellido LIKE 'J%';
-----5-----
SELECT apellido
FROM emple
WHERE apellido LIKE '_R%';
-----6-----
SELECT apellido
FROM emple
WHERE apellido LIKE 'A%O%';
-----7-----
SELECT apellido
FROM emple
WHERE dept_no = 10 OR dept_no = 30;
-----8-----
SELECT apellido
FROM emple
WHERE dept_no NOT LIKE 10 AND dept_no NOT LIKE 30;
-----9-----
SELECT apellido
FROM emple
WHERE oficio LIKE 'VENDEDOR' OR oficio LIKE 'ANALISTA' OR oficio LIKE 'EMPLEADO';
-----10-----
SELECT apellido
FROM emple
WHERE oficio NOT LIKE 'VENDEDOR' AND oficio NOT LIKE 'ANALISTA' AND oficio NOT LIKE 'EMPLEADO';