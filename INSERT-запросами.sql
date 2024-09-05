CREATE TABLE IF NOT exists Genre (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);
CREATE TABLE IF NOT exists Artist (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);
CREATE TABLE IF NOT exists Album (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year INT
);
CREATE TABLE IF NOT exists Track (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    duration INT,
    album_id INT REFERENCES Album(id)
);
CREATE TABLE IF NOT exists Collection (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year INT
);
CREATE TABLE IF NOT exists Artist_Genre (
    artist_id INT REFERENCES Artist(id),
    genre_id INT REFERENCES Genre(id),
    PRIMARY KEY (artist_id, genre_id)
);
CREATE TABLE IF NOT exists Artist_Album (
    artist_id INT REFERENCES Artist(id),
    album_id INT REFERENCES Album(id),
    PRIMARY KEY (artist_id, album_id)
);
CREATE TABLE IF NOT exists Collection_Track (
    collection_id INT REFERENCES Collection(id),
    track_id INT REFERENCES Track(id),
    PRIMARY KEY (collection_id, track_id)
);

INSERT INTO Genre (name) VALUES 
('Rock'),
('Pop'),
('поп-музыка'),
('русский рэп')
;

INSERT INTO Artist (name) VALUES 
('Bon Jovi'),
('J. Balvin'),
('Zivert'),
('Баста')
;

INSERT INTO Album (title, release_year) VALUES 
('Bon Jovi Greatest Hits', 2010),
('Vibras', 2018),
('Vinyl #1. Deluxe Version', 2019),
('Баста 5. Часть 2', 2016)
;

INSERT INTO Track (title, duration, album_id) VALUES 
('Always', 553, 1),
('Its My Life', 343, 1),
('Machika', 309, 2),
('Mi Gente', 309, 2),
('Beverly Hills', 339, 3),
('Credo', 304, 3),
('Выпускной (Медлячок)', 535, 4)
;

INSERT INTO Collection (title, release_year) VALUES 
('Classic Rock Hits', 2015),
('100 хитов русского рэпа', 2024),
('Русский Хит', 2020),
('Summer Fiesta', 2022)
;

INSERT INTO Artist_Genre (artist_id, genre_id) VALUES 
(5, 1),
(2, 2),
(3, 3),
(4, 4)
;

INSERT INTO Artist_Album (artist_id, album_id) VALUES 
(5, 1),
(2, 2),
(3, 3),
(4, 4)
;

INSERT INTO Collection_Track (collection_id, track_id) VALUES 
(1, 8),
(1, 9),
(4, 10),
(4, 11),
(3, 12),
(3, 13),
(2, 14)
;







