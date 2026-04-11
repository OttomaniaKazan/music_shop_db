INSERT INTO genres (title)
       VALUES ('Хаус'), ('Техно'), ('Транс'), ('Электроника');

INSERT INTO musician (name)
       VALUES ('Almanac'), ('Detuned'), ('Artbat'), ('PPK');

INSERT INTO albums (title, year)
       VALUES ('Kingslayer', 2017), ('CTRL', 2016), ('Our Space', 2022), ('Russian Trance: Formation', 2002);

INSERT INTO collections (title, year)
       VALUES ('Metal Hymns Vol.24', 2017), ('Filter EP', 2016), ('Breathe', 2025), ('Ремиксы', 2018);

INSERT INTO tracks (albums_id, name, duration_sec)
       VALUES (1, 'Regicide', 371), (2, 'my Enemy', 444), (3, 'Keep Calm', 274), (4, 'Hey DJ', 341), (3, 'Take Off', 227), (2, 'Dance', 388);

INSERT INTO genres_musician (genres_id, musician_id)
       VALUES (1, 1), (2, 2), (3, 3), (4, 4);

INSERT INTO musician_albums (musician_id, albums_id)
       VALUES (1, 1), (2, 2), (3, 3), (4, 4);

INSERT INTO collection_tracks (collections_id, tracks_id )
       VALUES (3, 5), (2, 6);






