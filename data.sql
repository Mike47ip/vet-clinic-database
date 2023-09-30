/* Populate database with sample data. */
INSERT INTO
    animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    ('Agumon', '3-2-2020', 0, '1', 10.23);

INSERT INTO
    animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    ('Gabumon', '15-11-2018', 2, '1', 8);

INSERT INTO
    animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    ('Pikachu', '7-1-2021', 1, '0', 15.04);

INSERT INTO
    animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    ('Devimon', '12-5-2017', 5, '1', 11);

INSERT INTO
    animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    ('Charmander', '8-2-2020', 0, '0', -11);

INSERT INTO
    animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    ('Plantmon', '15-11-2021', 2, '1', -5.7);

INSERT INTO
    animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    ('Squirtle', '2-4-1993', 3, '0', -12.13);

INSERT INTO
    animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    ('Angemon', '12-6-2005', 1, '1', -45);

INSERT INTO
    animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    ('Boarmon', '7-6-2005', 7, '1', 20.4);

INSERT INTO
    animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    ('Blossom', '13-10-1998', 3, '1', 17);

INSERT INTO
    animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    ('Ditto', '14-5-2022', 4, '1', 22);

-- Add values to the owners table
INSERT INTO
    owners (full_name, age,)
VALUES
    ('Sam Smith', 34);

INSERT INTO
    owners (full_name, age,)
VALUES
    ('Jennifer Orwell', 19);

INSERT INTO
    owners (full_name, age,)
VALUES
    ('Bob', 45);

INSERT INTO
    owners (full_name, age,)
VALUES
    ('Melody Pond', 77);

INSERT INTO
    owners (full_name, age,)
VALUES
    ('Dean Winchester', 14);

INSERT INTO
    owners (full_name, age,)
VALUES
    ('Jodie Whittaker', 38);

-- Add values to the species table
INSERT INTO
    species (name)
VALUES
    ('Pokemon');

INSERT INTO
    species (name)
VALUES
    ('Digimon');

-- Update species_id column of the animals table
UPDATE
    animals
SET
    species_id = 2
WHERE
    name LIKE '%mon';

UPDATE
    animals
SET
    species_id = 1
WHERE
    species_id IS NULL;

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

--Insert data into the vets table
INSERT INTO
    vets (name, age, date_of_graduation)
VALUES
    ('William Tatcher', 45, '23-4-2000');

INSERT INTO
    vets (name, age, date_of_graduation)
VALUES
    ('Maisy Smith', 26, '17-1-2019');

INSERT INTO
    vets (name, age, date_of_graduation)
VALUES
    ('Stephanie Mendez', 64, '4-5-1981');

INSERT INTO
    vets (name, age, date_of_graduation)
VALUES
    ('Jack Harkness', 38, '8-6-2008');

--Insert data into the specializations table
INSERT INTO
    specializations (species_id, vet_id)
VALUES
    (1, 1);

INSERT INTO
    specializations (species_id, vet_id)
VALUES
    (2, 3);

INSERT INTO
    specializations (species_id, vet_id)
VALUES
    (1, 3);

INSERT INTO
    specializations (species_id, vet_id)
VALUES
    (2, 4);

--Insert data into the visits table
INSERT INTO
    visits (animal_id, vet_id, date_of_visit)
VALUES
    (1, 1, '24-5-2020');

INSERT INTO
    visits (animal_id, vet_id, date_of_visit)
VALUES
    (1, 3, '22-7-2020');

INSERT INTO
    visits (animal_id, vet_id, date_of_visit)
VALUES
    (2, 4, '2-2-2021');

INSERT INTO
    visits (animal_id, vet_id, date_of_visit)
VALUES
    (3, 2, '5-1-2020');

INSERT INTO
    visits (animal_id, vet_id, date_of_visit)
VALUES
    (3, 2, '8-3-2020');

INSERT INTO
    visits (animal_id, vet_id, date_of_visit)
VALUES
    (3, 2, '14-5-2020');

INSERT INTO
    visits (animal_id, vet_id, date_of_visit)
VALUES
    (4, 3, '4-5-2021');

INSERT INTO
    visits (animal_id, vet_id, date_of_visit)
VALUES
    (5, 4, '24-2-2021');

INSERT INTO
    visits (animal_id, vet_id, date_of_visit)
VALUES
    (6, 2, '21-12-2019');

INSERT INTO
    visits (animal_id, vet_id, date_of_visit)
VALUES
    (6, 1, '10-8-2020');

INSERT INTO
    visits (animal_id, vet_id, date_of_visit)
VALUES
    (6, 2, '7-4-2021');

INSERT INTO
    visits (animal_id, vet_id, date_of_visit)
VALUES
    (7, 3, '29-9-2019');

INSERT INTO
    visits (animal_id, vet_id, date_of_visit)
VALUES
    (8, 4, '3-10-2020');

INSERT INTO
    visits (animal_id, vet_id, date_of_visit)
VALUES
    (8, 4, '4-11-2020');

INSERT INTO
    visits (animal_id, vet_id, date_of_visit)
VALUES
    (9, 2, '24-1-2019');

INSERT INTO
    visits (animal_id, vet_id, date_of_visit)
VALUES
    (9, 2, '15-5-2019');

INSERT INTO
    visits (animal_id, vet_id, date_of_visit)
VALUES
    (9, 2, '27-2-2020');

INSERT INTO
    visits (animal_id, vet_id, date_of_visit)
VALUES
    (9, 2, '3-8-2020');

INSERT INTO
    visits (animal_id, vet_id, date_of_visit)
VALUES
    (10, 3, '24-5-2020');

INSERT INTO
    visits (animal_id, vet_id, date_of_visit)
VALUES
    (10, 1, '11-1-2021');