SELECT *
FROM
    country;

SELECT *
FROM
    country
WHERE
    continent = 'Africa';

SELECT *
FROM
    country
WHERE
    region = 'Central America';

UPDATE country
SET
    continent = 'Central America'
WHERE
    region = 'Central America';


DELETE
FROM
    country
WHERE
    code2 = 'NA'

ALTER TABLE country
    ADD PRIMARY KEY (code);

-- Generate constrains
-- Verificaciones sobre campos en particular
ALTER TABLE country
    ADD CHECK ( surfacearea >= 0 );

SELECT DISTINCT
    continent
FROM
    country;

ALTER TABLE country
    ADD CHECK (
        (continent = 'Asia'::TEXT) OR
        (continent = 'South America') OR
        (continent = 'North America') OR
        (continent = 'Oceania') OR
        (continent = 'Antarctica') OR
        (continent = 'Africa') OR
        (continent = 'Central America') OR
        (continent = 'Europe')
        );

-- Tarea. Buscar país de centro america
-- Modificación checks - eliminación contrsaint (check)
ALTER TABLE country
    DROP CONSTRAINT "country_continent_check";

-- Indices
-- Indice único
CREATE UNIQUE INDEX "country_continent" ON country (name);
-- Indice a continentes
CREATE INDEX "country_continent" ON country (continent);

SELECT *
FROM
    city
WHERE
      name = 'Jinzhou'
  AND countrycode = 'CHN'
  AND district = 'Liaoning';

CREATE UNIQUE INDEX "unique_name_countrycode_district" ON city (name, countrycode, district);

CREATE INDEX "index_district" ON city (district);

SELECT *
FROM
    country
WHERE
    code = 'AFG';

INSERT INTO
    country
VALUES
    ('AFG', 'Afghanistan', 'Asia', 'Southern Asia', 652860, 1919, 40000000, 62, 69000000, NULL, 'Afghanistan',
     'Totalitarian', NULL, NULL, 'AF');

-- Llaves foráneas
ALTER TABLE city
    ADD CONSTRAINT fk_country_code
        FOREIGN KEY (countrycode) REFERENCES country (code); -- ON DELETE CASCADE

SELECT *
FROM
    city
WHERE
    countrycode = 'NAM';

DELETE
FROM
    countrylanguage
WHERE
    countrycode = 'NAM';

ALTER TABLE countrylanguage
    ADD CONSTRAINT fk_country_code
FOREIGN KEY (countrycode) REFERENCES country (code);


SELECT *
FROM
    country
WHERE code = 'AFG';

SELECT *
FROM
    city
WHERE countrycode = 'AFG';

-- DELETE ON CASCADE
DELETE FROM country WHERE code = 'AFG';
SELECT * FROM city WHERE code = 'AFG';
DELETE FROM countrylanguage WHERE code = 'AFG';