/* Database schema to keep the structure of entire database. */
CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BIT,
    weight_kg FLOAT,
    PRIMARY KEY(id)
);

-- Alter table to include species column
ALTER TABLE
    animals
ADD
    species VARCHAR(100);

CREATE TABLE owners (
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR(100),
    age INT,
    PRIMARY KEY(id)
);

CREATE TABLE species (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    PRIMARY KEY(id)
);

-- Drop species column
ALTER TABLE
    animals DROP COLUMN species;

-- Add species_id column to animals table
ALTER TABLE
    animals
ADD
    COLUMN species_id INT;

--Reference species table in animals table
ALTER TABLE
    animals
ADD
    CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id) ON DELETE CASCADE;

-- Add owner_id colum to animals table
ALTER TABLE
    animals
ADD
    COLUMN owner_id INT;

-- Reference owners table in animals table
ALTER TABLE
    animals
ADD
    CONSTRAINT fk_owners FOREIGN KEY(owner_id) REFERENCES owners(id) ON DELETE CASCADE;