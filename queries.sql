/*Queries that provide answers to the questions from all projects.*/
--Select all animals whose name ends in "mon".
SELECT
    *
FROM
    animals
WHERE
    name LIKE '%mon';

-- List all animals born between 2016 and 2019.
SELECT
    *
FROM
    animals
WHERE
    date_of_birth BETWEEN '1-1-2016'
    AND '31-12-2019';

-- List all animals that are neutered and have less than 3 escape attempts.
SELECT
    *
FROM
    animals
WHERE
    neutered = '1'
    AND escape_attempts < 3;

-- List of date of birth of all animals named either "Agumon" or "Pikachu"
SELECT
    date_of_birth
FROM
    animals
WHERE
    name IN ('Agumon', 'Pikachu');

-- List of name and escape attempts of animals that weigh more than 10.5kg
SELECT
    name,
    escape_attempts
FROM
    animals
WHERE
    weight_kg > 10.5;

-- List all animals that are neutered.
SELECT
    *
FROM
    animals
WHERE
    neutered = '1';

-- List all animals not named Gabumon.
SELECT
    *
FROM
    animals
WHERE
    name NOT LIKE 'Gabumon';

-- Find all animals with a weight inclusive between 10.4kg and 17.3kg
SELECT
    *
FROM
    animals
WHERE
    weight_kg >= 10.4
    AND weight_kg <= 17.3;

-- BEGIN A TRANSACTION
BEGIN;

-- Set the species column to unspecified
UPDATE
    animals
SET
    species = 'unspecified';

SELECT
    *
FROM
    animals;

--Rollback
ROLLBACK;

SELECT
    *
FROM
    animals;

-- UPDATE TABLE
--Begin a Transaction
BEGIN;

-- Set the species column to digimon for all animals that have a name ending in mon.
UPDATE
    animals
SET
    species = 'digimon'
WHERE
    name LIKE '%mon';

-- Set the species column to pokemon for all animals that don't have species already set.
UPDATE
    animals
SET
    species = 'pokemon'
WHERE
    species IS NULL;

-- Commit transaction
COMMIT;

-- Delete all records in the animals table, then roll back the transaction.
BEGIN;

DELETE FROM
    animals;

SELECT
    *
FROM
    animals;

-- ROLLBACK
ROLLBACK;

SELECT
    *
FROM
    animals;

-- BEGIN A TRANSACTION
BEGIN;

-- Delete all animals born after Jan 1st, 2022.
DELETE FROM
    animals
WHERE
    date_of_birth > '1-1-2022';

--Create a savepoint
SAVEPOINT delete_dob;

-- Update all animals' weight to be their weight multiplied by -1.
UPDATE
    animals
SET
    weight_kg = weight_kg * -1;

-- Rollback to the savepoint
ROLLBACK TO SAVEPOINT delete_dob;

-- Update all animals' weights that are negative to be their weight multiplied by -1.
UPDATE
    animals
SET
    weight_kg = weight_kg * -1
WHERE
    weight_kg < 0;

-- Commit transaction
COMMIT;

-- Total number of animals.
SELECT
    count(*)
FROM
    animals;

-- No. of a nimals that have never tried to escape.
SELECT
    count(*)
FROM
    animals
WHERE
    escape_attempts = 0;

-- Average weight of animals.
SELECT
    AVG(weight_kg)
FROM
    animals;

-- Most escapes, neutered or not neutered animals.
SELECT
    neutered,
    MAX(escape_attempts)
FROM
    animals
GROUP BY
    neutered;

-- Minimum and maximum weight of each type of animal.
SELECT
    species,
    MAX(weight_kg),
    MIN(weight_kg)
FROM
    animals
GROUP BY
    species;

-- Average number of escape attempts per animal type of those born between 1990 and 2000.
SELECT
    species,
    AVG(escape_attempts)
FROM
    animals
WHERE
    date_of_birth BETWEEN '1990-12-31'
    AND '2000-12-31'
GROUP BY
    species;

-- Animals that belong to Melody Pond.
SELECT
    name,
    full_name
FROM
    animals
    JOIN owners ON animals.owner_id = owners.id
WHERE
    full_name = 'Melody Pond';

-- List animals that are pokemon.
SELECT
    animals.name,
    species.name
FROM
    animals
    JOIN species ON animals.species_id = species.id
WHERE
    species.name = 'Pokemon';

-- List of owners and their animals, including those that don't own any animal. 
SELECT
    name,
    full_name
FROM
    animals
    RIGHT JOIN owners ON animals.owner_id = owners.id;

-- Counts no. of animals per species.
SELECT
    COUNT(animals.name),
    species.name
FROM
    animals
    JOIN species ON animals.species_id = species.id
GROUP BY
    species.name;

-- List all Digimon owned by Jennifer Orwell.
SELECT
    owners.full_name,
    animals.name AS animal_name,
    species.name AS species_name
FROM
    animals
    JOIN owners ON animals.owner_id = owners.id
    JOIN species ON animals.species_id = species.id
WHERE
    owners.full_name = 'Jennifer Orwell'
    AND species.name = 'Digimon';

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT
    name,
    escape_attempts,
    full_name
FROM
    animals
    JOIN owners ON animals.owner_id = owners.id
WHERE
    full_name = 'Dean Winchester'
    AND escape_attempts = 0;

-- Owner who owns the most animals.
SELECT
    full_name,
    COUNT(animals.owner_id) as total_animals
FROM
    animals
    JOIN owners ON animals.owner_id = owners.id
GROUP BY
    owners.id
ORDER BY
    total_animals DESC
LIMIT
    1;