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
