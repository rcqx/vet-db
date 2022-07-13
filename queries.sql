-- Querying vet db's animal table

-- Find all animals whose name ends in "mon"
SELECT * 
FROM animals 
WHERE name LIKE '%mon%';

-- List the name of all animals born between 2016 and 2019
SELECT * 
FROM animals 
WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

-- List the name of all animals that are neutered and have less than 3 escape attempts
SELECT name
FROM animals
WHERE neutered = TRUE AND escape_attempts < 3;

-- List the date of birth of all animals named either "Agumon" or "Pikachu"
SELECT date_of_birth
FROM animals
WHERE name = 'Agumon' OR name = 'Pikachu';

-- List name and escape attempts of animals that weigh more than 10.5kg
SELECT name, escape_attempts
FROM animals
WHERE weight_kg > 10.5;

-- Find all animals that are neutered
SELECT * 
FROM animals 
WHERE neutered = TRUE;

-- Find all animals not named Gabumon
SELECT * 
FROM animals
WHERE name != 'Gabumon';

-- Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)
SELECT * 
FROM animals 
WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------2nd DAY QUERIES BELOW!----------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------

-- How many animals are there
SELECT COUNT(*) AS Registered_pets
FROM animals;

-- How many animals have never tried to escape?
SELECT COUNT(*)
FROM animals
GROUP BY escape_attempts
HAVING escape_attempts = 0;

-- What is the average weight of animals?
SELECT AVG(weight_kg) AS Average_Weight
FROM animals;

-- Who escapes the most, neutered or not neutered animals?
SELECT neutered, SUM(escape_attempts)
FROM animals
GROUP BY neutered;

-- What is the minimum and maximum weight of each type of animal?
SELECT species, AVG(weight_kg)
FROM animals
GROUP BY species; 

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species AS animal_type, AVG(escape_attempts) AS average_escape_attempts
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;
--Digimon type not appearing because all of their DOB is after the 2000's
-- Result is 3 as, squirtle and blossom are the only animals that match the WHERE clause range
-- 3 + 3 / 2 = 6

------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------3rd DAY QUERIES BELOW!----------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------

-- What animals belong to Melody Pond?
SELECT name, full_name
FROM animals a JOIN owners o ON a.owner_id = o.id
WHERE full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).
SELECT a.name AS name, s.name AS anima_type
FROM animals a JOIN species s ON a.species_id = s.id
WHERE s.name = 'Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT o.id, full_name, a.name AS pet_name
FROM owners o LEFT JOIN animals a ON o.id = a.owner_id;

-- How many animals are there per species?
SELECT s.name, COUNT(*)
FROM species s JOIN animals a ON s.id = a.species_id
GROUP BY s.name;

-- List all Digimon owned by Jennifer Orwell.
SELECT a.name, o.full_name
FROM animals a JOIN owners o ON a.owner_id = o.id
WHERE o.full_name = 'Jennifer Orwell';

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT a.name, a.escape_attempts, o.full_name, o.id
FROM animals a JOIN owners o ON o.id = a.owner_id
WHERE o.full_name = 'Dean Winchester';
-- AND a.escape_attempts = 0; <--- Both animals have tried to escape at least once so result is an empty table.

-- Who owns the most animals?
SELECT o.full_name, COUNT(*) as total_animals
FROM animals a JOIN owners o ON a.owner_id = o.id
GROUP BY o.full_name
ORDER BY total_animals DESC
LIMIT 1;


