-- Volcado de informacióon - tablas y alteraciones de columnas
-- 1 Actualizaciones masivas
-- 2 Creación y volcado de información
-- 3 Alteración de indices y checks
-- 4 ELiminación de checks
-- 5 Modificación de columnas mediante GUI manualmente
-- 6 Creación de tablñas
-- 7 Relaciones

SELECT DISTINCT
    continent
FROM
    country
ORDER BY
    continent;

-- Creación tabla continentes
-- Inserción data continentes a tabla
INSERT INTO
    continent (name)
SELECT DISTINCT
    continent
FROM
    country
ORDER BY
    continent;

-- Volcado información a tabla back up
INSERT INTO
    country_bk
SELECT *
FROM
    country;

SELECT *
FROM
    country;

-- Borrado de check
ALTER TABLE country
    DROP CONSTRAINT country_continent_check;

SELECT
    a.name,
    a.continent,
    (SELECT b.code FROM continent b WHERE b.name = a.continent)
FROM
    country a;

-- Actualizaciópn tabla continente
UPDATE country a
SET
    continent = (SELECT b.code FROM continent b WHERE b.name = a.continent);

-- Modificar tipo de dato columna
ALTER TABLE country
    ALTER COLUMN continent TYPE int4
        USING continent::INTEGER;




