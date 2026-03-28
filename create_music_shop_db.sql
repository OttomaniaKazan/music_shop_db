CREATE TABLE IF NOT EXISTS Genres (
	id int PRIMARY KEY,
	title varchar(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Musician (
	id int PRIMARY KEY,
	name varchar(100) NOT NULL 
);

CREATE TABLE IF NOT EXISTS Albums (
	id int PRIMARY KEY,
	title varchar(100) NOT NULL,
	year SMALLINT NOT NULL,
	CONSTRAINT year CHECK (year >= 1900  AND  year <= 2100)
);

CREATE TABLE IF NOT EXISTS Collections (
	id int PRIMARY KEY,
	title varchar(100) NOT NULL,
	year SMALLINT NOT NULL,
	CONSTRAINT date CHECK (year >= 1900  AND  year <= 2100)
);

CREATE TABLE IF NOT EXISTS Genres_Musician (
	id int PRIMARY KEY,
	genres_id int,
	musician_id int,
	FOREIGN KEY (genres_id) REFERENCES Genres(id),
	FOREIGN KEY (musician_id) REFERENCES Musician(id)
);

CREATE TABLE IF NOT EXISTS Musician_Albums (
	id int PRIMARY KEY,
	musician_id int,
	albums_id int,
	FOREIGN KEY (musician_id) REFERENCES Musician(id),
	FOREIGN KEY (albums_id) REFERENCES Albums(id)
);

CREATE TABLE IF NOT EXISTS Tracks (
	id int PRIMARY KEY,
	albums_id int,
	name varchar(100) NOT NULL,
	duration_sec int NOT NULL,
	FOREIGN KEY (albums_id) REFERENCES Albums(id)
);

CREATE TABLE IF NOT EXISTS Collection_Tracks (
	id int PRIMARY KEY,
	collections_id int,
	tracks_id int,
	FOREIGN KEY (collections_id) REFERENCES Collections(id),
	FOREIGN KEY (tracks_id) REFERENCES Tracks(id)
);





