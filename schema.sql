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

-- Create vets table
CREATE TABLE vets(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    date_of_graduation DATE
);

-- Create specialization table
CREATE TABLE specializations(
    vet_id INT,
    species_id INT,
    PRIMARY KEY (vet_id, species_id)
);

-- Create visits table
CREATE TABLE visits(
    vet_id INT,
    animal_id INT,
    date_of_visite DATE,
    PRIMARY KEY (vet_id, animal_id)
);





