-----1-----
SELECT l_nombre
    FROM lugar;
-----2-----
SELECT p_nombre, p_apellido
    FROM pasajero;
-----3-----
SELECT l_nombre, l_clima
    FROM lugar;
-----4-----
SELECT l_nombre, l_total_habitantes, l_total_habitantes + 100000
    FROM lugar;
-----5-----
SELECT l_nombre, l_tipo, l_total_habitantes, (l_total_habitantes * 2) DOBLE_DE_HABITANTES
    FROM lugar;
-----6-----
SELECT DISTINCT l_clima
    FROM lugar;
-----7-----
SELECT DISTINCT p_perfil
    FROM pasajero;
-----8-----
SELECT DISTINCT p_apellido, p_perfil
    FROM pasajero;
-----9-----
SELECT p_nombre, p_apellido
    FROM pasajero
WHERE p_perfil LIKE 'TURISTA';
-----10-----
SELECT l_nombre
    FROM lugar
WHERE l_clima LIKE 'Tropical';
-----11-----
SELECT l_nombre, l_total_habitantes
    FROM lugar
WHERE l_total_habitantes > 10000000;
-----12-----
--***********************************************************************************fecha
-----13-----
SELECT p_nombre, p_fecha_nacimiento NACIDO_EL
    FROM pasajero
WHERE p_perfil LIKE 'BUSINESS CLASS' or p_perfil LIKE 'PRIMERA_CLASE';
-----14-----
SELECT l_nombre, l_clima
    FROM lugar
WHERE l_clima NOT LIKE 'Mediterraneo';
-----15-----
SELECT p_nombre
    FROM pasajero
WHERE p_nombre LIKE 'M%';
-----16-----
SELECT l_nombre
    FROM lugar
WHERE l_nombre LIKE '%a%';
-----17-----
SELECT DISTINCT p_apellido
    FROM pasajero
WHERE p_apellido LIKE 'M%ez';
-----18-----
SELECT l_nombre
    FROM lugar
WHERE l_clima IS NOT NULL;
-----19-----
SELECT p_nombre, p_apellido
    FROM pasajero
WHERE p_perfil IS NULL;
-----20-----
--***********************************************************************************fecha
-----21-----
SELECT p_nombre, p_apellido, p_perfil
    FROM pasajero
WHERE p_perfil LIKE 'LOW_COST' AND p_apellido LIKE 'Ruiz';
-----22-----
SELECT l_nombre
    FROM lugar
WHERE l_total_habitantes IS NULL OR l_nombre LIKE 'K%' OR l_clima IS NULL OR l_clima LIKE 'Mediterraneo';
-----23-----
SELECT l_nombre
    FROM lugar
WHERE (l_clima IS NULL AND l_nombre LIKE '%ciudad%') OR l_total_habitantes  < 60000000;
-----24-----
--***********************************************************************************fecha
-----25-----
SELECT l_nombre
    FROM lugar
WHERE (l_total_habitantes < 50000000 OR l_total_habitantes > 100000000) AND (l_cod_continente = 10 OR l_cod_continente = 30) AND l_nombre LIKE '%s%';
-----26-----
SELECT l_nombre, l_total_habitantes
    FROM lugar
WHERE l_tipo LIKE 'PAIS'
ORDER BY l_total_habitantes DESC;
-----27-----
SELECT (p_nombre || ' '|| p_apellido) nombre_apellido
    FROM pasajero
ORDER BY p_apellido;
-----28-----
SELECT l_nombre
    FROM lugar
WHERE l_clima LIKE 'Tropical'
ORDER BY l_nombre;
-----29-----
SELECT l_nombre, l_total_habitantes
    FROM lugar
WHERE l_cod_continente = 10
ORDER BY l_total_habitantes;
-----30-----
--***********************************************************************************fecha
-----31-----
SELECT l_nombre
    FROM lugar
WHERE l_tipo LIKE 'CONTINENTE'
ORDER BY l_nombre;
-----32-----
SELECT p_nombre, p_perfil
    FROM pasajero
WHERE NOT p_perfil NOT LIKE 'BUSINESS CLASS'
ORDER BY p_num_telefono, p_apellido;
-----33-----
--***********************************************************************************aun no
-----34-----
--***********************************************************************************aun no
-----35-----
--***********************************************************************************aun no