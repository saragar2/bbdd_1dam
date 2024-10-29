-----1-----
SELECT e.*, d.loc
    FROM emple e, depart d
WHERE e.dept_no = d.dept_no
    AND d.loc IN ('MADRID', 'BARCELONA');
-----2-----
SELECT e.apellido, e.oficio, e.emp_no, d.dnombre, d.loc
    FROM emple e, depart d
WHERE e.dept_no = d.dept_no;
-----3-----
SELECT e.apellido, e.oficio, d.loc
    FROM emple e, depart d
WHERE e.dept_no = d.dept_no
    AND e.oficio LIKE 'ANALISTA';
-----4-----
SELECT a.apenom, a.pobla, n.nota
    FROM alumnos a, notas n
WHERE a.dni = n.dni
    AND n.nota < 5
    AND a.pobla = 'Madrid';
-----5-----
SELECT p.p_nombre || ' ' || p.p_apellido, l.l_nombre
    FROM pasajero p, lugar l
WHERE p.pais_residencia = l.l_codigo
    AND l.l_nombre = 'Australia';
-----6-----
SELECT e.apenom, a.nombre, n.nota
    FROM alumnos e, asignaturas a, notas n
WHERE e.dni = n.dni
    AND a.cod = n.cod;
-----7-----
SELECT e.apenom, a.nombre
    FROM alumnos e, asignaturas a, notas n
WHERE e.dni = n.dni
    AND a.cod = n.cod
    AND a.nombre = 'FOL';
-----8-----
SELECT a.nombre, e.pobla
    FROM alumnos e, asignaturas a, notas n
WHERE e.dni = n.dni
    AND a.cod = n.cod
    AND a.nombre LIKE '%o%o%'
    AND e.pobla = 'Madrid';
-----9-----
SELECT e.apenom, a.nombre, n.nota
    FROM alumnos e, asignaturas a, notas n
WHERE e.dni = n.dni
    AND n.cod = a.cod
    AND a.nombre = 'FOL'
    AND n.nota BETWEEN 7 AND 8;
-----10-----
SELECT l_nombre, 
CASE WHEN l_total_habitantes > 50000000 THEN 'Muy poblado'
    WHEN l_total_habitantes > 20000000 THEN 'Bastante poblado'
    ELSE 'Poco poblado'
    END AS Población
FROM lugar
WHERE LOWER(l_tipo) = 'pais';
-----11-----
SELECT p_nombre ||' ' || p_apellido,
CASE WHEN LOWER(p_perfil) = 'business class' THEN 'PLATINO'
    WHEN LOWER(p_perfil) = 'primera_clase' THEN 'ORO'
    ELSE 'BRONCE'
    END AS Categoría
FROM pasajero;
-----12-----
SELECT l_nombre,
CASE WHEN LOWER(l_descripcion) = 'hemisferio norte' THEN 'NORTE'
    ELSE 'SUR'
    END AS UBICACION
FROM lugar
WHERE LOWER(l_tipo) = 'pais';
-----13-----
SELECT p_nombre || ' ' || p_apellido,
DECODE (p_perfil, 'LOW_COST', 'TURISTA',
        p_perfil)
        AS NUEVO_PERFIL
FROM pasajero;
-----14-----
SELECT p_nombre || ' ' ||p_apellido,
DECODE (p_perfil, NULL, 'Sin perfil',
        p_perfil)
        AS NUEVO_PERFIL
FROM pasajero;
-----15-----
SELECT p_nombre || ' ' || p_apellido,
DECODE (p_perfil, 'LOW_COST', 'TURISTA'
                , NULL, 'Sin perfil'
                , p_perfil)
        AS NUEVO_PERFIL
FROM pasajero;