ALTER TABLE genres 
      ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY;

ALTER TABLE genres 
      RENAME COLUMN id TO genres_id;

INSERT INTO genres (title)
       VALUES ('Хаус'), ('Техно'), ('Транс'), ('Электроника');

ALTER TABLE musician 
      ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY;

ALTER TABLE musician 
      RENAME COLUMN id TO musician_id;

INSERT INTO musician (name)
       VALUES ('Almanac'), ('Detuned'), ('Artbat'), ('PPK');

ALTER TABLE albums  
      ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY;

ALTER TABLE albums 
      RENAME COLUMN id TO albums_id;

INSERT INTO albums (title, year)
       VALUES ('Kingslayer', 2017), ('CTRL', 2016), ('Our Space', 2022), ('Russian Trance: Formation', 2002);

ALTER TABLE collections 
      ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY;

ALTER TABLE collections 
      RENAME COLUMN id TO collections_id;

INSERT INTO collections (title, year)
       VALUES ('Metal Hymns Vol.24', 2017), ('Filter EP', 2016), ('Breathe', 2025), ('Ремиксы', 2018);

ALTER TABLE tracks  
      ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY;

ALTER TABLE tracks  
      RENAME COLUMN id TO tracks_id;

INSERT INTO tracks (albums_id, name, duration_sec)
       VALUES (1, 'Regicide', 371), (2, 'my Enemy', 444), (3, 'Keep Calm', 274), (4, 'Hey DJ', 341), (3, 'Take Off', 227), (2, 'Dance', 388);

ALTER TABLE genres_musician  
      ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY;

ALTER TABLE genres_musician  
      RENAME COLUMN id TO genres_musician_id;

INSERT INTO genres_musician (genres_id, musician_id)
       VALUES (1, 1), (2, 2), (3, 3), (4, 4);

ALTER TABLE musician_albums   
      ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY;

ALTER TABLE musician_albums   
      RENAME COLUMN id TO musician_albums_id;

INSERT INTO musician_albums (musician_id, albums_id)
       VALUES (1, 1), (2, 2), (3, 3), (4, 4);

ALTER TABLE collection_tracks    
      ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY;

ALTER TABLE collection_tracks    
      RENAME COLUMN id TO collection_tracks_id;

INSERT INTO collection_tracks (collections_id, tracks_id )
       VALUES (3, 5), (2, 6);






