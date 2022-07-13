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
