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





