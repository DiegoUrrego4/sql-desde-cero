-- Agrupación y ordenamiento:
SELECT
    first_name,
    last_name,
    followers
FROM
    users
-- WHERE followers >= 4600 AND followers <= 4700
WHERE
    followers BETWEEN 4600 AND 4700
ORDER BY
    followers ASC;

-- funciones agregadas
SELECT
    COUNT(*)                  AS total_users,
    MIN(followers)            AS min_followers,
    MAX(followers)            AS max_followers,
    ROUND(AVG(followers))     AS avg_followers, -- Esto redondea
    SUM(followers) / COUNT(*) AS avg_manual
FROM
    users;

-- Persona que tiene más y menos seguidores
SELECT
    first_name,
    last_name,
    followers
FROM
    users
WHERE
     followers = 4
  OR followers = 4999;

-- Usando group by
SELECT
    COUNT(*),
    followers
FROM
    users
WHERE
     followers = 4
  OR followers = 4999
GROUP BY
    followers;


SELECT
    COUNT(*) AS total,
    country
FROM
    users
GROUP BY
    country
HAVING
    COUNT(*) >= 6 -- Se aplica a grupos de datos.
ORDER BY
    COUNT(*) DESC;

-- Traer todos los países sin datos repetidos presentes en la tabla.
SELECT DISTINCT
    country
FROM
    users;

-- Encontrar número de personas con un dominio
SELECT
    COUNT(*),
    SUBSTR(email, POSITION('@' IN email) + 1) AS email_domain
FROM
    users
GROUP BY
    SUBSTR(email, POSITION('@' IN email) + 1)
HAVING
    COUNT(*) > 1;

-- Sub querys
SELECT
    *
FROM
    (SELECT
         COUNT(*)                                  AS total,
         SUBSTR(email, POSITION('@' IN email) + 1) AS email_domain,
         'Fernando'                                AS name,
         37                                        AS age
     FROM
         users
     GROUP BY
         SUBSTR(email, POSITION('@' IN email) + 1)
     HAVING
         COUNT(*) > 1) AS emails_domain;



