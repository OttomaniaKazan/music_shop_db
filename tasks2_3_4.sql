--  Название и продолжительность самого длительного трека.
SELECT    name, duration_sec 
  FROM    tracks 
 ORDER BY duration_sec DESC 
 LIMIT    1;

-- Название треков, продолжительность которых не менее 3,5 минут. 
SELECT name, duration_sec 
  FROM tracks 
 WHERE duration_sec >= 210;

-- Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT title, year 
  FROM collections 
 WHERE year BETWEEN 2018 AND 2020;   

-- Исполнители, чьё имя состоит из одного слова.
SELECT name 
  FROM musician 
 WHERE name NOT LIKE '% %';

-- Название треков, которые содержат слово «мой» или «my».
-- SELECT name FROM tracks 
-- WHERE name LIKE '%my%' 
--    OR name LIKE '%мой%';

SELECT name 
  FROM tracks t
 WHERE STRING_TO_ARRAY(LOWER(name), ' ') && ARRAY['my', 'мой']


-- Количество исполнителей в каждом жанре.
SELECT      g.title, COUNT(gm.musician_id)  
  FROM      genres g  
  LEFT JOIN genres_musician gm ON g.genres_id = gm.genres_id
 GROUP BY   g.genres_id, g.title 
 ORDER BY COUNT(gm.musician_id ) DESC;

-- Количество треков, вошедших в альбомы 2019–2020 годов.
INSERT INTO albums (title, year)
VALUES      ('Best of Me', 2020);

INSERT INTO tracks (albums_id, name, duration_sec)
VALUES      (5, 'Best of Me', 553);

SELECT COUNT(t.name) 
  FROM tracks t 
  JOIN albums a ON t.albums_id = a.albums_id 
 WHERE a.year BETWEEN 2019 AND 2020;

-- Средняя продолжительность треков по каждому альбому.
SELECT      a.title, AVG(duration_sec) 
  FROM      albums a 
  JOIN      tracks t ON a.albums_id = t.albums_id 
 GROUP BY   a.albums_id;

-- Все исполнители, которые не выпустили альбомы в 2020 году.
--SELECT m.name, a.year
--  FROM musician m 
--  JOIN musician_albums ma ON m.musician_id = ma.musician_id
--  JOIN albums a ON ma.albums_id = a.albums_id
-- WHERE a.year <> 2020;

SELECT m.name 
  FROM musician m
 WHERE m.name NOT IN 
       (SELECT m2.name 
          FROM musician m2
          JOIN musician_albums ma ON m2.musician_id = ma.musician_id
          JOIN albums a ON ma.albums_id = a.albums_id
         WHERE a.year = 2020);

-- Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT DISTINCT c.title
  FROM          collections c 
  JOIN          collection_tracks ct ON c.collections_id = ct.collections_id
  JOIN          tracks t ON ct.tracks_id = t.tracks_id
  JOIN          albums a ON t.albums_id = a.albums_id
  JOIN          musician_albums ma ON a.albums_id = ma.albums_id 
  JOIN          musician m ON ma.musician_id = m.musician_id
 WHERE          m.name = 'Artbat';

 -- Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
INSERT INTO genres_musician (genres_id, musician_id)
VALUES (3, 2);

SELECT a.title  
  FROM albums a 
  JOIN musician_albums ma ON a.albums_id = ma.albums_id
  JOIN musician m ON ma.musician_id = m.musician_id
  JOIN genres_musician gm ON m.musician_id = gm.musician_id
  JOIN genres g ON gm.genres_id = g.genres_id
 GROUP BY a.title, m.musician_id  -- добавление в группировку 
HAVING COUNT(g.genres_id ) > 1;

-- Наименования треков, которые не входят в сборники.
SELECT t.name FROM tracks t
LEFT JOIN collection_tracks ct ON t.tracks_id = ct.tracks_id
WHERE ct.collections_id IS NULL;

-- Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
SELECT DISTINCT m.name 
  FROM musician m 
  JOIN musician_albums ma ON m.musician_id = ma.musician_id
  JOIN albums a ON ma.albums_id = a.albums_id
  JOIN tracks t ON a.albums_id = t.albums_id
 WHERE t.duration_sec = (SELECT MIN(duration_sec) FROM tracks);

-- Названия альбомов, содержащих наименьшее количество треков.
--SELECT    a.title 
--  FROM    albums a 
--  JOIN    tracks t ON a.albums_id = t.albums_id
-- GROUP BY a.albums_id, a.title 
-- ORDER BY COUNT(t.tracks_id) ASC 
-- LIMIT    1;

SELECT  a.title 
  FROM  albums a
  JOIN  tracks t ON a.albums_id = t.albums_id 
  GROUP BY a.albums_id 
 HAVING COUNT(a.title) = 
        (SELECT COUNT(t1.tracks_id) 
           FROM tracks t1 
          GROUP BY t1.albums_id 
          ORDER BY 1 
          LIMIT 1);








 








 
 
 
 
 
 
 
 
 
 
 