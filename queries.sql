BEGIN;
-- Start a Transaction:
BEGIN

-- Update "species" to "unspecified" for Animals with Names Ending in "mon":
UPDATE
  animals
SET
  species = 'unspecified'
WHERE
  name LIKE '%mon';

UPDATE
  6
-- Display changes to comfirm
SELECT * FROM animals;

  -- Update "species" to "pokemon" for Animals without a Species:
UPDATE
  animals
SET
  species = 'pokemon'
WHERE
  species IS NULL;

UPDATE
  5 -- TAKE A BREATH 
  BEGIN;

  -- Display changes to comfirm
SELECT * FROM animals;

BEGIN

-- Delete Animals Born After Jan 1st, 2022:
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
SELECT * FROM animals;

ROLLBACK

-- Update Animals' Weights That Are Negative:
UPDATE
  animals
SET
  weight_kg = - weight_kg
WHERE
  weight_kg < 0;

UPDATE
  4
-- Display changes to comfirm
SELECT * FROM animals;

COMMIT;