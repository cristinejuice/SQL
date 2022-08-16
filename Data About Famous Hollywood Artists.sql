/*  Create table about famous people in Hollywood */

CREATE TABLE singers (
    id int IDENTITY(1,1) PRIMARY KEY,
    name varchar(255) NOT NULL,
    age int NOT NULL
);

/* Insert the name of the famous hollywood singers and their age */

INSERT INTO singers (name, age) VALUES ('Rihanna', 34);
INSERT INTO singers (name, age) VALUES ('Dua Lipa', 26);
INSERT INTO singers (name, age) VALUES ('Taylor Swift', 32);
INSERT INTO singers (name, age) VALUES ('Selena Gomez', 29);
INSERT INTO singers (name, age) VALUES ('Anne-Marie', 31);
INSERT INTO singers (name, age) VALUES ('Ava Max', 28);
INSERT INTO singers (name, age) VALUES ('Shawn Mendes', 23);
INSERT INTO singers (name, age) VALUES ('Lady Gaga', 36);
INSERT INTO singers (name, age) VALUES ('Nicki Minaj', 39);
INSERT INTO singers (name, age) VALUES ('Ed Sheeran', 31);
INSERT INTO singers (name, age) VALUES ('Billie Eilish', 20);
INSERT INTO singers (name, age) VALUES ('Adele', 34);
INSERT INTO singers (name, age) VALUES ('Bruno Mars', 36);
INSERT INTO singers (name, age) VALUES ('Sam Smith', 30);
INSERT INTO singers (name, age) VALUES ('Harry Styles', 28);

/* Create table about one of their songs */

CREATE TABLE songs 
( id int IDENTITY(1,1) PRIMARY KEY,
songs_1 TEXT,
singer_id INTEGER);

/* Insert the name of the songs of these hollywood singers */

INSERT INTO songs (singer_id, songs_1) VALUES (1, 'Diamonds');
INSERT INTO songs (singer_id, songs_1) VALUES (1, 'Monster');
INSERT INTO songs (singer_id, songs_1) VALUES (2, 'Dont Start Me Now');
INSERT INTO songs (singer_id, songs_1) VALUES (2, 'New Rules');
INSERT INTO songs (singer_id, songs_1) VALUES (3, 'All Too Well');
INSERT INTO songs (singer_id, songs_1) VALUES (3, 'Wildest Dream');
INSERT INTO songs (singer_id, songs_1) VALUES (3, 'Paper Rings');
INSERT INTO songs (singer_id, songs_1) VALUES (3, 'Enchanted');
INSERT INTO songs (singer_id, songs_1) VALUES (4, 'Who Says');
INSERT INTO songs (singer_id, songs_1) VALUES (4, 'Love You Like A Love Song');
INSERT INTO songs (singer_id, songs_1) VALUES (5, '2002');
INSERT INTO songs (singer_id, songs_1) VALUES (5, 'FRIENDS');
INSERT INTO songs (singer_id, songs_1) VALUES (5, 'Rockabye');
INSERT INTO songs (singer_id, songs_1) VALUES (5, 'Alarm');
INSERT INTO songs (singer_id, songs_1) VALUES (6, 'Kings and Queens');
INSERT INTO songs (singer_id, songs_1) VALUES (7, 'Stitches');
INSERT INTO songs (singer_id, songs_1) VALUES (8, 'Born This Way');
INSERT INTO songs (singer_id, songs_1) VALUES (9, 'Anaconda');
INSERT INTO songs (singer_id, songs_1) VALUES (10, 'Shape of You');
INSERT INTO songs (singer_id, songs_1) VALUES (11, 'Happier Than Ever');
INSERT INTO songs (singer_id, songs_1) VALUES (12, 'Easy On Me');
INSERT INTO songs (singer_id, songs_1) VALUES (13, 'Treasure');
INSERT INTO songs (singer_id, songs_1) VALUES (14, 'Too Good At Goodbyes');
INSERT INTO songs (singer_id, songs_1) VALUES (15, 'As It Was');

/* Create table of the country that they came from */

CREATE TABLE country 
(id int IDENTITY(1,1) PRIMARY KEY,
country_1 TEXT,
singer_id INTEGER);

/* Insert the country of these Hollywood Singers */ 

INSERT INTO country (country_1, singer_id) VALUES ('Barbados', 1);
INSERT INTO country (country_1, singer_id) VALUES ('United Kingdom', 2);
INSERT INTO country (country_1, singer_id) VALUES ('United States', 3);
INSERT INTO country (country_1, singer_id) VALUES ('United States', 4);
INSERT INTO country (country_1, singer_id) VALUES ('United Kingdom', 5);
INSERT INTO country ( country_1, singer_id) VALUES ('United States', 6);
INSERT INTO country ( country_1, singer_id) VALUES ('Canada', 7);
INSERT INTO country ( country_1, singer_id) VALUES ('United States', 8);
INSERT INTO country ( country_1, singer_id) VALUES ('Trinidad and Tobago', 9);
INSERT INTO country ( country_1, singer_id) VALUES ('United Kingdom', 10);
INSERT INTO country ( country_1, singer_id) VALUES ('United States', 11);
INSERT INTO country ( country_1, singer_id) VALUES ('United Kingdom', 12);
INSERT INTO country ( country_1, singer_id) VALUES ('United States', 13);
INSERT INTO country ( country_1, singer_id) VALUES ('United Kingdom', 14);
INSERT INTO country ( country_1, singer_id) VALUES ('United Kingdom', 15);

/* Selecting the name of the singer from the table singers 
and name of the song from the table songs by creating a JOIN */

SELECT a.name, songs.songs_1 FROM songs
JOIN singers a
ON songs.singer_id = a.id;

/* Selecting the name of the singer from the table singers 
and name of the country they originated from table country by creating a JOIN */

SELECT a.name, country.country_1 FROM country
JOIN singers a 
ON country.singer_id = a.id;

