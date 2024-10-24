-----1-----

-----2-----

-----3-----

-----4-----

-----5-----

-----6-----

-----7-----

-----8-----

-----9-----

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