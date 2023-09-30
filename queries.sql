BEGIN;

-- Start a Transaction:
BEGIN -- Update "species" to "unspecified" for Animals with Names Ending in "mon":
UPDATE
  animals
SET
  species = 'unspecified'
WHERE
  name LIKE '%mon';

--Implement Reviewers change
SELECT
  species
from
  animals;

-- verify that change was made
ROLLBACK;

SELECT
  species
from
  animals;

-- Update "species" to "pokemon" for Animals without a Species:
BEGIN;

UPDATE
  animals
SET
  species = 'digimon'
WHERE
  name LIKE '%mon';

COMMIT;

SET
  species = 'pokemon'
WHERE
  species IS NULL;

UPDATE
  5 -- TAKE A BREATH 
  BEGIN;

-- Display changes to comfirm
SELECT
  *
FROM
  animals;

--implement Reviewers' changes
BEGIN;

DELETE FROM
  animals
WHERE
;

SELECT
  COUNT(*)
FROM
  ANIMALS;

ROLLBACK;

SELECT
  COUNT(*)
FROM
  ANIMALS;

BEGIN -- Delete Animals Born After Jan 1st, 2022:
DELETE FROM
  animals
WHERE
  date_of_birth > '2022-01-01';

DELETE 1 SAVEPOINT before_weight_update;

-- Create a Savepoint for the Transaction:
SAVEPOINT
UPDATE
  animals
SET
  weight_kg = - weight_kg;

UPDATE
  10 ROLLBACK TO SAVEPOINT before_weight_update;

-- Display changes to comfirm
SELECT
  *
FROM
  animals;

ROLLBACK -- Update Animals' Weights That Are Negative:
UPDATE
  animals
SET
  weight_kg = - weight_kg
WHERE
  weight_kg < 0;

UPDATE
  4 -- Display changes to comfirm
SELECT
  *
FROM
  animals;

COMMIT;

SELECT
  COUNT(*)
FROM
  animals;

SELECT
  COUNT(*)
FROM
  animals
WHERE
  escape_attempts = 0;

SELECT
  AVG(weight_kg)
FROM
  animals;

SELECT
  neutered,
  MAX(escape_attempts) AS max_escape_attempts mydb - # FROM animals
GROUP BY
  neutered;

SELECT
  species,
  MIN(weight_kg) AS min_weight,
  MAX(weight_kg) AS max_weight
FROM
  animals
GROUP BY
  species;

SELECT
  species,
  AVG(escape_attempts) AS avg_escape_attempts
FROM
  animals
WHERE
  date_of_birth BETWEEN '1990-01-01'
  AND '2000-12-31'
GROUP BY
  species;