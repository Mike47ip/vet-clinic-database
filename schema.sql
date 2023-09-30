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