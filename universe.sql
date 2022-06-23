/* Made by Elias Kario for a freecodecamp course. Planet and moon descriptions taken from elsewhere on the internet, mostly Wikipedia but also sites such as Britannica.com among others. If there is scientific text, it was most likely created by someone else.*/

CREATE TABLE galaxy(
	galaxy_id SERIAL PRIMARY KEY,
	name VARCHAR(30) NOT NULL UNIQUE,
	age_in_years TEXT,
	amount_of_stars TEXT,
	description TEXT,
	coolness_factor_from_one_to_ten INT
);

CREATE TABLE star(
	star_id SERIAL PRIMARY KEY,
    star_system_id INT,
	galaxy_id INT REFERENCES galaxy(galaxy_id),
	name VARCHAR(30) NOT NULL UNIQUE,
	distance_from_earth TEXT,
	age_in_years TEXT,
	is_dwarf_star BOOLEAN,
	description TEXT,
	coolness_factor_from_one_to_ten NUMERIC
);

CREATE TABLE planet(
	planet_id SERIAL PRIMARY KEY,
	galaxy_id INT,
    star_system_id INT,
	star_id INT REFERENCES star(star_id),
	name VARCHAR(30) NOT NULL UNIQUE,
	distance_from_earth TEXT,
	age_in_years TEXT,
	description TEXT
);

CREATE TABLE moon(
	moon_id SERIAL PRIMARY KEY,
	planet_id INT REFERENCES planet(planet_id),
	name VARCHAR(30) NOT NULL UNIQUE,
	distance_from_earth TEXT,
	age_in_years TEXT,
	description TEXT
);

CREATE TABLE star_system(
	star_system_id SERIAL PRIMARY KEY,
    galaxy_id INT REFERENCES galaxy(galaxy_id),
	name VARCHAR(30) NOT NULL UNIQUE,
	more_than_one_star BOOLEAN,
	description TEXT,
	coolness_factor_from_one_to_ten INT
);

/* Adding foreign keys to reference galaxies from the planet table, star systems from the star table etc. */

ALTER TABLE star ADD CONSTRAINT fk_star_star_system FOREIGN KEY(star_system_id) REFERENCES star_system(star_system_id);
ALTER TABLE planet ADD CONSTRAINT fk_planet_galaxy FOREIGN KEY(galaxy_id) REFERENCES galaxy(galaxy_id);
ALTER TABLE planet ADD CONSTRAINT fk_planet_star_system FOREIGN KEY(star_system_id) REFERENCES star_system(star_system_id);

/* Inserting galaxies*/

INSERT INTO galaxy (name, age_in_years, amount_of_stars, description, coolness_factor_from_one_to_ten) VALUES('Milky Way', '13.61 billion', '400 billion', 'Where we all live', 7);

INSERT INTO galaxy (name, age_in_years, amount_of_stars, description, coolness_factor_from_one_to_ten) VALUES('Sombrero Galaxy', '13.25 billion', '100 billion', 'Name given due to the shape of the galaxy', 9);

INSERT INTO galaxy (name, age_in_years, amount_of_stars, description, coolness_factor_from_one_to_ten) VALUES('Andromeda', '10.01', '1 trillion', 'Name of a lame video game thus gets a low rating', 2);

INSERT INTO galaxy (name, age_in_years, amount_of_stars, description, coolness_factor_from_one_to_ten) VALUES('Pinwheel Galaxy', 'Unknown', '1 trillion', 'We can see it the way it was 21 million years ago, long before humans walked on Earth', 8);

INSERT INTO galaxy (name, age_in_years, amount_of_stars, description, coolness_factor_from_one_to_ten) VALUES('Whirlpool Galaxy', '400.3 million', 100, 'I wonder if their dishwashers are from Whirlpool...', 9);

INSERT INTO galaxy (name, age_in_years, amount_of_stars, description, coolness_factor_from_one_to_ten) VALUES('Little Sombrero Galaxy', 'About 10-13 billion', 'Several hundred billion', 'Named after its resemblance of the Sombrero Galaxy', 7);

/* Inserting star systems*/

INSERT INTO star_system(name, galaxy_id, coolness_factor_from_one_to_ten, more_than_one_star, description) VALUES('Solar System', 1, 9, false, 'Our home.');

INSERT INTO star_system(name, galaxy_id, coolness_factor_from_one_to_ten, more_than_one_star, description) VALUES('Alpha Centauri', 1, 7, true, 'Gravitationally bound system of the closest stars and exoplanets to our Solar System. Triple star system!');

INSERT INTO star_system(name, galaxy_id, coolness_factor_from_one_to_ten, more_than_one_star, description) VALUES('Sirius', 1, 8, true, 'Binary star system consisting of two white stars orbiting each other.');

INSERT INTO star_system(name, coolness_factor_from_one_to_ten, more_than_one_star, description) VALUES('LTT 1445', 10, true, 'A triple star system with all of the stars being M-dwarfs.');

/* Inserting stars*/

INSERT INTO star (name, galaxy_id, star_system_id, distance_from_earth, age_in_years, is_dwarf_star, description, coolness_factor_from_one_to_ten) VALUES('Sun', 1, 1, '152.05 million km', '4.603 billion', false, 'One of the many reasons you are reading this', 9);

INSERT INTO star (name, galaxy_id, distance_from_earth, age_in_years, is_dwarf_star, description, coolness_factor_from_one_to_ten) VALUES('Alpheratz', 3, '96.87 light years', '60 million', false, 'Brightest star in the constellation of Andromeda', 8);

INSERT INTO star (name, galaxy_id, distance_from_earth, is_dwarf_star, description, coolness_factor_from_one_to_ten) VALUES('Mirach', 3, '199 light years', false, 'Red giant in the Andromeda galaxy.', 7);

INSERT INTO star (name, distance_from_earth, is_dwarf_star, description, coolness_factor_from_one_to_ten) VALUES('Gliese 710', '62.3 light years', false, 'This is an example of a Rogue Star which means it has gone roaming across the galaxy, free of the gravitational chains that normally hold stars in position. Oh, and it is also heading right at us.', 10);

INSERT INTO star (name, is_dwarf_star, description, coolness_factor_from_one_to_ten) VALUES('Gamma Microscopii', false, 'Another Rogue Star that is believed to have passed by our Solar System around 3.9 million years ago.', 10);

INSERT INTO star (name, galaxy_id, star_system_id, distance_from_earth, is_dwarf_star, description, coolness_factor_from_one_to_ten) VALUES('Sirius A', 3, 1, '8.60 light years', false, 'Brightest star in the night sky and actually a binary system.', 9); /* FIX */

INSERT INTO star (name, galaxy_id, distance_from_earth, is_dwarf_star, description, coolness_factor_from_one_to_ten) VALUES('Proxima Centauri', 2, '4.246 light years', true, 'Small red dwarf star with a mass about 12.5% of the mass of the Sun.', 9);



/* Inserting planets */

INSERT INTO planet(name, star_id, star_system_id, galaxy_id, distance_from_earth, age_in_years, description) VALUES('Earth', 1, 1, 1, '0', '4.543 billion', 'Where we all live.');

INSERT INTO planet(name, star_id, star_system_id, galaxy_id, distance_from_earth, age_in_years, description) VALUES('Mercury', 1, 1, 1, '144.55 million km', '4.503 billion', 'Smallest planet in the Solar System and the closest to the Sun.');

INSERT INTO planet(name, star_id, star_system_id, galaxy_id, distance_from_earth, age_in_years, description) VALUES('Venus', 1, 1, 1, '203.76 million km', '4.503 billion', 'Second planet from the Sun as is named after the Roman goddess of love and beauty.');

INSERT INTO planet(name, star_id, star_system_id, galaxy_id, distance_from_earth, age_in_years, description) VALUES('Mars', 1, 1, 1, '200.87 million km', '4.603 billion', 'Fourth planet from the Sun and the second-smallest planet in the Solar System.');

INSERT INTO planet(name, star_id, star_system_id, galaxy_id, distance_from_earth, age_in_years, description) VALUES('Jupiter', 1, 1, 1,'739.25 million km', '4.603 billion', 'Fifth planet from the Sun and the largest in the Solar System.');

INSERT INTO planet(name, star_id, star_system_id, galaxy_id, distance_from_earth, age_in_years, description) VALUES('Saturn', 1, 1, 1, '1.3794 billion km', '4.503 billion', 'Sixth planet from the Sun and the second largest in the Solar System.');

INSERT INTO planet(name, star_id, star_system_id, galaxy_id, distance_from_earth, age_in_years, description) VALUES('Uranus', 1, 1, 1, '3.0521 billion km', '4.503 billion', 'Seventh planet from the Sun. Its name is a reference to the Greek god of the sky.');

INSERT INTO planet(name, star_id, star_system_id, galaxy_id, distance_from_earth, age_in_years, description) VALUES('Neptune', 1, 1, 1, '4.4539 billion km', '4.503 billion', 'Eight and farthest planet-known planet from the Sun. It is also quite massive at 17 times the mass of Earth.');

INSERT INTO planet(name, star_id, star_system_id, galaxy_id, distance_from_earth, age_in_years, description) VALUES('Proxima Centauri b', 7, 2, 1, '4.24 light years', 'about 4.85 billion', 'An exoplanet orbiting in the habitable zone of the red dwarf star Proxima Centauri.');

INSERT INTO planet(name, star_system_id, distance_from_earth, description) VALUES('LTT 1445Ab', 4, 'About 22 light years', 'Discovered recently in June 2019 with data f rom the Transiting Exoplanet Survey Satellite.');

INSERT INTO planet(name, distance_from_earth, description) VALUES('Indi Ab', '11.81 light years', 'Has a mass of 3.3 Jupiter masses.');

INSERT INTO planet(name, description) VALUES('Eridani f', 'Might be orbiting the habitable zone of the star 82 G. Eridani, but this is still under investigation.');

/* Inserting moons */

INSERT INTO moon(name, planet_id, distance_from_earth, age_in_years, description) VALUES('Moon', 1, '384,400 km', '4.53 billion', 'The reason we are not drowning right now.');

INSERT INTO moon(name, planet_id, distance_from_earth, age_in_years, description) VALUES('Io', 5, '628.3 million km',  'About 4.5 billion', 'One of the Galilean moons which are the largest moons of Jupiter.');

INSERT INTO moon(name, planet_id, distance_from_earth, age_in_years, description) VALUES('Europa', 5, '628.126 million km', '4.503 billion', 'Smallest of the four Galilean moons orbiting Jupiter.');

INSERT INTO moon(name, planet_id, distance_from_earth, age_in_years, description) VALUES('Ganymede', 5, '628.3 million km', 'About 4.5 billion', 'The largest and most massive of moon of the Solar System, and the biggest moon of the Galilean moons.');

INSERT INTO moon(name, planet_id, distance_from_earth, age_in_years, description) VALUES('Callisto', 5, '628.3 million km', '4.503 billion', 'Second largest moon of Jupiter after Ganymede in addition to being one of four Galilean moons andthird largest moon in the Solar System. Also a monster in the game Old School Runescape.');

INSERT INTO moon(name, planet_id, distance_from_earth, age_in_years, description) VALUES('Titan', 6, 'About 1.6 billion km', '4.0003 billion', 'Largest moon of Saturn and the second-largest natural satellite in the Solar System.');

INSERT INTO moon(name, planet_id, distance_from_earth, age_in_years, description) VALUES('Phobos', 4, '77.79 million km', '4.503 billion', 'Innermost and larger of the two natural satellites of Mars.');

INSERT INTO moon(name, planet_id, distance_from_earth, age_in_years, description) VALUES('Deimos', 4, '77.79 million km', '4.503 billion', 'Smaller and the outermost of the two natural satellites of Mars.');

INSERT INTO moon(name, planet_id, distance_from_earth, description) VALUES('Mimas', 6, '1.272 billion km', 'Smallest and innermost of the major regular moons of Saturn');

INSERT INTO moon(name, planet_id, description) VALUES('Hyperion', 6, 'Major moon of Saturn which has no regular rotation period but according to Britannica.com tumbles in an apparently random fashion in its orbit.');

INSERT INTO moon(name, planet_id, description) VALUES('Ariel', 7, 'Second nearest of the five major moons of Uranus.');

INSERT INTO moon(name, planet_id, distance_from_earth, description) VALUES('Miranda', 7, '2.723 billion km', 'Innermost and smallest of the five majro moons of Uranus');

INSERT INTO moon(name, planet_id, description) VALUES('Oberon', 7, 'Outermost of the five major moons of Uranus and the second largest of the group.');

INSERT INTO moon(name, planet_id, description) VALUES('Umbriel', 7, 'Third nearest of the five major oons of Uranus and probably the inspiration for the name of the Pokemon called Umbreon.');

INSERT INTO moon(name, planet_id, distance_from_earth, description) VALUES('Titania', 7, '2.723 billion km', 'Largest moon of Uranus.');

INSERT INTO moon(name, planet_id, distance_from_earth, description) VALUES('Iapetus', 6, '1.272 billion km', 'Outermost of the major regular moons of Saturn');

INSERT INTO moon(name, planet_id, description) VALUES('Triton', 8, 'Largest of the moons of Neptune');

INSERT INTO moon(name, planet_id, description) VALUES('Nereid', 8, 'Third largest of known moon of Neptune, second to be discovered.');

INSERT INTO moon(name, planet_id, description) VALUES('Enceladus', 6, 'Second nearest of the major regular moons of Saturn');

INSERT INTO moon(name, planet_id, description) VALUES('Rhea', 6, 'Second largest moon of Saturn after Titan.');






