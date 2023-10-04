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


    CREATE TABLE visit(
    animal_id INT,
    vet_id INT,
    date_of_birth DATE,
    PRIMARY KEY (animal_id, vet_id, date_of_birth),
    FOREIGN KEY (animal_id) REFERENCES animals(id),
    FOREIGN KEY (vet_id) REFERENCES vets(id)
);



-- Insert visit data
INSERT INTO visit (animal_id, vet_id, date_of_birth)
VALUES
    -- Agumon's visit
    ((SELECT id FROM animals WHERE name = 'Agumon'), 
    (SELECT id FROM vets WHERE name = 'William Tatcher'), '2020-05-24'),
    
    ((SELECT id FROM animals WHERE name = 'Agumon'), 
    (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2020-07-22'),

    -- Gabumon's visit
    ((SELECT id FROM animals WHERE name = 'Gabumon'), 
    (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2021-02-02'),

    -- Pikachu's visit
    ((SELECT id FROM animals WHERE name = 'Pikachu'), 
    (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-01-05'),

    ((SELECT id FROM animals WHERE name = 'Pikachu'), 
    (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-03-08'),

    ((SELECT id FROM animals WHERE name = 'Pikachu'), 
    (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-05-14'),

    -- Devimon's visit
    ((SELECT id FROM animals WHERE name = 'Devimon'), 
    (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2021-05-04'),

    -- Charmander's visit
    ((SELECT id FROM animals WHERE name = 'Charmander'), 
    (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2021-02-24'),

    -- Plantmon's visit
    ((SELECT id FROM animals WHERE name = 'Plantmon'), 
    (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-12-21'),

    ((SELECT id FROM animals WHERE name = 'Plantmon'), 
    (SELECT id FROM vets WHERE name = 'William Tatcher'), '2020-08-10'),

    ((SELECT id FROM animals WHERE name = 'Plantmon'), 
    (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2021-04-07'),

    -- Squirtle's visit
    ((SELECT id FROM animals WHERE name = 'Squirtle'), 
    (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2019-09-29'),

    -- Angemon's visit
    ((SELECT id FROM animals WHERE name = 'Angemon'), 
    (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2020-10-03'),

    ((SELECT id FROM animals WHERE name = 'Angemon'), 
    (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2020-11-04'),

    -- Boarmon's visit
    ((SELECT id FROM animals WHERE name = 'Boarmon'), 
    (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-01-24'),

    ((SELECT id FROM animals WHERE name = 'Boarmon'), 
    (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-05-15'),

    ((SELECT id FROM animals WHERE name = 'Boarmon'), 
    (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-02-27'),

    ((SELECT id FROM animals WHERE name = 'Boarmon'), 
    (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-08-03'),

    -- Blossom's visit
    ((SELECT id FROM animals WHERE name = 'Blossom'), 
    (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2020-05-24'),

    ((SELECT id FROM animals WHERE name = 'Blossom'), 
    (SELECT id FROM vets WHERE name = 'William Tatcher'), '2021-01-11');
