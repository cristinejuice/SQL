/* Create the tables that will be used in the data analysis process for the K-Drama Analytics */

CREATE TABLE kdrama
(id int IDENTITY(1,1) PRIMARY KEY,
kdrama_title varchar(255) NOT NULL,
kdrama_genre varchar(50) NOT NULL);

CREATE TABLE kdrama_network 
(id int IDENTITY(1,1) PRIMARY KEY,
network varchar(50) NOT NULL,
airing_day varchar(50) NOT NULL);

CREATE TABLE imdb_ratings
(id int IDENTITY(1,1) PRIMARY KEY,
ratings decimal(2,1) NOT NULL,
users_number int NOT NULL);

/* Insert the values of the tables that you've created for the analysis */

INSERT INTO kdrama (kdrama_title, kdrama_genre) VALUES
('Extraordinary Attorney Woo','drama'),
('Squid Game','thriller'), ('Return','historical'),
('All of Us Are Dead','thriller'), ('A Model Family','thriller'), 
('Pachinko','drama'), ('Big Mouth','thriller'), 
('Crash Landing on You','romance'), ('Kingdom','thriller'), 
('True Beauty','romance'), ('Sweet Home','supernatural'), 
('The Office Blind Date','drama'), ('Vincenzo','crime'), 
('Its Okay to Not Be Okay','comedy'), ('Undercover','thriller');

INSERT INTO kdrama_network (network, airing_day) VALUES
('Netflix','wednesday'), ('Netflix','friday'),
('Netflix','saturday'), ('Netflix','friday'),
('Netflix','wednesday'), ('Apple TV','friday'),
('Wavve','friday'), ('Netflix','sunday'),
('Netflix','friday'), ('tvN','wednesday'),
('Netflix & SBS','monday'), ('TVING & Netflix','saturday'),
('Netflix & tvN','saturday'), ('Netflix','friday'),
('Netflix','friday');

INSERT INTO imdb_ratings (ratings, users_number) VALUES
(9.1, 3844), (8, 429820),
(7.3, 79), (7.5, 46098),
(6.5, 276),(8.4, 7285),
(8.2, 506), (8.7, 27093),
(8.3, 45246), (8, 6768),
(7.3, 20533), (8.1, 8721),
(8.4, 16819), (8.6, 22764),
(7.7, 187);

/* Select and Create a list of Kdrama under Netflix only */

SELECT a.kdrama_title, kdrama_network.network FROM kdrama_network
JOIN kdrama a
ON kdrama_network.id = a.id WHERE network = 'Netflix';

/* Alphabetize all of the Kdrama in a list. */

SELECT kdrama_title FROM kdrama
ORDER BY kdrama_title;

/* What is the ratings of the kdrama Extraordinary Attorney Woo in IMDB? */

SELECT a.kdrama_title, imdb_ratings.ratings FROM imdb_ratings
JOIN kdrama a
ON imdb_ratings.id = a.id WHERE kdrama_title = 'Extraordinary Attorney Woo';

/* Create a list of Kdrama airing every Friday */

SELECT a.kdrama_title, kdrama_network.airing_day FROM kdrama_network
JOIN kdrama a
ON kdrama_network.id = a.id WHERE airing_day = 'friday';

/* Count all the Kdrama that has a thriller genre */

SELECT COUNT(*) FROM kdrama WHERE kdrama_genre = 'thriller';

/* Create an alphabetize list of kdrama that has a thriller genre. */

SELECT * FROM kdrama WHERE kdrama_genre = 'thriller' 
ORDER BY kdrama_title;

