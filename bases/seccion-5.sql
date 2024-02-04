SELECT *
FROM
    country;

SELECT *
FROM
    country
WHERE
    code = 'NLD';

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