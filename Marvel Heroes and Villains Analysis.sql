/* Marvel Heroes and Villains
 Based on the website http://marvel.wikia.com/Main_Page
 with popularity data from http://observationdeck.io9.com/something-i-found-marvel-character-popularity-poll-cb-1568108064 
 and power grid data from http://marvel.wikia.com/Power_Grid#Power
 Collected by: https://www.khanacademy.org/profile/Mentrasto/
 */

CREATE TABLE marvels (ID int PRIMARY KEY,
    name VARCHAR(50),
    popularity INTEGER,
    alignment VARCHAR(50),
    gender VARCHAR(50), 
    height_m DECIMAL (5,2),
    weight_kg DECIMAL (5,2),
    hometown VARCHAR(50),
    intelligence INTEGER,
    strength INTEGER,
    speed INTEGER,
    durability INTEGER,
    energy_Projection INTEGER,
    fighting_Skills INTEGER);

/* Create an ordered list of heroes and villains based on their popularity. */

SELECT name, AVG(popularity) 
AS avg_popularity FROM marvels 
GROUP BY name 
ORDER BY avg_popularity DESC;

/* Create an ordered list of heroes and villains based on their maximum speed. */

SELECT name, MAX(speed) 
AS max_speed FROM marvels 
GROUP BY name 
ORDER BY max_speed DESC;

/* Create an ordered list of heroes and villains based on their minimum intelligence */

SELECT name, MIN(intelligence) 
AS min_intelligence FROM marvels 
GROUP BY name 
ORDER BY min_intelligence DESC;

/* Create an ordered list of heroes and villains by their Strength and classify their case strength. */

SELECT name, gender, strength,
    CASE 
        WHEN strength > 10 THEN 'S Rank'
        WHEN strength > 6 THEN 'A Rank'
        WHEN strength > 2 THEN 'C Rank'
        ELSE 'E Rank'
    END AS case_strength
FROM marvels
ORDER BY strength DESC;

/* Select all data of the hero or villain that has strength less than or equals to 4, 
popularity greater than or equals 20, and the alignment is Good. */

SELECT * FROM marvels 
WHERE strength <= 4 AND popularity >= 20 AND alignment = 'Good';