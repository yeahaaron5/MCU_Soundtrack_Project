-- Creating a movies table where chron_num is the number of the movie by release date and 
-- timeline_num is the number of the movie based on the events that take place in the MCU 
CREATE TABLE movies (
	chron_num INT PRIMARY KEY, -- represents the unique identifier for each movie 
	timeline_num INT,
	title VARCHAR(255) NOT NULL,
	release_date DATE,
	runtime_min INT,
	phase_id INT REFERENCES phases(phase_id), -- foreign key that links to the phases table
	saga_id INT REFERENCES sagas(saga_id) -- foreign key that links to the sagas table
);

-- Creating a composers table
CREATE TABLE composers (
	composer_id INT PRIMARY KEY, -- represents the unique identifier for each composer
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL
);

-- Creating a soundtracks table where dowloaded_tracks is the songs I added to my phone and
-- downloaded_duration is the duration of those added songs
CREATE TABLE soundtracks (
	soundtrack_id INT PRIMARY KEY, -- represents the unique identifier for each soundtrack
	chron_num INT REFERENCES movies(chron_num), -- foreign key that links to the movies table
	title VARCHAR(255) NOT NULL,
	track_count INT,
	duration_min INT,
	downloaded_tracks INT,
	downloaded_duration INT
);

-- Creating a phases table that represents each phase of the MCU
CREATE TABLE phases (
	phase_id INT PRIMARY KEY, -- represents the unique identifer for each phase
	phase_name VARCHAR(255) NOT NULL
);

-- Creating a sagas table that represents each saga of the MCU
CREATE TABLE sagas (
	saga_id INT PRIMARY KEY, -- represents the unique identifier for each saga
	saga_name VARCHAR(255) NOT NULL
);

-- Inserting each phase into the phases table
INSERT INTO phases (phase_id, phase_name)
VALUES (1, 'Phase One'),
	   (2, 'Phase Two'),
	   (3, 'Phase Three'),
	   (4, 'Phase Four'),
	   (5, 'Phase Five'),
	   (6,'Phase Six');

-- Inserting the two sagas into the sagas table
INSERT INTO sagas (saga_id, saga_name)
VALUES (1, 'Infinity Saga'),
	   (2, 'Multiverse Saga');
-- Slightly changing the name of each saga
UPDATE sagas
SET saga_name = 'The Infinity Saga'
WHERE saga_id = 1;
UPDATE sagas
SET saga_name = 'The Multiverse Saga'
WHERE saga_id = 2;

-- Inserting records into the movies table 
INSERT INTO movies (chron_num, timeline_num, title, release_date, runtime_min, phase_id, saga_id)
VALUES (1, 4, 'Iron Man', '2008-05-02', 126, 1, 1),
	   (2, 6, 'The Incredible Hulk', '2008-06-13', 112, 1, 1),
	   (3, 5, 'Iron Man 2', '2010-05-07', 125, 1, 1),
	   (4, 7, 'Thor', '2011-05-06', 114, 1, 1),
	   (5, 1, 'Captain America: The First Avenger', '2011-07-22', 124, 1, 1),
	   (6, 8, 'The Avengers', '2012-05-04', 143, 1, 1),
	   (7, 10, 'Iron Man 3', '2013-05-03', 131, 2, 1),
	   (8, 9, 'Thor: The Dark World', '2013-11-08', 112, 2, 1),
	   (9, 11, 'Captain America: The Winter Soldier', '2014-04-04', 136, 2, 1),
	   (10, 12, 'Guardians of the Galaxy', '2014-08-01', 122, 2, 1),
	   (11, 14, 'Avengers: Age of Ultron', '2015-05-01', 141, 2, 1),
	   (12, 15, 'Ant-Man', '2015-07-17', 117, 2, 1),
	   (13, 16, 'Captain America: Civil War', '2016-05-06', 147, 3, 1),
	   (14, 20, 'Doctor Strange', '2016-11-04', 115, 3, 1),
	   (15, 13, 'Guardians of the Galaxy Vol. 2', '2017-05-05', 136, 3, 1),
	   (16, 19, 'Spider-Man: Homecoming', '2017-07-07', 133, 3, 1),
	   (17, 21, 'Thor: Ragnarok', '2017-11-03', 130, 3, 1),
	   (18, 18, 'Black Panther', '2018-02-16', 134, 3, 1),
	   (19, 23, 'Avengers: Infinity War', '2018-04-27', 149, 3, 1),
	   (20, 22, 'Ant-Man and the Wasp', '2018-07-06', 118, 3, 1),
	   (21, 3, 'Captain Marvel', '2019-03-08', 124, 3, 1),
	   (22, 24, 'Avengers: Endgame', '2019-04-26', 181, 3, 1),
	   (23, 26, 'Spider-Man: Far From Home', '2019-07-02', 129, 3, 1),
	   (24, 17, 'Black Widow', '2021-07-09', 134, 4, 2),
	   (25, 25, 'Shang-Chi and the Legend of the Ten Rings', '2021-09-03', 132, 4, 2),
	   (26, 27, 'Eternals', '2021-11-05', 156, 4, 2),
	   (27, 28, 'Spider-Man: No Way Home', '2021-12-17', 148, 4, 2),
	   (28, 29, 'Doctor Strange in the Multiverse of Madness', '2022-05-06', 126, 4, 2),
	   (29, 31, 'Thor: Love and Thunder', '2022-07-08', 119, 4, 2),
	   (30, 30, 'Black Panther: Wakanda Forever', '2022-11-11', 161, 4, 2),
	   (31, 32, 'Ant-Man and the Wasp: Quantumania', '2023-02-17', 124, 5, 2),
	   (32, 33, 'Guardians of the Galaxy Vol. 3', '2023-05-05', 150, 5, 2),
	   (33, 34, 'The Marvels', '2023-11-10', 105, 5, 2),
	   (34, 35, 'Deadpool & Wolverine', '2024-07-26', 128, 5, 2),
	   (35, 36, 'Captain America: Brave New World', '2025-02-14', 118, 5, 2),
	   (36, 37, 'Thunderbolts*', '2025-05-02', 127, 5, 2),
	   (37, 2, 'The Fantastic Four: First Steps', '2025-07-25', 114, 6, 2);

-- Updating the movies table since I forgot to add an attribute
ALTER TABLE movies
-- Adding composer_id as an attribute
ADD COLUMN composer_id INT REFERENCES composers(composer_id); -- foreign key that links to the composers table

-- Inserting records into the composers table
INSERT INTO composers (composer_id, first_name, last_name)
VALUES (1, 'Ramin', 'Djawadi'),
	   (2, 'Craig', 'Armstrong'),
	   (3, 'John', 'Debney'),
	   (4, 'Patrick', 'Doyle'),
	   (5, 'Alan', 'Silvestri'),
	   (6, 'Brian', 'Tyler'),
	   (7, 'Henry', 'Jackman'),
	   (8, 'Tyler', 'Bates'),
	   (9, 'Danny', 'Elfman'),
	   (10, 'Christophe', 'Beck'),
	   (11, 'Michael', 'Giacchino'),
	   (12, 'Mark', 'Mothersbaugh'),
	   (13, 'Ludwig', 'Gӧransson'),
	   (14, 'Pinar', 'Toprak'),
	   (15, 'Lorne', 'Balfe'),
	   (16, 'Joel P.', 'West'),
	   (17, 'Nami', 'Melumad'),
	   (18, 'John', 'Murphy'),
	   (19, 'Laura', 'Karpman'),
	   (20, 'Rob', 'Simonsen'),
	   (21, 'Son', 'Lux');

-- After filling out the composers table, I realized that it has a many-to-many relationship with the movies table
-- since a couple of movies have two composers. Therefore, I'm creating a junction table to account for that relationship
-- by essentially creating two one-to-many relationships
CREATE TABLE movie_composers (
	chron_num INT,
	composer_id INT,
	PRIMARY KEY (chron_num, composer_id), -- composite primary key
	FOREIGN KEY (chron_num) REFERENCES movies(chron_num), -- links to the movies table
	FOREIGN KEY (composer_id) REFERENCES composers(composer_id) -- links to the composers table
);

-- Inserting records into the movie_composers table
INSERT INTO movie_composers (chron_num, composer_id)
VALUES (1, 1),
	   (2, 2),
	   (3, 3),
	   (4, 4),
	   (5, 5),
	   (6, 5),
	   (7, 6),
	   (8, 6),
	   (9, 7),
	   (10, 8),
	   (11, 6),
	   (11, 9),
	   (12, 10),
	   (13, 7),
	   (14, 11),
	   (15, 8),
	   (16, 11),
	   (17, 12),
	   (18, 13),
	   (19, 5),
	   (20, 10),
	   (21, 14),
	   (22, 5),
	   (23, 11),
	   (24, 15),
	   (25, 16),
	   (26, 1),
	   (27, 11),
	   (28, 9),
	   (29, 11),
	   (29, 17),
	   (30, 13),
	   (31, 10),
	   (32, 18),
	   (33, 19),
	   (34, 20),
	   (35, 19),
	   (36, 21),
	   (37, 11);

-- Since I created the junction table, I realized that I didn't need to add composer_id to the movies table
-- So now I'm checking for each of my constraints that I currently have
SELECT conname
FROM pg_constraint
WHERE conrelid = 'movies'::regclass AND contype = 'f'; -- checking for foreign key constraints linked to the movies table
ALTER TABLE movies
DROP CONSTRAINT movies_composer_id_fkey; -- dropping the foreign key constraint first
ALTER TABLE movies
DROP COLUMN composer_id; -- then deleting composer_id as an attribute 

-- Inserting records into the soundtracks table
-- soundtrack_id is based on which soundtrack I listened to first, second, and so on
-- Initial records inserted are soundtracks that I already listened to at this point of my code
INSERT INTO soundtracks (soundtrack_id, chron_num, title, track_count, duration_min, downloaded_tracks, downloaded_duration)
VALUES (1, 36, 'Thunderbolts* (Original Motion Picture Soundtrack)', 32, 54, 15, 29),
	   (2, 35, 'Captain America: Brave New World (Original Motion Picture Soundtrack)', 35, 81, 14, 31),
	   (3, 37, 'The Fantastic Four: First Steps (Original Motion Picture Soundtrack)', 25, 86, 17, 62),
	   (4, 34, 'Deadpool & Wolverine (Original Score)', 33, 67, 17, 36),
	   (5, 33, 'The Marvels (Original Motion Picture Soundtrack)', 27, 69, 15, 46),
	   (6, 32, 'Guardians of the Galaxy Vol. 3 (Original Score)', 26, 63, 16, 42),
	   (7, 31, 'Ant-Man and the Wasp: Quantumania (Original Motion Picture Soundtrack)', 22, 60, 10, 24),
	   (8, 30, 'Black Panther: Wakanda Forever (Original Score)', 26, 84, 14, 51),
	   (9, 29, 'Thor: Love and Thunder (Original Motion Picture Soundtrack)', 28, 65, 10, 32),
	   (10, 28, 'Doctor Strange in the Multiverse of Madness (Original Motion Picture Soundtrack)', 35, 86, 17, 47),
	   (11, 27, 'Spider-Man: No Way Home (Original Motion Picture Soundtrack)', 23, 74, 14, 52),
	   (12, 26, 'Eternals (Original Motion Picture Soundtrack)', 20, 68, 9, 34),
	   (13, 25, 'Shang-Chi and the Legend of the Ten Rings (Original Score)', 25, 68, 12, 34),
	   (14, 24, 'Black Widow (Original Motion Picture Soundtrack)', 26, 80, 14, 48),
	   (15, 23, 'Spider-Man: Far From Home (Original Motion Picture Soundtrack)', 25, 80, 16, 53),
	   (16, 22, 'Avengers: Endgame (Original Motion Picture Soundtrack)', 35, 117, 17, 58),
	   (17, 21, 'Captain Marvel (Original Motion Picture Soundtrack)', 23, 68, 12, 44);
INSERT INTO soundtracks (soundtrack_id, chron_num, title, track_count, duration_min, downloaded_tracks, downloaded_duration)
VALUES (18, 20, 'Ant-Man and the Wasp (Original Motion Picture Soundtrack)', 25, 56, 14, 34);
INSERT INTO soundtracks (soundtrack_id, chron_num, title, track_count, duration_min, downloaded_tracks, downloaded_duration)
VALUES (19, 19, 'Avengers: Infinity War (Original Motion Picture Soundtrack)', 30, 117, 18, 69);
INSERT INTO soundtracks (soundtrack_id, chron_num, title, track_count, duration_min, downloaded_tracks, downloaded_duration)
VALUES (20, 18, 'Black Panther (Original Score)', 28, 95, 15, 57),
	   (21, 17, 'Thor: Ragnarok (Original Motion Picture Soundtrack)', 23, 73, 14, 46),
	   (22, 16, 'Spider-Man: Homecoming (Original Motion Picture Soundtrack)', 22, 67, 15, 43),
	   (23, 15, 'Guardians of the Galaxy Vol. 2 (Original Score)', 19, 44, 12, 27),
	   (24, 14, 'Doctor Strange (Original Motion Picture Soundtrack)', 19, 66, 10, 42),
	   (25, 13, 'Captain America: Civil War (Original Motion Picture Soundtrack)', 21, 69, 10, 31);
INSERT INTO soundtracks (soundtrack_id, chron_num, title, track_count, duration_min, downloaded_tracks, downloaded_duration)
VALUES (26, 12, 'Ant-Man (Original Motion Picture Soundtrack)', 31, 53, 15, 31),
	   (27, 11, 'Avengers: Age of Ultron (Original Motion Picture Soundtrack)', 29, 78, 15, 43),
       (28, 10, 'Guardians of the Galaxy (Original Score)', 29, 65, 16, 48),
       (29, 9, 'Captain America: The Winter Soldier (Original Motion Picture Soundtrack)', 20, 71, 10, 41),
       (30, 8, 'Thor: The Dark World (Original Motion Picture Soundtrack)', 26, 77, 17, 52),
       (31, 7, 'Iron Man 3 (Original Motion Picture Soundtrack)', 20, 76, 11, 47);
INSERT INTO soundtracks (soundtrack_id, chron_num, title, track_count, duration_min, downloaded_tracks, downloaded_duration)
VALUES (32, 6, 'The Avengers (Original Motion Picture Soundtrack)', 18, 65, 12, 45),
	   (33, 5, 'Captain America: The First Avenger (Original Motion Picture Soundtrack)', 27, 74, 15, 42),
	   (34, 4, 'Thor (Soundtrack from the Motion Picture)', 24, 72, 12, 41),
	   (35, 3, 'Iron Man 2 (Original Motion Picture Score)', 25, 72, 16, 56),
	   (36, 2, 'The Incredible Hulk (Original Motion Picture Score)', 45, 111, 21, 62),
	   (37, 1, 'Iron Man (Original Motion Picture Soundtrack)', 19, 54, 12, 34);