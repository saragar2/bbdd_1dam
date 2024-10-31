-----1-----
-----2-----
SELECT AVG(salario)
    FROM emple
WHERE dept_no = 10;
-----3-----
SELECT COUNT(*)
    FROM emple;
-----4-----
SELECT COUNT(*)
    FROM emple
WHERE comision IS NOT NULL;
-----5-----
SELECT MAX(salario)
    FROM emple;
-----6-----
SELECT MAX(apellido)
    FROM emple;
-----7-----
SELECT SUM(salario)
    FROM emple;
-----8-----
SELECT COUNT(DISTINCT oficio)
    FROM emple;
-----9-----
SELECT COUNT(DISTINCT oficio)
    FROM emple
WHERE dept_no = 10
    OR dept_no = 20;
-----10-----
-----11-----
-----12-----
-----13-----
SELECT COUNT(*)
    FROM libreria
WHERE tema LIKE '%a%';
-----14-----
SELECT COUNT(DISTINCT estante)
    FROM libreria;
-----15-----
SELECT COUNT(DISTINCT estante)
    FROM libreria
WHERE LOWER(tema) LIKE '%e%';
-----16-----
-----17-----
SELECT dept_no, COUNT(1)
    FROM emple
GROUP BY dept_no;
-----18-----
SELECT dept_no, COUNT(1)
    FROM emple
GROUP BY dept_no
HAVING COUNT(1) > 4;
-----19-----
SELECT e.dept_no, d.dnombre, COUNT(*) AS total_empleados
    FROM emple e
JOIN depart d ON e.dept_no = d.dept_no
GROUP BY e.dept_no, d.dnombre
HAVING COUNT(*) > 2;
-----20-----
SELECT estante, COUNT(tema)
    FROM libreria
GROUP BY estante
HAVING COUNT(tema) = 3;
-----21-----
SELECT SYSDATE
FROM DUAL;
-----22-----
SELECT EXTRACT(month FROM fecha_alt)
    FROM emple;
-----23-----
SELECT ('Hoy es ' || SYSDATE) as hoy
    FROM dual;
-----24-----
SELECT TO_DATE('01012022', 'DDMMYYYY')
    FROM dual;
-----25-----
SELECT 'es el día ' || EXTRACT(day FROM TO_DATE('01012022', 'DDMMYYYY'))
    FROM dual;
-----26-----
SELECT e.apellido, e.oficio, e.emp_no, d.dnombre, d.loc
    FROM emple e, depart d
WHERE e.dept_no = d.dept_no;
-----27-----
SELECT e.*, d.loc
    FROM emple e, depart d
WHERE e.dept_no = d.dept_no
    AND LOWER(d.loc) IN ('madrid', 'barcelona');
-----28-----
SELECT e.apellido, e.oficio, d.loc
    FROM emple e, depart d
WHERE e.dept_no = d.dept_no
    AND LOWER(e.oficio) = 'analista';
-----29-----
SELECT d.dnombre, SUM(e.salario), MAX(e.salario), MIN(e.salario)
    FROM emple e, depart d
WHERE e.dept_no = d.dept_no
GROUP BY d.dnombre;
-----30-----
SELECT d.dnombre, COUNT(1)
    FROM emple e, depart d
WHERE e.dept_no = d.dept_no
GROUP BY d.dnombre
HAVING COUNT(1) > 4;
-----31-----






-------------------ejemplos
SELECT COUNT(*), COUNT(dept_no), COUNT(1)
    FROM emple;
    
SELECT ROUND(AVG(salario), 2), MAX(salario), MIN(salario)
    FROM emple;

SELECT dept_no, oficio, ROUND(AVG(salario), 2)
    FROM emple
GROUP BY dept_no, oficio;
--- DE 17 A 20, DE 21 A 25 SON FECHAS, 30 Y 31