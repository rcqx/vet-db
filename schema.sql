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

-- OPTIMIZATION PRACTICE SECTION
-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- Add testing data
-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
BEGIN;

INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

COMMIT;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
BEGIN;

insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';

COMMIT;

-- response time after querying is less that 1000ms so, as instructed, step 3 is repeated x5 times more
BEGIN;

INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

COMMIT;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
BEGIN;

insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';

COMMIT;


