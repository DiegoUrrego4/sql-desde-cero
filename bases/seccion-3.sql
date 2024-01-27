CREATE TABLE "users"
(
    -- Esto quiere decir que el nombre será único y no habrá duplicados
    name VARCHAR(10) UNIQUE
);

-- Inserciones
INSERT INTO users ("name")
VALUES ('Jennyfer'),
       ('Jorge'),
       ('Clara');

-- Actualizaciones
UPDATE users
SET name= 'Fernando'
WHERE name = 'Alberto';

-- Listar registros
SELECT *
FROM users
LIMIT 2 OFFSET 2; -- limit: cantidad registros, offset: cantidad registros a saltar

SELECT *
FROM users
WHERE name LIKE '_lara';
-- Esto es para que SQL sepa que solo puede ver UNA sola letra antes

-- Eliminaciones:
--  Hay que tener cuidado con el "where", pues si no se usa eliminará TODOS los registros
DELETE
FROM users
WHERE name LIKE '_elissa%';

-- Borrar tablas enteras
DROP TABLE users;

-- El truncate elimina la data de las columnas pero NO TODA LA TABLA
TRUNCATE TABLE users;

SELECT id,
       UPPER(name)                     AS upper_name,
       LOWER(name)                     AS lower_name,
       LENGTH(name),
       (20 * 2)                        AS constante,
       '*' || name || '-' || id || '*' AS bar_code,
       CONCAT('*', name, '-', id, '*'),
       name
FROM users;

-- Tenemos que crear una columna con nombre y otra con apellido
SELECT name,
       SUBSTR(name, 0, 5),
       POSITION('E' IN name),
       SUBSTR(name, 0, POSITION(' ' IN name))    AS first_name,
       SUBSTR(name, POSITION(' ' IN name) + 1)   AS last_name,
       -- Esto quita espacios inciales y finales pero NO es recomendado
       TRIM(SUBSTR(name, POSITION(' ' IN name))) AS last_name
FROM users;

UPDATE users
SET first_name = SUBSTR(name, 0, POSITION(' ' IN name)),
    last_name  = SUBSTR(name, POSITION(' ' IN name) + 1);

SELECT *
FROM users;

