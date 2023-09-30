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

--Move all select queries here as demanded by reviewer.
-- Update owner_id column of the animals table
UPDATE
    animals
SET
    owner_id = (
        SELECT
            id
        FROM
            owners
        WHERE
            full_name = 'Sam Smith'
    )
WHERE
    name = 'Agumon';

    -- Update owner_id column of the animals table
UPDATE
    animals
SET
    owner_id = (
        SELECT
            id
        FROM
            owners
        WHERE
            full_name = 'Sam Smith'
    )
WHERE
    name = 'Agumon';

    UPDATE
    animals
SET
    owner_id = (
        SELECT
            id
        FROM
            owners
        WHERE
            full_name = 'Dean Winchester'
    )
WHERE
    name IN ('Angemon', 'Boarmon');

    UPDATE
    animals
SET
    owner_id = (
        SELECT
            id
        FROM
            owners
        WHERE
            full_name = 'Jennifer Orwell'
    )
WHERE
    name IN ('Gabumon', 'Pikachu');

    UPDATE
    animals
SET
    owner_id = (
        SELECT
            id
        FROM
            owners
        WHERE
            full_name = 'Bob'
    )
WHERE
    name IN ('Devimon', 'Plantmon');

    UPDATE
    animals
SET
    owner_id = (
        SELECT
            id
        FROM
            owners
        WHERE
            full_name = 'Melody Pond'
    )
WHERE
    name IN ('Charmander', 'Squirtle', 'Blossom');

SELECT
    *
FROM
    animals;

-- BEGIN A TRANSACTION
BEGIN;

--delete functions moved to schema as requested by reviwer here..

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

-- Get last animal seen by William Tatcher
SELECT
    vet_id,
    vets.name AS vet_name,
    animals.name AS animal_name,
    date_of_visit
FROM
    visits
    JOIN vets ON visits.vet_id = vets.id
    JOIN animals ON visits.animal_id = animals.id
WHERE
    vets.name = 'William Tatcher'
ORDER BY
    date_of_visit DESC
LIMIT
    1;

-- No. of different animals Stephanie Mendez has seen
SELECT
    COUNT(*)
FROM
    visits
    JOIN vets ON visits.vet_id = vets.id
    JOIN animals ON visits.animal_id = animals.id
WHERE
    vets.name = 'Stephanie Mendez';

-- List all vets and their specialties, including vets with no specialties
SELECT
    vets.name AS vet_name,
    species.name AS species_name
FROM
    vets
    LEFT JOIN specializations ON vets.id = specializations.vet_id
    LEFT JOIN species ON species.id = specializations.species_id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020
SELECT
    animals.name AS animal_name,
    vets.name AS vet_name
FROM
    animals
    JOIN visits ON animals.id = visits.animal_id
    JOIN vets ON vets.id = visits.vet_id
WHERE
    vets.name = 'Stephanie Mendez'
    AND date_of_visit BETWEEN '1-4-2020'
    AND '30-8-2020';

-- The animal with the most visits to vets
SELECT
    animals.name AS animal_name,
    COUNT(*)
FROM
    visits
    JOIN animals ON visits.animal_id = animals.id
GROUP BY
    animals.name
ORDER BY
    COUNT(*) DESC
LIMIT
    1;

-- Maisy Smith's first animal visit
SELECT
    vet_id,
    vets.name AS vet_name,
    animals.name AS animal_name,
    date_of_visit
FROM
    visits
    JOIN animals ON visits.animal_id = animals.id
    JOIN vets ON visits.vet_id = vets.id
WHERE
    vets.name = 'Maisy Smith'
ORDER BY
    date_of_visit
LIMIT
    1;

-- Details for most recent visit: animal information, vet information, and date of visit
SELECT
    animals.name AS animal,
    animals.date_of_birth AS animal_dob,
    species.name AS type,
    vets.name AS doctor,
    vets.age AS age,
    visits.date_of_visit AS date
FROM
    visits
    JOIN vets ON visits.vet_id = vets.id
    JOIN animals ON visits.animal_id = animals.id
    JOIN specializations ON vets.id = specializations.vet_id
    JOIN species ON species.id = specializations.species_id
ORDER BY
    visits.date_of_visit DESC
LIMIT
    1;

-- No. of visits with a vet that did not specialize in the animal's species
SELECT
    COUNT(*)
FROM
    visits
    LEFT JOIN vets ON visits.vet_id = vets.id
    LEFT JOIN specializations ON vets.id = specializations.vet_id
    LEFT JOIN species ON specializations.species_id = species.id
WHERE
    specializations.vet_id IS NULL;

-- The specialty Maisy Smith should consider getting
SELECT
    vets.name AS doctor,
    species.name AS consider_specialty,
    COUNT(*) AS most_visits
FROM
    visits
    JOIN vets ON visits.vet_id = vets.id
    JOIN animals ON visits.animal_id = animals.id
    JOIN species ON animals.species_id = species.id
WHERE
    vets.name = 'Maisy Smith'
GROUP BY
    (vets.name, species.name)
LIMIT
    1;