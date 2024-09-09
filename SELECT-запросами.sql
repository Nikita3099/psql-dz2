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
('Always', 332, 1),
('Its My Life', 206, 1),
('Machika', 185, 2),
('Mi Gente', 186, 2),
('Beverly Hills', 204, 3),
('Credo', 182, 3),
('Выпускной (Медлячок)', 321, 4)
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
(1, 15),
(1, 16),
(4, 17),
(4, 18),
(3, 19),
(3, 20),
(2, 21)
;

SELECT title, duration
FROM Track
ORDER BY duration DESC
LIMIT 1;

SELECT title, duration 
FROM Track
WHERE duration >= 210; -- 3.5 минут = 210 секунд

SELECT name
FROM Artist
WHERE name NOT LIKE '% %';

SELECT title
FROM Track
WHERE title ILIKE '%мой%' OR title ILIKE '%my%';

-- Тут необходимо использовать вложенный запрос и функцию MAX
SELECT title, duration
FROM Track
WHERE duration = (SELECT MAX(duration) FROM Track);

-- Количество исполнителей в каждом жанре
SELECT g.name AS genre_name, COUNT(ag.artist_id) AS artist_count
FROM Genre g
JOIN Artist_Genre ag ON g.id = ag.genre_id
GROUP BY g.name;

-- Количество треков, вошедших в альбомы 2019–2020 годов
SELECT COUNT(t.id) AS track_count
FROM Track t
JOIN Album a ON t.album_id = a.id
WHERE a.release_year BETWEEN 2019 AND 2020;

-- Средняя продолжительность треков по каждому альбому
SELECT a.title AS album_title, AVG(t.duration) AS average_duration
FROM Album a
JOIN Track t ON a.id = t.album_id
GROUP BY a.title;

-- Все исполнители, которые не выпустили альбомы в 2020 году
SELECT ar.name AS artist_name
FROM Artist ar
WHERE ar.id NOT IN (
    SELECT aa.artist_id
    FROM Album a
    JOIN Artist_Album aa ON a.id = aa.album_id
    WHERE a.release_year = 2020
);

-- Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами)
SELECT c.title AS collection_title
FROM Collection c
JOIN Collection_Track ct ON c.id = ct.collection_id
JOIN Track t ON ct.track_id = t.id
JOIN Album a ON t.album_id = a.id
JOIN Artist_Album aa ON a.id = aa.album_id
JOIN Artist ar ON aa.artist_id = ar.id
WHERE ar.name = 'Zivert';















