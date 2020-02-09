USE albums_db;

SHOW TABLES;

DESCRIBE albums;

SELECT * FROM albums;

SELECT * FROM albums
WHERE artist == 'Pink Floyd',

SELECT release_date FROM albums
WHERE NAME = "Sgt. Pepper's Lonely Hearts Club Band";

SELECT genre FROM albums
WHERE NAME = 'Nevermind'

SELECT * FROM albums
WHERE release_date BETWEEN 1990
AND 1999
#numbers are inclusive

SELECT * FROM albums
WHERE sales < 20


SELECT * FROM albums
WHERE genre = "Rock"

#its only looking for the exact term rock, we would need to use a different operator to find genre's containg rock
