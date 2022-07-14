-- Populate animal table
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUEs('Agumon', '2020-02-03', 10.23, TRUE, 0);
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUEs('Gabumon', '2018-11-18', 8, TRUE, 2);
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUEs('Pikachu', '2021-01-07', 15.04, FALSE, 1);
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUEs('Devimon', '2017-05-12', 11, TRUE, 5);

--Insert new monsters(pets) data
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES('Charmander', '2020-02-08', -11, FALSE, 0);
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES('Plantmon', '2021-11-15', -5.7, TRUE, 2);
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES('Squirtle', '1993-04-02', -12.13, FALSE, 3);
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES('Angemon', '2005-06-12', -45, TRUE, 1);
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES('Boarmon', '2005-06-07', 20.4, TRUE, 7);
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES('Blossom', '1998-10-13', 17, TRUE, 3);
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES('Ditto', '2022-05-14', 22, TRUE, 4);

-- Insert owners data
BEGIN;

ALTER SEQUENCE owners_id_seq RESTART WITH 1;

INSERT INTO owners(full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners(full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners(full_name, age) VALUES ('Bob', 45);
INSERT INTO owners(full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners(full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners(full_name, age) VALUES ('Jodie Whittaker', 38);

COMMIT;

SELECT * FROM owners;

-- Insert animal type data
BEGIN;

ALTER SEQUENCE species_id_seq RESTART WITH 1;

INSERT INTO species(name) VALUES('Pokemon');
INSERT INTO species(name) VALUES('Digimon');

COMMIT;

--Update animals types id
-- Digimon type
BEGIN;

UPDATE animals
SET species_id = 1
WHERE name LIKE '%mon%';

COMMIT;

-- Pokemon type
BEGIN;

UPDATE animals
SET species_id = 1
WHERE species_id IS NULL;

COMMIT;

--Upate owners ids in animals table
BEGIN;
--Update owners data in animal table
-- Sam smith
UPDATE animals
SET owner_id = 1
WHERE name = 'Agumon';

-- Jennifer Orwell
UPDATE animals
SET owner_id = 2
WHERE name IN ('Gabumon', 'Pikachu');

-- Bob
UPDATE animals
SET owner_id = 3
WHERE name IN ('Devimon', 'Plantmon');

-- Melody Pond
UPDATE animals
SET owner_id = 4
WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

-- Dean Wincheser
UPDATE animals
SET owner_id = 5
WHERE name IN ('Angemon', 'Boarmon');

COMMIT;

-- INSERT VETS DATA
BEGIN;

ALTER SEQUENCE vets_id_seq RESTART WITH 1;

INSERT INTO vets(name, age, date_of_graduation) VALUES('William Tatcher', 45, '2000-04-23');
INSERT INTO vets(name, age, date_of_graduation) VALUES('Maisy Smith', 26, '2019-01-17');
INSERT INTO vets(name, age, date_of_graduation) VALUES('Stephanie Mendez', 64, '1981-05-04');
INSERT INTO vets(name, age, date_of_graduation) VALUES('Jack Harkness', 38, '2008-06-06');

COMMIT;

-- INSERT SPECIALIZATION DATA
BEGIN;

INSERT INTO specializations(vet_id, species_id) VALUES(1, 1);
INSERT INTO specializations(vet_id, species_id) VALUES(3, 1);
INSERT INTO specializations(vet_id, species_id) VALUES(3, 2);
INSERT INTO specializations(vet_id, species_id) VALUES(4, 2);

COMMIT;

-- INSERT DATA IN VISITS TABLE
ROLLBACK;
BEGIN;

INSERT INTO visits(vet_id, animal_id, date_of_visit) VALUES (1, 5, '2020-05-24');
INSERT INTO visits(vet_id, animal_id, date_of_visit) VALUES (3, 5, '2020-07-22');
INSERT INTO visits(vet_id, animal_id, date_of_visit) VALUES (4, 6, '2021-02-02');
INSERT INTO visits(vet_id, animal_id, date_of_visit) VALUES (2, 9, '2020-01-05');
INSERT INTO visits(vet_id, animal_id, date_of_visit) VALUES (2, 9, '2020-03-08');
INSERT INTO visits(vet_id, animal_id, date_of_visit) VALUES (2, 9, '2020-05-14');
INSERT INTO visits(vet_id, animal_id, date_of_visit) VALUES (3, 7, '2021-05-04');
INSERT INTO visits(vet_id, animal_id, date_of_visit) VALUES (4, 3, '2021-02-24');
INSERT INTO visits(vet_id, animal_id, date_of_visit) VALUES (2, 1, '2019-12-21');
INSERT INTO visits(vet_id, animal_id, date_of_visit) VALUES (1, 1, '2020-08-10');
INSERT INTO visits(vet_id, animal_id, date_of_visit) VALUES (2, 1, '2021-04-07');
INSERT INTO visits(vet_id, animal_id, date_of_visit) VALUES (3, 4, '2019-09-29');
INSERT INTO visits(vet_id, animal_id, date_of_visit) VALUES (4, 2, '2020-10-03');
INSERT INTO visits(vet_id, animal_id, date_of_visit) VALUES (4, 2, '2020-11-04');
INSERT INTO visits(vet_id, animal_id, date_of_visit) VALUES (2, 8, '2019-01-24');
INSERT INTO visits(vet_id, animal_id, date_of_visit) VALUES (2, 8, '2019-05-15');
INSERT INTO visits(vet_id, animal_id, date_of_visit) VALUES (2, 8, '2020-02-27');
INSERT INTO visits(vet_id, animal_id, date_of_visit) VALUES (2, 8, '2020-08-03');
INSERT INTO visits(vet_id, animal_id, date_of_visit) VALUES (3, 10, '2020-05-24');
INSERT INTO visits(vet_id, animal_id, date_of_visit) VALUES (1, 10, '2021-01-11');

COMMIT;




