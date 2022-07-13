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


