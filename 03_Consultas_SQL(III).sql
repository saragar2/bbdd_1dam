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
-------------------ejemplos
SELECT COUNT(*), COUNT(dept_no), COUNT(1)
    FROM emple;
    
SELECT ROUND(AVG(salario), 2), MAX(salario), MIN(salario)
    FROM emple;

SELECT dept_no, oficio, ROUND(AVG(salario), 2)
    FROM emple
GROUP BY dept_no, oficio;
--- DE 17 A 20, DE 21 A 25 SON FECHAS, 30 Y 30