-- Creare il database universe
CREATE DATABASE universe;

-- Connettersi al database universe
\c universe;

-- Creazione della tabella galaxy
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    type TEXT NOT NULL,
    age NUMERIC NOT NULL,
    contains_life BOOLEAN NOT NULL
);

-- Creazione della tabella star
CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    type TEXT NOT NULL,
    temperature INT NOT NULL,
    galaxy_id INT REFERENCES galaxy(galaxy_id) ON DELETE CASCADE,
    has_planets BOOLEAN NOT NULL
);

-- Creazione della tabella planet
CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    size INT NOT NULL,
    mass NUMERIC NOT NULL,
    star_id INT REFERENCES star(star_id) ON DELETE CASCADE,
    has_moons BOOLEAN NOT NULL
);

-- Creazione della tabella moon
CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    radius NUMERIC NOT NULL,
    planet_id INT REFERENCES planet(planet_id) ON DELETE CASCADE,
    has_atmosphere BOOLEAN NOT NULL
);

-- Creazione della tabella satellite (5a tabella aggiuntiva)
CREATE TABLE satellite (
    satellite_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    purpose TEXT NOT NULL,
    is_active BOOLEAN NOT NULL,
    launch_year INT NOT NULL
);

-- Inserimento di dati nella tabella galaxy (almeno 6 righe)
INSERT INTO galaxy (name, type, age, contains_life)
VALUES
    ('Milky Way', 'Spiral', 13.51, TRUE),
    ('Andromeda', 'Spiral', 9.00, FALSE),
    ('Triangulum', 'Spiral', 4.60, FALSE),
    ('Whirlpool', 'Spiral', 10.00, FALSE),
    ('Sombrero', 'Elliptical', 11.00, FALSE),
    ('Black Eye', 'Spiral', 8.00, FALSE);

-- Inserimento di dati nella tabella star (almeno 6 righe)
INSERT INTO star (name, type, temperature, galaxy_id, has_planets)
VALUES
    ('Sun', 'G-Type', 5778, 1, TRUE),
    ('Proxima Centauri', 'Red Dwarf', 3042, 2, TRUE),
    ('Alpha Centauri A', 'G-Type', 5790, 2, TRUE),
    ('Sirius', 'A-Type', 9940, 1, TRUE),
    ('Betelgeuse', 'Red Supergiant', 3500, 1, FALSE),
    ('Vega', 'A-Type', 9600, 1, TRUE);

-- Inserimento di dati nella tabella planet (almeno 12 righe)
INSERT INTO planet (name, size, mass, star_id, has_moons)
VALUES
    ('Earth', 6371, 5.97, 1, TRUE),
    ('Mars', 3389, 0.64, 1, TRUE),
    ('Jupiter', 69911, 1898, 1, TRUE),
    ('Mercury', 2439, 0.33, 1, FALSE),
    ('Proxima b', 7145, 1.27, 2, FALSE),
    ('Alpha Centauri Bb', 6438, 1.00, 3, TRUE),
    ('Sirius B', 1737, 0.23, 4, FALSE),
    ('Vega I', 5000, 4.00, 6, FALSE),
    ('Vega II', 6500, 3.00, 6, TRUE),
    ('Mars II', 4500, 2.50, 2, TRUE),
    ('Centauri X', 6200, 5.00, 3, TRUE),
    ('Sirius X', 6700, 3.20, 4, TRUE);

-- Inserimento di dati nella tabella moon (almeno 20 righe)
INSERT INTO moon (name, radius, planet_id, has_atmosphere)
VALUES
    ('Moon', 1737.1, 1, FALSE),
    ('Phobos', 11.1, 2, FALSE),
    ('Deimos', 6.2, 2, FALSE),
    ('Io', 1821.6, 3, TRUE),
    ('Europa', 1560.8, 3, TRUE),
    ('Ganymede', 2634.1, 3, TRUE),
    ('Callisto', 2410.3, 3, TRUE),
    ('Titan', 2575.5, 4, TRUE),
    ('Europa II', 1580, 3, TRUE),
    ('Vega Moon 1', 300.0, 8, FALSE),
    ('Vega Moon 2', 250.0, 9, TRUE),
    ('Sirius Moon', 450.0, 7, FALSE),
    ('Alpha Moon I', 200.0, 6, TRUE),
    ('Alpha Moon II', 230.0, 6, FALSE),
    ('Mars Moon I', 100.0, 2, FALSE),
    ('Mars Moon II', 120.0, 2, FALSE),
    ('Centauri Moon I', 200.0, 5, TRUE),
    ('Centauri Moon II', 210.0, 5, FALSE),
    ('Sirius X Moon', 300.0, 12, TRUE),
    ('Earth II', 1900, 1, TRUE);

-- Inserimento di dati nella tabella satellite (almeno 3 righe)
INSERT INTO satellite (name, purpose, is_active, launch_year)
VALUES
    ('Hubble', 'Observation', TRUE, 1990),
    ('Voyager I', 'Exploration', FALSE, 1977),
    ('Galileo', 'Jupiter Study', FALSE, 1989);
