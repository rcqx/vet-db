-- Create animals table
CREATE TABLE animals(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOL,
    weight_kg DECIMAL,
    PRIMARY KEY(id)
);

--Add species column to existing animals table
--ALTER TABLE animals
--ADD species VARCHAR(100);

--Create owners and species tables
BEGIN;

CREATE TABLE owners(
    id SERIAL,
    full_name VARCHAR(100),
    age INT,
    PRIMARY KEY(id)
);

CREATE TABLE species(
    id SERIAL,
    name VARCHAR(100),
    PRIMARY KEY(id)
);

COMMIT;

-- Modify animals table
BEGIN;

ALTER TABLE animals
DROP COLUMN id;

ALTER TABLE animals
ADD id SERIAL PRIMARY KEY;

COMMIT;

-- Remove species columns, add species_id & owners_id columns
BEGIN; 

ALTER TABLE animals
ADD species_id INT;

ALTER TABLE animals
ADD owner_id INT;

COMMIT;





