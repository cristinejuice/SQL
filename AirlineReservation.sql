USE [Airline Reservation DB];

/* Create a query that list all the data from the Ticket_Info with destination to Boracay. */

SELECT * FROM Ticket_Info
WHERE destination = 'Boracay';

/* Create a query that list the customer_id, full name from Ticket_Info with the destination to Manila and departure time 2022-09-29. */

SELECT customer_id, full_name FROM Ticket_Info
WHERE destination = 'Manila' 
AND departure_time = 2022-09-29;

/* List all the data from the Ticket_Info with the cabin_type premium economy. */

SELECT * FROM Ticket_Info T1
JOIN Flight_transaction T2
ON T1.transaction_id = T2.transaction_id
WHERE T2.cabin_type = 'Premium Economy';

/* List all the data from the Ticket_Info with the cabin_type Business Class. */

SELECT * FROM Ticket_Info T1
JOIN Flight_transaction T2
ON T1.transaction_id = T2.transaction_id
WHERE T2.cabin_type = 'Business Class';

/* Create a list of airplane whose destination is in japan with their airline company. */

SELECT plane_code, plane_availability, airline_company 
FROM Flight AS FL
JOIN Flight_transaction AS FT
ON FL.flight_code = FT.flight_code
WHERE destination = 'Japan';

/* Count all the tickets by its cabin_type. */

SELECT COUNT(DISTINCT(CASE WHEN cabin_type = 'economy' THEN 'economy' END)) AS economy,
COUNT(DISTINCT(CASE WHEN cabin_type = 'premium economy' THEN 'premium_economy' END)) AS premium_economy,
COUNT(DISTINCT(CASE WHEN cabin_type = 'business class' THEN 'business_class' END)) AS business_class,
COUNT(DISTINCT(CASE WHEN cabin_type = 'first class' THEN 'first_class' END)) AS first_class
FROM Ticket_Info AS TI
JOIN Flight_transaction AS FT
ON TI.customer_id = ft.customer_id;

/* Count all the tickets by its cabin_type where the departure date is on 2022-09-29 and destination is Manila. */

SELECT COUNT(DISTINCT(CASE WHEN cabin_type = 'economy' THEN 'economy' END)) AS economy,
COUNT(DISTINCT(CASE WHEN cabin_type = 'premium economy' THEN 'premium_economy' END)) AS premium_economy,
COUNT(DISTINCT(CASE WHEN cabin_type = 'business class' THEN 'business_class' END)) AS business_class,
COUNT(DISTINCT(CASE WHEN cabin_type = 'first class' THEN 'first_class' END)) AS first_class
FROM Ticket_Info AS TI
JOIN Flight_transaction AS FT
ON TI.customer_id = ft.customer_id
WHERE departure_time = 2022-09-29
AND destination = 'Manila';

