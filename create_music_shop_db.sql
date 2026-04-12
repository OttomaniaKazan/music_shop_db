CREATE TABLE IF NOT EXISTS Genres (
	genres_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	title varchar(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Musician (
	musician_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name varchar(100) NOT NULL 
);

CREATE TABLE IF NOT EXISTS Albums (
	albums_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	title varchar(100) NOT NULL,
	year SMALLINT NOT NULL,
	CONSTRAINT year CHECK (year >= 1900  AND  year <= 2100)
);

CREATE TABLE IF NOT EXISTS Collections (
	collections_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	title varchar(100) NOT NULL,
	year SMALLINT NOT NULL,
	CONSTRAINT date CHECK (year >= 1900  AND  year <= 2100)
);

CREATE TABLE IF NOT EXISTS Genres_Musician (
	genres_musician_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	genres_id int,
	musician_id int,
	FOREIGN KEY (genres_id) REFERENCES Genres(genres_id),
	FOREIGN KEY (musician_id) REFERENCES Musician(musician_id)
);

CREATE TABLE IF NOT EXISTS Musician_Albums (
	musician_albums_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	musician_id int,
	albums_id int,
	FOREIGN KEY (musician_id) REFERENCES Musician(musician_id),
	FOREIGN KEY (albums_id) REFERENCES Albums(albums_id)
);

CREATE TABLE IF NOT EXISTS Tracks (
	tracks_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	albums_id int,
	name varchar(100) NOT NULL,
	duration_sec int NOT NULL,
	FOREIGN KEY (albums_id) REFERENCES Albums(albums_id)
);

CREATE TABLE IF NOT EXISTS Collection_Tracks (
	collections_tracks_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	collections_id int,
	tracks_id int,
	FOREIGN KEY (collections_id) REFERENCES Collections(collections_id),
	FOREIGN KEY (tracks_id) REFERENCES Tracks(tracks_id)
);

